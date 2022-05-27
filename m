Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E534F5366F1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:32:22 +0200 (CEST)
Received: from localhost ([::1]:48370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuel3-0001ig-Vs
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYU-0006Wq-MR
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:22 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYS-0003Xw-3R
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:22 -0400
Received: by mail-pf1-x42a.google.com with SMTP id c14so4992804pfn.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ydIfkCmPgt2kfL7ENxc75Hjum16ae0Io+eiO1ZK0NhY=;
 b=W9+ffdPufkUfrcWJlRPG+3tDuPbxa8fpH1C/c0WM288c7fxA0sFnwjMBV0zYwcBi+j
 YV+0+zgbFWjhde0gTlbBE4kNfdUKNjKcjlQo3NmM6j2maQT9HYYGIXATveN0nUi0ug3d
 8nI9IbHujL2rzqTeNDFaiR480osAMQweUMnHWwGNq4anapcHJxzezXUomLVUBNibszJN
 r6GD0MVRuUQ0IUxCBehRX1lPx9YGqn/nEt2IYX1FuRwrv6yhemzBEr1Cz73wx/g3qohE
 yFhAXLN1h8FHnh9S3Ku4Q/MY3ro8y2WCfdaxmiZvlVXq7epxcyeJfVtTbGn6J04eXn/z
 RATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ydIfkCmPgt2kfL7ENxc75Hjum16ae0Io+eiO1ZK0NhY=;
 b=vDOLWHBlFGfMVez/jvskO5E+UEO3usq+1S45l3qM6f4WCRwjw5GVjgJlhmbJ23YmCc
 qxaJ74cEwtpahm2F0mkPrS5gZKOqJo9Jqjt0iwO7F5bTkpXDlrf+G4hf4pJOEa2ocOKN
 TH26NWHVHioZmxdSMhSyEspQeD2eCECe5Jwllq/n//xfiDWA6kLqx+R4phUPneE6MbBE
 k02fdpC7TxrOjnDOMiA71ROwf6nwbZxLIxXRRx6w8o5E24BsLYO0YdStTHT/fp494nH/
 Z8kUckkGruUPtMQ7Lmry751moYnpZEsFDMN4/detRsi+QcrOBI2mT+1IJ3G/ZH0eAhA2
 lrTA==
X-Gm-Message-State: AOAM533yhgIY6gKPyCfvwknXC/a1UWhhPfzJpZssKh3hRZPg9zCK2Pu9
 R2ZtkWrUhew5H7N1/QWLDpMcG4E8v8BbuQ==
X-Google-Smtp-Source: ABdhPJzFuBzStRrQqfD8K9xFYpzRCGZF6SMq7axyuWX2ky2A3wpQftvoXhhg0w9Ni2ccEDoirqRNJQ==
X-Received: by 2002:a05:6a00:849:b0:518:bcbb:a6e1 with SMTP id
 q9-20020a056a00084900b00518bcbba6e1mr22243423pfk.86.1653675558742; 
 Fri, 27 May 2022 11:19:18 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 010/114] target/arm: Introduce gen_gvec_ool_arg_zzzz
Date: Fri, 27 May 2022 11:17:23 -0700
Message-Id: <20220527181907.189259-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Use gen_gvec_ool_arg_zzzz instead of gen_gvec_ool_zzzz
when the arguments come from arg_rrrr_esz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 823c1d0ae3..e795baf6f9 100644
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
2.34.1


