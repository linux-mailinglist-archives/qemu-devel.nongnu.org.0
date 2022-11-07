Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825EA6203D3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:34:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAxx-0003K9-H0; Mon, 07 Nov 2022 17:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxu-0003EU-Rg
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxt-00044E-Az
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h/XlP9KQaz9Sdj8a6OxlbRsUZL7f47hL0wOEmFmZTnk=;
 b=N/qsMaOImk5WEmZqMB2EFUAOlXIFjVUCSu2aIkD1N7xJc30CjAms2901CrvwX6yr8Yi0Ev
 oJmTLAI/i0bGe5leRm7bRm7IhYnPNCj2o89165spHfmaXbDaKSEv4qeEsH5G91zrvLq/Sm
 kdQ8QPTZ5p1hqpcdvmu49IcpdKV4XE8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-231-s0t7DtcXMeWVTy5rgCfT-Q-1; Mon, 07 Nov 2022 17:51:35 -0500
X-MC-Unique: s0t7DtcXMeWVTy5rgCfT-Q-1
Received: by mail-qv1-f69.google.com with SMTP id
 g12-20020a0cfdcc000000b004ad431ceee0so8495436qvs.7
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:51:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/XlP9KQaz9Sdj8a6OxlbRsUZL7f47hL0wOEmFmZTnk=;
 b=AIRUeix89WTWfdgxpexVDTHn/P/4zN7fmO2T+DGqA9OSDVyHoBq/8wzN6YyuWRVpY4
 izkgnyGuHMGwUAgtFubxsBkvwUohBVko0VmroP5LiIVy61CXDQUTmwko0YVRrRpzYhVm
 Lc32uv1+51BmiMNZviRIeShfigFm0B8OCmcy6ZStvH5qiJXvfJBYN4trZ2FTAzUsjZVt
 HZAXgSA34s/GUaxzHq57Kmt43GmQet1/AH2+INXHMgKu3mTCFth6QuwobjJ+XMX3J5zq
 +AOnzo17gXjwjdL5Q7oz/UJOa2iI8OtXe4oj2sAuOY7sBSjFTb4A/kHJuKlu5xYkPM4V
 ULWw==
X-Gm-Message-State: ACrzQf2XWknVsmoS6c5msFphFQFJgIs9QjaDWLSlyA1Y+glj0nN9flu5
 85wXYwGlzTv2rNRYQhS7hG5L/qfIHCKQpQb6ia1pY3hvY9JYwPzwCkYikcQVB1csCNTwT+8/Fry
 eWKdbogD2EgLFd0bM+VKUfws+STUMr3nyVZ/wbLt6ZoiRN6opw1GSiHXyuS6Z
X-Received: by 2002:ae9:e116:0:b0:6fa:30fc:182f with SMTP id
 g22-20020ae9e116000000b006fa30fc182fmr30480555qkm.401.1667861495045; 
 Mon, 07 Nov 2022 14:51:35 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5Aq0ahkPboztGi2KJsX8DllIwkReS3EDGRCm4fXLhxS4lI9hKOt6d2SOs6Tp+0ubZWTK5z4A==
X-Received: by 2002:ae9:e116:0:b0:6fa:30fc:182f with SMTP id
 g22-20020ae9e116000000b006fa30fc182fmr30480543qkm.401.1667861494732; 
 Mon, 07 Nov 2022 14:51:34 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 h3-20020a05620a244300b006fa4cac54a4sm6844339qkn.133.2022.11.07.14.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:51:34 -0800 (PST)
Date: Mon, 7 Nov 2022 17:51:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v4 49/83] acpi: add get_dev_aml_func() helper
Message-ID: <20221107224600.934080-50-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Igor Mammedov <imammedo@redhat.com>

It will be used in followup commits to figure out if
device has it's own, device specific AML block.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221017102146.2254096-7-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 include/hw/acpi/acpi_aml_interface.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/hw/acpi/acpi_aml_interface.h b/include/hw/acpi/acpi_aml_interface.h
index ab76f0e55d..436da069d6 100644
--- a/include/hw/acpi/acpi_aml_interface.h
+++ b/include/hw/acpi/acpi_aml_interface.h
@@ -29,11 +29,20 @@ struct AcpiDevAmlIfClass {
     dev_aml_fn build_dev_aml;
 };
 
-static inline void call_dev_aml_func(DeviceState *dev, Aml *scope)
+static inline dev_aml_fn get_dev_aml_func(DeviceState *dev)
 {
     if (object_dynamic_cast(OBJECT(dev), TYPE_ACPI_DEV_AML_IF)) {
         AcpiDevAmlIfClass *klass = ACPI_DEV_AML_IF_GET_CLASS(dev);
-        klass->build_dev_aml(ACPI_DEV_AML_IF(dev), scope);
+        return klass->build_dev_aml;
+    }
+    return NULL;
+}
+
+static inline void call_dev_aml_func(DeviceState *dev, Aml *scope)
+{
+    dev_aml_fn fn = get_dev_aml_func(dev);
+    if (fn) {
+        fn(ACPI_DEV_AML_IF(dev), scope);
     }
 }
 
-- 
MST


