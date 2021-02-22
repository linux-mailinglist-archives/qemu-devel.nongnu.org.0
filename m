Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F19D321477
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 11:52:26 +0100 (CET)
Received: from localhost ([::1]:45456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE8pF-0000hf-6K
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 05:52:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lE8nW-0008G7-1X
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:50:38 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:60527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lE8nU-0004Q1-3t
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:50:37 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MqbI0-1la3P74BNI-00mdJs; Mon, 22 Feb 2021 11:50:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: manage binfmt-misc preserve-arg[0] flag
Date: Mon, 22 Feb 2021 11:50:04 +0100
Message-Id: <20210222105004.1642234-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TZv7kEoJDQe40LvUXR74alKlZn0uTtKde2hekSMYM4rUV5tB2DW
 4U4yki3jeSYJE3St6vD74U+cr0TBanDE4SZ46hunbTwnRKUBxaQEgSBrb9wiqyYnUG0n2VG
 ciRp2DwO2gYha42c47PUX+UyKEaQBgqFh8HRaPiydWh1pqgkBa8OUQcC3IgNgwqYMwYTSQ/
 F1T3XSGAerPWZV+q0LLQQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fiVrzL7h6Wk=:bIxpaodAjMiJmxJq4lZmTN
 A2iJ1YVgnEoqXFXItLhULQZPTEg9qqyBtMraRM8gfpuhobdv7rts/5S3T8pxxEGniX8V0JnkM
 FazGM6qhJwOxMh5VcUonOafFVt3SVm8L0sbG5U6O1FuLu/vvwgCmZVWRdz69SqrSXjR/B0C9K
 Cdx6NcCbIfkf8YbIaj/Q/57NxasxG4ULLkN9kjC5YSpc1hJQKcanj2vQS+D1s+3A7zQq0rhtN
 G7IW58EOPapzjJzTXXRfKA7dvd11+o3Q4jQTUaZgGMHoM+6wxV4Fxy7Egq3TJxlGaFB7jjYyQ
 CqzHwKWGDnEvER/C58wKl83uyEkhts7NDRoOm9gYt/OKMuNn4f0Sc45sIg+cVbaRlcFcmbowj
 dWIsxDn07w0otCM7698wUua2Qj2n10N2Mv619cNGUekPpdWoc+ba1M+NM9twYkBfbHKYPU8+g
 BphzvRSZwIYe9nXnM2N321kogU4WEPDrpaKc2IVLIwdSzx0jQIun
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, HEXHASH_WORD=1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add --preserve-argv0 in qemu-binfmt-conf.sh to configure the preserve-argv0
flag.

This patch allows to use new flag in AT_FLAGS to detect if
preserve-argv0 is configured for this interpreter:
argv[0] (the full pathname provided by binfmt-misc) is removed and
replaced by argv[1] (the original argv[0] provided by binfmt-misc when
'P'/preserve-arg[0] is set)

For instance with this patch and kernel support for AT_FLAGS:

  $ sudo chroot m68k-chroot sh -c 'echo $0'
  sh

without this patch:

  $ sudo chroot m68k-chroot sh -c 'echo $0'
  /usr/bin/sh

The new flag is available in kernel (v5.12) since:
2347961b11d4 ("binfmt_misc: pass binfmt_misc flags to the interpreter")

This can be tested with something like:

  # cp ..../qemu-ppc /chroot/powerpc/jessie

  # qemu-binfmt-conf.sh --qemu-path / --systemd ppc --credential yes \
                        --persistent no --preserve-argv0 yes
  # systemctl restart systemd-binfmt.service
  # cat /proc/sys/fs/binfmt_misc/qemu-ppc
  enabled
  interpreter //qemu-ppc
  flags: POC
  offset 0
  magic 7f454c4601020100000000000000000000020014
  mask ffffffffffffff00fffffffffffffffffffeffff
  # chroot /chroot/powerpc/jessie  sh -c 'echo $0'
  sh

  # qemu-binfmt-conf.sh --qemu-path / --systemd ppc --credential yes \
                        --persistent no --preserve-argv0 no
  # systemctl restart systemd-binfmt.service
  # cat /proc/sys/fs/binfmt_misc/qemu-ppc
  enabled
  interpreter //qemu-ppc
  flags: OC
  offset 0
  magic 7f454c4601020100000000000000000000020014
  mask ffffffffffffff00fffffffffffffffffffeffff
  # chroot /chroot/powerpc/jessie  sh -c 'echo $0'
  /bin/sh

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/main.c           | 24 ++++++++++++++++++++
 scripts/qemu-binfmt-conf.sh | 44 +++++++++++++++++++++++--------------
 2 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 81f48ff54ed4..b9015a5dbd3e 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -26,6 +26,7 @@
 #include <sys/syscall.h>
 #include <sys/resource.h>
 #include <sys/shm.h>
+#include <linux/binfmts.h>
 
 #include "qapi/error.h"
 #include "qemu.h"
@@ -49,6 +50,11 @@
 #include "cpu_loop-common.h"
 #include "crypto/init.h"
 
+#ifndef AT_FLAGS_PRESERVE_ARGV0
+#define AT_FLAGS_PRESERVE_ARGV0_BIT 0
+#define AT_FLAGS_PRESERVE_ARGV0 (1 << AT_FLAGS_PRESERVE_ARGV0_BIT)
+#endif
+
 char *exec_path;
 
 int singlestep;
@@ -631,6 +637,7 @@ int main(int argc, char **argv, char **envp)
     int execfd;
     int log_mask;
     unsigned long max_reserved_va;
+    bool preserve_argv0;
 
     error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
@@ -687,6 +694,9 @@ int main(int argc, char **argv, char **envp)
 
     init_qemu_uname_release();
 
+    /*
+     * Manage binfmt-misc open-binary flag
+     */
     execfd = qemu_getauxval(AT_EXECFD);
     if (execfd == 0) {
         execfd = open(exec_path, O_RDONLY);
@@ -696,6 +706,20 @@ int main(int argc, char **argv, char **envp)
         }
     }
 
+    /*
+     * get binfmt_misc flags
+     */
+    preserve_argv0 = !!(qemu_getauxval(AT_FLAGS) & AT_FLAGS_PRESERVE_ARGV0);
+
+    /*
+     * Manage binfmt-misc preserve-arg[0] flag
+     *    argv[optind]     full path to the binary
+     *    argv[optind + 1] original argv[0]
+     */
+    if (optind + 1 < argc && preserve_argv0) {
+        optind++;
+    }
+
     if (cpu_model == NULL) {
         cpu_model = cpu_get_model(get_elf_eflags(execfd));
     }
diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 7b5d54b88741..573b5dc6acd7 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -178,25 +178,27 @@ usage() {
 Usage: qemu-binfmt-conf.sh [--qemu-path PATH][--debian][--systemd CPU]
                            [--help][--credential yes|no][--exportdir PATH]
                            [--persistent yes|no][--qemu-suffix SUFFIX]
+                           [--preserve-argv0 yes|no]
 
        Configure binfmt_misc to use qemu interpreter
 
-       --help:        display this usage
-       --qemu-path:   set path to qemu interpreter ($QEMU_PATH)
-       --qemu-suffix: add a suffix to the default interpreter name
-       --debian:      don't write into /proc,
-                      instead generate update-binfmts templates
-       --systemd:     don't write into /proc,
-                      instead generate file for systemd-binfmt.service
-                      for the given CPU. If CPU is "ALL", generate a
-                      file for all known cpus
-       --exportdir:   define where to write configuration files
-                      (default: $SYSTEMDDIR or $DEBIANDIR)
-       --credential:  if yes, credential and security tokens are
-                      calculated according to the binary to interpret
-       --persistent:  if yes, the interpreter is loaded when binfmt is
-                      configured and remains in memory. All future uses
-                      are cloned from the open file.
+       --help:          display this usage
+       --qemu-path:     set path to qemu interpreter ($QEMU_PATH)
+       --qemu-suffix:   add a suffix to the default interpreter name
+       --debian:        don't write into /proc,
+                        instead generate update-binfmts templates
+       --systemd:       don't write into /proc,
+                        instead generate file for systemd-binfmt.service
+                        for the given CPU. If CPU is "ALL", generate a
+                        file for all known cpus
+       --exportdir:     define where to write configuration files
+                        (default: $SYSTEMDDIR or $DEBIANDIR)
+       --credential:    if yes, credential and security tokens are
+                        calculated according to the binary to interpret
+       --persistent:    if yes, the interpreter is loaded when binfmt is
+                        configured and remains in memory. All future uses
+                        are cloned from the open file.
+       --preserve-argv0 preserve argv[0]
 
     To import templates with update-binfmts, use :
 
@@ -269,6 +271,9 @@ qemu_generate_register() {
     if [ "$PERSISTENT" = "yes" ] ; then
         flags="${flags}F"
     fi
+    if [ "$PRESERVE_ARG0" = "yes" ] ; then
+        flags="${flags}P"
+    fi
 
     echo ":qemu-$cpu:M::$magic:$mask:$qemu:$flags"
 }
@@ -330,9 +335,10 @@ DEBIANDIR="/usr/share/binfmts"
 QEMU_PATH=/usr/local/bin
 CREDENTIAL=no
 PERSISTENT=no
+PRESERVE_ARG0=no
 QEMU_SUFFIX=""
 
-options=$(getopt -o ds:Q:S:e:hc:p: -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,persistent: -- "$@")
+options=$(getopt -o ds:Q:S:e:hc:p:g: -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,persistent:,preserve-argv0: -- "$@")
 eval set -- "$options"
 
 while true ; do
@@ -388,6 +394,10 @@ while true ; do
         shift
         PERSISTENT="$1"
         ;;
+    -g|--preserve-argv0)
+        shift
+        PRESERVE_ARG0="$1"
+        ;;
     *)
         break
         ;;
-- 
2.29.2


