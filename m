Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006836C06BF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 01:07:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pe32N-000454-Ro; Sun, 19 Mar 2023 20:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1pe32K-00044I-TV
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 20:06:04 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1pe32I-0004ck-Vs
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 20:06:04 -0400
Received: by mail-qt1-x835.google.com with SMTP id n2so11454193qtp.0
 for <qemu-devel@nongnu.org>; Sun, 19 Mar 2023 17:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679270760;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5a1JyWJg/Pu62/RjBhcMGBP6W8dtaT/x8zVZREFg0Dk=;
 b=afyHVdhhB1o8XlPlFKUzbGzLZZFpEQ+X8A+V1Yyz7eQzogxmnxMM5eQoywfTfa6wGt
 oSgpSvZ6kbOIBED0D61nibQXJbm4tZCt03ivrSjq/zkFdnTOvrR8RFR8mSLSV5BmICy1
 hXSDRFLOPE/YEZGoOBLlfJjn66uceDG8kCVEv/H89cXUT+eAi961llEm7UfLKSgg8QEK
 g3K/p0UAJTl/E/bsNxPSW1pWG6tteGH23BJmhim2i1VLFti5MDSUcdoyQrtH0n/X+ibg
 HGxmg3PnXWymZCRDZ9J08iqw84XT83ab07vn48DX7KPj2njri5+R7nRNMj+V/+nQCJAx
 kDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679270760;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5a1JyWJg/Pu62/RjBhcMGBP6W8dtaT/x8zVZREFg0Dk=;
 b=ZIF6eU3IJDukdmqKc2YO4z21eBrLcBMSKE1tfe8FhnbWPaV3Z8lYFnNIJK6j6t1slS
 fvbfviC5kKH31+6aI8LTPg//+WR7kGL2iosKNAFiFJ/CrZ+bJ1MrC7oFSvHe9SMgbvkY
 /oDBcbXhbXBGani41se/qtCuXvuRbwVmg0fOLAmIzpsVnaSn1g0dz0n8a6pGrpBPUtow
 DTvYUPFBHsSnJifizJHuVFjd7hwOnSJNeTN+UgzNPhnUZRrZ2IDBj8/BIFtphNNv0IB/
 70Q/Ee/Vktbny/gkJbJjMIXquu0zT2DGJcnpiCLterI+caM0kTGNBDv0zQ+kBe9oZIWk
 HMqQ==
X-Gm-Message-State: AO0yUKVkkKLNBkhcJaGXN29HofK+UpWfA9It6IlYR0wqF+ZgG9tNULJi
 kkIOAtg5Sa5nZGqSjzPneHE=
X-Google-Smtp-Source: AK7set+Zo684WUfcxnUtAPjO/39U3tutzblM/k8Yw/nvLEiezgMMLgrx8x0tgn+9VonzLIYHffsBPA==
X-Received: by 2002:a05:622a:118b:b0:3bf:db54:b622 with SMTP id
 m11-20020a05622a118b00b003bfdb54b622mr25089122qtk.30.1679270760188; 
 Sun, 19 Mar 2023 17:06:00 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:80c9:20df:afaa:e9a2])
 by smtp.gmail.com with ESMTPSA id
 b6-20020ac87546000000b003d29e23e214sm5436063qtr.82.2023.03.19.17.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Mar 2023 17:05:59 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH] xen: Fix host pci for stubdom
Date: Sun, 19 Mar 2023 20:05:54 -0400
Message-Id: <20230320000554.8219-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=jandryuk@gmail.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

PCI passthrough for an HVM with a stubdom is PV PCI passthrough from
dom0 to the stubdom, and then QEMU passthrough of the PCI device inside
the stubdom.  xen-pciback has boolean module param passthrough which
controls "how to export PCI topology to guest".  If passthrough=1, the
frontend shows a PCI SBDF matching the backend host device.  When
passthough=0, the frontend will get a sequentially allocated SBDF.

libxl passes the host SBDF over QMP to QEMU.  For non-stubdom or stubdom
with passthrough=1, this works fine.  However, it fails for
passthrough=0 when QEMU can't find the sysfs node for the host SBDF.

Handle all these cases.  Look for the xenstore frontend nodes.  If they
are missing, then default to using the QMP command provided SBDF.  This
is the non-stubdom case.  If xenstore nodes are found, then read the
local SBDF from the xenstore nodes.  This will handle either
passthrough=0/1 case.

Based on a stubdom-specific patch originally by Marek
Marczykowski-Górecki <marmarek@invisiblethingslab.com>, which is based
on earlier work by HW42 <hw42@ipsumj.de>

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 hw/xen/xen-host-pci-device.c | 96 +++++++++++++++++++++++++++++++++++-
 hw/xen/xen-host-pci-device.h |  6 +++
 2 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
index 8c6e9a1716..51a72b432d 100644
--- a/hw/xen/xen-host-pci-device.c
+++ b/hw/xen/xen-host-pci-device.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
+#include "hw/xen/xen-legacy-backend.h"
 #include "xen-host-pci-device.h"
 
 #define XEN_HOST_PCI_MAX_EXT_CAP \
@@ -33,13 +34,101 @@
 #define IORESOURCE_PREFETCH     0x00001000      /* No side effects */
 #define IORESOURCE_MEM_64       0x00100000
 
+/*
+ * Non-passthrough (dom0) accesses are local PCI devices and use the given BDF
+ * Passthough (stubdom) accesses are through PV frontend PCI device.  Those
+ * either have a BDF identical to the backend's BFD (xen-backend.passthrough=1)
+ * or a local virtual BDF (xen-backend.passthrough=0)
+ *
+ * We are always given the backend's BDF and need to lookup the appropriate
+ * local BDF for sysfs access.
+ */
+static void xen_host_pci_fill_local_addr(XenHostPCIDevice *d, Error **errp)
+{
+    unsigned int num_devs, len, i;
+    unsigned int domain, bus, dev, func;
+    char *be_path;
+    char path[80];
+    char *msg;
+
+    be_path = qemu_xen_xs_read(xenstore, 0, "device/pci/0/backend", &len);
+    if (!be_path) {
+        /*
+         * be_path doesn't exist, so we are dealing with a local
+         * (non-passthough) device.
+         */
+        d->local_domain = d->domain;
+        d->local_bus = d->bus;
+        d->local_dev = d->dev;
+        d->local_func = d->func;
+
+        return;
+    }
+
+    snprintf(path, sizeof(path), "%s/num_devs", be_path);
+    msg = qemu_xen_xs_read(xenstore, 0, path, &len);
+    if (!msg) {
+        goto err_out;
+    }
+
+    if (sscanf(msg, "%u", &num_devs) != 1) {
+        error_setg(errp, "Failed to parse %s (%s)", msg, path);
+        goto err_out;
+    }
+    free(msg);
+
+    for (i = 0; i < num_devs; i++) {
+        snprintf(path, sizeof(path), "%s/dev-%u", be_path, i);
+        msg = qemu_xen_xs_read(xenstore, 0, path, &len);
+        if (!msg) {
+            error_setg(errp, "Failed to read %s", path);
+            goto err_out;
+        }
+        if (sscanf(msg, "%x:%x:%x.%x", &domain, &bus, &dev, &func) != 4) {
+            error_setg(errp, "Failed to parse %s (%s)", msg, path);
+            goto err_out;
+        }
+        free(msg);
+        if (domain != d->domain ||
+            bus != d->bus ||
+            dev != d->dev ||
+            func != d->func)
+            continue;
+        snprintf(path, sizeof(path), "%s/vdev-%u", be_path, i);
+        msg = qemu_xen_xs_read(xenstore, 0, path, &len);
+        if (!msg) {
+            error_setg(errp, "Failed to read %s", path);
+            goto out;
+        }
+        if (sscanf(msg, "%x:%x:%x.%x", &domain, &bus, &dev, &func) != 4) {
+            error_setg(errp, "Failed to parse %s (%s)", msg, path);
+            goto err_out;
+        }
+        free(msg);
+        d->local_domain = domain;
+        d->local_bus = bus;
+        d->local_dev = dev;
+        d->local_func = func;
+        goto out;
+    }
+
+    error_setg(errp, "Failed to find local %x:%x:%x.%x", d->domain, d->bus,
+               d->dev, d->func);
+
+err_out:
+    free(msg);
+out:
+    free(be_path);
+}
+
 static void xen_host_pci_sysfs_path(const XenHostPCIDevice *d,
                                     const char *name, char *buf, ssize_t size)
 {
     int rc;
 
     rc = snprintf(buf, size, "/sys/bus/pci/devices/%04x:%02x:%02x.%d/%s",
-                  d->domain, d->bus, d->dev, d->func, name);
+                  d->local_domain, d->local_bus, d->local_dev, d->local_func,
+                  name);
     assert(rc >= 0 && rc < size);
 }
 
@@ -342,6 +431,11 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
     d->dev = dev;
     d->func = func;
 
+    xen_host_pci_fill_local_addr(d, errp);
+    if (*errp) {
+        goto error;
+    }
+
     xen_host_pci_config_open(d, errp);
     if (*errp) {
         goto error;
diff --git a/hw/xen/xen-host-pci-device.h b/hw/xen/xen-host-pci-device.h
index 4d8d34ecb0..270dcb27f7 100644
--- a/hw/xen/xen-host-pci-device.h
+++ b/hw/xen/xen-host-pci-device.h
@@ -23,6 +23,12 @@ typedef struct XenHostPCIDevice {
     uint8_t dev;
     uint8_t func;
 
+    /* different from the above in case of stubdomain */
+    uint16_t local_domain;
+    uint8_t local_bus;
+    uint8_t local_dev;
+    uint8_t local_func;
+
     uint16_t vendor_id;
     uint16_t device_id;
     uint32_t class_code;
-- 
2.37.2


