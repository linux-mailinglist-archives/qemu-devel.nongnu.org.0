Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF973C14EA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:14:06 +0200 (CEST)
Received: from localhost ([::1]:50740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Umz-0003Hf-QR
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1Ukf-0000Uv-Rm
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:11:41 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1Ukd-0002Z2-PP
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:11:41 -0400
Received: by mail-wr1-x434.google.com with SMTP id d12so7110154wre.13
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 07:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m0KKAQoYWNHOBcKt/hv37+OKJEMrpQuNjecZJW20aAA=;
 b=GJ0LxR9zzh+0Nv/Dy7gjy5rgYX69B+J7Y2ErYP2uiUD7cBQhCh0Abx+An6TYUIJob/
 V2AS5YZYbrJvK+zopYqNy8nCxKGLrIO43L4v5geeRs6y+t/VRZMn/YSeG8w4ZlbGNcpP
 2DVh0J+p3c4MbjzcdWhykQiLK9EiCWGELlWcz/OcVeHSzR3A/DuldCLirMalmvyk+RTP
 JKzHfOYGgRrpPL1YuFwhS1+VWUhjgqwpfK9vuFIPux3HJ5w+McBQplLGCw+Yn4ElmDEg
 JAhjIkhVIYO+mi22TfPT3ep78Ys/WEyMOLPQ1YPw6WljlXR20ZXVNEub56n+gsnV0cT3
 cc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=m0KKAQoYWNHOBcKt/hv37+OKJEMrpQuNjecZJW20aAA=;
 b=XcdMmCJX2bxCRYk5msU+vO0+AXbvmboweXjGOyC8066AxV1BmJArJsB3ki44LCj24b
 vUFpwyvKMsGs8yiKeE5YWCy2L4JFCZCbp1OH4r4BeZsGKWszwdPUHlTWLO3cnAccyWMP
 UzLI3SKwowdvHHo4QiF0RaXkdsBZTLX0u1dpEIgngKILgwWRG31asICGnNAwYQTxlJa7
 UkLqFutG/gIvEeKXY7ME1cjErXVOlQmH0HuW06CdNSBBYYUvTzstrz95zrRUXLretcl7
 cqIyTvEo9ACvGoJvbpBlGZ8EqeNqRP0SkF/VlPH/L1Z5PkfnEH0mHDe8TLgCWil4ySqL
 Q1Fw==
X-Gm-Message-State: AOAM533lWmTkh4qYsokzoYWBDkJU960o80GdK4EdqJ27duYHTPefv0h6
 JgzZzN0TMiV6JW85lvJ/qSsDGxMkfIY=
X-Google-Smtp-Source: ABdhPJwVXlQNpP6dEhQwfAIs0RAjmSnyitlJqJ6L+CJY7KvyZvcygI7AKZ88u5JZIa+9hC2YlFkjsw==
X-Received: by 2002:adf:f382:: with SMTP id m2mr8006964wro.335.1625753496849; 
 Thu, 08 Jul 2021 07:11:36 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k5sm2298037wmk.11.2021.07.08.07.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 07:11:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] linux-user: Extract target errno to
 'target_errno_defs.h'
Date: Thu,  8 Jul 2021 16:11:16 +0200
Message-Id: <20210708141121.1731691-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708141121.1731691-1-f4bug@amsat.org>
References: <20210708141121.1731691-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to access the target errno indepently of the rest of the
linux-user code. Move the header containing the generic errno
definitions ('errno_defs.h') to 'generic/target_errno_defs.h',
create a new 'target_errno_defs.h' in each target which itself
includes 'generic/target_errno_defs.h'.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/aarch64/target_errno_defs.h                   | 6 ++++++
 linux-user/alpha/target_errno_defs.h                     | 6 ++++++
 linux-user/arm/target_errno_defs.h                       | 6 ++++++
 linux-user/cris/target_errno_defs.h                      | 6 ++++++
 linux-user/{errno_defs.h => generic/target_errno_defs.h} | 4 ++--
 linux-user/hexagon/target_errno_defs.h                   | 6 ++++++
 linux-user/hppa/target_errno_defs.h                      | 6 ++++++
 linux-user/i386/target_errno_defs.h                      | 6 ++++++
 linux-user/m68k/target_errno_defs.h                      | 6 ++++++
 linux-user/microblaze/target_errno_defs.h                | 6 ++++++
 linux-user/mips/target_errno_defs.h                      | 6 ++++++
 linux-user/mips64/target_errno_defs.h                    | 6 ++++++
 linux-user/nios2/target_errno_defs.h                     | 6 ++++++
 linux-user/openrisc/target_errno_defs.h                  | 6 ++++++
 linux-user/ppc/target_errno_defs.h                       | 6 ++++++
 linux-user/riscv/target_errno_defs.h                     | 6 ++++++
 linux-user/s390x/target_errno_defs.h                     | 6 ++++++
 linux-user/sh4/target_errno_defs.h                       | 6 ++++++
 linux-user/sparc/target_errno_defs.h                     | 2 ++
 linux-user/sparc/target_syscall.h                        | 2 --
 linux-user/syscall_defs.h                                | 2 +-
 linux-user/x86_64/target_errno_defs.h                    | 6 ++++++
 linux-user/xtensa/target_errno_defs.h                    | 6 ++++++
 linux-user/safe-syscall.S                                | 2 +-
 24 files changed, 120 insertions(+), 6 deletions(-)
 create mode 100644 linux-user/aarch64/target_errno_defs.h
 create mode 100644 linux-user/alpha/target_errno_defs.h
 create mode 100644 linux-user/arm/target_errno_defs.h
 create mode 100644 linux-user/cris/target_errno_defs.h
 rename linux-user/{errno_defs.h => generic/target_errno_defs.h} (99%)
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
index 00000000000..eee9762ba32
--- /dev/null
+++ b/linux-user/aarch64/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef AARCH64_TARGET_ERRNO_DEFS_H
+#define AARCH64_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/alpha/target_errno_defs.h b/linux-user/alpha/target_errno_defs.h
new file mode 100644
index 00000000000..54770108c02
--- /dev/null
+++ b/linux-user/alpha/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef ALPHA_TARGET_ERRNO_DEFS_H
+#define ALPHA_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/arm/target_errno_defs.h b/linux-user/arm/target_errno_defs.h
new file mode 100644
index 00000000000..448cc407662
--- /dev/null
+++ b/linux-user/arm/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef ARM_TARGET_ERRNO_DEFS_H
+#define ARM_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/cris/target_errno_defs.h b/linux-user/cris/target_errno_defs.h
new file mode 100644
index 00000000000..02c040982df
--- /dev/null
+++ b/linux-user/cris/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef CRIS_TARGET_ERRNO_DEFS_H
+#define CRIS_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/errno_defs.h b/linux-user/generic/target_errno_defs.h
similarity index 99%
rename from linux-user/errno_defs.h
rename to linux-user/generic/target_errno_defs.h
index aaf5208d62d..17d85e0b61b 100644
--- a/linux-user/errno_defs.h
+++ b/linux-user/generic/target_errno_defs.h
@@ -5,8 +5,8 @@
  * Taken from asm-generic/errno-base.h and asm-generic/errno.h
  */
 
-#ifndef LINUX_USER_ERRNO_DEFS_H
-#define LINUX_USER_ERRNO_DEFS_H
+#ifndef GENERIC_TARGET_ERRNO_DEFS_H
+#define GENERIC_TARGET_ERRNO_DEFS_H
 
 #define TARGET_EPERM            1      /* Operation not permitted */
 #define TARGET_ENOENT           2      /* No such file or directory */
diff --git a/linux-user/hexagon/target_errno_defs.h b/linux-user/hexagon/target_errno_defs.h
new file mode 100644
index 00000000000..0644ae802b4
--- /dev/null
+++ b/linux-user/hexagon/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef HEXAGON_TARGET_ERRNO_DEFS_H
+#define HEXAGON_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/hppa/target_errno_defs.h b/linux-user/hppa/target_errno_defs.h
new file mode 100644
index 00000000000..d6e9676ce25
--- /dev/null
+++ b/linux-user/hppa/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef HPPA_TARGET_ERRNO_DEFS_H
+#define HPPA_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/i386/target_errno_defs.h b/linux-user/i386/target_errno_defs.h
new file mode 100644
index 00000000000..d34466d583f
--- /dev/null
+++ b/linux-user/i386/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef I386_TARGET_ERRNO_DEFS_H
+#define I386_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/m68k/target_errno_defs.h b/linux-user/m68k/target_errno_defs.h
new file mode 100644
index 00000000000..91c51b79cdc
--- /dev/null
+++ b/linux-user/m68k/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef M68K_TARGET_ERRNO_DEFS_H
+#define M68K_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/microblaze/target_errno_defs.h b/linux-user/microblaze/target_errno_defs.h
new file mode 100644
index 00000000000..7be53eb2365
--- /dev/null
+++ b/linux-user/microblaze/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef MICROBLAZE_TARGET_ERRNO_DEFS_H
+#define MICROBLAZE_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/mips/target_errno_defs.h b/linux-user/mips/target_errno_defs.h
new file mode 100644
index 00000000000..daef95ea703
--- /dev/null
+++ b/linux-user/mips/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef MIPS_TARGET_ERRNO_DEFS_H
+#define MIPS_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/mips64/target_errno_defs.h b/linux-user/mips64/target_errno_defs.h
new file mode 100644
index 00000000000..82b0a704f62
--- /dev/null
+++ b/linux-user/mips64/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef MIPS64_TARGET_ERRNO_DEFS_H
+#define MIPS64_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/nios2/target_errno_defs.h b/linux-user/nios2/target_errno_defs.h
new file mode 100644
index 00000000000..daceaf30347
--- /dev/null
+++ b/linux-user/nios2/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef NIOS2_TARGET_ERRNO_DEFS_H
+#define NIOS2_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/openrisc/target_errno_defs.h b/linux-user/openrisc/target_errno_defs.h
new file mode 100644
index 00000000000..1d32c8798f7
--- /dev/null
+++ b/linux-user/openrisc/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef OR1K_TARGET_ERRNO_DEFS_H
+#define OR1K_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/ppc/target_errno_defs.h b/linux-user/ppc/target_errno_defs.h
new file mode 100644
index 00000000000..01b25bb5d06
--- /dev/null
+++ b/linux-user/ppc/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef PPC_TARGET_ERRNO_DEFS_H
+#define PPC_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/riscv/target_errno_defs.h b/linux-user/riscv/target_errno_defs.h
new file mode 100644
index 00000000000..785614ba0a5
--- /dev/null
+++ b/linux-user/riscv/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef RISCV_TARGET_ERRNO_DEFS_H
+#define RISCV_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/s390x/target_errno_defs.h b/linux-user/s390x/target_errno_defs.h
new file mode 100644
index 00000000000..bca1c3b4a10
--- /dev/null
+++ b/linux-user/s390x/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef S390X_TARGET_ERRNO_DEFS_H
+#define S390X_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/sh4/target_errno_defs.h b/linux-user/sh4/target_errno_defs.h
new file mode 100644
index 00000000000..de2de2d3f8d
--- /dev/null
+++ b/linux-user/sh4/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef SH4_TARGET_ERRNO_DEFS_H
+#define SH4_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/sparc/target_errno_defs.h b/linux-user/sparc/target_errno_defs.h
index e0008109867..416acbb4593 100644
--- a/linux-user/sparc/target_errno_defs.h
+++ b/linux-user/sparc/target_errno_defs.h
@@ -1,6 +1,8 @@
 #ifndef SPARC_TARGET_ERRNO_DEFS_H
 #define SPARC_TARGET_ERRNO_DEFS_H
 
+#include "../generic/target_errno_defs.h"
+
 /* Target errno definitions taken from asm-sparc/errno.h */
 #undef TARGET_EWOULDBLOCK
 #define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
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
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 18b031a2f6a..a5ce487dcc3 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2751,7 +2751,7 @@ struct target_drm_i915_getparam {
 
 #include "socket.h"
 
-#include "errno_defs.h"
+#include "target_errno_defs.h"
 
 #define FUTEX_WAIT              0
 #define FUTEX_WAKE              1
diff --git a/linux-user/x86_64/target_errno_defs.h b/linux-user/x86_64/target_errno_defs.h
new file mode 100644
index 00000000000..43b4068ba93
--- /dev/null
+++ b/linux-user/x86_64/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef X86_64_TARGET_ERRNO_DEFS_H
+#define X86_64_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/xtensa/target_errno_defs.h b/linux-user/xtensa/target_errno_defs.h
new file mode 100644
index 00000000000..7d39e77251c
--- /dev/null
+++ b/linux-user/xtensa/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef XTENSA_TARGET_ERRNO_DEFS_H
+#define XTENSA_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/safe-syscall.S b/linux-user/safe-syscall.S
index b5df6254aea..42ea7c40ba3 100644
--- a/linux-user/safe-syscall.S
+++ b/linux-user/safe-syscall.S
@@ -11,7 +11,7 @@
  */
 
 #include "hostdep.h"
-#include "errno_defs.h"
+#include "target_errno_defs.h"
 
 /* We have the correct host directory on our include path
  * so that this will pull in the right fragment for the architecture.
-- 
2.31.1


