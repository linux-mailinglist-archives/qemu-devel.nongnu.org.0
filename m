Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD3F44790C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:03:01 +0100 (CET)
Received: from localhost ([::1]:37692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvs4-000311-9E
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:03:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvht-0006Wk-Im
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:29 -0500
Received: from [2607:f8b0:4864:20::d36] (port=37853
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhr-0002ru-59
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:29 -0500
Received: by mail-io1-xd36.google.com with SMTP id k21so81244ioh.4
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5iIfFcYyYja/cPaQ9qdIgUErIUCnLNWxpKMyL/JDBtE=;
 b=NfHOezxAQZwlBSOYp7TJ/oP6B8i4eQo3lr7bpTG4WKbr33nsP+Gy4NKPo4poVrHD3V
 Dewd6RTtfPdgLtRqMr5/HS/zi8+Hkx/sZT4SGuTJg2A+gm4ooovXm5S7eRajkyMymcem
 lG+1RWxIjDs3V4kQmtzK2BYf7vueoZR9m2gNGo36mN8j4gQACnK4KJoZwu13uCTdkK9v
 nAFTI7J5Ie9g3cRjzVG4Eg/zRED041Q4zmjqR6zdGxnq66tPwhruziyNNq07Ah1jBBWi
 Zeia9MaWMBww3XKz9IqQtsSo7gKg8kH8ArCTWOP7YlSaBz4kCUfvzdZ6wWUoqCy/gJKt
 1H6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5iIfFcYyYja/cPaQ9qdIgUErIUCnLNWxpKMyL/JDBtE=;
 b=rYQLn5zNjeEVkoEz4eeuFky1j1bXS+g9kjlK+3ozadCkCG2Mo0LO3ZIL70001IcZ7d
 JmwTjduzbzoC/OPsGoiUH6v3M8DmqYxX/76/m3XRdqU/ZcUZEcJj45/XqHIJq7qXuYb7
 us5D3OPbBOB17FnpzCF5CRR92RDCkBEZQi1u1sTnoADt/IK41jTbPKJ7P2HWlmkTwqEU
 hFHrJOG1KT0CdMRtHEoTXG/kcqjD8JC5QHpPLHkyhDLP+COlVj9l/L5r7HAzj5q338ZB
 brC7sDuQMfSynd3scG+gWUADpTgRqgNTLGvwPl6u3cYe6gYgyXO7RjA9MMaKHX+eQYgd
 pdWw==
X-Gm-Message-State: AOAM531LUuWsK6E1vOo/YvrwJSOBKiLM9hccZ8w66tEonVtiGtmZGNGi
 r989Y3b0YONdZYq1qs1RPe4/DMj+1jKgdA==
X-Google-Smtp-Source: ABdhPJxfEchwduoayk4m5UPDHya/opL2QitujfBL0RA7Bguv24IG3p9wdBma/K7GH2JB3tBxXo/FzQ==
X-Received: by 2002:a02:84ec:: with SMTP id f99mr21768957jai.122.1636343545147; 
 Sun, 07 Nov 2021 19:52:25 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:24 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/37] bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
Date: Sun,  7 Nov 2021 20:51:15 -0700
Message-Id: <20211108035136.43687-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Olivier Houchard <cognet@ci0.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

target_arch_cpu.h is for CPU loop definitions. Create the file and
define target_cpu_init and target_cpu_reset for arm.

Signed-off-by: Olivier Houchard <cognet@ci0.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 43 ++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_cpu.h

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
new file mode 100644
index 0000000000..66215684d6
--- /dev/null
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -0,0 +1,43 @@
+/*
+ *  arm cpu init and loop
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
+#ifndef _TARGET_ARCH_CPU_H_
+#define _TARGET_ARCH_CPU_H_
+
+#include "target_arch.h"
+
+#define TARGET_DEFAULT_CPU_MODEL "any"
+
+static inline void target_cpu_init(CPUARMState *env,
+        struct target_pt_regs *regs)
+{
+    int i;
+
+    cpsr_write(env, regs->uregs[16], CPSR_USER | CPSR_EXEC,
+               CPSRWriteByInstr);
+    for (i = 0; i < 16; i++) {
+        env->regs[i] = regs->uregs[i];
+    }
+}
+
+static inline void target_cpu_reset(CPUArchState *cpu)
+{
+}
+
+#endif /* !_TARGET_ARCH_CPU_H */
-- 
2.33.0


