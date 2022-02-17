Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779044B96E7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 04:48:43 +0100 (CET)
Received: from localhost ([::1]:41910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKXmc-00039I-1R
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 22:48:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKXlW-0002TU-HB
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 22:47:34 -0500
Received: from [2607:f8b0:4864:20::532] (port=39487
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKXlU-0004Ey-La
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 22:47:34 -0500
Received: by mail-pg1-x532.google.com with SMTP id 195so3875281pgc.6
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 19:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sE6epnFLRPawhptQFLC1349Kvww9N3xjC3vZESL/dbM=;
 b=ek6L7mMXAGOMWcInZg5e/PtXPAd0tVHWzZ6nUoFX8o/H6ifOFLau0PQJPVYfUSyEpQ
 OOEstT9qWq6iL3ym5+lGjsNWOyRDme3gTrBM1PcUX1AHrKiSMMA+w6kB7HTUJ7Rss2ex
 QV5endvbJS+VOhDKCMHLUPNUFo4goBlB7sKV5x5WAjdKqAvWrA96ChveW7cgOOX17EQb
 kLOlvQIO4oKvmF+RBhdh8gI0lJARmk87oD4xbLKxzbGYpGWq0QyHcjb3N4gdZLy1sJcX
 y60X381yT/NXn3WNtIenuqJuFqGWDE0PDs+PJWI0PujUolJDWeZYG7BhX7q7MQP82A3U
 w8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sE6epnFLRPawhptQFLC1349Kvww9N3xjC3vZESL/dbM=;
 b=wD2LUXqHcs1e+TTSGJe7LXeqO4RQCILPcZvAoZqhkwda/L3+1LbFcEtvi2nq0pcfk1
 0R+AIeCp4guZegef3o+Ri9SdWCbemtUZ7/ElAcoIajmkBXBJ7l3dRKDm/U+lBqb33GBD
 YcKoWncBj17ZusFVkv5nxFW7Vup1K/f8Vn3BAu+YlIaZ9zjDxnEEXRaWv7FnwR1n8HXf
 S6KKlk+cQasBTqgzm23yS6jqke5xzGkJjDQzx0CkXdeD2MZsGct0ye6R/6buKN393NwM
 1pXsgPGh4f2BOEdQ/EnXU6dvzW9X6jbI97dZ99rJ65wOUOqdNpgH22Qp1317ai6EWpt3
 ZIgQ==
X-Gm-Message-State: AOAM533mR6cwcPgcU0RfZrI9Qun3CRAL0v6HVqsiYzR0B7sy+EfEac6C
 KBMF0Z12UFQSHE4QA7/f2QsVHUvo5Z4CMBgE
X-Google-Smtp-Source: ABdhPJxaVXEHpqUBGEerV1VrZ45GCMjcRLO2AXhPn9eqqqvpZkRvACcQwG1RLNqJeq0Gfv1AV26mNQ==
X-Received: by 2002:a05:6a00:130e:b0:4cc:3c7d:4dec with SMTP id
 j14-20020a056a00130e00b004cc3c7d4decmr1279522pfu.32.1645069651098; 
 Wed, 16 Feb 2022 19:47:31 -0800 (PST)
Received: from localhost.localdomain (alanje.lnk.telstra.net.
 [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id p1sm11766813pfo.212.2022.02.16.19.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:47:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Remove dh_alias indirection for dh_typecode
Date: Thu, 17 Feb 2022 14:47:25 +1100
Message-Id: <20220217034725.272552-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Keith Packard <keithp@keithp.com>
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

	int
	main(void)
	{
		int quo = num / den;
		printf("num %d den %d quo %d\n", num, den, quo);
		exit(0);
	}

When run on the broken qemu, this results in:

	num -9 den -5 quo 0

The correct result is:

	num -9 den -5 quo 1

Reported-by: Keith Packard <keithp@keithp.com>
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


