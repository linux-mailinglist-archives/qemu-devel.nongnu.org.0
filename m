Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F256B391EB5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:08:20 +0200 (CEST)
Received: from localhost ([::1]:44176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxx5-0003JY-Om
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxbk-0003RI-Sl
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxba-0008LG-7G
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622051164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdE/bGQQSl3DZDjFaA81y3HI3JSSuNV6pjhr/qsG2AQ=;
 b=CZfNNo2gxXG3Ne3GIbD+mPXGVH5GkWacekjcydHXr+TNNn7aUYz3o8XRIMl3Py6uRTU13L
 Y3Tdw/4IH02h9u1nPh/AldGnzp3hYJZZEtULrmpdHXKS6KdDYqlNgb53L7rFSq+yYayK+L
 ch8Jw+L6fIQpopHYKcAiApuR5nlp/4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-Z5ApxgYkNrWnZCAbEp3IAA-1; Wed, 26 May 2021 13:46:02 -0400
X-MC-Unique: Z5ApxgYkNrWnZCAbEp3IAA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33C3B8015F5;
 Wed, 26 May 2021 17:46:01 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-247.ams2.redhat.com
 [10.36.114.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B308E5D9C6;
 Wed, 26 May 2021 17:45:59 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kwolf@redhat.com, vgoyal@redhat.com,
 ma.mandourr@gmail.com, lizhijian@cn.fujitsu.com
Subject: [PULL 04/15] virtiofsd: Use iov_discard_front() to skip bytes
Date: Wed, 26 May 2021 18:45:29 +0100
Message-Id: <20210526174540.290588-5-dgilbert@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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

There are places where we need to skip few bytes from front of the iovec
array. We have our own custom code for that. Looks like iov_discard_front()
can do same thing. So use that helper instead.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20210518213538.693422-4-vgoyal@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 28e2974d1a..09674f2e90 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -389,23 +389,15 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
     memcpy(in_sg_cpy, in_sg, sizeof(struct iovec) * in_num);
     /* These get updated as we skip */
     struct iovec *in_sg_ptr = in_sg_cpy;
-    int in_sg_cpy_count = in_num;
+    unsigned int in_sg_cpy_count = in_num;
 
     /* skip over parts of in_sg that contained the header iov */
     size_t skip_size = iov_len;
 
     size_t in_sg_left = 0;
     do {
-        while (skip_size != 0 && in_sg_cpy_count) {
-            if (skip_size >= in_sg_ptr[0].iov_len) {
-                skip_size -= in_sg_ptr[0].iov_len;
-                in_sg_ptr++;
-                in_sg_cpy_count--;
-            } else {
-                in_sg_ptr[0].iov_len -= skip_size;
-                in_sg_ptr[0].iov_base += skip_size;
-                break;
-            }
+        if (skip_size != 0) {
+            iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, skip_size);
         }
 
         int i;
-- 
2.31.1


