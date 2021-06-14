Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C474F3A6ACC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:45:32 +0200 (CEST)
Received: from localhost ([::1]:47072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsomJ-0001YC-PM
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoFC-0002eR-TM
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:18 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEo-0000db-Ai
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:18 -0400
Received: by mail-wm1-x32b.google.com with SMTP id b205so7635094wmb.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Akv5O3gdjVrTqCIXbrRhtQJKkd4wWDJEYr14K1N04g=;
 b=YGA/XIFh0yK/mP0Glc7jJTKcfSkCDzi5znC688Z909oIfEYDL/xaLK/EJagEHImRzW
 fWNCjWk0cUnNpHUCg8he3fXKuUhGw4eFHx6s74weOwabTImTfZVqRg5NEHSMFxzL/O2h
 jjlQ/Dyn0shHFJcSJKvqoP0Mb18WxuMeCoVYERdCytdIVe4trlfIshmw2LSsrK4cLVRN
 iqs0/cdajfBW1bKqLDH4/3S/Ib1ZaM1wN9gAss6cdz7DBI0j3SKzynmAQgz+AS9nu2iM
 JuNU3kt4PN+Axw5PPIzBEv1EqU+s2mH7WqfkCid5a1DCp3uUzqRrofIclRiG3GuejejF
 WukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Akv5O3gdjVrTqCIXbrRhtQJKkd4wWDJEYr14K1N04g=;
 b=K25P5zvtFKAulYUwcdGp2lTDs4cRqSAzTPY8vn2rsXMfDorD6VV72bkn4qYjFgF86n
 C2ZOg5cx3XJzsh+ma5scVYHZ8hS+nZ23Ukdh7HiDuA+veksiXvl9LI8xMNEh78Ana5/v
 GUjOsjXBCDeO0Np7Rk+ecaN1GdenUjMiGVuU4rheZbx7Cs7Y/KIveMhDEfJGYHkC7R3l
 eYLADUXabYaawBdA298Gb72pvO6wlVATtTxAu9Uu1F9JJeNjB/5gH9jIDc/lFCy6Suat
 K4enxiQ5YG/z2b8DTsK64Z0x6lEX+qz1FP5XQi3zLoQNcrmshXIJbp4vh06TYsSReh24
 JNBQ==
X-Gm-Message-State: AOAM532wkgnM14LNq5XtuCGzBN3DVGoj+zIocjBPyecZmJgBIBCHrhWf
 b4iwZep4Dy7lGcE5da5BdGLg/g==
X-Google-Smtp-Source: ABdhPJxGil3Fl/ZX4O95gdsiR+ZgGvKo8hkSENHyyFqggkhmhXtDhKu1qM4LiY9szd3QfZzrQgZSFw==
X-Received: by 2002:a1c:2155:: with SMTP id h82mr17246212wmh.115.1623683453007; 
 Mon, 14 Jun 2021 08:10:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 52/57] target/arm: Implement MVE VRHADD
Date: Mon, 14 Jun 2021 16:10:02 +0100
Message-Id: <20210614151007.4545-53-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VRHADD insn, which performs a rounded halving
addition.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 6 ++++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 34a46ed38ee..2f0cf99359a 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -238,6 +238,14 @@ DEF_HELPER_FLAGS_4(mve_vqdmullbw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqdmullth, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqdmulltw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vrhaddsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhaddsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhaddsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vrhaddub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhadduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 3a2a7e75a3a..6b969902df0 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -157,6 +157,9 @@ VQRDMLSDHX       1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
 VQDMULLB         111 . 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 1 @2op_sz28
 VQDMULLT         111 . 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 1 @2op_sz28
 
+VRHADD_S         111 0 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
+VRHADD_U         111 1 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 7c5b36caae9..a8ff921144d 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -546,6 +546,12 @@ DO_2OP_U(vshlu, DO_VSHLU)
 DO_2OP_S(vrshls, DO_VRSHLS)
 DO_2OP_U(vrshlu, DO_VRSHLU)
 
+#define DO_RHADD_S(N, M) (((int64_t)(N) + (M) + 1) >> 1)
+#define DO_RHADD_U(N, M) (((uint64_t)(N) + (M) + 1) >> 1)
+
+DO_2OP_S(vrhadds, DO_RHADD_S)
+DO_2OP_U(vrhaddu, DO_RHADD_U)
+
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
     if (val > max) {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index ca1203e650d..a4efb9bc3eb 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -418,6 +418,8 @@ DO_2OP(VQDMLSDH, vqdmlsdh)
 DO_2OP(VQDMLSDHX, vqdmlsdhx)
 DO_2OP(VQRDMLSDH, vqrdmlsdh)
 DO_2OP(VQRDMLSDHX, vqrdmlsdhx)
+DO_2OP(VRHADD_S, vrhadds)
+DO_2OP(VRHADD_U, vrhaddu)
 
 static bool trans_VQDMULLB(DisasContext *s, arg_2op *a)
 {
-- 
2.20.1


