Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F030F3AA678
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 00:03:19 +0200 (CEST)
Received: from localhost ([::1]:53196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltdd0-0005iF-P4
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 18:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdKa-0002nI-5b; Wed, 16 Jun 2021 17:44:16 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdKY-0006tY-OB; Wed, 16 Jun 2021 17:44:15 -0400
Received: by mail-wr1-x434.google.com with SMTP id d11so1889390wrm.0;
 Wed, 16 Jun 2021 14:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XbaEDOU2JipKG2I/F5MOGMQYq6FK1z0qkr9m5RlbReA=;
 b=sp4CA67eCjSUDOKltx6UDvI/exh4Fvp7/raabcNUEn0RSQnS9v0ufUDOqw7G7CiGzk
 VhY/R+1T4/cc2wzrcgT+uLhgfItF10ZsRp2h/3L6awAL4GfIPA4B7YdC0cWyIqWQbLGr
 yhfxWV4yH7C/MRYooLmTqQa2a55wz1szFM+MqsBnbBPfaGEDmcs7/38Q9PUrOKJ3BjpF
 QSH/L7/9jEK8YTNFGW0/AoLZtiW6dskKzRWA2IWzXdXr/x1rehh6lAvYmc9Nj7GhpjT0
 XUX1OTO3lnXCZ0Ubsas35VUyNKX+ixvcO3b5oDxt+BbCdoMffuxXD7QyQcNzHu8VDF7P
 rnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XbaEDOU2JipKG2I/F5MOGMQYq6FK1z0qkr9m5RlbReA=;
 b=PAnKq7aloCb4ccuN2O8TB+S4m/oEOT4qqLycBUv8J/5gAno3SzKwazf+4k/Tx8TZQk
 GDXtUDos1d86b5d+/njJm9x9CAw8DsFv3igGWQ+LHxMWUBWJvMEuJs0PY8H2404oGiD9
 p5Is4Ht53gP1+vKv1CCn8qRhCKfAk71xbZ+NKZBnRCuTBGU+KDgRfnS6xDYkHenyW8Cn
 AQLcS/A4F6jKDvrLm0XESHeT8eTNg9xt1qlNVDVClMAnnQP3ZZRgHhGOjHn7Dek/9nQN
 7m6Vn3N6Sr0rsWN0mXUIJavaxQbcuYRHMI9A13JAAtheSSNR0/lNsOhRzdHX3feQ+2Pt
 fR1A==
X-Gm-Message-State: AOAM531j6L4rOOnZZFZN8TXen8GY+0aNWJo3R8QJJv1qu6R0AaQASNrw
 tDRpeRNt6FgaVmOnnRrP3w6vTHOObG28mw==
X-Google-Smtp-Source: ABdhPJx7aZ+RUHW44lXCYZI43uIJqWJpttgakGk45aRYGpvhJ6Fgcp2DCYmjO+rEgaGtlg5Hug/L9g==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr1410886wri.263.1623879852529; 
 Wed, 16 Jun 2021 14:44:12 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p23sm6031712wmi.26.2021.06.16.14.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:44:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/15] hw/i2c: Extract i2c_do_start_transfer() from
 i2c_start_transfer()
Date: Wed, 16 Jun 2021 23:42:53 +0200
Message-Id: <20210616214254.2647796-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To allow further simplications, extract i2c_do_start_transfer()
from i2c_start_transfer(). This is mostly the same function,
but the former is static and takes an enum argument.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/core.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 6639ca8c2e0..69df4c0df6b 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -115,12 +115,15 @@ bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
  * without releasing the bus.  If that fails, the bus is still
  * in a transaction.
  */
-int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
+static int i2c_do_start_transfer(I2CBus *bus, uint8_t address,
+                                 enum i2c_event event)
 {
     I2CSlaveClass *sc;
     I2CNode *node;
     bool bus_scanned = false;
 
+    assert(event == I2C_START_RECV || event == I2C_START_SEND);
+
     if (address == I2C_BROADCAST) {
         /*
          * This is a broadcast, the current_devs will be all the devices of the
@@ -157,7 +160,7 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
 
         if (sc->event) {
             trace_i2c_event("start", s->address);
-            rv = sc->event(s, is_recv ? I2C_START_RECV : I2C_START_SEND);
+            rv = sc->event(s, event);
             if (rv && !bus->broadcast) {
                 if (bus_scanned) {
                     /* First call, terminate the transfer. */
@@ -170,6 +173,13 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
     return 0;
 }
 
+int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
+{
+    return i2c_do_start_transfer(bus, address, is_recv
+                                               ? I2C_START_RECV
+                                               : I2C_START_SEND);
+}
+
 void i2c_end_transfer(I2CBus *bus)
 {
     I2CSlaveClass *sc;
-- 
2.31.1


