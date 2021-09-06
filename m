Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF9D401C50
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:31:17 +0200 (CEST)
Received: from localhost ([::1]:43448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEiS-0006wx-7L
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPr-0002HJ-Do
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:12:03 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPn-00084W-CB
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:12:03 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso4983140wmb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zi6XC7xgXM4E75DCCFQG+dfwQNv3xa2eHtXmh1sF/QU=;
 b=lTe8JEKP8YhnhTXObOQb7mwLX54n484SedHDyYHp0RQotX6jSbBwyX7VfpUaI4V3iC
 l9Ow3aUTV1BWMpRJ5J3qapp3Fe/kBPVLP00Q8QBjRz51PkKXf/7LrZjtsXrkfHmEsOe1
 WHKae3Ra4Tsj+4Pf68YbDY0lsMDKyl79jlunEBc0/SQjqclArHNtz6qmuIB13/vH9gXW
 uU1IftVBUZqxKM9N+y/aurncFjTzV974/FmDO5qFUvXe69dRQRiehSLcR71OhXGePheb
 xW1DWBSy8EwFqmgXLwQ6oaEHv8WpzLQdLQf1FMufDyVu3rTva/Gly0By4rdwGYSYV6Tt
 EsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zi6XC7xgXM4E75DCCFQG+dfwQNv3xa2eHtXmh1sF/QU=;
 b=p9ASy8fU3NU7KEMMqEYVWR5cdD+rNXm8KUAzWU05+V0AwRh6xUPVlLrT5b5FiehPGy
 w0rWw7EiS79ZSqvjeUvmAMPQ7NqZWbEvKGW9/RkjHEDiNgDSZxNYtfFICm1n/1qoxUfO
 Xrclz7zYaDanGGb5OTR9aWqYyGs/8Oox9tFLxPj02w7BS5O4PnM5phWIGIRttRDtqz9i
 v3zLKRCyxraN8OT/Ds9iFZx8x+pXxbfaKf5nexFE5HLgOXpK1YTL0mjh4ftLiCgs4dhn
 WIS1xdBVt2FtIeSBbCFnCSsww9aISIArk6wCeqsgJfTAn4vx9xChYhPbzL04LNdjUyaY
 MW6w==
X-Gm-Message-State: AOAM533pi/ARnNLZ0iw48Rds9DptXHL2hK2n6bF45uVwOJf6NDZVrv45
 Ai/lgi6qPPyBeyvE8pTIJSa5PLPW7Nw=
X-Google-Smtp-Source: ABdhPJylMfK4BgB0ibQYsTxbHrVou1VXoOxxkK6EGh+CcWpV+iR2WvGh2x0yuQY+ga1NOAuz3MN1+w==
X-Received: by 2002:a1c:1dcc:: with SMTP id d195mr11095437wmd.85.1630933918022; 
 Mon, 06 Sep 2021 06:11:58 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/36] Kconfig: Add CONFIG_SGX support
Date: Mon,  6 Sep 2021 15:10:57 +0200
Message-Id: <20210906131059.55234-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Yang Zhong <yang.zhong@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

Add new CONFIG_SGX for sgx support in the Qemu, and the Kconfig
default enable sgx in the i386 platform.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-32-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 backends/meson.build                     |  2 +-
 configs/devices/i386-softmmu/default.mak |  1 +
 hw/i386/Kconfig                          |  5 +++++
 hw/i386/meson.build                      |  4 ++--
 hw/i386/sgx-stub.c                       | 13 +++++++++++++
 5 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 hw/i386/sgx-stub.c

diff --git a/backends/meson.build b/backends/meson.build
index 46fd16b269..6e68945528 100644
--- a/backends/meson.build
+++ b/backends/meson.build
@@ -16,6 +16,6 @@ softmmu_ss.add(when: ['CONFIG_VHOST_USER', 'CONFIG_VIRTIO'], if_true: files('vho
 softmmu_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('cryptodev-vhost.c'))
 softmmu_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VHOST_CRYPTO'], if_true: files('cryptodev-vhost-user.c'))
 softmmu_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus-vmstate.c'), gio])
-softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('hostmem-epc.c'))
+softmmu_ss.add(when: 'CONFIG_SGX', if_true: files('hostmem-epc.c'))
 
 subdir('tpm')
diff --git a/configs/devices/i386-softmmu/default.mak b/configs/devices/i386-softmmu/default.mak
index 84d1a2487c..598c6646df 100644
--- a/configs/devices/i386-softmmu/default.mak
+++ b/configs/devices/i386-softmmu/default.mak
@@ -22,6 +22,7 @@
 #CONFIG_TPM_CRB=n
 #CONFIG_TPM_TIS_ISA=n
 #CONFIG_VTD=n
+#CONFIG_SGX=n
 
 # Boards:
 #
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index ddedcef0b2..962d2c981b 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -6,6 +6,10 @@ config SEV
     select X86_FW_OVMF
     depends on KVM
 
+config SGX
+    bool
+    depends on KVM
+
 config PC
     bool
     imply APPLESMC
@@ -21,6 +25,7 @@ config PC
     imply PVPANIC_ISA
     imply QXL
     imply SEV
+    imply SGX
     imply SGA
     imply TEST_DEVICES
     imply TPM_CRB
diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index fefce9e4ba..c502965219 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -5,8 +5,6 @@ i386_ss.add(files(
   'e820_memory_layout.c',
   'multiboot.c',
   'x86.c',
-  'sgx-epc.c',
-  'sgx.c'
 ))
 
 i386_ss.add(when: 'CONFIG_X86_IOMMU', if_true: files('x86-iommu.c'),
@@ -18,6 +16,8 @@ i386_ss.add(when: 'CONFIG_Q35', if_true: files('pc_q35.c'))
 i386_ss.add(when: 'CONFIG_VMMOUSE', if_true: files('vmmouse.c'))
 i386_ss.add(when: 'CONFIG_VMPORT', if_true: files('vmport.c'))
 i386_ss.add(when: 'CONFIG_VTD', if_true: files('intel_iommu.c'))
+i386_ss.add(when: 'CONFIG_SGX', if_true: files('sgx-epc.c','sgx.c'),
+                                if_false: files('sgx-stub.c'))
 
 i386_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-common.c'))
 i386_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device_x86.c'))
diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
new file mode 100644
index 0000000000..edf17c3309
--- /dev/null
+++ b/hw/i386/sgx-stub.c
@@ -0,0 +1,13 @@
+#include "qemu/osdep.h"
+#include "hw/i386/pc.h"
+#include "hw/i386/sgx-epc.h"
+
+void pc_machine_init_sgx_epc(PCMachineState *pcms)
+{
+    return;
+}
+
+int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
+{
+    return 1;
+}
-- 
2.31.1



