Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651ED3FF824
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:57:33 +0200 (CEST)
Received: from localhost ([::1]:34532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwaK-0004TU-E6
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRL-00075F-7B
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:15 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:35625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRI-00037p-TX
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:14 -0400
Received: by mail-il1-x136.google.com with SMTP id h29so3579282ila.2
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Su9ozr1Od3G7lDBmllWnVlZNz8wmzbdSw3TgujzER3k=;
 b=B8PiCpFnYjJ6QwqsS5fqyycLsiMN7l3jAx6eMv16A2AQgNsGUXuCe1YTsAoESuhEBp
 MsQfUsLMqrT3xTHeJ+4WTTF+H1uL9QdQSS/fjq3/miUdpA/UZinXSsVs5YjFecm1r4yN
 jfKpqkHMKaquq3VSzzCpeqwDsjKe4qHpUfweJUiAiZpMZXMxiVn5rcz1TwCTPn/ggcwi
 aj7q7sa5pu4+bT+I3pTvciTQ69wQ9l6jZD1LtXGvyXulPseC8A3uR1jIYqp7KWiF0o3n
 7GrA0gZEqYkiyOMeRALFnOqhEeUkJt3K/CkJjA1e1YXsl5QDKdhbmpSbYAJZ+domyZvu
 Ez+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Su9ozr1Od3G7lDBmllWnVlZNz8wmzbdSw3TgujzER3k=;
 b=I0d2I63xuBRoOeWNXm/GLRnrBxJxiyfDCHjCHOcVXz6AAvwOUedAO2/D3yHjCbKSSY
 JlBnPz/ogZ246b8Z2lOouuKz0E1dMm68cQSUywzUzApDMyUhNvUmfXk08iknRQc6Bzlh
 vLwsaAGt8Ww8+C/GtE7RSsTFjlhxvWpCU4/RsUJ5ABQLgPRIGAHSgyYKU5m9ukFaj5zt
 K/nGfQ0iGETMfA4Q+L7ED+ZHAOyUM+QVYCKyObb9kfIYnGvDX3e603YuR3jFYV64nILf
 QYSCw25kjq9YNN5r76e3q7oi4/dUITqTXaI0jn5lPcn+e20yAQ/VaB8D75BQHS33offp
 ZdTg==
X-Gm-Message-State: AOAM531KJfVtCZU8368tJYqPjTLBOg/nDuukRMbDvu7iyqt3AM31r2sr
 GnaxbIb5tkp7mKwtoFRAq2IEX79s4T1atw==
X-Google-Smtp-Source: ABdhPJxEjdXZhJYGA9BaRRKR0xinhtNk/g2fFXGJFDy72kHOSdq13apOMFbQgz1s8ARYpltilYRl8A==
X-Received: by 2002:a05:6e02:6d2:: with SMTP id
 p18mr541806ils.44.1630626491329; 
 Thu, 02 Sep 2021 16:48:11 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:10 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/43] bsd-user: Add architecture specific signal tramp code
Date: Thu,  2 Sep 2021 17:47:15 -0600
Message-Id: <20210902234729.76141-30-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
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
index 0000000000..cb4e89b0b0
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
+    return 0;
+}
+#endif /* _TARGET_ARCH_SIGTRAMP_H_ */
diff --git a/bsd-user/x86_64/target_arch_sigtramp.h b/bsd-user/x86_64/target_arch_sigtramp.h
new file mode 100644
index 0000000000..29d4a8b55f
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
+    return 0;
+}
+#endif /* _TARGET_ARCH_SIGTRAMP_H_ */
-- 
2.32.0


