Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCA448DA43
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 15:58:43 +0100 (CET)
Received: from localhost ([::1]:57768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n81Yo-0005hj-HN
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 09:58:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangruien@bytedance.com>)
 id 1n7yjS-0001JL-El
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:57:30 -0500
Received: from [2607:f8b0:4864:20::644] (port=38717
 helo=mail-pl1-x644.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangruien@bytedance.com>)
 id 1n7yjL-0005Ov-9E
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:57:30 -0500
Received: by mail-pl1-x644.google.com with SMTP id c3so9383768pls.5
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 03:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2xjLG3dwedW0tcslzlKmmg7MecP9prVqxPm3ZByDAhQ=;
 b=iUTR8PxPoKJDcTGVcJIDSCH8P80Q8i3fbXewCphnvrewIeu1ljzv1VHG3OUz2u93y6
 +TyXGtefrnfLXzMi8gXMThVqJ5sHOauMRTOtMdRlNFT+WH1zJn3CmyQkadPSdBFZmgqg
 YgR1ZJVRRFEBcgHziXATxvY3a6Em5LoNHnP/r4xtOO0/tCGwfWC5QDUe83durE2AUC47
 G8WSAGqkOxrkk3f8IsZe8LOkV610M9nI9Hvd50QPpkZkngTEsMObPDNLBw+ja3/rADJs
 8kjytbvITsYBdD1ndllE2O5Dhc22nE23U4z6HFN1J2L5dG8FGX4T/mCR4+lSqpFK55rY
 SL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2xjLG3dwedW0tcslzlKmmg7MecP9prVqxPm3ZByDAhQ=;
 b=YJ5wEkJV/hLaVhYVtxqRbiCmVCocY6gabWYl1mYDwF7P9OtfbK4lh9e2maza2QFMpE
 htIHU2wsevvPXpCLAHqM7UnOOSDjx+9m4rJOuS8A07odzV2hcA2IIjfEfWgOd5EuPfBA
 0wYRhLmdhEamV+vAhSHVdsd/Gg9ehwQ2X/8yGw2UV36md5OBkYtr2XB6/NoYFJ+nOGN7
 tl1ehgfEo9Zlt77zQtiHL1pcw5bSnM6bk4AeH/ALDM/hxU9kwTvDhm/il4KZDv0FB32n
 IkLRvjsNqI8VCZ+HihyzWpkOAnYOI6HUZwiz2WKsr6lPUivt8wWeI7Xxn/CjFiNEPBu8
 jOrg==
X-Gm-Message-State: AOAM533wkA3Jt0g5lzrOUH9JrIbKBh1asyAbN6erAJ3x9oQobPUiyMkp
 uarXz4foPeNWYG+B7JbFRepfvQ==
X-Google-Smtp-Source: ABdhPJyE4VssxVtNeMc7AJ77JzvW4PfG1CjBGu8VaGWH1INfVeOhMB9amrm9IwtJRpjvZYvZ03F25g==
X-Received: by 2002:a17:902:7588:b0:14a:3006:ea64 with SMTP id
 j8-20020a170902758800b0014a3006ea64mr4363476pll.168.1642075035331; 
 Thu, 13 Jan 2022 03:57:15 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.242])
 by smtp.gmail.com with ESMTPSA id f9sm2387572pjh.18.2022.01.13.03.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 03:57:14 -0800 (PST)
From: Ruien Zhang <zhangruien@bytedance.com>
To: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 eblake@redhat.com, pbonzini@redhat.com, berrange@redhat.com
Subject: [PATCH 2/2] usb-printer: Introduce USB printer class
Date: Thu, 13 Jan 2022 19:56:59 +0800
Message-Id: <20220113115659.72788-3-zhangruien@bytedance.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220113115659.72788-1-zhangruien@bytedance.com>
References: <20220113115659.72788-1-zhangruien@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::644
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=zhangruien@bytedance.com; helo=mail-pl1-x644.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 13 Jan 2022 09:54:20 -0500
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
Cc: qemu-devel@nongnu.org, zhangruien <zhangruien@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhangruien <zhangruien@bytedance.com>

The USB printer device emulation is currently provided with:

1) Definitions and corresponding action handlers of class-specific
   requests with essential descriptors in USB Printer Class
   Specification 1.1 [1].

2) Extended definitions of interface protocol and class-specific
   descriptors in IPP-over-USB protocol 1.0 [2].

A usb printer device can be assembled with the following example of
command-line arguments:

    -device piix4-usb-uhci,id=uhci,bus=pci.0 \
    -device usb-printer,id=usb-printer0,printerdev=printer0,bus=uhci.0,terminal=printer \
    -printerdev builtin,id=printer0

[1]: https://www.usb.org/sites/default/files/usbprint11a021811.pdf
[2]: https://www.usb.org/document-library/ipp-protocol-10

Signed-off-by: zhangruien <zhangruien@bytedance.com>
---
 docs/system/devices/usb.rst |   3 +
 hw/usb/Kconfig              |   5 +
 hw/usb/dev-printer.c        | 423 ++++++++++++++++++++++++++++++++++++++++++++
 hw/usb/meson.build          |   1 +
 hw/usb/trace-events         |  11 ++
 include/hw/usb/printer.h    |  93 ++++++++++
 6 files changed, 536 insertions(+)
 create mode 100644 hw/usb/dev-printer.c
 create mode 100644 include/hw/usb/printer.h

diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index afb7d6c226..6e87c3be11 100644
--- a/docs/system/devices/usb.rst
+++ b/docs/system/devices/usb.rst
@@ -199,6 +199,9 @@ option or the ``device_add`` monitor command. Available devices are:
 ``u2f-{emulated,passthru}``
    Universal Second Factor device
 
+``usb-printer``
+   USB printer device
+
 Physical port addressing
 ^^^^^^^^^^^^^^^^^^^^^^^^
 
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 53f8283ffd..1b5a953cae 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -133,3 +133,8 @@ config XLNX_USB_SUBSYS
     bool
     default y if XLNX_VERSAL
     select USB_DWC3
+
+config USB_PRINTER
+    bool
+    default y
+    depends on USB
diff --git a/hw/usb/dev-printer.c b/hw/usb/dev-printer.c
new file mode 100644
index 0000000000..5905615961
--- /dev/null
+++ b/hw/usb/dev-printer.c
@@ -0,0 +1,423 @@
+/*
+ * USB Printer Device emulation
+ *
+ * Copyright (c) 2022 ByteDance, Inc.
+ *
+ * Author:
+ *   Ruien Zhang <zhangruien@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+/*
+ * References:
+ *   Universal Serial Bus Device Class Definition for Printing Devices,
+ *   version 1.1
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "qemu/log.h"
+#include "qom/object.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/usb.h"
+#include "hw/usb/printer.h"
+#include "printer/printer.h"
+#include "desc.h"
+#include "trace.h"
+
+#define USBPRINTER_VENDOR_NUM     0x46f4 /* CRC16() of "QEMU" */
+#define USBPRINTER_PRODUCT_NUM    0xa1f3
+
+enum {
+    STR_MANUFACTURER = 1,
+    STR_PRODUCT,
+    STR_SERIALNUMBER,
+    STR_CONFIG_FULL,
+    STR_CONFIG_HIGH,
+};
+
+static const USBDescStrings desc_strings = {
+    [STR_MANUFACTURER] = "QEMU",
+    [STR_PRODUCT]      = "QEMU USB Printer",
+    [STR_SERIALNUMBER] = "1",
+    [STR_CONFIG_FULL]  = "Full speed config (usb 1.1)",
+    [STR_CONFIG_HIGH]  = "High speed config (usb 2.0)",
+};
+
+/*
+ * 5. Standard Descriptors
+ *
+ * "Printer Class devices support the following standard USB descriptors:
+ *  - Device. Each printer has one device descriptor.
+ *  - Configuration. Each device has one default configuration descriptor which
+ *    supports at least one interface.
+ *  - Interface. A printer device has a single data interface with possible
+ *    alternates.
+ *  - Endpoint. A printer device supports the following endpoints:
+ *  - Bulk OUT endpoint. Used for transfer of PDL/PCP data.
+ *  - Optional Bulk IN endpoint. Provides status and other return information."
+ */
+static const USBDescIface desc_iface_full = {
+    .bInterfaceNumber              = 0,
+    .bNumEndpoints                 = EP_NUMS_2,
+    .bInterfaceClass               = USB_CLASS_PRINTER,
+    .bInterfaceSubClass            = SC_PRINTERS,
+    .bInterfaceProtocol            = PC_PROTOCOL_BIDIR_1284_4,
+    .eps = (USBDescEndpoint[]) {
+        {
+            .bEndpointAddress      = USB_DIR_OUT | EP_NUM_BULK_OUT,
+            .bmAttributes          = USB_ENDPOINT_XFER_BULK,
+            .wMaxPacketSize        = 64,
+        },{
+            .bEndpointAddress      = USB_DIR_IN | EP_NUM_BULK_IN,
+            .bmAttributes          = USB_ENDPOINT_XFER_BULK,
+            .wMaxPacketSize        = 64,
+        },
+    },
+};
+
+static const USBDescDevice desc_device_full = {
+    .bcdUSB                        = 0x0200,
+    .bMaxPacketSize0               = 8,
+    .bNumConfigurations            = 1,
+    .confs = (USBDescConfig[]) {
+        {
+            .bNumInterfaces        = 1,
+            .bConfigurationValue   = 1,
+            .iConfiguration        = STR_CONFIG_FULL,
+            .bmAttributes          = USB_CFG_ATT_ONE | USB_CFG_ATT_SELFPOWER,
+            .nif = 1,
+            .ifs = &desc_iface_full,
+        },
+    },
+};
+
+static const USBDescIface desc_iface_high = {
+    .bInterfaceNumber              = 0,
+    .bNumEndpoints                 = EP_NUMS_2,
+    .bInterfaceClass               = USB_CLASS_PRINTER,
+    .bInterfaceSubClass            = SC_PRINTERS,
+    .bInterfaceProtocol            = PC_PROTOCOL_BIDIR_1284_4,
+    .eps = (USBDescEndpoint[]) {
+        {
+            .bEndpointAddress      = USB_DIR_OUT | EP_NUM_BULK_OUT,
+            .bmAttributes          = USB_ENDPOINT_XFER_BULK,
+            .wMaxPacketSize        = 512,
+        },{
+            .bEndpointAddress      = USB_DIR_IN | EP_NUM_BULK_IN,
+            .bmAttributes          = USB_ENDPOINT_XFER_BULK,
+            .wMaxPacketSize        = 512,
+        },
+    },
+};
+
+static const USBDescDevice desc_device_high = {
+    .bcdUSB                        = 0x0200,
+    .bMaxPacketSize0               = 64,
+    .bNumConfigurations            = 1,
+    .confs = (USBDescConfig[]) {
+        {
+            .bNumInterfaces        = 1,
+            .bConfigurationValue   = 1,
+            .iConfiguration        = STR_CONFIG_HIGH,
+            .bmAttributes          = USB_CFG_ATT_ONE | USB_CFG_ATT_SELFPOWER,
+            .nif = 1,
+            .ifs = &desc_iface_high,
+        },
+    },
+};
+
+static const USBDesc desc_printer = {
+    .id = {
+        .idVendor          = USB_CLASS_PRINTER,
+        .idProduct         = USBPRINTER_PRODUCT_NUM,
+        .bcdDevice         = 0,
+        .iManufacturer     = STR_MANUFACTURER,
+        .iProduct          = STR_PRODUCT,
+        .iSerialNumber     = STR_SERIALNUMBER,
+    },
+    .full  = &desc_device_full,
+    .high  = &desc_device_high,
+    .str   = desc_strings,
+};
+
+struct USBPrinterState {
+    /* qemu interfaces */
+    USBDevice dev;
+
+    /* state */
+    QEMUPrinter *printer;
+
+    /* properties */
+    char *printerdev;
+    char *terminal;
+};
+
+#define TYPE_USB_PRINTER "usb-printer"
+OBJECT_DECLARE_SIMPLE_TYPE(USBPrinterState, USB_PRINTER)
+
+static void usb_printer_handle_reset(USBDevice *dev)
+{
+    USBBus *bus = usb_bus_from_device(dev);
+    trace_usb_printer_handle_reset(bus->busnr, dev->addr);
+}
+
+/*
+ * 4.2.1 GET_DEVICE_ID (bRequest = 0)
+ * "This class-specific request returns a device ID string that is compatible
+ *  with IEEE 1284. See IEEE 1284 for syntax and formatting information."
+ */
+#define USB_PRINTER_DEVICE_ID_QEMU "QEMU Printer"
+#define USB_PRINTER_DEVICE_ID_QEMU_LEN \
+    strlen(USB_PRINTER_DEVICE_ID_QEMU)
+#define USB_PRINTER_DEVICE_ID_QEMU_LEN_IEEE_1284 \
+    (2 + USB_PRINTER_DEVICE_ID_QEMU_LEN)
+
+static const USBPrinterDeviceIDStrings usb_printer_device_ids = {
+    [USB_PRINTER_DEVICE_ID_DEFAULT] = USB_PRINTER_DEVICE_ID_QEMU,
+};
+
+static int usb_printer_get_device_id(USBDevice *dev, int request, int value,
+                                 int index, int length, uint8_t *data)
+{
+    USBBus *bus = usb_bus_from_device(dev);
+
+    *((uint16_t *)data) = cpu_to_be16(USB_PRINTER_DEVICE_ID_QEMU_LEN_IEEE_1284);
+    memcpy(data + 2, usb_printer_device_ids[USB_PRINTER_DEVICE_ID_DEFAULT],
+        USB_PRINTER_DEVICE_ID_QEMU_LEN);
+
+    trace_usb_printer_get_device_id(bus->busnr, dev->addr);
+
+    return USB_PRINTER_DEVICE_ID_QEMU_LEN_IEEE_1284;
+}
+
+/*
+ * 4.2.2 GET_PORT_STATUS (bRequest = 1)
+ *
+ * "Note: Some USB printers may not always be able to determine this
+ *  information. In this case, they should return benign status of
+ *  “Paper Not Empty,” “Selected,” and “No Error.”"
+ */
+static int usb_printer_get_port_status(USBDevice *dev, int request, int value,
+                                 int index, int length, uint8_t *data)
+{
+    USBBus *bus = usb_bus_from_device(dev);
+
+    *((uint8_t *)data) = PAPER_NOT_EMPTY | SELECTED | NO_ERROR;
+    trace_usb_printer_get_port_status(bus->busnr, dev->addr);
+    return 1;
+}
+
+/*
+ * TODO: 4.2.3 SOFT_RESET (bRequest = 2)
+ *
+ * "This class-specific request flushes all buffers and resets the Bulk OUT
+ *  and Bulk IN pipes to their default states. This request clears all stall
+ *  conditions. This reset does NOT change the USB addressing or USB
+ *  configuration."
+ */
+static int usb_printer_handle_soft_reset(USBDevice *dev, int request, int value,
+                                 int index, int length, uint8_t *data)
+{
+    USBBus *bus = usb_bus_from_device(dev);
+
+    trace_usb_printer_handle_soft_reset(bus->busnr, dev->addr);
+    return 0;
+}
+
+static void usb_printer_handle_control(USBDevice *dev, USBPacket *p,
+                                    int request, int value, int index,
+                                    int length, uint8_t *data)
+{
+    USBBus *bus = usb_bus_from_device(dev);
+    int ret = 0;
+
+    ret = usb_desc_handle_control(dev, p, request, value, index, length, data);
+    if (ret >= 0) {
+        return;
+    }
+
+    switch (request) {
+    case ClassInterfaceRequest | USBPRINTER_GET_DEVICE_ID:
+        ret = usb_printer_get_device_id(dev, request, value, index,
+                                        length, data);
+        if (ret < 0) {
+            goto error;
+        }
+        break;
+
+    case ClassInterfaceRequest | USBPRINTER_GET_PORT_STATUS:
+        ret = usb_printer_get_port_status(dev, request, value, index,
+                                          length, data);
+        if (ret < 0) {
+            goto error;
+        }
+        break;
+
+    case ClassInterfaceOutRequestCompat1_0 | USBPRINTER_SOFT_RESET:
+        /* fall through */
+    case ClassInterfaceOutRequest | USBPRINTER_SOFT_RESET:
+        ret = usb_printer_handle_soft_reset(dev, request, value, index,
+                                            length, data);
+        if (ret < 0) {
+            goto error;
+        }
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: request %x not implemented\n",
+                      TYPE_USB_PRINTER, request);
+        goto error;
+    }
+
+    p->actual_length = ret;
+    p->status = USB_RET_SUCCESS;
+    return;
+
+error:
+    trace_usb_printer_handle_control_error(bus->busnr, dev->addr, request,
+        value, index, length);
+    p->status = USB_RET_STALL;
+}
+
+static void usb_printer_handle_data_out(USBDevice *dev, USBPacket *p)
+{
+    USBBus *bus = usb_bus_from_device(dev);
+    QEMUIOVector *iov = p->combined ? &p->combined->iov : &p->iov;
+
+    p->status = USB_RET_SUCCESS;
+    trace_usb_printer_handle_data_out(bus->busnr, dev->addr, iov->size);
+}
+
+/*
+ * 5.4.2 Bulk IN Endpoint
+ *
+ * "The Bulk IN endpoint is used to return any data generated by the PDL
+ *  or PCP to the host. If the printer supports a PCP, such as IEEE-1284.1
+ *  or IEEE-1284.4, this endpoint will return status or other printer-related
+ *  information."
+ */
+static void usb_printer_handle_data_in(USBDevice *dev, USBPacket *p)
+{
+    USBBus *bus = usb_bus_from_device(dev);
+    QEMUIOVector *iov = p->combined ? &p->combined->iov : &p->iov;
+
+    p->status = USB_RET_SUCCESS;
+    trace_usb_printer_handle_data_in(bus->busnr, dev->addr, iov->size);
+}
+
+static void usb_printer_handle_data(USBDevice *dev, USBPacket *p)
+{
+    USBBus *bus = usb_bus_from_device(dev);
+
+    switch (p->pid) {
+    case USB_TOKEN_OUT:
+        switch (p->ep->nr) {
+        case EP_NUM_BULK_OUT:
+            usb_printer_handle_data_out(dev, p);
+            return;
+
+        default:
+            goto fail;
+        }
+        break;
+
+    case USB_TOKEN_IN:
+        switch (p->ep->nr) {
+        case EP_NUM_BULK_IN:
+            usb_printer_handle_data_in(dev, p);
+            return;
+
+        default:
+            goto fail;
+        }
+        break;
+
+    default:
+    fail:
+        p->status = USB_RET_STALL;
+        break;
+    }
+
+    if (p->status == USB_RET_STALL) {
+        fprintf(stderr, "usbprinter: failed data transaction: "
+                        "pid 0x%x ep 0x%x len 0x%zx\n",
+                        p->pid, p->ep->nr, p->iov.size);
+    }
+
+    trace_usb_printer_handle_data(bus->busnr, dev->addr, p->pid, p->ep->nr);
+}
+
+static void usb_printer_unrealize(USBDevice *dev)
+{
+}
+
+static void usb_printer_realize(USBDevice *dev, Error **errp)
+{
+    USBPrinterState *s = USB_PRINTER(dev);
+    if (!s->terminal || strcmp(s->terminal, "printer")) {
+        error_setg(errp, "%s: support terminal printer only", TYPE_USB_PRINTER);
+        return;
+    }
+
+    s->printer = qemu_printer_by_id(s->printerdev);
+    if (!s->printer) {
+        error_setg(errp, "%s: invalid printerdev %s",
+                   TYPE_USB_PRINTER, s->printerdev);
+        return;
+    }
+
+    dev->usb_desc = &desc_printer;
+
+    usb_desc_create_serial(dev);
+    usb_desc_init(dev);
+    s->dev.opaque = s;
+}
+
+/* TODO: set alternates on IPP-over-USB */
+static void usb_printer_set_interface(USBDevice *dev, int iface,
+                                    int old, int value)
+{
+    USBBus *bus = usb_bus_from_device(dev);
+    trace_usb_printer_set_interface(bus->busnr, dev->addr, iface, old, value);
+}
+
+static Property usb_printer_properties[] = {
+    DEFINE_PROP_STRING("printerdev", USBPrinterState, printerdev),
+    DEFINE_PROP_STRING("terminal", USBPrinterState, terminal),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void usb_printer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    USBDeviceClass *k = USB_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, usb_printer_properties);
+    set_bit(DEVICE_CATEGORY_USB, dc->categories);
+    k->product_desc   = "QEMU USB Printer Interface";
+    k->realize        = usb_printer_realize;
+    k->handle_reset   = usb_printer_handle_reset;
+    k->handle_control = usb_printer_handle_control;
+    k->handle_data    = usb_printer_handle_data;
+    k->unrealize      = usb_printer_unrealize;
+    k->set_interface = usb_printer_set_interface;
+}
+
+static const TypeInfo usb_printer_info = {
+    .name          = TYPE_USB_PRINTER,
+    .parent        = TYPE_USB_DEVICE,
+    .instance_size = sizeof(USBPrinterState),
+    .class_init    = usb_printer_class_init,
+};
+
+static void usb_printer_register_types(void)
+{
+    type_register_static(&usb_printer_info);
+}
+
+type_init(usb_printer_register_types)
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index de853d780d..f79d5e1f74 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -44,6 +44,7 @@ softmmu_ss.add(when: 'CONFIG_USB_STORAGE_UAS', if_true: files('dev-uas.c'))
 softmmu_ss.add(when: 'CONFIG_USB_AUDIO', if_true: files('dev-audio.c'))
 softmmu_ss.add(when: 'CONFIG_USB_SERIAL', if_true: files('dev-serial.c'))
 softmmu_ss.add(when: 'CONFIG_USB_NETWORK', if_true: files('dev-network.c'))
+softmmu_ss.add(when: 'CONFIG_USB_PRINTER', if_true: files('dev-printer.c'))
 softmmu_ss.add(when: ['CONFIG_POSIX', 'CONFIG_USB_STORAGE_MTP'], if_true: files('dev-mtp.c'))
 
 # smartcard
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index b8287b63f1..e3fed30c43 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -345,3 +345,14 @@ usb_serial_set_baud(int bus, int addr, int baud) "dev %d:%u baud rate %d"
 usb_serial_set_data(int bus, int addr, int parity, int data, int stop) "dev %d:%u parity %c, data bits %d, stop bits %d"
 usb_serial_set_flow_control(int bus, int addr, int index) "dev %d:%u flow control %d"
 usb_serial_set_xonxoff(int bus, int addr, uint8_t xon, uint8_t xoff) "dev %d:%u xon 0x%x xoff 0x%x"
+
+# dev-printer.c
+usb_printer_handle_reset(int bus, int addr) "dev %d:%u reset"
+usb_printer_get_device_id(int bus, int addr) "dev %d:%u get device id"
+usb_printer_get_port_status(int bus, int addr) "dev %d:%u get port status"
+usb_printer_handle_soft_reset(int bus, int addr) "dev %d:%u soft reset"
+usb_printer_handle_control_error(int bus, int addr, int request, int value, int index, int length) "dev %d:%u handle control error, request 0x%x, value 0x%x, index 0x%x, length 0x%x"
+usb_printer_handle_data(int bus, int addr, int pid, int ep) "dev %d:%u data, pid 0x%x, ep %d"
+usb_printer_handle_data_out(int bus, int addr, int size) "dev %d:%u data out, size %d"
+usb_printer_handle_data_in(int bus, int addr, int size) "dev %d:%u data in, size %d"
+usb_printer_set_interface(int bus, int addr, int iface, int old, int value) "dev %d:%u set interface %d, old %d, value %d"
diff --git a/include/hw/usb/printer.h b/include/hw/usb/printer.h
new file mode 100644
index 0000000000..0b14e11b8f
--- /dev/null
+++ b/include/hw/usb/printer.h
@@ -0,0 +1,93 @@
+/*
+ * USB Printer Device emulation
+ *
+ * Copyright (c) 2022 ByteDance, Inc.
+ *
+ * Author:
+ *   Ruien Zhang <zhangruien@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+/*
+ * References:
+ *   Universal Serial Bus Device Class Definition for Printing Devices,
+ *   version 1.1
+ *   USB Print Interface Class IPP Protocol Specification, revision 1.0
+ */
+
+#ifndef HW_USB_PRINTER_H
+#define HW_USB_PRINTER_H
+
+/* 4.2 Class-Specific Requests */
+#define USBPRINTER_GET_DEVICE_ID   0
+#define USBPRINTER_GET_PORT_STATUS 1
+#define USBPRINTER_SOFT_RESET      2
+
+typedef enum {
+    USB_PRINTER_DEVICE_ID_DEFAULT,
+    USB_PRINTER_DEVICE_ID_MAX
+} USBPrinterDeviceIDType;
+
+typedef const char *USBPrinterDeviceIDStrings[USB_PRINTER_DEVICE_ID_MAX];
+
+/* 4.2.2 GET_PORT_STATUS (bRequest = 1) */
+#define PAPER_EMPTY     (1 << 5)
+#define PAPER_NOT_EMPTY (0 << 5)
+#define SELECTED        (1 << 4)
+#define NOT_SELECTED    (0 << 4)
+#define NO_ERROR        (1 << 3)
+#define ERROR           (0 << 3)
+
+/*
+ * 4.2.3 SOFT_RESET (bRequest = 2)
+ *
+ * "Note: Version 1.0 of the specification incorrectly stated that the
+ *  bmReqestType for SOFT_RESET was 00100011B. Version 1.1 Host software
+ *  implementers should be prepared for USB printers that expect this
+ *  request code, and version 1.1 device implementers should be prepared
+ *  for host software that issues this request code."
+ */
+#define ClassInterfaceOutRequestCompat1_0 \
+        ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_OTHER) << 8)
+
+/* 5.3 Interface Descriptors */
+#define EP_NUMS_1                0x01
+#define EP_NUMS_2                0x02
+#define EP_NUM_BULK_OUT          0x01
+#define EP_NUM_BULK_IN           0x02
+#define SC_PRINTERS              0x01
+#define PC_PROTOCOL_UNIDIR       0x01
+#define PC_PROTOCOL_BIDIR        0x02
+#define PC_PROTOCOL_BIDIR_1284_4 0x03
+#define PC_PROTOCOL_IPP_USB      0x04
+#define PC_VENDOR_SPECIFIC       0xff
+
+/* 4.3 Device Info Descriptor: A Class Specific Descriptor */
+#define DEV_INFO_DESC_CHECK_LEN(bLength) \
+        QEMU_BUILD_BUG_ON((bLength) < 10)
+
+#define DEV_INFO_DESC_CHECK_NUM_DESCS(bNumDescriptors) \
+        QEMU_BUILD_BUG_ON((bNumDescriptors) < 1)
+
+#define DEV_INFO_DESC_CHECK_OPT_CT(bCapabilitiesType) \
+        QEMU_BUILD_BUG_ON((bCapabilitiesType) < 0x20 || \
+                          (bCapabilitiesType) > 0xff)
+
+#define IPP_USB_CT_BASIC    0x00
+
+#define IPP_USB_CAP_BASIC_PRINT                 (1 << 0)
+#define IPP_USB_CAP_BASIC_SCAN                  (1 << 1)
+#define IPP_USB_CAP_BASIC_FAX                   (1 << 2)
+#define IPP_USB_CAP_BASIC_OTHER                 (1 << 3)
+#define IPP_USB_CAP_BASIC_ANY_HTTP_1_1_OVER_USB (1 << 4)
+
+#define IPP_USB_CAP_BASIC_AUTH_NONE              (0x00 << 5)
+#define IPP_USB_CAP_BASIC_AUTH_USERNAME_PASSWORD (0x01 << 5)
+#define IPP_USB_CAP_BASIC_AUTH_RESERVED          (0x02 << 5)
+#define IPP_USB_CAP_BASIC_AUTH_NEGOTIATE         (0x03 << 5)
+
+/* TODO: IPP string table in IPP server implementation */
+
+#endif /* HW_USB_PRINTER_H */
-- 
2.11.0


