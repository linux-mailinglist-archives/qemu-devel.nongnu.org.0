Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09752591557
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:12:23 +0200 (CEST)
Received: from localhost ([::1]:53392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZ8w-0000wS-01
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ5F-0003m7-UZ
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:33 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ5E-0006ZW-5N
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:33 -0400
Received: by mail-pf1-x42d.google.com with SMTP id d20so1586301pfq.5
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3ScK9gYYd7Yu/4MmJJp6WEZrowwZuhBtdiXOVA7xdaE=;
 b=kkBWTwoBOwkVMMHFNJouGD3B7xIvN9OSCSou9+TDK/86tEKfInZ0HSC0pF/j6Mk1NY
 LvYL9TDISHiNRjHS49Dx0qSQCTCRY86+mYMyz79xzz96EEAjlu0yXswLNOZ/ycGJWz8/
 ojC1ZQ5dOIcSlHQ+YDLJpydPYASpe9/GE0mywWreyzx3BwetR65vABnFivMdgpdACQQm
 F5rBToAbBooixIjh+NB7KMr6D/RTU0UgNzEDjMZjekOGR86w9pAtcnMHPMWjvVpszZVs
 mApT68C68auAUPUtmPOSHZdMoLg4ahW5nnVJAxqE7osFi69jKpLGylM20P8MFAGebY+5
 1dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3ScK9gYYd7Yu/4MmJJp6WEZrowwZuhBtdiXOVA7xdaE=;
 b=KIBls5Kffv4O8uS5FlccD2Gu1Gs86bDViX1Q7KxxyocYfDRroRec/CID+A9A72C+d2
 cGhoucbZ0ogdDs8A2/jNjTk1FL1vnOos7pKo6xIxUoubXSD5rdXJwQmreCgedWIAe8Ph
 MSDkyZBD3stKdVSsAhzPww6T6nMbnEJRNawoyInlPf7xANvmF0iKUJaCWEW3pn0aN5en
 ZHCepGRqcgnQC4l3X5UtIvbndbHubSEhWKBzaZYQD4IgqXIrxQqCEOSZXPMhjD76LEs9
 8mGTs953DAJpGCHmvOOFDaOkaqx+erJ8ANIxHPl7KKMo+17MbYehl2Q6ovmc1sZawZhN
 8IHg==
X-Gm-Message-State: ACgBeo1rCnKp06AojEzkXxxyQtPXu7/L3xSHl4T+dblXRpGTDTpOG5vR
 LkRwYDY0d/0EMScpfD9LTcN4YrODRPZiww==
X-Google-Smtp-Source: AA6agR5FUz57CWc/wyvMi7aog0y6I6Pl1FTOT1StYLKvF2dOS58af4EOHjViY1gAekW2WpktSn0m1g==
X-Received: by 2002:a63:68c1:0:b0:421:a023:f830 with SMTP id
 d184-20020a6368c1000000b00421a023f830mr3986726pgc.15.1660327710820; 
 Fri, 12 Aug 2022 11:08:30 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 18/21] accel/tcg: Remove translator_ldsw
Date: Fri, 12 Aug 2022 11:08:03 -0700
Message-Id: <20220812180806.2128593-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

The only user can easily use translator_lduw and
adjust the type to signed during the return.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h   | 1 -
 target/i386/tcg/translate.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 0d0bf3a31e..45b9268ca4 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -178,7 +178,6 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest);
 
 #define FOR_EACH_TRANSLATOR_LD(F)                                       \
     F(translator_ldub, uint8_t, cpu_ldub_code, /* no swap */)           \
-    F(translator_ldsw, int16_t, cpu_ldsw_code, bswap16)                 \
     F(translator_lduw, uint16_t, cpu_lduw_code, bswap16)                \
     F(translator_ldl, uint32_t, cpu_ldl_code, bswap32)                  \
     F(translator_ldq, uint64_t, cpu_ldq_code, bswap64)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b7972f0ff5..a23417d058 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2033,7 +2033,7 @@ static inline uint8_t x86_ldub_code(CPUX86State *env, DisasContext *s)
 
 static inline int16_t x86_ldsw_code(CPUX86State *env, DisasContext *s)
 {
-    return translator_ldsw(env, &s->base, advance_pc(env, s, 2));
+    return translator_lduw(env, &s->base, advance_pc(env, s, 2));
 }
 
 static inline uint16_t x86_lduw_code(CPUX86State *env, DisasContext *s)
-- 
2.34.1


