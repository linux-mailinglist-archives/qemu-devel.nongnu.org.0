Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3252733CA1A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:43:55 +0100 (CET)
Received: from localhost ([::1]:40920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwsG-0001dn-CI
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwkp-0001sG-5r
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:36:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwkl-0006Aq-UL
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615851363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uT6abm4H76jpqtqGLNR7vVs+MKSt/qeaUN0Pbivwtic=;
 b=F6K4yKrB+K8yEkj/7eOoLKfEkI+N1Kk6HVMfR/Ge4UOHzciw7YJmZa/WsgDtFVmWmGtk/W
 3+UxPCoprNRiivwlHhuG0qV/Sr02f/6WZp6eNRGQt1Gu36X6B69PgTHe6QFu1wMov64ihG
 gEW1862ekUiEeZZx6qwZVtA/8+ECv4Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-PgMzuHLaMEu3hYXaa5-OLw-1; Mon, 15 Mar 2021 19:35:59 -0400
X-MC-Unique: PgMzuHLaMEu3hYXaa5-OLw-1
Received: by mail-wr1-f69.google.com with SMTP id f3so15750988wrt.14
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uT6abm4H76jpqtqGLNR7vVs+MKSt/qeaUN0Pbivwtic=;
 b=i+jXz2+N8Md3Z8YSNz3OFauVkseNLz0AjMvZJ4cayN4FyaI73SgoDXEnlXCQQNZG5R
 4tclXMrR4gZ2hLa70n5yenXEoemEb1N9zst6oXcjRqQzc7k0qoHkz4Gyetsbn9XYzpt/
 U7XSr8zRmSEUcbQ6VvVWQPgA0sUSrfTwSftfop505rMRkcrRRE3VqAeghrfIdtECFEMZ
 4xYXdRHyRD4FxaF04GFinOrYyIlI5CjcXzJhOHOqzMPfv6Lt4q+1AIxI3fEA66T1sM5g
 Irpdt7hL83+JbeD5wXqkMfygz/NRrRhHhNN+PLRYOkvMT4kOTRt1YxM/q21B3w0z8X1h
 uF9w==
X-Gm-Message-State: AOAM533YpHYxHIuFQeN6duZSYKC8XVhrCZhHCKNpjhDnAFGOi7kiTYUH
 lPXF1ECEbEHBpeYqBe4rKzgGZ3oHpo2UDZ1reVz2ksQArCVoE6vuxSgip3ciwSlFd+arsop4/ZT
 /Y3tl47jjcvUzBRRWl4h/tirmhGSIDBr+fBPdYvK2pD7u1g+rqSsKI9w0U/ssmUwM
X-Received: by 2002:a1c:6a12:: with SMTP id f18mr1878139wmc.31.1615851358221; 
 Mon, 15 Mar 2021 16:35:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwslWSj8UyNxbmLb306d/jPx9ZfnQC0j8kHVZr0vPWUTGhSW3fiUXEZmfXNxNiAgkxLqn2KCg==
X-Received: by 2002:a1c:6a12:: with SMTP id f18mr1878115wmc.31.1615851358019; 
 Mon, 15 Mar 2021 16:35:58 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z1sm19820837wru.95.2021.03.15.16.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 16:35:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/11] hw/block/pflash_cfi02: Rename register_memory(true) as
 mode_read_array
Date: Tue, 16 Mar 2021 00:35:22 +0100
Message-Id: <20210315233527.2988483-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210315233527.2988483-1-philmd@redhat.com>
References: <20210315233527.2988483-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The same pattern is used when setting the flash in READ_ARRAY mode:
- Set the state machine command to READ_ARRAY
- Reset the write_cycle counter
- Reset the memory region in ROMD

Refactor the current code by extracting this pattern.
It is used three times:

- When the timer expires and not in bypass mode

- On a read access (on invalid command).

- When the device is initialized. Here the ROMD mode is hidden
  by the memory_region_init_rom_device() call.

pflash_register_memory(rom_mode=true) already sets the ROM device
in "read array" mode (from I/O device to ROM one). Explicit that
by renaming the function as pflash_mode_read_array(), adding
a trace event and resetting wcycle.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210310170528.1184868-7-philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 18 +++++++++---------
 hw/block/trace-events   |  1 +
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 897b7333222..2ba77a0171b 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -184,10 +184,13 @@ static void pflash_setup_mappings(PFlashCFI02 *pfl)
     pfl->rom_mode = true;
 }
 
-static void pflash_register_memory(PFlashCFI02 *pfl, int rom_mode)
+static void pflash_mode_read_array(PFlashCFI02 *pfl)
 {
-    memory_region_rom_device_set_romd(&pfl->orig_mem, rom_mode);
-    pfl->rom_mode = !!rom_mode;
+    trace_pflash_mode_read_array();
+    pfl->cmd = 0x00;
+    pfl->wcycle = 0;
+    pfl->rom_mode = true;
+    memory_region_rom_device_set_romd(&pfl->orig_mem, true);
 }
 
 static size_t pflash_regions_count(PFlashCFI02 *pfl)
@@ -249,11 +252,10 @@ static void pflash_timer(void *opaque)
     toggle_dq7(pfl);
     if (pfl->bypass) {
         pfl->wcycle = 2;
+        pfl->cmd = 0;
     } else {
-        pflash_register_memory(pfl, 1);
-        pfl->wcycle = 0;
+        pflash_mode_read_array(pfl);
     }
-    pfl->cmd = 0;
 }
 
 /*
@@ -315,7 +317,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
     /* Lazy reset to ROMD mode after a certain amount of read accesses */
     if (!pfl->rom_mode && pfl->wcycle == 0 &&
         ++pfl->read_counter > PFLASH_LAZY_ROMD_THRESHOLD) {
-        pflash_register_memory(pfl, 1);
+        pflash_mode_read_array(pfl);
     }
     offset &= pfl->chip_len - 1;
     boff = offset & 0xFF;
@@ -933,8 +935,6 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
 
     timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
-    pfl->wcycle = 0;
-    pfl->cmd = 0;
     pfl->status = 0;
 
     pflash_cfi02_fill_cfi_table(pfl, nb_regions);
diff --git a/hw/block/trace-events b/hw/block/trace-events
index ef06d2ea747..6d0c43f9977 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -7,6 +7,7 @@ fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
 # pflash_cfi01.c
 # pflash_cfi02.c
 pflash_reset(void) "reset"
+pflash_mode_read_array(void) "mode: read array"
 pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
 pflash_io_read(uint64_t offset, unsigned size, uint32_t value, uint8_t cmd, uint8_t wcycle) "offset:0x%04"PRIx64" size:%u value:0x%04x cmd:0x%02x wcycle:%u"
 pflash_io_write(uint64_t offset, unsigned size, uint32_t value, uint8_t wcycle) "offset:0x%04"PRIx64" size:%u value:0x%04x wcycle:%u"
-- 
2.26.2


