Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E36057315A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:42:04 +0200 (CEST)
Received: from localhost ([::1]:36032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBXwY-0008H6-9X
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZc-0005f9-0Z
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:24 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:34785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZa-0004ou-EC
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:19 -0400
Received: by mail-ed1-x532.google.com with SMTP id x91so13122298ede.1
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 01:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GM3i7hDr0iR12BzyCLMDFl98+x3kcFBP+2C5xtKOuT8=;
 b=ihLXEit6rqx4lSO/NBPDpX1jgwmVDY2rhtWMhJ69KIjr6YXEEni6Tn8OTUndQQifnY
 MfjMqJoRghif7RodT5VIasKlkC/x5UYE/d9ABSG2G6hPpcKtEvZbvsXVbqGnm8ggeLVf
 J6Ks+geGqtKcue1EhPsIsnLikpjFmkTCUTcUthObUUq5YL+8M/sLJkzRLb1yWhxFuCUp
 EfBSvJIlycteeeZAz9l6s5ZmUwArz7UOVdFLeeWOoecSXimHz0psC6whJJI25Lfsj3nn
 HBmC9+qjQHvqdTBz623nPXRWHqmQ+3r0W/QIRJameQQZCCmwpD0UEASLbFgE1GJ7Gh5Z
 Gmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GM3i7hDr0iR12BzyCLMDFl98+x3kcFBP+2C5xtKOuT8=;
 b=XnDBZX2jSxmddpIdeiYZaMwIxDqrOfuA+s3Q3rs9Ucx6paPTuC+n5v/XWeRx1E9t+o
 fbyEjZkz2Vi8Ic2FoAGD1gd0hCAlkiJsnrY2ixpSH7X8FPz1yQkdLWQztA5SkLp17x3D
 mu/Pskhh/APxnVsBP0RHkbvA5jIMf8ZkDEbaySTmnrq5wJEDAjI3B0CJodY1nDCcx5gs
 v0TzPmDEqdEPKhsKxy+3y78m4uhImAGpDRUv9J0h49xoFossuPYS9V56qCAo6/t+kZRY
 vaU/w+1MxAxs1j92i5ULjYIPtkv3qHrHu5FTFQofs30am//OFFtqXHUycum4aIxWROHO
 5Lcw==
X-Gm-Message-State: AJIora8XkX9pIONOBnIrnuyOImgDYHXjbTHo8Drd2Sq7BkJTcQygwAOF
 DEYlq0Rx5LAcd/7QLgagHbzeKCirp/E=
X-Google-Smtp-Source: AGRyM1vmsuSep28aQPVUuFePL8RMoPMou1njCTFqf2M/jXvrFfc6bsDFnHb+FVcDJZS3nYvHDzVNdw==
X-Received: by 2002:aa7:cdcd:0:b0:43a:31e:114 with SMTP id
 h13-20020aa7cdcd000000b0043a031e0114mr3141455edw.231.1657700296807; 
 Wed, 13 Jul 2022 01:18:16 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-210-047.77.183.pool.telefonica.de. [77.183.210.47])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa7dccd000000b00435a62d35b5sm7483431edu.45.2022.07.13.01.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:18:16 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 07/11] hw/intc/i8259: Introduce i8259 proxy "isa-pic"
Date: Wed, 13 Jul 2022 10:17:31 +0200
Message-Id: <20220713081735.112016-8-shentey@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220713081735.112016-1-shentey@gmail.com>
References: <20220713081735.112016-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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
2.37.1


