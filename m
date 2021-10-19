Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF89433D27
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:14:38 +0200 (CEST)
Received: from localhost ([::1]:38016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcshB-0002Ki-08
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEm-0008Pn-1s
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:16 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:36594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEh-0000ER-1O
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:15 -0400
Received: by mail-io1-xd2c.google.com with SMTP id e144so21146458iof.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b40iFL2DSmEskWiJcrwrYMjZgS+Ai6esoPKmcvNusOQ=;
 b=PthhKvALBwNpz24mmRD5KlXAhOaXu8nkf2hH+Qyp7hBQDal3WijMjjIqcrBCYxQoa6
 0xWbyeUQQWYROZwgCq6DREG/PNpFn1hMutog6r+Th+gluw7pPiWxJkx5eUmIOsMhSPIp
 AZjlsRceD3CfEhefCk5SfNK2GhAdZz7VLfJpwzyO2DGRu8x9stFDllKBDNwz4xZ5+jDu
 9CpuZvSXr2IjAfFDM7xQGoS8DZPT9eWIByhUzv1xW+K9eF3W97/UG+Ihc+rK6FThc65m
 XzEeWH8MJggTL42zj1WsNYJ/C3GX6cjm8gdv2pKYUCe8ZTLVuieCmkaqWv8cTwuGq5Qk
 S5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b40iFL2DSmEskWiJcrwrYMjZgS+Ai6esoPKmcvNusOQ=;
 b=rusVY0yj6aFWBm23j3xJKLa4cFvMrS6GJ42HOnWaoPEPZSsOvJ+fRc8DaadtUjdzJJ
 4hFEG6CMFQawdQBLteD6GCyGlFaqooCyOAJYzonErC5X/z5nYt9KXERxmEpMCcMUyn9g
 Z8Kd/i+/snA2RxAdpPwb6e5eJlpR/teQcs4aEoWvzddgpnaBPZGA+DqI9Xj97+EKSOm9
 Zp3zxdO+J0S/CIPZtwiPWd3vzF50Y6HoO9xjtKKN3NJgCS9YdZBr4+pomhrmf1hTyFAP
 M6JhI790gbu1WgUMQ7SLJyzG0ZkU5989DBH2WL4J7jzlfR69w6hXGbvolfIY+DQ/1wBb
 F3RA==
X-Gm-Message-State: AOAM532ccPkeLpHVkvkahENjtr/Y+of5ukKPSg5t5qRVMX2WbQlz/Ov+
 ITkNLacT0WRzjFprRUZUcgKutT5FWWhxcg==
X-Google-Smtp-Source: ABdhPJyNtzvir8+ZQTICD1FaJi98dIyurI6FPBio9Bcb/V8trMvExcE9lbIHN9A7QeuRUPExIedHEA==
X-Received: by 2002:a02:9149:: with SMTP id b9mr5031271jag.46.1634661909543;
 Tue, 19 Oct 2021 09:45:09 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:08 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/24] bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
Date: Tue, 19 Oct 2021 10:44:27 -0600
Message-Id: <20211019164447.16359-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Kyle Evans <kevans@freebsd.org>, Olivier Houchard <cognet@ci0.org>,
 Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

target_arch_cpu.h is for CPU loop definitions. Create the file and
define target_cpu_init and target_cpu_reset for arm.

Signed-off-by: Olivier Houchard <cognet@ci0.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 42 ++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_cpu.h

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
new file mode 100644
index 0000000000..0f3538196d
--- /dev/null
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -0,0 +1,42 @@
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
+    cpsr_write(env, regs->uregs[16], 0xffffffff, CPSRWriteRaw);
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
2.32.0


