Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849C03E3748
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:57:40 +0200 (CEST)
Received: from localhost ([::1]:43646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUK3-0001Yz-IZ
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6E-0007mc-Sd
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:23 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:37533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6C-00052f-4g
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:22 -0400
Received: by mail-io1-xd43.google.com with SMTP id l20so17748824iom.4
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=titql1TQTfAX2LZLdfzyWbfniKgOICKkvHCEKJpDN8U=;
 b=lDiC7Y1IneLHtdiRrENofwWSjegcbm9KxjjjfMrAqAxhZ+Ih/zZIMDALNH2pjpYBav
 +ADuGwl0oY9mzdGTt+dHfKrK8IZFpX+GEX+t1bJlSGb6qkrB0Y0vwzpyT+xJ7M+hTnpV
 BRL1bokMUR9lAi7YSxvWoxH0W+OlPeFS4tpFGjXdGsjaW7sX2QtAg+R2I3OhcQeETMDL
 SbWJvORoJYWZ81KwYdmLVOBS13redajs2dRu4iXtQKeXzIZOjGv5MqLmIwpbO9FNZerp
 qUulluE7ntr8HRaJfPbOGoYI3H5WEPypB8dxXeHr+fjOwmvnBV3j+eQNuZbSqMtKMGt/
 o6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=titql1TQTfAX2LZLdfzyWbfniKgOICKkvHCEKJpDN8U=;
 b=O1ZLDDQ5V2ydXieoCtG0HCPloZQP9jlE4F3fb21oLmH0S97dPNg3mZlDal18gQITp1
 4pCIE/hQSJzdpNbZ9CZiCGmnuB87BFOMHYLVwu3C3gNAGeBKpCvx7R+mmqDKoGhyJX0N
 fO9eMZjmJvUl2YINI1j9TJRznHCu6lG4jtDpsngO9c48FuupMaMIg4n+g6kA2lhzqw4Y
 qiQCW6zSQpuIlqaMJqzYBAzmgCyYpMm+7JPyOgnakIJJufa7cxrXeflGYavEbZMJ5M4n
 0aL68zICcd2LCBvYaiQT9hk5NvTvVFN/ECtzmPrnwKgd32HjJOUOFvOMX6nC96+/DUvQ
 DbCg==
X-Gm-Message-State: AOAM531Dkt8IIVo0AVETYfc2yxuAUB0r4SXMt4YP1kvFxEZ/uoeH8dZp
 vloP4SjF2nTqJ1jjifNmQuOWaQ7soPHVET61
X-Google-Smtp-Source: ABdhPJy3dh6pbQjSVNfQSD4Ma95VHwr0LUxzFEePpIVEI+XUY0NicFpa1YqbaWV0O1zOaXKVNPZTtg==
X-Received: by 2002:a5e:961a:: with SMTP id a26mr201965ioq.90.1628372598857;
 Sat, 07 Aug 2021 14:43:18 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:18 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 27/49] bsd-user: Add architecture specific signal
 tramp code
Date: Sat,  7 Aug 2021 15:42:20 -0600
Message-Id: <20210807214242.82385-28-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d43;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd43.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Add a stubbed out version of setup_sigtramp. This is not yet used for
x86, but is used for other architectures. This will be connected in
future commits.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
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


