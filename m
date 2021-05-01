Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BEE3706A2
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 11:33:10 +0200 (CEST)
Received: from localhost ([::1]:53686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lclzn-0002Fr-Ix
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 05:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxQ-0000X0-M3
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:40 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:42931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxM-0005XJ-WC
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:38 -0400
Received: by mail-ed1-x52c.google.com with SMTP id j28so802619edy.9
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 02:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L9PXy0iMaEYQMrwCKAeGdUKr08wU5yIXqMSKYA5860o=;
 b=B2PIv/tzp7fyBzt7RUnqeVe8QmfWR2f6+R6l7dqA63Sif3wGlmFhPQk7NIiQu0SHsX
 Y2yOCnC4YxQPcHG/2WHoLLY39GaUx+alWr4ciHlzF/8QXer7SgPBQNwQkphSGrFHC1Mt
 mtB8IXsrKP15R+nIQE/ksN1ZqqeT/XD9Kq7h2vwZgPw1QRWbVLqFLxjyNz8Vnl6nzCup
 T8Pau3zaDppJXC5BFVwSR0HPtly5j0Ih5LaMVQZ7ICC5+pTYWO49NOaXkQ2FmbVFRaIb
 M0p21yJfHjL8gfZgqWXYIyrl3Lhs4yLcMPv1m+ItvyoYeOs7L16dWaRkT4sxdpispX55
 rD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L9PXy0iMaEYQMrwCKAeGdUKr08wU5yIXqMSKYA5860o=;
 b=naJVVRx2A3GURsNd0GwfPixsUxKRUjRbcNwjbpYVQEs+VZLVB4r7jKl/ttUH81oFMH
 hz/a4D0K0wYCbDoa6XRa+22+AyBgZonzsXleTXlzDLCQu37UcXCJiAYEKi2mAzmsn5Ta
 deBaZqBozwYgNMV/bSEVWN+VMNun3VEBZFGGwNpddt5znzMc6J/kqa09fG8rjfzEAaRF
 j61I87yHPLXJ6jCReomGr/H7+SQfnJmJDKg380TZlj6J7zw5DV7m2E81WggTS9oegZdm
 QKT2sfowVXSJYJbIfVHz6nfcV0H7acWmR0CbU4aTI10oRfrQsomkxuLIP9RsG5E5Og8a
 fyKw==
X-Gm-Message-State: AOAM532faA1Zduq+NPoyiqXeDD8al0//gLTw+6RHs2j/un1EXfK9f9/b
 gkQ5RobnDRCmr6tuIrGcedw9GUULd9A=
X-Google-Smtp-Source: ABdhPJyElUG0hlsdciXLrKVecbv4W4rTVZgx40/3OwJe2ANFb1jEv/ImYNR52Vd+e8iO0Ipg35GIQA==
X-Received: by 2002:a05:6402:254a:: with SMTP id
 l10mr10561337edb.145.1619861435806; 
 Sat, 01 May 2021 02:30:35 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id ga33sm4632721ejc.11.2021.05.01.02.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 02:30:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] slirp: add configure option to disable smbd
Date: Sat,  1 May 2021 11:30:23 +0200
Message-Id: <20210501093026.189429-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210501093026.189429-1-pbonzini@redhat.com>
References: <20210501093026.189429-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joelle van Dyne <j@getutm.app>

Replace Windows specific macro with a more generic feature detection
macro. Allows slirp smb feature to be disabled manually as well.

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Joelle van Dyne <j@getutm.app>
Message-Id: <20210315180341.31638-5-j@getutm.app>
[Use $default_feature as the default. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 26 +++++++++++++++++++++++---
 meson.build |  2 +-
 net/slirp.c | 16 ++++++++--------
 3 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/configure b/configure
index 268460d63d..ccc58ccc46 100755
--- a/configure
+++ b/configure
@@ -464,6 +464,7 @@ gettext="auto"
 fuse="auto"
 fuse_lseek="auto"
 multiprocess="auto"
+slirp_smbd="$default_feature"
 
 malloc_trim="auto"
 gio="$default_feature"
@@ -836,8 +837,6 @@ do
     fi
 done
 
-: ${smbd=${SMBD-/usr/sbin/smbd}}
-
 # Default objcc to clang if available, otherwise use CC
 if has clang; then
   objcc=clang
@@ -1570,6 +1569,10 @@ for opt do
   ;;
   --disable-gio) gio=no
   ;;
+  --enable-slirp-smbd) slirp_smbd=yes
+  ;;
+  --disable-slirp-smbd) slirp_smbd=no
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1925,6 +1928,7 @@ disabled with --disable-FEATURE, default is enabled if available
   fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
   multiprocess    Out of process device emulation support
   gio             libgio support
+  slirp-smbd      use smbd (at path --smbd=*) in slirp networking
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -5261,6 +5265,19 @@ case "$slirp" in
     ;;
 esac
 
+# Check for slirp smbd dupport
+: ${smbd=${SMBD-/usr/sbin/smbd}}
+if test "$slirp_smbd" != "no" ; then
+  if test "$mingw32" = "yes" ; then
+    if test "$slirp_smbd" = "yes" ; then
+      error_exit "Host smbd not supported on this platform."
+    fi
+    slirp_smbd=no
+  else
+    slirp_smbd=yes
+  fi
+fi
+
 ##########################################
 # check for usable __NR_keyctl syscall
 
@@ -5536,7 +5553,10 @@ fi
 if test "$guest_agent" = "yes" ; then
   echo "CONFIG_GUEST_AGENT=y" >> $config_host_mak
 fi
-echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
+if test "$slirp_smbd" = "yes" ; then
+  echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
+  echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
+fi
 if test "$vde" = "yes" ; then
   echo "CONFIG_VDE=y" >> $config_host_mak
   echo "VDE_LIBS=$vde_libs" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 14dd3fe068..cf0bcf6b53 100644
--- a/meson.build
+++ b/meson.build
@@ -2464,7 +2464,7 @@ summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
 if targetos == 'windows' and config_host.has_key('CONFIG_GUEST_AGENT')
   summary_info += {'wixl':            wixl.found() ? wixl.full_path() : false}
 endif
-if slirp_opt != 'disabled'
+if slirp_opt != 'disabled' and 'CONFIG_SLIRP_SMBD' in config_host
   summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
 endif
 summary(summary_info, bool_yn: true, section: 'Host binaries')
diff --git a/net/slirp.c b/net/slirp.c
index a01a0fccd3..1d9cb3bd6b 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -27,7 +27,7 @@
 #include "net/slirp.h"
 
 
-#ifndef _WIN32
+#if defined(CONFIG_SLIRP_SMBD)
 #include <pwd.h>
 #include <sys/wait.h>
 #endif
@@ -91,7 +91,7 @@ typedef struct SlirpState {
     Slirp *slirp;
     Notifier poll_notifier;
     Notifier exit_notifier;
-#ifndef _WIN32
+#if defined(CONFIG_SLIRP_SMBD)
     gchar *smb_dir;
 #endif
     GSList *fwd;
@@ -104,7 +104,7 @@ static QTAILQ_HEAD(, SlirpState) slirp_stacks =
 static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp);
 static int slirp_guestfwd(SlirpState *s, const char *config_str, Error **errp);
 
-#ifndef _WIN32
+#if defined(CONFIG_SLIRP_SMBD)
 static int slirp_smb(SlirpState *s, const char *exported_dir,
                      struct in_addr vserver_addr, Error **errp);
 static void slirp_smb_cleanup(SlirpState *s);
@@ -377,7 +377,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
     struct in6_addr ip6_prefix;
     struct in6_addr ip6_host;
     struct in6_addr ip6_dns;
-#ifndef _WIN32
+#if defined(CONFIG_SLIRP_SMBD)
     struct in_addr smbsrv = { .s_addr = 0 };
 #endif
     NetClientState *nc;
@@ -487,7 +487,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
         return -1;
     }
 
-#ifndef _WIN32
+#if defined(CONFIG_SLIRP_SMBD)
     if (vsmbserver && !inet_aton(vsmbserver, &smbsrv)) {
         error_setg(errp, "Failed to parse SMB address");
         return -1;
@@ -602,7 +602,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
             }
         }
     }
-#ifndef _WIN32
+#if defined(CONFIG_SLIRP_SMBD)
     if (smb_export) {
         if (slirp_smb(s, smb_export, smbsrv, errp) < 0) {
             goto error;
@@ -794,7 +794,7 @@ void hmp_hostfwd_add(Monitor *mon, const QDict *qdict)
 
 }
 
-#ifndef _WIN32
+#if defined(CONFIG_SLIRP_SMBD)
 
 /* automatic user mode samba server configuration */
 static void slirp_smb_cleanup(SlirpState *s)
@@ -909,7 +909,7 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
     return 0;
 }
 
-#endif /* !defined(_WIN32) */
+#endif /* defined(CONFIG_SLIRP_SMBD) */
 
 static int guestfwd_can_read(void *opaque)
 {
-- 
2.31.1



