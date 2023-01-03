Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E98965C5F0
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:19:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrk-0000Vj-6X; Tue, 03 Jan 2023 13:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrc-0000Aw-53
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:16 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClra-0005Gi-D0
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:15 -0500
Received: by mail-vs1-xe30.google.com with SMTP id i188so32588136vsi.8
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E2/QSQpKB1Wxz1OwWrj4zfmK4ONtqzkfez0TTluzjsI=;
 b=UQgK1skC3e4rFb4PCxuSHjLP8wiDvcqTC38RJMIDB9R/01AcJPJw7DfBdVqpCbsvD/
 lywseIev8sJ1KXqKBkSoSp549UTWXDL/02YH6nzg64/MfhsBDYXthdzMovclf9o/OCdQ
 BpDCCG1ekKhSXAtZDZs8g9V2kgwA+B+G4iivVsEVQWrW0Xl7FWuzFbZuEWzLqePtMbOy
 qV5oD3tDy6FX+ZtPFqRHaXBss0Q+NzWwVZBHxhar6PTRbM9ECubwEL5wZ13mYWTHlyTv
 w9VBMIolcngD1ltRyu2j5dJIE59KoIglX9b3yxgV12uVmSfRxJQo7+eJAzeEbglC/jwM
 fJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E2/QSQpKB1Wxz1OwWrj4zfmK4ONtqzkfez0TTluzjsI=;
 b=kWc/ZG/zbA0BACJd1A6mKxc2QlyXjbBInwaLkP8ng3h+L7fczMSvPjcgiHYsMRVz+D
 lK5khw0Zx9DkL7D6YHyNw8nDYVtGmxtLAzHjaRghdv+6iA6MGumGzIo9yTj5RDVFpt7s
 ISuwSTvMoxPcTkFWBz5pOfBmNx/3EEfXlQsc96vn2091zZxfeLmdpBNBDMC0T2JFi2sJ
 eziKOPJCaijgT9x59dQ8cQXzV19gUVBRv/qCN9xdTBJsIjXZd5UVbZmZWg4blHpwrdnI
 Ol2i6wSELkiWEn+rPoX/6wwI9k43kyKb8O+CGZAA9+6HMrrkUU17RFXvCsf4BmDR3lEG
 M2og==
X-Gm-Message-State: AFqh2kqf5W3V74PZH7lmMtuQy5D8VVbz17LL6VZqcQeWBJ3xCOBlKfPx
 Ta+l0KE15H5vY6RszNN0sbBTS8yKoq9Zy7dcg4A=
X-Google-Smtp-Source: AMrXdXtW8C9DLhWFhlG3kL7oCTQFTiCi22iccxXUJWwAIhdhlJDGUzwBIA4AX8GLuuwlbGx8tTIvLw==
X-Received: by 2002:a05:6102:3e18:b0:3c5:ec9a:9348 with SMTP id
 j24-20020a0561023e1800b003c5ec9a9348mr18321561vsv.20.1672769893723; 
 Tue, 03 Jan 2023 10:18:13 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 28/40] target/arm: Split out xscale*_class_init
Date: Tue,  3 Jan 2023 10:16:34 -0800
Message-Id: <20230103181646.55711-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Use two intermediate functions to share code between
the 13 variants of pxa*_class_init.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 81 +++++++++++++-------------------------------
 1 file changed, 23 insertions(+), 58 deletions(-)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index c6d50f326e..a3b6940040 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -857,120 +857,85 @@ static void sa1110_class_init(ARMCPUClass *acc)
     acc->midr = 0x6901B119;
 }
 
-static void pxa250_class_init(ARMCPUClass *acc)
+static void xscale_class_init(ARMCPUClass *acc)
 {
     acc->dtb_compatible = "marvell,xscale";
     set_class_feature(acc, ARM_FEATURE_V5);
     set_class_feature(acc, ARM_FEATURE_XSCALE);
-    acc->midr = 0x69052100;
     acc->ctr = 0xd172172;
     acc->reset_sctlr = 0x00000078;
 }
 
+static void pxa250_class_init(ARMCPUClass *acc)
+{
+    xscale_class_init(acc);
+    acc->midr = 0x69052100;
+}
+
 static void pxa255_class_init(ARMCPUClass *acc)
 {
-    acc->dtb_compatible = "marvell,xscale";
-    set_class_feature(acc, ARM_FEATURE_V5);
-    set_class_feature(acc, ARM_FEATURE_XSCALE);
+    xscale_class_init(acc);
     acc->midr = 0x69052d00;
-    acc->ctr = 0xd172172;
-    acc->reset_sctlr = 0x00000078;
 }
 
 static void pxa260_class_init(ARMCPUClass *acc)
 {
-    acc->dtb_compatible = "marvell,xscale";
-    set_class_feature(acc, ARM_FEATURE_V5);
-    set_class_feature(acc, ARM_FEATURE_XSCALE);
+    xscale_class_init(acc);
     acc->midr = 0x69052903;
-    acc->ctr = 0xd172172;
-    acc->reset_sctlr = 0x00000078;
 }
 
 static void pxa261_class_init(ARMCPUClass *acc)
 {
-    acc->dtb_compatible = "marvell,xscale";
-    set_class_feature(acc, ARM_FEATURE_V5);
-    set_class_feature(acc, ARM_FEATURE_XSCALE);
+    xscale_class_init(acc);
     acc->midr = 0x69052d05;
-    acc->ctr = 0xd172172;
-    acc->reset_sctlr = 0x00000078;
 }
 
 static void pxa262_class_init(ARMCPUClass *acc)
 {
-    acc->dtb_compatible = "marvell,xscale";
-    set_class_feature(acc, ARM_FEATURE_V5);
-    set_class_feature(acc, ARM_FEATURE_XSCALE);
+    xscale_class_init(acc);
     acc->midr = 0x69052d06;
-    acc->ctr = 0xd172172;
-    acc->reset_sctlr = 0x00000078;
+}
+
+static void xscale_iwmmxt_class_init(ARMCPUClass *acc)
+{
+    xscale_class_init(acc);
+    set_class_feature(acc, ARM_FEATURE_IWMMXT);
 }
 
 static void pxa270a0_class_init(ARMCPUClass *acc)
 {
-    acc->dtb_compatible = "marvell,xscale";
-    set_class_feature(acc, ARM_FEATURE_V5);
-    set_class_feature(acc, ARM_FEATURE_XSCALE);
-    set_class_feature(acc, ARM_FEATURE_IWMMXT);
+    xscale_iwmmxt_class_init(acc);
     acc->midr = 0x69054110;
-    acc->ctr = 0xd172172;
-    acc->reset_sctlr = 0x00000078;
 }
 
 static void pxa270a1_class_init(ARMCPUClass *acc)
 {
-    acc->dtb_compatible = "marvell,xscale";
-    set_class_feature(acc, ARM_FEATURE_V5);
-    set_class_feature(acc, ARM_FEATURE_XSCALE);
-    set_class_feature(acc, ARM_FEATURE_IWMMXT);
+    xscale_iwmmxt_class_init(acc);
     acc->midr = 0x69054111;
-    acc->ctr = 0xd172172;
-    acc->reset_sctlr = 0x00000078;
 }
 
 static void pxa270b0_class_init(ARMCPUClass *acc)
 {
-    acc->dtb_compatible = "marvell,xscale";
-    set_class_feature(acc, ARM_FEATURE_V5);
-    set_class_feature(acc, ARM_FEATURE_XSCALE);
-    set_class_feature(acc, ARM_FEATURE_IWMMXT);
+    xscale_iwmmxt_class_init(acc);
     acc->midr = 0x69054112;
-    acc->ctr = 0xd172172;
-    acc->reset_sctlr = 0x00000078;
 }
 
 static void pxa270b1_class_init(ARMCPUClass *acc)
 {
-    acc->dtb_compatible = "marvell,xscale";
-    set_class_feature(acc, ARM_FEATURE_V5);
-    set_class_feature(acc, ARM_FEATURE_XSCALE);
-    set_class_feature(acc, ARM_FEATURE_IWMMXT);
+    xscale_iwmmxt_class_init(acc);
     acc->midr = 0x69054113;
-    acc->ctr = 0xd172172;
-    acc->reset_sctlr = 0x00000078;
 }
 
 static void pxa270c0_class_init(ARMCPUClass *acc)
 {
-    acc->dtb_compatible = "marvell,xscale";
-    set_class_feature(acc, ARM_FEATURE_V5);
-    set_class_feature(acc, ARM_FEATURE_XSCALE);
-    set_class_feature(acc, ARM_FEATURE_IWMMXT);
+    xscale_iwmmxt_class_init(acc);
     acc->midr = 0x69054114;
-    acc->ctr = 0xd172172;
-    acc->reset_sctlr = 0x00000078;
 }
 
 static void pxa270c5_class_init(ARMCPUClass *acc)
 {
-    acc->dtb_compatible = "marvell,xscale";
-    set_class_feature(acc, ARM_FEATURE_V5);
-    set_class_feature(acc, ARM_FEATURE_XSCALE);
-    set_class_feature(acc, ARM_FEATURE_IWMMXT);
+    xscale_iwmmxt_class_init(acc);
     acc->midr = 0x69054117;
-    acc->ctr = 0xd172172;
-    acc->reset_sctlr = 0x00000078;
 }
 
 #ifdef CONFIG_TCG
-- 
2.34.1


