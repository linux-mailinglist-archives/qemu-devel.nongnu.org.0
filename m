Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A449340933
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:52:26 +0100 (CET)
Received: from localhost ([::1]:40464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMuwj-00057A-B6
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMutx-0003cJ-JH
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:49:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMutn-0002Iq-Hq
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616082560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KUchC3a/aElg5UuFpSDTpF9rBM0BaNnvB5c0NMk16Rw=;
 b=SwyRQSzCaRv0D4+y1D9k3E4V9KyPK+bKVRJ0GhufBG6QiJwEd4CLHwAFZKuSPYR75wzLZx
 zHs+jhaNbQ2XE7RbRsMJ4RMtFjEgmx27xKZ5hAfvWd5KkdjFIBOfGxjc9ew9e3Sj3jke1n
 sx5YqU+aDzt2vfjxsM0uRBXJNFI3J00=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-G1OXFktOPLK1wb8VbZm1aQ-1; Thu, 18 Mar 2021 11:49:19 -0400
X-MC-Unique: G1OXFktOPLK1wb8VbZm1aQ-1
Received: by mail-wr1-f71.google.com with SMTP id h21so20133086wrc.19
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 08:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KUchC3a/aElg5UuFpSDTpF9rBM0BaNnvB5c0NMk16Rw=;
 b=MLqu6Q5fIovgAa34+i+q9vgpfePTVb8jKJ7bX3Qt99q60ylDWj2PI5jLaMsdybBzvB
 EoK+n/jSien/7HwlF9zrWryv49LhA8iev6dwuwr2lh7kC56Ji+N45MFTTJs75W/HDbpk
 11ERxBoPY2S9LjM9tw1+H7ATYpfcbawKk4WDWLL62Xc6j4zt9BS3cHbK3oXTQzZfc4wC
 k/ASO5sH8RW2Y4aVWB20jbEsC6kg7VoalwE6molyN9Ugv60zZEF4cgnArYLnp4OQ2Kcz
 EYTQKUnWAzsQL4SaL7tG5IBjFdVid2Qgztclvym/JjUvaAfxjOgp+ZY4kN4yMsuGdXd+
 7BpQ==
X-Gm-Message-State: AOAM530oN9aKya7LnwoNZogmC7k6OmsusZE5DSKs0RERbshKHRV+4b1q
 Bk2KlTtVDa4dH+zGXKiSD0hOoOzEYu8C9S2mYLiwq5cuFIjqD0wPPlqdAGwhExUPuyHwHUQRShD
 4HZ7bhwp9oBwCSqkND8iLMjGp3e5iLUaj/RGl1NZZWZwBhtVmb6WYK0f6lODXThqv
X-Received: by 2002:adf:f0c1:: with SMTP id x1mr10229947wro.7.1616082557047;
 Thu, 18 Mar 2021 08:49:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeGnp5A3GpkbcOwi+da78F8rJHket9VGgC7Q1onxmSeUlFnR3guPxeTqVO4b1e/Y0D11Rlfw==
X-Received: by 2002:adf:f0c1:: with SMTP id x1mr10229912wro.7.1616082556643;
 Thu, 18 Mar 2021 08:49:16 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m3sm2354105wme.40.2021.03.18.08.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 08:49:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: 
Subject: [PULL v2 11/11] hw/block/pflash_cfi: Replace DPRINTF with trace events
Date: Thu, 18 Mar 2021 16:48:54 +0100
Message-Id: <20210318154854.3671458-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210318154854.3671458-1-philmd@redhat.com>
References: <20210318154854.3671458-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

Rather than having a device specific debug implementation in
pflash_cfi01.c and pflash_cfi02.c, use the standard tracing facility.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210216142721.1985543-2-david.edmondson@oracle.com>
[PMD: Rebased, fixed pflash_write_block_erase trace event format]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/block/pflash_cfi01.c | 80 +++++++++++++++++------------------------
 hw/block/pflash_cfi02.c | 78 ++++++++++++++++------------------------
 hw/block/trace-events   | 41 +++++++++++++++------
 3 files changed, 95 insertions(+), 104 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 07910356756..81f9f971d88 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -56,16 +56,6 @@
 #include "sysemu/runstate.h"
 #include "trace.h"
 
-/* #define PFLASH_DEBUG */
-#ifdef PFLASH_DEBUG
-#define DPRINTF(fmt, ...)                                   \
-do {                                                        \
-    fprintf(stderr, "PFLASH: " fmt , ## __VA_ARGS__);       \
-} while (0)
-#else
-#define DPRINTF(fmt, ...) do { } while (0)
-#endif
-
 #define PFLASH_BE          0
 #define PFLASH_SECURE      1
 
@@ -155,10 +145,8 @@ static uint32_t pflash_cfi_query(PFlashCFI01 *pfl, hwaddr offset)
          * wider part.
          */
         if (pfl->device_width != 1 || pfl->bank_width > 4) {
-            DPRINTF("%s: Unsupported device configuration: "
-                    "device_width=%d, max_device_width=%d\n",
-                    __func__, pfl->device_width,
-                    pfl->max_device_width);
+            trace_pflash_unsupported_device_configuration(pfl->name,
+                                    pfl->device_width, pfl->max_device_width);
             return 0;
         }
         /* CFI query data is repeated, rather than zero padded for
@@ -210,14 +198,14 @@ static uint32_t pflash_devid_query(PFlashCFI01 *pfl, hwaddr offset)
     switch (boff & 0xFF) {
     case 0:
         resp = pfl->ident0;
-        trace_pflash_manufacturer_id(resp);
+        trace_pflash_manufacturer_id(pfl->name, resp);
         break;
     case 1:
         resp = pfl->ident1;
-        trace_pflash_device_id(resp);
+        trace_pflash_device_id(pfl->name, resp);
         break;
     default:
-        trace_pflash_device_info(offset);
+        trace_pflash_device_info(pfl->name, offset);
         return 0;
     }
     /* Replicate responses for each device in bank. */
@@ -265,10 +253,9 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl, hwaddr offset,
         }
         break;
     default:
-        DPRINTF("BUG in %s\n", __func__);
         abort();
     }
-    trace_pflash_data_read(offset, width, ret);
+    trace_pflash_data_read(pfl->name, offset, width, ret);
     return ret;
 }
 
@@ -282,7 +269,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
     switch (pfl->cmd) {
     default:
         /* This should never happen : reset state & treat it as a read */
-        DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
+        trace_pflash_read_unknown_state(pfl->name, pfl->cmd);
         pfl->wcycle = 0;
         /*
          * The command 0x00 is not assigned by the CFI open standard,
@@ -320,7 +307,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
              */
             ret |= pfl->status << 16;
         }
-        DPRINTF("%s: status %x\n", __func__, ret);
+        trace_pflash_read_status(pfl->name, ret);
         break;
     case 0x90:
         if (!pfl->device_width) {
@@ -335,14 +322,14 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
             switch (boff) {
             case 0:
                 ret = pfl->ident0 << 8 | pfl->ident1;
-                trace_pflash_manufacturer_id(ret);
+                trace_pflash_manufacturer_id(pfl->name, ret);
                 break;
             case 1:
                 ret = pfl->ident2 << 8 | pfl->ident3;
-                trace_pflash_device_id(ret);
+                trace_pflash_device_id(pfl->name, ret);
                 break;
             default:
-                trace_pflash_device_info(boff);
+                trace_pflash_device_info(pfl->name, boff);
                 ret = 0;
                 break;
             }
@@ -389,7 +376,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
 
         break;
     }
-    trace_pflash_io_read(offset, width, ret, pfl->cmd, pfl->wcycle);
+    trace_pflash_io_read(pfl->name, offset, width, ret, pfl->cmd, pfl->wcycle);
 
     return ret;
 }
@@ -419,7 +406,7 @@ static inline void pflash_data_write(PFlashCFI01 *pfl, hwaddr offset,
 {
     uint8_t *p = pfl->storage;
 
-    trace_pflash_data_write(offset, width, value, pfl->counter);
+    trace_pflash_data_write(pfl->name, offset, width, value, pfl->counter);
     switch (width) {
     case 1:
         p[offset] = value;
@@ -458,7 +445,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
 
     cmd = value;
 
-    trace_pflash_io_write(offset, width, value, pfl->wcycle);
+    trace_pflash_io_write(pfl->name, offset, width, value, pfl->wcycle);
     if (!pfl->wcycle) {
         /* Set the device in I/O access mode */
         memory_region_rom_device_set_romd(&pfl->mem, false);
@@ -472,14 +459,13 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             goto mode_read_array;
         case 0x10: /* Single Byte Program */
         case 0x40: /* Single Byte Program */
-            DPRINTF("%s: Single Byte Program\n", __func__);
+            trace_pflash_write(pfl->name, "single byte program (0)");
             break;
         case 0x20: /* Block erase */
             p = pfl->storage;
             offset &= ~(pfl->sector_len - 1);
 
-            DPRINTF("%s: block erase at " TARGET_FMT_plx " bytes %x\n",
-                    __func__, offset, (unsigned)pfl->sector_len);
+            trace_pflash_write_block_erase(pfl->name, offset, pfl->sector_len);
 
             if (!pfl->ro) {
                 memset(p + offset, 0xff, pfl->sector_len);
@@ -490,25 +476,25 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             pfl->status |= 0x80; /* Ready! */
             break;
         case 0x50: /* Clear status bits */
-            DPRINTF("%s: Clear status bits\n", __func__);
+            trace_pflash_write(pfl->name, "clear status bits");
             pfl->status = 0x0;
             goto mode_read_array;
         case 0x60: /* Block (un)lock */
-            DPRINTF("%s: Block unlock\n", __func__);
+            trace_pflash_write(pfl->name, "block unlock");
             break;
         case 0x70: /* Status Register */
-            DPRINTF("%s: Read status register\n", __func__);
+            trace_pflash_write(pfl->name, "read status register");
             pfl->cmd = cmd;
             return;
         case 0x90: /* Read Device ID */
-            DPRINTF("%s: Read Device information\n", __func__);
+            trace_pflash_write(pfl->name, "read device information");
             pfl->cmd = cmd;
             return;
         case 0x98: /* CFI query */
-            DPRINTF("%s: CFI query\n", __func__);
+            trace_pflash_write(pfl->name, "CFI query");
             break;
         case 0xe8: /* Write to buffer */
-            DPRINTF("%s: Write to buffer\n", __func__);
+            trace_pflash_write(pfl->name, "write to buffer");
             /* FIXME should save @offset, @width for case 1+ */
             qemu_log_mask(LOG_UNIMP,
                           "%s: Write to buffer emulation is flawed\n",
@@ -516,10 +502,10 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             pfl->status |= 0x80; /* Ready! */
             break;
         case 0xf0: /* Probe for AMD flash */
-            DPRINTF("%s: Probe for AMD flash\n", __func__);
+            trace_pflash_write(pfl->name, "probe for AMD flash");
             goto mode_read_array;
         case 0xff: /* Read Array */
-            DPRINTF("%s: Read array mode\n", __func__);
+            trace_pflash_write(pfl->name, "read array mode");
             goto mode_read_array;
         default:
             goto error_flash;
@@ -531,7 +517,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
         switch (pfl->cmd) {
         case 0x10: /* Single Byte Program */
         case 0x40: /* Single Byte Program */
-            DPRINTF("%s: Single Byte Program\n", __func__);
+            trace_pflash_write(pfl->name, "single byte program (1)");
             if (!pfl->ro) {
                 pflash_data_write(pfl, offset, value, width, be);
                 pflash_update(pfl, offset, width);
@@ -563,7 +549,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             } else {
                 value = extract32(value, 0, pfl->bank_width * 8);
             }
-            DPRINTF("%s: block write of %x bytes\n", __func__, value);
+            trace_pflash_write_block(pfl->name, value);
             pfl->counter = value;
             pfl->wcycle++;
             break;
@@ -577,7 +563,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             } else if (cmd == 0xff) { /* Read Array */
                 goto mode_read_array;
             } else {
-                DPRINTF("%s: Unknown (un)locking command\n", __func__);
+                trace_pflash_write(pfl->name, "unknown (un)locking command");
                 goto mode_read_array;
             }
             break;
@@ -585,7 +571,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             if (cmd == 0xff) { /* Read Array */
                 goto mode_read_array;
             } else {
-                DPRINTF("%s: leaving query mode\n", __func__);
+                trace_pflash_write(pfl->name, "leaving query mode");
             }
             break;
         default:
@@ -613,7 +599,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                 hwaddr mask = pfl->writeblock_size - 1;
                 mask = ~mask;
 
-                DPRINTF("%s: block write finished\n", __func__);
+                trace_pflash_write(pfl->name, "block write finished");
                 pfl->wcycle++;
                 if (!pfl->ro) {
                     /* Flush the entire write buffer onto backing storage.  */
@@ -652,7 +638,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
         break;
     default:
         /* Should never happen */
-        DPRINTF("%s: invalid write state\n",  __func__);
+        trace_pflash_write(pfl->name, "invalid write state");
         goto mode_read_array;
     }
     return;
@@ -663,7 +649,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                   "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
 
  mode_read_array:
-    trace_pflash_mode_read_array();
+    trace_pflash_mode_read_array(pfl->name);
     memory_region_rom_device_set_romd(&pfl->mem, true);
     pfl->wcycle = 0;
     pfl->cmd = 0x00; /* This model reset value for READ_ARRAY (not CFI) */
@@ -886,7 +872,7 @@ static void pflash_cfi01_system_reset(DeviceState *dev)
 {
     PFlashCFI01 *pfl = PFLASH_CFI01(dev);
 
-    trace_pflash_reset();
+    trace_pflash_reset(pfl->name);
     /*
      * The command 0x00 is not assigned by the CFI open standard,
      * but QEMU historically uses it for the READ_ARRAY command (0xff).
@@ -1041,7 +1027,7 @@ static void postload_update_cb(void *opaque, bool running, RunState state)
     qemu_del_vm_change_state_handler(pfl->vmstate);
     pfl->vmstate = NULL;
 
-    DPRINTF("%s: updating bdrv for %s\n", __func__, pfl->name);
+    trace_pflash_postload_cb(pfl->name);
     pflash_update(pfl, 0, pfl->sector_len * pfl->nb_blocs);
 }
 
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index c40febd2a41..25c053693ce 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -48,14 +48,6 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 
-#define PFLASH_DEBUG false
-#define DPRINTF(fmt, ...)                                  \
-do {                                                       \
-    if (PFLASH_DEBUG) {                                    \
-        fprintf(stderr, "PFLASH: " fmt, ## __VA_ARGS__);   \
-    }                                                      \
-} while (0)
-
 #define PFLASH_LAZY_ROMD_THRESHOLD 42
 
 /*
@@ -186,14 +178,14 @@ static void pflash_setup_mappings(PFlashCFI02 *pfl)
 
 static void pflash_reset_state_machine(PFlashCFI02 *pfl)
 {
-    trace_pflash_reset();
+    trace_pflash_reset(pfl->name);
     pfl->cmd = 0x00;
     pfl->wcycle = 0;
 }
 
 static void pflash_mode_read_array(PFlashCFI02 *pfl)
 {
-    trace_pflash_mode_read_array();
+    trace_pflash_mode_read_array(pfl->name);
     pflash_reset_state_machine(pfl);
     pfl->rom_mode = true;
     memory_region_rom_device_set_romd(&pfl->orig_mem, true);
@@ -231,7 +223,7 @@ static void pflash_timer(void *opaque)
 {
     PFlashCFI02 *pfl = opaque;
 
-    trace_pflash_timer_expired(pfl->cmd);
+    trace_pflash_timer_expired(pfl->name, pfl->cmd);
     if (pfl->cmd == 0x30) {
         /*
          * Sector erase. If DQ3 is 0 when the timer expires, then the 50
@@ -244,11 +236,10 @@ static void pflash_timer(void *opaque)
             uint64_t timeout = pflash_erase_time(pfl);
             timer_mod(&pfl->timer,
                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + timeout);
-            DPRINTF("%s: erase timeout fired; erasing %d sectors\n",
-                    __func__, pfl->sectors_to_erase);
+            trace_pflash_erase_timeout(pfl->name, pfl->sectors_to_erase);
             return;
         }
-        DPRINTF("%s: sector erase complete\n", __func__);
+        trace_pflash_erase_complete(pfl->name);
         bitmap_zero(pfl->sector_erase_map, pfl->total_sectors);
         pfl->sectors_to_erase = 0;
         reset_dq3(pfl);
@@ -272,7 +263,7 @@ static uint64_t pflash_data_read(PFlashCFI02 *pfl, hwaddr offset,
 {
     uint8_t *p = (uint8_t *)pfl->storage + offset;
     uint64_t ret = pfl->be ? ldn_be_p(p, width) : ldn_le_p(p, width);
-    trace_pflash_data_read(offset, width, ret);
+    trace_pflash_data_read(pfl->name, offset, width, ret);
     return ret;
 }
 
@@ -335,7 +326,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
     switch (pfl->cmd) {
     default:
         /* This should never happen : reset state & treat it as a read*/
-        DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
+        trace_pflash_read_unknown_state(pfl->name, pfl->cmd);
         pflash_reset_state_machine(pfl);
         /* fall through to the read code */
     case 0x80: /* Erase (unlock) */
@@ -347,7 +338,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
             toggle_dq2(pfl);
             /* Status register read */
             ret = pfl->status;
-            DPRINTF("%s: status %" PRIx64 "\n", __func__, ret);
+            trace_pflash_read_status(pfl->name, ret);
             break;
         }
         /* Flash area read */
@@ -372,7 +363,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
         default:
             ret = pflash_data_read(pfl, offset, width);
         }
-        DPRINTF("%s: ID " TARGET_FMT_plx " %" PRIx64 "\n", __func__, boff, ret);
+        trace_pflash_read_done(pfl->name, boff, ret);
         break;
     case 0x10: /* Chip Erase */
     case 0x30: /* Sector Erase */
@@ -384,7 +375,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
         toggle_dq6(pfl);
         /* Status register read */
         ret = pfl->status;
-        DPRINTF("%s: status %" PRIx64 "\n", __func__, ret);
+        trace_pflash_read_status(pfl->name, ret);
         break;
     case 0x98:
         /* CFI query mode */
@@ -395,7 +386,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
         }
         break;
     }
-    trace_pflash_io_read(offset, width, ret, pfl->cmd, pfl->wcycle);
+    trace_pflash_io_read(pfl->name, offset, width, ret, pfl->cmd, pfl->wcycle);
 
     return ret;
 }
@@ -424,9 +415,8 @@ static void pflash_sector_erase(PFlashCFI02 *pfl, hwaddr offset)
     SectorInfo sector_info = pflash_sector_info(pfl, offset);
     uint64_t sector_len = sector_info.len;
     offset &= ~(sector_len - 1);
-    DPRINTF("%s: start sector erase at %0*" PRIx64 "-%0*" PRIx64 "\n",
-            __func__, pfl->width * 2, offset,
-            pfl->width * 2, offset + sector_len - 1);
+    trace_pflash_sector_erase_start(pfl->name, pfl->width * 2, offset,
+                                    pfl->width * 2, offset + sector_len - 1);
     if (!pfl->ro) {
         uint8_t *p = pfl->storage;
         memset(p + offset, 0xff, sector_len);
@@ -447,7 +437,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
     uint8_t *p;
     uint8_t cmd;
 
-    trace_pflash_io_write(offset, width, value, pfl->wcycle);
+    trace_pflash_io_write(pfl->name, offset, width, value, pfl->wcycle);
     cmd = value;
     if (pfl->cmd != 0xA0) {
         /* Reset does nothing during chip erase and sector erase. */
@@ -507,27 +497,25 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             return;
         }
         if (boff != pfl->unlock_addr0 || cmd != 0xAA) {
-            DPRINTF("%s: unlock0 failed " TARGET_FMT_plx " %02x %04x\n",
-                    __func__, boff, cmd, pfl->unlock_addr0);
+            trace_pflash_unlock0_failed(pfl->name, boff,
+                                        cmd, pfl->unlock_addr0);
             goto reset_flash;
         }
-        DPRINTF("%s: unlock sequence started\n", __func__);
+        trace_pflash_write(pfl->name, "unlock sequence started");
         break;
     case 1:
         /* We started an unlock sequence */
     check_unlock1:
         if (boff != pfl->unlock_addr1 || cmd != 0x55) {
-            DPRINTF("%s: unlock1 failed " TARGET_FMT_plx " %02x\n", __func__,
-                    boff, cmd);
+            trace_pflash_unlock1_failed(pfl->name, boff, cmd);
             goto reset_flash;
         }
-        DPRINTF("%s: unlock sequence done\n", __func__);
+        trace_pflash_write(pfl->name, "unlock sequence done");
         break;
     case 2:
         /* We finished an unlock sequence */
         if (!pfl->bypass && boff != pfl->unlock_addr0) {
-            DPRINTF("%s: command failed " TARGET_FMT_plx " %02x\n", __func__,
-                    boff, cmd);
+            trace_pflash_write_failed(pfl->name, boff, cmd);
             goto reset_flash;
         }
         switch (cmd) {
@@ -538,10 +526,10 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
         case 0x90: /* Autoselect */
         case 0xA0: /* Program */
             pfl->cmd = cmd;
-            DPRINTF("%s: starting command %02x\n", __func__, cmd);
+            trace_pflash_write_start(pfl->name, cmd);
             break;
         default:
-            DPRINTF("%s: unknown command %02x\n", __func__, cmd);
+            trace_pflash_write_unknown(pfl->name, cmd);
             goto reset_flash;
         }
         break;
@@ -559,7 +547,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
                 }
                 goto reset_flash;
             }
-            trace_pflash_data_write(offset, width, value, 0);
+            trace_pflash_data_write(pfl->name, offset, width, value, 0);
             if (!pfl->ro) {
                 p = (uint8_t *)pfl->storage + offset;
                 if (pfl->be) {
@@ -597,8 +585,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             }
             /* fall through */
         default:
-            DPRINTF("%s: invalid write for command %02x\n",
-                    __func__, pfl->cmd);
+            trace_pflash_write_invalid(pfl->name, pfl->cmd);
             goto reset_flash;
         }
     case 4:
@@ -611,8 +598,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             goto check_unlock1;
         default:
             /* Should never happen */
-            DPRINTF("%s: invalid command state %02x (wc 4)\n",
-                    __func__, pfl->cmd);
+            trace_pflash_write_invalid_state(pfl->name, pfl->cmd, 5);
             goto reset_flash;
         }
         break;
@@ -624,12 +610,11 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
         switch (cmd) {
         case 0x10: /* Chip Erase */
             if (boff != pfl->unlock_addr0) {
-                DPRINTF("%s: chip erase: invalid address " TARGET_FMT_plx "\n",
-                        __func__, offset);
+                trace_pflash_chip_erase_invalid(pfl->name, offset);
                 goto reset_flash;
             }
             /* Chip erase */
-            DPRINTF("%s: start chip erase\n", __func__);
+            trace_pflash_chip_erase_start(pfl->name);
             if (!pfl->ro) {
                 memset(pfl->storage, 0xff, pfl->chip_len);
                 pflash_update(pfl, 0, pfl->chip_len);
@@ -643,7 +628,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             pflash_sector_erase(pfl, offset);
             break;
         default:
-            DPRINTF("%s: invalid command %02x (wc 5)\n", __func__, cmd);
+            trace_pflash_write_invalid_command(pfl->name, cmd);
             goto reset_flash;
         }
         pfl->cmd = cmd;
@@ -693,19 +678,18 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             return;
         default:
             /* Should never happen */
-            DPRINTF("%s: invalid command state %02x (wc 6)\n",
-                    __func__, pfl->cmd);
+            trace_pflash_write_invalid_state(pfl->name, pfl->cmd, 6);
             goto reset_flash;
         }
         break;
     /* Special values for CFI queries */
     case WCYCLE_CFI:
     case WCYCLE_AUTOSELECT_CFI:
-        DPRINTF("%s: invalid write in CFI query mode\n", __func__);
+        trace_pflash_write(pfl->name, "invalid write in CFI query mode");
         goto reset_flash;
     default:
         /* Should never happen */
-        DPRINTF("%s: invalid write state (wc 7)\n",  __func__);
+        trace_pflash_write(pfl->name, "invalid write state (wc 7)");
         goto reset_flash;
     }
     pfl->wcycle++;
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 6d0c43f9977..7d98297dab6 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -6,16 +6,37 @@ fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
 
 # pflash_cfi01.c
 # pflash_cfi02.c
-pflash_reset(void) "reset"
-pflash_mode_read_array(void) "mode: read array"
-pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
-pflash_io_read(uint64_t offset, unsigned size, uint32_t value, uint8_t cmd, uint8_t wcycle) "offset:0x%04"PRIx64" size:%u value:0x%04x cmd:0x%02x wcycle:%u"
-pflash_io_write(uint64_t offset, unsigned size, uint32_t value, uint8_t wcycle) "offset:0x%04"PRIx64" size:%u value:0x%04x wcycle:%u"
-pflash_data_read(uint64_t offset, unsigned size, uint32_t value) "data offset:0x%04"PRIx64" size:%u value:0x%04x"
-pflash_data_write(uint64_t offset, unsigned size, uint32_t value, uint64_t counter) "data offset:0x%04"PRIx64" size:%u value:0x%04x counter:0x%016"PRIx64
-pflash_manufacturer_id(uint16_t id) "Read Manufacturer ID: 0x%04x"
-pflash_device_id(uint16_t id) "Read Device ID: 0x%04x"
-pflash_device_info(uint64_t offset) "Read Device Information offset:0x%04"PRIx64
+pflash_chip_erase_invalid(const char *name, uint64_t offset) "%s: chip erase: invalid address 0x%" PRIx64
+pflash_chip_erase_start(const char *name) "%s: start chip erase"
+pflash_data_read(const char *name, uint64_t offset, unsigned size, uint32_t value) "%s: data offset:0x%04"PRIx64" size:%u value:0x%04x"
+pflash_data_write(const char *name, uint64_t offset, unsigned size, uint32_t value, uint64_t counter) "%s: data offset:0x%04"PRIx64" size:%u value:0x%04x counter:0x%016"PRIx64
+pflash_device_id(const char *name, uint16_t id) "%s: read device ID: 0x%04x"
+pflash_device_info(const char *name, uint64_t offset) "%s: read device information offset:0x%04" PRIx64
+pflash_erase_complete(const char *name) "%s: sector erase complete"
+pflash_erase_timeout(const char *name, int count) "%s: erase timeout fired; erasing %d sectors"
+pflash_io_read(const char *name, uint64_t offset, unsigned int size, uint32_t value, uint8_t cmd, uint8_t wcycle) "%s: offset:0x%04" PRIx64 " size:%u value:0x%04x cmd:0x%02x wcycle:%u"
+pflash_io_write(const char *name, uint64_t offset, unsigned int size, uint32_t value, uint8_t wcycle) "%s: offset:0x%04"PRIx64" size:%u value:0x%04x wcycle:%u"
+pflash_manufacturer_id(const char *name, uint16_t id) "%s: read manufacturer ID: 0x%04x"
+pflash_mode_read_array(const char *name) "%s: read array mode"
+pflash_postload_cb(const char *name)  "%s: updating bdrv"
+pflash_read_done(const char *name, uint64_t offset, uint64_t ret) "%s: ID:0x%" PRIx64 " ret:0x%" PRIx64
+pflash_read_status(const char *name, uint32_t ret) "%s: status:0x%x"
+pflash_read_unknown_state(const char *name, uint8_t cmd) "%s: unknown command state:0x%x"
+pflash_reset(const char *name) "%s: reset"
+pflash_sector_erase_start(const char *name, int width1, uint64_t start, int width2, uint64_t end) "%s: start sector erase at: 0x%0*" PRIx64 "-0x%0*" PRIx64
+pflash_timer_expired(const char *name, uint8_t cmd) "%s: command 0x%02x done"
+pflash_unlock0_failed(const char *name, uint64_t offset, uint8_t cmd, uint16_t addr0) "%s: unlock0 failed 0x%" PRIx64 " 0x%02x 0x%04x"
+pflash_unlock1_failed(const char *name, uint64_t offset, uint8_t cmd) "%s: unlock0 failed 0x%" PRIx64 " 0x%02x"
+pflash_unsupported_device_configuration(const char *name, uint8_t width, uint8_t max) "%s: unsupported device configuration: device_width:%d max_device_width:%d"
+pflash_write(const char *name, const char *str) "%s: %s"
+pflash_write_block(const char *name, uint32_t value) "%s: block write: bytes:0x%x"
+pflash_write_block_erase(const char *name, uint64_t offset, uint64_t len) "%s: block erase offset:0x%" PRIx64 " bytes:0x%" PRIx64
+pflash_write_failed(const char *name, uint64_t offset, uint8_t cmd) "%s: command failed 0x%" PRIx64 " 0x%02x"
+pflash_write_invalid(const char *name, uint8_t cmd) "%s: invalid write for command 0x%02x"
+pflash_write_invalid_command(const char *name, uint8_t cmd) "%s: invalid command 0x%02x (wc 5)"
+pflash_write_invalid_state(const char *name, uint8_t cmd, int wc) "%s: invalid command state 0x%02x (wc %d)"
+pflash_write_start(const char *name, uint8_t cmd) "%s: starting command 0x%02x"
+pflash_write_unknown(const char *name, uint8_t cmd) "%s: unknown command 0x%02x"
 
 # virtio-blk.c
 virtio_blk_req_complete(void *vdev, void *req, int status) "vdev %p req %p status %d"
-- 
2.26.2


