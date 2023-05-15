Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E33703031
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:42:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZJe-0004Vh-51; Mon, 15 May 2023 10:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHl-0007Ck-VO
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:50 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHc-00052A-Io
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:49 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1aae5c2423dso124343345ad.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161222; x=1686753222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4qhfCxW8nZ+AIzOPAndxpM5sZuukyWLZqrgdNp4ChwI=;
 b=JbczjSV8D2Dsp7LYY84GHTuQ3Oy/4SRTkgrexRE+8nhY9plFDJKp8YsoDG8+R6HbZA
 GmaUC7r0nllv3Hu8IesnALOV+QdmW12viR9uOsGgQizupqefhYuO+uTf2NW3o8Lce3QB
 8Y0hTYFdVZm/nE3mVLFLxH/k9koK3kO9WkCvuBK/r9z77dbKK3J/EXLrl/MybjsP86o9
 DWqCAnU+J5nvaDzlkqErNJoqqEgG3CYjajh65yK43nGN5kP3KR1XENxVJn4vg/d0kvsk
 TOndX5zt4/OdrHtCZAVJvfCVYm8Q/rbyPrWexs016beH5tgf2Q66HPRkt1CmNb/GEhc7
 +iXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161222; x=1686753222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4qhfCxW8nZ+AIzOPAndxpM5sZuukyWLZqrgdNp4ChwI=;
 b=IEuuEeA7s+J72oqqxJhAfsT7wF22Dz8nQ1Qtb2zhtW39RspYAUBUKnFeFnLr2u14aP
 q3MZ5bnFUS08Sz91Bt2go9CSnLsvCra+2UbTO9eYFjIsl2f6RV7B8EqdI0rJx9n+RXdO
 5NblMcEKMLDP9hMy2PTduplEXQ4OqsR3BAwDUXciZWUoBPgHKp/7bULQ7gdEQauYEvyi
 rqt/WUddeGaBYsT0570YOOKv8h4vmlUJy6CNm+jRr72gpGR//HeTe1VTDcS0tKYNhB1u
 QbOLyBvA5mz2n0ekP0d//CyEYvSJd+lcPowTDrE9uWN/X2x0N2DiLtVW3adTJuPvcwxU
 COAQ==
X-Gm-Message-State: AC+VfDzu7sejBLmDSopgBaDBAxXD5ZzmL8apneSClWLZxS+cvUWlkgwx
 6aAGSjLyb8xazEvzH25DpzMbY90Ep7UbZwkZNBM=
X-Google-Smtp-Source: ACHHUZ4J9Hkx8RN/E6MvjKq7HgsNphYC/WSJLI4BNGfhoTE7hUXgLny+4LN9LstzSnqfabjKLQsHhQ==
X-Received: by 2002:a17:902:b593:b0:1ad:ea13:1918 with SMTP id
 a19-20020a170902b59300b001adea131918mr10339312pls.69.1684161222326; 
 Mon, 15 May 2023 07:33:42 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 32/54] tcg/loongarch64: Support softmmu unaligned accesses
Date: Mon, 15 May 2023 07:32:51 -0700
Message-Id: <20230515143313.734053-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Test the final byte of an unaligned access.
Use BSTRINS.D to clear the range of bits, rather than AND.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 33d8e67513..7d0165349d 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -848,7 +848,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
     int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
     int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
-    tcg_target_long compare_mask;
 
     ldst = new_ldst_label(s);
     ldst->is_ld = is_ld;
@@ -872,14 +871,20 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
                offsetof(CPUTLBEntry, addend));
 
-    /* We don't support unaligned accesses.  */
+    /*
+     * For aligned accesses, we check the first byte and include the alignment
+     * bits within the address.  For unaligned access, we check that we don't
+     * cross pages using the address of the last byte of the access.
+     */
     if (a_bits < s_bits) {
-        a_bits = s_bits;
+        unsigned a_mask = (1u << a_bits) - 1;
+        unsigned s_mask = (1u << s_bits) - 1;
+        tcg_out_addi(s, TCG_TYPE_TL, TCG_REG_TMP1, addr_reg, s_mask - a_mask);
+    } else {
+        tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_TMP1, addr_reg);
     }
-    /* Clear the non-page, non-alignment bits from the address.  */
-    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
-    tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
-    tcg_out_opc_and(s, TCG_REG_TMP1, TCG_REG_TMP1, addr_reg);
+    tcg_out_opc_bstrins_d(s, TCG_REG_TMP1, TCG_REG_ZERO,
+                          a_bits, TARGET_PAGE_BITS - 1);
 
     /* Compare masked address with the TLB entry.  */
     ldst->label_ptr[0] = s->code_ptr;
-- 
2.34.1


