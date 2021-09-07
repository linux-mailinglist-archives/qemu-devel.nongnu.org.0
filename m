Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43C54030B2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:06:35 +0200 (CEST)
Received: from localhost ([::1]:59196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjEg-0002qj-RV
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2W-0005qd-7J
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:00 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:43919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2T-0000vd-4I
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:59 -0400
Received: by mail-io1-xd44.google.com with SMTP id n24so444860ion.10
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bf3A6AvJp14kGD1giAicYh55HeGN2doZRnv3w4ggO2w=;
 b=DvlF6TR3+6Frq+wTiSFwGM4L0teT5ku7Vio9nCp/2wIUIJpgwz3p1QuNyaT3IWoErZ
 rIJ6stbciT89PgS99Apfoslo5aQHPKhcCWx1XDhQxi8G1LoASvGu5mTZcwvUF+hxTcvt
 JDUSUTfBSOPzoupTFblQANdqQrCF6pa7V833aJ4gZhKfUXHFUSQTj6q31TlWcHjsvrNl
 6aeM0Jm1jOFgL75eCzO7G9LxqtT2fqdoW/+NtmZ+Nrb+1qdpJytybrEbdbx2CBrMgnxR
 pNIOsRUYe1CQWHbDCMjjYLEg4DBGglv4TuG9HQcOMSmiNKXKEMYWp+2WcyfdIMI+cQjV
 1RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bf3A6AvJp14kGD1giAicYh55HeGN2doZRnv3w4ggO2w=;
 b=q+0hBwGNcKGPtWof40MSiiwxnMcCE1h7NZinWxg9JTP8Rh2gbxQUIvBWsBaj+e14bv
 Ad8o0WU2RId9QGC4LvjryMIh9Qe1KOFLCAyBYsyepIGmrjeEjlDPyx4FABZcYND4hDAH
 fvm3jUJZ78iVy5MTu3iDmbJQaLVVz4xRqVyQOG22JKwiI/pmR4b3W2XicxDuChWbIKEl
 NW8SkLvt4i1oRzDa34eSoOZDaNa5r4gAKxkM/M0Swvk532650KR03qktPDerOavFdHvR
 3cHCWNbbBXGh1+dleVHyD8Tb/Dp4dwg8pcKVXj7AcjieTh3BDDaXTkhohJzhPxiBjO2K
 92EQ==
X-Gm-Message-State: AOAM5308zULbJyhMRd89IDOW7NJtV/zI0ogmTpkYxzwEp8E8aUXy6X0k
 1U23FaSoD2o4eYLPEzgY/G6m8b2yaOu2fL6lu7I=
X-Google-Smtp-Source: ABdhPJxqWk3xHdygKe1ntAvHHN0E6pbNQ7muT5ZWRu+/+14qh2thXKym42M6WBAP5+uijIunmmEXRw==
X-Received: by 2002:a6b:5819:: with SMTP id m25mr282693iob.105.1631051635521; 
 Tue, 07 Sep 2021 14:53:55 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:55 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 19/42] bsd-user: start to move target CPU functions to
 target_arch*
Date: Tue,  7 Sep 2021 15:53:09 -0600
Message-Id: <20210907215332.30737-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d44;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd44.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Move the CPU functions into target_arch_cpu.c that are unique to each
CPU. These are defined in target_arch.h.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/i386/target_arch.h       | 31 +++++++++++++
 bsd-user/i386/target_arch_cpu.c   | 75 +++++++++++++++++++++++++++++++
 bsd-user/main.c                   | 35 ---------------
 bsd-user/x86_64/target_arch.h     | 31 +++++++++++++
 bsd-user/x86_64/target_arch_cpu.c | 75 +++++++++++++++++++++++++++++++
 configure                         |  7 +--
 meson.build                       |  7 ++-
 7 files changed, 218 insertions(+), 43 deletions(-)
 create mode 100644 bsd-user/i386/target_arch.h
 create mode 100644 bsd-user/i386/target_arch_cpu.c
 create mode 100644 bsd-user/x86_64/target_arch.h
 create mode 100644 bsd-user/x86_64/target_arch_cpu.c

diff --git a/bsd-user/i386/target_arch.h b/bsd-user/i386/target_arch.h
new file mode 100644
index 0000000000..73e9a028fe
--- /dev/null
+++ b/bsd-user/i386/target_arch.h
@@ -0,0 +1,31 @@
+/*
+ * Intel x86 specific prototypes for bsd-user
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
+/* target_arch_cpu.c */
+void bsd_i386_write_dt(void *ptr, unsigned long addr, unsigned long limit,
+                int flags);
+void bsd_i386_set_idt(int n, unsigned int dpl);
+void bsd_i386_set_idt_base(uint64_t base);
+
+#define target_cpu_set_tls(env, newtls)
+
+#endif /* ! _TARGET_ARCH_H_ */
diff --git a/bsd-user/i386/target_arch_cpu.c b/bsd-user/i386/target_arch_cpu.c
new file mode 100644
index 0000000000..7f2f755a11
--- /dev/null
+++ b/bsd-user/i386/target_arch_cpu.c
@@ -0,0 +1,75 @@
+/*
+ *  i386 cpu related code
+ *
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
+#include <sys/types.h>
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "qemu.h"
+#include "qemu/timer.h"
+
+#include "target_arch.h"
+
+static uint64_t *idt_table;
+
+uint64_t cpu_get_tsc(CPUX86State *env)
+{
+    return cpu_get_host_ticks();
+}
+
+int cpu_get_pic_interrupt(CPUX86State *env)
+{
+    return -1;
+}
+
+void bsd_i386_write_dt(void *ptr, unsigned long addr, unsigned long limit,
+                     int flags)
+{
+    unsigned int e1, e2;
+    uint32_t *p;
+    e1 = (addr << 16) | (limit & 0xffff);
+    e2 = ((addr >> 16) & 0xff) | (addr & 0xff000000) | (limit & 0x000f0000);
+    e2 |= flags;
+    p = ptr;
+    p[0] = tswap32(e1);
+    p[1] = tswap32(e2);
+}
+
+
+static void set_gate(void *ptr, unsigned int type, unsigned int dpl,
+                     uint32_t addr, unsigned int sel)
+{
+    uint32_t *p, e1, e2;
+    e1 = (addr & 0xffff) | (sel << 16);
+    e2 = (addr & 0xffff0000) | 0x8000 | (dpl << 13) | (type << 8);
+    p = ptr;
+    p[0] = tswap32(e1);
+    p[1] = tswap32(e2);
+}
+
+/* only dpl matters as we do only user space emulation */
+void bsd_i386_set_idt(int n, unsigned int dpl)
+{
+    set_gate(idt_table + n, 0, dpl, 0, 0);
+}
+
+void bsd_i386_set_idt_base(uint64_t base)
+{
+    idt_table = g2h_untagged(base);
+}
+
diff --git a/bsd-user/main.c b/bsd-user/main.c
index d7c8a3e348..f7c75df64d 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -72,13 +72,6 @@ void gemu_log(const char *fmt, ...)
     va_end(ap);
 }
 
-#if defined(TARGET_I386)
-int cpu_get_pic_interrupt(CPUX86State *env)
-{
-    return -1;
-}
-#endif
-
 void fork_start(void)
 {
 }
@@ -94,11 +87,6 @@ void fork_end(int child)
 /***********************************************************/
 /* CPUX86 core interface */
 
-uint64_t cpu_get_tsc(CPUX86State *env)
-{
-    return cpu_get_host_ticks();
-}
-
 static void write_dt(void *ptr, unsigned long addr, unsigned long limit,
                      int flags)
 {
@@ -570,29 +558,6 @@ int main(int argc, char **argv)
      */
     guest_base = HOST_PAGE_ALIGN(guest_base);
 
-    /*
-     * Read in mmap_min_addr kernel parameter.  This value is used
-     * When loading the ELF image to determine whether guest_base
-     * is needed.
-     *
-     * When user has explicitly set the quest base, we skip this
-     * test.
-     */
-    if (!have_guest_base) {
-        FILE *fp;
-
-        fp = fopen("/proc/sys/vm/mmap_min_addr", "r");
-        if (fp != NULL) {
-            unsigned long tmp;
-            if (fscanf(fp, "%lu", &tmp) == 1) {
-                mmap_min_addr = tmp;
-                qemu_log_mask(CPU_LOG_PAGE, "host mmap_min_addr=0x%lx\n",
-                              mmap_min_addr);
-            }
-            fclose(fp);
-        }
-    }
-
     if (loader_exec(filename, argv + optind, target_environ, regs, info,
                     &bprm) != 0) {
         printf("Error loading %s\n", filename);
diff --git a/bsd-user/x86_64/target_arch.h b/bsd-user/x86_64/target_arch.h
new file mode 100644
index 0000000000..e558e1b956
--- /dev/null
+++ b/bsd-user/x86_64/target_arch.h
@@ -0,0 +1,31 @@
+/*
+ * Intel x86_64 specific prototypes for bsd-user
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
+/* target_arch_cpu.c */
+void bsd_x86_64_write_dt(void *ptr, unsigned long addr, unsigned long limit,
+                int flags);
+void bsd_x86_64_set_idt(int n, unsigned int dpl);
+void bsd_x86_64_set_idt_base(uint64_t base);
+
+#define target_cpu_set_tls(env, newtls)
+
+#endif /* !_TARGET_ARCH_H_ */
diff --git a/bsd-user/x86_64/target_arch_cpu.c b/bsd-user/x86_64/target_arch_cpu.c
new file mode 100644
index 0000000000..a2c5b176a4
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_cpu.c
@@ -0,0 +1,75 @@
+/*
+ *  x86_64 cpu related code
+ *
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
+#include <sys/types.h>
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "qemu.h"
+#include "qemu/timer.h"
+
+#include "target_arch.h"
+
+static uint64_t *idt_table;
+
+uint64_t cpu_get_tsc(CPUX86State *env)
+{
+    return cpu_get_host_ticks();
+}
+
+int cpu_get_pic_interrupt(CPUX86State *env)
+{
+    return -1;
+}
+
+void bsd_x86_64_write_dt(void *ptr, unsigned long addr,
+        unsigned long limit, int flags)
+{
+    unsigned int e1, e2;
+    uint32_t *p;
+    e1 = (addr << 16) | (limit & 0xffff);
+    e2 = ((addr >> 16) & 0xff) | (addr & 0xff000000) | (limit & 0x000f0000);
+    e2 |= flags;
+    p = ptr;
+    p[0] = tswap32(e1);
+    p[1] = tswap32(e2);
+}
+
+static void set_gate64(void *ptr, unsigned int type, unsigned int dpl,
+        uint64_t addr, unsigned int sel)
+{
+    uint32_t *p, e1, e2;
+    e1 = (addr & 0xffff) | (sel << 16);
+    e2 = (addr & 0xffff0000) | 0x8000 | (dpl << 13) | (type << 8);
+    p = ptr;
+    p[0] = tswap32(e1);
+    p[1] = tswap32(e2);
+    p[2] = tswap32(addr >> 32);
+    p[3] = 0;
+}
+
+/* only dpl matters as we do only user space emulation */
+void bsd_x86_64_set_idt(int n, unsigned int dpl)
+{
+    set_gate64(idt_table + n * 2, 0, dpl, 0, 0);
+}
+
+void bsd_x86_64_set_idt_base(uint64_t base)
+{
+    idt_table = g2h_untagged(base);
+}
diff --git a/configure b/configure
index 8adf2127c3..da2501489f 100755
--- a/configure
+++ b/configure
@@ -721,6 +721,7 @@ GNU/kFreeBSD)
 ;;
 FreeBSD)
   bsd="yes"
+  bsd_user="yes"
   make="${MAKE-gmake}"
   audio_drv_list="oss try-sdl"
   audio_possible_drivers="oss sdl pa"
@@ -782,12 +783,6 @@ Linux)
 ;;
 esac
 
-if [ "$bsd" = "yes" ] ; then
-  if [ "$darwin" != "yes" ] ; then
-    bsd_user="yes"
-  fi
-fi
-
 : ${make=${MAKE-make}}
 
 # We prefer python 3.x. A bare 'python' is traditionally
diff --git a/meson.build b/meson.build
index 7e58e6279b..9a64d16943 100644
--- a/meson.build
+++ b/meson.build
@@ -2569,9 +2569,12 @@ foreach target : target_dirs
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
       target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
-    else
+    endif
+    if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
-      target_inc += include_directories('bsd-user/freebsd')
+      target_inc += include_directories('bsd-user/' / targetos)
+      dir = base_dir / abi
+      arch_srcs += files(dir / 'target_arch_cpu.c')
     endif
     target_inc += include_directories(
       base_dir,
-- 
2.32.0


