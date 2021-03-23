Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C9534615D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:20:33 +0100 (CET)
Received: from localhost ([::1]:51254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhtY-0007eJ-8E
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOhoJ-0001Pn-RG
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:15:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOhoG-0008S8-O5
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:15:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616508903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+RDzDMndTg6QZnrXTrq6jfDB4LFI0581rTxRNnHZJik=;
 b=TqB9pSS+QLYLsxZzl7h+4rI1Jwjc359isGswa1AKREEhWZ/Us7gGae/F48yFuAQAIxvQ/V
 pmSp6JXS2GA3uBdFxMM3I+tuLPw2p5A8ePFvz0LQyw3x5NDZUU4wL8J+hHgqaHbYyx4Qek
 xMKQ+0aHlQw8RUuwyHUgFuiaajnV9lg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-UNmE5rQkOoeKdeg_XK4AiA-1; Tue, 23 Mar 2021 10:12:06 -0400
X-MC-Unique: UNmE5rQkOoeKdeg_XK4AiA-1
Received: by mail-wm1-f71.google.com with SMTP id y9so537037wma.4
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+RDzDMndTg6QZnrXTrq6jfDB4LFI0581rTxRNnHZJik=;
 b=ZXmQgdnQcJhe7TgTdjmNOw83z5VGQ2ywdTdnjcMg+r3Gy7oS2RZZomrTmjbNiKmVNI
 i6ySxLEhF/sqdQ8+O4wY7nm3hIL7oK7wSunq6iqeLMGTPXWiUHFdu0dLnHjwldlpDATW
 9eUrU+kqFANr3gum5phqjjEt1QlDT6N8J7+0musip1xr5J2UWO0FMTU6TH+mwUE3U7dY
 QC3mQgI6ZtwbZhwfrPBSV5ihhb8sj6Klb6fSMJD2I+PK2dKAuUAAwQ+D93ikjCDGl1bd
 uXmxOYwwrVYH0odnv3b80jalnkRZDk9set4ySEC0utI1XRB+Fhwu1Rfn8UYbFnKhTIog
 F88g==
X-Gm-Message-State: AOAM531ds8ae0saQ8xH4XdHaFcF3HByurvu4WaFgyIdoxr0+LzPQPPaR
 vLDE2uL4VKqA9oLeiFZbE7yq9bkBESutqXDIbE/xsldp6kzNo75YzCuSs7Hn0SaE7xaLexVMSsl
 zqmRK+iuNAZE8cjcDAmnc4isrPHD/o9jrSzphg9Azi9Y0dhxnVNFA2IFjX4XE
X-Received: by 2002:a5d:4cc7:: with SMTP id c7mr4408326wrt.164.1616508724573; 
 Tue, 23 Mar 2021 07:12:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMCK4Y70TXdHWqcIp7oaGZN7L54Sl0zpo/AMUK5/dvThSqqC4U5a+Zd3tu9WqY5KctG9WYpw==
X-Received: by 2002:a5d:4cc7:: with SMTP id c7mr4408287wrt.164.1616508724233; 
 Tue, 23 Mar 2021 07:12:04 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id u9sm2709477wmc.38.2021.03.23.07.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:12:03 -0700 (PDT)
Date: Tue, 23 Mar 2021 10:12:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 14/19] tests: acpi: update expected blobs
Message-ID: <20210322225907.541943-15-mst@redhat.com>
References: <20210322225907.541943-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322225907.541943-1-mst@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

expected changes are:
 * larger BNMR operation region
 * new PIDX field and method to fetch acpi-index
 * PDSM method that implements PCI device _DSM +
   per device _DSM that calls PDSM

@@ -221,10 +221,11 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
             B0EJ,   32
         }

-        OperationRegion (BNMR, SystemIO, 0xAE10, 0x04)
+        OperationRegion (BNMR, SystemIO, 0xAE10, 0x08)
         Field (BNMR, DWordAcc, NoLock, WriteAsZeros)
         {
-            BNUM,   32
+            BNUM,   32,
+            PIDX,   32
         }

         Mutex (BLCK, 0x00)
@@ -236,6 +237,52 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
             Release (BLCK)
             Return (Zero)
         }
+
+        Method (AIDX, 2, NotSerialized)
+        {
+            Acquire (BLCK, 0xFFFF)
+            BNUM = Arg0
+            PIDX = (One << Arg1)
+            Local0 = PIDX /* \_SB_.PCI0.PIDX */
+            Release (BLCK)
+            Return (Local0)
+        }
+
+        Method (PDSM, 6, Serialized)
+        {
+            If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
+            {
+                Local0 = AIDX (Arg4, Arg5)
+                If ((Arg2 == Zero))
+                {
+                    If ((Arg1 == 0x02))
+                    {
+                        If (!((Local0 == Zero) | (Local0 == 0xFFFFFFFF)))
+                        {
+                            Return (Buffer (One)
+                            {
+                                 0x81                                             // .
+                            })
+                        }
+                    }
+
+                    Return (Buffer (One)
+                    {
+                         0x00                                             // .
+                    })
+                }
+                ElseIf ((Arg2 == 0x07))
+                {
+                    Local1 = Package (0x02)
+                        {
+                            Zero,
+                            ""
+                        }
+                    Local1 [Zero] = Local0
+                    Return (Local1)
+                }
+            }
+        }
     }

     Scope (_SB)
@@ -785,7 +832,7 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
                     0xAE00,             // Range Minimum
                     0xAE00,             // Range Maximum
                     0x01,               // Alignment
-                    0x14,               // Length
+                    0x18,               // Length
                     )
             })
         }
@@ -842,11 +889,22 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
+                Name (_SUN, Zero)  // _SUN: Slot User Number
+                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
+                {
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                }
             }

             Device (S10)
             {
                 Name (_ADR, 0x00020000)  // _ADR: Address
+                Name (_SUN, 0x02)  // _SUN: Slot User Number
+                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
+                {
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                }
+
                 Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
                 {
                     Return (Zero)
[...]

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210315180102.3008391-7-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  11 -----------
 tests/data/acpi/pc/DSDT                     | Bin 5065 -> 6002 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 6390 -> 7327 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 6924 -> 8668 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 5529 -> 6466 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 6719 -> 7656 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 5026 -> 5969 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 5137 -> 6074 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 6424 -> 7361 bytes
 tests/data/acpi/pc/DSDT.nohpet              | Bin 4923 -> 5860 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 5071 -> 6008 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 5261 -> 6210 bytes
 12 files changed, 11 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index fddcfc061f..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,12 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/pc/DSDT.roothp",
diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index 11ef89bd322271ee30f3971b880dadfda565d413..b9dd9b38e4ef720636ba19ccbdf262de8a6439d5 100644
GIT binary patch
delta 1301
zcmajfKTE?<5CHH?>Yo~-P1<Nx90b8ygwiVFs7)eTZ9*{?ga}EuwpIz<6r|Y6RUaZE
zLJIi;($zs!q;7r%2SF4O{Q|X5I|=39a2)S`@3>puW8^!=sfM~y4g)ZgSKKwr>LO{d
zYeBzxD9F0DuE=^;8_%TFO)~C_Rix=;D`m|IIjyWUn@*mVojs-ilsGilW`q_!TT**6
zs-X?I>28u2L!9t5|M+6e?Q6&3H*Mrj(Hz>Vv}3yyqzLW^DR8VCIyoRV5Swqd4tS!E
zIivw<VRw)egIuo@>}H`Ka*lnJ1MqTn-N*Ma!^GqZm6h6-WyqGWSj#A>xL-Dw(qLAj
zMm%o$t)#jRe#^+}Acd{gT)ao8%NL5<)X{=jUF|XwZOa3&f1YDIJ&;=c5-NB=lNnWL
zXS4Lmtjb+P>Yp0x^!OJnV4#SBQw-c-;2i@)1IQLh43sc%hJjlQd|+TWfNY^)U>5`D
v7`Vs4Ck93ZWQ!#XI2gFVzyk)pFfb+}TP$OsjDbrGG{k7&-$zh?6`z?OB0Yu?

delta 345
zcmeyQcT%0pCD<k8q%Z>mqyI*(Jxoj<9FtEldGoSFH*!1q`35;V`GxvUR%O=P{Dhf@
zlTl>yN1jY0*MgY%V5fKi-~0e)PXi98U{@c8=qB!91A};uct@8YAV(|M5X#|UU|?dH
ze2Q0=QFHQ3UJd5xCe6vZd=R=2N^gbIKcTcOKSaI}N*{&NoB|MWUno5hN?(Q2l7bNV
zSSY;^N<W3tnnDoyTqwN}N`HmYmckJES}1)GO0$YU#66*OFO<FrrA0*{@{yvNn`epM
GU<3fvFk-6!

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index c561e91be79f80dbea1cf4eb0f8658541a3aab2f..cba5a1dcb0464e56753bc0b931a4dd2e3b209787 100644
GIT binary patch
delta 1301
zcmajfPfG$(5CHJmHA@yV|Ey^t5qKyGLW_uQxw}%PyGWZ5Y_RK1&0>iz1tEIsTJI1M
z;R^c&qHCv$uugr2h%P}yL|x5So&uS77=|~$H_Tk#ccQVtNvgEghyXCp7u*%gDn8O;
zGk%v=^9qW*Dhf(o9?zwvbu#XluJTjKPReRgAuDFuZL>(r<{nc5N=zCIZGskUgO~bq
zk}7+wtdkUd0nYn4fB&M+?aN1@S9#<{lug>JvSnCNQU+^;lsMK393Kz^h~aK`4%j{i
zQ=<WzAuCAAer~|@J6RZnf@vHU0PMo0;#lx7VRGmzRhOF^x+>`2#b!=S$6bP&%7Rvp
zsqwh((v#9ExO6qI03XsjbGdCgU9nW&q>dJ}`bwXg=vp@b`{y~f*8{%OFCl>qG?|gS
z-E5X#X?3BGB>j_-UXOo41p_A-xW>R62EqYkND%|u7&yhiEe75(Fv=raq%dG&;0yzI
w82G?IB#3OWgn=CloMWJcflmyK4I^8mF|dn)1_mB5@HHG8`u7oB218HG4_Q%&Gynhq

delta 345
zcmbPl`OT2aCD<k8n*;*`BhN;zJxoj<9FtEldGoSFH*!1q`35;V`GxvUR%O=P{Dj$(
zk5Oc@oKU8bYe7tWuv5H%Z+?KYrvZmku&WP4bQ5>5fk8Y+yrWAHkfRlB2<7lFFfcJp
z{w^fTs5x0oSc5sbNpo@(l%5BrA3<p~5r}*ilwJp=KS60TQHXpMl->uWnZzLCZcw@l
zN}q$$LgEnlFep6>O5cOhN)izHG$_3aO232BMv@TuGAO+ZO8<k>PErv0HYv@`$E9vC
F0szp9V*vmF

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index a234075518fa8e187349d64c313779cc25db8299..a9b4d5659457f6de30b993962bce673c9413d81d 100644
GIT binary patch
delta 2375
zcmeA%yW`B|66_LkN0EVn@y153Jxok~f|E}$c?)qwHwrlU`35;V`Gxu_1bDhcOjcml
zs~6FB1TvYTm7RQ?z5o9&$N)(fR5E5VfRq$~h=gc$kmQmC5f`=qmtbGM1wO2kGX#aX
z1TL7Ld>U+8<vUUQm9OMsXWs&lSvk203zR2kF)WaroXN$sKzLH^<OGJv2|WLSfMJOs
zGh-u&U|1-=Ky-4J5Epxa5GxY{FGFHMLPsJ4!;-|!e#|_aj1rThc{1ypJQ!o*gPr09
zI^7uqoIMRVoPu3_7^0grgAEMgIpQ5%f*3gBgG2ooM8xBPF5_7Oa$iPfRyIf-NFut)
zizV0)s+Na=feE6XiwTzo5uka7E(}W;KnxEf7|R&Mh;H&-6>Mk$u^4C=Gt@9<T!w+2
z%NX5cGg*gMSq7J?=q5*&$w9p8coaCXOs?V8z^`CAAqA}>1WedKNWpDF3fM#mSYb#=
zK@1@U?SvHk=Of^TyM#>O5F=nh13v);afD3hB&2{*fPfYE37NnpPQV0HLJATHDd;Ao
zU>hL?4+$yYks#m;b3zK%3lcD)myiiN2q`cSB47odq$WRF3AMReh?9v4n6XE*C9sqR
XhQnyKgoMLrwuFSk0A))($$N|dt?<SV

delta 619
zcmccP++)V&66_MfBhA3TIDI469wsIaj>#vOym?uo8@ZkQe1n{w{6c*vt1|0te!|Sd
z$tW`UBTuH0$CH@&V5fKihbIBfo(3FF!LB|G(M{aJ1_tpQ@s2J*K#o?hA(X?zz`(>X
z`3$eDq<>kkp#?+*P>`7ctdTLgNoBGkpE7fFlg8u(K6N0iIe9Uk2AF;hrM3AX{Cp_A
z8A^YL($)eH`FbdQ7)rAXLd3nHbU&2745h_|Ao9^rdOnnX45ihDA@bQ!dOei>45iIQ
uAoA5vdOwtA7KMnrL+NfPeI7~+i$UbW#WWYs5MyH0oIH$uxS3tyDkA`KW3MOx

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 6ac47a7d1001c711b957f8e28cab1a143d2cf65f..8d86155e275aa688f8767dd92c4b9df08b4a18ad 100644
GIT binary patch
delta 1301
zcmajfPfG$(5CHJmRZAArT~{%oL(ri_2sI*z2wOMkkGqJQ5NxpPA#$x?uLU7`icZyw
zsM`wr1;R^E5!Iz`eSj`OMM&SleB~*Kd52+m^LxY0<(((*Gn}l+D^eVQIk@1iSymOu
zBfA{->vdjIm10g(OUiIzQC=m(p7B~FIoC~DeMHLVmOCB0Ld*6JV*w>L4W>Ryi>?`w
z`wFtA1f9H(R0NUZpQoPQwaH!ODArcu4>`rAy|%VZXM|M2i4%)s9r1XNm_W=xr+dH^
zJWQPiXvUl<sfM|JJM3d&0Lr$xUj}f?E!FeFF@q!-v}y~@HA9mOKHDth7E^vno6m#Z
zNNA~);Wy^wBKQrhq(UTSbmt1Vbh?UF-K35d^v04`OZRL5fc^Cx``?2|w_jQY7if}^
z`Cc|buk?oGC2zs8q5mHLfKUhl(->ICz##^%Fz|r^fk(EO!N3Lvjxlh9flmyG0<y&{
x1}qGmVBi)5Z45-i$QD@)Y+~RP19uqs!az(!wvaHeje#>U5&H8Hv@XS0<{JoRhA995

delta 345
zcmX?PG*g?)CD<iorYHjg<K~TAdzhF!I3}N9^5$iUZsd0I^9^!#@(cBytjesn`3dtK
zE=G~b2l+CMTnl32gPr09eDedGJq<XVf?a(WqMNvb4GiKr;vHRrfE=x0Lnw!bfq{u(
z@+^K?M$O4P`8AlMn=~i?h0=}!5PmC^J_)6H1tH>rP<kqqz6qseg&^{YP<knpehH;@
zg(32VP<ktr{t2aRMIiExQ2Hp8<`jj9`$Fl7Q2HvAmK1}?$3p3aQ2Hs9))d#=oF#sP
F5de9{W0U{@

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index d24377279c307adeaba2b98aba20677872dfbbda..e00a447f92b27f9a91be802eb11fe89dc0457e20 100644
GIT binary patch
delta 1291
zcmaje-75r96aerucYSPQ?bi&uic<T)rnKZMBxXnX*qOE+N{!5HlHEnkgBK*(CrQHn
z2WD&j0Z9__;DtB-1B5pJ#F`sVYCHGgbnE=ix#v9G`@ZrBFKhB#xeb8ZJm+r-QA6~R
z%!a-Ceo#`COj1(kmG<<syg=JM-Fsr!gnK1=OiCqZD-|op($*H22SzLwOud689aEI+
z(z2%b?Nlwzg#<qMJoxmf^=~Vuk#D8tA*oob*ZPKO$7liU7MkaYEu8IA6R7E{xCfk&
zhudcXN)fw>7Q%eJ6|N=F2wBTK$O1Uo3)NE$a8dda&hJf?77a}@g5#xhaysFaw8<3c
z#kiJ87+zyS&Vbj@=2Z|QhC7$fVbkUEg*E0_LNCtLXgz<{2S9#3PpTD&ZoeKG9AKAT
zneGUFBGu4Cp|iDGiC%QUB?ewG&>$jD3}7IOfg=oDVc;DDjZMfFLl{`bz%d4{G4O$b
yKr^z%Fa}mIaDssw418fA6hXEa#lR{C&M<I?fieb!D6+*^G#>c({V$fHZ`=<Gs)Z*2

delta 345
zcmaE1z2Ah(CD<jzUW$Q%an44rJxoj<9FtEldGoSFH*!1q`35;V`GxvUR%O=P{DirQ
zpHXCTx^SkEYe7tWuv5H%Z+?KYrvZmku&WP4bQ5>5fk8Y+yrWAHkfRlB2<7lFFfcJp
zb`X(e)SMhIqQM;9q&ayplztASwM8M~`A~W@l>QE-t;Hbn^-%gSlx7!)h<iinekgqz
zN{dTC<fEbVd?@`GN~=pk<g=mldMN!FN}EeT<g20dekjc>4H0*T(%n${ytL+K0ht?&
E09A8hhX4Qo

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 9dfac45eab12b680bc963d0528553a7149a378cc..5d8ba195055f2eda74223323baeb88390ea36739 100644
GIT binary patch
delta 1315
zcmajf&o9GZ7zgmDZ~d62SZ6X42Z_imi)ACik**?GYxW|NO4{AFA?X#7Wpi=my;IVN
zh)BfM&4r5)#M!~c-yo)M>?Gmo;mwmipMKxxx%4>tn2<E8EzCy%gttrSnh--_w`4XH
zFe^dT&~s_kSk!y7)7moY6%*xfe8Mk@*{5dGv$dL2;B99^C;}%AKWsC~o1Puknz9<z
z+uTeeD<~aO@L}}sosMkkdyx;l`zEbBJZo*;cKcWf+-_Esh}*Hh&1_({T=O6B6j7+~
z1CAnYCo6@dW+&80pcV3ty_*N{@>hl^w+LO#l#Au5!xf9FR&eeho1RVvR63afvl^qx
zq!q9xv>XI1x@bT+V)=8)9-ppIEUj|K8)kK;fu`zK1|UCPB7c1l_VZF2c)*JxZM<F$
z^H*jyK~rNt_xf34Jxly6%dDymtiN@j=U<S;z!nBhFz|?hPYguckS%f;*v7yq2A(kR
zg@IT*vc&=h${0AqzzYKQgUF0=3@l-wf`M}kykdYT$QFYbSjNB(1}>CX`>)@^)xGj8
Fd;_9>h+F^w

delta 354
zcmcbpw@97KCD<iokuU=TW5-6WJxoj<9FtEldGoSFH*!1q`35;V`GxvUR%O=P{Dhf@
zlTl>yN1jY0zucJkV5fKix7+|{PXi98U{@c8=qB!91A};uct@8YAV(|M5X#|UU|?dH
ze2Q0Ah(FlS0-^vY#tc-XIa!iVgBe7}Lg|H2`YDvw<cG-TLg|fA`YV*S6oAOrLg|B0
znpF@Y?g^!Pq4Y&4Eh+?&kA%{5q4Yy2ttt$W&xF!zq4Y;6Z7KqhuY}Tjp){i?MBG(W
Kb90;MX+{7Q6k^H%

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index 1814f291b704d737d3578b83fbcc6e090384943a..01e53bd436698db6f6adfff584ec56cb99074a5f 100644
GIT binary patch
delta 1291
zcmaje!Artm6aetI&1#Klb1h8h5Ol~0$_kNgITvI)k(Lll+Kdir1-ll6=%pee?1Rpe
z_79X1;k8q@{(%UIF8vd>k2(eNzQg0e`@P3|hp!duE()5VZFeI8O!r<0aBMzIBrYrS
zW<yf*`c_)a7xn2vM%y73ZlSKsr~H&PXVhFe+wVIST6T_^Dp2CkV4JhF=-G-kT+j?X
z<mQG*B|I)jZ^_p$BXOd)BHw!SC9OMj*5Q%u&X5|oQBoCHcl_p**g$Nt??3Ru9Mhly
z+7Wkx)MR1Ak%w3aLfNs;%K%=vbIXaN%p|!JtM!d`$ud++T5A{5nK-W+>p3u+b4EOF
z@m5OP0^Tx;c~ByjznAFI?JCvU0d=%sHa7#t(w`Lp*k3QOgBlcn-jW6$&}3O7dN9PQ
z0a6OarUtc`O&^?L-~j{g7~n(54l5Yg#lQsy9x?EN0bvZeB7p%L1D6<h!axrLqJ&(L
q#K0Z~t}yV7flmyC!pIe?7}&?aH3qsE_`-lB&yD^2{++noV}1aHiGk(-

delta 369
zcmdm`KT(6rCD<iIP=tYj@zF*u7G@?7j>!Vd-n=Z)joeOtzCq4TexbgTbD8xv>#*=}
zGKx&L<jo9lEr^K^c8VA9%@1()G~jRwcJ*P1ZsHC$Fo@@fcXSB?a<qaCp&T9t1||j(
zj`(0h7ltKZh7pWm3}Qq#X-+oe(_jYCrBHe&l>Q5)9r+>htx)<Tl;#zHhzCOHsZjbR
zl$I5Q$R|SSrBM1Ml-3o3$QMHCtx)<Wl(rRy$TvdiqfnYt1S0MWr6)q^t58}}6e1rB
Or5B27Zhj<sgAo8X?`0?e

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 3c81339d397969e954c94eb03f2654c57e024a6e..b8103799b45224c08344369931b87cf3b7797d7e 100644
GIT binary patch
delta 1301
zcmajfKTE?<5CHH?S~Y}fn>IBqI0z0Zg0vMWiijo={L_SD6od##5wU3%vMNZilar`V
z#4&|TZqi9qq`2tjR}fT0{0_BGI|*`cIF5I}cib)SBGZ`QRYP5A^Z_u5EB=;cb%8vx
zOHs}|h{(FOtjPMR)}LQc*GPY0v?7kowo=v{kaNmXv*{LT+1+Ivpv0xYHV0|Zw?(xx
zuNqp9m+K%!A;w3Zvrliv_?~tmeQL=EMRRGd?H$`2ASLjU#Nk;lcDhe&Aa<zPI^YWd
z=70vMNnV_kqI{Pd?O>rB3a))v0PqWSJz(}Q334eomHFDbWyn@!rj}P0Qk-ne<-n{C
z8>y7VS+nXgaF(&EgD6?8xk5gjuIQA?)X{=jT?`uOwhaNWzn*9Rdmy&@rB(2OCK)x-
z&c^7KS(SriBRbUg-{T)}gn?@eyka06LuQ!7z$ONcF>r%{cMJ$3vc(hzwlHvtfjbO*
vU?3JpwwT6%gMl*)++*Mq1MyyDix~`*F>sE71_r(`AW6gFKOaFoE4?t^B&CLx

delta 344
zcmX?TIm3v{CD<iILXv@j(P1Ok9wsIaj>#vOym?uo8@ZkQe1n{w{6c*vt1|0te!?8h
z$0#z{K`7J6wIC)w*ePDXH$TAH(}2S%*wu$2x`{j3z#yI@-q9rp$k7TmgmQQo7?>C)
zOA5;}YEHHg)?kiq(wtlar4K-977>WJ2bAuC(ifn#h$uup0!q(;(hs1tiWo#b14^%f
z(jTC-i8w^Q0!r_J(32z}!Y)v{14^HP(gKnY`4A{Q14`e4(h5=#`4lL<LP~S<OQ{=-
E0EOXTga7~l

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index d7d21be070c3b879e558193cbf8ded5a64c15eda..d4f0050533f970128774f825274177096a46c3b8 100644
GIT binary patch
delta 1283
zcmdn3_C%M<CD<k8i5LR|<A;r0dQ41yf|IS7yoETT8wH&Fe1n{w{6c*d0z6$JCQoA0
zV-wMK1ThydiPVF{3P40cw7Qdzv-gq&5f`=qmtbGM1wO2kGX#aX1TL7Ld>U+8<vUUQ
zm9OMsXWs&l=A7Jw1<I4N7#2uQ&g5cRAUvsdastET1fKsuz_3J+nXwT>Ff0^bAUZjV
zi@iXIm5G6uA+aE#Bawk&Nuq$CS$wclyujuYOe~y?5|htzXV!Zxi~)-|EDUh=G~jRw
zcJ*P1Zqf`kFo@@fcXSD2;D`?n^<xkbj|V!BX9>uW8JStxAax*#=q4|gU_+={9tH*`
zh<Yw2TpC1x<{7#$EMWjKj9ey{^YAe_u}p5`(U8HVCAtZyU?U*~cL*t9=Oti;5g`S!
zgcNiTQm~njf_sD%aPkrGg$W@A@q`p~5mK;~kb(z<6mats@P!#61&M?d^bk_8osfb@
sgcR@!5b%WsAqB~V6!Z~Nu#=F2CxjI63li{!m7pd+TK3-@CHRmL0O=5an*aa+

delta 345
zcmaE&yIYORCD<jzT9|=>QDP&P9ut!X$7CxeZ(f$@Ms6oR-ymlvzfj-F)0y-(hcWYT
zGKx%2=E*d2Er^K^c8VA9%@1()G~jRwcJ*P1ZsHC$Fo@@fcXSB?a<qaCp&T9t1}28d
zHoUTonv<h>HJGEDG$+r8(vP9EIv+$l8%nQ-(x0KUIX^_c8cOen(#!%7ad#-)4W-XR
zX<<Q#d^nVz4W;ixX=NdZd^(g~4W-{hX=7oCd^wcf4W<7>X=f3Ld^?mrEuy)ZNAw0G
E0LKMiz5oCK

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 195f8da900c5fc56c504adfef756af8f74f5823d..8632dfe8a8bdd991871a1e633162eb9a2e1497ea 100644
GIT binary patch
delta 1291
zcmajePfG$(5CHJmXO?aLTQjVXkUE$IqCs@6b)!so5jP>&VAq>k!4eS`gygAfy<<cx
z?H7oy-GZoy@+)-c(jkb5y4gPJ6v({8FfhLvW)ANu{+;9{Ra&V>0J!!Ae?^EQ&|8uV
zd9;I|sK~{PsFdVbAuFxYm@C-`Pt7|i(I&)vCfDhh6;?KPxhgPXvS4U&R<w<<)LW2L
z*>C0Dv?2`h!S?Lki#oF>A4Oi}k?V|XvRNCOhBZNJV2#i!PprY?eQE$TydCF(Ex5P?
z7N8ZehG;Fs_n9F#0Uwl2<FE{1moF7psGl3AWpA~y)LPS3Q4h|w3Yl!mBdQB|(3%M~
zmC`->yi^2_u9g%CM|5W|ug$irRBP+Zv4YlI?orc!)(b#>Jx{tdgq?Y532b1=v_uDd
zej@hJQQu^=TZ`6ozybzL44h!#1_SRHi29K$7BR4efm00JV&DS<V*%ufEC#kQaE5_<
t418iB7DTSdVPFRXEet$h;0pue0&<0nfjS1xG4LoP0{_1M<(u%#{QxfMgw6l}

delta 345
zcmeyNcV3;#CD<k8yf6a;<Ijy;dzhF!I3}N9^5$iUZsd0I^9^!#@(cBytjesn`3bWS
zC!@&Z?>w1Ct_3mi!A|i4zWD*po(3FF!LB|G(M{aJ1_tpQ@s2J*K#o?hA(X?zz`(>X
z`2w#jqvquIyc*2WO`4O9`5<&Tl->=c|3hhKeu#WKls*lm`2`^2!BBcSl)eq6<pm+~
z$xwPZlzt7R^@Skv#ZY=Xl>QB+?S&!o%~1L{l;#$Ji2Fn7$x!+_l$I8S$j6InZeAdI
GgAo8NGGr|P

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 1d0a2c2f3cc4bfac75948d2ed6a69403cd18379b..cee3b4d80b51ad30153953ace46127923ce8b271 100644
GIT binary patch
delta 1279
zcmeCxJY>M-66_M<B*DPI=(&+=4-=E0;N%lb-a;JFjRH=7zCq4Texbe!0iG@qlNFft
z>P562flQ`oWhWnJ@BjY`GC<M=m5iATASDGLA|YBGB)KF(#Dy)uCD@m5fe-8C3_)Qo
zfeYp*p9Y&&`A!sn<tusE*|z{>R!(lh0_DkB3=1SDXL2zu5S~;!Ie}qv0?&USU|1r^
z%-9Gb7#4~z5S^SQ#Km49#LC3L%aB-*(2>Z%uq1J_A2Sapqr~KBo=h%}busb5PVoW`
z>n5M$v1jsIF`1uNjL~MY8n3d9h<H5EF+58^PRhv4%61BN^@$G-^^0zDWSQ*4tByy3
z6U*c>UJd*T77|i$hLD2qgcK<85paVqAq5qL6f7pB;2a?ZKM5&N;V0k=e?khX2q{=f
zNWld{3Vst(pe8`T7lDKn)DTjzoRES`gcSTGq(DQEfG>gxDX1f)U?m|1R|qNiPe_55
T5CLC=3Tg7A<^Ij3LJ~{>th0qv

delta 353
zcmX?P(5uPi66_MvE5g9QSh|sG4-=CI$K(@C-n=Z)joeOtzCq4TexbgTRhjiRKVjzK
zWE7eFktdVOvnD1!*ePDXv1W1#uf3#yS+Jo+JV(5vOArqO12Y4MQ?RQKLv)kM<UPE~
z%+XC6lYjH718L34c6=IOx(P}jgVJ355OF^!Jqb!*gVIt05cxPLy$DJ_gVI`p5cxbP
zy$MQxgVI()5cxVNeF#dk2}8uapmZOUz67PkL?H4}P<kGeegvh}L?QB7P<kDd{v@io
J*;tI92>|#jWZ(b*

-- 
MST


