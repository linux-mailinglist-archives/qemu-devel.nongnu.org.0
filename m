Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D33531D35
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 22:58:19 +0200 (CEST)
Received: from localhost ([::1]:46020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntF86-0003tH-UT
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 16:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy3-0008JS-Bn
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:55 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy0-00051M-Lk
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:54 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so356372pjf.5
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FY/9m2bfUciW+9b94QolKYkajfJbMNVAwbOW4VNUDuA=;
 b=q2mOQ/7gXRasaJZ0j5wfFTvfn8D7hgG8IkRZxKB0W51H6pRe6PJoe+GKxIKiS4RKUp
 xA+V8avPrPZe5GbCM67VklBZU8QjeyZh+3a9mh/hDjZg/DD2WVNr/PWGlzvKd8JIEjJ8
 yoQ/J5OvUzH/9FWdSNKNP2hx4oP/E1ss4XQwaeM1czWNRu2GMZm5jiagliJXZLBmxjWL
 6UImFu5tumloGriaLmmPWrNW6nFyYvMbdlv6ingPACBsmoBklijhNptG4UWGQJ+cwM1p
 hmlhN74GNhjvYX97yueGBuvRYEWSIT0yMUpSMaRazFlcyrg26lY67hMWTWycQIFVs5Tg
 6/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FY/9m2bfUciW+9b94QolKYkajfJbMNVAwbOW4VNUDuA=;
 b=uxR070e0fb8NQTFq5/VqV4uxvBnTZYJQM2jUGs+8goSmMZTJVq0UrDoQ0XmTugXDCa
 aww17IO45TxaCiYczPymaJjbGx5sVEpiXISPprf4N6FJ1KSLJ6rofrbhn2k1IqBrya8n
 80KEnIFq5nr19W1D04yz5fwpbf7z1dYfBNwmhY4rb7U/0My4DnzFsBEg9bnu/VE8os7n
 t41TDFqEJoAzvTr2UUlneTvayt8oGrFSdGpPXpVPWNmmNoJ7i9H+aOveWXmzZcRjMf1d
 JH42mj+b1CESelQJUs6KT+ukLJ2cAa+aZLqD3GP918vhoGplas9TAHi6VxVoia1Oob2Z
 JE1Q==
X-Gm-Message-State: AOAM532iJXxOmLE5bztjnplLrIztw9CKPheierJU6JAWcQ5IyWuwZ+pJ
 CXkcq0RPcW4HyMD6HkMS23ey77unlSNhAg==
X-Google-Smtp-Source: ABdhPJxf3DVK4Jx/BNmx12Z+1MnZ8StA0Iy4qHtLKOQGDQXZCHA4q678anGULLVWe+ZFiHwSQ/omlw==
X-Received: by 2002:a17:90b:4c4d:b0:1df:a164:7055 with SMTP id
 np13-20020a17090b4c4d00b001dfa1647055mr849515pjb.180.1653338871021; 
 Mon, 23 May 2022 13:47:51 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/18] target/arm: Hoist arm_current_el in
 arm_generate_debug_exceptions
Date: Mon, 23 May 2022 13:47:31 -0700
Message-Id: <20220523204742.740932-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Read this value once in the main function, and pass it
around between the subroutines.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 20a0e4261a..2bbf065b3a 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -13,9 +13,8 @@
 
 
 /* See AArch64.GenerateDebugExceptionsFrom() in ARM ARM pseudocode */
-static bool aa64_generate_debug_exceptions(CPUARMState *env)
+static bool aa64_generate_debug_exceptions(CPUARMState *env, int cur_el)
 {
-    int cur_el = arm_current_el(env);
     int debug_el;
 
     if (cur_el == 3) {
@@ -43,18 +42,16 @@ static bool aa64_generate_debug_exceptions(CPUARMState *env)
     return debug_el > cur_el;
 }
 
-static bool aa32_generate_debug_exceptions(CPUARMState *env)
+static bool aa32_generate_debug_exceptions(CPUARMState *env, int cur_el)
 {
-    int el = arm_current_el(env);
-
-    if (el == 0 && arm_el_is_aa64(env, 1)) {
-        return aa64_generate_debug_exceptions(env);
+    if (cur_el == 0 && arm_el_is_aa64(env, 1)) {
+        return aa64_generate_debug_exceptions(env, cur_el);
     }
 
     if (arm_is_secure(env)) {
         int spd;
 
-        if (el == 0 && (env->cp15.sder & 1)) {
+        if (cur_el == 0 && (env->cp15.sder & 1)) {
             /*
              * SDER.SUIDEN means debug exceptions from Secure EL0
              * are always enabled. Otherwise they are controlled by
@@ -82,7 +79,7 @@ static bool aa32_generate_debug_exceptions(CPUARMState *env)
         }
     }
 
-    return el != 2;
+    return cur_el != 2;
 }
 
 /*
@@ -99,10 +96,12 @@ static bool aa32_generate_debug_exceptions(CPUARMState *env)
  */
 bool arm_generate_debug_exceptions(CPUARMState *env)
 {
+    int cur_el = arm_current_el(env);
+
     if (env->aarch64) {
-        return aa64_generate_debug_exceptions(env);
+        return aa64_generate_debug_exceptions(env, cur_el);
     } else {
-        return aa32_generate_debug_exceptions(env);
+        return aa32_generate_debug_exceptions(env, cur_el);
     }
 }
 
-- 
2.34.1


