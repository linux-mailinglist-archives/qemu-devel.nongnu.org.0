Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DE5391E78
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:54:54 +0200 (CEST)
Received: from localhost ([::1]:48702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxk5-0003dg-7w
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxbw-0003bZ-TD
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxbp-0008VW-Os
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622051181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i6rz5HBN2dmYr60coRtD/oGKZ6NDDOZNIlmm43gAxQo=;
 b=FDC1TNK1Bg+E6aDwLuwLt+A0wRfDe7fpUjWgXkefkit3ne+FTgCdrR7id4KkG00vEZu7mx
 a2fv7D+ikbK2AEnajAwIhpPu9n0JshyzrAQM/00ZZiCHA83O1bXTTrN1OLFM7TwBo+GEe0
 C4OsCmpliSrOxaQUzStsBEAAQeXuEZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-coXIk_KjPSWTL_VeONGqoQ-1; Wed, 26 May 2021 13:46:18 -0400
X-MC-Unique: coXIk_KjPSWTL_VeONGqoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3DE3501F0;
 Wed, 26 May 2021 17:46:17 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-247.ams2.redhat.com
 [10.36.114.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8289B5D9C6;
 Wed, 26 May 2021 17:46:16 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kwolf@redhat.com, vgoyal@redhat.com,
 ma.mandourr@gmail.com, lizhijian@cn.fujitsu.com
Subject: [PULL 08/15] virtiofsd: Set req->reply_sent right after sending reply
Date: Wed, 26 May 2021 18:45:33 +0100
Message-Id: <20210526174540.290588-9-dgilbert@redhat.com>
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

There is no reason to set it in label "err". We should be able to set
it right after sending reply. It is easier to read.

Also got rid of label "err" because now only thing it was doing was
return a code. We can return from the error location itself and no
need to first jump to label "err".

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20210518213538.693422-8-vgoyal@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 99f91c9d87..fa4aff9b0e 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -366,14 +366,12 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
     if (in_len < sizeof(struct fuse_out_header)) {
         fuse_log(FUSE_LOG_ERR, "%s: elem %d too short for out_header\n",
                  __func__, elem->index);
-        ret = E2BIG;
-        goto err;
+        return E2BIG;
     }
     if (in_len < tosend_len) {
         fuse_log(FUSE_LOG_ERR, "%s: elem %d too small for data len %zd\n",
                  __func__, elem->index, tosend_len);
-        ret = E2BIG;
-        goto err;
+        return E2BIG;
     }
 
     /* TODO: Limit to 'len' */
@@ -408,7 +406,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
             }
             fuse_log(FUSE_LOG_DEBUG, "%s: preadv failed (%m) len=%zd\n",
                      __func__, len);
-            goto err;
+            return ret;
         }
 
         if (!ret) {
@@ -438,21 +436,14 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
         out_sg->len = tosend_len;
     }
 
-    ret = 0;
-
     vu_dispatch_rdlock(qi->virtio_dev);
     pthread_mutex_lock(&qi->vq_lock);
     vu_queue_push(dev, q, elem, tosend_len);
     vu_queue_notify(dev, q);
     pthread_mutex_unlock(&qi->vq_lock);
     vu_dispatch_unlock(qi->virtio_dev);
-
-err:
-    if (ret == 0) {
-        req->reply_sent = true;
-    }
-
-    return ret;
+    req->reply_sent = true;
+    return 0;
 }
 
 static __thread bool clone_fs_called;
-- 
2.31.1


