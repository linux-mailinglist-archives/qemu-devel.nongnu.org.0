Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C0B6ED149
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:28:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqy6H-0006ks-2X; Mon, 24 Apr 2023 11:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqy6D-0006je-7a
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:27:29 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqy65-0006so-Rk
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:27:28 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2fc3f1d6f8cso2872348f8f.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682350040; x=1684942040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5geIGOhKXTNOnUumAZpLeK5JvkWsmSTZmE66oiXbKTA=;
 b=qCgxDrzJL3LSqI1wVDFaTIGojdBAyr0bJzIWpUmhDIWkmCI8b3/VQ181bQyGx1O9U3
 VItbssMh+OI4giOAbPky5htwDBVF+6D2FTHU1LOqaF5TGC4swGQsoB8QZ6bRcxX0UXnl
 TqWTxKEHhgIEt48jgvjGox/XdGIc+avTXRUUyVxY8ka/Jm0K7LV1TX2VQNuwAUQ8kOX0
 9oJaRVBpPU1GEIuHJkFFSNjmMcHDSkSv5YqPrX6DszAboAdiT/gVsf6VCI9+kTCtl7lu
 6QP74g4Hcl+M+lb+0XIebn7/D9QGp1BewotjRNyG+2KrQ60NMmHxhECeY03wVWXPh7Zb
 VmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350040; x=1684942040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5geIGOhKXTNOnUumAZpLeK5JvkWsmSTZmE66oiXbKTA=;
 b=KC9m2NjeNG3noCSGhY9lB3GI0VJgOnjk/etZb6EhqASIBhIqGbxMwKyIDFwX/7wyHL
 4JsqVf+OQkUNPN3gGBu2XDyiF+6ujTUT7WHBx7QNA/UHKzxGLVTZhlbUV2oRlAhPKRIL
 9SlE1KBcXzY1UXhyAZb1RfjNnFVQra4s06Bpo47P3rygbH8QgH3s+KH4nJ43Fbxeo/25
 7TcEo/3J1mTvNTiYcC5tTgxQV5Lu4hWtIV3oJ1dEnPUy+9FXz2B6h1vwjIVeCm7Xg4Am
 Pkq1PexM289wk1rok1aoM/b5eGpIwCootLknyP4w/AeiZQAs3ybCcVOgdIHhdLZIU4rW
 TAHw==
X-Gm-Message-State: AAQBX9frKtRayqa6D2W9JZ0rdEtiFyPv+jOFUclozUqA/34U95jqS/oF
 CH3R5kkJJWj0OnEWdHb6GYTuyw==
X-Google-Smtp-Source: AKy350a5BnB4gNiMYva/UB23u7cWOMKouUVvwveIh3wPFCzNhl+wc+MJxrdN8z0jAPOJXSQwYoVXQw==
X-Received: by 2002:adf:fc11:0:b0:2f9:95b4:450a with SMTP id
 i17-20020adffc11000000b002f995b4450amr9730401wrr.25.1682350040318; 
 Mon, 24 Apr 2023 08:27:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a5d45c1000000b002fdeafcb132sm10971517wrs.107.2023.04.24.08.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 08:27:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/3] hw/arm/aspeed: Use arm_write_bootloader() to write the
 bootloader
Date: Mon, 24 Apr 2023 16:27:16 +0100
Message-Id: <20230424152717.1333930-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424152717.1333930-1-peter.maydell@linaro.org>
References: <20230424152717.1333930-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Cédric Le Goater <clg@kaod.org>

When writing the secondary-CPU stub boot loader code to the guest,
use arm_write_bootloader() instead of directly calling
rom_add_blob_fixed().  This fixes a bug on big-endian hosts, because
arm_write_bootloader() will correctly byte-swap the host-byte-order
array values into the guest-byte-order to write into the guest
memory.

Cc: qemu-stable@nongnu.org
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[PMM: Moved the "make arm_write_bootloader() function public" part
 to its own patch; updated commit message to note that this fixes
 an actual bug; adjust to the API changes noted in previous commit]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/aspeed.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c1f2b9cfcab..0b29028fe11 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -200,33 +200,35 @@ struct AspeedMachineState {
 static void aspeed_write_smpboot(ARMCPU *cpu,
                                  const struct arm_boot_info *info)
 {
-    static const uint32_t poll_mailbox_ready[] = {
+    AddressSpace *as = arm_boot_address_space(cpu, info);
+    static const ARMInsnFixup poll_mailbox_ready[] = {
         /*
          * r2 = per-cpu go sign value
          * r1 = AST_SMP_MBOX_FIELD_ENTRY
          * r0 = AST_SMP_MBOX_FIELD_GOSIGN
          */
-        0xee100fb0,  /* mrc     p15, 0, r0, c0, c0, 5 */
-        0xe21000ff,  /* ands    r0, r0, #255          */
-        0xe59f201c,  /* ldr     r2, [pc, #28]         */
-        0xe1822000,  /* orr     r2, r2, r0            */
+        { 0xee100fb0 },  /* mrc     p15, 0, r0, c0, c0, 5 */
+        { 0xe21000ff },  /* ands    r0, r0, #255          */
+        { 0xe59f201c },  /* ldr     r2, [pc, #28]         */
+        { 0xe1822000 },  /* orr     r2, r2, r0            */
 
-        0xe59f1018,  /* ldr     r1, [pc, #24]         */
-        0xe59f0018,  /* ldr     r0, [pc, #24]         */
+        { 0xe59f1018 },  /* ldr     r1, [pc, #24]         */
+        { 0xe59f0018 },  /* ldr     r0, [pc, #24]         */
 
-        0xe320f002,  /* wfe                           */
-        0xe5904000,  /* ldr     r4, [r0]              */
-        0xe1520004,  /* cmp     r2, r4                */
-        0x1afffffb,  /* bne     <wfe>                 */
-        0xe591f000,  /* ldr     pc, [r1]              */
-        AST_SMP_MBOX_GOSIGN,
-        AST_SMP_MBOX_FIELD_ENTRY,
-        AST_SMP_MBOX_FIELD_GOSIGN,
+        { 0xe320f002 },  /* wfe                           */
+        { 0xe5904000 },  /* ldr     r4, [r0]              */
+        { 0xe1520004 },  /* cmp     r2, r4                */
+        { 0x1afffffb },  /* bne     <wfe>                 */
+        { 0xe591f000 },  /* ldr     pc, [r1]              */
+        { AST_SMP_MBOX_GOSIGN },
+        { AST_SMP_MBOX_FIELD_ENTRY },
+        { AST_SMP_MBOX_FIELD_GOSIGN },
+        { 0, FIXUP_TERMINATOR }
     };
+    static const uint32_t fixupcontext[FIXUP_MAX] = { 0 };
 
-    rom_add_blob_fixed("aspeed.smpboot", poll_mailbox_ready,
-                       sizeof(poll_mailbox_ready),
-                       info->smp_loader_start);
+    arm_write_bootloader("aspeed.smpboot", as, info->smp_loader_start,
+                         poll_mailbox_ready, fixupcontext);
 }
 
 static void aspeed_reset_secondary(ARMCPU *cpu,
-- 
2.34.1


