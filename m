Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1642DD512
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 17:21:58 +0100 (CET)
Received: from localhost ([::1]:50306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpw2Q-00042s-0T
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 11:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpw0g-0002D2-6r
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:20:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpw0e-0005Nw-6O
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608222007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z1gF9HfQAcfFrilbjpPxEtnwx7XSf+MCSBT33RJVHaU=;
 b=WCdgNMWTAdz3iMdEGeHxYDIZVVMJtWZRUt7TYVyMbfYh4xxZcA9w9oiKcPSI7y1k8YKtvQ
 ywPw4Z5BlErMrjdKiY5dyKdb4vjytcw2YwU/K/K+jCsBjdA9amp/sLshf0kNyPLqpWca3I
 KrB04EBCEQIx3UudTzgdjm8eeDFYpzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-XP4cOm-zPVuIv5YE6zArYw-1; Thu, 17 Dec 2020 11:20:06 -0500
X-MC-Unique: XP4cOm-zPVuIv5YE6zArYw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B9BAB8100;
 Thu, 17 Dec 2020 16:20:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF6D460CE7;
 Thu, 17 Dec 2020 16:20:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 638AD1141D30; Thu, 17 Dec 2020 17:20:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] block/vpc: Make vpc_open() read the full dynamic header
Date: Thu, 17 Dec 2020 17:19:55 +0100
Message-Id: <20201217162003.1102738-2-armbru@redhat.com>
In-Reply-To: <20201217162003.1102738-1-armbru@redhat.com>
References: <20201217162003.1102738-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, mrezanin@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The dynamic header's size is 1024 bytes.

vpc_open() reads only the 512 bytes of the dynamic header into buf[].
Works, because it doesn't actually access the second half.  However, a
colleague told me that GCC 11 warns:

    ../block/vpc.c:358:51: error: array subscript 'struct VHDDynDiskHeader[0]' is partly outside array bounds of 'uint8_t[512]' [-Werror=array-bounds]

Clean up to read the full header.

Rename buf[] to dyndisk_header_buf[] while there.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/vpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/vpc.c b/block/vpc.c
index 1ab55f9287..2fcf3f6283 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -220,7 +220,7 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     bool use_chs;
-    uint8_t buf[HEADER_SIZE];
+    uint8_t dyndisk_header_buf[1024];
     uint32_t checksum;
     uint64_t computed_size;
     uint64_t pagetable_size;
@@ -340,14 +340,14 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     if (disk_type == VHD_DYNAMIC) {
-        ret = bdrv_pread(bs->file, be64_to_cpu(footer->data_offset), buf,
-                         HEADER_SIZE);
+        ret = bdrv_pread(bs->file, be64_to_cpu(footer->data_offset),
+                         dyndisk_header_buf, 1024);
         if (ret < 0) {
             error_setg(errp, "Error reading dynamic VHD header");
             goto fail;
         }
 
-        dyndisk_header = (VHDDynDiskHeader *) buf;
+        dyndisk_header = (VHDDynDiskHeader *)dyndisk_header_buf;
 
         if (strncmp(dyndisk_header->magic, "cxsparse", 8)) {
             error_setg(errp, "Invalid header magic");
-- 
2.26.2


