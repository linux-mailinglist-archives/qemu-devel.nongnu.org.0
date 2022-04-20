Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C1B508CD6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:09:21 +0200 (CEST)
Received: from localhost ([::1]:49904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCtL-0004PL-Tf
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLj-0001Tv-IU
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:35 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLg-0000wU-SV
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:35 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bv16so2767417wrb.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oO9ZTeeQU7cn0uqWTOuAehkK0lhF2o7wsmIifpDsN0M=;
 b=HvuZGiTDrmIIoEl16hHPRmVfJupEd+xNfLIelmGXdd98VOICdHiY8ZQRFMsm7WK87X
 lWxILV5ZID35TmaxfTRce8G61XfDQpVSQJXSP6WfFb9lGr1ejrfT/Ob5r2n5S0MZlNuJ
 /nTX5IUGWdB8uP9gRwdRtw+LVQruW+79hFGY9/Xp6bywZOJSFw7wQ1Noyx1pTRjede5I
 xGnBsaXVYQbVtjZj7Inhn4pGRm0m08VxpB72tlyBgviZrjrVdD8ntupVkC7gsBF2lX03
 2WoO6rThhy7VohBSeNM7b4w5qBwEC69P+NY5crjJT9agG1/D+8lOJgzSivH1fxxsY4+Y
 wCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oO9ZTeeQU7cn0uqWTOuAehkK0lhF2o7wsmIifpDsN0M=;
 b=aHeF4GUlNHHyDNjxAS1sDWRGHOTu1w7fVKRIIMPUHgykM52qBLugNaE3I4MTj02O4C
 R7GNfNllTyPm5kJjjXrHGbKSthFAsaThAjgwYF38qc2HSGvY18fOdRGoG1ABaCA3VFl6
 1VMzd0Hpk4C4nOGg84bay09Fed/3A0uBMOK2WI/6emeLduUGf7PK3r0460DBCPl4IqHn
 h8NOn1TgkPxe+OCPRXAj4OAAKqp/vYln1amrLzR3QApNNLxN/id1x/LrOUD0p5/tXKJa
 ABpDsoMTDNAx/qrKrfM611qEaFGj6cjIjJ7cEmDNulq9p8412mO4TtAXp5L5ctfOvJly
 K3tA==
X-Gm-Message-State: AOAM5323VNIJCeY1Tw6XTAnt8Rr1naQ+9b6HQfSUkPZtrFra6brJC3qk
 ZisYFa/a41NFlZa9Dll6r8CwudPQ6ZVrCQ==
X-Google-Smtp-Source: ABdhPJxO/C/w+4S63hpi64KGPEzWjbxzNv+TGWwl4jC6Q/PsajO0n3mtCbg4SGRoHYnV67sDH88tsw==
X-Received: by 2002:a5d:6da9:0:b0:20a:8d08:9977 with SMTP id
 u9-20020a5d6da9000000b0020a8d089977mr13947909wrs.24.1650468870856; 
 Wed, 20 Apr 2022 08:34:30 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/34] meson, configure: move Xen detection to meson
Date: Wed, 20 Apr 2022 17:33:47 +0200
Message-Id: <20220420153407.73926-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is quite a complicated check.  I moved all the test programs to
a single file in scripts/, picking the right program with #if and a -D
flag in meson.build's cc.links() invocation.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure            | 322 +------------------------------------------
 meson.build          | 114 ++++++++++++---
 scripts/xen-detect.c | 203 +++++++++++++++++++++++++++
 3 files changed, 297 insertions(+), 342 deletions(-)
 create mode 100644 scripts/xen-detect.c

diff --git a/configure b/configure
index d4d51eff06..11d3cc19ca 100755
--- a/configure
+++ b/configure
@@ -292,7 +292,6 @@ EXTRA_CXXFLAGS=""
 EXTRA_OBJCFLAGS=""
 EXTRA_LDFLAGS=""
 
-xen_ctrl_version="$default_feature"
 vhost_kernel="$default_feature"
 vhost_net="$default_feature"
 vhost_crypto="$default_feature"
@@ -346,9 +345,6 @@ default_devices="true"
 tcg="enabled"
 cfi="false"
 
-# 4. Detection partly done in configure
-xen=${default_feature:+disabled}
-
 # parse CC options second
 for opt do
   optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
@@ -866,10 +862,6 @@ for opt do
   ;;
   --enable-slirp=*) slirp="$optarg"
   ;;
-  --disable-xen) xen="disabled"
-  ;;
-  --enable-xen) xen="enabled"
-  ;;
   --disable-tcg) tcg="disabled"
                  plugins="no"
   ;;
@@ -1697,312 +1689,6 @@ if ! has "$pkg_config_exe"; then
   error_exit "pkg-config binary '$pkg_config_exe' not found"
 fi
 
-##########################################
-# xen probe
-
-if test "$xen" != "disabled" ; then
-  # Check whether Xen library path is specified via --extra-ldflags to avoid
-  # overriding this setting with pkg-config output. If not, try pkg-config
-  # to obtain all needed flags.
-
-  if ! echo $EXTRA_LDFLAGS | grep tools/libxc > /dev/null && \
-     $pkg_config --exists xencontrol ; then
-    xen_ctrl_version="$(printf '%d%02d%02d' \
-      $($pkg_config --modversion xencontrol | sed 's/\./ /g') )"
-    xen=enabled
-    xen_pc="xencontrol xenstore xenforeignmemory xengnttab"
-    xen_pc="$xen_pc xenevtchn xendevicemodel"
-    if $pkg_config --exists xentoolcore; then
-      xen_pc="$xen_pc xentoolcore"
-    fi
-    xen_cflags="$($pkg_config --cflags $xen_pc)"
-    xen_libs="$($pkg_config --libs $xen_pc)"
-  else
-
-    xen_libs="-lxenstore -lxenctrl"
-    xen_stable_libs="-lxenforeignmemory -lxengnttab -lxenevtchn"
-
-    # First we test whether Xen headers and libraries are available.
-    # If no, we are done and there is no Xen support.
-    # If yes, more tests are run to detect the Xen version.
-
-    # Xen (any)
-    cat > $TMPC <<EOF
-#include <xenctrl.h>
-int main(void) {
-  return 0;
-}
-EOF
-    if ! compile_prog "" "$xen_libs" ; then
-      # Xen not found
-      if test "$xen" = "enabled" ; then
-        feature_not_found "xen" "Install xen devel"
-      fi
-      xen=disabled
-
-    # Xen unstable
-    elif
-        cat > $TMPC <<EOF &&
-#undef XC_WANT_COMPAT_DEVICEMODEL_API
-#define __XEN_TOOLS__
-#include <xendevicemodel.h>
-#include <xenforeignmemory.h>
-int main(void) {
-  xendevicemodel_handle *xd;
-  xenforeignmemory_handle *xfmem;
-
-  xd = xendevicemodel_open(0, 0);
-  xendevicemodel_pin_memory_cacheattr(xd, 0, 0, 0, 0);
-
-  xfmem = xenforeignmemory_open(0, 0);
-  xenforeignmemory_map_resource(xfmem, 0, 0, 0, 0, 0, NULL, 0, 0);
-
-  return 0;
-}
-EOF
-        compile_prog "" "$xen_libs -lxendevicemodel $xen_stable_libs -lxentoolcore"
-      then
-      xen_stable_libs="-lxendevicemodel $xen_stable_libs -lxentoolcore"
-      xen_ctrl_version=41100
-      xen=enabled
-    elif
-        cat > $TMPC <<EOF &&
-#undef XC_WANT_COMPAT_MAP_FOREIGN_API
-#include <xenforeignmemory.h>
-#include <xentoolcore.h>
-int main(void) {
-  xenforeignmemory_handle *xfmem;
-
-  xfmem = xenforeignmemory_open(0, 0);
-  xenforeignmemory_map2(xfmem, 0, 0, 0, 0, 0, 0, 0);
-  xentoolcore_restrict_all(0);
-
-  return 0;
-}
-EOF
-        compile_prog "" "$xen_libs -lxendevicemodel $xen_stable_libs -lxentoolcore"
-      then
-      xen_stable_libs="-lxendevicemodel $xen_stable_libs -lxentoolcore"
-      xen_ctrl_version=41000
-      xen=enabled
-    elif
-        cat > $TMPC <<EOF &&
-#undef XC_WANT_COMPAT_DEVICEMODEL_API
-#define __XEN_TOOLS__
-#include <xendevicemodel.h>
-int main(void) {
-  xendevicemodel_handle *xd;
-
-  xd = xendevicemodel_open(0, 0);
-  xendevicemodel_close(xd);
-
-  return 0;
-}
-EOF
-        compile_prog "" "$xen_libs -lxendevicemodel $xen_stable_libs"
-      then
-      xen_stable_libs="-lxendevicemodel $xen_stable_libs"
-      xen_ctrl_version=40900
-      xen=enabled
-    elif
-        cat > $TMPC <<EOF &&
-/*
- * If we have stable libs the we don't want the libxc compat
- * layers, regardless of what CFLAGS we may have been given.
- *
- * Also, check if xengnttab_grant_copy_segment_t is defined and
- * grant copy operation is implemented.
- */
-#undef XC_WANT_COMPAT_EVTCHN_API
-#undef XC_WANT_COMPAT_GNTTAB_API
-#undef XC_WANT_COMPAT_MAP_FOREIGN_API
-#include <xenctrl.h>
-#include <xenstore.h>
-#include <xenevtchn.h>
-#include <xengnttab.h>
-#include <xenforeignmemory.h>
-#include <stdint.h>
-#include <xen/hvm/hvm_info_table.h>
-#if !defined(HVM_MAX_VCPUS)
-# error HVM_MAX_VCPUS not defined
-#endif
-int main(void) {
-  xc_interface *xc = NULL;
-  xenforeignmemory_handle *xfmem;
-  xenevtchn_handle *xe;
-  xengnttab_handle *xg;
-  xengnttab_grant_copy_segment_t* seg = NULL;
-
-  xs_daemon_open();
-
-  xc = xc_interface_open(0, 0, 0);
-  xc_hvm_set_mem_type(0, 0, HVMMEM_ram_ro, 0, 0);
-  xc_domain_add_to_physmap(0, 0, XENMAPSPACE_gmfn, 0, 0);
-  xc_hvm_inject_msi(xc, 0, 0xf0000000, 0x00000000);
-  xc_hvm_create_ioreq_server(xc, 0, HVM_IOREQSRV_BUFIOREQ_ATOMIC, NULL);
-
-  xfmem = xenforeignmemory_open(0, 0);
-  xenforeignmemory_map(xfmem, 0, 0, 0, 0, 0);
-
-  xe = xenevtchn_open(0, 0);
-  xenevtchn_fd(xe);
-
-  xg = xengnttab_open(0, 0);
-  xengnttab_grant_copy(xg, 0, seg);
-
-  return 0;
-}
-EOF
-        compile_prog "" "$xen_libs $xen_stable_libs"
-      then
-      xen_ctrl_version=40800
-      xen=enabled
-    elif
-        cat > $TMPC <<EOF &&
-/*
- * If we have stable libs the we don't want the libxc compat
- * layers, regardless of what CFLAGS we may have been given.
- */
-#undef XC_WANT_COMPAT_EVTCHN_API
-#undef XC_WANT_COMPAT_GNTTAB_API
-#undef XC_WANT_COMPAT_MAP_FOREIGN_API
-#include <xenctrl.h>
-#include <xenstore.h>
-#include <xenevtchn.h>
-#include <xengnttab.h>
-#include <xenforeignmemory.h>
-#include <stdint.h>
-#include <xen/hvm/hvm_info_table.h>
-#if !defined(HVM_MAX_VCPUS)
-# error HVM_MAX_VCPUS not defined
-#endif
-int main(void) {
-  xc_interface *xc = NULL;
-  xenforeignmemory_handle *xfmem;
-  xenevtchn_handle *xe;
-  xengnttab_handle *xg;
-
-  xs_daemon_open();
-
-  xc = xc_interface_open(0, 0, 0);
-  xc_hvm_set_mem_type(0, 0, HVMMEM_ram_ro, 0, 0);
-  xc_domain_add_to_physmap(0, 0, XENMAPSPACE_gmfn, 0, 0);
-  xc_hvm_inject_msi(xc, 0, 0xf0000000, 0x00000000);
-  xc_hvm_create_ioreq_server(xc, 0, HVM_IOREQSRV_BUFIOREQ_ATOMIC, NULL);
-
-  xfmem = xenforeignmemory_open(0, 0);
-  xenforeignmemory_map(xfmem, 0, 0, 0, 0, 0);
-
-  xe = xenevtchn_open(0, 0);
-  xenevtchn_fd(xe);
-
-  xg = xengnttab_open(0, 0);
-  xengnttab_map_grant_ref(xg, 0, 0, 0);
-
-  return 0;
-}
-EOF
-        compile_prog "" "$xen_libs $xen_stable_libs"
-      then
-      xen_ctrl_version=40701
-      xen=enabled
-
-    # Xen 4.6
-    elif
-        cat > $TMPC <<EOF &&
-#include <xenctrl.h>
-#include <xenstore.h>
-#include <stdint.h>
-#include <xen/hvm/hvm_info_table.h>
-#if !defined(HVM_MAX_VCPUS)
-# error HVM_MAX_VCPUS not defined
-#endif
-int main(void) {
-  xc_interface *xc;
-  xs_daemon_open();
-  xc = xc_interface_open(0, 0, 0);
-  xc_hvm_set_mem_type(0, 0, HVMMEM_ram_ro, 0, 0);
-  xc_gnttab_open(NULL, 0);
-  xc_domain_add_to_physmap(0, 0, XENMAPSPACE_gmfn, 0, 0);
-  xc_hvm_inject_msi(xc, 0, 0xf0000000, 0x00000000);
-  xc_hvm_create_ioreq_server(xc, 0, HVM_IOREQSRV_BUFIOREQ_ATOMIC, NULL);
-  xc_reserved_device_memory_map(xc, 0, 0, 0, 0, NULL, 0);
-  return 0;
-}
-EOF
-        compile_prog "" "$xen_libs"
-      then
-      xen_ctrl_version=40600
-      xen=enabled
-
-    # Xen 4.5
-    elif
-        cat > $TMPC <<EOF &&
-#include <xenctrl.h>
-#include <xenstore.h>
-#include <stdint.h>
-#include <xen/hvm/hvm_info_table.h>
-#if !defined(HVM_MAX_VCPUS)
-# error HVM_MAX_VCPUS not defined
-#endif
-int main(void) {
-  xc_interface *xc;
-  xs_daemon_open();
-  xc = xc_interface_open(0, 0, 0);
-  xc_hvm_set_mem_type(0, 0, HVMMEM_ram_ro, 0, 0);
-  xc_gnttab_open(NULL, 0);
-  xc_domain_add_to_physmap(0, 0, XENMAPSPACE_gmfn, 0, 0);
-  xc_hvm_inject_msi(xc, 0, 0xf0000000, 0x00000000);
-  xc_hvm_create_ioreq_server(xc, 0, 0, NULL);
-  return 0;
-}
-EOF
-        compile_prog "" "$xen_libs"
-      then
-      xen_ctrl_version=40500
-      xen=enabled
-
-    elif
-        cat > $TMPC <<EOF &&
-#include <xenctrl.h>
-#include <xenstore.h>
-#include <stdint.h>
-#include <xen/hvm/hvm_info_table.h>
-#if !defined(HVM_MAX_VCPUS)
-# error HVM_MAX_VCPUS not defined
-#endif
-int main(void) {
-  xc_interface *xc;
-  xs_daemon_open();
-  xc = xc_interface_open(0, 0, 0);
-  xc_hvm_set_mem_type(0, 0, HVMMEM_ram_ro, 0, 0);
-  xc_gnttab_open(NULL, 0);
-  xc_domain_add_to_physmap(0, 0, XENMAPSPACE_gmfn, 0, 0);
-  xc_hvm_inject_msi(xc, 0, 0xf0000000, 0x00000000);
-  return 0;
-}
-EOF
-        compile_prog "" "$xen_libs"
-      then
-      xen_ctrl_version=40200
-      xen=enabled
-
-    else
-      if test "$xen" = "enabled" ; then
-        feature_not_found "xen (unsupported version)" \
-                          "Install a supported xen (xen 4.2 or newer)"
-      fi
-      xen=disabled
-    fi
-
-    if test "$xen" = enabled; then
-      if test $xen_ctrl_version -ge 40701  ; then
-        xen_libs="$xen_libs $xen_stable_libs "
-      fi
-    fi
-  fi
-fi
-
 ##########################################
 # glib support probe
 
@@ -2554,12 +2240,6 @@ if test "$modules" = "yes"; then
 fi
 echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
 
-if test "$xen" = "enabled" ; then
-  echo "CONFIG_XEN_BACKEND=y" >> $config_host_mak
-  echo "CONFIG_XEN_CTRL_INTERFACE_VERSION=$xen_ctrl_version" >> $config_host_mak
-  echo "XEN_CFLAGS=$xen_cflags" >> $config_host_mak
-  echo "XEN_LIBS=$xen_libs" >> $config_host_mak
-fi
 if test "$vhost_scsi" = "yes" ; then
   echo "CONFIG_VHOST_SCSI=y" >> $config_host_mak
 fi
@@ -2838,7 +2518,7 @@ if test "$skip_meson" = no; then
         -Dwerror=$(if test "$werror" = yes; then echo true; else echo false; fi) \
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
-        -Db_lto=$lto -Dcfi=$cfi -Dtcg=$tcg -Dxen=$xen \
+        -Db_lto=$lto -Dcfi=$cfi -Dtcg=$tcg \
         -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp \
         $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo "-Dfuzzing_engine=$LIB_FUZZING_ENGINE") \
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
diff --git a/meson.build b/meson.build
index 3c47d82180..7cbb771393 100644
--- a/meson.build
+++ b/meson.build
@@ -348,12 +348,6 @@ accelerators = []
 if get_option('kvm').allowed() and targetos == 'linux'
   accelerators += 'CONFIG_KVM'
 endif
-if get_option('xen').allowed() and 'CONFIG_XEN_BACKEND' in config_host
-  accelerators += 'CONFIG_XEN'
-  have_xen_pci_passthrough = get_option('xen_pci_passthrough').allowed() and targetos == 'linux'
-else
-  have_xen_pci_passthrough = false
-endif
 if get_option('whpx').allowed() and targetos == 'windows'
   if get_option('whpx').enabled() and host_machine.cpu() != 'x86_64'
     error('WHPX requires 64-bit host')
@@ -425,13 +419,6 @@ endif
 if 'CONFIG_WHPX' not in accelerators and get_option('whpx').enabled()
   error('WHPX not available on this platform')
 endif
-if not have_xen_pci_passthrough and get_option('xen_pci_passthrough').enabled()
-  if 'CONFIG_XEN' in accelerators
-    error('Xen PCI passthrough not available on this platform')
-  else
-    error('Xen PCI passthrough requested but Xen not enabled')
-  endif
-endif
 
 ################
 # Dependencies #
@@ -1255,10 +1242,86 @@ if not get_option('rdma').auto() or have_system
 endif
 
 xen = not_found
-if 'CONFIG_XEN_BACKEND' in config_host
-  xen = declare_dependency(compile_args: config_host['XEN_CFLAGS'].split(),
-                           link_args: config_host['XEN_LIBS'].split())
+if get_option('xen').enabled() or (get_option('xen').auto() and have_system)
+  xencontrol = dependency('xencontrol', required: false,
+                          method: 'pkg-config', kwargs: static_kwargs)
+  if xencontrol.found()
+    xen_pc = declare_dependency(version: xencontrol.version(),
+      dependencies: [
+        xencontrol,
+        # disabler: true makes xen_pc.found() return false if any is not found
+        dependency('xenstore', required: false,
+                   method: 'pkg-config', kwargs: static_kwargs,
+                   disabler: true),
+        dependency('xenforeignmemory', required: false,
+                   method: 'pkg-config', kwargs: static_kwargs,
+                   disabler: true),
+        dependency('xengnttab', required: false,
+                   method: 'pkg-config', kwargs: static_kwargs,
+                   disabler: true),
+        dependency('xenevtchn', required: false,
+                   method: 'pkg-config', kwargs: static_kwargs,
+                   disabler: true),
+        dependency('xendevicemodel', required: false,
+                   method: 'pkg-config', kwargs: static_kwargs,
+                   disabler: true),
+        # optional, no "disabler: true"
+        dependency('xentoolcore', required: false,
+                   method: 'pkg-config', kwargs: static_kwargs)])
+    if xen_pc.found()
+      xen = xen_pc
+    endif
+  endif
+  if not xen.found()
+    xen_tests = [ '4.11.0', '4.10.0', '4.9.0', '4.8.0', '4.7.1', '4.6.0', '4.5.0', '4.2.0' ]
+    xen_libs = {
+      '4.11.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 'xenforeignmemory', 'xengnttab', 'xenevtchn', 'xentoolcore' ],
+      '4.10.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 'xenforeignmemory', 'xengnttab', 'xenevtchn', 'xentoolcore' ],
+      '4.9.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 'xenforeignmemory', 'xengnttab', 'xenevtchn' ],
+      '4.8.0': [ 'xenstore', 'xenctrl', 'xenforeignmemory', 'xengnttab', 'xenevtchn' ],
+      '4.7.1': [ 'xenstore', 'xenctrl', 'xenforeignmemory', 'xengnttab', 'xenevtchn' ],
+      '4.6.0': [ 'xenstore', 'xenctrl' ],
+      '4.5.0': [ 'xenstore', 'xenctrl' ],
+      '4.2.0': [ 'xenstore', 'xenctrl' ],
+    }
+    xen_deps = {}
+    foreach ver: xen_tests
+      # cache the various library tests to avoid polluting the logs
+      xen_test_deps = []
+      foreach l: xen_libs[ver]
+        if l not in xen_deps
+          xen_deps += { l: cc.find_library(l, required: false) }
+        endif
+        xen_test_deps += xen_deps[l]
+      endforeach
+
+      # Use -D to pick just one of the test programs in scripts/xen-detect.c
+      xen_version = ver.split('.')
+      xen_ctrl_version = xen_version[0] + \
+        ('0' + xen_version[1]).substring(-2) + \
+        ('0' + xen_version[2]).substring(-2)
+      if cc.links(files('scripts/xen-detect.c'),
+                  args: '-DCONFIG_XEN_CTRL_INTERFACE_VERSION=' + xen_ctrl_version,
+                  dependencies: xen_test_deps)
+        xen = declare_dependency(version: ver, dependencies: xen_test_deps)
+        break
+      endif
+    endforeach
+  endif
+  if xen.found()
+    accelerators += 'CONFIG_XEN'
+  elif get_option('xen').enabled()
+    error('could not compile and link Xen test program')
+  endif
 endif
+have_xen_pci_passthrough = get_option('xen_pci_passthrough') \
+  .require(xen.found(),
+           error_message: 'Xen PCI passthrough requested but Xen not enabled') \
+  .require(targetos == 'linux',
+           error_message: 'Xen PCI passthrough not available on this platform') \
+  .allowed()
+
+
 cacard = not_found
 if not get_option('smartcard').auto() or have_system
   cacard = dependency('libcacard', required: get_option('smartcard'),
@@ -1632,7 +1695,16 @@ config_host_data.set('CONFIG_X11', x11.found())
 config_host_data.set('CONFIG_DBUS_DISPLAY', dbus_display)
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
 config_host_data.set('CONFIG_SELINUX', selinux.found())
-config_host_data.set('CONFIG_XEN_PCI_PASSTHROUGH', have_xen_pci_passthrough)
+config_host_data.set('CONFIG_XEN_BACKEND', xen.found())
+if xen.found()
+  # protect from xen.version() having less than three components
+  xen_version = xen.version().split('.') + ['0', '0']
+  xen_ctrl_version = xen_version[0] + \
+    ('0' + xen_version[1]).substring(-2) + \
+    ('0' + xen_version[2]).substring(-2)
+  config_host_data.set('CONFIG_XEN_CTRL_INTERFACE_VERSION', xen_ctrl_version)
+  config_host_data.set('CONFIG_XEN_PCI_PASSTHROUGH', have_xen_pci_passthrough)
+endif
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
 config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
@@ -2345,7 +2417,7 @@ config_all += config_all_devices
 config_all += config_host
 config_all += config_all_disas
 config_all += {
-  'CONFIG_XEN': config_host.has_key('CONFIG_XEN_BACKEND'),
+  'CONFIG_XEN': xen.found(),
   'CONFIG_SOFTMMU': have_system,
   'CONFIG_USER_ONLY': have_user,
   'CONFIG_ALL': true,
@@ -3676,9 +3748,9 @@ if have_system
   summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
   summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
   summary_info += {'NVMM support':      config_all.has_key('CONFIG_NVMM')}
-  summary_info += {'Xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
-  if config_host.has_key('CONFIG_XEN_BACKEND')
-    summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
+  summary_info += {'Xen support':       xen.found()}
+  if xen.found()
+    summary_info += {'xen ctrl version':  xen.version()}
   endif
 endif
 summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
diff --git a/scripts/xen-detect.c b/scripts/xen-detect.c
new file mode 100644
index 0000000000..85e8206490
--- /dev/null
+++ b/scripts/xen-detect.c
@@ -0,0 +1,203 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* Test programs for various Xen versions that QEMU supports.  */
+#if CONFIG_XEN_CTRL_INTERFACE_VERSION == 41100
+  #undef XC_WANT_COMPAT_DEVICEMODEL_API
+  #define __XEN_TOOLS__
+  #include <xendevicemodel.h>
+  #include <xenforeignmemory.h>
+  int main(void) {
+    xendevicemodel_handle *xd;
+    xenforeignmemory_handle *xfmem;
+
+    xd = xendevicemodel_open(0, 0);
+    xendevicemodel_pin_memory_cacheattr(xd, 0, 0, 0, 0);
+
+    xfmem = xenforeignmemory_open(0, 0);
+    xenforeignmemory_map_resource(xfmem, 0, 0, 0, 0, 0, NULL, 0, 0);
+
+    return 0;
+  }
+
+#elif CONFIG_XEN_CTRL_INTERFACE_VERSION == 41000
+  #undef XC_WANT_COMPAT_MAP_FOREIGN_API
+  #include <xenforeignmemory.h>
+  #include <xentoolcore.h>
+  int main(void) {
+    xenforeignmemory_handle *xfmem;
+
+    xfmem = xenforeignmemory_open(0, 0);
+    xenforeignmemory_map2(xfmem, 0, 0, 0, 0, 0, 0, 0);
+    xentoolcore_restrict_all(0);
+
+    return 0;
+  }
+
+#elif CONFIG_XEN_CTRL_INTERFACE_VERSION == 40900
+  #undef XC_WANT_COMPAT_DEVICEMODEL_API
+  #define __XEN_TOOLS__
+  #include <xendevicemodel.h>
+  int main(void) {
+    xendevicemodel_handle *xd;
+
+    xd = xendevicemodel_open(0, 0);
+    xendevicemodel_close(xd);
+
+    return 0;
+  }
+
+#elif CONFIG_XEN_CTRL_INTERFACE_VERSION == 40800
+  /*
+   * If we have stable libs the we don't want the libxc compat
+   * layers, regardless of what CFLAGS we may have been given.
+   *
+   * Also, check if xengnttab_grant_copy_segment_t is defined and
+   * grant copy operation is implemented.
+   */
+  #undef XC_WANT_COMPAT_EVTCHN_API
+  #undef XC_WANT_COMPAT_GNTTAB_API
+  #undef XC_WANT_COMPAT_MAP_FOREIGN_API
+  #include <xenctrl.h>
+  #include <xenstore.h>
+  #include <xenevtchn.h>
+  #include <xengnttab.h>
+  #include <xenforeignmemory.h>
+  #include <stdint.h>
+  #include <xen/hvm/hvm_info_table.h>
+  #if !defined(HVM_MAX_VCPUS)
+  # error HVM_MAX_VCPUS not defined
+  #endif
+  int main(void) {
+    xc_interface *xc = NULL;
+    xenforeignmemory_handle *xfmem;
+    xenevtchn_handle *xe;
+    xengnttab_handle *xg;
+    xengnttab_grant_copy_segment_t* seg = NULL;
+
+    xs_daemon_open();
+
+    xc = xc_interface_open(0, 0, 0);
+    xc_hvm_set_mem_type(0, 0, HVMMEM_ram_ro, 0, 0);
+    xc_domain_add_to_physmap(0, 0, XENMAPSPACE_gmfn, 0, 0);
+    xc_hvm_inject_msi(xc, 0, 0xf0000000, 0x00000000);
+    xc_hvm_create_ioreq_server(xc, 0, HVM_IOREQSRV_BUFIOREQ_ATOMIC, NULL);
+
+    xfmem = xenforeignmemory_open(0, 0);
+    xenforeignmemory_map(xfmem, 0, 0, 0, 0, 0);
+
+    xe = xenevtchn_open(0, 0);
+    xenevtchn_fd(xe);
+
+    xg = xengnttab_open(0, 0);
+    xengnttab_grant_copy(xg, 0, seg);
+
+    return 0;
+  }
+
+#elif CONFIG_XEN_CTRL_INTERFACE_VERSION == 40701
+  /*
+   * If we have stable libs the we don't want the libxc compat
+   * layers, regardless of what CFLAGS we may have been given.
+   */
+  #undef XC_WANT_COMPAT_EVTCHN_API
+  #undef XC_WANT_COMPAT_GNTTAB_API
+  #undef XC_WANT_COMPAT_MAP_FOREIGN_API
+  #include <xenctrl.h>
+  #include <xenstore.h>
+  #include <xenevtchn.h>
+  #include <xengnttab.h>
+  #include <xenforeignmemory.h>
+  #include <stdint.h>
+  #include <xen/hvm/hvm_info_table.h>
+  #if !defined(HVM_MAX_VCPUS)
+  # error HVM_MAX_VCPUS not defined
+  #endif
+  int main(void) {
+    xc_interface *xc = NULL;
+    xenforeignmemory_handle *xfmem;
+    xenevtchn_handle *xe;
+    xengnttab_handle *xg;
+
+    xs_daemon_open();
+
+    xc = xc_interface_open(0, 0, 0);
+    xc_hvm_set_mem_type(0, 0, HVMMEM_ram_ro, 0, 0);
+    xc_domain_add_to_physmap(0, 0, XENMAPSPACE_gmfn, 0, 0);
+    xc_hvm_inject_msi(xc, 0, 0xf0000000, 0x00000000);
+    xc_hvm_create_ioreq_server(xc, 0, HVM_IOREQSRV_BUFIOREQ_ATOMIC, NULL);
+
+    xfmem = xenforeignmemory_open(0, 0);
+    xenforeignmemory_map(xfmem, 0, 0, 0, 0, 0);
+
+    xe = xenevtchn_open(0, 0);
+    xenevtchn_fd(xe);
+
+    xg = xengnttab_open(0, 0);
+    xengnttab_map_grant_ref(xg, 0, 0, 0);
+
+    return 0;
+  }
+
+#elif CONFIG_XEN_CTRL_INTERFACE_VERSION == 40600
+  #include <xenctrl.h>
+  #include <xenstore.h>
+  #include <stdint.h>
+  #include <xen/hvm/hvm_info_table.h>
+  #if !defined(HVM_MAX_VCPUS)
+  # error HVM_MAX_VCPUS not defined
+  #endif
+  int main(void) {
+    xc_interface *xc;
+    xs_daemon_open();
+    xc = xc_interface_open(0, 0, 0);
+    xc_hvm_set_mem_type(0, 0, HVMMEM_ram_ro, 0, 0);
+    xc_gnttab_open(NULL, 0);
+    xc_domain_add_to_physmap(0, 0, XENMAPSPACE_gmfn, 0, 0);
+    xc_hvm_inject_msi(xc, 0, 0xf0000000, 0x00000000);
+    xc_hvm_create_ioreq_server(xc, 0, HVM_IOREQSRV_BUFIOREQ_ATOMIC, NULL);
+    xc_reserved_device_memory_map(xc, 0, 0, 0, 0, NULL, 0);
+    return 0;
+  }
+
+#elif CONFIG_XEN_CTRL_INTERFACE_VERSION == 40500
+  #include <xenctrl.h>
+  #include <xenstore.h>
+  #include <stdint.h>
+  #include <xen/hvm/hvm_info_table.h>
+  #if !defined(HVM_MAX_VCPUS)
+  # error HVM_MAX_VCPUS not defined
+  #endif
+  int main(void) {
+    xc_interface *xc;
+    xs_daemon_open();
+    xc = xc_interface_open(0, 0, 0);
+    xc_hvm_set_mem_type(0, 0, HVMMEM_ram_ro, 0, 0);
+    xc_gnttab_open(NULL, 0);
+    xc_domain_add_to_physmap(0, 0, XENMAPSPACE_gmfn, 0, 0);
+    xc_hvm_inject_msi(xc, 0, 0xf0000000, 0x00000000);
+    xc_hvm_create_ioreq_server(xc, 0, 0, NULL);
+    return 0;
+  }
+
+#elif CONFIG_XEN_CTRL_INTERFACE_VERSION == 40200
+  #include <xenctrl.h>
+  #include <xenstore.h>
+  #include <stdint.h>
+  #include <xen/hvm/hvm_info_table.h>
+  #if !defined(HVM_MAX_VCPUS)
+  # error HVM_MAX_VCPUS not defined
+  #endif
+  int main(void) {
+    xc_interface *xc;
+    xs_daemon_open();
+    xc = xc_interface_open(0, 0, 0);
+    xc_hvm_set_mem_type(0, 0, HVMMEM_ram_ro, 0, 0);
+    xc_gnttab_open(NULL, 0);
+    xc_domain_add_to_physmap(0, 0, XENMAPSPACE_gmfn, 0, 0);
+    xc_hvm_inject_msi(xc, 0, 0xf0000000, 0x00000000);
+    return 0;
+  }
+
+#else
+#error invalid CONFIG_XEN_CTRL_INTERFACE_VERSION
+#endif
-- 
2.35.1



