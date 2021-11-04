Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44719445497
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:12:42 +0100 (CET)
Received: from localhost ([::1]:39474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midTt-0000p2-ED
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNf-0006SK-5F
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:15 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:40860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNc-0000x4-7D
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:14 -0400
Received: by mail-io1-xd30.google.com with SMTP id d70so6053308iof.7
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5iIfFcYyYja/cPaQ9qdIgUErIUCnLNWxpKMyL/JDBtE=;
 b=0KsRHtTzaIzii+ZWZCTR76FtLAIodVpIQehBsjf+XCoFrxV8gS4feMgtlwgA3pgA73
 EDsRrTUUoIYPkgpndxEC5AzI5cW0pyy8lZ17jGDb6G4PXB5pxBKxL2JPTilRXn7C3ZxM
 bUjtAqSH5Dx71uP88vCbRTIBPOPRkLdXNPIxApHlN5uNB4QBwy3oUQhrKLNjXfX+deTw
 o9day25mWc5ayWVVNxpMcVM75jAkMat/niufTSRZXoi8gqtb32gjbdBKaI7HsVWCjqXO
 D/yznpHMmLR1Xm9nLTb3oTUpmP+llZyxm8DyyIzz8y4ZEDWfOWl19jAO5RyQPMWx+1rz
 iefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5iIfFcYyYja/cPaQ9qdIgUErIUCnLNWxpKMyL/JDBtE=;
 b=Y2LmDx33rS7CfxsIn41Se/pdXBZOyD/BlVJ+45oR4pT+gozKvielxkpSTm8oMfmd17
 gZbwqM0POMgwe4gKFuTAdK+uv2BuL4Unx6sjAm0rI8Co+Xn4nU7lIwOFgLXIm5hlqHYd
 orxLfZ+PBVdsfgYCvV5Me8tFG9SEJXV4lnUNIBNZlfGAzsPKRvlp15raNQCA14nUVw8c
 J7AgDUw7F8Zs8LwpoLxQTvWTR4ReiWaYzVc6ImvBUflJ2QG455ge+phMzqh9n+cUcDVi
 boGHMWYyz41jLtRztNg8fDG1HUqyQY4o1+Z5/zf7QQUojbpPV+hVe4RBlrrBGmTSFVQL
 2dYw==
X-Gm-Message-State: AOAM532LeaayrY+pm3AUzZL5xDowSRAEHYLLd7jxVoaPjZHFvFQB9ctu
 454wI+0VHRo37EO29HPVECVQlTacKzU4hw==
X-Google-Smtp-Source: ABdhPJxSKbvBgzegEUeDY9xUccML/AwLqA9XpWneoRMkjZRKVWEKKTMs/BoUip/7Tp0zqWi3FvY1gQ==
X-Received: by 2002:a6b:7a04:: with SMTP id h4mr7178334iom.154.1636034770847; 
 Thu, 04 Nov 2021 07:06:10 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:10 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/29] bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
Date: Thu,  4 Nov 2021 08:05:11 -0600
Message-Id: <20211104140536.42573-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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


