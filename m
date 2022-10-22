Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A251360969C
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 23:50:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omh5F-0004oC-50
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 15:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG51-00079s-6p; Sat, 22 Oct 2022 11:06:31 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4z-00022R-MN; Sat, 22 Oct 2022 11:06:30 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z97so16070692ede.8;
 Sat, 22 Oct 2022 08:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i+AebeFOfesGzGmerljH4b4Mq6WvaWrxPBHXjbT4N00=;
 b=KN1c35O719IAcStT6PnLYlv1Wv3CJggvhDtD9OCNXo1/iwXxLYAY8v8Sov+snUrKlg
 bREXZz80f7BLRJd4l2YWW56jToi/os3T6vTcRNNXh3P0OMcqLTvLS5Rbo/Zj72c6daQZ
 vkVYYadq/mQMqoEHxa/Uw5spb1Z0tDTz0yfo+HGfgo9RriG6WqfCcP7Ipq9usvLFpiTd
 iKrDJrOqvPCUUWhgdvBp4x4dX11OvbhZwt2SOUYV/Enaa0rjwLazegw+KGnPDXI9macV
 qoounF3e/zp96lJ5wonufGXbujUN99XwAZDjYvVzg3vVmcp8xrA+hq3Rpl1IAI/A4H4Q
 0cEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i+AebeFOfesGzGmerljH4b4Mq6WvaWrxPBHXjbT4N00=;
 b=rapf8LNXNAsHz/Hg/bs3/0qBUNkfjXoDcI4d/+B5oJD+meuCNckOm/ll8WiTMzAN6K
 9BD2ToNahSJdJxOB+59BbKBJ/Lhgzz/SyiUS8+dPyQroVW/sv5y+AJHLBcdfOgOeKJk+
 gAO7Ic4OzEB5tYHsIEmE5KZk5MZjFBzOxzvtqONFzR26nnbbBp4Tbsyo8FGx/l8A7wth
 kaa4Cuew9vHMrwY1xJgItHeTaXsrpqjyT3kINl+r/fylnoMnA/+0GMNK/hHgJiw7Br2X
 gbmazbNPt8v70xAbJ0d+XhQngmbOncxJ+kqgdncor3TBmQh0+BuKD/7PBC+IFe0WDBJB
 caZg==
X-Gm-Message-State: ACrzQf1cLiFlJIXzo9dYPAs2NizeuITa0n6DjukRUEosV+89ZOPL5Vpz
 hBR22SEn+7QADaHEuiGHlgyoyPBptAk9Jg==
X-Google-Smtp-Source: AMsMyM69OCLk2cUh1llsIYpD6y1w3KZ/6Que7iNjju0UECnO7ZZGNq40oz5bqLG0P5fvCwEkVYKmuA==
X-Received: by 2002:a17:907:7ba8:b0:78e:1b38:6b1b with SMTP id
 ne40-20020a1709077ba800b0078e1b386b1bmr19646684ejc.626.1666451188346; 
 Sat, 22 Oct 2022 08:06:28 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:26 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 14/43] hw/intc/i8259: Introduce i8259 proxy "isa-pic"
Date: Sat, 22 Oct 2022 17:04:39 +0200
Message-Id: <20221022150508.26830-15-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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
2.38.1


