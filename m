Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE32211CE95
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 14:41:36 +0100 (CET)
Received: from localhost ([::1]:59454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifOil-0004QM-Ha
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 08:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNyn-0004BD-Ic
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:54:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNyl-0007bj-RK
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:54:05 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43663)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ifNyl-0007Zz-JS
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:54:03 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d16so2590157wre.10
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 04:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TESjvbFFHZQtGhm+TKmt7RVZlTLVhBorgrOtIeNvXYE=;
 b=RIMiuXiJ3sD9iLEgnhXrRiHGKfAkf2cguKBQ7yjaPqqSwx+lg+Q+LFzuBF9spDAjpZ
 AHcgsnoFpEkK41WUBhE8LePRKERJUnFkvnH4LRnwcDF9mel+VBeorXLijXqPh3ZzkebU
 UUKQPoKZQ7OZtT02rfWwWc3LtxmmHeW3Oo8dkNDEGZ8E9EJTiTtFiR+pBSASKGjAZmJ0
 ALVJfC8Mpu1vZ8Km21MfjvcruW8Z/ZzJL0ATMLU6tYAxnfJ5+35GE5Tz+PsREj8VB7DC
 Vi0ANSG/F0OTdtYIsrtYiuZ61Bzatix41p9t5Ls+tsKaN8w2Xqz1S0Y8i8rtXa/rkjOH
 MjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TESjvbFFHZQtGhm+TKmt7RVZlTLVhBorgrOtIeNvXYE=;
 b=pYBJAYyF/2yo2GnKZzMdgSengmLdY/DbAn0CEZmXE+i2+6dus3bbNAchZjUmpfKb4Z
 rAnn7h1sZqoNXSxkHAwoHTfm0EJlflM13AQ7HQDF9cRj6bHzFN3nBom+DWWQaakiJQFd
 YDt8HoJeZ4ngtIK6Znc0y0m6CPIxgIbexZmAiUdYM69AEItbT7F1/bQrw7qWGFvGY2Gp
 0QRjyqoRf4E94zGwaZMTNKhfhmcncPaxFXRRDl2+WpH7AnF4bPspu8JJa3fiM2B2kwC3
 JZzfZZ40NZjt8Pfvu8/1+Fc3OYW5+Nvm4QOrQN3LMT4J+VdP1cr2EgR6eWiayBmmwR4l
 DLDQ==
X-Gm-Message-State: APjAAAXP/b81poj3PQvF0+aEqeexXouTGuHMrmGFhOoGf1JWTLSk7WTn
 cWvGaudppIUkDBn4C+rKzMo8aRdw
X-Google-Smtp-Source: APXvYqzfDEHha/vqe5JrB+opbsxZL4V3QVKCbH3z71XNg3oHkyU47i0TY6X/3+mULc1KDLIm+D+gZQ==
X-Received: by 2002:a5d:6ca1:: with SMTP id a1mr6002872wra.36.1576155242414;
 Thu, 12 Dec 2019 04:54:02 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n189sm5193825wme.33.2019.12.12.04.54.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Dec 2019 04:54:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 064/132] meson: convert hw/core
Date: Thu, 12 Dec 2019 13:51:48 +0100
Message-Id: <1576155176-2464-65-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
References: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42c
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/Makefile.objs      |  1 -
 hw/core/Makefile.objs | 30 ------------------------------
 hw/core/meson.build   | 39 +++++++++++++++++++++++++++++++++++++++
 hw/meson.build        |  1 +
 4 files changed, 40 insertions(+), 31 deletions(-)
 delete mode 100644 hw/core/Makefile.objs
 create mode 100644 hw/core/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 793d55b..2ef93e7 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -1,4 +1,3 @@
-devices-dirs-y = core/
 ifeq ($(CONFIG_SOFTMMU), y)
 devices-dirs-$(call lor,$(CONFIG_VIRTIO_9P),$(call land,$(CONFIG_VIRTFS),$(CONFIG_XEN))) += 9pfs/
 devices-dirs-y += acpi/
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
deleted file mode 100644
index fd0550d..0000000
--- a/hw/core/Makefile.objs
+++ /dev/null
@@ -1,30 +0,0 @@
-# core qdev-related obj files, also used by *-user:
-common-obj-y += qdev.o qdev-properties.o
-common-obj-y += bus.o reset.o
-common-obj-$(CONFIG_SOFTMMU) += qdev-fw.o
-common-obj-$(CONFIG_SOFTMMU) += fw-path-provider.o
-# irq.o needed for qdev GPIO handling:
-common-obj-y += irq.o
-common-obj-y += hotplug.o
-common-obj-$(CONFIG_SOFTMMU) += nmi.o
-common-obj-$(CONFIG_SOFTMMU) += vm-change-state-handler.o
-common-obj-y += cpu.o
-
-common-obj-$(CONFIG_EMPTY_SLOT) += empty_slot.o
-common-obj-$(CONFIG_XILINX_AXI) += stream.o
-common-obj-$(CONFIG_PTIMER) += ptimer.o
-common-obj-$(CONFIG_SOFTMMU) += sysbus.o
-common-obj-$(CONFIG_SOFTMMU) += machine.o
-common-obj-$(CONFIG_SOFTMMU) += loader.o
-common-obj-$(CONFIG_FITLOADER) += loader-fit.o
-common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
-common-obj-$(CONFIG_REGISTER) += register.o
-common-obj-$(CONFIG_OR_IRQ) += or-irq.o
-common-obj-$(CONFIG_SPLIT_IRQ) += split-irq.o
-common-obj-$(CONFIG_PLATFORM_BUS) += platform-bus.o
-common-obj-$(CONFIG_GENERIC_LOADER) += generic-loader.o
-common-obj-$(CONFIG_SOFTMMU) += null-machine.o
-
-obj-$(CONFIG_SOFTMMU) += machine-qmp-cmds.o
-obj-$(CONFIG_SOFTMMU) += numa.o
-common-obj-$(CONFIG_SOFTMMU) += machine-hmp-cmds.o
diff --git a/hw/core/meson.build b/hw/core/meson.build
new file mode 100644
index 0000000..70bdff6
--- /dev/null
+++ b/hw/core/meson.build
@@ -0,0 +1,39 @@
+common_ss.add(files(
+  # core qdev-related obj files, also used by *-user:
+  'bus.c',
+  'cpu.c',
+  'hotplug.c',
+  'qdev-properties.c',
+  'qdev.c',
+  'reset.c',
+  # irq.c needed for qdev GPIO handling:
+  'irq.c',
+))
+
+common_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
+common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
+common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
+common_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
+common_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
+common_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
+common_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
+common_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
+common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
+
+softmmu_ss.add(files(
+  'fw-path-provider.c',
+  'loader.c',
+  'machine-hmp-cmds.c',
+  'machine.c',
+  'nmi.c',
+  'null-machine.c',
+  'qdev-fw.c',
+  'qdev-properties-system.c',
+  'sysbus.c',
+  'vm-change-state-handler.c',
+))
+
+specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
+  'machine-qmp-cmds.c',
+  'numa.c',
+))
diff --git a/hw/meson.build b/hw/meson.build
index 08112a5..fe7c466 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1 +1,2 @@
+subdir('core')
 subdir('xen')
-- 
1.8.3.1



