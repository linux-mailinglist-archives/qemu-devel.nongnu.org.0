Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A40B3703078
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:48:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIl-000132-Fj; Mon, 15 May 2023 10:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHc-00077s-RN
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:47 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHY-0004zZ-5Q
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:39 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1aad55244b7so97900595ad.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161215; x=1686753215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEsWAFpnCMYNqvb5yhVEEwYFWaIpTnBv29asu3C8fXA=;
 b=viSPRN0bskYGKCe2vB2bTfhdcgLJEJpOZaEnEi5JqLgZuweOECFo2l5Dos3y86egFz
 PBDVbiFnFyNvJycmieq330p4un91Rmk52Zwl+zTTx3qASF0xwfy8shhNsDpaKFhCSeWm
 CIS0WiCEQQZuD8xwTFRWpsT569BTFPSgzYYRS0ENkDz7xmSbPewN+G32e5tvfdrADV6w
 hr5q3qQ/lLpM9IuRQ7GbsD4MOP5Wb1JpbxgBnd8zCCR3BuyFqd7+M0QhoMMAhm/n2psF
 edJeb/zUCFrW9G18TYBUEMkZFG0kNBDxUvkUVGQ4L0A0bV0F/ddjYA4N9dPiBzrfp29Y
 VWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161215; x=1686753215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PEsWAFpnCMYNqvb5yhVEEwYFWaIpTnBv29asu3C8fXA=;
 b=RqYWBtJvqq+JmfYgfeGWevg/EJESRqfBFKu56x6bvVI05BO/kWbU0XEzFaCnh/VKJO
 b6V/HJY0rFdi8uj4Arp0868PAEFyYPCvcyKRtwigGgq8HHGojgsTVYpXrEzOrromk9g5
 CUA2P7CaRh5jqRZgB3vMt5nJ31xIOwLLxKOOuT+FeEorNZf0YPB0G7M3Wy2Cuhr6r5uL
 hvva1zDQuGCD8ObBOeUKP+I2KZg/vUs2kWatx2uvYWWwy21kyEvbujhLi8mpPcvIZ6rW
 l7wQYFp5VMQUhvWUKfIE0dzAMnRvEheOdAkM/quTrYxD+wBAfZ4RfZFg0UQC6QeaaXkC
 uAyA==
X-Gm-Message-State: AC+VfDyIhJRlmXR5ejjGw3G6/X/oxRDJ39uQ5sLNDDof1T0hxbVwqbAU
 4LIh4atf3Wx1u1gLV48e4r7g6wjpqP8eOLIybTc=
X-Google-Smtp-Source: ACHHUZ7oVBP/EEmJX9rnOrPUiG0B7Fq2N1szvJG1OSmIs1ONvCcahXVuOY9kQbko/HYDkhC0Owwr+g==
X-Received: by 2002:a17:903:1205:b0:1ac:6d4c:c26a with SMTP id
 l5-20020a170903120500b001ac6d4cc26amr35717447plh.14.1684161214925; 
 Mon, 15 May 2023 07:33:34 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 23/54] tcg/s390x: Use full load/store helpers in user-only
 mode
Date: Mon, 15 May 2023 07:32:42 -0700
Message-Id: <20230515143313.734053-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 968977be98..de8aed5f77 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1679,7 +1679,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
     }
 }
 
-#if defined(CONFIG_SOFTMMU)
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 1, .tmp = { TCG_TMP0 }
 };
@@ -1716,34 +1715,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!patch_reloc(l->label_ptr[0], R_390_PC16DBL,
-                     (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R3, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R14, (uintptr_t)l->raddr);
-    tgen_gotoi(s, S390_CC_ALWAYS, (const void *)(l->is_ld ? helper_unaligned_ld
-                                                 : helper_unaligned_st));
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-#endif /* CONFIG_SOFTMMU */
 
 /*
  * For softmmu, perform the TLB load and compare.
-- 
2.34.1


