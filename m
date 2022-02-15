Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E11F4B6826
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:49:19 +0100 (CET)
Received: from localhost ([::1]:41102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuSU-0006du-IQ
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:49:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCJ-00041n-Bl
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:35 -0500
Received: from [2a00:1450:4864:20::635] (port=38628
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCH-0008R2-O1
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:35 -0500
Received: by mail-ej1-x635.google.com with SMTP id k25so42890244ejp.5
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3i4ZWFXWf5ojMIOfmpbxSRdcnviej/ulhAlrMSnov5o=;
 b=MTAlC/e7+4l7eKTsyhWCjxeQ1ofvlBiOqOXafCfEYg8ZK4bx6Tb490IMuYqwOEF/iY
 VuCspbiV/wmawTatpL0bjYEyRV4OEIe4R99kb3w2plfvmgpV8U8Qbzv6TqeVFqyTTthw
 LJ+qgu8PfrWjC7t6+pRHmhmnhWXTHFI18XXU/L+9ZWwdHnPah+u0qVmxos6AXUEZs4Vx
 pfsQjgGQt1weIzW3ygsSialxiSQHLRuSPOxDs/sgJyoSv8FuP5onzmYi3WcDZzh2/h2L
 1SfkN6fXgn5b7PK6MWc93l0H4amtbvpjk6DJrusKaKgNg8vCcd8DrUVJyxHxlB3J1pVj
 3ctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3i4ZWFXWf5ojMIOfmpbxSRdcnviej/ulhAlrMSnov5o=;
 b=Yx8xOCkFVG4/w+6sU8mjI7Q56zoxxdMMgVr/8jKc+n108BdB3Dt65rmQ+LzyZEJBbd
 WVDDfM9gUHYaoxHXlbSCeJFh0b68TRZECRkynoAuTS980Z8OUfhe7/URA7id3d3CauTj
 3dN9ZZD8SikgppbJ366LcZEFalE68n6EM6uKOF2CwKaJrizz4Yx2TkNQFgFe8kT9LSoB
 Wcyuj0d1oHHH+tahlsdFH0njpNsoRdQfinabPc5Ex2Z5sh38lHSHqfm3BCsb/0LF/x/u
 BaYKrySqCZ9NvsVDxM2YKTc2G13fCxncF9PqJ+HmqKFo85mywMA7/JOz7Kh1DQfyr15S
 tf/A==
X-Gm-Message-State: AOAM533xmLwYHSqf+TyfAWeo8pwWJlTNW1pFocX5opy6lcUYnjQMF2sv
 Y2U7blUa/I/gR4+bembheIxWN89zyc0=
X-Google-Smtp-Source: ABdhPJz3q7ZA3nFGEmylAz0lxvteARoDelcoQhCrbKaHUh5DUczEpEsGwDF0xB/M+8rMHr1pFue6ow==
X-Received: by 2002:a17:906:43c8:: with SMTP id
 j8mr2270444ejn.293.1644917552576; 
 Tue, 15 Feb 2022 01:32:32 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/30] configure, meson: cleanup qemu-ga libraries
Date: Tue, 15 Feb 2022 10:32:04 +0100
Message-Id: <20220215093223.110827-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move LIBS_QGA to meson.build, remove dead QGA_VSS_PROVIDER variable.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure       |  7 -------
 qga/meson.build | 25 +++++++++++++++++--------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/configure b/configure
index 54eb954296..ee7c4aed0a 100755
--- a/configure
+++ b/configure
@@ -240,7 +240,6 @@ block_drv_rw_whitelist=""
 block_drv_ro_whitelist=""
 block_drv_whitelist_tools="no"
 host_cc="cc"
-libs_qga=""
 debug_info="yes"
 lto="false"
 stack_protector=""
@@ -708,7 +707,6 @@ if test "$mingw32" = "yes" ; then
   write_c_skeleton;
   prefix="/qemu"
   qemu_suffix=""
-  libs_qga="-lws2_32 -lwinmm -lpowrprof -lwtsapi32 -lwininet -liphlpapi -lnetapi32 $libs_qga"
 fi
 
 werror=""
@@ -2475,8 +2473,6 @@ EOF
   if compile_prog "$vss_win32_include" "" ; then
     guest_agent_with_vss="yes"
     QEMU_CFLAGS="$QEMU_CFLAGS $vss_win32_include"
-    libs_qga="-lole32 -loleaut32 -lshlwapi -lstdc++ -Wl,--enable-stdcall-fixup $libs_qga"
-    qga_vss_provider="qga/vss-win32/qga-vss.dll qga/vss-win32/qga-vss.tlb"
   else
     if test "$vss_win32_sdk" != "" ; then
       echo "ERROR: Please download and install Microsoft VSS SDK:"
@@ -2527,7 +2523,6 @@ int main(void) {
 EOF
   if compile_prog "" "" ; then
     guest_agent_ntddscsi=yes
-    libs_qga="-lsetupapi -lcfgmgr32 $libs_qga"
   fi
 fi
 
@@ -3085,7 +3080,6 @@ if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
   if test "$guest_agent_with_vss" = "yes" ; then
     echo "CONFIG_QGA_VSS=y" >> $config_host_mak
-    echo "QGA_VSS_PROVIDER=$qga_vss_provider" >> $config_host_mak
     echo "WIN_SDK=\"$win_sdk\"" >> $config_host_mak
   fi
   if test "$guest_agent_ntddscsi" = "yes" ; then
@@ -3337,7 +3331,6 @@ echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
 echo "STRIP=$strip" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
-echo "LIBS_QGA=$libs_qga" >> $config_host_mak
 
 if test "$rng_none" = "yes"; then
   echo "CONFIG_RNG_NONE=y" >> $config_host_mak
diff --git a/qga/meson.build b/qga/meson.build
index 1ee9dca60b..56fb6539e5 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -1,3 +1,5 @@
+all_qga = []
+
 qga_qapi_outputs = [
   'qga-qapi-commands.c',
   'qga-qapi-commands.h',
@@ -50,19 +52,26 @@ qga_ss.add(when: 'CONFIG_WIN32', if_true: files(
 
 qga_ss = qga_ss.apply(config_host, strict: false)
 
+gen_tlb = []
+qga_libs = []
+if targetos == 'windows'
+  qga_libs += ['-lws2_32', '-lwinmm', '-lpowrprof', '-lwtsapi32', '-lwininet', '-liphlpapi', '-lnetapi32']
+  if 'CONFIG_QGA_VSS' in config_host
+    qga_libs += ['-lole32', '-loleaut32', '-lshlwapi', '-lstdc++', '-Wl,--enable-stdcall-fixup']
+    subdir('vss-win32')
+  endif
+  if 'CONFIG_QGA_NTDDSCSI' in config_host
+    qga_libs += ['-lsetupapi', '-lcfgmgr32']
+  endif
+endif
+
 qga = executable('qemu-ga', qga_ss.sources(),
-                 link_args: config_host['LIBS_QGA'].split(),
+                 link_args: qga_libs,
                  dependencies: [qemuutil, libudev],
                  install: true)
-all_qga = [qga]
+all_qga += qga
 
 if targetos == 'windows'
-  if 'CONFIG_QGA_VSS' in config_host
-    subdir('vss-win32')
-  else
-    gen_tlb = []
-  endif
-
   qemu_ga_msi_arch = {
     'x86': ['-D', 'Arch=32'],
     'x86_64': ['-a', 'x64', '-D', 'Arch=64']
-- 
2.34.1



