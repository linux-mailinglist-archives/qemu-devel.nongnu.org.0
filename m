Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CC4244776
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 11:55:46 +0200 (CEST)
Received: from localhost ([::1]:52390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6WR7-000892-SA
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 05:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnZ-0007VL-Tp
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:53 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33160
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnX-00037p-SE
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597396491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9FavuJqmxsGLhsOxpQUaI0es2WjXRSahOLPo6Hf8MQ=;
 b=dULcs+J7KSKmsnJgaVUc/vwO9cCSbaOC26YA6UNDf6VAh/ULQ+94BR7TdRx9NyoAq2lx2d
 emWdS7ukmL5w344sgVqrNeYGVk4ysLC14YyQgxhJllMtn1G1ww+iGbMM5rilVJ3GLjtPk5
 FeN8/JdgPsg0Vr1koGZ4XP4xY+wABSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-1FE6vcEoN2Cd7S-NWITBKA-1; Fri, 14 Aug 2020 05:14:49 -0400
X-MC-Unique: 1FE6vcEoN2Cd7S-NWITBKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6C711853DA0
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:14:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73D2C69C9D;
 Fri, 14 Aug 2020 09:14:48 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 113/150] meson: convert hw/input
Date: Fri, 14 Aug 2020 05:12:49 -0400
Message-Id: <20200814091326.16173-114-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 01:57:54
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
 hw/Makefile.objs       |  1 -
 hw/input/Makefile.objs | 18 ------------------
 hw/input/meson.build   | 18 ++++++++++++++++++
 hw/meson.build         |  1 +
 4 files changed, 19 insertions(+), 19 deletions(-)
 delete mode 100644 hw/input/Makefile.objs
 create mode 100644 hw/input/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 80b104168a..3feccd83d7 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -12,7 +12,6 @@ devices-dirs-y += gpio/
 devices-dirs-$(CONFIG_HYPERV) += hyperv/
 devices-dirs-$(CONFIG_I2C) += i2c/
 devices-dirs-y += ide/
-devices-dirs-y += input/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/input/Makefile.objs b/hw/input/Makefile.objs
deleted file mode 100644
index abc1ff03c0..0000000000
--- a/hw/input/Makefile.objs
+++ /dev/null
@@ -1,18 +0,0 @@
-common-obj-$(CONFIG_ADB) += adb.o adb-mouse.o adb-kbd.o
-common-obj-y += hid.o
-common-obj-$(CONFIG_LM832X) += lm832x.o
-common-obj-$(CONFIG_PCKBD) += pckbd.o
-common-obj-$(CONFIG_PL050) += pl050.o
-common-obj-$(CONFIG_PS2) += ps2.o
-common-obj-$(CONFIG_STELLARIS_INPUT) += stellaris_input.o
-common-obj-$(CONFIG_TSC2005) += tsc2005.o
-
-common-obj-$(CONFIG_VIRTIO_INPUT) += virtio-input.o
-common-obj-$(CONFIG_VIRTIO_INPUT) += virtio-input-hid.o
-common-obj-$(CONFIG_VIRTIO_INPUT_HOST) += virtio-input-host.o
-common-obj-$(CONFIG_VHOST_USER_INPUT) += vhost-user-input.o
-
-common-obj-$(CONFIG_MILKYMIST) += milkymist-softusb.o
-common-obj-$(CONFIG_PXA2XX) += pxa2xx_keypad.o
-common-obj-$(CONFIG_TSC210X) += tsc210x.o
-common-obj-$(CONFIG_LASIPS2) += lasips2.o
diff --git a/hw/input/meson.build b/hw/input/meson.build
new file mode 100644
index 0000000000..e7285b15ae
--- /dev/null
+++ b/hw/input/meson.build
@@ -0,0 +1,18 @@
+softmmu_ss.add(files('hid.c'))
+softmmu_ss.add(when: 'CONFIG_ADB', if_true: files('adb.c', 'adb-mouse.c', 'adb-kbd.c'))
+softmmu_ss.add(when: 'CONFIG_LM832X', if_true: files('lm832x.c'))
+softmmu_ss.add(when: 'CONFIG_PCKBD', if_true: files('pckbd.c'))
+softmmu_ss.add(when: 'CONFIG_PL050', if_true: files('pl050.c'))
+softmmu_ss.add(when: 'CONFIG_PS2', if_true: files('ps2.c'))
+softmmu_ss.add(when: 'CONFIG_STELLARIS_INPUT', if_true: files('stellaris_input.c'))
+softmmu_ss.add(when: 'CONFIG_TSC2005', if_true: files('tsc2005.c'))
+
+softmmu_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-input.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-input-hid.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO_INPUT_HOST', if_true: files('virtio-input-host.c'))
+softmmu_ss.add(when: 'CONFIG_VHOST_USER_INPUT', if_true: files('vhost-user-input.c'))
+
+softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-softusb.c'))
+softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_keypad.c'))
+softmmu_ss.add(when: 'CONFIG_TSC210X', if_true: files('tsc210x.c'))
+softmmu_ss.add(when: 'CONFIG_LASIPS2', if_true: files('lasips2.c'))
diff --git a/hw/meson.build b/hw/meson.build
index 986e710287..b15c8d0970 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,4 +1,5 @@
 subdir('core')
+subdir('input')
 subdir('intc')
 subdir('ipack')
 subdir('ipmi')
-- 
2.26.2



