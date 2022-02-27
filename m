Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31BB4C58ED
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 03:07:59 +0100 (CET)
Received: from localhost ([::1]:42298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO8yc-0005OT-Pd
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 21:07:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8vA-0002SR-J0
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:24 -0500
Received: from [2607:f8b0:4864:20::1032] (port=40475
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8v9-0007SN-1F
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:24 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 em10-20020a17090b014a00b001bc3071f921so11708614pjb.5
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 18:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YMeVqoit7tAu+rAEKby5Z5DLjeBrKYE/OoQi3dZWbyk=;
 b=oLbuldUDIXNM/3BUYhGdnmzANKuY72GQzTjDnuFzXiBEFQVIEdLqv4tRlK++Rl/rO5
 Tm4NJPXSoxhpra0CjbEPgHT7+V5FWqKnlqTjGsJRUdYrx+CR7Lj1YEfTWquoVJpHKbaS
 8oV+fc9+4RcVLb9RSqIZZu82vNo9JerWSenZGNl0HJ9bBc7XPAY3ctuwvTfa0Y4dULyA
 PguRpzbEafUusVio07qxhhvU/NUlAO0yu+YqS3wUSZXjSGSQrMjRZ7nK+1aQtv8Km8k3
 Gm9IW8bjkfvPMZ7ARNmQumbqksaP9t5o4XCj4/brBknqMS5/dg2/wd/ChyUiwJhHN1L9
 UHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YMeVqoit7tAu+rAEKby5Z5DLjeBrKYE/OoQi3dZWbyk=;
 b=rJ5NS+rGOeSQFVlQqTiOaloCm1c7F2+6pNChhMQZBvHLykMlAwPrLuCaRtZO0NzaIY
 U38qHnH8xii/l7sVyNK12pvDjoE+KsC623p6bW8gUVoAvMECy5o/qkjhh+ddKzfnMpg1
 c7xp2HvrUDMVBXsq84SGT8hyl+u+SpSU5dlbKb4VCvsWIwOnO+5KrkvOCIAZcNIduXzO
 4sP2wBtjaI3AHPNzh24gzmdVGFqsMQUbesnJkhVF7xViquJXsPt7W7xH/i7MP+xySLcd
 HChDd2HnxK1HZ4hG5QPRqXDHWLUT0PjT7vAOcurTSVPbhgdviNcaEE2t3seK84LkFFT0
 Vphw==
X-Gm-Message-State: AOAM533OsrOcPJx6lgTRXDJhhNnbYqPaVWo0Kg9aNS1xxqA9j/zm5vPI
 DGLzeRZ8uL0K1V/RUPs907pc5fYf3k8VKu09
X-Google-Smtp-Source: ABdhPJxJPnqEssU+YRG8wsWYdw3M9diCY+RblT7QpG4/d0fK84uKG47elnQB/JGL6AdMyBRtdTA1SQ==
X-Received: by 2002:a17:90b:d91:b0:1bc:ade1:54e3 with SMTP id
 bg17-20020a17090b0d9100b001bcade154e3mr10220393pjb.8.1645927461415; 
 Sat, 26 Feb 2022 18:04:21 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm8304021pfj.43.2022.02.26.18.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 18:04:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] accel/tcg: Add guest_base_signed_addr32 for user-only
Date: Sat, 26 Feb 2022 16:04:08 -1000
Message-Id: <20220227020413.11741-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227020413.11741-1-richard.henderson@linaro.org>
References: <20220227020413.11741-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the host may prefer to treat 32-bit addresses as signed,
there are edge cases of guests that cannot be implemented with
addresses 0x7fff_ffff and 0x8000_0000 being non-consecutive.

Therefore, default to guest_base_signed_addr32 false, and allow
probe_guest_base to determine whether it is possible to set it
to true.  A tcg backend which sets TCG_TARGET_SIGNED_ADDR32 will
have to cope with either setting for user-only.

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
index f1d58e905e..cca4b9a502 100644
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


