Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CBB240C89
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 20:00:22 +0200 (CEST)
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5C5t-0003oy-2O
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 14:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BLP-0002da-CO
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:12:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BLM-0003Gg-4W
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S6T2YffQWdjYoVOqXU1E3+XqicDKVBnQ5DL2bFHz2ZU=;
 b=CXZFWJrEujPGv6k+gN+bdELYMMlabW2fH0PbwAMMcrBmRuj3D6OUfWv2lzWUQ5zeVAiJZx
 x4PirmMvo+Pc8ubuwqT+2kggu8pm5MvfzDU4dY0JRptJ1dqun0OwpdUctpTVVfD2ihBylj
 hr3QGl9GM8girWPNMkjymYAk7kWczNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-6swGCw40MlmsyXxNkjNN-g-1; Mon, 10 Aug 2020 13:12:13 -0400
X-MC-Unique: 6swGCw40MlmsyXxNkjNN-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F2E51DE5
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:12:13 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B9F65F1E9;
 Mon, 10 Aug 2020 17:12:11 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 111/147] meson: convert hw/ide
Date: Mon, 10 Aug 2020 19:08:29 +0200
Message-Id: <1597079345-42801-112-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 13:09:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 hw/Makefile.objs     |  1 -
 hw/ide/Makefile.objs | 14 --------------
 hw/ide/meson.build   | 14 ++++++++++++++
 hw/meson.build       |  1 +
 4 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 hw/ide/Makefile.objs
 create mode 100644 hw/ide/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 3feccd8..02c5c0d 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -11,7 +11,6 @@ devices-dirs-y += dma/
 devices-dirs-y += gpio/
 devices-dirs-$(CONFIG_HYPERV) += hyperv/
 devices-dirs-$(CONFIG_I2C) += i2c/
-devices-dirs-y += ide/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/ide/Makefile.objs b/hw/ide/Makefile.objs
deleted file mode 100644
index faf04e0..0000000
--- a/hw/ide/Makefile.objs
+++ /dev/null
@@ -1,14 +0,0 @@
-common-obj-$(CONFIG_IDE_CORE) += core.o atapi.o
-common-obj-$(CONFIG_IDE_QDEV) += qdev.o
-common-obj-$(CONFIG_IDE_PCI) += pci.o
-common-obj-$(CONFIG_IDE_ISA) += isa.o ioport.o
-common-obj-$(CONFIG_IDE_PIIX) += piix.o ioport.o
-common-obj-$(CONFIG_IDE_CMD646) += cmd646.o
-common-obj-$(CONFIG_IDE_MACIO) += macio.o
-common-obj-$(CONFIG_IDE_MMIO) += mmio.o
-common-obj-$(CONFIG_IDE_VIA) += via.o
-common-obj-$(CONFIG_MICRODRIVE) += microdrive.o
-common-obj-$(CONFIG_AHCI) += ahci.o
-common-obj-$(CONFIG_AHCI_ICH9) += ich.o
-common-obj-$(CONFIG_ALLWINNER_A10) += ahci-allwinner.o
-common-obj-$(CONFIG_IDE_SII3112) += sii3112.o
diff --git a/hw/ide/meson.build b/hw/ide/meson.build
new file mode 100644
index 0000000..ddcb3b2
--- /dev/null
+++ b/hw/ide/meson.build
@@ -0,0 +1,14 @@
+softmmu_ss.add(when: 'CONFIG_AHCI', if_true: files('ahci.c'))
+softmmu_ss.add(when: 'CONFIG_AHCI_ICH9', if_true: files('ich.c'))
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('ahci-allwinner.c'))
+softmmu_ss.add(when: 'CONFIG_IDE_CMD646', if_true: files('cmd646.c'))
+softmmu_ss.add(when: 'CONFIG_IDE_CORE', if_true: files('core.c', 'atapi.c'))
+softmmu_ss.add(when: 'CONFIG_IDE_ISA', if_true: files('isa.c', 'ioport.c'))
+softmmu_ss.add(when: 'CONFIG_IDE_MACIO', if_true: files('macio.c'))
+softmmu_ss.add(when: 'CONFIG_IDE_MMIO', if_true: files('mmio.c'))
+softmmu_ss.add(when: 'CONFIG_IDE_PCI', if_true: files('pci.c'))
+softmmu_ss.add(when: 'CONFIG_IDE_PIIX', if_true: files('piix.c', 'ioport.c'))
+softmmu_ss.add(when: 'CONFIG_IDE_QDEV', if_true: files('qdev.c'))
+softmmu_ss.add(when: 'CONFIG_IDE_SII3112', if_true: files('sii3112.c'))
+softmmu_ss.add(when: 'CONFIG_IDE_VIA', if_true: files('via.c'))
+softmmu_ss.add(when: 'CONFIG_MICRODRIVE', if_true: files('microdrive.c'))
diff --git a/hw/meson.build b/hw/meson.build
index b15c8d0..4d7c31c6 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,4 +1,5 @@
 subdir('core')
+subdir('ide')
 subdir('input')
 subdir('intc')
 subdir('ipack')
-- 
1.8.3.1



