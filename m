Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6432E65EECD
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:34:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJH-0002qX-CU; Thu, 05 Jan 2023 09:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJ8-0002kz-Hi; Thu, 05 Jan 2023 09:33:26 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJ4-0006xI-FP; Thu, 05 Jan 2023 09:33:23 -0500
Received: by mail-wr1-x432.google.com with SMTP id az7so11916074wrb.5;
 Thu, 05 Jan 2023 06:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/stOBuXzPq61GBvXikiJZFmsdbNLA8hzR8SMDeaVvE=;
 b=Zq7hi7IndJ4NmCJuscL9M7umWvmAeuFZX6yl104VtkwPJdt+JyKjOVxxM1ZdHFfb3Z
 D/hnUoOWhroRDMqbJm+Kr719hVlNQ8Y7NbGx9qiOicYjdAm8Ma2xWOLU5f1Ik5jWUpcL
 C04mXCXJ4zzvWqBTvf5UWRT7QXBAmB2E9gUQzWUEInUwqEIRaWsxLkkyMvbNA72xxsVd
 XhXZhHM4MCtyBVs8UX1qoicfE4EuduSSA1rwK+WipYWV4QgJKZQDmbXcJoDkBh63Rvz7
 yZJ8Zn4JWzU6DA/pXv2BbCdw6ZS6r4sE3FC1FTtvL0v3SQQylGnSpgvgTqTuOic+/HK5
 A8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/stOBuXzPq61GBvXikiJZFmsdbNLA8hzR8SMDeaVvE=;
 b=jfjoey07ARF0IlVUbtSD92oD8dqD9hrR+bI1oCaWFOXOJXqoTLQEP3Q37mYP3h1++h
 5GsASlMB5d7IIbB7V1p+4Gid7cgphlFoVZobGqH7ew8pT48AFUdxE+DgyzYvgkpv0KjG
 7SBQs+foOrl5RswIR+UbbMnpGce6ax9tqVRdQXJZLfOLIoLXJkNtZE0uG4n74OLleP9v
 EN8ud7RVtLkz/eQH4FrqnLxzf99LMUlKu5kPJo1yY6V7oVxi9YaClMTse/qq18UORATq
 +1hMoNO4x/yvHVAfsAgfFWF/26Q9np8TTf7OVADWgSmFEQrNBozRBIe34NdBtSQvL2LD
 pa3Q==
X-Gm-Message-State: AFqh2kozbFnFoAUgtxb0iOrVQxanYpxaDxWXo/T3em2k9ciRqWb1U14q
 rgWqB05kMIdFkJi3MrjQv2jwvxgRVIJVxw==
X-Google-Smtp-Source: AMrXdXuQsyJpuizROKSy7VeEZrAkQz7wd++Au3xDLMDQD3L8fu1dVhL4Eckp9mboJs8O3XUrFeK9XQ==
X-Received: by 2002:a5d:6283:0:b0:278:806e:e8f8 with SMTP id
 k3-20020a5d6283000000b00278806ee8f8mr24550734wru.42.1672929200353; 
 Thu, 05 Jan 2023 06:33:20 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:20 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v5 13/31] hw/intc/i8259: Introduce i8259 proxy "isa-pic"
Date: Thu,  5 Jan 2023 15:32:10 +0100
Message-Id: <20230105143228.244965-14-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Having an i8259 proxy allows for ISA PICs to be created and wired up in
southbridges. This is especially interesting for PIIX3 for two reasons:
First, the southbridge doesn't need to care about the virtualization
technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
attached) and out-IRQs (which will trigger the IRQs of the respective
virtualization technology) are separated. Second, since the in-IRQs are
populated with fully initialized qemu_irq's, they can already be wired
up inside PIIX3.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/intc/i8259.h | 19 +++++++++++++++++++
 hw/intc/i8259.c         | 27 +++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/include/hw/intc/i8259.h b/include/hw/intc/i8259.h
index a0e34dd990..f666f5ee09 100644
--- a/include/hw/intc/i8259.h
+++ b/include/hw/intc/i8259.h
@@ -1,6 +1,25 @@
 #ifndef HW_I8259_H
 #define HW_I8259_H
 
+#include "qom/object.h"
+#include "hw/isa/isa.h"
+#include "qemu/typedefs.h"
+
+#define TYPE_ISA_PIC "isa-pic"
+OBJECT_DECLARE_SIMPLE_TYPE(ISAPICState, ISA_PIC)
+
+/*
+ * TYPE_ISA_PIC is currently a PIC proxy which allows for interrupt wiring in
+ * a virtualization technology agnostic way. It could be turned into a proper
+ * GPIO-based ISA PIC in the future.
+ */
+struct ISAPICState {
+    DeviceState parent_obj;
+
+    qemu_irq in_irqs[ISA_NUM_IRQS];
+    qemu_irq out_irqs[ISA_NUM_IRQS];
+};
+
 /* i8259.c */
 
 extern PICCommonState *isa_pic;
diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 0261f087b2..e99d02136d 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -455,9 +455,36 @@ static const TypeInfo i8259_info = {
     .class_size = sizeof(PICClass),
 };
 
+static void isapic_set_irq(void *opaque, int irq, int level)
+{
+    ISAPICState *s = opaque;
+
+    qemu_set_irq(s->out_irqs[irq], level);
+}
+
+static void isapic_init(Object *obj)
+{
+    ISAPICState *s = ISA_PIC(obj);
+
+    qdev_init_gpio_in(DEVICE(s), isapic_set_irq, ISA_NUM_IRQS);
+    qdev_init_gpio_out(DEVICE(s), s->out_irqs, ISA_NUM_IRQS);
+
+    for (int i = 0; i < ISA_NUM_IRQS; ++i) {
+        s->in_irqs[i] = qdev_get_gpio_in(DEVICE(s), i);
+    }
+}
+
+static const TypeInfo isapic_info = {
+    .name          = TYPE_ISA_PIC,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(ISAPICState),
+    .instance_init = isapic_init,
+};
+
 static void pic_register_types(void)
 {
     type_register_static(&i8259_info);
+    type_register_static(&isapic_info);
 }
 
 type_init(pic_register_types)
-- 
2.39.0


