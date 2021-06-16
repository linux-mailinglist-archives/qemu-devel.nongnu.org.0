Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614993AA13A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:26:48 +0200 (CEST)
Received: from localhost ([::1]:55746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYNL-0008FU-Dx
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYCC-0003g3-Rc; Wed, 16 Jun 2021 12:15:16 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYCB-0006DX-7G; Wed, 16 Jun 2021 12:15:16 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 t11-20020a1cc30b0000b02901cec841b6a0so2829665wmf.0; 
 Wed, 16 Jun 2021 09:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AM+Hzqy4d+379ZoGynzXBYcBHD9uH/8EFIiUHi8zc60=;
 b=KLsSqA5TYFhNn1OAyn3TfGM3IvIrzt4Kyw9Xtw2JW9XN356ijIjBsMQr8W3bXeCCnM
 rqT4L/TiZ0WhrfO+0soiSdXKn1VOGRv+gAHbUO/zmksrmr2YZHCXSEudxM59HBj+DwuV
 E1KethLImf/tDFRmtcPmnLzTVdFPAQa+0HwkWdWbhBDr7OaIjTjABSRZDSDaJZdas/1S
 slxzrMXYN3i5MQdmZ5/g/9E47H/c2RBwg70Q9jgQEz+Ymn8Igeig5ClPNfFA1rRHqfdy
 isWUmBE2QHdaI2uyWhLAJQP1s2eO8QL1AWjz6PQK9CyZMBSQ/4ABuIzZBtley/xisSeR
 7tBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AM+Hzqy4d+379ZoGynzXBYcBHD9uH/8EFIiUHi8zc60=;
 b=ZQ0hoAxnxkZuL6mofiNEZUhy3kgrHtPAIgP8pOt9/P9u4keiVXBoWGbTZ63A4ij/ZC
 zN4oZNfQi01P5sF37m11sf08TzFLihHixVzyzC16qJzS3r85VxPmbXP6LFg5uRSbj6Lh
 rVqorY6H82dk0nEv7qLq5S8ThHc55+yOBV1WI3/aqM3cEDt8VuhqEjxbM5d9nEOEPjrP
 Moc5Au8B1kB51r0J44TpxuUO1Bv0swiMLPK/gkWuUaJ/9coB8FtuWB/YO8HoPRMlHSQV
 7fhU3Wwyuxp2qEon9YQnEWAam4IL8r2IQnSfgNBMzSW+URS+oM5Z8vkkMSV5CNIp8FzB
 9EXA==
X-Gm-Message-State: AOAM532iDgbTeOywvNjpqSMXYZIsrNissUFa0ChrmxR1hmi8ReF8giJ8
 d1k8a+MW6jDBPqPiCn2kQaicfYKhBwFLNA==
X-Google-Smtp-Source: ABdhPJwjEQ+qe6jbfe+LCNp4q2EH165wlV13UCnN+0Dr8x5A/VfzjOF53dQeSAEy77VcIuXJNtpSXA==
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr12429211wml.7.1623860113141; 
 Wed, 16 Jun 2021 09:15:13 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u15sm4472338wmq.1.2021.06.16.09.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:15:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/13] hw/i2c: Remove confusing i2c_send_recv()
Date: Wed, 16 Jun 2021 18:14:16 +0200
Message-Id: <20210616161418.2514095-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616161418.2514095-1-f4bug@amsat.org>
References: <20210616161418.2514095-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We replaced all the i2c_send_recv() calls by the clearer i2c_recv()
and i2c_send(), so we can remove this confuse API.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h |  1 -
 hw/i2c/core.c        | 50 +++++++++++++++++++-------------------------
 2 files changed, 21 insertions(+), 30 deletions(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 850815e707c..99635b837a5 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -84,7 +84,6 @@ int i2c_bus_busy(I2CBus *bus);
 int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv);
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
-int i2c_send_recv(I2CBus *bus, uint8_t *data, bool send);
 int i2c_send(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
 bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 3a7bae311df..27a66df7f34 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -188,50 +188,42 @@ void i2c_end_transfer(I2CBus *bus)
     bus->broadcast = false;
 }
 
-int i2c_send_recv(I2CBus *bus, uint8_t *data, bool send)
+int i2c_send(I2CBus *bus, uint8_t data)
 {
     I2CSlaveClass *sc;
     I2CSlave *s;
     I2CNode *node;
     int ret = 0;
 
-    if (send) {
-        QLIST_FOREACH(node, &bus->current_devs, next) {
-            s = node->elt;
-            sc = I2C_SLAVE_GET_CLASS(s);
-            if (sc->send) {
-                trace_i2c_send(s->address, *data);
-                ret = ret || sc->send(s, *data);
-            } else {
-                ret = -1;
-            }
+    QLIST_FOREACH(node, &bus->current_devs, next) {
+        s = node->elt;
+        sc = I2C_SLAVE_GET_CLASS(s);
+        if (sc->send) {
+            trace_i2c_send(s->address, data);
+            ret = ret || sc->send(s, data);
+        } else {
+            ret = -1;
         }
-        return ret ? -1 : 0;
-    } else {
-        ret = 0xff;
-        if (!QLIST_EMPTY(&bus->current_devs) && !bus->broadcast) {
-            sc = I2C_SLAVE_GET_CLASS(QLIST_FIRST(&bus->current_devs)->elt);
-            if (sc->recv) {
-                s = QLIST_FIRST(&bus->current_devs)->elt;
-                ret = sc->recv(s);
-                trace_i2c_recv(s->address, ret);
-            }
-        }
-        *data = ret;
-        return 0;
     }
-}
 
-int i2c_send(I2CBus *bus, uint8_t data)
-{
-    return i2c_send_recv(bus, &data, true);
+    return ret ? -1 : 0;
 }
 
 uint8_t i2c_recv(I2CBus *bus)
 {
     uint8_t data = 0xff;
+    I2CSlaveClass *sc;
+    I2CSlave *s;
+
+    if (!QLIST_EMPTY(&bus->current_devs) && !bus->broadcast) {
+        sc = I2C_SLAVE_GET_CLASS(QLIST_FIRST(&bus->current_devs)->elt);
+        if (sc->recv) {
+            s = QLIST_FIRST(&bus->current_devs)->elt;
+            data = sc->recv(s);
+            trace_i2c_recv(s->address, data);
+        }
+    }
 
-    i2c_send_recv(bus, &data, false);
     return data;
 }
 
-- 
2.31.1


