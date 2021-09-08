Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32864037FD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:38:59 +0200 (CEST)
Received: from localhost ([::1]:54124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuyl-0001nG-D0
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuSE-0006yl-8j
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:18 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRy-0003Bk-Jl
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:16 -0400
Received: by mail-wr1-x435.google.com with SMTP id u16so2409858wrn.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zi6XC7xgXM4E75DCCFQG+dfwQNv3xa2eHtXmh1sF/QU=;
 b=PJGC99++uvylq0bGOqzma1mnJ2D8unoH6MzAJu0Lw/VmtEerErGfF3xvJkJLDuTRyZ
 GeDsytpI1531/CheCBmywGmHt/IdlceKp2MV06ZwajlWkBo3dDhEEf/+lZuYLiUPmusA
 tet1cn4Lfb82Z/HZt+PS3Qkmtuf8DptX27wo/G0IZBSeM8/UcBDjvRxF631MhbNMeXkW
 FmLBOtaZbpyhSCJ6RCgZ5DqMEMwFjvASzqN5s53ACDFDg8aa4IgUaCt1kiRt6DJ9IgJ4
 nhrAjKkRGspVqzwcaV5xzbpxF6ubizeVxho1wJ0BJXJVXZ5jfSyynoT5yMDFN26edLAq
 vPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zi6XC7xgXM4E75DCCFQG+dfwQNv3xa2eHtXmh1sF/QU=;
 b=KdTslvdMfGvkgad2wsWZwcuuh44i89pq3yyZiQZVGzHocP8Gq9JD1t/Xs0xx59FLsB
 EW8fhlRSExxwfFdvVk/QUrwI6TBB3bZOqzuUqXzUsWVO/eqhGswH38TYIeo0vZmt74Ga
 QqH2UQG9eeQ0ZbTar3lq1VNuRppq5zOkmR631wmdkAX27aleK+KREANV0l3OvtS56qWr
 qBRn0xLzhe0YYE2gXsr0ou3vhC/fSCFnRK60Q9WIHmJrZ2p29brn9Hvy9L+hbfl6LV3t
 mudwPbzChgj1rkyR5CD75kKMBmnjgM0Oe9rQobUjTACxmjqM1Vt4/gWX3u3E4pOPaWdo
 6big==
X-Gm-Message-State: AOAM530YAxWwt6gkp0G8ihHd+8534GpIjjJRiw4kscdPyLbcWmrnALpx
 0tp+M8ULK5/d1ETUsYpu0YEPsaMhTdE=
X-Google-Smtp-Source: ABdhPJwN7p4d7yzEv9mONWbC2wfeD1jf/81s8BdenoUg4X//Q291WlXZVyAl+oO6TApzlEf/nJ4wyQ==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr3056490wrn.122.1631095501257; 
 Wed, 08 Sep 2021 03:05:01 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:05:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 35/43] Kconfig: Add CONFIG_SGX support
Date: Wed,  8 Sep 2021 12:04:18 +0200
Message-Id: <20210908100426.264356-36-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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



