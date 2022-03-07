Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BB44D0072
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:50:56 +0100 (CET)
Received: from localhost ([::1]:53940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDlH-0003Yj-Nu
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:50:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDfS-0005fX-5B
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:44:55 -0500
Received: from [2607:f8b0:4864:20::102f] (port=51042
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDfQ-0006vk-Kh
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:44:53 -0500
Received: by mail-pj1-x102f.google.com with SMTP id m22so13573812pja.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BGq1NvCPKkPo6oZnX28wU6tvhaY2hUXR54Kp2JjpCz4=;
 b=CD3P7NRZMK1ZfZp7nReIhBhlCFWzJH2ARnGh6kDBJJbp3Lz4a2M4iTKNEXJv+N2d87
 SEH3nNX1QTicxmHeNmBBIKy8aVR8IUVA/PIzFEP4w7jpicIIXo1YT7mN5M4KRZwDPVMY
 7DOPCz3JPvWb8+R2MGJuI5SewXEzGC9uQeI8MhTk7NYRESUJQS+suLtKBF0mLg06jF2A
 jto/1Lp0s/Vp12U9CSrxfvWN4F41mmaJSzIfOWybPnN0OyVjIzIjFk0QkJbVuevPYaJo
 0EdavO8PY28+SaO5eCQ3El95YW/F466PT+tYX8TT7/8oLzN4IT4sbKdpWUqAPo2jH1zG
 ONqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BGq1NvCPKkPo6oZnX28wU6tvhaY2hUXR54Kp2JjpCz4=;
 b=Ts5Oou+irRfzB0UNOXKjh1WMywy1y86T3cTlf6OJzIVbcDQmS845Qchq/dxmoMCkUF
 TdIRkqdQ745PnLGrc0a1vsGU8rs/mS0MEsqWo9MDD8fxIkFEwx68Ft1KiHRGMsGA80sk
 46W/g46U/fl5boqllTbE222O9FQzlPDJ07zBQnjWqTdcsua3LpfG8vkDVZNKRhXcU3+T
 qLibIBYJz+ObKlDfKBf49RUiV1s+AmyJENNw2jiPd0SqyE0CkdkN4QnJRvbXMtHFp88/
 LHj37aCQZIFx+/jK5Rx6NouhW0e6jl28vzxNcxuawsliuT+zx/nqXZiHHJMyP02/Ycg6
 hhMg==
X-Gm-Message-State: AOAM5325MctxlNd54ySdGfA1CDp2rRcijHOVaUcoeXd/unB6Wx4u97Qh
 oJs8kGnf3IlvHTT3Aef3psU=
X-Google-Smtp-Source: ABdhPJw31ojzcZaOIkJ+pD9iQa2YbRUusqso8yRqQCesHl6xTBkSHXGbspSfBVqrJ93W7xYG2iwN6w==
X-Received: by 2002:a17:902:ea07:b0:151:d3d1:e436 with SMTP id
 s7-20020a170902ea0700b00151d3d1e436mr10345474plg.149.1646660691365; 
 Mon, 07 Mar 2022 05:44:51 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a056a001d9700b004f6d2974269sm8601820pfw.113.2022.03.07.05.44.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 05:44:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 06/13] hw/isa/piix4: Replace some magic IRQ constants
Date: Mon,  7 Mar 2022 14:43:46 +0100
Message-Id: <20220307134353.1950-7-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

This is a follow-up on patch "malta: Move PCI interrupt handling from
gt64xxx_pci to piix4". gt64xxx_pci used magic constants, and probably
didn't want to use piix4-specific constants. Now that the interrupt
handing resides in piix4, its constants can be used.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220217101924.15347-7-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 2e9b5ccada..f876c71750 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -61,10 +61,10 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
     /* now we change the pic irq level according to the piix irq mappings */
     /* XXX: optimize */
     pic_irq = s->dev.config[PIIX_PIRQCA + irq_num];
-    if (pic_irq < 16) {
+    if (pic_irq < ISA_NUM_IRQS) {
         /* The pic level is the logical OR of all the PCI irqs mapped to it. */
         pic_level = 0;
-        for (i = 0; i < 4; i++) {
+        for (i = 0; i < PIIX_NUM_PIRQS; i++) {
             if (pic_irq == s->dev.config[PIIX_PIRQCA + i]) {
                 pic_level |= pci_bus_get_irq_level(bus, i);
             }
@@ -315,7 +315,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, 4);
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
 
     return dev;
 }
-- 
2.34.1


