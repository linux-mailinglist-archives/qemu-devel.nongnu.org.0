Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C508B510521
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:18:40 +0200 (CEST)
Received: from localhost ([::1]:36892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOpj-0004oP-Ul
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8x-0002Gz-Vd
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:34:27 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:45984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8w-0004Ly-0O
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:34:27 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so3005783pji.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rEYpL9+yf+aJ8URnT+Udx9HusvkjZ5AP1kU3tR6FFqM=;
 b=jtlksooChHxoDZiaqIL4waU3vHPV1Lf5efkEcZghNamwnTb8f1IiD5A1QKOOW1eudg
 5CmcfR+BjJz7jyihveubvwVapxmW2yYOOQ4KrvCwkWiDT0dS1jH/xyYyeEyT9ddJlQEk
 aqGmeqZLsHxELFdY8nFvKE7S91h1X4+xuRZbBPQwzN2WChA7u5mQH7r47gXv1OSUGrNv
 qqxH6O3f/WS7V0UVNUM54hxOkn5jINl+zYaRQ/Fcx/C+/MMgG8GKFwO/jz83mi7fO5zX
 qFYnx1Ut4qLNO7P4gO5+pQYpisNKEPmk7L0jTzokdunxKivPHCoVBaAdWckI9SqFRH5D
 4vMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rEYpL9+yf+aJ8URnT+Udx9HusvkjZ5AP1kU3tR6FFqM=;
 b=ndc56iT7OSa9F1DZgRTI2syOCttn8HtyVn5ip5OiIkleB+IfafI08dZpR8ahiKv2MV
 u6YFfnek9+9myuCgZ8nfKyG9e5deKXsvSMaQwVuF6R+J0iEfzjPJ9/Qv41aPxrUjCQ+x
 92QuwyBVgNZmPATzynWwtn0Si03HtHwDfoz+HWum6JJzTso3/ZVQiURMyVIe3spcY7nA
 qbOEqh7VE/XhsIeW6O5Rqv6wE0aEPrgStXrui4MYZobtVH/XAU9TYXf6alhgwHYhpyJM
 C6zB55UtbQxYMQCWZ5bITC7OprGNY93nHRGyt/7nlGL0XOHhv7N3UesH69UGs9WNrtY1
 SUJQ==
X-Gm-Message-State: AOAM531WxqS34ImJlDs8ace8OZuPu2wl0fiFbttGhCyhNWrtEekkDPH2
 sYOWMEVPap4M/IcHwEaDTsP3ynm53gh8Uw==
X-Google-Smtp-Source: ABdhPJzv5tyVjAAgMoi+3jtMJpVl07y+mDW7V+SrypDxg9V/hnoGqSTNoMLh199pmrHmFNuW+Q0Nfg==
X-Received: by 2002:a17:902:ab5c:b0:15c:ea3a:9437 with SMTP id
 ij28-20020a170902ab5c00b0015cea3a9437mr17333305plb.9.1650990864616; 
 Tue, 26 Apr 2022 09:34:24 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a17090acb8d00b001d953eb2412sm1132834pju.19.2022.04.26.09.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:34:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 42/47] target/arm: Use tcg_constant in LD1, ST1
Date: Tue, 26 Apr 2022 09:30:38 -0700
Message-Id: <20220426163043.100432-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
index 727f5cca36..fcab15a6ec 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6426,7 +6426,6 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
     gen_helper_gvec_mem_scatter *fn = NULL;
     bool be = s->be_data == MO_BE;
     bool mte = s->mte_active[0];
-    TCGv_i64 imm;
 
     if (a->esz < a->msz || (a->esz == a->msz && !a->u)) {
         return false;
@@ -6448,9 +6447,8 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
     /* Treat LD1_zpiz (zn[x] + imm) the same way as LD1_zprz (rn + zm[x])
      * by loading the immediate into the scalar parameter.
      */
-    imm = tcg_const_i64(a->imm << a->msz);
-    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, a->msz, false, fn);
-    tcg_temp_free_i64(imm);
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0,
+               tcg_constant_i64(a->imm << a->msz), a->msz, false, fn);
     return true;
 }
 
@@ -6609,7 +6607,6 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     gen_helper_gvec_mem_scatter *fn = NULL;
     bool be = s->be_data == MO_BE;
     bool mte = s->mte_active[0];
-    TCGv_i64 imm;
 
     if (a->esz < a->msz) {
         return false;
@@ -6631,9 +6628,8 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     /* Treat ST1_zpiz (zn[x] + imm) the same way as ST1_zprz (rn + zm[x])
      * by loading the immediate into the scalar parameter.
      */
-    imm = tcg_const_i64(a->imm << a->msz);
-    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, a->msz, true, fn);
-    tcg_temp_free_i64(imm);
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0,
+               tcg_constant_i64(a->imm << a->msz), a->msz, true, fn);
     return true;
 }
 
-- 
2.34.1


