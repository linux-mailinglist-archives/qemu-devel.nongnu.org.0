Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BD86E97EB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:03:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVoR-0001eE-Hi; Thu, 20 Apr 2023 11:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1ppVnv-0001Db-T6
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:02:37 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1ppVno-0004dU-SX
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:02:35 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1833c5991so5110405e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682002945; x=1684594945; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=So7yjB+0zezsP+grOmdMLTlhaDdmkzACsfLRLUt/J98=;
 b=nIGzd8swMQXTIG+hSPvd6eDKpWZlaM9YYe+OM3mhatkCktIZHhWDnbl8O3EKpSQF+5
 CqhO5y4ZCJAjyfcCytzgRi17rfF1xcZUtds3T+jCKe6DmGaD5Yv6X8siCYnppXtIbhEp
 va6k45G+daIAIOoIhV2he9y0AObmyKP+AClAtH42cR+GLq7ZkYlE/U90H8qwSHj/0/59
 p4hGYVvPvKGjB1nIfTGaIN+dKDyjvHiMjGDduKSd7BrnLdawWbhMX7Ul1omasMzKV92t
 KSA5/RyorH4kN68ONfCMQ7u+EM432acwlg3+ru85GB/9ePWbH8DUh1hlQY21acK+0Oh+
 fynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682002945; x=1684594945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=So7yjB+0zezsP+grOmdMLTlhaDdmkzACsfLRLUt/J98=;
 b=Sh2l5VEV6UVauzwJJ8RHkAQMZFbfnEFYWGVJyq2T+6FMGyUCJBAoLawxspQ/KOWXHS
 FdsaGtaXBuIeUaq1UnIIIE3h/qzPlCm+LpqBP5DMUdM4k795Lsv39LBi3K2373rGvfKn
 n9AMSpO2svVhDLDj6cfghmwCg+O7FfSrLNr7pA4WbpoY52/CPdl5ALwJ6sAKvhkOInqi
 lvTq24TkmkVn35pSCdKUHQeuP3zoZJFSffmRMp/QY/TmYLqDE7/kqoeaxSkhOq72Ic75
 0LsR+pKBVlTsvJu3HmWW1eKDCq88gUif38WFO6HCNbUBIdg2voABszZO8fv/ZDJ8drV/
 izZA==
X-Gm-Message-State: AAQBX9fPs5i/ic/trpzejme1ohxe4iva5ktvIFOWN+4vKuM1nehVafr5
 /PsbS1pPh8C5pn4spV65AOW2vw==
X-Google-Smtp-Source: AKy350ZeOwzK8akOkkzZ4rej6F9KBX8JSI6YNpOHXzJeT+0FrAEK9cCNplHQ0dJmbu8yea1E7OSd0Q==
X-Received: by 2002:a5d:4572:0:b0:2f4:a552:b411 with SMTP id
 a18-20020a5d4572000000b002f4a552b411mr1396105wrc.46.1682002944787; 
 Thu, 20 Apr 2023 08:02:24 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com
 (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4f01000000b002fc0de07930sm2170813wru.13.2023.04.20.08.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:02:24 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrea Parri <andrea@rivosinc.com>
Subject: [PATCH v3] riscv: Make sure an exception is raised if a pte is
 malformed
Date: Thu, 20 Apr 2023 17:02:20 +0200
Message-Id: <20230420150220.60919-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

As per the specification, in 64-bit, if any of the pte reserved bits
60-54 is set an exception should be triggered (see 4.4.1, "Addressing and
Memory Protection"). In addition, we must check the napot/pbmt bits are
not set if those extensions are not active.

Reported-by: Andrea Parri <andrea@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in v3:
- Rebase on top of https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Changes in v2:
- Handle napot and pbmt exception

 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index fb63b8e125..59f0ffd9e1 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -644,6 +644,7 @@ typedef enum {
 #define PTE_SOFT            0x300 /* Reserved for Software */
 #define PTE_PBMT            0x6000000000000000ULL /* Page-based memory types */
 #define PTE_N               0x8000000000000000ULL /* NAPOT translation */
+#define PTE_RESERVED        0x1FC0000000000000ULL /* Reserved bits */
 #define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits */
 
 /* Page table PPN shift amount */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b68dcfe7b6..57d04385f1 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -927,13 +927,20 @@ restart:
 
         if (riscv_cpu_sxl(env) == MXL_RV32) {
             ppn = pte >> PTE_PPN_SHIFT;
-        } else if (pbmte || riscv_cpu_cfg(env)->ext_svnapot) {
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
+            if (!riscv_cpu_cfg(env)->ext_svnapot && (pte & PTE_N)) {
+                return TRANSLATE_FAIL;
+            }
+
+            ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
         }
 
         if (!(pte & PTE_V)) {
-- 
2.37.2


