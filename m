Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4F4445EC3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:37:05 +0100 (CET)
Received: from localhost ([::1]:60558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miq2K-0003yU-TD
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm0-0004VL-LJ
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:13 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:35753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplx-0004An-9K
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:12 -0400
Received: by mail-io1-xd2a.google.com with SMTP id c206so7788581iof.2
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rKLMBYjEYlw1VjEHepSl0BqgSbBEPtGPWDcDEzPgUqg=;
 b=fyq52+1H7qnvQoDjJrPOm/QQp1mut1XErFX58Q9qnLnEZ4VXfWuiqKVNvlgI+kptM1
 Cfy0Gj/Uo2OS2mn0M9/g/oWt7GFFRfYyS310V9BIjcsdaYIE/8BaCcdAhft1Vnvwl5Qj
 n1/z5eIgi2Du/KuWWtqtLKjz7jxUHPWTxaAnZPjYG6QQm9qfxh5RRnkYvj6kQVIMC3g+
 JysL0DQ2uyS0Cui2MrJ+S/MLWaCU45Lqa0CyEcRFZ2/PQcOCnAY1Frb7IXVoiNXlqyKZ
 xhpDYO+jwruo3+JfsGaRbX77BBD5jjp587R82D/mHpcMc7he5KmoRGnpQ+cVVOyNNsAV
 HmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rKLMBYjEYlw1VjEHepSl0BqgSbBEPtGPWDcDEzPgUqg=;
 b=moYNcPbBfcZidYxgRhsKOkdk7syE8QbWixXLB+3ZM1v96PSOQvBxy1nAvswPYXrxky
 1ACQnoAnjIGjzK2IwmhK5TtgLq9q3w2UWqdwjdjkOGzcPywezJ8+87H9UXWAY8n5xYrB
 cVc+Qr1pYqNN3R1xjSMsTGgz/L8mq41LqDwau6sxixNVV+2ZfFId4BeRUXEI7EzCe6wB
 Q0yeQ/I5HhZoXB9hCDw5bHXVPDLQDG4u5jhmp9FhGSXHX0UMIYcOCczIiwVeoCtQQ4uT
 P66cra/xf3k0ufL9ynOp4dGLbeMZwAmZXxZqDAdtoVxTA5AQrOOA8ON7XNeAxkMqe1Yq
 e9gQ==
X-Gm-Message-State: AOAM531DKDf/MigR72UgWDypd+Jm0R9iGqQZJwHMAA1+70VfoZfwjRsE
 yJY1hr+4RXLytcQa6LlpWD2YAPhiHCjq6w==
X-Google-Smtp-Source: ABdhPJzk+D4b1B7miKa6SSKPZqy971p97GfKWh5yptfPDoXHd0QDPOgyljctneo8X8+a1smh0f+b4w==
X-Received: by 2002:a05:6638:164a:: with SMTP id
 a10mr7011222jat.1.1636082407765; 
 Thu, 04 Nov 2021 20:20:07 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:07 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/36] bsd-user/arm/target_arch_reg.h: Implement core dump
 register copying
Date: Thu,  4 Nov 2021 21:19:02 -0600
Message-Id: <20211105031917.87837-22-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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
 Kyle Evans <kevans@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the register copying routines to extract registers from the
cpu for core dump generation.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_reg.h | 60 ++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_reg.h

diff --git a/bsd-user/arm/target_arch_reg.h b/bsd-user/arm/target_arch_reg.h
new file mode 100644
index 0000000000..ef5ed5154f
--- /dev/null
+++ b/bsd-user/arm/target_arch_reg.h
@@ -0,0 +1,60 @@
+/*
+ *  FreeBSD arm register structures
+ *
+ *  Copyright (c) 2015 Stacey Son
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
+#ifndef _TARGET_ARCH_REG_H_
+#define _TARGET_ARCH_REG_H_
+
+/* See sys/arm/include/reg.h */
+typedef struct target_reg {
+    uint32_t        r[13];
+    uint32_t        r_sp;
+    uint32_t        r_lr;
+    uint32_t        r_pc;
+    uint32_t        r_cpsr;
+} target_reg_t;
+
+typedef struct target_fp_reg {
+    uint32_t        fp_exponent;
+    uint32_t        fp_mantissa_hi;
+    u_int32_t       fp_mantissa_lo;
+} target_fp_reg_t;
+
+typedef struct target_fpreg {
+    uint32_t        fpr_fpsr;
+    target_fp_reg_t fpr[8];
+} target_fpreg_t;
+
+#define tswapreg(ptr)   tswapal(ptr)
+
+static inline void target_copy_regs(target_reg_t *regs, const CPUARMState *env)
+{
+    int i;
+
+    for (i = 0; i < 13; i++) {
+        regs->r[i] = tswapreg(env->regs[i + 1]);
+    }
+    regs->r_sp = tswapreg(env->regs[13]);
+    regs->r_lr = tswapreg(env->regs[14]);
+    regs->r_pc = tswapreg(env->regs[15]);
+    regs->r_cpsr = tswapreg(cpsr_read((CPUARMState *)env));
+}
+
+#undef tswapreg
+
+#endif /* !_TARGET_ARCH_REG_H_ */
-- 
2.33.0


