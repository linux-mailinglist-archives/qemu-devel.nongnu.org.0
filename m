Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B554CFBC5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:47:56 +0100 (CET)
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAuB-0004xb-Uu
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:47:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRADT-00030l-4e
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRADR-0002yr-LZ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9q47EVnAVXFpNQycZMOXWyjMc83xadubGO4Go9bg1gU=;
 b=Uy5z5Jef+1bts4NBXSQXgsy2UlAcokHtfzP//phRA57O2IQWSAILezsUI4tarw/4+KfuxG
 Uc2xCdLx3Xnw4KuqbJ2EkJrWYiEFfjZB82gIEpt+5jdRl9PpMOLWS7SSCAvVWNHAF8rFlG
 o/efi5ctsptfIT+xtCIuzuQle5c8aEo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-0klbdFUQNK6nF47VwcJ4GA-1; Mon, 07 Mar 2022 05:03:43 -0500
X-MC-Unique: 0klbdFUQNK6nF47VwcJ4GA-1
Received: by mail-ed1-f71.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so8324208eda.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:03:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9q47EVnAVXFpNQycZMOXWyjMc83xadubGO4Go9bg1gU=;
 b=m+duToe/elmJTsQb/YYQyVAiiPRqmg5o6AjHriPT+CTA0ChyRjvLOTKuH97LRJ3hEB
 VFpf9oRMjbyWsA21A/WRAU1PrzN7m7IkYyMXpsGrOa6YRP6fLc8mQk/vCJKHe7nRfLiS
 Nxf0TXy3Dk5qgdtHTAwzBrTEQl3nqrj+YbpMGn165cNHz25NfU9TbTxxw2VO7R8Ju9cZ
 xJzrdSeQmOxB/cxgfbeb36IXgVTgvQq9k19rzXXl5Opb9Hj4XIRZtxJ3e1wWaJ/WgwY/
 HCRj2wUoXhjcGAgLyFbURQwJmVB8JEmKdHcJhRVItLkxWEMBgJKBZWR0freMV7wCyOyK
 1yfw==
X-Gm-Message-State: AOAM530LdECZ2ao6xdUAD09HbHmDUT90x01+wdrunsoxRmXcPSNpDAoD
 dtuD9ThJFspcB2tbBz9rXJDcJS1v8dQF3mepOyfErgf/Zy5uX0I1YdR5a7DqFS5iuiT3kOZIfAU
 pO0WbduFqO0Soxi1C5+CmfCmbenEbuSKxzXppB3pygSTKonjlmprIs14OUaY9
X-Received: by 2002:a17:906:31c1:b0:6c9:cfb3:4dd3 with SMTP id
 f1-20020a17090631c100b006c9cfb34dd3mr8303395ejf.392.1646647421577; 
 Mon, 07 Mar 2022 02:03:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzp6tI5vmwtKp929IK1DTxhDAOL2T86R31jihOAE+aTagv34vpCUaHfsKhO/iw2gsAit5Ml7w==
X-Received: by 2002:a17:906:31c1:b0:6c9:cfb3:4dd3 with SMTP id
 f1-20020a17090631c100b006c9cfb34dd3mr8303377ejf.392.1646647421349; 
 Mon, 07 Mar 2022 02:03:41 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 cc21-20020a0564021b9500b00403bc1dfd5csm6091350edb.85.2022.03.07.02.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:03:40 -0800 (PST)
Date: Mon, 7 Mar 2022 05:03:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 47/47] hw/acpi/microvm: turn on 8042 bit in FADT boot
 architecture flags if present
Message-ID: <20220307100058.449628-48-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


