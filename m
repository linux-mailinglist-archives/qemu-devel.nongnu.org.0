Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7622CB764
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:42:31 +0100 (CET)
Received: from localhost ([::1]:47918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNiZ-0000w7-02
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:42:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCX-00031r-3n
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCG-0003gy-Nv
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pYr+k8+J57XMwCr9tgCtGOTEWedDsJ/kyaidUapX1+E=;
 b=ezA1j/clB3gy+/gryG+WNOVyRdgce97SzOt01tUEbo2Glx6Go3JaizKYd8lvjo3B9za595
 +2m8KyfOGV9WAOURso8waIavEOyXIFDGpDPj24Cdl6/TCIC04jczWKMs6TlgZzfKJ8QB/R
 lPcq9Vr4rjuqB2Xcj2UccyMuPw6qdM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-NK603P9MO7O177uuBY2_sw-1; Wed, 02 Dec 2020 03:09:06 -0500
X-MC-Unique: NK603P9MO7O177uuBY2_sw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5699D8558F3
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:05 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23B5D1346F
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:05 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 041/113] microblaze: do not use ram_size global
Date: Wed,  2 Dec 2020 03:07:37 -0500
Message-Id: <20201202080849.4125477-42-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the equivalent argument to the function instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/microblaze/boot.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 8ad3c27f2c..e1f56f83f9 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -170,7 +170,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
         /* Not an ELF image nor an u-boot image, try a RAW image.  */
         if (kernel_size < 0) {
             kernel_size = load_image_targphys(kernel_filename, ddr_base,
-                                              ram_size);
+                                              ramsize);
             boot_info.bootstrap_pc = ddr_base;
             high = (ddr_base + kernel_size + 3) & ~3;
         }
@@ -185,11 +185,11 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
 
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
@@ -206,7 +206,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
         }
         /* Provide a device-tree.  */
         boot_info.fdt = boot_info.cmdline + 4096;
-        microblaze_load_dtb(boot_info.fdt, ram_size,
+        microblaze_load_dtb(boot_info.fdt, ramsize,
                             boot_info.initrd_start,
                             boot_info.initrd_end,
                             kernel_cmdline,
-- 
2.26.2



