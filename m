Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF936F50D9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:12:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6bY-0002yY-VZ; Wed, 03 May 2023 03:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6af-0007uJ-Gc
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:53 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a8-0005n4-6L
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:53 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f315712406so11277255e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097639; x=1685689639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RTRyUJJ//8McRlEJCpdcC3CCDoyJJ5ltYvB50/bCFGE=;
 b=M0AVoLL90VsU6dUb5aND6Tr+2Yq0dKst3kcummph/xAeuXLqXlicMIsMuDgcgGwe1e
 4gVa2Ui1iVDVrt4pr8MwsD7DmFZE0WawVPciUSjaLKqDUAWrYPEqDV5d0STAYfGBHl8W
 nRwa9Xpl5snKuORBQZVjgzBB6+pYRc9w25n4bbw58TLJoP0g6T51iP+Iu7MgzRA2W6pi
 73RXlWR6wQCG3Zxzpwzvxkm2zr1G5Jl57G8e+5vN+10phEJwkjzorVO0M0uDSaE0JR2L
 UVPPoDESWL9rv6AYkXo4lTzyc5gU3cTMmQWQ3QrOXE+Zp1Z4cNPCbkIMGoYLycOnsV+5
 gVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097639; x=1685689639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RTRyUJJ//8McRlEJCpdcC3CCDoyJJ5ltYvB50/bCFGE=;
 b=E4El2HwjGYAe/x6gtYsK56JP4mVAxx6vaMIz9LzsvIpUHycK6QnZct2yJVtVoqFUqs
 Km6fth64Ph8Imi+iM2CRO5p3P7m1G2MnG9gIxHMst2GDqRMKfElNNRMEhTIfx+40XheY
 AwxAgLgWR3xcH2egQQnQB8kW8tFJQLA5lXFI5dS3lRWbiNqOgvWeiHm/RU8jd9SZ4Nbb
 xjJtVLg9jZ7um2YPyRyivsoPJmu5vpbtpgiRg4/SpcHXygNQ8BufSYTDkC4Uo1pr8ET0
 lsf5xOdZbAkDbyMk9lWaog3bYJUYcOqeof7H/t7Fbqsrtyl7j/odOCYnEdf/FM+b5hxS
 wVDQ==
X-Gm-Message-State: AC+VfDwdSqhFeFfpXjjhw1CqNzzuIbZXqX+LbSLJCLASkTjxE6eZKGKO
 JK5bsuCsTK1mhg9YJQa9K3aclGA8iOpBDa9mDcMr5w==
X-Google-Smtp-Source: ACHHUZ6Q5c5x0ck7NNe7SD4tti18CmN3WA0Aqpg3sdungeXOb7nAhGAirRmiOrCSzjZngRiTUSUqDw==
X-Received: by 2002:a1c:c916:0:b0:3f1:71d3:8ddf with SMTP id
 f22-20020a1cc916000000b003f171d38ddfmr601759wmb.14.1683097638761; 
 Wed, 03 May 2023 00:07:18 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 28/57] tcg/mips: Use full load/store helpers in user-only
 mode
Date: Wed,  3 May 2023 08:06:27 +0100
Message-Id: <20230503070656.1746170-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 57 ++-------------------------------------
 1 file changed, 2 insertions(+), 55 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 7770ef46bd..fa0f334e8d 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1075,7 +1075,6 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg,
     tcg_out_nop(s);
 }
 
-#if defined(CONFIG_SOFTMMU)
 /* We have four temps, we might as well expose three of them. */
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 3, .tmp = { TCG_TMP0, TCG_TMP1, TCG_TMP2 }
@@ -1088,8 +1087,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     /* resolve label address */
     if (!reloc_pc16(l->label_ptr[0], tgt_rx)
-        || (TCG_TARGET_REG_BITS < TARGET_LONG_BITS
-            && !reloc_pc16(l->label_ptr[1], tgt_rx))) {
+        || (l->label_ptr[1] && !reloc_pc16(l->label_ptr[1], tgt_rx))) {
         return false;
     }
 
@@ -1118,8 +1116,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     /* resolve label address */
     if (!reloc_pc16(l->label_ptr[0], tgt_rx)
-        || (TCG_TARGET_REG_BITS < TARGET_LONG_BITS
-            && !reloc_pc16(l->label_ptr[1], tgt_rx))) {
+        || (l->label_ptr[1] && !reloc_pc16(l->label_ptr[1], tgt_rx))) {
         return false;
     }
 
@@ -1139,56 +1136,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     return true;
 }
 
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    void *target;
-
-    if (!reloc_pc16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        /* A0 is env, A1 is skipped, A2:A3 is the uint64_t address. */
-        TCGReg a2 = MIPS_BE ? l->addrhi_reg : l->addrlo_reg;
-        TCGReg a3 = MIPS_BE ? l->addrlo_reg : l->addrhi_reg;
-
-        if (a3 != TCG_REG_A2) {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A2, a2);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A3, a3);
-        } else if (a2 != TCG_REG_A3) {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A3, a3);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A2, a2);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_TMP0, TCG_REG_A2);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A2, TCG_REG_A3);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A3, TCG_TMP0);
-        }
-    } else {
-        tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_A1, l->addrlo_reg);
-    }
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-
-    /*
-     * Tail call to the helper, with the return address back inline.
-     * We have arrived here via BNEL, so $31 is already set.
-     */
-    target = (l->is_ld ? helper_unaligned_ld : helper_unaligned_st);
-    tcg_out_call_int(s, target, true);
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
-
 typedef struct {
     TCGReg base;
     MemOp align;
-- 
2.34.1


