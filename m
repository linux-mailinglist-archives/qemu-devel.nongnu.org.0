Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D141C47A0EA
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:25:19 +0100 (CET)
Received: from localhost ([::1]:57928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myx7m-0003mx-Um
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:25:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx0A-0006KD-9w
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:26 -0500
Received: from [2a00:1450:4864:20::533] (port=39703
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx08-0005xi-NJ
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:26 -0500
Received: by mail-ed1-x533.google.com with SMTP id f5so4729542edq.6
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TaFNVMQksgh8w5mOL9Z9nfCWfIMJtZ2x95nso2BUz2k=;
 b=J7uQ9vXeyBMry2BYZJCgyf5jol/5qIJNA2YWAmJVZIVMfOsOSK3ka1JixuVO6wPMLE
 FcD9pFR+M60BlkdDVW6voVe6aDyUyCqfi/KtAu+UZPc2S/1mzhxi79YzmKwSvJhHf4Ax
 RI7KIDEEUbe95MIeV3Qpn7xRqbIKpIdnvuWmPyLAykCvKUyXLau2tRhpigeQM2Sub5Sm
 +0pjSuHtYi0lERILSrTXMv6jPVgfo/o/Hq+qUXfmidUKAB9qnNTmXzr7irp3dlr5pNxs
 JRRL8trhYw07jZ0DRwxfFLf2+hFHVm4U0v74dwIPCFiom/AE3Hg3uk1+70b+gpCtOZsv
 tAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TaFNVMQksgh8w5mOL9Z9nfCWfIMJtZ2x95nso2BUz2k=;
 b=J1zyvxjDze0Up3+f+q8tXLkpNzcY2OyaDp+yEBm8fN7aJArFr83OftSIPuzP2+ov+7
 zRC7e1tuJtGp3KrJ/mcTqIylOZ0/exc+lkl/wnaAO+81tWHk0X8xFDGbm0AsVEJNKGD5
 9X3uvwxM7kwDbXBBmd8Gi7/ol06Hlmw6xwRyOpZpaljLLfOKjFlUemw2ZEMch9IbFgDE
 rEv1o9l6Rhx3HbgQ4GhDdsRZMnUtBKMVmcdqPOeS/ozGqx8Rb18E4X9t9Na2sriq2KsN
 48Oocv0z08loMhmb4H7OhpGN5gVjxFLiGhDzfLIwfgVzi/5MpHv4qaRGy91n1g55pKG8
 I8VQ==
X-Gm-Message-State: AOAM531ZWd2PZRdMXjb1vl80iIssrJD/GZVnUSFRg+diqYCntAu20BlW
 bcw+aHHkua3tM172nFV9Qeva3n3fEtI=
X-Google-Smtp-Source: ABdhPJx3UnSmeAVE2Q4Dh3K8g9Ba70+p3KtwdbkLZfaSy7bPrzJP+2oZnj/bx2kU7DvQ8QxB0NCMLg==
X-Received: by 2002:a17:907:3d88:: with SMTP id
 he8mr1613715ejc.239.1639923443382; 
 Sun, 19 Dec 2021 06:17:23 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id hq9sm4570665ejc.119.2021.12.19.06.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:17:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/16] configure, meson: move ARCH to meson.build
Date: Sun, 19 Dec 2021 15:17:02 +0100
Message-Id: <20211219141711.248066-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

$ARCH and the HOST_* symbols are only used by the QEMU build; configure
uses $cpu instead.  Remove it from config-host.mak.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 21 ++++-----------------
 meson.build | 26 +++++++++++++++++---------
 2 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/configure b/configure
index 108b7621e2..6e06ac6161 100755
--- a/configure
+++ b/configure
@@ -635,11 +635,9 @@ else
   cpu=$(uname -m)
 fi
 
-ARCH=
-# Normalise host CPU name, set ARCH and multilib cflags
+# Normalise host CPU name, set multilib cflags
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
-  aarch64|riscv) ;;
   armv*b|armv*l|arm)
     cpu="arm" ;;
 
@@ -668,8 +666,7 @@ case "$cpu" in
     CPU_CFLAGS="-m64 -mlittle" ;;
 
   s390)
-    CPU_CFLAGS="-m31"
-    ARCH=unknown ;;
+    CPU_CFLAGS="-m31" ;;
   s390x)
     CPU_CFLAGS="-m64" ;;
 
@@ -678,15 +675,7 @@ case "$cpu" in
     CPU_CFLAGS="-m32 -mv8plus -mcpu=ultrasparc" ;;
   sparc64)
     CPU_CFLAGS="-m64 -mcpu=ultrasparc" ;;
-
-  *)
-    # This will result in either an error or falling back to TCI later
-    ARCH=unknown
-  ;;
 esac
-if test -z "$ARCH"; then
-  ARCH="$cpu"
-fi
 
 : ${make=${MAKE-make}}
 
@@ -3406,8 +3395,6 @@ echo "GIT=$git" >> $config_host_mak
 echo "GIT_SUBMODULES=$git_submodules" >> $config_host_mak
 echo "GIT_SUBMODULES_ACTION=$git_submodules_action" >> $config_host_mak
 
-echo "ARCH=$ARCH" >> $config_host_mak
-
 if test "$debug_tcg" = "yes" ; then
   echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
 fi
@@ -3898,12 +3885,12 @@ if test "$skip_meson" = no; then
     cross_arg="--cross-file config-meson.cross"
     echo "[host_machine]" >> $cross
     echo "system = '$targetos'" >> $cross
-    case "$ARCH" in
+    case "$cpu" in
         i386)
             echo "cpu_family = 'x86'" >> $cross
             ;;
         *)
-            echo "cpu_family = '$ARCH'" >> $cross
+            echo "cpu_family = '$cpu'" >> $cross
             ;;
     esac
     echo "cpu = '$cpu'" >> $cross
diff --git a/meson.build b/meson.build
index 4fdaa65b05..2495360fd0 100644
--- a/meson.build
+++ b/meson.build
@@ -67,6 +67,14 @@ endif
 
 targetos = host_machine.system()
 
+if cpu not in supported_cpus
+  host_arch = 'unknown'
+elif cpu == 'x86'
+  host_arch = 'i386'
+else
+  host_arch = cpu
+endif
+
 if cpu in ['x86', 'x86_64']
   kvm_targets = ['i386-softmmu', 'x86_64-softmmu']
 elif cpu == 'aarch64'
@@ -335,9 +343,9 @@ if targetos == 'netbsd'
   endif
 endif
 
-tcg_arch = config_host['ARCH']
+tcg_arch = host_arch
 if not get_option('tcg').disabled()
-  if cpu not in supported_cpus
+  if host_arch == 'unknown'
     if get_option('tcg_interpreter')
       warning('Unsupported CPU @0@, will use TCG with TCI (slow)'.format(cpu))
     else
@@ -353,11 +361,11 @@ if not get_option('tcg').disabled()
   endif
   if get_option('tcg_interpreter')
     tcg_arch = 'tci'
-  elif config_host['ARCH'] == 'sparc64'
+  elif host_arch == 'sparc64'
     tcg_arch = 'sparc'
-  elif config_host['ARCH'] == 'x86_64'
+  elif host_arch == 'x86_64'
     tcg_arch = 'i386'
-  elif config_host['ARCH'] == 'ppc64'
+  elif host_arch == 'ppc64'
     tcg_arch = 'ppc'
   endif
   add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / tcg_arch,
@@ -1426,6 +1434,8 @@ config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') /
 config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
 config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_option('sysconfdir'))
 
+config_host_data.set('HOST_' + host_arch.to_upper(), 1)
+
 config_host_data.set('CONFIG_ATTR', libattr.found())
 config_host_data.set('CONFIG_BRLAPI', brlapi.found())
 config_host_data.set('CONFIG_COCOA', cocoa.found())
@@ -1775,8 +1785,6 @@ foreach k, v: config_host
       v = '"' + '", "'.join(v.split()) + '", '
     endif
     config_host_data.set(k, v)
-  elif k == 'ARCH'
-    config_host_data.set('HOST_' + v.to_upper(), 1)
   elif strings.contains(k)
     config_host_data.set_quoted(k, v)
   elif k.startswith('CONFIG_')
@@ -1919,7 +1927,7 @@ foreach target : target_dirs
   endif
 
   foreach k, v: disassemblers
-    if config_host['ARCH'].startswith(k) or config_target['TARGET_BASE_ARCH'].startswith(k)
+    if host_arch.startswith(k) or config_target['TARGET_BASE_ARCH'].startswith(k)
       foreach sym: v
         config_target += { sym: 'y' }
         config_all_disas += { sym: 'y' }
@@ -2888,7 +2896,7 @@ foreach target : target_dirs
     endif
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
-      target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
+      target_inc += include_directories('linux-user/host/' / host_arch)
     endif
     if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
-- 
2.33.1



