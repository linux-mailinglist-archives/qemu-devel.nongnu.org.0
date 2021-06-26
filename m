Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440073B4D3E
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:53:12 +0200 (CEST)
Received: from localhost ([::1]:43276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx2Bj-0006Oy-0j
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vt-0002Ki-KN
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:49 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:55179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vp-0000OM-Di
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:49 -0400
Received: by mail-pj1-x102b.google.com with SMTP id g24so6685927pji.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eqcIH7qyxMLCC/xbyp4OcZdnc1e2Y1iNmkzCM4CoVhg=;
 b=oVIK8nqsfMINpRqWSPrjF8V3K8o1UbvfMJnB6miqU1hkRHI3KwVsF++1EZbF48rlgm
 SKtMKevmnsnRdBIambUNLDQPEr0rjmVKYmGUwBRQOTvyZA9aBezT+77KUAEO8+E3bdWu
 Vs9lbIT9PAxB2UoTuO5fcdPhJQfw+dWCzfZtpIt9drX+ddev3+VdrdCCicqn4phkJ0qk
 R7X6jg2IUsoK+/j/G1mtC1SxgFrWbxlKChyvm50xAOL511/cVE2hhHYMvPvaKkeeiGWY
 oE0/dtjCwRIhhKYhLADGpfBFsV83h4ZN3YxtcAnRSLIAZjJrvNT9CLdkroSFVJyxlwwP
 rrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eqcIH7qyxMLCC/xbyp4OcZdnc1e2Y1iNmkzCM4CoVhg=;
 b=hpStJmsOWaxc7CjqcxwqNdhmHArTKnkIwHLM+ZC9WbC7F0UaC6aD/zmIDnaqiMtuxs
 Faua7XNVIJY1MXDRYtN3oXyATbq3ybcAwk4+xdKIcZmAu5sLDOIvFjIJcYx6LOzgr0ye
 Phedj3QX0xHGQLVOqu6BUVG3V8+mgGnMuzA0O0YduPMQgO2vKkmMgwjyq+4wZpF/2G1O
 zNbLW6o+2YEAjanYYOXWyaDRu32KyjXbPT8gcx6F6eXeYqFoWUdcqhTnsAt6JptHogYm
 ykGds1GOg20Q87Kr4q5dWPAVdR8QzuqrpFiGwsTmvEmidf+ql/LTJGHE3cRUvJq6QZpk
 8f6A==
X-Gm-Message-State: AOAM532A4IggThiwzuP4xSp4pUytLspq/qTMSDM4se4YBEyL0xazmkoS
 Z+NkPCSYoOD5p0CtqurjoH6Vb6LPvf/mVg==
X-Google-Smtp-Source: ABdhPJw3nzJwfoD7H7x1YcbtI63V84qwT7sytkcLwP2F918XwC2z4L3vL1cK9yTweIEBDVFBSLs+iw==
X-Received: by 2002:a17:90a:9b13:: with SMTP id
 f19mr15148880pjp.229.1624689404095; 
 Fri, 25 Jun 2021 23:36:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/29] tcg: Make use of bswap flags in tcg_gen_qemu_ld_*
Date: Fri, 25 Jun 2021 23:36:21 -0700
Message-Id: <20210626063631.2411938-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can perform any required sign-extension via TCG_BSWAP_OS.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 949cbf2f03..0eac2d1969 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2876,7 +2876,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     orig_memop = memop;
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
         memop &= ~MO_BSWAP;
-        /* The bswap primitive requires zero-extended input.  */
+        /* The bswap primitive benefits from zero-extended input.  */
         if ((memop & MO_SSIZE) == MO_SW) {
             memop &= ~MO_SIGN;
         }
@@ -2889,10 +2889,9 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     if ((orig_memop ^ memop) & MO_BSWAP) {
         switch (orig_memop & MO_SIZE) {
         case MO_16:
-            tcg_gen_bswap16_i32(val, val, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-            if (orig_memop & MO_SIGN) {
-                tcg_gen_ext16s_i32(val, val);
-            }
+            tcg_gen_bswap16_i32(val, val, (orig_memop & MO_SIGN
+                                           ? TCG_BSWAP_IZ | TCG_BSWAP_OS
+                                           : TCG_BSWAP_IZ | TCG_BSWAP_OZ));
             break;
         case MO_32:
             tcg_gen_bswap32_i32(val, val);
@@ -2965,7 +2964,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
     orig_memop = memop;
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
         memop &= ~MO_BSWAP;
-        /* The bswap primitive requires zero-extended input.  */
+        /* The bswap primitive benefits from zero-extended input.  */
         if ((memop & MO_SIGN) && (memop & MO_SIZE) < MO_64) {
             memop &= ~MO_SIGN;
         }
@@ -2976,18 +2975,15 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
     plugin_gen_mem_callbacks(addr, info);
 
     if ((orig_memop ^ memop) & MO_BSWAP) {
+        int flags = (orig_memop & MO_SIGN
+                     ? TCG_BSWAP_IZ | TCG_BSWAP_OS
+                     : TCG_BSWAP_IZ | TCG_BSWAP_OZ);
         switch (orig_memop & MO_SIZE) {
         case MO_16:
-            tcg_gen_bswap16_i64(val, val, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-            if (orig_memop & MO_SIGN) {
-                tcg_gen_ext16s_i64(val, val);
-            }
+            tcg_gen_bswap16_i64(val, val, flags);
             break;
         case MO_32:
-            tcg_gen_bswap32_i64(val, val, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-            if (orig_memop & MO_SIGN) {
-                tcg_gen_ext32s_i64(val, val);
-            }
+            tcg_gen_bswap32_i64(val, val, flags);
             break;
         case MO_64:
             tcg_gen_bswap64_i64(val, val);
-- 
2.25.1


