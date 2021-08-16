Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983D23EDED9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 22:56:12 +0200 (CEST)
Received: from localhost ([::1]:59378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFjeV-0007I0-K3
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 16:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFja6-000878-EE
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:39 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:45004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFja4-0002xn-Us
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:38 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so759433wml.3
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 13:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fOI0Xq/yRFXEojrjAhdK5X3UPqy2n/2RHJEemazAjlo=;
 b=I/TZCly8B9D4v8JLkUYNqDn7e6rMgW4/LWc2oYrOKZaJmwfPzJhKyzg9umsDNMyc9V
 tAo0WdGWyxDYagtzKwdlvuSyrKAbHqFRX1MNTHKT2lZ+eqKnBom+4cxPXEuzyoQACIqc
 2BjH81uwyQbfcVyJ4YBJDzFPHnC6VMFm+U93lyy3XsZZmrPxEDuoVADWlPf0jLV00/8k
 YtRwcD9RKuWgnanReFZhm5Xwj5yTCshhcWxT5+pVXol8SSHvc0j6gf7W6maPJWrXaeFt
 tCUt8j6GllYXXSpnbOTNmP8GKW6KzGlry27HJjAl7fqUWDDov6BMjRYcslj4FbKRJHs3
 UNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fOI0Xq/yRFXEojrjAhdK5X3UPqy2n/2RHJEemazAjlo=;
 b=t7iJx8SJY2rsGX60MiGKqv6zHfKKDFzAt7OfgRBpBda1OnrzejhDDS9MyAWor//x7n
 Hy2H4N4XkjDcSDG6Ci9X42L95Mo+LQ02LvRKt50HrQCxyVg47wh0ihqqQsPwf0WffCoS
 APdXwKb/NLk2zzNVhPVeA1BSzdgOxXhukHR8KXxwxks21EjXuIxOh38ABCY547V8dONP
 5UcicSkTjUNy/gKRi5mXCZ772c0pkpBv2O+RQX97bMmxuCll7pP4uSLBAbdxhP0UTY0z
 ibObdffUzCsSi5EleOB5E6zAhN2An7YM6EP234jkngqC2JiZCdUG5g0IAX+8/sl5JUyp
 IMlw==
X-Gm-Message-State: AOAM5307/kph3GMSULj+rzZ8L4gadsqfjG0f1BpPGg7k3Uv8z84jqL/j
 +MZilyJVGDi+vWckL1f/8Tj4N1H+8cg=
X-Google-Smtp-Source: ABdhPJyMONWKjI1Qphje7irLm5DgISEG2liC2xcU2WvLCTYgdcKJmTjqZWabsaSa3TSeAPkwepYc6w==
X-Received: by 2002:a7b:ce04:: with SMTP id m4mr103708wmc.110.1629147095223;
 Mon, 16 Aug 2021 13:51:35 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 d8sm357996wrv.20.2021.08.16.13.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 13:51:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] target/mips: Simplify gen_helper() macros by using
 tcg_constant_i32()
Date: Mon, 16 Aug 2021 22:51:03 +0200
Message-Id: <20210816205107.2051495-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816205107.2051495-1-f4bug@amsat.org>
References: <20210816205107.2051495-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In all call sites the last argument is always used as a
read-only value, so we can replace tcg_const_i32() temporary
by tcg_constant_i32().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


