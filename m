Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E087237B0E1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 23:40:13 +0200 (CEST)
Received: from localhost ([::1]:50004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lga6u-0001Zy-Uc
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 17:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lga4f-0007MS-Qr
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:37:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lga4d-0005tA-BM
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620769069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PCqw1KRSIxu8BfBco+eNjqr0c/L/FZCMOAxIgy9bAyY=;
 b=MiHu5OYNzduXtnen4d6VamgYFEItzIIyXoGM2fwvdqQnFaWXrhPkE7VwxXBLchPAI7NoAX
 gtQN66OTyix/I8lgh8io9o8pS80U1OQaycAE0MucGxFq4v+qX24PKlav2MAFIyiIFuDjYp
 lxulAdeUJEh6nh20BirLFgchFvjR8d0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-eLd8P5EwM2G2daKmD3s5cw-1; Tue, 11 May 2021 17:37:47 -0400
X-MC-Unique: eLd8P5EwM2G2daKmD3s5cw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34E5E107ACE3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 21:37:47 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-221.rdu2.redhat.com [10.10.115.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C570718024;
 Tue, 11 May 2021 21:37:43 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 47009225FCF; Tue, 11 May 2021 17:37:43 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 3/7] virtiofsd: Use iov_discard_front() to skip bytes
Date: Tue, 11 May 2021 17:37:32 -0400
Message-Id: <20210511213736.281016-4-vgoyal@redhat.com>
In-Reply-To: <20210511213736.281016-1-vgoyal@redhat.com>
References: <20210511213736.281016-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

There are places where we need to skip few bytes from front of the iovec
array. We have our own custom code for that. Looks like iov_discard_front()
can do same thing. So use that helper instead.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 5dcd08fccb..d56b225800 100644
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
+	    iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, skip_size);
         }
 
         int i;
-- 
2.25.4


