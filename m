Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175F45A905D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:33:56 +0200 (CEST)
Received: from localhost ([::1]:60178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTehz-0002WY-9F
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4c-0006C7-2R
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:10 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4a-0003G2-8D
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:09 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w5so4832845wrn.12
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=tnbTpQq25hji2Az9vsRCegPM/IihGJTki2qN0gANa1Q=;
 b=rHXVCrIWx+7kRVBtQUoAF1+HTtZuswSb5YAK7yOGPzsljae6cena2xzVg7XREthmsk
 LcPfujecr1D5nMMbHyZjctjdrPxqegE2hbGBekxTUo4n/VmDizSRM/SJu2Pn2JE6KIsU
 ueUFqTpAY6UV9f7x3j3zmQh/O+tNkBcWeBZtMUoh6zScyVbO0TeO+NIMexkBDWTGU5uV
 ++6ZyIk4wS1kcxlxCOO4FWgi88STKDWwkuoriotUpnkc2MZv97Y1D2IX8UqAW8XF3B8q
 jCbE5/EH4jd++9Eb846zyaQ5MtsEWEaf9dUwUReq/31BMmrXZu5PeLztlxIJFIaMkM4T
 3jyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=tnbTpQq25hji2Az9vsRCegPM/IihGJTki2qN0gANa1Q=;
 b=WbWTYdJTw8HVQs2QdFoNXPiy5ooTlaT+LXA9N42rdo12MQkTqhFXS4sVr/DYKhdJR6
 /3eLpPGTqz/cuNyg/MP0Js/kMGcjPZNGw2dtmAco/Px5lsg4JCJnCFNsE9sBDU3yaPdY
 d2C4sXk3VWwwi6k/9gDpc1YRnsAbLmxgGlbFWrCTeBQBUt7s6nhK8P4jhsDI4SkHTy1M
 R8pmAkH9A533OnKEQ4qdZELIFUTLbUNqB6OuKGeGs2Nu9MSqWOuwdc8dcuGNzFvRxbR3
 mggLxhL+TqDE5pJPB5O74env0KORhVB/K50hkqsJqQZQLK9PaOEYy3pvS/Udrwke4Wj/
 u4TQ==
X-Gm-Message-State: ACgBeo0Ov8zOC4Gvef8pEVhGyTJEy0/wEramFCbi+khScCqH5UzQGAL3
 hTJMErdPqyWHORYV4y6zqW2XakVgTupuhnK7
X-Google-Smtp-Source: AA6agR5UPQYDuTFGLH62MyDZJSoUoTBBOhCq2z0bRKlejZs5Hqk/Hhno+p5rnxXqsrTm/fqB+w/FoA==
X-Received: by 2002:adf:d1c2:0:b0:226:fa44:bab7 with SMTP id
 b2-20020adfd1c2000000b00226fa44bab7mr346482wrd.195.1662015187547; 
 Wed, 31 Aug 2022 23:53:07 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:53:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 14/20] accel/tcg: Remove translator_ldsw
Date: Thu,  1 Sep 2022 07:52:04 +0100
Message-Id: <20220901065210.117081-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
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


