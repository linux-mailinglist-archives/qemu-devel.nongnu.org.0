Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464B061DC79
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:29:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpj-0008Mm-Kt; Sat, 05 Nov 2022 13:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMo8-0007GP-LL
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMo5-0007hX-HH
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h/XlP9KQaz9Sdj8a6OxlbRsUZL7f47hL0wOEmFmZTnk=;
 b=MgWQPt62ibty9GyO2qMUtNYLwTnJw06aYLxQx6ED3A7CPsZMyRewP0De1DnZCgaiaJZyyJ
 yQ2+ysIPlWbWQRtRMPoa0kfR6UDFcaN47vdJL48GYx0ow5XDJSTGt6N/fAZ+EHrjcLuNw4
 /+iWfElX/VumMaABPjZ5R8kqyF8GUpI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-464-E5ywb2NCOT2AXcWhDt_f1Q-1; Sat, 05 Nov 2022 13:18:07 -0400
X-MC-Unique: E5ywb2NCOT2AXcWhDt_f1Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 h8-20020a1c2108000000b003cf550bfc8dso6002267wmh.2
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/XlP9KQaz9Sdj8a6OxlbRsUZL7f47hL0wOEmFmZTnk=;
 b=M6AIioNIpY5X2n5PkFVBFXLCOb1ILs3pg2BOvp3zO6dbHhPCpxHYcrNIv6RinHksKJ
 VJRAUT3BHjFZ4D/OabpHS9nRD73lQY4nhuzbuJvmA8A8dUsKuw18NPjK/IihGOJ2FATc
 pGUsd8+Og99Wqt6/Dnr0Wsk933rdF1ussZd9YLNf9kErtT67qlbonX1kAYclsKl4KmjS
 pQp5xklG8ldo88qwMY4keV6+I7JbGWl/0KiHcARljSMGrgm1+guzoW0U+Zu0WKWOpbx3
 qfiI7MtK4bgTiKjDYdmglqRn88i2Yt3pMJ1dPkjyEI+N9ar92nieQeJHFyRVysg+C4vv
 3k8w==
X-Gm-Message-State: ACrzQf3v3kjrfuHAe+5cq4NBE9T1tBTfW+1qKIslfttlXnsDgT0b73Fr
 kEDirMVN2d0NxUumzmEkeI3AEQfsiJ73wrdkCv5Ux8+aXWexS7TVImumNspM66+W/f+rf8lFUyQ
 SmoLv/EHUQS/26+fAg6VKXCY38pH11QGIbGfmzpHPHAIxrLXMEPPETxV2VssV
X-Received: by 2002:adf:f70b:0:b0:236:f367:920f with SMTP id
 r11-20020adff70b000000b00236f367920fmr12186292wrp.129.1667668686148; 
 Sat, 05 Nov 2022 10:18:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6XkdLq4M1frNAxCjT41ndadFWsJFz2qbzG8BlKa51CcQGKJdQylD0dFIiWyuVi8eOuPd1bcw==
X-Received: by 2002:adf:f70b:0:b0:236:f367:920f with SMTP id
 r11-20020adff70b000000b00236f367920fmr12186279wrp.129.1667668685918; 
 Sat, 05 Nov 2022 10:18:05 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 t1-20020a1c7701000000b003b3307fb98fsm2916004wmi.24.2022.11.05.10.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:18:05 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:18:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 54/81] acpi: add get_dev_aml_func() helper
Message-ID: <20221105171116.432921-55-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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


