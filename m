Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7D3372B1D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 15:33:21 +0200 (CEST)
Received: from localhost ([::1]:55964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldvAu-0005rF-NZ
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 09:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldv8u-0004SL-Hk
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:31:16 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldv8s-0001fJ-BN
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:31:16 -0400
Received: by mail-ej1-x633.google.com with SMTP id t4so13230341ejo.0
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H6sZEbsXTDphcjHJ5mQSJTlDNjXu2P21IO7FfSgpkY4=;
 b=ky9p6Qs5yCfjJ8polFQMMY9ue/wmTUb8S9mYIMvs2lQKw1fwYCVKf/H8P17kXowyOC
 zUGFzES6+4gWuYTv4ZgEcCtBPSAXJ1YSKhCm8iAhrbzQU0NZ4EdZQGMkRSgVipWXGldv
 q2kKWoA7Uf3qitZNS3kjJ+DeWLZKyrlxSu69EV+N1QWKfgh4gV/xnuTUqhJY0H6sfsre
 q+6+MwZYx0lCYYuW5lVQpCzAgCsmBG9oa/hIZ/X1Tuyw1Dnu9BiAg9ez5U1iSPl5YtMZ
 tWwZvS14Mq5rB6ReaFIubQrtiuTFG8sb4HrzPV+/o45q2s4M03Paorv790RZB0g0kUKN
 r6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H6sZEbsXTDphcjHJ5mQSJTlDNjXu2P21IO7FfSgpkY4=;
 b=hcpBrJqdHGvcAdUYeAHx13v8V5NEgqHd5hnjEazUwm1hXtcuwFSBoZOK1veb4/Wb1J
 KxXE2LTQshRc7Q1OjSHeMYZ7X29ke1JFzg9p6lDdbjQ/YqxkqsRvlMbENb9wcW9/nFe0
 5IDegCsEUSwa0JSs+mQIRqqdsdykAA9l4Q2Yw/A8pd7fnihq+ezGs1CFpmrEwK+Ih9CJ
 ff/1GpM8xrrmAzUPuiW/xyqE0N0WQTntm6DinP1457yvfwO/HIfr4ZU1puQosFlB3MXV
 rUXUB0RSqFmU4oH7WgmVIg3RK7KfZpl5QsIwwZyw+bnmVishD+bWAT3LCazo8SmQ4zKx
 ayrw==
X-Gm-Message-State: AOAM532I2WUpvJ2fKBvLopy4XkYku8c2cFa8LH96HXuQ9B7FHwUKPc8d
 YRTx2173YjUxPqXqREbUIEXw9xsqVxk=
X-Google-Smtp-Source: ABdhPJwuqtcfbAfpMB/AXz6GUk/OizWMFxW1FEYp4IC77JCyCs5US5qfweRt7fNvvU1VRgAD5UnN6Q==
X-Received: by 2002:a17:906:7016:: with SMTP id
 n22mr21960858ejj.23.1620135072914; 
 Tue, 04 May 2021 06:31:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y19sm6449860edc.73.2021.05.04.06.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:31:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/11] Add NVMM accelerator: configure and build logic
Date: Tue,  4 May 2021 15:31:08 +0200
Message-Id: <20210504133109.508824-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504133109.508824-1-pbonzini@redhat.com>
References: <20210504133109.508824-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
[Check for nvmm_vcpu_stop. - Paolo]
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
index 1ffdc9e6c4..2829ed2b86 100644
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
+  if cc.has_header_symbol('nvmm.h', 'nvmm_cpu_stop', required: get_option('nvmm'))
+    nvmm = cc.find_library('nvmm', required: get_option('nvmm'))
+  endif
+  if nvmm.found()
+    accelerators += 'CONFIG_NVMM'
+  endif
+endif
 
 tcg_arch = config_host['ARCH']
 if not get_option('tcg').disabled()
@@ -270,6 +280,9 @@ endif
 if 'CONFIG_HVF' not in accelerators and get_option('hvf').enabled()
   error('HVF not available on this platform')
 endif
+if 'CONFIG_NVMM' not in accelerators and get_option('nvmm').enabled()
+  error('NVMM not available on this platform')
+endif
 if 'CONFIG_WHPX' not in accelerators and get_option('whpx').enabled()
   error('WHPX not available on this platform')
 endif
@@ -2581,6 +2594,7 @@ if have_system
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



