Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859EA3AEF6D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:38:22 +0200 (CEST)
Received: from localhost ([::1]:59504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMwG-0006su-0a
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnE-0007Cd-J2
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:01 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMn4-0007Zh-OF
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:59 -0400
Received: by mail-wr1-x433.google.com with SMTP id h11so2898021wrx.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9QgTY1/4pzqtmmjEe1TYMh/+TM7zEmOviieM2HmPRow=;
 b=CT3nxCZefvnq3pzq527ejFjvzTP5rbQk8p0gTpqtXT25ktg0l7MGDqlOFZygrJPuPm
 tnrI+G+zuEOZP0gFsQ6NmDZH8aP4NrEAfuyEqqFw4IxmCY+GH6HbzJbxwvbG3qQyz2HN
 CiVhGxyMYsdokN12rzYumUtYsGPVrf8WOtIVbEJSensq6KWrn7BPxxt0z5dFBBg454lm
 O8su7Cbo33M7tK8poY6yeWgW8Ca9Y72G6VcBM9huszhsqZnYHMXPBu44lRmmOuUOdTiM
 3o6SQzZWJeeBWMi0Z/lAzp7DDFAaTHy4mkk2+uE7S2t4YpyQ8RaLZO5Rz+0KdMZUW329
 wzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9QgTY1/4pzqtmmjEe1TYMh/+TM7zEmOviieM2HmPRow=;
 b=SmZvFdFLHfXPCBixdfDR2m+x7CiKVQ5u/g9b3S+GWebxdaTdzeL/ZG++3+VSGI0pIt
 W4Nh7hy5dDuI497D7z0Y/EiRJWkGNdYozoDY/qgXH1dCEXkZQRhoIHhz1o0copWvmACh
 xajTAbiXbEhdhiZWkXl+TeyoV/yjVCXY3xfKp2wiqVfbms0AvQRA/bcelbjWMIPKFVAI
 WouN7FVve3laPhQRbNlHHyg+ROl1v2q+Cu2TmrZLd7fPrq4FpjTqG9OTlJvu6GOKEx9B
 TMGqx0fUzm6cdt03J6Fj+uf0kJ2gKzVOHJAnRCTAR4YrIPyOpja5J5mmcwQxt0j+LDaR
 Ocvg==
X-Gm-Message-State: AOAM533WH57zUMfEfBSShOfHB9brhcON2ZmbM/PLQDE+WBvMQayOMZoy
 0UKNBdATAhaO9M4flQclhNheqvcmsDDXoq32
X-Google-Smtp-Source: ABdhPJzaU2PYNSXne4UGsOB33GnNg28bvhK4V7XMvhAwIkSejW2uqisWBmNtdBO1Az+GB7+V/62CmQ==
X-Received: by 2002:adf:a74a:: with SMTP id e10mr7590475wrd.185.1624292929262; 
 Mon, 21 Jun 2021 09:28:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/57] target/arm: Implement MVE VABS
Date: Mon, 21 Jun 2021 17:27:54 +0100
Message-Id: <20210621162833.32535-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Implement the MVE VABS functions (both integer and floating point).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-8-peter.maydell@linaro.org
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
index fa0a32d284b..2cf28f054bf 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -24,6 +24,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
+#include "tcg/tcg.h"
 
 static uint16_t mve_element_mask(CPUARMState *env)
 {
@@ -281,3 +282,15 @@ DO_1OP(vrev64w, 8, uint64_t, wswap64)
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


