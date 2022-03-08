Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B284D10EF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:27:24 +0100 (CET)
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUFf-00058s-Ot
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:27:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8o-00052g-Nf
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:19 -0500
Received: from [2607:f8b0:4864:20::634] (port=38658
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8k-00063l-Jz
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:17 -0500
Received: by mail-pl1-x634.google.com with SMTP id t19so12714753plr.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7bmH4+iW733QmZWCHhiuFV3NePOOzi9ku1JFYZ2UlEE=;
 b=p75TLY35V5TImfaYqRUH61Ab5HUyVjxSbKXlrM1o2PCU9Ep+RSTsghSn3rdMi1U/G3
 nuB8PVvPEF2Ofoqi5SUvyP0SVocPoj4gJWSgLg45HIEn9XTaOYASSQOFjt6jhp/Ir3tO
 z+lD12Dnoozzy5QVg6BdO4gccLmQR9dG3SC4wAdHu7W91QtVplt9wDw2bNE707y1mzEu
 3/AQMfyCyStPsLO9R2VH9ZnA4G4e/hTYvwV961MlrYGEjMK1gx2N6tA3ovT7UzuBLMV9
 tg7p+E5nJZ3fH9utbcBzc21078aCeLJQOkc/wPNqrcG1kODr95Koj9LVPQgjaXkIVUsV
 4sRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7bmH4+iW733QmZWCHhiuFV3NePOOzi9ku1JFYZ2UlEE=;
 b=tsWF1a7pZBXbcVy6Gkq+n8z/Bul4cV6wH5BOLWYNlOyujJMNpArk43q9uA8dDEslDH
 MwXU2JHTrTI84B+UsNtMG6k88SCltl7qCTxWmx/N/BBSV/OEkDJZeipZoPoz1ytQEiVT
 8l9SEHDPoqjV/RsJmgdw+psGJWt6WfRu4tw+98hfzQnn99sN99vlQSQ7zP8auA2TbGTd
 ygo44OQ7zwKVBqLlA2YhVLpaPlWY/LyE5a6tkLU39QVr4V3cJmxa+dKP1PKDO+smeOOq
 taV2rKRw4lcs3vvfLD2kF1YZxOoKf6/51oFYEU17lXByfFr2cMBH2EEjgZU7mF5h0/KN
 xTyw==
X-Gm-Message-State: AOAM531u1SQp5nOBlwfyXb0JYAQe0QbMOpyP67FUtgfNtJis9+a6cgRT
 FlqeBa1LZjJ6DQ8+0R4WYq7pE/9GqL5A+w==
X-Google-Smtp-Source: ABdhPJxzudMRIRamP3YXnYYZFzn6VYjpQMdY3ix6rE4haVlqWDlATZnhwR4bRilt2XGPr1Hhw2pRuw==
X-Received: by 2002:a17:90a:319:b0:1be:d55e:af43 with SMTP id
 25-20020a17090a031900b001bed55eaf43mr3175384pje.231.1646724012797; 
 Mon, 07 Mar 2022 23:20:12 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/33] target/nios2: Stop generating code if
 gen_check_supervisor fails
Date: Mon,  7 Mar 2022 21:19:34 -1000
Message-Id: <20220308072005.307955-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Whether the cpu is in user-mode or not is something that we
know at translation-time.  We do not need to generate code
after having raised an exception.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 341f3a8273..1e0ab686dc 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -169,12 +169,14 @@ static void gen_excp(DisasContext *dc, uint32_t code, uint32_t flags)
     t_gen_helper_raise_exception(dc, flags);
 }
 
-static void gen_check_supervisor(DisasContext *dc)
+static bool gen_check_supervisor(DisasContext *dc)
 {
     if (dc->base.tb->flags & CR_STATUS_U) {
         /* CPU in user mode, privileged instruction called, stop. */
         t_gen_helper_raise_exception(dc, EXCP_SUPERI);
+        return false;
     }
+    return true;
 }
 
 /*
@@ -384,7 +386,9 @@ static const Nios2Instruction i_type_instructions[] = {
  */
 static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    gen_check_supervisor(dc);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
     tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
     tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
@@ -447,7 +451,9 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    gen_check_supervisor(dc);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
     if (unlikely(instr.c == R_ZERO)) {
         return;
@@ -474,9 +480,13 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 /* ctlN <- rA */
 static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    gen_check_supervisor(dc);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
     R_TYPE(instr, code);
     TCGv v = load_gpr(dc, instr.a);
 
-- 
2.25.1


