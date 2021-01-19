Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B002FB638
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:07:01 +0100 (CET)
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1qir-0001YH-1U
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:07:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1l1qe9-0006S7-3k
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:02:09 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:46530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1l1qe4-0005vP-0L
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:02:08 -0500
Received: by mail-lj1-x22e.google.com with SMTP id u11so21757197ljo.13
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nBfQdnHsV8Wq5vizPIPoPSOpWjRk29x+48yhgI+v53U=;
 b=Smtge64XARU4FTT8xy+y8pOgxiXZS+tRx4NFa7AIcTNFRBTmerY5lxD0ffrwyYRq0z
 mdJgyGBhAG73Au8zm4u63mEaJY0/pFe4h91+E2tUkGEgXUHDYNYotxN96fqeoafw3yM9
 0ARA5c/fiXWkBXug53PGDcslu49Y495dQNoeyVAahRxqRUWVBpnTfBopbn5LLxnLlmxD
 GThQPvN3LJMg1R93NicjYFkHghv6n8Ud3rRdxvarTPEwz5sg63f6u6s7dGrEv6u2bvsN
 0yrdmP134miK+h4zuQYfwbwE9C22bpsbA5TBMwxFwbF658fJ5lwdhRG74AY9ad6zJ6wd
 PiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nBfQdnHsV8Wq5vizPIPoPSOpWjRk29x+48yhgI+v53U=;
 b=HK9YyA9IWaxrYpIozGVzDOCO3C6PDrr07E1FwBS9omDNJiANlk0Ez7i+LNfoAU1KG1
 dTU8JpInM2hHh1yyIEdbwjN1WwbYNT5XQ620NFqUmRCo6WkjLCyVtIbX9L45LT89BIXf
 LJBKtWEpaQB1nfTJ9YhMYX2AzVySz37cZLX2/JwSYi6i8hVRcuUDrBB9wvuyMW9XJU2G
 jXFKF75gOCvn4lM6J/7qf6y38437ceIeMddrgA6ovmGmdXe1ehOfZNLO7grXJxPvXQ56
 owLqfPxY3JQlS0X7Y7H8hBtx56uG0+GpGHemewuDakXNsYR4v/vnl797A7YNVwforJoJ
 XHOQ==
X-Gm-Message-State: AOAM533VyQ0/A68qQ3LnMLn7X1tjBFGDB9z3ckuM8VgU9UKyTo3pM9kE
 tFO75ThEWjJLB/vXqoFQfvBOdFJXyMXLeg==
X-Google-Smtp-Source: ABdhPJycHhG3ZEMo421Jaj7Vewsc7/+Iiamyn+MuthQWfi8J38cZVFm1Z+i5v0B4pHNNCT9/49gJsA==
X-Received: by 2002:a2e:740d:: with SMTP id p13mr1950333ljc.288.1611061317926; 
 Tue, 19 Jan 2021 05:01:57 -0800 (PST)
Received: from localhost.localdomain (31-208-27-151.cust.bredband2.com.
 [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id e25sm2356745lfc.40.2021.01.19.05.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 05:01:57 -0800 (PST)
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	frasse.iglesias@gmail.com
Subject: [RFC PATCH v1 1/3] hw: ssi: Introduce ssi_txfifo_transfer
Date: Tue, 19 Jan 2021 14:01:53 +0100
Message-Id: <20210119130155.30194-2-frasse.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119130155.30194-1-frasse.iglesias@gmail.com>
References: <20210119130155.30194-1-frasse.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, alistair@alistair23.me,
 bin.meng@windriver.com, mreitz@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces ssi_txfifo_transfer aimed to be used by SPI
controllers transfering through a txfifo. When interacting with a SPI
flash (m25p80), ssi_txfifo_transfer will toggle the accuracy from dummy
clock cycles to dummy bytes and by doing this above mentioned SPI
controllers will obtain support for the commands requiring those.

Signed-off-by: Francisco Iglesias <frasse.iglesias@gmail.com>
---
 hw/ssi/ssi.c         | 22 ++++++++++++++++++++++
 include/hw/ssi/ssi.h |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index e5d7ce9523..b87628ea0c 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -127,6 +127,28 @@ uint32_t ssi_transfer(SSIBus *bus, uint32_t val)
     return r;
 }
 
+uint32_t ssi_txfifo_transfer(SSIBus *bus, uint32_t val)
+{
+    BusState *b = BUS(bus);
+    BusChild *kid;
+    SSIPeripheralClass *ssc;
+    uint32_t r = 0;
+
+    QTAILQ_FOREACH(kid, &b->children, sibling) {
+        SSIPeripheral *peripheral = SSI_PERIPHERAL(kid->child);
+        ssc = SSI_PERIPHERAL_GET_CLASS(peripheral);
+        if (ssc->set_dummy_byte_accuracy) {
+            ssc->set_dummy_byte_accuracy(peripheral, true);
+        }
+        r |= ssc->transfer_raw(peripheral, val);
+        if (ssc->set_dummy_byte_accuracy) {
+            ssc->set_dummy_byte_accuracy(peripheral, false);
+        }
+    }
+
+    return r;
+}
+
 const VMStateDescription vmstate_ssi_peripheral = {
     .name = "SSISlave",
     .version_id = 1,
diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index f411858ab0..39bf00ec96 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -54,6 +54,8 @@ struct SSIPeripheralClass {
      * always be called for the device for every txrx access to the parent bus
      */
     uint32_t (*transfer_raw)(SSIPeripheral *dev, uint32_t val);
+
+    void (*set_dummy_byte_accuracy)(SSIPeripheral *dev, bool val);
 };
 
 struct SSIPeripheral {
@@ -105,5 +107,6 @@ bool ssi_realize_and_unref(DeviceState *dev, SSIBus *bus, Error **errp);
 SSIBus *ssi_create_bus(DeviceState *parent, const char *name);
 
 uint32_t ssi_transfer(SSIBus *bus, uint32_t val);
+uint32_t ssi_txfifo_transfer(SSIBus *bus, uint32_t val);
 
 #endif
-- 
2.20.1


