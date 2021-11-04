Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E8F445535
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:21:11 +0100 (CET)
Received: from localhost ([::1]:37446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midc6-0001Zb-MF
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNq-0006oy-94
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:26 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:40944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNj-0000zs-KH
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:25 -0400
Received: by mail-il1-x12a.google.com with SMTP id k1so6262216ilo.7
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ztRBQYqWrUwRLf6NQ4W8izvboRcDbY0eKrhIvHHz3I=;
 b=f4/1VVtJdxJA6ObRpXO+osPgo4zji3vWjabJJiDGSf4vow5N0uZUAiWIyw/szw3CM5
 0N9uYPq7IcQ1UfgSyKwNiRqjaLeesxaCx7yxLUEeYeyvm5GWSv06BbuDA3LShGeLfKcZ
 V47rd2SJH3R+UH5cqfZZD+dvfynqMpsX0Gx5mA4VNf6Ng2ONv/8MEaSm4UhNJd5Zzllm
 a77QM/xyEo6f5aBciIWi0rSy4dmnX2wrf3v3/ufQExT/WfuxGF66A7ry6rA2+/XANOw+
 a+BZXijX8H8DVIqzXwv+vlCZl06rOOTetHenpi3eVg5lYAQESqY0CQq5QL0OyhdZWmVf
 m48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ztRBQYqWrUwRLf6NQ4W8izvboRcDbY0eKrhIvHHz3I=;
 b=wL4hOtKHXrtV30jxERHFuTY6Om8YJ+MaN17Q51hsQvNyYySU3jHAzruqRBOIKuFf3+
 gIhp1BJE1ZdV9b5VS0gAwQ2GJ8igRSnQkqKf7lbbVLCGSmmIHEkR9ca4vY172b8i/5p9
 molSLjK9DcZLGdbM1Yu3yyee6uSENlGhFQ8geWKcH+u1uomyjdlBIXst2WKoTDuTUMAq
 mMP3ndmzB7xeSj6gdOi5jwSL8EvPX0KAYrLBvIgd4M1qDuKtf2TFKrXemHplzmkDavkr
 fZeRbjSDY1qzHPElM/cPqc74Gl3IuiG2EE+R8yzO2cCsWkpJXxDctoPUEKxPWP3SPDLT
 AvNQ==
X-Gm-Message-State: AOAM531RINpjDkHygRAsJsAHweAS9TMa0t6FcmGRBnIR2/dOmisrWMl4
 vZBFTX7iWpVqLU+2DKRbpJCEIT60+pPoYA==
X-Google-Smtp-Source: ABdhPJzhJlGyw6qGMCYmRBhagt+wukl5nkYtsFooH+QpjdchGQtVv6zlczOBEkKzCwMrIyLpztUAXw==
X-Received: by 2002:a92:8742:: with SMTP id d2mr34167829ilm.128.1636034778237; 
 Thu, 04 Nov 2021 07:06:18 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:17 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/29] bsd-user/arm/target_arch_vmparam.h: Parameters for
 arm address space
Date: Thu,  4 Nov 2021 08:05:18 -0600
Message-Id: <20211104140536.42573-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various parameters describing the layout of the ARM address space. In
addition, define routines to get the stack pointer and to set the second
return value.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_vmparam.h | 48 ++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_vmparam.h

diff --git a/bsd-user/arm/target_arch_vmparam.h b/bsd-user/arm/target_arch_vmparam.h
new file mode 100644
index 0000000000..4bbc04ddf5
--- /dev/null
+++ b/bsd-user/arm/target_arch_vmparam.h
@@ -0,0 +1,48 @@
+/*
+ *  arm VM parameters definitions
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
+#ifndef _TARGET_ARCH_VMPARAM_H_
+#define _TARGET_ARCH_VMPARAM_H_
+
+#include "cpu.h"
+
+/* compare to sys/arm/include/vmparam.h */
+#define TARGET_MAXTSIZ      (64 * MiB)           /* max text size */
+#define TARGET_DFLDSIZ      (128 * MiB)          /* initial data size limit */
+#define TARGET_MAXDSIZ      (512 * MiB)          /* max data size */
+#define TARGET_DFLSSIZ      (4 * MiB)            /* initial stack size limit */
+#define TARGET_MAXSSIZ      (64 * MiB)           /* max stack size */
+#define TARGET_SGROWSIZ     (128 * KiB)          /* amount to grow stack */
+
+#define TARGET_RESERVED_VA  0xf7000000
+
+                /* KERNBASE - 512 MB */
+#define TARGET_VM_MAXUSER_ADDRESS   (0xc0000000 - (512 * MiB))
+#define TARGET_USRSTACK             TARGET_VM_MAXUSER_ADDRESS
+
+static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
+{
+    return state->regs[13]; /* sp */
+}
+
+static inline void set_second_rval(CPUARMState *state, abi_ulong retval2)
+{
+    state->regs[1] = retval2;
+}
+
+#endif  /* ! _TARGET_ARCH_VMPARAM_H_ */
-- 
2.33.0


