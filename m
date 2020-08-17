Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484C0246987
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 17:23:17 +0200 (CEST)
Received: from localhost ([::1]:37332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7gyi-00029r-69
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 11:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k7gJs-0001mQ-JP
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 10:41:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39757
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k7gJq-0006nT-D9
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 10:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597675261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sg9YVJRv6wW6cfJ0v4OQv28WxAZBM0uAS+h3Qkeg40s=;
 b=V/eGCTJZrq0iS9+7Xkd1AN+ZsXcixmCg0kHzTiKl+znijk/ZEn47iM7Hd8sLgIxKNTv95Z
 0MheDXt/lMYsA3vDPIS3+b3CVrg9TGvZ48hcFC7vPlppSnbgMykd+gjedAzVmRlJkH6Smv
 ODmyPzW4cwJqNsF4zsH8SmF6pP2Lp6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-FkH_GiQuOoaJXhG0sxnJ4g-1; Mon, 17 Aug 2020 10:40:59 -0400
X-MC-Unique: FkH_GiQuOoaJXhG0sxnJ4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDD7457085
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 14:40:58 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5209F756AB;
 Mon, 17 Aug 2020 14:40:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 097/150] meson: convert hw/ssi
Date: Mon, 17 Aug 2020 16:40:00 +0200
Message-Id: <20200817144053.345107-2-pbonzini@redhat.com>
In-Reply-To: <20200817143723.343284-1-pbonzini@redhat.com>
References: <20200817143723.343284-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 05:13:21
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
 hw/meson.build       |  1 +
 hw/ssi/Makefile.objs | 10 ----------
 hw/ssi/meson.build   |  9 +++++++++
 4 files changed, 10 insertions(+), 11 deletions(-)
 delete mode 100644 hw/ssi/Makefile.objs
 create mode 100644 hw/ssi/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index f60fd019ac..e50eb04635 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -26,7 +26,6 @@ devices-dirs-$(CONFIG_PCI) += pci-bridge/ pci-host/
 devices-dirs-y += pcmcia/
 devices-dirs-$(CONFIG_SCSI) += scsi/
 devices-dirs-y += sd/
-devices-dirs-y += ssi/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/meson.build b/hw/meson.build
index 1fb1687e1e..75644266f2 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -4,6 +4,7 @@ subdir('nubus')
 subdir('rtc')
 subdir('semihosting')
 subdir('smbios')
+subdir('ssi')
 subdir('timer')
 subdir('tpm')
 subdir('usb')
diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs
deleted file mode 100644
index 07a85f1967..0000000000
--- a/hw/ssi/Makefile.objs
+++ /dev/null
@@ -1,10 +0,0 @@
-common-obj-$(CONFIG_PL022) += pl022.o
-common-obj-$(CONFIG_SSI) += ssi.o
-common-obj-$(CONFIG_XILINX_SPI) += xilinx_spi.o
-common-obj-$(CONFIG_XILINX_SPIPS) += xilinx_spips.o
-common-obj-$(CONFIG_ASPEED_SOC) += aspeed_smc.o
-common-obj-$(CONFIG_STM32F2XX_SPI) += stm32f2xx_spi.o
-common-obj-$(CONFIG_MSF2) += mss-spi.o
-
-common-obj-$(CONFIG_OMAP) += omap_spi.o
-common-obj-$(CONFIG_IMX) += imx_spi.o
diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
new file mode 100644
index 0000000000..f1f5c287d0
--- /dev/null
+++ b/hw/ssi/meson.build
@@ -0,0 +1,9 @@
+softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_smc.c'))
+softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-spi.c'))
+softmmu_ss.add(when: 'CONFIG_PL022', if_true: files('pl022.c'))
+softmmu_ss.add(when: 'CONFIG_SSI', if_true: files('ssi.c'))
+softmmu_ss.add(when: 'CONFIG_STM32F2XX_SPI', if_true: files('stm32f2xx_spi.c'))
+softmmu_ss.add(when: 'CONFIG_XILINX_SPI', if_true: files('xilinx_spi.c'))
+softmmu_ss.add(when: 'CONFIG_XILINX_SPIPS', if_true: files('xilinx_spips.c'))
+softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_spi.c'))
+softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_spi.c'))
-- 
2.26.2



