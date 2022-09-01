Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9805A9D40
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:40:21 +0200 (CEST)
Received: from localhost ([::1]:47230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnEr-0002jv-0f
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1t-0001dg-MF
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:57 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1r-0001UA-GK
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:57 -0400
Received: by mail-ed1-x536.google.com with SMTP id y64so11483270ede.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=0UgxRY4zs21dPnV/5AAWw3l/1fjvsvpFDVmZoNt0DnA=;
 b=OHVNzll2ud7S30MGh4ZAWfznUa0BVPHQzcCHGtlZi0BRpKWcvlg9dctRMN16QEIwLN
 MGwxfXxzOKM6j7ZqZUuKHaEg/qRC6cYPq6cYxAUn0Y/8gasZd2GCsutWObhi3qW9Dz1U
 PT+Gxvt9oJo98bzuSHssAXY5Z3KA+z57yOxwxJdafAJ2BW1RfPHPcBJDzHwlg16VAKkq
 AFfYlaoX+A1WMM9+yKqHbRnYIFk3cw66ZzicQmYyqnOy+PdfZYOnijs/yHI5wRjjyqNj
 kE97vUXgJ7uZb0w6KdZFPhxFsJ2Ww/S2mtb1bpTrW+X7X76qiBNUilePT2PqXqdIJFeJ
 L1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0UgxRY4zs21dPnV/5AAWw3l/1fjvsvpFDVmZoNt0DnA=;
 b=pA0/Y19BwZo2xcWjDRtq3OyKbu4zxPGOGM3W2RMlMsxpOv+IqL9oj9rcl83FcS19LJ
 dhUvAk62HnJAu6xsUGnLhMpCsOLC4zMRMDjD2etTfx04o3pnIGKoz9o8HbjN1oB2GQOK
 mufa0YRde4ivARWAALcq/5uzojwZzsR86gywKXA/B5Lo/+NahhWa7QM9kN1KR0tyTaHv
 NG8aDk5aTLzkt8CIhp35NLStCjMa3rm+0nucrQS1ugEhDymH3Uijts16NEhdIUMMUHFd
 sW43Z5jpUDzjUkXpiUXRT23C1QbvEbPnKiyV6FchOJMsS+II4x8n/zyUcjm1APpiBiL2
 /fIw==
X-Gm-Message-State: ACgBeo0PXb008vtpYUYnlpXVyDTg0KRVgxCjekTH4uYjh9pAfXA7tFvq
 oiDxztwhZc54w/GpYjOO9YROw4h2rDw=
X-Google-Smtp-Source: AA6agR7k7FM35sYp04wpSjOieWB01F5KUNpHq5C7iWPjOJBm5jmRSmc7YyvTBwDmP3+dvOr+kpqcfg==
X-Received: by 2002:a05:6402:454:b0:447:59a8:fc7d with SMTP id
 p20-20020a056402045400b0044759a8fc7dmr30230336edw.68.1662049613913; 
 Thu, 01 Sep 2022 09:26:53 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:26:53 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 07/42] hw/intc/i8259: Introduce i8259 proxy "isa-pic"
Date: Thu,  1 Sep 2022 18:25:38 +0200
Message-Id: <20220901162613.6939-8-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Having an i8259 proxy allows for ISA PICs to be created and wired up in
southbridges. This is especially interesting for PIIX3 for two reasons:
First, the southbridge doesn't need to care about the virtualization
technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
attached) and out-IRQs (which will trigger the IRQs of the respective
virtzalization technology) are separated. Second, since the in-IRQs are
populated with fully initialized qemu_irq's, they can already be wired
up inside PIIX3.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/intc/i8259.c         | 27 +++++++++++++++++++++++++++
 include/hw/intc/i8259.h | 14 ++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index cc4e21ffec..531f6cca53 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -458,9 +458,36 @@ static const TypeInfo i8259_info = {
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
+    .parent        = TYPE_ISA_DEVICE,
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
diff --git a/include/hw/intc/i8259.h b/include/hw/intc/i8259.h
index e2b1e8c59a..0246ab6ac6 100644
--- a/include/hw/intc/i8259.h
+++ b/include/hw/intc/i8259.h
@@ -1,6 +1,20 @@
 #ifndef HW_I8259_H
 #define HW_I8259_H
 
+#include "qom/object.h"
+#include "hw/isa/isa.h"
+#include "qemu/typedefs.h"
+
+#define TYPE_ISA_PIC "isa-pic"
+OBJECT_DECLARE_SIMPLE_TYPE(ISAPICState, ISA_PIC)
+
+struct ISAPICState {
+    ISADevice parent_obj;
+
+    qemu_irq in_irqs[ISA_NUM_IRQS];
+    qemu_irq out_irqs[ISA_NUM_IRQS];
+};
+
 /* i8259.c */
 
 extern DeviceState *isa_pic;
-- 
2.37.3


