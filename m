Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0D13AA135
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:25:25 +0200 (CEST)
Received: from localhost ([::1]:49648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYM0-00047F-85
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYC8-0003ah-LZ; Wed, 16 Jun 2021 12:15:12 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYC6-0006A3-Lv; Wed, 16 Jun 2021 12:15:12 -0400
Received: by mail-wr1-x42b.google.com with SMTP id o3so3331913wri.8;
 Wed, 16 Jun 2021 09:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vAQOTgkXRhPf8zVosSRFgasjO/1Bn32INvkw+pDxE7k=;
 b=Oy9vMtLOZAPeK0nmALXedUl1vVeHjS7cpXY+qKd5XKh/nrNHQXIVNct2k2sGPMAasO
 TviWSsUSA6DbzJ2H4kx6DEOHKUoH5LuEyblPG+a94oRPfsvQgWwYYaI5HW5Iien4hBrj
 nm/4QJsSSWk88yoKPkpb1Fre1YEuAEpcdH7v7MqzfOIuykhGzWoCHzXi2v31lgr/BqO+
 Qk+H2G7TMiJaA4jmRfV2uG4dWCUCeWXvyOiBXrIq5ok7WKUgDpfAlYlWtPOpGvSt2MXl
 l4Ot/Q3DMFJCZZauMPWnH+GDFuBIy8q5ie2gomqzi/zFLC/go7wxC4SUzZ1xvWRPEqdI
 CxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vAQOTgkXRhPf8zVosSRFgasjO/1Bn32INvkw+pDxE7k=;
 b=NxZI6ToTcXClx2ridyc0tjdVTk9AmswAafGJ1Fmb1OxfIVE8mnkS1EUZe6jxUaqrd+
 aD1wndHG1TkbN3C+OYXhnwSoCJICSutyjIEjFhAuk0FsCS7KBrs33erx8xfBbq4RGong
 zsZ81XdX0cdrH4l+F7HZqmS7KvBx9ON/6mwkATK1vGv/VakIrzgwNqch5xhUY7oHZ+0/
 l/e7PozCsj9O7Cit5Lpm4pzsnMyqls/zdOVaJ1NLqdgJsDuiyPMIfQTDFjzRUQx4RD2I
 KChbjKsg69V34EJSHLq52W1S8IT0CHsq6AZgXY077Rcd5x+rbjeMJ/ymj1qbxdXRmgmF
 Zx7A==
X-Gm-Message-State: AOAM533/vD9stgkQ7xVZGXDW9UkMjOQ66+DJ4uQv0tTTg/Ymsl4TvgUk
 OWJ6et88AXIKHMiZlOmsZspBTjMinDDnog==
X-Google-Smtp-Source: ABdhPJzetfsS6t+HNdcnCAtVuvhVq/GM6GaBkmkTKK8o8eL1AsAmLvZlakv9XaNQnIZGyyXQhvEAjQ==
X-Received: by 2002:a5d:6849:: with SMTP id o9mr258335wrw.44.1623860108495;
 Wed, 16 Jun 2021 09:15:08 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n10sm2543446wre.95.2021.06.16.09.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:15:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/13] hw/misc/auxbus: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Date: Wed, 16 Jun 2021 18:14:15 +0200
Message-Id: <20210616161418.2514095-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616161418.2514095-1-f4bug@amsat.org>
References: <20210616161418.2514095-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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

Instead of using the confuse i2c_send_recv(), replace
  i2c_send_recv(send = true) by i2c_send() and
  i2c_send_recv(send = false) by i2c_recv().
During the replacement we also change a while() statement by for().
The resulting code is easier to review.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index d96219aef88..4d270ea9ec3 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -141,12 +141,8 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
         }
 
         ret = AUX_I2C_ACK;
-        while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, false) < 0) {
-                ret = AUX_I2C_NACK;
-                break;
-            }
-            len--;
+        for (i = 0; i < len; i++) {
+            data[i] = i2c_recv(i2c_bus);
         }
         i2c_end_transfer(i2c_bus);
         break;
@@ -161,12 +157,11 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
         }
 
         ret = AUX_I2C_ACK;
-        while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
+        for (i = 0; i < len; i++) {
+            if (i2c_send(i2c_bus, data[i]) < 0) {
                 ret = AUX_I2C_NACK;
                 break;
             }
-            len--;
         }
         i2c_end_transfer(i2c_bus);
         break;
@@ -200,14 +195,13 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
 
         bus->last_transaction = cmd;
         bus->last_i2c_address = address;
-        while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
+        for (i = 0; i < len; i++) {
+            if (i2c_send(i2c_bus, data[i]) < 0) {
                 i2c_end_transfer(i2c_bus);
                 break;
             }
-            len--;
         }
-        if (len == 0) {
+        if (i == len) {
             ret = AUX_I2C_ACK;
         }
         break;
@@ -233,16 +227,10 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
 
         bus->last_transaction = cmd;
         bus->last_i2c_address = address;
-        while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, false) < 0) {
-                i2c_end_transfer(i2c_bus);
-                break;
-            }
-            len--;
-        }
-        if (len == 0) {
-            ret = AUX_I2C_ACK;
+        for (i = 0; i < len; i++) {
+            data[i] = i2c_recv(i2c_bus);
         }
+        ret = AUX_I2C_ACK;
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "AUX cmd=%u not implemented\n", cmd);
-- 
2.31.1


