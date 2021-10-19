Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FB54334A5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:27:27 +0200 (CEST)
Received: from localhost ([::1]:53608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnHC-0000qY-H1
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnA6-00006n-6m
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcn9z-0001pJ-QM
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q8HkFq1zNtlwzux0hXle1dIWLbUMV3WzdovaxjwiAxU=;
 b=Rt5VoEO63icDpk2Vv8zzoK2FfFOdETULcKpzQXJMan/KnRLLNn94AQJH6UJ/3VetadHdlm
 dxJ6SCeJeyOdsLKw2A/0cO18G8lyhDeXjA6GcOHF6Zf50agxvONcj4SfH+3aFbGWTVB/T1
 0N8coLPJnbp48I/eLtrLst/EXAqHplE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-_I4IpTppO_-n7lkGR29_AA-1; Tue, 19 Oct 2021 07:19:57 -0400
X-MC-Unique: _I4IpTppO_-n7lkGR29_AA-1
Received: by mail-ed1-f69.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso17195526edj.20
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q8HkFq1zNtlwzux0hXle1dIWLbUMV3WzdovaxjwiAxU=;
 b=ewsuc1AlHwa+ypzti8tcPE7ySUH6304s/gAYSWnWcaQLmizpjbO6XHvDMPI2tmG0sT
 v/X5p0+9hl5IZEFPjrInpkU3EcgRzY2I+Pp7rNyclxQJ7r6vKo5xTz7q1pCAMuX0DYyq
 IVwrL1PpZAsduEnx2pTWXDjtbZvkLQi4iRppMrOMwuT/z0CNWTk/tGZ+JphcyQcAi2cO
 H0o7TePm4+pFnI1vM+bHyGMt1oar47K0sC61cLHOhfjbNQ4B8SV+sl/rRCeLYokqEMAs
 itkKzaXM7K+xixGOT+6yDAtetddt+6tD1v6633AIzM48NoPio8RScdvCn0UHOkkylJOo
 +tHg==
X-Gm-Message-State: AOAM532b2Nr1ZGAU9X65aFr92cpk6iFZML9ETTMYk+R8zattYnvhvKFK
 FxdZ5s3DU2d3WFKLe68txan2p6r5N+v2ale3SBK6SNLpEU2YJRZVxM85XAry4umP1shwtjlFg0y
 RKyT6yerowknityXMd3zhlkcJu6UQ56CmFanTklNlusG4WT0SPkhlWLneJW3S
X-Received: by 2002:a17:906:f8d0:: with SMTP id
 lh16mr35510460ejb.367.1634642395148; 
 Tue, 19 Oct 2021 04:19:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUH+AlMsjRixhU8Sd68650lBYY1UFMh+AQcZDk3xqg9KnNvItUvdqlv6PUu4eZDtv7Iwt34w==
X-Received: by 2002:a17:906:f8d0:: with SMTP id
 lh16mr35510378ejb.367.1634642394265; 
 Tue, 19 Oct 2021 04:19:54 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id v19sm10350800ejx.26.2021.10.19.04.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:19:53 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:19:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/29] tests: acpi: update expected tables blobs
Message-ID: <20211019111923.679826-6-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Update adds CPU entries to MADT/SRAT/FACP and DSDT to cover 288 CPUs.
Notable changes are that CPUs with APIC ID 255 and higher
use 'Processor Local x2APIC Affinity' structure in SRAT and
"Device" element in DSDT.

FACP:
-                 Use APIC Cluster Model (V4) : 0
+                 Use APIC Cluster Model (V4) : 1

SRAT:
...
+[1010h 4112   1]                Subtable Type : 00 [Processor Local APIC/SAPIC Affinity]
+[1011h 4113   1]                       Length : 10
+
+[1012h 4114   1]      Proximity Domain Low(8) : 00
+[1013h 4115   1]                      Apic ID : FE
+[1014h 4116   4]        Flags (decoded below) : 00000001
+                                     Enabled : 1
+[1018h 4120   1]              Local Sapic EID : 00
+[1019h 4121   3]    Proximity Domain High(24) : 000000
+[101Ch 4124   4]                 Clock Domain : 00000000
+
+[1020h 4128   1]                Subtable Type : 02 [Processor Local x2APIC Affinity]
+[1021h 4129   1]                       Length : 18
+
+[1022h 4130   2]                    Reserved1 : 0000
+[1024h 4132   4]             Proximity Domain : 00000001
+[1028h 4136   4]                      Apic ID : 000000FF
+[102Ch 4140   4]        Flags (decoded below) : 00000001
+                                     Enabled : 1
+[1030h 4144   4]                 Clock Domain : 00000000
+[1034h 4148   4]                    Reserved2 : 00000000

...

+[1320h 4896   1]                Subtable Type : 02 [Processor Local x2APIC Affinity]
+[1321h 4897   1]                       Length : 18
+
+[1322h 4898   2]                    Reserved1 : 0000
+[1324h 4900   4]             Proximity Domain : 00000001
+[1328h 4904   4]                      Apic ID : 0000011F
+[132Ch 4908   4]        Flags (decoded below) : 00000001
+                                     Enabled : 1
+[1330h 4912   4]                 Clock Domain : 00000000
+[1334h 4916   4]                    Reserved2 : 00000000

DSDT:

...
+            Processor (C0FE, 0xFE, 0x00000000, 0x00)
+            {
...
+            }
+
+            Device (C0FF)
+            {
+                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
+                Name (_UID, 0xFF)  // _UID: Unique ID
...
+            }

+            Device (C11F)
+            {
+                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
+                Name (_UID, 0x011F)  // _UID: Unique ID
...
+            }

APIC:
+[034h 0052   1]                Subtable Type : 00 [Processor Local APIC]
+[035h 0053   1]                       Length : 08
+[036h 0054   1]                 Processor ID : 01
+[037h 0055   1]                Local Apic ID : 01
+[038h 0056   4]        Flags (decoded below) : 00000000
+                           Processor Enabled : 0

...

+[81Ch 2076   1]                Subtable Type : 00 [Processor Local APIC]
+[81Dh 2077   1]                       Length : 08
+[81Eh 2078   1]                 Processor ID : FE
+[81Fh 2079   1]                Local Apic ID : FE
+[820h 2080   4]        Flags (decoded below) : 00000000
+                           Processor Enabled : 0
+
+[824h 2084   1]                Subtable Type : 09 [Processor Local x2APIC]
+[825h 2085   1]                       Length : 10
+[826h 2086   2]                     Reserved : 0000
+[828h 2088   4]          Processor x2Apic ID : 000000FF
+[82Ch 2092   4]        Flags (decoded below) : 00000000
+                           Processor Enabled : 0
+[830h 2096   4]                Processor UID : 000000FF

...

+[A24h 2596   1]                Subtable Type : 09 [Processor Local x2APIC]
+[A25h 2597   1]                       Length : 10
+[A26h 2598   2]                     Reserved : 0000
+[A28h 2600   4]          Processor x2Apic ID : 0000011F
+[A2Ch 2604   4]        Flags (decoded below) : 00000000
+                           Processor Enabled : 0
+[A30h 2608   4]                Processor UID : 0000011F
+
+[A34h 2612   1]                Subtable Type : 01 [I/O APIC]
+[A35h 2613   1]                       Length : 0C
+[A36h 2614   1]                  I/O Apic ID : 00
+[A37h 2615   1]                     Reserved : 00
+[A38h 2616   4]                      Address : FEC00000
+[A3Ch 2620   4]                    Interrupt : 00000000
+
+[A40h 2624   1]                Subtable Type : 02 [Interrupt Source Override]
+[A41h 2625   1]                       Length : 0A
+[A42h 2626   1]                          Bus : 00
+[A43h 2627   1]                       Source : 00
+[A44h 2628   4]                    Interrupt : 00000002
+[A48h 2632   2]        Flags (decoded below) : 0000
                                     Polarity : 0
                                 Trigger Mode : 0

-[04Ah 0074   1]                Subtable Type : 02 [Interrupt Source Override]
-[04Bh 0075   1]                       Length : 0A
-[04Ch 0076   1]                          Bus : 00
-[04Dh 0077   1]                       Source : 05
-[04Eh 0078   4]                    Interrupt : 00000005
-[052h 0082   2]        Flags (decoded below) : 000D
+[A4Ah 2634   1]                Subtable Type : 02 [Interrupt Source Override]
+[A4Bh 2635   1]                       Length : 0A
+[A4Ch 2636   1]                          Bus : 00
+[A4Dh 2637   1]                       Source : 05
+[A4Eh 2638   4]                    Interrupt : 00000005
+[A52h 2642   2]        Flags (decoded below) : 000D
                                     Polarity : 1
                                 Trigger Mode : 3

-[054h 0084   1]                Subtable Type : 02 [Interrupt Source Override]
-[055h 0085   1]                       Length : 0A
-[056h 0086   1]                          Bus : 00
-[057h 0087   1]                       Source : 09
-[058h 0088   4]                    Interrupt : 00000009
-[05Ch 0092   2]        Flags (decoded below) : 000D
+[A54h 2644   1]                Subtable Type : 02 [Interrupt Source Override]
+[A55h 2645   1]                       Length : 0A
+[A56h 2646   1]                          Bus : 00
+[A57h 2647   1]                       Source : 09
+[A58h 2648   4]                    Interrupt : 00000009
+[A5Ch 2652   2]        Flags (decoded below) : 000D
                                     Polarity : 1
                                 Trigger Mode : 3

-[05Eh 0094   1]                Subtable Type : 02 [Interrupt Source Override]
-[05Fh 0095   1]                       Length : 0A
-[060h 0096   1]                          Bus : 00
-[061h 0097   1]                       Source : 0A
-[062h 0098   4]                    Interrupt : 0000000A
-[066h 0102   2]        Flags (decoded below) : 000D
+[A5Eh 2654   1]                Subtable Type : 02 [Interrupt Source Override]
+[A5Fh 2655   1]                       Length : 0A
+[A60h 2656   1]                          Bus : 00
+[A61h 2657   1]                       Source : 0A
+[A62h 2658   4]                    Interrupt : 0000000A
+[A66h 2662   2]        Flags (decoded below) : 000D
                                     Polarity : 1
                                 Trigger Mode : 3

-[068h 0104   1]                Subtable Type : 02 [Interrupt Source Override]
-[069h 0105   1]                       Length : 0A
-[06Ah 0106   1]                          Bus : 00
-[06Bh 0107   1]                       Source : 0B
-[06Ch 0108   4]                    Interrupt : 0000000B
-[070h 0112   2]        Flags (decoded below) : 000D
+[A68h 2664   1]                Subtable Type : 02 [Interrupt Source Override]
+[A69h 2665   1]                       Length : 0A
+[A6Ah 2666   1]                          Bus : 00
+[A6Bh 2667   1]                       Source : 0B
+[A6Ch 2668   4]                    Interrupt : 0000000B
+[A70h 2672   2]        Flags (decoded below) : 000D
                                     Polarity : 1
                                 Trigger Mode : 3

-[072h 0114   1]                Subtable Type : 04 [Local APIC NMI]
-[073h 0115   1]                       Length : 06
-[074h 0116   1]                 Processor ID : FF
-[075h 0117   2]        Flags (decoded below) : 0000
+[A72h 2674   1]                Subtable Type : 0A [Local x2APIC NMI]
+[A73h 2675   1]                       Length : 0C
+[A74h 2676   2]        Flags (decoded below) : 0000
                                     Polarity : 0
                                 Trigger Mode : 0
-[077h 0119   1]         Interrupt Input LINT : 01
+[A76h 2678   4]                Processor UID : FFFFFFFF
+[A7Ah 2682   1]         Interrupt Input LINT : 01
+[A7Bh 2683   3]                     Reserved : 000000

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-6-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 tests/data/acpi/q35/APIC.xapic              | Bin 0 -> 2686 bytes
 tests/data/acpi/q35/DSDT.xapic              | Bin 0 -> 35652 bytes
 tests/data/acpi/q35/FACP.xapic              | Bin 0 -> 244 bytes
 tests/data/acpi/q35/SRAT.xapic              | Bin 0 -> 5080 bytes
 5 files changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 344eee3acc..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.xapic",
-"tests/data/acpi/q35/SRAT.xapic",
-"tests/data/acpi/q35/FACP.xapic",
-"tests/data/acpi/q35/APIC.xapic",
diff --git a/tests/data/acpi/q35/APIC.xapic b/tests/data/acpi/q35/APIC.xapic
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..c1969c35aa12b61d25e0134bbb8d2187ba42d663 100644
GIT binary patch
literal 2686
zcmXZeQ+OOv7=Yo~aI?wAcAeU0vPDuQZHm;k?bNny+g57ZPHkIh=b!JKoA-S43@*-G
z{Lu+<wq%Q@nWAFiZLx`wF-ZxwNPU?!O_RN-X{l+3X8k@%vx&=QJ3C3uY;TVa4(RBJ
zPEP3TjAs1}`ZBw?phf?(w5uz+xuMmH?(XQ}fu5e|<%Qnf=;MRFzUb$N{{9#cfPsM+
z6okRS7!rb^p%@m1;o%q&fsv7zE*+*%j~Oyx#*COL6K2kgS+ZbM6lTqe*|K5w?3g15
z=FEw?a$)Y=m?sbB&5QZ+VgCGBpa2#uh=mGa;lfy?2o^1h#fo9^;#i^tmMn>-N@3~J
zSf&g{M`KJ3+H6?1ES4*W<;!D*3K$!UadB9&B37z|l`CVFDp<8D#>Znq0#>Vr)vIG-
zBG#yZHEUw6T3EX_CM98=I#{<Z)~kp0>tllk*svisYJ`m&W0NM>v?(@ghRvH}ix$|j
zCAMmXty^Q8HrTc;wrhv&+hd0g*s&va>V%y;W0x-2wJUb(hTXekj~>{wC-&-vy?bMy
zKG?S}_UniJ`{RHCn4F9Q2jZYXICwA)8G=KH;;>;jd^nC6fg?xas8Kk2G>#dAW5?pS
zaX5ZFPMClbC*q_@IC(NonSxWN;<RZveLBvVfiq{~tXVjFHqM!YbLZl`c{qPQE?9sI
z7viEtxOg!xS%OQK;<9D9d^xUIfh$+ys#UmpHLh8MYuDnsb+~>#ZrFeuH{zyExOp>f
z*@9cQ;<jzLeLL>hfjf8Nu3fl$H}2Vkd-vkLeYk%=9yovp4`NCR9y)}F595&|c=RY9
zJBG)P<B1b^@+6)*g{M#BnKO9yES@`u=g;GX3wZG&Ub=*rFXNRfc=ak?yN1`V<Bc15
z^CsT9g|~0xojZ8<F5bI`_wVC_2bh|Q4<F*ANBH<LK6!#qpW?G;`20D(c!4ip;;UEq
z`Zd0JgKyvByLb5hJ%0FrA3x%!Px$#We))o5zv8!V`29Qn_<=uv;;&!$`#1jigMa^G
zTAJwMscHX=3n<MXfYNFrFqF14@qj38uUeFLP%TP3surc4REyHiszqtDYEjxnwJ2>-
zElRtp7Ny-(i_%urqO`keQQAYbDDA0Ql=f0BN_(porF~S3(!Q!iX+PDXw7+UmIzY83
z9jIEA4pJ>j2dfsPLsW~>p{hmcFx8@TxN1>4LbYgele0}R{tY{ee%8iO>pNrYvugUz
Y81RgpG2$6JW5}~=7X9ge`jQv^2Net*5C8xG

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..119fc90f1f8a7b6934df6fd95609446e627ce15d 100644
GIT binary patch
literal 35652
zcmb8&cYIT27YFd0F48n@(*b2u!M*4n?yL@=rL-Vu(YAofa6|zW5rv|FII-d$1?%2>
zEAFkhaqqo1&c5f|dlG;5Jn{2+<&WO;q|fs`=SkC^=H}8w+9H!9CtH^1hS0=tLtAlZ
zT1&W?{&_6R;+T(t#<b~H`_f3LzQdE1lICe&mSxBEA>=LGF%p_m?>TpN=h>Z|3s!b|
zx?<Lh^?|iBx?;;$b<VJO(!v=rpO1q;G^e92)Y0A@_O*l?OS~NojS+uvqtEN@2s=@#
zw<8#7wY(iu8Y5QWgaI8B+rnw9=UL&%)Y9JO^q$#y1-?Lg)0^eLjvBt#*;5w;H|+k}
zfve~F(r7{%9ldlckMW1j#ht!UoxOoGd**nS@N)ZerM(4b_Sm0xZVT{dVx4@;I=^!h
zQ>A_L+PiBat--KeV|Gh(OG&t-l<Eq%w&jiT4PRMgS$@8A_}`8F{rwL(p%qwU1)99h
zE~DOtmgwa8E<Ln2-c|e3hL*`qmfx~A{+(r|wJ!_sxM1&SbELSXHPTUBSk=)sIcUZB
zmd+U8)OAd!FVNZRU(?fR^>k+S_xD-7Ics{lth2iO*84xF_gQ_uT&K1?U(Sk5u4Uuj
zR+?o|HCyk@)$sk@-aWLjE!bh-#gu*&mD1AKIw{51>GKE1=Z;N{Pvlwc-4)|Q5t{6L
zjZ&$4sw$pluy0_!r_<`RJf3>bENd1WN2gG>_U<j4CQeDL$}MoM^7_(8^F7qwT{fX*
za%tR7bH3gl*W7?FyWVqj>d~oQ@93qrTo#_#lvtBav+3SUvSxGY=2Xi&I$*Eas&#TW
zQB9V7{cJjB#Vn6^wB@0@s5$SS`)FxPxNWj0YlGkCr7sN+!gSwFDW(sR;`XI&(Q))$
z@Pyw-U$`tDghM6KarB8$b5pA)YooJ_2jNijl&0dA#>lkdc28(Rc)V4(RZBQJE~R}8
zkNW##vw22rk!Oy@M*B8=bDveXLy*=ao5fa)KXl66&caAWOQfwSr+0#UYiz83^5eG3
zW17|!ebF@J;c!!ot%DEg>>blH*XkY8Gsl-g-vLYP$B~~Nw*6LLUaDsqf3VgS^$zTr
z>l+ZuPfxM3t*%(-sxHgw>+-fVhU=_Ce+L~svDrKdoVJgLA1s0J7xp)DOY7v8{PFXb
z=4YkRqtlwuJU(hUv4`S1E8owz`%-97A0MRBpux(|PNO>LJIR?RBVI)lbDYoF>u73x
z$ScXW=cd>zX|9ZTWqfLiWv`^E_DUM^N~*@5n`*C&SCDG)%J|e&XC+OwSJIGI#<S4(
zl{43N((IM-scFv2c=0sEeWttinQpI)Pfd4L#*3#R?lZ%+&kTEId}@Y!pESgM4sh*r
zfNP%v-20><?$hhqr`NSluX~>~#C_6FAh@S9UHi;*?~{hOPoHa_KG!~d?tRh__nGC|
zXO?T9S?+z(5cf$x3*qbOckR>f-X{%lpV_W`X1n&8?cOI1ai2M^edf6Knd9Ck4RN2j
zu6^dZ_L=M6Ck=6*0oOhQu6+jF`=lZ6GtafpJl8(+-20><?la%D&wSTD^WFQTA?~xl
zwa)_AJ`3FYq#^FJ(6!G(*FFo~`=lZ6bD(RV16}(Z=-wv{ai4=+`yAxj=OFh!X^8uz
z-z4bK7ymg_<l1MEd!IDKeGYc*bFgclgWdb2A?|aCy)r0235VD#L-NCJh_f>M&yZI}
zWbRPc%Au~6L)|NBh%1M=Rt|Hm9Ohn0LtHuBwQ{&?<#6{(8sf?ku9YKPD@V9j(hygU
zv{%Nv%t(7>{Ac_~XJz~cHw}4Z{3|%hm2;FU=O}kh8ag?>)IfvKK<nEYDYe~9Jrq-7
zX`nQqw9X)v2JxiSK%IGZOY&H}Dqf$5k~&ip4U~rQtx*GY=EfT+OyvgZOieUU8d5d!
z2I|a}5$D7P>P$^EP#RK2_FQV9&RiME9_^{zK%J@aA?}kJsKeSTse!^&ZlE-bcSUZX
zG>q?)8mKeZUP%oUrg8&yrrJ5VfzmL(PimmfTze%oP?*XM)R}6p<OWK^_&%wDI&<xn
z)Ieb>H&AD)y^<R!4dY)=YM{<sdnGkcn92>*nQE`(21>*DKB<8^bM2MXKw&C3P-m*W
zk{c)u<NKrr>dduQQUisl+(4bF_DXJ`G>q?)8mKeZUP%oUrg8&yrrImHfzmL(Pimmf
zTze%oP?*XM)R}6p<OWK^_&%wDI&<xn)Ieb>H&AD)y^<R!4deTy2I|bUS5gCosoX%F
zsrE{4pfrr{lNzWq*Ir2t6sB?mb*9=Yxq;F!zE5hP&RlyXHBgw!4b+)xujB?w!}va_
zfjV>TmDE6CDmPGPs=bmMC=KKLqz3BDwO3LDg{j;?ovHRpZlE-b?~@v+GuK{84HTww
z19hg_E4hKvFuqS}pw3)-B{fi($_><+YOmx5O2ha*sew9k?UmF(VJbIJXR5uD8z>Fq
z`=kcy%(Yii1BI#FK%J@fN^YPujPH{gs594INevXHaszdy+AFz%(lEYHYM?ZN21+Ar
zpftn=N<(O%u#y@mtmFm?E4hKfN@}36k{T$i<OT{Wxq-q;YM`)^8Yryf1_~>=fx=2^
zps<n}D6HfL3M;vR!b)nOG>U(9se#gnzGC*B$qkf-^ks+-d1d^*r3Ol)_<c(alt%IU
zmK!Jy<M%B$P#V&yqM;qsLaknZkNsq|kDrjP%iu$>ec3K!Q~6mcpVi>=9iEofNkQtk
zlS2F<%pW3Ni_X1FigH}XAL{u-gSW7taT1*k=*?X0TRNLgvSjx8vI;92Cxu%xX+mpB
zUXCy8qzo(5J`=RaTFtll(&=MkZ1HSguEh}*(MqRYCJdn85rXkk9)3Dq!zY8hRCZh5
zAYZ{rIaX#WbvKKCep~dDn9g1l=Gy0h`nUwDCRmu)5ov6*mT>G_YTuH}=c6o|5pK1|
zMICLeZJyP$r3OyVw@dbr%1$Rw{_pG|$R4t@hp0Zx9x6<pJ=EUa#Cvy6rP1j=*}E_0
zKco*s`mmiotkQ@7C4E@ZN7UwhbVBR@-hBkpN9^<wl|J$>=_8Ups?(?ahxAcMAGOm*
zRr=_^q>oDaI-NfKKcugN^mTUnI+eceU((k}`g)x{<3FUYhxGM!`g)bV{$JA9OZo<#
ze!zc7-vH?w?DP#PeZ#+`Z=m#P{G&{#4>;-LKRoEy3i@_;&fmIkE6lLJ<>|oR*TU&<
zV_%+|qu(_Q&bciqXMA7gyE*y=#NeFUl5)oP8Jz;=@3Z*E=(iGsb8bt@8Q(XBZjOFc
zF*xV8q@3}6Fwo7>?=J@D+?JFx9@m519Q{&baL#Q>Ipc9!<mTu%9fNajb8~@V|D4b6
z&TVT7(Mv7#vWh>I&iMzrzothMzX;RdoBq!!|CZKhTl`__qwh{?PTAp>Da8$kEr=bw
z@Sx%&4w!$~!XsuLFyCtTgj*(zmxpV%&sXo+<lp4?`02DhH6=cGzRB<Nw=dh42SKYi
z+!Af}gd3aNJmJ=+y*+dWyo5j0d92iMxG6$s+4Fg3YPc;rp_ryef|HBsWOHM4qc>*p
zjqTm1zn?MP-Vs&gRGA$Nw=|ZNl$LNE&Pzw>h0!;{lk4_L>Gk!@wpN5oN=oK%=;5$*
zPH$GvY+nk;Wlo&Rak&$xaa`fV=^R%&aR$d#PCS6)YA5z`T;s%<9M?LrkK>>dXK@^I
zVn4@WC(h<L;>0-|N1ZsA<2ok}P+UsobIo}iOa1vAOZ^2LOZ|l$OZ@{mmih;AEcF+0
zEcFlOSn40bvD815W2t`_$5Q`rj-~z)983KpIhOiIaV+&0Q(PwXZ^5zDKbm8ye+<V`
z|CSs}{abM?^>59w)V~eKQvbFbOa0q%EcI{CvDCi<$5Q`}983K>aV+)k%(2uzmSd^E
zgyM3kzm#LCzl>w4zno*Kzk*|_zmj9Azlvk2znWvIzlLL}zm{XEe;1CW{#`ki`gh}4
z>ffDXseccSrT#rRmiqUixI*d=axC?SIF|au983KXj-~!6$5MYC$5MYi$5MX-$5MYI
z$5Q_|j-~$b983KZIF|aGIF|aGIhOh-axC??P+TeXPvThWZ{=9(Z{t|%pUkn;KZRqd
ze{YVZ{;3>G{nI#>`uE{j>fe`RslT0Lsed}hQvZG&Oa1$EEcJJAEcJI%TqX5)aV+)E
z;8^OP$+6Twi({$(0FI^p138xZ58_zrpUtt<KZj$fe=f&T|2&SR{)0J|`VZk)>OYiY
zssAvJrT!Sj)l&cA983L2a4hxD=UD1rz_HZ7kYlO;NRFlcqd1oOkLFnFU&OK0e+<V`
z|6-1%{$n|o`j>Dl^&iKv)PFq3QvXtlYoz{V983M(983MnIhOiQ;8^NEkz=WU1;<kV
zN{*%eRUAwGCvhzGujW|lKbd2x{}hg;{!=-Y`cLCn>OY-hss9X$Yo-1*983LYaxC@t
za4hwo#j(`CmSd^^Y>uV=b2ygz&*fO^KaXRn|9p<6{tGyk`Y+^I>c5C%ssCb*rT$Ae
zmil`s4ody&IF|a?b1d~=%CXen$FbCZ8OKup<s3`>S8y!#U&*o5e-+14|J58z{nv0T
z^<T@e)PEhvQvdZFOZ_)+EcM?=aY*XFiDRk%W{#!)TR4{bZ{=9(zl~$5|8|b0{yR99
z`tRge>c5L)ssC<{rT%+3miq7ISn9uzW2ygsj-~zwIF|Z1P#l)}ALLl-e~4qL|6z`$
z{zo{L`XA+3>VJ%5ssC|~rT!;4minLMSn7X@W2ygXj-~!*IF|aK<yh)}j$^6+d5)$2
zjTA?u{uelw`d{Q&>VJu2ssCk;rT$kqmik}iSn7X`W2t`=$5Q|6983Lga4hw|$+6V`
z7ROTm+Z;>%?{F;jzss@I{~pCrssDYBrTz~%mij;BSnB_XW2ygRj-~!jIF|Z9<yh+f
zjAN<)bB?9{FF2O^zvNiz|B7R&|7(t={%<&z`oHB^>i>@7I;sDAj-~z|IF|Z<<XGze
ziDRk%XO5-*UpSWff8|)}-^{Vp{~O0r|L+`2{eN&Q_5aDS)c+U9Qvcr^Oa1*EQ~my)
z+4S1Qif}3a{?7xCJ)j-%AjKZg7I=_q4`>fONV5mD2_B@|1KI@-GVB3ug9iib0quha
zUVA_r;X$T7pq=o*XAfvAJjk*Kv=<)u?E!6u2if+3cEf`ldqCUaL9RWJ{RDWxPYC!k
zdG<i|lWz}XKLz$c_ETsNWIqG#f$V3HJ&^qr*#p_nV0$3@8DbA)KSS+->}Qxgko^p|
z2eO|L_CWSC(jLfuM%jb9IfV@wbWK$-vwh6;v1#!O&iL6UKda=6qV&!53@~PO_73gQ
zpWx?}F<&lS3}t*~!uY<<!lrb7uKC{*c{D{rQopcaP`EAJ?ERN*c*D)nsrf1WF>7Yb
zGi!Zae$OmV%$gPRbjGZ%_09e>dOAI8XJ!@Cjh(TXI;p*7eIq?r?k!rYZ>49;GcW7S
z?CJ9LQ=-da$v)q^rE%Z!)A88MRa|A4wXlooT36j$X-u=9u+wwunZDGRao5l%Y2Ct^
ze8Fcl&AH-}!5P*}ejYxP610~l-<)AlJqu?fzoVNn!xP&k`~T&RPX2f?e7f^ubCTRQ
zF<*+lm8Z_tH`3jlw7T}?d(gA?5;`wK|LCj*J+i%h{P?Ex5>3I$d09TMMXv($>jQ;3
zbTRAXEZ&SYd(K=svoo#9YF|D+jet`71q2sBC+8D@$72Io9dhoZ!~>WIux7@}=p}v5
zm;FyQe6BsArKH%JKcV?j=!9mxHeZVN%IQiu?a|5egqKR!4%(ZKSLaJbFI9UL^zy&<
z=xlhxOH0#U8hUBktK^qW)PCvocEU?f*Iqh$>DsHJO9iw?XT%a-Muzq>(96(XHC;fU
zJvsrM@CFRf-T?FlXs?DIP}-v_s1u&ot35AzUhUP|*9*HJFPY$F+AnX>gFEr{%|tI#
zdqI8)OMN|j;Q4&IJ|B8M?S=T|Fy&=|N9~nA4fSQAm!-WhU9O-#KX`uo!fy2Z==rr5
zp^F%_mknNawyrN5y=?78>Cy)6<$#xyqrDvTa<o@R7d&W>UVcnGUUGA_my2Gm@=8ni
z^$PX%pjR{!ULc^o0D1xKmGX-d%A=Pw5?)@O_VUon(_R_BI-xvzO(Wsu=W8z?y?pJJ
z^UD*;qZc(2UO|EO3eYRiUIo8Cp*(t3BjFVmYOfHzLhV)Z3lz$umo*aJz=7Huh~7Z$
zRq-nn%A?mc65gOe+8c!4AnjH2OBBkZ7d8@JQIYnF&@0kj4PCaOy}{rO9<05==nd9h
zEnUo^y&>QY8KS)*=nc_ckgk!`-cay{4%OaJ^oD9LL>GQ&Zy0#PhG}mYdc(9ArprOJ
zHypg-!?iaYz2Vx6&_yEJ8v)*k5!xGp-U#hQ>CzGHjRbGxNbQY8Z>09>=z<dMjRJ4f
zDD90xZ<O-NN{UUd7(C~HPhtNkMz2_VrCXTZ7T|5Mg|2T4^tRAm*=W-n4c_R{+8d4D
zXzi7cF}*S1jTxi8G3braUd5KCw<UO6ZmGR3(c4mcm0OwKR^V;5mG-tmZ!7IpZEbp6
zgSYk8+S?kvt+iLZjp=Oz-ZtB4ZyWTs(O%8ArnfD4+it79ZPD9Sd$rq{-ge+^x1IL3
zLvK6n1-Cc7?ZMlAd+lwH-uBuH?O=L4fVaaA+S>uW9kdtT(e!o%Z^s?Aw<CHxYA>>r
z>FosGPCIFDC-ipGUUX;E+Znu_ch=s{=<Te%y0NA=7QC@zwKo>MvC1o#r@OA_mvn(a
zqMw(PXs-ml677|in)T8D^GkT8_OoOBd0L8IsrJgsOs@>QvNBy?8G2>fD=#;_a`4K_
zwO5W_x%Mh5Os@jGiVE#jpjV;2%1YC#1h2AEdzI)_YOkuw^s2zCs?uH+dR5x1t~R}D
z@T#k|SB+k^_G)TOuLiuD8tv7fSEIe!TGOiqueMfuwdmDqFSv{8?E>B|yJ&A0^mfr+
zXjjwQ6}(+{)!we??W(=-Zl<>zc)RVUz1`5;O?#2uO>cMbcHdolyQ8<e_M&^3-X7rX
zv4{5dKyMH2)$M6|dxE#;p4!_Jy*-szQL>lm?FHUmdueYk^!CzTY0&iOlEK8!zhF>%
zLG*&!D+`$(T{D>QLLu$(rM!vre<AIahfR+z8ccX$`>zDx&u6|iH{pe~R}nEix@s`t
zMIyRBzSuV5MYLBLH9fj)FyTd`+T*Kd6JAt%RduFE*9|7TI=Xa?p3cJgCcYdt;niuc
zy598Y!oh@BU#~sBzBS?1Yp<rk^ytdLgxAoZJ-%Qy;WcQlw$bz&!E0>PUL$&q+6#^|
zy>Z};8>hW-=#A4}XuRo-2XFj%?Ttroy!OHqOm6~s6DDYH0(uj)7ils*`V$a|uSZjp
z_L|UZ(q6RL^qRqIZq{Bidd=Fan`n9y!J9ZydlS){sJzOO7Sn41ucbwME$FpquXK{>
zO#*MyB<)Q?Z<6-PT1~GNyw+CjwW8Omz4A8GqpMI8U*EPi?X{uTroD>ErbmAzB;ie-
zti8$TP1auJ6w{jm-jpfYn}XgH?N#k<dV7Pn_uksu8@;`?S3TAArh+$hs`jR$H&uHz
z(@bv~c+;k7ZyI{jv{$>2>FopFKKp2IAN2OoUT|O2+ZVij_toCM=<Tb$P`l~1gV)}!
zy>|54wHKaldegz1K3#j$(VMQl$bP1`A9(xir@j5q+fRGZ{Y`Iw@b=$dd;6oezxL`n
zOppF1Oyc{kqeFWg=yfQss-)BOI>GDg)Ltigo!TqyGQBSFy1KO2g<hBT%4V3}4De>m
z(B2I6W@xW`rs>TDZ{|$x%|vge_9|wX-YoED&C=d1^k!+V@&MC20K5YZ(B1*)9iY9c
z15NKh@D4msdk3O-p!TW{GQESqJLn+o9faON+N+sudb7csJzIOT(VMNk+Bv2-2fR6R
zv^NL6Iob=(H9flAA@Th-cdqv4qBmE2p?Rh^54?Hvv^NjEdD;sfY<dTScksd5I~cu#
zwHG<W^bP^<kVCY02zrNTFM6oy9SYu|hidOo^bXZt-C?G87<h*rroF?^J4|`iB{9>B
zfftKuFNR)Bd!>h)-r?XKez^7yNAGa$l^tPvM}T+45!yQfy(6?&KHv1_gExP^_U5BE
zUwah`Om6{r3l?Z^0eTCxSGmyi7J|2Mq4pM{w@`akN1EP|;2n9S_KrmFNbOZ0WqL<}
zchphZI|{v{v{!Sq=^YK;(MN0VX!MTOUhN{&TLj*sMcP}0-XiS<k1@Stz&qv`?Hz;O
zG1?0)Hoe8*Encj>#po^8UietkI~KfSkJa9>=pC!Q$P&|A0^X7(+FOF&675BgGri-$
zJMK8`9f#g=+N(R>^o|Gb_~W&AJbK3~ucl<F=`96s=~C@2MQ^G0N|%}5GVqoy)7~=l
zmT9l7+w{7@>+aTGH+tRLD_?GU%fVZ|TzkvWTduu|6HM;}@J={EdncfGg7zv;G`$nS
zJMl#AorvCv+N)Y&dMm(Nu|j(*&|9Is>XoLq61<fwwYL(zmD;OWWqPZ?TeV7itI%7e
zz1ovZ?<DX}I!Svcp?8w@f~!q$HF&F6Yi~7rtF;$8+4N2Z@8pxUcQSe>YcG6?>74@J
zDW_=f6!cEfUgT8MI~BZBPu1S3=$)#)=xL^R8hEFjroGe9J576ar<>mC;GKTD_D)Cd
zbmi5SoMC!rfOp0j+B*ZiGqhK_#`M;Jw`Ps@)}XgWdu3;u-kIQ?d8YQxMDI-PmG_ul
z4|qL2+Ur5DM|%}#nci98opqM>&O+}j?NzQdy|v)2U8}vd=&jXW)!C+ZHh5>Bt-Z6+
zJ6n6z=a}9(;GJ`h_Rc}?9PQPdYkKE`cka2`I~TokwO4zd>757OdFN^GJoL`fUhsU=
zJ0HCB&)44h=$)^<&;_P<0eBZ&puG#wyFh#43r+7r@GiVidl#a2q4pvdnchX<U38K5
zE<*1j?L{v(y^F!S_+sr{jNZlCtGmSXE&=b7OSE?hdY33KSkh~Hz2NosYOfc)UhS2x
zGre`-ty`zPb?B|rUfFunTMyp)_1asH-g@noUut@nf_Leq+Pf6JOSM<gXL^0$_4R45
z54}F^RbFO#mw|WLW!k$8z00&$b-C$X4&LRLYwvROF4tc56{dFucvoDZy(`eWLVGn=
zn%<S*U3sPUu0-!j?bTjodRKvW)m7TN3cahe7rff^t_JVwtF?DEdRJ>NbdBj<1Ku^)
zXzv>IuF+ojTGP80ylb!3-nHmmtG&o|rgt59*IlQ*>(IMSd(rDn?|SgAzg~OSqj$ab
z>TWQ-8^F8a2JPK|-VMqNmE350H-dNLjoP~ry&JVxdXwqh1l~<IY40ZVZqi=a&8BxV
zcsJjyy_?ayS$pNTnBFbm-ExceZb9!B?N!`rdbfgi>#f?m6}?-vS9zQ1-3H!mw`uP-
z^lsB$)$OKtJ9xL>uD#pQyIp(LcbMKC;N5YD_U=IM4(-+4X?k~pcjukjyA!=TwO4zW
z>D>k1U3Y2kF7)owUhr<yyBoZ_@7CVk=-sWo&^@Mi4|w<7qrH33yGMKBdrj|N@b0}=
zd-tMuul6GMncjWi-FKh%?nCcB?M3f5z5Btt|9<V=kKX;-t9!uo9suuw2ekJ9dJiZs
zT(ZIRHh{NbgZ4I{w?TWQ51QVC;63=D_8vs<LG6`2WO@&Q_s~PydkDRUv{(MH={*eI
z!w+lkVe}r>Ud1D(_Xv28Jfgiv(0fFCm5-X<qu@RIsP-O3?@{elJ!X23f%n*B+ItMW
z$Fx`dxamC(-s6vJ?{V}V*IvyNruPJRPduT$C(wIBd$muR-jm=x`K0!qMDI!M1)nm#
zr@(vaDeXOl-c#BOJ#BhVgZK2)+It$kr?nS;#`K;6@0n+`_Y8W^XfN`t={*bHv(IYp
zS@fROUi3NBdk(zkp3~lQ=sl;sy5~*rdGMZpUVG1@_q_5VB^ym|BX}D(YHuTY8?{&Z
zg6X{g-U}~i?*;T;&|cY#ruQOvFTSX~7twoBd*v^g-b>)U^pf^oLhmK*RlIC^FN62;
z%i4Pxy_dCD`HJbi0^TdHXzvyDUeR9FtETrVc(1;yy;sqDReRO1nci#Qz4n^+UPJFS
z?bU2Dy-nb4+N8Zr=xx$o?dzuZI(V<YuD#dMdtH0MH%#vh@ZNYsdvBokhW0{ln%<k>
zz4@m0-bC+B?S<bmy|=)7>n-iQh2C4*i@a@mZ-e*t+uC~@y|=X&eaH0P0q>o6wD%5r
z?`W^?UDJCPym#N#-n;0%tGsB*d#3juc<;TZz4y?2PkW{Bo8J52z5l-U-be3!?Uj9C
zdLMxI!3Wy=0KE^iSN@^teF)x%A8PMI^gh&H#Yd+15qKYcq`i;O`$&70ADiCC;C=kD
z_C7}MW9?OaVtSu|_sJ*P`vkpDv{(J9>3s^`r=M!?Q}jO7Ud?Bw_ZfJfeWtz7(ECh#
zwV#{b=iq(*x%NIs?{n=1zc9To!29A0?R|mX7upMbX?kCR_vM$``x3n`wHN-%^u7Y`
ztFN^86?$K3FY>kNeGT5%Uu*Ac^uE?!^c&Or2E1>+(cU-ceWSg)Z%yx8@V@<4d*7n>
zt@7$hzB9e=!29ky?R|&dciJoc-t@i)@B8ny_dR;wYp?7F)B6FuAAZo@59s}%z49MT
z??>={{84*9qW7crDt<D(pTPU+C++=&-cQ=A{Mqz=2Jh#ewf8f6KWne*7t{L%ykCCN
z-Y@9=qP^;0P48Fme*IN@zoPf6_G&hp-e&MNZ`R&s^fqg+_BYe}4ZPoe)823B{ieO(
z@22-Vc)$Oyz2DLMU3;NFOz#iy{`f<Cf1vk=_QHRf-k;$8`KR{&MDI`SMgB6qzrg$J
zFYWz>-e1~_{%v}HgZKB}+WQ;5zyI;N>oWLng4*wEAnzDZQf=99Zs6;8{r!S|$EP=!
z&J0*qKNY|^_=x|{vmf*HL!NON{O3lK<)J@CN`I>_@n->P=*q-tI1_)Mg5rN+jaLN{
z|7DX#I#+4ZTpo8Wk2{w~a`6#!(JIL0F>;k9&6VQLmEz8oBDwg8xo8#SN-=VkC(V`W
z&XwxUl`6UTh`DGL<VrPiRV2-o=FXMo&Xp#)_=ve^734}Ya#beHmF~{P?`h5dOF|xn
z>5_|&n2T0Hu5=?;RnlA;?pzt}Tp5y!kC=;AL9PrVS9Q`{1Kha=xN{AVTzte_v<h+!
zFmlx-&E<9H^15?*B^Mtt7p;O^UL#j+(p;JDT$%1%nUaf-n2T0Hu1q6WFljEIJD1O$
z%O|<`h`DGL<nkH0LP>LFxpQT?b7e^`K4LCf1-Y_}T;Zg-{O(+ScP_u=;v?pwRglYX
z<ccKCmF>=z?aq}gx%h~=XcgqjHgZLi=E`yB%5mq)kz9PlT(k;u<ruk=_AdI{(5{}6
z>&}%cx%h~=Xcgqj)wxQO_pg9ESHPVsAi4O6xo8#S3K+SP_pdy6t~__HJjumJ%tfmp
zSDuk8dH>3H=gN2I%9mVx#9Xura^)MjlJ~Cycdi0=t^&!$N6ba5AXkBrD|!DabmuB`
z=PHz3e8gO|3UU=1xsvy<f$m%b-MI!zE<R!|S_QcV8o849uR-oygWS0WNiIHOE?Nb-
z1{t}M_pc&%t|E7?BFV)^%tfmpSCNq`dH)*h&NbMbYp~?vBj%!2kZZ7!D|!DK;?6b1
zook5X;v?pwRgi0lkt>+==iyLyuA%N+LnRj<F&C|ZTtkgq$@|wZcdlXXT*D+6A2AoL
zf?UIlT*>>_aCffZ?p(tq7auVft%6*`ja<q5*9dp65$;?gBo`ks7p;O^BaB?h``1W!
zu95CsBPACfF&C|ZTqBKK$@|wRcdk+HT%#lxA2AoLf?T8i$yGRv-W{&KCE5`!DYN7~
z?f9MI_z(04CZ_SHTo2JItFV^lmRkHb<x}JDK@ge{ruQF!8(PB6_8)zB%?LCNbl!@N
z-%-|i%f@k8zS~!2TPc2i9%nyiq_?c~Z1!)a-)-o2554Uk{ri<Zz1g1_XZQ1y%O6)3
zS(fv8e&^Tz{w$tK|57abGjtEw|GfSE{mxZ<mUX4;GaLH*A8?*8TO0ORy~976vycH=
z+wXOTiH|&{H|*;Ur_r4wjlZS2h2FHM%6WdA&9}q5{(1R1tS`&ivHh-p#TmsJo&Y1`
z(pnl?TAjPtjnJKx<Q)V}YlDA--!piT71(Y%rEe?m$j?aQr>PWIbmV)}d?~&ZdsNAv
z;avoF{pZWj-o10()UZ6%CPka3&|l;)<F%^dKzbmZ-={FpoHm`m>Vdj6{wlV2XSJ1-
mbl7i^NW0m-t)#{o&{xc36_QgLvHI+wEFP5GK?XlWtp5RGJ|f`&

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/FACP.xapic b/tests/data/acpi/q35/FACP.xapic
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..2d3659c9c6753d07c3d48742343cb8e8cc034de7 100644
GIT binary patch
literal 244
zcmZ>BbPo8!z`($~)yd!4BUr&HBEVSz2pEB4AU24G0Y(N+hD|^Y6El!tgNU*~X%LSC
z$X0-fGcm9T0LA|E|L2FOWMD7?GM2WmFfej3F#P0!h{7ddihwku0+2v57svwxMxcSn
X_QAxFX+{NzJ3wNL4G8yu_%Hwf>QN2>

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/SRAT.xapic b/tests/data/acpi/q35/SRAT.xapic
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..1a91cfa65fdbebe1756d63d80022c2af767e5d3f 100644
GIT binary patch
literal 5080
zcmaLbd6bS-9KiAS9m_Bb!whB^ODQIzkhDk{WhpVupdq1%l!~-aq1~F4H7%5Avt?^h
zSz6I1OVggM&?eD}ni*#ppIrBx=iKM>{oOzBdCz;Etjy*eauOqv=+gA|Em~*QNYBn_
zQ6qOnBauknd)}V+99jwgbCh`uE`p2VVz@Yt#U*e_9EVHc(l{QM!DVp*E{DtGM4W^x
z;EK2sPR1#?GOmJCaaCLmSI7BxqtJagj`{JpCO!e5h-=~6I1QhK>)^WhWLyu|$EV;^
zaRb~CH^Qgk#`tvH1fPM=#Ao5NaZ`K_Zidgr=i%l!9q0ds6uK|xGrs`0#I0~^+y-BW
zFT!o{#kd`Ak2CNkI1^{#4!9%kgfGR}xHIm8FT-8&<+vN}j(gxM@RhhH?uD<yy>TCW
zHSUYA!Pnw`_&R(&z5(~g1MrP_AifFTjBmlW;z4*Yz75}w@4!RwP&^FZiSNR9<9qPE
z_&$6;9*#%gk$4myjmO{z@L2pH9)};o599H80-lH`;mLRkegsd&kK)Jh<M;_Y4Nu2U
z;-~No{4}14XW?h?v-mmuJbnSs#&hsoJP*&uFX9DwAzp+R<0bed{4#z8zlxXQ*YNB3
z4ZI95$1Ctk{3d=2zm4C)@8b9HD!dx6!SCY_@Q3&#{4rjOKf&wpdb|N|#Gm3E{2Bfn
ze}TWmU*WIuH~3q;32(+*@K(GHe}})v+wl&(6aRpJ#6RJm@h^B6{uS@Wzu`T2Fa90>
zf&avR;lJ@ecpu)64-|Gx^1*-Z|K@H->v{2LJsRjSfnFrgiw1hJKrbHXv4LJ9&`Sn-
zT%eZ<^wNPIALwNQy=<T-1bVqZFCXZMfu0oT6#~6tpjQg?<Umge^vZ!=CD2m?y=tIW
q3-s#rXj*PKV#OU&;mP51xgXB**RI%tgGZh#sK?%;X~&)yO#cIBSDyg@

literal 0
HcmV?d00001

-- 
MST


