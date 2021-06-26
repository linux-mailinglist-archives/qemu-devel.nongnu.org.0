Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5AC3B4D2E
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:44:35 +0200 (CEST)
Received: from localhost ([::1]:44570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx23N-0005BJ-UE
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vr-0002E8-VE
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:48 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vn-0000NY-Jd
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:47 -0400
Received: by mail-pf1-x429.google.com with SMTP id s14so7990122pfg.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/npoOom83BV+ZhnOrJwhtUPiftxFqKz5+wNoXW0RQ8w=;
 b=fqysC37M61jwspjTWJpP/Wnc53IGoHx/Oew5m5V3FXTFbwaKz1loi8LZHVMb27Hp7P
 RB7n5y/SjhPujzfvPWR1I2a+NwTaRiGNOH9xcjEh9kJaw5A9NlrPe83VmhediRqYQLh+
 ZxvY1/SPaXiuoSA558mYl5v4aFYWvtwFv278EBfs4V+IgewO/pvJOF0XkU1RDPHzAMV2
 EW+A9vliT3fMXNCvuitTBjOp9V2kHwM15B8GBdXTx9gzMHHZvgtmm+FzG/6UgecPyJT4
 jc/CafZzL6Dsfy+6EdgK1Wz3nHt54Vir7MW2PlBR+/g0JVvD+bikBlIjgtG5lNVeR1e6
 h5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/npoOom83BV+ZhnOrJwhtUPiftxFqKz5+wNoXW0RQ8w=;
 b=BTgdb4G2G/lPlqjGxkckduCu9CPgvALKxljTZ/doGlm6mATcKsiwl90DH9lVpMGKAQ
 EZXb/ZblOwzKz1dfRDoEBLdmp4zBVbdbkrNxYynJbI79BarVXuttdUJI56FmFcs4+8Wz
 LFVrGPhKuDbgD09qZnm0Ffl0S4eq1MnB7ACXgAqpgSMdTSdrUV/N8n/7tXNuGpETPrHf
 rL3EECna+aRNbm0B0uvHStz3yOCM4zP9jqsywEefQCaqP9VqovkkxmzOB09tFnMXzRVZ
 3m5Lk+H7+lnkNMzUkwInT1g8uTbLF8+zfWQjXHpqi7lnP/T/VjUByF1e354bAwwQS1TU
 FwCQ==
X-Gm-Message-State: AOAM533QyQd2KHc9sxxZ35i/alclwwxh2FqbVlOv2cekiHlEPyxpU8gU
 Jz6nrGYabyAvtvmzpe8DeXzYhTIRvAnfGw==
X-Google-Smtp-Source: ABdhPJyNEtJQC3i4a2PEQF3bSJTmYdduxgc+mEXqlhUHnNvKLti3teB4uj1qIf+kQZ//qJyzQ5uacg==
X-Received: by 2002:a63:e407:: with SMTP id a7mr12932183pgi.220.1624689402229; 
 Fri, 25 Jun 2021 23:36:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/29] tcg/tci: Support bswap flags
Date: Fri, 25 Jun 2021 23:36:18 -0700
Message-Id: <20210626063631.2411938-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

The existing interpreter zero-extends, ignoring high bits.
Simply add a separate sign-extension opcode if required.
Ensure that the interpreter supports ext16s when bswap16 is enabled.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                |  3 ++-
 tcg/tci/tcg-target.c.inc | 23 ++++++++++++++++++++---
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 71689d4a40..b672c7cae5 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -808,7 +808,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             regs[r0] = (int8_t)regs[r1];
             break;
 #endif
-#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
+#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64 || \
+    TCG_TARGET_HAS_bswap16_i32 || TCG_TARGET_HAS_bswap16_i64
         CASE_32_64(ext16s)
             tci_args_rr(insn, &r0, &r1);
             regs[r0] = (int16_t)regs[r1];
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 9651e7a8f1..0cb16aaa81 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -597,6 +597,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
 {
+    TCGOpcode exts;
+
     switch (opc) {
     case INDEX_op_exit_tb:
         tcg_out_op_p(s, opc, (void *)args[0]);
@@ -710,13 +712,28 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     CASE_64(ext32u)      /* Optional (TCG_TARGET_HAS_ext32u_i64). */
     CASE_64(ext_i32)
     CASE_64(extu_i32)
-    CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
-    CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
-    CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
     CASE_32_64(ctpop)    /* Optional (TCG_TARGET_HAS_ctpop_*). */
+    case INDEX_op_bswap32_i32: /* Optional (TCG_TARGET_HAS_bswap32_i32). */
+    case INDEX_op_bswap64_i64: /* Optional (TCG_TARGET_HAS_bswap64_i64). */
         tcg_out_op_rr(s, opc, args[0], args[1]);
         break;
 
+    case INDEX_op_bswap16_i32: /* Optional (TCG_TARGET_HAS_bswap16_i32). */
+        exts = INDEX_op_ext16s_i32;
+        goto do_bswap;
+    case INDEX_op_bswap16_i64: /* Optional (TCG_TARGET_HAS_bswap16_i64). */
+        exts = INDEX_op_ext16s_i64;
+        goto do_bswap;
+    case INDEX_op_bswap32_i64: /* Optional (TCG_TARGET_HAS_bswap32_i64). */
+        exts = INDEX_op_ext32s_i64;
+    do_bswap:
+        /* The base tci bswaps zero-extend, and ignore high bits. */
+        tcg_out_op_rr(s, opc, args[0], args[1]);
+        if (args[2] & TCG_BSWAP_OS) {
+            tcg_out_op_rr(s, exts, args[0], args[0]);
+        }
+        break;
+
     CASE_32_64(add2)
     CASE_32_64(sub2)
         tcg_out_op_rrrrrr(s, opc, args[0], args[1], args[2],
-- 
2.25.1


