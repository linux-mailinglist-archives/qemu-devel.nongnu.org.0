Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDBC4C0053
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:48:19 +0100 (CET)
Received: from localhost ([::1]:40656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZGs-0001pb-LK
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:48:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMZ7U-0003T8-Q2; Tue, 22 Feb 2022 12:38:36 -0500
Received: from [2a00:1450:4864:20::536] (port=34606
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMZ7R-0002lk-P5; Tue, 22 Feb 2022 12:38:36 -0500
Received: by mail-ed1-x536.google.com with SMTP id z22so38706051edd.1;
 Tue, 22 Feb 2022 09:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U03uat2K/JdNuPwOAoEK+Plxb6frNDBLdlFpMsBFliQ=;
 b=phD3godSI6Ly/nbEfkFlc5QjFEkT+oaxL51g59JLbO//EvVUSIHmYfEk3nQv+BvaY/
 UeBZp41Dp2CrIu6gHFxXMG5C2gciaQnWTPl1aTe4JVt6/ekf6sTBB7HDLOTRFev/wAjt
 7fnYlkdiexTT/sQlY/uzKoMCs8Ma6IlNmQ4fmCKanbeV065Is//M0eyXWcNvRSQFp4pO
 X3kzAFAuGUae1vYo2MclF5pqmlm2zyJQEglr6Orja79J+UATtAHZSpcjUoD0QqWriemt
 9MKS6y6l8ZfHLq+53csQWsrNrIFY4rSgscI8FJXP0/HnLnrYTX9DxB+XRpnwVAjFMPkw
 YpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U03uat2K/JdNuPwOAoEK+Plxb6frNDBLdlFpMsBFliQ=;
 b=55gT40w60fGlZp98JPAWIER99is2gCPZp0BEb+u89KCG4acNGC8V96QBBKIhq35NiI
 AMVPfbxEWkLWw4SPhAdA2MjcraQ9CsQplPmndD/LUJkNFUCbg2RUW0Ftu0MgesC+OyIj
 Em3AXF/OoaeQi7NhkUL0NN9HMGVFSEcAD10IT9qBZPQrFgObNt0NGyjw2UBcPdeQ2Z10
 1g2ACDhdGG4CRR/NdwmW3AQuRzNcBnFZy7WjKhGOlp4ihF+mh05PhB6zFyXONf4WSZgK
 2qe0OFECkmgGXigL10wDkC9ip7l/ErghKYPFsFOh0QESkVWMAzmZRNCU8kYuSHgR/uWf
 qpQA==
X-Gm-Message-State: AOAM531AKYU9/z8ys8QLM5eFklKl4DFmwuZ7+J73+sDzidGNLbu2s8zB
 B69OQCMuWgkBVpBFOgCGsdpZqywjvBs=
X-Google-Smtp-Source: ABdhPJxQPBT5KbUEUUcf6WYbE4HBJZw8vzUfKXjorYIYN+AmjR03jEhKjMtFZTNqzba+3JPbfbdtJg==
X-Received: by 2002:a50:fb91:0:b0:408:5100:b4a7 with SMTP id
 e17-20020a50fb91000000b004085100b4a7mr27061125edq.311.1645551511940; 
 Tue, 22 Feb 2022 09:38:31 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:31 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/22] hw/isa/isa-bus: Remove isabus_dev_print()
Date: Tue, 22 Feb 2022 18:38:01 +0100
Message-Id: <20220222173819.76568-5-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All isabus_dev_print() did was to print up to two IRQ numbers per
device. This is redundant if the IRQ numbers are present as QOM
properties (see e.g. the modified tests/qemu-iotests/172.out).

Now that the last devices relying on isabus_dev_print() had their IRQ
numbers QOM'ified, the contribution of this function ultimately became
redundant. Remove it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/isa-bus.c           | 16 ----------------
 tests/qemu-iotests/172.out | 26 --------------------------
 2 files changed, 42 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 6c31398dda..af5add6a26 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -21,21 +21,18 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
-#include "monitor/monitor.h"
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "hw/isa/isa.h"
 
 static ISABus *isabus;
 
-static void isabus_dev_print(Monitor *mon, DeviceState *dev, int indent);
 static char *isabus_get_fw_dev_path(DeviceState *dev);
 
 static void isa_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *k = BUS_CLASS(klass);
 
-    k->print_dev = isabus_dev_print;
     k->get_fw_dev_path = isabus_get_fw_dev_path;
 }
 
@@ -222,19 +219,6 @@ void isa_build_aml(ISABus *bus, Aml *scope)
     }
 }
 
-static void isabus_dev_print(Monitor *mon, DeviceState *dev, int indent)
-{
-    ISADevice *d = ISA_DEVICE(dev);
-
-    if (d->isairq[1] != -1) {
-        monitor_printf(mon, "%*sisa irqs %d,%d\n", indent, "",
-                       d->isairq[0], d->isairq[1]);
-    } else if (d->isairq[0] != -1) {
-        monitor_printf(mon, "%*sisa irq %d\n", indent, "",
-                       d->isairq[0]);
-    }
-}
-
 static void isabus_bridge_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
index 4cf4d536b4..9479b92185 100644
--- a/tests/qemu-iotests/172.out
+++ b/tests/qemu-iotests/172.out
@@ -15,7 +15,6 @@ Testing:
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -43,7 +42,6 @@ Testing: -fda TEST_DIR/t.qcow2
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -81,7 +79,6 @@ Testing: -fdb TEST_DIR/t.qcow2
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -135,7 +132,6 @@ Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -190,7 +186,6 @@ Testing: -fdb
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -230,7 +225,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -268,7 +262,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -322,7 +315,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -380,7 +372,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -418,7 +409,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,unit=1
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -456,7 +446,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -520,7 +509,6 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -575,7 +563,6 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -630,7 +617,6 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -685,7 +671,6 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -749,7 +734,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -804,7 +788,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -865,7 +848,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global floppy.drive=none0 -device
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -933,7 +915,6 @@ Testing: -device floppy
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -958,7 +939,6 @@ Testing: -device floppy,drive-type=120
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -983,7 +963,6 @@ Testing: -device floppy,drive-type=144
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -1008,7 +987,6 @@ Testing: -device floppy,drive-type=288
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -1036,7 +1014,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -1074,7 +1051,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -1115,7 +1091,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,logical
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
@@ -1153,7 +1128,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physica
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-            isa irq 6
             bus: floppy-bus.0
               type floppy-bus
               dev: floppy, id ""
-- 
2.35.1


