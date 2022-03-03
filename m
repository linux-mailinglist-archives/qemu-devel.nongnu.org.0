Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151554CC7F6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:24:42 +0100 (CET)
Received: from localhost ([::1]:45258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPswD-0007fu-42
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:24:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsZ5-0006FX-A4
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:49 -0500
Received: from [2607:f8b0:4864:20::52f] (port=43907
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYu-0004LX-T7
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:44 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 27so5726526pgk.10
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vyU1dEICQtRQByu98DNY2ApCIAVgpQWfK9xFqkqxnVc=;
 b=FfcZBQ3wuadATBuLRc2vhaqnxEfvv5Q3OnfSESrbe6KxevUIjeWohkWmuc6akYLT8M
 L7K5EH8Tp8FLARXDBkmE3mmZ07msAFT/sLW8q14jDKYP2oLwC8KRx9PpfH3Uo/it4FRV
 rV3Ap0A9G8xxdPX4EjEEBuVG1Idbs3qjdiO/FzoUjatZfKg6zrDkGPvam1tKhXMl4VvA
 VtlK56K4pDB8bGODbIrErRSHmyv7GMdNZxKjaRbrqdHVMT6jL4BzOTfGp9MILRHpjReh
 AdTmdZXFVyScNuS4W+6U6Rzd2Bskr0gVopUKp876H+w662Yl50R4ZO/bbZ+tthz2+u31
 hjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vyU1dEICQtRQByu98DNY2ApCIAVgpQWfK9xFqkqxnVc=;
 b=kxAiOJqdwHDzsuSrySMpBFTVdSvwr7dgj1TK2bE5lvwKNrpI9dKDDWLrpiCNS3KX5c
 gtukql65rddGp+VfuYfLwLUiLfkFFn0KX9qOAJ49TVIZofc6F3c+YGPz/qg4iqmoBGn3
 qxCmLnXm22R0XExqbNwziQ81OvCmu5YmwAtL8SFoOVO7SFAfl5jQIAjB7U+gu0tRbbuV
 V8vOAbpHv+EbF6fPiWUOzJytrHBbXTzs+fI9Y45C8k21AtkO3XJmFPCo9yxKJ2Tg4uTJ
 LfP2IxTSw3HlQOVGTPtzCRRIQKiodyt+FQiWF8cH80qSZMKvFui5sdXewUl2NbGqPVzS
 u/mA==
X-Gm-Message-State: AOAM532h4NG3ElxSXyn76jtHhPRfYNNLSh/PpcNX+JWgWa+SEcb3bk3B
 GEa/yVxBbS8yoetyEEibR6vKtPISjzXlCw==
X-Google-Smtp-Source: ABdhPJz+xgmcjMP3wWjSCNAdagQPZri51nL6a/DENbQhqzMWzEn2N5TgfLltv2fO/BEa/nyJ77Z7sA==
X-Received: by 2002:a63:1b09:0:b0:378:faa5:c63a with SMTP id
 b9-20020a631b09000000b00378faa5c63amr11168896pgb.276.1646341224882; 
 Thu, 03 Mar 2022 13:00:24 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/30] accel/tcg: Add guest_base_signed_addr32 for user-only
Date: Thu,  3 Mar 2022 10:59:39 -1000
Message-Id: <20220303205944.469445-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the host may prefer to treat 32-bit addresses as signed,
there are edge cases of guests that cannot be implemented with
addresses 0x7fff_ffff and 0x8000_0000 being non-consecutive.

Therefore, default to guest_base_signed_addr32 false, and allow
probe_guest_base to determine whether it is possible to set it
to true.  A tcg backend which sets TCG_TARGET_SIGNED_ADDR32 will
have to cope with either setting for user-only.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h  | 16 ++++++++++++++++
 include/exec/cpu_ldst.h |  3 ++-
 bsd-user/main.c         |  4 ++++
 linux-user/main.c       |  3 +++
 4 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 84caf5c3d9..26ecd3c886 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -146,6 +146,7 @@ static inline void tswap64s(uint64_t *s)
 
 #if defined(CONFIG_USER_ONLY)
 #include "exec/user/abitypes.h"
+#include "tcg-target-sa32.h"
 
 /* On some host systems the guest address space is reserved on the host.
  * This allows the guest address space to be offset to a convenient location.
@@ -154,6 +155,21 @@ extern uintptr_t guest_base;
 extern bool have_guest_base;
 extern unsigned long reserved_va;
 
+#if TCG_TARGET_SIGNED_ADDR32 && TARGET_LONG_BITS == 32
+extern bool guest_base_signed_addr32;
+#else
+#define guest_base_signed_addr32  false
+#endif
+
+static inline void set_guest_base_signed_addr32(void)
+{
+#ifdef guest_base_signed_addr32
+    qemu_build_not_reached();
+#else
+    guest_base_signed_addr32 = true;
+#endif
+}
+
 /*
  * Limit the guest addresses as best we can.
  *
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index da987fe8ad..add45499ee 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -87,7 +87,8 @@ static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
 static inline void *g2h_untagged(abi_ptr x)
 {
-    return (void *)((uintptr_t)(x) + guest_base);
+    uintptr_t hx = guest_base_signed_addr32 ? (int32_t)x : (uintptr_t)x;
+    return (void *)(guest_base + hx);
 }
 
 static inline void *g2h(CPUState *cs, abi_ptr x)
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 88d347d05e..c181e54495 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -54,6 +54,10 @@
 int singlestep;
 uintptr_t guest_base;
 bool have_guest_base;
+#ifndef guest_base_signed_addr32
+bool guest_base_signed_addr32;
+#endif
+
 /*
  * When running 32-on-64 we should make sure we can fit all of the possible
  * guest address space into a contiguous chunk of virtual host memory.
diff --git a/linux-user/main.c b/linux-user/main.c
index fbc9bcfd5f..5d963ddb64 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -72,6 +72,9 @@ static const char *seed_optarg;
 unsigned long mmap_min_addr;
 uintptr_t guest_base;
 bool have_guest_base;
+#ifndef guest_base_signed_addr32
+bool guest_base_signed_addr32;
+#endif
 
 /*
  * Used to implement backwards-compatibility for the `-strace`, and
-- 
2.25.1


