Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544D92D99B5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:22:10 +0100 (CET)
Received: from localhost ([::1]:39294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koojp-000748-CS
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSq-0002PT-H3
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:36 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSi-00042k-V5
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:36 -0500
Received: by mail-ot1-x342.google.com with SMTP id y24so15770402otk.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qmq9iNdZ5Znmtjd43X4+7pjV8Eyd2wTluaWBrB9Hxcc=;
 b=wrfKBOPk42nl7EGDvaTngLTkJGwLFS0ny14wmNVmozEwoHzsxVohowSf1P2oFaiw6x
 CD+vpQOZC2jv08GhFSPQzar3l/vWssIN4i8WNEPzEL6QZYewa/kRQ0tYlHJ1cQKYUhtE
 MOVujRv2LUNpIQbb8DXc8oCJya55IAVK/Ait09sVcGDPoB4i9nKs7icfacliBuAwFfwL
 lhhskTIMUbVaL0xcZ8WgUL+fKkZQrLbWD2TZW+CsFpY77Pm3IUgXPbSELSIQ8KYGhD6V
 DBo5VVbg28RuNu+3p55PKm3S99XyjqzSMbc3iM2fE5Yyp93m0z/4wkArN0X8j+F4vwCm
 Z5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qmq9iNdZ5Znmtjd43X4+7pjV8Eyd2wTluaWBrB9Hxcc=;
 b=CK0GiWvjHPT+uqx9gPeWgzNW/I89CU3FqGMWNx5iVkh+/xkOSihLZG6iyEOJC+Zsmo
 f0CrWBo5f/bAac07f8A7z1HSQTYnyTJPCICFr5lvRwXwSQV13w/MQDbK8oYx7M3gI7TX
 XqsAKAFPw0gfS+3wx8Sh/qtQCWXMKb0bXOAsAuM5mBePhyYKIWW0lCw4Yzi6DrldvoVn
 ultiD0/+98n0Z2ibheqZo9geiM74ydhI1eqw/s8NHncS7xGpByIBT2LAJviZplERsng5
 SQqLWj+BAgiczOot1bP7LMXpxHTK5yBgFWChLbXtz7JphEEl775fYtSqzoaZeok4fT1Q
 7+SQ==
X-Gm-Message-State: AOAM531QfM/b0JLiafCJ/kDlJCP6x/V5Fu8BWfg8eB1gfdqtQze++Og3
 GxXpTNJguXSSkgfATMrpOqIKun7Rs7ddedDN
X-Google-Smtp-Source: ABdhPJybbVaE1rhAmHgbBCg06x4Xp/4C4jXc2q7iprqT0dUSxMea2Ck7J/amh4UsR6+sJIwqvdtVpg==
X-Received: by 2002:a05:6830:2371:: with SMTP id
 r17mr20045312oth.236.1607954667070; 
 Mon, 14 Dec 2020 06:04:27 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 41/43] tcg: Remove TCG_TARGET_SUPPORT_MIRROR
Date: Mon, 14 Dec 2020 08:03:12 -0600
Message-Id: <20201214140314.18544-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all native tcg hosts support splitwx, remove the define.
Replace the one use with a test for CONFIG_TCG_INTERPRETER.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h  |  1 -
 tcg/arm/tcg-target.h      |  1 -
 tcg/i386/tcg-target.h     |  1 -
 tcg/mips/tcg-target.h     |  1 -
 tcg/ppc/tcg-target.h      |  1 -
 tcg/riscv/tcg-target.h    |  1 -
 tcg/s390/tcg-target.h     |  1 -
 tcg/sparc/tcg-target.h    |  1 -
 tcg/tci/tcg-target.h      |  1 -
 accel/tcg/translate-all.c | 16 +++++++++-------
 10 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 81778e3a9c..6ba248f447 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -154,6 +154,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 856d6dd4b0..6ca4537ca6 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -141,6 +141,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 2e57e95ac2..0dcaed7fe6 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -231,6 +231,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index c200ac02ea..d23baf7cda 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -200,7 +200,6 @@ extern bool use_mips32r2_instructions;
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
-#define TCG_TARGET_SUPPORT_MIRROR       1
 
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index b3361b8abc..c41d10142b 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -184,6 +184,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 60b6a1a3fc..3d0745c70c 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -170,6 +170,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
-#define TCG_TARGET_SUPPORT_MIRROR   1
 
 #endif
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index fc65f42650..3750952598 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -158,6 +158,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 54b9da9aeb..9c15c91d39 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -171,6 +171,5 @@ extern bool use_vis3_instructions;
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 768153fd02..fcec2e70db 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -197,7 +197,6 @@ void tci_disas(uint8_t opc);
 #define TCG_TARGET_DEFAULT_MO  (0)
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
-#define TCG_TARGET_SUPPORT_MIRROR       0
 
 static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
                                             uintptr_t jmp_rw, uintptr_t addr)
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b49aaf1026..21a20fed42 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1132,6 +1132,7 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
     return true;
 }
 
+#ifndef CONFIG_TCG_INTERPRETER
 #ifdef CONFIG_POSIX
 #include "qemu/memfd.h"
 
@@ -1254,17 +1255,18 @@ static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
     return true;
 }
 #endif /* CONFIG_DARWIN */
+#endif /* CONFIG_TCG_INTERPRETER */
 
 static bool alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
 {
-    if (TCG_TARGET_SUPPORT_MIRROR) {
-#ifdef CONFIG_DARWIN
-        return alloc_code_gen_buffer_splitwx_vmremap(size, errp);
+#ifndef CONFIG_TCG_INTERPRETER
+# ifdef CONFIG_DARWIN
+    return alloc_code_gen_buffer_splitwx_vmremap(size, errp);
+# endif
+# ifdef CONFIG_POSIX
+    return alloc_code_gen_buffer_splitwx_memfd(size, errp);
+# endif
 #endif
-#ifdef CONFIG_POSIX
-        return alloc_code_gen_buffer_splitwx_memfd(size, errp);
-#endif
-    }
     error_setg(errp, "jit split-wx not supported");
     return false;
 }
-- 
2.25.1


