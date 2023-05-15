Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68038703041
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:43:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZLJ-0007cT-So; Mon, 15 May 2023 10:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJx-0005P9-1i
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:08 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJo-00060d-7d
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:04 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1ab0c697c2bso118636415ad.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161414; x=1686753414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDknFLWtWBKU8G+ToympZ5KLvdGdhGS895Fc1ZFjry8=;
 b=B5v3PTguSldXGeu30WDAIeCNkBRB28ND45sg9u5HXN09yfvTYoHqabv5Sq+pVW5Ox1
 ApKE5w0rKfsEd3eHzWi0ju1hx7c8g0wLbl5G3ivYIa0ogpYPTF2DpLv0Ag8w8obCHAGc
 7ahq/EaNKj/iKSKvflg50Baf2gBUrgABone1t96SAc4mTPinvO4IS1FRejf11KJHOg19
 97uLpKu1g4DMhL8iwgqScMBxOAZC3O9UQI4KLLjmSCCJY0bBtq1havGkM4j38HUCD7nr
 A32cu5mbYjYQ9CdJA9L9SIZoK+BYG2e+RqaMscPRpdG987XCpvl+J5osaPzjPyF8Xi4M
 CmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161414; x=1686753414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NDknFLWtWBKU8G+ToympZ5KLvdGdhGS895Fc1ZFjry8=;
 b=GLmO6j5ce9Ui3HTXAJ1sbvDS2LpkLkxRgaViHZoQC5ysoRQjLI1EbWvZNkuwRFCpPa
 xfl6E66gI/uLTwzOnFfaWIBGvRFZDAXNGjEc3sxoFAq3R98/Oesl7InzEDIzWjQ6dY+o
 1+tnHXbYREIfEzACKBLctDb7vDtszWR+vPhtf/8fKftE3pSCPINHfSA459vCdnjufTb/
 KdzWDP65fQAt7IkHfPLfvnxmPSLPgMc/gpgvshQKIItcg6rRaihggxiPNlyDvkJ5Od5c
 XfQvcVqMuyTbrTlpB0n3MEbd7ycOeoY54thkI+ifStu66mEoJLdohoPnWeiRWZ1JJR4w
 +zbg==
X-Gm-Message-State: AC+VfDwV3IDhxA8Hx0ym8Y2D797bQTCt12wsDAnmoD/ewT/W2EDZ6JOv
 hkEa7pYEryndulIZcQSWY/iadiwMxXBmPYEYQqM=
X-Google-Smtp-Source: ACHHUZ4lexrsIdwTnM5gyTW+1pgfiawypzuJp9Wl7MMHpBXGhnFA+euD1E0RpqSZSz1ow1ksGpJBrQ==
X-Received: by 2002:a17:903:24e:b0:1ac:3b6f:c141 with SMTP id
 j14-20020a170903024e00b001ac3b6fc141mr41845261plh.11.1684161414745; 
 Mon, 15 May 2023 07:36:54 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 47/54] tcg/s390x: Use atom_and_align_for_opc
Date: Mon, 15 May 2023 07:33:06 -0700
Message-Id: <20230515143313.734053-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 22f0206b5a..8e34b214fc 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1572,6 +1572,7 @@ typedef struct {
     TCGReg base;
     TCGReg index;
     int disp;
+    TCGAtomAlign aa;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1733,8 +1734,10 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    unsigned a_mask;
+
+    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, false);
+    a_mask = (1 << h->aa.align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
@@ -1764,7 +1767,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * bits within the address.  For unaligned access, we check that we don't
      * cross pages using the address of the last byte of the access.
      */
-    a_off = (a_bits >= s_bits ? 0 : s_mask - a_mask);
+    a_off = (a_mask >= s_mask ? 0 : s_mask - a_mask);
     tlb_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
     if (a_off == 0) {
         tgen_andi_risbg(s, TCG_REG_R0, addr_reg, tlb_mask);
@@ -1806,7 +1809,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         ldst->addrlo_reg = addr_reg;
 
         /* We are expecting a_bits to max out at 7, much lower than TMLL. */
-        tcg_debug_assert(a_bits < 16);
+        tcg_debug_assert(a_mask <= 0xffff);
         tcg_out_insn(s, RI, TMLL, addr_reg, a_mask);
 
         tcg_out16(s, RI_BRC | (7 << 4)); /* CC in {1,2,3} */
-- 
2.34.1


