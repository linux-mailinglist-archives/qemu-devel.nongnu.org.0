Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548046F51AB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:34:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6qp-0003Y8-9X; Wed, 03 May 2023 03:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qB-00029k-G8
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:58 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q9-0001jT-Ih
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f199696149so30179865e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098632; x=1685690632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ak1oi+0OJ9hM0oMQl1hyGWMjfjRQuNnmqtvvR61fyd4=;
 b=cvJ4JuMPXw0zozfyvSHP6Feet7hyml921Eaqh1VQKipXYbNrXv19d1BwprNvORr66L
 YxMKL8voEK3GVIWYDSweZ46Amj6fh/Vzfbl5gOjmdUsKaiDjv8aWWJrB0U8KFFaIWY+s
 DTfYosBFwS/MfgURfEwiQK7jZRHeRJIBOb2cbZRpmZcYC0UIsFhDsnsAnjsLDQpqhL5l
 z+Ued64i9QZfmBMVdQt8Rui/ikgEtktZp9dufuiY62zGUrNC5jkMn3zJJJDCcjnuh23I
 EN6qeV3a6/EA+1rE39GUMLjl8Q6BnPcmYJLj89oX42hmPhaxrZ7xWgymtMfKrDM/kWXX
 zkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098632; x=1685690632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ak1oi+0OJ9hM0oMQl1hyGWMjfjRQuNnmqtvvR61fyd4=;
 b=dUCs8YbenmLklMlmRDOu3QrE9asSy3ZzUbvEioVMBIJ/cy+aw5mNZgUoRzNAk8EFeN
 1yH9NGiduizDvG6AZulrV1J/le5+QtgXyyUHdl72BRZWguqHyTbT3hk9LNX4XjM50lBh
 F8nS32rxXO1AM4P/pf28Xoxqu/3Sf1+whhmgk0UBepuYk/MnkllrgdN9dG931v/3UDpX
 6b5SwNAdLRfPT0dTdH6yEddnmv57zgaeIkjiWjIVCzw81gs6s5E8hIIvD48nj+COzUJO
 nnY5DiTXt3JJE2NAB5j3NnjoENMHELmo0T4X3bsqs82q+kpaoU1E7sV8CaVIzOjhV041
 WEZg==
X-Gm-Message-State: AC+VfDyFQAK8opKxZo5kTyewt7FKjkIRJZpBxFaeeb+33iNjPPM92aHH
 90C+PtytukAL3C8pgBfmg4jPoeUFuZ06E20OaMmk2g==
X-Google-Smtp-Source: ACHHUZ6wCEdtCHtkidNSgDJbKdG1SSeUKPEcSaMT3UnqdfERQm0wrizHaosKpu+5rTlqCLz1RDWVug==
X-Received: by 2002:a7b:cd10:0:b0:3f2:5999:4f36 with SMTP id
 f16-20020a7bcd10000000b003f259994f36mr14307820wmj.14.1683098632113; 
 Wed, 03 May 2023 00:23:52 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 24/84] tcg/mips: Remove TARGET_LONG_BITS, TCG_TYPE_TL
Date: Wed,  3 May 2023 08:22:31 +0100
Message-Id: <20230503072331.1747057-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

All uses replaced with TCGContext.addr_type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 42 +++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 901fe023d9..c7cc642a84 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -354,10 +354,6 @@ typedef enum {
     /* Aliases for convenience.  */
     ALIAS_PADD     = sizeof(void *) == 4 ? OPC_ADDU : OPC_DADDU,
     ALIAS_PADDI    = sizeof(void *) == 4 ? OPC_ADDIU : OPC_DADDIU,
-    ALIAS_TSRL     = TARGET_LONG_BITS == 32 || TCG_TARGET_REG_BITS == 32
-                     ? OPC_SRL : OPC_DSRL,
-    ALIAS_TADDI    = TARGET_LONG_BITS == 32 || TCG_TARGET_REG_BITS == 32
-                     ? OPC_ADDIU : OPC_DADDIU,
 } MIPSInsn;
 
 /*
@@ -1157,6 +1153,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                                            TCGReg addrlo, TCGReg addrhi,
                                            MemOpIdx oi, bool is_ld)
 {
+    TCGType addr_type = s->addr_type;
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
     MemOp a_bits, atom_u;
@@ -1192,23 +1189,26 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP1, TCG_AREG0, table_off);
 
     /* Extract the TLB index from the address into TMP3.  */
-    tcg_out_opc_sa(s, ALIAS_TSRL, TCG_TMP3, addrlo,
-                   TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+    if (TCG_TARGET_REG_BITS == 32 || addr_type == TCG_TYPE_I32) {
+        tcg_out_opc_sa(s, OPC_SRL, TCG_TMP3, addrlo,
+                       TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+    } else {
+        tcg_out_dsrl(s, TCG_TMP3, addrlo,
+                     TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+    }
     tcg_out_opc_reg(s, OPC_AND, TCG_TMP3, TCG_TMP3, TCG_TMP0);
 
     /* Add the tlb_table pointer, creating the CPUTLBEntry address in TMP3.  */
     tcg_out_opc_reg(s, ALIAS_PADD, TCG_TMP3, TCG_TMP3, TCG_TMP1);
 
-    /* Load the (low-half) tlb comparator.  */
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
-    } else {
-        tcg_out_ld(s, TCG_TYPE_TL, TCG_TMP0, TCG_TMP3, cmp_off);
-    }
-
-    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS == 64 || addr_type == TCG_TYPE_I32) {
+        /* Load the tlb comparator.  */
+        tcg_out_ld(s, addr_type, TCG_TMP0, TCG_TMP3, cmp_off);
         /* Load the tlb addend for the fast path.  */
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP3, TCG_TMP3, add_off);
+    } else {
+        /* Load the low half of the tlb comparator.  */
+        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
     }
 
     /*
@@ -1216,16 +1216,20 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * For unaligned accesses, compare against the end of the access to
      * verify that it does not cross a page boundary.
      */
-    tcg_out_movi(s, TCG_TYPE_TL, TCG_TMP1, TARGET_PAGE_MASK | a_mask);
+    tcg_out_movi(s, addr_type, TCG_TMP1, TARGET_PAGE_MASK | a_mask);
     if (a_mask < s_mask) {
-        tcg_out_opc_imm(s, ALIAS_TADDI, TCG_TMP2, addrlo, s_mask - a_mask);
+        if (TCG_TARGET_REG_BITS == 32 || addr_type == TCG_TYPE_I32) {
+            tcg_out_opc_imm(s, OPC_ADDIU, TCG_TMP2, addrlo, s_mask - a_mask);
+        } else {
+            tcg_out_opc_imm(s, OPC_DADDIU, TCG_TMP2, addrlo, s_mask - a_mask);
+        }
         tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, TCG_TMP2);
     } else {
         tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrlo);
     }
 
     /* Zero extend a 32-bit guest address for a 64-bit host. */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS == 64 && addr_type == TCG_TYPE_I32) {
         tcg_out_ext32u(s, TCG_TMP2, addrlo);
         addrlo = TCG_TMP2;
     }
@@ -1234,7 +1238,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_opc_br(s, OPC_BNE, TCG_TMP1, TCG_TMP0);
 
     /* Load and test the high half tlb comparator.  */
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS == 32 && addr_type != TCG_TYPE_I32) {
         /* delay slot */
         tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + HI_OFF);
 
@@ -1271,7 +1275,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     }
 
     base = addrlo;
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS == 64 && addr_type == TCG_TYPE_I32) {
         tcg_out_ext32u(s, TCG_REG_A0, base);
         base = TCG_REG_A0;
     }
-- 
2.34.1


