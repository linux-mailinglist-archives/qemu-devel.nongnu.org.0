Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1525F4282BD
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 19:49:56 +0200 (CEST)
Received: from localhost ([::1]:36046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZcxO-0006EL-Ji
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 13:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcs9-0000aC-RV
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:30 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:37755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcs2-0006Ay-1t
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:29 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 oa6-20020a17090b1bc600b0019ffc4b9c51so12957389pjb.2
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 10:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SlW+IUqmPo07UfsLUjSBetG4k12I6tcttGhU4k9emPg=;
 b=M89zMZ5mN6x1x8O+7HfSa7VatIQ7T4b4DKRP3Z59lPTc9OK8F9692vFF01YtJgODQ7
 r0ytrzf6u4yFWdbvAnlU4GkdHcKD4RCzRqraZtix7kGLBPn+Hy4mQxzkIgxbdNF7UQRR
 dDDcJq1BmNgKQr5Uglk48oet2hFAFCYsmEDbp2R5lLjbd0GINt/a6E+GzjYnBO+H1mql
 KApP4EcVZegvyYKfDEBvVJbchTeMOlqeMGyuiidjGoqwTVu7W9gkbEeNeDT/rh2q5AP/
 nt+1xkuTlpE/hX41VaFyqcUC2e//zoQf5JYKC7zpdFjsbph6tJLJobqHjkPghHA2S9iu
 xejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SlW+IUqmPo07UfsLUjSBetG4k12I6tcttGhU4k9emPg=;
 b=GHlXjfMh/WL9vcIdb96l5xet0lBKTamDUOkezANW2ugmnPZvFM5BzmEq6TP9oEz39L
 PKq34+GTPKx0L8KS0YzDh1pNuLQOlufdxulWQVremEiwgs8SjAbnz49bwE6HMGWTokVa
 kzZef86cYlW9VpKFrnLm2jBjKAR9uMQfCngjGTjbAYR6uHs/EHodxqIMciabKIwN35Qg
 clbgG8A9Ta+bd34AyFnFcNJ0an5bxPmiJiSDED7xNQLa6FzSda/A/XQDkiGWmK13JscL
 sKFrl34nIPAacb8nj23P5gQ/re3MZaNT/kXnnLb4sXnTrfeTr9kRY/CwwXfBrgKnw9A7
 mfIg==
X-Gm-Message-State: AOAM532Vq0ufmYRCAexxpwiijBsXHfggeChUhm07yOgl+OCzSPYzcFvd
 scvFFfi6U0GT7iXepsvOF+Qbtc+Wi+SnfgNf
X-Google-Smtp-Source: ABdhPJyz10noCkViOt84QDANrYVo2Nn9p7V6WLnWPmat3Cl4yzm/1er6oTnVf5xkx9+RiV7Z/fVsAA==
X-Received: by 2002:a17:903:41d0:b0:13f:1bbf:1535 with SMTP id
 u16-20020a17090341d000b0013f1bbf1535mr11379365ple.52.1633887859637; 
 Sun, 10 Oct 2021 10:44:19 -0700 (PDT)
Received: from localhost.localdomain (068-185-026-038.biz.spectrum.com.
 [68.185.26.38])
 by smtp.gmail.com with ESMTPSA id 18sm5095391pfh.115.2021.10.10.10.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 10:44:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] target/mips: Support TCG_TARGET_SIGNED_ADDR32
Date: Sun, 10 Oct 2021 10:44:00 -0700
Message-Id: <20211010174401.141339-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211010174401.141339-1-richard.henderson@linaro.org>
References: <20211010174401.141339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All 32-bit mips operations sign-extend the output, so we are easily
able to keep TCG_TYPE_I32 values sign-extended in host registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target-sa32.h |  8 ++++++++
 tcg/mips/tcg-target.c.inc  | 13 +++----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/tcg/mips/tcg-target-sa32.h b/tcg/mips/tcg-target-sa32.h
index cb185b1526..51255e7cba 100644
--- a/tcg/mips/tcg-target-sa32.h
+++ b/tcg/mips/tcg-target-sa32.h
@@ -1 +1,9 @@
+/*
+ * Do not set TCG_TARGET_SIGNED_ADDR32 for mips32;
+ * TCG expects this to only be set for 64-bit hosts.
+ */
+#ifdef __mips64
+#define TCG_TARGET_SIGNED_ADDR32 1
+#else
 #define TCG_TARGET_SIGNED_ADDR32 0
+#endif
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index d8f6914f03..cc3b4d5b90 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1161,20 +1161,13 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
         tcg_out_ld(s, TCG_TYPE_I32, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
         tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, mask);
     } else {
-        tcg_out_ldst(s, (TARGET_LONG_BITS == 64 ? OPC_LD
-                         : TCG_TARGET_REG_BITS == 64 ? OPC_LWU : OPC_LW),
-                     TCG_TMP0, TCG_TMP3, cmp_off);
+        tcg_out_ld(s, TCG_TYPE_TL, TCG_TMP0, TCG_TMP3, cmp_off);
         tcg_out_movi(s, TCG_TYPE_TL, TCG_TMP1, mask);
         /* No second compare is required here;
            load the tlb addend for the fast path.  */
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
     }
 
-    /* Zero extend a 32-bit guest address for a 64-bit host. */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addrl);
-        addrl = base;
-    }
     tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
 
     label_ptr[0] = s->code_ptr;
@@ -1456,7 +1449,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
@@ -1559,7 +1552,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
                         s->code_ptr, label_ptr);
 #else
     base = TCG_REG_A0;
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
-- 
2.25.1


