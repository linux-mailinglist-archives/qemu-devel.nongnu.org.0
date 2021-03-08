Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08590330870
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 07:51:24 +0100 (CET)
Received: from localhost ([::1]:48448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ9jf-00086l-3z
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 01:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJ9gu-0004OQ-5t
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:48:32 -0500
Received: from mail-pg1-f177.google.com ([209.85.215.177]:33928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJ9gs-0007qF-Bu
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:48:31 -0500
Received: by mail-pg1-f177.google.com with SMTP id l2so5808445pgb.1
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 22:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xs2a0UjVEYDl/dxavkg+TRIMqJe8RB7eDD2ADiudMXg=;
 b=F34rbbQklUa7Zmj+JFrptfQMzEY7QkKPcFIv9arK8bXjx11atr9gKH5KWkMnMcaKXW
 U2Kik4OcvvtLOTuY2Q6t8iG4Qf2Ans+MsFmHyRhTfx5e41R8Ma2zzs6NV1Yl+8EopVW/
 Qbbsn/0VxBpntuVhUVyYWS9mx7muH3cgYrMo2dnXY5VAEz9I8Hi37cnn1+bdBb9eHCeG
 /cr3UjKADMBAok4WMFsZ8fI5MEbrK/gNukPdguURNVaZ5pCkl9datjzYlNdmhZ6xZfry
 KN9qHozcS6RCUVHr5znEVrd7HYlUxImPooYKFeNsDmbrxsZVcSFe9bxFHyP1K8EWMkDW
 EoGA==
X-Gm-Message-State: AOAM531a7EF0VETZ//COg1LU6O/lCROXYr41YQH+MQ5FrQ0Ma1YBB51q
 i1L8tp/NblKp5T50nVQpo5wlx6lAY2c=
X-Google-Smtp-Source: ABdhPJyv0YQm6d9ZG3kwCTTC9E1RynZXc31IPNIHk9DnvT3x6f1E8nRC0u0tZ3jMaINxwtGYtIbMdA==
X-Received: by 2002:a05:6a00:8d0:b029:1b6:3581:4f41 with SMTP id
 s16-20020a056a0008d0b02901b635814f41mr19368917pfu.56.1615186108781; 
 Sun, 07 Mar 2021 22:48:28 -0800 (PST)
Received: from localhost.localdomain ([73.93.155.14])
 by smtp.gmail.com with ESMTPSA id i17sm426943pfq.135.2021.03.07.22.48.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Mar 2021 22:48:28 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] slirp: feature detection for smbd
Date: Sun,  7 Mar 2021 22:48:21 -0800
Message-Id: <20210308064821.81427-5-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210308064821.81427-1-j@getutm.app>
References: <20210308064821.81427-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.177;
 envelope-from=osy86github@gmail.com; helo=mail-pg1-f177.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 Jason Wang <jasowang@redhat.com>, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace Windows specific macro with a more generic feature detection
macro. Allows slirp smb feature to be disabled manually as well.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure   | 26 +++++++++++++++++++++++---
 meson.build |  3 +++
 net/slirp.c | 16 ++++++++--------
 3 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 34fccaa2ba..8335a3e6a0 100755
--- a/configure
+++ b/configure
@@ -465,6 +465,7 @@ fuse_lseek="auto"
 multiprocess="auto"
 
 malloc_trim="auto"
+slirp_smbd="auto"
 
 # parse CC options second
 for opt do
@@ -834,8 +835,6 @@ do
     fi
 done
 
-: ${smbd=${SMBD-/usr/sbin/smbd}}
-
 # Default objcc to clang if available, otherwise use CC
 if has clang; then
   objcc=clang
@@ -1560,6 +1559,10 @@ for opt do
   ;;
   --disable-multiprocess) multiprocess="disabled"
   ;;
+  --enable-slirp-smbd) slirp_smbd=yes
+  ;;
+  --disable-slirp-smbd) slirp_smbd=no
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1913,6 +1916,7 @@ disabled with --disable-FEATURE, default is enabled if available
   fuse            FUSE block device export
   fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
   multiprocess    Out of process device emulation support
+  slirp-smbd      use smbd (at path --smbd=*) in slirp networking
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -5252,6 +5256,19 @@ case "$slirp" in
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
 
@@ -5527,7 +5544,10 @@ fi
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
index ba0db9fa1f..773ce512c7 100644
--- a/meson.build
+++ b/meson.build
@@ -2629,6 +2629,9 @@ summary_info += {'pixman':            pixman.found()}
 summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
 # TODO: add back version
 summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
+if slirp_opt != 'disabled' and 'CONFIG_SLIRP_SMBD' in config_host
+  summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
+endif
 summary_info += {'libtasn1':          config_host.has_key('CONFIG_TASN1')}
 summary_info += {'PAM':               config_host.has_key('CONFIG_AUTH_PAM')}
 summary_info += {'iconv support':     iconv.found()}
diff --git a/net/slirp.c b/net/slirp.c
index be914c0be0..b3ded2aac1 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -27,7 +27,7 @@
 #include "net/slirp.h"
 
 
-#ifndef _WIN32
+#if defined(CONFIG_SLIRP_SMBD)
 #include <pwd.h>
 #include <sys/wait.h>
 #endif
@@ -90,7 +90,7 @@ typedef struct SlirpState {
     Slirp *slirp;
     Notifier poll_notifier;
     Notifier exit_notifier;
-#ifndef _WIN32
+#if defined(CONFIG_SLIRP_SMBD)
     gchar *smb_dir;
 #endif
     GSList *fwd;
@@ -103,7 +103,7 @@ static QTAILQ_HEAD(, SlirpState) slirp_stacks =
 static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp);
 static int slirp_guestfwd(SlirpState *s, const char *config_str, Error **errp);
 
-#ifndef _WIN32
+#if defined(CONFIG_SLIRP_SMBD)
 static int slirp_smb(SlirpState *s, const char *exported_dir,
                      struct in_addr vserver_addr, Error **errp);
 static void slirp_smb_cleanup(SlirpState *s);
@@ -367,7 +367,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
     struct in6_addr ip6_prefix;
     struct in6_addr ip6_host;
     struct in6_addr ip6_dns;
-#ifndef _WIN32
+#if defined(CONFIG_SLIRP_SMBD)
     struct in_addr smbsrv = { .s_addr = 0 };
 #endif
     NetClientState *nc;
@@ -477,7 +477,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
         return -1;
     }
 
-#ifndef _WIN32
+#if defined(CONFIG_SLIRP_SMBD)
     if (vsmbserver && !inet_aton(vsmbserver, &smbsrv)) {
         error_setg(errp, "Failed to parse SMB address");
         return -1;
@@ -592,7 +592,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
             }
         }
     }
-#ifndef _WIN32
+#if defined(CONFIG_SLIRP_SMBD)
     if (smb_export) {
         if (slirp_smb(s, smb_export, smbsrv, errp) < 0) {
             goto error;
@@ -784,7 +784,7 @@ void hmp_hostfwd_add(Monitor *mon, const QDict *qdict)
 
 }
 
-#ifndef _WIN32
+#if defined(CONFIG_SLIRP_SMBD)
 
 /* automatic user mode samba server configuration */
 static void slirp_smb_cleanup(SlirpState *s)
@@ -899,7 +899,7 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
     return 0;
 }
 
-#endif /* !defined(_WIN32) */
+#endif /* defined(CONFIG_SLIRP_SMBD) */
 
 static int guestfwd_can_read(void *opaque)
 {
-- 
2.28.0


