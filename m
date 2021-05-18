Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880E338823B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 23:38:15 +0200 (CEST)
Received: from localhost ([::1]:35856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7Pq-00024l-Ja
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 17:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lj7Ne-00074E-W7
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:35:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lj7Na-0007Ol-Hu
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:35:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621373753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVgeimCCcOQj7T5eutXoLku08t2SLftmtHcuX7Bb/uU=;
 b=Ocj72HspF2zqZwra2HrJgCi84t/zM498u64CN4oX+jO9fH2C45jo0McC/Tjaabi7uYl4JR
 r+Rrh47PUY97MSrpmYRUIJ+9n6y7J6r+mgYL3vPomCET4JRuH7whGOwZZ5r1Cm+hodpruJ
 WH+TMDbbE+EUP+SMtgAALJklr49DQ0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-amLbHgASPUKz6mp4Lbndwg-1; Tue, 18 May 2021 17:35:51 -0400
X-MC-Unique: amLbHgASPUKz6mp4Lbndwg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D08C3180FD65
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 21:35:50 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-77.rdu2.redhat.com [10.10.114.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADF295E273;
 Tue, 18 May 2021 21:35:50 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 7740B225FD2; Tue, 18 May 2021 17:35:46 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2 6/7] virtiofsd: Check EOF before short read
Date: Tue, 18 May 2021 17:35:37 -0400
Message-Id: <20210518213538.693422-7-vgoyal@redhat.com>
In-Reply-To: <20210518213538.693422-1-vgoyal@redhat.com>
References: <20210518213538.693422-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: ckuehl@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In virtio_send_data_iov() we are checking first for short read and then
EOF condition. Change the order. Basically check for error and EOF first
and last remaining piece is short ready which will lead to retry
automatically at the end of while loop.

Just that it is little simpler to read to the code. There is no need
to call "continue" and also one less call of "len-=ret".

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
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
2.25.4


