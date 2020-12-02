Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89722CB767
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:43:18 +0100 (CET)
Received: from localhost ([::1]:50210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNjJ-0001t7-VJ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:43:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCb-00035J-JB
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCH-0003hL-Io
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zyf8JOy3zvW0QULYrBcv9uT6KGnhNJtj9ZcY4Y4Dt7w=;
 b=aXIZDFiHygiaIQHkiEBjr7dNLY29Kqhc4u2lBAG2tdcnI9nEEUE7NDyHfMY2mXqNx9Uuk0
 f5dsxDVldEIJ2fiIVAhFaOZ4lIojn0bcBfvq9+G81/wXQOOAYCu6L/k5OY6S0DXFVrhvRR
 wGYPkyyYIpbf3mI5R60Q8o9dmd7oOgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-f1WtkT9_PlSsq2b8CD49Nw-1; Wed, 02 Dec 2020 03:09:07 -0500
X-MC-Unique: f1WtkT9_PlSsq2b8CD49Nw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5610F8558E7
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 156D81346F
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 044/113] nios2: do not use ram_size global
Date: Wed,  2 Dec 2020 03:07:40 -0500
Message-Id: <20201202080849.4125477-45-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the equivalent argument to the function instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/nios2/boot.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 1df3b66c29..3cb864914b 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -181,7 +181,7 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr ddr_base,
         /* Not an ELF image nor an u-boot image, try a RAW image. */
         if (kernel_size < 0) {
             kernel_size = load_image_targphys(kernel_filename, ddr_base,
-                                              ram_size);
+                                              ramsize);
             boot_info.bootstrap_pc = ddr_base;
             high = ddr_base + kernel_size;
         }
@@ -198,11 +198,11 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr ddr_base,
 
             initrd_size = load_ramdisk(initrd_filename,
                                        boot_info.initrd_start,
-                                       ram_size - initrd_offset);
+                                       ramsize - initrd_offset);
             if (initrd_size < 0) {
                 initrd_size = load_image_targphys(initrd_filename,
                                                   boot_info.initrd_start,
-                                                  ram_size - initrd_offset);
+                                                  ramsize - initrd_offset);
             }
             if (initrd_size < 0) {
                 error_report("could not load initrd '%s'",
@@ -216,7 +216,7 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr ddr_base,
 
         /* Device tree must be placed right after initrd (if available) */
         boot_info.fdt = high;
-        fdt_size = nios2_load_dtb(boot_info, ram_size, kernel_cmdline,
+        fdt_size = nios2_load_dtb(boot_info, ramsize, kernel_cmdline,
                                   /* Preference a -dtb argument */
                                   dtb_arg ? dtb_arg : filename);
         high += fdt_size;
-- 
2.26.2



