Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2EC6DCEC9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:10:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2T6-0005wK-0I; Mon, 10 Apr 2023 21:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Ss-0005QB-M9
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:30 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2So-0000r1-Db
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:30 -0400
Received: by mail-pl1-x636.google.com with SMTP id e13so5953847plc.12
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKis80chZUaL+QCeBY/st3bpNxzPB2hybijcnSgD+kY=;
 b=SMkr67+2j4j9auD4OV8bJ1VCiaww0bcrZscbQiljSaJdr9BHdhMvhh/m+eEJbjuMCI
 VVkoH/Ouoae6183aGrViXqtCKfb1bjWqZMHqRoDnYCQG9PDTNCzCxU4/DxHUlPX47Wwr
 rKBZ6rkY06tcF3P42Pt5XSc/VBMZzVG1irx4bZQxJJa/XNQm/kYXc25WKoLA0F0mvsS9
 i7ksDvOWEMLfCg5rv3Ad/3Bwqrxpr4yzXXNt20Wm1Xxtx4EtznMSLJGRmUa/Ct+hR5XG
 jVm7o90UibRTGyYqeh+uyKHU0BjWCysywkiXm89zPvzlRx7aCplaBhyx1d37jp4s4XXV
 npMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CKis80chZUaL+QCeBY/st3bpNxzPB2hybijcnSgD+kY=;
 b=2QmAecmb/jZkRDHSjUt4LK0F5UFkoSPHhvi6wdo3LJu/8kRCN2+mAYMwxPtDLnnB6V
 nLGLcG2ktkLQQd0V9awNuIBafYdtt8rv5TcYd6Ci1oFz+5DctEN5Yv/ZHXoF/axTmwMD
 y1PJtqgpS1IU7XX4BsL3oKs4Fq9rj2DIglhIy6NqCQYXQEXKAOoZSLgBaTvhEdG8ulqj
 PoMFL0nhNIzIXwJgzWb3hnaW1aofvXgpYfz9fh6hsc2dpQvFaDlg65+7r1YVUut0jIIc
 rzHutITItNQw8EvTi+jHQ4nP8Z0Gj40DwH5IG11kJ/A4mglApHzdIHYy5LH6lsvXBEPl
 WlJA==
X-Gm-Message-State: AAQBX9emHF01URtwYB7/iKtpjwAqKsmwgLIrLLfdK9WKV8aLWPfBYA2z
 lvBFjGMsxrHrtDQeCrbMhOd1gGclDNqqKYev4GT/3g==
X-Google-Smtp-Source: AKy350YywQqx8Wh+6IuXaUd2U31gOJ0PqfjUn/cUJqip59WDKtTgcKV49gBzpdCc0u1gdVYGPjGlKA==
X-Received: by 2002:a17:90b:1e09:b0:246:da2a:49be with SMTP id
 pg9-20020a17090b1e0900b00246da2a49bemr1374536pjb.20.1681175184820; 
 Mon, 10 Apr 2023 18:06:24 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 24/54] tcg/loongarch64: Rationalize args to
 tcg_out_qemu_{ld, st}
Date: Mon, 10 Apr 2023 18:04:42 -0700
Message-Id: <20230411010512.5375-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Interpret the variable argument placement in the caller.
Mark the argument registers const, because they must be passed to
add_qemu_ldst_label unmodified.  Shift some code around slightly
to share more between softmmu and user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 102 +++++++++++++------------------
 1 file changed, 44 insertions(+), 58 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 0940788c6f..0daefa18fc 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1049,39 +1049,32 @@ static void tcg_out_qemu_ld_indexed(TCGContext *s, TCGReg rd, TCGReg rj,
     }
 }
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
+static void tcg_out_qemu_ld(TCGContext *s, const TCGReg data_reg,
+                            const TCGReg addr_reg, const MemOpIdx oi,
+                            TCGType data_type)
 {
-    TCGReg addr_regl;
-    TCGReg data_regl;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
+    MemOp opc = get_memop(oi);
+    TCGReg base, index;
+
+#ifdef CONFIG_SOFTMMU
     tcg_insn_unit *label_ptr[1];
-#else
-    unsigned a_bits;
-#endif
-    TCGReg base;
 
-    data_regl = *args++;
-    addr_regl = *args++;
-    oi = *args++;
-    opc = get_memop(oi);
-
-#if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 1);
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    tcg_out_qemu_ld_indexed(s, data_regl, base, TCG_REG_TMP2, opc, type);
-    add_qemu_ldst_label(s, 1, oi, type,
-                        data_regl, addr_regl,
-                        s->code_ptr, label_ptr);
+    tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 1);
+    index = TCG_REG_TMP2;
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
-        tcg_out_test_alignment(s, true, addr_regl, a_bits);
+        tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    TCGReg guest_base_reg = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
-    tcg_out_qemu_ld_indexed(s, data_regl, base, guest_base_reg, opc, type);
+    index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+#endif
+
+    base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
+    tcg_out_qemu_ld_indexed(s, data_reg, base, index, opc, data_type);
+
+#ifdef CONFIG_SOFTMMU
+    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #endif
 }
 
@@ -1109,39 +1102,32 @@ static void tcg_out_qemu_st_indexed(TCGContext *s, TCGReg data,
     }
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType type)
+static void tcg_out_qemu_st(TCGContext *s, const TCGReg data_reg,
+                            const TCGReg addr_reg, const MemOpIdx oi,
+                            TCGType data_type)
 {
-    TCGReg addr_regl;
-    TCGReg data_regl;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
+    MemOp opc = get_memop(oi);
+    TCGReg base, index;
+
+#ifdef CONFIG_SOFTMMU
     tcg_insn_unit *label_ptr[1];
-#else
-    unsigned a_bits;
-#endif
-    TCGReg base;
 
-    data_regl = *args++;
-    addr_regl = *args++;
-    oi = *args++;
-    opc = get_memop(oi);
-
-#if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 0);
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    tcg_out_qemu_st_indexed(s, data_regl, base, TCG_REG_TMP2, opc);
-    add_qemu_ldst_label(s, 0, oi, type,
-                        data_regl, addr_regl,
-                        s->code_ptr, label_ptr);
+    tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 0);
+    index = TCG_REG_TMP2;
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
-        tcg_out_test_alignment(s, false, addr_regl, a_bits);
+        tcg_out_test_alignment(s, false, addr_reg, a_bits);
     }
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    TCGReg guest_base_reg = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
-    tcg_out_qemu_st_indexed(s, data_regl, base, guest_base_reg, opc);
+    index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+#endif
+
+    base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
+    tcg_out_qemu_st_indexed(s, data_reg, base, index, opc);
+
+#ifdef CONFIG_SOFTMMU
+    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #endif
 }
 
@@ -1564,16 +1550,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, TCG_TYPE_I32);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, TCG_TYPE_I64);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, TCG_TYPE_I32);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, TCG_TYPE_I64);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I64);
         break;
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
-- 
2.34.1


