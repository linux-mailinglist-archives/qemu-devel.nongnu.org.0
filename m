Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ECB443933
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 23:59:13 +0100 (CET)
Received: from localhost ([::1]:60980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2kK-0001pa-5K
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 18:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2em-0006Vt-Iq
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:28 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:40685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ei-0002lU-JH
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:28 -0400
Received: by mail-il1-x129.google.com with SMTP id k1so653907ilo.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3XmuKD3L8C0RdT+vaSED8BhWG5EV9OjA2AgZ0ahq8Uw=;
 b=iPyfiSuINy8vkik9L92tVHCkSvee55t7TKi6oopBbKAvlSxhzNzxZzOZf6zOAtZCAN
 P4iVjJ1UpES78CsTWu2G23WinAMULTeoTo1oJ0NH3E4CaNp/GhWswMr+9UyAes+u4hKK
 fEO47a0OxQWp6lGRVfsCdwwx4MTyKBnCCIqyPFukId6yRoOCIfOHvt4hQU85TjcnlwHh
 ZAQa4KMi5CEMk0pRGYLdwPGp5iks0mHNhOVEyLFjc3c6ZHD45EXUviufwNA4jM8xhkyh
 yJ9ThigJhgCSMr34RzwGzn0IBxAVqTirdgN6C8cewaAB30iZ3kPuMCTEGetmG3GENnV1
 EGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3XmuKD3L8C0RdT+vaSED8BhWG5EV9OjA2AgZ0ahq8Uw=;
 b=K/Upqn8ZURSC9kiHhMA7FvUsD8CjgEsCpCHc+/hd2lzZZYMmVEovRZwE3AeYBeA9fJ
 7JH6xz7lhbKnkgqsYkLepFy1CYxlhOq/l9kJ1cHAaPYx4OodRRqyekmuRWeW5uh6r6fO
 DUyCjPQNxFrDwdChIh4ClVe6Iz3GzsPLW/cQPWc/2GtUveKhp4CE5OjbpbK8GSJH2QeH
 lHvn0bwMRlYaFEHQt8uyIrtPCIRWcaDWY5ku7xW+E2nZUXuAa3SlG0u7HjzI4Yzk1vEB
 J1j72fkiiExLEyv8ZWGYKVTqJ7zDMqffNLeVCTFP1o5q/Q8gZkAmU/uxTdD8dXMNXzvh
 5l4A==
X-Gm-Message-State: AOAM532qVLlWBiwgwP+eRXvvWW3HH7NvuWIOTPLmIOg2PwZQqqpGw5jn
 uQMzDfhdyjSmRSziHOL++IsQOEECE1QVlw==
X-Google-Smtp-Source: ABdhPJwAPEE9Jzvh/AipZjx7FP/gErMzutJqaXbI63slYHqxZy7ICAz5EFwSuZPUM1FNaWBaX38ocg==
X-Received: by 2002:a05:6e02:1606:: with SMTP id
 t6mr2909987ilu.40.1635893603334; 
 Tue, 02 Nov 2021 15:53:23 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:23 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/30] bsd-user/arm/target_arch_cpu.c: Target specific TLS
 routines
Date: Tue,  2 Nov 2021 16:52:22 -0600
Message-Id: <20211102225248.52999-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Target specific TLS routines to get and set the TLS values.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch.h     | 28 ++++++++++++++++++++++++
 bsd-user/arm/target_arch_cpu.c | 39 ++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 bsd-user/arm/target_arch.h
 create mode 100644 bsd-user/arm/target_arch_cpu.c

diff --git a/bsd-user/arm/target_arch.h b/bsd-user/arm/target_arch.h
new file mode 100644
index 0000000000..93cfaea098
--- /dev/null
+++ b/bsd-user/arm/target_arch.h
@@ -0,0 +1,28 @@
+/*
+ * ARM 32-bit specific prototypes for bsd-user
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
+#ifndef _TARGET_ARCH_H_
+#define _TARGET_ARCH_H_
+
+#include "qemu.h"
+
+void target_cpu_set_tls(CPUARMState *env, target_ulong newtls);
+target_ulong target_cpu_get_tls(CPUARMState *env);
+
+#endif /* !_TARGET_ARCH_H_ */
diff --git a/bsd-user/arm/target_arch_cpu.c b/bsd-user/arm/target_arch_cpu.c
new file mode 100644
index 0000000000..02bf9149d5
--- /dev/null
+++ b/bsd-user/arm/target_arch_cpu.c
@@ -0,0 +1,39 @@
+/*
+ *  arm cpu related code
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
+#include "target_arch.h"
+
+void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)
+{
+    if (access_secure_reg(env)) {
+        env->cp15.tpidrurw_s = newtls;
+        env->cp15.tpidruro_s = newtls;
+        return;
+    }
+
+    env->cp15.tpidr_el[0] = newtls;
+    env->cp15.tpidrro_el[0] = newtls;
+}
+
+target_ulong target_cpu_get_tls(CPUARMState *env)
+{
+    if (access_secure_reg(env)) {
+        return env->cp15.tpidruro_s;
+    }
+    return env->cp15.tpidrro_el[0];
+}
-- 
2.33.0


