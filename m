Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0161E446D83
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 11:59:06 +0100 (CET)
Received: from localhost ([::1]:38758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjJPd-0002ct-Ls
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 06:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjJN7-00082e-0y; Sat, 06 Nov 2021 06:56:29 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjJN5-0002Ud-IQ; Sat, 06 Nov 2021 06:56:28 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u1so17726064wru.13;
 Sat, 06 Nov 2021 03:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r7ChOI/rOL8VqbBn1urCKzj6+wcEmE0CC31/KsKTfic=;
 b=KrJKd/nfhzje79M+VknKNugIqOESWo30prGj30ickuHeuy4psfCpUKsRfqzP99ka8Z
 AJVcLVLAUja6gvTJLN/WjujTlnY0q8OVMK+QkdkM+e4D7DYTiUt+BQqpxij6OSn0B114
 OYZRaQ/DNQyW0krBH7cGoA90ZkQQPWjldwXvgzB9EYaby9vGXOIpWwY2YEhO3gxwn8PQ
 h/3g8prVCzCE9yPVM/4TmzjvMB8v86vcSYbNAaNYHGzHieXK6icP5n2EcZ16q//08maq
 n6OdyrFOHHNt6Ex1eabWptrrY4xHHucOeShFWYM3hjUlED6bWDFerjxX7lzRwVU04Tw0
 a6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=r7ChOI/rOL8VqbBn1urCKzj6+wcEmE0CC31/KsKTfic=;
 b=d0w7ghwWRmeu3oVgVlKQxXLBERQSulvHbxpjxvehgiuG/rVaUbVORx/CzgZmiNJnXi
 tGPPtbaywzTPMNpYpfq9KnghuN0jwb3/mtkMvbKQZN7XINTyg1bCsS1igvK6LkNc2ATc
 pu79vIsdFKq52Y/4QgnEMNKXdJlUSbuwk9mDrdg88wMGmMIDmwyer1GJjin132KLCWGs
 HvqP9O5xV0opaP9oqVopX55SThTwrdxq+q1otDbNGWSdmc5ZpnbtPpQ8dW0KjQV1ZbGT
 NoKfA2fWF8amsgaL6NSQsm/7ZbnOsZRWcm0KhxyRn1KIbfNraITSqBm4H7d6IxsTQb45
 nlBw==
X-Gm-Message-State: AOAM531d32wFIEp/GOBO2TvEuK/iOVt4aMp9acG1cEH5UdoR0DaqmV2u
 7MhXmUoU6jlG13LEfMD+n56ZBKGP/XY=
X-Google-Smtp-Source: ABdhPJxnbmoHniqKhPN8y8/y+ICCTR4X/b8Z2CauEWYugbdiiHA9JhqvOf6vhS7lO32Tu9gGtS+Djg==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr71414562wrr.143.1636196184977; 
 Sat, 06 Nov 2021 03:56:24 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g18sm10387824wrv.42.2021.11.06.03.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 03:56:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/timer/etraxfs_timer: Add vmstate for ETRAX timers
Date: Sat,  6 Nov 2021 11:56:23 +0100
Message-Id: <20211106105623.510868-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the vmstate for the ETRAX timers.
This is in theory a migration compatibility break
for the 'AXIS devboard 88' CRIS machine.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/etraxfs_timer.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index 4ba662190de..139e5b86a44 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -26,6 +26,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
+#include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "hw/irq.h"
@@ -64,7 +65,7 @@ struct ETRAXTimerState {
     ptimer_state *ptimer_t1;
     ptimer_state *ptimer_wd;
 
-    int wd_hits;
+    uint32_t wd_hits;
 
     /* Control registers.  */
     uint32_t rw_tmr0_div;
@@ -83,6 +84,36 @@ struct ETRAXTimerState {
     uint32_t r_masked_intr;
 };
 
+static const VMStateDescription vmstate_etraxfs = {
+    .name = "etraxfs",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_PTIMER(ptimer_t0, ETRAXTimerState),
+        VMSTATE_PTIMER(ptimer_t1, ETRAXTimerState),
+        VMSTATE_PTIMER(ptimer_wd, ETRAXTimerState),
+
+        VMSTATE_UINT32(wd_hits, ETRAXTimerState),
+
+        VMSTATE_UINT32(rw_tmr0_div, ETRAXTimerState),
+        VMSTATE_UINT32(r_tmr0_data, ETRAXTimerState),
+        VMSTATE_UINT32(rw_tmr0_ctrl, ETRAXTimerState),
+
+        VMSTATE_UINT32(rw_tmr1_div, ETRAXTimerState),
+        VMSTATE_UINT32(r_tmr1_data, ETRAXTimerState),
+        VMSTATE_UINT32(rw_tmr1_ctrl, ETRAXTimerState),
+
+        VMSTATE_UINT32(rw_wd_ctrl, ETRAXTimerState),
+
+        VMSTATE_UINT32(rw_intr_mask, ETRAXTimerState),
+        VMSTATE_UINT32(rw_ack_intr, ETRAXTimerState),
+        VMSTATE_UINT32(r_intr, ETRAXTimerState),
+        VMSTATE_UINT32(r_masked_intr, ETRAXTimerState),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static uint64_t
 timer_read(void *opaque, hwaddr addr, unsigned int size)
 {
@@ -357,6 +388,7 @@ static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
     ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     dc->realize = etraxfs_timer_realize;
+    dc->vmsd = &vmstate_etraxfs;
     rc->phases.enter = etraxfs_timer_reset_enter;
     rc->phases.hold = etraxfs_timer_reset_hold;
 }
-- 
2.31.1


