Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC44923E2B3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 21:59:23 +0200 (CEST)
Received: from localhost ([::1]:40900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3m2s-0006Y1-TV
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 15:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lPx-0008Rl-JX
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:19:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35554
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lPv-0006i2-9x
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596741546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yb4SZnldMsHJs48ssbsPr5n2+3G0FQv6iEnjmcqKyLY=;
 b=W0Y2hQ/0Zl287uLSciaqICGmb4RvcQaLgG+ymVtVUxmvGqPbXVQNCsnt0saZyl1MgY77Ge
 rYwUf7/WEXxEWDtQy3l8RqEyHtzPrL7MHv7aDPB8XPmwSaiCTr3qz16LT/9+tNa+keurwE
 ZYV7WGB9gEjUZ8mQ2JwByBZPs/JDSzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-yPJKi5OSOzmH9T2Zb_NrJw-1; Thu, 06 Aug 2020 15:19:04 -0400
X-MC-Unique: yPJKi5OSOzmH9T2Zb_NrJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1656B8015F3
 for <qemu-devel@nongnu.org>; Thu,  6 Aug 2020 19:19:04 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27E2F69315;
 Thu,  6 Aug 2020 19:19:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 094/143] meson: convert hw/ssi
Date: Thu,  6 Aug 2020 21:15:30 +0200
Message-Id: <1596741379-12902-95-git-send-email-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 00:24:10
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
index f60fd01..e50eb04 100644
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
index 1fb1687..7564426 100644
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
index 07a85f1..0000000
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
index 0000000..f1f5c28
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
1.8.3.1



