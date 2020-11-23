Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46DC2C1740
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:08:56 +0100 (CET)
Received: from localhost ([::1]:54824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJ4x-0006OX-Mn
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIiN-0001MC-LF
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:45:35 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIiK-0001PL-AV
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:45:35 -0500
Received: by mail-wr1-x42f.google.com with SMTP id z7so4294693wrn.3
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+EqN5qDxtEBBzxLbgFeRkbW2j1iqK+UGwCfiEIja96k=;
 b=nFeQN6FsFha/SIFSYi+ZlCJIZF1+t3aitAuTqX/vVsmwZkWA9eE8TZH0JvBIKMR9du
 g/21ggfPC4xLe3wTWXXqV4hOyhY9Isk3ZKYMh+cS7vQPxjnuJqBT6q6JwsvDwuBZDuCi
 RckYysA96yAfXeGbQikZfguvGwPy94zzta0BOLZIwW+Znp3LvnNbxGAY7BrlTX04zcQa
 zpL5MwAf4Mr1+UjKgzziKTbUevgmzqJ4riX5U31aQ+YwVftTkjIUtG1L8J7FLItDIz6P
 Yhyk+QhNdt/sl3XtyYqTaIah3BarrAYhFN/l+JTRs3m8HQXBEXtA17F5PKP8onKadcKa
 NFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+EqN5qDxtEBBzxLbgFeRkbW2j1iqK+UGwCfiEIja96k=;
 b=OjTrmnJKR4UDaybAquMgfaQBMyRJf2pLofmRYYR8ZhyKv1P7ucykaOgZMubQcDKYwb
 KCP6MMTBo7/ikLdc3fU5//7OTHXCSv/6Z8cPymr4Rr+Id0NuGcZnBNVo/R/uw9jPA6tS
 sH9ZTccCrAZDt+5CI/fVNWZ5xdrGo2cUV7j9pdH5y2RS80ubjOPDQ4GuV7DGyHhqf0wn
 FTbukiJ/A0bzhjGfghl1BxGzbB9vTs8G6Ggz7Posfhk4BvitUDW87OpHt60xyYtp/I1W
 f1pGEODfG5rzWSoKPKfK3YzKwVMzE0cA1saphgNAyxiIaS/PCe6N0qhSawsJEKyYh+x1
 UOBQ==
X-Gm-Message-State: AOAM531crRYIEd9L0k6fiw7snQs4TCiHfGx6AAKs3i9UGxDTRETE59Ny
 Crh1PVNLtEE6Kre4tPEG+9VwfrXhaYg=
X-Google-Smtp-Source: ABdhPJySoOjCRzKwThpBCis/FwKVKFLuOYpqBuTqxzyxjOJluknwIYJStjvW4CNP3Z+pkXIOPDstrQ==
X-Received: by 2002:adf:9b98:: with SMTP id d24mr1494737wrc.17.1606164330374; 
 Mon, 23 Nov 2020 12:45:30 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id d134sm879570wmd.8.2020.11.23.12.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:45:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/28] target/mips: Extract DSP helper definitions
Date: Mon, 23 Nov 2020 21:44:28 +0100
Message-Id: <20201123204448.3260804-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'MIPS DSP' is defined as a Module by MIPS. Extract the helper
definitions to 'mod-dsp_helper.h.inc'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201120210844.2625602-7-f4bug@amsat.org>
---
 target/mips/helper.h             | 335 +-----------------------------
 target/mips/mod-dsp_helper.h.inc | 344 +++++++++++++++++++++++++++++++
 2 files changed, 345 insertions(+), 334 deletions(-)
 create mode 100644 target/mips/mod-dsp_helper.h.inc

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 80eb675fa64..82f40c3b9bc 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -447,340 +447,7 @@ DEF_HELPER_FLAGS_2(pasubub, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_1(biadd, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_FLAGS_1(pmovmskb, TCG_CALL_NO_RWG_SE, i64, i64)
 
-/*** MIPS DSP ***/
-/* DSP Arithmetic Sub-class insns */
-DEF_HELPER_FLAGS_3(addq_ph, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(addq_s_ph, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(addq_qh, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(addq_s_qh, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(addq_s_w, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(addq_pw, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(addq_s_pw, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(addu_qb, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(addu_s_qb, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_2(adduh_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(adduh_r_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_3(addu_ph, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(addu_s_ph, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_2(addqh_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(addqh_r_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(addqh_w, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(addqh_r_w, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(addu_ob, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(addu_s_ob, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_2(adduh_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(adduh_r_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_3(addu_qh, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(addu_s_qh, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(subq_ph, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(subq_s_ph, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(subq_qh, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(subq_s_qh, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(subq_s_w, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(subq_pw, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(subq_s_pw, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(subu_qb, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(subu_s_qb, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_2(subuh_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(subuh_r_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_3(subu_ph, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(subu_s_ph, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_2(subqh_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(subqh_r_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(subqh_w, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(subqh_r_w, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(subu_ob, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(subu_s_ob, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_2(subuh_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(subuh_r_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_3(subu_qh, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(subu_s_qh, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(addsc, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(addwc, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_2(modsub, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_1(raddu_w_qb, TCG_CALL_NO_RWG_SE, tl, tl)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_1(raddu_l_ob, TCG_CALL_NO_RWG_SE, tl, tl)
-#endif
-DEF_HELPER_FLAGS_2(absq_s_qb, 0, tl, tl, env)
-DEF_HELPER_FLAGS_2(absq_s_ph, 0, tl, tl, env)
-DEF_HELPER_FLAGS_2(absq_s_w, 0, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_2(absq_s_ob, 0, tl, tl, env)
-DEF_HELPER_FLAGS_2(absq_s_qh, 0, tl, tl, env)
-DEF_HELPER_FLAGS_2(absq_s_pw, 0, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_2(precr_qb_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(precrq_qb_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_3(precr_sra_ph_w, TCG_CALL_NO_RWG_SE,
-                   tl, i32, tl, tl)
-DEF_HELPER_FLAGS_3(precr_sra_r_ph_w, TCG_CALL_NO_RWG_SE,
-                   tl, i32, tl, tl)
-DEF_HELPER_FLAGS_2(precrq_ph_w, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_3(precrq_rs_ph_w, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_2(precr_ob_qh, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_3(precr_sra_qh_pw,
-                   TCG_CALL_NO_RWG_SE, tl, tl, tl, i32)
-DEF_HELPER_FLAGS_3(precr_sra_r_qh_pw,
-                   TCG_CALL_NO_RWG_SE, tl, tl, tl, i32)
-DEF_HELPER_FLAGS_2(precrq_ob_qh, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(precrq_qh_pw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_3(precrq_rs_qh_pw,
-                   TCG_CALL_NO_RWG_SE, tl, tl, tl, env)
-DEF_HELPER_FLAGS_2(precrq_pw_l, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-#endif
-DEF_HELPER_FLAGS_3(precrqu_s_qb_ph, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(precrqu_s_ob_qh,
-                   TCG_CALL_NO_RWG_SE, tl, tl, tl, env)
-
-DEF_HELPER_FLAGS_1(preceq_pw_qhl, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(preceq_pw_qhr, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(preceq_pw_qhla, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(preceq_pw_qhra, TCG_CALL_NO_RWG_SE, tl, tl)
-#endif
-DEF_HELPER_FLAGS_1(precequ_ph_qbl, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(precequ_ph_qbr, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(precequ_ph_qbla, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(precequ_ph_qbra, TCG_CALL_NO_RWG_SE, tl, tl)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_1(precequ_qh_obl, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(precequ_qh_obr, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(precequ_qh_obla, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(precequ_qh_obra, TCG_CALL_NO_RWG_SE, tl, tl)
-#endif
-DEF_HELPER_FLAGS_1(preceu_ph_qbl, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(preceu_ph_qbr, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(preceu_ph_qbla, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(preceu_ph_qbra, TCG_CALL_NO_RWG_SE, tl, tl)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_1(preceu_qh_obl, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(preceu_qh_obr, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(preceu_qh_obla, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(preceu_qh_obra, TCG_CALL_NO_RWG_SE, tl, tl)
-#endif
-
-/* DSP GPR-Based Shift Sub-class insns */
-DEF_HELPER_FLAGS_3(shll_qb, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(shll_ob, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(shll_ph, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(shll_s_ph, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(shll_qh, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(shll_s_qh, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(shll_s_w, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(shll_pw, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(shll_s_pw, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_2(shrl_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(shrl_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_2(shrl_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(shrl_qh, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-#endif
-DEF_HELPER_FLAGS_2(shra_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(shra_r_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_2(shra_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(shra_r_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-#endif
-DEF_HELPER_FLAGS_2(shra_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(shra_r_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(shra_r_w, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_2(shra_qh, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(shra_r_qh, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(shra_pw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(shra_r_pw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-#endif
-
-/* DSP Multiply Sub-class insns */
-DEF_HELPER_FLAGS_3(muleu_s_ph_qbl, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(muleu_s_ph_qbr, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(muleu_s_qh_obl, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(muleu_s_qh_obr, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(mulq_rs_ph, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(mulq_rs_qh, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(muleq_s_w_phl, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(muleq_s_w_phr, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(muleq_s_pw_qhl, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(muleq_s_pw_qhr, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_4(dpau_h_qbl, 0, void, i32, tl, tl, env)
-DEF_HELPER_FLAGS_4(dpau_h_qbr, 0, void, i32, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_4(dpau_h_obl, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(dpau_h_obr, 0, void, tl, tl, i32, env)
-#endif
-DEF_HELPER_FLAGS_4(dpsu_h_qbl, 0, void, i32, tl, tl, env)
-DEF_HELPER_FLAGS_4(dpsu_h_qbr, 0, void, i32, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_4(dpsu_h_obl, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(dpsu_h_obr, 0, void, tl, tl, i32, env)
-#endif
-DEF_HELPER_FLAGS_4(dpa_w_ph, 0, void, i32, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_4(dpa_w_qh, 0, void, tl, tl, i32, env)
-#endif
-DEF_HELPER_FLAGS_4(dpax_w_ph, 0, void, i32, tl, tl, env)
-DEF_HELPER_FLAGS_4(dpaq_s_w_ph, 0, void, i32, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_4(dpaq_s_w_qh, 0, void, tl, tl, i32, env)
-#endif
-DEF_HELPER_FLAGS_4(dpaqx_s_w_ph, 0, void, i32, tl, tl, env)
-DEF_HELPER_FLAGS_4(dpaqx_sa_w_ph, 0, void, i32, tl, tl, env)
-DEF_HELPER_FLAGS_4(dps_w_ph, 0, void, i32, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_4(dps_w_qh, 0, void, tl, tl, i32, env)
-#endif
-DEF_HELPER_FLAGS_4(dpsx_w_ph, 0, void, i32, tl, tl, env)
-DEF_HELPER_FLAGS_4(dpsq_s_w_ph, 0, void, i32, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_4(dpsq_s_w_qh, 0, void, tl, tl, i32, env)
-#endif
-DEF_HELPER_FLAGS_4(dpsqx_s_w_ph, 0, void, i32, tl, tl, env)
-DEF_HELPER_FLAGS_4(dpsqx_sa_w_ph, 0, void, i32, tl, tl, env)
-DEF_HELPER_FLAGS_4(mulsaq_s_w_ph, 0, void, i32, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_4(mulsaq_s_w_qh, 0, void, tl, tl, i32, env)
-#endif
-DEF_HELPER_FLAGS_4(dpaq_sa_l_w, 0, void, i32, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_4(dpaq_sa_l_pw, 0, void, tl, tl, i32, env)
-#endif
-DEF_HELPER_FLAGS_4(dpsq_sa_l_w, 0, void, i32, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_4(dpsq_sa_l_pw, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(mulsaq_s_l_pw, 0, void, tl, tl, i32, env)
-#endif
-DEF_HELPER_FLAGS_4(maq_s_w_phl, 0, void, i32, tl, tl, env)
-DEF_HELPER_FLAGS_4(maq_s_w_phr, 0, void, i32, tl, tl, env)
-DEF_HELPER_FLAGS_4(maq_sa_w_phl, 0, void, i32, tl, tl, env)
-DEF_HELPER_FLAGS_4(maq_sa_w_phr, 0, void, i32, tl, tl, env)
-DEF_HELPER_FLAGS_3(mul_ph, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(mul_s_ph, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(mulq_s_ph, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(mulq_s_w, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(mulq_rs_w, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_4(mulsa_w_ph, 0, void, i32, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_4(maq_s_w_qhll, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(maq_s_w_qhlr, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(maq_s_w_qhrl, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(maq_s_w_qhrr, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(maq_sa_w_qhll, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(maq_sa_w_qhlr, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(maq_sa_w_qhrl, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(maq_sa_w_qhrr, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(maq_s_l_pwl, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(maq_s_l_pwr, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(dmadd, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(dmaddu, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(dmsub, 0, void, tl, tl, i32, env)
-DEF_HELPER_FLAGS_4(dmsubu, 0, void, tl, tl, i32, env)
-#endif
-
-/* DSP Bit/Manipulation Sub-class insns */
-DEF_HELPER_FLAGS_1(bitrev, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_3(insv, 0, tl, env, tl, tl)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(dinsv, 0, tl, env, tl, tl)
-#endif
-
-/* DSP Compare-Pick Sub-class insns */
-DEF_HELPER_FLAGS_3(cmpu_eq_qb, 0, void, tl, tl, env)
-DEF_HELPER_FLAGS_3(cmpu_lt_qb, 0, void, tl, tl, env)
-DEF_HELPER_FLAGS_3(cmpu_le_qb, 0, void, tl, tl, env)
-DEF_HELPER_FLAGS_2(cmpgu_eq_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(cmpgu_lt_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(cmpgu_le_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_3(cmp_eq_ph, 0, void, tl, tl, env)
-DEF_HELPER_FLAGS_3(cmp_lt_ph, 0, void, tl, tl, env)
-DEF_HELPER_FLAGS_3(cmp_le_ph, 0, void, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(cmpu_eq_ob, 0, void, tl, tl, env)
-DEF_HELPER_FLAGS_3(cmpu_lt_ob, 0, void, tl, tl, env)
-DEF_HELPER_FLAGS_3(cmpu_le_ob, 0, void, tl, tl, env)
-DEF_HELPER_FLAGS_3(cmpgdu_eq_ob, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(cmpgdu_lt_ob, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(cmpgdu_le_ob, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_2(cmpgu_eq_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(cmpgu_lt_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(cmpgu_le_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_3(cmp_eq_qh, 0, void, tl, tl, env)
-DEF_HELPER_FLAGS_3(cmp_lt_qh, 0, void, tl, tl, env)
-DEF_HELPER_FLAGS_3(cmp_le_qh, 0, void, tl, tl, env)
-DEF_HELPER_FLAGS_3(cmp_eq_pw, 0, void, tl, tl, env)
-DEF_HELPER_FLAGS_3(cmp_lt_pw, 0, void, tl, tl, env)
-DEF_HELPER_FLAGS_3(cmp_le_pw, 0, void, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(pick_qb, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(pick_ph, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(pick_ob, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(pick_qh, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(pick_pw, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_2(packrl_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_2(packrl_pw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-#endif
-
-/* DSP Accumulator and DSPControl Access Sub-class insns */
-DEF_HELPER_FLAGS_3(extr_w, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(extr_r_w, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(extr_rs_w, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(dextr_w, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(dextr_r_w, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(dextr_rs_w, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(dextr_l, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(dextr_r_l, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(dextr_rs_l, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(extr_s_h, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(dextr_s_h, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(extp, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(extpdp, 0, tl, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(dextp, 0, tl, tl, tl, env)
-DEF_HELPER_FLAGS_3(dextpdp, 0, tl, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(shilo, 0, void, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(dshilo, 0, void, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(mthlip, 0, void, tl, tl, env)
-#if defined(TARGET_MIPS64)
-DEF_HELPER_FLAGS_3(dmthlip, 0, void, tl, tl, env)
-#endif
-DEF_HELPER_FLAGS_3(wrdsp, 0, void, tl, tl, env)
-DEF_HELPER_FLAGS_2(rddsp, 0, tl, tl, env)
-
 DEF_HELPER_3(cache, void, env, tl, i32)
 
+#include "mod-dsp_helper.h.inc"
 #include "mod-msa_helper.h.inc"
diff --git a/target/mips/mod-dsp_helper.h.inc b/target/mips/mod-dsp_helper.h.inc
new file mode 100644
index 00000000000..83f188a697e
--- /dev/null
+++ b/target/mips/mod-dsp_helper.h.inc
@@ -0,0 +1,344 @@
+/*
+ * MIPS ASE DSP instruction emulation helpers for QEMU.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
+ *  Copyright (c) 2012 Jia Liu & Dongxue Zhang (MIPS ASE DSP support)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+/* DSP Arithmetic Sub-class insns */
+DEF_HELPER_FLAGS_3(addq_ph, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(addq_s_ph, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(addq_qh, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(addq_s_qh, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(addq_s_w, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(addq_pw, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(addq_s_pw, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(addu_qb, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(addu_s_qb, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_2(adduh_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(adduh_r_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_3(addu_ph, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(addu_s_ph, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_2(addqh_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(addqh_r_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(addqh_w, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(addqh_r_w, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(addu_ob, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(addu_s_ob, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_2(adduh_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(adduh_r_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_3(addu_qh, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(addu_s_qh, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(subq_ph, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(subq_s_ph, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(subq_qh, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(subq_s_qh, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(subq_s_w, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(subq_pw, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(subq_s_pw, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(subu_qb, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(subu_s_qb, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_2(subuh_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(subuh_r_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_3(subu_ph, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(subu_s_ph, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_2(subqh_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(subqh_r_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(subqh_w, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(subqh_r_w, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(subu_ob, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(subu_s_ob, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_2(subuh_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(subuh_r_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_3(subu_qh, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(subu_s_qh, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(addsc, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(addwc, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_2(modsub, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_1(raddu_w_qb, TCG_CALL_NO_RWG_SE, tl, tl)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_1(raddu_l_ob, TCG_CALL_NO_RWG_SE, tl, tl)
+#endif
+DEF_HELPER_FLAGS_2(absq_s_qb, 0, tl, tl, env)
+DEF_HELPER_FLAGS_2(absq_s_ph, 0, tl, tl, env)
+DEF_HELPER_FLAGS_2(absq_s_w, 0, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_2(absq_s_ob, 0, tl, tl, env)
+DEF_HELPER_FLAGS_2(absq_s_qh, 0, tl, tl, env)
+DEF_HELPER_FLAGS_2(absq_s_pw, 0, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_2(precr_qb_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(precrq_qb_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_3(precr_sra_ph_w, TCG_CALL_NO_RWG_SE,
+                   tl, i32, tl, tl)
+DEF_HELPER_FLAGS_3(precr_sra_r_ph_w, TCG_CALL_NO_RWG_SE,
+                   tl, i32, tl, tl)
+DEF_HELPER_FLAGS_2(precrq_ph_w, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_3(precrq_rs_ph_w, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_2(precr_ob_qh, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_3(precr_sra_qh_pw,
+                   TCG_CALL_NO_RWG_SE, tl, tl, tl, i32)
+DEF_HELPER_FLAGS_3(precr_sra_r_qh_pw,
+                   TCG_CALL_NO_RWG_SE, tl, tl, tl, i32)
+DEF_HELPER_FLAGS_2(precrq_ob_qh, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(precrq_qh_pw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_3(precrq_rs_qh_pw,
+                   TCG_CALL_NO_RWG_SE, tl, tl, tl, env)
+DEF_HELPER_FLAGS_2(precrq_pw_l, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+#endif
+DEF_HELPER_FLAGS_3(precrqu_s_qb_ph, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(precrqu_s_ob_qh,
+                   TCG_CALL_NO_RWG_SE, tl, tl, tl, env)
+
+DEF_HELPER_FLAGS_1(preceq_pw_qhl, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(preceq_pw_qhr, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(preceq_pw_qhla, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(preceq_pw_qhra, TCG_CALL_NO_RWG_SE, tl, tl)
+#endif
+DEF_HELPER_FLAGS_1(precequ_ph_qbl, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(precequ_ph_qbr, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(precequ_ph_qbla, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(precequ_ph_qbra, TCG_CALL_NO_RWG_SE, tl, tl)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_1(precequ_qh_obl, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(precequ_qh_obr, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(precequ_qh_obla, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(precequ_qh_obra, TCG_CALL_NO_RWG_SE, tl, tl)
+#endif
+DEF_HELPER_FLAGS_1(preceu_ph_qbl, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(preceu_ph_qbr, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(preceu_ph_qbla, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(preceu_ph_qbra, TCG_CALL_NO_RWG_SE, tl, tl)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_1(preceu_qh_obl, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(preceu_qh_obr, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(preceu_qh_obla, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(preceu_qh_obra, TCG_CALL_NO_RWG_SE, tl, tl)
+#endif
+
+/* DSP GPR-Based Shift Sub-class insns */
+DEF_HELPER_FLAGS_3(shll_qb, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(shll_ob, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(shll_ph, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(shll_s_ph, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(shll_qh, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(shll_s_qh, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(shll_s_w, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(shll_pw, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(shll_s_pw, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_2(shrl_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(shrl_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_2(shrl_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(shrl_qh, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+#endif
+DEF_HELPER_FLAGS_2(shra_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(shra_r_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_2(shra_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(shra_r_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+#endif
+DEF_HELPER_FLAGS_2(shra_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(shra_r_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(shra_r_w, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_2(shra_qh, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(shra_r_qh, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(shra_pw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(shra_r_pw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+#endif
+
+/* DSP Multiply Sub-class insns */
+DEF_HELPER_FLAGS_3(muleu_s_ph_qbl, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(muleu_s_ph_qbr, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(muleu_s_qh_obl, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(muleu_s_qh_obr, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(mulq_rs_ph, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(mulq_rs_qh, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(muleq_s_w_phl, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(muleq_s_w_phr, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(muleq_s_pw_qhl, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(muleq_s_pw_qhr, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_4(dpau_h_qbl, 0, void, i32, tl, tl, env)
+DEF_HELPER_FLAGS_4(dpau_h_qbr, 0, void, i32, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_4(dpau_h_obl, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(dpau_h_obr, 0, void, tl, tl, i32, env)
+#endif
+DEF_HELPER_FLAGS_4(dpsu_h_qbl, 0, void, i32, tl, tl, env)
+DEF_HELPER_FLAGS_4(dpsu_h_qbr, 0, void, i32, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_4(dpsu_h_obl, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(dpsu_h_obr, 0, void, tl, tl, i32, env)
+#endif
+DEF_HELPER_FLAGS_4(dpa_w_ph, 0, void, i32, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_4(dpa_w_qh, 0, void, tl, tl, i32, env)
+#endif
+DEF_HELPER_FLAGS_4(dpax_w_ph, 0, void, i32, tl, tl, env)
+DEF_HELPER_FLAGS_4(dpaq_s_w_ph, 0, void, i32, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_4(dpaq_s_w_qh, 0, void, tl, tl, i32, env)
+#endif
+DEF_HELPER_FLAGS_4(dpaqx_s_w_ph, 0, void, i32, tl, tl, env)
+DEF_HELPER_FLAGS_4(dpaqx_sa_w_ph, 0, void, i32, tl, tl, env)
+DEF_HELPER_FLAGS_4(dps_w_ph, 0, void, i32, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_4(dps_w_qh, 0, void, tl, tl, i32, env)
+#endif
+DEF_HELPER_FLAGS_4(dpsx_w_ph, 0, void, i32, tl, tl, env)
+DEF_HELPER_FLAGS_4(dpsq_s_w_ph, 0, void, i32, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_4(dpsq_s_w_qh, 0, void, tl, tl, i32, env)
+#endif
+DEF_HELPER_FLAGS_4(dpsqx_s_w_ph, 0, void, i32, tl, tl, env)
+DEF_HELPER_FLAGS_4(dpsqx_sa_w_ph, 0, void, i32, tl, tl, env)
+DEF_HELPER_FLAGS_4(mulsaq_s_w_ph, 0, void, i32, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_4(mulsaq_s_w_qh, 0, void, tl, tl, i32, env)
+#endif
+DEF_HELPER_FLAGS_4(dpaq_sa_l_w, 0, void, i32, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_4(dpaq_sa_l_pw, 0, void, tl, tl, i32, env)
+#endif
+DEF_HELPER_FLAGS_4(dpsq_sa_l_w, 0, void, i32, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_4(dpsq_sa_l_pw, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(mulsaq_s_l_pw, 0, void, tl, tl, i32, env)
+#endif
+DEF_HELPER_FLAGS_4(maq_s_w_phl, 0, void, i32, tl, tl, env)
+DEF_HELPER_FLAGS_4(maq_s_w_phr, 0, void, i32, tl, tl, env)
+DEF_HELPER_FLAGS_4(maq_sa_w_phl, 0, void, i32, tl, tl, env)
+DEF_HELPER_FLAGS_4(maq_sa_w_phr, 0, void, i32, tl, tl, env)
+DEF_HELPER_FLAGS_3(mul_ph, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(mul_s_ph, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(mulq_s_ph, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(mulq_s_w, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(mulq_rs_w, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_4(mulsa_w_ph, 0, void, i32, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_4(maq_s_w_qhll, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(maq_s_w_qhlr, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(maq_s_w_qhrl, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(maq_s_w_qhrr, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(maq_sa_w_qhll, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(maq_sa_w_qhlr, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(maq_sa_w_qhrl, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(maq_sa_w_qhrr, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(maq_s_l_pwl, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(maq_s_l_pwr, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(dmadd, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(dmaddu, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(dmsub, 0, void, tl, tl, i32, env)
+DEF_HELPER_FLAGS_4(dmsubu, 0, void, tl, tl, i32, env)
+#endif
+
+/* DSP Bit/Manipulation Sub-class insns */
+DEF_HELPER_FLAGS_1(bitrev, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_3(insv, 0, tl, env, tl, tl)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(dinsv, 0, tl, env, tl, tl)
+#endif
+
+/* DSP Compare-Pick Sub-class insns */
+DEF_HELPER_FLAGS_3(cmpu_eq_qb, 0, void, tl, tl, env)
+DEF_HELPER_FLAGS_3(cmpu_lt_qb, 0, void, tl, tl, env)
+DEF_HELPER_FLAGS_3(cmpu_le_qb, 0, void, tl, tl, env)
+DEF_HELPER_FLAGS_2(cmpgu_eq_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(cmpgu_lt_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(cmpgu_le_qb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_3(cmp_eq_ph, 0, void, tl, tl, env)
+DEF_HELPER_FLAGS_3(cmp_lt_ph, 0, void, tl, tl, env)
+DEF_HELPER_FLAGS_3(cmp_le_ph, 0, void, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(cmpu_eq_ob, 0, void, tl, tl, env)
+DEF_HELPER_FLAGS_3(cmpu_lt_ob, 0, void, tl, tl, env)
+DEF_HELPER_FLAGS_3(cmpu_le_ob, 0, void, tl, tl, env)
+DEF_HELPER_FLAGS_3(cmpgdu_eq_ob, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(cmpgdu_lt_ob, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(cmpgdu_le_ob, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_2(cmpgu_eq_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(cmpgu_lt_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(cmpgu_le_ob, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_3(cmp_eq_qh, 0, void, tl, tl, env)
+DEF_HELPER_FLAGS_3(cmp_lt_qh, 0, void, tl, tl, env)
+DEF_HELPER_FLAGS_3(cmp_le_qh, 0, void, tl, tl, env)
+DEF_HELPER_FLAGS_3(cmp_eq_pw, 0, void, tl, tl, env)
+DEF_HELPER_FLAGS_3(cmp_lt_pw, 0, void, tl, tl, env)
+DEF_HELPER_FLAGS_3(cmp_le_pw, 0, void, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(pick_qb, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(pick_ph, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(pick_ob, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(pick_qh, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(pick_pw, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_2(packrl_ph, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_2(packrl_pw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+#endif
+
+/* DSP Accumulator and DSPControl Access Sub-class insns */
+DEF_HELPER_FLAGS_3(extr_w, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(extr_r_w, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(extr_rs_w, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(dextr_w, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(dextr_r_w, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(dextr_rs_w, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(dextr_l, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(dextr_r_l, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(dextr_rs_l, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(extr_s_h, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(dextr_s_h, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(extp, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(extpdp, 0, tl, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(dextp, 0, tl, tl, tl, env)
+DEF_HELPER_FLAGS_3(dextpdp, 0, tl, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(shilo, 0, void, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(dshilo, 0, void, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(mthlip, 0, void, tl, tl, env)
+#if defined(TARGET_MIPS64)
+DEF_HELPER_FLAGS_3(dmthlip, 0, void, tl, tl, env)
+#endif
+DEF_HELPER_FLAGS_3(wrdsp, 0, void, tl, tl, env)
+DEF_HELPER_FLAGS_2(rddsp, 0, tl, tl, env)
-- 
2.26.2


