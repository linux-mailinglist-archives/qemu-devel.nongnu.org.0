Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83A5596477
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 23:15:56 +0200 (CEST)
Received: from localhost ([::1]:38452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3ul-0003fZ-TD
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 17:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3H8-00059Z-Vj
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:59 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:40600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3H1-0004au-4k
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:58 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-10ea7d8fbf7so12927468fac.7
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3ScK9gYYd7Yu/4MmJJp6WEZrowwZuhBtdiXOVA7xdaE=;
 b=sKFnk2U42+arEPTPyQUqCdP2C2tK0Ga35UD58mGl02wfr2GqzCDBPyS1PDMaGybbou
 9ID6WdoP/FqXFLxTuK38MjBvlM33h0/kivxnCxHPsz8ujEayYWeb5gZmgkky/Z3XLmLW
 xQFI6wm8Cmay3uZ1vtaw3WSQHGTbzS5rGZzNNlhAgzUeWtihAA9IAIoWxnwrarpKn1j7
 thStVklcEUTTaD1Cz+ovziHSBoIN+AlTyrVfOlGyDeQqFYXhKVEgQVBgODqTOTnBM/ZP
 3HZ+RXqPugrIWL5FmZrGH/YHxWIQnTP8JnDcKPvC5yUrWgbugz9wVpyGRv1gp5uf5ow9
 OI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3ScK9gYYd7Yu/4MmJJp6WEZrowwZuhBtdiXOVA7xdaE=;
 b=HH67bCILIvFU+6h6YR9n5qv/dwSKKVLD2RdrVqchOByULuB1aQkoaXg7TosYGaJw0l
 14itIOkJE6gcOLOEORiGr2Zn1DAyt5EASGyeNNzqfWcm7nUs0eO9YZ52kvbEWUUNh8A0
 bEi/MrJc7WYsAeQiOfbxQOZ+t/wMk+w3MPSQk1ICSyhRIm44Z7cg1KGJRhBPkLXH6x+h
 pfxKEAk7foe+Z9m5yVwYpJkm4RmT+dpfjdORmdH1413gW/0v18r2HJeg6ZlB5bBUJxGl
 WSvMPalVfsrPOgWzoP1QyJeYlCs/HnkRf/nORqnlXmrWWQH7fOvqBhUqWh5TKi7zhuGU
 xkMQ==
X-Gm-Message-State: ACgBeo1e8bH8kKqpAtVvuT6++e/58TulpYePCGtR3W7U7FRUdKPmymfi
 i7q/VyK6yyGtFNpmNXxJqwwHz8P4rf1uRQ==
X-Google-Smtp-Source: AA6agR7TIrBnV2QzswzN4on7zjifUDssj/ECXZFZcd5CpSSEm9iInrclDlMfhVL4HjzQ17ccuAZA8g==
X-Received: by 2002:a05:6870:5809:b0:101:ce10:b267 with SMTP id
 r9-20020a056870580900b00101ce10b267mr146813oap.83.1660682082602; 
 Tue, 16 Aug 2022 13:34:42 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 16/33] accel/tcg: Remove translator_ldsw
Date: Tue, 16 Aug 2022 15:33:43 -0500
Message-Id: <20220816203400.161187-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


