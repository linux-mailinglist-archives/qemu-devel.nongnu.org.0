Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE7A5367A6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:46:33 +0200 (CEST)
Received: from localhost ([::1]:42036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufuq-000060-7o
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0003R2-Uk
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:09 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:38412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueby-0004Km-Nz
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:06 -0400
Received: by mail-pl1-x62a.google.com with SMTP id n18so4812327plg.5
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JP1jEzSyCeD7J5isISjzjuuYkjaJtztreKWCJd8+D18=;
 b=g5u6DykLU14WEfeHoMCg8X2gTMA457gyusjxRXfLxES38aXh1nYGR8jxfXSyvzIo30
 QdMmrxSMYDEfq9V3G6p47abBs3GmqlPhCxWQjrUcrXhQUgI1HLtZsLjT1HI0NaKm07Am
 l9BhqRUIMdyoTRgZ+WOJcge1Qx6H090/6PLgDalSIJylV8JSSFTgWxT1RLUhEB41cfAI
 c3yJsk421AsOWtuZqP1akIwjRdOo5L0A85flTT5sthC0lMMHN/y6/NonQlpqyekOXIP4
 PFbXuILcgSVbM9YvmVLyJACkQuTwtp6KsovUfitdoHxZQ76Ed8BerkIJlNTuD9M8Sa1A
 o3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JP1jEzSyCeD7J5isISjzjuuYkjaJtztreKWCJd8+D18=;
 b=WmPC9kK6UdN740b8QLBDuvap5S9lnmvaVrEfADjTJnqTOdABr7rBWDj7tyKqEwT6fU
 G7GMSpSn5ighrfe25oEXadIelFBQbehqWFrWllbwk6/r+c3pRgQjzKAr3yCkF+2yHDSi
 0PDz2hGMXV+C/o7IQXdmN45jRt7/F+M9NHL0bLj8Zf729hvROi+KjrFASKINqyhdNnvv
 5wsT87RYbgMhq7UgULS7SSEs6hol89PZy8Xke4D+BrX4PU3JG8pGj/VTAFq72HL3YpD9
 X7aRA8FBZzKwOTp6WWVoaAcU5SKn838C+p7Od/VNtw+iEx9EPiu/LzFne+DYH/cd8ys8
 8vCg==
X-Gm-Message-State: AOAM531ZagzVSbG4jVioaQjueqXWL4Ztj6kmfE9aR8ZU0eotnS3W63Qy
 YfR1ehgXrwTWwEFBfZBo7po8Mp4DKxVAFg==
X-Google-Smtp-Source: ABdhPJytWrDIoz/oXVMsEeaLlLtfjEhX2Lzx+XiA99CukEu4F8wji71LrNOALvSym1b+9BtK7/bhcQ==
X-Received: by 2002:a17:90a:1b09:b0:1e2:754d:aec with SMTP id
 q9-20020a17090a1b0900b001e2754d0aecmr5806079pjq.171.1653675769140; 
 Fri, 27 May 2022 11:22:49 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 043/114] target/arm: Use TRANS_FEAT for do_vpz_ool
Date: Fri, 27 May 2022 11:17:56 -0700
Message-Id: <20220527181907.189259-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 911d2e28bf..6103bd7f1d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -858,14 +858,11 @@ static bool do_vpz_ool(DisasContext *s, arg_rpr_esz *a,
 }
 
 #define DO_VPZ(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)                \
-{                                                                        \
-    static gen_helper_gvec_reduc * const fns[4] = {                      \
+    static gen_helper_gvec_reduc * const name##_fns[4] = {               \
         gen_helper_sve_##name##_b, gen_helper_sve_##name##_h,            \
         gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,            \
     };                                                                   \
-    return do_vpz_ool(s, a, fns[a->esz]);                                \
-}
+    TRANS_FEAT(NAME, aa64_sve, do_vpz_ool, a, name##_fns[a->esz])
 
 DO_VPZ(ORV, orv)
 DO_VPZ(ANDV, andv)
@@ -877,14 +874,11 @@ DO_VPZ(UMAXV, umaxv)
 DO_VPZ(SMINV, sminv)
 DO_VPZ(UMINV, uminv)
 
-static bool trans_SADDV(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_reduc * const fns[4] = {
-        gen_helper_sve_saddv_b, gen_helper_sve_saddv_h,
-        gen_helper_sve_saddv_s, NULL
-    };
-    return do_vpz_ool(s, a, fns[a->esz]);
-}
+static gen_helper_gvec_reduc * const saddv_fns[4] = {
+    gen_helper_sve_saddv_b, gen_helper_sve_saddv_h,
+    gen_helper_sve_saddv_s, NULL
+};
+TRANS_FEAT(SADDV, aa64_sve, do_vpz_ool, a, saddv_fns[a->esz])
 
 #undef DO_VPZ
 
-- 
2.34.1


