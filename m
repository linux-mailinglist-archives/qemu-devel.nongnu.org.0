Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6573B3BF3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 07:11:05 +0200 (CEST)
Received: from localhost ([::1]:57940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwe7M-0004aa-E9
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 01:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lwe3M-0003fN-JV; Fri, 25 Jun 2021 01:06:56 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lwe3K-0001QC-GJ; Fri, 25 Jun 2021 01:06:56 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 pf4-20020a17090b1d84b029016f6699c3f2so7287168pjb.0; 
 Thu, 24 Jun 2021 22:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8WnECVTUfVHCEk90tc1kArct77igzL8zJc7haXVTyYw=;
 b=uZvG5OwktZiJedtIwJmFtLWcf/RECT/D6xjZnBeyukxA8m+3uID3mAtGvqZG5NLAKM
 o4HS1CgDiGJ+rqlo6dwdOvxPmncD7i/+wTsb2euvZUC8fXEHJZ4v7hlrlEY0asqIS1ag
 B7mSbdsTHnCd3FmdSfSbi8nDRtFuUwQncKo+2A+ltssuvD5MZkpmVybx0Ht5nk53oDLJ
 /dW55KHhuhRi2PVXLhhAomIAGSrWS+VP9pmuvsEwsQT66eji+vyFTQC4doMxXSykGSzx
 v0/PMOnfCVkTJPkzByKf4KDL7Z7OXi/XW76Rjg3SOcDQZWivbUOpdnjilYUlYgUiAj0/
 648w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8WnECVTUfVHCEk90tc1kArct77igzL8zJc7haXVTyYw=;
 b=ZVpFYScHOTTNXEEAGflCfduVIL1a6rtjPoi0IQEimZ+eLnUvsFfXkHUDpujIOWki8K
 0UyW0NgNyTMtvm/AlasK3nBpo5ONi1biRbEJZ5Cgzmfkp5y3Aja2GztRIGF2ZcaejtHz
 H1YpIV8QLmKbu2ylS0vi0IZsriNlfJ/YQ61jdu9U/LJiUdzzQOFCoeehvP6mARZBh7JP
 3zIqf8LUNjks+KQik7G9b2yCCNe9EIuHe+ZzFLkjWUw43ybAXxsv8jpVnaq6uT2scHwj
 QGxmikmS4mbko/J6dhzk0dfGf1ok0axIskg6y14OFKI1sPgXSmAaFmR6vSCtR+LMKnLt
 zU5Q==
X-Gm-Message-State: AOAM5307HzHBMSgSZZZ90Sag0Au5G7Ih3Ky7LC1VVELlRMl0J8DecrjM
 krWVKFhsM5CQUFXsPcA/p30=
X-Google-Smtp-Source: ABdhPJx2xZf2y5FsIM/pkLihtoVA6xAQvbsiaCKxbycsKHYBmBBN3oX3XRrS7QnBS2dmN4fhix/hFA==
X-Received: by 2002:a17:90b:1096:: with SMTP id
 gj22mr9352991pjb.232.1624597612409; 
 Thu, 24 Jun 2021 22:06:52 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id gg5sm9334703pjb.0.2021.06.24.22.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 22:06:51 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] arm/aspeed: rainier: Add i2c eeproms and muxes
Date: Fri, 25 Jun 2021 14:36:43 +0930
Message-Id: <20210625050643.161042-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Patrick Venture <venture@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are the devices documented by the Rainier device tree. With this
we can see the guest discovering the multiplexers and probing the eeprom
devices:

 i2c i2c-2: Added multiplexed i2c bus 16
 i2c i2c-2: Added multiplexed i2c bus 17
 i2c i2c-2: Added multiplexed i2c bus 18
 i2c i2c-2: Added multiplexed i2c bus 19
 i2c-mux-gpio i2cmux: 4 port mux on 1e78a180.i2c-bus adapter
 at24 20-0050: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
 i2c i2c-4: Added multiplexed i2c bus 20
 at24 21-0051: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
 i2c i2c-4: Added multiplexed i2c bus 21
 at24 22-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 1301e8fdffb2..7ed22294c6eb 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -677,6 +677,10 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
 static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
+    I2CSlave *i2c_mux;
+
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51,
+                          g_malloc0(32 * 1024));
 
     /* The rainier expects a TMP275 but a TMP105 is compatible */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP105,
@@ -685,11 +689,25 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
                      0x49);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP105,
                      0x4a);
+    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4),
+                                      "pca9546", 0x70);
+    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 0), 0x50,
+                          g_malloc0(64 * 1024));
+    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 1), 0x51,
+                          g_malloc0(64 * 1024));
+    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 2), 0x52,
+                          g_malloc0(64 * 1024));
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP105,
                      0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP105,
                      0x49);
+    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5),
+                                      "pca9546", 0x70);
+    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 0), 0x50,
+                          g_malloc0(64 * 1024));
+    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 1), 0x51,
+                          g_malloc0(64 * 1024));
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP105,
                      0x48);
@@ -697,6 +715,16 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
                      0x4a);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP105,
                      0x4b);
+    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6),
+                                      "pca9546", 0x70);
+    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 0), 0x50,
+                          g_malloc0(64 * 1024));
+    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 1), 0x51,
+                          g_malloc0(64 * 1024));
+    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 2), 0x50,
+                          g_malloc0(64 * 1024));
+    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 3), 0x51,
+                          g_malloc0(64 * 1024));
 
     /* Bus 7: TODO dps310@76 */
     /* Bus 7: TODO max31785@52 */
@@ -704,11 +732,19 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     /* Bus 7: TODO si7021-a20@20 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP105,
                      0x48);
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50,
+                          g_malloc0(64 * 1024));
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51,
+                          g_malloc0(64 * 1024));
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
                      0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
                      0x4a);
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50,
+                          g_malloc0(64 * 1024));
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51,
+                          g_malloc0(64 * 1024));
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552", 0x61);
     /* Bus 8: ucd90320@11 */
     /* Bus 8: ucd90320@b */
@@ -716,14 +752,34 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4d);
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 9), 0x50,
+                          g_malloc0(128 * 1024));
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4d);
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 10), 0x50,
+                          g_malloc0(128 * 1024));
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), TYPE_TMP105,
                      0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), TYPE_TMP105,
                      0x49);
+    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11),
+                                      "pca9546", 0x70);
+    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 0), 0x50,
+                          g_malloc0(64 * 1024));
+    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 1), 0x51,
+                          g_malloc0(64 * 1024));
+
+
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50,
+                          g_malloc0(64 * 1024));
+
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50,
+                          g_malloc0(64 * 1024));
+
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50,
+                          g_malloc0(64 * 1024));
 }
 
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
-- 
2.32.0


