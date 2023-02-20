Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C4E69D307
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:46:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB6l-0004gk-5l; Mon, 20 Feb 2023 13:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6P-0004XC-Ub
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:30 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6K-00047Y-VI
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:28 -0500
Received: by mail-pj1-x1036.google.com with SMTP id u10so2216719pjc.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIXIS3t5z4FrUcuj3cjvlhwZKUVcPBcWn7pb9lpLWrY=;
 b=O2amCHLZJRVcm7SZ+inlN/7UOKRT8bX2Jck5FhS6/ImGDeSpI0YclJ+gOl/rZympcG
 LCHmHLlH06X6oyAYR7R1WXe+BOSn90Z1BQ4N19wbzEFDAwF73XB70JD3BSbAizo+BpqG
 4Ea+1Pjv2yOb2W2q5WcsH9yCAmKfcZOd1JLBoyKqhW5cGEETwUBIUauEpPOuccH8MbcA
 +lWkk8YMskfARgjPZgzt3id207YKkTe+1m8ork56685lLBWlbFWK1HDWIVNEETG++2bt
 BsUwUrqq303A7sYlQoHTAOEFxkR7xlvfZ74XL3vkSSZE711UjHt0oD83izEg62gFhJde
 yCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OIXIS3t5z4FrUcuj3cjvlhwZKUVcPBcWn7pb9lpLWrY=;
 b=2KGu0h0RWnuqX/LrDLL7Vec50MsTA7QPOBf92aYhpx0SXYcSidzZUUpfl4UNVHUUuI
 j9uj4gNSazlP6GmvSwJfBYlxqK1SSd/32v6qo0lA2BzNg4f4Xzg7shyrB0VK9Chg3kuN
 2iUKKQpoklgfjUcl3eMycqvtm4chXrk8woDkejxfupKadjCSCewbKE0bIlTJJEPDU+mf
 Lc9SCBWWurnXav7SLJk9j1IrB9xmxWKF0L78/IBE8E+RRbkxUy05mDBx7dteZRfOuoWy
 zrrMsbNe/IyryqsLT3NRqzEEL+0kXaMus8IjL88ATOZ9cznEJ+mBkkNe7EEn9ObahxX/
 nHPg==
X-Gm-Message-State: AO0yUKWyWykdAN8i+tvuBcO6A3bq4Di9VYVy8md6FQUw8DokM86qYAU0
 h8iuvBxBWP6r0dBR0lhtTM36JNlAUcvSO2V17Lo=
X-Google-Smtp-Source: AK7set83XNNHkxEbDan/qsUnRoWjz/Un7yr4tJweVnQdmaoKgwqw+1HPDA/Mv8iTbPvZzLHaBBr5sg==
X-Received: by 2002:a17:903:1208:b0:19a:eb93:6165 with SMTP id
 l8-20020a170903120800b0019aeb936165mr3766797plh.22.1676918478428; 
 Mon, 20 Feb 2023 10:41:18 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 12/27] target/s390x: Use gen_psw_addr_disp in op_sam
Date: Mon, 20 Feb 2023 08:40:37 -1000
Message-Id: <20230220184052.163465-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Complicated because we may now require a runtime jump.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 40 +++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 9e60abe97d..506bde2c3f 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -3939,7 +3939,7 @@ static DisasJumpType op_sacf(DisasContext *s, DisasOps *o)
 static DisasJumpType op_sam(DisasContext *s, DisasOps *o)
 {
     int sam = s->insn->data;
-    TCGv_i64 tsam;
+    TCGLabel *fault = NULL;
     uint64_t mask;
 
     switch (sam) {
@@ -3954,20 +3954,36 @@ static DisasJumpType op_sam(DisasContext *s, DisasOps *o)
         break;
     }
 
-    /* Bizarre but true, we check the address of the current insn for the
-       specification exception, not the next to be executed.  Thus the PoO
-       documents that Bad Things Happen two bytes before the end.  */
-    if (s->base.pc_next & ~mask) {
-        gen_program_exception(s, PGM_SPECIFICATION);
-        return DISAS_NORETURN;
-    }
-    s->pc_tmp &= mask;
+    /*
+     * Bizarre but true, we check the address of the current insn for the
+     * specification exception, not the next to be executed.  Thus the PoO
+     * documents that Bad Things Happen two bytes before the end.
+     */
+    if (mask != -1) {
+        TCGv_i64 t = tcg_temp_new_i64();
+        fault = gen_new_label();
 
-    tsam = tcg_constant_i64(sam);
-    tcg_gen_deposit_i64(psw_mask, psw_mask, tsam, 31, 2);
+        gen_psw_addr_disp(s, t, 0);
+        tcg_gen_andi_i64(t, t, ~mask);
+        tcg_gen_brcondi_i64(TCG_COND_NE, t, 0, fault);
+        tcg_temp_free_i64(t);
+    }
+
+    update_cc_op(s);
+
+    tcg_gen_deposit_i64(psw_mask, psw_mask, tcg_constant_i64(sam), 31, 2);
+
+    gen_psw_addr_disp(s, psw_addr, s->ilen);
+    tcg_gen_andi_i64(psw_addr, psw_addr, mask);
 
     /* Always exit the TB, since we (may have) changed execution mode.  */
-    return DISAS_TOO_MANY;
+    tcg_gen_lookup_and_goto_ptr();
+
+    if (mask != -1) {
+        gen_set_label(fault);
+        gen_program_exception(s, PGM_SPECIFICATION);
+    }
+    return DISAS_NORETURN;
 }
 
 static DisasJumpType op_sar(DisasContext *s, DisasOps *o)
-- 
2.34.1


