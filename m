Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4404C9868
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:35:33 +0100 (CET)
Received: from localhost ([::1]:46676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPB5g-0001DB-GZ
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:35:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPAYB-000295-LS; Tue, 01 Mar 2022 17:00:58 -0500
Received: from [2a00:1450:4864:20::52a] (port=42706
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPAY7-0005Cb-PN; Tue, 01 Mar 2022 17:00:54 -0500
Received: by mail-ed1-x52a.google.com with SMTP id i11so23807470eda.9;
 Tue, 01 Mar 2022 14:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rl+3TnhKi4ZXtD1JrJvIiuKq1Wcy8l+vwUoCOGjVIZY=;
 b=KSqtJkOHPG2okE+xkHo1JL2ZMdSQHggIkMXKRb94aH+sn4nW5ceGdiEL8fLgKiDYdQ
 A00ZBHmi3r4rdumol0eqh3NJNg4Y0lpsGLfhopcYVrFi696y+kEiR2sO9l6o+92cjK8J
 Ff9hh3UmgnBZIel4g5PvFtU9DOR47Hi2/dmMqDpsb5E8hgNWofaxYmQTyjY7TcVbs03Q
 e3ALmGg8G6rck9MEAH2DV8J7QVm2VjYr8ZVLUUNhgpjq5sGSaF8bjiXvGDuPSIsKN1ZW
 RLhfTLSp5REAGuCWoK57Q60MDm3lhO5RgFc+XbcPw+/5FY0CQuWshIgUpm1FXu8Lifs/
 YYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rl+3TnhKi4ZXtD1JrJvIiuKq1Wcy8l+vwUoCOGjVIZY=;
 b=y3g9AmYbkFPfC3eBCZFhymlUS42odukkxQoMCrurHU/TIAfCqIuu9xGiyBPCzLlny8
 wWz+tsOrcQu0mOxhCLdfbTBWu4W9DYCVzyVqO35+TsiR95/gW6AUtKDVnzGRIc4Fu+aK
 K12DkhYGw/M9G/RUwE1e+BwoQmxnGYFsaxTRHKJJmQS1nb0DZlmM7ykjCQgXDjJZLf3V
 HVCCnM+sCColh19rG684nMO6Ep1m87g0kaV9wCzX18J5BUVqszPAZAXM5sA9SFUehAT8
 Ony9M7jDokVvg9txtlr64zt7u5rdtWyYgkz9b7p5UXeXUFPu1Jy+d6Ec44Q/e9KAK1cj
 hLfA==
X-Gm-Message-State: AOAM532OxdF1ShTPpIcPS9AFv+2SIUH1CukR2aBjVDOb8cxh3qW+J/SP
 BzVREVrF2uWtQPbUDEdW6FQYPgYO+ls=
X-Google-Smtp-Source: ABdhPJzzqCbvQhToar/8jluEhHehqXnhejD9g7llYJ95THBqq05gGqKQpccBdFTR3ROqUGt5r5lSUA==
X-Received: by 2002:a05:6402:d0d:b0:412:d49c:74d3 with SMTP id
 eb13-20020a0564020d0d00b00412d49c74d3mr26552118edb.207.1646172049459; 
 Tue, 01 Mar 2022 14:00:49 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-055-004-046.78.55.pool.telefonica.de. [78.55.4.46])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a056402348700b00415b38e920bsm182731edc.95.2022.03.01.14.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:49 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] hw/isa/isa-bus: Remove isabus_dev_print()
Date: Tue,  1 Mar 2022 23:00:34 +0100
Message-Id: <20220301220037.76555-5-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301220037.76555-1-shentey@gmail.com>
References: <20220301220037.76555-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


