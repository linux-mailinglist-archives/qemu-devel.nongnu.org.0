Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32774334548
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:41:46 +0100 (CET)
Received: from localhost ([::1]:53098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2q9-00059O-6z
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2I2-000681-OW
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2I0-0000Nb-Ps
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615395988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SwCwLAHcVK0o6cfVxU4Q/2p+2PaiP/5BkYG34ZdYu6g=;
 b=G2xZMz2FM6vj+HJSk+t0HgTC/u68was3hpqcBAqC18X49R6CyjEtoOHaplZXwZvHQUOE6w
 IMW3GBVVRPd4PSsjxlJ2ya0dSrvAvHeQvn0Dq60DXGKVx9z4rJ+PeHxxr+tH9f0a+6IE3O
 OjoEDw+I7u4id1XEK56nS58Q1GqqVKs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-uOtr0SybMB2cvNhHWP2IZQ-1; Wed, 10 Mar 2021 12:06:25 -0500
X-MC-Unique: uOtr0SybMB2cvNhHWP2IZQ-1
Received: by mail-ed1-f71.google.com with SMTP id o15so8715846edv.7
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:06:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwCwLAHcVK0o6cfVxU4Q/2p+2PaiP/5BkYG34ZdYu6g=;
 b=p6tln4ijdWuUiu7OEoe8NtRtM8Jr6255DcxkhXMgij27E2e3xn0qXjLbFZ3c+IXQIX
 2x70kcgRU1ydxOzj7mDulxKQ5nRgnsRDS/0LIo2BcqzH5WSktZ5sU3YwPLcYq+KGqXgk
 M8wdlc1kzNb7PUhDA+QlX46RJ0kCvoPt/Y63yIGk91kdPmzp0/sChf8GAZkVpSY36b3W
 RMTrxtdYHJLjrAFgmNv73+Qtw0dHiJYGdlap31nmXz1hauLL/Y6KuNCFQIxX/xl08aFz
 YOoJbjB7cLzR4O/ycAb1sH+KOM5W5+mvqH3vmMO9TW/0yuhMRw9Y8bS43Ai0BzPOR0u8
 mbVg==
X-Gm-Message-State: AOAM5335LCDqLKCtH+RXinBJTAZS4o/d/wsPPMHBjbfIysmSP2C4vaPR
 X147y33y51MHiaMuosU0nOUVXpIuaB4ChpaJfJmRwG8YT3EmJIjwo3A2L+98kIv3ZMmFEfxhpn4
 aypCufS4ui6hqvLUF0nNWbWrGri/hMc4JMjsNIW7z7MK/loR5RSJtmWq7Uvy1ztdG
X-Received: by 2002:aa7:d1cd:: with SMTP id g13mr4373891edp.369.1615395984268; 
 Wed, 10 Mar 2021 09:06:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0VXK4siYttQLe5v1Q3B1ZvZUQi8D8bWKCpn5lNH+/u5cDGco8KuCHsiZI0obzZP1JGM0vOg==
X-Received: by 2002:aa7:d1cd:: with SMTP id g13mr4373866edp.369.1615395984028; 
 Wed, 10 Mar 2021 09:06:24 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u15sm11548082eds.6.2021.03.10.09.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 09:06:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/12] hw/block/pflash_cfi01: Extract
 pflash_mode_read_array()
Date: Wed, 10 Mar 2021 18:05:26 +0100
Message-Id: <20210310170528.1184868-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310170528.1184868-1-philmd@redhat.com>
References: <20210310170528.1184868-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The same pattern is used when setting the flash in READ_ARRAY mode:
- Set the state machine command to READ_ARRAY
- Reset the write_cycle counter
- Reset the memory region in ROMD

Refactor the current code by extracting this pattern.
It is used three times:

- On a read access (on invalid command).

- On a write access (on command failure, error, or explicitly asked)

- When the device is initialized. Here the ROMD mode is hidden
  by the memory_region_init_rom_device() call.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 2618e00926d..32c9b289715 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -115,6 +115,19 @@ static const VMStateDescription vmstate_pflash = {
     }
 };
 
+static void pflash_mode_read_array(PFlashCFI01 *pfl)
+{
+    trace_pflash_mode_read_array();
+    /*
+     * The command 0x00 is not assigned by the CFI open standard,
+     * but QEMU historically uses it for the READ_ARRAY command (0xff).
+     */
+    trace_pflash_mode_read_array();
+    pfl->cmd = 0x00;
+    pfl->wcycle = 0;
+    memory_region_rom_device_set_romd(&pfl->mem, true);
+}
+
 /*
  * Perform a CFI query based on the bank width of the flash.
  * If this code is called we know we have a device_width set for
@@ -283,12 +296,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
     default:
         /* This should never happen : reset state & treat it as a read */
         DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
-        pfl->wcycle = 0;
-        /*
-         * The command 0x00 is not assigned by the CFI open standard,
-         * but QEMU historically uses it for the READ_ARRAY command (0xff).
-         */
-        pfl->cmd = 0x00;
+        pflash_mode_read_array(pfl);
         /* fall through to read code */
     case 0x00: /* This model reset value for READ_ARRAY (not CFI compliant) */
         /* Flash area read */
@@ -663,10 +671,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                   "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
 
  mode_read_array:
-    trace_pflash_mode_read_array();
-    memory_region_rom_device_set_romd(&pfl->mem, true);
-    pfl->wcycle = 0;
-    pfl->cmd = 0x00; /* This model reset value for READ_ARRAY (not CFI) */
+    pflash_mode_read_array(pfl);
 }
 
 
@@ -872,13 +877,8 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
         pfl->max_device_width = pfl->device_width;
     }
 
-    pfl->wcycle = 0;
-    /*
-     * The command 0x00 is not assigned by the CFI open standard,
-     * but QEMU historically uses it for the READ_ARRAY command (0xff).
-     */
-    pfl->cmd = 0x00;
     pfl->status = 0x80; /* WSM ready */
+    pflash_mode_read_array(pfl);
     pflash_cfi01_fill_cfi_table(pfl);
 }
 
@@ -887,13 +887,7 @@ static void pflash_cfi01_system_reset(DeviceState *dev)
     PFlashCFI01 *pfl = PFLASH_CFI01(dev);
 
     trace_pflash_reset();
-    /*
-     * The command 0x00 is not assigned by the CFI open standard,
-     * but QEMU historically uses it for the READ_ARRAY command (0xff).
-     */
-    pfl->cmd = 0x00;
-    pfl->wcycle = 0;
-    memory_region_rom_device_set_romd(&pfl->mem, true);
+    pflash_mode_read_array(pfl);
     /*
      * The WSM ready timer occurs at most 150ns after system reset.
      * This model deliberately ignores this delay.
-- 
2.26.2


