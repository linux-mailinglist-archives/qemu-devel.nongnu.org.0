Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF49536748
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:59:25 +0200 (CEST)
Received: from localhost ([::1]:44958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufBE-0005rK-PQ
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecL-0003ai-3n
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:21 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec4-0004QA-BI
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:18 -0400
Received: by mail-pj1-x1032.google.com with SMTP id cv10so5264428pjb.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TsIzgLl5niFnedwbc6x/KmtyKG7iVyNjzhvtIM87k4A=;
 b=ptzmQWJE4zj51wo+U6HjoZbpPdelJD3zdSRuDpwxKQNqZgqsjvORrjkuxHCWb88vST
 aNZbcJO0W2rd8tbDysmJSBxSEZ8hjZPmXbufy/ka+j/+lMyTACp7PfN9nuwjdEIMc93J
 eMSAA6tf9xIOGVDKxQCdyMRaLRFrrF4oq7RfI2mPsWf4QEt3r/RybljI8mMS0z54uaku
 XrqJcXMpCqRnoY7VQ9elhpnlAyLg/76ccZe1cL+6PMNpIcys6jx2F9IyfB/7Gs5GZC0b
 rxNiMhH104hdNasrS1qJWFY3eFqP80KqQOPDYInHuh/zOzFjTjESzWVkFMfSZa8HdRtE
 CO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TsIzgLl5niFnedwbc6x/KmtyKG7iVyNjzhvtIM87k4A=;
 b=kqHBB2LdnswcGtZIePGQ4+zvbpMmym4/A+/otjsedWSVuEtQxXxQNaPMcGV/GCE+Vl
 qn48vtn0mhZhAEjV1eroT3iqYl7CbAPA9JbehB21hX9bF3U8gUACVGxyGdBrGWAcF95d
 w08kBedTSXX18kl2IG6/iWREh0E2K5Mt0bzZSddme5Bhc6P+g3lyLCb8b1UnQz+E1uqF
 CuC/5ew5DlboFCOpEsXeha7A91VWHMcXevgrTWD/KcBDRxXNJfbR9m5kxcyTiZyDDw/u
 5L4q9Wg6D2hIsGA4Gp+gj56nkWv/62JY8OqdZBIcqY8TpYCIrz+mAyR8/WdcAoX7NVkp
 Hb9A==
X-Gm-Message-State: AOAM530ficg/hzqKWh02Q1JMOynqc6bl/94rqIf6Yf90yhJnZ4KX2s7A
 otuJgciuFDxr0Tr2P9mlHfhUgQnu54ANKQ==
X-Google-Smtp-Source: ABdhPJwQ3DYpID/KVUnUBj2n9GTKeGPcG/nikIdJyRxpO3Smk49K1JZ6u+QPXJ5qdoc+MV2c8wLl/w==
X-Received: by 2002:a17:902:d50d:b0:15f:249c:2006 with SMTP id
 b13-20020a170902d50d00b0015f249c2006mr30811406plg.31.1653675782856; 
 Fri, 27 May 2022 11:23:02 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 058/114] target/arm: Use gen_gvec_ool_arg_zzz for do_zip,
 do_zip_q
Date: Fri, 27 May 2022 11:18:11 -0700
Message-Id: <20220527181907.189259-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
 target/arm/translate-sve.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c2ced3e2bb..75c52d8ce1 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2293,16 +2293,10 @@ static bool do_zip(DisasContext *s, arg_rrr_esz *a, bool high)
         gen_helper_sve_zip_b, gen_helper_sve_zip_h,
         gen_helper_sve_zip_s, gen_helper_sve_zip_d,
     };
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned high_ofs = high ? vsz / 2 : 0;
 
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        unsigned high_ofs = high ? vsz / 2 : 0;
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vsz, vsz, high_ofs, fns[a->esz]);
-    }
-    return true;
+    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, high_ofs);
 }
 
 static bool trans_ZIP1_z(DisasContext *s, arg_rrr_esz *a)
@@ -2317,18 +2311,13 @@ static bool trans_ZIP2_z(DisasContext *s, arg_rrr_esz *a)
 
 static bool do_zip_q(DisasContext *s, arg_rrr_esz *a, bool high)
 {
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned high_ofs = high ? QEMU_ALIGN_DOWN(vsz, 32) / 2 : 0;
+
     if (!dc_isar_feature(aa64_sve_f64mm, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        unsigned high_ofs = high ? QEMU_ALIGN_DOWN(vsz, 32) / 2 : 0;
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vsz, vsz, high_ofs, gen_helper_sve2_zip_q);
-    }
-    return true;
+    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_zip_q, a, high_ofs);
 }
 
 static bool trans_ZIP1_q(DisasContext *s, arg_rrr_esz *a)
-- 
2.34.1


