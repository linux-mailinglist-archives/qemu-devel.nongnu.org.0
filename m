Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F32D3706A1
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 11:33:08 +0200 (CEST)
Received: from localhost ([::1]:53644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lclzn-0002Em-50
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 05:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxM-0000Va-KC
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:38 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxK-0005Up-JW
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:36 -0400
Received: by mail-ej1-x62a.google.com with SMTP id a4so744277ejk.1
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RLsjIcAP3wwlVBjq4iu7pWS+PTeCNrkyXNVSx//IWes=;
 b=tCf9CNMfTRsh9C+bZYg9QePmnBa+jNnQZkyEdJukjSYIxjZolUJJOC7TMXbH1LBgjL
 BYBAwG0yKcKESkLrbAvKzYaGAvPVCnheapndz+GRoLqzPdJHPCzW991aPhUzoi+DSHpP
 DhzbFGb4MejqocGNxq1ha7KC2TkRMwep9Y6YMa2txM0SZYZpuYE5mgVWtdxqSI723I9a
 NXN+scFynJ2N4L7JxQdCIei5aufbwVqhq43QNd5RCX6eY5yixV6Gx85TaxO3uj4ZnDOj
 F+sRrJ+R97jkOUxwgmibnMC2bTZKCZjlgjc10vftiJLetI/Ejjt4c5Af/k29zxugP6H/
 u9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RLsjIcAP3wwlVBjq4iu7pWS+PTeCNrkyXNVSx//IWes=;
 b=LnkHk1tv88zl1KmFRYI9bm5ZKuh4Eba5/dwCabNPVMbjf4578Qnf/rJnwie5Ojse2e
 e1Pqf99JVxlj985y8sYyvbKMdKndWKP7lRG75XpCQlWgMV8QDVugEv27EIXE2+YZX3zt
 gafYK5Q4JYQ/Q9pC+LNXPHV0iXqA0adryKB80IeUtLumZ/D16wRsNSJ+6XR4ZbbBC/ZG
 y57wEKFgY/IroFVNVHfBW/RZxMmz99fNycV52cH7CBEqwCQ2PWNMk/NYBEh44+Uro13T
 B4kpabVqCXYo2Ic55apioEElcGaZzUrotjwu5dvydloPg2rakJL+SkUBf9RiGCwC87j5
 VAfA==
X-Gm-Message-State: AOAM533UbjDdNlDQ9+Q3UR5nqaTaiv9mKqoe5A5LVy1DLVjNk0QzLcAH
 95M7ZN3A5HFzVApXspVx/rTUEcpVeXo=
X-Google-Smtp-Source: ABdhPJz+0ETHqPRA3lNvkcQc94JLZ6QAKpqT/zs6lG4ZPse+bD9w0yU6gLMl43TNqz//vdI+WfeOGA==
X-Received: by 2002:a17:906:bb0e:: with SMTP id
 jz14mr8165753ejb.285.1619861430705; 
 Sat, 01 May 2021 02:30:30 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id ga33sm4632721ejc.11.2021.05.01.02.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 02:30:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] Add NVMM accelerator: configure and build logic
Date: Sat,  1 May 2021 11:30:18 +0200
Message-Id: <20210501093026.189429-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210501093026.189429-1-pbonzini@redhat.com>
References: <20210501093026.189429-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kamil Rytarowski <kamil@NetBSD.org>, Reinoud Zandijk <reinoud@NetBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Reinoud Zandijk <reinoud@NetBSD.org>

Signed-off-by: Kamil Rytarowski <kamil@NetBSD.org>
Signed-off-by: Reinoud Zandijk <reinoud@NetBSD.org>

Message-Id: <20210402202535.11550-2-reinoud@NetBSD.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/Kconfig     |  3 +++
 configure         |  8 +++++++-
 meson.build       | 14 ++++++++++++++
 meson_options.txt |  2 ++
 qemu-options.hx   |  8 ++++----
 5 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/accel/Kconfig b/accel/Kconfig
index 461104c771..8bdedb7d15 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -1,6 +1,9 @@
 config WHPX
     bool
 
+config NVMM
+    bool
+
 config HAX
     bool
 
diff --git a/configure b/configure
index 4f374b4889..268460d63d 100755
--- a/configure
+++ b/configure
@@ -352,6 +352,7 @@ kvm="auto"
 hax="auto"
 hvf="auto"
 whpx="auto"
+nvmm="auto"
 rdma="$default_feature"
 pvrdma="$default_feature"
 gprof="no"
@@ -1107,6 +1108,10 @@ for opt do
   ;;
   --enable-hvf) hvf="enabled"
   ;;
+  --disable-nvmm) nvmm="disabled"
+  ;;
+  --enable-nvmm) nvmm="enabled"
+  ;;
   --disable-whpx) whpx="disabled"
   ;;
   --enable-whpx) whpx="enabled"
@@ -1848,6 +1853,7 @@ disabled with --disable-FEATURE, default is enabled if available
   kvm             KVM acceleration support
   hax             HAX acceleration support
   hvf             Hypervisor.framework acceleration support
+  nvmm            NVMM acceleration support
   whpx            Windows Hypervisor Platform acceleration support
   rdma            Enable RDMA-based migration
   pvrdma          Enable PVRDMA support
@@ -6410,7 +6416,7 @@ NINJA=$ninja $meson setup \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
         -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug \
         -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
-        -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf \
+        -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf -Dnvmm=$nvmm \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
         -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
diff --git a/meson.build b/meson.build
index c6f4b0cf5e..14dd3fe068 100644
--- a/meson.build
+++ b/meson.build
@@ -87,6 +87,7 @@ if cpu in ['x86', 'x86_64']
   accelerator_targets += {
     'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
     'CONFIG_HVF': ['x86_64-softmmu'],
+    'CONFIG_NVMM': ['i386-softmmu', 'x86_64-softmmu'],
     'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
   }
 endif
@@ -170,6 +171,7 @@ version_res = []
 coref = []
 iokit = []
 emulator_link_args = []
+nvmm =not_found
 hvf = not_found
 if targetos == 'windows'
   socket = cc.find_library('ws2_32')
@@ -227,6 +229,14 @@ if not get_option('hax').disabled()
     accelerators += 'CONFIG_HAX'
   endif
 endif
+if targetos == 'netbsd'
+  if cc.has_header('nvmm.h', required: get_option('nvmm'))
+    nvmm = cc.find_library('nvmm', required: get_option('nvmm'))
+  endif
+  if nvmm.found()
+    accelerators += 'CONFIG_NVMM'
+  endif
+endif
 
 tcg_arch = config_host['ARCH']
 if not get_option('tcg').disabled()
@@ -271,6 +281,9 @@ endif
 if 'CONFIG_HVF' not in accelerators and get_option('hvf').enabled()
   error('HVF not available on this platform')
 endif
+if 'CONFIG_NVMM' not in accelerators and get_option('nvmm').enabled()
+  error('NVMM not available on this platform')
+endif
 if 'CONFIG_WHPX' not in accelerators and get_option('whpx').enabled()
   error('WHPX not available on this platform')
 endif
@@ -2576,6 +2589,7 @@ if have_system
   summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
   summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
   summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
+  summary_info += {'NVMM support':      config_all.has_key('CONFIG_NVMM')}
   summary_info += {'Xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
   if config_host.has_key('CONFIG_XEN_BACKEND')
     summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
diff --git a/meson_options.txt b/meson_options.txt
index 9734019995..91034420a1 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -33,6 +33,8 @@ option('whpx', type: 'feature', value: 'auto',
        description: 'WHPX acceleration support')
 option('hvf', type: 'feature', value: 'auto',
        description: 'HVF acceleration support')
+option('nvmm', type: 'feature', value: 'auto',
+       description: 'NVMM acceleration support')
 option('xen', type: 'feature', value: 'auto',
        description: 'Xen backend support')
 option('xen_pci_passthrough', type: 'feature', value: 'auto',
diff --git a/qemu-options.hx b/qemu-options.hx
index fd21002bd6..dadf11fae9 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -26,7 +26,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "-machine [type=]name[,prop[=value][,...]]\n"
     "                selects emulated machine ('-machine help' for list)\n"
     "                property accel=accel1[:accel2[:...]] selects accelerator\n"
-    "                supported accelerators are kvm, xen, hax, hvf, whpx or tcg (default: tcg)\n"
+    "                supported accelerators are kvm, xen, hax, hvf, nvmm, whpx or tcg (default: tcg)\n"
     "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
     "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
     "                mem-merge=on|off controls memory merge support (default: on)\n"
@@ -58,7 +58,7 @@ SRST
 
     ``accel=accels1[:accels2[:...]]``
         This is used to enable an accelerator. Depending on the target
-        architecture, kvm, xen, hax, hvf, whpx or tcg can be available.
+        architecture, kvm, xen, hax, hvf, nvmm, whpx or tcg can be available.
         By default, tcg is used. If there is more than one accelerator
         specified, the next one is used if the previous one fails to
         initialize.
@@ -135,7 +135,7 @@ ERST
 
 DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "-accel [accel=]accelerator[,prop[=value][,...]]\n"
-    "                select accelerator (kvm, xen, hax, hvf, whpx or tcg; use 'help' for a list)\n"
+    "                select accelerator (kvm, xen, hax, hvf, nvmm, whpx or tcg; use 'help' for a list)\n"
     "                igd-passthru=on|off (enable Xen integrated Intel graphics passthrough, default=off)\n"
     "                kernel-irqchip=on|off|split controls accelerated irqchip support (default=on)\n"
     "                kvm-shadow-mem=size of KVM shadow MMU in bytes\n"
@@ -145,7 +145,7 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
 SRST
 ``-accel name[,prop=value[,...]]``
     This is used to enable an accelerator. Depending on the target
-    architecture, kvm, xen, hax, hvf, whpx or tcg can be available. By
+    architecture, kvm, xen, hax, hvf, nvmm, whpx or tcg can be available. By
     default, tcg is used. If there is more than one accelerator
     specified, the next one is used if the previous one fails to
     initialize.
-- 
2.31.1



