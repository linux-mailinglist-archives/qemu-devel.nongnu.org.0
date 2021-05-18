Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E221338823A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 23:38:07 +0200 (CEST)
Received: from localhost ([::1]:35090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7Pi-0001aH-VQ
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 17:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lj7Nf-00074S-3r
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:35:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lj7Na-0007P1-Mp
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:35:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621373753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zh9ddEMVe0cvJYMbA2aLZHBcCUYjRQqS6U2FtHGIOr4=;
 b=LtxqkQ7RZH3N8PMzx73dYhuU1mPB+eo9npJ444AL1yOX6jYTuGfQRcRAE1gmuB7TiFdCxf
 QlKh7QJK/5+GQNwB2XIL7hsLA5pAFl3+YilbpV//RAtwO20voE+rOD6YXfEcoys5PJ0z0L
 4/p+tte4fe7Ma9WTWzcVb+tucrabLFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-iHVHuCpIMZenw7xmgE2jQw-1; Tue, 18 May 2021 17:35:52 -0400
X-MC-Unique: iHVHuCpIMZenw7xmgE2jQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A24A4180FD64
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 21:35:50 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-77.rdu2.redhat.com [10.10.114.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBB9D18534;
 Tue, 18 May 2021 21:35:46 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 678C2225FCF; Tue, 18 May 2021 17:35:46 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2 3/7] virtiofsd: Use iov_discard_front() to skip bytes
Date: Tue, 18 May 2021 17:35:34 -0400
Message-Id: <20210518213538.693422-4-vgoyal@redhat.com>
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

There are places where we need to skip few bytes from front of the iovec
array. We have our own custom code for that. Looks like iov_discard_front()
can do same thing. So use that helper instead.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
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
2.25.4


