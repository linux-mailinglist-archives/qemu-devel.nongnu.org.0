Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CB3506546
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:02:41 +0200 (CEST)
Received: from localhost ([::1]:55736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghsm-0008Jg-A0
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmC-0001Dk-E3
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:49 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmA-0004TQ-Qd
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:48 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c10so20948018wrb.1
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kl8IX74OTo7GTTHk6BNrBLGVZ9mjRMnlGcuPcCqJOOo=;
 b=SOKPoivQBGZZlq24qX6jacXx+0wtIA106ltjOd3tBB2fMkxD56GO1dzWGSbRiuRqsa
 uV26ANaH7CIN1KtXfe8BxCXqflDtLdroCKbKFXUvU/2tUwzxw/q6sc1VbYNk21KqcHjT
 9uf+1v7b1ive85Pmi9hc+qSo5FRbLoke8WEOMkBI42t0UNPLos3b0b/st5FCpLW5ZLyf
 1Er2L+KaDTwpd/n1NRjLYJCwys1DbBQDxEvuwsn5Ey+TF0DAGprjyV8Z3hziDPODULC+
 L34lPcnYTkZViwxVWTG4eabEjSWhe054yrlYlRRVYXS0qP1bvbMTSLAT6+r+iR8S/xZ/
 oG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Kl8IX74OTo7GTTHk6BNrBLGVZ9mjRMnlGcuPcCqJOOo=;
 b=Wq6sSn2wBt28dKinhGcidCgP5DoZCkmFDh4PHwvLVIAONHbORkJECu+NuvgzDHpnic
 N5EGqSPdqUVFuf4Ri8wnKrRoK0vEDva91QF9V7IDngG41UdHiBUgOYN3TiGNGwt94sQV
 3brNAbEHwpOTmznE7YbJLFvvlIPW8asGxsSI9RnJLdkmc7+2y7GajKO4RI4rUfrqFp71
 z4GkS1JNBg0oDl6xY9LiKD7bcx2oX2jUTuXdlxhJRWz9ICbODguXvJ1d7bJXY26eSLUC
 gHFbrXxSFAXaQ1gadtkx/TnHjYMM2xJmKBrk/ZJ+xYWYVPrTourJEliiFqHBzlL+GyyE
 FZZw==
X-Gm-Message-State: AOAM530Vml7qhXEAbnLicp7sCqSct7iJQ3YmGRgqWgfJ+2wHJpmdvpOu
 BYgj+USd1aSvrzJRcnxCWFFU1gDS1Qh9kA==
X-Google-Smtp-Source: ABdhPJzEjItD6bewZSs5nOP5fDSmicT07NyeNyMj41fcKSUnPI2CRTMyQgWFFdn6kMuOEtKuvzn8+w==
X-Received: by 2002:a05:6000:2ac:b0:20a:7732:4bb6 with SMTP id
 l12-20020a05600002ac00b0020a77324bb6mr10760102wry.538.1650347505327; 
 Mon, 18 Apr 2022 22:51:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/53] build-sys: drop ntddscsi.h check
Date: Tue, 19 Apr 2022 07:50:53 +0200
Message-Id: <20220419055109.142788-38-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The header has been part of MinGW-w64 since the introduction of the
project (2007). While on MinGW(32), the legacy project, it was imported
in 2014 from w32api-3.17 (commit e4803e0da2).

According to build-platform.rst and our CI coverage, we only support
building with MinGW-w64 (from Debian/Fedora).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Message-Id: <20220401085106.2167374-1-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build          | 17 -----------------
 qga/commands-win32.c | 19 -------------------
 qga/meson.build      |  6 ++----
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/meson.build b/meson.build
index a0b6de255c..d92b633c5d 100644
--- a/meson.build
+++ b/meson.build
@@ -2019,22 +2019,6 @@ if targetos == 'windows' and link_language == 'cpp'
 endif
 config_host_data.set('HAVE_VSS_SDK', have_vss_sdk)
 
-have_ntddscsi = false
-if targetos == 'windows'
-  have_ntddscsi = cc.compiles('''
-    #include <windows.h>
-    #include <ntddscsi.h>
-    int main(void) {
-    #if !defined(IOCTL_SCSI_GET_ADDRESS)
-    #error Missing required ioctl definitions
-    #endif
-      SCSI_ADDRESS addr = { .Lun = 0, .TargetId = 0, .PathId = 0 };
-      return addr.Lun;
-    }
-''')
-endif
-config_host_data.set('HAVE_NTDDSCSI', have_ntddscsi)
-
 ignored = ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
     'HAVE_GDB_BIN']
 arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
@@ -3722,7 +3706,6 @@ summary_info += {'libnfs support':    libnfs}
 if targetos == 'windows'
   if have_ga
     summary_info += {'QGA VSS support':   have_qga_vss}
-    summary_info += {'QGA w32 disk info': have_ntddscsi}
   endif
 endif
 summary_info += {'seccomp support':   seccomp}
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 15b451f0a4..406e4072a0 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -18,10 +18,8 @@
 #include <ws2tcpip.h>
 #include <iptypes.h>
 #include <iphlpapi.h>
-#ifdef HAVE_NTDDSCSI
 #include <winioctl.h>
 #include <ntddscsi.h>
-#endif
 #include <setupapi.h>
 #include <cfgmgr32.h>
 #include <initguid.h>
@@ -474,8 +472,6 @@ void qmp_guest_file_flush(int64_t handle, Error **errp)
     }
 }
 
-#ifdef HAVE_NTDDSCSI
-
 static GuestDiskBusType win2qemu[] = {
     [BusTypeUnknown] = GUEST_DISK_BUS_TYPE_UNKNOWN,
     [BusTypeScsi] = GUEST_DISK_BUS_TYPE_SCSI,
@@ -1098,21 +1094,6 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
     return ret;
 }
 
-#else
-
-static GuestDiskAddressList *build_guest_disk_info(char *guid, Error **errp)
-{
-    return NULL;
-}
-
-GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
-{
-    error_setg(errp, QERR_UNSUPPORTED);
-    return NULL;
-}
-
-#endif /* HAVE_NTDDSCSI */
-
 static GuestFilesystemInfo *build_guest_fsinfo(char *guid, Error **errp)
 {
     DWORD info_size;
diff --git a/qga/meson.build b/qga/meson.build
index 62472747f1..392d560941 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -83,14 +83,12 @@ qga_ss = qga_ss.apply(config_host, strict: false)
 gen_tlb = []
 qga_libs = []
 if targetos == 'windows'
-  qga_libs += ['-lws2_32', '-lwinmm', '-lpowrprof', '-lwtsapi32', '-lwininet', '-liphlpapi', '-lnetapi32']
+  qga_libs += ['-lws2_32', '-lwinmm', '-lpowrprof', '-lwtsapi32', '-lwininet', '-liphlpapi', '-lnetapi32',
+               '-lsetupapi', '-lcfgmgr32']
   if have_qga_vss
     qga_libs += ['-lole32', '-loleaut32', '-lshlwapi', '-lstdc++', '-Wl,--enable-stdcall-fixup']
     subdir('vss-win32')
   endif
-  if have_ntddscsi
-    qga_libs += ['-lsetupapi', '-lcfgmgr32']
-  endif
 endif
 
 qga = executable('qemu-ga', qga_ss.sources(),
-- 
2.35.1



