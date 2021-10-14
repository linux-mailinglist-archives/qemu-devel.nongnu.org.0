Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F9942D8D3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 14:06:15 +0200 (CEST)
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mazUz-0001Rc-Vv
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 08:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mazMV-0001Nd-UR
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 07:57:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mazMT-0006Gz-RB
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 07:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634212645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zi3AU8T9r6JvKwVRjA0kBk/kdIl3PMyx+23DBoDs0Sg=;
 b=QK/UFnWPBBaaHfZC6mkIea26fnoZwzcz+AkqyER34hc94TTAe6Wl5BWQmjMDK242696yNQ
 A2Uh/JMLVSQiVQOW7A7zIMI1gHnAlpp3Bs5PzjECpsyngdGOUkom8tFZqFh8oygX8tMaRO
 xF0iz0tem6yU8dPzJnJq1UZmr7u4tXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-1Y87t_9iP7ymtR9GqMT_RA-1; Thu, 14 Oct 2021 07:57:22 -0400
X-MC-Unique: 1Y87t_9iP7ymtR9GqMT_RA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A06B801ADA;
 Thu, 14 Oct 2021 11:57:20 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 566D719D9F;
 Thu, 14 Oct 2021 11:57:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 mst@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, shameerali.kolothum.thodi@huawei.com,
 ardb@kernel.org, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, drjones@redhat.com
Subject: [PATCH v3 3/3] tests/acpi: Generate reference blob for IORT rev E.b
Date: Thu, 14 Oct 2021 13:56:43 +0200
Message-Id: <20211014115643.756977-4-eric.auger@redhat.com>
In-Reply-To: <20211014115643.756977-1-eric.auger@redhat.com>
References: <20211014115643.756977-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Re-generate reference blobs with rebuild-expected-aml.sh.

Differences reported by "make check V=1" are listed below
(IORT.numamem). Differences for other variants are similar.

 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20180629 (64-bit version)
  * Copyright (c) 2000 - 2018 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/IORT.numamem, Thu Oct 14 06:13:19 2021
+ * Disassembly of /tmp/aml-K8L9A1, Thu Oct 14 06:13:19 2021
  *
  * ACPI Data Table [IORT]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
  */

 [000h 0000   4]                    Signature : "IORT"    [IO Remapping Table]
-[004h 0004   4]                 Table Length : 0000007C
-[008h 0008   1]                     Revision : 00
-[009h 0009   1]                     Checksum : 07
+[004h 0004   4]                 Table Length : 00000080
+[008h 0008   1]                     Revision : 03
+[009h 0009   1]                     Checksum : B3
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

 [024h 0036   4]                   Node Count : 00000002
 [028h 0040   4]                  Node Offset : 00000030
 [02Ch 0044   4]                     Reserved : 00000000

 [030h 0048   1]                         Type : 00
 [031h 0049   2]                       Length : 0018
-[033h 0051   1]                     Revision : 00
+[033h 0051   1]                     Revision : 01
 [034h 0052   4]                     Reserved : 00000000
 [038h 0056   4]                Mapping Count : 00000000
 [03Ch 0060   4]               Mapping Offset : 00000000

 [040h 0064   4]                     ItsCount : 00000001
 [044h 0068   4]                  Identifiers : 00000000

 [048h 0072   1]                         Type : 02
-[049h 0073   2]                       Length : 0034
-[04Bh 0075   1]                     Revision : 00
-[04Ch 0076   4]                     Reserved : 00000000
+[049h 0073   2]                       Length : 0038
+[04Bh 0075   1]                     Revision : 03
+[04Ch 0076   4]                     Reserved : 00000001
 [050h 0080   4]                Mapping Count : 00000001
-[054h 0084   4]               Mapping Offset : 00000020
+[054h 0084   4]               Mapping Offset : 00000024

 [058h 0088   8]            Memory Properties : [IORT Memory Access Properties]
 [058h 0088   4]              Cache Coherency : 00000001
 [05Ch 0092   1]        Hints (decoded below) : 00
                                    Transient : 0
                               Write Allocate : 0
                                Read Allocate : 0
                                     Override : 0
 [05Dh 0093   2]                     Reserved : 0000
 [05Fh 0095   1] Memory Flags (decoded below) : 03
                                    Coherency : 1
                             Device Attribute : 1
 [060h 0096   4]                ATS Attribute : 00000000
 [064h 0100   4]           PCI Segment Number : 00000000
-[068h 0104   1]            Memory Size Limit : 00
+[068h 0104   1]            Memory Size Limit : 40
 [069h 0105   3]                     Reserved : 000000

-[068h 0104   4]                   Input base : 00000000
-[06Ch 0108   4]                     ID Count : 0000FFFF
-[070h 0112   4]                  Output Base : 00000000
-[074h 0116   4]             Output Reference : 00000030
-[078h 0120   4]        Flags (decoded below) : 00000000
+[06Ch 0108   4]                   Input base : 00000000
+[070h 0112   4]                     ID Count : 0000FFFF
+[074h 0116   4]                  Output Base : 00000000
+[078h 0120   4]             Output Reference : 00000030
+[07Ch 0124   4]        Flags (decoded below) : 00000000
                               Single Mapping : 0

-Raw Table Data: Length 124 (0x7C)
+Raw Table Data: Length 128 (0x80)

-    0000: 49 4F 52 54 7C 00 00 00 00 07 42 4F 43 48 53 20  // IORT|.....BOCHS
+    0000: 49 4F 52 54 80 00 00 00 03 B3 42 4F 43 48 53 20  // IORT......BOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 02 00 00 00 30 00 00 00 00 00 00 00  // ........0.......
-    0030: 00 18 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
-    0040: 01 00 00 00 00 00 00 00 02 34 00 00 00 00 00 00  // .........4......
-    0050: 01 00 00 00 20 00 00 00 01 00 00 00 00 00 00 03  // .... ...........
-    0060: 00 00 00 00 00 00 00 00 00 00 00 00 FF FF 00 00  // ................
-    0070: 00 00 00 00 30 00 00 00 00 00 00 00              // ....0.......
+    0030: 00 18 00 01 00 00 00 00 00 00 00 00 00 00 00 00  // ................
+    0040: 01 00 00 00 00 00 00 00 02 38 00 03 01 00 00 00  // .........8......
+    0050: 01 00 00 00 24 00 00 00 01 00 00 00 00 00 00 03  // ....$...........
+    0060: 00 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00  // ........@.......
+    0070: FF FF 00 00 00 00 00 00 30 00 00 00 00 00 00 00  // ........0.......
**

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- add diff (Igor)
---
 tests/data/acpi/virt/IORT                   | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.memhp             | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.numamem           | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.pxb               | Bin 124 -> 128 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 5 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
GIT binary patch
literal 128
zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB

literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
GIT binary patch
literal 128
zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB

literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
GIT binary patch
literal 128
zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB

literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
GIT binary patch
literal 128
zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB

literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 9a5a923d6b8..dfb8523c8bf 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/IORT",
-- 
2.26.3


