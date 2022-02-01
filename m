Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5633A4A5B53
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:39:32 +0100 (CET)
Received: from localhost ([::1]:40750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErVT-0005pt-ED
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:39:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7p-00051z-FF
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:05 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=33295
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7k-0003XX-8g
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:04 -0500
Received: by mail-io1-xd2c.google.com with SMTP id y84so20788426iof.0
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YZBADdyHloLLRfcWgOJjkztwEPB9T1oDoqbT7HXyib0=;
 b=mU1ejld1xxXUtkJeelptK0Cr2z2QDG7Wr3A4VfaChef1CumnChhZWEV06ztB2139ZV
 nx0+gmP8Wd1T4Pr6eBs/eQevYJT2Q/+fhnT8b9tGOcQANpr0qkLCLBF97ctAs9nz4ttn
 us22MFGSIPKcrFmBnxHao3Oz0QWUYR1fbA9XtigMZSrlaC884GNht03VDMVBUhQOr+8T
 OiqYNSKkAE0M5GqiRSfFxf8Ng/XQSq75jGKB69Ubtn3IG0KNnsVkLfGsCoM8+ZLjMN8f
 J3CD3YB2/X7pM6G0XyvndnGpCjd6qpd6H6WaY+c/sh383TpjKx6Ymv6SozBmY+UVLXGg
 boZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YZBADdyHloLLRfcWgOJjkztwEPB9T1oDoqbT7HXyib0=;
 b=mHBeyCIrv/TIVnLcGELHwqDNQfMpMWZZICkr4vuq5NTB8AoZE0H48/z3MlIvopUzPL
 /qxU+s0wDc0dUm3u3Ynk7DogqRu572PH9iXyjvW4aNefNpWhs+JiAH7MB0hBVTQLh11i
 cvsntdn8RBv9SMtvNIpEsbReMNDl0jfwSmMaYClrqQAeBN5VvWvXLVoUS84QaBaHpZVJ
 Yl6Qo3rN66zyJBLglimmIm9nZPMITF0QcvcnmwWg9L64NNCHRXubq4klkq6FSOctkSt7
 7MCiu16/H1L6w/4AvKbEAG6zGjV0hdE9NrO49Firgv3V/bijQNEqzrtnLOWCNWHocu/y
 5xpg==
X-Gm-Message-State: AOAM533g0s3cUT4FYQLhLyrHSKtlYkJXg82LzyaAQDx8dvaNrLWjmhOe
 70doJhPN8dudV8iVRueXYGV1qAeaAtYTcA==
X-Google-Smtp-Source: ABdhPJyrLD3PP6MNOZ8O2ucU+KBotyJRgAXa299Hpnw67j76XAYGKjyoLxVUZjVLgtmXn24ikDwQlA==
X-Received: by 2002:a05:6602:2d4b:: with SMTP id
 d11mr13024625iow.50.1643714097019; 
 Tue, 01 Feb 2022 03:14:57 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:14:56 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/22] bsd-user/freebsd/os-syscall.c: Move syscall processing
 here
Date: Tue,  1 Feb 2022 04:14:42 -0700
Message-Id: <20220201111455.52511-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
 Kyle Evans <kevans@freebsd.org>,
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
---
 bsd-user/freebsd/os-syscall.c | 68 +++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 bsd-user/freebsd/os-syscall.c

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
new file mode 100644
index 00000000000..7e2bedb918d
--- /dev/null
+++ b/bsd-user/freebsd/os-syscall.c
@@ -0,0 +1,68 @@
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
+ * calls, so we have to emulate that despite FreeBSD being EOL'd.
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


