Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFF6606C2B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 01:47:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olfGU-0008K2-Kh
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 19:47:54 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olf8J-0003dM-KN
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 19:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olf87-0003bJ-Ua
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 19:39:16 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olf82-00049L-S8
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 19:39:15 -0400
Received: by mail-pg1-x535.google.com with SMTP id b5so979555pgb.6
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 16:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OYA2dYp2IX+Kasnq5eA84asZc00SKGDBPaGR9K6tGOc=;
 b=VqtNJGBpltH6ddBWaaVz/XpNVV6u1g4K/ti38OejR6A2sG/fjKxMtGU+EbTSVNNlgj
 YhKfLerq3Zw7jcrf9ogkn9wlE3rnjFUVW74JqU+6FWV1O08H4kZKyLcZTENBEm18Nb1f
 WlpF4lZgbqEM3g7ih09SrnznY6Oy7Zx4WoPLo3yqvX1pRYIxbjzy+4OGAQj3WB6ErBrF
 LJ1LWMaKKW/nvuZG08b7ZnWLr3UIeXTSCVDIN5I+Sja/vr2WZE1EfvropAhwzQHs4H2y
 6bdlEElwI+ZeIW5WA/CroC+CC9MRPazmIGXkN6Odu8LuFCRFjMSj6HE+13bdbOMGWbh7
 ahow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OYA2dYp2IX+Kasnq5eA84asZc00SKGDBPaGR9K6tGOc=;
 b=FezB+4sGoMWEgRLWE3iMp4Pj9nBB9jZ5cs94ZeLcl9pKBrcNHesMe6KLC8x9GTHrpW
 0y8XV+vYRG9NJ10W0vxxx3pNvAjDkKIRwrkVWenyq4xvEEBaWvWMMCma+aVMcfw4yHaJ
 uyob8hHKUkdZ5kfluG2vu2DHzzqv+vOkSZ5YF120JdjBdurFQCqaWfNUWbs4c8coRe9A
 LC85F5rQvy4+2Pht0zqotPWMk5WbDFxpoiVmgYW1tLN8+wTrib2auZanJbm31hDstVoc
 aPtGYP/IGTgPJr6mUYeBBNAtV9sDr7tXRk4QNItY276Y84/DfxPtCjqEQC82XImIh10I
 Q6ZQ==
X-Gm-Message-State: ACrzQf2IS3QciKDjmVxXsI79CHxjaGO6OfAMPfEaSgJeXngedI8xtLB7
 tnYT/nhtKMU1UDyORNptD3wp9iX0T3YDvfBr
X-Google-Smtp-Source: AMsMyM6AMfmQV66DqC96Bj4hm9QnFwOjTCUMxtcMMqkuHjHpGZtKGmcK+pNn2/bDJ75+yD1RdGoe3A==
X-Received: by 2002:a63:6742:0:b0:452:59b9:22e with SMTP id
 b63-20020a636742000000b0045259b9022emr13512097pgc.205.1666309148953; 
 Thu, 20 Oct 2022 16:39:08 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a170902d50300b00174d9bbeda4sm13639313plg.197.2022.10.20.16.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 16:39:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] tcg/riscv: Fix reg overlap case in tcg_out_addsub2
Date: Fri, 21 Oct 2022 09:38:36 +1000
Message-Id: <20221020233836.2341671-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There was a typo using opc_addi instead of opc_add with the
two registers.  While we're at it, simplify the gating test
to al == bl to improve dynamic scheduling even when the
output register does not overlap the inputs.

Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Supersedes: 20221020104154.4276-4-zhiwei_liu@linux.alibaba.com
("[RFC PATCH 3/3] tcg/riscv: Remove a wrong optimization for addsub2")
---
 tcg/riscv/tcg-target.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 81a83e45b1..1cdaf7b57b 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -687,9 +687,15 @@ static void tcg_out_addsub2(TCGContext *s,
         if (cbl) {
             tcg_out_opc_imm(s, opc_addi, rl, al, bl);
             tcg_out_opc_imm(s, OPC_SLTIU, TCG_REG_TMP0, rl, bl);
-        } else if (rl == al && rl == bl) {
+        } else if (al == bl) {
+            /*
+             * If the input regs overlap, this is a simple doubling
+             * and carry-out is the input msb.  This special case is
+             * required when the output reg overlaps the input,
+             * but we might as well use it always.
+             */
             tcg_out_opc_imm(s, OPC_SLTI, TCG_REG_TMP0, al, 0);
-            tcg_out_opc_reg(s, opc_addi, rl, al, bl);
+            tcg_out_opc_reg(s, opc_add, rl, al, al);
         } else {
             tcg_out_opc_reg(s, opc_add, rl, al, bl);
             tcg_out_opc_reg(s, OPC_SLTU, TCG_REG_TMP0,
-- 
2.34.1


