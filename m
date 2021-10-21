Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE68436687
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:41:37 +0200 (CEST)
Received: from localhost ([::1]:37632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaCG-0003W7-Uf
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx0-0008Ql-E0
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:50 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZww-0002AJ-Mz
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:50 -0400
Received: by mail-pg1-x535.google.com with SMTP id j190so677561pgd.0
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=98AtLq12POOkkgBDQjXH5rla+dJgZ9VKEMUq3gPivrQ=;
 b=A3RqgKXdXK5i7YFzJ7cuNwGGbAkwhHQDVEKDChyDWRXyky2UQ0OItyxRZnEkN8AFqH
 Aei9BkeEcLSFPaiGcjGKBhZvvs2vWEw2dIUubXoYUJxWWoUJg+lNwwAYoWNgC5nx1I5h
 gK9LMGtZfHU7P817A4ERIOA6OwanS8De84Bnt6jkavaeJ/iuNBrVAJAckX4KVcGyTrgw
 RXK55GtxDX6LE1vrV/ZFDdNpc/Rw6jzU4w4SM0txw5r0pHtWXNgcdVCRF7sRTQP0WJHN
 +ZY91e57ErpB03UMoJ7abl/1/THG0ESHUgNKWeuVEguTNB6ySPKfZMrJgl3NJNw+hFY9
 V2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=98AtLq12POOkkgBDQjXH5rla+dJgZ9VKEMUq3gPivrQ=;
 b=rZAFsMMFVl/uVyBVf5xfvXI5E/w2ORJR3AFP8v35Azg/IaIQvJ2Yj0wdukgT6wIXog
 lipd+3+dDL2kbXlT6GatfmuIanbqclyu1fpdFc/CWl+fnzOL0z0Tn974uJLwJsiIKuBt
 hD3DR4+33MzHnhI0ieuIestoTSW2xq421rYnPB/vCU62dfdBwDMChiHE73napKmZyR4W
 3LeXt4ECvSl898zA86MpQm5bEgtx46k2kXMpMOdBQoUJ2XL3gJOp7TqICf1A0+fH1iXd
 whek7A0IrDlYw3Y62dKYkTjfvekuTAMi39iGlH4zckLm+O0h81Hbn8lYouER8s40QFEe
 Gr+w==
X-Gm-Message-State: AOAM531SEO5AoMN7uyVAnKpFR9jHCiGTiCGMbhJkROn5KU1eSqYl+kX1
 SGC9lfKzK6C55CK3zQhmlnuVAqjCgGXfJw==
X-Google-Smtp-Source: ABdhPJypys3K7ZuIjcckPYuc0ARE/CnmD6qmLT8yxLUueEId4efgpYXw5AivZ/4JRPzLGi0UH3GkcA==
X-Received: by 2002:a05:6a00:14cc:b0:44d:ebab:2e16 with SMTP id
 w12-20020a056a0014cc00b0044debab2e16mr6250343pfu.23.1634829944567; 
 Thu, 21 Oct 2021 08:25:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/19] tests/acpi: Generate reference blob for IORT rev E.b
Date: Thu, 21 Oct 2021 08:25:25 -0700
Message-Id: <20211021152541.781175-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Eric Auger <eric.auger@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20211014115643.756977-4-eric.auger@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/virt/IORT                   | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.memhp             | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.numamem           | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.pxb               | Bin 124 -> 128 bytes
 5 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 9a5a923d6b..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/IORT",
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

-- 
2.25.1


