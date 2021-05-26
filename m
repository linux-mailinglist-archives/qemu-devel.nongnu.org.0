Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3AC391E86
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:58:26 +0200 (CEST)
Received: from localhost ([::1]:56620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxnV-0000iH-LL
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxbz-0003ch-6B
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxbr-000056-7g
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622051182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOocFvEvqJcdd0cWu32y0PajuPJNFF2c268KUXyAJG0=;
 b=DJ0tj1fXCCorDuh50FaA2zbqupmqn7oE8XQo5J0UFyUX37cCoyTIsqBW86nkSL/MGWAohg
 DUJ6L938APPqv1GF9NZi3HO2auEkOe8gjkHOUt+dHkPoco7UaCJNlb96CE+wa7jkrZUQ29
 2odfxJ+51UrhRiX+uZMe8xEGxtdjvdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-2yZ_TlGuOi-ZAomEwDvvKw-1; Wed, 26 May 2021 13:46:18 -0400
X-MC-Unique: 2yZ_TlGuOi-ZAomEwDvvKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 368C0107ACCA;
 Wed, 26 May 2021 17:46:16 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-247.ams2.redhat.com
 [10.36.114.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B60965D9C6;
 Wed, 26 May 2021 17:46:14 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kwolf@redhat.com, vgoyal@redhat.com,
 ma.mandourr@gmail.com, lizhijian@cn.fujitsu.com
Subject: [PULL 07/15] virtiofsd: Check EOF before short read
Date: Wed, 26 May 2021 18:45:32 +0100
Message-Id: <20210526174540.290588-8-dgilbert@redhat.com>
In-Reply-To: <20210526174540.290588-1-dgilbert@redhat.com>
References: <20210526174540.290588-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peterx@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

In virtio_send_data_iov() we are checking first for short read and then
EOF condition. Change the order. Basically check for error and EOF first
and last remaining piece is short ready which will lead to retry
automatically at the end of while loop.

Just that it is little simpler to read to the code. There is no need
to call "continue" and also one less call of "len-=ret".

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20210518213538.693422-7-vgoyal@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 49c7dd788a..99f91c9d87 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -410,25 +410,24 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
                      __func__, len);
             goto err;
         }
-        fuse_log(FUSE_LOG_DEBUG, "%s: preadv ret=%d len=%zd\n", __func__,
-                 ret, len);
-        if (ret < len && ret) {
-            fuse_log(FUSE_LOG_DEBUG, "%s: ret < len\n", __func__);
-            /* Skip over this much next time around */
-            iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, ret);
-            buf->buf[0].pos += ret;
-            len -= ret;
 
-            /* Lets do another read */
-            continue;
-        }
         if (!ret) {
             /* EOF case? */
             fuse_log(FUSE_LOG_DEBUG, "%s: !ret len remaining=%zd\n", __func__,
                      len);
             break;
         }
+        fuse_log(FUSE_LOG_DEBUG, "%s: preadv ret=%d len=%zd\n", __func__,
+                 ret, len);
+
         len -= ret;
+        /* Short read. Retry reading remaining bytes */
+        if (len) {
+            fuse_log(FUSE_LOG_DEBUG, "%s: ret < len\n", __func__);
+            /* Skip over this much next time around */
+            iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, ret);
+            buf->buf[0].pos += ret;
+        }
     } while (len);
 
     /* Need to fix out->len on EOF */
-- 
2.31.1


