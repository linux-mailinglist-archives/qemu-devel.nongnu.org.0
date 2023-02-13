Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93992694272
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:12:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVo2-0005f9-Nq; Mon, 13 Feb 2023 05:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVnw-0005eF-Nd
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:11:24 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVnt-0003X0-NT
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:11:23 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso8558114wms.4
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xLHQgcdLxt1p5En4sn+xmWI1OSi7FkAFpHuHk9yrVdo=;
 b=EIklTWusualkftsgWJosmMrIsT3ku5RnbaviYb4OLb+inVC+SQWZ1C+e7EIuVDI3a1
 C1Cg1Q8ah6h2ENlehqbqnXRvqeYSl0dCU8H6cZA6bxh+gM749DoriyJBkJRzt/1hkrDb
 HDR/2AZN/CLbtseL87s9V3mq0hCpu7vjb775kd+YpwO8cVgYqi8FW9urN2O37e3XeSFP
 UoyDa8DfGAhVy1W7kUpJOvQ7Db4Zy2VEmQGrlHAz+RR6lrRLb/Co7d7zrgM4dqyg0Nxn
 lVCW3xbWuNuEkTXOkUDF6nTRwL5NcNYkQI3EZ2dnc2nGpdihQs1sBeaOa7G7UxgJ+GHf
 nk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xLHQgcdLxt1p5En4sn+xmWI1OSi7FkAFpHuHk9yrVdo=;
 b=IbCXrteXG7eoi2JVNOxK/9eOofkZRRUYkmW/0aAx9PzN7SCFc9+/Jucf3wlvNHwS99
 BTCsw3l6MEXaW4V/rR7EVuFxvh4yYVynw1gsyZLv86w0q/XbydOLIM36uZT5kcH/0fzn
 F3q9fgBU+22gLhwUH1vXJWbiyE9Dm+/9CuDS1/srbpIqCpIFzuIK+qsLCIFQYT4TAjl9
 Z6T6PWku1MiGxOYhPGLlhFOhHvzrfkDrnIchx67Q8clygjbxACq1q8kFYKHbbWMQZUwN
 oKufwRx+AAW8ZUOQvsMuXXkFhz5OI2YxJqIAd+HMtgA7UtVmEducQnUS2BLNMwdUg2mb
 a+tg==
X-Gm-Message-State: AO0yUKXaa3zt9Co3AdwXQQBMq6z9CTfjVDBf4dCcx7syNPcnBMKdz0TS
 WrV6a4ZKyGPljjI5cnBrQJyDBXtV/QMhgwaa
X-Google-Smtp-Source: AK7set9LBVCB95B9oSsjAyhk3ioG3k/NpWJQZc6AwaaLs4V7nGf4QI9QR+JN2LvhIYMTUdquL/vFVg==
X-Received: by 2002:a05:600c:3416:b0:3df:85d2:c768 with SMTP id
 y22-20020a05600c341600b003df85d2c768mr18625647wmp.26.1676283079889; 
 Mon, 13 Feb 2023 02:11:19 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b003dc59d6f2f8sm13851110wmq.17.2023.02.13.02.11.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 02:11:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 6/7] hw/net/eepro100: Remove instance's
 EEPRO100State::device
Date: Mon, 13 Feb 2023 11:10:47 +0100
Message-Id: <20230213101048.94519-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213101048.94519-1-philmd@linaro.org>
References: <20230213101048.94519-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

'device' is accessed read-only and is present in the class
definition. No need to duplicate it in the instance state.
Directly access the class field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/eepro100.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index d7757907c3..bce377688e 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -263,7 +263,6 @@ struct EEPRO100State {
     /* region must not be saved by nic_save. */
     uint16_t mdimem[32];
     eeprom_t *eeprom;
-    uint32_t device;            /* device variant */
     /* (cu_base + cu_offset) address the next command block in the command block list. */
     uint32_t cu_base;           /* CU base address */
     uint32_t cu_offset;         /* CU address offset */
@@ -591,6 +590,9 @@ static void e100_pci_reset(DeviceState *dev)
 
 static void nic_selective_reset(EEPRO100State * s)
 {
+    EEPRO100Class *ek = EEPRO100_GET_CLASS(s);
+    const E100PCIDeviceInfo *info = ek->info;
+
     size_t i;
     uint16_t *eeprom_contents = eeprom93xx_data(s->eeprom);
 #if 0
@@ -598,8 +600,9 @@ static void nic_selective_reset(EEPRO100State * s)
 #endif
     memcpy(eeprom_contents, s->conf.macaddr.a, 6);
     eeprom_contents[EEPROM_ID] = EEPROM_ID_VALID;
-    if (s->device == i82557B || s->device == i82557C)
+    if (info->device == i82557B || info->device == i82557C) {
         eeprom_contents[5] = 0x0100;
+    }
     eeprom_contents[EEPROM_PHY_ID] = 1;
     uint16_t sum = 0;
     for (i = 0; i < EEPROM_SIZE - 1; i++) {
@@ -1794,7 +1797,7 @@ static const VMStateDescription vmstate_eepro100 = {
         VMSTATE_UNUSED(19*4),
         VMSTATE_UINT16_ARRAY(mdimem, EEPRO100State, 32),
         /* The eeprom should be saved and restored by its own routines. */
-        VMSTATE_UINT32(device, EEPRO100State),
+        VMSTATE_UNUSED(sizeof(uint32_t)), /* was device variant */
         /* TODO check device. */
         VMSTATE_UINT32(cu_base, EEPRO100State),
         VMSTATE_UINT32(cu_offset, EEPRO100State),
@@ -1848,12 +1851,9 @@ static NetClientInfo net_eepro100_info = {
 static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 {
     EEPRO100State *s = DO_UPCAST(EEPRO100State, dev, pci_dev);
-    EEPRO100Class *ek = EEPRO100_GET_CLASS(s);
 
     TRACE(OTHER, logout("\n"));
 
-    s->device = ek->info->device;
-
     /* Add 64 * 2 EEPROM. i82557 and i82558 support a 64 word EEPROM,
      * i82559 and later support 64 or 256 word EEPROM. */
     s->eeprom = eeprom93xx_new(&pci_dev->qdev, EEPROM_SIZE);
-- 
2.38.1


