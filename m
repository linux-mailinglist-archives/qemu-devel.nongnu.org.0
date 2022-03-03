Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EE64CC5F7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:24:06 +0100 (CET)
Received: from localhost ([::1]:43202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPr3V-0002Wz-LW
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:24:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvp-0001vP-IC
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:09 -0500
Received: from [2607:f8b0:4864:20::532] (port=46935
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvk-0007Sl-1B
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:09 -0500
Received: by mail-pg1-x532.google.com with SMTP id o23so5436298pgk.13
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 11:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vyU1dEICQtRQByu98DNY2ApCIAVgpQWfK9xFqkqxnVc=;
 b=DJ2qjQDsHDTiNusM6Hd9T1+kX8SPHKggll0QdchYA/lEjY8SGKn6LhhnZqzJpwdUtD
 Ay5+dJbC6+IHa9jQCnXMMvU+rFz1AFFwunHIrJ9DhEnYpRxzU47Q7x5FXhf9EtKjSSrS
 1bpm4uTWJjq+ZLGH+1Uhvsey5CRrclCkHUVMdu3urVhvRnJY6lA76L4plRhKhDnhwp8C
 MEKK7B+9CjrWyifWpzveQkZA4HUTFk8+irgNzwovtUQphDqAKORxeuWrPEPgmy8pl3/4
 Pc8BjvgZGlOdEbrPhHQC6ox/AYeTM2FGpNw3QRzvgF2wnuAEIlMwjNDeXDK0g18/bkhF
 y4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vyU1dEICQtRQByu98DNY2ApCIAVgpQWfK9xFqkqxnVc=;
 b=3p7iHfZBfLCPlaOGHJGGKVbUhHr2b1TefZ3gb3kzSBW8gDd5SL525FqRvAMLgoPi7Z
 AdOstdJVJMItZArBXxD2tHhUhuZBFgDX7M32d0qNUpNZZfa0RXaAh2SbuiM2z7a/F9Oa
 GTfU5ZVkoz6o5gS6D0tdgdUiHbqIlKVzwzY8a9zQHPFQL2FKsCH4T1rGMikvT0C8EkU+
 1jGh0wkEw6upDPT+chsb9D21US7U+GD9oTFWOkqZNnYWFfjkH4lva8+Hs/aQHSP7EZzX
 JRNVPdPcmEZkD7b2rnyLSJxqyPWzmXHXVOywKgUC8w7r7LL8MeEhF2+v7oJ5KojeR4P/
 aLeA==
X-Gm-Message-State: AOAM5333+92Y9Zbkpfwjs9yFmi5462RCjOKRNmjkqnIGpTrh3gu8Cdb6
 6tqW2gpGgKkYUcUYDaMfzZ8EjKg2GStDkg==
X-Google-Smtp-Source: ABdhPJwxLT7/+MLgv4QMeGujjZh4JJ1y4cwpYwR8aDbr0ZFIMxoXbZv2qgklvl5kclcb/XIF4QTQGw==
X-Received: by 2002:a62:dd03:0:b0:4f1:1bfa:134c with SMTP id
 w3-20020a62dd03000000b004f11bfa134cmr39820338pff.14.1646334959957; 
 Thu, 03 Mar 2022 11:15:59 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm3318043pfh.46.2022.03.03.11.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:15:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/9] accel/tcg: Add guest_base_signed_addr32 for user-only
Date: Thu,  3 Mar 2022 09:15:46 -1000
Message-Id: <20220303191551.466631-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303191551.466631-1-richard.henderson@linaro.org>
References: <20220303191551.466631-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
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


