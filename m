Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1374030BF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:13:37 +0200 (CEST)
Received: from localhost ([::1]:52102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjLU-00013C-CC
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2e-0005xT-4D
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:08 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:35577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2c-00012K-3d
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:07 -0400
Received: by mail-il1-x144.google.com with SMTP id h29so181734ila.2
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Su9ozr1Od3G7lDBmllWnVlZNz8wmzbdSw3TgujzER3k=;
 b=XrJZzTJAepr98j7NNF89NFG4bi4dFF4Ue4nOEdz0PyMFeqAZizrKp6JZ7imdMIY/Ue
 PZea5HCBxe3+EHIVE925/my29a1lXkKhMlojC9KMmT+TfV6dcUBDxR9iAoDJ7KhBtcqv
 j4p7c/ktEinDzmy9uhN5Ih0MupXBwNu0L4ceCBbFXZNyQOX9L30irySey9pDy8XhNVj9
 ndXK80ExxbmvqLV/jQd2/0i70sqXK/fHueACtcQcIxP/UgmT2i0zlJmLvSV36Yjgrmy8
 02sYu2sW/hEhvnSv8yoSOoF3gCWdWZD0vase5wJjhzm/MW8NQ4dYAOIzmX93cYaMpEjk
 pzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Su9ozr1Od3G7lDBmllWnVlZNz8wmzbdSw3TgujzER3k=;
 b=eApjOkBOOMHnDlwgHRqJ4MGCtct06Ig+D0UFMgEXp2fE+YfXAgoGvNhziofwGYEYeI
 E98pzK+1X4HooG8zLrVWsm3gbTfrnHFBP9ZLEUzAArHYzQVEceJKg7Dxe5HFYgP49JWC
 iU7Pxh7JQ0FEt9nmQghNkbo6j8e/xXsQ3lGOzhP0W3mihr0EHnC/ww0gPyfHSalWakvO
 HfRULYYzj7vB47VHr1hhH2Z4ITaKhixz8v8AaX60BjWthhus8khs7/cwFtypOI3ADZW+
 k1O8OB/4XV4O/0qcAzWR8nwbFj/lA48w/fXOpH4blQWa9aVso61b62XfyzqAwn97z7pI
 o1tg==
X-Gm-Message-State: AOAM533bYY1ZnpW1yu/5liWFdVUw9lnyjDU1J7TX6625kHuaydq5+IJp
 ivdHu7NGCQ2LpNM6YO+5NUx1c1Y1LiKafVrqYVw=
X-Google-Smtp-Source: ABdhPJytlCggziWNucLIxs/UCDMXaB4WPaJfTfwi34E5hIcq0NUpZwaGuRcC2M2R1vzzx7ArPW7xTQ==
X-Received: by 2002:a92:c70e:: with SMTP id a14mr246711ilp.299.1631051644356; 
 Tue, 07 Sep 2021 14:54:04 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:54:03 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 29/42] bsd-user: Add architecture specific signal tramp code
Date: Tue,  7 Sep 2021 15:53:19 -0600
Message-Id: <20210907215332.30737-30-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::144;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x144.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


