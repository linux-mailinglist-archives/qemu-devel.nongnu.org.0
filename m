Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044A956513B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:47:07 +0200 (CEST)
Received: from localhost ([::1]:56836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Ifa-0003Dr-2r
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITQ-0000OJ-7w
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:32 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITO-0004xx-LE
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:32 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so13077932pjl.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQeBQJaJ2cUJJgh8YFxOAc0hMFwb7DTvcTB5KsIPLmU=;
 b=MZC5xessgLibTj1DyM1GrdqcCdAuIcTfGALeC2gX+5ZYPiVgMzHxvxtR5Xt2Rfga/F
 i8HMYRBBVsrq5lUenyYyEb7XTq2WcwwSM6IIk7wlVNmu9zuM0263FBwWqFSsZJlW/qqD
 ALWJOfclCqL8G2ZoC1E7efADOOfsgYClAHJn7spm3iWkjDzwAVn5JWrpp1MBQs8fpKw0
 4AtTfPmlK9TqEyEfXaL8VphErhmqQ/Y1XS/hoashCuiJP32JP+zDsKV+zHoouOHG9dXt
 SUVVr5xy6b2L/Jcc44mqyroedxKT5gGTThgBMvExjcQ59QuluSq3C78+WYk458OnGYU4
 vSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQeBQJaJ2cUJJgh8YFxOAc0hMFwb7DTvcTB5KsIPLmU=;
 b=FNjpo+jCKtu7ReNu32gKc2a/oqbJuPeI5YvOISXZUAty73bgSecV+gJ0lI67do3VqL
 wgRXHRNDcl6KURcdepD1Z8rWPH9yGjXglHj8j+lFXX+57fYdR2kEOrz9bJa63aMyhvfz
 M6pJXF2Cr4SLsQpPltwWJvzC9obb9sJ1DGXEYlj71jyoLQ4+XXH6ZE6jW0AwLSrJuoYn
 RlstjvHDm4ofEzyP9UerKNdlIh6HCPQxP7gvPpGagaQECrA4P6qUh+2Ql9gZJQOMll/W
 nR+E+gYrORXFsW4bHxZlH0x3ylGSl7oNTl2qHxxrgGsdDzBwN3XgZBrUWqF0DMC4VNTb
 mjWA==
X-Gm-Message-State: AJIora8fMdifitkUvgf9Odjc+NDFyZTUfqDOjqpeqAdTJ4s3frD9anv2
 MemOJ2Z4RQ/xHtZ07ip87RdMDbdTfeSUdtn+
X-Google-Smtp-Source: AGRyM1ssHIImnp5O+I5wfSbOcOUR/5tcErlqpaJP6hDMkI615svg2WPAqx37cCqTGc2eJsriwEr4ow==
X-Received: by 2002:a17:90b:3648:b0:1ef:7c45:62cb with SMTP id
 nh8-20020a17090b364800b001ef7c4562cbmr11293046pjb.132.1656927269368; 
 Mon, 04 Jul 2022 02:34:29 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 09/23] target/loongarch: Fix helper_asrtle_d/asrtgt_d raise
 wrong exception
Date: Mon,  4 Jul 2022 15:03:43 +0530
Message-Id: <20220704093357.983255-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

From: Song Gao <gaosong@loongson.cn>

Raise EXCCODE_BCE instead of EXCCODE_ADEM for helper_asrtle_d/asrtgt_d.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220624031049.1716097-10-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c       | 2 ++
 target/loongarch/op_helper.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index e32d4cc269..0013582a3a 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -51,6 +51,7 @@ static const char * const excp_names[] = {
     [EXCCODE_IPE] = "Instruction privilege error",
     [EXCCODE_FPE] = "Floating Point Exception",
     [EXCCODE_DBP] = "Debug breakpoint",
+    [EXCCODE_BCE] = "Bound Check Exception",
 };
 
 const char *loongarch_exception_name(int32_t exception)
@@ -176,6 +177,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
     case EXCCODE_INE:
     case EXCCODE_IPE:
     case EXCCODE_FPE:
+    case EXCCODE_BCE:
         env->CSR_BADV = env->pc;
         QEMU_FALLTHROUGH;
     case EXCCODE_ADEM:
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index d87049851f..df049cec59 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -49,14 +49,14 @@ target_ulong helper_bitswap(target_ulong v)
 void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
     if (rj > rk) {
-        do_raise_exception(env, EXCCODE_ADEM, GETPC());
+        do_raise_exception(env, EXCCODE_BCE, 0);
     }
 }
 
 void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
     if (rj <= rk) {
-        do_raise_exception(env, EXCCODE_ADEM, GETPC());
+        do_raise_exception(env, EXCCODE_BCE, 0);
     }
 }
 
-- 
2.34.1


