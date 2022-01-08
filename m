Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADDE48826C
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:39:06 +0100 (CET)
Received: from localhost ([::1]:55272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n67Ff-0001UT-R6
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:39:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Im-0005Lp-7T
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:13 -0500
Received: from [2607:f8b0:4864:20::d35] (port=37516
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ij-0003RR-9z
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:11 -0500
Received: by mail-io1-xd35.google.com with SMTP id 19so10095141ioz.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A4XfzEfM8rJrMxLuwMhjGZH/tq7SaJNrwBDs3j79yAc=;
 b=ljo6GIKrZlqnMMGfGsbpJMTtYHWVbGhtedo4qoW9KQ0J2yfwuI14VZoCDNbuaUqz6J
 U84GjlOfqVDbvdlMWGLD30OVxsC5NRNK0fEdAGKPhplq53At06z4T8bLorPl7MAWoE4J
 e6mBZIL/ntbC0HqgZ67qUc8FUFeIXKkdHtZ6YwE90i5S4o+iLKSOjKIJOl0YY5j20KMU
 vdSlGXF70zEYM0uJuW5jhJ7FI1+tBdWaB3T8yhTLdUVKm8GXjo0l5xpvIjQk4uLEH/cJ
 zRcqjk3Fp+dDOzugVIxPh2ktMC0hNlyTSgWhsvCxFSX3pDupu3Q9qsCqNq3izWl6hyoP
 9hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A4XfzEfM8rJrMxLuwMhjGZH/tq7SaJNrwBDs3j79yAc=;
 b=Z+jwgU9tOm0difHzhYigR4yMjLKdpV5QP24ExQWBkmDganzFm2UjGU8W+rYCPK3utv
 R/yxiVRj/1xkvCxROgieAaPIH/ngKiOoaMOYsslLlzDzGtx1OsSdZFgGnieinqWRfzxd
 kW8mpE24lcM25Gz5PDxHSARsS5Jnu/BIxaoYy90OmQxsTWz1p++p2uH1eMwUJJ6Qqk6K
 dvnkzukhUJnoV5pLAvsEGUxSqEcmMFhfH59hftqpVY0hGC2xS5BdY2cGLoPN9xc4bij7
 Y+FNwpTPwkJbmsGCxYyeX/PkF7EoSq0UFGAiWa+NztjNBB87WCzmrRq7xvUMUOjVXZVK
 1UDQ==
X-Gm-Message-State: AOAM530wipneu0I8GpK9mfih1ZF/MI0RPzxVyxUNoofDihoFhno4ou/C
 izDTCzfdSlk0Bi8NiPSONeFX1MgBaVqAntef
X-Google-Smtp-Source: ABdhPJx3gPBUj7hjKzX9R+yBS7KKQn4GTilsF7iS+vbSwGpBlugSshx/nG1/HHntjwIx3xWE5M2XpQ==
X-Received: by 2002:a6b:ec16:: with SMTP id c22mr31027500ioh.214.1641627486753; 
 Fri, 07 Jan 2022 23:38:06 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:06 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/37] bsd-user/arm/target_arch_sigtramp.h: Signal Trampoline
 for arm
Date: Sat,  8 Jan 2022 00:37:24 -0700
Message-Id: <20220108073737.5959-25-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy of the signal trampoline code for arm, as well as setup_sigtramp to
write it to the stack.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_sigtramp.h | 49 +++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_sigtramp.h

diff --git a/bsd-user/arm/target_arch_sigtramp.h b/bsd-user/arm/target_arch_sigtramp.h
new file mode 100644
index 00000000000..5d434a9e7e8
--- /dev/null
+++ b/bsd-user/arm/target_arch_sigtramp.h
@@ -0,0 +1,49 @@
+/*
+ *  arm sysarch() system call emulation
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _TARGET_ARCH_SIGTRAMP_H_
+#define _TARGET_ARCH_SIGTRAMP_H_
+
+/* Compare to arm/arm/locore.S ENTRY_NP(sigcode) */
+static inline abi_long setup_sigtramp(abi_ulong offset, unsigned sigf_uc,
+        unsigned sys_sigreturn)
+{
+    int i;
+    uint32_t sys_exit = TARGET_FREEBSD_NR_exit;
+    uint32_t sigtramp_code[] = {
+    /* 1 */ 0xE1A0000D,                  /* mov r0, sp */
+    /* 2 */ 0xE2800000 + sigf_uc,        /* add r0, r0, #SIGF_UC */
+    /* 3 */ 0xE59F700C,                  /* ldr r7, [pc, #12] */
+    /* 4 */ 0xEF000000 + sys_sigreturn,  /* swi (SYS_sigreturn) */
+    /* 5 */ 0xE59F7008,                  /* ldr r7, [pc, #8] */
+    /* 6 */ 0xEF000000 + sys_exit,       /* swi (SYS_exit)*/
+    /* 7 */ 0xEAFFFFFA,                  /* b . -16 */
+    /* 8 */ sys_sigreturn,
+    /* 9 */ sys_exit
+    };
+
+    G_STATIC_ASSERT(sizeof(sigtramp_code) == TARGET_SZSIGCODE);
+
+    for (i = 0; i < 9; i++) {
+        tswap32s(&sigtramp_code[i]);
+    }
+
+    return memcpy_to_target(offset, sigtramp_code, TARGET_SZSIGCODE);
+}
+#endif /* _TARGET_ARCH_SIGTRAMP_H_ */
-- 
2.33.1


