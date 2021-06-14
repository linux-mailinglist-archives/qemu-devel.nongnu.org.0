Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFFE3A6A20
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:26:40 +0200 (CEST)
Received: from localhost ([::1]:57158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoU3-0001J0-G8
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEY-0000zI-QP
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:38 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEM-0000IG-Ut
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:38 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so209809wma.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=82usIVl+ptqyv261o6EebgRru0vMcw1Yn5ta4kVZS6U=;
 b=G54F6UJhSj+MdGzF3P28kSZ9o8oxgAct2k7mqVN+JdQJLpLjiXXOG9K+GkCkp8Edxh
 DJdeTq9KdysEMZlWZJ/nY6l3lWQTifx+NvbsSEkL5St0w9B1CK4YtUA6MduhFGdQiXNa
 xzrHM9JoAkkhAwaKM/I1vPydoGyO8pKMTNyYPWc7WSgUVo1jpYVVWbn13TYz7+azd6ir
 ByYDW3mkKPZCgyaVjbHqJrTBDnSRqwocb/l3fdOw74vKVIO6QFnqRQz6GvKJVb3Z9wct
 /KEtM8oLI47z88K/JO34xeRO0+4GvoF9SJenGjb98R9InbGT1SpvPUKcqMv3yT/cYOGT
 bYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=82usIVl+ptqyv261o6EebgRru0vMcw1Yn5ta4kVZS6U=;
 b=c9lye3WeZTdPjxh5cuy48su1ycYsnmaaBAszjWMkZ83WozzyPoNbmWKJ3Jisyjit3k
 uhSzOE1b8UKIFs/0Pi131q/PB4ScWmEyKyLqmM9iYnpTe0RhByr9me46LJ9Ls+mHgQ4C
 Ta749NXmqfQh6dd1Bem6M7w8yI4XvdPzbTvvgKOdx0E+gUA8odh6a6bPdKrZw9yxZETI
 mgtspbsl2hKvkeL7a15GYRWAORLllgXh0k4pYIvL+I141BBevIncEjnRNPblQhGNYZkP
 zEwOZPC1Q1B67tMZYbUzfroVCqq8V0TeJZKX8IDlmPZbgKsGSCecxcgtZbeTWzhxA659
 zCXA==
X-Gm-Message-State: AOAM530nnq7M3qN3NLqBcO6Zr8SmxvoRk/GsNtAaEzEda061s7x73nDU
 i7EfxP90isRT2dQTSBoB3EEy0g==
X-Google-Smtp-Source: ABdhPJxUJV/Sg7R4h9moSsLfZRurlzcghLy581I7q9JmFpPc1sfSKhSIzXAD66AnRfT8eVYZje+B2A==
X-Received: by 2002:a7b:c25a:: with SMTP id b26mr17461639wmj.31.1623683423859; 
 Mon, 14 Jun 2021 08:10:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 15/57] target/arm: Implement MVE VCLS
Date: Mon, 14 Jun 2021 16:09:25 +0100
Message-Id: <20210614151007.4545-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VCLS insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 4 ++++
 target/arm/mve.decode      | 1 +
 target/arm/mve_helper.c    | 7 +++++++
 target/arm/translate-mve.c | 1 +
 4 files changed, 13 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c5c1315b161..bdd6675ea14 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -33,6 +33,10 @@ DEF_HELPER_FLAGS_3(mve_vstrb_h, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrb_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrh_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 
+DEF_HELPER_FLAGS_3(mve_vclsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vclsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vclsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
 DEF_HELPER_FLAGS_3(mve_vclzb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzw, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 24999bf703e..adceef91597 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -68,4 +68,5 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
 
 # Vector miscellaneous
 
+VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
 VCLZ             1111 1111 1 . 11 .. 00 ... 0 0100 11 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 3d3b35d4848..1590b3ac83c 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -272,6 +272,13 @@ static inline void unknown_mergemask_type(void *d, uint64_t r, uint16_t mask)
         mve_advance_vpt(env);                                           \
     }
 
+#define DO_CLS_B(N)   (clrsb32(N) - 24)
+#define DO_CLS_H(N)   (clrsb32(N) - 16)
+
+DO_1OP(vclsb, 1, int8_t, DO_CLS_B)
+DO_1OP(vclsh, 2, int16_t, DO_CLS_H)
+DO_1OP(vclsw, 4, int32_t, clrsb32)
+
 #define DO_CLZ_B(N)   (clz32(N) - 24)
 #define DO_CLZ_H(N)   (clz32(N) - 16)
 
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 9eb6a68c976..4e5d032242b 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -198,3 +198,4 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
     }
 
 DO_1OP(VCLZ, vclz)
+DO_1OP(VCLS, vcls)
-- 
2.20.1


