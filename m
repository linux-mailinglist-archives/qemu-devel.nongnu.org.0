Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D223A6A59
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:29:23 +0200 (CEST)
Received: from localhost ([::1]:40450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoWg-0000iE-K6
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEd-0001HN-Uk
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:43 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoER-0000NU-Kx
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id o3so14938891wri.8
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OYsNwu8ERXPQKxet9cJlsdhA4HygFcEzlfueqfhIXYc=;
 b=lIzhx/zp6Gx8gQotWxHLBAvGq8aVa2QteC00w/yEP31Iy+H/Wr40G9OJ/FKIlGoqXt
 VjlOCCoblxTaGVYoOcq4aDb3p/unW+LJ4Y6JIZXlJdbXkn4pZG0kYGa0e1JWaTBIAyyl
 HP69dozFf08pmI0GUStl5QxVZeoOFCjFHPJBbridc5B4BQ3DYshG1VE1kktt872cW3ZI
 asQx3ogQo/BSjuqF3HDkqZHc4nBt5ugMBg0GnspLlrEwlBRzc0YRFw0L6+L5+yuekF+j
 UNrb5St390G3Cg8FzwVciGEutaLhUR+x64IrOXQQYO40dKoeIbP39skpWhCq1p0hF8lc
 Qp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OYsNwu8ERXPQKxet9cJlsdhA4HygFcEzlfueqfhIXYc=;
 b=KQC+tHo+VNYNHtdcYAmPCFHd62yDv0+U5Y6BbQbdZsGIA/NuHrvC4k3+2KmS+dg+eH
 S+9wAepfzYVIh83299Nncp272JQGeXz3hqkre6/2Egyyc0dosDqh+tCY+jQLJX7rWZyL
 avhXTibQiE67wTk+0ydrAIMrda2A/rkWy4GylCAkFKClib7IuycVYj6RAM16srXvwoCr
 V5AISqb+PZryU1fMiUPv32qNs/ecsyPH7gC5/eA5jqRkMwg+70Jx5bokrKw0dYL8EDvy
 knwTLRvj4GGFJFrpJgz9pknsDBYXIjEkFCHLRxa0w9Ehkg3KCBMqSV8a02gemzAHlUUh
 DQXw==
X-Gm-Message-State: AOAM533T9ppgSpD6giZFjhAEJ3Hbb+OnQ1aiK7K7I2uI/lrqGZFzPLcM
 Dxzt+BXHTvcyDqgF2QxaB+5eAg==
X-Google-Smtp-Source: ABdhPJx+IY+7bLCkKgyVFOyQPn0dCoUPMM5/7fCgrkmBvJ9gP3vqnUiUo5dVYsYAxVw3dunJLOdATQ==
X-Received: by 2002:a05:6000:10e:: with SMTP id
 o14mr19493496wrx.76.1623683430306; 
 Mon, 14 Jun 2021 08:10:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 24/57] target/arm: Implement MVE VADD, VSUB, VMUL
Date: Mon, 14 Jun 2021 16:09:34 +0100
Message-Id: <20210614151007.4545-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Implement the MVE VADD, VSUB and VMUL insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 12 ++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 14 ++++++++++++++
 target/arm/translate-mve.c | 16 ++++++++++++++++
 4 files changed, 47 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 01b6123f250..707b9cbd546 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -69,3 +69,15 @@ DEF_HELPER_FLAGS_4(mve_vbic, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vorr, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vorn, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_veor, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vaddb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vaddh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vaddw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vsubb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vsubh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vsubw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmulb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 332e0b8d1d6..f7d1d303f17 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -33,6 +33,7 @@
 
 @1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
 @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
+@2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 
 # Vector loads and stores
@@ -77,6 +78,10 @@ VORR             1110 1111 0 . 10 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
 VORN             1110 1111 0 . 11 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
 VEOR             1111 1111 0 . 00 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
 
+VADD             1110 1111 0 . .. ... 0 ... 0 1000 . 1 . 0 ... 0 @2op
+VSUB             1111 1111 0 . .. ... 0 ... 0 1000 . 1 . 0 ... 0 @2op
+VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 94064e68660..4dc4aaa5932 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -352,6 +352,12 @@ DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
         mve_advance_vpt(env);                                           \
     }
 
+/* provide unsigned 2-op helpers for all sizes */
+#define DO_2OP_U(OP, FN)                        \
+    DO_2OP(OP##b, 1, uint8_t, FN)               \
+    DO_2OP(OP##h, 2, uint16_t, FN)              \
+    DO_2OP(OP##w, 4, uint32_t, FN)
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -363,3 +369,11 @@ DO_2OP(vbic, 8, uint64_t, DO_BIC)
 DO_2OP(vorr, 8, uint64_t, DO_ORR)
 DO_2OP(vorn, 8, uint64_t, DO_ORN)
 DO_2OP(veor, 8, uint64_t, DO_EOR)
+
+#define DO_ADD(N, M) ((N) + (M))
+#define DO_SUB(N, M) ((N) - (M))
+#define DO_MUL(N, M) ((N) * (M))
+
+DO_2OP_U(vadd, DO_ADD)
+DO_2OP_U(vsub, DO_SUB)
+DO_2OP_U(vmul, DO_MUL)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 2c78dde42b3..e51650625c5 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -331,3 +331,19 @@ DO_LOGIC(VBIC, gen_helper_mve_vbic)
 DO_LOGIC(VORR, gen_helper_mve_vorr)
 DO_LOGIC(VORN, gen_helper_mve_vorn)
 DO_LOGIC(VEOR, gen_helper_mve_veor)
+
+#define DO_2OP(INSN, FN) \
+    static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
+    {                                                           \
+        static MVEGenTwoOpFn * const fns[] = {                  \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_2op(s, a, fns[a->size]);                      \
+    }
+
+DO_2OP(VADD, vadd)
+DO_2OP(VSUB, vsub)
+DO_2OP(VMUL, vmul)
-- 
2.20.1


