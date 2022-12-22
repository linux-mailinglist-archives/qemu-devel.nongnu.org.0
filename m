Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C7D654816
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 22:57:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8TY3-00061M-5C; Thu, 22 Dec 2022 16:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TY1-000617-V3
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:56:17 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TY0-0007A8-8f
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:56:17 -0500
Received: by mail-ed1-x532.google.com with SMTP id i9so4765411edj.4
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 13:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlbISwcoF8H6Ar9FnAMnX+v9JsbwYxtSUgLoTP68Yao=;
 b=TjwkXWpK7sWdeaEkSOn7VT6qF7d7U8U4y7e75Dbmw4WyOYjJiSn2Q59SoqZ1U0M5Cs
 gZ+aKXgZPEwZ7TrwDS5W0ocFtv2inntkkeITuG51lYDt57W6sjYJmUpVFRlEjeI4Po3f
 v/mH+76S7WXUvektN2uPZMGkc7ytKYvLhYis5wdpWThDm70iXsHNqBaQDaMCaFNo6fZ5
 h3T09DbKCeVju37PxiP4bqAbs+iB2ymmQkHDFUM8159OPpqA8/CqEHGOa7cMPWtl7bHZ
 CqhKMjgc/ae3eARHs7O9q+vDgnfrmlANQYVAr1rQWcj0rksi6T/UVvcERFoLoJxGJij8
 L6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AlbISwcoF8H6Ar9FnAMnX+v9JsbwYxtSUgLoTP68Yao=;
 b=UV4g4fjEmxcisLiCO4kj7NYkAqZ7cQdtlFaV0OTKQmC7sCUceXNh1jDgwM100UYedE
 gmec/E3/AfzirNlKRSlc6xYag20XAIW4dAwIAKjRU1VNPh/zHyH9Zm/KI+v9NYUPfWk/
 4jEnlMk9bmEC0djGhwXUU8b5JWApyLgEwQrUkx/XzxfL7Cn703S1RXNhGAtppnfiK+hT
 Gh7pZsUPu9Yb9PfOG7M+FS8EeLcm18YzxEfN6eohbPWssrq8/K5IcyjKABDZFYDxdFnt
 o878DbUqJpIG1HuTDj+hKvWnr+2lAHkEBfwL2mphnbZDJKIgNn00/etohsJg1R9DTilw
 f6dg==
X-Gm-Message-State: AFqh2kqgbQhzRN/yrJIpq6reB+oz7Rb91R2C0fdc08jhMw0pdWupApms
 NkrhW/R/ES2pa4EvsqdvaUNzlpcVTsdM1LIZF2I=
X-Google-Smtp-Source: AMrXdXvTA8vLw/AgFJrzMvLYp1nTaUc+EyP9VkgEGvTgWnHV/UHQWivhWRlU9ptlT6jBPzXF6IfLVw==
X-Received: by 2002:a05:6402:25c6:b0:478:5688:7c9f with SMTP id
 x6-20020a05640225c600b0047856887c9fmr11440513edb.29.1671746174701; 
 Thu, 22 Dec 2022 13:56:14 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a50ec18000000b0046b847d6a1csm792523edr.21.2022.12.22.13.56.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Dec 2022 13:56:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 2/6] hw/arm/raspi: Fix smpboot[] on big-endian hosts
Date: Thu, 22 Dec 2022 22:55:45 +0100
Message-Id: <20221222215549.86872-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221222215549.86872-1-philmd@linaro.org>
References: <20221222215549.86872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

ARM CPUs fetch instructions in little-endian.

smpboot[] encoded instructions are written in little-endian.
This is fine on little-endian host, but on big-endian ones
the smpboot[] array ends swapped. Use the const_le32()
macro so the instructions are always in little-endian in the
smpboot[] array.

Fixes: 1df7d1f930 ("raspi: add raspberry pi 2 machine")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/raspi.c | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 92d068d1f9..72572a45c2 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -125,18 +125,18 @@ static const char *board_type(uint32_t board_rev)
 static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
 {
     static const uint32_t smpboot[] = {
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
+        const_le32(0xe1a0e00f), /*    mov   lr, pc */
+        const_le32(0xe3a0fe00 + (BOARDSETUP_ADDR >> 4)), /* mov pc, BOARDSETUP_ADDR */
+        const_le32(0xee100fb0), /*    mrc   p15, 0, r0, c0, c0, 5;get core ID */
+        const_le32(0xe7e10050), /*    ubfx  r0, r0, #0, #2       ;extract LSB */
+        const_le32(0xe59f5014), /*    ldr   r5, =0x400000CC      ;load mbox base */
+        const_le32(0xe320f001), /* 1: yield */
+        const_le32(0xe7953200), /*    ldr   r3, [r5, r0, lsl #4] ;read mbox for our core*/
+        const_le32(0xe3530000), /*    cmp   r3, #0               ;spin while zero */
+        const_le32(0x0afffffb), /*    beq   1b */
+        const_le32(0xe7853200), /*    str   r3, [r5, r0, lsl #4] ;clear mbox */
+        const_le32(0xe12fff13), /*    bx    r3                   ;jump to target */
+        const_le32(0x400000cc), /* (constant: mailbox 3 read/clear base) */
     };
 
     /* check that we don't overrun board setup vectors */
@@ -162,17 +162,17 @@ static void write_smpboot64(ARMCPU *cpu, const struct arm_boot_info *info)
      * a rom blob, so that the reset for ROM contents zeroes them for us.
      */
     static const uint32_t smpboot[] = {
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
+        const_le32(0xd2801b05), /*        mov     x5, 0xd8 */
+        const_le32(0xd53800a6), /*        mrs     x6, mpidr_el1 */
+        const_le32(0x924004c6), /*        and     x6, x6, #0x3 */
+        const_le32(0xd503205f), /* spin:  wfe */
+        const_le32(0xf86678a4), /*        ldr     x4, [x5,x6,lsl #3] */
+        const_le32(0xb4ffffc4), /*        cbz     x4, spin */
+        const_le32(0xd2800000), /*        mov     x0, #0x0 */
+        const_le32(0xd2800001), /*        mov     x1, #0x0 */
+        const_le32(0xd2800002), /*        mov     x2, #0x0 */
+        const_le32(0xd2800003), /*        mov     x3, #0x0 */
+        const_le32(0xd61f0080), /*        br      x4 */
     };
 
     static const uint64_t spintables[] = {
-- 
2.38.1


