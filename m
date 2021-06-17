Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C3F3AB368
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:19:28 +0200 (CEST)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqzX-0005Ky-9M
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwp-00011x-1d
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:39 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwl-0006vg-6Q
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:38 -0400
Received: by mail-wr1-x429.google.com with SMTP id f2so6506014wri.11
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8toBfdIUG2kJkXO6M6PGGwkfarNcv9mAecXGsoQwQw0=;
 b=W0XJrjt+TdI3Ja6lj67L9cLxlx9wQot/ead4aLiQWFvtKdrY02mUgJ+ZtZSFhV0fGE
 UnBMwFSyaMa3kJ2ChmsI2zpK2E+20rmPqd8IOZwol2lwuJWISewUTxf6tig7RkCJhfCF
 oqHEZV3WkMvBMlKNWSLw5nKfFHWsJFKp4zCM13D/Hpvu87zjvsLSlTHZZqycU7JZVM/Z
 EZTjE19sA3fyKuxskx96zDu/7q1tazPzJWTEDlQo7mvYxXyBSpxm9P2katlrsjPzAKLz
 CG2M3ddzcslm35hOdAZDouNsZ0XiJS1leH8TSvnia8oBDcdo072VHl8FinINP1EhB7dC
 rWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8toBfdIUG2kJkXO6M6PGGwkfarNcv9mAecXGsoQwQw0=;
 b=KbW9+R84H/WrK/xymz+hzhVzIzJ4dn3j2zhoseTqVN4Pmx7OZ0nhAlnRQo1HGnivZi
 fr82QEBn1d/w0hp9gS32Ht01DQz2j3jFA6o+CXYSse1RT749xJmYhvIkQiS/zLxmM6EL
 SmwQS01MYp40l8qhgnI2InwB5coS4qEiNDvdb3lGW6wsHbPUmjZiw6J/75LHNVxLIQHC
 9d9QnzWgaGGw1HdRt/i6Bcaym5k8g3v9auvC4Vi78gWQVED8dRp90Q8gN69yWB8r3avC
 jemFvPjncT3XY+yGjJ7H1a3kTxCM/Grc03W8mxYs9bO/30yuHaGZKsgCoMzrjfPF0N6F
 Rpww==
X-Gm-Message-State: AOAM5324qA4TcYimEC1Lk82FZhOaVIWoQWG6fQHiDwq3NiDwhh63qHr9
 G772s5HPeqBxwxUpcTHainNzOgFq+3VcKw==
X-Google-Smtp-Source: ABdhPJwHhSIhcvjI+eLShGrdIDQlZJhHTXEQHssP6LUq9bsrIBA0iLzpm6dd24Yt9mtOV/Ih7wxa/g==
X-Received: by 2002:a5d:6109:: with SMTP id v9mr5457289wrt.0.1623932193788;
 Thu, 17 Jun 2021 05:16:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 04/44] target/arm: Implement MVE VCLS
Date: Thu, 17 Jun 2021 13:15:48 +0100
Message-Id: <20210617121628.20116-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
index 8c752acb935..e90f5fb5d67 100644
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


