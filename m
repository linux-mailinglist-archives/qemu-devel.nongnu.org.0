Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D0B5367CF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:00:51 +0200 (CEST)
Received: from localhost ([::1]:55574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nug8h-00057x-2L
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefU-0001i0-CI
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:38 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefS-0005KK-35
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:36 -0400
Received: by mail-pg1-x52f.google.com with SMTP id g184so4612705pgc.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LJ/bn0dQ7w7iomM0tHW+Krt40cu7S6e9MMRGqwOxqTY=;
 b=qh1KE3sbKoOUsqTCc471qnzcuOB0MgoRMwzG7Jq9nEr6Roai2LrxWQZsbhhNhFkqrm
 Ky1O131vu/Ls1Cfmh8lBb0yQdV1F1rgFyruY08R+8mSs9UmXYnSrH/bJYvB8NjIWnLF/
 kzBSrkcEuO26t/0Ut5lMUYmoxCPwBdx0bAWo8RbO6Kw/1H2T46VuprS/uFjdnfWGtW8I
 yDCjOi1OSXBBw4KR2U519/rKhHMU8GFdsQAvxGqj1Q9ax1LKx/iD3C+0IePu7tlJkazo
 X0TzHNTnhcQkLoYmYsb93HcPwIpgBjeB/2pHM9e479BKXuU8s6snfV0QbsnR7druz4Hp
 QlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LJ/bn0dQ7w7iomM0tHW+Krt40cu7S6e9MMRGqwOxqTY=;
 b=2e8AUlOrheCJ0fbKx+YrRhA5DSQ1YZq79rkiZXMAr63UHstCQca8lJe+OyfTAmvIkp
 imCArzgHFNHlYyHNJ1PeHt4xrRvT/w5vf0I3L8dVsV/p/ZXGLLqKS0lVUNz4Yuo5kpP+
 dXGiQPN8y+AjKvoOFFUWUGXhvtThWHSMqbRsC+1c3pU7dfcB+y774WCS0WpTecp7YDo8
 dAOg9SY87eRyQ1f6/mOU9JuiR2pvS5AS6sxyCqGVRyZ9efuXm+3M30JflzAYTextxtPM
 anRQHL0UoWxTwq6iL6/5EwOiZeOLuOyi42j3ITLEaka6n6CN9mnUQoYTRKP/0OjOJZi3
 wrPg==
X-Gm-Message-State: AOAM532rGEoPtFeqRUwrs9EVAAizdgrzZ+In8vcKzj1W9+8dcupw+T84
 60IfA0esZZAQ9dbHZH7HRw9BkvqgwXreMQ==
X-Google-Smtp-Source: ABdhPJyN6wzydXThhxxBATHEC2zJ1GW02fQcGrovQ+qpdvvogrdd2YO8exwYDXUNrpcPHhywKeiZAA==
X-Received: by 2002:a63:6507:0:b0:3fa:52de:d3ce with SMTP id
 z7-20020a636507000000b003fa52ded3cemr22850669pgb.538.1653675992725; 
 Fri, 27 May 2022 11:26:32 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 090/114] target/arm: Use TRANS_FEAT for do_reduce
Date: Fri, 27 May 2022 11:18:43 -0700
Message-Id: <20220527181907.189259-91-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
 target/arm/translate-sve.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0d71072f83..4a9ecd5e72 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3609,15 +3609,11 @@ static bool do_reduce(DisasContext *s, arg_rpr_esz *a,
 }
 
 #define DO_VPZ(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)                \
-{                                                                        \
-    static gen_helper_fp_reduce * const fns[4] = {                       \
-        NULL, gen_helper_sve_##name##_h,                                 \
-        gen_helper_sve_##name##_s,                                       \
-        gen_helper_sve_##name##_d,                                       \
+    static gen_helper_fp_reduce * const name##_fns[4] = {                \
+        NULL,                      gen_helper_sve_##name##_h,            \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,            \
     };                                                                   \
-    return do_reduce(s, a, fns[a->esz]);                                 \
-}
+    TRANS_FEAT(NAME, aa64_sve, do_reduce, a, name##_fns[a->esz])
 
 DO_VPZ(FADDV, faddv)
 DO_VPZ(FMINNMV, fminnmv)
@@ -3625,6 +3621,8 @@ DO_VPZ(FMAXNMV, fmaxnmv)
 DO_VPZ(FMINV, fminv)
 DO_VPZ(FMAXV, fmaxv)
 
+#undef DO_VPZ
+
 /*
  *** SVE Floating Point Unary Operations - Unpredicated Group
  */
-- 
2.34.1


