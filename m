Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957334D0BBA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:09:35 +0100 (CET)
Received: from localhost ([::1]:35638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMTu-0004uZ-Ls
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:09:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM8I-0002GO-0O
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:47:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM8G-0005oy-7r
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9q47EVnAVXFpNQycZMOXWyjMc83xadubGO4Go9bg1gU=;
 b=XtHBaGaQe4QoPEDOrALqkmobY4yMaLngAfEDnQMqrSZmSbGwurnlUYjzTpg4S0OLcN89fY
 9jWNBw42JrEo/xA4iEOqN0me2bXzJBXt0jFfYqmdd0li/mIa7gQ5QqsDmMqkU0a8J8HHUs
 sK3g5m2os+SNO3+LgeO1UiJmsq5wF5M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-PxcuXKVANhGuX4FPm1ZkoQ-1; Mon, 07 Mar 2022 17:47:10 -0500
X-MC-Unique: PxcuXKVANhGuX4FPm1ZkoQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h17-20020a05640250d100b004133863d836so9487043edb.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9q47EVnAVXFpNQycZMOXWyjMc83xadubGO4Go9bg1gU=;
 b=jeuCnj4G/DC7+dI68ihkM1/3An324VwNWqZQE0XCN/wbEjl2shLDreJkCyxW7+BOQv
 mZTjoNFXR9OOb3gr6FbeZ7CPQIFjTj5iMQs/dEuSUa1xy6xzqjdTwGayCz+9VixFdwmh
 0+L+7atgW84xRYJ1KwOMNDOLGxUIx832F1uOWSSdyVsqOK78+V3ogY3q5QsXhPsqoake
 n0V5P3QAxVnV1YM5s4lL6cLMyhXovJ2qRcinIhDeIVzGJHGY3Tilni9ZuoF238gU6lni
 VDd77fAUODstwv3A/8e//qf2tvd+VMOpY85Fk/C/VUlE77r5tCno+rMRkIsWrHyDzGiG
 E4Uw==
X-Gm-Message-State: AOAM531VvybTOg8tqB6k8hrHhYv5XS0pHWaUAhbHsedxngQ+jJGxqH8O
 bNZVx/ZmAxWdQoakYYn9jEiDZpAhxQzgI2FHCd/tI2ARG4MEbe0v5y9+0ooW+I8XN61keixDBPa
 GQrKACI/QJwrB0HwhF1Aq8ZejIXDQ8sQ0QdJchg2/fHgtBautEENzy32ugaED
X-Received: by 2002:a17:906:2e90:b0:6d6:e921:934a with SMTP id
 o16-20020a1709062e9000b006d6e921934amr10857532eji.557.1646693229195; 
 Mon, 07 Mar 2022 14:47:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVn7m3117nISsKZXJUkKZnIZrWR/isiM7d7BhrLFYbh/0Vzpk59izAcW02r9twVLFQjuTHlQ==
X-Received: by 2002:a17:906:2e90:b0:6d6:e921:934a with SMTP id
 o16-20020a1709062e9000b006d6e921934amr10857514eji.557.1646693228960; 
 Mon, 07 Mar 2022 14:47:08 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 si13-20020a170906cecd00b006cded0c5ee2sm5230669ejb.61.2022.03.07.14.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:47:08 -0800 (PST)
Date: Mon, 7 Mar 2022 17:47:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 47/47] hw/acpi/microvm: turn on 8042 bit in FADT boot
 architecture flags if present
Message-ID: <20220307224357.682101-48-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

The second bit of IAPC_BOOT_ARCH in FADT table indicates the presence of
keyboard controller implemented as 8042 or equivalent micro controller. This
change enables this flag for microvms if such a device exists (for example,
when added explicitly from the QEMU commandline). Change
654701e292d98b308b0 ("hw/acpi: add indication for i8042 in IA-PC boot flags of the FADT table")
enabled this flag for i386 q35 based machines. The reason for doing the same
for micro-vms is to make sure we provide the correct tables to the guest OS
uniformly in all cases when an i8042 device is present. When this bit is not
enabled, guest OSes has to find other indirect methods to detect the device
which we would like to avoid.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220304154032.2071585-5-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-microvm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 68ca7e7fc2..fb09185cbd 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -37,6 +37,7 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/usb/xhci.h"
 #include "hw/virtio/virtio-mmio.h"
+#include "hw/input/i8042.h"
 
 #include "acpi-common.h"
 #include "acpi-microvm.h"
@@ -187,6 +188,11 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
             .address = GED_MMIO_BASE_REGS + ACPI_GED_REG_RESET,
         },
         .reset_val = ACPI_GED_RESET_VALUE,
+        /*
+         * ACPI v2, Table 5-10 - Fixed ACPI Description Table Boot Architecture
+         * Flags, bit offset 1 - 8042.
+         */
+        .iapc_boot_arch = iapc_boot_arch_8042(),
     };
 
     table_offsets = g_array_new(false, true /* clear */,
-- 
MST


