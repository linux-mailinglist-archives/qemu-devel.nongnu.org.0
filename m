Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD973F8FD7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:19:55 +0200 (CEST)
Received: from localhost ([::1]:55730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMmm-0002Ye-9D
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMg7-0006Re-JG
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:52 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:40753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMg3-0006y1-4u
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:51 -0400
Received: by mail-io1-xd42.google.com with SMTP id z1so5569341ioh.7
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QSrEaj4gsFSv8iOYhJUEjVKwa9t3qbAbSlJcXb+xB0s=;
 b=TG5LfEJaGUPCG00Mu4QO4PDCbfGki4OpxQLlBKhQo32yrqpKbmbGJepyPsY5ivisEI
 Tu9SM4IY25b42E/pyreiD8W3E+kCZn8T2sDbTE+JYsBpZm+vt0PGHP41aMHuShtDAnxG
 7g5O6d/MSVEJsiBk23VN1v/WDGyZt9vYXNsfXfFw7O/inBxjgVRVneFChRPg2FWGVowq
 8JDjhaVsIx08E01VtvFvczOVg7i+GYRii7h/lMgLtY7jdqS4Ak24ramIcp0aLEPkXhfM
 ogagTkedaGlZp/+lwj/5h+BcISaFmTnJ5pu2j+3pipJleDquoLGVxSevoIQ8sGoiJ8pF
 AZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QSrEaj4gsFSv8iOYhJUEjVKwa9t3qbAbSlJcXb+xB0s=;
 b=DkAsvieip6OqheCEJsjENaN5VlqV6ecSYbYk0rKBqG/+yDpUKLaE3SmBbkRfIxn0sc
 BIfLn+RlshURM0jJhgKCGpjbTJ/ZZTnGO67JRrxXts/qtaPBa2cCefIakzMNodbmsu3U
 URcJOjop1OtpARe8NZ1/GusBAbB0p9E9foMnOj8BcX2O8kPJTLGvNAj1sZr6TZBWjr1w
 gKVidDGuzrZp2dqYMS1W03Ez6eKqUPrX8o61D6E96gmrVdXmRDSvFHA+MoI0teLCQvwb
 EJ9g10/a3nT2BD3vIxIazPdyWp1PCCaWS+NY99KYvO4efFbLvhkDI+9bfP0TBrF7HCbK
 8EUg==
X-Gm-Message-State: AOAM531wCxZbY/WoPKmZOmb6JRJKpeTT6K5wXf6e5Ia3cfoNy6HQ5rn6
 B6aLIyJE+SB/Mb9BmVrI/YodHk2mk5OpMOEX
X-Google-Smtp-Source: ABdhPJyD4RQkMsjIp5+b1Sgq0FtnSxtAp2D+r9tt1Surq1iL5bKG/0lwIJdmq4cI4/YnI5bJeyUz1A==
X-Received: by 2002:a05:6602:2436:: with SMTP id
 g22mr4688072iob.109.1630012365378; 
 Thu, 26 Aug 2021 14:12:45 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:44 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/43] bsd-user: Add architecture specific signal tramp code
Date: Thu, 26 Aug 2021 15:11:43 -0600
Message-Id: <20210826211201.98877-26-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d42;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd42.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Add a stubbed out version of setup_sigtramp. This is not yet used for
x86, but is used for other architectures. This will be connected in
future commits.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/i386/target_arch_sigtramp.h   | 29 ++++++++++++++++++++++++++
 bsd-user/x86_64/target_arch_sigtramp.h | 29 ++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 bsd-user/i386/target_arch_sigtramp.h
 create mode 100644 bsd-user/x86_64/target_arch_sigtramp.h

diff --git a/bsd-user/i386/target_arch_sigtramp.h b/bsd-user/i386/target_arch_sigtramp.h
new file mode 100644
index 0000000000..889bff7a54
--- /dev/null
+++ b/bsd-user/i386/target_arch_sigtramp.h
@@ -0,0 +1,29 @@
+/*
+ * Intel i386  sigcode for bsd-user
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
+static inline abi_long setup_sigtramp(abi_ulong offset, unsigned sigf_uc,
+        unsigned sys_sigreturn)
+{
+
+    return -TARGET_EOPNOTSUPP;
+}
+#endif /* _TARGET_ARCH_SIGTRAMP_H_ */
diff --git a/bsd-user/x86_64/target_arch_sigtramp.h b/bsd-user/x86_64/target_arch_sigtramp.h
new file mode 100644
index 0000000000..5629263a19
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_sigtramp.h
@@ -0,0 +1,29 @@
+/*
+ * Intel x86_64  sigcode for bsd-user
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
+static inline abi_long setup_sigtramp(abi_ulong offset, unsigned sigf_uc,
+        unsigned sys_sigreturn)
+{
+
+    return -TARGET_EOPNOTSUPP;
+}
+#endif /* _TARGET_ARCH_SIGTRAMP_H_ */
-- 
2.32.0


