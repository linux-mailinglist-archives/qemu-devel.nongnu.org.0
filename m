Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CB06F8B09
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:29:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vT-0000mi-Su; Fri, 05 May 2023 17:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vN-0000im-EN
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vG-0004Su-BN
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:08 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2f9b9aa9d75so1537675f8f.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321901; x=1685913901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6nk5/t6hIQSKL184WGvYaEyCfzzvv964RsZWo7l2GI=;
 b=cGMRD4iy0O/rwkLcRaGC1EdhTJVNlb3mL/xtLENVwtwwo6b681rW7vSvrGiDanlV8k
 xdTjXphZPw+KM2O5JPTlx6UY49/SkO6HMVWDFWMs5pJFKn6GdvsVLv4ZFslCpPeEjYGT
 rWmZZ5Ocj372ocdiE2Oxwspi7UEBygyPP2rdvyo5d+pgizYwJScWQFM+wqXca8GirR31
 Bl4qq46sS5BtS+TEw9au27nBDWKNmRmmU68ejsL3jXr/bk0EmcXPZh9huhuLuYALZQWn
 69jTu1In5T5bJzQiADwvR8aaZNx+FAaYW8iPL4IrJqTFEUfhIu1infzVWHUoGnck2i8N
 UCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321901; x=1685913901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x6nk5/t6hIQSKL184WGvYaEyCfzzvv964RsZWo7l2GI=;
 b=iOwEPjOvpeUwspxM9tZ/nMT67dsFy4npyKN/doVOFzp9vq+2IzUwUA/PhXVqjsHlPY
 vXR28Jv+FP6lqde4m3TK10oGDNQq/c9zkrAQvD31vNnBmQJHIQ48ItfuJBJU/BMdqLBQ
 752bw4Pp2yTMwniJuW0PGB8yXP3zjoJIWLp0RMmJyuwUtH1pcafd5VhgUxHy5fkzUjtt
 +vAX0dRSQ3VGe9p3wQwcXteiyKkaafM9o07wFcmMs4UyuP4X1kY51J30BQtBEDJDqkq1
 uaoj6nipVqzSxZkBKtydnU7m1oqYS/Yo2oYirph+gHaY6SOwyHelkQtALKoZRZsX6jfn
 qlHw==
X-Gm-Message-State: AC+VfDxcOyCp0PiHMcdNAYFaLU8BoVVNnQWdotZPJVwRYRfDAnB5M8Va
 TLdRR+nOBGAPVKUPAhxi7Ig/PSEJXozE1k1HuyfQpw==
X-Google-Smtp-Source: ACHHUZ7/Ybqe3ajJ+ejzg7//uKwhHUWbIGSFCZAH4OeHxEPo6fBsoctENvFQvNSYUWeVTBpy08UGrQ==
X-Received: by 2002:a5d:6711:0:b0:306:39f5:e1a8 with SMTP id
 o17-20020a5d6711000000b0030639f5e1a8mr2190075wru.14.1683321900979; 
 Fri, 05 May 2023 14:25:00 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:25:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 22/42] tcg/i386: Drop r0+r1 local variables from
 tcg_out_tlb_load
Date: Fri,  5 May 2023 22:24:27 +0100
Message-Id: <20230505212447.374546-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Use TCG_REG_L[01] constants directly.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 909eecd4a3..78160f453b 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1810,8 +1810,6 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
                                     int mem_index, MemOp opc,
                                     tcg_insn_unit **label_ptr, int which)
 {
-    const TCGReg r0 = TCG_REG_L0;
-    const TCGReg r1 = TCG_REG_L1;
     TCGType ttype = TCG_TYPE_I32;
     TCGType tlbtype = TCG_TYPE_I32;
     int trexw = 0, hrexw = 0, tlbrexw = 0;
@@ -1835,15 +1833,15 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
         }
     }
 
-    tcg_out_mov(s, tlbtype, r0, addrlo);
-    tcg_out_shifti(s, SHIFT_SHR + tlbrexw, r0,
+    tcg_out_mov(s, tlbtype, TCG_REG_L0, addrlo);
+    tcg_out_shifti(s, SHIFT_SHR + tlbrexw, TCG_REG_L0,
                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
 
-    tcg_out_modrm_offset(s, OPC_AND_GvEv + trexw, r0, TCG_AREG0,
+    tcg_out_modrm_offset(s, OPC_AND_GvEv + trexw, TCG_REG_L0, TCG_AREG0,
                          TLB_MASK_TABLE_OFS(mem_index) +
                          offsetof(CPUTLBDescFast, mask));
 
-    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, r0, TCG_AREG0,
+    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, TCG_REG_L0, TCG_AREG0,
                          TLB_MASK_TABLE_OFS(mem_index) +
                          offsetof(CPUTLBDescFast, table));
 
@@ -1851,19 +1849,21 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
        copy the address and mask.  For lesser alignments, check that we don't
        cross pages for the complete access.  */
     if (a_bits >= s_bits) {
-        tcg_out_mov(s, ttype, r1, addrlo);
+        tcg_out_mov(s, ttype, TCG_REG_L1, addrlo);
     } else {
-        tcg_out_modrm_offset(s, OPC_LEA + trexw, r1, addrlo, s_mask - a_mask);
+        tcg_out_modrm_offset(s, OPC_LEA + trexw, TCG_REG_L1,
+                             addrlo, s_mask - a_mask);
     }
     tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
-    tgen_arithi(s, ARITH_AND + trexw, r1, tlb_mask, 0);
+    tgen_arithi(s, ARITH_AND + trexw, TCG_REG_L1, tlb_mask, 0);
 
-    /* cmp 0(r0), r1 */
-    tcg_out_modrm_offset(s, OPC_CMP_GvEv + trexw, r1, r0, which);
+    /* cmp 0(TCG_REG_L0), TCG_REG_L1 */
+    tcg_out_modrm_offset(s, OPC_CMP_GvEv + trexw,
+                         TCG_REG_L1, TCG_REG_L0, which);
 
     /* Prepare for both the fast path add of the tlb addend, and the slow
        path function argument setup.  */
-    tcg_out_mov(s, ttype, r1, addrlo);
+    tcg_out_mov(s, ttype, TCG_REG_L1, addrlo);
 
     /* jne slow_path */
     tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
@@ -1871,8 +1871,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
     s->code_ptr += 4;
 
     if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-        /* cmp 4(r0), addrhi */
-        tcg_out_modrm_offset(s, OPC_CMP_GvEv, addrhi, r0, which + 4);
+        /* cmp 4(TCG_REG_L0), addrhi */
+        tcg_out_modrm_offset(s, OPC_CMP_GvEv, addrhi, TCG_REG_L0, which + 4);
 
         /* jne slow_path */
         tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
@@ -1882,8 +1882,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
 
     /* TLB Hit.  */
 
-    /* add addend(r0), r1 */
-    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, r1, r0,
+    /* add addend(TCG_REG_L0), TCG_REG_L1 */
+    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, TCG_REG_L1, TCG_REG_L0,
                          offsetof(CPUTLBEntry, addend));
 }
 
-- 
2.34.1


