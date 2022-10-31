Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AAC6136F4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:53:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHY-0005A6-TY; Mon, 31 Oct 2022 08:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUH6-0002eo-5o
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGq-0002Yj-Tu
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VMWMaWdnSnO1dinC6iXI4ou29u//qgWX4brDGAZpGas=;
 b=dYUfBLPV+c2hJ4tj7R/gs3j3KhVo/6W7GxmNofuj8kfmz9mXxm4+U1Ugdgn+IE556VMJML
 rCJzHMKjZxWLqL5C7EGq/j+UM6Q5WyYE1E7j2BfcC95K8KsHdslTHxLTDXYYGcJL7jcadj
 669KSYJljDAfRxB2rsG35j1DvlJPJmU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-ExzOJIyKO16_N4ZLYoI7cA-1; Mon, 31 Oct 2022 08:52:02 -0400
X-MC-Unique: ExzOJIyKO16_N4ZLYoI7cA-1
Received: by mail-wr1-f72.google.com with SMTP id
 o13-20020adfa10d000000b00232c00377a0so3036816wro.13
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VMWMaWdnSnO1dinC6iXI4ou29u//qgWX4brDGAZpGas=;
 b=s2F3CbmLaHEDLY4ct+RQqTP4+2LRMUMnzw6WgjIciBcG+C2DNXdDxeM3gE7kdk7jCS
 qv9ZMuswC2B1a/QQ9GRUarCIcs2QhFR90sHVtFrVxf/hOsYyRCINJFv+FEFDVDaEkZOZ
 2wLHBPbVhRW009L/bxFGQ86vPRWnjNCdGCv+J3aA7+f12wXyvX8AuiwK7aCVEJKAm55+
 DwqEkItSLF8xMUFy0vHTLEZdsZ+k8sifmBYXuaTX5lv7U/FlnnbZL1045inPE/C7TsLG
 pO7b4gHOFd8IW++E/PB1tnGTltWvGzZr5TE93SZKVTILJonLDByOtEz3AudzmW/xSA+1
 Nsiw==
X-Gm-Message-State: ACrzQf19f7jG9lLQPtfbHW7MtO9GHnf80pb7k3dI7kPXQwPl80kOO4+4
 F77bW5zDaSyr1LNEww69s7LTsDV0aX3aDzRz8jQgtpk64nlVQRa9/C1HvMbTBxgDUcoJs6b83+g
 pzbd+NOwGMBRdBwTeTD8em5tt+3h9SMNQdl/BWVlGNUAEFL0CCN5vmY1mMYSR
X-Received: by 2002:a5d:64cf:0:b0:231:2e6c:7609 with SMTP id
 f15-20020a5d64cf000000b002312e6c7609mr8100350wri.172.1667220720908; 
 Mon, 31 Oct 2022 05:52:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5xxzhP6rKYQTp+I6RTv9UTGtmRT9ex755zmxzzUQdF/KsHZPSyqP01x2fmGUBQ7gP3+/1ouA==
X-Received: by 2002:a5d:64cf:0:b0:231:2e6c:7609 with SMTP id
 f15-20020a5d64cf000000b002312e6c7609mr8100329wri.172.1667220720444; 
 Mon, 31 Oct 2022 05:52:00 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 t128-20020a1c4686000000b003cf7055c057sm3409021wma.3.2022.10.31.05.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:00 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:51:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 26/86] tests/acpi: virt: update ACPI MADT and FADT binaries
Message-ID: <20221031124928.128475-27-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Miguel Luis <miguel.luis@oracle.com>

Step 6 & 7 of the bios-tables-test.c documented procedure.

Differences between disassembled ASL files for MADT:

@@ -11,9 +11,9 @@
  */

 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
-[004h 0004   4]                 Table Length : 000000A8
-[008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : 50
+[004h 0004   4]                 Table Length : 000000AC
+[008h 0008   1]                     Revision : 04
+[009h 0009   1]                     Checksum : 47
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
@@ -34,7 +34,7 @@
 [041h 0065   3]                     Reserved : 000000

 [044h 0068   1]                Subtable Type : 0B [Generic Interrupt Controller]
-[045h 0069   1]                       Length : 4C
+[045h 0069   1]                       Length : 50
 [046h 0070   2]                     Reserved : 0000
 [048h 0072   4]         CPU Interface Number : 00000000
 [04Ch 0076   4]                Processor UID : 00000000
@@ -51,28 +51,29 @@
 [07Ch 0124   4]        Virtual GIC Interrupt : 00000000
 [080h 0128   8]   Redistributor Base Address : 0000000000000000
 [088h 0136   8]                    ARM MPIDR : 0000000000000000
-/**** ACPI subtable terminates early - may be older version (dump table) */
+[090h 0144   1]             Efficiency Class : 00
+[091h 0145   3]                     Reserved : 000000

-[090h 0144   1]                Subtable Type : 0D [Generic MSI Frame]
-[091h 0145   1]                       Length : 18
-[092h 0146   2]                     Reserved : 0000
-[094h 0148   4]                 MSI Frame ID : 00000000
-[098h 0152   8]                 Base Address : 0000000008020000
-[0A0h 0160   4]        Flags (decoded below) : 00000001
+[094h 0148   1]                Subtable Type : 0D [Generic MSI Frame]
+[095h 0149   1]                       Length : 18
+[096h 0150   2]                     Reserved : 0000
+[098h 0152   4]                 MSI Frame ID : 00000000
+[09Ch 0156   8]                 Base Address : 0000000008020000
+[0A4h 0164   4]        Flags (decoded below) : 00000001
                                   Select SPI : 1
-[0A4h 0164   2]                    SPI Count : 0040
-[0A6h 0166   2]                     SPI Base : 0050
+[0A8h 0168   2]                    SPI Count : 0040
+[0AAh 0170   2]                     SPI Base : 0050

-Raw Table Data: Length 168 (0xA8)
+Raw Table Data: Length 172 (0xAC)

-    0000: 41 50 49 43 A8 00 00 00 03 50 42 4F 43 48 53 20  // APIC.....PBOCHS
+    0000: 41 50 49 43 AC 00 00 00 04 47 42 4F 43 48 53 20  // APIC.....GBOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 00 00 00 00 00 00 00 00 0C 18 00 00  // ................
     0030: 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00 00  // ................
-    0040: 02 00 00 00 0B 4C 00 00 00 00 00 00 00 00 00 00  // .....L..........
+    0040: 02 00 00 00 0B 50 00 00 00 00 00 00 00 00 00 00  // .....P..........
     0050: 01 00 00 00 00 00 00 00 17 00 00 00 00 00 00 00  // ................
     0060: 00 00 00 00 00 00 01 08 00 00 00 00 00 00 04 08  // ................
     0070: 00 00 00 00 00 00 03 08 00 00 00 00 00 00 00 00  // ................
     0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
-    0090: 0D 18 00 00 00 00 00 00 00 00 02 08 00 00 00 00  // ................
-    00A0: 01 00 00 00 40 00 50 00                          // ....@.P.
+    0090: 00 00 00 00 0D 18 00 00 00 00 00 00 00 00 02 08  // ................
+    00A0: 00 00 00 00 01 00 00 00 40 00 50 00              // ........@.P.

Differences between disassembled ASL files for FADT:

@@ -11,9 +11,9 @@
  */

 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
-[004h 0004   4]                 Table Length : 0000010C
-[008h 0008   1]                     Revision : 05
-[009h 0009   1]                     Checksum : 55
+[004h 0004   4]                 Table Length : 00000114
+[008h 0008   1]                     Revision : 06
+[009h 0009   1]                     Checksum : 15
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
@@ -99,7 +99,7 @@
                               PSCI Compliant : 1
                        Must use HVC for PSCI : 1

-[083h 0131   1]          FADT Minor Revision : 01
+[083h 0131   1]          FADT Minor Revision : 00
 [084h 0132   8]                 FACS Address : 0000000000000000
 [08Ch 0140   8]                 DSDT Address : 0000000000000000
 [094h 0148  12]             PM1A Event Block : [Generic Address Structure]
@@ -173,11 +173,11 @@
 [103h 0259   1]         Encoded Access Width : 00 [Undefined/Legacy]
 [104h 0260   8]                      Address : 0000000000000000

-/**** ACPI table terminates in the middle of a data structure! (dump table) */
+[10Ch 0268   8]                Hypervisor ID : 00000000554D4551

-Raw Table Data: Length 268 (0x10C)
+Raw Table Data: Length 276 (0x114)

-    0000: 46 41 43 50 0C 01 00 00 05 55 42 4F 43 48 53 20  // FACP.....UBOCHS
+    0000: 46 41 43 50 14 01 00 00 06 15 42 4F 43 48 53 20  // FACP......BOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     0030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
@@ -185,7 +185,7 @@ Raw Table Data: Length 268 (0x10C)
     0050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     0060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     0070: 00 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
-    0080: 00 03 00 01 00 00 00 00 00 00 00 00 00 00 00 00  // ................
+    0080: 00 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     00A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     00B0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
@@ -193,4 +193,5 @@ Raw Table Data: Length 268 (0x10C)
     00D0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     00E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     00F0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
-    0100: 00 00 00 00 00 00 00 00 00 00 00 00              // ............
+    0100: 00 00 00 00 00 00 00 00 00 00 00 00 51 45 4D 55  // ............QEMU
+    0110: 00 00 00 00                                      // ....

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Message-Id: <20221011181730.10885-5-miguel.luis@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   6 ------
 tests/data/acpi/virt/APIC                   | Bin 168 -> 172 bytes
 tests/data/acpi/virt/APIC.memhp             | Bin 168 -> 172 bytes
 tests/data/acpi/virt/APIC.numamem           | Bin 168 -> 172 bytes
 tests/data/acpi/virt/FACP                   | Bin 268 -> 276 bytes
 tests/data/acpi/virt/FACP.memhp             | Bin 268 -> 276 bytes
 tests/data/acpi/virt/FACP.numamem           | Bin 268 -> 276 bytes
 7 files changed, 6 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 8dc50f7a8a..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,7 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/FACP",
-"tests/data/acpi/virt/FACP.numamem",
-"tests/data/acpi/virt/FACP.memhp",
-"tests/data/acpi/virt/APIC",
-"tests/data/acpi/virt/APIC.memhp",
-"tests/data/acpi/virt/APIC.numamem",
diff --git a/tests/data/acpi/virt/APIC b/tests/data/acpi/virt/APIC
index 023f15f12e74fb9a3a6d3d9dc994541016947d6a..179d274770a23209b949c90a929525e22368568b 100644
GIT binary patch
delta 26
hcmZ3%xQ3C-F~HM#4FdxMi~B?_YsP?yZeA06WB^*d2KE2|

delta 26
icmZ3(xPp<(F~HM#1p@;EbHGF{Yet`mZeA0oNB{s@&<6Sd

diff --git a/tests/data/acpi/virt/APIC.memhp b/tests/data/acpi/virt/APIC.memhp
index 023f15f12e74fb9a3a6d3d9dc994541016947d6a..179d274770a23209b949c90a929525e22368568b 100644
GIT binary patch
delta 26
hcmZ3%xQ3C-F~HM#4FdxMi~B?_YsP?yZeA06WB^*d2KE2|

delta 26
icmZ3(xPp<(F~HM#1p@;EbHGF{Yet`mZeA0oNB{s@&<6Sd

diff --git a/tests/data/acpi/virt/APIC.numamem b/tests/data/acpi/virt/APIC.numamem
index 023f15f12e74fb9a3a6d3d9dc994541016947d6a..179d274770a23209b949c90a929525e22368568b 100644
GIT binary patch
delta 26
hcmZ3%xQ3C-F~HM#4FdxMi~B?_YsP?yZeA06WB^*d2KE2|

delta 26
icmZ3(xPp<(F~HM#1p@;EbHGF{Yet`mZeA0oNB{s@&<6Sd

diff --git a/tests/data/acpi/virt/FACP b/tests/data/acpi/virt/FACP
index 1f764220f8533c427168e80ccf298604826a00b4..ac05c35a69451519bd1152c54d1e741af36390f5 100644
GIT binary patch
delta 33
ncmeBSn!?28=I9(C!pOkDCOVO;a^j?_i3a=}fv&!x3_t(?fr|$^

delta 26
hcmbQj)WgK(=I9*2!^ptE8ak1yl96%Z#OjF#yZ}u&1~C8t

diff --git a/tests/data/acpi/virt/FACP.memhp b/tests/data/acpi/virt/FACP.memhp
index 1f764220f8533c427168e80ccf298604826a00b4..ac05c35a69451519bd1152c54d1e741af36390f5 100644
GIT binary patch
delta 33
ncmeBSn!?28=I9(C!pOkDCOVO;a^j?_i3a=}fv&!x3_t(?fr|$^

delta 26
hcmbQj)WgK(=I9*2!^ptE8ak1yl96%Z#OjF#yZ}u&1~C8t

diff --git a/tests/data/acpi/virt/FACP.numamem b/tests/data/acpi/virt/FACP.numamem
index 1f764220f8533c427168e80ccf298604826a00b4..ac05c35a69451519bd1152c54d1e741af36390f5 100644
GIT binary patch
delta 33
ncmeBSn!?28=I9(C!pOkDCOVO;a^j?_i3a=}fv&!x3_t(?fr|$^

delta 26
hcmbQj)WgK(=I9*2!^ptE8ak1yl96%Z#OjF#yZ}u&1~C8t

-- 
MST


