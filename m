Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAA86ED148
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:28:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqy6J-0006lg-Iz; Mon, 24 Apr 2023 11:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqy6C-0006jW-0r
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:27:29 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqy66-0006sz-EK
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:27:27 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so30883185e9.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682350041; x=1684942041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZZKjYXHyIeMkg0aKSc0TvN58snmM4oHGc16JhGaHgLU=;
 b=aESgrZfJrlwqhhiLZA7aRfipgMzYJyYzye0ieW8n3FgJmIFXe4VF0WFI2eXFTLnTBw
 oDODwCFFs5AnudZ1SulvI+1OcH4dZZciAxI/SjeA9c5jzmwexYuBFrfnv0QKOd3sndtG
 hsvEwNX+Zr0Z4kYfjkmlGio4oOY9y/1Zy9+I9Z8BJuvs01ntlO9KEodNRjLomgCurxnr
 rxUJ0DpK50BGrer1UgDMwRNCiLEeGcZN88zv9n6vlCkkw/0UPCv7HZ01vZZwGsruj8OW
 ipNMJKCg24YalhQCsHAxbLC/9QneiMbLmpvpKZzJ5b76asJ8h+Jl33erygGSi91LJkXw
 PDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350041; x=1684942041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZZKjYXHyIeMkg0aKSc0TvN58snmM4oHGc16JhGaHgLU=;
 b=eaUWAS0o987HD78qevAuQ/zmwDE3Jko4l7mIh4vptzMlkFAfYHwE4E44Ep8OagbJGs
 o45Gx3aJUq0R6S2PzIFVuBiQNbednP/0/ZF6Vk3eZzQ0/HuIETzuA+2LikC8AO0FLUf+
 K7WN3b9JVXc+PYiBrKgk9+gLFZW5JTnOuyBsluJVE+pPUaMwD1AknidAay6z8cNnnZu2
 3xCFXER5PPZ7SamQEBNGRkTrMEbkJWpL96cGQxlqPvLys7Jvw6DlJ/Ime+sL3KkOL1pB
 R8XoFjPEyo6V2g6ugTpAI2FE79Srp3BfpygxK2vl4BS8M98eaY9YZwEvHCu5egAQFalZ
 Jp6A==
X-Gm-Message-State: AAQBX9e+WO1GA64a8GRldocu7yoKBBUoA6zfrm6nwqRwkcMrXv5YckJR
 JJESs0t4iAw9qnFyhZPWhQGLnA==
X-Google-Smtp-Source: AKy350YJLDU+R41zAdtSpTfltBnXFKieDIwRiXcKFu0nbMqtxkI4J1U0uU4qXkHG7YAvp7M4D92NFg==
X-Received: by 2002:a7b:cb57:0:b0:3f2:507f:25a4 with SMTP id
 v23-20020a7bcb57000000b003f2507f25a4mr2019118wmj.30.1682350040839; 
 Mon, 24 Apr 2023 08:27:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a5d45c1000000b002fdeafcb132sm10971517wrs.107.2023.04.24.08.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 08:27:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 3/3] hw/arm/raspi: Use arm_write_bootloader() to write boot
 code
Date: Mon, 24 Apr 2023 16:27:17 +0100
Message-Id: <20230424152717.1333930-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424152717.1333930-1-peter.maydell@linaro.org>
References: <20230424152717.1333930-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When writing the secondary-CPU stub boot loader code to the guest,
use arm_write_bootloader() instead of directly calling
rom_add_blob_fixed().  This fixes a bug on big-endian hosts, because
arm_write_bootloader() will correctly byte-swap the host-byte-order
array values into the guest-byte-order to write into the guest
memory.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/raspi.c | 64 +++++++++++++++++++++++++++-----------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 92d068d1f9d..a7d287b1a8a 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -16,6 +16,7 @@
 #include "qemu/units.h"
 #include "qemu/cutils.h"
 #include "qapi/error.h"
+#include "hw/arm/boot.h"
 #include "hw/arm/bcm2836.h"
 #include "hw/registerfields.h"
 #include "qemu/error-report.h"
@@ -124,20 +125,22 @@ static const char *board_type(uint32_t board_rev)
 
 static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
 {
-    static const uint32_t smpboot[] = {
-        0xe1a0e00f, /*    mov     lr, pc */
-        0xe3a0fe00 + (BOARDSETUP_ADDR >> 4), /* mov pc, BOARDSETUP_ADDR */
-        0xee100fb0, /*    mrc     p15, 0, r0, c0, c0, 5;get core ID */
-        0xe7e10050, /*    ubfx    r0, r0, #0, #2       ;extract LSB */
-        0xe59f5014, /*    ldr     r5, =0x400000CC      ;load mbox base */
-        0xe320f001, /* 1: yield */
-        0xe7953200, /*    ldr     r3, [r5, r0, lsl #4] ;read mbox for our core*/
-        0xe3530000, /*    cmp     r3, #0               ;spin while zero */
-        0x0afffffb, /*    beq     1b */
-        0xe7853200, /*    str     r3, [r5, r0, lsl #4] ;clear mbox */
-        0xe12fff13, /*    bx      r3                   ;jump to target */
-        0x400000cc, /* (constant: mailbox 3 read/clear base) */
+    static const ARMInsnFixup smpboot[] = {
+        { 0xe1a0e00f }, /*    mov     lr, pc */
+        { 0xe3a0fe00 + (BOARDSETUP_ADDR >> 4) }, /* mov pc, BOARDSETUP_ADDR */
+        { 0xee100fb0 }, /*    mrc     p15, 0, r0, c0, c0, 5;get core ID */
+        { 0xe7e10050 }, /*    ubfx    r0, r0, #0, #2       ;extract LSB */
+        { 0xe59f5014 }, /*    ldr     r5, =0x400000CC      ;load mbox base */
+        { 0xe320f001 }, /* 1: yield */
+        { 0xe7953200 }, /*    ldr     r3, [r5, r0, lsl #4] ;read mbox for our core */
+        { 0xe3530000 }, /*    cmp     r3, #0               ;spin while zero */
+        { 0x0afffffb }, /*    beq     1b */
+        { 0xe7853200 }, /*    str     r3, [r5, r0, lsl #4] ;clear mbox */
+        { 0xe12fff13 }, /*    bx      r3                   ;jump to target */
+        { 0x400000cc }, /* (constant: mailbox 3 read/clear base) */
+        { 0, FIXUP_TERMINATOR }
     };
+    static const uint32_t fixupcontext[FIXUP_MAX] = { 0 };
 
     /* check that we don't overrun board setup vectors */
     QEMU_BUILD_BUG_ON(SMPBOOT_ADDR + sizeof(smpboot) > MVBAR_ADDR);
@@ -145,9 +148,8 @@ static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
     QEMU_BUILD_BUG_ON((BOARDSETUP_ADDR & 0xf) != 0
                       || (BOARDSETUP_ADDR >> 4) >= 0x100);
 
-    rom_add_blob_fixed_as("raspi_smpboot", smpboot, sizeof(smpboot),
-                          info->smp_loader_start,
-                          arm_boot_address_space(cpu, info));
+    arm_write_bootloader("raspi_smpboot", arm_boot_address_space(cpu, info),
+                         info->smp_loader_start, smpboot, fixupcontext);
 }
 
 static void write_smpboot64(ARMCPU *cpu, const struct arm_boot_info *info)
@@ -161,26 +163,28 @@ static void write_smpboot64(ARMCPU *cpu, const struct arm_boot_info *info)
      * the primary CPU goes into the kernel. We put these variables inside
      * a rom blob, so that the reset for ROM contents zeroes them for us.
      */
-    static const uint32_t smpboot[] = {
-        0xd2801b05, /*        mov     x5, 0xd8 */
-        0xd53800a6, /*        mrs     x6, mpidr_el1 */
-        0x924004c6, /*        and     x6, x6, #0x3 */
-        0xd503205f, /* spin:  wfe */
-        0xf86678a4, /*        ldr     x4, [x5,x6,lsl #3] */
-        0xb4ffffc4, /*        cbz     x4, spin */
-        0xd2800000, /*        mov     x0, #0x0 */
-        0xd2800001, /*        mov     x1, #0x0 */
-        0xd2800002, /*        mov     x2, #0x0 */
-        0xd2800003, /*        mov     x3, #0x0 */
-        0xd61f0080, /*        br      x4 */
+    static const ARMInsnFixup smpboot[] = {
+        { 0xd2801b05 }, /*        mov     x5, 0xd8 */
+        { 0xd53800a6 }, /*        mrs     x6, mpidr_el1 */
+        { 0x924004c6 }, /*        and     x6, x6, #0x3 */
+        { 0xd503205f }, /* spin:  wfe */
+        { 0xf86678a4 }, /*        ldr     x4, [x5,x6,lsl #3] */
+        { 0xb4ffffc4 }, /*        cbz     x4, spin */
+        { 0xd2800000 }, /*        mov     x0, #0x0 */
+        { 0xd2800001 }, /*        mov     x1, #0x0 */
+        { 0xd2800002 }, /*        mov     x2, #0x0 */
+        { 0xd2800003 }, /*        mov     x3, #0x0 */
+        { 0xd61f0080 }, /*        br      x4 */
+        { 0, FIXUP_TERMINATOR }
     };
+    static const uint32_t fixupcontext[FIXUP_MAX] = { 0 };
 
     static const uint64_t spintables[] = {
         0, 0, 0, 0
     };
 
-    rom_add_blob_fixed_as("raspi_smpboot", smpboot, sizeof(smpboot),
-                          info->smp_loader_start, as);
+    arm_write_bootloader("raspi_smpboot", as, info->smp_loader_start,
+                         smpboot, fixupcontext);
     rom_add_blob_fixed_as("raspi_spintables", spintables, sizeof(spintables),
                           SPINTABLE_ADDR, as);
 }
-- 
2.34.1


