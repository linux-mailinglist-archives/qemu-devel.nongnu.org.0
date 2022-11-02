Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F200561689D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:24:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGM1-0004UC-Rx; Wed, 02 Nov 2022 12:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLT-0003QR-FD
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLR-0003t6-64
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y93guMyHzkQ4nxL9TsHAld8+PW1f70GJ3l0lKpPhB08=;
 b=I8GpMSzyhLIEu8RQB4ethIELOWYrMtz6oDwozZfPaQ0yquGUXcC01KBjeodHOoiSiDirhd
 gEeDFGDOPKEq1sP9oOQHfwgK6Is05dyLX9BCQuwXhWGKWanqehZTyrzn8LKyURo7nxay4E
 MbRAmail90uYflJaPNd+seOClKbjaeg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-478-JJgSh3SINUCEykG9lQ7T3w-1; Wed, 02 Nov 2022 12:11:58 -0400
X-MC-Unique: JJgSh3SINUCEykG9lQ7T3w-1
Received: by mail-wr1-f70.google.com with SMTP id
 h18-20020adfa4d2000000b00236584fc8c7so4957447wrb.7
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y93guMyHzkQ4nxL9TsHAld8+PW1f70GJ3l0lKpPhB08=;
 b=yr6rEulXyqkJzFBQq/UiQusKkN7+ksKZaUau+3ffdJY7zBDJkTpxoATOyWXAEDe3Xx
 x/gzf1yb8V1Mn4Md1Qg7yiCY2Povx8yJ/kpqv8BEHI9FeO6uzZWXTufxaFPjj4D2gmJP
 mKaCyyFEiYUKV/30fWIGQHhmA6LkOxCc6A+dXsr8VKjKYpkMsnNl5f1PR6J2SBogfHcj
 +M9yeQGkDPBzt0A/BJlYmVmhj7bOIfemtDDyxvDJTfXVC7Oj+gWA7vCGRr5zkDPf6sUy
 23dfKFhzx16/URZlvAf2Bb1m+7X8+ExpBCrR9tSMp0nIejIAhyz36BzseabDDGek1weW
 tYfA==
X-Gm-Message-State: ACrzQf2BKHVdLcGFQkF4smmi/FVlcnZdbZXAJiLLPr4QmEJGEOM5nswx
 FjTkfw0zoHuyFoeOoTr0ycZCgLrT6x4rrFhPu2OHMQM3OsX+b8wNZKo9plIGIm0qBFI18ERkTd/
 Vcf+VZQKzi1QUbyefomLZsgPw0aXoZavg6Q/JyZ6fEwqERR2len7pY2feWLGN
X-Received: by 2002:a5d:6c6f:0:b0:236:d270:7bd2 with SMTP id
 r15-20020a5d6c6f000000b00236d2707bd2mr9835034wrz.366.1667405515663; 
 Wed, 02 Nov 2022 09:11:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Kzt9Z2T058SP5me/OdPTSlbDD8XelZJVYGpxiWfFOwF9gUIJkdpJGFIa0IRq4EL1ePAy34A==
X-Received: by 2002:a5d:6c6f:0:b0:236:d270:7bd2 with SMTP id
 r15-20020a5d6c6f000000b00236d2707bd2mr9834994wrz.366.1667405515197; 
 Wed, 02 Nov 2022 09:11:55 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bn26-20020a056000061a00b0022cd0c8c696sm13375141wrb.103.2022.11.02.09.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:54 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:11:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Brice Goglin <Brice.Goglin@inria.fr>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 73/82] tests: acpi: q35: update expected blobs
 *.hmat-noinitiators expected HMAT:
Message-ID: <20221102160336.616599-74-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Brice Goglin <Brice.Goglin@inria.fr>

[000h 0000   4]                    Signature : "HMAT"    [Heterogeneous Memory Attributes Table]
[004h 0004   4]                 Table Length : 00000120
[008h 0008   1]                     Revision : 02
[009h 0009   1]                     Checksum : 4F
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]                     Reserved : 00000000

[028h 0040   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
[02Ah 0042   2]                     Reserved : 0000
[02Ch 0044   4]                       Length : 00000028
[030h 0048   2]        Flags (decoded below) : 0001
            Processor Proximity Domain Valid : 1
[032h 0050   2]                    Reserved1 : 0000
[034h 0052   4] Attached Initiator Proximity Domain : 00000000
[038h 0056   4]      Memory Proximity Domain : 00000000
[03Ch 0060   4]                    Reserved2 : 00000000
[040h 0064   8]                    Reserved3 : 0000000000000000
[048h 0072   8]                    Reserved4 : 0000000000000000

[050h 0080   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
[052h 0082   2]                     Reserved : 0000
[054h 0084   4]                       Length : 00000028
[058h 0088   2]        Flags (decoded below) : 0001
            Processor Proximity Domain Valid : 1
[05Ah 0090   2]                    Reserved1 : 0000
[05Ch 0092   4] Attached Initiator Proximity Domain : 00000001
[060h 0096   4]      Memory Proximity Domain : 00000001
[064h 0100   4]                    Reserved2 : 00000000
[068h 0104   8]                    Reserved3 : 0000000000000000
[070h 0112   8]                    Reserved4 : 0000000000000000

[078h 0120   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
[07Ah 0122   2]                     Reserved : 0000
[07Ch 0124   4]                       Length : 00000028
[080h 0128   2]        Flags (decoded below) : 0000
            Processor Proximity Domain Valid : 0
[082h 0130   2]                    Reserved1 : 0000
[084h 0132   4] Attached Initiator Proximity Domain : 00000080
[088h 0136   4]      Memory Proximity Domain : 00000002
[08Ch 0140   4]                    Reserved2 : 00000000
[090h 0144   8]                    Reserved3 : 0000000000000000
[098h 0152   8]                    Reserved4 : 0000000000000000

[0A0h 0160   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
[0A2h 0162   2]                     Reserved : 0000
[0A4h 0164   4]                       Length : 00000040
[0A8h 0168   1]        Flags (decoded below) : 00
                            Memory Hierarchy : 0
[0A9h 0169   1]                    Data Type : 00
[0AAh 0170   2]                    Reserved1 : 0000
[0ACh 0172   4] Initiator Proximity Domains # : 00000002
[0B0h 0176   4]   Target Proximity Domains # : 00000003
[0B4h 0180   4]                    Reserved2 : 00000000
[0B8h 0184   8]              Entry Base Unit : 0000000000002710
[0C0h 0192   4] Initiator Proximity Domain List : 00000000
[0C4h 0196   4] Initiator Proximity Domain List : 00000001
[0C8h 0200   4] Target Proximity Domain List : 00000000
[0CCh 0204   4] Target Proximity Domain List : 00000001
[0D0h 0208   4] Target Proximity Domain List : 00000002
[0D4h 0212   2]                        Entry : 0001
[0D6h 0214   2]                        Entry : 0002
[0D8h 0216   2]                        Entry : 0003
[0DAh 0218   2]                        Entry : 0002
[0DCh 0220   2]                        Entry : 0001
[0DEh 0222   2]                        Entry : 0003

[0E0h 0224   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
[0E2h 0226   2]                     Reserved : 0000
[0E4h 0228   4]                       Length : 00000040
[0E8h 0232   1]        Flags (decoded below) : 00
                            Memory Hierarchy : 0
[0E9h 0233   1]                    Data Type : 03
[0EAh 0234   2]                    Reserved1 : 0000
[0ECh 0236   4] Initiator Proximity Domains # : 00000002
[0F0h 0240   4]   Target Proximity Domains # : 00000003
[0F4h 0244   4]                    Reserved2 : 00000000
[0F8h 0248   8]              Entry Base Unit : 0000000000000001
[100h 0256   4] Initiator Proximity Domain List : 00000000
[104h 0260   4] Initiator Proximity Domain List : 00000001
[108h 0264   4] Target Proximity Domain List : 00000000
[10Ch 0268   4] Target Proximity Domain List : 00000001
[110h 0272   4] Target Proximity Domain List : 00000002
[114h 0276   2]                        Entry : 000A
[116h 0278   2]                        Entry : 0005
[118h 0280   2]                        Entry : 0001
[11Ah 0282   2]                        Entry : 0005
[11Ch 0284   2]                        Entry : 000A
[11Eh 0286   2]                        Entry : 0001

Raw Table Data: Length 288 (0x120)

    0000: 48 4D 41 54 20 01 00 00 02 4F 42 4F 43 48 53 20  // HMAT ....OBOCHS
    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
    0020: 01 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  // ............(...
    0030: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0050: 00 00 00 00 28 00 00 00 01 00 00 00 01 00 00 00  // ....(...........
    0060: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0070: 00 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  // ............(...
    0080: 00 00 00 00 80 00 00 00 02 00 00 00 00 00 00 00  // ................
    0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00A0: 01 00 00 00 40 00 00 00 00 00 00 00 02 00 00 00  // ....@...........
    00B0: 03 00 00 00 00 00 00 00 10 27 00 00 00 00 00 00  // .........'......
    00C0: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  // ................
    00D0: 02 00 00 00 01 00 02 00 03 00 02 00 01 00 03 00  // ................
    00E0: 01 00 00 00 40 00 00 00 00 03 00 00 02 00 00 00  // ....@...........
    00F0: 03 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  // ................
    0100: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  // ................
    0110: 02 00 00 00 0A 00 05 00 01 00 05 00 0A 00 01 00  // ................

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Message-Id: <20221027100037.251-5-hesham.almatary@huawei.com>
Tested-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h   |   4 ----
 tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8691 bytes
 tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
 tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
 5 files changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 245fa66bcc..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/APIC.acpihmat-noinitiator",
-"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
-"tests/data/acpi/q35/HMAT.acpihmat-noinitiator",
-"tests/data/acpi/q35/SRAT.acpihmat-noinitiator",
diff --git a/tests/data/acpi/q35/APIC.acpihmat-noinitiator b/tests/data/acpi/q35/APIC.acpihmat-noinitiator
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..d904d4a70ddecbb79a83a267af8e26f925e9f4c6 100644
GIT binary patch
literal 144
zcmZ<^@N}NQz`(%h?d0$55v<@85#X!<1dKp25F11@Fg*ANra6G>KwJ(+MhMNs1fiLk
tK{O)|Nb<lx5Xr;^#2^NU#mWk#c|j~rP8f>|r~o3y%?)O;u>A)b0RWi;3;_TD

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/acpi/q35/DSDT.acpihmat-noinitiator
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..8efa1c5ded52b8a9dfbb6945a3c75cdc6ef9b277 100644
GIT binary patch
literal 8691
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

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/HMAT.acpihmat-noinitiator b/tests/data/acpi/q35/HMAT.acpihmat-noinitiator
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..6494d11b9fff54f8c403ec9e4893fdff72bde9c9 100644
GIT binary patch
literal 288
zcmaJ)F%Ezr5IZ0&Og@24pP{g@7)*5VIX>Ms;S4dxCU-4Odz5uKq7kt*)m-+N&Mij(
zmQa%w6GZ=3|IM0X_Ak#IabYaQ2iTvR&x~t&7@Gj;A7o|>w!;|gr;lRa*AB0!)_xEV
I&r86*0dKzu0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/SRAT.acpihmat-noinitiator b/tests/data/acpi/q35/SRAT.acpihmat-noinitiator
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..a11d3119ab3538d9cf821a4fe0fccb0f1dc96359 100644
GIT binary patch
literal 312
zcmWFzatyIxWME)?>E!S15v<@85#X!<1VAAM5F12;FdPVA@EK9%8JW=d%*cF34Y)~A
u1{YiayE>qSVDJGh4QBww88zTMCa6LfjpA-b4Y)81R2_^)QwNnLKmh<Kp$P#1

literal 0
HcmV?d00001

-- 
MST


