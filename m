Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD01F694273
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:12:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVnx-0005er-T3; Mon, 13 Feb 2023 05:11:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVnu-0005dP-K8
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:11:22 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVnq-0003W3-IL
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:11:20 -0500
Received: by mail-wm1-x334.google.com with SMTP id n33so2296609wms.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OEDmvV7dprZjnBDzVsTadk4Q695IfZynhRqx282ioKQ=;
 b=bA1SEdkAHr2a/FzF5KBg9EU55JU492UcPPUxDTOWBjnDa/fwmXQPy7eLNmOrDx93Tl
 XHHZnv3dUNkTgjEDXU2wfI/KzOif6Bb4A1BQgKI1kfAYQqgDfJLbLn2tGeorG192W4sE
 aUGUN/RAfDWfgGfAIqScoE8nNpq/HkVLwCE7exqnIhX3ZlgPPOJCvQAYkCZWKsApWGWk
 s51xxOSIxEWQyWN2VCf6Z0y7HUHgh2v5i3l2V1EPK7Sm5RbKGQuDyAX3OBUE59DDreND
 dctDupndlXzxcGPq9nEOETpU8fbhRWetNxxMbqvhEwMCVmxeXqOVgO0tV43USRF2xrY3
 xS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OEDmvV7dprZjnBDzVsTadk4Q695IfZynhRqx282ioKQ=;
 b=vqat6jxHKf2JdTnpNdaN3Rkc7DC/dEWR3Gw0dwO3oDpzU7DXky6UTC8tqebYPaOAZb
 6cRZafAEEmdi4CPUfXF1GehGnjPpkBYeCx9xmPCDHbxULKAgly98T4cIOv+ZKJXCLcFS
 7NeqlTPOnpl8qSTlLHYqOhHeLeRqfjKHaah3O0CCUnmf20uY0g4GQrB95htv0TF2c0tU
 YW7qWB5Iew4JZh4za28M53INW+ASAU9aDG2B3H2FvYq5IUyLLaJtLWVlFQM5NVlzt4CS
 D9MvFJBvoERBuMtMyrs8ME0AtrK5nVnBHZ+yMXQTxnhoH1cLGzBTPe/FocUcQVz325rR
 Gnow==
X-Gm-Message-State: AO0yUKVodChu0qHLPWldYpDjvMQXYcskkuS12UGbPQHTjegF0ciMRt1b
 1gphp7O72CrGpjAJaaFp3YRLH+WsILa5mxAr
X-Google-Smtp-Source: AK7set9CillZABT/pBKESsC/+uJDriXYq5kcvUHrkJzxN3EEnldv9KjRjfiYH2EZK7SBHOX4TVpWig==
X-Received: by 2002:a05:600c:181d:b0:3e0:c0d:75d8 with SMTP id
 n29-20020a05600c181d00b003e00c0d75d8mr20716066wmp.23.1676283075044; 
 Mon, 13 Feb 2023 02:11:15 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a1c544e000000b003db06493ee7sm17381648wmi.47.2023.02.13.02.11.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 02:11:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 5/7] hw/net/eepro100: Remove instance
 EEPRO100State::has_extended_tcb_support
Date: Mon, 13 Feb 2023 11:10:46 +0100
Message-Id: <20230213101048.94519-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213101048.94519-1-philmd@linaro.org>
References: <20230213101048.94519-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

'has_extended_tcb_support' is accessed read-only and is present
in the class definition. No need to duplicate it in the instance
state. Directly access the class field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/eepro100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index ab20558a18..d7757907c3 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -292,7 +292,6 @@ struct EEPRO100State {
 
     /* Quasi static device properties (no need to save them). */
     uint16_t stats_size;
-    bool has_extended_tcb_support;
 };
 
 /* Word indices in EEPROM. */
@@ -511,7 +510,6 @@ static void e100_pci_reset(DeviceState *dev)
     pci_set_byte(pci_conf + PCI_MAX_LAT, 0x18);
 
     s->stats_size = info->stats_size;
-    s->has_extended_tcb_support = info->has_extended_tcb_support;
 
     switch (device) {
     case i82550:
@@ -746,6 +744,8 @@ static void read_cb(EEPRO100State *s)
 
 static void tx_command(EEPRO100State *s)
 {
+    EEPRO100Class *ek = EEPRO100_GET_CLASS(s);
+    const E100PCIDeviceInfo *info = ek->info;
     const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     uint32_t tbd_array = s->tx.tbd_array_addr;
     uint16_t tcb_bytes = s->tx.tcb_bytes & 0x3fff;
@@ -782,7 +782,7 @@ static void tx_command(EEPRO100State *s)
         uint16_t tx_buffer_size;
         uint16_t tx_buffer_el;
 
-        if (s->has_extended_tcb_support && !(s->configuration[6] & BIT(4))) {
+        if (info->has_extended_tcb_support && !(s->configuration[6] & BIT(4))) {
             /* Extended Flexible TCB. */
             for (; tbd_count < 2; tbd_count++) {
                 ldl_le_pci_dma(&s->dev, tbd_address, &tx_buffer_address, attrs);
-- 
2.38.1


