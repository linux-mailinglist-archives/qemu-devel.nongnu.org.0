Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6546C2FC175
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:46:33 +0100 (CET)
Received: from localhost ([::1]:54780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xtW-00034y-7j
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1ww8-0003qZ-O9
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 14:45:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1ww2-0002ai-9T
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 14:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611085500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dyv44lnu5WBFPgIRrq07zbjg4dovt6hIOXAW8OyiYXY=;
 b=c+Za/9bERUfK0X7mbl83ftKMZkHcxb3cMQKHleTkVGN1p1ckcXaUt45xzNHxUsz79/0MxC
 FKfzOLgWzfqx6xQ6hZIaeHpatjZw156ujLaO/KC5WtpTbZ3A+1BCoMpK3fRPQikUe0bPdL
 tVkQybcOFKaW0R/DCm5OWg0+2yo59MI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-BqszExj3MRqXQ-7G-r3yew-1; Tue, 19 Jan 2021 14:44:57 -0500
X-MC-Unique: BqszExj3MRqXQ-7G-r3yew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B7CE800D62
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 19:44:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9588E5D6AD;
 Tue, 19 Jan 2021 19:44:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1001A18003A1; Tue, 19 Jan 2021 20:44:52 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] usb: add pcap support.
Date: Tue, 19 Jan 2021 20:44:51 +0100
Message-Id: <20210119194452.2148048-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Log all traffic of a specific usb device to a pcap file for later
inspection.  File format is compatible with linux usb monitor.

Usage:
  qemu -device usb-${somedevice},pcap=file.pcap
  wireshark file.pcap

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/usb.h   |   8 ++
 hw/usb/bus.c       |  16 +++
 hw/usb/core.c      |  17 ++++
 hw/usb/pcap.c      | 242 +++++++++++++++++++++++++++++++++++++++++++++
 hw/usb/meson.build |   1 +
 5 files changed, 284 insertions(+)
 create mode 100644 hw/usb/pcap.c

diff --git a/include/hw/usb.h b/include/hw/usb.h
index a70a72e9177a..abfbfc5284c2 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -231,6 +231,9 @@ struct USBDevice {
     void *opaque;
     uint32_t flags;
 
+    char *pcap_filename;
+    FILE *pcap;
+
     /* Actual connected speed */
     int speed;
     /* Supported speeds, not in info because it may be variable (hostdevs) */
@@ -570,4 +573,9 @@ int usb_get_quirks(uint16_t vendor_id, uint16_t product_id,
                    uint8_t interface_class, uint8_t interface_subclass,
                    uint8_t interface_protocol);
 
+/* pcap.c */
+void usb_pcap_init(FILE *fp);
+void usb_pcap_ctrl(USBPacket *p, bool setup);
+void usb_pcap_data(USBPacket *p, bool setup);
+
 #endif
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 2b1104145157..064f94e9c3cc 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -23,6 +23,7 @@ static Property usb_props[] = {
                     USB_DEV_FLAG_FULL_PATH, true),
     DEFINE_PROP_BIT("msos-desc", USBDevice, flags,
                     USB_DEV_FLAG_MSOS_DESC_ENABLE, true),
+    DEFINE_PROP_STRING("pcap", USBDevice, pcap_filename),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -270,6 +271,17 @@ static void usb_qdev_realize(DeviceState *qdev, Error **errp)
             return;
         }
     }
+
+    if (dev->pcap_filename) {
+        int fd = qemu_open_old(dev->pcap_filename, O_CREAT | O_WRONLY | O_TRUNC, 0666);
+        if (fd < 0) {
+            error_setg(errp, "open %s failed", dev->pcap_filename);
+            usb_qdev_unrealize(qdev);
+            return;
+        }
+        dev->pcap = fdopen(fd, "w");
+        usb_pcap_init(dev->pcap);
+    }
 }
 
 static void usb_qdev_unrealize(DeviceState *qdev)
@@ -283,6 +295,10 @@ static void usb_qdev_unrealize(DeviceState *qdev)
         g_free(s);
     }
 
+    if (dev->pcap) {
+        fclose(dev->pcap);
+    }
+
     if (dev->attached) {
         usb_device_detach(dev);
     }
diff --git a/hw/usb/core.c b/hw/usb/core.c
index e960036f4d5c..7cc2e2785a12 100644
--- a/hw/usb/core.c
+++ b/hw/usb/core.c
@@ -154,6 +154,7 @@ static void do_token_setup(USBDevice *s, USBPacket *p)
     index   = (s->setup_buf[5] << 8) | s->setup_buf[4];
 
     if (s->setup_buf[0] & USB_DIR_IN) {
+        usb_pcap_ctrl(p, true);
         usb_device_handle_control(s, p, request, value, index,
                                   s->setup_len, s->data_buf);
         if (p->status == USB_RET_ASYNC) {
@@ -190,6 +191,7 @@ static void do_token_in(USBDevice *s, USBPacket *p)
     switch(s->setup_state) {
     case SETUP_STATE_ACK:
         if (!(s->setup_buf[0] & USB_DIR_IN)) {
+            usb_pcap_ctrl(p, true);
             usb_device_handle_control(s, p, request, value, index,
                                       s->setup_len, s->data_buf);
             if (p->status == USB_RET_ASYNC) {
@@ -197,6 +199,7 @@ static void do_token_in(USBDevice *s, USBPacket *p)
             }
             s->setup_state = SETUP_STATE_IDLE;
             p->actual_length = 0;
+            usb_pcap_ctrl(p, false);
         }
         break;
 
@@ -215,6 +218,7 @@ static void do_token_in(USBDevice *s, USBPacket *p)
         }
         s->setup_state = SETUP_STATE_IDLE;
         p->status = USB_RET_STALL;
+        usb_pcap_ctrl(p, false);
         break;
 
     default:
@@ -230,6 +234,7 @@ static void do_token_out(USBDevice *s, USBPacket *p)
     case SETUP_STATE_ACK:
         if (s->setup_buf[0] & USB_DIR_IN) {
             s->setup_state = SETUP_STATE_IDLE;
+            usb_pcap_ctrl(p, false);
             /* transfer OK */
         } else {
             /* ignore additional output */
@@ -251,6 +256,7 @@ static void do_token_out(USBDevice *s, USBPacket *p)
         }
         s->setup_state = SETUP_STATE_IDLE;
         p->status = USB_RET_STALL;
+        usb_pcap_ctrl(p, false);
         break;
 
     default:
@@ -288,6 +294,7 @@ static void do_parameter(USBDevice *s, USBPacket *p)
         usb_packet_copy(p, s->data_buf, s->setup_len);
     }
 
+    usb_pcap_ctrl(p, true);
     usb_device_handle_control(s, p, request, value, index,
                               s->setup_len, s->data_buf);
     if (p->status == USB_RET_ASYNC) {
@@ -301,6 +308,7 @@ static void do_parameter(USBDevice *s, USBPacket *p)
         p->actual_length = 0;
         usb_packet_copy(p, s->data_buf, s->setup_len);
     }
+    usb_pcap_ctrl(p, false);
 }
 
 /* ctrl complete function for devices which use usb_generic_handle_packet and
@@ -311,6 +319,7 @@ void usb_generic_async_ctrl_complete(USBDevice *s, USBPacket *p)
 {
     if (p->status < 0) {
         s->setup_state = SETUP_STATE_IDLE;
+        usb_pcap_ctrl(p, false);
     }
 
     switch (s->setup_state) {
@@ -325,6 +334,7 @@ void usb_generic_async_ctrl_complete(USBDevice *s, USBPacket *p)
     case SETUP_STATE_ACK:
         s->setup_state = SETUP_STATE_IDLE;
         p->actual_length = 0;
+        usb_pcap_ctrl(p, false);
         break;
 
     case SETUP_STATE_PARAM:
@@ -359,12 +369,14 @@ USBDevice *usb_find_device(USBPort *port, uint8_t addr)
 static void usb_process_one(USBPacket *p)
 {
     USBDevice *dev = p->ep->dev;
+    bool nak;
 
     /*
      * Handlers expect status to be initialized to USB_RET_SUCCESS, but it
      * can be USB_RET_NAK here from a previous usb_process_one() call,
      * or USB_RET_ASYNC from going through usb_queue_one().
      */
+    nak = (p->status == USB_RET_NAK);
     p->status = USB_RET_SUCCESS;
 
     if (p->ep->nr == 0) {
@@ -388,6 +400,9 @@ static void usb_process_one(USBPacket *p)
         }
     } else {
         /* data pipe */
+        if (!nak) {
+            usb_pcap_data(p, true);
+        }
         usb_device_handle_data(dev, p);
     }
 }
@@ -439,6 +454,7 @@ void usb_handle_packet(USBDevice *dev, USBPacket *p)
             assert(p->stream || !p->ep->pipeline ||
                    QTAILQ_EMPTY(&p->ep->queue));
             if (p->status != USB_RET_NAK) {
+                usb_pcap_data(p, false);
                 usb_packet_set_state(p, USB_PACKET_COMPLETE);
             }
         }
@@ -458,6 +474,7 @@ void usb_packet_complete_one(USBDevice *dev, USBPacket *p)
             (p->short_not_ok && (p->actual_length < p->iov.size))) {
         ep->halted = true;
     }
+    usb_pcap_data(p, false);
     usb_packet_set_state(p, USB_PACKET_COMPLETE);
     QTAILQ_REMOVE(&ep->queue, p, queue);
     dev->port->ops->complete(dev->port, p);
diff --git a/hw/usb/pcap.c b/hw/usb/pcap.c
new file mode 100644
index 000000000000..d3162d65e5fe
--- /dev/null
+++ b/hw/usb/pcap.c
@@ -0,0 +1,242 @@
+#include "qemu/osdep.h"
+#include "hw/usb.h"
+
+#define PCAP_MAGIC                   0xa1b2c3d4
+#define PCAP_MAJOR                   2
+#define PCAP_MINOR                   4
+
+/* https://wiki.wireshark.org/Development/LibpcapFileFormat */
+
+struct pcap_hdr {
+    uint32_t magic_number;   /* magic number */
+    uint16_t version_major;  /* major version number */
+    uint16_t version_minor;  /* minor version number */
+    int32_t  thiszone;       /* GMT to local correction */
+    uint32_t sigfigs;        /* accuracy of timestamps */
+    uint32_t snaplen;        /* max length of captured packets, in octets */
+    uint32_t network;        /* data link type */
+};
+
+struct pcaprec_hdr {
+    uint32_t ts_sec;         /* timestamp seconds */
+    uint32_t ts_usec;        /* timestamp microseconds */
+    uint32_t incl_len;       /* number of octets of packet saved in file */
+    uint32_t orig_len;       /* actual length of packet */
+};
+
+/* https://www.tcpdump.org/linktypes.html */
+/* linux: Documentation/usb/usbmon.rst */
+/* linux: drivers/usb/mon/mon_bin.c */
+
+#define LINKTYPE_USB_LINUX           189  /* first 48 bytes only */
+#define LINKTYPE_USB_LINUX_MMAPPED   220  /* full 64 byte header */
+
+struct usbmon_packet {
+    uint64_t id;             /*  0: URB ID - from submission to callback */
+    unsigned char type;      /*  8: Same as text; extensible. */
+    unsigned char xfer_type; /*     ISO (0), Intr, Control, Bulk (3) */
+    unsigned char epnum;     /*     Endpoint number and transfer direction */
+    unsigned char devnum;    /*     Device address */
+    uint16_t busnum;         /* 12: Bus number */
+    char flag_setup;         /* 14: Same as text */
+    char flag_data;          /* 15: Same as text; Binary zero is OK. */
+    int64_t ts_sec;          /* 16: gettimeofday */
+    int32_t ts_usec;         /* 24: gettimeofday */
+    int32_t status;          /* 28: */
+    unsigned int length;     /* 32: Length of data (submitted or actual) */
+    unsigned int len_cap;    /* 36: Delivered length */
+    union {                  /* 40: */
+        unsigned char setup[8];         /* Only for Control S-type */
+        struct iso_rec {                /* Only for ISO */
+            int32_t error_count;
+            int32_t numdesc;
+        } iso;
+    } s;
+    int32_t interval;        /* 48: Only for Interrupt and ISO */
+    int32_t start_frame;     /* 52: For ISO */
+    uint32_t xfer_flags;     /* 56: copy of URB's transfer_flags */
+    uint32_t ndesc;          /* 60: Actual number of ISO descriptors */
+};                           /* 64 total length */
+
+/* ------------------------------------------------------------------------ */
+
+#define CTRL_LEN                     4096
+#define DATA_LEN                     256
+
+static int usbmon_status(USBPacket *p)
+{
+    switch (p->status) {
+    case USB_RET_SUCCESS:
+        return 0;
+    case USB_RET_NODEV:
+        return -19;  /* -ENODEV */
+    default:
+        return -121; /* -EREMOTEIO */
+    }
+}
+
+static unsigned int usbmon_epnum(USBPacket *p)
+{
+    unsigned epnum = 0;
+
+    epnum |= p->ep->nr;
+    epnum |= (p->pid == USB_TOKEN_IN) ? 0x80 : 0;
+    return epnum;
+}
+
+static unsigned char usbmon_xfer_type[] = {
+    [USB_ENDPOINT_XFER_CONTROL] = 2,
+    [USB_ENDPOINT_XFER_ISOC]    = 0,
+    [USB_ENDPOINT_XFER_BULK]    = 3,
+    [USB_ENDPOINT_XFER_INT]     = 1,
+};
+
+static void do_usb_pcap_header(FILE *fp, struct usbmon_packet *packet)
+{
+    struct pcaprec_hdr header;
+    struct timeval tv;
+
+    gettimeofday(&tv, NULL);
+    packet->ts_sec  = tv.tv_sec;
+    packet->ts_usec = tv.tv_usec;
+
+    header.ts_sec   = packet->ts_sec;
+    header.ts_usec  = packet->ts_usec;
+    header.incl_len = packet->len_cap;
+    header.orig_len = packet->length + sizeof(*packet);
+    fwrite(&header, sizeof(header), 1, fp);
+    fwrite(packet, sizeof(*packet), 1, fp);
+}
+
+static void do_usb_pcap_ctrl(FILE *fp, USBPacket *p, bool setup)
+{
+    USBDevice *dev = p->ep->dev;
+    bool in = dev->setup_buf[0] & USB_DIR_IN;
+    struct usbmon_packet packet = {
+        .id         = 0,
+        .type       = setup ? 'S' : 'C',
+        .xfer_type  = usbmon_xfer_type[USB_ENDPOINT_XFER_CONTROL],
+        .epnum      = in ? 0x80 : 0,
+        .devnum     = dev->addr,
+        .flag_data  = '=',
+        .length     = dev->setup_len,
+    };
+    int data_len = dev->setup_len;
+
+    if (data_len > CTRL_LEN) {
+        data_len = CTRL_LEN;
+    }
+    if (setup) {
+        memcpy(packet.s.setup, dev->setup_buf, 8);
+    } else {
+        packet.status = usbmon_status(p);
+    }
+
+    if (in && setup) {
+        packet.flag_data = '<';
+        packet.length = 0;
+        data_len  = 0;
+    }
+    if (!in && !setup) {
+        packet.flag_data = '>';
+        packet.length = 0;
+        data_len  = 0;
+    }
+
+    packet.len_cap = data_len + sizeof(packet);
+    do_usb_pcap_header(fp, &packet);
+    if (data_len) {
+        fwrite(dev->data_buf, data_len, 1, fp);
+    }
+
+    fflush(fp);
+}
+
+static void do_usb_pcap_data(FILE *fp, USBPacket *p, bool setup)
+{
+    struct usbmon_packet packet = {
+        .id         = p->id,
+        .type       = setup ? 'S' : 'C',
+        .xfer_type  = usbmon_xfer_type[p->ep->type],
+        .epnum      = usbmon_epnum(p),
+        .devnum     = p->ep->dev->addr,
+        .flag_data  = '=',
+        .length     = p->iov.size,
+    };
+    int data_len = p->iov.size;
+
+    if (p->ep->nr == 0) {
+        /* ignore control pipe packets */
+        return;
+    }
+
+    if (data_len > DATA_LEN) {
+        data_len = DATA_LEN;
+    }
+    if (!setup) {
+        packet.status = usbmon_status(p);
+        if (packet.length > p->actual_length) {
+            packet.length = p->actual_length;
+        }
+        if (data_len > p->actual_length) {
+            data_len = p->actual_length;
+        }
+    }
+
+    if (p->pid == USB_TOKEN_IN && setup) {
+        packet.flag_data = '<';
+        packet.length = 0;
+        data_len  = 0;
+    }
+    if (p->pid == USB_TOKEN_OUT && !setup) {
+        packet.flag_data = '>';
+        packet.length = 0;
+        data_len  = 0;
+    }
+
+    packet.len_cap = data_len + sizeof(packet);
+    do_usb_pcap_header(fp, &packet);
+    if (data_len) {
+        void *buf = g_malloc(data_len);
+        iov_to_buf(p->iov.iov, p->iov.niov, 0, buf, data_len);
+        fwrite(buf, data_len, 1, fp);
+        g_free(buf);
+    }
+
+    fflush(fp);
+}
+
+void usb_pcap_init(FILE *fp)
+{
+    struct pcap_hdr header = {
+        .magic_number  = PCAP_MAGIC,
+        .version_major = 2,
+        .version_minor = 4,
+        .snaplen       = MAX(CTRL_LEN, DATA_LEN) + sizeof(struct usbmon_packet),
+        .network       = LINKTYPE_USB_LINUX_MMAPPED,
+    };
+
+    fwrite(&header, sizeof(header), 1, fp);
+}
+
+void usb_pcap_ctrl(USBPacket *p, bool setup)
+{
+    FILE *fp = p->ep->dev->pcap;
+
+    if (!fp) {
+        return;
+    }
+
+    do_usb_pcap_ctrl(fp, p, setup);
+}
+
+void usb_pcap_data(USBPacket *p, bool setup)
+{
+    FILE *fp = p->ep->dev->pcap;
+
+    if (!fp) {
+        return;
+    }
+
+    do_usb_pcap_data(fp, p, setup);
+}
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index f46c6b665535..653192cff6fa 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -5,6 +5,7 @@ softmmu_ss.add(files(
   'bus.c',
   'combined-packet.c',
   'core.c',
+  'pcap.c',
   'libhw.c'
 ))
 
-- 
2.29.2


