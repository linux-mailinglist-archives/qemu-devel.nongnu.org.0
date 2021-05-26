Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0E8391ECA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:13:59 +0200 (CEST)
Received: from localhost ([::1]:52588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lly2Y-0000iO-St
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxbs-0003Zy-4B
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxbm-0008Tu-93
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622051177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/ZCBza/TJxM/WPXTdZDWfK95h1Zn3I9JZbEie5sy1c=;
 b=VT6pJVlGWwf+nx3ay9d5ZDdCuLGJ8cGZ2m9lE6KGSHcX2VMXkKA/oTOvhaFBt2nGCRF7+E
 hxmKA+iVmdN+YaCEIHQqH9BnfxHmrTyCvfsB226NcGrwSvGmfSzWIK9V7G+F5Q2eT6Jz52
 GDn9/0/76b4wo9DfYlrEIIfeJIAsG9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-HA2vlz3zMgOvMwnce_I1bw-1; Wed, 26 May 2021 13:46:15 -0400
X-MC-Unique: HA2vlz3zMgOvMwnce_I1bw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C80A1005D55;
 Wed, 26 May 2021 17:46:14 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-247.ams2.redhat.com
 [10.36.114.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 834885D9C6;
 Wed, 26 May 2021 17:46:06 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kwolf@redhat.com, vgoyal@redhat.com,
 ma.mandourr@gmail.com, lizhijian@cn.fujitsu.com
Subject: [PULL 06/15] virtiofsd: Simplify skip byte logic
Date: Wed, 26 May 2021 18:45:31 +0100
Message-Id: <20210526174540.290588-7-dgilbert@redhat.com>
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
Message-Id: <20210518213538.693422-6-vgoyal@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
2.31.1


