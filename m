Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BC3545E2B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:09:31 +0200 (CEST)
Received: from localhost ([::1]:41944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZhw-000741-RL
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWD-0006GX-H8
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWB-0006BY-VI
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ldRwzPF0bs4mAZLHM5QvztMOUvUDJ2ffkwJ5V0o7Rdk=;
 b=dBXAeUSCMaVpBhXJjt9AJ+qyuY6GQM1f6M+zPgDr8b4iLAc75cpH+nWWpd9kEDT7D4dbPd
 +Q177RT6i8sf3ovVVJIPmXeXc84cLAbwslG4LWDiZ1E5m9aDlUmrtdZHU5ahZWsveg1lGw
 xIHa8eaIkE+eQKW72b4XXJtH5c+skp0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-bMaBW4qFM6OFCL3t31rrvQ-1; Fri, 10 Jun 2022 03:57:17 -0400
X-MC-Unique: bMaBW4qFM6OFCL3t31rrvQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 r13-20020adff10d000000b002160e9d64f8so4473509wro.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ldRwzPF0bs4mAZLHM5QvztMOUvUDJ2ffkwJ5V0o7Rdk=;
 b=5hBjCV93TEo1CJsPlxT0gmMlEr/F+9/NC4Twk/i8Bs4uJ1cGBptH2st/T6oUlUKC/u
 fJycr8kKq3fRwiyk58a2ANwgQiYYeh+aDG/DQQvsQeWVUWEP7EsXBjYkiR5VC44OxLD4
 AFUYZ6tTHYL+iTkgox98eTuA4RODCiDaCe7zm8s8sIzxsPnBW28XnexycTjuXoy4eWPk
 LZCa476ptUNevvNIhoxiBI1WUZuG47NAameglccuyMV55yFBHcpa/+EXIo0SLUwYJb5W
 8K7wg0aF7fBSRVdNNOX3ZEHPpsNLflUspj0jjvbkqFdVyZRfbIL5eai+zaZ+0ty/6PnZ
 V/tA==
X-Gm-Message-State: AOAM530zW3oZbdIRYBhrRtu0WUVrAdeCm7x5H0lT9ZbFTf8NEkXAqCeP
 cQFLdX8wsLZ4238bcyxzbCcfbngb51cdlyvqxdDM9C3xIpXTg8mqKe8ft1Knqj7EN/ultRmgXZf
 E5BRJ3eVCa5IPKFbSlzYKJ2Ic0AMKUE9sBZ06Xe1/czQNDs7jezninp2Vge2A
X-Received: by 2002:a05:600c:25cd:b0:39c:6bc0:a1fb with SMTP id
 13-20020a05600c25cd00b0039c6bc0a1fbmr7495737wml.179.1654847836021; 
 Fri, 10 Jun 2022 00:57:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYzrGeoD/ag+7ybBFRktt08892rOAnJeC0m6doxsbpD4NUVONPlVkvS9wW3w4d4thUGWsb4A==
X-Received: by 2002:a05:600c:25cd:b0:39c:6bc0:a1fb with SMTP id
 13-20020a05600c25cd00b0039c6bc0a1fbmr7495714wml.179.1654847835745; 
 Fri, 10 Jun 2022 00:57:15 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 d11-20020adffbcb000000b002183ee5c0c5sm14174618wrs.50.2022.06.10.00.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:15 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: [PULL 04/54] acpi: parallel port: replace ISADeviceClass::build_aml
 with AcpiDevAmlIfClass:build_dev_aml
Message-ID: <20220610075631.367501-5-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-5-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/char/parallel.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index f735a6cd7f..1c9ca47820 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -28,7 +28,7 @@
 #include "qemu/module.h"
 #include "chardev/char-parallel.h"
 #include "chardev/char-fe.h"
-#include "hw/acpi/aml-build.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
@@ -570,9 +570,9 @@ static void parallel_isa_realizefn(DeviceState *dev, Error **errp)
                              s, "parallel");
 }
 
-static void parallel_isa_build_aml(ISADevice *isadev, Aml *scope)
+static void parallel_isa_build_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
-    ISAParallelState *isa = ISA_PARALLEL(isadev);
+    ISAParallelState *isa = ISA_PARALLEL(adev);
     Aml *dev;
     Aml *crs;
 
@@ -645,11 +645,11 @@ static Property parallel_isa_properties[] = {
 static void parallel_isa_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     dc->realize = parallel_isa_realizefn;
     dc->vmsd = &vmstate_parallel_isa;
-    isa->build_aml = parallel_isa_build_aml;
+    adevc->build_dev_aml = parallel_isa_build_aml;
     device_class_set_props(dc, parallel_isa_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
@@ -659,6 +659,10 @@ static const TypeInfo parallel_isa_info = {
     .parent        = TYPE_ISA_DEVICE,
     .instance_size = sizeof(ISAParallelState),
     .class_init    = parallel_isa_class_initfn,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_ACPI_DEV_AML_IF },
+        { },
+    },
 };
 
 static void parallel_register_types(void)
-- 
MST


