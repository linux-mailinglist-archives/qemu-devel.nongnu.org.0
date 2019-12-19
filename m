Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEBC126223
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 13:28:13 +0100 (CET)
Received: from localhost ([::1]:40080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihuuZ-0003AA-PS
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 07:28:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56533)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ihuqc-00076y-5j
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:24:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ihuqa-0005AH-Qk
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:24:06 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43240
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ihuqa-00055Q-KW
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576758243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MTILE6+vdxy7qBItCjQriTMu3xCd3lcb79EGh6nnh2c=;
 b=f8vd7oHeNfeUHjxtHoXqdCGRJeq/wTiHmSojwEmXwwRb4Jz1E5Kk3aWyUBKlPCfAYdFSzS
 jfu36Sz0H90iRjqJR8ePgNUNZ76HjaK1ZGpkxu9lA4TzFvK/7I8vrny6lPAJBM6nSPmagW
 3MKAXIrakZx/Gd16pTXsYeqwHiF2h/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-n9wBJ4gfPiyYVu7MNUwyBA-1; Thu, 19 Dec 2019 07:24:02 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCFB3801E66
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 12:24:01 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-55.ams2.redhat.com
 [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE1F160C18;
 Thu, 19 Dec 2019 12:24:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 094/132] meson: convert hw/dma
Date: Thu, 19 Dec 2019 13:23:14 +0100
Message-Id: <1576758232-12439-3-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
References: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: n9wBJ4gfPiyYVu7MNUwyBA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/Makefile.objs     |  1 -
 hw/dma/Makefile.objs | 16 ----------------
 hw/dma/meson.build   | 16 ++++++++++++++++
 hw/meson.build       |  1 +
 4 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 hw/dma/Makefile.objs
 create mode 100644 hw/dma/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 084bfc6..f5fd490 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -8,7 +8,6 @@ devices-dirs-y +=3D bt/
 devices-dirs-y +=3D char/
 devices-dirs-y +=3D cpu/
 devices-dirs-y +=3D display/
-devices-dirs-y +=3D dma/
 endif
=20
 common-obj-y +=3D $(devices-dirs-y)
diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
deleted file mode 100644
index b672e7a..0000000
--- a/hw/dma/Makefile.objs
+++ /dev/null
@@ -1,16 +0,0 @@
-common-obj-$(CONFIG_PUV3) +=3D puv3_dma.o
-common-obj-$(CONFIG_RC4030) +=3D rc4030.o
-common-obj-$(CONFIG_PL080) +=3D pl080.o
-common-obj-$(CONFIG_PL330) +=3D pl330.o
-common-obj-$(CONFIG_I82374) +=3D i82374.o
-common-obj-$(CONFIG_I8257) +=3D i8257.o
-common-obj-$(CONFIG_XILINX_AXI) +=3D xilinx_axidma.o
-common-obj-$(CONFIG_ZYNQ_DEVCFG) +=3D xlnx-zynq-devcfg.o
-common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_dma.o
-common-obj-$(CONFIG_STP2000) +=3D sparc32_dma.o
-obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx_dpdma.o
-common-obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zdma.o
-
-obj-$(CONFIG_OMAP) +=3D omap_dma.o soc_dma.o
-obj-$(CONFIG_PXA2XX) +=3D pxa2xx_dma.o
-common-obj-$(CONFIG_RASPI) +=3D bcm2835_dma.o
diff --git a/hw/dma/meson.build b/hw/dma/meson.build
new file mode 100644
index 0000000..84677ad
--- /dev/null
+++ b/hw/dma/meson.build
@@ -0,0 +1,16 @@
+softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_dma.c'))
+softmmu_ss.add(when: 'CONFIG_RC4030', if_true: files('rc4030.c'))
+softmmu_ss.add(when: 'CONFIG_PL080', if_true: files('pl080.c'))
+softmmu_ss.add(when: 'CONFIG_PL330', if_true: files('pl330.c'))
+softmmu_ss.add(when: 'CONFIG_I82374', if_true: files('i82374.c'))
+softmmu_ss.add(when: 'CONFIG_I8257', if_true: files('i8257.c'))
+softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('xilinx_axidma.c'=
))
+softmmu_ss.add(when: 'CONFIG_ZYNQ_DEVCFG', if_true: files('xlnx-zynq-devcf=
g.c'))
+softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_dma.c'))
+softmmu_ss.add(when: 'CONFIG_STP2000', if_true: files('sparc32_dma.c'))
+specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx_dpdma=
.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zdma.c=
'))
+
+specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_dma.c', 'soc_dma=
.c'))
+specific_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
+softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
diff --git a/hw/meson.build b/hw/meson.build
index a61aeaf..3263f33 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,4 +1,5 @@
 subdir('core')
+subdir('dma')
 subdir('gpio')
 subdir('hyperv')
 subdir('i2c')
--=20
1.8.3.1



