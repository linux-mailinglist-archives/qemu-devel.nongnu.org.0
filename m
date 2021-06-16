Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1BA3AA670
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 00:00:20 +0200 (CEST)
Received: from localhost ([::1]:50496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltda7-0003gR-MS
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 18:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdKZ-0002mK-CK; Wed, 16 Jun 2021 17:44:15 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdKU-0006pf-0P; Wed, 16 Jun 2021 17:44:15 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o39-20020a05600c5127b02901d23584fd9bso2189111wms.0; 
 Wed, 16 Jun 2021 14:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DtENdvfDn6VhzVLT/89Jq/1ZlyaMFR9nNkP3jZQYETo=;
 b=LeH+0XzZjrI9Ahy3mFlNXUOSl0AOt8muIB9GjpLaz1jcZ1Lx5MGiVZ6TTGYYY3KoEz
 q7Ck6+HTjCkse8FD7Z+qXvX74jhenGGtSUjwobtoJ4xUmNK5shKGrrkTI6/rPmwqxggb
 mufat7s44juoLdwYeN1BrgbKWTEvFevPkYVeoR7fbxuzQxOOaLAbdMomh6L5gE6SIFSx
 SzB9CpplN9O0j5rXwdMR70sA6YEaEupCTFKV+5NoP1n5wm4A+6G7i8vufsD/ds/ed4/N
 VZQ3DF0viYuRKlCJLi+jW5PLLG5Gbzc+IVYtUYg+dr++nfA7ZMseDDr7FUWeeUOW61Ug
 Dqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DtENdvfDn6VhzVLT/89Jq/1ZlyaMFR9nNkP3jZQYETo=;
 b=ANuTfxOVtc4UHIOPRMLx7i6P5e8x+1ROtxbw5iuLmwirwi9xr4+af8LGp7Y2F7gFCk
 tUEhZLtujbWqoe4YNRm58+F3hmQBb8otYRqXQUAIpCU1/N9lACEnh84uM4mGhwol9fI/
 tpmzdHaH2VvGwBPqeJ5GTBTJ8XGRikyRTENdaWVKPYI93tVPTUucXRUgvECj+xaF/n5h
 CR6Y6BuRwcnUtjCrCc399dORUzX09X48O1VJhMzNge6902gcWCXwna5FJxlH431g495v
 ClX9kMhzTd9N2A1Jvs0sZYxT9CRStMQhc43bZSpjFf48zVTHv0Cl2Z2idD+EYx2+HZo3
 nbLg==
X-Gm-Message-State: AOAM531UV2XsEI8l7sHvwdldyQ67nQgzKXpnPELVklvP6KfoasTvgM4I
 liiOHNs/ehgpeFZ4N0FMbeWytAGbF5JbQg==
X-Google-Smtp-Source: ABdhPJz9zDUUgR6Ca6FC9g8DjIGwLbBpUFfDEa2MXDzNqPpbSK4oi+pqMwpByDMV4GdEvUNc/LCw2Q==
X-Received: by 2002:a1c:b306:: with SMTP id c6mr1097964wmf.37.1623879847485;
 Wed, 16 Jun 2021 14:44:07 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v8sm3705536wrc.29.2021.06.16.14.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:44:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/15] hw/i2c: Make i2c_start_transfer() direction argument
 a boolean
Date: Wed, 16 Jun 2021 23:42:52 +0200
Message-Id: <20210616214254.2647796-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Make the argument representing the direction of the transfer a
boolean type.
Rename the boolean argument as 'is_recv' to match i2c_recv_send().
Document the function prototype.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20200621145235.9E241745712@zero.eik.bme.hu>
[PMD: Split patch, added docstring]
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h | 12 +++++++++++-
 hw/i2c/core.c        |  4 ++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 2adf521b271..21f2dba1bf7 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -80,7 +80,17 @@ struct I2CBus {
 
 I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
 int i2c_bus_busy(I2CBus *bus);
-int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv);
+
+/**
+ * i2c_start_transfer: start a transfer on an I2C bus.
+ *
+ * @bus: #I2CBus to be used
+ * @address: address of the slave
+ * @is_recv: indicates the transfer direction
+ *
+ * Returns: 0 on success, -1 on error
+ */
+int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv);
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
 int i2c_send(I2CBus *bus, uint8_t data);
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 6af24c9e797..6639ca8c2e0 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -115,7 +115,7 @@ bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
  * without releasing the bus.  If that fails, the bus is still
  * in a transaction.
  */
-int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
+int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
 {
     I2CSlaveClass *sc;
     I2CNode *node;
@@ -157,7 +157,7 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
 
         if (sc->event) {
             trace_i2c_event("start", s->address);
-            rv = sc->event(s, recv ? I2C_START_RECV : I2C_START_SEND);
+            rv = sc->event(s, is_recv ? I2C_START_RECV : I2C_START_SEND);
             if (rv && !bus->broadcast) {
                 if (bus_scanned) {
                     /* First call, terminate the transfer. */
-- 
2.31.1


