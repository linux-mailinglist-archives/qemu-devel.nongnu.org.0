Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23484C0220
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:40:47 +0100 (CET)
Received: from localhost ([::1]:56192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMb1h-0006NU-Ru
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:40:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMaw8-0003K4-ON; Tue, 22 Feb 2022 14:35:03 -0500
Received: from [2a00:1450:4864:20::630] (port=40490
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMaw6-0006q4-66; Tue, 22 Feb 2022 14:35:00 -0500
Received: by mail-ej1-x630.google.com with SMTP id p15so45936317ejc.7;
 Tue, 22 Feb 2022 11:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U03uat2K/JdNuPwOAoEK+Plxb6frNDBLdlFpMsBFliQ=;
 b=hjy780DN8mmFiEC2w+xzvCylGRow5+jhZby8vzclLBizPSpX0NKMucqvbKG7QUSHnq
 TaodmjpaWrnS+1mOH9mW9WkjckC2iufkBOmhXW6nZMcl01GJwpSdhkxG6jlcIUkfRlMb
 0LlIwQlEc6BUWbR8vH7tKDJE9f4vpX9Xd/y8dDYaElUOfDxmHKnrAP3ADfyeWxxGGOa8
 Mymt3K20luX3BLX3kHImb3s45z4X4A6HFv6Mf480qoiOJbO0u9gGAPxHJWlN8CFTLpZM
 M4Z/Kqp3II5OaMozUswQU9hYqhZ1BbVBCSwiYQEZiZKlfrpW+4X7FMZZKDI1Ynvb+xvb
 5D3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U03uat2K/JdNuPwOAoEK+Plxb6frNDBLdlFpMsBFliQ=;
 b=1BR2uI8X7vealoJZxHub+JZgjAUBpTzsb9BFlneml7V36WLCXKwrzYa/JPGX7pDS3p
 EuIkfrEXcYdXlfZy3JicgAHX87rpuyYIuNAea6WnQKpBzMgbWGZKLYLUfTqig+EhbbNV
 kRTShFH13iWI96Ang5NDQN+Slc4ciLqu0mbK5TvuCmuQ/eAkRLeUcT/jCvYLgwAbbPi4
 08GZQnpwBW46lSx0Ip7tO6et/dVnbQLr+dM08CoJPZXv3Iu2CtF0mRlmc5L8BKIzSskC
 pmq3gAafkypnec1KDMarMOO1zv5L9GOpDLhYrn5uCRTVc9qaK/FYQzK+NbY1lq+9ETU6
 Gweg==
X-Gm-Message-State: AOAM531KbBgd+LXG+UypTK9Zb1fidzjBTXK+SGrwkhxxJEobamqLjX4e
 8dgtMYQhGA3tvwYeH5lYoKPS7d9u5Tk=
X-Google-Smtp-Source: ABdhPJyQiqk6xL/IJ2xjc+YkQxClzUuFEAbhEtrfvzm/SwJCK+vpDIs+ST0F1McDwEhEwxA1Qj9oRg==
X-Received: by 2002:a17:907:954f:b0:6ad:3614:73e6 with SMTP id
 ex15-20020a170907954f00b006ad361473e6mr20712148ejc.731.1645558496306; 
 Tue, 22 Feb 2022 11:34:56 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:34:55 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/22] hw/isa/isa-bus: Remove isabus_dev_print()
Date: Tue, 22 Feb 2022 20:34:28 +0100
Message-Id: <20220222193446.156717-5-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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


