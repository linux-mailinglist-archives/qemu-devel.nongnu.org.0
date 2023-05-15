Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D0B703003
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:36:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIc-00009E-S5; Mon, 15 May 2023 10:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHS-0006xp-Rp
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:36 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGW-0004wh-RJ
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:44 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1ab14cb3aaeso91646425ad.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161211; x=1686753211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W19ruQQxWDDIeEDzZGJivenEm5AmU9KSchMTkoB+WqU=;
 b=KnuDKmixTWNf1+WQ9EELsmyOgKu1k2cdwzF0UTOzCEeUro89rK/YZHJRdDHwGP5Hh1
 lC+dJ/59V0kQHlOitXxQvEz2nFYylxkVoR26MHaHb4UUsVdf2+AVnUPzfodGrSgC0JQF
 8fendN+RfOn5MqehSKRLayGeU683TPWEzPfrnCm97u0uoVjR6qlG924NExUjvPajZ17S
 qO4vlpHE/6qqARS/bMaFm8zMhDlG+AcfiG6tXMksYWmx3GqAT5sTDu64jBgyGJsJSvHV
 12MjiJHR3MDuZoyTYWAuOAztBN6MxEia82EhuswI0IxYxtApoSMAquAAtEiXJyqLxodI
 wOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161211; x=1686753211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W19ruQQxWDDIeEDzZGJivenEm5AmU9KSchMTkoB+WqU=;
 b=e6GMs9lX/1v/TUs74gL8ChRH+67UPbiDo3gOY27lNWYcMO8RAiSGYFao6UZrxh6d4b
 kumSgCZStcPUB24n14VfQj8Hl5AXiSVXoOO/RNVXxHok2AmXqs69Q9y37pK+CW6lVkiw
 TFUnzYHABgmGX2yPqcrX14a59Dh4WXC6eObgckyD/aDa8SN2wdxgDmZBfSVDbqtPeSps
 sEl8+z1a8eYeEMJ82DnTyrhG1uvC+e/3Ni/rb75kJRUxCsxG2UubdwUNfPsnJYLmTK+T
 QXH47Q9Ab7lz6IMZI7+CTSx63embjoSScUzQvDR0Es66ZTELGiXaPlR7GwIioohVBBIZ
 wbHw==
X-Gm-Message-State: AC+VfDznZknXksb/ggOluOfrVN7QlegaZ7iLABC0HjV0V2atA6kJcpty
 AEdtnZTDb5xbIGz3DnEPSGuWCCAc+MIA8ebxTAU=
X-Google-Smtp-Source: ACHHUZ7mFsfjoqYvt06QFqlx9/0M5cxrZYqru2C19ddDCMhbydnqEW1Z84Tw8mNORCIzpKA1IfZMmw==
X-Received: by 2002:a17:903:2292:b0:1a2:3108:5cc9 with SMTP id
 b18-20020a170903229200b001a231085cc9mr46161994plh.40.1684161211318; 
 Mon, 15 May 2023 07:33:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 19/54] tcg/riscv: Use full load/store helpers in user-only
 mode
Date: Mon, 15 May 2023 07:32:38 -0700
Message-Id: <20230515143313.734053-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
 tcg/riscv/tcg-target.c.inc | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 8ed0e2f210..19cd4507fb 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -846,7 +846,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
  * Load/store and TLB
  */
 
-#if defined(CONFIG_SOFTMMU)
 static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, 0);
@@ -893,34 +892,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_goto(s, l->raddr);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    /* resolve label address */
-    if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-
-    /* tail call, with the return address back inline. */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RA, (uintptr_t)l->raddr);
-    tcg_out_call_int(s, (const void *)(l->is_ld ? helper_unaligned_ld
-                                       : helper_unaligned_st), true);
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


