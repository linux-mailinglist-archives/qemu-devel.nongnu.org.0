Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2151E600C7F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:33:10 +0200 (CEST)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okNQi-0006ZJ-4H
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNG3-0005cw-GS
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNFw-0002jt-El
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666002118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L38ht+1eW8QSpL4v1VLhouc8r1dUcZj11oXw/XuRFBI=;
 b=J71U2k+qXcu7lxn8fL3uO3jZX9oYEk6LvJ4OPacqbx3QF7p7IuUCIEdcb/ZPu6dR7VYHbG
 DI2iND1zIqzckYx3lPymGencv4JSLm56Whh39ofCFaFQn7i8McX0WGQn9wN7gkQxTHys1Y
 6y3Cx2MnFAd1lVGgnDLnNIA1M2bLYLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-ECd930tBNLeq4-8MYzeOlw-1; Mon, 17 Oct 2022 06:21:57 -0400
X-MC-Unique: ECd930tBNLeq4-8MYzeOlw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C2D2803D4A;
 Mon, 17 Oct 2022 10:21:57 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF2DD410871;
 Mon, 17 Oct 2022 10:21:55 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca
Subject: [PATCH 04/11] tests: acpi: update expected DSDT after ISA bridge is
 moved directly under PCI host bridge
Date: Mon, 17 Oct 2022 12:21:39 +0200
Message-Id: <20221017102146.2254096-5-imammedo@redhat.com>
In-Reply-To: <20221017102146.2254096-1-imammedo@redhat.com>
References: <20221017102146.2254096-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

example of the change for PC machine with hotplug disabled on root buss (no BSEL case):

 -        Field (PCI0.ISA.P40C, ByteAcc, NoLock, Preserve)
 +        Field (S08.P40C, ByteAcc, NoLock, Preserve)

 ===
 -    Scope (_SB.PCI0)
 -    {
 -        Device (ISA)
 -        {
 -            Name (_ADR, 0x00010000)  // _ADR: Address
 -            OperationRegion (P40C, PCI_Config, 0x60, 0x04)
 ...
 -        }
 -    }
 -
      Scope (_SB)
 ===
 +            Device (S08)
 +            {
 +                Name (_ADR, 0x00010000)  // _ADR: Address
 +                OperationRegion (P40C, PCI_Config, 0x60, 0x04)
 ...
 +            }
 +
              Device (S10)
              {
                  Name (_ADR, 0x00020000)  // _ADR: Address

with hotplug enabled on root bus (i.e. bus has BSEL configured),
a following addtional entries will be seen:

 +                Name (ASUN, One)
 +                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
 +                {
 +                    Local0 = Package (0x02)
 +                        {
 +                            BSEL,
 +                            ASUN
 +                        }
 +                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
 +                }

similar changes are expected for Q35 modulo:

 -        Field (PCI0.ISA.PIRQ, ByteAcc, NoLock, Preserve)
 +        Field (SF8.PIRQ, ByteAcc, NoLock, Preserve)

and bridge address

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  34 --------------------
 tests/data/acpi/pc/DSDT                     | Bin 6422 -> 6496 bytes
 tests/data/acpi/pc/DSDT.acpierst            | Bin 6382 -> 6456 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 7747 -> 7821 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 9496 -> 9570 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 6886 -> 6960 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 8076 -> 8150 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 6382 -> 6456 bytes
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3069 -> 3107 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 6494 -> 6568 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 7781 -> 7855 bytes
 tests/data/acpi/pc/DSDT.nohpet              | Bin 6280 -> 6354 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 6428 -> 6502 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 6656 -> 6694 bytes
 tests/data/acpi/q35/DSDT                    | Bin 8320 -> 8418 bytes
 tests/data/acpi/q35/DSDT.acpierst           | Bin 8337 -> 8435 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9645 -> 9743 bytes
 tests/data/acpi/q35/DSDT.applesmc           | Bin 8366 -> 8464 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 11449 -> 11547 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8784 -> 8882 bytes
 tests/data/acpi/q35/DSDT.cxl                | Bin 9646 -> 9744 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9974 -> 10072 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 8395 -> 8493 bytes
 tests/data/acpi/q35/DSDT.ipmismbus          | Bin 8409 -> 8507 bytes
 tests/data/acpi/q35/DSDT.ivrs               | Bin 8337 -> 8435 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9679 -> 9777 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 9450 -> 9548 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 8640 -> 8738 bytes
 tests/data/acpi/q35/DSDT.nohpet             | Bin 8178 -> 8276 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 8326 -> 8424 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa        | Bin 8421 -> 8519 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8926 -> 9024 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8952 -> 9050 bytes
 tests/data/acpi/q35/DSDT.viot               | Bin 9429 -> 9527 bytes
 tests/data/acpi/q35/DSDT.xapic              | Bin 35683 -> 35781 bytes
 35 files changed, 34 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 570b17478e..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,35 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/DSDT.acpierst",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.nohpet",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.acpierst",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/DSDT.applesmc",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.cxl",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.ipmismbus",
-"tests/data/acpi/q35/DSDT.ivrs",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.multi-bridge",
-"tests/data/acpi/q35/DSDT.nohpet",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.pvpanic-isa",
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-"tests/data/acpi/q35/DSDT.viot",
-"tests/data/acpi/q35/DSDT.xapic",
diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index da2a3e5c0551ac2d1d8a0a40b92d3235d5757475..5b4624cb68c78eab6e356987974b9bee6c9a1785 100644
GIT binary patch
delta 186
zcmbPc^uUPACD<h-L6U)i(O@E1$7W3?Uq&VmlgSm#8#eo~XmfJ8+=_`0c8VA9xjDI+
z*H+9`A=tnoo+IATC5Q*8hk?T}IMk1E@<su<<miR~69Z=^t^_WY=te0Jn=v3L(0~I-
v7=j2R5Mj*01`>?X0~rcpfw+cnt|5qP1m_xoxW;g<@y1<wjGOoIMsNcF?p`uF

delta 139
zcmaE0G|h<1CD<iIOp<|tam_@o4h=U+z4&0K_yA{5gXktt3D021c#e2SmmnUX0*2^@
z022deCawf7md&$x@)$Qx^kZc5Gn@R7af4cPql!K=NE=8CNEu^5P@n+^kT3)hMj*nN
dWAj8NZB8!VoiQLw1YCDcKE`dknTs!s8vqocC7J*L

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index abcd6d9d309a8f9a9080edc64df7a6c195b5885f..99461b771eec2043263b5bc3c109a08969a99af9 100644
GIT binary patch
delta 186
zcmaE7xWkCcCD<jzLXv@jv2Y?+$7W3?Uq&VmlgSm#8#eo~XmfJ;T#tzlc8V8pxjwm>
z*H+9`A=tnoo+IATC5Q*8hk?T}IMk1EG9$lSa&$w0iGec{R{|GHbfXlA%@`0AXuts^
u3_*kuh%n}00}00HfeZz)KwLvO*AT=tf^&^PTw^%bc;l`-#?AY94Y&c&fia{2

delta 139
zcmdmC^v;mWCD<k8odg2|<GYDm9U5+udhx+d@d3`B2GLEP5}v`1@f`7vE<rp%1q{&*
z0VW2{Ok4?EESqQX<S}lX=*P(9XEymE;|8_pMiqT#kT#GOkTS-Apg;o-AYlk1j6j4j
d$L5Jl+MHaj+hahM2>5QBe2m+6GZ&v8Hvqa2Cba+n

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index 884d4871a2a0b87db2c0dd7e6f32486ba9b7e424..b84f3b47c37e427b927c36036307db6e83a843e5 100644
GIT binary patch
delta 186
zcmX?X(`(D+66_MvE62dV_;w;!$7W3?Uq&VmlgSm#8#eo~MDTIB+=_`0c8VA9xjA`*
zkgb@jLa>2FJV(5vOArrG4+Do|aHt>S<cnf*$<Yk~CI-$-TnSt((T!3dHe*0gpaBPv
vFa!}sAi|h~4I~(&2Qn1I0&xxDTtg7o2+lPEagE_z<BhxW7&pHbir@wS&T=!<

delta 139
zcmeCRJ#53}66_M<EXTmWm^qQFL&Hr{FFx2QKET=2AiBv@!ZX-0o+IATC5Q*8fFZge
zz{J3ri7SDNW%F^tJjRU^{TP}2%qBl%+@KcSsG`pd(gxB3QpOk%6llN!Bn&}>5r{D6
d*gTObf{)90XAH;^0oR?AKMUAyHWv=#1^^j}CO`lH

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 31a79aa47673c14f7e564475c39bd38c872f8165..6771620078086e42b445474b16797094e0d0a801 100644
GIT binary patch
delta 167
zcmbQ?^~j6MCD<h-NtJ<tQFbC%$7W3?Uq&VmlgSm#8#eo~XmfJ6&0>s+4|a+d=$$#a
zh1ZVBRblcxKBMI5h5!=-XC|%$E|%y<DG-}6ASlp)14tNx2qO?-%)tf{jL`!b0Ahi-
dhH$PSh-(Dr8iBaRaIW#jU3rX~5Aa5a0{|E1F2n!;

delta 140
zcmaFlHN%U`CD<iILY0Amappv>4h=U+z4&0K_yA{5gXktt3D021c#e2SmmnUX0*2^@
z022deCawf7md$f`@)$Qx^kZc5Gn@R7af4cPql!K=NE=8CNEu^5P@n+^kT3)hMj*nN
eWAj8NZBFj~O2!zFEdp(olaF)TZRX(%69)iL9VOrZ

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 8b0cae4dbfbd083a43751a7c94dc5c76f89084a7..298fa1592676b3a2089b08eff5f764e04391b961 100644
GIT binary patch
delta 186
zcmaE6y1|UgCD<jzK$?Mpamqxlj?J1(zKl#BCX*|eH*EG}`OU@Uaw{f2*ePDX=jP;K
zep@kDg<u1Vc#e2SmmnUX9tIA_;7~ut$&EsC$<Yk~CI-$-TnSt((T!3dHe*0gpaBPv
vFa!}sAi|h~4I~(&2Qn1I0&xxDTtg7o2+lPEagE_z<BhxW7&rIvM{olGeS|XJ

delta 139
zcmdmB_RN&aCD<k8nG^#9qu@lY4h=U+z4&0K_yA{5gXktt3D021c#e2SmmnUX0*2^@
z022deCawf7md#mwd5jw;`Y|&3nN5DkxIrztQAM8_qz$A6q>M2jDA0fdNEm_$BM@QC
dv3VlXZ!Rw1oiQLw1YCDcp2lmt`4)c|Hvml~Cp`cF

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index 38865fb66747a6ee1cf2066b925be6eba064625a..9fcadb266b92fc4942621f0fd919703723de2fd9 100644
GIT binary patch
delta 186
zcmeCNzh=+n66_LkO`d^)v2G$)$7W3?Uq&VmlgSm#8#eo~Eac~MxfK&1>=ZBHb93@f
zVOud*g<u1Vc#e2SmmnUX9tIA_;7~ut$&R9O$<Yk~CI-$-TnSt((T!3dHe*0gpaBPv
vFa!}sAi|h~4I~(&2Qn1I0&xxDTtg7o2+lPEagE_z<BhxW7&n`UL~sKD*+VlF

delta 118
zcmca+-(%0^66_MvBhSFV_-i6phlZP^UVN}qe1Nm3L3ER+glDj0JV(5vOArrG0Yh{{
zfQf-K6ITKk%Vq)LJjRU^{TP}2%qBl%+`t>%sG`pd(gxBpdAE?{=7~%T`MG>|#(>Nd
QaNRlCM#y$^gGd-R0In+{5&!@I

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index abcd6d9d309a8f9a9080edc64df7a6c195b5885f..99461b771eec2043263b5bc3c109a08969a99af9 100644
GIT binary patch
delta 186
zcmaE7xWkCcCD<jzLXv@jv2Y?+$7W3?Uq&VmlgSm#8#eo~XmfJ;T#tzlc8V8pxjwm>
z*H+9`A=tnoo+IATC5Q*8hk?T}IMk1EG9$lSa&$w0iGec{R{|GHbfXlA%@`0AXuts^
u3_*kuh%n}00}00HfeZz)KwLvO*AT=tf^&^PTw^%bc;l`-#?AY94Y&c&fia{2

delta 139
zcmdmC^v;mWCD<k8odg2|<GYDm9U5+udhx+d@d3`B2GLEP5}v`1@f`7vE<rp%1q{&*
z0VW2{Ok4?EESqQX<S}lX=*P(9XEymE;|8_pMiqT#kT#GOkTS-Apg;o-AYlk1j6j4j
d$L5Jl+MHaj+hahM2>5QBe2m+6GZ&v8Hvqa2Cba+n

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index dd2c8c0c8c5bf9895eb524e094d5597515b4803e..b10b17cb1111f6b5d61da4aa1c754f2921a4ac1c 100644
GIT binary patch
delta 184
zcmew>zF30GCD<iInTLUaaq2{_4kizi$=XaCHZw9W;i&gkj)@O;iWhKJ4siA~h;HHz
zHZX|ih<9`eVu)^XlnXYnfbc+?8KN5kObncvxDvQnq8p_^Y{r0~Km!gSVF)6OK!h;|
p8%Qul4`eQg1>zdQxrQLF5sWJsXawRL!}x*58+YX~PCmeG3jp{LFk1is

delta 146
zcmZ21@mHM7CD<k8FE;}NBhy5#4h=U+z4&0K_yA{5gXktt3D021c#e2SmmnUX0*2^@
z022deCawf7mdzDhd5p{ger6M=Y*34CRMBS!X#pt*DPar<3N+vV5{4kc2t*ijY<6K>
b!Xf3s8UwOGz=0KF2Y0Z60mO>QPr2;?&p0K@

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index e819ce69461a36b6fab5e2ffeba90dfe558724a7..aff3e9bbe1fdbf783c49d07a49c2e16317a2871e 100644
GIT binary patch
delta 166
zcmca-w8EInCD<iog(L$5<C=+F9h(c8d>NTMOeP;--mrNZi#8{h&%K!VV5fKimwS^>
z^V*8}sstNY#B;<ux&-k6^)PTa28a4FPA=q=<BM(xFfnju;!5CRiEfmdT+1S9!xj(}
mXb__ZG62K^aSh>ILlD;p&NTvYjp1D5jk~rnZf4_);06GVOD_EY

delta 139
zcmZ2se9wr>CD<h-PLhFv(PSc5hlZc5UVN}qe1Nm3L3ER&tY@%eJV(5vOArrG0Yh{{
zfQf-K6ITKk%jQ`;+ZZ=a^kZc5Gn@R7af4cPql!K=NE=8CNEu^5P@n+^kT3)hMj*nN
dWAj8NZB8!VoiQLw1YCDcKE`dkIfyTe8vr6<CKLbw

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 03a9decdc1563f5e759e34dffdab4bb34645d9b3..07b193b9939e2199bce5edc743de5494133c1e8c 100644
GIT binary patch
delta 186
zcmaEAv)-1=CD<ioy&MArqtZmKj?J1(zKl#BCX*|eH*EG}sp8{uxfK&1>=ZBHb93?~
zAzLw5g<u1Vc#e2SmmnUX9tIA_;7~ut$$?^W$<Yk~CI-$-TnSt((T!3dHe*0gpaBPv
vFa!}sAi|h~4I~(&2Qn1I0&xxDTtg7o2+lPEagE_z<BhxW7&r3@M{olGdIvIA

delta 139
zcmZ2)`_zWZCD<h-RgQsyao$9(4h=U+z4&0K_yA{5gXktt3D021c#e2SmmnUX0*2^@
z022deCawf7md!5(^B6Zy^kZc5Gn@R7af4cPql!K=NE=8CNEu^5P@n+^kT3)hMj*nN
dWAj9&Dn2gXoiQLw1YCDc78SJJ94Q>e4FGUoCS(8r

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index b413d9f31d483eca02f45ad09af2f556581ec381..ceee7722ceed8a7e8f61a37805a4c855f47244a8 100644
GIT binary patch
delta 186
zcmeA$ykyAb66_LkNrHia@z+GIj?J1(zKl#BCX*|eH*EG}najcDaw{f2*ePDX=jP<E
zJho!43c&^z@f`7vE<rp%Jq#R<!J&SPlN<TvlA{{}ObncvxDvQnq8p_^Y{r0~Km!gS
vVF)6OK!h;|8%Qul4`e8a1>zdQxrQLF5u9rT;u^!b#v6C#F>W^Cjo=0V7wI#4

delta 139
zcmca)*kQ=!66_MvA;G}FST>QXL&Hr{FFx2QKET=2AiBv@!ZX-0o+IATC5Q*8fFZge
zz{J3ri7SDNWit;?9^=M|evC|hW|JQ>ZcvMERMBS!X#;5iDPs%>3N+vV5{4kc2t*ij
dY@Wz8mxIf9XAH;^0oR?AEx2tr*YJjM0|5S~C4B$@

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 9e701b2983f9ec45af9c26d801545c2b5d112a10..e03f4d07b86018d12def37b5397ba9673548e2b7 100644
GIT binary patch
delta 186
zcmbPZ^vsCMCD<h-O_G6u@zzAHj?J1(zKl#BCX*|eH*EG}G34ZOxfK&1>=ZBHb8~Vh
zudSG?La>2FJV(5vOArrG4+Do|aHt>S<coZA$<Yk~CI-$-TnSt((T!3dHe*0gpaBPv
vFa!}sAi|h~4I~(&2Qn1I0&xxDTtg7o2+lPEagE_z<BhxW7&jl`jo=0Vfr&FF

delta 118
zcmaE6G{=a`CD<iIMv{SnF>E4NhlZP^UVN}qe1Nm3L3ER+glDj0JV(5vOArrG0Yh{{
zfQf-K6ITKk%jN|<d5jw;`Y|&3nN5DkxPdpiQAM8_qz$BHvNw<9=7~&(oLs&;V?gE!
QxbB>MhTC?t0ACn407khWt^fc4

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 8c3956c9ecc63133cc800f1d2d07a1392a35d548..418cc92e4c061ad21e1d281e0b5e6114e283b7d3 100644
GIT binary patch
delta 190
zcmZoLS!TlJ66_M9CdI(Oczz;R$7W3?Uq&VmlgSm#8#eo~Xmi$kJ&TDCc8V8pdKTd9
zX%OAS9c*9_&k^tF62uVQ<R}+xU;*Lr08L<sZU`_jaAx94;9`kxlmf9C1A+n#IDmv9
wh%f>X#vE)Q!5BS|xgZvZYY68Wg1AO7u3(@Mh;Izz2O4kOmB+Yw3U3Y%00)~hY5)KL

delta 133
zcmZ2x(qO{n66_MfAjQDIs56nPL&!~1FFx2QKET=2AiBv@!ZX-$@;z?x&AvRjj2kEV
zF*5m?O@7F@K`pvbMV}d@2&f=Fz{J3rF(4?=fCESvf(RoJVa&04B9k_!l>3PokdXrZ
X$04S22OAi~bHqEk1a02Qo67?Lm(C@O

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index 3870958969b1c0e29f9dd26a1256359e90897d3e..ea35dc5eba8433a8dcb54815f19ed6239f2534e7 100644
GIT binary patch
delta 229
zcmZp0eB{XG66_N4NP&TYal=L~Z^q4;ObLukO<|i)Gq2>^yg{gmm&-vRCO+6HUcf_s
zvW<eRLUfaZbg-L6JV(5vOArqOgFHiYLx5*cAQM*t7f*Df!Q@6E{d%^5pg_kMJ&-;S
z3&eGTbDcn3XE@gx#C3slT|it{IM)@#b%S%=KwNh?*B!+5fO9>fn@qf&T;eCUFg{@y
LVGD5f3t<2Npb9~@

delta 105
zcmaFl*x<<J66_MvpuoVu=(Lf`n^DMFP%l2%DL%m2(;&LZO~5nQak7ED_~eiBuQrD;
zCNeVhMQ+~Cw33fEy3tCX8KerRB7U-`y#D3{!6sfVKb9Dfb^$k*$#3Lr*+tj_oc%%=
E09ef)761SM

diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
index c9c18fa4e45288fb6c2182a793a8e6aff72b33d9..146269c68c68238a8be3aa67e049a85c0b8edc66 100644
GIT binary patch
delta 229
zcmbQ}_}P)mCD<k8vjPJHW57l(Z^q4;ObLukO<|i)Gq2>^yg{gmm&;KxCO+6HUcggf
zvW<eDLUfaZbg-L6JV(5vOArqOgFHiYLx5*cAQM*t7f*Df!Q@6E{d%^5pg_kMJ&-;S
z3&eGTbDcn3XE@gx#C3slT|it{IM)@#b%S%=KwNh?*B!+5fO9>fn@qf&T;eCUFg{@y
LVGD5f3t<2NiwZ%W

delta 105
zcmezDIMI>ICD<ioq5=a0<D-pS-i$)df_m}6PVoWGo(9oPZUUacj*}hb#V0c<yxJVX
zn8?V~7rA*m(@H+x=te7jW{@hNiulP<^7@+-1e<ud{8?i_+6CNMC%=*NV;5lyaP|vf
F0047{9x?y`

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index a32e90b5d913d07bc9ed9aca521420305559f357..4dd420b62fbcfdd21485fec2bafdea54f3fdb5a8 100644
GIT binary patch
delta 229
zcmZ4M-S5NY66_Mfug1W@n6r_~n{jg{QvxGXQ`qLy%q#geZxC89#O0t66CdmpFW@0R
zIaAeEA-c&yI@rx3o+IATC5VTCL7pMHA;2>zkclgSizm9#U~;37emz@2P@rRs9!MXE
z1>!ovxlSOiGo0%T;<~`OE+DQeoa+kWy1}__Ag(){>ki_2z_}jLO(xz>F7cCF7@x3<
Lumw2#g)jgB@by6W

delta 105
zcmeD8S?kT^66_MPR+WK)@&86HZ$=?!LB053r}zM8PlM<tHv!LJ$H}oO;*;f6Uu_Oy
zOk`y0i`=}OX(b<Tbfc9%Ge{LsMf~J475&W#g6oC2{8(Z@+6CNLCQGW=vWu_<IQxY#
F004x49q<4E

diff --git a/tests/data/acpi/q35/DSDT.applesmc b/tests/data/acpi/q35/DSDT.applesmc
index 5507b6b8f5e6ae4fd4275601eb85caf29bddc352..ff25d82ba24b5e792b9d87958aa1b162bc9e0de2 100644
GIT binary patch
delta 229
zcmZ4IIKhd_CD<iIK#_rgv2i1pH{<5%ObLukO<|jVGOy&@d{3yEms2SwKG-Q<z)fj#
zmV&K9bd#TKu$x6ZN4%p;5Dx=`JVSItfM-x36ITKkPjsWf<n==O^=tt_fsQeHAblVf
zi0cIBI)S*(aIQ0m>jLMxfVi%3t}BS^2IsngxbASSJBaH6=Xyjp=>+>a$8T<76k=o-
LVGD5f3t<2NSgJs!

delta 105
zcmbQ>w9b*sCD<ioodN>`qwz*AZ$=?U5xw|er}zM8PlM<t7h%s}$H@lr;+sFpOE7K@
zVN7IX>WkdGooOW>Z*-%TJ~K!eP)Yn`PkH^#34+bMoGdXQ?E-Erli$eMvWu_<IQxY#
F000}#9Tflo

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index a42eb674fa3469a815b1c91ba99b2d4cf85c9380..bde84efd1c5fcafee789781f4030d573002a886a 100644
GIT binary patch
delta 240
zcmdlPIXjBWCD<iIT9<)=F@7VLH{<3^rUXW&rm)SYnOE{{-XPS(%jNkvCO+6HUcmA3
zW*dbZ9);*82kBrpi+GNBN0%TT1_pVC=!O8#pg<<B1TLQFMuW+XLi+V=0YQO|F?t}4
zAQp)01m`+|xXy5{Gl=T~=emHnu5hj^i0cODx`DXvaIQOu>jCF_L^qjuJGsP9Zee^P
UC?XKx>=(iirx$E!5D#Jk0QJE|ng9R*

delta 116
zcmbOowKI~-CD<iorw#)H<EM>W-i$)df_m}6PVoWGo(9oPZUUacj+5iH#V0H1yxJVX
zn8?V~7rA*m(@H+x=te7jW{@hNiulPD+WMOl1e<ud+)u=Sv<vtj-~2`{heuFEAi&u#
Pgdt8Z*w6rIs9y*GI+7!-

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index 2d8cb603c9c937501247d32e6a5b2e79bb01eea3..537be7ca37c021e6a7f098e88c40ba178f3ec3e2 100644
GIT binary patch
delta 229
zcmccMvdNXpCD<iolM(|1qsT@sZ^q4;ObLukO<|i)Gq2>^yg?|4pUXiZCO+6HUcf_s
zGLMq2LUfaZbg-L6JV(5vOArqOgFHiYLx5*cAQM*t7f*Df!Q@6E{d%^5pg_kMJ&-;S
z3&eGTbDcn3XE@gx#C3slT|it{IM)@#b%S%=KwNh?*B!+5fO9>fn@qf&T;eCUFg{@y
LVGD5f3t<2N)oDPt

delta 104
zcmdnwdclRuCD<h-K#75YaoI*LZ$=?!LB053r}zM8PlM<tHv!LJ$4QFflMgDs+8n}|
z$jH<exp_O&N<QA`Mk{@0kRqUh_{oxr`kNC3gZR1pSYklB1>9IB?@_R27hwx<_6uPE
E08AJii~s-t

diff --git a/tests/data/acpi/q35/DSDT.cxl b/tests/data/acpi/q35/DSDT.cxl
index 20d0fb64ea52b2f4979105c934aadb6f416e2b71..aeea64d1cecad0ad011870ed5e04bfea1ae62510 100644
GIT binary patch
delta 229
zcmZ4IJ;8^|CD<iIK#hTcam7Y1Z^q4;ObLukO<|i)Gq2>^yg{f>h|5VSCO+6HUcgIn
zvWIHCLUfaZbg-L6JV(5vOArqOgFHiYLx5*cAQM*t7f*Df!Q@6E{d%^5pg_kMJ&-;S
z3&eGTbDcn3XE@gx#C3slT|it{IM)@#b%S%=KwNh?*B!+5fO9>fn@qf&T;eCUFg{@y
LVGD5f3t<2N6HY-N

delta 105
zcmbQ>v(B5#CD<ioohkzZqt`|*Z$=?!LB053r}zM8PlM<tHv!LJ$H{Rj;*;f7Uu_Oy
zOk`y0i`=}OX(b<Tbfc9%Ge{LsMf~J)75&W#f_*|<4(u@??E)TblYc13vx~3=IQxY#
F002z99vJ`t

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index b23339513af3be457c1974e0288fc4c6720690d8..ed11aefa4a56a8408bd4e0de83bf2373e6025449 100644
GIT binary patch
delta 229
zcmez7d&7^*CD<h-LY;wu@$W`1Z^q4;ObLukO<|i)Gq2>^yg}%PFqeZuOnk6Yynu)N
z<V|X}3eimt(!p*P@f`7vE<rpD4Dt-o4FR4(flOQpTs+Z@29q0w^y}FIf&v|5^g#MR
zED+ZT&UFHDo#9+(5Z49Hbpdf*;apb`*A32f199EqTz3%H1J3n`ZZh$9a*3bZ!uW(;
Lge}0?FN6UAoF78{

delta 123
zcmccN_sy5fCD<k8n;HWH<AjY|-i#W~f_m}6PVoWGo(9oPZUUacj`1AvjxIqw3=HxN
z(G3BfL4izM30ypr)6`yX4q;4WWa^9Dyq#$!A8&M{l|C~_A4t#S{i^z#69j(<bNR8v
WfD9CHW0{<!YRfLd7U1j`!T<oQ7$VgG

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index 8af2695edeeadbde2a1e8f04ab567f5c00b76945..d9d1e75c987acd42be4576688621be07b21f0e7b 100644
GIT binary patch
delta 230
zcmX@@xYmiwCD<iISCN5%@#sb_Z^q4Am=YM7n!+}Vv8?3V{9CArm&;ovCO+6HUcgyp
za=U`9LUfb2e6X8EJV(5vOArqOgFHiYLx5*cAQM*t7f*Df!Q?YS`t@u9L4l4jdLVru
z7KrNv=Q@G7&Ty_Xi0cC9x`4Q@aIPze>jvk#fw=B)t~-e90q1%|H+i!7dKzwSVbo`2
M7hwx<_6uPE0Ka}f-~a#s

delta 106
zcmZ4MblQ>2CD<k8v;qSIWBNueZ$=?MQN8$Jr}zM8PlM<tM^VpU$H@lr;+sFpn=)<=
zVN7IX>WkdGooOW>Z*-%TJ~K!eP)Yn`PkH^#34%?$Tz)JuApHVvER)~J*|LkU1vvYK
GFaQ91ARZV1

diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
index 479df48cd37af888317d63eac8f565f370201490..f6e124137721312722c820b5c084a143492945c9 100644
GIT binary patch
delta 229
zcmccVxZ8=#CD<jzT9JW)QEwxcH{<3^rUXW&rm)SYnOE{{-XL_Fm&-vRCO+6HUcf_s
z@>B&|h3F;+>0mdDc#e2SmmnSn26=|)h5*l?KqjsPE}rN{gUO9T`t@u9L4l4jdLVru
z7KrNv=Q@G7&Ty_Xi0cC9x`4Q@aIPze>jvk#fw=B)t~-e90q1%|H<@@lxx`OyVSK_a
L!WQ7{7s3DlR3kxi

delta 123
zcmdn(bkmW`CD<k8rUC;4<H3zw-i#W~f_m}6PVoWGo(9oPZUUacj`1AvjxIqw3=HxN
z(G3BfL4izM30yprJr!PW4q;4WWa^9Dyq#$!A8&M{l|C~_A4t#SMe_Qa69jMba`~~u
WfD9CHW0~wKZ_6&i7U1j`!T<nx-XaA6

diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
index c9c18fa4e45288fb6c2182a793a8e6aff72b33d9..146269c68c68238a8be3aa67e049a85c0b8edc66 100644
GIT binary patch
delta 229
zcmbQ}_}P)mCD<k8vjPJHW57l(Z^q4;ObLukO<|i)Gq2>^yg{gmm&;KxCO+6HUcggf
zvW<eDLUfaZbg-L6JV(5vOArqOgFHiYLx5*cAQM*t7f*Df!Q@6E{d%^5pg_kMJ&-;S
z3&eGTbDcn3XE@gx#C3slT|it{IM)@#b%S%=KwNh?*B!+5fO9>fn@qf&T;eCUFg{@y
LVGD5f3t<2NiwZ%W

delta 105
zcmezDIMI>ICD<ioq5=a0<D-pS-i$)df_m}6PVoWGo(9oPZUUacj*}hb#V0c<yxJVX
zn8?V~7rA*m(@H+x=te7jW{@hNiulP<^7@+-1e<ud{8?i_+6CNMC%=*NV;5lyaP|vf
F0047{9x?y`

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index a5730b8ab8abb2602334633cd6c760f79915e564..3e79ba7ac0b9a466fddd2213f32d20c522b8613b 100644
GIT binary patch
delta 229
zcmX@_z0rruCD<jzP>q3sap6WTZ^q4;ObLukO<|i)Gq2>^yg}%q5SN2OOnk6Yynu)N
z<Ze}4h3F;+>0mdDc#e2SmmnSn26=|)h5*l?KqjsPE}rN{gUO9T`t@u9L4l4jdLVru
z7KrNv=Q@G7&Ty_Xi0cC9x`4Q@aIPze>jvk#fw=B)t~-e90q1%|H<@@lxx`OyVSK_a
L!WQ7{7s3DlsQW?J

delta 105
zcmdn!bKaZFCD<k8yeb0&qsc}tZ$=?!LB053r}zM8PlM<tHv!LJ$I107;*%XzUu_Oy
zOk`y0i`=}OX(b<Tbfc9%Ge{LsMf~I$D*Brf1TPA4`LV=+v<tYgOtx0BWfx%!aP|vf
F004fR9yI^}

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index a4293c20fed04d1ccfc4f4fc1ccf46ca81453854..afc260ebf4d91a2a9f7be5ff21968e99b1f9c5d1 100644
GIT binary patch
delta 229
zcmaFmdB%&&CD<jzN0otrF?J)DH{<3^rUXW&rm)SYnOE{{-XL^akjqgqCO+6HUcggf
z@>CT+h3F;+>0mdDc#e2SmmnSn26=|)h5*l?KqjsPE}rN{gUO9T`t@u9L4l4jdLVru
z7KrNv=Q@G7&Ty_Xi0cC9x`4Q@aIPze>jvk#fw=B)t~-e90q1%|H<@@lxx`OyVSK_a
L!WQ7{7s3Dl&Zt5L

delta 123
zcmX@(^~#gWCD<k8l?np`<A;r0-i#W~f_m}6PVoWGo(9oPZUUacj`1AvjxIqw3=HxN
z(G3BfL4izM30yprqf}mR4q;4WWa^9Dyq#$!A8&M{l|C~_A4t#S&C2?l69jJya{05y
WfD9CHXPxY-?8h#`7U1j`!T<oa`y#>s

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 88bf47ab1805e4ef1dd8039933c5aa8144da37ac..7c14ce3a986fa06e88f3adc088faae54bdd2d8e4 100644
GIT binary patch
delta 250
zcmX@$yvT*iCD<iINr{1hQEDTXH{<3^rUXW&rm)SYnOE{{-XPS(%jIAa6CdmpFW_Ok
z*+wCgQ6aj?K|0vYBAz4O(Itq7fkB=jx*@<bD3FOOfr}@)(O`0;kbXT|Kv1A#j2=iM
zhy~(0!MRQ#t}~qL4C1=Lxh^2CE1c^J;<~}PZXm8Zoa+wadce6J(M=}aPA>72TNs~6
Yi%11H`-L#X=>;2F#)Ft3mI0Ur05;)9wEzGB

delta 144
zcmZ4Fa=@9(CD<k8fFc6}<Jyf}-i#W~f_m}6PVoWGo(9oPZUUacj`1AvjxIqw3=HxN
z(G3BfL4izM30yprWfWg;4q;4WWa^9Dyq#$!A8&M{l|C~_A4t#SQU(3Z34%?$Tz(QU
kAOi*5BsRa1%Vd-mkqU733t@=U3pTU_TH_Z2Vi|y008Qg3?f?J)

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index 6feed2ee106087d24d51f468df1b4d44e65143f0..60595f55fc72397e3ed9b1999dddd39cd98f89a8 100644
GIT binary patch
delta 229
zcmexlf5m~zCD<h-M1g^Uv2r7qH{<3^rUXW&rm)SYnOE{{-XQdahs!}BCO+6HUcf_s
z@;Z52h3F;+>0mdDc#e2SmmnSn26=|)h5*l?KqjsPE}rN{gUO9T`t@u9L4l4jdLVru
z7KrNv=Q@G7&Ty_Xi0cC9x`4Q@aIPze>jvk#fw=B)t~-e90q1%|H<@@lxx`OyVSK_a
L!WQ7{7s3Dl^Up#w

delta 123
zcmccO@X4ObCD<k8lRN_hBhN-IZ$=GgLB053r}zM8PlM<tHv!LJ$9Rr-N0%TT1_pVC
z=!O8#pg<<B1TLP*N%F5ZhcG5GGWA7n-p;g=k2ku}N}m~|52R=EZaMwU34&jExcpdR
WKn4o9u}qGWvt<`y3vl)eVE_PFiXrv@

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 414b8af67bdf79238915de0d609ce45e150eb958..68e67eb91097c58365e3734c9b35d32796639d54 100644
GIT binary patch
delta 229
zcmZp3eBsFD66_N4LV<ySF=`{1H{<3^rUXW&rm)SYnOE{{-XPS$%jKXD6CdmpFW@0R
z*-61xA-c&yI@rx3o+IATC5VTCL7pMHA;2>zkclgSizm9#U~;37emz@2P@rRs9!MXE
z1>!ovxlSOiGo0%T;<~`OE+DQeoa+kWy1}__Ag(){>ki_2z_}jLO(xz>F7cCF7@x3<
Lumw2#g)jgBaBM+-

delta 123
zcmaFi*yhOP66_Mvroh0!_+}%QH=~BLpk92iQ+$B4r$Ka+n}BDqV?0N^qe~DE1A{z6
zbVGn=P#_am0vFHZZ}P7<hcG5GGWA7n-p;g=k2ku}N}m~|52R<Zzr6nD1i=noE<ctS
WkbwejER#RU*|LkU1vvYKFaQ8^2O?+y

diff --git a/tests/data/acpi/q35/DSDT.pvpanic-isa b/tests/data/acpi/q35/DSDT.pvpanic-isa
index 7277a0105035f984dc0a0f09747d441c21e62d1c..811cd27c7e7366e61683c7c5ef67f0996f395c25 100644
GIT binary patch
delta 230
zcmaFrc-)E0CD<jzU6Fx-F?b`FH{<4WObLukO<|i2SXT0F78P#d<#JVvi4S&)7w}b`
zyimbbA-c&`G1$!_o+IATC5VTCL7pMHA;2>zkclgSizm9#VDd8|{d%^5pg_kMJ&-;S
z3&eGTbDcn3XE@gx#C3slT|it{IM)@#b%S%=KwNh?*B!+5fO9>fn}DXdhHY+P^kifg
LVGD5f3t<2NL%%?L

delta 106
zcmX@^^wg2dCD<k8sR9E7<HwC$-i$&X;(GDHPVoWGo(9oP-eR7?j*|`K#W#PH_h;N3
z!kEa&)EBvVJJU)&-snaveP)m{ppy8>p7Q#e69k)hx%^mSK>7vTSSG)bvt<`y3vl)e
GVE_Qr;2#kH

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index 253a66e65818d1df67b13d4b70f68add78adff98..7a213e3db230064cedf3a30b83b11128286eaeba 100644
GIT binary patch
delta 230
zcmccTdccj#CD<jzL79Pp@xeweZ^q5LSrQnTn!+~AvaRIX%p}^!%jM)66CdmpFW}`e
zd6tr`LUfapL$I4gJV(5vOArqOgFHiYLx5*cAQM*t7f*Df!Q{&#`t@u9L4l4jdLVru
z7KrNv=Q@G7&Ty_Xi0cC9x`4Q@aIPze>jvk#fw=B)t~-e90q1%|H#w+=1o&=lVKifA
M7hwx<_6uPE0Ky4DCIA2c

delta 124
zcmX@$cF&c|CD<k8o)QBC<E)Kb-i#WqW_t0#PVoWGo(9oP9;Tkbj`1AvjxIqw3=HxN
z(G3BfL4izM30ypz|H#`iZw_HhWMt}#+`OG>B_D5eqm@20NFzwo<WPD2%?W~iyj*@P
XF(4BK+*l_6kh5hMVGD5f3t<2Nq?jUv

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index 76bd4661e6655d2a8f246f4bf38490df14da82ad..b55e828c6397f80c14de82f371fa34553008a875 100644
GIT binary patch
delta 230
zcmez2ddrQ=CD<h-N|}Lyv1TKeH{<53ED4NEO<|kO*;evxmJ#ja<??Zhi4S&)7jSW#
zyhX`YA-c)OG1$!_o+IATC5VTCL7pMHA;2>zkclgSizm9#VDeiL{d%^5pg_kMJ&-;S
z3&eGTbDcn3XE@gx#C3slT|it{IM)@#b%S%=KwNh?*B!+5fO9>fo4nLQ0(>{OFa|KQ
Mi?9Va`-Lz703b9$$p8QV

delta 124
zcmccR_QRFSCD<k8hY|w=qvJ*{Z$=G&bG`Urr}zM8PlM<tCv(qW$9Rr-N0%TT1_pVC
z=!O8#pg<<B1TLP<f8@iNH-|7LGBWi=Zr;wcl8-mK(Mq2gq!FZPa;Uui<^;h$UM@eD
X7?6nqZY-03$l0=sumw2#g)jgBtUn@}

diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
index 3f14b57f0797ab13fc4c90dd2949cf4bd6c30896..a8a93fe70d8e98ec0e66278b45d36393b75740ec 100644
GIT binary patch
delta 229
zcmccWx!sG)CD<jzT$O==(RU-4H{<3^rUXW&rm)SYnOE{{-XJttkjq6SCO+6HUcg6r
zvad>`LUfaZbg-L6JV(5vOArqOgFHiYLx5*cAQM*t7f*Df!Q@6E{d%^5pg_kMJ&-;S
z3&eGTbDcn3XE@gx#C3slT|it{IM)@#b%S%=KwNh?*B!+5fO9>fn@qf&T;eCUFg{@y
LVGD5f3t<2NOvpiI

delta 123
zcmdn)b=8y0CD<k8stN-G<NJ+V-i#W~f_m}6PVoWGo(9oPZUUacj`1AvjxIqw3=HxN
z(G3BfL4izM30yprT~%Ih4q;4WWa^9Dyq#$!A8&M{l|C~_A4t#SdCK~m69gv<ayfCv
WfD9Dy;+XtbsgYfTEx_3?gaH7Pw<7ld

diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
index baa88f6f219a2a47fe20ee0c08b92371cc7e2aa7..8211f5af8f9433b66b64768acb1de61a5716152a 100644
GIT binary patch
delta 231
zcmaDnjp^ugCN7s?myn~~3=E8E8@aq0H)k>>FfuiTZ9dJsl5g_{q0|a42ZfmUV5fKi
z5BbUR-L?wRO%Bq*ZWi$z@s2J*JPZu-4ABh%o<V_3TnSt}(TxU^8-?`i*#d$B9b@!B
z`amoY*9p#b0&$(;TxSs11<rK=ab4kDR}j|?&UFKE-Qiq!5Z43F^@wgV@pf{FpWMRu
Ngk6L!z}YW^0RZ#_LrVYv

delta 125
zcmX>)o$2v3CN7s?myqOc1_s6-8@aq0HJk<Y;)9*y1Drh#qMO_VJcAwMIpQ5%f_NAh
z<QbwH0z88PnYa?TcqU)&dc8S>F_Dp}FLLvCrj>lW(T!I6%piRrJ(G31^fxC6rdDwI
YvBZE36mVmie7@6`U4$*b*)N0v04#(g#Q*>R

-- 
2.31.1


