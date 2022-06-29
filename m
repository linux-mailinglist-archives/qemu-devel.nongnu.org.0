Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535C855F44E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 05:48:51 +0200 (CEST)
Received: from localhost ([::1]:57748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Oh8-0007ri-EW
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 23:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVO-0007Vy-PC; Tue, 28 Jun 2022 23:36:42 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVM-0006j9-UH; Tue, 28 Jun 2022 23:36:42 -0400
Received: by mail-pg1-x534.google.com with SMTP id d129so14050547pgc.9;
 Tue, 28 Jun 2022 20:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m6HnsM1GE9zfNQZdSDDG8Va3eAhnVI4VwKPZDbWjHfo=;
 b=okSNJfgi77udcW2noC+G7jxdCoE7hPF7faV+1AP6u2bcWxr5jSEc0G+UoAMT/2BnlR
 fLTeph3QPc5BTq/7fVnPw6Ua04ZSGR8dzgv1I+PIoJMTkS3D9O7/2WaYUhisxa5x9D82
 1NVT264+UZf60BAlHxq7jwL+NfIR4c9NMLiAFUWOWhWTZ7BOhX53Bvnl2sWO6VrrbPtq
 mapnQTqIDBUEshqqY9Vv+CcI2YL8x0o3/c8UPNHOdlKbgo/LofXFHEsqqKh9o8zUgFem
 RIapzxGgZ2BwPeTtYT9Kbg3kHe5fh6L6CZkujI9Sxf3clJB+hkvkL23TITqaisHjuYRF
 ArGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6HnsM1GE9zfNQZdSDDG8Va3eAhnVI4VwKPZDbWjHfo=;
 b=CcccgOZQzctZxK2bhkiKld0mLinlzmS9m8rMGh8ZZMrr3gaCoqqP3BHe1+HbscuTEf
 YxFKumvhH9fVoOstxP+J5oom5Uhx74q9AIP6DNFtXmmwQ16xNthBIun350O3NyeMU1JZ
 Pjz29hWxxCklrxESt2nE2OsPTBlFI96gPpvwmqYQviqerXhCU5sTS/83HqlZxYvzWQ8R
 IMJA6I0GLsmLhaYshSYUbJQvPEUejVLY+QqHjA8cdmcdAl23Y+K8ckSq261XthQXwye8
 PmK6UzYD0KB85Z2mOh2pSoFZORW7z+sfsX89id2u4jq7jhEC1DLaEIrsMFuYl+sWJURv
 u9Zw==
X-Gm-Message-State: AJIora/enymyMe2L4rAViZ757XciWj3NIKAXa1aK7oLl4sbQTFIlA+CA
 Js95q3gbrgc6/kuW2RZjiFg=
X-Google-Smtp-Source: AGRyM1tTcpvUxtAZS5BxVZaJo8CR4issRXFAV81Sro1m53bFJE6lJ2JrB9XYHQ1ttq9NQNLPkP1nSQ==
X-Received: by 2002:a63:140e:0:b0:408:a923:1a81 with SMTP id
 u14-20020a63140e000000b00408a9231a81mr1187974pgl.358.1656473799279; 
 Tue, 28 Jun 2022 20:36:39 -0700 (PDT)
Received: from localhost (fwdproxy-prn-016.fbsv.net.
 [2a03:2880:ff:10::face:b00c]) by smtp.gmail.com with ESMTPSA id
 jh2-20020a170903328200b00161478027f5sm10078575plb.150.2022.06.28.20.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:36:38 -0700 (PDT)
From: Peter Delevoryas <peterdelevoryas@gmail.com>
X-Google-Original-From: Peter Delevoryas <pdel@fb.com>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v2 04/13] hw/i2c: support multiple masters
Date: Tue, 28 Jun 2022 20:36:25 -0700
Message-Id: <20220629033634.3850922-5-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629033634.3850922-1-pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peterdelevoryas@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Allow slaves to master the bus by registering a bottom halve. If the bus
is busy, the bottom half is queued up. When a slave has succesfully
mastered the bus, the bottom half is scheduled.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
[ clg : - fixed typos in commit log ]
Message-Id: <20220601210831.67259-4-its@irrelevant.dk>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/i2c/core.c        | 34 +++++++++++++++++++++++++++++++++-
 include/hw/i2c/i2c.h | 14 ++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index d0cb2d32fa..145dce6078 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -13,6 +13,7 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/main-loop.h"
 #include "trace.h"
 
 #define I2C_BROADCAST 0x00
@@ -62,6 +63,7 @@ I2CBus *i2c_init_bus(DeviceState *parent, const char *name)
 
     bus = I2C_BUS(qbus_new(TYPE_I2C_BUS, parent, name));
     QLIST_INIT(&bus->current_devs);
+    QSIMPLEQ_INIT(&bus->pending_masters);
     vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_i2c_bus, bus);
     return bus;
 }
@@ -74,7 +76,7 @@ void i2c_slave_set_address(I2CSlave *dev, uint8_t address)
 /* Return nonzero if bus is busy.  */
 int i2c_bus_busy(I2CBus *bus)
 {
-    return !QLIST_EMPTY(&bus->current_devs);
+    return !QLIST_EMPTY(&bus->current_devs) || bus->bh;
 }
 
 bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
@@ -180,6 +182,26 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
                                                : I2C_START_SEND);
 }
 
+void i2c_bus_master(I2CBus *bus, QEMUBH *bh)
+{
+    if (i2c_bus_busy(bus)) {
+        I2CPendingMaster *node = g_new(struct I2CPendingMaster, 1);
+        node->bh = bh;
+
+        QSIMPLEQ_INSERT_TAIL(&bus->pending_masters, node, entry);
+
+        return;
+    }
+
+    bus->bh = bh;
+    qemu_bh_schedule(bus->bh);
+}
+
+void i2c_bus_release(I2CBus *bus)
+{
+    bus->bh = NULL;
+}
+
 int i2c_start_recv(I2CBus *bus, uint8_t address)
 {
     return i2c_do_start_transfer(bus, address, I2C_START_RECV);
@@ -206,6 +228,16 @@ void i2c_end_transfer(I2CBus *bus)
         g_free(node);
     }
     bus->broadcast = false;
+
+    if (!QSIMPLEQ_EMPTY(&bus->pending_masters)) {
+        I2CPendingMaster *node = QSIMPLEQ_FIRST(&bus->pending_masters);
+        bus->bh = node->bh;
+
+        QSIMPLEQ_REMOVE_HEAD(&bus->pending_masters, entry);
+        g_free(node);
+
+        qemu_bh_schedule(bus->bh);
+    }
 }
 
 int i2c_send(I2CBus *bus, uint8_t data)
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 5ca3b708c0..be8bb8b78a 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -69,13 +69,25 @@ struct I2CNode {
     QLIST_ENTRY(I2CNode) next;
 };
 
+typedef struct I2CPendingMaster I2CPendingMaster;
+
+struct I2CPendingMaster {
+    QEMUBH *bh;
+    QSIMPLEQ_ENTRY(I2CPendingMaster) entry;
+};
+
 typedef QLIST_HEAD(I2CNodeList, I2CNode) I2CNodeList;
+typedef QSIMPLEQ_HEAD(I2CPendingMasters, I2CPendingMaster) I2CPendingMasters;
 
 struct I2CBus {
     BusState qbus;
     I2CNodeList current_devs;
+    I2CPendingMasters pending_masters;
     uint8_t saved_address;
     bool broadcast;
+
+    /* Set from slave currently mastering the bus. */
+    QEMUBH *bh;
 };
 
 I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
@@ -117,6 +129,8 @@ int i2c_start_send(I2CBus *bus, uint8_t address);
 
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
+void i2c_bus_master(I2CBus *bus, QEMUBH *bh);
+void i2c_bus_release(I2CBus *bus);
 int i2c_send(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
 bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
-- 
2.30.2


