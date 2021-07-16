Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3D03CB99B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:20:17 +0200 (CEST)
Received: from localhost ([::1]:60148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4PdQ-0000wM-Ia
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYg-00011t-Md
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYe-0003x6-Jh
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626448518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s44RkB8U7U2bDJqZ7dxzv9YhTcSDJCpv+fLZfJ2i0D0=;
 b=Hn3a2kCNnThCgwOeww2WPS/PzOp1TT4VhEMPIP7GABo7BW/XgTlrsjMhIEufDx+LWHbNG5
 CqN6mtg8AguFBE3kmGCBRmzaK2vI2595VxZduEkFQmSp96lt9Ko+glN2CYd6gjwRDoaKD7
 ps95ws2a7xwkkd4tmGo+iA1jJIN1b98=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-7KpLB_pzPUm5wLjX9_M_yA-1; Fri, 16 Jul 2021 11:15:17 -0400
X-MC-Unique: 7KpLB_pzPUm5wLjX9_M_yA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d8-20020adf9c880000b0290141a87409b5so4123646wre.16
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 08:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s44RkB8U7U2bDJqZ7dxzv9YhTcSDJCpv+fLZfJ2i0D0=;
 b=LENuEHy87SXNwfhXFPkt2iJTDDRTZHuW2xfE9Hog27Bv5f6lsrqrDjXX2dKJPxK4Nn
 W911ZRCJcWDpm5sgU47OxCxbizzZ3ettLKThTeydBoX6YEwlUOwZyvt41+TZzgCE/O4F
 w8RxJmoyJ8GwAR9UovE00q4dNRthYU/0RF01EA4jzkVKuOo8rP7DStQ6Ggq5CE1R4uUA
 VG/2mP6aN0Piumq/dLLHashdSiaVfRhicsPBhWWg5qquOfNWtdMvHcfNQvuFEqnBR+Ew
 EG/6b+I5mT+HexEEz5L0tijLbi8SPftf8g2+aO+xJFnHsev2hG1DrpOUjD787B0UztLL
 uoqg==
X-Gm-Message-State: AOAM532Aro95iSFcbfXA8oMO/mT3uc9/rtO+Er4pwl86L77WPn6qQqW/
 rvy3qn/XKCpK6Apw7wCioMgw1yHEdVmDlt8iGMxXqZtAamdkugQjHxitZZXESq0El3BbkgS78zw
 vbiRJL8fRXcIhi/q57nXvuDqEGQdyWpuGTXjnI/4bRL8nC5BRvyug6LmhbKXK
X-Received: by 2002:a05:600c:22c9:: with SMTP id
 9mr17038464wmg.25.1626448515548; 
 Fri, 16 Jul 2021 08:15:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFiMtNoc6vBPxP8zVwKQ59wl3qf5pH1Ood5tKHN7j7OuDZ4GdukLs6U/m4QohJT/lQ6Ep/Og==
X-Received: by 2002:a05:600c:22c9:: with SMTP id
 9mr17038429wmg.25.1626448515240; 
 Fri, 16 Jul 2021 08:15:15 -0700 (PDT)
Received: from redhat.com ([2a10:8004:6ff2:0:a1b1:b3d8:4c4e:4825])
 by smtp.gmail.com with ESMTPSA id w3sm10211324wrt.55.2021.07.16.08.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:15:14 -0700 (PDT)
Date: Fri, 16 Jul 2021 11:15:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 05/19] hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35
Message-ID: <20210716151416.155127-6-mst@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210716151416.155127-1-mst@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Julia Suvorova <jusual@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Julia Suvorova <jusual@redhat.com>

Q35 has three different types of PCI devices hot-plug: PCIe Native,
SHPC Native and ACPI hot-plug. This patch changes the default choice
for cold-plugged bridges from PCIe Native to ACPI Hot-plug with
ability to use SHPC and PCIe Native for hot-plugged bridges.

This is a list of the PCIe Native hot-plug issues that led to this
change:
    * no racy behavior during boot (see 110c477c2ed)
    * no delay during deleting - after the actual power off software
      must wait at least 1 second before indicating about it. This case
      is quite important for users, it even has its own bug:
          https://bugzilla.redhat.com/show_bug.cgi?id=1594168
    * no timer-based behavior - in addition to the previous example,
      the attention button has a 5-second waiting period, during which
      the operation can be canceled with a second press. While this
      looks fine for manual button control, automation will result in
      the need to queue or drop events, and the software receiving
      events in all sort of unspecified combinations of attention/power
      indicator states, which is racy and uppredictable.
    * fixes:
        * https://bugzilla.redhat.com/show_bug.cgi?id=1752465
        * https://bugzilla.redhat.com/show_bug.cgi?id=1690256

To return to PCIe Native hot-plug:
    -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off

Known issue: older linux guests need the following flag
to allow hotplugged pci express devices to use io:
        -device pcie-root-port,io-reserve=4096.
io is unusual for pci express so this seems minor.
We'll fix this by a follow up patch.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210713004205.775386-6-jusual@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/acpi/ich9.c | 2 +-
 hw/i386/pc.c   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 2f4eb453ac..778e27b659 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -427,7 +427,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     pm->disable_s3 = 0;
     pm->disable_s4 = 0;
     pm->s4_val = 2;
-    pm->use_acpi_hotplug_bridge = false;
+    pm->use_acpi_hotplug_bridge = true;
 
     object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
                                    &pm->pm_io_base, OBJ_PROP_FLAG_READ);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index aa79c5e0e6..f4c7a78362 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -99,6 +99,7 @@ GlobalProperty pc_compat_6_0[] = {
     { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
     { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
     { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
+    { "ICH9-LPC", "acpi-pci-hotplug-with-bridge-support", "off" },
 };
 const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
 
-- 
MST


