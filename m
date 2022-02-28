Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283724C7732
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:12:07 +0100 (CET)
Received: from localhost ([::1]:46170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkVC-000783-47
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:12:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOkSb-0004un-Lk
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:09:25 -0500
Received: from [2607:f8b0:4864:20::52b] (port=36677
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOkSZ-0005x1-T9
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:09:25 -0500
Received: by mail-pg1-x52b.google.com with SMTP id t14so9310761pgr.3
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S+mz2ogu1zcqrbgmqeDrINfOswx5azc/fcIK34KmvUM=;
 b=rqvEMRFKaQ4+dZUawNzeK7xSfhNNzneor/GjwL8soCLrVJkqHQ5wmGrwB8mmqjgqDL
 HC93rqIr4YAkLE5KCxYe/AEelQY+klC7lyeVBsPsWqbD5O/A5BWAPvKrmf2U/hHXVJKq
 fj0ZOIfC8ll/KFRQ5pXIjoIy4G2CjDcs4ayAJ4Pk94T6z6jUhGKDIOPoGGKNz9rIP++c
 BAGCgNrF52e/uUU7T0tGIahf2SJs5Ohl/Q9tIhZSs16bo1V10OrbEH3tEZAjileUoNc3
 zEGPk9xIViAtbdegJ4lcY+ZDu+XLgUHfvEzEpx7r+y8mRVqVUtC/2/SNpZFrZTuusD2x
 GjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S+mz2ogu1zcqrbgmqeDrINfOswx5azc/fcIK34KmvUM=;
 b=Qx3qNLeR3q4EQvO3f/Jq0bVE6yetneT2uI7JYbCkp7dkgTReJUx4oTjX+xkiX+UQfN
 eM2P/C4WMPbzck84sOLCpV+iHmBEiXNfAkgN3szNSsDaaF15J13WG4HG6yZOPgZU6q4+
 jzQq+hNy/cOVneUv6HsbDD7X8qE6WNhoIfWAe38nXzqcEXjuUBSwqPShtr+/q/EO4m+X
 h7VoV42BZPZpRgUCdU0OJxA56zmRX1t5dbelPhQ0PC5Knzf9rszSMrYr4ajRMeAq74C0
 SPtFzlXm0nvdhkoK0FH/0kN12E5sPtxNTQ3J1kmLlN32IhnaGWT2EjcZ2kUVOKHqYGel
 qAjA==
X-Gm-Message-State: AOAM530AjjK29h2Wi5BiQukZaiAu8GCTw9E5wOwM2fGuZmgZb6X+cjaa
 8zgE0lvFMoikJW7Ss/7mEB9arH4kPuvNyg==
X-Google-Smtp-Source: ABdhPJyqRxUrqn5N6vaRPzYX2Qe7gqNfXLG3BN4Pcq4kH8B5AYc2XrFQ3LsGsraTuH1YZ27R1/Q/rA==
X-Received: by 2002:a65:5888:0:b0:374:5575:ba08 with SMTP id
 d8-20020a655888000000b003745575ba08mr17969125pgu.375.1646071762552; 
 Mon, 28 Feb 2022 10:09:22 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 q24-20020aa79618000000b004e0e89985eesm13463223pfg.156.2022.02.28.10.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:09:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] tcg: Remove dh_alias indirection for dh_typecode
Date: Mon, 28 Feb 2022 08:09:16 -1000
Message-Id: <20220228180918.38188-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228180918.38188-1-richard.henderson@linaro.org>
References: <20220228180918.38188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Keith Packard <keithp@keithp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The dh_alias redirect is intended to handle TCG types as distinguished
from C types.  TCG does not distinguish signed int from unsigned int,
because they are the same size.  However, we need to retain this
distinction for dh_typecode, lest we fail to extend abi types properly
for the host call parameters.

This bug was detected when running the 'arm' emulator on an s390
system. The s390 uses TCG_TARGET_EXTEND_ARGS which triggers code
in tcg_gen_callN to extend 32 bit values to 64 bits; the incorrect
sign data in the typemask for each argument caused the values to be
extended as unsigned values.

This simple program exhibits the problem:

	static volatile int num = -9;
	static volatile int den = -5;
	int main(void)
	{
		int quo = num / den;
		printf("num %d den %d quo %d\n", num, den, quo);
		exit(0);
	}

When run on the broken qemu, this results in:

	num -9 den -5 quo 0

The correct result is:

	num -9 den -5 quo 1

Fixes: 7319d83a735 ("tcg: Combine dh_is_64bit and dh_is_signed to dh_typecode")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/876
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Tested-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Tested-by: Keith Packard <keithp@keithp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-head.h   | 19 ++++++++++---------
 target/hppa/helper.h         |  2 ++
 target/i386/ops_sse_header.h |  3 +++
 target/m68k/helper.h         |  1 +
 target/ppc/helper.h          |  3 +++
 5 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index b974eb394a..734af067fe 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -53,13 +53,16 @@
 # ifdef TARGET_LONG_BITS
 #  if TARGET_LONG_BITS == 32
 #   define dh_alias_tl i32
+#   define dh_typecode_tl dh_typecode_i32
 #  else
 #   define dh_alias_tl i64
+#   define dh_typecode_tl dh_typecode_i64
 #  endif
 # endif
-# define dh_alias_env ptr
 # define dh_ctype_tl target_ulong
+# define dh_alias_env ptr
 # define dh_ctype_env CPUArchState *
+# define dh_typecode_env dh_typecode_ptr
 #endif
 
 /* We can't use glue() here because it falls foul of C preprocessor
@@ -92,18 +95,16 @@
 #define dh_typecode_i64 4
 #define dh_typecode_s64 5
 #define dh_typecode_ptr 6
-#define dh_typecode(t) glue(dh_typecode_, dh_alias(t))
+#define dh_typecode_int dh_typecode_s32
+#define dh_typecode_f16 dh_typecode_i32
+#define dh_typecode_f32 dh_typecode_i32
+#define dh_typecode_f64 dh_typecode_i64
+#define dh_typecode_cptr dh_typecode_ptr
+#define dh_typecode(t) dh_typecode_##t
 
 #define dh_callflag_i32  0
-#define dh_callflag_s32  0
-#define dh_callflag_int  0
 #define dh_callflag_i64  0
-#define dh_callflag_s64  0
-#define dh_callflag_f16  0
-#define dh_callflag_f32  0
-#define dh_callflag_f64  0
 #define dh_callflag_ptr  0
-#define dh_callflag_cptr dh_callflag_ptr
 #define dh_callflag_void 0
 #define dh_callflag_noreturn TCG_CALL_NO_RETURN
 #define dh_callflag(t) glue(dh_callflag_, dh_alias(t))
diff --git a/target/hppa/helper.h b/target/hppa/helper.h
index fe8a9ce493..c7e35ce8c7 100644
--- a/target/hppa/helper.h
+++ b/target/hppa/helper.h
@@ -1,7 +1,9 @@
 #if TARGET_REGISTER_BITS == 64
 # define dh_alias_tr     i64
+# define dh_typecode_tr  dh_typecode_i64
 #else
 # define dh_alias_tr     i32
+# define dh_typecode_tr  dh_typecode_i32
 #endif
 #define dh_ctype_tr      target_ureg
 
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index e68af5c403..cef28f2aae 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -30,6 +30,9 @@
 #define dh_ctype_Reg Reg *
 #define dh_ctype_ZMMReg ZMMReg *
 #define dh_ctype_MMXReg MMXReg *
+#define dh_typecode_Reg dh_typecode_ptr
+#define dh_typecode_ZMMReg dh_typecode_ptr
+#define dh_typecode_MMXReg dh_typecode_ptr
 
 DEF_HELPER_3(glue(psrlw, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(psraw, SUFFIX), void, env, Reg, Reg)
diff --git a/target/m68k/helper.h b/target/m68k/helper.h
index 9842eeaa95..0a6b4146f6 100644
--- a/target/m68k/helper.h
+++ b/target/m68k/helper.h
@@ -17,6 +17,7 @@ DEF_HELPER_4(cas2l_parallel, void, env, i32, i32, i32)
 
 #define dh_alias_fp ptr
 #define dh_ctype_fp FPReg *
+#define dh_typecode_fp dh_typecode_ptr
 
 DEF_HELPER_3(exts32, void, env, fp, s32)
 DEF_HELPER_3(extf32, void, env, fp, f32)
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ab008c9d4e..ae7d503fcf 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -127,9 +127,11 @@ DEF_HELPER_FLAGS_1(ftsqrt, TCG_CALL_NO_RWG_SE, i32, i64)
 
 #define dh_alias_avr ptr
 #define dh_ctype_avr ppc_avr_t *
+#define dh_typecode_avr dh_typecode_ptr
 
 #define dh_alias_vsr ptr
 #define dh_ctype_vsr ppc_vsr_t *
+#define dh_typecode_vsr dh_typecode_ptr
 
 DEF_HELPER_3(vavgub, void, avr, avr, avr)
 DEF_HELPER_3(vavguh, void, avr, avr, avr)
@@ -708,6 +710,7 @@ DEF_HELPER_3(store_dbatu, void, env, i32, tl)
 
 #define dh_alias_fprp ptr
 #define dh_ctype_fprp ppc_fprp_t *
+#define dh_typecode_fprp dh_typecode_ptr
 
 DEF_HELPER_4(DADD, void, env, fprp, fprp, fprp)
 DEF_HELPER_4(DADDQ, void, env, fprp, fprp, fprp)
-- 
2.25.1


