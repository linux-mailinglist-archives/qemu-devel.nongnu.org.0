Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1223F14C0D0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 20:19:40 +0100 (CET)
Received: from localhost ([::1]:35916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwWOh-0003ZF-1a
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 14:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35137)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iwV71-0002Wg-Db
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:57:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iwV6z-0006H8-CV
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:57:19 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36735)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iwV6z-0006Ew-5w
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:57:17 -0500
Received: by mail-wm1-x342.google.com with SMTP id p17so3583176wma.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 09:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xi9kSU3ukJ7iJvnP7TnZRVG8u6MmneTgKX5jY403d9Y=;
 b=N4rZThAwl1vZm3bRguGhk9jqUQxG1vHQ5hlrfPVHUjbY6AgkwDIh4+ka8cHJaQPTXU
 GCnVTuE81542Ppn094DzK6dyYlpncL1AHOJOSbCobH7+qjQrSEsxEZPrsj2HYEicNsMA
 41o9TRAIrYRV47zrs02uWbaE1JP28mUn/R4GNvzrfSA1OEeIjqGSyfi/bScE63CqLVpU
 aDcVM5875dIWXP1u0bKZ56sA6D5wwHCF/PvRHeJEKY8vxQKnwc0+9UApgC94DWSNI2CA
 MWtfNI65TXLJLugcqPZChBwLjUU18utPo8/lxh/vs192HWftmQl6fK7bd5EtpQwxgz3M
 NKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xi9kSU3ukJ7iJvnP7TnZRVG8u6MmneTgKX5jY403d9Y=;
 b=U9qe2cAag6Tm/YkeWie6ES38IaEr24hrDEaDfyGyG89pQJaJGz14ZkqM3MxKdczn7J
 rt5I+aU6nXoIeHWa+ZLSnY6794kj7baqGhKVSni1NmrBTzHSSSA21kPVr6Psr7brYz/x
 rvibjvjHJQaN3SIG+RLCUGjOjrlgnfqJhA9znY0L1ojZI5m7tv1O5lLT1raDaz4n6tMk
 DTptTn6m8Dr9FVAUWwVZ5lGKgSlANAoBI273/ULc2bj5BXqHSgymcRDT7dNlHlngX2kT
 bL4nJJwVdog0tYvp2709R7mecMCPgXL9m4gaZA2hSVPxSMgSmpjag1lVOr2zCxHC5wxE
 ZSVA==
X-Gm-Message-State: APjAAAVZO0FbBys1knSGyPfuiski1+q6FTfOZg1B/bsgve5Aa5Yry8fK
 M/edNAo3VY5nW3UrahXLvbw71ekc
X-Google-Smtp-Source: APXvYqxy34DJX01j66c9zKW8hkjcjCZubjXxQkHLsFs5UbCmmgUAnHSSZ7hc2HDisMREF7o67ISIfw==
X-Received: by 2002:a05:600c:2283:: with SMTP id
 3mr6329819wmf.100.1580234235779; 
 Tue, 28 Jan 2020 09:57:15 -0800 (PST)
Received: from localhost.localdomain (93-36-56-206.ip58.fastwebnet.it.
 [93.36.56.206])
 by smtp.gmail.com with ESMTPSA id o4sm27046968wrx.25.2020.01.28.09.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 09:57:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 088/142] meson: convert hw/pci
Date: Tue, 28 Jan 2020 18:52:48 +0100
Message-Id: <20200128175342.9066-89-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200128175342.9066-1-pbonzini@redhat.com>
References: <20200128175342.9066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
---
 hw/Makefile.objs     |  1 -
 hw/meson.build       |  1 +
 hw/pci/Makefile.objs | 14 --------------
 hw/pci/meson.build   | 19 +++++++++++++++++++
 4 files changed, 20 insertions(+), 15 deletions(-)
 delete mode 100644 hw/pci/Makefile.objs
 create mode 100644 hw/pci/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index d8833d54d1..cad6354eae 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -21,7 +21,6 @@ devices-dirs-y += misc/
 devices-dirs-y += net/
 devices-dirs-y += rdma/
 devices-dirs-y += nvram/
-devices-dirs-y += pci/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/meson.build b/hw/meson.build
index a7301f21e8..53c347c395 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,6 +1,7 @@
 subdir('core')
 subdir('mem')
 subdir('nubus')
+subdir('pci')
 subdir('pci-bridge')
 subdir('pci-host')
 subdir('pcmcia')
diff --git a/hw/pci/Makefile.objs b/hw/pci/Makefile.objs
deleted file mode 100644
index c78f2fb24b..0000000000
--- a/hw/pci/Makefile.objs
+++ /dev/null
@@ -1,14 +0,0 @@
-common-obj-$(CONFIG_PCI) += pci.o pci_bridge.o
-common-obj-$(CONFIG_PCI) += msix.o msi.o
-common-obj-$(CONFIG_PCI) += shpc.o
-common-obj-$(CONFIG_PCI) += slotid_cap.o
-common-obj-$(CONFIG_PCI) += pci_host.o
-
-# The functions in these modules can be used by devices too.  Since we
-# allow plugging PCIe devices into PCI buses, include them even if
-# CONFIG_PCI_EXPRESS=n.
-common-obj-$(CONFIG_PCI) += pcie.o pcie_aer.o
-common-obj-$(CONFIG_PCI_EXPRESS) += pcie_port.o pcie_host.o
-
-common-obj-$(call lnot,$(CONFIG_PCI)) += pci-stub.o
-common-obj-$(CONFIG_ALL) += pci-stub.o
diff --git a/hw/pci/meson.build b/hw/pci/meson.build
new file mode 100644
index 0000000000..5c4bbac817
--- /dev/null
+++ b/hw/pci/meson.build
@@ -0,0 +1,19 @@
+pci_ss = ss.source_set()
+pci_ss.add(files(
+  'msi.c',
+  'msix.c',
+  'pci.c',
+  'pci_bridge.c',
+  'pci_host.c',
+  'shpc.c',
+  'slotid_cap.c'
+))
+# The functions in these modules can be used by devices too.  Since we
+# allow plugging PCIe devices into PCI buses, include them even if
+# CONFIG_PCI_EXPRESS=n.
+pci_ss.add(files('pcie.c', 'pcie_aer.c'))
+softmmu_ss.add(when: 'CONFIG_PCI_EXPRESS', if_true: files('pcie_port.c', 'pcie_host.c'))
+softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
+
+softmmu_ss.add(when: 'CONFIG_PCI', if_false: files('pci-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('pci-stub.c'))
-- 
2.21.0



