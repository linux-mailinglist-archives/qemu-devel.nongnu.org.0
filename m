Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7824837B0E2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 23:40:14 +0200 (CEST)
Received: from localhost ([::1]:50082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lga6v-0001cw-Fo
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 17:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lga4f-0007MR-Od
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:37:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lga4d-0005tO-B7
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:37:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620769070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CijRO4JS5NXE0airXkt/GzHEVDw5bRvQGeBh4XaQ974=;
 b=IXgI/f083wReZGDd4knT46f/1j835PKASciOV74viKNqkqjFf3twc/bYNiJzpAGhO4rtgM
 NWk1oYd/xWi2d2I19pJHRA5oZps+4ztQ9XE/Xp5g0tZXwqiaE/Tj8TCyy3flMGqUmNVe3O
 aDxtSGHXYK/yfm/NfH9Cwep6BulAqsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-70EycKckPISiDnHSG90tmA-1; Tue, 11 May 2021 17:37:48 -0400
X-MC-Unique: 70EycKckPISiDnHSG90tmA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B21F0106BAAA
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 21:37:47 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-221.rdu2.redhat.com [10.10.115.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96D2D60938;
 Tue, 11 May 2021 21:37:47 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 514CA225FD1; Tue, 11 May 2021 17:37:43 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 5/7] virtiofsd: Simplify skip byte logic
Date: Tue, 11 May 2021 17:37:34 -0400
Message-Id: <20210511213736.281016-6-vgoyal@redhat.com>
In-Reply-To: <20210511213736.281016-1-vgoyal@redhat.com>
References: <20210511213736.281016-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
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

We need to skip bytes in two cases.

a. Before we start reading into in_sg, we need to skip iov_len bytes
   in the beginning which typically will have fuse_out_header.

b. If preadv() does a short read, then we need to retry preadv() with
   remainig bytes and skip the bytes preadv() read in short read.

For case a, there is no reason that skipping logic be inside the while
loop. Move it outside. And only retain logic "b" inside while loop.

Also get rid of variable "skip_size". Looks like we can do without it.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index ccad2b3f8a..434fe401cf 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -392,17 +392,11 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
     unsigned int in_sg_cpy_count = in_num;
 
     /* skip over parts of in_sg that contained the header iov */
-    size_t skip_size = iov_len;
+    iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, iov_len);
 
     do {
-        if (skip_size != 0) {
-	    iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, skip_size);
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


