Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54D73AB33A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:04:21 +0200 (CEST)
Received: from localhost ([::1]:32810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqku-0001EG-Mk
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqbO-0008Sk-TC
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:31 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqbN-0005VL-93
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:30 -0400
Received: by mail-wr1-x42c.google.com with SMTP id y7so6421061wrh.7
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xaw3RJNkpGriYz8vt+BCpgugibw18q+MPp6XakrxTs4=;
 b=MIV75LH5f3NzD9QkwVgh2t2wUpIGQ9SnLzse2hAGKUb7Scd/uk9pJ4PP97zet6JrG5
 IU6ApWm7fZae/jHaiLTfCf4ke8LpiHr4YI3VM3yYgkZ/Vj7OI2t5W5mbP0591J2g2efm
 ibBfnYuDPG9qxSPNd3ni++t1fjOQ/kYZeSFa7aCJt9qpeFD7tZCtamoXJyX4lKgpsZr/
 LOc3FxIYZogzs6zBOYCCfNXoH3PfQkL0NtKY7HOMoDwoanbnFB6lYpSHDVPLkNLPhpSG
 XYZmLFs2av/00x5cZIHkiBLPlOgJdExl8NZfyLTCbKvjqMhD1jouJDg5P9lHVK/uKZmZ
 tixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xaw3RJNkpGriYz8vt+BCpgugibw18q+MPp6XakrxTs4=;
 b=lTU8BR2s57aKY0b6onzXP6OAnJoJCMfP+H1beMTLsWKuUmVKMCQZ4EfTL6The0eFVS
 DQhiHWI0pee/3afKqElqNJ/jlXYA1X5QsafGjGkLvSSOtiGK3LgYuO9NPSP15SRu1gxe
 sFH3pLqqfIEVAV3olYWgwGD5paYk/V+Ee/+u2EfHUFcXYMaLOmI5+p0SHMIhyZKBJy/F
 uy09P2DYRrGd8SGe0RCXvzfanVbPq3A+GCLCDfbhFcjcAKhu5VnXVVpHmT2spOw0WIBz
 WN3lDHfYF7Az5Uamq0XhFqtnhWE0FiTCUP8y8xRqkecux+X7WqEgqQRG7145xjNceQ8o
 BuPQ==
X-Gm-Message-State: AOAM530AG3WEbgSi/UFFcY/2Qv7fMjV4fHRJi2FFsbhVLfHfD9FlicJs
 6/IKlRSyV819y3Bl3rKA2IXNfNhWCVd/og==
X-Google-Smtp-Source: ABdhPJw+wqDEWyK7GRV70ApBcSBu5RPp1cJsduLZNqq0b6wrsAcHfa1FEzh/4YWT2vp5EfV6X9QH0A==
X-Received: by 2002:adf:bb54:: with SMTP id x20mr3997548wrg.19.1623930867781; 
 Thu, 17 Jun 2021 04:54:27 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k16sm4406285wmr.42.2021.06.17.04.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:54:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/15] hw/i2c: Remove confusing i2c_send_recv()
Date: Thu, 17 Jun 2021 13:53:30 +0200
Message-Id: <20210617115334.2761573-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617115334.2761573-1-f4bug@amsat.org>
References: <20210617115334.2761573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


