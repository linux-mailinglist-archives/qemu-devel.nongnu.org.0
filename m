Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B896AB402
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:52:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYz12-00023x-P7; Sun, 05 Mar 2023 19:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYz0o-0001EX-DE
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:47:36 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYz0l-00083h-SQ
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:47:33 -0500
Received: by mail-pl1-x629.google.com with SMTP id p20so8476709plw.13
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xyrHR54CsDUJFtmjo+tDaKZCG9mCZOTIwNBxAWSn2dY=;
 b=tbzAkqYAM9PBCu2+NEr9Mybbw0kTekC0KNhrhVCJ0FK9RQTV67r0/HoVYjeWJSIaG4
 ZoBKdWN43m2szr8tvfEGfe5LcK+j9JmNwHDtcQ1Vw3SOokQuyR3Ecp1o1MuVnU+XFNoJ
 oh4R440/uEL1ZsT4zB/kWV2VujS95LO0Fqrg2pTSuPRUl4U2H/CieSOvmHSGz8Zwh9GH
 VkHy529R1+in6fMmjwmAr16kM2NqcKsZYig3aFI4T7y/mSNglH0I7CjFLuwbHniNtGPa
 DqqZMZSnnwKtPp/xRQdmKgySJazRdfDK9iqPbF7VZM6qxC6PCQDfZNMQgs6DOZ49QD8D
 js1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xyrHR54CsDUJFtmjo+tDaKZCG9mCZOTIwNBxAWSn2dY=;
 b=PTuoGjmoAQyKSFKgYcjgODnjjp6PrG2aq04CdRqTdutPUw40AmcvEo4S6nJTCoU6VY
 FWyF52twP289wM+FFrM/Hg6HgN7Gk5t7NgTPnc7Uq2IoocRIP2YAS9PhtGhAMl7DhUDl
 +EBJ8xnX/fEUB12m5b5ADvh1UnKp45+/98ILLxrkX0oPDCYY86ojbTxENyJpQgYcFYA7
 OC+cVSujxOv8qI4zQPhJ+7ezA0GYdLaQ5iDzOK/LyNSX3PnBUyVqZFLXlWaHSywurR7L
 y9AJgJRZB66tAme3BcFR4v6RKSw3kxJmxTXE1IbW/rcP/Ay3nOcFejug+oRCkdixN/XU
 KbXw==
X-Gm-Message-State: AO0yUKXSmuO7bVSj8hPc21LfvSE4+syuxlLPpT/4RcRtBtvtidb4If1r
 IttmQ26ViIR4Yf33+mOET7n89HO6Xwt7vUmorm2FJQ==
X-Google-Smtp-Source: AK7set8dlOWH8p794irfG20lsaXColJu+b9EasU3ow3Pgy7K9TmjyjrEpfY+db/Md9V/2Q7PYnGAVg==
X-Received: by 2002:a17:90a:52:b0:233:b20f:e646 with SMTP id
 18-20020a17090a005200b00233b20fe646mr9573862pjb.0.1678063649164; 
 Sun, 05 Mar 2023 16:47:29 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 mv15-20020a17090b198f00b0023087e8adf8sm4971492pjb.21.2023.03.05.16.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:47:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 82/84] target/xtensa: Use tcg_gen_subfi_i32 in translate_sll
Date: Sun,  5 Mar 2023 16:39:52 -0800
Message-Id: <20230306003954.1866998-83-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 41b84082de..2903c73f8e 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -2324,8 +2324,8 @@ static void translate_sll(DisasContext *dc, const OpcodeArg arg[],
         tcg_gen_shl_i32(arg[0].out, arg[1].in, dc->sar_m32);
     } else {
         TCGv_i64 v = tcg_temp_new_i64();
-        TCGv_i32 s = tcg_const_i32(32);
-        tcg_gen_sub_i32(s, s, cpu_SR[SAR]);
+        TCGv_i32 s = tcg_temp_new();
+        tcg_gen_subfi_i32(s, 32, cpu_SR[SAR]);
         tcg_gen_andi_i32(s, s, 0x3f);
         tcg_gen_extu_i32_i64(v, arg[1].in);
         gen_shift_reg(shl, s);
-- 
2.34.1


