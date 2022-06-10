Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F00545E02
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:00:56 +0200 (CEST)
Received: from localhost ([::1]:33598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZZf-00019X-0c
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZW5-0006BD-IN
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZW2-0006AO-4R
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8bLVep2EYejM+CSte9uhOkNEEH+/TvGtAdS7QoYWadU=;
 b=T9C6YVG447STDptPj/FoyfoB4i34WMGTh2ikR8uLP57lTnNi4TK/8mc6k8Gn3IwpK0hYQ2
 WExYpsvrKcF1UmmnSkrl9e7c4tHror5un8OAOKkt7CO0gEmRnlLnZG+nXbr985+DJYpEJf
 kDVP2zmPfCIMotbHeeCMlraQgftroYU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-OMRpcT8BNcmHeikivTmkHw-1; Fri, 10 Jun 2022 03:57:07 -0400
X-MC-Unique: OMRpcT8BNcmHeikivTmkHw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso9327255wma.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8bLVep2EYejM+CSte9uhOkNEEH+/TvGtAdS7QoYWadU=;
 b=xBD2JPbaBXZ1jqoP9/ZkWUl5xo941liZ2rO2TM30pvlq1ihfDn6yAyutw0RxCy8xhg
 TAH71TnUC5otwUuM/KEsOHG9s1l4Uz7Hdi/7PEkc9KRy0cnNE9zwMLUpO16uKiAFp+oF
 EnboYy4da9a2eaRVuQ5iXupe1wAcM425/dmbOb8Bv2RCq5FUh2fSUFVnjC6l6S+LX5Jz
 CRotOeDEEu914i3eDFgstrtJwXOun+mJRPMR1MZiH+IY9YFv2BtR5I6bBYF96regTUST
 I+VSWwjBWwMaU5AkqggedXX9xEmgFI0RO6U1620y6HUTsL5vkbJB1D8ERYtMkZGpor/4
 Tkag==
X-Gm-Message-State: AOAM533MOt05Asoy6LU67wEa1SjnOtvYPd4BClio8xpVG41sbvaRuwUE
 kZdB2jfoOJZvshYDV1bmN4F4AxvGaRuoFSkHMp0n0Tc1vQF96398Lbox0S4Y6CmO2oP1/ndT4bd
 MmZS7nFmuhKwN+WR/Si/25qYmUgQOBJsaWujV/rfgCvH8IAWdZaiLIdZ5hp+z
X-Received: by 2002:a5d:624e:0:b0:210:a42:f29d with SMTP id
 m14-20020a5d624e000000b002100a42f29dmr41879774wrv.615.1654847825943; 
 Fri, 10 Jun 2022 00:57:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9Asp08y1nTCx9VVow0GXHefMdNRdk9F+ZpvVocsGmGTzGhDqO2sdlZTZNYwKuXOItnnIkWA==
X-Received: by 2002:a5d:624e:0:b0:210:a42:f29d with SMTP id
 m14-20020a5d624e000000b002100a42f29dmr41879733wrv.615.1654847825505; 
 Fri, 10 Jun 2022 00:57:05 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 24-20020a05600c22d800b003973435c517sm2091576wmg.0.2022.06.10.00.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:05 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 01/54] acpi: add interface to build device specific AML
Message-ID: <20220610075631.367501-2-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

There is already ISADeviceClass::build_aml() callback which
builds device specific AML blob for some ISA devices.
To extend the same idea to other devices, add TYPE_ACPI_DEV_AML_IF
Interface that will provide a more generic callback which
will be used not only for ISA but other devices. It will
allow get rid of some data-mining and ad-hoc AML building,
by asking device(s) to generate its own AML blob like it's
done for ISA devices.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi_aml_interface.h | 40 ++++++++++++++++++++++++++++
 hw/acpi/acpi_interface.c             |  8 ++++++
 hw/acpi/meson.build                  |  2 +-
 3 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/acpi/acpi_aml_interface.h

diff --git a/include/hw/acpi/acpi_aml_interface.h b/include/hw/acpi/acpi_aml_interface.h
new file mode 100644
index 0000000000..ab76f0e55d
--- /dev/null
+++ b/include/hw/acpi/acpi_aml_interface.h
@@ -0,0 +1,40 @@
+#ifndef ACPI_AML_INTERFACE_H
+#define ACPI_AML_INTERFACE_H
+
+#include "qom/object.h"
+#include "hw/acpi/aml-build.h"
+
+#define TYPE_ACPI_DEV_AML_IF "acpi-dev-aml-interface"
+typedef struct AcpiDevAmlIfClass AcpiDevAmlIfClass;
+DECLARE_CLASS_CHECKERS(AcpiDevAmlIfClass, ACPI_DEV_AML_IF, TYPE_ACPI_DEV_AML_IF)
+#define ACPI_DEV_AML_IF(obj) \
+     INTERFACE_CHECK(AcpiDevAmlIf, (obj), TYPE_ACPI_DEV_AML_IF)
+
+typedef struct AcpiDevAmlIf AcpiDevAmlIf;
+typedef void (*dev_aml_fn)(AcpiDevAmlIf *adev, Aml *scope);
+
+/**
+ * AcpiDevAmlIfClass:
+ *
+ * build_dev_aml: adds device specific AML blob to provided scope
+ *
+ * Interface is designed for providing generic callback that builds device
+ * specific AML blob.
+ */
+struct AcpiDevAmlIfClass {
+    /* <private> */
+    InterfaceClass parent_class;
+
+    /* <public> */
+    dev_aml_fn build_dev_aml;
+};
+
+static inline void call_dev_aml_func(DeviceState *dev, Aml *scope)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_ACPI_DEV_AML_IF)) {
+        AcpiDevAmlIfClass *klass = ACPI_DEV_AML_IF_GET_CLASS(dev);
+        klass->build_dev_aml(ACPI_DEV_AML_IF(dev), scope);
+    }
+}
+
+#endif
diff --git a/hw/acpi/acpi_interface.c b/hw/acpi/acpi_interface.c
index 6583917b8e..c668d361f6 100644
--- a/hw/acpi/acpi_interface.c
+++ b/hw/acpi/acpi_interface.c
@@ -1,5 +1,6 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/acpi_dev_interface.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "qemu/module.h"
 
 void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event)
@@ -18,8 +19,15 @@ static void register_types(void)
         .parent        = TYPE_INTERFACE,
         .class_size = sizeof(AcpiDeviceIfClass),
     };
+    static const TypeInfo acpi_dev_aml_if_info = {
+        .name          = TYPE_ACPI_DEV_AML_IF,
+        .parent        = TYPE_INTERFACE,
+        .class_size = sizeof(AcpiDevAmlIfClass),
+    };
+
 
     type_register_static(&acpi_dev_if_info);
+    type_register_static(&acpi_dev_aml_if_info);
 }
 
 type_init(register_types)
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index cea2f5f93a..f8c820ca94 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -29,7 +29,7 @@ acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
 if have_tpm
   acpi_ss.add(files('tpm.c'))
 endif
-softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c', 'acpi_interface.c'))
 softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
                                                   'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c',
-- 
MST


