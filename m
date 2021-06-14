Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771283A6A5B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:29:42 +0200 (CEST)
Received: from localhost ([::1]:41774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoWx-0001ZQ-NF
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEa-00016R-L1
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:40 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEO-0000KK-RJ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:40 -0400
Received: by mail-wr1-x435.google.com with SMTP id z8so14940490wrp.12
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4YWvzbcoWa4j3/sIAhGsy9QmsBrpnIE43G38xUeYuVU=;
 b=MvYtCDnYSNwdItF0Vgzgfa8ihUocsE8zRjl85x4NMTnNmyQpdV6goYNoX68KXhc4rS
 vDyfpriePmFJM0nvv6xkxe6j2b3zvLyyH/S9OXDEsmQ5s7ILq1Q1qbAwZTlmltsgFRG9
 9lE/zLa+u0pXtDmgApSjqGHErovrPNUQZ/pIMacyBw1FgwR6WScHSkl4oN1UCuAoNlxD
 KaV74vvcnwxb4oOpolL1k5eKOAge6QMuYq+Mu3aH+EBKTsxMHQ4mg0bqt65cIMs0O2Mx
 bIomnzw/yWayQmEIc0tvEmPl5q9q65a7sibjeLOgYWT4J9JhIM1BvXpaGP7nm8kezqGS
 xdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4YWvzbcoWa4j3/sIAhGsy9QmsBrpnIE43G38xUeYuVU=;
 b=XaU5o12h4MHEn6h+kTjeYidg7vxyXMbpnLsT1oOBK0Rcr1nwbTojLuUmp2MUqMlY28
 Wjx/d6PqtDwCYxnGDZLjX97Pvc6fQO27bhzFtZDEpTC2He1Z2PO9LxEBBP+rwGj3SaZI
 hZzOP413ZBOiICizJQLUksewzAOF9f9HiY+vao/UceEmnbj7SSc8nAjsj7/TL29mXQCN
 i0hdPnQwx88SjUMK3IiSMfE5FG/1PUWz0O8clJssr9RZ8sX3p2fKdbWk6mBBa1MhTi8H
 BeGO3y/G85AxQAZoKxRcT3XjpP1CLuTDIyr7GSXhWC6ewAbXKGM1mLQVmxBlu1co603o
 yEoQ==
X-Gm-Message-State: AOAM530a1n95PqmIJ11rKpzpHaOlvNEQOs2G0QbHDRALzEcEAiPkKrtj
 pwGyL7jpzY6R4XpeqY6nIUZeI3b6i5ytNg==
X-Google-Smtp-Source: ABdhPJyYVoq0hpfY4ZLm8zJbj/bdDOVZzAp8NKOoSpkkCgO6r5LWa2T1dER/HyhBRdHJXl20P2Y4Xw==
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr4333712wrh.236.1623683426729; 
 Mon, 14 Jun 2021 08:10:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 19/57] target/arm: Implement MVE VABS
Date: Mon, 14 Jun 2021 16:09:29 +0100
Message-Id: <20210614151007.4545-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Implement the MVE VABS functions (both integer and floating point).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 13 +++++++++++++
 target/arm/translate-mve.c | 15 +++++++++++++++
 4 files changed, 37 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index f1dc52f7a50..76508d5dd71 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -49,3 +49,9 @@ DEF_HELPER_FLAGS_3(mve_vrev64h, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vrev64w, TCG_CALL_NO_WG, void, env, ptr, ptr)
 
 DEF_HELPER_FLAGS_3(mve_vmvn, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vabsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vabsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfabss, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index ff8afb682fb..66963dc1847 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -77,3 +77,6 @@ VREV32           1111 1111 1 . 11 .. 00 ... 0 0000 11 . 0 ... 0 @1op
 VREV64           1111 1111 1 . 11 .. 00 ... 0 0000 01 . 0 ... 0 @1op
 
 VMVN             1111 1111 1 . 11 00 00 ... 0 0101 11 . 0 ... 0 @1op_nosz
+
+VABS             1111 1111 1 . 11 .. 01 ... 0 0011 01 . 0 ... 0 @1op
+VABS_fp          1111 1111 1 . 11 .. 01 ... 0 0111 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 564f86fc65f..5f36f32a231 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -24,6 +24,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
+#include "tcg/tcg.h"
 
 static uint16_t mve_element_mask(CPUARMState *env)
 {
@@ -296,3 +297,15 @@ DO_1OP(vrev64w, 8, uint64_t, wswap64)
 #define DO_NOT(N) (~(N))
 
 DO_1OP(vmvn, 8, uint64_t, DO_NOT)
+
+#define DO_ABS(N) ((N) < 0 ? -(N) : (N))
+#define DO_FABSH(N)  ((N) & dup_const(MO_16, 0x7fff))
+#define DO_FABSS(N)  ((N) & dup_const(MO_32, 0x7fffffff))
+
+DO_1OP(vabsb, 1, int8_t, DO_ABS)
+DO_1OP(vabsh, 2, int16_t, DO_ABS)
+DO_1OP(vabsw, 4, int32_t, DO_ABS)
+
+/* We can do these 64 bits at a time */
+DO_1OP(vfabsh, 8, uint64_t, DO_FABSH)
+DO_1OP(vfabss, 8, uint64_t, DO_FABSS)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index bd908abcff7..90996813a85 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -199,6 +199,7 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
 
 DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
+DO_1OP(VABS, vabs)
 
 static bool trans_VREV16(DisasContext *s, arg_1op *a)
 {
@@ -237,3 +238,17 @@ static bool trans_VMVN(DisasContext *s, arg_1op *a)
 {
     return do_1op(s, a, gen_helper_mve_vmvn);
 }
+
+static bool trans_VABS_fp(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vfabsh,
+        gen_helper_mve_vfabss,
+        NULL,
+    };
+    if (!dc_isar_feature(aa32_mve_fp, s)) {
+        return false;
+    }
+    return do_1op(s, a, fns[a->size]);
+}
-- 
2.20.1


