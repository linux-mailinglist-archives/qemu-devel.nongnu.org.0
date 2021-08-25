Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A343F75B5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:16:12 +0200 (CEST)
Received: from localhost ([::1]:60342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIslH-0007c3-At
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZF-0001Uj-S7
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:45 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZD-0002io-Gf
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:45 -0400
Received: by mail-wm1-x330.google.com with SMTP id u15so14938723wmj.1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SCGtr+SIQn/N/P6p7BcepUHOHI6/8VxeqrYznn/oHQY=;
 b=E+4sTVqcSdJaxelbinAhJa1afSiGfXeMdOT8FNmU7FsI8kqjBndz4UNreApQ1EDn7v
 fzuUEjZ/MIHf15cCcZB8GFd+CygCzSEB+rx0qoUlbOuTbdG6xrQFcgjYEK6gjsJP/kB4
 IU/748YutA8kYuiWuEA/MiM0qCnjO7JCD6S2U0yhdjwOzEIBMLhSoRJmGZ3+ZHy811Qb
 opZAMlpV4gLzmV5p729nnFwPIbFAyEhI4GjsTqiqKn+cxoDZ2m63Ix5Tcy81RNJ/efu7
 5L1BBpGVyWnDK9xpR/ago/4tGy8ftX1W427/bRw7TnxCBxXgq1Vwm6rs+0/3cIQLvKvQ
 zM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SCGtr+SIQn/N/P6p7BcepUHOHI6/8VxeqrYznn/oHQY=;
 b=brbhc38vdJRRoVenofdnWkkeNN3pwdU0yblApTRW/OdGkEMqyzvq+3LF0138GZ71dT
 IXTQV9Fxbs39gR2jqGYBUavbxR1BeqK7a1/7SyQWGQqmOdXy792y44WywjMW3nBqqTki
 sRBw3d0ZGFF+p+mDVEApZhC7HJXMleR2S6xOhD1ZzC+hUSgI2oFWwZ7s5s3uaOmcX1h+
 KNPeZo+WcsErDOwOFOz3YTgLkOIArYUJEzFsFLG5OOcs1XuVVAJSIsvRYBeVt/rgfP+j
 v5hvgFiPELwQx2M85ollx5QlKHU5X+nzbnEuaD4AE+Slc1pEn7WovNY+f+nfnZ6KXz6x
 Z5Ng==
X-Gm-Message-State: AOAM533ZJnKuFJK2tCXuMI4EQipPH2diOdGQmt0BCIDKnhUhvQXKsIxE
 PEoe+9BEfQtJ4djm8U+/ywUNE5fiblg=
X-Google-Smtp-Source: ABdhPJzW0ZVIJTRIfm+0T2LLXSuk0ReE/rkjAbPN3/xBP11LzKRuYrmK1N+sgJxHMWPnZWHajL6S+g==
X-Received: by 2002:a7b:c927:: with SMTP id h7mr8334478wml.154.1629896621956; 
 Wed, 25 Aug 2021 06:03:41 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 v21sm2082997wra.92.2021.08.25.06.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:03:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/28] target/mips: Simplify gen_helper() macros by using
 tcg_constant_i32()
Date: Wed, 25 Aug 2021 15:02:02 +0200
Message-Id: <20210825130211.1542338-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In all call sites the last argument is always used as a
read-only value, so we can replace tcg_const_i32() temporary
by tcg_constant_i32().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210816205107.2051495-5-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index a6df9beb670..3417fc433ff 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1214,33 +1214,23 @@ TCGv_i64 fpu_f64[32];
 #include "exec/gen-icount.h"
 
 #define gen_helper_0e0i(name, arg) do {                           \
-    TCGv_i32 helper_tmp = tcg_const_i32(arg);                     \
-    gen_helper_##name(cpu_env, helper_tmp);                       \
-    tcg_temp_free_i32(helper_tmp);                                \
+    gen_helper_##name(cpu_env, tcg_constant_i32(arg));            \
     } while (0)
 
 #define gen_helper_0e1i(name, arg1, arg2) do {                    \
-    TCGv_i32 helper_tmp = tcg_const_i32(arg2);                    \
-    gen_helper_##name(cpu_env, arg1, helper_tmp);                 \
-    tcg_temp_free_i32(helper_tmp);                                \
+    gen_helper_##name(cpu_env, arg1, tcg_constant_i32(arg2));     \
     } while (0)
 
 #define gen_helper_1e0i(name, ret, arg1) do {                     \
-    TCGv_i32 helper_tmp = tcg_const_i32(arg1);                    \
-    gen_helper_##name(ret, cpu_env, helper_tmp);                  \
-    tcg_temp_free_i32(helper_tmp);                                \
+    gen_helper_##name(ret, cpu_env, tcg_constant_i32(arg1));      \
     } while (0)
 
 #define gen_helper_1e1i(name, ret, arg1, arg2) do {               \
-    TCGv_i32 helper_tmp = tcg_const_i32(arg2);                    \
-    gen_helper_##name(ret, cpu_env, arg1, helper_tmp);            \
-    tcg_temp_free_i32(helper_tmp);                                \
+    gen_helper_##name(ret, cpu_env, arg1, tcg_constant_i32(arg2));\
     } while (0)
 
 #define gen_helper_0e2i(name, arg1, arg2, arg3) do {              \
-    TCGv_i32 helper_tmp = tcg_const_i32(arg3);                    \
-    gen_helper_##name(cpu_env, arg1, arg2, helper_tmp);           \
-    tcg_temp_free_i32(helper_tmp);                                \
+    gen_helper_##name(cpu_env, arg1, arg2, tcg_constant_i32(arg3));\
     } while (0)
 
 #define DISAS_STOP       DISAS_TARGET_0
-- 
2.31.1


