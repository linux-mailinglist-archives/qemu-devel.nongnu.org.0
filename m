Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B873BAE5F
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:43:43 +0200 (CEST)
Received: from localhost ([::1]:46170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m075i-0006Ks-VE
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070a-0002Gu-VB
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:25 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070Y-0006Wo-V9
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:24 -0400
Received: by mail-wr1-x436.google.com with SMTP id a13so19202993wrf.10
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+9xLc1Oma4AMzemvVhFf9OqI4oWYgcPTq7GE4ljA9t8=;
 b=r0wP+EPLw3PtFyq4PUJpuxWfV7HLj6PM8vVqpygx8Wk6WDNKclatAbBiymDGVbTlKJ
 /lvlKEwlkUBjP/EhYhd3n0IukafDPPgovNmkTv4qU7lbI/U9XVeKayYRMp4FGdou7v3e
 we3f/ueRy8bIs05+gpx93PUF0sqZzVVl9BwC9gcz2P/vYLkO4iVW7Z2cGUC7ineExlxG
 cQnijmOg4I+Cwo34h25ZtXphBvflxFid2JX5r3JY+r+YhzRJJykTMoYZXojDcRrt70sg
 QlH+PM+5cyE66Lu7OxCifijkHcedneykXFbLsLKwsSHTbAIEubzHOx3LpxISuqzYv/Ge
 bCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+9xLc1Oma4AMzemvVhFf9OqI4oWYgcPTq7GE4ljA9t8=;
 b=YSpzf+SwTfinFrPKEJen4zUlu34Vg3jhAxvGcsozD3PdZrqIL8+r8YD2b8egNQ1CWg
 Z1HIcRnv/oOR2QGKCFHCpkFIspcg44+btI8e/SL7Fa6zBWsVf8EbeSuDoaGPPJdQzv65
 FFL4phr5h5b06KFQDC0NQqypsQN+bVkQqhNa8oij8Hwug2Y8lj3xtqwrFdHlhUuy6MWw
 ptAQHIAc/PTD6ReCTCjb6DR4euGHBfcC0kZXajl3KsWG/VkJu1udDfdYQshheuCMLDHu
 kjFzymM4hEJxwAY4h6zE8WHT9WXCQrk04FI+o1yMBooOqEzG6COADUe16vOClSK8Ya6F
 iVzw==
X-Gm-Message-State: AOAM5323OpxwKZO+pdJgQy5C6bj6TUNhPt13bfSfiOkTcI16e9DuzUMt
 zDBPQSC1GzuEGFkZIArtsHyz/RqNfgE=
X-Google-Smtp-Source: ABdhPJyIbeuO+i+MHB1lYAl6Wrv8k1caqFFrslMnExa727Ta3MwsBs3g7HXf29cNk2piNqsJypqWCQ==
X-Received: by 2002:a5d:4906:: with SMTP id x6mr11587572wrq.387.1625423901378; 
 Sun, 04 Jul 2021 11:38:21 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y8sm10231126wrr.76.2021.07.04.11.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 11:38:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/12] linux-user: Extract target errno to
 'target_errno_defs.h'
Date: Sun,  4 Jul 2021 20:37:48 +0200
Message-Id: <20210704183755.655002-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210704183755.655002-1-f4bug@amsat.org>
References: <20210704183755.655002-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Helge Deller <deller@gmx.de>, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to access the target errno indepently of the rest
of the linux-user code. Extract it to a new target-specific
header: 'target_errno_defs.h'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/aarch64/target_errno_defs.h    | 6 ++++++
 linux-user/alpha/target_errno_defs.h      | 4 ++++
 linux-user/arm/target_errno_defs.h        | 6 ++++++
 linux-user/cris/target_errno_defs.h       | 6 ++++++
 linux-user/errno_defs.h                   | 3 +++
 linux-user/hexagon/target_errno_defs.h    | 6 ++++++
 linux-user/hppa/target_errno_defs.h       | 4 ++++
 linux-user/i386/target_errno_defs.h       | 6 ++++++
 linux-user/m68k/target_errno_defs.h       | 6 ++++++
 linux-user/microblaze/target_errno_defs.h | 6 ++++++
 linux-user/mips/target_errno_defs.h       | 4 ++++
 linux-user/mips64/target_errno_defs.h     | 4 ++++
 linux-user/nios2/target_errno_defs.h      | 6 ++++++
 linux-user/openrisc/target_errno_defs.h   | 6 ++++++
 linux-user/ppc/target_errno_defs.h        | 6 ++++++
 linux-user/riscv/target_errno_defs.h      | 6 ++++++
 linux-user/s390x/target_errno_defs.h      | 6 ++++++
 linux-user/sh4/target_errno_defs.h        | 6 ++++++
 linux-user/sparc/target_syscall.h         | 2 --
 linux-user/x86_64/target_errno_defs.h     | 6 ++++++
 linux-user/xtensa/target_errno_defs.h     | 6 ++++++
 21 files changed, 109 insertions(+), 2 deletions(-)
 create mode 100644 linux-user/aarch64/target_errno_defs.h
 create mode 100644 linux-user/alpha/target_errno_defs.h
 create mode 100644 linux-user/arm/target_errno_defs.h
 create mode 100644 linux-user/cris/target_errno_defs.h
 create mode 100644 linux-user/hexagon/target_errno_defs.h
 create mode 100644 linux-user/hppa/target_errno_defs.h
 create mode 100644 linux-user/i386/target_errno_defs.h
 create mode 100644 linux-user/m68k/target_errno_defs.h
 create mode 100644 linux-user/microblaze/target_errno_defs.h
 create mode 100644 linux-user/mips/target_errno_defs.h
 create mode 100644 linux-user/mips64/target_errno_defs.h
 create mode 100644 linux-user/nios2/target_errno_defs.h
 create mode 100644 linux-user/openrisc/target_errno_defs.h
 create mode 100644 linux-user/ppc/target_errno_defs.h
 create mode 100644 linux-user/riscv/target_errno_defs.h
 create mode 100644 linux-user/s390x/target_errno_defs.h
 create mode 100644 linux-user/sh4/target_errno_defs.h
 create mode 100644 linux-user/x86_64/target_errno_defs.h
 create mode 100644 linux-user/xtensa/target_errno_defs.h

diff --git a/linux-user/aarch64/target_errno_defs.h b/linux-user/aarch64/target_errno_defs.h
new file mode 100644
index 00000000000..a809381165a
--- /dev/null
+++ b/linux-user/aarch64/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef AARCH64_TARGET_ERRNO_H
+#define AARCH64_TARGET_ERRNO_H
+
+/* Target uses generic errno */
+
+#endif
diff --git a/linux-user/alpha/target_errno_defs.h b/linux-user/alpha/target_errno_defs.h
new file mode 100644
index 00000000000..13770b14b82
--- /dev/null
+++ b/linux-user/alpha/target_errno_defs.h
@@ -0,0 +1,4 @@
+#ifndef ALPHA_TARGET_ERRNO_H
+#define ALPHA_TARGET_ERRNO_H
+
+#endif
diff --git a/linux-user/arm/target_errno_defs.h b/linux-user/arm/target_errno_defs.h
new file mode 100644
index 00000000000..3d0dc8a6fb3
--- /dev/null
+++ b/linux-user/arm/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef ARM_TARGET_ERRNO_H
+#define ARM_TARGET_ERRNO_H
+
+/* Target uses generic errno */
+
+#endif
diff --git a/linux-user/cris/target_errno_defs.h b/linux-user/cris/target_errno_defs.h
new file mode 100644
index 00000000000..c6ea84f2366
--- /dev/null
+++ b/linux-user/cris/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef CRIS_TARGET_ERRNO_H
+#define CRIS_TARGET_ERRNO_H
+
+/* Target uses generic errno */
+
+#endif
diff --git a/linux-user/errno_defs.h b/linux-user/errno_defs.h
index aaf5208d62d..01cfb08b802 100644
--- a/linux-user/errno_defs.h
+++ b/linux-user/errno_defs.h
@@ -164,4 +164,7 @@
  */
 #define TARGET_QEMU_ESIGRETURN 513     /* Return from signal */
 
+/* Override with target specific definitions of errnos (keep last). */
+#include "target_errno_defs.h"
+
 #endif
diff --git a/linux-user/hexagon/target_errno_defs.h b/linux-user/hexagon/target_errno_defs.h
new file mode 100644
index 00000000000..5daac4f5a83
--- /dev/null
+++ b/linux-user/hexagon/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef HEXAGON_TARGET_ERRNO_H
+#define HEXAGON_TARGET_ERRNO_H
+
+/* Target uses generic errno */
+
+#endif
diff --git a/linux-user/hppa/target_errno_defs.h b/linux-user/hppa/target_errno_defs.h
new file mode 100644
index 00000000000..5ae6b8d0ba2
--- /dev/null
+++ b/linux-user/hppa/target_errno_defs.h
@@ -0,0 +1,4 @@
+#ifndef HPPA_TARGET_ERRNO_H
+#define HPPA_TARGET_ERRNO_H
+
+#endif
diff --git a/linux-user/i386/target_errno_defs.h b/linux-user/i386/target_errno_defs.h
new file mode 100644
index 00000000000..14f9fc44bec
--- /dev/null
+++ b/linux-user/i386/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef I386_TARGET_ERRNO_H
+#define I386_TARGET_ERRNO_H
+
+/* Target uses generic errno */
+
+#endif
diff --git a/linux-user/m68k/target_errno_defs.h b/linux-user/m68k/target_errno_defs.h
new file mode 100644
index 00000000000..00b98c619e5
--- /dev/null
+++ b/linux-user/m68k/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef M68K_TARGET_ERRNO_H
+#define M68K_TARGET_ERRNO_H
+
+/* Target uses generic errno */
+
+#endif
diff --git a/linux-user/microblaze/target_errno_defs.h b/linux-user/microblaze/target_errno_defs.h
new file mode 100644
index 00000000000..014f19ffbc5
--- /dev/null
+++ b/linux-user/microblaze/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef MICROBLAZE_TARGET_ERRNO_H
+#define MICROBLAZE_TARGET_ERRNO_H
+
+/* Target uses generic errno */
+
+#endif
diff --git a/linux-user/mips/target_errno_defs.h b/linux-user/mips/target_errno_defs.h
new file mode 100644
index 00000000000..05e0bea44bc
--- /dev/null
+++ b/linux-user/mips/target_errno_defs.h
@@ -0,0 +1,4 @@
+#ifndef MIPS_TARGET_ERRNO_H
+#define MIPS_TARGET_ERRNO_H
+
+#endif
diff --git a/linux-user/mips64/target_errno_defs.h b/linux-user/mips64/target_errno_defs.h
new file mode 100644
index 00000000000..0dd5966d1af
--- /dev/null
+++ b/linux-user/mips64/target_errno_defs.h
@@ -0,0 +1,4 @@
+#ifndef MIPS64_TARGET_ERRNO_H
+#define MIPS64_TARGET_ERRNO_H
+
+#endif
diff --git a/linux-user/nios2/target_errno_defs.h b/linux-user/nios2/target_errno_defs.h
new file mode 100644
index 00000000000..81f86566f26
--- /dev/null
+++ b/linux-user/nios2/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef NIOS2_TARGET_ERRNO_H
+#define NIOS2_TARGET_ERRNO_H
+
+/* Target uses generic errno */
+
+#endif
diff --git a/linux-user/openrisc/target_errno_defs.h b/linux-user/openrisc/target_errno_defs.h
new file mode 100644
index 00000000000..4dabdc1a43f
--- /dev/null
+++ b/linux-user/openrisc/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef OR1K_TARGET_ERRNO_H
+#define OR1K_TARGET_ERRNO_H
+
+/* Target uses generic errno */
+
+#endif
diff --git a/linux-user/ppc/target_errno_defs.h b/linux-user/ppc/target_errno_defs.h
new file mode 100644
index 00000000000..743e65cf4ef
--- /dev/null
+++ b/linux-user/ppc/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef PPC_TARGET_ERRNO_H
+#define PPC_TARGET_ERRNO_H
+
+/* Target uses generic errno */
+
+#endif
diff --git a/linux-user/riscv/target_errno_defs.h b/linux-user/riscv/target_errno_defs.h
new file mode 100644
index 00000000000..bf06966dc18
--- /dev/null
+++ b/linux-user/riscv/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef RISCV_TARGET_ERRNO_H
+#define RISCV_TARGET_ERRNO_H
+
+/* Target uses generic errno */
+
+#endif
diff --git a/linux-user/s390x/target_errno_defs.h b/linux-user/s390x/target_errno_defs.h
new file mode 100644
index 00000000000..1f0003166df
--- /dev/null
+++ b/linux-user/s390x/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef S390X_TARGET_ERRNO_H
+#define S390X_TARGET_ERRNO_H
+
+/* Target uses generic errno */
+
+#endif
diff --git a/linux-user/sh4/target_errno_defs.h b/linux-user/sh4/target_errno_defs.h
new file mode 100644
index 00000000000..ee5eb96af88
--- /dev/null
+++ b/linux-user/sh4/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef SH4_TARGET_ERRNO_H
+#define SH4_TARGET_ERRNO_H
+
+/* Target uses generic errno */
+
+#endif
diff --git a/linux-user/sparc/target_syscall.h b/linux-user/sparc/target_syscall.h
index dad501d008c..087b39d39c4 100644
--- a/linux-user/sparc/target_syscall.h
+++ b/linux-user/sparc/target_syscall.h
@@ -1,8 +1,6 @@
 #ifndef SPARC_TARGET_SYSCALL_H
 #define SPARC_TARGET_SYSCALL_H
 
-#include "target_errno_defs.h"
-
 #if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
 struct target_pt_regs {
     abi_ulong u_regs[16];
diff --git a/linux-user/x86_64/target_errno_defs.h b/linux-user/x86_64/target_errno_defs.h
new file mode 100644
index 00000000000..69cc6f988ba
--- /dev/null
+++ b/linux-user/x86_64/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef X86_64_TARGET_ERRNO_H
+#define X86_64_TARGET_ERRNO_H
+
+/* Target uses generic errno */
+
+#endif
diff --git a/linux-user/xtensa/target_errno_defs.h b/linux-user/xtensa/target_errno_defs.h
new file mode 100644
index 00000000000..4a5d19319d0
--- /dev/null
+++ b/linux-user/xtensa/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef XTENSA_TARGET_ERRNO_H
+#define XTENSA_TARGET_ERRNO_H
+
+/* FIXME */
+
+#endif
-- 
2.31.1


