Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0123E306
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 22:18:47 +0200 (CEST)
Received: from localhost ([::1]:46732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3mLe-0001LL-In
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 16:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lQu-0002Lb-2w
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:20:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48129
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lQr-0006rN-TK
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596741605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uMwCXBbuAcSBH1xta3qaNV59S+O7BdB/TdI6Kh9HkK4=;
 b=K+KSI18cQgJbpoiC+CK3SLDc4T8bTJ70zjyDOuASoG7xW8yTuNxWhD2F1oygyyTM9bQJn+
 c9Seuqh3MKQeeNk213+wsaheP/S0RelUXFKGqC88vVF7AoD/eCDk5sjn1S5ugzH0SN4rCX
 QV6+xtaywhCXeIvQyHkX48ox8e0N5BY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-5GeoqKaPNg6DY_PT9z4THw-1; Thu, 06 Aug 2020 15:20:03 -0400
X-MC-Unique: 5GeoqKaPNg6DY_PT9z4THw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2887800469
 for <qemu-devel@nongnu.org>; Thu,  6 Aug 2020 19:20:02 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1EA81D3;
 Thu,  6 Aug 2020 19:20:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 121/143] meson: convert hw/acpi
Date: Thu,  6 Aug 2020 21:15:57 +0200
Message-Id: <1596741379-12902-122-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 03:10:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/Makefile.objs      |  1 -
 hw/acpi/Makefile.objs | 26 --------------------------
 hw/acpi/meson.build   | 25 +++++++++++++++++++++++++
 hw/meson.build        |  1 +
 4 files changed, 26 insertions(+), 27 deletions(-)
 delete mode 100644 hw/acpi/Makefile.objs
 create mode 100644 hw/acpi/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 4bdb674..ebae00a 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -1,6 +1,5 @@
 ifeq ($(CONFIG_SOFTMMU), y)
 devices-dirs-$(call lor,$(CONFIG_VIRTIO_9P),$(call land,$(CONFIG_VIRTFS),$(CONFIG_XEN))) += 9pfs/
-devices-dirs-y += acpi/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
deleted file mode 100644
index 72886c7..0000000
--- a/hw/acpi/Makefile.objs
+++ /dev/null
@@ -1,26 +0,0 @@
-ifeq ($(CONFIG_ACPI),y)
-common-obj-$(CONFIG_ACPI_X86) += core.o piix4.o pcihp.o
-common-obj-$(CONFIG_ACPI_X86_ICH) += ich9.o tco.o
-common-obj-$(CONFIG_ACPI_CPU_HOTPLUG) += cpu_hotplug.o
-common-obj-$(CONFIG_ACPI_MEMORY_HOTPLUG) += memory_hotplug.o
-common-obj-$(CONFIG_ACPI_CPU_HOTPLUG) += cpu.o
-common-obj-$(CONFIG_ACPI_NVDIMM) += nvdimm.o
-common-obj-$(CONFIG_ACPI_VMGENID) += vmgenid.o
-common-obj-$(CONFIG_ACPI_HW_REDUCED) += generic_event_device.o
-common-obj-$(CONFIG_ACPI_HMAT) += hmat.o
-common-obj-$(CONFIG_ACPI_APEI) += ghes.o
-common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
-common-obj-$(call lnot,$(CONFIG_PC)) += acpi-x86-stub.o
-
-common-obj-y += acpi_interface.o
-common-obj-y += bios-linker-loader.o
-common-obj-y += aml-build.o utils.o
-common-obj-$(CONFIG_ACPI_PCI) += pci.o
-common-obj-$(CONFIG_TPM) += tpm.o
-
-common-obj-$(CONFIG_IPMI) += ipmi.o
-common-obj-$(call lnot,$(CONFIG_IPMI)) += ipmi-stub.o
-else
-common-obj-y += acpi-stub.o aml-build-stub.o
-endif
-common-obj-$(CONFIG_ALL) += acpi-stub.o aml-build-stub.o acpi-x86-stub.o ipmi-stub.o
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
new file mode 100644
index 0000000..dd69577
--- /dev/null
+++ b/hw/acpi/meson.build
@@ -0,0 +1,25 @@
+acpi_ss = ss.source_set()
+acpi_ss.add(files(
+  'acpi_interface.c',
+  'aml-build.c',
+  'bios-linker-loader.c',
+  'utils.c',
+))
+acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_hotplug.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_MEMORY_HOTPLUG', if_true: files('memory_hotplug.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_NVDIMM', if_true: files('nvdimm.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_PCI', if_true: files('pci.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_VMGENID', if_true: files('vmgenid.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('core.c', 'piix4.c', 'pcihp.c'), if_false: files('acpi-stub.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
+acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
+acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
+acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
+softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c'))
+softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
+                                                  'acpi-x86-stub.c', 'ipmi-stub.c'))
diff --git a/hw/meson.build b/hw/meson.build
index ffa3f06..55ca2b2 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,3 +1,4 @@
+subdir('acpi')
 subdir('adc')
 subdir('audio')
 subdir('block')
-- 
1.8.3.1



