Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 091F76A4491
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:36:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeBV-0003Sw-A1; Mon, 27 Feb 2023 09:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeB6-00035X-Vs
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:33 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeB5-0000Qh-8N
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:32 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l1so3312313wry.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nfzbgiNXdB7bzGKCFvc/rYiWW7yVj2AEWIRDHY3zhyM=;
 b=RxLj3AE19JAlvSjgeXZ0Agi0QNGJJRBQABvqG6A5MyBVWpXMw0BXSKI0Rk1eWm6b7G
 aZnkbnxkBivZNiNwVxJRl8StrMkaeQyRFEkiCgBwWhnjQ8BbQ2/zD+oheCgRMHVhCQ2A
 sreCgf3KZ1hbbiPz81ye5uAs2L9Q9WCd1CJLkqYZ3oH0VhyjU4fC4mFJNZlmUuBakJjg
 pl61syeGMdNNmo+QIsDhoE0TYOKgDNWm1bLIfZtHTBxxTPNqc6Bn0lzrEjWQFeAboHQ5
 NhLys21dprPMdyoF+lo4bh33mwvnAA+3twe2wIOZfJb3j78YCA+ELafaEtKF+91b8DHO
 ImEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nfzbgiNXdB7bzGKCFvc/rYiWW7yVj2AEWIRDHY3zhyM=;
 b=X5fMRuEkhPICWZfdNqzOvQBhyt37xXjEkHqRB2rsl0YAfA0m0deSZDIWu3SuO1yg7A
 1qohGOlP780fQwMRlLkHOEZrBgOwg6kIZZIRH7gq7jQPaoU0i/aW4S5kzvBYdxdBP/kd
 5zBTWz+RUepXDaIKryk3FzRpn1qoI0aWa0GYLvhoFXmQ7AWeTZlya1fh5h648hZahRQV
 dkssodP+3KLwLd5WehOHT3UAdocCltxhtixwaRKvGmG5/3nD9vFMiCqHkohiweuQL09L
 D2Zg3WVoy6XleUChnkUWtVG5MOyA1BRfL0HRBw94SxYH26GCCm4XoHaY+GfxV9E3/dZe
 Cs/g==
X-Gm-Message-State: AO0yUKXUJ8FcOYNqncJ/yJ41Ws2EN/xAmOqmhV5u40bgxiHLmjvyNnky
 aGR2Xsxqn0lgV6KGSBnQexsFkOdif7cchHuZ
X-Google-Smtp-Source: AK7set+ZJtpowER9RxT8e4c8Fp9OZJ65yRQv0UkAZnehntFrJOn/yu9p0j134olPDzYG/GXjjfs1sQ==
X-Received: by 2002:adf:ed0b:0:b0:2c7:1e16:57cf with SMTP id
 a11-20020adfed0b000000b002c71e1657cfmr9509135wro.67.1677506909486; 
 Mon, 27 Feb 2023 06:08:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u3-20020adfed43000000b002c55ec7f661sm7544192wro.5.2023.02.27.06.08.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:08:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 078/126] hw/usb/ohci: Use OHCIState type definition
Date: Mon, 27 Feb 2023 15:01:25 +0100
Message-Id: <20230227140213.35084-69-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230220150515.32549-3-philmd@linaro.org>
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
index e5e6b434fd..e1827227ac 100644
--- a/hw/usb/hcd-ohci.h
+++ b/hw/usb/hcd-ohci.h
@@ -34,7 +34,9 @@ typedef struct OHCIPort {
     uint32_t ctrl;
 } OHCIPort;
 
-typedef struct OHCIState {
+typedef struct OHCIState OHCIState;
+
+struct OHCIState {
     USBBus bus;
     qemu_irq irq;
     MemoryRegion mem;
@@ -90,8 +92,8 @@ typedef struct OHCIState {
     uint32_t async_td;
     bool async_complete;
 
-    void (*ohci_die)(struct OHCIState *ohci);
-} OHCIState;
+    void (*ohci_die)(OHCIState *ohci);
+};
 
 #define TYPE_SYSBUS_OHCI "sysbus-ohci"
 OBJECT_DECLARE_SIMPLE_TYPE(OHCISysBusState, SYSBUS_OHCI)
@@ -113,7 +115,7 @@ extern const VMStateDescription vmstate_ohci_state;
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


