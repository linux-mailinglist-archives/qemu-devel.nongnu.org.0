Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D9B240C68
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 19:52:16 +0200 (CEST)
Received: from localhost ([::1]:41776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5By2-00071f-Vv
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 13:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BL3-00021u-GR
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:11:57 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60387
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BL0-0003DP-50
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugDcYuIzdP8Nrf8EU2dGGi9zNntTRxfmFKqcvef77l4=;
 b=ZnOzkwuqGGy992wXbE2wXmIGv5WPa2s1vuXQ9sNqlV3E7fQnshvfT0u7XpSmAVx0u6P687
 2b4JF2UJhvrXzGLXOqVIMwmSa+RZaLs/Os4J4eT7qu9EQr3tF/QF9kC3hz9L9h1bRRJbCr
 AqHh+/XMr+85uhoSM9jP14A5bPH+IGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-vh7P-YmTM4OYUghsmElP3A-1; Mon, 10 Aug 2020 13:11:51 -0400
X-MC-Unique: vh7P-YmTM4OYUghsmElP3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDBCD1005504
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:11:50 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C88DF5F1E9;
 Mon, 10 Aug 2020 17:11:49 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 097/147] meson: convert hw/scsi
Date: Mon, 10 Aug 2020 19:08:15 +0200
Message-Id: <1597079345-42801-98-git-send-email-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 03:29:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
 hw/meson.build        |  1 +
 hw/scsi/Makefile.objs | 15 ---------------
 hw/scsi/meson.build   | 26 ++++++++++++++++++++++++++
 4 files changed, 27 insertions(+), 16 deletions(-)
 delete mode 100644 hw/scsi/Makefile.objs
 create mode 100644 hw/scsi/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 6f9c0b7..b6461c2 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -24,7 +24,6 @@ devices-dirs-y += nvram/
 devices-dirs-y += pci/
 devices-dirs-$(CONFIG_PCI) += pci-bridge/ pci-host/
 devices-dirs-y += pcmcia/
-devices-dirs-$(CONFIG_SCSI) += scsi/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/meson.build b/hw/meson.build
index a73f4ae..d4abb67 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -2,6 +2,7 @@ subdir('core')
 subdir('mem')
 subdir('nubus')
 subdir('rtc')
+subdir('scsi')
 subdir('sd')
 subdir('semihosting')
 subdir('smbios')
diff --git a/hw/scsi/Makefile.objs b/hw/scsi/Makefile.objs
deleted file mode 100644
index 54b36ed..0000000
--- a/hw/scsi/Makefile.objs
+++ /dev/null
@@ -1,15 +0,0 @@
-common-obj-y += scsi-disk.o emulation.o
-common-obj-y += scsi-generic.o scsi-bus.o
-common-obj-$(CONFIG_LSI_SCSI_PCI) += lsi53c895a.o
-common-obj-$(CONFIG_MPTSAS_SCSI_PCI) += mptsas.o mptconfig.o mptendian.o
-common-obj-$(CONFIG_MEGASAS_SCSI_PCI) += megasas.o
-common-obj-$(CONFIG_VMW_PVSCSI_SCSI_PCI) += vmw_pvscsi.o
-common-obj-$(CONFIG_ESP) += esp.o
-common-obj-$(CONFIG_ESP_PCI) += esp-pci.o
-obj-$(CONFIG_SPAPR_VSCSI) += spapr_vscsi.o
-
-ifeq ($(CONFIG_VIRTIO_SCSI),y)
-obj-y += virtio-scsi.o virtio-scsi-dataplane.o
-obj-$(CONFIG_VHOST_SCSI) += vhost-scsi-common.o vhost-scsi.o
-obj-$(CONFIG_VHOST_USER_SCSI) += vhost-scsi-common.o vhost-user-scsi.o
-endif
diff --git a/hw/scsi/meson.build b/hw/scsi/meson.build
new file mode 100644
index 0000000..923a34f
--- /dev/null
+++ b/hw/scsi/meson.build
@@ -0,0 +1,26 @@
+scsi_ss = ss.source_set()
+scsi_ss.add(files(
+  'emulation.c',
+  'scsi-bus.c',
+  'scsi-disk.c',
+  'scsi-generic.c',
+))
+scsi_ss.add(when: 'CONFIG_ESP', if_true: files('esp.c'))
+scsi_ss.add(when: 'CONFIG_ESP_PCI', if_true: files('esp-pci.c'))
+scsi_ss.add(when: 'CONFIG_LSI_SCSI_PCI', if_true: files('lsi53c895a.c'))
+scsi_ss.add(when: 'CONFIG_MEGASAS_SCSI_PCI', if_true: files('megasas.c'))
+scsi_ss.add(when: 'CONFIG_MPTSAS_SCSI_PCI', if_true: files('mptsas.c', 'mptconfig.c', 'mptendian.c'))
+scsi_ss.add(when: 'CONFIG_VMW_PVSCSI_SCSI_PCI', if_true: files('vmw_pvscsi.c'))
+softmmu_ss.add_all(when: 'CONFIG_SCSI', if_true: scsi_ss)
+
+specific_scsi_ss = ss.source_set()
+
+virtio_scsi_ss = ss.source_set()
+virtio_scsi_ss.add(files('virtio-scsi.c', 'virtio-scsi-dataplane.c'))
+virtio_scsi_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-scsi-common.c', 'vhost-scsi.c'))
+virtio_scsi_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true: files('vhost-scsi-common.c', 'vhost-user-scsi.c'))
+specific_scsi_ss.add_all(when: 'CONFIG_VIRTIO_SCSI', if_true: virtio_scsi_ss)
+
+specific_scsi_ss.add(when: 'CONFIG_SPAPR_VSCSI', if_true: files('spapr_vscsi.c'))
+
+specific_ss.add_all(when: 'CONFIG_SCSI', if_true: specific_scsi_ss)
-- 
1.8.3.1



