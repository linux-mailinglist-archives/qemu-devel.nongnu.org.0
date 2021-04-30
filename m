Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B136F374
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:23:27 +0200 (CEST)
Received: from localhost ([::1]:48040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHsM-0000yt-2p
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlH-0002w1-Dl
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:07 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl3-0007X1-Vi
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:06 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so890463pjv.1
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TsKRE3i/n4/0bXPCvuEuwUe3xdoGP8klreSD2fnz1lk=;
 b=o6TyBAN/E3u/JOIDIxuaJDUBZSxd9EqQoPtO2LO0iFRp2gEOg18FY5GsKxtu+5aFeC
 Mu1ITWJHq9Xp9vfwO1/vCdrTECqGV7/Sqv6W9T3C1JBg/Ya9hG6+atsDdhgyNvRztdtx
 U5+RMzjENCu5PZc4AUXVnoinjB+OZlq8gfvXAAfic9LOOxV4R1XzNrAR337m1xUbyyiu
 Ql7xBN5tkMGKM1Jr9i2jE0XKj/xhxBiTehiGIlCDiXZe6kXKjqgBiZuFqSs5DPe0uTcN
 6YYoSNoYEMiy6ELIBDNYOG6Su+7m+zxPVCM5DKQOm7M0ZATdo9nHnvYy8n7Ga/owIZZd
 qbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TsKRE3i/n4/0bXPCvuEuwUe3xdoGP8klreSD2fnz1lk=;
 b=ETYBn9M5e9tBODz6//Fjib+zizNowYeOeg/EiJPGGOYCf0yqhB1Dj2putlHBsiycgw
 6nfTk9UelSbWK54RKBge/siTzSlm6CSWt9TnF/lEIhQE16xRIDDuQL2l+pmgV0wZa0vL
 JUfPiEs13pjbJ6tJV431epkI1PSC3z8dzFm61neXg7HC4FA9HIOa2MbhF/FJt3JwwvVM
 xpJB+WROJFGrki1MzaBC7EUxvRhQW6qtjJJWp6ReI1iRz0n8r7VHr7Gbq0ZZzwE0FE+5
 eMwSLKIXuxiZLfitEu4j/gy7Ku0ARV194R6ZeX50qwR5b3DRtiYHpGRIZesF6HEpeMmI
 KDuw==
X-Gm-Message-State: AOAM5325TwSDvMQQ6hXlc3zpYhoVslPKtmwwj9EXHCYIt86GMBTWV1t2
 WdHIr6pUwhtYdMUleIF5GcmUxv6iYXbAsw==
X-Google-Smtp-Source: ABdhPJz/CbH9vRnZiDv97a2LCSRh6mF36P4ycpd0cfb9++MXHHbbeZqICCk9piHkmv64KUdU7m0spg==
X-Received: by 2002:a17:90a:9f44:: with SMTP id
 q4mr12274182pjv.233.1619745351368; 
 Thu, 29 Apr 2021 18:15:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/30] target/ppc: Simplify gen_debug_exception
Date: Thu, 29 Apr 2021 18:15:23 -0700
Message-Id: <20210430011543.1017113-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Two of the call sites that use gen_debug_exception have already
updated NIP.  Only ppc_tr_breakpoint_check requires the update.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 5efa4d6566..b58e2ac8dc 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -327,19 +327,7 @@ static uint32_t gen_prep_dbgex(DisasContext *ctx)
 
 static void gen_debug_exception(DisasContext *ctx)
 {
-    TCGv_i32 t0;
-
-    /*
-     * These are all synchronous exceptions, we set the PC back to the
-     * faulting instruction
-     */
-    if ((ctx->exception != POWERPC_EXCP_BRANCH) &&
-        (ctx->exception != POWERPC_EXCP_SYNC)) {
-        gen_update_nip(ctx, ctx->base.pc_next);
-    }
-    t0 = tcg_const_i32(EXCP_DEBUG);
-    gen_helper_raise_exception(cpu_env, t0);
-    tcg_temp_free_i32(t0);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(EXCP_DEBUG));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -8040,6 +8028,7 @@ static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
+    gen_update_nip(ctx, ctx->base.pc_next);
     gen_debug_exception(ctx);
     /*
      * The address covered by the breakpoint must be included in
-- 
2.25.1


