Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9D6669EB5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:50:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMGe-0001uY-Hf; Fri, 13 Jan 2023 10:46:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGc-0001tI-8w
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:54 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGa-0006DI-L8
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:54 -0500
Received: by mail-wr1-x430.google.com with SMTP id k8so6958184wrc.9
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGEpGMVpJi52vNK6cQWH7oVqlSqUk/J+h6xw06+rMj4=;
 b=qBkxH2Bt0zYCrZkMtbBgwmKePZiQBDZIIqAh8uYqxgU9n7kZxqxVb8WzaohuWGEgG3
 aAm6LQNObYzW62ysXre2mCnjleSkYTNaMb5Xj6g72hraBwWvnxoVcH/IaThJV441jOIU
 Fi3+AFglY9Sf76eJC6FME5H2tVQoYiLSxNJ09kaJ/5rUajie4BN5GKZrUSHnYGH1CO3P
 KxEx38RYSfZnxkVaV4+zHnhHqKa0BYLnv2oeHZ2M2OSEZo7u15bMs1AhCEwjx81A+/Am
 HcihSuswzscL+X+4+SJDqYgbhvPqYToxrXkHYNvwJLWUEeZEaY0h3HPhb+CfLl6hQy95
 MaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FGEpGMVpJi52vNK6cQWH7oVqlSqUk/J+h6xw06+rMj4=;
 b=2fQuSumuEwyReVXgz11qPlDFV5bXCwN0S5z/HEW4tFW5L45R4stYWZdjVKq743ASI7
 MOAR10UTbvw9vjfJe5uGsNxdrrr8EQAjx1wuB3jroqSY9fnUr/UPplc+LUUmw/Sg4bCh
 RfnKpZ1X6QCl0YykIB48UXFupJHC+yNoVUjVfHCsq6j55ck22QXyOCL4tpxC2nDFDOQk
 wiicJDo1YjSWcG2oNiCVtNCVb32/rCxi9VWuXGflzeMhDqLRKblsvqKXiOieVeVdXToj
 9ELrxZ8TdKQ++0/UvPvHOrX48WJiiE0JYF+nVqhv0ClloaUHP+h/w2znClgCkc/9JQtG
 Qdsg==
X-Gm-Message-State: AFqh2krGzWHPJB7ITxHhJoVRIfvc2NTVK2faCAlOjmbX7xclwStHdzx8
 Y/IWBcRXbgc7ssPz3wbdtnIG4tdY7ecdzfPu
X-Google-Smtp-Source: AMrXdXu27uDg59g7LrcjfF8SU+BA+ZRrkKt7/mIAgWGQYg+TEdtiHPzigsH/QtZTQeSWRLvKmh84pQ==
X-Received: by 2002:adf:fd11:0:b0:28a:8b5d:6f47 with SMTP id
 e17-20020adffd11000000b0028a8b5d6f47mr34481969wrr.1.1673624811061; 
 Fri, 13 Jan 2023 07:46:51 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a5d4ec1000000b002882600e8a0sm19303708wrv.12.2023.01.13.07.46.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:46:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 16/46] hw/mips/bootloader: Implement nanoMIPS LI (LUI+ORI)
 opcode generator
Date: Fri, 13 Jan 2023 16:45:02 +0100
Message-Id: <20230113154532.49979-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221211204533.85359-5-philmd@linaro.org>
---
 hw/mips/bootloader.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 3e1e73360f..9fc926d83f 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -132,12 +132,39 @@ static void bl_gen_jalr(void **p, bl_reg rs)
     bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x09);
 }
 
+static void bl_gen_lui_nm(void **ptr, bl_reg rt, uint32_t imm20)
+{
+    uint32_t insn = 0;
+
+    assert(extract32(imm20, 0, 20) == imm20);
+    insn = deposit32(insn, 26, 6, 0b111000);
+    insn = deposit32(insn, 21, 5, rt);
+    insn = deposit32(insn, 12, 9, extract32(imm20, 0, 9));
+    insn = deposit32(insn, 2, 10, extract32(imm20, 9, 10));
+    insn = deposit32(insn, 0, 1, sextract32(imm20, 19, 1));
+
+    st_nm32_p(ptr, insn);
+}
+
 static void bl_gen_lui(void **p, bl_reg rt, uint16_t imm)
 {
     /* R6: It's a alias of AUI with RS = 0 */
     bl_gen_i_type(p, 0x0f, 0, rt, imm);
 }
 
+static void bl_gen_ori_nm(void **ptr, bl_reg rt, bl_reg rs, uint16_t imm12)
+{
+    uint32_t insn = 0;
+
+    assert(extract32(imm12, 0, 12) == imm12);
+    insn = deposit32(insn, 26, 6, 0b100000);
+    insn = deposit32(insn, 21, 5, rt);
+    insn = deposit32(insn, 16, 5, rs);
+    insn = deposit32(insn, 0, 12, imm12);
+
+    st_nm32_p(ptr, insn);
+}
+
 static void bl_gen_ori(void **p, bl_reg rt, bl_reg rs, uint16_t imm)
 {
     bl_gen_i_type(p, 0x0d, rs, rt, imm);
@@ -178,8 +205,13 @@ static void bl_gen_sd(void **p, bl_reg rt, uint8_t base, uint16_t offset)
 /* Pseudo instructions */
 static void bl_gen_li(void **p, bl_reg rt, uint32_t imm)
 {
-    bl_gen_lui(p, rt, extract32(imm, 16, 16));
-    bl_gen_ori(p, rt, rt, extract32(imm, 0, 16));
+    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
+        bl_gen_lui_nm(p, rt, extract32(imm, 12, 20));
+        bl_gen_ori_nm(p, rt, rt, extract32(imm, 0, 12));
+    } else {
+        bl_gen_lui(p, rt, extract32(imm, 16, 16));
+        bl_gen_ori(p, rt, rt, extract32(imm, 0, 16));
+    }
 }
 
 static void bl_gen_dli(void **p, bl_reg rt, uint64_t imm)
-- 
2.38.1


