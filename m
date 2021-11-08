Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C10344793F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:17:24 +0100 (CET)
Received: from localhost ([::1]:51962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjw5z-0006f1-8r
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:17:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi1-0006mP-Fb
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:37 -0500
Received: from [2607:f8b0:4864:20::133] (port=46784
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhx-0002uU-Tk
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:36 -0500
Received: by mail-il1-x133.google.com with SMTP id i11so6317544ilv.13
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ztRBQYqWrUwRLf6NQ4W8izvboRcDbY0eKrhIvHHz3I=;
 b=wwVNPKwXNB345Y+KHd7cYKOgZiQs1sO2mU5Ex5N/UF3nbBZyYf6TKAcADAJVMeBEQ/
 KqD6UUBAW91rYSXH2QuD+isXhM0lJOwVp54xjsPVqK6zulvl/2ZwulNG/n4XcafLGIWt
 6KRt3Q8mPhEWhlztuRx9iYD14GViRmsg1ydlnS2tnOO/x40R/XMITwTl1v32FPboh7Vh
 4AZISkSek/VWeewYTr6mI/aBKlSy/SRqLAHnU7nnA16egI2Kd/TkHP7SiBdZmWbNKxx7
 94iLA/CflVUDPtJzuXfhsLIRxLbD42Ihg+bGxz64vqk7K/aX0cbJ1MjYu4zPR5vJ6ncz
 cQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ztRBQYqWrUwRLf6NQ4W8izvboRcDbY0eKrhIvHHz3I=;
 b=q7uBbGqpPVZ3noyrAcBvH/TpkTbFkeApKhAazPn9V4OOpjG291gIG20rKQxvA4S5gP
 f87+E44UpsP2mA9AvkwLnTY8Hs1HuilH53j70Qua/mBQzFIKh2L2iL3A279dK5UjBOjt
 oB1Qhr5RO9AtiRzr7D3xbVEe7o1wzatjJLDXnvowxsuHLA/CfD3WSNFY4M2Q46vk2Rqh
 Iks7GXpBnEX7evjPyzIXrv5i7x/b+GK5XLl2U68YYzdwzsLVMHOiDAbwizRjqjfuZSXX
 Eka04KEtlxahQnA2nG6HPi57oklDtfTGEbCd8LUe36xMmrnxOWh7IrJc4MJB9Aicsw5O
 qhIg==
X-Gm-Message-State: AOAM5317Hv7CotAEh7E0NbZIP1J90NcGKsTTd6x65g/TV1pUyCVq5CNg
 w1hbCedpg0RZ2PuIOOd6wa+cupcPw1jblA==
X-Google-Smtp-Source: ABdhPJy+84jQWRggiXik/h53Z8l3sNekwDhj4LkVYixLAW+4hF+LklY/6bAFXCeLdKjpiHlSbrHjIg==
X-Received: by 2002:a05:6e02:1a2d:: with SMTP id
 g13mr24650043ile.301.1636343551797; 
 Sun, 07 Nov 2021 19:52:31 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:31 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 23/37] bsd-user/arm/target_arch_vmparam.h: Parameters for
 arm address space
Date: Sun,  7 Nov 2021 20:51:22 -0700
Message-Id: <20211108035136.43687-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various parameters describing the layout of the ARM address space. In
addition, define routines to get the stack pointer and to set the second
return value.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_vmparam.h | 48 ++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_vmparam.h

diff --git a/bsd-user/arm/target_arch_vmparam.h b/bsd-user/arm/target_arch_vmparam.h
new file mode 100644
index 0000000000..4bbc04ddf5
--- /dev/null
+++ b/bsd-user/arm/target_arch_vmparam.h
@@ -0,0 +1,48 @@
+/*
+ *  arm VM parameters definitions
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
+#ifndef _TARGET_ARCH_VMPARAM_H_
+#define _TARGET_ARCH_VMPARAM_H_
+
+#include "cpu.h"
+
+/* compare to sys/arm/include/vmparam.h */
+#define TARGET_MAXTSIZ      (64 * MiB)           /* max text size */
+#define TARGET_DFLDSIZ      (128 * MiB)          /* initial data size limit */
+#define TARGET_MAXDSIZ      (512 * MiB)          /* max data size */
+#define TARGET_DFLSSIZ      (4 * MiB)            /* initial stack size limit */
+#define TARGET_MAXSSIZ      (64 * MiB)           /* max stack size */
+#define TARGET_SGROWSIZ     (128 * KiB)          /* amount to grow stack */
+
+#define TARGET_RESERVED_VA  0xf7000000
+
+                /* KERNBASE - 512 MB */
+#define TARGET_VM_MAXUSER_ADDRESS   (0xc0000000 - (512 * MiB))
+#define TARGET_USRSTACK             TARGET_VM_MAXUSER_ADDRESS
+
+static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
+{
+    return state->regs[13]; /* sp */
+}
+
+static inline void set_second_rval(CPUARMState *state, abi_ulong retval2)
+{
+    state->regs[1] = retval2;
+}
+
+#endif  /* ! _TARGET_ARCH_VMPARAM_H_ */
-- 
2.33.0


