Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306CE36D7BA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:53:59 +0200 (CEST)
Received: from localhost ([::1]:35388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjhW-0003qp-7x
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjf1-0001yq-H0
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:51:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjez-0001kB-7W
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619614280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U0FcIaVb86XBieetxSLPYfG1TMBKCFR4ZXl10Qckixc=;
 b=fcUz3rgFAxs853vfiiPlwZhcwHY1flt0u3tHGQ3lvqDKvU+jYIsMko4YbfQI8tdzQz3AYg
 Ovojfkw5I5nOgdr+Ox0wrzcU3nQWGQozRVnoVmKdlL495fWdIsiUwrqudZhsdWIDo05ynF
 XVEYmsw886nCVQgGZ2rjRJl6+CLwUFA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-wHBWg7vZObq3X-BX44se7A-1; Wed, 28 Apr 2021 08:51:18 -0400
X-MC-Unique: wHBWg7vZObq3X-BX44se7A-1
Received: by mail-wr1-f71.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so143093wre.22
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 05:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U0FcIaVb86XBieetxSLPYfG1TMBKCFR4ZXl10Qckixc=;
 b=CQDqe4Jb89Mqct5H+6DTQRjx11el3zsa8znDly6btiWrBYcd+2EkXDOcdaqe6ZqBcj
 ABG+CZSLTsU627P3KbAP71Cbu8yM9E5lUCAQlfKinY+TlHwn/dOgkyw0JqQCIzTbuh+G
 0GtLZiotgrEBLHif7H5TmTaTAHCBboTePUZd+o1ZDaFke5a/1EM2SrlrXeZoRyDQecsG
 PcP7SBTOe8nojg9oS6j+snjqZQbvSwcEns/BNYo+GqOb0pIp2/MhbXWyFEcjmZmosBYT
 /vzCUmhFlnpn+Ttz9wvKSmM2XSmVhiopfh9OVlfgcmC2qiwdOd12sYgy3QyimRaviS7J
 U/xw==
X-Gm-Message-State: AOAM533io14iO1qffrMONggGlHLgI/ASTpgITgg1EZHOmGcr6ZAOYeDm
 3LnqrhT/h9IPTz4YdudKgu0Ga9aNdU9Ks8j7YagWJc9px2iISha2swPYmferdtvB2LktymDE6rK
 5dB6jm9TR6l5pcWg=
X-Received: by 2002:a7b:c4cf:: with SMTP id g15mr7757997wmk.163.1619614276902; 
 Wed, 28 Apr 2021 05:51:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJyQcBQ6ccBaSXugKLarKvspGsrP39mO24fGqklxR40GLxoNHgkXJc9X6OjePf31elSb5M9g==
X-Received: by 2002:a7b:c4cf:: with SMTP id g15mr7757966wmk.163.1619614276670; 
 Wed, 28 Apr 2021 05:51:16 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g6sm9530665wrr.63.2021.04.28.05.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 05:51:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] hw/block/fdc: Declare shared prototypes in
 fdc-internal.h
Date: Wed, 28 Apr 2021 14:50:58 +0200
Message-Id: <20210428125104.358535-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428125104.358535-1-philmd@redhat.com>
References: <20210428125104.358535-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to extract ISA/SysBus code from the generic fdc.c file.
First, declare the prototypes we will access from the new units
into a new local header: "fdc-internal.h".

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
index 36055f14c59..20996f60e1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1676,6 +1676,7 @@ M: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: hw/block/fdc.c
+F: hw/block/fdc-internal.h
 F: include/hw/block/fdc.h
 F: tests/qtest/fdc-test.c
 T: git https://gitlab.com/jsnow/qemu.git ide
-- 
2.26.3


