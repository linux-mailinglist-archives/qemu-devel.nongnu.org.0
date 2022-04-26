Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46B95104B1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:54:59 +0200 (CEST)
Received: from localhost ([::1]:36692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOSo-0007cd-Te
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5v-00036N-92
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:23 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:44924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5s-0003ud-K0
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:18 -0400
Received: by mail-pl1-x632.google.com with SMTP id j8so30704656pll.11
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j8ZzQJaFsLEhBqWaL0qX7yYVNAnc01NjxlTahTgdBew=;
 b=WoLXpdwGRb2nL1ysk4INTaM1lP8ndGyl7aus2HzolylQSxLcjOn56VXsRKsb6Km87Q
 l0lqiSWhdld+5pQN0efcEaLIo0Nw3UuKP03spBrZc+NtSp+WS5OeRYy5pfSZJ5+Fatp7
 Y+30BuRMLRJ2LuKdI6cWxevBhCB1ONqvNO4MApaxIOUsZluKOdLugOMbaDw7+m6cQw2m
 JMFqpt7cmT1QNj5EeW+lb6ub/kRVr2B8zAheDzu2p4r14gVkYxjb6FpayQYtPTOj/s07
 dQOl0WBqgLneEdWEE/gsyQj+KqxD0dgSFfWqPfYYEGeA8v96st/YBcK89gWMarvMQx/L
 R3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j8ZzQJaFsLEhBqWaL0qX7yYVNAnc01NjxlTahTgdBew=;
 b=biSipIrursEfIz5Kt7OVLnpAHgDp2Yvk+CoXEdU9YR03c7oqkH1/hRnIDHrMlxR7Ru
 pLYaAgkIQWCZjaAg6YoPYQpRMIbWI256KpwS4i2MA04GtkRCg1bHSEq4rQMOgPZtAoc9
 NukzuLL3Fc8QWde+K19BbUSdmmajhzzS8D/wutgCEIvbB7ltiMRqa1kMoDf7de4rEeN3
 mxUN0nWnQe3uvYMWXOlMND7NyVZDmWmOmR9pEA/HA0rhUsoHd9xuHOFmzK462QgdvNzo
 w1Smb7amfH85ZVAKtJvqg7HCupsu+v1A6c6jKlGcve/1gAQg9vbAg7yiUH0X1NojkpNo
 ay9g==
X-Gm-Message-State: AOAM532ROtQJJpnMIcF8Gf9vc89bKUWqy+mE2UajIUDtxuAhlLMmB+9+
 uT+beozxE13ckAq7Gpsv11Xje1WfMdDFxA==
X-Google-Smtp-Source: ABdhPJyow8n4FIHQFYmsGT/Q7zxJSio/nVU3M4LUX8zUWGF0BRMTinusmPGvUrHFrzA8EtY4Ij9N5g==
X-Received: by 2002:a17:90a:ba15:b0:1c6:7873:b192 with SMTP id
 s21-20020a17090aba1500b001c67873b192mr27873659pjr.76.1650990674784; 
 Tue, 26 Apr 2022 09:31:14 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 32/47] target/arm: Use tcg_constant in LDM, STM
Date: Tue, 26 Apr 2022 09:30:28 -0700
Message-Id: <20220426163043.100432-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 24e522e1d6..e0469da0a1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8050,7 +8050,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
 {
     int i, j, n, list, mem_idx;
     bool user = a->u;
-    TCGv_i32 addr, tmp, tmp2;
+    TCGv_i32 addr, tmp;
 
     if (user) {
         /* STM (user) */
@@ -8080,9 +8080,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
 
         if (user && i != 15) {
             tmp = tcg_temp_new_i32();
-            tmp2 = tcg_const_i32(i);
-            gen_helper_get_user_reg(tmp, cpu_env, tmp2);
-            tcg_temp_free_i32(tmp2);
+            gen_helper_get_user_reg(tmp, cpu_env, tcg_constant_i32(i));
         } else {
             tmp = load_reg(s, i);
         }
@@ -8123,7 +8121,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
     bool loaded_base;
     bool user = a->u;
     bool exc_return = false;
-    TCGv_i32 addr, tmp, tmp2, loaded_var;
+    TCGv_i32 addr, tmp, loaded_var;
 
     if (user) {
         /* LDM (user), LDM (exception return) */
@@ -8166,9 +8164,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         tmp = tcg_temp_new_i32();
         gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         if (user) {
-            tmp2 = tcg_const_i32(i);
-            gen_helper_set_user_reg(cpu_env, tmp2, tmp);
-            tcg_temp_free_i32(tmp2);
+            gen_helper_set_user_reg(cpu_env, tcg_constant_i32(i), tmp);
             tcg_temp_free_i32(tmp);
         } else if (i == a->rn) {
             loaded_var = tmp;
-- 
2.34.1


