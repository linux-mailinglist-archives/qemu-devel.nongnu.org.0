Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B905AE3E3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:12:06 +0200 (CEST)
Received: from localhost ([::1]:39946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUcm-0007XH-WF
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6P-0002mH-Qi
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:37 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6N-0005UN-1z
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:37 -0400
Received: by mail-wr1-x434.google.com with SMTP id b17so958877wrq.3
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=L6+S1C4verjHBqz/uuyCgreQuy1xnosEZw7oND6E5kE=;
 b=py4fuwOk3Eww8ZsdFM971XDyRZTjmxi6/uG+RgzwhD5Y4GvZ1N0CfOYROs576LaC1n
 Yt8Id4NezKVSXmcBoTfDuRnWU6YP5NHqj8JObkTEE4xid5F1NMHHixXAwqOH6yckoJGY
 Mwnl6PahBumBoyHh4raLrV9GEVctgjF4CAprVwJWvpLf6demCmup6eMMlJabSyW19sQ8
 1GnWt0Tw8TnSQ1lhgoCyqu6gwHFalNXJemg3vgo3g59Ixb+OdYUE1yqUE6r/m+xhgGkn
 0hbuPNugZdxa0ls9GJmZNfI/Cm6R/fdZkt5Bqx4jOrY7DPr8+9/Lv+rP3rz5+MyPZ6FH
 +IVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=L6+S1C4verjHBqz/uuyCgreQuy1xnosEZw7oND6E5kE=;
 b=2XxtGvzGE3cuzhg7xgoHIxg3J+JXrztejo9Vq4cTAO6NyMDhIZecAdmmwOu8gu3jvs
 Butov/MJv6RYBUfc+anT/sbwWX57eGuSIfsYWlTVr64vGMxlT/0RoHlrUkc5ugTfnnAN
 jLxCzHWSmGM9AX49sT5I3R41FcnDaKcvYegeKz0tO+bmqBHDFHnkRQA6+T4LNCEhuOV5
 zX1jA8e2zIeqO70vrnXLL7VO8nh4cKMeMokqFihguJXwv7bmkb9hm0GDjtwUjYq3XCHx
 D1JPsDFDOsfnO1kfieau3QW//ucQRyC7QUkieaQN6ESANeC+I1Lq1zs1Ry0p6iRZ5BIM
 gzVg==
X-Gm-Message-State: ACgBeo3DkmGPfnzBlglPvAO1/WbRv7NC7fgiEsDsa+kB7B2ACHxw60bi
 5dgAE1rve8OvvRcjIhjJzw4ppilItKVzmsHm
X-Google-Smtp-Source: AA6agR6m1IyqCeiHhMkPNENpHhXXPTsNa7DAC5r5bZNChw1BT5axsEZXB61BZTXf1YSVWAq+/LS2Mw==
X-Received: by 2002:a5d:584f:0:b0:226:edcd:b467 with SMTP id
 i15-20020a5d584f000000b00226edcdb467mr15281518wrf.363.1662453514337; 
 Tue, 06 Sep 2022 01:38:34 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v3 14/20] accel/tcg: Remove translator_ldsw
Date: Tue,  6 Sep 2022 09:38:09 +0100
Message-Id: <20220906083815.252478-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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
index fc081e6ad6..983439d926 100644
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


