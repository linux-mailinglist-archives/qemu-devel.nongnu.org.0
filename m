Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089F2536759
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:10:11 +0200 (CEST)
Received: from localhost ([::1]:40386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufLd-0006RO-TF
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYn-0007cc-LZ
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:41 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYi-0003ew-W4
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:41 -0400
Received: by mail-pf1-x42a.google.com with SMTP id b135so4955156pfb.12
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uzQEcj6Jkcp1aUlURZBX30EdXx/pZ/J6BYH/aJxKlm8=;
 b=VWpZ33lZGZR7pbNgAWXFJ1QB2lVwroS56MGmc2nEWhtCcTn1jHC96RHe77ZSbSoad0
 uJ3w2gHSYWBHvzGdctZkXXZy1Sr/hLfI/FZNoGWGQgl8stF/tp78k3blINuS3wzmCMAs
 BS8lAoFsBhvjXrPW1kD1UAKVzFGssb3Pw/vnw34Uo6yrnHsHv961h9DK3l9hI7DkkHXR
 PTrGOfwdLgLrpbrRkYu6W+5BYKOt2K9HM/Qh1MKwq1mxqxUfa2TnxDkqMeDaQGoyKTGM
 /0Xcyu0o3lFHYi3C4rhMyMf8j9FqoHiPBi+NE/3mvk7vMjNb1+FQazx8zBvm6qIsv4GI
 QUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uzQEcj6Jkcp1aUlURZBX30EdXx/pZ/J6BYH/aJxKlm8=;
 b=sZuBK4oyKYZ+ZEcA2UJNyAESSko1ANJu+/VQGVPPnaEO1Nxjr3pfS2WMFiGdGcyvol
 d2d88h5R2eXQF0U/hVCRxDrHJ5yjo3Z29GeE9/nUqSQRM06e3T8cPRkvrPRioi6BJY/Z
 NE0bIEpEFB4EYRBSHZ8sDm0XIi/MgTAqBREIS9skPdsmeAMqDyTxVGnXW3LkG0mks/EJ
 JFsW1RoFTr0Z5byDYx7qwiaK9AmZChTzvCDzgimZSOH0q7DKagUY6WxvaOvzEoEQNe4C
 tzg2WEfyAaLXm/Rwdigwk0Sm9MgBFNUWL1yT7iNVxYjV80jckT9jgYySqVX5v25MlYGk
 kgTA==
X-Gm-Message-State: AOAM531DjG9Ex1CiS5D1CNmrUpF5pjf88AKgO6wIT6SHkj1qxqQtdwLl
 bUdRvinw72iBUICO778nGm6GA1KbmA0GLg==
X-Google-Smtp-Source: ABdhPJx272dwYmhZPIOSq2rMMpmO5SS0NCLTNisAm564Qf5OHttwhC/741mT9h8tX63jBh1i8/h3ow==
X-Received: by 2002:a05:6a00:1bc4:b0:4fd:aed5:b5e4 with SMTP id
 o4-20020a056a001bc400b004fdaed5b5e4mr5201932pfw.39.1653675575734; 
 Fri, 27 May 2022 11:19:35 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 029/114] target/arm: Merge gen_gvec_fn_zz into do_mov_z
Date: Fri, 27 May 2022 11:17:42 -0700
Message-Id: <20220527181907.189259-30-richard.henderson@linaro.org>
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

There is only one caller for gen_gvec_fn_zz; inline it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0a69a1ef65..5ab9de46a7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -258,15 +258,6 @@ static bool gen_gvec_ool_arg_zpzz(DisasContext *s, gen_helper_gvec_4 *fn,
     return gen_gvec_ool_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, data);
 }
 
-/* Invoke a vector expander on two Zregs.  */
-static void gen_gvec_fn_zz(DisasContext *s, GVecGen2Fn *gvec_fn,
-                           int esz, int rd, int rn)
-{
-    unsigned vsz = vec_full_reg_size(s);
-    gvec_fn(esz, vec_full_reg_offset(s, rd),
-            vec_full_reg_offset(s, rn), vsz, vsz);
-}
-
 /* Invoke a vector expander on three Zregs.  */
 static void gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
                             int esz, int rd, int rn, int rm)
@@ -292,7 +283,9 @@ static void gen_gvec_fn_zzzz(DisasContext *s, GVecGen4Fn *gvec_fn,
 static bool do_mov_z(DisasContext *s, int rd, int rn)
 {
     if (sve_access_check(s)) {
-        gen_gvec_fn_zz(s, tcg_gen_gvec_mov, MO_8, rd, rn);
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_mov(MO_8, vec_full_reg_offset(s, rd),
+                         vec_full_reg_offset(s, rn), vsz, vsz);
     }
     return true;
 }
-- 
2.34.1


