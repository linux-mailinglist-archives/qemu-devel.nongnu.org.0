Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692CF536766
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:17:39 +0200 (CEST)
Received: from localhost ([::1]:35068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufSs-0005Fi-H6
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecT-0003lm-Jl
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:29 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:56094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004V7-NT
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:29 -0400
Received: by mail-pj1-x102a.google.com with SMTP id n10so5266795pjh.5
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qg4jOWuyGW8gIwmtO3xBqQIVz/6oC7t9pIznMyeg9C0=;
 b=HpTmF0G+AczJGNffqHzzx0Lu+WAwJUDv6tqtmG8AaeEOQlZR6Ui1+taboyeSG9MIDv
 E0C3ZkCWkM8TAqZdDrEjDJpMzF+/i/a8M4Wxn07IST8RgRrqFL9mPvbNp9dDksy6NMyu
 izaMpL5DEXm4nEpWVzcSTbQondNBda2kQ0kksvB2dCiKsftBAcmH65UwJoWWgg5LVmAG
 kF6dClBfxqjyOcO+nto9MuY49PLFWOUv0OAfKzA0Ih2VC84Z9hE2vNV3m6VyI6NLhWO9
 tV2I9F5lhO0shFiaDQ43e+WwSVK/HKzIkT18YhCZS60VtGD99Pg23F5rrJXCQuJdNQDY
 BtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qg4jOWuyGW8gIwmtO3xBqQIVz/6oC7t9pIznMyeg9C0=;
 b=JgyzrgbhDGwRVEi08ceQu7qfOOysxHvSOTkwM28KgEM6zAcHX8GXCrMdCr6l48kk4+
 I6wJv6dZKMEuV7YJ8tcjhvUdf/w6eziiSmChadm/7A+xWLYQOcBKAcucWyom/fS0k6U9
 qvxMnPvfPgDblvmVWlYldOBIdB62QHoXy+3UuEByNuE56ptBgp2OtygAZLpernQdHS4j
 ywCN75UHid4SJXyrjzkMqS7JaQ98fMEu5P3rF1UoFEqTWQxnrziSXrHilyVfukAB57WV
 jcrqcWrBMvfM8pl9nATIqSYXjvHoIggU4YO4SSVc8Bo1anKlvc+sNfr8PxCbNjwmxzKH
 hMmA==
X-Gm-Message-State: AOAM530nSpSPX8I9X8ku33ZG7C3XPYv/jpU0kpEn817wTFaIrH1dP7CQ
 qKl/xS4JnM12r9b1NAoUxvbY+2b06nWUDg==
X-Google-Smtp-Source: ABdhPJzimC2i7nHv8dzD09v+O6Ne9IWVkkQ3ZL7C7tEuQkqg0/gSJ4mm2k6xKCwyFlhaGEq/ygJXDg==
X-Received: by 2002:a17:90a:149:b0:1df:3da1:3549 with SMTP id
 z9-20020a17090a014900b001df3da13549mr9669771pje.90.1653675798217; 
 Fri, 27 May 2022 11:23:18 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 076/114] target/arm: Use TRANS_FEAT for do_zzi_ool
Date: Fri, 27 May 2022 11:18:29 -0700
Message-Id: <20220527181907.189259-77-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e6434589f4..b8bd1047b0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3330,14 +3330,11 @@ static bool do_zzi_ool(DisasContext *s, arg_rri_esz *a, gen_helper_gvec_2i *fn)
 }
 
 #define DO_ZZI(NAME, name) \
-static bool trans_##NAME##_zzi(DisasContext *s, arg_rri_esz *a)         \
-{                                                                       \
-    static gen_helper_gvec_2i * const fns[4] = {                        \
+    static gen_helper_gvec_2i * const name##i_fns[4] = {                \
         gen_helper_sve_##name##i_b, gen_helper_sve_##name##i_h,         \
         gen_helper_sve_##name##i_s, gen_helper_sve_##name##i_d,         \
     };                                                                  \
-    return do_zzi_ool(s, a, fns[a->esz]);                               \
-}
+    TRANS_FEAT(NAME##_zzi, aa64_sve, do_zzi_ool, a, name##i_fns[a->esz])
 
 DO_ZZI(SMAX, smax)
 DO_ZZI(UMAX, umax)
-- 
2.34.1


