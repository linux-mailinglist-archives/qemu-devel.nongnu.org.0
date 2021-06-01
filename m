Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDAA397673
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:22:33 +0200 (CEST)
Received: from localhost ([::1]:45372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6Dw-0005RW-Bh
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tx-0002bF-Ch
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:54 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:33772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tk-0002h5-RY
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:53 -0400
Received: by mail-io1-xd30.google.com with SMTP id a6so15685443ioe.0
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oEIZYcilzhqc0TqsSnNTanV1QNHzejDQCs/zffIYgHI=;
 b=xfbqGM/Rvk2HdbTcMnIrfiD6amZJ4dLQ/xvp7JGWiJyFQDvg1/rjWVGBKd/yu6Bwfc
 RLNKEPL8SVQ3ZJWBDhpi4Gorcnes0sBLvqDTMb68OwM4VSLvvvtd7odIMFgPY7BiEYfs
 k4kUWDcNm83sybmblRQn6R9g9y3r2u32FI1tK02tCg8i7CUZnzqdCagADKFrqlVnu/1W
 YUczgaXojNpQd4LX5m+2X6OZurb6jZjdETH8UUdVnG4I2x+QZxmaLVo8UOBTvNiTuyPj
 hBToEfi9unfARhK050qUJNNNBxyTDx30a5JR28LBgVo04rEH2qu6iu6FcgAGNuNHMQIR
 2q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oEIZYcilzhqc0TqsSnNTanV1QNHzejDQCs/zffIYgHI=;
 b=QsWbdk8kOW5gATktiuBQtCQHlUZL2Xas8GAobsuLXMG4UWh5xtpbS36zEscfKIPJqC
 l8zgApoZ2j8n3K+bLNhqIGQzUkuFpobSn44Wx/S4t1JGHWfVeCuS/Us4l3+2QQLxnPfs
 U6YN59XeShCyiWNg5BuqpFlHTZuQOhE+/4Zz12ZA088WyAZQTLiFY4qMzWPX+67R2L0h
 I1/ZjrZlVH7OxQk5o/I3EciZOMYvjVRP03RNdfJ+AWPFaw6AOfOUAHRNsTkg2MQEviUY
 do0QoQ4VpUv4Igoh2rhEV3g27iQGWjhAc9D0ixHyi4+LwRG10rg1pS/zYtKiCTf3FUBH
 0T0g==
X-Gm-Message-State: AOAM530eUsqNHsabRE8f0b1LxLyele98GIpBckZCq7OGdkvasxYN9VaG
 vJi0PgVq6PEsJ70i/zwkQXOhvSZWdF91DQmS
X-Google-Smtp-Source: ABdhPJzx9+OajtPDLc7K6LPRI3tXM3QdOhdfV9NJt9sJSUIU9tskypqrSF/s4wSm9iIPdBp1PdkRcw==
X-Received: by 2002:a05:6638:258c:: with SMTP id
 s12mr25343696jat.92.1622559696214; 
 Tue, 01 Jun 2021 08:01:36 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 20/27] tcg/tci: Implement clz, ctz, ctpop
Date: Tue,  1 Jun 2021 08:00:59 -0700
Message-Id: <20210601150106.12761-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     | 12 +++++------
 tcg/tci.c                | 44 ++++++++++++++++++++++++++++++++++++++++
 tcg/tci/tcg-target.c.inc |  9 ++++++++
 3 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 60b67b196b..59859bd8a6 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -75,9 +75,9 @@
 #define TCG_TARGET_HAS_eqv_i32          1
 #define TCG_TARGET_HAS_nand_i32         1
 #define TCG_TARGET_HAS_nor_i32          1
-#define TCG_TARGET_HAS_clz_i32          0
-#define TCG_TARGET_HAS_ctz_i32          0
-#define TCG_TARGET_HAS_ctpop_i32        0
+#define TCG_TARGET_HAS_clz_i32          1
+#define TCG_TARGET_HAS_ctz_i32          1
+#define TCG_TARGET_HAS_ctpop_i32        1
 #define TCG_TARGET_HAS_neg_i32          1
 #define TCG_TARGET_HAS_not_i32          1
 #define TCG_TARGET_HAS_orc_i32          1
@@ -112,9 +112,9 @@
 #define TCG_TARGET_HAS_eqv_i64          1
 #define TCG_TARGET_HAS_nand_i64         1
 #define TCG_TARGET_HAS_nor_i64          1
-#define TCG_TARGET_HAS_clz_i64          0
-#define TCG_TARGET_HAS_ctz_i64          0
-#define TCG_TARGET_HAS_ctpop_i64        0
+#define TCG_TARGET_HAS_clz_i64          1
+#define TCG_TARGET_HAS_ctz_i64          1
+#define TCG_TARGET_HAS_ctpop_i64        1
 #define TCG_TARGET_HAS_neg_i64          1
 #define TCG_TARGET_HAS_not_i64          1
 #define TCG_TARGET_HAS_orc_i64          1
diff --git a/tcg/tci.c b/tcg/tci.c
index 22ee32bc24..1e2737e079 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -587,6 +587,26 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (uint32_t)regs[r1] % (uint32_t)regs[r2];
             break;
+#if TCG_TARGET_HAS_clz_i32
+        case INDEX_op_clz_i32:
+            tci_args_rrr(insn, &r0, &r1, &r2);
+            tmp32 = regs[r1];
+            regs[r0] = tmp32 ? clz32(tmp32) : regs[r2];
+            break;
+#endif
+#if TCG_TARGET_HAS_ctz_i32
+        case INDEX_op_ctz_i32:
+            tci_args_rrr(insn, &r0, &r1, &r2);
+            tmp32 = regs[r1];
+            regs[r0] = tmp32 ? ctz32(tmp32) : regs[r2];
+            break;
+#endif
+#if TCG_TARGET_HAS_ctpop_i32
+        case INDEX_op_ctpop_i32:
+            tci_args_rr(insn, &r0, &r1);
+            regs[r0] = ctpop32(regs[r1]);
+            break;
+#endif
 
             /* Shift/rotate operations (32 bit). */
 
@@ -739,6 +759,24 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (uint64_t)regs[r1] % (uint64_t)regs[r2];
             break;
+#if TCG_TARGET_HAS_clz_i64
+        case INDEX_op_clz_i64:
+            tci_args_rrr(insn, &r0, &r1, &r2);
+            regs[r0] = regs[r1] ? clz64(regs[r1]) : regs[r2];
+            break;
+#endif
+#if TCG_TARGET_HAS_ctz_i64
+        case INDEX_op_ctz_i64:
+            tci_args_rrr(insn, &r0, &r1, &r2);
+            regs[r0] = regs[r1] ? ctz64(regs[r1]) : regs[r2];
+            break;
+#endif
+#if TCG_TARGET_HAS_ctpop_i64
+        case INDEX_op_ctpop_i64:
+            tci_args_rr(insn, &r0, &r1);
+            regs[r0] = ctpop64(regs[r1]);
+            break;
+#endif
 
             /* Shift/rotate operations (64 bit). */
 
@@ -1165,6 +1203,8 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     case INDEX_op_not_i64:
     case INDEX_op_neg_i32:
     case INDEX_op_neg_i64:
+    case INDEX_op_ctpop_i32:
+    case INDEX_op_ctpop_i64:
         tci_args_rr(insn, &r0, &r1);
         info->fprintf_func(info->stream, "%-12s  %s, %s",
                            op_name, str_r(r0), str_r(r1));
@@ -1210,6 +1250,10 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     case INDEX_op_rotl_i64:
     case INDEX_op_rotr_i32:
     case INDEX_op_rotr_i64:
+    case INDEX_op_clz_i32:
+    case INDEX_op_clz_i64:
+    case INDEX_op_ctz_i32:
+    case INDEX_op_ctz_i64:
         tci_args_rrr(insn, &r0, &r1, &r2);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s",
                            op_name, str_r(r0), str_r(r1), str_r(r2));
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 677ae2dceb..748bc13d4e 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -67,6 +67,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extract_i64:
     case INDEX_op_sextract_i32:
     case INDEX_op_sextract_i64:
+    case INDEX_op_ctpop_i32:
+    case INDEX_op_ctpop_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
@@ -122,6 +124,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_setcond_i64:
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
+    case INDEX_op_clz_i32:
+    case INDEX_op_clz_i64:
+    case INDEX_op_ctz_i32:
+    case INDEX_op_ctz_i64:
         return C_O1_I2(r, r, r);
 
     case INDEX_op_brcond_i32:
@@ -655,6 +661,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     CASE_32_64(divu)     /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(rem)      /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(remu)     /* Optional (TCG_TARGET_HAS_div_*). */
+    CASE_32_64(clz)      /* Optional (TCG_TARGET_HAS_clz_*). */
+    CASE_32_64(ctz)      /* Optional (TCG_TARGET_HAS_ctz_*). */
         tcg_out_op_rrr(s, opc, args[0], args[1], args[2]);
         break;
 
@@ -703,6 +711,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
     CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
     CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
+    CASE_32_64(ctpop)    /* Optional (TCG_TARGET_HAS_ctpop_*). */
         tcg_out_op_rr(s, opc, args[0], args[1]);
         break;
 
-- 
2.25.1


