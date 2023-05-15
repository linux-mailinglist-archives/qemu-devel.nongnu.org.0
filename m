Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDB670307E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:48:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIq-0001VU-Dv; Mon, 15 May 2023 10:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHT-0006yB-59
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:36 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGU-0004vV-Aj
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:41 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1aaebed5bd6so90781835ad.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161209; x=1686753209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jxeAK+0nBaqYYTLaoVSvaQrIxJ38Tit6zinqkGACFIA=;
 b=P/gzS0VkxIZ7eGFXLCopzy44T1r+4+EnpyMnmvd5Fb51AVs+ozKrNUS+wVPH5m/aQj
 4wan5D8gXim2b/eXpq9CwTT0w50OU2QAE4lntAcW9FgaJ/SxBO1m9rQR9f4zGbDRe6sg
 JYW6PTw5ed1t5//gYnuZh1eJ8eXpKjDPbZTn8syBdddLpbnOqVFwkCWroRauxKhShh4F
 n2C/fU4QXrsmIVGUIbcEcJctSig0nlgXHl3ur3YcyV+C/gKJpZ13Cp3VtmTfgAjR/i0g
 33lJ5i5olmwD3mmnbcnx4pe5wcccDMNSH5s1i3Ok0IktmouQHWNUwEzzWg3CemqMkfTP
 z/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161209; x=1686753209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jxeAK+0nBaqYYTLaoVSvaQrIxJ38Tit6zinqkGACFIA=;
 b=P97lOyTFkgGlyVtfJcid+2stCcSFelu1R9Mn0wQFYoRMeSdVYGC9wr0c8lqk+m4MP9
 rkCIR9VTzGcr6YQndz4G4WfwMuMM7Ur6FYGU72F3HohTJWNGrX6qLVwExD35yyDmcKNZ
 ueNpQiSo9frSObbabB3qRVzxwQVfkoWpGFYpkGBoX0l6Mk4HQpDBQprfrSatOHf2Kbja
 ECytPMu3KnkIr3drUkEYSx3Khu9wJhcJGLZaaC4iULbWSgF+VI2oCfRqAAmBz/WLXEqs
 Wga/ouqR83v4Wd53/jR87BNmuShB1jzRkcPc0TshBovNbrNA3I2tAwts8S7JLxmutoMa
 8Yxg==
X-Gm-Message-State: AC+VfDzJmh/dsw8Ldd7V63eAWq5neVdoRCNRMBMv9n5dVBJG2t9ISZSl
 6ZtcjMAIi0mZLfDqtrd37v0iun4gIZvwTWFw9qA=
X-Google-Smtp-Source: ACHHUZ4gOSXFS8dC9oz7FCZdQX8N1dBFH+WDs08PzusZdX2WcQIZQacrnO71Y7pGf+gAv7LHg2QqSA==
X-Received: by 2002:a17:902:d2c4:b0:1ac:5717:fd2 with SMTP id
 n4-20020a170902d2c400b001ac57170fd2mr34765471plc.47.1684161208766; 
 Mon, 15 May 2023 07:33:28 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 16/54] tcg/aarch64: Use full load/store helpers in
 user-only mode
Date: Mon, 15 May 2023 07:32:35 -0700
Message-Id: <20230515143313.734053-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index c64606af5b..36d8798bca 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1595,7 +1595,6 @@ typedef struct {
     TCGType index_ext;
 } HostAddress;
 
-#ifdef CONFIG_SOFTMMU
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 1, .tmp = { TCG_REG_TMP }
 };
@@ -1628,40 +1627,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_goto(s, lb->raddr);
     return true;
 }
-#else
-static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
-{
-    ptrdiff_t offset = tcg_pcrel_diff(s, target);
-    tcg_debug_assert(offset == sextract64(offset, 0, 21));
-    tcg_out_insn(s, 3406, ADR, rd, offset);
-}
-
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!reloc_pc19(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_X1, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_X0, TCG_AREG0);
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_adr(s, TCG_REG_LR, l->raddr);
-    tcg_out_goto_long(s, (const void *)(l->is_ld ? helper_unaligned_ld
-                                        : helper_unaligned_st));
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


