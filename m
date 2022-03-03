Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9124CC7FE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:27:14 +0100 (CET)
Received: from localhost ([::1]:52162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsyf-0003zB-VK
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:27:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsZ9-0006Gs-8U
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:58 -0500
Received: from [2607:f8b0:4864:20::532] (port=47062
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsZ7-0004Nj-Dh
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:51 -0500
Received: by mail-pg1-x532.google.com with SMTP id o23so5720419pgk.13
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ho2jnp9wAsj5SBP8tX6ESXDweHDs0USlRJ9dHfy8f/A=;
 b=Bn+6FdMKJSkiiNReFBPwUHZmnwvUIepsIZodrQpm0oxqt5teRzqdmrxooTP4sLnp7z
 zNvDooEt4YezUpyUty8z7Q+K8/WqpgkutTtqv5j/7zFw1KfX2nTymQ6bdlQlDTTBarYh
 1a6Z785ZWS2nUScuLVHNMA18RB2VcunGgSsbocbNlr6DS0aeHymSQgM/Hidh1oe9hd61
 IEmocs/FSbe+BvgfD/6buTccvRpzngnvGU+Wb9RrtvK/9L3LEzAsngNnUSDl/8EvE59X
 e0WGD5+5PBPGQDiPzd/eMWNQUcafVroobhZZ77Fk/JVTVdTBCEQQfgW4i93As8tuAIay
 9axQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ho2jnp9wAsj5SBP8tX6ESXDweHDs0USlRJ9dHfy8f/A=;
 b=zseSp2knMNwPP0IdUWZ4GA5f26sJ6kciUhaPeqNAPXE21Z258q8Sv7kaM5jL2GEwmd
 N+B/rBjDImENFnL7m+b/u0VRbVcfFnvqYjbMbYNCETOo9u6lX1kp/S59bDuCC4ZZjzFY
 wfpmdpAUzvOJFzl47pXkMoXljrmDEKuy4tv9CLBsNbrBb+0Qq8ATpoJ/IBMX5BZKe5/B
 yFM/OVMVnd7QA4oms4hqCFJzMo+8t0YG3GRE4/RyjZifFZNrn3KjhPnjceyvoFdGaeME
 gjRmXfgn1q32Qhi+Au6A4le8Wy66r4auM2qAOFju9YavjFrB+5zX2XpcMNXj2MQeLZ1i
 V2xw==
X-Gm-Message-State: AOAM533GmaRbALTSOosL71qBS/chsFc3js0L6nJ/JWWKL+wlcbtkSN8O
 gtxVxLzw8qmFnamNWc9orBkX/eMaC5PGug==
X-Google-Smtp-Source: ABdhPJx15NZwVAeTeZRznqRMJWko5REW7pSHECOlZiYQfzfYuT8dqHV9piZcJwnkLIHpbviTt7lDig==
X-Received: by 2002:a65:680a:0:b0:34d:efd6:7a5f with SMTP id
 l10-20020a65680a000000b0034defd67a5fmr31337128pgt.213.1646341230959; 
 Thu, 03 Mar 2022 13:00:30 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/30] tcg/riscv: Support TCG_TARGET_SIGNED_ADDR32
Date: Thu,  3 Mar 2022 10:59:43 -1000
Message-Id: <20220303205944.469445-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All RV64 32-bit operations sign-extend the output, so we are easily
able to keep TCG_TYPE_I32 values sign-extended in host registers.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-sa32.h | 6 +++++-
 tcg/riscv/tcg-target.c.inc  | 8 ++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tcg/riscv/tcg-target-sa32.h b/tcg/riscv/tcg-target-sa32.h
index cb185b1526..703467b37a 100644
--- a/tcg/riscv/tcg-target-sa32.h
+++ b/tcg/riscv/tcg-target-sa32.h
@@ -1 +1,5 @@
-#define TCG_TARGET_SIGNED_ADDR32 0
+/*
+ * Do not set TCG_TARGET_SIGNED_ADDR32 for RV32;
+ * TCG expects this to only be set for 64-bit hosts.
+ */
+#define TCG_TARGET_SIGNED_ADDR32  (__riscv_xlen == 64)
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 6409d9c3d5..c999711494 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -951,10 +951,6 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
     tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
 
     /* TLB Hit - translate address using addend.  */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, TCG_REG_TMP0, addrl);
-        addrl = TCG_REG_TMP0;
-    }
     tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addrl);
 }
 
@@ -1175,7 +1171,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
@@ -1247,7 +1243,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
-- 
2.25.1


