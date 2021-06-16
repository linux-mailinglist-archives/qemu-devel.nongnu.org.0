Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982943AA64E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:49:39 +0200 (CEST)
Received: from localhost ([::1]:55422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltdPm-0004ax-Km
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdKK-0002Eg-Co; Wed, 16 Jun 2021 17:44:00 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdKI-0006jL-Ng; Wed, 16 Jun 2021 17:44:00 -0400
Received: by mail-wr1-x431.google.com with SMTP id f2so4230946wri.11;
 Wed, 16 Jun 2021 14:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xaw3RJNkpGriYz8vt+BCpgugibw18q+MPp6XakrxTs4=;
 b=b1kEKiK4zGbDqxWxgK1H0qAR4HxX9/cswfC4wJTbHEyLL62akF47X2U/cCX/ic5RFG
 s4ooq6qdq28WM0hqoN0iVjfyNAb3SPuj5zPEESzHuH1dIL7Dw0uk03o9qT7/i4jREwNG
 SSCQJ1H7j1HVqrnY1sywr5NlkJMbL3Yu+YX2C41eOv21xNPDDHZKgJidKdTRy4UKXDSQ
 qoMEmibVGloS0wQz29w6c/KnnAN0Pwolp5SIKUa5ZM3JJpy0COZaY24jmTv44JV8psRl
 Eo9k6qaLmCdI0oxRIp5n9z9E8Kh2YcBIH65nDsDIKaphOxxAZlPX/K7bYEOYUdgsaK1e
 NhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xaw3RJNkpGriYz8vt+BCpgugibw18q+MPp6XakrxTs4=;
 b=SNve24Y69K8Ccpd5TXaTvKYrWVgXxMLyUqGf43SLKef2JNNDyXvKAvlZPs/+N/D55h
 MGOsURqWN+0mt3YUycSQORai4PvGXzi26FfWMdfoH1gdjRmoHtphHvvyrWROcM0/M7Bq
 Pn6fD3IN6Vij5bmfJTFJYexWgMBo120iYn8k3SO16TPrs8xkcozYweHGq3ieT/rV9Puj
 skT30wKf4BdOvgrZ6OAEckX7nSoJqoOzwKtMH8gbBpxnBpaJRE/YsG6TlOYnM1AyWMoc
 KhNABb0cj+OjhnIdHZO7KNOQzD/iuIwwaPkXDRAwi3qhkpeJ4oDf62y3xq6KQYy+MCOr
 nK/g==
X-Gm-Message-State: AOAM530xI1EbMldO1cFB0y4YpU3Smhk4IwcHuyj1icJPGAisAJppsvw5
 g9nNeMl8G/TWq5v7Z8+xkLK5/rg+sqwMNg==
X-Google-Smtp-Source: ABdhPJxo1CtcK6hh0B6GMM1gy3iCaIw/QjFj5zp+lWaS+xNSNFMrgKuwKcp8kv02gGi4d7zqk4apjQ==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr1460631wri.60.1623879836653;
 Wed, 16 Jun 2021 14:43:56 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f12sm3947441wru.81.2021.06.16.14.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:43:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/15] hw/i2c: Remove confusing i2c_send_recv()
Date: Wed, 16 Jun 2021 23:42:50 +0200
Message-Id: <20210616214254.2647796-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We replaced all the i2c_send_recv() calls by the clearer i2c_recv()
and i2c_send(), so we can remove this confusing API.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
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


