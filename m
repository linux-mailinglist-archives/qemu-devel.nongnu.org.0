Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570FE30315B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 02:38:26 +0100 (CET)
Received: from localhost ([::1]:59606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4DJJ-0006g9-Cp
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 20:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6V-0005ex-BG
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:13 -0500
Received: from mail-pg1-f176.google.com ([209.85.215.176]:39987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6R-0006A6-9K
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:10 -0500
Received: by mail-pg1-f176.google.com with SMTP id b21so3349919pgk.7
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 17:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t/s7LuKyWj4qS9lc8M/U0JqbBc0yM+MKS6B5tjJBzrs=;
 b=PCvg5em+KKJtp/hS7ijSagLFGKI8NU/8NuevmVZkqYjeRRjj9XNzL57NyzYW5dNFrL
 dOqFXV6MmFsgavGN6iweai98RTWCqxHETJPOjKEhbS0zjYLjlI8rPYLGUZjn1l5UXKE6
 2YOEL6VjjNTzw30g7KybGYiVIsLLyytlJUE4sPhKMWBJ7M/Z7SO8MwF44th2lcRuqnat
 cbDtT++Nqqz+aKXR3j7ab2hPXI2Onl+sNDPOdfGn2hmhyB4zudPniYjtcQgEixKp5pEX
 ZBu8n3kez8IT8BURBuHcC1AX+Ya4uD5wHlNcwlGcPUnB0k9zGQ3/oMUXeshx6tQt0nP8
 LMAg==
X-Gm-Message-State: AOAM53218Lu9aWij55GiuedB5GhFQKjPSnzDBoMxPTEzoC4WlYWqKS8W
 xEnD9C5M9VesGoPZJDUq0i05EtdFDTs=
X-Google-Smtp-Source: ABdhPJz1JcDqyMEUpNa+xSKgyEPYy+whh1pNKabLi530dX5qIl1rQEPOaZ+q9oSHCvDsQAz8usAQaA==
X-Received: by 2002:a05:6a00:8d0:b029:1b6:3581:4f41 with SMTP id
 s16-20020a056a0008d0b02901b635814f41mr2836117pfu.56.1611624303912; 
 Mon, 25 Jan 2021 17:25:03 -0800 (PST)
Received: from Yifans-Mac-Mini.hsd1.ca.comcast.net. ([98.35.5.7])
 by smtp.gmail.com with ESMTPSA id o14sm536921pjf.12.2021.01.25.17.25.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 17:25:03 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 04/11] slirp: feature detection for smbd
Date: Mon, 25 Jan 2021 17:24:50 -0800
Message-Id: <20210126012457.39046-5-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126012457.39046-1-j@getutm.app>
References: <20210126012457.39046-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.176;
 envelope-from=osy86github@gmail.com; helo=mail-pg1-f176.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 configure   | 22 +++++++++++++++++++++-
 meson.build |  2 +-
 net/slirp.c | 16 ++++++++--------
 3 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index 8d8a4733d7..d72ab22da5 100755
--- a/configure
+++ b/configure
@@ -464,6 +464,7 @@ fuse="auto"
 fuse_lseek="auto"
 
 malloc_trim="auto"
+slirp_smbd="auto"
 
 # parse CC options second
 for opt do
@@ -845,7 +846,18 @@ do
     fi
 done
 
+# Check for smbd dupport
 : ${smbd=${SMBD-/usr/sbin/smbd}}
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
 
 # Default objcc to clang if available, otherwise use CC
 if has clang; then
@@ -1560,6 +1572,10 @@ for opt do
   ;;
   --disable-fuse-lseek) fuse_lseek="disabled"
   ;;
+  --enable-slirp-smbd) slirp_smbd=yes
+  ;;
+  --disable-slirp-smbd) slirp_smbd=no
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1899,6 +1915,7 @@ disabled with --disable-FEATURE, default is enabled if available
   libdaxctl       libdaxctl support
   fuse            FUSE block device export
   fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
+  slirp-smbd      use smbd (at path --smbd=*) in slirp networking
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -5573,7 +5590,10 @@ fi
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
index 6818d97df5..f1e67b8cd1 100644
--- a/meson.build
+++ b/meson.build
@@ -2336,7 +2336,7 @@ summary_info += {'sphinx-build':      sphinx_build.found()}
 summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
 # TODO: add back version
 summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
-if slirp_opt != 'disabled'
+if slirp_opt != 'disabled' and 'CONFIG_SLIRP_SMBD' in config_host
   summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
 endif
 summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
diff --git a/net/slirp.c b/net/slirp.c
index 8350c6d45f..4348e74805 100644
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


