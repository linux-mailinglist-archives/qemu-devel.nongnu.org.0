Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C6F4B6836
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:53:24 +0100 (CET)
Received: from localhost ([::1]:47838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuWR-00010O-A5
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:53:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCX-0004iA-Db
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:50 -0500
Received: from [2a00:1450:4864:20::633] (port=39614
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCU-0008Uq-6K
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:48 -0500
Received: by mail-ej1-x633.google.com with SMTP id p9so20022179ejd.6
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ihAc++5heo7eP5Wr1bMFEBKai3oqyH5vKU1sZrECrA=;
 b=aanZSC85jUvaqCWyLZtJqQDtSPeN/XarHi8nnMJIhuD9Zld69FfNo3mWmrVr1nLewU
 r/pirPjykxJznnU238WUOO4q6sH2yQDldh9usxpBfOXjFpNb4lrKahMGQTM4qcfG42FJ
 1mbUs9Yu2bdk+wM9Si+sw+B+6uNtxn7e3Ynv0TCi+TsuplCZo/8yCazd0Pff5m+b4Md2
 Q1ItrZSNLla++lcJF83qB/KkV0ESEqveOB5h4jLA5QqdQ46pAJH3/WeR4SC0nx1JCln8
 H5dHFEBwrXE5S3jmWjvcqGBYjhz76Wpct0QkfTSsef7i+vAM3T7OBjDjhNg+SknW2UHD
 6k/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0ihAc++5heo7eP5Wr1bMFEBKai3oqyH5vKU1sZrECrA=;
 b=dWqY2xd2CMybrLEqQaIyxsmdls+IZMP4Y9Epz6hKWzMY5x27H1e7heKufK6ZzfRdK1
 3uuMRlDdo1IL+iytBhNux0w/OylSvwfEZlHAtQWSM4Iy6zczzbUZAVGJwpQUOfrSVm+e
 fyJbgRrwJ2woMlflJtxGCEY9O3zwmOFTZx6hNx7H4FF4UA448I37zZbcWDvJYSPayddf
 7+gR4Tdr41whAhBTpIbCidNqNGhszCLrDvhYwnmJ3IP9h64LLH7Rvr1fvDmdCqRgAX3M
 qDmEtytQT1B7EB/8sCR6His3CtIEtnkfVgTO+QTQLC5b5JYliDaTfyK/nbpf/0s7heoo
 7UbA==
X-Gm-Message-State: AOAM532hyO5OVn/omuVw5MOhy8pd2wD6cElshbCVo+Q9BfcQm3T4Wgbn
 1Uf3TGvOY8OxO093asRtyRiJCqjYEJI=
X-Google-Smtp-Source: ABdhPJyAYUeiUDmnWnFVNuRupfClmpjnYFdRaSNFBC+V8M1sNBJ07f+YUP82LXSXyEXjZc+ZzOd1/Q==
X-Received: by 2002:a17:906:7a09:: with SMTP id
 d9mr2140764ejo.103.1644917564872; 
 Tue, 15 Feb 2022 01:32:44 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/30] meson, configure: move ntddscsi API check to meson
Date: Tue, 15 Feb 2022 10:32:22 +0100
Message-Id: <20220215093223.110827-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure            | 23 -----------------------
 meson.build          | 18 +++++++++++++++++-
 qga/commands-win32.c |  6 +++---
 qga/meson.build      |  2 +-
 4 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/configure b/configure
index a518f51cef..3300231279 100755
--- a/configure
+++ b/configure
@@ -2268,26 +2268,6 @@ EOF
   fi
 fi
 
-##########################################
-# check if mingw environment provides a recent ntddscsi.h
-guest_agent_ntddscsi="no"
-if test "$mingw32" = "yes"; then
-  cat > $TMPC << EOF
-#include <windows.h>
-#include <ntddscsi.h>
-int main(void) {
-#if !defined(IOCTL_SCSI_GET_ADDRESS)
-#error Missing required ioctl definitions
-#endif
-  SCSI_ADDRESS addr = { .Lun = 0, .TargetId = 0, .PathId = 0 };
-  return addr.Lun;
-}
-EOF
-  if compile_prog "" "" ; then
-    guest_agent_ntddscsi=yes
-  fi
-fi
-
 ##########################################
 # capstone
 
@@ -2797,9 +2777,6 @@ if test "$debug_tcg" = "yes" ; then
 fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
-  if test "$guest_agent_ntddscsi" = "yes" ; then
-    echo "CONFIG_QGA_NTDDSCSI=y" >> $config_host_mak
-  fi
   echo "QEMU_GA_MSI_MINGW_DLL_PATH=${QEMU_GA_MSI_MINGW_DLL_PATH}" >> $config_host_mak
   echo "QEMU_GA_MANUFACTURER=${QEMU_GA_MANUFACTURER}" >> $config_host_mak
   echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO}" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 730e622417..129776c409 100644
--- a/meson.build
+++ b/meson.build
@@ -1944,6 +1944,22 @@ if targetos == 'windows' and link_language == 'cpp'
     int main(void) { return VSS_CTX_BACKUP; }''')
 endif
 
+have_ntddscsi = false
+if targetos == 'windows'
+  have_ntddscsi = cc.compiles('''
+    #include <windows.h>
+    #include <ntddscsi.h>
+    int main(void) {
+    #if !defined(IOCTL_SCSI_GET_ADDRESS)
+    #error Missing required ioctl definitions
+    #endif
+      SCSI_ADDRESS addr = { .Lun = 0, .TargetId = 0, .PathId = 0 };
+      return addr.Lun;
+    }
+''')
+endif
+config_host_data.set('HAVE_NTDDSCSI', have_ntddscsi)
+
 ignored = ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
     'HAVE_GDB_BIN']
 arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
@@ -3611,7 +3627,7 @@ summary_info += {'libnfs support':    libnfs}
 if targetos == 'windows'
   if have_ga
     summary_info += {'QGA VSS support':   have_qga_vss}
-    summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
+    summary_info += {'QGA w32 disk info': have_ntddscsi}
   endif
 endif
 summary_info += {'seccomp support':   seccomp}
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 484cb1c6bd..4fbbad793f 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -18,7 +18,7 @@
 #include <ws2tcpip.h>
 #include <iptypes.h>
 #include <iphlpapi.h>
-#ifdef CONFIG_QGA_NTDDSCSI
+#ifdef HAVE_NTDDSCSI
 #include <winioctl.h>
 #include <ntddscsi.h>
 #endif
@@ -474,7 +474,7 @@ void qmp_guest_file_flush(int64_t handle, Error **errp)
     }
 }
 
-#ifdef CONFIG_QGA_NTDDSCSI
+#ifdef HAVE_NTDDSCSI
 
 static GuestDiskBusType win2qemu[] = {
     [BusTypeUnknown] = GUEST_DISK_BUS_TYPE_UNKNOWN,
@@ -1111,7 +1111,7 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
     return NULL;
 }
 
-#endif /* CONFIG_QGA_NTDDSCSI */
+#endif /* HAVE_NTDDSCSI */
 
 static GuestFilesystemInfo *build_guest_fsinfo(char *guid, Error **errp)
 {
diff --git a/qga/meson.build b/qga/meson.build
index d22ecb4187..54f2da5b07 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -88,7 +88,7 @@ if targetos == 'windows'
     qga_libs += ['-lole32', '-loleaut32', '-lshlwapi', '-lstdc++', '-Wl,--enable-stdcall-fixup']
     subdir('vss-win32')
   endif
-  if 'CONFIG_QGA_NTDDSCSI' in config_host
+  if have_ntddscsi
     qga_libs += ['-lsetupapi', '-lcfgmgr32']
   endif
 endif
-- 
2.34.1



