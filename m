Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B0D38824F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 23:42:44 +0200 (CEST)
Received: from localhost ([::1]:47718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7UB-0001ir-7a
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 17:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lj7Ng-00077i-EO
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:36:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lj7Nd-0007RQ-9c
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621373756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9OYGtNtPHDdV664HpKsVq0lYNOOW4zefDKfQp7oxbnU=;
 b=VzujDYqnewntKHqKlOTYmI6CdeJ68+m0OSyi3P7lhZkmmh36lplTPVruDpWyNtO+5/Al0i
 mZfc0+4Q4i66nOyfjgVYjz9OQG6IPMY5kl6fDaRhlt0DP77zwOF1Q+cq6gCcj7hZpR7QfS
 2RX3dL3atdNenvAMA6BC6/zTZlGC96c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-aD0d19B5PdmqRNqs6uPAcQ-1; Tue, 18 May 2021 17:35:55 -0400
X-MC-Unique: aD0d19B5PdmqRNqs6uPAcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 432A6180FD60
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 21:35:54 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-77.rdu2.redhat.com [10.10.114.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD9842C01E;
 Tue, 18 May 2021 21:35:50 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 7213A225FD1; Tue, 18 May 2021 17:35:46 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2 5/7] virtiofsd: Simplify skip byte logic
Date: Tue, 18 May 2021 17:35:36 -0400
Message-Id: <20210518213538.693422-6-vgoyal@redhat.com>
In-Reply-To: <20210518213538.693422-1-vgoyal@redhat.com>
References: <20210518213538.693422-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
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

We need to skip bytes in two cases.

a. Before we start reading into in_sg, we need to skip iov_len bytes
   in the beginning which typically will have fuse_out_header.

b. If preadv() does a short read, then we need to retry preadv() with
   remainig bytes and skip the bytes preadv() read in short read.

For case a, there is no reason that skipping logic be inside the while
loop. Move it outside. And only retain logic "b" inside while loop.

Also get rid of variable "skip_size". Looks like we can do without it.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index ed5146d7a6..49c7dd788a 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -392,17 +392,11 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
     unsigned int in_sg_cpy_count = in_num;
 
     /* skip over parts of in_sg that contained the header iov */
-    size_t skip_size = iov_len;
+    iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, iov_len);
 
     do {
-        if (skip_size != 0) {
-            iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, skip_size);
-        }
-
-        fuse_log(FUSE_LOG_DEBUG,
-                 "%s: after skip skip_size=%zd in_sg_cpy_count=%d "
-                 "len remaining=%zd\n", __func__, skip_size, in_sg_cpy_count,
-                 len);
+        fuse_log(FUSE_LOG_DEBUG, "%s: in_sg_cpy_count=%d len remaining=%zd\n",
+                 __func__, in_sg_cpy_count, len);
 
         ret = preadv(buf->buf[0].fd, in_sg_ptr, in_sg_cpy_count,
                      buf->buf[0].pos);
@@ -421,7 +415,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
         if (ret < len && ret) {
             fuse_log(FUSE_LOG_DEBUG, "%s: ret < len\n", __func__);
             /* Skip over this much next time around */
-            skip_size = ret;
+            iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, ret);
             buf->buf[0].pos += ret;
             len -= ret;
 
-- 
2.25.4


