Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B896C697AB3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:29:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFxJ-0001ID-Cm; Wed, 15 Feb 2023 06:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxG-00016m-1r
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:06 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxD-0003X4-Up
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:05 -0500
Received: by mail-wr1-x42c.google.com with SMTP id m10so9870267wrn.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vPCFUWnCoirvmC7pfJNFE9qtA0ul6/mOuciO8/LRg2I=;
 b=FpxegphX0ma6uvyN12wrD2QMPPxWyi01rTxxWLaWx+7gCswI5BZ7RcrYR44m6VhiMK
 AptOa9J+ht2zxyDMWaiTfKiljZGiPbAx/bvg9IKRfrxqblVabpaYn16N8We9Zzmb4fgv
 EG9et3THRfwa9vhEj39SCBR1q7SDPyg0GK4FOJJvR6/4VvCqt1JKLYpRNxDvr2u9+f7S
 XdzxZVzcLDWPK/NAnKH3uiqzAwu56sC1Z+syto7Pdbe1FHjhNH5zUXFOY3RgNwWHEnYR
 G0qJVl9NYRs88/arZuGAkOBaeQDkO1Oy9K3vUwN5/BMW4rS+SbA3IufIy1aUr2I72Djv
 EMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vPCFUWnCoirvmC7pfJNFE9qtA0ul6/mOuciO8/LRg2I=;
 b=w+ZtLJirV5cQbA9dtDq2lmiP/ovXt4HqsEyZdcGeS8qfgTuG6LWeZ9+X7PKjyCRtks
 xtYJuWiLOZhD5b77w6E6TQAfzaoFnGHkEC2r/AfdvOxaIxg3yr60Ag3fIFZnYioyLkbh
 xA+or4gaWJI+31wDQBCdcsIXRTZS+Y/h+lBtZ8AEapY+ogC2II4tRE7oyqHeVuLFoyv8
 EoEmSPzO0vSOj4CXL14+fOFwUYoYtTA+SMn2AwxZX4Xmv/cDXBzrc4H6irWgGxcLkWcu
 W3hmYi14KrQt/TSAtsNU5W7cMfHXwJTunlOOPtgpfoN9Ap/DytKek3DrAc5XjT9PjTGB
 Nmog==
X-Gm-Message-State: AO0yUKUjXpelZpycNOcKGFiuEnsyn4JPxBnYFitXMdvT2Rz3Accid989
 7xcN01XkCowGB+y2H7hphDXGzqL+zfVBjGZv
X-Google-Smtp-Source: AK7set9VIEJnPr7nELJWY+DCi63Qo9YotA61HpYgfhAfsb9PsoN/C01qT4xFf8cTyshCS0Yeeu5Huw==
X-Received: by 2002:a5d:6651:0:b0:2c3:be89:7c2a with SMTP id
 f17-20020a5d6651000000b002c3be897c2amr2137024wrw.13.1676460482977; 
 Wed, 15 Feb 2023 03:28:02 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f5-20020adff445000000b002c53f5b13f9sm15282685wrp.0.2023.02.15.03.28.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:28:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/20] hw/ide: Rename ide_set_irq() -> ide_bus_set_irq()
Date: Wed, 15 Feb 2023 12:27:02 +0100
Message-Id: <20230215112712.23110-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

ide_set_irq() operates on a IDEBus; rename it as
ide_bus_set_irq() to emphasize its first argument
is a IDEBus.

Mechanical change using:

  $ sed -i -e 's/ide_set_irq/ide_bus_set_irq/g' \
        $(git grep -l ide_set_irq)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/atapi.c            | 12 +++++------
 hw/ide/core.c             | 44 +++++++++++++++++++--------------------
 hw/ide/macio.c            |  2 +-
 include/hw/ide/internal.h |  2 +-
 4 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index 0c36bd0afd..dcc39df9a4 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -179,7 +179,7 @@ void ide_atapi_cmd_ok(IDEState *s)
     s->status = READY_STAT | SEEK_STAT;
     s->nsector = (s->nsector & ~7) | ATAPI_INT_REASON_IO | ATAPI_INT_REASON_CD;
     ide_transfer_stop(s);
-    ide_set_irq(s->bus);
+    ide_bus_set_irq(s->bus);
 }
 
 void ide_atapi_cmd_error(IDEState *s, int sense_key, int asc)
@@ -191,7 +191,7 @@ void ide_atapi_cmd_error(IDEState *s, int sense_key, int asc)
     s->sense_key = sense_key;
     s->asc = asc;
     ide_transfer_stop(s);
-    ide_set_irq(s->bus);
+    ide_bus_set_irq(s->bus);
 }
 
 void ide_atapi_io_error(IDEState *s, int ret)
@@ -254,7 +254,7 @@ void ide_atapi_cmd_reply_end(IDEState *s)
         } else {
             /* a new transfer is needed */
             s->nsector = (s->nsector & ~7) | ATAPI_INT_REASON_IO;
-            ide_set_irq(s->bus);
+            ide_bus_set_irq(s->bus);
             byte_count_limit = atapi_byte_count_limit(s);
             trace_ide_atapi_cmd_reply_end_bcl(s, byte_count_limit);
             size = s->packet_transfer_size;
@@ -294,7 +294,7 @@ void ide_atapi_cmd_reply_end(IDEState *s)
     /* end of transfer */
     trace_ide_atapi_cmd_reply_end_eot(s, s->status);
     ide_atapi_cmd_ok(s);
-    ide_set_irq(s->bus);
+    ide_bus_set_irq(s->bus);
 }
 
 /* send a reply of 'size' bytes in s->io_buffer to an ATAPI command */
@@ -340,7 +340,7 @@ static void ide_atapi_cmd_check_status(IDEState *s)
     s->error = MC_ERR | (UNIT_ATTENTION << 4);
     s->status = ERR_STAT;
     s->nsector = 0;
-    ide_set_irq(s->bus);
+    ide_bus_set_irq(s->bus);
 }
 /* ATAPI DMA support */
 
@@ -384,7 +384,7 @@ static void ide_atapi_cmd_read_dma_cb(void *opaque, int ret)
     if (s->packet_transfer_size <= 0) {
         s->status = READY_STAT | SEEK_STAT;
         s->nsector = (s->nsector & ~7) | ATAPI_INT_REASON_IO | ATAPI_INT_REASON_CD;
-        ide_set_irq(s->bus);
+        ide_bus_set_irq(s->bus);
         goto eot;
     }
 
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 1473b6057f..117e26cef1 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -654,7 +654,7 @@ void ide_set_sector(IDEState *s, int64_t sector_num)
 
 static void ide_rw_error(IDEState *s) {
     ide_abort_command(s);
-    ide_set_irq(s->bus);
+    ide_bus_set_irq(s->bus);
 }
 
 static void ide_buffered_readv_cb(void *opaque, int ret)
@@ -773,7 +773,7 @@ static void ide_sector_read_cb(void *opaque, int ret)
     s->nsector -= n;
     /* Allow the guest to read the io_buffer */
     ide_transfer_start(s, s->io_buffer, n * BDRV_SECTOR_SIZE, ide_sector_read);
-    ide_set_irq(s->bus);
+    ide_bus_set_irq(s->bus);
 }
 
 static void ide_sector_read(IDEState *s)
@@ -837,7 +837,7 @@ void ide_dma_error(IDEState *s)
     dma_buf_commit(s, 0);
     ide_abort_command(s);
     ide_set_inactive(s, false);
-    ide_set_irq(s->bus);
+    ide_bus_set_irq(s->bus);
 }
 
 int ide_handle_rw_error(IDEState *s, int error, int op)
@@ -907,7 +907,7 @@ static void ide_dma_cb(void *opaque, int ret)
     /* end of transfer ? */
     if (s->nsector == 0) {
         s->status = READY_STAT | SEEK_STAT;
-        ide_set_irq(s->bus);
+        ide_bus_set_irq(s->bus);
         goto eot;
     }
 
@@ -1007,7 +1007,7 @@ static void ide_sector_write(IDEState *s);
 static void ide_sector_write_timer_cb(void *opaque)
 {
     IDEState *s = opaque;
-    ide_set_irq(s->bus);
+    ide_bus_set_irq(s->bus);
 }
 
 static void ide_sector_write_cb(void *opaque, int ret)
@@ -1055,7 +1055,7 @@ static void ide_sector_write_cb(void *opaque, int ret)
         timer_mod(s->sector_write_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                   (NANOSECONDS_PER_SECOND / 1000));
     } else {
-        ide_set_irq(s->bus);
+        ide_bus_set_irq(s->bus);
     }
 }
 
@@ -1106,7 +1106,7 @@ static void ide_flush_cb(void *opaque, int ret)
     }
     s->status = READY_STAT | SEEK_STAT;
     ide_cmd_done(s);
-    ide_set_irq(s->bus);
+    ide_bus_set_irq(s->bus);
 }
 
 static void ide_flush_cache(IDEState *s)
@@ -1195,7 +1195,7 @@ static void ide_cd_change_cb(void *opaque, bool load, Error **errp)
     s->cdrom_changed = 1;
     s->events.new_media = true;
     s->events.eject_request = false;
-    ide_set_irq(s->bus);
+    ide_bus_set_irq(s->bus);
 }
 
 static void ide_cd_eject_request_cb(void *opaque, bool force)
@@ -1206,7 +1206,7 @@ static void ide_cd_eject_request_cb(void *opaque, bool force)
     if (force) {
         s->tray_locked = false;
     }
-    ide_set_irq(s->bus);
+    ide_bus_set_irq(s->bus);
 }
 
 static void ide_cmd_lba48_transform(IDEState *s, int lba48)
@@ -1440,7 +1440,7 @@ static bool cmd_identify(IDEState *s, uint8_t cmd)
         }
         s->status = READY_STAT | SEEK_STAT;
         ide_transfer_start(s, s->io_buffer, 512, ide_transfer_stop);
-        ide_set_irq(s->bus);
+        ide_bus_set_irq(s->bus);
         return false;
     } else {
         if (s->drive_kind == IDE_CD) {
@@ -1630,7 +1630,7 @@ static bool cmd_specify(IDEState *s, uint8_t cmd)
     if (s->blk && s->drive_kind != IDE_CD) {
         s->heads = (s->select & (ATA_DEV_HS)) + 1;
         s->sectors = s->nsector;
-        ide_set_irq(s->bus);
+        ide_bus_set_irq(s->bus);
     } else {
         ide_abort_command(s);
     }
@@ -1731,7 +1731,7 @@ static bool cmd_identify_packet(IDEState *s, uint8_t cmd)
     ide_atapi_identify(s);
     s->status = READY_STAT | SEEK_STAT;
     ide_transfer_start(s, s->io_buffer, 512, ide_transfer_stop);
-    ide_set_irq(s->bus);
+    ide_bus_set_irq(s->bus);
     return false;
 }
 
@@ -1756,7 +1756,7 @@ static bool cmd_exec_dev_diagnostic(IDEState *s, uint8_t cmd)
          * They are part of the regular output (this is why ERR_STAT isn't set)
          * Device 0 passed, Device 1 passed or not present. */
         s->error = 0x01;
-        ide_set_irq(s->bus);
+        ide_bus_set_irq(s->bus);
     }
 
     return false;
@@ -1788,7 +1788,7 @@ static bool cmd_cfa_req_ext_error_code(IDEState *s, uint8_t cmd)
 {
     s->error = 0x09;    /* miscellaneous error */
     s->status = READY_STAT | SEEK_STAT;
-    ide_set_irq(s->bus);
+    ide_bus_set_irq(s->bus);
 
     return false;
 }
@@ -1827,7 +1827,7 @@ static bool cmd_cfa_translate_sector(IDEState *s, uint8_t cmd)
     s->io_buffer[0x1a] = 0x01;                      /* Hot count */
 
     ide_transfer_start(s, s->io_buffer, 0x200, ide_transfer_stop);
-    ide_set_irq(s->bus);
+    ide_bus_set_irq(s->bus);
 
     return false;
 }
@@ -1851,7 +1851,7 @@ static bool cmd_cfa_access_metadata_storage(IDEState *s, uint8_t cmd)
 
     ide_transfer_start(s, s->io_buffer, 0x200, ide_transfer_stop);
     s->status = 0x00; /* NOTE: READY is _not_ set */
-    ide_set_irq(s->bus);
+    ide_bus_set_irq(s->bus);
 
     return false;
 }
@@ -1934,7 +1934,7 @@ static bool cmd_smart(IDEState *s, uint8_t cmd)
 
         s->status = READY_STAT | SEEK_STAT;
         ide_transfer_start(s, s->io_buffer, 0x200, ide_transfer_stop);
-        ide_set_irq(s->bus);
+        ide_bus_set_irq(s->bus);
         return false;
 
     case SMART_READ_DATA:
@@ -1975,7 +1975,7 @@ static bool cmd_smart(IDEState *s, uint8_t cmd)
 
         s->status = READY_STAT | SEEK_STAT;
         ide_transfer_start(s, s->io_buffer, 0x200, ide_transfer_stop);
-        ide_set_irq(s->bus);
+        ide_bus_set_irq(s->bus);
         return false;
 
     case SMART_READ_LOG:
@@ -2014,7 +2014,7 @@ static bool cmd_smart(IDEState *s, uint8_t cmd)
         }
         s->status = READY_STAT | SEEK_STAT;
         ide_transfer_start(s, s->io_buffer, 0x200, ide_transfer_stop);
-        ide_set_irq(s->bus);
+        ide_bus_set_irq(s->bus);
         return false;
 
     case SMART_EXECUTE_OFFLINE:
@@ -2146,7 +2146,7 @@ void ide_exec_cmd(IDEBus *bus, uint32_t val)
 
     if (!ide_cmd_permitted(s, val)) {
         ide_abort_command(s);
-        ide_set_irq(s->bus);
+        ide_bus_set_irq(s->bus);
         return;
     }
 
@@ -2164,7 +2164,7 @@ void ide_exec_cmd(IDEBus *bus, uint32_t val)
         }
 
         ide_cmd_done(s);
-        ide_set_irq(s->bus);
+        ide_bus_set_irq(s->bus);
     }
 }
 
@@ -2783,7 +2783,7 @@ void ide_init2(IDEBus *bus, qemu_irq irq)
     bus->dma = &ide_dma_nop;
 }
 
-void ide_set_irq(IDEBus *bus)
+void ide_bus_set_irq(IDEBus *bus)
 {
     if (!(bus->cmd & IDE_CTRL_DISABLE_IRQ)) {
         qemu_irq_raise(bus->irq);
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 15fd934831..24fb7a3f9d 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -160,7 +160,7 @@ static void pmac_ide_transfer_cb(void *opaque, int ret)
         MACIO_DPRINTF("End of IDE transfer\n");
         qemu_sglist_destroy(&s->sg);
         s->status = READY_STAT | SEEK_STAT;
-        ide_set_irq(s->bus);
+        ide_bus_set_irq(s->bus);
         m->dma_active = false;
         goto done;
     }
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 57a6278327..7b4b71d0b0 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -619,7 +619,7 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
 void ide_init2(IDEBus *bus, qemu_irq irq);
 void ide_exit(IDEState *s);
 int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
-void ide_set_irq(IDEBus *bus);
+void ide_bus_set_irq(IDEBus *bus);
 void ide_register_restart_cb(IDEBus *bus);
 
 void ide_exec_cmd(IDEBus *bus, uint32_t val);
-- 
2.38.1


