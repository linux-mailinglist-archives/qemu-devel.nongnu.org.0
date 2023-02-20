Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC15069D03D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:06:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7jX-0001UG-O8; Mon, 20 Feb 2023 10:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jP-0001S9-Vy
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:32 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jN-0008Pc-Rm
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:31 -0500
Received: by mail-wr1-x434.google.com with SMTP id c5so2229783wrr.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WvQXFHkymgCugjl5w0M5Pkt74ouZE927KClvNUr2f1I=;
 b=oNbyK5bmWx489XuCKxFfaXarv7cwfVphOyQH3WvLtfsWk5rp2/H2tCe15B+Gw82YOi
 BM9lsmBHxu5uTDzHEcdgA4ygYFkD18nJ4++SNEiNoNEynJP4X54mOdQdtQeZiM9tIiTU
 1+NygPMdKY35KGvLc9QDcSUxa7Ldi/J0dzf/f+AdsQOzgYs3L2sFcpMt8nTAl4wzCgW3
 OdAsDjdyDwJc4diwmlJcnWgxVXxRTMrwVC8lJgmDzk/LCmH0EyG6XK5vmUJVs0pAE/Ky
 hPNbC08/vo1TpsR8D0H3Xcg5KgCAP9/pFVXg+isZ9UaxWs1244vdEQPtasCMl11daFb1
 0Fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WvQXFHkymgCugjl5w0M5Pkt74ouZE927KClvNUr2f1I=;
 b=n0cW7ZjGXqyGH9NSWE7LGfed49MWMa8VYZsUhRL6gWjWhwspa0UJF71mGaQ0AhjJ03
 DlaCRbebTLEWqxkOuHvLBrNnPVjt6+rVxVuLw8bLOVvjBefx5nfueYYCgj1Zs1tO7Kef
 keJoYF0yhVX1Dog+PITjTZtWwS47RHHyOmOTqgCgbLnoClbSr27HoqESrxgM0r/Rahe6
 WY1xIbE4FkU8Lah3ME2yGGUcyxBSQWufCBmzEpVga1TbUfYqdSpuiaJ4sooCB3jyNZYR
 NpxZReU/8Q9kH0FoTyQMlpbmpAlEWGn2f4kWAXKiWS6BXcbAaftCbDfTWOC8n5EQ4dp8
 Ynuw==
X-Gm-Message-State: AO0yUKX6hbVoHdwGHaVswXKATLXvGnDftjViNtHw6Il6UN6LG8bs/4XU
 OAa0NzYNC16YtkRAjlpQHeYHkMrnb77NhgOS
X-Google-Smtp-Source: AK7set9wOPJyT/SXml6PHb6eRhI1d7QfpYWhO1coMcPLrn8JB9m6DzsY6wADJnXSE1OeKhAQcTNaoQ==
X-Received: by 2002:a5d:4f87:0:b0:2c5:8d06:75c2 with SMTP id
 d7-20020a5d4f87000000b002c58d0675c2mr2981896wru.35.1676905528225; 
 Mon, 20 Feb 2023 07:05:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a1c7714000000b003dc3f3d77e3sm1437266wmi.7.2023.02.20.07.05.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 07:05:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/9] hw/usb/hcd-ohci: Use OHCIState type definition
Date: Mon, 20 Feb 2023 16:05:08 +0100
Message-Id: <20230220150515.32549-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220150515.32549-1-philmd@linaro.org>
References: <20230220150515.32549-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Forward-define the type first, then use it for the ohci_die() handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-ohci.c |  2 +-
 hw/usb/hcd-ohci.h | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 9d68036d23..7ecf9b15b7 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1827,7 +1827,7 @@ static USBBusOps ohci_bus_ops = {
 void usb_ohci_init(OHCIState *ohci, DeviceState *dev, uint32_t num_ports,
                    dma_addr_t localmem_base, char *masterbus,
                    uint32_t firstport, AddressSpace *as,
-                   void (*ohci_die_fn)(struct OHCIState *), Error **errp)
+                   void (*ohci_die_fn)(OHCIState *), Error **errp)
 {
     Error *err = NULL;
     int i;
diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
index 11ac57058d..8a9ba8b959 100644
--- a/hw/usb/hcd-ohci.h
+++ b/hw/usb/hcd-ohci.h
@@ -33,7 +33,9 @@ typedef struct OHCIPort {
     uint32_t ctrl;
 } OHCIPort;
 
-typedef struct OHCIState {
+typedef struct OHCIState OHCIState;
+
+struct OHCIState {
     USBBus bus;
     qemu_irq irq;
     MemoryRegion mem;
@@ -89,8 +91,8 @@ typedef struct OHCIState {
     uint32_t async_td;
     bool async_complete;
 
-    void (*ohci_die)(struct OHCIState *ohci);
-} OHCIState;
+    void (*ohci_die)(OHCIState *ohci);
+};
 
 #define TYPE_SYSBUS_OHCI "sysbus-ohci"
 OBJECT_DECLARE_SIMPLE_TYPE(OHCISysBusState, SYSBUS_OHCI)
@@ -112,7 +114,7 @@ extern const VMStateDescription vmstate_ohci_state;
 void usb_ohci_init(OHCIState *ohci, DeviceState *dev, uint32_t num_ports,
                    dma_addr_t localmem_base, char *masterbus,
                    uint32_t firstport, AddressSpace *as,
-                   void (*ohci_die_fn)(struct OHCIState *), Error **errp);
+                   void (*ohci_die_fn)(OHCIState *), Error **errp);
 void ohci_bus_stop(OHCIState *ohci);
 void ohci_stop_endpoints(OHCIState *ohci);
 void ohci_hard_reset(OHCIState *ohci);
-- 
2.38.1


