Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCB76E77B8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 12:48:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp5MA-0002vE-Lm; Wed, 19 Apr 2023 06:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pp5M4-0002uZ-J4
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 06:48:04 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pp5M2-0003Ol-KE
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 06:48:04 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso15564695e9.3
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681901280; x=1684493280; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QmnI1qpcmOsHukdKm6+8l9XbPtBsO5L2TyiwKT4Ffwc=;
 b=18Y0b4KqdiVF+q6Fx37+TMHWsS/u3vgCgB7M/UHv0kXrRI+z5PimxHj/X9FXilPgLd
 avCM+WmrAV+aPai9KQ7mFx7k+SiqKOIkmZ70H9w4VQGGO0W0YRywj4eI7Puf1x2Dovzn
 gEPfDxF4gbC9HPEjcac0yskpubPDXF2PUkoy/83iuJlSjMKfY1f5cePHn8Mqj/TlnL8s
 Qn+y9lmM62wVLEy3p2UlMBr5VQFWo9rr0wYcro1TR9IiUcxw0Nlg4dVJYjqstpj4qj3p
 jjZj8sC2oknkN8DyL3YxcYtdghHV+FJj8klVrKYUJDuJ6cL6YvCu1UrIyoUA1UMAyDEy
 6/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681901280; x=1684493280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QmnI1qpcmOsHukdKm6+8l9XbPtBsO5L2TyiwKT4Ffwc=;
 b=gDMn3NZVkvQnfxqH75Jd0KK8gZGER3+WXkRV7taSetezX49nvMQS9NlpD2woRr83Wg
 O897lkWSJ5XuBVIeiBfavaoy5jdG01sOu2xjCb3toybtNdPLCEpJAMZbwNlOOcRnaPf9
 hqTeu22mNVPy/uMQCw9QTpJN/CqrX3OeLNo8OhVJ4FofY00PcZLQMDqjkcewDKTh9ywL
 +Yj7s0WDOYQoNnPKDmow/svJZKPpEYWna8gpRuJi+g1BFdG0uqUo7p5Rq1dFxFcL0KCx
 MOhLTp7pQER31vhG+kiKNdlWvmxDUBfzlEQmXLNMRVPtgFhZC0/7sxfcZbthlT1tzgwY
 IQ3g==
X-Gm-Message-State: AAQBX9d04gMHTKFDKz3cE4Z9uBInBIVuILnHFQtXCpGSPmKzJ/FaGvjq
 KvW1wuDshrMjhRpsp43SqVGmtA==
X-Google-Smtp-Source: AKy350abQgyGkeH7tO4yqZGiADw0M3aelpmwahccZESTjjERJE68zaCdj0B0FjBMR3b3dS3cobch9Q==
X-Received: by 2002:adf:e645:0:b0:2ef:b8d1:9560 with SMTP id
 b5-20020adfe645000000b002efb8d19560mr4179852wrn.30.1681901280716; 
 Wed, 19 Apr 2023 03:48:00 -0700 (PDT)
Received: from alex-rivos.home
 (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
 by smtp.gmail.com with ESMTPSA id
 l6-20020adfe586000000b002fe065da369sm3401636wrm.69.2023.04.19.03.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 03:47:58 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrea Parri <andrea@rivosinc.com>
Subject: [PATCH v2] riscv: Make sure an exception is raised if a pte is
 malformed
Date: Wed, 19 Apr 2023 12:47:56 +0200
Message-Id: <20230419104756.71455-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

As per the privileged specification, in 64-bit, if any of the pte reserved
bits 60-54 is set an exception should be triggered, and the same applies to
napot/pbmt bits if those extensions are not enabled
(see 4.4.1, "Addressing and Memory Protection").

Reported-by: Andrea Parri <andrea@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index fca7ef0cef..8d9ba2ce11 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -640,6 +640,7 @@ typedef enum {
 #define PTE_SOFT            0x300 /* Reserved for Software */
 #define PTE_PBMT            0x6000000000000000ULL /* Page-based memory types */
 #define PTE_N               0x8000000000000000ULL /* NAPOT translation */
+#define PTE_RESERVED        0x1FC0000000000000ULL /* Reserved bits */
 #define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits */
 
 /* Page table PPN shift amount */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..8dc832d1bb 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -946,13 +946,20 @@ restart:
 
         if (riscv_cpu_sxl(env) == MXL_RV32) {
             ppn = pte >> PTE_PPN_SHIFT;
-        } else if (pbmte || cpu->cfg.ext_svnapot) {
-            ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
         } else {
-            ppn = pte >> PTE_PPN_SHIFT;
-            if ((pte & ~(target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT) {
+            if (pte & PTE_RESERVED) {
+                return TRANSLATE_FAIL;
+            }
+
+            if (!pbmte && (pte & PTE_PBMT)) {
                 return TRANSLATE_FAIL;
             }
+
+            if (!cpu->cfg.ext_svnapot && (pte & PTE_N)) {
+                return TRANSLATE_FAIL;
+            }
+
+            ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
         }
 
         if (!(pte & PTE_V)) {
-- 
2.37.2


