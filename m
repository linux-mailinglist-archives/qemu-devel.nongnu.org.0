Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2664B4A8A3A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:38:04 +0100 (CET)
Received: from localhost ([::1]:42470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFg3W-0007nD-Tc
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:38:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzm-0004r8-EL
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:10 -0500
Received: from [2a00:1450:4864:20::530] (port=33555
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzk-0008Fo-Aa
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:10 -0500
Received: by mail-ed1-x530.google.com with SMTP id b13so7599343edn.0
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=246fSjDCTDbCIdtAIlYLv1yQw+UYUybFQZcxFYHq0TE=;
 b=HUJzpD1vgpcSE9WKvsMnpJzzHwXl64ChQmC64KzgNo/b1PwCe5c8x3Z/rrJHi3n1VD
 ks8mUlB7zT3kzimOt5G7BsO2ahgbGsUCPzAWO2qXk6uBJGpaN1yJFednizrJzeUXeKHj
 rti5hbp0L1PwnM+O68rTLCTc/wR7o0EidOiG4OUqUjfMpJf/AeAJnDw7IO3RTt83D7VZ
 oN9izWOBguHEzTOFyf6gdl+YmRqA1lIaLzjbP6IARwLtCyzaGcWUrtGmKnGZdBGRW40l
 3wo14enmrAvx+sC/uxouFZiiCsQxkFOAZcYdCdvV/AXlHx5fDLEFqaX2cyY/R1EPSMVj
 BlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=246fSjDCTDbCIdtAIlYLv1yQw+UYUybFQZcxFYHq0TE=;
 b=JtPLkYOfTe/09XXJxsWeXinYu0gX8+HXOVx7w4KFVgIS04wnkf6IVUwU++nzK6tc0U
 NIjTjLWKfg0KIJx94b+Q0UEHxOytDCaJXW53RGgRBgnWiJgbBHDfZXKgvMvrE4mtXENS
 zoHKCPUW1fbQDwudTFx6S/a+/Ut3I96z8WknBnpC7mCI54OxVCjjBC2Qor6iny/eM3ua
 OaOuardi1bsK+MTafSiKLmykAKdGVs8VkAcGynUtbdOXJNGerkkIn9jgq13ILiWe2Q+c
 4lbiUYJS98n0A22uZTgY3c2CmkkbqtyGbg05AvMh4zUp1FM+ecWmJ1C2PUttlZaWXmkV
 15gQ==
X-Gm-Message-State: AOAM530G/d+AHPi+dh327aAENflMt0l46tENrwQRhNzt1Zi7L90nQf3e
 uVKIDUTnPNr4B/l//KNzqffahn9Mdyc=
X-Google-Smtp-Source: ABdhPJwVpBnUdRW43r6IfDIVRRnzivGhFdGli1x7kUO89mKBE7iN1ZKOO9FW5n0G72TvRcGtJH705g==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr36282601edd.408.1643909647062; 
 Thu, 03 Feb 2022 09:34:07 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/27] configure, meson: cleanup qemu-ga libraries
Date: Thu,  3 Feb 2022 18:33:40 +0100
Message-Id: <20220203173359.292068-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move LIBS_QGA to meson.build, remove dead QGA_VSS_PROVIDER variable.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure       |  7 -------
 qga/meson.build | 25 +++++++++++++++++--------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/configure b/configure
index 10cff5df1f..5bb23dadc1 100755
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
@@ -2496,8 +2494,6 @@ EOF
   if compile_prog "$vss_win32_include" "" ; then
     guest_agent_with_vss="yes"
     QEMU_CFLAGS="$QEMU_CFLAGS $vss_win32_include"
-    libs_qga="-lole32 -loleaut32 -lshlwapi -lstdc++ -Wl,--enable-stdcall-fixup $libs_qga"
-    qga_vss_provider="qga/vss-win32/qga-vss.dll qga/vss-win32/qga-vss.tlb"
   else
     if test "$vss_win32_sdk" != "" ; then
       echo "ERROR: Please download and install Microsoft VSS SDK:"
@@ -2548,7 +2544,6 @@ int main(void) {
 EOF
   if compile_prog "" "" ; then
     guest_agent_ntddscsi=yes
-    libs_qga="-lsetupapi -lcfgmgr32 $libs_qga"
   fi
 fi
 
@@ -3106,7 +3101,6 @@ if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
   if test "$guest_agent_with_vss" = "yes" ; then
     echo "CONFIG_QGA_VSS=y" >> $config_host_mak
-    echo "QGA_VSS_PROVIDER=$qga_vss_provider" >> $config_host_mak
     echo "WIN_SDK=\"$win_sdk\"" >> $config_host_mak
   fi
   if test "$guest_agent_ntddscsi" = "yes" ; then
@@ -3358,7 +3352,6 @@ echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
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



