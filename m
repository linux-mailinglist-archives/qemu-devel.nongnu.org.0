Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E854C56FB
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:12:57 +0100 (CET)
Received: from localhost ([::1]:42426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0cp-0008OE-Vh
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:12:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XV-0008Im-LF
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:26 -0500
Received: from [2607:f8b0:4864:20::131] (port=44558
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XS-0000Qb-Nn
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:25 -0500
Received: by mail-il1-x131.google.com with SMTP id 9so6801309ily.11
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=78KW/flWB6MtajWHw9g+3hzlOLi0kgwH7sG/RnsAKPw=;
 b=nvvmhkL+fYNQFJP0M3MurJOQ2k9dj+zTNhlof4RdzijQ22PfSlFC7gxw9IrXrzfSRJ
 qvQlR4LPv2jI8qSxbbBO3qu3pE97SpdAWGRMnuHpGlNoQzArXTmJlgBfklx3i20u+dYD
 6lajxgagdfcGfA5cm4m8SnpyAElbprCBwvhBgsY09OJCPDs0+DNM8kF61LnuuGMnflsv
 5wvDhVnL8jo6ZdGBdVO6FGPFhmSrBcXuR75TfDC54zCRzaoYV36H47UmVj2+Ifkt4wXk
 UpYHRorQC97prON2xOuL1v22cpsn1q3Zo1B9reHuuM+J/Jn/y9OMM/6VyfJfYp4ha1vk
 QymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=78KW/flWB6MtajWHw9g+3hzlOLi0kgwH7sG/RnsAKPw=;
 b=KJpLgPWqdjJslHnpASb7k2rTa00kFvFq1FXldP1xgO0z5tT/NyF6paNtlRaJvyxv9p
 edWLJlEpAKLUTTVFlOLTUBg0ypAYF4SXWVWT+DoTIAkLkPulzty95MnwceFCvpH0tk05
 APeNWAF8mSJqiWfqb9jTEaFdGvsQsqGgfwTXs1jixq/1wkxlVfoCsnmGdSF4/SntZCPX
 IJfK4HX9pPl1IfAfk7YUwy/2v3wyM7dWNxycUsB+PUmTBya/fIyUYOR99CLOvyjN5G1K
 gMGFpTCSuO8L96sbNVgDcOjbUlfa8r6J/jlU1Cd2reUd0Vq7cqH4DLl+vikT55nm/M+j
 3BSA==
X-Gm-Message-State: AOAM532GktGFrlbpgxcQrTNAxZnPH7Any0B64coxaWEd21NFRfkdlf4u
 QUNAqsjsJ28PA6Nydr91RzXfrc0BxJgQVg==
X-Google-Smtp-Source: ABdhPJxB3nOx0Aly0C8s3go4rKikBqIQV7nj0NCOi+Q0fxNwhcuIkVeFJ+ZvopatBNzndNZ1ZG4xHg==
X-Received: by 2002:a05:6e02:b24:b0:2be:88f8:c4ed with SMTP id
 e4-20020a056e020b2400b002be88f8c4edmr11285234ilu.72.1645895241468; 
 Sat, 26 Feb 2022 09:07:21 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:21 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/16] bsd-user/freebsd/os-syscall.c: Move syscall
 processing here
Date: Sat, 26 Feb 2022 10:07:37 -0700
Message-Id: <20220226170744.76615-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220226170744.76615-1-imp@bsdimp.com>
References: <20220226170744.76615-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While there is some commonality between *BSD syscall processing, there's
a number of differences and the system call numbers and ABIs have been
independent since the late 90s. Move FreeBSD's proessing here and delete
it.

The upstream implementation is somewhat different than the current
implementation. It will be much easier to upstream these from scratch,
justifying the final result, rather than working out the diffs and
justifying the changes. Also tweak a comment to qemu standard form.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-syscall.c | 69 +++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 bsd-user/freebsd/os-syscall.c

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
new file mode 100644
index 00000000000..fc57e324173
--- /dev/null
+++ b/bsd-user/freebsd/os-syscall.c
@@ -0,0 +1,69 @@
+/*
+ *  BSD syscalls
+ *
+ *  Copyright (c) 2003-2008 Fabrice Bellard
+ *  Copyright (c) 2013-2014 Stacey D. Son
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
+/*
+ * We need the FreeBSD "legacy" definitions. Rust needs the FreeBSD 11 system
+ * calls since it doesn't use libc at all, so we have to emulate that despite
+ * FreeBSD 11 being EOL'd.
+ */
+#define _WANT_FREEBSD11_STAT
+#define _WANT_FREEBSD11_STATFS
+#define _WANT_FREEBSD11_DIRENT
+#define _WANT_KERNEL_ERRNO
+#define _WANT_SEMUN
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qemu/path.h"
+#include <sys/syscall.h>
+#include <sys/param.h>
+#include <sys/sysctl.h>
+#include <utime.h>
+
+#include "qemu.h"
+#include "qemu-common.h"
+#include "signal-common.h"
+#include "user/syscall-trace.h"
+
+void target_set_brk(abi_ulong new_brk)
+{
+}
+
+bool is_error(abi_long ret)
+{
+
+    return (abi_ulong)ret >= (abi_ulong)(-4096);
+}
+
+/*
+ * do_syscall() should always have a single exit point at the end so that
+ * actions, such as logging of syscall results, can be performed.  All errnos
+ * that do_syscall() returns must be -TARGET_<errcode>.
+ */
+abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
+                            abi_long arg2, abi_long arg3, abi_long arg4,
+                            abi_long arg5, abi_long arg6, abi_long arg7,
+                            abi_long arg8)
+{
+    return 0;
+}
+
+void syscall_init(void)
+{
+}
-- 
2.33.1


