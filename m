Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A6F693EB7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSwz-0000Fx-5Y; Mon, 13 Feb 2023 02:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSww-0000Cd-81
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:08:30 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSwu-0001jR-FX
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:08:29 -0500
Received: by mail-wm1-x329.google.com with SMTP id z13so8014047wmp.2
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nx8Xgm2tW9Gq4Bio8ruD+Zbqqbx7fjg7obd5raLzp9c=;
 b=mQmWMD6nLEGl+tqcC2mzyPGVismArp6f8JBrlVjmZWjwKkvX6bdJpH0gHuocV8Bro6
 YgfZOec60Wmm/TFIQ7rALZTa0dsYQsUWK0A8h7rDxQtYNVbRMBv84DaMfwUo8obAc7oJ
 mk1D/uHS7cy8VkVDayZ1UPbjlWOFwXKHG3uEdqSyy9kZ9TmPFXW/vwGX1pClILc63loW
 +N+yTL6AcrmhM/hLuDxH4J+QglS0FQcCyZ1NWjVnI8YAMmL7mSiIuV+wNRjGi1XqOBG2
 KFhUBpUJ2VaGjW3IpzFeVJgb7kyXllV0yv3IZ+2IRvbt+krjZQYqKZNEKp6J/OtfPcDc
 mgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nx8Xgm2tW9Gq4Bio8ruD+Zbqqbx7fjg7obd5raLzp9c=;
 b=K1u4vKslnQnRfvjyVDUYXg8dbIa6PXec4T4K1vv/lWSByFKbnt0A721AizbePNo6Il
 qBwulK/Uob3aPw3VTzmYMgi/5/FXjx5tvs3H1d4wfeQ8zL0PlUcBWiURlskdN11VIPpF
 5w/0zX5chlzsUQfdg63EYo4aL8MTsae1KMkr6cr2kZGY+odQdcVPH3CKGGIUWjiERSj+
 zasKZQtJa3o6p0COmSIlHQCprvGqT/79XXqTDdwGUBu6FrPfvBHQvMIIsl6UXbWX4XB6
 OKweyYM+pQLDnMjuzN5y95/f4M5syitgNJNieAD6fSyfc47YKr3iyceMz2qfHwrpobtu
 5bEQ==
X-Gm-Message-State: AO0yUKUno931Oqq3vh7DSBmRdmSkpq1UnM9Wx3CAS9vXPKHdd3z7eoEz
 ZDcaOj2HvVS6FWjz2LEvNFZ04MUv1sA21WdW
X-Google-Smtp-Source: AK7set8dsPgxodbEKime5PsmFMLsgORd1RtjbN2eS6SXBtB78gk8Vab/uyasZeumrSyGGTJd+05/KQ==
X-Received: by 2002:a05:600c:4b1b:b0:3dc:53da:328b with SMTP id
 i27-20020a05600c4b1b00b003dc53da328bmr21988012wmp.14.1676272107534; 
 Sun, 12 Feb 2023 23:08:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a05600c1f0600b003e0015c8618sm16346624wmb.6.2023.02.12.23.08.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:08:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 01/19] hw/char/serial-pci: Replace
 DO_UPCAST(PCISerialState) by PCI_SERIAL()
Date: Mon, 13 Feb 2023 08:08:02 +0100
Message-Id: <20230213070820.76881-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070820.76881-1-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Use the PCI_SERIAL() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/serial-pci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index 801b769aba..9689645cac 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -36,7 +36,10 @@
 #include "qom/object.h"
 
 struct PCISerialState {
+    /*< private >*/
     PCIDevice dev;
+    /*< public >*/
+
     SerialState state;
     uint8_t prog_if;
 };
@@ -46,7 +49,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCISerialState, PCI_SERIAL)
 
 static void serial_pci_realize(PCIDevice *dev, Error **errp)
 {
-    PCISerialState *pci = DO_UPCAST(PCISerialState, dev, dev);
+    PCISerialState *pci = PCI_SERIAL(dev);
     SerialState *s = &pci->state;
 
     if (!qdev_realize(DEVICE(s), NULL, errp)) {
@@ -63,7 +66,7 @@ static void serial_pci_realize(PCIDevice *dev, Error **errp)
 
 static void serial_pci_exit(PCIDevice *dev)
 {
-    PCISerialState *pci = DO_UPCAST(PCISerialState, dev, dev);
+    PCISerialState *pci = PCI_SERIAL(dev);
     SerialState *s = &pci->state;
 
     qdev_unrealize(DEVICE(s));
-- 
2.38.1


