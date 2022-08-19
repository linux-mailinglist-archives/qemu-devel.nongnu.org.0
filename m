Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FF3599395
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:39:21 +0200 (CEST)
Received: from localhost ([::1]:42914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOsqu-0007TS-At
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseb-000254-7x
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:37 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseZ-0002mF-Jo
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:36 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 s31-20020a17090a2f2200b001faaf9d92easo6400946pjd.3
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3ScK9gYYd7Yu/4MmJJp6WEZrowwZuhBtdiXOVA7xdaE=;
 b=QUuAvuDfIo1lhfeSCjLJibqLY4hZ4JHe5xVS4cGpPIdkyMi/VffKf+Zr3YCP+bPDWf
 nxB67Wr96U6DlARhKO0e08yXn3GrVIqiNZrk3rhfCCNd3GoMOsYkQcyBcwQj3Kba+rA5
 xEt/tHXSv9kOzyJGGikYN+D5HEhP/z2NBtfedKWBhS14kfE4xEVDHdakNtW0ZV7lJ4yV
 fgYetQRqChlhVs4hYwWDuLfmQ9swWWh83VDELrII+dkaq81l3t8kFxlEN60loA5J29dN
 leFNi84mmNEo9j3eB6j8YD2MtFfZL9XVjAt6DinyIAqnHy876B/WXVj1uhCxGU/kFpCG
 CNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3ScK9gYYd7Yu/4MmJJp6WEZrowwZuhBtdiXOVA7xdaE=;
 b=AQRINMvNxZcuyfdeU5UypfWfWVDQnihomOZIQsXjPS3VnBmS/fdCWWyTMyWdKwALQN
 C9LbB+pka8ll/gFIASLYYiZ8lv9W/SHQMxlk8GqoJZPZi50Zb+fQF08pdDUAcS45p3sz
 B0bgwfOZh6juK7tw6lgUjITz8moL8khnqtJbHFYqFavBKGUvfIeLJLdnmELZUgbMgJIK
 3Z3ev/Q2SUHB5QuzFCT2V/7eCzKYc0UrRLbfjKLFd7FURt5G0CgXHmokF9IAUtKq5VYg
 8N4ZLnaiKDEHbQQ13dlqg1L6quntXXYHS8hY/Jk0SSmdlZR2TzsgCEn+qfS/FRKhu4IA
 C6pg==
X-Gm-Message-State: ACgBeo2Ny8LtqWMG6C1Xqa+OsU1dTse2ej40Xwd3Hm6ydPxqqcxEnOyk
 XKYQiH+zLNbWXVWkPWusYDuiItZ0qCQXGA==
X-Google-Smtp-Source: AA6agR6NUVa1KIYZ0Xi2BNS6O0vdF6cSenZsKrx+FSGr+uHyKOMJFbex7K65tHqnVFX5ydq8CCwdgg==
X-Received: by 2002:a17:90a:5b:b0:1fa:b78b:ad73 with SMTP id
 27-20020a17090a005b00b001fab78bad73mr6270814pjb.107.1660879594243; 
 Thu, 18 Aug 2022 20:26:34 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 15/21] accel/tcg: Remove translator_ldsw
Date: Thu, 18 Aug 2022 20:26:09 -0700
Message-Id: <20220819032615.884847-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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


