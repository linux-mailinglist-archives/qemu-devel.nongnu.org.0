Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E79E6A442E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:20:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe8x-0005Wv-Do; Mon, 27 Feb 2023 09:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8v-0005PN-Ll
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:17 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8r-0008V9-Sp
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:15 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso2606323wmq.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f5yKWrXeohH1uxONlv1fkqGC/gbeXOjcvaKLR6Gd1Wk=;
 b=CnJp5+4Ii011Ume+8cj4f1dtd+ngX3f5pY67TUfYk7Zvh2mWs5CFkOyNeYgh7zFoUg
 itdO3D5SNfaf4nAKjL9+Sao/f9+RHaj1giDVRaGhVTseaOCtKBvynKoETlrS8gcazh8h
 oKV6X8/b4A80Js9VMj9i9cuah9o46nKpltRVBvNutgSd4grqS/0H/Zu61dAufPf0DRaC
 ru9iBJgvohrCd03ZBTnP5qRO/vN5VfVcbWE7Q1kXy0zYek6vjf0W7UFsjXoWERzbtBJR
 AVWQhmsOl0IR8QB5ShS3IAsN6gchp0TmzBkLnrt36O2N89PwgBYO39n9h5xKjQQzH6kU
 43Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f5yKWrXeohH1uxONlv1fkqGC/gbeXOjcvaKLR6Gd1Wk=;
 b=OGLLBIoiI4gOj+29WfuCyW+kKtl+cWublota65Bjz/cD0fiTo0ba8Gl5e0rikVmSHl
 GOxRc2puW1YS5k14C5tyF5LA93lzVMqkyxOGdTMT3Sdesn3mgqQp9jn2/VvVz5reHhbZ
 JcRDa7oKfl/ugs2rv73ph3HgNsX+NfMCtbO25o2xklr/5O2eqzoq/BbQGi+ULNR1WbhX
 7pRzJN2EhHHT9MRgGXTGnP+gByfMbU40N1R/e3GzUuiEiDpUsKK5dxWmnQ6d7GnWfTr6
 /zpeL0XuX993rf4R7du+o3fU9SEgEG0fyuM0i7mJIpbdKKeRTZny5CF4+VI+hK3PQz4r
 QWlA==
X-Gm-Message-State: AO0yUKXmrRF+c9tthR/8TWDfGPIm1Mighnv/5MlS8Alcf65tqspB93Uu
 htL2jGWj83YdjHa1LbioTIdUQhe8TBMAIOn/
X-Google-Smtp-Source: AK7set/Ef+ee8iMJcPTkmhXjhT0lArez55IyvxXUEw/TcpgQpTsIJlC/9h7YEqk/NvKpWkUs30hsmA==
X-Received: by 2002:a05:600c:3413:b0:3eb:2de9:d01 with SMTP id
 y19-20020a05600c341300b003eb2de90d01mr7415997wmp.18.1677506772902; 
 Mon, 27 Feb 2023 06:06:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c510600b003e20a6fd604sm9920636wms.4.2023.02.27.06.06.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:06:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 053/126] hw/intc/i8259: Document i8259_init()
Date: Mon, 27 Feb 2023 15:01:00 +0100
Message-Id: <20230227140213.35084-44-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230210163744.32182-2-philmd@linaro.org>
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


