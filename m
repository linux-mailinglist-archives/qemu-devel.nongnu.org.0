Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A76536767
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:17:46 +0200 (CEST)
Received: from localhost ([::1]:35322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufSz-0005Pd-Ig
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0003RG-VJ
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:09 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:47098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuebz-0004KA-JT
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:08 -0400
Received: by mail-pf1-x42b.google.com with SMTP id j6so4957952pfe.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XnPwnaxt8ItPpT63VDm+PFdBUhpkDXzxZoPLqjotw+4=;
 b=swDkWjnfsUUdsEcoV6uR4QZE7gL5u4ikCUNNYQ0Fjf7xQ9wEdIYOQL+IL6ClVhuHYV
 gi5hg/zXlX8s7dq7Rbx70zkZGSnln10Z4vfyix88zNDCrE30uC9s5EAOBZEZq4h4T2ua
 eYFtgV2Z9zVVEtRHE9E/ooMklJiEHhMyrejFRNaBUGn31WeQS86Nub5LDwpKRxer+007
 s1q8i43HkrkQK3QsO5e1UMEKlJqQ+yB7M8Zm0c/EGpFoAzt6DkBGD0gaBb8Uh1ucUBcv
 I/NjJH5HTL6vnitnNteoi4tATIwMh6yYcrJdIlh81Po6ZsZYAwyNoOs2U+r0lTROnYv/
 AyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XnPwnaxt8ItPpT63VDm+PFdBUhpkDXzxZoPLqjotw+4=;
 b=LlYI03qVBPcBzUoxDteviDzgbbQwEXKasaSORMiA2y+hkEuL2xsHkig9FEa/eBYjnH
 vI7VALJvcbmOJFEzjAun2BzCCwPY+yaF0wf22w8bwwfOtlnzY+igL+vILKTUyBBnmwrv
 vmTFvuykwGF4gAFimSm9SMFMdDoMhqN03Or/V5hDS9gXXRk8fKsGOnVV56+qgPfRz+5O
 Ro6uRTLg7rdn/tOrC0nnws9hYwK0hLCP0iTZ4MkipAsznqa6k9ydUFU+IyIvIn09R7xI
 quFNgfLIAqC9i+JEIQ6LAW/oXx82t/LzJcfhWLUG2UEHY+K4Vk8mRlkHsnrNCpSbF3tz
 OwHQ==
X-Gm-Message-State: AOAM532O5eAnQPpsJnjYfx4iHyBXacdpGlAxiRdUfZYgUtrGIfpD+Aob
 r2uGRpOY26haB5NuZpS6xOVkLlfkpw3M9Q==
X-Google-Smtp-Source: ABdhPJzM0+JTRj08/9c5AAG2NPtx75xd9LrX87PsRk1IN2IbmSIiVMRNU0cAqDSN0fLtwmEzScaMZA==
X-Received: by 2002:aa7:82d9:0:b0:4fa:2c7f:41e with SMTP id
 f25-20020aa782d9000000b004fa2c7f041emr45663220pfn.1.1653675768122; 
 Fri, 27 May 2022 11:22:48 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 042/114] target/arm: Use TRANS_FEAT for do_sve2_fn2i
Date: Fri, 27 May 2022 11:17:55 -0700
Message-Id: <20220527181907.189259-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
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

Convert SVE translation functions using do_sve2_fn2i
to use TRANS_FEAT and gen_gvec_fn_arg_zzi.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 43 ++++++--------------------------------
 1 file changed, 6 insertions(+), 37 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7a3b5f137a..911d2e28bf 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6828,43 +6828,12 @@ static bool do_adcl(DisasContext *s, arg_rrrr_esz *a, bool sel)
 TRANS_FEAT(ADCLB, aa64_sve2, do_adcl, a, false)
 TRANS_FEAT(ADCLT, aa64_sve2, do_adcl, a, true)
 
-static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_fn_arg_zzi(s, fn, a);
-}
-
-static bool trans_SSRA(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_ssra);
-}
-
-static bool trans_USRA(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_usra);
-}
-
-static bool trans_SRSRA(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_srsra);
-}
-
-static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_ursra);
-}
-
-static bool trans_SRI(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_sri);
-}
-
-static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_sli);
-}
+TRANS_FEAT(SSRA, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_ssra, a)
+TRANS_FEAT(USRA, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_usra, a)
+TRANS_FEAT(SRSRA, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_srsra, a)
+TRANS_FEAT(URSRA, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_ursra, a)
+TRANS_FEAT(SRI, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_sri, a)
+TRANS_FEAT(SLI, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_sli, a)
 
 TRANS_FEAT(SABA, aa64_sve2, gen_gvec_fn_arg_zzz, gen_gvec_saba, a)
 TRANS_FEAT(UABA, aa64_sve2, gen_gvec_fn_arg_zzz, gen_gvec_uaba, a)
-- 
2.34.1


