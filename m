Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A944536770
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:26:16 +0200 (CEST)
Received: from localhost ([::1]:53724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufbD-00025X-4u
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecW-0003yp-Ud
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:32 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:45940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004U7-QY
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:32 -0400
Received: by mail-pf1-x432.google.com with SMTP id b135so4961844pfb.12
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2WEiKpEgenFmY1LO8ckyA77Vjve+XyxeM9X2y4QnZd0=;
 b=fGD3fhVYSWVuJiFEx9+AttEvuhEaBwJwAFRLlLaEM26A1yDbk2uaKeTr5tJuu6S+fN
 Augyrn5GuX/6KhyA8MqWre0rErDNlCnB7B0RE/RYfhLTk6aWFhWwj6S5DkUKQ1DZJ3Iw
 qbU9Sh3oywhbeuIpnG+SKQnmKVmp8Zt/r/hRPlH38z64bmMkASL9hMcjvX4+hK4LxdxT
 kqUIHSGKmbUC2Pjx0yBcjk+ZbfNyWdAE4jznIEiftHXudULNSGJnaZICexcmg98LNQHt
 5EcbsdSfihf2KmhfZqnR81Ei4Q6hJP+MM3S2JvOYt3GGFP/NJyX044d6CG4bf93QVJQm
 BR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2WEiKpEgenFmY1LO8ckyA77Vjve+XyxeM9X2y4QnZd0=;
 b=ebrH3rQUTpF8BbxUOhkXwhe+6IblIC3jJs6fWV8rrrZH385xLneejwIij6nmFqUeff
 xCOyMLPe0c08RLWTvd1tv4NHFJbHR1i1hWApDxsVYT2ifMD7IbHB/WkWf5mB8WApU5fE
 kT9MjQZk07Jrreonm78NohcCQP7u7yhGJAWnRPXMAxS41cSJuPmYk18iA8X/Tbb7VDwS
 UIUemFBw3yHGC+FGfdNhlpBvwdxMcUmT7pZwsxb56weGysVLxZUEhqkipdWmOzpjtzGV
 pIec3Ykvmprqu0C0GmWHK3FuUoS336GQ3sv1N/g8GWAdoV9enZUqKnEsM/lxhPBEde2q
 DRyg==
X-Gm-Message-State: AOAM532jbZDuFukXs4+YVoOI8BuFw0sz9XK5dVTjw39Y15CGQCj+Bj5w
 LzjRTYYgoJZeG8bjIyvC1zgQzfKevjPD9A==
X-Google-Smtp-Source: ABdhPJwMteqZt4WcimE64/TT0QUtXmTqeBWFhW1/rJYILjdUtq/IOgP7CrqvPvGWD2BsdsQZBoa1LA==
X-Received: by 2002:a05:6a00:1acb:b0:518:986c:a7c4 with SMTP id
 f11-20020a056a001acb00b00518986ca7c4mr28090458pfv.2.1653675793490; 
 Fri, 27 May 2022 11:23:13 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 071/114] target/arm: Reject dup_i w/ shifted byte early
Date: Fri, 27 May 2022 11:18:24 -0700
Message-Id: <20220527181907.189259-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Remove the unparsed extraction in trans_DUP_i,
which is intended to reject an 8-bit shift of
an 8-bit constant for 8-bit element.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  5 ++++-
 target/arm/translate-sve.c | 10 ++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0388cce3bd..c02da0a082 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -787,7 +787,10 @@ WHILE_ptr       00100101 esz:2 1 rm:5 001 100 rn:5 rw:1 rd:4
 FDUP            00100101 esz:2 111 00 1110 imm:8 rd:5
 
 # SVE broadcast integer immediate (unpredicated)
-DUP_i           00100101 esz:2 111 00 011 . ........ rd:5       imm=%sh8_i8s
+{
+  INVALID       00100101 00    111 00 011 1 -------- -----
+  DUP_i         00100101 esz:2 111 00 011 . ........ rd:5       imm=%sh8_i8s
+}
 
 # SVE integer add/subtract immediate (unpredicated)
 ADD_zzi         00100101 .. 100 000 11 . ........ .....         @rdn_sh_i8u
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c0781ecf60..14faef0564 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -403,6 +403,12 @@ const uint64_t pred_esz_masks[4] = {
     0x1111111111111111ull, 0x0101010101010101ull
 };
 
+static bool trans_INVALID(DisasContext *s, arg_INVALID *a)
+{
+    unallocated_encoding(s);
+    return true;
+}
+
 /*
  *** SVE Logical - Unpredicated Group
  */
@@ -3246,13 +3252,9 @@ static bool trans_FDUP(DisasContext *s, arg_FDUP *a)
 
 static bool trans_DUP_i(DisasContext *s, arg_DUP_i *a)
 {
-    if (a->esz == 0 && extract32(s->insn, 13, 1)) {
-        return false;
-    }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         int dofs = vec_full_reg_offset(s, a->rd);
-
         tcg_gen_gvec_dup_imm(a->esz, dofs, vsz, vsz, a->imm);
     }
     return true;
-- 
2.34.1


