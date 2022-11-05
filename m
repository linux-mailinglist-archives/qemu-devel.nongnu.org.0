Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E93F61DC9F
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:41:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMr5-00018O-K4; Sat, 05 Nov 2022 13:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMp5-0007k8-8r
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMp3-0007pN-5w
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jPZijgQD4pKQoHCTpyhT2mwUaPeIpstutZs1Vo/yU0s=;
 b=GSeVQrR0NpeMU6RUTZxGji95+Nd1IoudPWODucs1koN1DrIuOCXN0bZGyAq89RxXr2Dmnk
 Fvc4ycZA83ckrz4+sl3PnC5WiIVFDE+XeAyRmOqIA+9JWIF9O8Gxb7HTMW/4Kzdowtv3f4
 hsHHO4jBNNTHy8EnpyzxZx9o/tCjUvU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-B5Aw5hMfNCax1xo8tKkr1w-1; Sat, 05 Nov 2022 13:19:07 -0400
X-MC-Unique: B5Aw5hMfNCax1xo8tKkr1w-1
Received: by mail-wm1-f72.google.com with SMTP id
 az40-20020a05600c602800b003cfa26c40easo439324wmb.1
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jPZijgQD4pKQoHCTpyhT2mwUaPeIpstutZs1Vo/yU0s=;
 b=F1Zg0OAWd2hVQNLI4IHmDK7Eb7cqI/PP4QGiHjJqAkHLDI2mvJcE0j4v5z++l2DPpO
 9jaJndRRfbcYSJvXEa6a/5sxzi7gqricQZlSXMDek4bFTegX9r3CGViNedWPSPsoSRAy
 SNa9amng+DNqeP+VwX0kQ5+cx9WWy1/5fVUFxZfkUHSYHFHmRKCUV6DN/MshEZaGvTYQ
 M+GgL8uIePZSUASTPaHjAmyRcUkSAwaPwCrZX98AHHvUhu9QpU0vCSoU1+8dRnz9p7bl
 kHfZHLB0dJc7+enS8u0fgtabf2UdTstL00YlmlvELSBwVu6AOGFCjiVqocphKKhLw3p+
 enFw==
X-Gm-Message-State: ACrzQf2klf/zsD0hNLhQUY3RL2wIsaFoxXLw3d6/7h1T7KKD+hnVxilX
 IzfROu9ht4r70A/gtkkBUlkzv7czSaP4S9I5Ro2GvNS0sFLvvAN103bU3dqvrkFiRgoGjFnDnbY
 ih/6PF+XZXTgKhqoeBHMABZL0/WK5oCXbwZ7QikhNuCd45hIuGBsXZoLF7UKI
X-Received: by 2002:a5d:6d02:0:b0:236:ed2d:b3eb with SMTP id
 e2-20020a5d6d02000000b00236ed2db3ebmr14122355wrq.456.1667668745324; 
 Sat, 05 Nov 2022 10:19:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM43ZM4x+qwC0D62huqjcF0uICibRErdxoGcrlGbl+dRQKq6vQ8GlhrTyRSZ/J7IhsXpl4qLCQ==
X-Received: by 2002:a5d:6d02:0:b0:236:ed2d:b3eb with SMTP id
 e2-20020a5d6d02000000b00236ed2db3ebmr14122329wrq.456.1667668744828; 
 Sat, 05 Nov 2022 10:19:04 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b003c6bd12ac27sm3232641wmb.37.2022.11.05.10.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:19:04 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:19:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 74/81] tests: virt: Update expected *.acpihmatvirt tables
Message-ID: <20221105171116.432921-75-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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

From: Hesham Almatary <hesham.almatary@huawei.com>

* Expected ACPI Data Table [HMAT]
[000h 0000   4]                    Signature : "HMAT"    [Heterogeneous
Memory Attributes Table]
[004h 0004   4]                 Table Length : 00000120
[008h 0008   1]                     Revision : 02
[009h 0009   1]                     Checksum : 4F
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]                     Reserved : 00000000

[028h 0040   2]               Structure Type : 0000 [Memory Proximity
Domain Attributes]
[02Ah 0042   2]                     Reserved : 0000
[02Ch 0044   4]                       Length : 00000028
[030h 0048   2]        Flags (decoded below) : 0001
            Processor Proximity Domain Valid : 1
[032h 0050   2]                    Reserved1 : 0000
[034h 0052   4]   Processor Proximity Domain : 00000000
[038h 0056   4]      Memory Proximity Domain : 00000000
[03Ch 0060   4]                    Reserved2 : 00000000
[040h 0064   8]                    Reserved3 : 0000000000000000
[048h 0072   8]                    Reserved4 : 0000000000000000

[050h 0080   2]               Structure Type : 0000 [Memory Proximity
Domain Attributes]
[052h 0082   2]                     Reserved : 0000
[054h 0084   4]                       Length : 00000028
[058h 0088   2]        Flags (decoded below) : 0001
            Processor Proximity Domain Valid : 1
[05Ah 0090   2]                    Reserved1 : 0000
[05Ch 0092   4]   Processor Proximity Domain : 00000001
[060h 0096   4]      Memory Proximity Domain : 00000001
[064h 0100   4]                    Reserved2 : 00000000
[068h 0104   8]                    Reserved3 : 0000000000000000
[070h 0112   8]                    Reserved4 : 0000000000000000

[078h 0120   2]               Structure Type : 0000 [Memory Proximity
Domain Attributes]
[07Ah 0122   2]                     Reserved : 0000
[07Ch 0124   4]                       Length : 00000028
[080h 0128   2]        Flags (decoded below) : 0000
            Processor Proximity Domain Valid : 0
[082h 0130   2]                    Reserved1 : 0000
[084h 0132   4]   Processor Proximity Domain : 00000080
[088h 0136   4]      Memory Proximity Domain : 00000002
[08Ch 0140   4]                    Reserved2 : 00000000
[040h 0064   8]                    Reserved3 : 0000000000000000
[048h 0072   8]                    Reserved4 : 0000000000000000

[050h 0080   2]               Structure Type : 0000 [Memory Proximity
Domain Attributes]
[052h 0082   2]                     Reserved : 0000
[054h 0084   4]                       Length : 00000028
[058h 0088   2]        Flags (decoded below) : 0001
            Processor Proximity Domain Valid : 1
[05Ah 0090   2]                    Reserved1 : 0000
[05Ch 0092   4]   Processor Proximity Domain : 00000001
[060h 0096   4]      Memory Proximity Domain : 00000001
[064h 0100   4]                    Reserved2 : 00000000
[068h 0104   8]                    Reserved3 : 0000000000000000
[070h 0112   8]                    Reserved4 : 0000000000000000

[078h 0120   2]               Structure Type : 0000 [Memory Proximity
Domain Attributes]
[07Ah 0122   2]                     Reserved : 0000
[07Ch 0124   4]                       Length : 00000028
[080h 0128   2]        Flags (decoded below) : 0000
            Processor Proximity Domain Valid : 0
[082h 0130   2]                    Reserved1 : 0000
[084h 0132   4]   Processor Proximity Domain : 00000080
[088h 0136   4]      Memory Proximity Domain : 00000002
[08Ch 0140   4]                    Reserved2 : 00000000
[090h 0144   8]                    Reserved3 : 0000000000000000
[098h 0152   8]                    Reserved4 : 0000000000000000

[0A0h 0160   2]               Structure Type : 0001 [System Locality
Latency and Bandwidth Information]
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

[0E0h 0224   2]               Structure Type : 0001 [System Locality
Latency and Bandwidth Information]
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

    0000: 48 4D 41 54 20 01 00 00 02 4F 42 4F 43 48 53 20  // HMAT
....OBOCHS
    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC
....BXPC
    0020: 01 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  //
............(...
    0030: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  //
................
    0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  //
................
    0050: 00 00 00 00 28 00 00 00 01 00 00 00 01 00 00 00  //
....(...........
    0060: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  //
................
    0070: 00 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  //
............(...
    0080: 00 00 00 00 80 00 00 00 02 00 00 00 00 00 00 00  //
................
    0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  //
................
    00A0: 01 00 00 00 40 00 00 00 00 00 00 00 02 00 00 00  //
....@...........
    00B0: 03 00 00 00 00 00 00 00 10 27 00 00 00 00 00 00  //
.........'......
    00C0: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  //
................
    00D0: 02 00 00 00 01 00 02 00 03 00 02 00 01 00 03 00  //
................
    00E0: 01 00 00 00 40 00 00 00 00 03 00 00 02 00 00 00  //
....@...........
    00F0: 03 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  //
................
    0100: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  //
................
    0110: 02 00 00 00 0A 00 05 00 01 00 05 00 0A 00 01 00  //
................

Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Message-Id: <20221027100037.251-9-hesham.almatary@huawei.com>
Tested-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   5 -----
 tests/data/acpi/virt/APIC.acpihmatvirt      | Bin 0 -> 412 bytes
 tests/data/acpi/virt/DSDT.acpihmatvirt      | Bin 0 -> 5282 bytes
 tests/data/acpi/virt/HMAT.acpihmatvirt      | Bin 0 -> 288 bytes
 tests/data/acpi/virt/PPTT.acpihmatvirt      | Bin 0 -> 196 bytes
 tests/data/acpi/virt/SRAT.acpihmatvirt      | Bin 0 -> 240 bytes
 6 files changed, 5 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 4f849715bd..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,6 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/APIC.acpihmatvirt",
-"tests/data/acpi/virt/DSDT.acpihmatvirt",
-"tests/data/acpi/virt/HMAT.acpihmatvirt",
-"tests/data/acpi/virt/PPTT.acpihmatvirt",
-"tests/data/acpi/virt/SRAT.acpihmatvirt",
diff --git a/tests/data/acpi/virt/APIC.acpihmatvirt b/tests/data/acpi/virt/APIC.acpihmatvirt
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..68200204c6f8f2706c9896dbbccc5ecbec130d26 100644
GIT binary patch
literal 412
zcmbVIK?;B{46AboK|SknPton7CkI~qlV9+$HnL1S&Om7znov5&HC&a5J^dDz-T5O1
zr%*}2(TQ#(lZMPFX(J~Q?hmh|tV;Vf^*Z}MYiU3pa#)Z{^LPim$itl|>ZN(`63DA{
TK>f{wm+13f&GQ#zP7>t?q5KK~

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/DSDT.acpihmatvirt b/tests/data/acpi/virt/DSDT.acpihmatvirt
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..aee6ba017cd730948bfa93e91551eb10a6809293 100644
GIT binary patch
literal 5282
zcmZvg%WoT16o>EFlh__VVmr?J;S@^6vl`n?la{u`9y^IkoET5iAUTpNArK{-N>oUt
zLJC<FsKkOsVjWN<{tYBn?AWnj&4zz~9p>D*Gs*9?XQYhh%)RHE`;Cv|<7xWM-JeTJ
z#SR)f-lo6Q_^|6O(Pk;7^s#=;f4^ZJ4E)BRe?05CuA3Zewwu|y*KJd<qLPEXc2k+L
ziZo{RkLM__DvdcYGguP`<Nf2C-cBdFVz0C5x|K?J#pJ;2`Gr|$>S;>pWu{bKsqaRW
zWnH4^F|BBIecxL*;161zJz8y*a{b-9lcr>^ZW%<u$r(f}H63Qw?R&jQbZfh}L#fLb
zmp#wCxVWQY;l*7<g!h9Z^krW{#MA|%5+WLU72$2;2qz{nY+zK85#HSw7;%X)3XB>u
zu9+M80>hRVNnl(<#<Iv5kr)mzmXUE?WQ<CT3^1-EV?|^nBt{MxE67+C8A*we2gWKg
zZitMO#3%ye1~4k&hvS9!#gP~#VBAE8Sf>0#5|#QSFy2LmT&Edn9n-+Lg$%h)vl3$#
z7`Krj*J(~-%md>NGUPfPlNgJ@cn=wJo#rLR5-`?~A=ha^V!Q&3Ix^%sElP~bz-S;t
zuG4XeaRnG2FsgE$mL$gOz-S^vuG0yL@g^`@$dK!FQewOfjCEwlbvh+6t^#8N8FHOY
zOAHqno5+ysbVg!Sfzd{WT&J@V;~FsTB15jzIf-!{81ExPuG4vmu?mbWWXN^8ATe$N
zqXUeZT&If?;}$Tsks;S<Sz_D)#!krC{-x`+!*z7GyKdcGrRKw<rprV%-Nm#vXy0gT
zpSLCcZm&>w=DW&MZS}EQQZD^9>F5jfKz&57N<)IiqubjZ-}>A+DyHr9aHux?wyVss
zMaLCY%;@t@jDl(u#3`t$V%E+KhnCVgG%t*F7ER2Vu^^A8Mxo9melVB1Br`XRbY?V_
zS|EKzni^zMs57Ih#DmOe1#zV_qp5L|NmGMN3Uwx}D7cCpWJW8ngUo0uwM?O9kVzqW
zjxf)WAT#nDF`3cgDMZgv=1EN{ttXmFEf#uGh@J`NnP8p??nxnfCYfiFc~VP;o)n^I
zig{8yZSG!hOH$mELiBW)r^7s{g+osY(KF3F)66r?Jt;)b4D-w|PipzllS1^&GS4jY
z%yLf((KE+9bIg-kMD(N(J;#{m81o$Co)n@d{hTp19#nCjc~VP>o)n^Ifq52~XMuZC
zh@M5}S!ABnf}$sd=sC_j$C>9i_oNU#>E|bSmY65CtmsK0dQLFU3FbM$Jt;)bN#;4p
zJgLP+PYTg<ig`{k&nfOnA$rn}OYod#p41YfCxz%a!#ro0=M49x5Itv^=PdK278*S%
zM9(?qImbNbxF?0^InO-jnJ2Z}=t&`ZE-=pp=DEN<DMZgj=DEl`sYORm3emI7Jj=|p
z%snYIp8eytt=~%X^G$y#d+z%A7jc&!OXQq%@F?Qd;47WJcV9YJ8XfpOpPr2bsIX&T
zD0)tSsLKM%oI6L|)vF2{T!zxm3y}4iz%u7JD{OQ*i=G=G>x#fK=R#H~KkyoLbw>X~
zRep_j=5}l*oJZegRgC_f(>ByQ>l^xXWvIIdw)}ATpZ-}!+wdxlSQ+X8%tlQMZ9^Kh
z)U&rBCm24`V|ojsi=96ISS9_vZdWC}-QJcet)~V%zGpu>R9<txa=Mu~`Lr<Z<olh!
zYX6q!*M8i8RR8t%pPxKCbZnYXrPn0A)*k9WbM!$?qn_xUQ`Y;_{PU9s)>kxA31(ML
zC!e20^UUeI9(<@L>+@%aKjqAMeUZx9Vd<Sg)9=`)m&|JZSo!^LfBDPK4^#hiW`6TJ
zr>T?A)L9{JS$angx;l2R<+Ezk54v>C)g1Sw`xCqeba%>Y7q><q(f5scZq`T~T-DF}
zHd@VrDRJ|#uc8}Idf1nxfsk+NJZ`;VQjc0a>PzVzO{N^X|8-i2UdwN7EtM7qt$Vwv
hhdQ`_nm>7R-_iZv)9!w+;T-jkXY>Jno;-6c^*?7DCOrTE

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/HMAT.acpihmatvirt b/tests/data/acpi/virt/HMAT.acpihmatvirt
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..6494d11b9fff54f8c403ec9e4893fdff72bde9c9 100644
GIT binary patch
literal 288
zcmaJ)F%Ezr5IZ0&Og@24pP{g@7)*5VIX>Ms;S4dxCU-4Odz5uKq7kt*)m-+N&Mij(
zmQa%w6GZ=3|IM0X_Ak#IabYaQ2iTvR&x~t&7@Gj;A7o|>w!;|gr;lRa*AB0!)_xEV
I&r86*0dKzu0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/PPTT.acpihmatvirt b/tests/data/acpi/virt/PPTT.acpihmatvirt
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..710dba5e793cf36df94087666db58af5f8d03684 100644
GIT binary patch
literal 196
zcmWFt2njjDz`(#X&&l7}BUr&HBEVSz2pEB4AU23*5Mf{d(;zks0L4H+1wuhcpcogB
gWr0HsZU&Nh$YLOEC0O)!0L7SK;!rz4V$4u60KkX}0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/virt/SRAT.acpihmatvirt
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..691ef56e34bc84509270db316d908f5979c209bb 100644
GIT binary patch
literal 240
zcmWFzat!&vz`($~%E{l^BUr&HBEVSz2pEB4AU22wVHjW*g0Wzt5D{c`%t9a@6A&ZR
rfLP2(B8(b94g@$rX%;9A*9GD;YQW53aKWz*WFHuKKxqyrjba`E3*rd@

literal 0
HcmV?d00001

-- 
MST


