Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4F45367AE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:48:17 +0200 (CEST)
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufwW-0003OF-5t
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecS-0003ii-U9
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:28 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004UJ-L1
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:27 -0400
Received: by mail-pg1-x534.google.com with SMTP id h186so4579915pgc.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W2HaG1ebqa6lzuH4I17UMuwtYfw3+co/JWIXJMbkftw=;
 b=MBVHX6zzbyojamgShjOjydEoImgxDD39e3VaotEq085ZnznuSZl/0A2EJ0BCtizdTO
 VYUsSIrsSXcsqiPkLKuq9/YDguv4DR/IPicSiPewAIQuKx0UJISMNWnq8RvG6EmlsVZM
 5cexQqaXLmQkcuSdKBI+lviAxIAUBRi+Mp/jrP7QcEIuQmqQ3OmgSxXyK7vMkRLMErsA
 5Vxp+FtHyudunE/lKjUNi8nHk1EbQe0ghLVMMq1jFYZDA5la1hwr1rj0XhoLwpRz38CI
 4Pjxsu9z5JRxdN/KnYRdMWyyciCHG6kD6luIS/dtWsDUvHEK6AtW4KVzgTPCz3nNFrKf
 ibrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W2HaG1ebqa6lzuH4I17UMuwtYfw3+co/JWIXJMbkftw=;
 b=hDWsGUGV4/pKD4jEHJ5FrGy6PnCDFSAsIV07SjMOlDhoxGvAwLJ8lEx1QM2ePAE9p6
 eE/abnZkZsv3GOlmNzsrcCMtJR++JwiiPj1JhoT7AeuOdfCN6QDYCST2CsBnq37CHhE/
 qmcBC3GYYNpQOP5Pn0TPRHJwYUCCVe9CATgT+S/2S60xHzEVR8vtwh7lTcdXiSphWm5d
 rKhVLnoFx+B3EKMhnWxL4oOwhUy0nAo0uU/7xeakKNoTXC9W2icAa9+mwEhkJiOzKN+w
 EL+yqqNBevdlOzYbvL2IVMx6t6dkfIVR/CZM7UzCUQ6cxTjunb3xadxjO1+MNf7vI8gW
 jZmA==
X-Gm-Message-State: AOAM530qWKz6iu5LdUl256vDw7tuVgAMUAp2jQC0Ftx972FcTRH65uU+
 Ju8SyUITonWL/bFfI2efsjFLT55dHzxNPw==
X-Google-Smtp-Source: ABdhPJyRiQiHDrX4LxzkZd0zSFMJr53R+fO7DEnS7pWeOg+7oI0uCBsXkkhnkHi3+hlsTLdS3mwinA==
X-Received: by 2002:a05:6a02:208:b0:3c6:9898:e656 with SMTP id
 bh8-20020a056a02020800b003c69898e656mr39143813pgb.560.1653675794308; 
 Fri, 27 May 2022 11:23:14 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 072/114] target/arm: Reject add/sub w/ shifted byte early
Date: Fri, 27 May 2022 11:18:25 -0700
Message-Id: <20220527181907.189259-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Remove the unparsed extractions in trans_ADD_zzi, trans_SUBR_zzi,
and do_zzi_sat which are intended to reject an 8-bit shift of an
8-bit constant for 8-bit element.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 35 ++++++++++++++++++++++++++++-------
 target/arm/translate-sve.c |  9 ---------
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index c02da0a082..8cff63cf25 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -793,13 +793,34 @@ FDUP            00100101 esz:2 111 00 1110 imm:8 rd:5
 }
 
 # SVE integer add/subtract immediate (unpredicated)
-ADD_zzi         00100101 .. 100 000 11 . ........ .....         @rdn_sh_i8u
-SUB_zzi         00100101 .. 100 001 11 . ........ .....         @rdn_sh_i8u
-SUBR_zzi        00100101 .. 100 011 11 . ........ .....         @rdn_sh_i8u
-SQADD_zzi       00100101 .. 100 100 11 . ........ .....         @rdn_sh_i8u
-UQADD_zzi       00100101 .. 100 101 11 . ........ .....         @rdn_sh_i8u
-SQSUB_zzi       00100101 .. 100 110 11 . ........ .....         @rdn_sh_i8u
-UQSUB_zzi       00100101 .. 100 111 11 . ........ .....         @rdn_sh_i8u
+{
+  INVALID       00100101 00 100 000 11 1 -------- -----
+  ADD_zzi       00100101 .. 100 000 11 . ........ .....         @rdn_sh_i8u
+}
+{
+  INVALID       00100101 00 100 001 11 1 -------- -----
+  SUB_zzi       00100101 .. 100 001 11 . ........ .....         @rdn_sh_i8u
+}
+{
+  INVALID       00100101 00 100 011 11 1 -------- -----
+  SUBR_zzi      00100101 .. 100 011 11 . ........ .....         @rdn_sh_i8u
+}
+{
+  INVALID       00100101 00 100 100 11 1 -------- -----
+  SQADD_zzi     00100101 .. 100 100 11 . ........ .....         @rdn_sh_i8u
+}
+{
+  INVALID       00100101 00 100 101 11 1 -------- -----
+  UQADD_zzi     00100101 .. 100 101 11 . ........ .....         @rdn_sh_i8u
+}
+{
+  INVALID       00100101 00 100 110 11 1 -------- -----
+  SQSUB_zzi     00100101 .. 100 110 11 . ........ .....         @rdn_sh_i8u
+}
+{
+  INVALID       00100101 00 100 111 11 1 -------- -----
+  UQSUB_zzi     00100101 .. 100 111 11 . ........ .....         @rdn_sh_i8u
+}
 
 # SVE integer min/max immediate (unpredicated)
 SMAX_zzi        00100101 .. 101 000 110 ........ .....          @rdn_i8s
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 14faef0564..bf988cab3e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3262,9 +3262,6 @@ static bool trans_DUP_i(DisasContext *s, arg_DUP_i *a)
 
 static bool trans_ADD_zzi(DisasContext *s, arg_rri_esz *a)
 {
-    if (a->esz == 0 && extract32(s->insn, 13, 1)) {
-        return false;
-    }
     return gen_gvec_fn_arg_zzi(s, tcg_gen_gvec_addi, a);
 }
 
@@ -3305,9 +3302,6 @@ static bool trans_SUBR_zzi(DisasContext *s, arg_rri_esz *a)
           .scalar_first = true }
     };
 
-    if (a->esz == 0 && extract32(s->insn, 13, 1)) {
-        return false;
-    }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         tcg_gen_gvec_2s(vec_full_reg_offset(s, a->rd),
@@ -3321,9 +3315,6 @@ TRANS_FEAT(MUL_zzi, aa64_sve, gen_gvec_fn_arg_zzi, tcg_gen_gvec_muli, a)
 
 static bool do_zzi_sat(DisasContext *s, arg_rri_esz *a, bool u, bool d)
 {
-    if (a->esz == 0 && extract32(s->insn, 13, 1)) {
-        return false;
-    }
     if (sve_access_check(s)) {
         do_sat_addsub_vec(s, a->esz, a->rd, a->rn,
                           tcg_constant_i64(a->imm), u, d);
-- 
2.34.1


