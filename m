Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D0B692385
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:40:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWPT-0000Oi-Ia; Fri, 10 Feb 2023 11:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPK-0000OO-9E
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:37:54 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPI-00008K-G7
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:37:53 -0500
Received: by mail-wm1-x335.google.com with SMTP id o36so4249824wms.1
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9wz1BonRBA4qQZKRmLhECiyYteaw1n0xGhljex2JkKU=;
 b=iNaBr1JtiKBuEPP9K33XyQEly/Bh6gg3B0lqoU27fmR9rHb2x0926RKsHnI8dWPFRY
 ZsySQhqZraW52yu7HCr2uDMeC4vHD+sMEH4cFtDR2qCf1mwAwHhwHPAj9meLzqiMdOdo
 4nUDdwxyUWmZS0JWMDCP5C0It0PT+xtxH5gtGnvCMzgVS4T6oWafkIY0xx2CGEo9j9pW
 E5NgLOGLFMe//W5kyfIWifdk5JI112fqJPmiMBMAFBDQSbA+dK7NFHIf8l8WRKGU9Mdb
 L/T6TGGNLND0T8koDv1Z0TSHcoEIpWgjOJ+0HgV4BkmWe4lek/6dTS5oC81c12zoE/fH
 bhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9wz1BonRBA4qQZKRmLhECiyYteaw1n0xGhljex2JkKU=;
 b=7i8JoKZN08w51AcFGfBnofrskCHeoAjD+Tcqx+s8aRB8DnZRGkHndPEG/mIjnZYF3R
 INphokFIz1Kj24y9W4jwNTitWKDTK7LNv+wjHgGcQnct8bfU7kiuwrHf1r7MGqdUyR2O
 wHEHTujwvsWOtalkQ3yJpud/DC7A2r6lFxxN2n58wAAnJFczveBLmZAgf/P5+z7ZzTMd
 6ULNHa3CGiXkvvz9RRUAvm6PNfb9X/2TZa6bWG+WHhSO8wYYTKgZjlmSKALwKTBZlaRx
 SxTsUXxIVnd0Kq+s9imOC3rLyOFkKmcppFMDIQ4p5hGFrX0nx/m1hN8P4yrvPvemy/DD
 HlCQ==
X-Gm-Message-State: AO0yUKWhot7TGKOkwwLsAqFMJMGMoxXes096kqBwmDNff/pICC6AuF4H
 11253h9WvdwOTeoRRhJa6/sa9VD/JI+7DvIJ
X-Google-Smtp-Source: AK7set8svLAEe0K82s5i/+b2Oldxnb9NR1kM+cDADv8a6EZLVgmDRVwe0QSG7cGIC2ixLD2UK4XN9w==
X-Received: by 2002:a05:600c:3420:b0:3dc:4548:abe6 with SMTP id
 y32-20020a05600c342000b003dc4548abe6mr13354159wmp.12.1676047071696; 
 Fri, 10 Feb 2023 08:37:51 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c3b9300b003daf7721bb3sm9399325wms.12.2023.02.10.08.37.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 08:37:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 01/11] hw/intc/i8259: Document i8259_init()
Date: Fri, 10 Feb 2023 17:37:34 +0100
Message-Id: <20230210163744.32182-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230210163744.32182-1-philmd@linaro.org>
References: <20230210163744.32182-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

i8259_init() helper creates a i8259 device on an ISA bus,
connects its IRQ output to the parent's input IRQ, and
returns an array of 16 ISA input IRQs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/i8259.c         |  4 ++--
 include/hw/intc/i8259.h | 10 +++++++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 0261f087b2..17910f3bcb 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -406,7 +406,7 @@ static void pic_realize(DeviceState *dev, Error **errp)
     pc->parent_realize(dev, errp);
 }
 
-qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq)
+qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq_in)
 {
     qemu_irq *irq_set;
     DeviceState *dev;
@@ -418,7 +418,7 @@ qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq)
     isadev = i8259_init_chip(TYPE_I8259, bus, true);
     dev = DEVICE(isadev);
 
-    qdev_connect_gpio_out(dev, 0, parent_irq);
+    qdev_connect_gpio_out(dev, 0, parent_irq_in);
     for (i = 0 ; i < 8; i++) {
         irq_set[i] = qdev_get_gpio_in(dev, i);
     }
diff --git a/include/hw/intc/i8259.h b/include/hw/intc/i8259.h
index a0e34dd990..c412575775 100644
--- a/include/hw/intc/i8259.h
+++ b/include/hw/intc/i8259.h
@@ -4,7 +4,15 @@
 /* i8259.c */
 
 extern PICCommonState *isa_pic;
-qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq);
+
+/*
+ * i8259_init()
+ *
+ * Create a i8259 device on an ISA @bus,
+ * connect its output to @parent_irq_in,
+ * return an (allocated) array of 16 input IRQs.
+ */
+qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq_in);
 qemu_irq *kvm_i8259_init(ISABus *bus);
 int pic_get_output(PICCommonState *s);
 int pic_read_irq(PICCommonState *s);
-- 
2.38.1


