Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129CD25462C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 15:43:19 +0200 (CEST)
Received: from localhost ([::1]:55064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBIBS-0005kq-4N
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 09:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kBI8j-0000kj-5B
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 09:40:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30926
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kBI8h-0006J4-1f
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 09:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598535626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iI7KGtS7UrhW3zaOlauuOS3PfCI6dUBTbbFUZTldwKs=;
 b=BRYBVcBCWF2moj1an/Nc+hYi5qKDkOce5cf67CPVMGUiRkUzfpyn4ahY/bXh1riAey6p3F
 XyhU68i3dCkdBpdP/QkEWZ1yCoxD1XtpyAygTGdMdquO4FGrzMncH9ncUMzKme847XM5Na
 +i1Snwz/z7bfM9AmI1q1iDxUJJNSlIM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-hVm6qeX9M_GMnJAkgWmDsQ-1; Thu, 27 Aug 2020 09:40:22 -0400
X-MC-Unique: hVm6qeX9M_GMnJAkgWmDsQ-1
Received: by mail-wm1-f72.google.com with SMTP id b14so2073940wmj.3
 for <qemu-devel@nongnu.org>; Thu, 27 Aug 2020 06:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iI7KGtS7UrhW3zaOlauuOS3PfCI6dUBTbbFUZTldwKs=;
 b=Uwe8COkTLx7cZWqR505O9cvysNqB110J6+KYNdhe49VFf6TG5Q690Cc6gnlX71ntt9
 1CqLmLUTm3NpoI/PEiKCyW+3ieKOCGFWMykspLtQ4ub4VVPp6Hy+VrLhLGpK2Nr7d+YJ
 rZxD9swCU3maRyyF9iRLMR1yJW7I1Hx6JWROuco4ybEgSqaVnA7o/kPiH5datQdPXYyF
 HMqLX0Add6b3d6XPhTgI/eIYo1sbRgq+CmAEqYl69ZOKV3kLN2VAMC1z8qJjVDi7lGOT
 g5y7dCtxLrJG64ieASuUdjMIAJO5IGAWFn/rqD7B5cA7QIM7LFSYMjLkQQPb2HxO2Vx0
 xQgA==
X-Gm-Message-State: AOAM531cUz3OJOhURkKA0617YMAmUzV7OhYLhd1CchDQTBQeB7ThapoA
 a6rpQgyamvfK9fkrgCiKJO5jdN9qBCPBI5UOagi1+fRS/0HLSiSLlCVhSV3mWa3Qrf+83sjtu/d
 TpKGnOrfx9eSYfGM=
X-Received: by 2002:adf:b602:: with SMTP id f2mr19477386wre.186.1598535621000; 
 Thu, 27 Aug 2020 06:40:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXYeS1He6uSI6CutcyKZVrLMH9s2dcUvmEka9mA+Zq4XB4pskjyKkBAgv+kfbWxW/vEEkfPQ==
X-Received: by 2002:adf:b602:: with SMTP id f2mr19477361wre.186.1598535620658; 
 Thu, 27 Aug 2020 06:40:20 -0700 (PDT)
Received: from redhat.com (bzq-109-67-46-169.red.bezeqint.net. [109.67.46.169])
 by smtp.gmail.com with ESMTPSA id v29sm6028804wrv.51.2020.08.27.06.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 06:40:19 -0700 (PDT)
Date: Thu, 27 Aug 2020 09:40:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/13] i386/acpi: fix inconsistent QEMU/OVMF device paths
Message-ID: <20200827133954.2118749-3-mst@redhat.com>
References: <20200827133954.2118749-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200827133954.2118749-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:56:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vitaly Cheptsov <vit9696@protonmail.com>, qemu-stable@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

macOS uses ACPI UIDs to build the DevicePath for NVRAM boot options,
while OVMF firmware gets them via an internal channel through QEMU.
Due to a bug in QEMU ACPI currently UEFI firmware and ACPI have
different values, and this makes the underlying operating system
unable to report its boot option.

The particular node in question is the primary PciRoot (PCI0 in ACPI),
which for some reason gets assigned 1 in ACPI UID and 0 in the
DevicePath. This is due to the _UID assigned to it by build_dsdt in
hw/i386/acpi-build.c Which does not correspond to the primary PCI
identifier given by pcibus_num in hw/pci/pci.c

Reference with the device paths, OVMF startup logs, and ACPI table
dumps (SysReport):
https://github.com/acidanthera/bugtracker/issues/1050

In UEFI v2.8, section "10.4.2 Rules with ACPI _HID and _UID" ends with
the paragraph,

    Root PCI bridges will use the plug and play ID of PNP0A03, This will
    be stored in the ACPI Device Path _HID field, or in the Expanded
    ACPI Device Path _CID field to match the ACPI name space. The _UID
    in the ACPI Device Path structure must match the _UID in the ACPI
    name space.

(See especially the last sentence.)

Considering *extra* root bridges / root buses (with bus number > 0),
QEMU's ACPI generator actually does the right thing; since QEMU commit
c96d9286a6d7 ("i386/acpi-build: more traditional _UID and _HID for PXB
root buses", 2015-06-11).

However, the _UID values for root bridge zero (on both i440fx and q35)
have always been "wrong" (from UEFI perspective), going back in QEMU to
commit 74523b850189 ("i386: add ACPI table files from seabios",
2013-10-14).

Even in SeaBIOS, these _UID values have always been 1; see commit
a4d357638c57 ("Port rombios32 code from bochs-bios.", 2008-03-08) for
i440fx, and commit ecbe3fd61511 ("seabios: q35: add dsdt", 2012-12-01)
for q35.

Cc: qemu-stable@nongnu.org
Suggested-by: Laszlo Ersek <lersek@redhat.com>
Tested-by: Vitaly Cheptsov <vit9696@protonmail.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
---
 hw/i386/acpi-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b7bcbbbb2a..7a5a8b3521 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1497,7 +1497,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
-        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
+        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
@@ -1512,7 +1512,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
-        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
+        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
         aml_append(dev, build_q35_osc_method());
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
-- 
MST


