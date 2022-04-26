Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308E65104B3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:55:23 +0200 (CEST)
Received: from localhost ([::1]:37552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOTC-0008FP-7N
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO62-0003B6-1q
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:39 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5z-0003yi-5X
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:24 -0400
Received: by mail-pf1-x42b.google.com with SMTP id b15so18448131pfm.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jXIwkULLtYjwWB5mFtKYDvoLy2jORO/B+nK9qMPIgn4=;
 b=AkGzlSGRdiI8w8LDdwpf3Hy7O6+ahwsuolzdl/QMo17NPsAYbmaYf15o8YGl0JSdw+
 guxcg5FqYC7TV26gNC9aBtZkNhuhmUB4nHUaRZ+W5zQPVHpd8A4O9M0XpnWHOvr0J5Gj
 tBG2uriwZYbP/h+Zpn/VQfcPTsk1YqlpYTFqyrf/k91/flg8OjCSUGklyq6AZQfNotuN
 1GtCskwkT0RCUY8VJwQauRfQT5EjLoVpuBoFqxmo4pVOqY2MMDOCo3Qljr5bisIqQayk
 UG3iF4cg+qn10uVNR5y06EmUWmV59GXC4zD//RSQF9Fj6N6zW8ESxKsXLpn/wJZOvgz+
 cvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jXIwkULLtYjwWB5mFtKYDvoLy2jORO/B+nK9qMPIgn4=;
 b=4bXT4TRXbUrn2K6efswNaF+K2E6E1ZaAcHwzFMFkpoAjFDws2qWktICztRg5CiEFoy
 USS23ZrzCCpb3Bm4CrO/30R9hVPrr/vrg1jImWrYmAexXLeycTDv/sBTCPzSaWb5mcjY
 v9q8ovo8cnEtN6Rfr4Vqd1GU4S/aEUuWXgFiaTwHoEu2WjLUcdUItjhA4aXD2lV5YdP4
 iuCi7S3MdmY/ba0jYfH5lezl+xSJOEXNA2yJoS5QlRroephvrAdqAt3IkTWxRigoF5Js
 GluvUQWZ2mh/9NktjDVIvCN6wB36FrvnscLk7kF/ml6h422Vk9TRSIxWXkbVkXPxPCOf
 ZN7A==
X-Gm-Message-State: AOAM5315byG7+JXzpEzgFTjvU3g+0SYzp3x6vo3RyTu8kw0N6IEWFE1P
 d7LSHwmmqoS1rV7Q9dwtQs02HlRsG2bLaA==
X-Google-Smtp-Source: ABdhPJz147+3dd6FRzoZ9BiA5WpM+qMyAxCi3IMhnYIvnvWIQwaqxnMUCpakoE7ccAoDdeNfx+hn+Q==
X-Received: by 2002:a63:2acd:0:b0:3aa:86eb:3dc with SMTP id
 q196-20020a632acd000000b003aa86eb03dcmr20090038pgq.441.1650990681104; 
 Tue, 26 Apr 2022 09:31:21 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 39/47] target/arm: Use tcg_constant in {incr, wrap}_last_active
Date: Tue, 26 Apr 2022 09:30:35 -0700
Message-Id: <20220426163043.100432-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ef57d3a2b4..c3d3f301c9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2793,11 +2793,9 @@ static void incr_last_active(DisasContext *s, TCGv_i32 last, int esz)
     if (is_power_of_2(vsz)) {
         tcg_gen_andi_i32(last, last, vsz - 1);
     } else {
-        TCGv_i32 max = tcg_const_i32(vsz);
-        TCGv_i32 zero = tcg_const_i32(0);
+        TCGv_i32 max = tcg_constant_i32(vsz);
+        TCGv_i32 zero = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_GEU, last, last, max, zero, last);
-        tcg_temp_free_i32(max);
-        tcg_temp_free_i32(zero);
     }
 }
 
@@ -2809,11 +2807,9 @@ static void wrap_last_active(DisasContext *s, TCGv_i32 last, int esz)
     if (is_power_of_2(vsz)) {
         tcg_gen_andi_i32(last, last, vsz - 1);
     } else {
-        TCGv_i32 max = tcg_const_i32(vsz - (1 << esz));
-        TCGv_i32 zero = tcg_const_i32(0);
+        TCGv_i32 max = tcg_constant_i32(vsz - (1 << esz));
+        TCGv_i32 zero = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_LT, last, last, zero, max, last);
-        tcg_temp_free_i32(max);
-        tcg_temp_free_i32(zero);
     }
 }
 
-- 
2.34.1


