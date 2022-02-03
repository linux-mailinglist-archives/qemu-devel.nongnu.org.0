Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA61F4A8A9A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:48:36 +0100 (CET)
Received: from localhost ([::1]:59718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgDi-0002v9-1e
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:48:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0K-000536-VQ
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:45 -0500
Received: from [2a00:1450:4864:20::631] (port=38804
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzo-0008IE-T3
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:15 -0500
Received: by mail-ej1-x631.google.com with SMTP id k25so10927548ejp.5
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4nUGLiJjWkMxl3h2MBIbclGQG7WXL2Df5dmkZNL7EVY=;
 b=B91p15/JAMaiOEgtePnN0mw22eVtSiT4vrAEnhQyM9m+czrQJ6No572KxNqOUMLbJ8
 hoYOS5ACHwrenkmxTqhYcH0cg5zcQNF42SsLYxBezj8wz0FRcJEgXeGCdcjPxD+ZjCU3
 R0cXETJ0Bhn4Myuq/DMo5L2MjDy8giYjI7JrTfAJM2lxBuo+nIcljph6iii7xHCnnw6I
 9vEYgScu7EettWKQOkOVpxbHdPytYJWQpKrAIu0rcqDXT9RS86nS9Ym/l3EtW84hBwtr
 IcJUhZBzMAkgHKpVbqR0y9tlURS5G++uAkdCMogP0BiN876pdsbuYgEaV4/ErLF2y6Hz
 noAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4nUGLiJjWkMxl3h2MBIbclGQG7WXL2Df5dmkZNL7EVY=;
 b=y44uu4JJoCC24XbNAsaQvj2/CckJykpWBQPg+JfF3Zi4wpLBD66l41mhDd1EJcrsAQ
 QK28fo6eL52MQxLxQN1CJU7i6AYQgBLMUpJmvqdwgYCtflpuuv3ZUBlM3YgqB2hOqBtS
 dtaTuiayu/jk8jGfcn/qxTJNi00sPVzTQGoQlBk6UATw2dTeBJ8uhrTHeoALDOPshYCQ
 NTV1yC4xPEY2PTuKvMRljoBn80jf+2ntUwkbwbBNmoQAmiJp1OpWt2Z04rGDEUUGSjIw
 JE2bkhwED25ZRTewD+UHrEGUvi8lXZUOEc03lFHZbKlPDASLxMS8D5qdIRxeLpykLYQE
 vlTg==
X-Gm-Message-State: AOAM530Gku/JttL4BIZrN0MJvad6zol9D7UJWuIQetnxGqEBwWCjIH8S
 UXq48r6ZCvkpCJmDUZIv1ImlybYztqc=
X-Google-Smtp-Source: ABdhPJxTWLPu7iZOac9O3DYKnpo7GKKyxUKyDwuQe5Q9KYxjt3SvQuMgCaiK4Ow1ScHQQbYZbTNlxg==
X-Received: by 2002:a17:907:2d8e:: with SMTP id
 gt14mr30284210ejc.509.1643909651526; 
 Thu, 03 Feb 2022 09:34:11 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/27] configure, meson: move smbd options to meson_options.txt
Date: Thu,  3 Feb 2022 18:33:46 +0100
Message-Id: <20220203173359.292068-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 26 ++------------------------
 meson.build                   | 15 +++++++++++++--
 meson_options.txt             |  4 ++++
 net/slirp.c                   | 16 ++++++++--------
 scripts/meson-buildoptions.py |  1 +
 scripts/meson-buildoptions.sh |  3 +++
 6 files changed, 31 insertions(+), 34 deletions(-)

diff --git a/configure b/configure
index dda586cc69..b836dfbd78 100755
--- a/configure
+++ b/configure
@@ -330,7 +330,6 @@ meson_args=""
 ninja=""
 gio="$default_feature"
 skip_meson=no
-slirp_smbd="$default_feature"
 
 # The following Meson options are handled manually (still they
 # are included in the automatically generated help message)
@@ -416,6 +415,7 @@ objcopy="${OBJCOPY-${cross_prefix}objcopy}"
 ld="${LD-${cross_prefix}ld}"
 ranlib="${RANLIB-${cross_prefix}ranlib}"
 nm="${NM-${cross_prefix}nm}"
+smbd="$SMBD"
 strip="${STRIP-${cross_prefix}strip}"
 windres="${WINDRES-${cross_prefix}windres}"
 pkg_config_exe="${PKG_CONFIG-${cross_prefix}pkg-config}"
@@ -535,7 +535,6 @@ darwin)
 sunos)
   solaris="yes"
   make="${MAKE-gmake}"
-  smbd="${SMBD-/usr/sfw/sbin/smbd}"
 # needed for CMSG_ macros in sys/socket.h
   QEMU_CFLAGS="-D_XOPEN_SOURCE=600 $QEMU_CFLAGS"
 # needed for TIOCWIN* defines in termios.h
@@ -1047,10 +1046,6 @@ for opt do
   ;;
   --disable-gio) gio=no
   ;;
-  --enable-slirp-smbd) slirp_smbd=yes
-  ;;
-  --disable-slirp-smbd) slirp_smbd=no
-  ;;
   # backwards compatibility options
   --enable-trace-backend=*) meson_option_parse "--enable-trace-backends=$optarg" "$optarg"
   ;;
@@ -1296,7 +1291,6 @@ cat << EOF
   opengl          opengl support
   tools           build qemu-io, qemu-nbd and qemu-img tools
   gio             libgio support
-  slirp-smbd      use smbd (at path --smbd=*) in slirp networking
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -2746,19 +2740,6 @@ case "$slirp" in
     ;;
 esac
 
-# Check for slirp smbd dupport
-: ${smbd=${SMBD-/usr/sbin/smbd}}
-if test "$slirp_smbd" != "no" ; then
-  if test "$mingw32" = "yes" ; then
-    if test "$slirp_smbd" = "yes" ; then
-      error_exit "Host smbd not supported on this platform."
-    fi
-    slirp_smbd=no
-  else
-    slirp_smbd=yes
-  fi
-fi
-
 ##########################################
 # check for usable __NR_keyctl syscall
 
@@ -3014,10 +2995,6 @@ fi
 if test "$guest_agent" = "yes" ; then
   echo "CONFIG_GUEST_AGENT=y" >> $config_host_mak
 fi
-if test "$slirp_smbd" = "yes" ; then
-  echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
-  echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
-fi
 echo "CONFIG_BDRV_RW_WHITELIST=$block_drv_rw_whitelist" >> $config_host_mak
 echo "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
 qemu_version=$(head $source_path/VERSION)
@@ -3376,6 +3353,7 @@ if test "$skip_meson" = no; then
         -Ddocdir="$docdir" \
         -Dqemu_firmwarepath="$firmwarepath" \
         -Dqemu_suffix="$qemu_suffix" \
+        -Dsmbd="$smbd" \
         -Dsphinx_build="$sphinx_build" \
         -Dtrace_file="$trace_file" \
         -Doptimization=$(if test "$debug" = yes; then echo 0; else echo 2; fi) \
diff --git a/meson.build b/meson.build
index e44f8bf750..7fc2e3179e 100644
--- a/meson.build
+++ b/meson.build
@@ -1462,6 +1462,17 @@ config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') /
 config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
 config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_option('sysconfdir'))
 
+have_slirp_smbd = get_option('slirp_smbd') \
+  .require(targetos != 'windows', error_message: 'Host smbd not supported on this platform.') \
+  .allowed()
+if have_slirp_smbd
+  smbd_path = get_option('smbd')
+  if smbd_path == ''
+    smbd_path = (targetos == 'solaris' ? '/usr/sfw/sbin/smbd' : '/usr/sbin/smbd')
+  endif
+  config_host_data.set_quoted('CONFIG_SMBD_COMMAND', smbd_path)
+endif
+
 config_host_data.set('HOST_' + host_arch.to_upper(), 1)
 
 config_host_data.set('CONFIG_ATTR', libattr.found())
@@ -3337,8 +3348,8 @@ summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
 if targetos == 'windows' and config_host.has_key('CONFIG_GUEST_AGENT')
   summary_info += {'wixl':            wixl}
 endif
-if slirp_opt != 'disabled' and 'CONFIG_SLIRP_SMBD' in config_host
-  summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
+if slirp_opt != 'disabled' and have_system
+  summary_info += {'smbd':            have_slirp_smbd ? smbd_path : false}
 endif
 summary(summary_info, bool_yn: true, section: 'Host binaries')
 
diff --git a/meson_options.txt b/meson_options.txt
index 03ae957102..59220b52c8 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -8,6 +8,8 @@ option('docdir', type : 'string', value : 'doc',
        description: 'Base directory for documentation installation (can be empty)')
 option('qemu_firmwarepath', type : 'string', value : '',
        description: 'search PATH for firmware files')
+option('smbd', type : 'string', value : '',
+       description: 'Path to smbd for slirp networking')
 option('sphinx_build', type : 'string', value : '',
        description: 'Use specified sphinx-build [$sphinx_build] for building document (default to be empty)')
 option('default_devices', type : 'boolean', value : true,
@@ -258,3 +260,5 @@ option('gprof', type: 'boolean', value: false,
        description: 'QEMU profiling with gprof')
 option('profiler', type: 'boolean', value: false,
        description: 'profiler support')
+option('slirp_smbd', type : 'feature', value : 'auto',
+       description: 'use smbd (at path --smbd=*) in slirp networking')
diff --git a/net/slirp.c b/net/slirp.c
index ad3a838e0b..bc5e9e4f77 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -27,7 +27,7 @@
 #include "net/slirp.h"
 
 
-#if defined(CONFIG_SLIRP_SMBD)
+#if defined(CONFIG_SMBD_COMMAND)
 #include <pwd.h>
 #include <sys/wait.h>
 #endif
@@ -91,7 +91,7 @@ typedef struct SlirpState {
     Slirp *slirp;
     Notifier poll_notifier;
     Notifier exit_notifier;
-#if defined(CONFIG_SLIRP_SMBD)
+#if defined(CONFIG_SMBD_COMMAND)
     gchar *smb_dir;
 #endif
     GSList *fwd;
@@ -104,7 +104,7 @@ static QTAILQ_HEAD(, SlirpState) slirp_stacks =
 static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp);
 static int slirp_guestfwd(SlirpState *s, const char *config_str, Error **errp);
 
-#if defined(CONFIG_SLIRP_SMBD)
+#if defined(CONFIG_SMBD_COMMAND)
 static int slirp_smb(SlirpState *s, const char *exported_dir,
                      struct in_addr vserver_addr, Error **errp);
 static void slirp_smb_cleanup(SlirpState *s);
@@ -377,7 +377,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
     struct in6_addr ip6_prefix;
     struct in6_addr ip6_host;
     struct in6_addr ip6_dns;
-#if defined(CONFIG_SLIRP_SMBD)
+#if defined(CONFIG_SMBD_COMMAND)
     struct in_addr smbsrv = { .s_addr = 0 };
 #endif
     NetClientState *nc;
@@ -487,7 +487,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
         return -1;
     }
 
-#if defined(CONFIG_SLIRP_SMBD)
+#if defined(CONFIG_SMBD_COMMAND)
     if (vsmbserver && !inet_aton(vsmbserver, &smbsrv)) {
         error_setg(errp, "Failed to parse SMB address");
         return -1;
@@ -602,7 +602,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
             }
         }
     }
-#if defined(CONFIG_SLIRP_SMBD)
+#if defined(CONFIG_SMBD_COMMAND)
     if (smb_export) {
         if (slirp_smb(s, smb_export, smbsrv, errp) < 0) {
             goto error;
@@ -794,7 +794,7 @@ void hmp_hostfwd_add(Monitor *mon, const QDict *qdict)
 
 }
 
-#if defined(CONFIG_SLIRP_SMBD)
+#if defined(CONFIG_SMBD_COMMAND)
 
 /* automatic user mode samba server configuration */
 static void slirp_smb_cleanup(SlirpState *s)
@@ -909,7 +909,7 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
     return 0;
 }
 
-#endif /* defined(CONFIG_SLIRP_SMBD) */
+#endif /* defined(CONFIG_SMBD_COMMAND) */
 
 static int guestfwd_can_read(void *opaque)
 {
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 98ae944148..01b10f7ae0 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -32,6 +32,7 @@
     "fuzzing_engine",
     "qemu_firmwarepath",
     "qemu_suffix",
+    "smbd",
     "sphinx_build",
     "trace_file",
 }
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 74bc6458d4..07c1243b3f 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -102,6 +102,7 @@ meson_options_help() {
   printf "%s\n" '  sdl-image       SDL Image support for icons'
   printf "%s\n" '  seccomp         seccomp support'
   printf "%s\n" '  selinux         SELinux support in qemu-nbd'
+  printf "%s\n" '  slirp-smbd      use smbd (at path --smbd=*) in slirp networking'
   printf "%s\n" '  smartcard       CA smartcard emulation support'
   printf "%s\n" '  snappy          snappy compression support'
   printf "%s\n" '  sparse          sparse checker'
@@ -299,6 +300,8 @@ _meson_option_parse() {
     --enable-slirp) printf "%s" -Dslirp=enabled ;;
     --disable-slirp) printf "%s" -Dslirp=disabled ;;
     --enable-slirp=*) quote_sh "-Dslirp=$2" ;;
+    --enable-slirp-smbd) printf "%s" -Dslirp_smbd=enabled ;;
+    --disable-slirp-smbd) printf "%s" -Dslirp_smbd=disabled ;;
     --enable-smartcard) printf "%s" -Dsmartcard=enabled ;;
     --disable-smartcard) printf "%s" -Dsmartcard=disabled ;;
     --enable-snappy) printf "%s" -Dsnappy=enabled ;;
-- 
2.34.1



