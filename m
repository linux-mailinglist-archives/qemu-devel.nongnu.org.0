Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E00F445ED3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:44:58 +0100 (CET)
Received: from localhost ([::1]:54322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miq9w-0002Ns-VR
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplt-0004P7-Fb
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:05 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:33682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplr-000485-EB
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:05 -0400
Received: by mail-il1-x12f.google.com with SMTP id l19so8323111ilk.0
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5iIfFcYyYja/cPaQ9qdIgUErIUCnLNWxpKMyL/JDBtE=;
 b=7sgS0wNaMypH+B2pRnp6JxirU8GrwCtcz4vg586usnsBFJtF92pr458j8ima9M1zDc
 41DqgpIa90Rj4mSgpWuzolUXTUFDEKVQfB6dRnOBHPhdPXxOXK0dFy4M4LQBPS4V+xYa
 czXXOtYFXhkl8FawyWHnr8wo4/nwG3caztBTzTAJIzAYb/jMdRbe+u7i6ldsq230fpyP
 JAGwmlhn6gi+eWLiJIg1b0eFd1eKrWMklc1LstAqiyM9Rak3QHWKaddj2mTmM0QD9PbA
 DE2Esq+5WLv+oGhUIAWGDtGNMu7MXWx8gPkH+yZaA0vlut1ZOxzFCExUgNXfejlc7TIz
 hC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5iIfFcYyYja/cPaQ9qdIgUErIUCnLNWxpKMyL/JDBtE=;
 b=oEO7QkoQeVhP8qZWSsdCJ5GpD1gp1s64Xw5ceJfr+PGtCuchRR21bTzZqI8+0hVM1K
 afSkvpfxqi/okMNtpGSgUqVhps//XLa8yhdI5gJ/wC4X3ywxHlrr8V/sydcpuRacu9XT
 bhQgXPeI3jYWhVNEFV88MB75XoxbzPyA3GML/mmmeMLjJN8ZYk8c33iHzNYVhbvbnO/H
 bczE+MJy89qF8/hFPHLlKZm2o63BHMh8WsrKv6RhTU2X+S6hnN6fZT4ntWGc2LGuaIpW
 rogKHsdTdiBFMpkjAM32fb0s6urXHhcLXQVpavhbbzHN7uLmjQJpTWWUzr+VsfN1ST/h
 mSsQ==
X-Gm-Message-State: AOAM5305+Ip1YuVBVxYw5XaH/tb36VGbKoWxXJvKE+bFEoNcA7rDsCBg
 kGFs+PTCBdHXgYY1zHiWABrDLJDLm6VygA==
X-Google-Smtp-Source: ABdhPJypkh9s3TyDfIXDGWEkSL7tEswAYjkD1GWu7/Rr52YEWzPQUkLVfFX2ESdqVvDLNMZE96iTMA==
X-Received: by 2002:a92:cda2:: with SMTP id g2mr28387347ild.46.1636082401440; 
 Thu, 04 Nov 2021 20:20:01 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:01 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/36] bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
Date: Thu,  4 Nov 2021 21:18:56 -0600
Message-Id: <20211105031917.87837-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@FreeBSD.org>, Olivier Houchard <cognet@ci0.org>,
 Warner Losh <imp@bsdimp.com>
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


