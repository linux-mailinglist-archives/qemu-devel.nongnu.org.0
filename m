Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9664C776E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:19:34 +0100 (CET)
Received: from localhost ([::1]:38662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkcP-0004cq-Tw
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:19:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUz-0008Nk-Pe
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:53 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=37839
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUy-0006aL-32
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:53 -0500
Received: by mail-io1-xd2a.google.com with SMTP id c23so15692005ioi.4
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=78KW/flWB6MtajWHw9g+3hzlOLi0kgwH7sG/RnsAKPw=;
 b=yG7mj5zIKkck7BRxmJv3pmplTLgMhna06l5l0jb62wNBtLp6GlUUcipDvSnnXicpnY
 K3CrNtE6VH8Fo6Zelj8vos2Y3UAw3/HH1lyksgyQkdIFB4RFO3WKirCN0Gc+aAvkrlLu
 v4MlIxuLLqKkMot2CisP2/Kws2hvkPsY4RGZN25txuevhmk55gfYmZ/ZuWd559jxFn1t
 HdUeJWT5yRn3wryFVJI1ds+qZHORVgoez1es3MEm90BtrOFvIsamXcyzu1u3bsYfNeGp
 +h3XXo2c2QI4MOByVw7VYnTNxKQoTe1s9EyfmEW9YUANWrpGXsq9H4vI0d0zGVTs8lj5
 tCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=78KW/flWB6MtajWHw9g+3hzlOLi0kgwH7sG/RnsAKPw=;
 b=Yw2+a1fzsdLKM7X/Uqj6TJUJIReO5KbA+jGkGXBujSqCadtolLsu3VOiC/rzv5nl65
 kHPGRcCufLw3LfBYLxtN3v/qIrHdhEFw+aXE9mALYGGF3q/3VM7ss6zBYNJ3a91IDSMQ
 9OZMKnqWhcuFb+AvphWqhpsp+9w0l6ig+E45pamgoVoBQ61a1x4o33bzGuRMpeEyzibk
 AXRWWAj1+efVoYqbLoJMDeO9rJDZhUzV3W0Vr2TebXqTPUuXXsMP0tQkxYa924uc5mvH
 DWIkR8bOwOfD5uG5remBI2ibxeMUK680TeyqDn2oH0wegnT8aCQxoo9JowynOobKDBlA
 tjpA==
X-Gm-Message-State: AOAM530FVu7nIebU6MU9E97Gkq4yZ7OfnZJbkSNYVs3KyA4EAQcVmXIg
 aBD7u/gPf3OwdzhXDNVGKMUDxeQPvWfCJQ==
X-Google-Smtp-Source: ABdhPJw41qwzJMjUQLN+yusnDHPPTMU+kRJoDXxFE19Hqwb797K1hDgXsFp8AlHGN7gVZEQoQREUsA==
X-Received: by 2002:a5d:9c4a:0:b0:641:346:5a91 with SMTP id
 10-20020a5d9c4a000000b0064103465a91mr16047083iof.217.1646071910742; 
 Mon, 28 Feb 2022 10:11:50 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:50 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/16] bsd-user/freebsd/os-syscall.c: Move syscall processing
 here
Date: Mon, 28 Feb 2022 11:12:07 -0700
Message-Id: <20220228181214.2602-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
References: <20220228181214.2602-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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


