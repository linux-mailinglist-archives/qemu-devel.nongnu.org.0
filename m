Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EB02447D3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 12:17:05 +0200 (CEST)
Received: from localhost ([::1]:41078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6Wlk-00081W-AA
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 06:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6Vna-0007Wj-Dg
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24243
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnY-00037v-FN
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597396491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynfbcLl6Zdt9MTtUOILAaaGn/q/GyrPKPhNf79w27O0=;
 b=K9MdMq60jhnyt+Vg4VVVpsI9Jzfst1k9N9Y0jI0AJXlt2tzvKp2l5iGjptfRlHHBOEi9vV
 1HMH2ce5qVcoEi5nbF3cxrAca/Xagc1xsCnl6H5EuZVIA0Y1vElHdkI22oYPfSmqdqHrI3
 Q8Co42YBNvwywUC4c6We7lwZ2FejEFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-h1JgiKcGP8S7g8P7jd7nzA-1; Fri, 14 Aug 2020 05:14:49 -0400
X-MC-Unique: h1JgiKcGP8S7g8P7jd7nzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22BFE1015DBE
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:14:49 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2AA6600E4;
 Fri, 14 Aug 2020 09:14:48 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 114/150] meson: convert hw/ide
Date: Fri, 14 Aug 2020 05:12:50 -0400
Message-Id: <20200814091326.16173-115-pbonzini@redhat.com>
In-Reply-To: <20200814091326.16173-1-pbonzini@redhat.com>
References: <20200814091326.16173-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 03:37:30
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
 hw/Makefile.objs     |  1 -
 hw/ide/Makefile.objs | 14 --------------
 hw/ide/meson.build   | 14 ++++++++++++++
 hw/meson.build       |  1 +
 4 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 hw/ide/Makefile.objs
 create mode 100644 hw/ide/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 3feccd83d7..02c5c0d94e 100644
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
index faf04e0209..0000000000
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
index 0000000000..ddcb3b28d2
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
index b15c8d0970..4d7c31c652 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,4 +1,5 @@
 subdir('core')
+subdir('ide')
 subdir('input')
 subdir('intc')
 subdir('ipack')
-- 
2.26.2



