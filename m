Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5637D23E2E8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 22:11:56 +0200 (CEST)
Received: from localhost ([::1]:43054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3mF1-0005Gs-BC
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 16:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lQf-0001qS-An
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:19:53 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59854
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lQd-0006ng-C3
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596741590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XhQB4ICFW6AJbBPIjPKbDMY18H8bit53HVqzaUS2BM0=;
 b=R7UvjyqoIwM4iQWmmUWagPbm6Xws4xaZwJF+gnXFt1tGg+wSafgeGbMZMJKLlnpVKYry9Y
 zRrOhGn0C5se0vEffAUh2fugPmUrTNjrhNF4AKVR7JvahMaZ/tVJKjr6iIK66cDqpe0nd8
 IbuLqTy9OzlCNX0iJv9atkgXVhTzdgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-rcoLJU3EPvW8mF-SOdcF9Q-1; Thu, 06 Aug 2020 15:19:48 -0400
X-MC-Unique: rcoLJU3EPvW8mF-SOdcF9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22C4919200C2
 for <qemu-devel@nongnu.org>; Thu,  6 Aug 2020 19:19:48 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3439A5FC30;
 Thu,  6 Aug 2020 19:19:46 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 113/143] meson: convert hw/gpio
Date: Thu,  6 Aug 2020 21:15:49 +0200
Message-Id: <1596741379-12902-114-git-send-email-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 00:07:42
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
 hw/gpio/Makefile.objs | 12 ------------
 hw/gpio/meson.build   | 12 ++++++++++++
 hw/meson.build        |  1 +
 4 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 hw/gpio/Makefile.objs
 create mode 100644 hw/gpio/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index a2c2f6d..c04dfe5 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -8,7 +8,6 @@ devices-dirs-y += char/
 devices-dirs-y += cpu/
 devices-dirs-y += display/
 devices-dirs-y += dma/
-devices-dirs-y += gpio/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/gpio/Makefile.objs b/hw/gpio/Makefile.objs
deleted file mode 100644
index 3cfc261..0000000
--- a/hw/gpio/Makefile.objs
+++ /dev/null
@@ -1,12 +0,0 @@
-common-obj-$(CONFIG_MAX7310) += max7310.o
-common-obj-$(CONFIG_PL061) += pl061.o
-common-obj-$(CONFIG_PUV3) += puv3_gpio.o
-common-obj-$(CONFIG_ZAURUS) += zaurus.o
-common-obj-$(CONFIG_E500) += mpc8xxx.o
-common-obj-$(CONFIG_GPIO_KEY) += gpio_key.o
-
-common-obj-$(CONFIG_OMAP) += omap_gpio.o
-common-obj-$(CONFIG_IMX) += imx_gpio.o
-common-obj-$(CONFIG_RASPI) += bcm2835_gpio.o
-common-obj-$(CONFIG_NRF51_SOC) += nrf51_gpio.o
-common-obj-$(CONFIG_ASPEED_SOC) += aspeed_gpio.o
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
new file mode 100644
index 0000000..6bcdfa6
--- /dev/null
+++ b/hw/gpio/meson.build
@@ -0,0 +1,12 @@
+softmmu_ss.add(when: 'CONFIG_E500', if_true: files('mpc8xxx.c'))
+softmmu_ss.add(when: 'CONFIG_GPIO_KEY', if_true: files('gpio_key.c'))
+softmmu_ss.add(when: 'CONFIG_MAX7310', if_true: files('max7310.c'))
+softmmu_ss.add(when: 'CONFIG_PL061', if_true: files('pl061.c'))
+softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_gpio.c'))
+softmmu_ss.add(when: 'CONFIG_ZAURUS', if_true: files('zaurus.c'))
+
+softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpio.c'))
+softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_gpio.c'))
+softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gpio.c'))
+softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
+softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'))
diff --git a/hw/meson.build b/hw/meson.build
index f9e5adf..52577c3 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,4 +1,5 @@
 subdir('core')
+subdir('gpio')
 subdir('hyperv')
 subdir('i2c')
 subdir('ide')
-- 
1.8.3.1



