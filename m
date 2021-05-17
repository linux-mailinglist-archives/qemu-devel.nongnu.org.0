Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E86383CDA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:02:54 +0200 (CEST)
Received: from localhost ([::1]:49022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiVx-0006SH-Rf
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1liiAD-0005ql-KP
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:40:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1liiA3-0001pu-Ov
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621276813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tuur5ZsnbARdY5KvIOeccLdQReUN8QEIerCNAY+4WFM=;
 b=fo0kykKmrAW+GHMidYAu+lQ380hlEcIStTQyAyLkgy7gJxtRKVRYvl8mOUF0DJphezfxIg
 v3kulxHJfT/hkGOxFeGobyuPdps7wtGZxWUY6kcU7PxykHydo4r6AQ/+74JvE+S98pu2Xq
 Hw2TZj7xcA43I5owm6hQ322Q5I7G2IE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-9sRNs16LMzG9iaKrtFa6xA-1; Mon, 17 May 2021 14:40:12 -0400
X-MC-Unique: 9sRNs16LMzG9iaKrtFa6xA-1
Received: by mail-ed1-f71.google.com with SMTP id
 y19-20020a0564022713b029038a9f36060dso4401542edd.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tuur5ZsnbARdY5KvIOeccLdQReUN8QEIerCNAY+4WFM=;
 b=FAwzC+/iE8B8mc7RYDIBImn3B3VjvGS5aJINEdNdfFduqxAJnt44b4hLgVt2IrZM7l
 AFP1NkgkRymNEl/++hPKJ+T1hl7S9hJj4/a13bLeFNoY7U4KUhME1f6j3G6MR2PKWQ6h
 zCm1ZYd8V+KNOceRlkuqFg8UZ0ZCrYHOxK6NoMUbjK+dZPXxu6fxtWJxT9cprd7C9e0Y
 boFWzsZ/7qW6pprFO+GvvfxjZQkuMjWcnOttD5waeslvIdlSPpZJbNZ69N6ymYp8MdbS
 fRqk4ceAoeCUuc7OqjSb6Vd8gvf4ObVURk2XC6t8XIPB2sVHqYeJV9ktVRJIZdwwEG/u
 aRBA==
X-Gm-Message-State: AOAM531Zrdr2jp5RqQu8VG5qyx1YRNPkR13Jc9WjddxDrHXUVZ+41U9g
 1QKMqhJSrtfg7WJUNm8e+2wkA/j0Zv6Au+7hvtAr9VsW3JiPJz0/6PNu/5b2VWP0L4KbGTvkWHW
 damYDtXTxaebUZuudmVWZeIOEpJGNHSPIUogANqHCrFykAC9TKFD6mFmhGCGviNwP
X-Received: by 2002:a17:907:62a7:: with SMTP id
 nd39mr1371564ejc.502.1621276810806; 
 Mon, 17 May 2021 11:40:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdLfGWQKQjOniXYPjcC/BT7076gGfU9CjSfwpS8LVz5pQxedrA04kTQpG0nVO8mdmy9Y41tA==
X-Received: by 2002:a17:907:62a7:: with SMTP id
 nd39mr1371536ejc.502.1621276810502; 
 Mon, 17 May 2021 11:40:10 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id cw12sm2757173ejc.17.2021.05.17.11.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 11:40:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v4 3/9] hw/block/fdc: Declare shared prototypes in
 fdc-internal.h
Date: Mon, 17 May 2021 20:39:48 +0200
Message-Id: <20210517183954.1223193-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517183954.1223193-1-philmd@redhat.com>
References: <20210517183954.1223193-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to extract ISA/SysBus code from the generic fdc.c file.
First, declare the prototypes we will access from the new units
into a new local header: "fdc-internal.h".

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/fdc-internal.h | 156 ++++++++++++++++++++++++++++++++++++++++
 hw/block/fdc.c          | 126 +++-----------------------------
 MAINTAINERS             |   1 +
 3 files changed, 165 insertions(+), 118 deletions(-)
 create mode 100644 hw/block/fdc-internal.h

diff --git a/hw/block/fdc-internal.h b/hw/block/fdc-internal.h
new file mode 100644
index 00000000000..278de725e69
--- /dev/null
+++ b/hw/block/fdc-internal.h
@@ -0,0 +1,156 @@
+/*
+ * QEMU Floppy disk emulator (Intel 82078)
+ *
+ * Copyright (c) 2003, 2007 Jocelyn Mayer
+ * Copyright (c) 2008 Hervé Poussineau
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#ifndef HW_BLOCK_FDC_INTERNAL_H
+#define HW_BLOCK_FDC_INTERNAL_H
+
+#include "exec/memory.h"
+#include "exec/ioport.h"
+#include "hw/block/block.h"
+#include "hw/block/fdc.h"
+#include "qapi/qapi-types-block.h"
+
+typedef struct FDCtrl FDCtrl;
+
+/* Floppy bus emulation */
+
+typedef struct FloppyBus {
+    BusState bus;
+    FDCtrl *fdc;
+} FloppyBus;
+
+/* Floppy disk drive emulation */
+
+typedef enum FDriveRate {
+    FDRIVE_RATE_500K = 0x00,  /* 500 Kbps */
+    FDRIVE_RATE_300K = 0x01,  /* 300 Kbps */
+    FDRIVE_RATE_250K = 0x02,  /* 250 Kbps */
+    FDRIVE_RATE_1M   = 0x03,  /*   1 Mbps */
+} FDriveRate;
+
+typedef enum FDriveSize {
+    FDRIVE_SIZE_UNKNOWN,
+    FDRIVE_SIZE_350,
+    FDRIVE_SIZE_525,
+} FDriveSize;
+
+typedef struct FDFormat {
+    FloppyDriveType drive;
+    uint8_t last_sect;
+    uint8_t max_track;
+    uint8_t max_head;
+    FDriveRate rate;
+} FDFormat;
+
+typedef enum FDiskFlags {
+    FDISK_DBL_SIDES  = 0x01,
+} FDiskFlags;
+
+typedef struct FDrive {
+    FDCtrl *fdctrl;
+    BlockBackend *blk;
+    BlockConf *conf;
+    /* Drive status */
+    FloppyDriveType drive;    /* CMOS drive type        */
+    uint8_t perpendicular;    /* 2.88 MB access mode    */
+    /* Position */
+    uint8_t head;
+    uint8_t track;
+    uint8_t sect;
+    /* Media */
+    FloppyDriveType disk;     /* Current disk type      */
+    FDiskFlags flags;
+    uint8_t last_sect;        /* Nb sector per track    */
+    uint8_t max_track;        /* Nb of tracks           */
+    uint16_t bps;             /* Bytes per sector       */
+    uint8_t ro;               /* Is read-only           */
+    uint8_t media_changed;    /* Is media changed       */
+    uint8_t media_rate;       /* Data rate of medium    */
+
+    bool media_validated;     /* Have we validated the media? */
+} FDrive;
+
+struct FDCtrl {
+    MemoryRegion iomem;
+    qemu_irq irq;
+    /* Controller state */
+    QEMUTimer *result_timer;
+    int dma_chann;
+    uint8_t phase;
+    IsaDma *dma;
+    /* Controller's identification */
+    uint8_t version;
+    /* HW */
+    uint8_t sra;
+    uint8_t srb;
+    uint8_t dor;
+    uint8_t dor_vmstate; /* only used as temp during vmstate */
+    uint8_t tdr;
+    uint8_t dsr;
+    uint8_t msr;
+    uint8_t cur_drv;
+    uint8_t status0;
+    uint8_t status1;
+    uint8_t status2;
+    /* Command FIFO */
+    uint8_t *fifo;
+    int32_t fifo_size;
+    uint32_t data_pos;
+    uint32_t data_len;
+    uint8_t data_state;
+    uint8_t data_dir;
+    uint8_t eot; /* last wanted sector */
+    /* States kept only to be returned back */
+    /* precompensation */
+    uint8_t precomp_trk;
+    uint8_t config;
+    uint8_t lock;
+    /* Power down config (also with status regB access mode */
+    uint8_t pwrd;
+    /* Floppy drives */
+    FloppyBus bus;
+    uint8_t num_floppies;
+    FDrive drives[MAX_FD];
+    struct {
+        FloppyDriveType type;
+    } qdev_for_drives[MAX_FD];
+    int reset_sensei;
+    FloppyDriveType fallback; /* type=auto failure fallback */
+    /* Timers state */
+    uint8_t timer0;
+    uint8_t timer1;
+    PortioList portio_list;
+};
+
+extern const FDFormat fd_formats[];
+extern const VMStateDescription vmstate_fdc;
+
+uint32_t fdctrl_read(void *opaque, uint32_t reg);
+void fdctrl_write(void *opaque, uint32_t reg, uint32_t value);
+void fdctrl_reset(FDCtrl *fdctrl, int do_irq);
+void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl, Error **errp);
+
+void fdctrl_init_drives(FloppyBus *bus, DriveInfo **fds);
+
+#endif
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 1d3a0473678..300f39672af 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -48,6 +48,7 @@
 #include "qemu/module.h"
 #include "trace.h"
 #include "qom/object.h"
+#include "fdc-internal.h"
 
 /********************************************************/
 /* debug Floppy devices */
@@ -68,15 +69,8 @@
 #define TYPE_FLOPPY_BUS "floppy-bus"
 OBJECT_DECLARE_SIMPLE_TYPE(FloppyBus, FLOPPY_BUS)
 
-typedef struct FDCtrl FDCtrl;
-typedef struct FDrive FDrive;
 static FDrive *get_drv(FDCtrl *fdctrl, int unit);
 
-struct FloppyBus {
-    BusState bus;
-    FDCtrl *fdc;
-};
-
 static const TypeInfo floppy_bus_info = {
     .name = TYPE_FLOPPY_BUS,
     .parent = TYPE_BUS,
@@ -93,32 +87,11 @@ static void floppy_bus_create(FDCtrl *fdc, FloppyBus *bus, DeviceState *dev)
 /********************************************************/
 /* Floppy drive emulation                               */
 
-typedef enum FDriveRate {
-    FDRIVE_RATE_500K = 0x00,  /* 500 Kbps */
-    FDRIVE_RATE_300K = 0x01,  /* 300 Kbps */
-    FDRIVE_RATE_250K = 0x02,  /* 250 Kbps */
-    FDRIVE_RATE_1M   = 0x03,  /*   1 Mbps */
-} FDriveRate;
-
-typedef enum FDriveSize {
-    FDRIVE_SIZE_UNKNOWN,
-    FDRIVE_SIZE_350,
-    FDRIVE_SIZE_525,
-} FDriveSize;
-
-typedef struct FDFormat {
-    FloppyDriveType drive;
-    uint8_t last_sect;
-    uint8_t max_track;
-    uint8_t max_head;
-    FDriveRate rate;
-} FDFormat;
-
 /* In many cases, the total sector size of a format is enough to uniquely
  * identify it. However, there are some total sector collisions between
  * formats of different physical size, and these are noted below by
  * highlighting the total sector size for entries with collisions. */
-static const FDFormat fd_formats[] = {
+const FDFormat fd_formats[] = {
     /* First entry is default format */
     /* 1.44 MB 3"1/2 floppy disks */
     { FLOPPY_DRIVE_TYPE_144, 18, 80, 1, FDRIVE_RATE_500K, }, /* 3.5" 2880 */
@@ -186,35 +159,6 @@ static FDriveSize drive_size(FloppyDriveType drive)
 #define FD_SECTOR_SC           2   /* Sector size code */
 #define FD_RESET_SENSEI_COUNT  4   /* Number of sense interrupts on RESET */
 
-/* Floppy disk drive emulation */
-typedef enum FDiskFlags {
-    FDISK_DBL_SIDES  = 0x01,
-} FDiskFlags;
-
-struct FDrive {
-    FDCtrl *fdctrl;
-    BlockBackend *blk;
-    BlockConf *conf;
-    /* Drive status */
-    FloppyDriveType drive;    /* CMOS drive type        */
-    uint8_t perpendicular;    /* 2.88 MB access mode    */
-    /* Position */
-    uint8_t head;
-    uint8_t track;
-    uint8_t sect;
-    /* Media */
-    FloppyDriveType disk;     /* Current disk type      */
-    FDiskFlags flags;
-    uint8_t last_sect;        /* Nb sector per track    */
-    uint8_t max_track;        /* Nb of tracks           */
-    uint16_t bps;             /* Bytes per sector       */
-    uint8_t ro;               /* Is read-only           */
-    uint8_t media_changed;    /* Is media changed       */
-    uint8_t media_rate;       /* Data rate of medium    */
-
-    bool media_validated;     /* Have we validated the media? */
-};
-
 
 static FloppyDriveType get_fallback_drive_type(FDrive *drv);
 
@@ -626,7 +570,6 @@ static const TypeInfo floppy_drive_info = {
 /********************************************************/
 /* Intel 82078 floppy disk controller emulation          */
 
-static void fdctrl_reset(FDCtrl *fdctrl, int do_irq);
 static void fdctrl_to_command_phase(FDCtrl *fdctrl);
 static int fdctrl_transfer_handler (void *opaque, int nchan,
                                     int dma_pos, int dma_len);
@@ -828,58 +771,6 @@ enum {
 #define FD_MULTI_TRACK(state) ((state) & FD_STATE_MULTI)
 #define FD_FORMAT_CMD(state) ((state) & FD_STATE_FORMAT)
 
-struct FDCtrl {
-    MemoryRegion iomem;
-    qemu_irq irq;
-    /* Controller state */
-    QEMUTimer *result_timer;
-    int dma_chann;
-    uint8_t phase;
-    IsaDma *dma;
-    /* Controller's identification */
-    uint8_t version;
-    /* HW */
-    uint8_t sra;
-    uint8_t srb;
-    uint8_t dor;
-    uint8_t dor_vmstate; /* only used as temp during vmstate */
-    uint8_t tdr;
-    uint8_t dsr;
-    uint8_t msr;
-    uint8_t cur_drv;
-    uint8_t status0;
-    uint8_t status1;
-    uint8_t status2;
-    /* Command FIFO */
-    uint8_t *fifo;
-    int32_t fifo_size;
-    uint32_t data_pos;
-    uint32_t data_len;
-    uint8_t data_state;
-    uint8_t data_dir;
-    uint8_t eot; /* last wanted sector */
-    /* States kept only to be returned back */
-    /* precompensation */
-    uint8_t precomp_trk;
-    uint8_t config;
-    uint8_t lock;
-    /* Power down config (also with status regB access mode */
-    uint8_t pwrd;
-    /* Floppy drives */
-    FloppyBus bus;
-    uint8_t num_floppies;
-    FDrive drives[MAX_FD];
-    struct {
-        FloppyDriveType type;
-    } qdev_for_drives[MAX_FD];
-    int reset_sensei;
-    FloppyDriveType fallback; /* type=auto failure fallback */
-    /* Timers state */
-    uint8_t timer0;
-    uint8_t timer1;
-    PortioList portio_list;
-};
-
 static FloppyDriveType get_fallback_drive_type(FDrive *drv)
 {
     return drv->fdctrl->fallback;
@@ -909,7 +800,7 @@ struct FDCtrlISABus {
     int32_t bootindexB;
 };
 
-static uint32_t fdctrl_read (void *opaque, uint32_t reg)
+uint32_t fdctrl_read(void *opaque, uint32_t reg)
 {
     FDCtrl *fdctrl = opaque;
     uint32_t retval;
@@ -946,7 +837,7 @@ static uint32_t fdctrl_read (void *opaque, uint32_t reg)
     return retval;
 }
 
-static void fdctrl_write (void *opaque, uint32_t reg, uint32_t value)
+void fdctrl_write(void *opaque, uint32_t reg, uint32_t value)
 {
     FDCtrl *fdctrl = opaque;
 
@@ -1178,7 +1069,7 @@ static const VMStateDescription vmstate_fdc_phase = {
     }
 };
 
-static const VMStateDescription vmstate_fdc = {
+const VMStateDescription vmstate_fdc = {
     .name = "fdc",
     .version_id = 2,
     .minimum_version_id = 2,
@@ -1268,7 +1159,7 @@ static void fdctrl_raise_irq(FDCtrl *fdctrl)
 }
 
 /* Reset controller */
-static void fdctrl_reset(FDCtrl *fdctrl, int do_irq)
+void fdctrl_reset(FDCtrl *fdctrl, int do_irq)
 {
     int i;
 
@@ -2484,7 +2375,7 @@ static void fdctrl_result_timer(void *opaque)
 
 /* Init functions */
 
-static void fdctrl_init_drives(FloppyBus *bus, DriveInfo **fds)
+void fdctrl_init_drives(FloppyBus *bus, DriveInfo **fds)
 {
     DeviceState *dev;
     int i;
@@ -2542,8 +2433,7 @@ void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
     fdctrl_init_drives(&sys->state.bus, fds);
 }
 
-static void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl,
-                                  Error **errp)
+void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl, Error **errp)
 {
     int i, j;
     FDrive *drive;
diff --git a/MAINTAINERS b/MAINTAINERS
index 78561a223f9..b1b50c6c334 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1659,6 +1659,7 @@ M: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: hw/block/fdc.c
+F: hw/block/fdc-internal.h
 F: include/hw/block/fdc.h
 F: tests/qtest/fdc-test.c
 T: git https://gitlab.com/jsnow/qemu.git ide
-- 
2.26.3


