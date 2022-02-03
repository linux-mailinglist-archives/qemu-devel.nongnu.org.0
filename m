Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89734A8B26
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:04:57 +0100 (CET)
Received: from localhost ([::1]:51614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgTY-0000EW-Es
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:04:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0R-0005GB-Vm
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:52 -0500
Received: from [2a00:1450:4864:20::52b] (port=43736
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0K-0008Jf-Lh
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:51 -0500
Received: by mail-ed1-x52b.google.com with SMTP id w14so7516957edd.10
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n8xJYfhxR3Kdv2pm/FVJvVakuKw2TgMg6YN47lqrIQU=;
 b=Jh0U/7YhdsdV8XunlVB16pVb7Irg3vB1DaazSPsuVy/Fy8uGN/mjSJU8NCNWcSt3Dh
 M4AaoBnfV585vg9WrlWT5jVQjmaP2OAqur7ViHdUP5yru9WxUWFt6My1eJgcyqGUqzEc
 ibK8HyNaMT01yzFvgWevqJryJZqnCAtYvP1CmHwFt2dmvo1vvXO2mwZnlNfDFLG4nRMo
 UGCudgIZqIt7E32/PvfxgmECIxSqu3syxEmmT7kmgFPngZ5XTUS+FcdeBooPN3Fx/cV5
 SwO1P5lo9X8m3DCbNsBe4dp5r2eKtEXjTxrpLkcy66kgq8itTlzLZFXH2xyWmv7GbK9k
 aa9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n8xJYfhxR3Kdv2pm/FVJvVakuKw2TgMg6YN47lqrIQU=;
 b=BBnw7C/F80RchFyw8eJ9pxbWocVZkdW17NykgUUHpB8MXbOQXNG4y4x1ZUna9UdaeR
 yuOpCMTE+TKPo7YT/WM14gd+PsQt9qbLYzSENV867uTmst0JceG3MgyrSSR9YXx2fhW6
 YSKDR1IohZqEizz5NAO9uJjIj0gyxzjGT9ViA6ExySSqxKIMXAehP6yIR78kSZzcSbAt
 p6VqKwvoK8bpL1UlobR0A62q5a1v0iG8TSvuztAlZmeUKhXhR2Kf8J/7pi2lsahOosxn
 CcPxR+AOAqpkz1odnypPsTpqqLyP2HbjpUXIMDfKgr8Q0TVaVGtSrVVFe3/n+QjuMtlD
 Nwfg==
X-Gm-Message-State: AOAM531ZdUkMIfz2VQvcQSr1rx1QIL83DPMgCevsYwMjzM3k9dIVyKvB
 ljvyV2y+vWOSxtQM0hsGc53d4vVmdAQ=
X-Google-Smtp-Source: ABdhPJxCIqO0jzlLseBTZCU4mOkYVX/3m9Y+d268ejY+qswrsO6Vh8vDfK8Fp32rKrp/KzuAJVQlRg==
X-Received: by 2002:a05:6402:5188:: with SMTP id
 q8mr35990853edd.173.1643909660319; 
 Thu, 03 Feb 2022 09:34:20 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/27] meson, configure: move ntddscsi API check to meson
Date: Thu,  3 Feb 2022 18:33:58 +0100
Message-Id: <20220203173359.292068-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure            | 23 -----------------------
 meson.build          | 18 +++++++++++++++++-
 qga/commands-win32.c |  6 +++---
 qga/meson.build      |  2 +-
 4 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/configure b/configure
index f67088044f..f6b9e5a1cd 100755
--- a/configure
+++ b/configure
@@ -2289,26 +2289,6 @@ EOF
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
 
@@ -2818,9 +2798,6 @@ if test "$debug_tcg" = "yes" ; then
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
index 999d2c8bd1..98e795d21a 100644
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
@@ -3615,7 +3631,7 @@ summary_info += {'libnfs support':    libnfs}
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
index 8c177435ac..fe0bfc295f 100644
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



