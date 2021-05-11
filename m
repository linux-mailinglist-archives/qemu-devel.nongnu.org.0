Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BE937B0EB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 23:42:07 +0200 (CEST)
Received: from localhost ([::1]:57416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lga8k-0006l2-55
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 17:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lga4f-0007MU-Q9
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:37:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lga4d-0005t8-Bp
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620769069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELxBNUvrnK70yQHi9ncYnnmAF8jZ25Va3X75XDKT1yE=;
 b=eFj3UbjRkwhmEjVvDkqawCHJ59cVnuadoAMMdVwleyzwdLpI9Rai8Q+5zvQE/VaBziRmLe
 NrmzSA+gYozS6l7rNYhAla2+yZbSzGCX+OsM6P622bExjJBbk8Mf2r6mMbWYuYfAy+3ihP
 WFvAB1eJzo4bsYljNuA7YtDVQiGaq0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-tJwkaXAcOQ6LEot6ZP0G7g-1; Tue, 11 May 2021 17:37:48 -0400
X-MC-Unique: tJwkaXAcOQ6LEot6ZP0G7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 432E6106BAA9
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 21:37:47 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-221.rdu2.redhat.com [10.10.115.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C57305D9D7;
 Tue, 11 May 2021 21:37:43 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 4C642225FD0; Tue, 11 May 2021 17:37:43 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 4/7] virtiofsd: get rid of in_sg_left variable
Date: Tue, 11 May 2021 17:37:33 -0400
Message-Id: <20210511213736.281016-5-vgoyal@redhat.com>
In-Reply-To: <20210511213736.281016-1-vgoyal@redhat.com>
References: <20210511213736.281016-1-vgoyal@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

in_sg_left seems to be being used primarly for debugging purpose. It is
keeping track of how many bytes are left in the scatter list we are
reading into.

We already have another variable "len" which keeps track how many bytes
are left to be read. And in_sg_left is greater than or equal to len. We
have already ensured that in the beginning of function.

    if (in_len < tosend_len) {
        fuse_log(FUSE_LOG_ERR, "%s: elem %d too small for data len %zd\n",
                 __func__, elem->index, tosend_len);
        ret = E2BIG;
        goto err;
    }

So in_sg_left seems like a redundant variable. It probably was useful for
debugging when code was being developed. Get rid of it. It helps simplify
this function.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index d56b225800..ccad2b3f8a 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -394,20 +394,16 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
     /* skip over parts of in_sg that contained the header iov */
     size_t skip_size = iov_len;
 
-    size_t in_sg_left = 0;
     do {
         if (skip_size != 0) {
 	    iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, skip_size);
         }
 
-        int i;
-        for (i = 0, in_sg_left = 0; i < in_sg_cpy_count; i++) {
-            in_sg_left += in_sg_ptr[i].iov_len;
-        }
         fuse_log(FUSE_LOG_DEBUG,
                  "%s: after skip skip_size=%zd in_sg_cpy_count=%d "
-                 "in_sg_left=%zd\n",
-                 __func__, skip_size, in_sg_cpy_count, in_sg_left);
+                 "len remaining=%zd\n", __func__, skip_size, in_sg_cpy_count,
+                 len);
+
         ret = preadv(buf->buf[0].fd, in_sg_ptr, in_sg_cpy_count,
                      buf->buf[0].pos);
 
@@ -434,13 +430,12 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
         }
         if (!ret) {
             /* EOF case? */
-            fuse_log(FUSE_LOG_DEBUG, "%s: !ret in_sg_left=%zd\n", __func__,
-                     in_sg_left);
+            fuse_log(FUSE_LOG_DEBUG, "%s: !ret len remaining=%zd\n", __func__,
+                     len);
             break;
         }
-        in_sg_left -= ret;
         len -= ret;
-    } while (in_sg_left);
+    } while (len);
 
     /* Need to fix out->len on EOF */
     if (len) {
-- 
2.25.4


