Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7372333C5C5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:35:38 +0100 (CET)
Received: from localhost ([::1]:47846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLs41-0007Mz-EH
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lLrZI-0002dk-OJ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:52 -0400
Received: from mail-pj1-f44.google.com ([209.85.216.44]:50782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lLrZG-0000sL-NC
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:52 -0400
Received: by mail-pj1-f44.google.com with SMTP id gb6so9232225pjb.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UlNk3VmiVhHOUjDbi+C6ukV9Ev85CAPrYpeZZndNefY=;
 b=qloSYuc2xbKKaypI4rMzMmR1JH+5GvSUIgthxhKlUiWErGgr/V7HiJtKw7ZFVFJ4V8
 hPrjx75pK1nDnjUM69Ai8FwQzeexDv9LE6NUg45svOdmNTTYpQbS4fpTFV3Amo+yM0hZ
 DKUFNTPlO8uqh5PwnS32aUj4HAx6LejxU2Ig4XxkIuVsSrISUifYMXclB1BXlKhFCp+Q
 YsYpY18cogcRBTlNSh3fVtdRpmtUj4xbogHnWyvoD39AmQixftRYgEMPXuJISfNyMuUF
 AlKGAJrJge2txtcwudQN9CgjZlrG1OLrmvkViH+ShuTfwNOp0SQQWkakN588Rm2If0qL
 gJvw==
X-Gm-Message-State: AOAM530qgejxtdlSeFIIY38OJGUTaLKOvza53kI2sXGa9xQPCoK9sNEE
 SZrHH+Ck0b2o5XtkZA7VVjSjoso9eag=
X-Google-Smtp-Source: ABdhPJz8L417lEoskluSgmA/LuWCbRyJa3yy7gDYvkFHhpxwd1tiSUHCup/Ykfd7QUCJ8DRwSyrs+g==
X-Received: by 2002:a17:90a:9f4a:: with SMTP id
 q10mr281425pjv.113.1615831429193; 
 Mon, 15 Mar 2021 11:03:49 -0700 (PDT)
Received: from localhost.localdomain ([73.93.153.95])
 by smtp.gmail.com with ESMTPSA id y194sm14267842pfb.21.2021.03.15.11.03.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Mar 2021 11:03:48 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] slirp: feature detection for smbd
Date: Mon, 15 Mar 2021 11:03:41 -0700
Message-Id: <20210315180341.31638-5-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210315180341.31638-1-j@getutm.app>
References: <20210315180341.31638-1-j@getutm.app>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.44; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f44.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
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
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace Windows specific macro with a more generic feature detection
macro. Allows slirp smb feature to be disabled manually as well.

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure   | 26 +++++++++++++++++++++++---
 meson.build |  2 +-
 net/slirp.c | 16 ++++++++--------
 3 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/configure b/configure
index f7d022a5db..7d765639e6 100755
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
index 2c01e2494c..7ebaa4d4b0 100644
--- a/meson.build
+++ b/meson.build
@@ -2437,7 +2437,7 @@ summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
 if targetos == 'windows' and config_host.has_key('CONFIG_GUEST_AGENT')
   summary_info += {'wixl':            wixl.found() ? wixl.full_path() : false}
 endif
-if slirp_opt != 'disabled'
+if slirp_opt != 'disabled' and 'CONFIG_SLIRP_SMBD' in config_host
   summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
 endif
 summary(summary_info, bool_yn: true, section: 'Host binaries')
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


