Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A8B6F5207
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:42:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6qM-0002lF-Fx; Wed, 03 May 2023 03:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qF-0002DG-8O
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:59 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qD-0001kk-CM
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:58 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so47784575e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098635; x=1685690635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=86y/g1SMgEL0zBYZDOFR1Mk4cwZVQwJ7G23ylT3lr78=;
 b=ZxINublJdFlyHyxpDjBs8JlLemylyKMlP8BhAiP9udpA29CxWGFU/mtGjzsPIOx9Tp
 QaEgUCfq+3P+PHrEzPySpUVJL0mFgWN+bTLZ3TO4dNRQRCXg0F1ABG/90sm8RdKjmsCL
 c+iN890KHbE1Fvc0P/mADQYxSANf9QUKvS5xoMwMHWWd5hr8axh81PzGyKU5bgUlsRo5
 ULbdwiDWpTS15v1IuChLzS6Jo1SamXpeJTvqLKGi5RoU6dxbEqkEThdeDrZ0w69xpf8e
 +b3V/jhl6FzrdAYKkMgSm0EVwWcBFBZmrPI1PpUh4kCPYXp4b3LbH+D5rB03kfhjb9hs
 Z8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098635; x=1685690635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=86y/g1SMgEL0zBYZDOFR1Mk4cwZVQwJ7G23ylT3lr78=;
 b=MCcNyoV7h62N6z2hmNOqoOvxvrdcmo1PAuJitWKtg/e+AAwgo5dsZ8ilwj7DRMaK7p
 7OMgkt9R21vSVtq51TEIuv3C5tjBIgh9rd9N4u9LIGnkekLPeP5YNSdFPBVo8raMFk1F
 Xbq7bKRoyFXLxKpnqOdsuZfgO7db9IbKvmiCBVOdV/3x/C/gLq15qMD/0PXmG2lovhtK
 o4YpwPB+Y1FCWYIzQO9KqFR82UdQzatlfP70uQhhMOItQqvl/tzAdFuwqwUiSvwiIxm/
 X58AiAmZS1v2mShcWGHfnG6opFsfAs6y8BENGO+r9wrc6qc/vAo7dWwvam966hsOvfJt
 yvmA==
X-Gm-Message-State: AC+VfDyN1KzKMP8RP9ag6zrUIUHnCaeoR/pVU6igt6U7TNxG5pibDM/D
 ePKsEke9o6IU/NgYwAimRQoa0KifPZ3DDqm90+qn1A==
X-Google-Smtp-Source: ACHHUZ6v200iMehh/Io5UQK5Z+R5XMf7JsCgJIGLgcKhvjlX11YlkS1ckOxL3YVRoR4kYaDqoMEF6A==
X-Received: by 2002:adf:d4ca:0:b0:2f6:8ca4:a71e with SMTP id
 w10-20020adfd4ca000000b002f68ca4a71emr13126928wrk.52.1683098635730; 
 Wed, 03 May 2023 00:23:55 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 29/84] tcg: Remove TARGET_LONG_BITS, TCG_TYPE_TL
Date: Wed,  3 May 2023 08:22:36 +0100
Message-Id: <20230503072331.1747057-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
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

All uses replaced with TCGContext.addr_type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 45f5ce0fa1..16dab1b6e3 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -5475,12 +5475,7 @@ static void tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
     next_arg = 1;
 
     loc = &info->in[next_arg];
-    if (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 64) {
-        nmov = tcg_out_helper_add_mov(mov, loc, TCG_TYPE_I64, TCG_TYPE_TL,
-                                      ldst->addrlo_reg, ldst->addrhi_reg);
-        tcg_out_helper_load_slots(s, nmov, mov, parm);
-        next_arg += nmov;
-    } else {
+    if (TCG_TARGET_REG_BITS == 32 && s->addr_type == TCG_TYPE_I32) {
         /*
          * 32-bit host with 32-bit guest: zero-extend the guest address
          * to 64-bits for the helper by storing the low part, then
@@ -5494,6 +5489,11 @@ static void tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
         tcg_out_helper_load_imm(s, loc[!HOST_BIG_ENDIAN].arg_slot,
                                 TCG_TYPE_I32, 0, parm);
         next_arg += 2;
+    } else {
+        nmov = tcg_out_helper_add_mov(mov, loc, TCG_TYPE_I64, s->addr_type,
+                                      ldst->addrlo_reg, ldst->addrhi_reg);
+        tcg_out_helper_load_slots(s, nmov, mov, parm);
+        next_arg += nmov;
     }
 
     switch (info->out_kind) {
@@ -5648,12 +5648,7 @@ static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
 
     /* Handle addr argument. */
     loc = &info->in[next_arg];
-    if (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 64) {
-        n = tcg_out_helper_add_mov(mov, loc, TCG_TYPE_I64, TCG_TYPE_TL,
-                                   ldst->addrlo_reg, ldst->addrhi_reg);
-        next_arg += n;
-        nmov += n;
-    } else {
+    if (TCG_TARGET_REG_BITS == 32 && s->addr_type == TCG_TYPE_I32) {
         /*
          * 32-bit host with 32-bit guest: zero-extend the guest address
          * to 64-bits for the helper by storing the low part.  Later,
@@ -5665,6 +5660,11 @@ static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
                                ldst->addrlo_reg, -1);
         next_arg += 2;
         nmov += 1;
+    } else {
+        n = tcg_out_helper_add_mov(mov, loc, TCG_TYPE_I64, s->addr_type,
+                                   ldst->addrlo_reg, ldst->addrhi_reg);
+        next_arg += n;
+        nmov += n;
     }
 
     /* Handle data argument. */
@@ -5710,7 +5710,8 @@ static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
         g_assert_not_reached();
     }
 
-    if (TCG_TARGET_REG_BITS == 32 && TARGET_LONG_BITS == 32) {
+    if (TCG_TARGET_REG_BITS == 32 && s->addr_type == TCG_TYPE_I32) {
+        /* Zero extend the address by loading a zero for the high part. */
         loc = &info->in[1 + !HOST_BIG_ENDIAN];
         tcg_out_helper_load_imm(s, loc->arg_slot, TCG_TYPE_I32, 0, parm);
     }
-- 
2.34.1


