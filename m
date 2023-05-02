Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC826F43D7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:26:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovM-0004Ce-Ni; Tue, 02 May 2023 08:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003oM-Q2
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:36 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoua-0003EU-0v
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:23 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so36675335e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029714; x=1685621714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l7MOO/R/I6N1c0GuMR940ZQPEMhA1eq8UwnrvYh8SeU=;
 b=lWs2EqErf75trZLwuUqCAadpdbdpyOgOU8Jw+fRxsCS0dLpvBXm4f7i7sEkMIHMIO+
 UrepiO5LMK9zMv6oX5TxwUKdQruI8rlTQiYOE3wXfP1wZ5OjUKa/Vb8oON8l65ZNtTTo
 kSvaXWeolFy9dyJW+fCRXU6nur8MeFnlIfWxThy1H2iamhrpzw6WpKfVJ9NQS6wY9KTY
 B1DWoXD1iyrJz06YcWJqqQ1hfUv42qJOcnp+Yzf7Z2iRpcoVp70H8SyOctXxoQsVpku/
 mDOhPMvaT3lc3eGjCCf9daPb3E3khLIic/87kUMnZyRAJvGNsFjD2FkwpCA3+8LGTH0d
 EoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029714; x=1685621714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l7MOO/R/I6N1c0GuMR940ZQPEMhA1eq8UwnrvYh8SeU=;
 b=PBeeoX1PxWeMCCwjPqim6BpZernwN8ICERNatGOQfidjLJp5zZSsB+NFfSGKTiBfqn
 01D8ZYsO2v30SOfjgq74i0nuSk+U3Q97XPSnONDDLt0HKvxdYqr78UAN7epJTzqqO+rV
 JdUP8DVo3IPTZ8gqZacDM92XJAseBHxz1iYxD38lcRDdtClCsCa2u1fH0nBDMPeRmYUD
 cgbQV/AsyFTojT0FozuXqSsDHtgyUuShvUXCLolkz0KEkUnXJcCszpdMXpzz7C4gkK1T
 siUVaMa8dtac4EI07iUs4Og510v+Yz1DuslyQitnGxzVElAvdso2oTeI2mWWWmsnbddA
 QcdA==
X-Gm-Message-State: AC+VfDz7emxCqzuuAiW7k7D0Cw9pXFBn7H936q4vwnVFGjoiSG65GC4E
 wbbhiw+GqKfGi+Z4f++xC/TGXIrmMYzQeVm0V/M=
X-Google-Smtp-Source: ACHHUZ5mZ+PmVIJmE8u47jFgVLbdwDfpBKwaLk9MQ0GenGf3jnDFhDGVfQHSaKl+CtV3tv927L2PVg==
X-Received: by 2002:a05:600c:210b:b0:3f1:96a1:1dcb with SMTP id
 u11-20020a05600c210b00b003f196a11dcbmr12172285wml.6.1683029714043; 
 Tue, 02 May 2023 05:15:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/35] hw/arm/aspeed: Use arm_write_bootloader() to write the
 bootloader
Date: Tue,  2 May 2023 13:14:53 +0100
Message-Id: <20230502121459.2422303-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Cédric Le Goater <clg@kaod.org>

When writing the secondary-CPU stub boot loader code to the guest,
use arm_write_bootloader() instead of directly calling
rom_add_blob_fixed().  This fixes a bug on big-endian hosts, because
arm_write_bootloader() will correctly byte-swap the host-byte-order
array values into the guest-byte-order to write into the guest
memory.

Cc: qemu-stable@nongnu.org
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20230424152717.1333930-3-peter.maydell@linaro.org
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


