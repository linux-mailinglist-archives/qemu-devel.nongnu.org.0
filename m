Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6FE60D92A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:18:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtT-0004kq-L1; Tue, 25 Oct 2022 22:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtJ-0004ZV-Hr
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:37 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtD-00011M-Cp
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:35 -0400
Received: by mail-pg1-x533.google.com with SMTP id 128so13465978pga.1
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xZ/+bIN9G+2jCCLtEbaCgiuaoUTd0+RhG3Uh+OtJwJs=;
 b=ttAzxVzUYa3XmqZaPasJF3jr2sYIklV6ZiUD1PPjsjnoZIPNmFFkSDwcXiwPMDrMro
 F20/ttfwxg6CQckB54Py0MXgoHQvEX/kiMrKzvyCiRqeo+pP4TWD8NFogzPP6ooIhoTO
 Ke4lfAlpXKH2ZJeFCTtnYwtKhJ+tLPO4ZlK4imFvGq8bEUTemHLut9K1ChTFpmPJsZYD
 4XkuVWz2vaM3kKV9R0YkjCbopuHHlxh063h5DCUZSFieu07BklAdG6MeAFr6puzk1VqN
 NFRXmEp3+uExcpA1Dv7ozl8oTzrGH56MveBEaDUfsOgOW6duHK/g0hV/k35kB6gmSX8g
 WnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xZ/+bIN9G+2jCCLtEbaCgiuaoUTd0+RhG3Uh+OtJwJs=;
 b=NEzAOiG1JfI9i7MIu5a6M7YlNdamVLKu7HiqstPe9fFz3yk8xWG7wLoUuPBEQUl/VP
 kyyNTQw+mWm6O4tE4K5HbnmHaql1d0giF1cM0E3kt89ea6aaz8UnSNiXM2Yls4ImoNvF
 6HljS+/KAZEhkryNoD5fPkSK0q5yFkwbwW73xPsJpr+xUBfv3P1lqWgNTZ1a9Az8LLQh
 8naSpaqepH2VbQC9HxC2Udg70kO/9c26wRwApqqkTZj9JpWjVl5uHp20xA39jGLQ86IF
 qL8zsWbI9sfUsqay7OyTWAdsR/xNFuEfb/PV/VXdzpujahvdZ0QzDT2yRPorljyqdcLL
 hsMw==
X-Gm-Message-State: ACrzQf2jvOh3/6IsbseJ/s8wBlbYFyrIxrKcyeex0DxLrrj5pS7sqpGq
 9YE+Kc/OTAY7i6PhnuM+2/hzA5ZrdDfU0PHX
X-Google-Smtp-Source: AMsMyM6f8T21TL1eeZZgcAWKT14sJP6bcjS/45c+FsPFp9YygktJi1Gi473cEEc5fMHtypb8v0G5CQ==
X-Received: by 2002:a05:6a00:189f:b0:56b:b192:cda with SMTP id
 x31-20020a056a00189f00b0056bb1920cdamr16155794pfh.2.1666750289804; 
 Tue, 25 Oct 2022 19:11:29 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:11:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Qi Hu <huqi@loongson.cn>, WANG Xuerui <git@xen0n.name>
Subject: [PULL 02/47] tcg/loongarch64: Add direct jump support
Date: Wed, 26 Oct 2022 12:10:31 +1000
Message-Id: <20221026021116.1988449-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Qi Hu <huqi@loongson.cn>

Similar to the ARM64, LoongArch has PC-relative instructions such as
PCADDU18I. These instructions can be used to support direct jump for
LoongArch. Additionally, if instruction "B offset" can cover the target
address(target is within ±128MB range), a single "B offset" plus a nop
will be used by "tb_target_set_jump_target".

Signed-off-by: Qi Hu <huqi@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: WANG Xuerui <git@xen0n.name>
Message-Id: <20221015092754.91971-1-huqi@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.h     |  9 ++++--
 tcg/loongarch64/tcg-target.c.inc | 48 +++++++++++++++++++++++++++++---
 2 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index d58a6162f2..a659c8d6fd 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -42,7 +42,11 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_NB_REGS 32
-#define MAX_CODE_GEN_BUFFER_SIZE  SIZE_MAX
+/*
+ * PCADDU18I + JIRL sequence can give 20 + 16 + 2 = 38 bits
+ * signed offset, which is +/- 128 GiB.
+ */
+#define MAX_CODE_GEN_BUFFER_SIZE  (128 * GiB)
 
 typedef enum {
     TCG_REG_ZERO,
@@ -123,7 +127,7 @@ typedef enum {
 #define TCG_TARGET_HAS_clz_i32          1
 #define TCG_TARGET_HAS_ctz_i32          1
 #define TCG_TARGET_HAS_ctpop_i32        0
-#define TCG_TARGET_HAS_direct_jump      0
+#define TCG_TARGET_HAS_direct_jump      1
 #define TCG_TARGET_HAS_brcond2          0
 #define TCG_TARGET_HAS_setcond2         0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
@@ -166,7 +170,6 @@ typedef enum {
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
 
-/* not defined -- call should be eliminated at compile time */
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a3debf6da7..d326e28740 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1031,6 +1031,36 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
 #endif
 }
 
+/* LoongArch uses `andi zero, zero, 0` as NOP.  */
+#define NOP OPC_ANDI
+static void tcg_out_nop(TCGContext *s)
+{
+    tcg_out32(s, NOP);
+}
+
+void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
+                              uintptr_t jmp_rw, uintptr_t addr)
+{
+    tcg_insn_unit i1, i2;
+    ptrdiff_t upper, lower;
+    ptrdiff_t offset = (ptrdiff_t)(addr - jmp_rx) >> 2;
+
+    if (offset == sextreg(offset, 0, 26)) {
+        i1 = encode_sd10k16_insn(OPC_B, offset);
+        i2 = NOP;
+    } else {
+        tcg_debug_assert(offset == sextreg(offset, 0, 36));
+        lower = (int16_t)offset;
+        upper = (offset - lower) >> 16;
+
+        i1 = encode_dsj20_insn(OPC_PCADDU18I, TCG_REG_TMP0, upper);
+        i2 = encode_djsk16_insn(OPC_JIRL, TCG_REG_ZERO, TCG_REG_TMP0, lower);
+    }
+    uint64_t pair = ((uint64_t)i2 << 32) | i1;
+    qatomic_set((uint64_t *)jmp_rw, pair);
+    flush_idcache_range(jmp_rx, jmp_rw, 8);
+}
+
 /*
  * Entry-points
  */
@@ -1058,10 +1088,20 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_goto_tb:
-        assert(s->tb_jmp_insn_offset == 0);
-        /* indirect jump method */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
-                   (uintptr_t)(s->tb_jmp_target_addr + a0));
+        tcg_debug_assert(s->tb_jmp_insn_offset != NULL);
+        /*
+         * Ensure that patch area is 8-byte aligned so that an
+         * atomic write can be used to patch the target address.
+         */
+        if ((uintptr_t)s->code_ptr & 7) {
+            tcg_out_nop(s);
+        }
+        s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+        /*
+         * actual branch destination will be patched by
+         * tb_target_set_jmp_target later
+         */
+        tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, 0);
         tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
         set_jmp_reset_offset(s, a0);
         break;
-- 
2.34.1


