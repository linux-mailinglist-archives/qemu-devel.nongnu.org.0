Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62E467FC01
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 01:48:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLvqI-0002Bc-6s; Sat, 28 Jan 2023 19:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vapier@gentoo.org>) id 1pLvqF-0002BG-8y
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 19:46:43 -0500
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4]
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <vapier@gentoo.org>) id 1pLvqC-000603-Qt
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 19:46:43 -0500
Received: by smtp.gentoo.org (Postfix, from userid 559)
 id 5CAA933BE54; Sun, 29 Jan 2023 00:46:29 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: move target_flat.h to target subdirs
Date: Sat, 28 Jan 2023 19:46:25 -0500
Message-Id: <20230129004625.11228-1-vapier@gentoo.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4;
 envelope-from=vapier@gentoo.org; helo=smtp.gentoo.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This makes target_flat.h behave like every other target_xxx.h header.
It also makes it actually work -- while the current header says adding
a header to the target subdir overrides the common one, it doesn't.
This is for two reasons:
* meson.build adds -Ilinux-user before -Ilinux-user/$arch
* the compiler search path for "target_flat.h" looks in the same dir
  as the source file before searching -I paths.

This can be seen with the xtensa port -- the subdir settings aren't
used which breaks stack setup.

Move it to the generic/ subdir and add include stubs like every
other target_xxx.h header is handled.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 linux-user/aarch64/target_flat.h       | 1 +
 linux-user/arm/target_flat.h           | 1 +
 linux-user/{ => generic}/target_flat.h | 0
 linux-user/m68k/target_flat.h          | 1 +
 linux-user/microblaze/target_flat.h    | 1 +
 linux-user/sh4/target_flat.h           | 1 +
 6 files changed, 5 insertions(+)
 create mode 100644 linux-user/aarch64/target_flat.h
 create mode 100644 linux-user/arm/target_flat.h
 rename linux-user/{ => generic}/target_flat.h (100%)
 create mode 100644 linux-user/m68k/target_flat.h
 create mode 100644 linux-user/microblaze/target_flat.h
 create mode 100644 linux-user/sh4/target_flat.h

diff --git a/linux-user/aarch64/target_flat.h b/linux-user/aarch64/target_flat.h
new file mode 100644
index 000000000000..bc83224cea12
--- /dev/null
+++ b/linux-user/aarch64/target_flat.h
@@ -0,0 +1 @@
+#include "../generic/target_flat.h"
diff --git a/linux-user/arm/target_flat.h b/linux-user/arm/target_flat.h
new file mode 100644
index 000000000000..bc83224cea12
--- /dev/null
+++ b/linux-user/arm/target_flat.h
@@ -0,0 +1 @@
+#include "../generic/target_flat.h"
diff --git a/linux-user/target_flat.h b/linux-user/generic/target_flat.h
similarity index 100%
rename from linux-user/target_flat.h
rename to linux-user/generic/target_flat.h
diff --git a/linux-user/m68k/target_flat.h b/linux-user/m68k/target_flat.h
new file mode 100644
index 000000000000..bc83224cea12
--- /dev/null
+++ b/linux-user/m68k/target_flat.h
@@ -0,0 +1 @@
+#include "../generic/target_flat.h"
diff --git a/linux-user/microblaze/target_flat.h b/linux-user/microblaze/target_flat.h
new file mode 100644
index 000000000000..bc83224cea12
--- /dev/null
+++ b/linux-user/microblaze/target_flat.h
@@ -0,0 +1 @@
+#include "../generic/target_flat.h"
diff --git a/linux-user/sh4/target_flat.h b/linux-user/sh4/target_flat.h
new file mode 100644
index 000000000000..bc83224cea12
--- /dev/null
+++ b/linux-user/sh4/target_flat.h
@@ -0,0 +1 @@
+#include "../generic/target_flat.h"
-- 
2.39.0


