Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7596536FBC7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:52:57 +0200 (CEST)
Received: from localhost ([::1]:45118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTZg-0000Y7-EL
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBe-000620-Me
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:06 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBT-0003wx-55
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:06 -0400
Received: by mail-wr1-x42e.google.com with SMTP id n2so17424077wrm.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WsY/6TlhQWmplPggiqYU8UZ1d8KHNZozZRTEu9NaL7o=;
 b=Wx4Hwyt5xn60isixYQbAw2hFeN7zOLx26Pv6gvkr+nK5770QPlTGW7gohbEqh05/uq
 yKYO0ehF5A+qwq6PPupxbKLG8iFz/11AOrH2Iy4C9Gjf/TTmid1sPk1yJmoyy5Mb6gTm
 oymcs66+XGQgxFEor756lIukrYnAJSyR1ET/n+s3xarq5oMrK5gZwNuBhdYxwq1KwOs4
 gbaPa/9A4E/1y/cVAN2dr6ae7MnYwv/1RVUFouyL3vAmKIPyRSc4oeKphCE2H0C/cAlD
 cLrMnKFGQbymYaH//SrtQBCakFEoKpRQa82c2VF5q1H87/Jx2NcyU0rlBd5ABZ5+j7BU
 tSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WsY/6TlhQWmplPggiqYU8UZ1d8KHNZozZRTEu9NaL7o=;
 b=fmYEy1UvjaBj5bDPOc8X2Xm6erg7QePzCeRKLb9dhB9LymH1onxb5Vis0MSifPz92m
 FNTTgErvicb9gz2hOMS2qCTgywWKLArFMW7zy5uAhXKgE7XjKA2kL14UghHIrmoVnL/L
 X0I1CN4Qg/9rvY6FixVdPff7IzwG+EdVQAFx/QBj+E/edGf4IftbA9rXnusTtGuwSuXK
 KnpUnIsWd5s5lchYk5xMZvAAl0xM7oQse8E5yNMZZzVZ3mniG1OUODRpIa/DR/dhxyXA
 vRjvV1nhL2LFjXCF+XGL1/yOP03hyWlXMjPYodtwBoh47O3MRxOW1lSM5cY5sHTHnS/x
 JizQ==
X-Gm-Message-State: AOAM531aOi4y+Olu5WGq+QYRyHRHKldPyBmuFiYGN7BEj5q891gqB0KP
 DuUqcXwXSoJH7lNIP8uhPCn6/3pktgfxLDy0
X-Google-Smtp-Source: ABdhPJwpw/JC49hDABjlwZ8A4tW8MJaWYTX5YSKb9RHVYo0SxA0r0WDWYwY9JA7KVBiOgKSgLRNRpQ==
X-Received: by 2002:adf:9b96:: with SMTP id d22mr6933345wrc.225.1619789271396; 
 Fri, 30 Apr 2021 06:27:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm2420349wrx.15.2021.04.30.06.27.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 06:27:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/13] target/arm: Move NeonGenThreeOpEnvFn typedef to
 translate.h
Date: Fri, 30 Apr 2021 14:27:38 +0100
Message-Id: <20210430132740.10391-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430132740.10391-1-peter.maydell@linaro.org>
References: <20210430132740.10391-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the NeonGenThreeOpEnvFn typedef to translate.h together
with the other similar typedefs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 2 ++
 target/arm/translate.c | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 8130a3be29d..12c28b0d32c 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -409,6 +409,8 @@ typedef void NeonGenOneOpFn(TCGv_i32, TCGv_i32);
 typedef void NeonGenOneOpEnvFn(TCGv_i32, TCGv_ptr, TCGv_i32);
 typedef void NeonGenTwoOpFn(TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void NeonGenTwoOpEnvFn(TCGv_i32, TCGv_ptr, TCGv_i32, TCGv_i32);
+typedef void NeonGenThreeOpEnvFn(TCGv_i32, TCGv_env, TCGv_i32,
+                                 TCGv_i32, TCGv_i32);
 typedef void NeonGenTwo64OpFn(TCGv_i64, TCGv_i64, TCGv_i64);
 typedef void NeonGenTwo64OpEnvFn(TCGv_i64, TCGv_ptr, TCGv_i64, TCGv_i64);
 typedef void NeonGenNarrowFn(TCGv_i32, TCGv_i64);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 58cb3e8aafe..7ff0425c752 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -66,9 +66,6 @@ static const char * const regnames[] =
     { "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
       "r8", "r9", "r10", "r11", "r12", "r13", "r14", "pc" };
 
-/* Function prototypes for gen_ functions calling Neon helpers.  */
-typedef void NeonGenThreeOpEnvFn(TCGv_i32, TCGv_env, TCGv_i32,
-                                 TCGv_i32, TCGv_i32);
 
 /* initialize TCG globals.  */
 void arm_translate_init(void)
-- 
2.20.1


