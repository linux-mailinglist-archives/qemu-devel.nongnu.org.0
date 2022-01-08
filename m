Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44BF488287
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:42:40 +0100 (CET)
Received: from localhost ([::1]:53320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66q5-0001xh-6p
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:12:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ie-0005Jx-HU
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:11 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=36580
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ia-0003OG-DA
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:02 -0500
Received: by mail-io1-xd2a.google.com with SMTP id p65so10131350iof.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gArjWzJ2yPQBZYD392wz0jyhocYmDAdMk+rJb0d1s7I=;
 b=LjC4ZTWgJnRR454lFakfKma0IZHlA7ZFYTa0sHMXYoJVOcJT5I1qOU5yRe3oYkDj7G
 a0DiaVZ7RMsU/Ee8THxEYbI8kb1RYa/c4YsEeDFFXbGCCakoiZqWEleOH1wgWPCe4lH8
 cGxxdhbl8tIIwCJmezXR6KhkoO8Cn4lzx1z6ARntnH/Td37X862IfnR39CLk0h4dlSwc
 psy7HMks98jgQA4fZbsAooqEF0ZcGIEEf+n79at3wDh7ssiSToW07R7hJvxz9iDzG1ja
 ShDWlj2vgdbJrvuEg8YNi/wL/7NApxlnpnsu0fJXeDwQHxTcpEmLdNns05V4P8QcOnXL
 +tIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gArjWzJ2yPQBZYD392wz0jyhocYmDAdMk+rJb0d1s7I=;
 b=jshfZpZG3lbaf+zj9NJVQKQvqwe18xnrO1vWUVQQBk5hNNM0MX+n4GhTjI8fETiBOG
 qQSDX3geMJNVnRzeCVKtCPlOuBChcqsQauMKdyFyzN1n6H+LRC9wOBM51LjBlSHhzrMv
 1wia37jc87nwzvXu/0NJca6YJkgeyEogReN7aVdGJxzFEqgNP2SGgPmnaFb97zR8f5s8
 iFaN7RFsdsd4gjcCN3dS+UoBVciXS80b/r6VdIgE71fpLB0aBX8z/aya7aMICpXIcUvF
 hksB6y1toZHN2ZbQHx42zOojBzke0fkY+CGnFKRQ2oB/KBIrFgduvoRM+hU7zoVB8uKN
 BdLA==
X-Gm-Message-State: AOAM531ogdocJ0oVHIfR9CaOVkhUDx8+cZ5TlPu2ibL4jg2AiWxoSkpF
 lgTZx5uDTyLOJDalmQ3e+PtArRnCg/zhZ4LV
X-Google-Smtp-Source: ABdhPJxTNLnXB1dH12MSXGZ1+E2Vr2ubDEWSPvMcoQYiBGVXWJUh3vOQu7pNxVLj5Wo+FyXEB/p/MQ==
X-Received: by 2002:a05:6638:d9:: with SMTP id
 w25mr31278007jao.123.1641627478702; 
 Fri, 07 Jan 2022 23:37:58 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:58 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/37] bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
Date: Sat,  8 Jan 2022 00:37:16 -0700
Message-Id: <20220108073737.5959-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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
index 00000000000..66215684d6f
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
2.33.1


