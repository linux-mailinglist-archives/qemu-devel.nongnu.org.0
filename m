Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37419300D82
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:15:58 +0100 (CET)
Received: from localhost ([::1]:56660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l32qb-0001yB-4d
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:15:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mB-0004sO-Q1
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:23 -0500
Received: from mail-pg1-f169.google.com ([209.85.215.169]:40942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32m9-0004ap-Tx
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:23 -0500
Received: by mail-pg1-f169.google.com with SMTP id 15so4544095pgx.7
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:11:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yu6KCnRp4TF93vQKDhTQrY7grXtKJlR4pp+WyzMSBD0=;
 b=Whvj0R3PmeKXyPvnxeOafsT44umiA4AuLy+ua2/CCTJ19KdoAl7+oyQR95/7Zf7dY5
 CXgK6+ddowyah40btBLVALzlKPTM+2t0gyemEpmsRVNmiAbDdaTFMaghAa7ID5Mk+Fw4
 iSKV3lttKJHS9nqFOZW5VKTfJ+N9Vp5FqY+NYDl0DJBPjjW+c7mlI+9WakY72iJIV3zH
 aruLOj3EBSaDOsXpVI2SBVqB/alcbPcYmVsmlNta9KYs7jB5muKDtsau3Y90x4VULlfl
 uaXroMie+8ql1AewXQmCLbKO7e7DOVgSfnC01uAMriWxJ09cLADkq7ZGwqn7NiiH9w5e
 cYyA==
X-Gm-Message-State: AOAM533697Z0zkcj9ymmaI146ksxSpfDQ8FJx3SlzEALEcCF4MUMIMPP
 GQLFoOQo5GX1Diw/Fqpic1d+MPyh7hg=
X-Google-Smtp-Source: ABdhPJwA1FltyV8wseisPJjCuRclTVg/ZkGtl7aqy3CQsLDndYvfE7vPrf00pD5WYffVYr3Hb5QUeA==
X-Received: by 2002:a63:7885:: with SMTP id t127mr6302928pgc.15.1611346280342; 
 Fri, 22 Jan 2021 12:11:20 -0800 (PST)
Received: from localhost.localdomain ([73.93.152.129])
 by smtp.gmail.com with ESMTPSA id u12sm8741839pgi.91.2021.01.22.12.11.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 12:11:19 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/11] slirp: feature detection for smbd
Date: Fri, 22 Jan 2021 12:11:06 -0800
Message-Id: <20210122201113.63788-5-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210122201113.63788-1-j@getutm.app>
References: <20210122201113.63788-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.169;
 envelope-from=osy86github@gmail.com; helo=mail-pg1-f169.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
index 951de427bb..92da27846e 100755
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
@@ -5595,7 +5612,10 @@ fi
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
index 6c3ee7f8ca..9577138d7f 100644
--- a/meson.build
+++ b/meson.build
@@ -2331,7 +2331,7 @@ summary_info += {'sphinx-build':      sphinx_build.found()}
 summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
 # TODO: add back version
 summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
-if slirp_opt != 'disabled'
+if slirp_opt != 'disabled' and 'HAVE_HOST_SMBD' in config_host
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


