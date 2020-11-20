Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B112BB843
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:24:07 +0100 (CET)
Received: from localhost ([::1]:46010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDt0-0001RJ-I5
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDel-0003Am-So
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:09:23 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDei-0003sr-Mz
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:09:23 -0500
Received: by mail-wr1-x441.google.com with SMTP id c17so11647706wrc.11
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1IM1vS41dRxHKbpNRTwRziKTYa/fRFjLkjueuUpxpB0=;
 b=Ysl47Dn8GZJSM0SaqXiWDtV/q4axEIsJ4gknlhttu8VM9R2EaT85sXsKAj4Ui59afm
 7orSD2o3o9ge5heIQf+2tVgRZ4JI4AXT85sIOyvxiG3DeSw3jcgMj/sr7ngLQWGkqnAj
 B/pLHnnam/nEnCuFcPnZ9Rd6FjRmd9XAykQ164hrZlGAvxf7fbfCYyxlMZax5oSMPHZJ
 EnrEkkJOJpdhtIYzIcxk4idCvN0zWY7/04wGxVGoEWrLCrCWFmAP5HPmtAZa9CqwP25i
 ZoXcFdyEHqKNZjkAYC7b8dcVHLy6eOHmsOpDUalfTXffLmwjMu8Np/Ms99ZeNCV2acP1
 zopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1IM1vS41dRxHKbpNRTwRziKTYa/fRFjLkjueuUpxpB0=;
 b=rm6u+oW9pPuZ7yB7hoP6ndVLh0dm1aItIDztG+DKhx3AIRl4pn7wSu/8vC/VpACvo3
 CEJqKTfjpDcBxP2V/koUeg1QFDBeh9EBTP4iD4SvSXsdrFah2UYcKgfEQ2qyge2YfNUU
 VeULkAZxor1+rydCaysR1zIdv1O51R40soAhiD4etUpPoOI/tk+U0vWW7jD8ZrGwobjF
 MRwLpqC3s4J1WwvlKkQ/4CaznjCl7rB4ETvcDSEi7Fh75sgauM/UoALjCKk6AugSNKBE
 AX+KxcMSnHNxXDsWdQDdVqxuUYoW+r4ciDJJ4U/TiQ4vVi6XjvDD7CxUp9jqhYhLCW4l
 VOGA==
X-Gm-Message-State: AOAM530k9xoafJH+2Mkv8GirQ17/ojBA5QLliDEVQpj1EEXGPFA2sWyD
 2g1UP4goRQVNQaiubKFVIVQKIbK9A40=
X-Google-Smtp-Source: ABdhPJzLF/SZ+SKwyN/yvJu3JoHpJhkGdq9M+N6M287mhfwpg33/iFN82FhfBZ3g17h8fo8zDJooeQ==
X-Received: by 2002:adf:f2c7:: with SMTP id d7mr18480465wrp.142.1605906558459; 
 Fri, 20 Nov 2020 13:09:18 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id q5sm6594656wrf.41.2020.11.20.13.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:09:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/26] target/mips: Extract DSP helper definitions
Date: Fri, 20 Nov 2020 22:08:24 +0100
Message-Id: <20201120210844.2625602-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'MIPS DSP' is defined as a Module by MIPS. Extract the helper
definitions to 'mod-mips-dsp_helper.h.inc'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.h                  | 335 +------------------------
 target/mips/mod-mips-dsp_helper.h.inc | 344 ++++++++++++++++++++++++++
 2 files changed, 345 insertions(+), 334 deletions(-)
 create mode 100644 target/mips/mod-mips-dsp_helper.h.inc

diff --git a/target/mips/helper.h b/target/mips/helper.h
index a44f42c6201..bce869f3718 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -447,341 +447,8 @@ DEF_HELPER_FLAGS_2(pasubub, TCG_CALL_NO_RWG_SE, i64, i64, i64)
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
 
+#include "mod-mips-dsp_helper.h.inc"
 #include "mod-mips-msa_helper.h.inc"
 
diff --git a/target/mips/mod-mips-dsp_helper.h.inc b/target/mips/mod-mips-dsp_helper.h.inc
new file mode 100644
index 00000000000..83f188a697e
--- /dev/null
+++ b/target/mips/mod-mips-dsp_helper.h.inc
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


