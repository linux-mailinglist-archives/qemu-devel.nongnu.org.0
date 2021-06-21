Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B5D3AEF43
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:35:39 +0200 (CEST)
Received: from localhost ([::1]:51062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMte-0001D2-CW
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnE-0007CG-Hl
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:01 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:50803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMn4-0007Z1-Nd
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:00 -0400
Received: by mail-wm1-x333.google.com with SMTP id k42so9059364wms.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6kbaljxf63/uyOyaXpvbAbvuchcbk2c1e6Rv9Kp62zg=;
 b=JeTaFlaCFCF377txp07SYuShRhL7d738fyN1Vl/LPCEBlG666v/WFCa+J/IRcEMhoh
 egfG5jWYTKTb9UGz9Pj4BFsbjWpHFr6rXtlq6p5ezfO9vaFYKNRGYMfkX07cP9iXNtYI
 0TFMuYsUgVGVtaedJ7mfSx5pfmq18dFUg6jcvOCt3Adr+/8wZttQ78ONxppjB3jHSClw
 mHkq3ublHQjVskZElkiCrduPjSOSjpHbxWSQRZA6rXz9SpLDCRDkFC6S0i+pe2X9e6dO
 fPPaQLAPqaOWm2Fl3eG9pu1V74Jzp7He8BD64n6tc+kOtVDy0Aba8Q1ucDj1HtMa0qdv
 Sufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6kbaljxf63/uyOyaXpvbAbvuchcbk2c1e6Rv9Kp62zg=;
 b=rvKL9U/PTir/kJs8GT2zbpAdyTTnKjUbylaxlabIuvAhD+s0JTCTB8xJ1kVAwCpegg
 lh+zEP9w1IdDNV0IvnRljJBJKhmzbGjcqEe5lwxsYbrGgCOG4zcaZmc4nKDoqugMRGNB
 bFB0hJdTvCLf18HTpHYpBWPtI5r87wiDrie/mAr0ZTVEfZzEC2s2yC0xC95JqCpjmvgq
 nR0+8SlVgIUoL5x5jbenFJg4E0jN3xixUOnrHS1pEyTmVBbsdDoioxNxse4X1roAI6MT
 BN+B7y0vqicyKNIKo1fzli6rfyU2CO4ry3tv+QIC7a6mBaSaVejfSmjUjezXuQgCyiVi
 O3ow==
X-Gm-Message-State: AOAM533nvMq6m7sTGLnzjqW0vfkGWjynDqD7U33RkWGN3ehK8azyLt3t
 XynNeUxwk4WD/o8JjMAwUE+DAiuLdBeVEeEj
X-Google-Smtp-Source: ABdhPJzb4VKVfP0+py7CgMuTxioYrVCc4uDMGYKj8nqypQbd4qHEEtg88P72It/spNv9C/MRE+ILvA==
X-Received: by 2002:a7b:c099:: with SMTP id r25mr28442287wmh.144.1624292928470; 
 Mon, 21 Jun 2021 09:28:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/57] target/arm: Implement MVE VMVN (register)
Date: Mon, 21 Jun 2021 17:27:53 +0100
Message-Id: <20210621162833.32535-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Implement the MVE VMVN(register) operation.  Note that for
predication this operation is byte-by-byte.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-7-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    | 2 ++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 4 ++++
 target/arm/translate-mve.c | 5 +++++
 4 files changed, 14 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 4c89387587d..f1dc52f7a50 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -47,3 +47,5 @@ DEF_HELPER_FLAGS_3(mve_vrev32h, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vrev64b, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vrev64h, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vrev64w, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vmvn, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 16ee511a5cb..ff8afb682fb 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -30,6 +30,7 @@
 @vldst_wn ... u:1 ... . . . . l:1 . rn:3 qd:3 . ... .. imm:7 &vldr_vstr
 
 @1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
+@1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
 
 # Vector loads and stores
 
@@ -74,3 +75,5 @@ VCLZ             1111 1111 1 . 11 .. 00 ... 0 0100 11 . 0 ... 0 @1op
 VREV16           1111 1111 1 . 11 .. 00 ... 0 0001 01 . 0 ... 0 @1op
 VREV32           1111 1111 1 . 11 .. 00 ... 0 0000 11 . 0 ... 0 @1op
 VREV64           1111 1111 1 . 11 .. 00 ... 0 0000 01 . 0 ... 0 @1op
+
+VMVN             1111 1111 1 . 11 00 00 ... 0 0101 11 . 0 ... 0 @1op_nosz
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 8b565b50a9a..fa0a32d284b 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -277,3 +277,7 @@ DO_1OP(vrev32h, 4, uint32_t, hswap32)
 DO_1OP(vrev64b, 8, uint64_t, bswap64)
 DO_1OP(vrev64h, 8, uint64_t, hswap64)
 DO_1OP(vrev64w, 8, uint64_t, wswap64)
+
+#define DO_NOT(N) (~(N))
+
+DO_1OP(vmvn, 8, uint64_t, DO_NOT)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 32a8324c5e6..bd908abcff7 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -232,3 +232,8 @@ static bool trans_VREV64(DisasContext *s, arg_1op *a)
     };
     return do_1op(s, a, fns[a->size]);
 }
+
+static bool trans_VMVN(DisasContext *s, arg_1op *a)
+{
+    return do_1op(s, a, gen_helper_mve_vmvn);
+}
-- 
2.20.1


