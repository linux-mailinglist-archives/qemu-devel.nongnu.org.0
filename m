Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25E559EEEF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:21:36 +0200 (CEST)
Received: from localhost ([::1]:34310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQcH8-0000uu-Sm
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc29-0000KL-Nf
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:06:05 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc27-0001S0-5d
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:06:05 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 s36-20020a17090a69a700b001faad0a7a34so18533928pjj.4
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=tnbTpQq25hji2Az9vsRCegPM/IihGJTki2qN0gANa1Q=;
 b=Fv2fkcCgv4EpQOfOUJoTFFaCBeL2c01LqTMMv0hJPHLlF4mQpiI4oesgvsDu4tYg/R
 xxBfbYNNjTMpyb6ocqNmZDuOqF5lXJas3qWteoo7bkxBKyv4Q5SiBskayjq5daeR6KEr
 LFJU6wWdNMexOOaTU/DrtThxaojiObyL4gKja0Nd5lP5kokMKoeRAkf26LA9H9XD+6i7
 aYUSg0LsLmtnqfpExgan7QgrOW4SYbREwfGUwz5C/tHQwEkJTfsncOJzVgnLHzBIhFiG
 ZgzcwbP78niuBFNuzbYLd3GMEQ57teTAr7EIiIogWE8aj1LGAuYOSYKeEa94gHyJJQe8
 aEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=tnbTpQq25hji2Az9vsRCegPM/IihGJTki2qN0gANa1Q=;
 b=LRYMk8ddI78PmBoFX9rE+r9Xg+IaOkf40IYRjm0O0tbvzA/7EmlpUjmwlGT/qsANV9
 Noi4jvUytrM0/Ko8/EkyOWwUidb46Di/4m+DWYSEZszu47jirT+FimJO/tnqu5lF1kSf
 w2MpZKMVs++VPDfmUqvlh1mXesdDbQh6V1RnYZCM0dkon0vdkaeLLrXT+zK62MJuzYZ9
 C8arxxrHPYkGtGB/jzzFHqq0NG9YdM0ngi7ivdhMiz/bhcFLKo1MnFWFhQuPGdR9Zf8V
 uHTEyyqW8Uqkm6JMvztJFfiq9gsW5toy5uhFZOwimZfsDpsH9t0Jli9nl4c9wenYwU8T
 gAiA==
X-Gm-Message-State: ACgBeo2aQYDkZDfZ0p9iZBkUMAqPH6jluIbPR6xFEtKTwajqpHGCvaNS
 DFgqLRwbyvdiuG68y2IGjJXfA9xlsHJewQ==
X-Google-Smtp-Source: AA6agR6hjaxbWCZk9Lx/3ooJsRIDWryQDiEdkKfml4pYZZjhGYGVqKRIgVJIU9q3nJ/XeuHbb/mEMw==
X-Received: by 2002:a17:902:b217:b0:172:bd6c:814d with SMTP id
 t23-20020a170902b21700b00172bd6c814dmr23468001plr.55.1661292361817; 
 Tue, 23 Aug 2022 15:06:01 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:06:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com, laurent@vivier.eu, alex.bennee@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 14/20] accel/tcg: Remove translator_ldsw
Date: Tue, 23 Aug 2022 15:05:36 -0700
Message-Id: <20220823220542.1993395-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823220542.1993395-1-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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


