Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E2F2F922D
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 12:58:34 +0100 (CET)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l16hV-0000YU-6R
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 06:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16W2-0001gl-Mb
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16Vw-0008FB-Sq
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610883996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=64ubvJBtg1XcRnPmbMoHYG7QMqq5ANQsdIveleP9CdQ=;
 b=QPFFhVpyJzMD5VH1yPDKyDEi4kkZzHMlaRsXI1GweVd60SS6Ea/gS7nlR8KMay9ZfdLBX9
 7OxjFhTfnzv+nek6vm9uNRRHGabfUy+tyneqBbe2KtGxR4zu2zRExscnxlPh8Ye0S9YwIh
 BtKHt9+K40M+OQc5mIAyaU4APsDyxOs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-nW5_rnPcM2qxQnShgf5-zQ-1; Sun, 17 Jan 2021 06:46:34 -0500
X-MC-Unique: nW5_rnPcM2qxQnShgf5-zQ-1
Received: by mail-wr1-f69.google.com with SMTP id g16so6803427wrv.1
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 03:46:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=64ubvJBtg1XcRnPmbMoHYG7QMqq5ANQsdIveleP9CdQ=;
 b=guhjFWph3JoNGbqeecqXjz2YqEAkyNx13+t2NXOmRx/j7GCgvzVE7iGmGkFQzVuw03
 dG59CZkk8NaJekYTJuKHxQKLjBi372R2A/YAaqcaJGz6Jw5BGRuE1TUGWAiD5HwnzYA/
 DhwBuu7a6OA+e+sNkYonsAA8oQcqyTIuWnS7td0DxdyiUUr/fCauN7Whalis+SOS4r8V
 PLTm+vxsh6zJiW2v47afeQ23rZU2IPR6hUX349eR/zOh4chSV/YsszTb+JsNpo+HkdsC
 PpnyE1iB1W5QL65ihZiUmIK16NdArqJDuavL8jlR9Z7lR7muCsFrguRS3VgdCyPqL+bL
 4p5w==
X-Gm-Message-State: AOAM531GInU24gq1UlHdPB8qdTxgd15jlXrsn2tXznfTprE07AkScI0Z
 j4SkZ/F7sD33NQnzIoKnrDnXf2bJejjRSh8N5KLvp4wXEUg98YyfN+RBWojbpLL7JWDvDU995eL
 w65sAe5i04pgOMlCab+iA5GmhAvvlmbnxi1W6fWk4rWvYhgyLIMRYHxBXmDwU
X-Received: by 2002:a1c:96d7:: with SMTP id y206mr16746914wmd.9.1610883992497; 
 Sun, 17 Jan 2021 03:46:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxG+sq+B32wLg44yohnDVANTj//6UZ2/gjvCb0JscEGR4tLg5b5Y8M8AlBlor3sB749d/Iogw==
X-Received: by 2002:a1c:96d7:: with SMTP id y206mr16746899wmd.9.1610883992280; 
 Sun, 17 Jan 2021 03:46:32 -0800 (PST)
Received: from redhat.com (bzq-79-176-30-58.red.bezeqint.net. [79.176.30.58])
 by smtp.gmail.com with ESMTPSA id
 b10sm5189931wmj.2.2021.01.17.03.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 03:46:31 -0800 (PST)
Date: Sun, 17 Jan 2021 06:46:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/10] acpi/gpex: Inform os to keep firmware resource map
Message-ID: <20210117114519.539647-7-mst@redhat.com>
References: <20210117114519.539647-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210117114519.539647-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Yubo Miao <miaoyubo@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiahui Cen <cenjiahui@huawei.com>

There may be some differences in pci resource assignment between guest os
and firmware.

Eg. A Bridge with Bus [d2]
    -+-[0000:d2]---01.0-[d3]----01.0

    where [d2:01.00] is a pcie-pci-bridge with BAR0 (mem, 64-bit, non-pref) [size=256]
          [d3:01.00] is a PCI Device with BAR0 (mem, 64-bit, pref) [size=128K]
                                          BAR4 (mem, 64-bit, pref) [size=64M]

    In EDK2, the Resource Map would be:
        PciBus: Resource Map for Bridge [D2|01|00]
        Type = PMem64; Base = 0x8004000000;     Length = 0x4100000;     Alignment = 0x3FFFFFF
           Base = 0x8004000000; Length = 0x4000000;     Alignment = 0x3FFFFFF;  Owner = PCI [D3|01|00:20]
           Base = 0x8008000000; Length = 0x20000;       Alignment = 0x1FFFF;    Owner = PCI [D3|01|00:10]
        Type =  Mem64; Base = 0x8008100000;     Length = 0x100; Alignment = 0xFFF
    It would use 0x4100000 to calculate the root bus's PMem64 resource window.

    While in Linux, kernel will use 0x1FFFFFF as the alignment to calculate
    the PMem64 size, which would be 0x6000000. So kernel would try to
    allocate 0x6000000 from the PMem64 resource window, but since the window
    size is 0x4100000 as assigned by EDK2, the allocation would fail.

The diffences could result in resource assignment failure.

Using _DSM #5 method to inform guest os not to ignore the PCI configuration
that firmware has done at boot time could handle the differences.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20210114100643.10617-5-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-host/gpex-acpi.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 11b3db8f71..cb13e75d2f 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -112,10 +112,26 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
     UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
     ifctx = aml_if(aml_equal(aml_arg(0), UUID));
     ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(0)));
-    uint8_t byte_list[1] = {1};
-    buf = aml_buffer(1, byte_list);
+    uint8_t byte_list[] = {
+                0x1 << 0 /* support for functions other than function 0 */ |
+                0x1 << 5 /* support for function 5 */
+                };
+    buf = aml_buffer(ARRAY_SIZE(byte_list), byte_list);
     aml_append(ifctx1, aml_return(buf));
     aml_append(ifctx, ifctx1);
+
+    /*
+     * PCI Firmware Specification 3.1
+     * 4.6.5. _DSM for Ignoring PCI Boot Configurations
+     */
+    /* Arg2: Function Index: 5 */
+    ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(5)));
+    /*
+     * 0 - The operating system must not ignore the PCI configuration that
+     *     firmware has done at boot time.
+     */
+    aml_append(ifctx1, aml_return(aml_int(0)));
+    aml_append(ifctx, ifctx1);
     aml_append(method, ifctx);
 
     byte_list[0] = 0;
-- 
MST


