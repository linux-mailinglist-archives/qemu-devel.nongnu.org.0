Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234394AA8ED
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 13:59:55 +0100 (CET)
Received: from localhost ([::1]:55262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGKfS-0008BE-0r
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 07:59:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGKSE-0000RA-M4
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:46:15 -0500
Received: from [2a00:1450:4864:20::42b] (port=35545
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGKSB-0006Hj-Jp
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:46:14 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m27so2343726wrb.2
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 04:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yuz/9v4u5M09P8jk52zn4t509YN+V3S2cmy3DTylfSY=;
 b=a3PVbZ/KtWYQ/Jd25/edukXNjS2/xmVcJz8QHAF8+f17cNOrHnmLqxRxqdcY+3G4F+
 UChS+MOvW76BilVatTpuric5+XCDt+OgdWNS84JeNwEU+FHCRgYISgvkE7OZ9JIldgcP
 1tVPzlievBvWoCT5czrHEphzEwrUPDt5IemofEOKbTWeXUS5T9Y35Ix0mv0GBjKj39KI
 Zi3UaUtwSQ3PYQwy6yQeD0KYl2p6xx+vaQmSQtb3ya8HI0aoRn8Uasgy3/QHT+Z8aHRX
 mtwps1uJg/86TEIlEDVKhewQbfU5Ow41NXcKORwfysj3WlcTC26evR/1dagULzXLVvV1
 rsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Yuz/9v4u5M09P8jk52zn4t509YN+V3S2cmy3DTylfSY=;
 b=v6TncPsHRXE0CcIcKLf2kYUeiYTDMRF1/gBdXH9x1G8h5HD9sgDgQ3MyOJfoYM0BrX
 zaELzRv6HJodz55oqO/4p58a4OqJ64KF847lt8QDrCk6QpMVPupUc8CADRlF0c0ndwC7
 r+AR5RtPNdLeVzbe1/zLSSfViBz8rn4k95k4zgct7bsQe4V6Lpe/PKV55e3IUWvg7vv1
 8HGCdnFCCFfBgUeKVrpUv31WgFy3ZqfenfC02vePotEDK6dUubss4QZhA5KaPPTeJRNl
 XAXImbVWP2PhRScExbdIFvOaqSE1VPNfqQGp51KoBqTpiGa8aqFnpoJ7vgLdcJcMoQZf
 GBdQ==
X-Gm-Message-State: AOAM530+pwSS2txsLbUUjasIIa8FSHOYB05zIz0SzQlZnpRvDbukZ76Z
 8iB1GtQYPiizmjIlWsUofqYU/AM8NB8=
X-Google-Smtp-Source: ABdhPJyMwPVn0urrWXsS9FK6UR3fXo9JZIdH9lq4eVClNsEQ7qtYUdMnWMMvAuSLP5x6l+1E4bZTGw==
X-Received: by 2002:a05:6000:1707:: with SMTP id
 n7mr2885350wrc.662.1644065143691; 
 Sat, 05 Feb 2022 04:45:43 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 az16sm3823560wmb.15.2022.02.05.04.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 04:45:43 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 3/4] tests/qtest/acpi: Update VIOT table blob
Date: Sat,  5 Feb 2022 13:45:25 +0100
Message-Id: <20220205124526.500158-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220205124526.500158-1-f4bug@amsat.org>
References: <20220205124526.500158-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Empty bios-tables-test-allowed-diff.h and run rebuild-expected-aml.sh
to update the VIOT blob. The iasl output diff is:

 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20210604 (64-bit version)
  * Copyright (c) 2000 - 2021 Intel Corporation
  *
  * Disassembly of tests/data/acpi/q35/VIOT.viot, Sat Feb  5 11:11:11 2022
  *
  * ACPI Data Table [VIOT]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
  */

 [000h 0000   4]                    Signature : "VIOT"    [Virtual I/O Translation Table]
 [004h 0004   4]                 Table Length : 00000070
 [008h 0008   1]                     Revision : 00
 [009h 0009   1]                     Checksum : 3D
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

 [024h 0036   2]                   Node count : 0003
 [026h 0038   2]                  Node offset : 0030
 [028h 0040   8]                     Reserved : 0000000000000000

 [030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
 [031h 0049   1]                     Reserved : 00
 [032h 0050   2]                       Length : 0010

 [034h 0052   2]                  PCI Segment : 0000
 [036h 0054   2]               PCI BDF number : 0010
 [038h 0056   8]                     Reserved : 0000000000000000

 [040h 0064   1]                         Type : 01 [PCI Range]
 [041h 0065   1]                     Reserved : 00
 [042h 0066   2]                       Length : 0018

-[044h 0068   4]               Endpoint start : 00003000
+[044h 0068   4]               Endpoint start : 00001000
 [048h 0072   2]            PCI Segment start : 0000
 [04Ah 0074   2]              PCI Segment end : 0000
-[04Ch 0076   2]                PCI BDF start : 3000
-[04Eh 0078   2]                  PCI BDF end : 30FF
+[04Ch 0076   2]                PCI BDF start : 1000
+[04Eh 0078   2]                  PCI BDF end : 10FF
 [050h 0080   2]                  Output node : 0030
 [052h 0082   6]                     Reserved : 000000000000

 [058h 0088   1]                         Type : 01 [PCI Range]
 [059h 0089   1]                     Reserved : 00
 [05Ah 0090   2]                       Length : 0018

-[05Ch 0092   4]               Endpoint start : 00001000
+[05Ch 0092   4]               Endpoint start : 00003000
 [060h 0096   2]            PCI Segment start : 0000
 [062h 0098   2]              PCI Segment end : 0000
-[064h 0100   2]                PCI BDF start : 1000
-[066h 0102   2]                  PCI BDF end : 10FF
+[064h 0100   2]                PCI BDF start : 3000
+[066h 0102   2]                  PCI BDF end : 30FF
 [068h 0104   2]                  Output node : 0030
 [06Ah 0106   6]                     Reserved : 000000000000

 Raw Table Data: Length 112 (0x70)

     0000: 56 49 4F 54 70 00 00 00 00 3D 42 4F 43 48 53 20  // VIOTp....=BOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 03 00 30 00 00 00 00 00 00 00 00 00  // ......0.........
     0030: 03 00 10 00 00 00 10 00 00 00 00 00 00 00 00 00  // ................
-    0040: 01 00 18 00 00 30 00 00 00 00 00 00 00 30 FF 30  // .....0.......0.0
-    0050: 30 00 00 00 00 00 00 00 01 00 18 00 00 10 00 00  // 0...............
-    0060: 00 00 00 00 00 10 FF 10 30 00 00 00 00 00 00 00  // ........0.......
+    0040: 01 00 18 00 00 10 00 00 00 00 00 00 00 10 FF 10  // ................
+    0050: 30 00 00 00 00 00 00 00 01 00 18 00 00 30 00 00  // 0............0..
+    0060: 00 00 00 00 00 30 FF 30 30 00 00 00 00 00 00 00  // .....0.00.......

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/q35/VIOT.viot               | Bin 112 -> 112 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 27ab8d3ba8d..dfb8523c8bf 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/VIOT.viot",
diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
index 9b179266ccbf84f1c250ee646812d17e27987764..275c78fbe8e93190321d957c91c3f17551f865d4 100644
GIT binary patch
delta 10
RcmXRYnBY1wR(PU=1OOI`1E2r^

delta 10
RcmXRYnBY1wR(PU=1OOI`1E2r^

-- 
2.34.1


