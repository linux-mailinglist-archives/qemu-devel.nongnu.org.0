Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E63365E7E4
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:33:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMN7-0004JZ-Fz; Thu, 05 Jan 2023 04:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMN4-0004IQ-J7
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:17:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMN1-0007i0-Pm
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:17:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=42eEBg1Y5QA2bIupu3kj4wjuENoQcVq+79ay8y26Ts4=;
 b=ReC4ZNtKUsXzpWwozfjGS7WJTak9rcIUaJb75YLzWFvRoN3znuuVyZ4Fq6Rsx4C2PWAgsd
 /TvA+BnBK3DkUTnJ9s4gYrJu/A/bBgBfoxVMT9apOVdj0ytVC2a5Cr3WKAtoqYj/uLcZHe
 dHn/hkKt5jkjXGwD9ELMFpoqywXXeS4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-ySU3VWPoOPiGSRLfE_7Ufg-1; Thu, 05 Jan 2023 04:17:06 -0500
X-MC-Unique: ySU3VWPoOPiGSRLfE_7Ufg-1
Received: by mail-wr1-f72.google.com with SMTP id
 v4-20020adfa1c4000000b002753317406aso3916724wrv.21
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=42eEBg1Y5QA2bIupu3kj4wjuENoQcVq+79ay8y26Ts4=;
 b=VdHCCNQMwyrpkgC3DBWfjHLjja7t+xvVrWZD+yp9ESuVjtpAdVyxwOsRqwlJhFFyT1
 iMH3uaV6AWNEdd9OZNiX0lp2uMqiszdD5N7WBizZEGEFZ/X1uOSXn/MF2GyBmCJFu6KA
 dhbomZ2/VzqxlUmVwcGIDyfPXq50otOO2s1MM/3udrVBEm2lFOuoKz38IVAkKaxRngmj
 3xirjvHUK3SnDczS1G7DY5uIKqtLGMvKFjfo+d7tWLakI83DsCHkmwQkAfVVrSRJ0EHb
 nigCLrvvZhyB2C6w4vHjsfXtXvShF0jNRIDmGXtrrSH1ohcysuAdZ/llwrN1XC9zcAGv
 koOQ==
X-Gm-Message-State: AFqh2kojHJ6EIc/3Ztf0m9yrqpe/wDfbHOdK2V4Kgw2XEPvQfCRBOgjd
 FO4FXEgakJTY945JLFoUF8TFFklNpHW6M+WPRiiNsrlV4vKSdBtlnwlxSvU6K2MLlDjulRvzCg6
 Dp2nj6NDdCDfAfDcCXSkdcY/nxaSKqCRZTpqH1HvH4OBfk2PHUTmkrJhDDMvS
X-Received: by 2002:a05:600c:4e4f:b0:3cf:9d32:db67 with SMTP id
 e15-20020a05600c4e4f00b003cf9d32db67mr35264652wmq.3.1672910223335; 
 Thu, 05 Jan 2023 01:17:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtFVwsoLatHXy3evYUgpMzBq9UbVIBce7+Tdkyt/BUlq5HyoTPUZgm44kdETM/tKbZZQv3apQ==
X-Received: by 2002:a05:600c:4e4f:b0:3cf:9d32:db67 with SMTP id
 e15-20020a05600c4e4f00b003cf9d32db67mr35264621wmq.3.1672910222874; 
 Thu, 05 Jan 2023 01:17:02 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c71358a42dsm2186117wmq.18.2023.01.05.01.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:17:02 -0800 (PST)
Date: Thu, 5 Jan 2023 04:17:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 49/51] tests: acpi: aarch64: Add *.topology tables
Message-ID: <20230105091310.263867-50-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
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

From: Yicong Yang <yangyicong@hisilicon.com>

Add *.topology tables for the aarch64's topology test and empty
bios-tables-test-allowed-diff.h

The disassembled differences between actual and expected
PPTT (the table which we actually care about):

 +/*
 + * Intel ACPI Component Architecture
 + * AML/ASL+ Disassembler version 20180105 (64-bit version)
 + * Copyright (c) 2000 - 2018 Intel Corporation
 + *
 + * Disassembly of /tmp/aml-WUN4U1, Tue Nov  1 09:51:52 2022
 + *
 + * ACPI Data Table [PPTT]
 + *
 + * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 + */
 +
 +[000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
 +[004h 0004   4]                 Table Length : 00000150
 +[008h 0008   1]                     Revision : 02
 +[009h 0009   1]                     Checksum : 7C
 +[00Ah 0010   6]                       Oem ID : "BOCHS "
 +[010h 0016   8]                 Oem Table ID : "BXPC    "
 +[018h 0024   4]                 Oem Revision : 00000001
 +[01Ch 0028   4]              Asl Compiler ID : "BXPC"
 +[020h 0032   4]        Asl Compiler Revision : 00000001
 +
 +
 +[024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[025h 0037   1]                       Length : 14
 +[026h 0038   2]                     Reserved : 0000
 +[028h 0040   4]        Flags (decoded below) : 00000001
 +                            Physical package : 1
 +                     ACPI Processor ID valid : 0
 +[02Ch 0044   4]                       Parent : 00000000
 +[030h 0048   4]            ACPI Processor ID : 00000000
 +[034h 0052   4]      Private Resource Number : 00000000
 +
 +[038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[039h 0057   1]                       Length : 14
 +[03Ah 0058   2]                     Reserved : 0000
 +[03Ch 0060   4]        Flags (decoded below) : 00000000
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 0
 +[040h 0064   4]                       Parent : 00000024
 +[044h 0068   4]            ACPI Processor ID : 00000000
 +[048h 0072   4]      Private Resource Number : 00000000
 +
 +[04Ch 0076   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[04Dh 0077   1]                       Length : 14
 +[04Eh 0078   2]                     Reserved : 0000
 +[050h 0080   4]        Flags (decoded below) : 00000000
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 0
 +[054h 0084   4]                       Parent : 00000038
 +[058h 0088   4]            ACPI Processor ID : 00000000
 +[05Ch 0092   4]      Private Resource Number : 00000000
 +
 +[060h 0096   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[061h 0097   1]                       Length : 14
 +[062h 0098   2]                     Reserved : 0000
 +[064h 0100   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[068h 0104   4]                       Parent : 0000004C
 +[06Ch 0108   4]            ACPI Processor ID : 00000000
 +[070h 0112   4]      Private Resource Number : 00000000
 +
 +[074h 0116   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[075h 0117   1]                       Length : 14
 +[076h 0118   2]                     Reserved : 0000
 +[078h 0120   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[07Ch 0124   4]                       Parent : 0000004C
 +[080h 0128   4]            ACPI Processor ID : 00000001
 +[084h 0132   4]      Private Resource Number : 00000000
 +
 +[088h 0136   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[089h 0137   1]                       Length : 14
 +[08Ah 0138   2]                     Reserved : 0000
 +[08Ch 0140   4]        Flags (decoded below) : 00000000
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 0
 +[090h 0144   4]                       Parent : 00000038
 +[094h 0148   4]            ACPI Processor ID : 00000001
 +[098h 0152   4]      Private Resource Number : 00000000
 +
 +[09Ch 0156   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[09Dh 0157   1]                       Length : 14
 +[09Eh 0158   2]                     Reserved : 0000
 +[0A0h 0160   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[0A4h 0164   4]                       Parent : 00000088
 +[0A8h 0168   4]            ACPI Processor ID : 00000002
 +[0ACh 0172   4]      Private Resource Number : 00000000
 +
 +[0B0h 0176   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[0B1h 0177   1]                       Length : 14
 +[0B2h 0178   2]                     Reserved : 0000
 +[0B4h 0180   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[0B8h 0184   4]                       Parent : 00000088
 +[0BCh 0188   4]            ACPI Processor ID : 00000003
 +[0C0h 0192   4]      Private Resource Number : 00000000
 +
 +[0C4h 0196   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[0C5h 0197   1]                       Length : 14
 +[0C6h 0198   2]                     Reserved : 0000
 +[0C8h 0200   4]        Flags (decoded below) : 00000000
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 0
 +[0CCh 0204   4]                       Parent : 00000024
 +[0D0h 0208   4]            ACPI Processor ID : 00000001
 +[0D4h 0212   4]      Private Resource Number : 00000000
 +
 +[0D8h 0216   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[0D9h 0217   1]                       Length : 14
 +[0DAh 0218   2]                     Reserved : 0000
 +[0DCh 0220   4]        Flags (decoded below) : 00000000
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 0
 +[0E0h 0224   4]                       Parent : 000000C4
 +[0E4h 0228   4]            ACPI Processor ID : 00000000
 +[0E8h 0232   4]      Private Resource Number : 00000000
 +
 +[0ECh 0236   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[0EDh 0237   1]                       Length : 14
 +[0EEh 0238   2]                     Reserved : 0000
 +[0F0h 0240   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[0F4h 0244   4]                       Parent : 000000D8
 +[0F8h 0248   4]            ACPI Processor ID : 00000004
 +[0FCh 0252   4]      Private Resource Number : 00000000
 +
 +[100h 0256   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[101h 0257   1]                       Length : 14
 +[102h 0258   2]                     Reserved : 0000
 +[104h 0260   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[108h 0264   4]                       Parent : 000000D8
 +[10Ch 0268   4]            ACPI Processor ID : 00000005
 +[110h 0272   4]      Private Resource Number : 00000000
 +
 +[114h 0276   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[115h 0277   1]                       Length : 14
 +[116h 0278   2]                     Reserved : 0000
 +[118h 0280   4]        Flags (decoded below) : 00000000
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 0
 +[11Ch 0284   4]                       Parent : 000000C4
 +[120h 0288   4]            ACPI Processor ID : 00000001
 +[124h 0292   4]      Private Resource Number : 00000000
 +
 +[128h 0296   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[129h 0297   1]                       Length : 14
 +[12Ah 0298   2]                     Reserved : 0000
 +[12Ch 0300   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[130h 0304   4]                       Parent : 00000114
 +[134h 0308   4]            ACPI Processor ID : 00000006
 +[138h 0312   4]      Private Resource Number : 00000000
 +
 +[13Ch 0316   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[13Dh 0317   1]                       Length : 14
 +[13Eh 0318   2]                     Reserved : 0000
 +[140h 0320   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[144h 0324   4]                       Parent : 00000114
 +[148h 0328   4]            ACPI Processor ID : 00000007
 +[14Ch 0332   4]      Private Resource Number : 00000000
 +
 +Raw Table Data: Length 336 (0x150)
 +
 +  0000: 50 50 54 54 50 01 00 00 02 7C 42 4F 43 48 53 20  // PPTTP....|BOCHS
 +  0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
 +  0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
 +  0030: 00 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
 +  0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // $...............
 +  0050: 00 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  // ....8...........
 +  0060: 00 14 00 00 0E 00 00 00 4C 00 00 00 00 00 00 00  // ........L.......
 +  0070: 00 00 00 00 00 14 00 00 0E 00 00 00 4C 00 00 00  // ............L...
 +  0080: 01 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
 +  0090: 38 00 00 00 01 00 00 00 00 00 00 00 00 14 00 00  // 8...............
 +  00A0: 0E 00 00 00 88 00 00 00 02 00 00 00 00 00 00 00  // ................
 +  00B0: 00 14 00 00 0E 00 00 00 88 00 00 00 03 00 00 00  // ................
 +  00C0: 00 00 00 00 00 14 00 00 00 00 00 00 24 00 00 00  // ............$...
 +  00D0: 01 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
 +  00E0: C4 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // ................
 +  00F0: 0E 00 00 00 D8 00 00 00 04 00 00 00 00 00 00 00  // ................
 +  0100: 00 14 00 00 0E 00 00 00 D8 00 00 00 05 00 00 00  // ................
 +  0110: 00 00 00 00 00 14 00 00 00 00 00 00 C4 00 00 00  // ................
 +  0120: 01 00 00 00 00 00 00 00 00 14 00 00 0E 00 00 00  // ................
 +  0130: 14 01 00 00 06 00 00 00 00 00 00 00 00 14 00 00  // ................
 +  0140: 0E 00 00 00 14 01 00 00 07 00 00 00 00 00 00 00  // ................

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Message-Id: <20221229065513.55652-7-yangyicong@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   3 ---
 tests/data/acpi/virt/APIC.topology          | Bin 0 -> 732 bytes
 tests/data/acpi/virt/DSDT.topology          | Bin 0 -> 5398 bytes
 tests/data/acpi/virt/PPTT.topology          | Bin 0 -> 336 bytes
 4 files changed, 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 90f53f9c1d..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/APIC.topology",
-"tests/data/acpi/virt/DSDT.topology",
-"tests/data/acpi/virt/PPTT.topology",
diff --git a/tests/data/acpi/virt/APIC.topology b/tests/data/acpi/virt/APIC.topology
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..3a6ac525e7faeaec025fa6b3fc01dc67110e1296 100644
GIT binary patch
literal 732
zcmbV~I}XAy5JV@5`A9$wWsU-I0~MBNI4nouFziE~Aj){8k#|;}Cl|hyTYmRadQJCy
zeT>ty<T2DqV&=5=Cr{dXimG<SN%H;UZxvHl@27eWbN}yJ4e;RDte5iq4!ZDoC-#0R
zkFEu8h=5ypbS-!(0&eBewcxEH;8q@83*I^cZspOn;B6w{RvumJF#pT``>$Z0RrCRg
C#|;4h

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/DSDT.topology b/tests/data/acpi/virt/DSDT.topology
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..501314c91be01d927fd125e0c72e919fdd85592e 100644
GIT binary patch
literal 5398
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
My@B5+&m2qr5A>`*Jpcdz

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/PPTT.topology b/tests/data/acpi/virt/PPTT.topology
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..3fbcae5ff08aaf16fedf4da45e941661d79c1174 100644
GIT binary patch
literal 336
zcmWFt2nh*bWME*baq@Te2v%^42yj*a0-z8Bhz+6{L>L&rG>8oYKrs+dflv?<DrSKu
z#s}p4;1GkGi=-D>45YUMh?!vef$Csl%t&G&Cde(wdO>1GKm-gx_1*yTS+Iz)B8h>R
aAic=uf$S9l3b27BK>%tVNQ@mK!T<mOd=3Es

literal 0
HcmV?d00001

-- 
MST


