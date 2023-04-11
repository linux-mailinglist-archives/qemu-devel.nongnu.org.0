Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B344F6DCF06
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:16:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2Ww-0006X8-SL; Mon, 10 Apr 2023 21:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wm-0005ot-Dt
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:10:32 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wf-00029w-RW
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:10:32 -0400
Received: by mail-pj1-x102a.google.com with SMTP id c3so7312796pjg.1
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xQBNu8V+ZGC47olucQpF77r7JB5TGZB02URjduX3yP4=;
 b=SMrNm8TCmw6Fkrh+IvWmqANJfS9+PbjJ0Czx65AEZSAqu6BUcFtO9BKIdKbkZ5LoCk
 JCV/NNSgzE3XggjAwABhJDEObMzHzgqmUn02wARmVVNS6HZzI6CRlRLAi+91HwiBxK7w
 Z1N48ft/61aaBUuBBKMbKuRYw9ML1TFIqQf3K8GbMUZStpzHpo0hum6TeM4VH9mR7fE6
 ljLfDXEk8RejOZCiz+QBPJwEEojOk8BA7Q7WQw7Ob/U+ZK7vgE95ITWJNFpPD27GXayT
 UOoLkHQNB6YQa6fKyDtwHyBxQX39ytvAB/znULY6d6wCXzt4lBLzqBSvo5KR+s+EW0ib
 HbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQBNu8V+ZGC47olucQpF77r7JB5TGZB02URjduX3yP4=;
 b=s5Mx3Agf3RIZHWKzJOAfy/c3DKmfu37gftnuIMJZIVmLRmYdS04misaWjAv6z/pHU9
 prRZseoh/xnPzkikz71aZf/aO3WHvDaF2VyPnb37n0BJ0D2hznH66F3/S5fShfm/CQCu
 AASQuEMHEyQdtoUGyQFMz+4I3HLtLb4PknjxwD/kdJ4i/5s3/9EvYTilgV9L3r50cLeR
 WNuewzKD1CBFkqLygYl4I9mIXcL+EKzpqq6CFURLCfwT1kc0uwmfdADoyKACNBOSd/XG
 89fW3ke7ah3wxhTv451CVnxneyT3HGUVvcI+gBgbN1RwENwlnkBOlIQQlZI8U8A9T/aB
 irJA==
X-Gm-Message-State: AAQBX9fsy0PUXtEGiVsW5zbC1qaqT/FhkFN1ORPeWoENpBhiINr8ccMf
 b/5qndn/BwBx8064osHB/avumiNNmkgZ5Exo+sgHVA==
X-Google-Smtp-Source: AKy350ZwOCa2OljDm/D7Md0bhXDbPBzA4/T3DpNBTlLSIRHIUFeiz5lWfLe96TQLdXyM7sr4yPwKug==
X-Received: by 2002:a17:902:a701:b0:1a1:f5dd:2dd5 with SMTP id
 w1-20020a170902a70100b001a1f5dd2dd5mr974710plq.13.1681175424411; 
 Mon, 10 Apr 2023 18:10:24 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 53/54] tcg/s390x: Use ALGFR in constructing host address
 for qemu_ld/st
Date: Mon, 10 Apr 2023 18:05:11 -0700
Message-Id: <20230411010512.5375-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Rather than zero-extend the guest address into a register,
use an add instruction which zero-extends the second input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 6d7b056931..42d3e13e08 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -149,6 +149,7 @@ typedef enum S390Opcode {
     RRE_ALGR    = 0xb90a,
     RRE_ALCR    = 0xb998,
     RRE_ALCGR   = 0xb988,
+    RRE_ALGFR   = 0xb91a,
     RRE_CGR     = 0xb920,
     RRE_CLGR    = 0xb921,
     RRE_DLGR    = 0xb987,
@@ -1716,8 +1717,10 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 19));
 
-/* Load and compare a TLB entry, leaving the flags set.  Loads the TLB
-   addend into R2.  Returns a register with the santitized guest address.  */
+/*
+ * Load and compare a TLB entry, leaving the flags set.
+ * Loads the TLB addend and returns the register.
+ */
 static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
                                int mem_index, bool is_ld)
 {
@@ -1761,12 +1764,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
 
     tcg_out_insn(s, RXY, LG, TCG_REG_R2, TCG_REG_R2, TCG_REG_NONE,
                  offsetof(CPUTLBEntry, addend));
-
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
-        return TCG_REG_R3;
-    }
-    return addr_reg;
+    return TCG_REG_R2;
 }
 
 static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
@@ -1892,16 +1890,20 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
-    TCGReg base_reg;
+    TCGReg addend;
 
-    base_reg = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 1);
+    addend = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 1);
 
     tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
     label_ptr = s->code_ptr;
     s->code_ptr += 1;
 
-    tcg_out_qemu_ld_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
-
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_insn(s, RRE, ALGFR, addend, addr_reg);
+        tcg_out_qemu_ld_direct(s, opc, data_reg, addend, TCG_REG_NONE, 0);
+    } else {
+        tcg_out_qemu_ld_direct(s, opc, data_reg, addend, addr_reg, 0);
+    }
     add_qemu_ldst_label(s, 1, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else
@@ -1924,16 +1926,20 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
-    TCGReg base_reg;
+    TCGReg addend;
 
-    base_reg = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 0);
+    addend = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 0);
 
     tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
     label_ptr = s->code_ptr;
     s->code_ptr += 1;
 
-    tcg_out_qemu_st_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
-
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_insn(s, RRE, ALGFR, addend, addr_reg);
+        tcg_out_qemu_st_direct(s, opc, data_reg, addend, TCG_REG_NONE, 0);
+    } else {
+        tcg_out_qemu_st_direct(s, opc, data_reg, addend, addr_reg, 0);
+    }
     add_qemu_ldst_label(s, 0, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else
-- 
2.34.1


