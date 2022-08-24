Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F9559F7A1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:27:06 +0200 (CEST)
Received: from localhost ([::1]:55476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnbE-0006WL-RA
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuM-0003zQ-Ld; Wed, 24 Aug 2022 05:42:46 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuJ-0001ar-9t; Wed, 24 Aug 2022 05:42:46 -0400
Received: by mail-pl1-x636.google.com with SMTP id c2so15204130plo.3;
 Wed, 24 Aug 2022 02:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=8cdvfFR41bNG20qDmhS/eM1yLaADTlT1CXePgdiY3RA=;
 b=p1viruIfLlnSonmUePXWWlgTgxuADqVRqGQPl4piM7ddJj4ez6OAPWKU1+nr9xXryn
 0LYM78u8f59yMYnEUAM58Wu9yRNZKq6jK0FVnFMeN4kMHJZBREgs6KwUJpeM/M3TttWd
 RHNH68tw80UnN8tpjGCVR616f0KWwY1RSAheIKzGKYZzoNafY+is0cayCNHWvvV9xkJk
 IKjJF++gHmRgLB359eu5jOSuzLVF2kt019nH7sYCEBr4/o5ZdQsqF2q/yo9nbOou47CA
 4i3css5q/ciCgocEOcWCmRLOmPnJSZ+VYlzQ6bNtyvuVi7Q4rswPizCJk0Ab6/GILzT4
 wgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=8cdvfFR41bNG20qDmhS/eM1yLaADTlT1CXePgdiY3RA=;
 b=u0E4ICRGZ2OyUoTv9rO76jutkqAQRFduLgMf6fM0+Hxq6OuMER4pvpQGo9OXPDgsKk
 yDWLWhVy8xOeIw5L4l/mBQCoYPYlbhQMmrXuNF3EtSu7PSDSN16qh5kqw234/bdQQMNU
 B1/Jf2D+IiVtr4ZYrDSULT8BdVCxXzlx/6pwAlMmUbGsyRqstf6kIFQz1i8znNhjB9VH
 fLPp+N3Sjz4SUKY7Ffb/XKcQuqD7Bl1KzVf/TT3WQKfr2UbZHSpDqmhKMX30pHBQBHF7
 p9S+wp27lFhVovdm8BwDBXefuZQf4AdqbDyB2ITK6vEWC9gCs0aMT00ZTwUbZqO2rfOv
 9rnQ==
X-Gm-Message-State: ACgBeo1E5E8BHuCe2v4tCrvxxyPZrpwVpwSUAIQVnHI/Wxu/o0fl58i4
 2+FrBTHmPdybcwvwmsXyvkecbk9/k3s=
X-Google-Smtp-Source: AA6agR6PZP203B+5K55eEac5EKeL7Rl0ZEfkE41ZS89EILVSFq9krLKz7cOjTZOmHeZD2RL43Ilm2Q==
X-Received: by 2002:a17:90b:30cb:b0:1fa:d69e:b581 with SMTP id
 hi11-20020a17090b30cb00b001fad69eb581mr7508763pjb.103.1661334161472; 
 Wed, 24 Aug 2022 02:42:41 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:41 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org
Subject: [PATCH 25/51] tests/qtest: libqos: Rename malloc.h to libqos-malloc.h
Date: Wed, 24 Aug 2022 17:40:03 +0800
Message-Id: <20220824094029.1634519-26-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

The qtest/libqos directory is included via the "-I" option to search
for header files when building qtest. Unfortunately the malloc.h has
a name conflict with the standard libc header, leading to a build
failure on the Windows host, due to the MinGW libc stdlib.h header
file includes malloc.h and it now gets wrongly pointed to the one
in the qtest/libqos directory.

Rename "qtest/libqos/malloc.h" to "qtest/libqos/libqos-malloc.h" to
avoid the namespace pollution.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/libqos/generic-pcihost.h             | 2 +-
 tests/qtest/libqos/{malloc.h => libqos-malloc.h} | 0
 tests/qtest/libqos/libqos.h                      | 2 +-
 tests/qtest/libqos/malloc-pc.h                   | 2 +-
 tests/qtest/libqos/malloc-spapr.h                | 2 +-
 tests/qtest/libqos/pci-pc.h                      | 2 +-
 tests/qtest/libqos/pci-spapr.h                   | 2 +-
 tests/qtest/libqos/qgraph.h                      | 2 +-
 tests/qtest/libqos/qos_external.h                | 2 +-
 tests/qtest/libqos/rtas.h                        | 2 +-
 tests/qtest/libqos/virtio.h                      | 2 +-
 tests/qtest/e1000e-test.c                        | 2 +-
 tests/qtest/fuzz/qos_fuzz.c                      | 2 +-
 tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c | 2 +-
 tests/qtest/libqos/arm-imx25-pdk-machine.c       | 2 +-
 tests/qtest/libqos/arm-n800-machine.c            | 2 +-
 tests/qtest/libqos/arm-raspi2-machine.c          | 2 +-
 tests/qtest/libqos/arm-sabrelite-machine.c       | 2 +-
 tests/qtest/libqos/arm-smdkc210-machine.c        | 2 +-
 tests/qtest/libqos/arm-virt-machine.c            | 2 +-
 tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c  | 2 +-
 tests/qtest/libqos/e1000e.c                      | 2 +-
 tests/qtest/libqos/{malloc.c => libqos-malloc.c} | 2 +-
 tests/qtest/libqos/qos_external.c                | 2 +-
 tests/qtest/libqos/virtio-mmio.c                 | 2 +-
 tests/qtest/libqos/virtio-pci.c                  | 2 +-
 tests/qtest/qos-test.c                           | 2 +-
 tests/qtest/libqos/meson.build                   | 2 +-
 28 files changed, 27 insertions(+), 27 deletions(-)
 rename tests/qtest/libqos/{malloc.h => libqos-malloc.h} (100%)
 rename tests/qtest/libqos/{malloc.c => libqos-malloc.c} (99%)

diff --git a/tests/qtest/libqos/generic-pcihost.h b/tests/qtest/libqos/generic-pcihost.h
index c693c769df..6493a8712a 100644
--- a/tests/qtest/libqos/generic-pcihost.h
+++ b/tests/qtest/libqos/generic-pcihost.h
@@ -14,7 +14,7 @@
 #define LIBQOS_GENERIC_PCIHOST_H
 
 #include "pci.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 
 typedef struct QGenericPCIBus {
diff --git a/tests/qtest/libqos/malloc.h b/tests/qtest/libqos/libqos-malloc.h
similarity index 100%
rename from tests/qtest/libqos/malloc.h
rename to tests/qtest/libqos/libqos-malloc.h
diff --git a/tests/qtest/libqos/libqos.h b/tests/qtest/libqos/libqos.h
index ba7df448ca..9b4dd509f0 100644
--- a/tests/qtest/libqos/libqos.h
+++ b/tests/qtest/libqos/libqos.h
@@ -3,7 +3,7 @@
 
 #include "../libqtest.h"
 #include "pci.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 
 typedef struct QOSState QOSState;
 
diff --git a/tests/qtest/libqos/malloc-pc.h b/tests/qtest/libqos/malloc-pc.h
index d8d79853c8..e531473601 100644
--- a/tests/qtest/libqos/malloc-pc.h
+++ b/tests/qtest/libqos/malloc-pc.h
@@ -13,7 +13,7 @@
 #ifndef LIBQOS_MALLOC_PC_H
 #define LIBQOS_MALLOC_PC_H
 
-#include "malloc.h"
+#include "libqos-malloc.h"
 
 void pc_alloc_init(QGuestAllocator *s, QTestState *qts, QAllocOpts flags);
 
diff --git a/tests/qtest/libqos/malloc-spapr.h b/tests/qtest/libqos/malloc-spapr.h
index f99572fd71..f544c0d611 100644
--- a/tests/qtest/libqos/malloc-spapr.h
+++ b/tests/qtest/libqos/malloc-spapr.h
@@ -8,7 +8,7 @@
 #ifndef LIBQOS_MALLOC_SPAPR_H
 #define LIBQOS_MALLOC_SPAPR_H
 
-#include "malloc.h"
+#include "libqos-malloc.h"
 
 void spapr_alloc_init(QGuestAllocator *s, QTestState *qts, QAllocOpts flags);
 
diff --git a/tests/qtest/libqos/pci-pc.h b/tests/qtest/libqos/pci-pc.h
index 49ec9507f2..849bd493de 100644
--- a/tests/qtest/libqos/pci-pc.h
+++ b/tests/qtest/libqos/pci-pc.h
@@ -14,7 +14,7 @@
 #define LIBQOS_PCI_PC_H
 
 #include "pci.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 
 typedef struct QPCIBusPC {
diff --git a/tests/qtest/libqos/pci-spapr.h b/tests/qtest/libqos/pci-spapr.h
index 20a43718b7..3dbf1e58ae 100644
--- a/tests/qtest/libqos/pci-spapr.h
+++ b/tests/qtest/libqos/pci-spapr.h
@@ -8,7 +8,7 @@
 #ifndef LIBQOS_PCI_SPAPR_H
 #define LIBQOS_PCI_SPAPR_H
 
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "pci.h"
 #include "qgraph.h"
 
diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
index 871740c0dc..6e94824d09 100644
--- a/tests/qtest/libqos/qgraph.h
+++ b/tests/qtest/libqos/qgraph.h
@@ -21,7 +21,7 @@
 
 #include <gmodule.h>
 #include "qemu/module.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 
 /* maximum path length */
 #define QOS_PATH_MAX_ELEMENT_SIZE 50
diff --git a/tests/qtest/libqos/qos_external.h b/tests/qtest/libqos/qos_external.h
index 8446e3df0b..ea37364887 100644
--- a/tests/qtest/libqos/qos_external.h
+++ b/tests/qtest/libqos/qos_external.h
@@ -21,7 +21,7 @@
 
 #include "qgraph.h"
 
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qapi/qapi-types-machine.h"
 #include "qapi/qapi-types-qom.h"
 
diff --git a/tests/qtest/libqos/rtas.h b/tests/qtest/libqos/rtas.h
index f38f99dfab..be8353d505 100644
--- a/tests/qtest/libqos/rtas.h
+++ b/tests/qtest/libqos/rtas.h
@@ -5,7 +5,7 @@
 
 #ifndef LIBQOS_RTAS_H
 #define LIBQOS_RTAS_H
-#include "malloc.h"
+#include "libqos-malloc.h"
 
 int qrtas_get_time_of_day(QTestState *qts, QGuestAllocator *alloc,
                           struct tm *tm, uint32_t *ns);
diff --git a/tests/qtest/libqos/virtio.h b/tests/qtest/libqos/virtio.h
index b8bd06e1b8..7adc7cbd10 100644
--- a/tests/qtest/libqos/virtio.h
+++ b/tests/qtest/libqos/virtio.h
@@ -10,7 +10,7 @@
 #ifndef LIBQOS_VIRTIO_H
 #define LIBQOS_VIRTIO_H
 
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "standard-headers/linux/virtio_ring.h"
 
 #define QVIRTIO_F_BAD_FEATURE           0x40000000ull
diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index c98779c7c0..4cdd8238f2 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -31,7 +31,7 @@
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/bitops.h"
-#include "libqos/malloc.h"
+#include "libqos/libqos-malloc.h"
 #include "libqos/e1000e.h"
 
 static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
index c856d3d500..3a3d9c16dd 100644
--- a/tests/qtest/fuzz/qos_fuzz.c
+++ b/tests/qtest/fuzz/qos_fuzz.c
@@ -23,7 +23,7 @@
 #include "qemu/main-loop.h"
 
 #include "tests/qtest/libqtest.h"
-#include "tests/qtest/libqos/malloc.h"
+#include "tests/qtest/libqos/libqos-malloc.h"
 #include "tests/qtest/libqos/qgraph.h"
 #include "tests/qtest/libqos/qgraph_internal.h"
 #include "tests/qtest/libqos/qos_external.h"
diff --git a/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c b/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
index c8a3ea11eb..ab24add8eb 100644
--- a/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
+++ b/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "../libqtest.h"
 #include "qemu/module.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "sdhci.h"
 
diff --git a/tests/qtest/libqos/arm-imx25-pdk-machine.c b/tests/qtest/libqos/arm-imx25-pdk-machine.c
index 54d0c95330..8fe128fae8 100644
--- a/tests/qtest/libqos/arm-imx25-pdk-machine.c
+++ b/tests/qtest/libqos/arm-imx25-pdk-machine.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "../libqtest.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "i2c.h"
 
diff --git a/tests/qtest/libqos/arm-n800-machine.c b/tests/qtest/libqos/arm-n800-machine.c
index ecd46b1daf..4e5afe0164 100644
--- a/tests/qtest/libqos/arm-n800-machine.c
+++ b/tests/qtest/libqos/arm-n800-machine.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "../libqtest.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "i2c.h"
 
diff --git a/tests/qtest/libqos/arm-raspi2-machine.c b/tests/qtest/libqos/arm-raspi2-machine.c
index 0a2943440b..367c6c17a5 100644
--- a/tests/qtest/libqos/arm-raspi2-machine.c
+++ b/tests/qtest/libqos/arm-raspi2-machine.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "../libqtest.h"
 #include "qemu/module.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "sdhci.h"
 
diff --git a/tests/qtest/libqos/arm-sabrelite-machine.c b/tests/qtest/libqos/arm-sabrelite-machine.c
index ec19a01660..94f6a20fc7 100644
--- a/tests/qtest/libqos/arm-sabrelite-machine.c
+++ b/tests/qtest/libqos/arm-sabrelite-machine.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "../libqtest.h"
 #include "qemu/module.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "sdhci.h"
 
diff --git a/tests/qtest/libqos/arm-smdkc210-machine.c b/tests/qtest/libqos/arm-smdkc210-machine.c
index 4bff249ee8..9bbce924ea 100644
--- a/tests/qtest/libqos/arm-smdkc210-machine.c
+++ b/tests/qtest/libqos/arm-smdkc210-machine.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "../libqtest.h"
 #include "qemu/module.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "sdhci.h"
 
diff --git a/tests/qtest/libqos/arm-virt-machine.c b/tests/qtest/libqos/arm-virt-machine.c
index 139eaba142..4e87405b58 100644
--- a/tests/qtest/libqos/arm-virt-machine.c
+++ b/tests/qtest/libqos/arm-virt-machine.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "../libqtest.h"
 #include "qemu/module.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "virtio-mmio.h"
 #include "generic-pcihost.h"
diff --git a/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c b/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
index 3be80020a6..daac762a06 100644
--- a/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
+++ b/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "../libqtest.h"
 #include "qemu/module.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "sdhci.h"
 
diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index f87e0e84b2..fc14b07884 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -23,7 +23,7 @@
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/bitops.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "e1000e.h"
 
diff --git a/tests/qtest/libqos/malloc.c b/tests/qtest/libqos/libqos-malloc.c
similarity index 99%
rename from tests/qtest/libqos/malloc.c
rename to tests/qtest/libqos/libqos-malloc.c
index f0c8f950c8..d7566972c4 100644
--- a/tests/qtest/libqos/malloc.c
+++ b/tests/qtest/libqos/libqos-malloc.c
@@ -11,7 +11,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qemu/host-utils.h"
 
 typedef struct MemBlock {
diff --git a/tests/qtest/libqos/qos_external.c b/tests/qtest/libqos/qos_external.c
index b7a0b873a3..c6bb8bff09 100644
--- a/tests/qtest/libqos/qos_external.c
+++ b/tests/qtest/libqos/qos_external.c
@@ -24,7 +24,7 @@
 #include "qapi/qmp/qstring.h"
 #include "qemu/module.h"
 #include "qapi/qmp/qlist.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "qgraph_internal.h"
 #include "qos_external.h"
diff --git a/tests/qtest/libqos/virtio-mmio.c b/tests/qtest/libqos/virtio-mmio.c
index a6cca8613b..bd0b1d890b 100644
--- a/tests/qtest/libqos/virtio-mmio.c
+++ b/tests/qtest/libqos/virtio-mmio.c
@@ -12,7 +12,7 @@
 #include "qemu/module.h"
 #include "virtio.h"
 #include "virtio-mmio.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "standard-headers/linux/virtio_ring.h"
 
diff --git a/tests/qtest/libqos/virtio-pci.c b/tests/qtest/libqos/virtio-pci.c
index 67c2498c84..485b8f6b7e 100644
--- a/tests/qtest/libqos/virtio-pci.c
+++ b/tests/qtest/libqos/virtio-pci.c
@@ -13,7 +13,7 @@
 #include "virtio-pci.h"
 #include "pci.h"
 #include "pci-pc.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "malloc-pc.h"
 #include "qgraph.h"
 #include "standard-headers/linux/virtio_ring.h"
diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index f97d0a08fd..831db5cf2a 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -25,7 +25,7 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/qapi-visit-qom.h"
-#include "libqos/malloc.h"
+#include "libqos/libqos-malloc.h"
 #include "libqos/qgraph.h"
 #include "libqos/qgraph_internal.h"
 #include "libqos/qos_external.h"
diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index fd5d6e5ae1..cff83c86d9 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -6,7 +6,7 @@ libqos_srcs = files(
         'qos_external.c',
         'pci.c',
         'fw_cfg.c',
-        'malloc.c',
+        'libqos-malloc.c',
         'libqos.c',
         'sdhci-cmd.c',
 
-- 
2.34.1


