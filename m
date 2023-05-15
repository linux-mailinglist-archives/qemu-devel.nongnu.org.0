Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83A8703002
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:36:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIo-0001LT-QA; Mon, 15 May 2023 10:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHT-0006y9-49
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:36 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGU-0004rC-Jg
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:42 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-64a9335a8e7so21248168b3a.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161209; x=1686753209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EAy5XbfXYPrm/J1tRB5DUCT9JP3KNW8vRC1FRgDgvtM=;
 b=epYmYlRPfdH9RCCiKJE1xL0m8noeFmpUuvnf9UR3vVNfbQqYDeMOO+4ifo04ejyMFv
 H6Hq7aZjZWz6PVH0zn9ToEb8XLIYPR5zc6wFUlKWpgDfi7iu1HEK4aLHsNoEqOWA64Zr
 0cfZUWhP2QDmgbVXZGJ+WvNAr6MO6KNIZjX8Fq9YG7DB708bu7A3xr/uHS5SwOAzdoV3
 duEdBo38WTfJ2xGNLuP4Epj9SyVw0MO4uBBlnKfgpEPKndT3o7QV5pmNfC19hvwkXEdU
 +2XG3hBbbTog0Y/JraOWlV/XdH9wOkPJc0hXFJclMgi5dm8/H8fVBYCWwlrtbenxUwDj
 hcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161209; x=1686753209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EAy5XbfXYPrm/J1tRB5DUCT9JP3KNW8vRC1FRgDgvtM=;
 b=DW6BxnQdRC+5o0ZjWsw7s9ICWrh7IrDFTbWbPYyTlANzI3Y5Gn/BxiZIc5f4fW3h8X
 B9lI6+ZO9m+zOQCAYGMD1q+r6c0eInALBiFIrS3mHiMJuu60UXwOzoIXqNjpjhuf+NLs
 UXsPgBUzx0eVkyz+/v3IVJOwGp/JRaKhTp69QzyNYSlI98HDLU0LumBKvC8dPSoKUAvg
 nKvZBu4ajqZcC6pPio5PCpZh7ho8D/RKGm5K2tthTj0Oh04QdxkomQxvqPbB++jy90gh
 +khPAHJ/tNV2fZ+tOtyvh1GJNsERmI5VdEqxjcS4xW3AoQ0klnc73Vuu7y721caQ1kvu
 I5jA==
X-Gm-Message-State: AC+VfDxtHzoNFjJ+d6n+n96H0Sf85nJXytzDLsPFdvR7CxUvWE4vE+fl
 b1+CQx7XuivsPht8GLwg6jaM78fNzn02Zxk4UlY=
X-Google-Smtp-Source: ACHHUZ7EMieH0pBMYQQ6MgUFkmztRQqVGkHhg5pIlq3urBxYlRWGgeE7E5RWFIDhHOlTpT61LIdVCw==
X-Received: by 2002:a17:902:d488:b0:1ad:d2b1:3fa9 with SMTP id
 c8-20020a170902d48800b001add2b13fa9mr17380961plg.2.1684161209536; 
 Mon, 15 May 2023 07:33:29 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 17/54] tcg/ppc: Use full load/store helpers in user-only
 mode
Date: Mon, 15 May 2023 07:32:36 -0700
Message-Id: <20230515143313.734053-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
 tcg/ppc/tcg-target.c.inc | 44 ----------------------------------------
 1 file changed, 44 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 6a81916e64..218602c10c 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1962,7 +1962,6 @@ static const uint32_t qemu_stx_opc[(MO_SIZE + MO_BSWAP) + 1] = {
     [MO_BSWAP | MO_UQ] = STDBRX,
 };
 
-#if defined (CONFIG_SOFTMMU)
 static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 {
     if (arg < 0) {
@@ -2012,49 +2011,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_b(s, 0, lb->raddr);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!reloc_pc14(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        TCGReg arg = TCG_REG_R4;
-
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        if (l->addrlo_reg != arg) {
-            tcg_out_mov(s, TCG_TYPE_I32, arg, l->addrhi_reg);
-            tcg_out_mov(s, TCG_TYPE_I32, arg + 1, l->addrlo_reg);
-        } else if (l->addrhi_reg != arg + 1) {
-            tcg_out_mov(s, TCG_TYPE_I32, arg + 1, l->addrlo_reg);
-            tcg_out_mov(s, TCG_TYPE_I32, arg, l->addrhi_reg);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R0, arg);
-            tcg_out_mov(s, TCG_TYPE_I32, arg, arg + 1);
-            tcg_out_mov(s, TCG_TYPE_I32, arg + 1, TCG_REG_R0);
-        }
-    } else {
-        tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R4, l->addrlo_reg);
-    }
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R3, TCG_AREG0);
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_call_int(s, 0, (const void *)(l->is_ld ? helper_unaligned_ld
-                                          : helper_unaligned_st));
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
-#endif /* SOFTMMU */
 
 typedef struct {
     TCGReg base;
-- 
2.34.1


