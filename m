Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E635367B1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:51:07 +0200 (CEST)
Received: from localhost ([::1]:55382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufzG-000191-IY
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecT-0003jB-1H
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:29 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:40867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004Td-K9
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:26 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 q92-20020a17090a17e500b001e0817e77f6so7780240pja.5
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PRccGDcrBmD4Sotzz85n1h6Onv2VZtruTziTa72jRTg=;
 b=rukCvVfM8g+7CFYSIPITKEpEkDKG+fi76mkRa/n05MjYVpIhu5rkrn732vzNj6yjkS
 57qWDLjB32dE7z8zSpQfaJdZL/t3Rw6zymmpmwlOAAbYlz9DfnS/ryue/fySi4XQrVcd
 TmbbMNc0md7xGGDtLLQm/oNORF7B1TyCHY/f4U8P3XmU1Cs3HbXKi7+3P1Ilbu2oGHB7
 VU0J8Ql8eKT35vI2M82ACGA1v08nOAuPS/yUYkRJn5IRITY5WFt0lf9gj/yWhm5I+xMA
 dIyFzS6eLbWHUubOiRyVhfhmdFRcoViWuCFq5129JhNzjef5/VTRxDKiKsCVp+vIJjpE
 7Iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PRccGDcrBmD4Sotzz85n1h6Onv2VZtruTziTa72jRTg=;
 b=4KoIlPLjdSrJfNe1aEy/DMBgtQdqaTG1YSm5tXHfcaApjllPyW3hNFSXLTNXe0FPyw
 XGhFHhWb+dc9+YUFSxoqtkVR2+rJ746/ZbkFqHXHn+Xg5NjRy7I+jNauqsEllWd/qg21
 0TQExfh5aJyGKBhDMzVIpZs5ipOONl7w1BXCMBMu+W/6vUVdcSwxTtjbWPUUhkw4ncxJ
 WQEs5l402NUTRqS43kSRLkDsh6Ev5rPqFid4k8qmJ2uLIjtJi4Fd39bTf/qVrKc/6jFU
 1ZkOd/SmiI+GqbOKaUGcDgIoJdZPwS2C2iL+1sWFMMNPyNCy4pkBU3righ9JUJ1PIIn1
 6Q/Q==
X-Gm-Message-State: AOAM5322Y8KxlqwEvG6Hgxb8B1aZItA0aeziI1xKOGBP8VDu2i7gd00R
 OdV7zHkyz+etJgbelm/DUs95Ow9Xtc5fhg==
X-Google-Smtp-Source: ABdhPJwu08Z4NdCRm+hJeHYyO7i+bFFGNxa5MkPPBPoSgnLMH5W3GiKDumcy81KW1Z4k0mGIB8Nbfw==
X-Received: by 2002:a17:902:8c92:b0:161:e861:861f with SMTP id
 t18-20020a1709028c9200b00161e861861fmr40547195plo.33.1653675791333; 
 Fri, 27 May 2022 11:23:11 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 068/114] target/arm: Use TRANS_FEAT for do_ppzi_flags
Date: Fri, 27 May 2022 11:18:21 -0700
Message-Id: <20220527181907.189259-69-richard.henderson@linaro.org>
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
 target/arm/translate-sve.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 22acd5ead0..03b2eddd8b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2786,14 +2786,12 @@ static bool do_ppzi_flags(DisasContext *s, arg_rpri_esz *a,
 }
 
 #define DO_PPZI(NAME, name) \
-static bool trans_##NAME##_ppzi(DisasContext *s, arg_rpri_esz *a)         \
-{                                                                         \
-    static gen_helper_gvec_flags_3 * const fns[4] = {                     \
+    static gen_helper_gvec_flags_3 * const name##_ppzi_fns[4] = {         \
         gen_helper_sve_##name##_ppzi_b, gen_helper_sve_##name##_ppzi_h,   \
         gen_helper_sve_##name##_ppzi_s, gen_helper_sve_##name##_ppzi_d,   \
     };                                                                    \
-    return do_ppzi_flags(s, a, fns[a->esz]);                              \
-}
+    TRANS_FEAT(NAME##_ppzi, aa64_sve, do_ppzi_flags, a,                   \
+               name##_ppzi_fns[a->esz])
 
 DO_PPZI(CMPEQ, cmpeq)
 DO_PPZI(CMPNE, cmpne)
-- 
2.34.1


