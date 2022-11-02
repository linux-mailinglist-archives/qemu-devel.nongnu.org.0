Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB34161688A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:22:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGKp-0001Q1-1x; Wed, 02 Nov 2022 12:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKe-0000pM-6y
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKZ-0003Kb-Nj
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h/XlP9KQaz9Sdj8a6OxlbRsUZL7f47hL0wOEmFmZTnk=;
 b=QscdSrWPcO+qzIOxhTuwviau6l5tN1qZ7cmqmfC59LYGK0/YPch2OtJkCjUUJKKnQPtkEX
 0uF1GuglqTDS8j8GfggGZKgikipZqdi4nmUh+OtL4MMyFaR1LYpgpULorSRADodmh7fyPG
 +H2QzYuAF85lor/bMjiQl9/ZGKTN//U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-382-_rDWl6nSMuapWmoJ0EkFzw-1; Wed, 02 Nov 2022 12:11:06 -0400
X-MC-Unique: _rDWl6nSMuapWmoJ0EkFzw-1
Received: by mail-wm1-f72.google.com with SMTP id
 d13-20020a05600c34cd00b003ce1f62ac5aso1255616wmq.4
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/XlP9KQaz9Sdj8a6OxlbRsUZL7f47hL0wOEmFmZTnk=;
 b=1TWVwVG1awd8oiGqj1fr9glFb+xeYwzNkG8dtRwA5L9Hfbj90uBoaIHHcTl5Xn6tF7
 tVyXcWY/zQfsdbNWAuMAnOkoZcTNrJn2uwrwl97HyMCN38aVrLIunpOUwpYQSF/hueWQ
 0hll9mTsdKX6eYSaZjD/L53y03xCTddSFjioKVinlvpJcOsq7UMboXiBOTNt06+dNw7s
 MmweoICeB68UiB3ihV77WyGzhaKi66pOFHyPcNHWk6Eqn7I3aa9gQTGGM8A9U+63wa5a
 2akYTiG0vLFxNLWv/qVwYGypa0yXOFtsiVYOqGmHPPgAW4Jgehv+4aU76+TJ9ZvaILYK
 ZSdA==
X-Gm-Message-State: ACrzQf2+2pRukGPEuWrqNk3eKoZHaua93TSbaEMS0RGlDAFt70dRRrXR
 ONJ2WI13q4X0rfquMeW8PSNmRdqlincWOr2D1nKAKXMHnfT9a6q//AXaNYPYLUpc0VyKYCyNKRR
 hvc6lXmifp/GeSXoc4r4Mg3RXqmSvEEqx/bqBs5EYJWTGMQJqI8ZKNyFtKbPc
X-Received: by 2002:adf:e78d:0:b0:236:debd:f681 with SMTP id
 n13-20020adfe78d000000b00236debdf681mr7781357wrm.17.1667405464775; 
 Wed, 02 Nov 2022 09:11:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7vWt+o6fbBEWVUCrewf/fjEUh7qOrY3jMOOVkqwBV/k4Er58JWPEwswDxJ2EMyUo2LVW9qnA==
X-Received: by 2002:adf:e78d:0:b0:236:debd:f681 with SMTP id
 n13-20020adfe78d000000b00236debdf681mr7781333wrm.17.1667405464540; 
 Wed, 02 Nov 2022 09:11:04 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 v12-20020a7bcb4c000000b003c6d21a19a0sm2421902wmj.29.2022.11.02.09.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:04 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:11:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 57/82] acpi: add get_dev_aml_func() helper
Message-ID: <20221102160336.616599-58-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


