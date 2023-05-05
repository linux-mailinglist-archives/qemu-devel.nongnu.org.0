Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4B36F8B07
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:29:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vW-0000pR-Mh; Fri, 05 May 2023 17:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vU-0000n9-2a
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:16 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vE-0004SJ-TP
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:15 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f9b9aa9d75so1537661f8f.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321899; x=1685913899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zSj12nfEvRnhBgqE2PJi/TGBu9PPVa2e0rcdWimFZ2s=;
 b=NocjMrDeevHobWcnJciOuxbGGRLbVPsaFSe+GQasftaj9W56++z6jUygBagX88LQ1s
 3I2r+q2IzCYwfYviLcbnP13GxHBOyCBXJOXqaXUDMd6PzxGR6FEEIzCN1pjy8dSAZ++u
 ty4H9j8Sp59wDD/1dHpUyRguAcUhC5F67ClDEyoRE5OGM/BSMBjR79v9AGiNBU6gnh+K
 iXTlselrQYZK2uJkKRFAcex8aDR/anoiifLYeHGfJQsWMUMWq/Y7qpKehhn9D8IcdopN
 LdpswPTomTO5ET6FkpNseQLh+7Zfph1hclxYlJlpJ8m8bx92gqZoQ2Pt/xyc3XNw/fQs
 oOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321899; x=1685913899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zSj12nfEvRnhBgqE2PJi/TGBu9PPVa2e0rcdWimFZ2s=;
 b=ZEWnZKtko8yBe8AVRRMdd1mSHn6iP+d1OTCGVqsz+nCwekAfxvLniHQhuwjYodg5wA
 hBX/bxoMVcEb+eB9H1PnPiygR2HKi4VVnIz9ILecxs8j4y3jBbSurff8N/6K2oYsI9dr
 yL9WJFc6S1cRXfrNnqNZ1M0PJceRfyp3yPFeJT8Eak1CEts1WbyeFRbgdTlGSXlALgoR
 n5Q88YQodbTuDWP7Idn29cV2D1usw2ukLUYmVGTmXBi7xBH/K+1BJR6lFsTfqK6T0O+M
 NsGEdAAO9s+2o67Oyd/EVJTAOYoElgUT4xm/Y8ifdi0uHt6ghd7s9BdQ2AZDHOyYYkZQ
 FiUA==
X-Gm-Message-State: AC+VfDxnpRl4ImprSHc5P62gbA79d+OBbu402187wjJllsM6xmmv0Tha
 4av9wY7jO9mKbrATsSd8OvJuRQuENmlVYyhkJqs9nw==
X-Google-Smtp-Source: ACHHUZ7AhKzPt09GV9sx9nzK6L7ZwewOfrUH6n24qTE1lJmwVTBwOod82jV2D90xMAFVErtmt9wahQ==
X-Received: by 2002:a5d:6941:0:b0:306:31d4:43 with SMTP id
 r1-20020a5d6941000000b0030631d40043mr2288671wrw.63.1683321899469; 
 Fri, 05 May 2023 14:24:59 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 19/42] tcg/i386: Rationalize args to tcg_out_qemu_{ld,st}
Date: Fri,  5 May 2023 22:24:24 +0100
Message-Id: <20230505212447.374546-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Interpret the variable argument placement in the caller.  Pass data_type
instead of is64 -- there are several places where we already convert back
from bool to type.  Clean things up by using type throughout.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 111 +++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 61 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index caf91a3151..cfa2349b03 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1884,8 +1884,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
  * Record the context of a call to the out of line helper code for the slow path
  * for a load or store, so that we can later generate the correct helper code
  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
-                                MemOpIdx oi,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
+                                TCGType type, MemOpIdx oi,
                                 TCGReg datalo, TCGReg datahi,
                                 TCGReg addrlo, TCGReg addrhi,
                                 tcg_insn_unit *raddr,
@@ -1895,7 +1895,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
 
     label->is_ld = is_ld;
     label->oi = oi;
-    label->type = is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    label->type = type;
     label->datalo_reg = datalo;
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
@@ -2152,11 +2152,10 @@ static inline int setup_guest_base_seg(void)
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                    TCGReg base, int index, intptr_t ofs,
-                                   int seg, bool is64, MemOp memop)
+                                   int seg, TCGType type, MemOp memop)
 {
-    TCGType type = is64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
     bool use_movbe = false;
-    int rexw = is64 * P_REXW;
+    int rexw = (type == TCG_TYPE_I32 ? 0 : P_REXW);
     int movop = OPC_MOVL_GvEv;
 
     /* Do big-endian loads with movbe.  */
@@ -2246,50 +2245,34 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
     }
 }
 
-/* XXX: qemu_ld and qemu_st could be modified to clobber only EDX and
-   EAX. It will be useful once fixed registers globals are less
-   common. */
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg datalo, datahi, addrlo;
-    TCGReg addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc;
+    MemOp opc = get_memop(oi);
+
 #if defined(CONFIG_SOFTMMU)
-    int mem_index;
     tcg_insn_unit *label_ptr[2];
-#else
-    unsigned a_bits;
-#endif
 
-    datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-
-#if defined(CONFIG_SOFTMMU)
-    mem_index = get_mmuidx(oi);
-
-    tcg_out_tlb_load(s, addrlo, addrhi, mem_index, opc,
+    tcg_out_tlb_load(s, addrlo, addrhi, get_mmuidx(oi), opc,
                      label_ptr, offsetof(CPUTLBEntry, addr_read));
 
     /* TLB Hit.  */
-    tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, is64, opc);
+    tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1,
+                           -1, 0, 0, data_type, opc);
 
     /* Record the current context of a load into ldst label */
-    add_qemu_ldst_label(s, true, is64, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, true, data_type, oi, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
     }
 
     tcg_out_qemu_ld_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg,
-                           is64, opc);
+                           data_type, opc);
 #endif
 }
 
@@ -2345,40 +2328,26 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
     }
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg datalo, datahi, addrlo;
-    TCGReg addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc;
+    MemOp opc = get_memop(oi);
+
 #if defined(CONFIG_SOFTMMU)
-    int mem_index;
     tcg_insn_unit *label_ptr[2];
-#else
-    unsigned a_bits;
-#endif
 
-    datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-
-#if defined(CONFIG_SOFTMMU)
-    mem_index = get_mmuidx(oi);
-
-    tcg_out_tlb_load(s, addrlo, addrhi, mem_index, opc,
+    tcg_out_tlb_load(s, addrlo, addrhi, get_mmuidx(oi), opc,
                      label_ptr, offsetof(CPUTLBEntry, addr_write));
 
     /* TLB Hit.  */
     tcg_out_qemu_st_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, opc);
 
     /* Record the current context of a store into ldst label */
-    add_qemu_ldst_label(s, false, is64, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, data_type, oi, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
     }
@@ -2673,17 +2642,37 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, 0);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_ld(s, a0, -1, a1, a2, args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, 1);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_ld(s, a0, a1, a2, -1, args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_ld(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
+        }
         break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st8_i32:
-        tcg_out_qemu_st(s, args, 0);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_st(s, a0, -1, a1, a2, args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, 1);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_st(s, a0, a1, a2, -1, args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_st(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
+        }
         break;
 
     OP_32_64(mulu2):
-- 
2.34.1


