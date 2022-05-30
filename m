Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF0753860C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:23:27 +0200 (CEST)
Received: from localhost ([::1]:40202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviAw-0005ZV-6W
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvQ-0002jd-AL
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:24 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvO-0007By-Av
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:24 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e2so15315033wrc.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6ehhYcgsWzgLa9qGxoVnyglPKrIl8i+RKUk9KpgaKus=;
 b=UCisQSX9r3rzky7Nd1FeBn53Vd0JouvzoOu3WuWpmAOzgN5oB5xcZ1ba8j7nq0xnuA
 9SUFlPfwTmlU1RQgqoZWN7E1IEl1RgU5qir1vKOe1a8fai6EgDxd4m1DCRcBT8CJbnBF
 6ARbJ4Z3qt+/+h7yG1bzys3Zyjtb0imSk1I9dQk/Zih0N8T3Z9QGDAaS/3vmVJ21SaQi
 NLpt1bNRiu7SwOMtJKVBcFafWgZZhaS2piklEEQ9W4IAJ3XANd3qL+S8VyqoDASmHYJH
 NcRj6NT4BLBzj3mfkq/vz0+sQDrGxYdylbnJrZU5XA5SHLyxg+p6xxVFoCGhOwFT/TKl
 txiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ehhYcgsWzgLa9qGxoVnyglPKrIl8i+RKUk9KpgaKus=;
 b=A/vbKpppmwqmPfnbf3beUwWBRqmpgi3e0+jPjXmJT/21ZK5oRxsykoPvOzKrJfKA/B
 Kf6giFSo99G2hY6Vam4NRwYMffygNYoAPinnumq7grukHBx7VNiQgTs1c+G2Usp6I9At
 R6vYvQ7cKX4UuI1LCZZYHrpCOV2To7cZAWQPIT4tt4BYECEc9ST85W2a3vhMpb9fj2Sb
 MRazGTMLYEKyZe8rdczFxA7uKqSB2b6k4+leZ7RmPOKNUaBoqZB+7FzcjT3EHSECRsut
 3wXVEo2umYATRImEq2E/k8HQR+5BQ+iklW17Gl7WrxsVFLi6siVpFZXsoQNwHhyhgVKX
 oAuw==
X-Gm-Message-State: AOAM530qGszOkamoRSCA//fZgQaX8g3Xj/pD3t5J4XcBB2+P1uSHlybO
 exCS1SmmQEaMM1LQIhsvJtBVxItSf79Qaw==
X-Google-Smtp-Source: ABdhPJzfw9OMp9Tx0AALbOUNGO8cbmi+kKqAzX0ycgcdSqv5sv0LRnHbwE6TJFnJgPcmkAh5SOoyhQ==
X-Received: by 2002:a5d:6487:0:b0:210:11c5:b10e with SMTP id
 o7-20020a5d6487000000b0021011c5b10emr17230600wri.657.1653926840822; 
 Mon, 30 May 2022 09:07:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 013/117] target/arm: Introduce gen_gvec_ool_arg_zzzz
Date: Mon, 30 May 2022 17:05:24 +0100
Message-Id: <20220530160708.726466-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Use gen_gvec_ool_arg_zzzz instead of gen_gvec_ool_zzzz
when the arguments come from arg_rrrr_esz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-11-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 823c1d0ae3a..e795baf6f92 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -193,6 +193,12 @@ static bool gen_gvec_ool_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
     return true;
 }
 
+static bool gen_gvec_ool_arg_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
+                                  arg_rrrr_esz *a, int data)
+{
+    return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
+}
+
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
 static void gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int pg, int data)
@@ -7109,7 +7115,7 @@ static bool do_sve2_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
+    return gen_gvec_ool_arg_zzzz(s, fn, a, data);
 }
 
 static bool do_abal(DisasContext *s, arg_rrrr_esz *a, bool uns, bool sel)
@@ -8407,7 +8413,7 @@ static bool do_i8mm_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
     if (!dc_isar_feature(aa64_sve_i8mm, s)) {
         return false;
     }
-    return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
+    return gen_gvec_ool_arg_zzzz(s, fn, a, data);
 }
 
 static bool trans_SMMLA(DisasContext *s, arg_rrrr_esz *a)
@@ -8430,8 +8436,7 @@ static bool trans_BFDOT_zzzz(DisasContext *s, arg_rrrr_esz *a)
     if (!dc_isar_feature(aa64_sve_bf16, s)) {
         return false;
     }
-    return gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot,
-                             a->rd, a->rn, a->rm, a->ra, 0);
+    return gen_gvec_ool_arg_zzzz(s, gen_helper_gvec_bfdot, a, 0);
 }
 
 static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
@@ -8448,8 +8453,7 @@ static bool trans_BFMMLA(DisasContext *s, arg_rrrr_esz *a)
     if (!dc_isar_feature(aa64_sve_bf16, s)) {
         return false;
     }
-    return gen_gvec_ool_zzzz(s, gen_helper_gvec_bfmmla,
-                             a->rd, a->rn, a->rm, a->ra, 0);
+    return gen_gvec_ool_arg_zzzz(s, gen_helper_gvec_bfmmla, a, 0);
 }
 
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
-- 
2.25.1


