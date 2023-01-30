Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CFB681B90
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:32:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMafd-0007xO-AX; Mon, 30 Jan 2023 15:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMae9-0006Bi-Rp
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMae8-0007NV-C9
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HtBhzdQl9NWj90vUcOz8feZPLufDe737QYeQGNXgpZc=;
 b=GTLSfTOfNBxeGLS41AJ6lc90ctdCJM3PHe1ftykteQy+kqYfw6XDDhsUdvDgqIPYWB0iEM
 x6LSmq8P4/n4uPPs/qodybGYvBcBCi23qIpcB5Jrjs7hakRMnCysvAt3Kzmw1t+f7144RC
 CvPV6BjzHEMGiD7PT/dYhi7qvI+Rxc0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-pDAlDOUzOxOWp6LPaMlxvg-1; Mon, 30 Jan 2023 15:20:54 -0500
X-MC-Unique: pDAlDOUzOxOWp6LPaMlxvg-1
Received: by mail-ej1-f71.google.com with SMTP id
 bj15-20020a170906b04f00b0088ac85a6fc1so1375557ejb.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HtBhzdQl9NWj90vUcOz8feZPLufDe737QYeQGNXgpZc=;
 b=7AAWcPoB9y1al6DJxTdogJRy+xlOzuALsHLm72FnVJ/q4OXxK7vAgvlIGMSjTOzWeA
 DY5vJKSpiGfVIXHyeokKJyVHTp8V6BXH3/EOVGAU38FBNzvLZg2HxHwnWhrexwo2Gpbl
 nSLvoPCk2u/FYyp3igx/9TJD4PHsv5RNDVWsCYm0fck4slHKmzlCllJwp+v3PAKQaEOu
 EvAqfMvgWgNj/v4HC3vA2ruaOVOXiT61+ISTx+SLjOFzBzjcQdXHqgCSf0mvC40nnQZM
 d6pmvA+S96Yuv9Te6JDg9DT8X29pkfQuJh92PUGQItLggSijV8PZJ7qPDlIpnXQkUDZb
 2/gA==
X-Gm-Message-State: AO0yUKX5t6i9G0EQPkm86csW120ey6sgd1DNK0V0zcOU8AQ0i2YmBNDx
 mCHTnDmeHe0f/+QKSFxLTCzCRpmxDmb0Yiiz59FjnfDawGfshm1N9ZgeGLor2RAJnCdR52n0YC7
 nYLGcODajJrM8SZdWvifcKom0m98iuMH6ErSufQ86GjE8bnRfDtmNi0Pn99rf
X-Received: by 2002:a05:6402:353:b0:499:bf28:d9c6 with SMTP id
 r19-20020a056402035300b00499bf28d9c6mr809553edw.5.1675110052471; 
 Mon, 30 Jan 2023 12:20:52 -0800 (PST)
X-Google-Smtp-Source: AK7set+5zz2hSNo+hXyHpjY7LIF90Oz4ichJPFszsR+Q8q3hcc756APBgUBW7b/kXVhchr6gK415eQ==
X-Received: by 2002:a05:6402:353:b0:499:bf28:d9c6 with SMTP id
 r19-20020a056402035300b00499bf28d9c6mr809533edw.5.1675110052224; 
 Mon, 30 Jan 2023 12:20:52 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 m15-20020a056402050f00b0049ef70a2894sm7357312edv.38.2023.01.30.12.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:51 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 38/56] pci: acpi: wire up AcpiDevAmlIf interface to generic
 bridge
Message-ID: <20230130201810.11518-39-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

... so that the concrete impl. won't has to duplicate it
every time. By default it doesn't do anything unless leaf class
defines and sets AcpiDevAmlIfClass::build_dev_aml handler.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-29-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pci_bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index b2b180edd6..a1a1cc861e 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -36,6 +36,7 @@
 #include "qemu/module.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 /* PCI bridge subsystem vendor ID helper functions */
 #define PCI_SSVID_SIZEOF        8
@@ -472,6 +473,10 @@ static const TypeInfo pci_bridge_type_info = {
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCIBridge),
     .abstract = true,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_ACPI_DEV_AML_IF },
+        { },
+    },
 };
 
 static void pci_bridge_register_types(void)
-- 
MST


