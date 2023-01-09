Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCDE662CF3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvtX-0002dX-FO; Mon, 09 Jan 2023 12:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtU-0002aO-B6; Mon, 09 Jan 2023 12:25:08 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtS-00018g-Dx; Mon, 09 Jan 2023 12:25:08 -0500
Received: by mail-ej1-x636.google.com with SMTP id tz12so21912191ejc.9;
 Mon, 09 Jan 2023 09:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mgtdEHCrqZkKeHSwNr7rmdJndX3/1+NtuZOqm1NlxBM=;
 b=edWXly4/xlZUFJQS3XM2sjm+nkuogrWXzLJyJVv7bxCRTz8rH44ScwLV3NAX7m+XtD
 N1fEHOXosf5kPhd9mG02yyVBzsAhTC+HvPOBs211O7Tk4vzwT1VEGCEVcPRHb7U92VCo
 pyXCKVN2yzxei7wB9McFAi+C5UuDI+Z54+GWZdYl4I8ciFiLpApzdQBNNYuBUbYzzkBn
 NnhDMtzE9MRbNO62a60yiNRD73deyW7z6hX6hkxFR303AeWZWLAdFN3GegJI3I4nX50N
 0juiWDwIuyN9a0xowe8ER9WBF2JQg8bqZ1FSwCBnurQCOc2BDDo2rMoz1nQjAP8Gz9Fk
 XbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mgtdEHCrqZkKeHSwNr7rmdJndX3/1+NtuZOqm1NlxBM=;
 b=ke1Wqjs+mrbNBLj9Z8S6FSJ0wT6LnNlKvSXsohZr1+yjU1MuLJk6wCRrkttdZkwM73
 VPZ6r5BQD3ORGM0dJvkE10YiHDqRxuTkmauepW1C3BSlCTUYeA6O9dBLZfNSQwvwSAJG
 YlYJs9DK3SdOvHwp4WzxGjcTnzpJKCsUixyh3iY850OuQy4ER0sS3NQuesBo6OmCIsJH
 w/6hi0Bb19Xiq9FG+kifzJBSG483pBF01QXYkveON3mlcSffF2OiqI0bgCl5kCu52QUK
 0mtJc9JVE+Js7f6whKpO/PCO5JnKNmOXuwh3FIvS4seQgk3oTXROMhXxGtODp8JaEpic
 bH9A==
X-Gm-Message-State: AFqh2kqVkfqKCQcN7rVWZAsrgxgK3D21uQVRdmvKNsm/jK6mNgiJe/Wu
 MlY3oSFdrVSHy6k4fLuxU+/WcTE9nokWRQ==
X-Google-Smtp-Source: AMrXdXuic62Aiz+DnbbQwGcWL39rL9552xZ9eoepxTQgvf8CDpJeJQSKWGBp/Jyk+cyG1zYm4htx/Q==
X-Received: by 2002:a17:907:d50d:b0:801:d6f2:754 with SMTP id
 wb13-20020a170907d50d00b00801d6f20754mr57240208ejc.52.1673285103344; 
 Mon, 09 Jan 2023 09:25:03 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:02 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v6 10/33] hw/intc/i8259: Introduce i8259 proxy TYPE_ISA_PIC
Date: Mon,  9 Jan 2023 18:23:23 +0100
Message-Id: <20230109172347.1830-11-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 include/hw/intc/i8259.h | 18 ++++++++++++++++++
 hw/intc/i8259.c         | 27 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/hw/intc/i8259.h b/include/hw/intc/i8259.h
index a0e34dd990..7fb403971c 100644
--- a/include/hw/intc/i8259.h
+++ b/include/hw/intc/i8259.h
@@ -1,6 +1,24 @@
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
+ * a virtualization technology agnostic way.
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


