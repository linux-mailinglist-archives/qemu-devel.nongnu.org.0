Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC7561672A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:09:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGI9-0002ZH-Qm; Wed, 02 Nov 2022 12:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGI8-0002Yz-67
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGI5-00020z-9X
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pzmg+/++J/zaOBNUtyrZfFr7Qxx00U7Iz/ZMuTqMXlQ=;
 b=dERLULSV8cAMoiYsCoXar354N5Vt+H0iHwFR5x7lytj0eMwOw3Zyw/l2ldVHtWZechhwjg
 OF/hSIfixv7TmY2xlVHvg2OOe3EADaW1eiHHwmj5XOJfQ2Np/oZ5ZU9DfnmbuEQyYyZ9gt
 ol/1+WfiX52IlPeNIRj8YudMDxtteEo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-Re4wiTDwPgWSZT-ImB5gSw-1; Wed, 02 Nov 2022 12:08:31 -0400
X-MC-Unique: Re4wiTDwPgWSZT-ImB5gSw-1
Received: by mail-wm1-f71.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso1257771wmk.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pzmg+/++J/zaOBNUtyrZfFr7Qxx00U7Iz/ZMuTqMXlQ=;
 b=xiF7kGixJZEpb9aRlQiboYyjHj+Xk/jozV2JNXNydijvebsTRvVnI1fVZtULMzXgdU
 hrmm1wQRFncVGME6AYvW+Q5eqizp9s8TLm0TOEduDzY6Dxif1+S99K9WpITWqvfOYFbN
 /3VPaGMskRv/tB+P3T5hpkY+Mjd20Xr2AlU/6QQDDqXxsMgdaUte8iKWjubmks3vDtgg
 0uQccxLVT3+pAImy1bfswlN3syFRTLQ9H+JG5bIEioWr84rhuJHH2wcweOHvshVITCCp
 cxBIaCr+Y6Dd1NE9l2J670/cN1UXmBJk/oZIfrig7PA5tkwHQ0m5B9IIRh1iS4yf8/1k
 mJrg==
X-Gm-Message-State: ACrzQf2Wwth4GU37lfy6q22fv/MesSkdf9h8IpMF9ezqOdgw96GJhP6O
 UnedHhIr4sRufUXn2onmDuAvK4LlSb5ytJTGioRd5imQZbmndO662vicobI9d4u6/JNIy0yj8FB
 jP4U5+VG11x4QNhSXvmALVt7ing+iBg//+TSrt9ZS+XyIYyIZwcQ+DIZPh2gN
X-Received: by 2002:a5d:4572:0:b0:236:ccbe:3513 with SMTP id
 a18-20020a5d4572000000b00236ccbe3513mr10828801wrc.497.1667405308803; 
 Wed, 02 Nov 2022 09:08:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4bC7V85LmSnMLj/UHqCRh6ApSfTb2Uny8PvWqFhW2nw+PO6eTW4OBHMnFeAryZn8JLGxETaA==
X-Received: by 2002:a5d:4572:0:b0:236:ccbe:3513 with SMTP id
 a18-20020a5d4572000000b00236ccbe3513mr10828763wrc.497.1667405308429; 
 Wed, 02 Nov 2022 09:08:28 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0023677081f3asm13202833wrw.42.2022.11.02.09.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:08:27 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:08:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 06/82] test/acpi/bios-tables-test: SSDT: update golden
 master binaries
Message-ID: <20221102160336.616599-7-mst@redhat.com>
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

From: Robert Hoo <robert.hu@linux.intel.com>

And empty bios-tables-test-allowed-diff.h.

Diff of ASL form, from qtest testlog.txt:

@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20180629 (64-bit version)
  * Copyright (c) 2000 - 2018 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/SSDT.dimmpxm, Thu Sep 22 18:25:06 2022
+ * Disassembly of /tmp/aml-YYZZS1, Thu Sep 22 18:25:06 2022
  *
  * Original Table Header:
  *     Signature        "SSDT"
- *     Length           0x000002DE (734)
+ *     Length           0x00000717 (1815)
  *     Revision         0x01
- *     Checksum         0x56
+ *     Checksum         0xBC
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "NVDIMM"
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "SSDT", 1, "BOCHS ", "NVDIMM", 0x00000001)
 {
     Scope (\_SB)
     {
         Device (NVDR)
         {
             Name (_HID, "ACPI0012" /* NVDIMM Root Device */)  // _HID: Hardware ID
             Method (NCAL, 5, Serialized)
             {
                 Local6 = MEMA /* \MEMA */
@@ -49,52 +49,52 @@
                     ODAT,   32736
                 }

                 If ((Arg4 == Zero))
                 {
                     Local0 = ToUUID ("2f10e7a4-9e91-11e4-89d3-123b93f75cba")
                 }
                 ElseIf ((Arg4 == 0x00010000))
                 {
                     Local0 = ToUUID ("648b9cf2-cda1-4312-8ad9-49c4af32bd62")
                 }
                 Else
                 {
                     Local0 = ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66")
                 }

-                If (((Local6 == Zero) | (Arg0 != Local0)))
+                If (((Local6 == Zero) || (Arg0 != Local0)))
                 {
                     If ((Arg2 == Zero))
                     {
                         Return (Buffer (One)
                         {
                              0x00                                             // .
                         })
                     }

                     Return (Buffer (One)
                     {
                          0x01                                             // .
                     })
                 }

                 HDLE = Arg4
                 REVS = Arg1
                 FUNC = Arg2
-                If (((ObjectType (Arg3) == 0x04) & (SizeOf (Arg3) == One)))
+                If (((ObjectType (Arg3) == 0x04) && (SizeOf (Arg3) == One)))
                 {
                     Local2 = Arg3 [Zero]
                     Local3 = DerefOf (Local2)
                     FARG = Local3
                 }

                 NTFI = Local6
                 Local1 = (RLEN - 0x04)
                 If ((Local1 < 0x08))
                 {
                     Local2 = Zero
                     Name (TBUF, Buffer (One)
                     {
                          0x00                                             // .
                     })
                     Local7 = Buffer (Zero){}
@@ -161,45 +161,234 @@
                     Else
                     {
                         If ((Local1 == Zero))
                         {
                             Return (Local2)
                         }

                         Local3 += Local1
                         Concatenate (Local2, Local0, Local2)
                     }
                 }
             }

             Device (NV00)
             {
                 Name (_ADR, One)  // _ADR: Address
+                Method (_LSI, 0, Serialized)  // _LSI: Label Storage Information
+                {
+                    Local0 = NCAL (ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66"), One, 0x04, Zero, One)
+                    CreateDWordField (Local0, Zero, STTS)
+                    CreateDWordField (Local0, 0x04, SLSA)
+                    CreateDWordField (Local0, 0x08, MAXT)
+                    Local1 = Package (0x03)
+                        {
+                            STTS,
+                            SLSA,
+                            MAXT
+                        }
+                    Return (Local1)
+                }
+
+                Method (_LSR, 2, Serialized)  // _LSR: Label Storage Read
+                {
+                    Name (INPT, Buffer (0x08)
+                    {
+                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
+                    })
+                    CreateDWordField (INPT, Zero, OFST)
+                    CreateDWordField (INPT, 0x04, LEN)
+                    OFST = Arg0
+                    LEN = Arg1
+                    Local0 = Package (0x01)
+                        {
+                            INPT
+                        }
+                    Local3 = NCAL (ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66"), One, 0x05, Local0, One)
+                    CreateDWordField (Local3, Zero, STTS)
+                    CreateField (Local3, 0x20, (LEN << 0x03), LDAT)
+                    Name (LSA, Buffer (Zero){})
+                    ToBuffer (LDAT, LSA) /* \_SB_.NVDR.NV00._LSR.LSA_ */
+                    Local1 = Package (0x02)
+                        {
+                            STTS,
+                            LSA
+                        }
+                    Return (Local1)
+                }
+
+                Method (_LSW, 3, Serialized)  // _LSW: Label Storage Write
+                {
+                    Local2 = Arg2
+                    Name (INPT, Buffer (0x08)
+                    {
+                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
+                    })
+                    CreateDWordField (INPT, Zero, OFST)
+                    CreateDWordField (INPT, 0x04, TLEN)
+                    OFST = Arg0
+                    TLEN = Arg1
+                    Concatenate (INPT, Local2, INPT) /* \_SB_.NVDR.NV00._LSW.INPT */
+                    Local0 = Package (0x01)
+                        {
+                            INPT
+                        }
+                    Local3 = NCAL (ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66"), One, 0x06, Local0, One)
+                    CreateDWordField (Local3, Zero, STTS)
+                    Return (STTS) /* \_SB_.NVDR.NV00._LSW.STTS */
+                }
+
(iterates in each NV)

Message-Id: <20220922122155.1326543-6-robert.hu@linux.intel.com>
Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/pc/SSDT.dimmpxm             | Bin 734 -> 1815 bytes
 tests/data/acpi/q35/SSDT.dimmpxm            | Bin 734 -> 1815 bytes
 tests/data/acpi/virt/SSDT.memhp             | Bin 736 -> 1817 bytes
 4 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index eb8bae1407..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/SSDT.dimmpxm",
-"tests/data/acpi/q35/SSDT.dimmpxm",
diff --git a/tests/data/acpi/pc/SSDT.dimmpxm b/tests/data/acpi/pc/SSDT.dimmpxm
index ac55387d57e48adb99eb738a102308688a262fb8..70f133412f5e0aa128ab210245a8de7304eeb843 100644
GIT binary patch
literal 1815
zcmdUwyKmD_6vnUPv~g}y6emHgc**|(X$OSF0FILox3Lr1ZmHx-examI3c8|YVC!RO
z2@)c;%774ZDvwC)2sTzGCN_pj>?}wOz&%bMqC!xRK#<|wbI(0K`Q7hx6kRVFqX~qV
z7sa|%)dh8?Br6KtBZP{x4GGpv_2!(V7cFzGeuJKCoK=-eBcjxh3x)9sl%G1ON@8t<
zC}l-#nk#BUt~04IjN>%dL<KcdC}Xaspw6mBMHbA}GjPCGOSQ6~m1lIJGObENMbxgY
zd`g(B+2~ZOl~ti$5{;G5iQtsKhzOs<nect)eDBFFfA>xHlK*k;x!u1QobwmcfE+b^
zczo}A|8-XCzLj4+n|SHk{n4mic$$>>kzKym<B*Vk)U<=Kp5H`U{=6L|{Wc1DmWcvG
z76FVb02yfmT5$S-f4_s{{ziu(n;nE)vhI4s17gyIJ1qk(jyu7HZ3lA%xtvj)uE0pb
z$53nM?6&KW^-Z{ri#Fj5p`{kAt=n$cB6l3jBFD@@19IxL9zw`xtdg$8LlAg=q1{28
zrW+#4D+#S48%eHS(G5iAVIj~13LO=IVY0&vbVM52T^rF6(*yzx3({MDR0%04*|42u
z2kyc74pk$D%$$vdh>qe^LJ0ZG7X5M#F6I*C?GzXSG@cDl2fPncQ;69=?`MKx80Oyc
z9B;|BU2{zuQ)dbV&Js%+lfN=#)pVIV;6G{<gX4%9U>kbZ#&Nx-i*)4_an>N&6Rd6+
zI@DnAgic;g(t#T0WVK=NDa_GVIQn#<fIx{T!*ObvwI|*}lvAOg$NmA!kj;2qj|yh!
zX3nG1z=PDg8a0li5EfPCA#5NgSsa5-$boD!LCLPANZb86oIwZg!$H0TWG)1949wv}
z%n%5UzDSI@Rs|ErBNK2eFCN1M9Qzd;CjYDrIQIKKO#MY44mk%#@ZbKTacs|tiGdUB
c@tk1)B`4Vb#EApW?>oVA@DG+o@4h6y0>WY85C8xG

delta 135
zcmbQvcaN1TIM^lR9uortW7tG4X>Nb5nD}6)_~<4#t%(LAjJ^|Hw{uC>PEKQ(G&v)I
zVKOVD5|2#v<i2b!mdWkej0~HN7+n~(Wc<Pm3^?K)U4j@z1mazSeOZ?HIXn7fWM*YE
dMmNa;WevfyTuhS-Sw(n20!9!4=E=X=WB}s5Bn$um

diff --git a/tests/data/acpi/q35/SSDT.dimmpxm b/tests/data/acpi/q35/SSDT.dimmpxm
index 98e6f0e3f3bb02dd419e36bdd1db9b94c728c406..9ea4e0d0ceaa8a5cbd706afb6d49de853fafe654 100644
GIT binary patch
literal 1815
zcmdUw%WD%+6vppl(q?j#N+yZ4_+tJ8(=J4Cp_55srp-*k%rq9JFfU2kq{_wCg}Xi$
ztr5g@s0$I9lvx(s3+~*ya^=3@R@?|K)O)5cETUCVG>dc3J@?GX?|$Ee=z7T*O(4YV
z6zft|7u04+RusBN2o+}<60Di(?O97NTIOo~7CqNEt16d9M5!Sc3gZ(fKXqD_#M%f^
z%8J-Bm(_+`XHsJr$7!yK3TmZL##~83omGvBESM|j;DD``YGpwyH+7*htx7^g)UGdo
zN|-Cz=v1qfRiR!IjpfgY;Ecb32%p25@LlF&|Jg2o|4sIa|8e$(J-8fP@E6j695sA+
z`rzi^byn)Vm0vxdc<I`M(WqY7NlN_4F5mBSNJu|v*}+)fZ=p?p&JL1(2ZcP#M1dg-
z07mA4jC24kIQz(d*u`;wy~~h|E<!F@b3Nh#F=@e_mVg$=o#4`zgE@j+&L~b-U?kyV
zsJ(rD%XP@w23*HQ8*qluVjI@>T{mo#dk$uiW9Fa%IdxhOA>=bwNmt?_2s}66=^{?k
z4H4y)gjSJ_Bv-HK1|oB?5a<Dgjtjsr*<l7cB8}{xjp&GJ0s)2v=}kYXgcOvl+s={$
z_uzbosu4qG&c;GSM{z14g#1;DemMsha|!ac3k(4o&xWT1-iN6v#2lOtGQltmbMJVL
zx9HlgxhjpR%|d~*#FED3uMJr>UFHt?j~m6{IAZp&4ZUaMxL(smx^jv*W034ARyPbC
zYOr@gCod=IKn-)U+A#PO=IARNeR@zpphT46IJL~$7jHhwsZh{k|A1x4X1tz91v7Lr
z=TT|kLF!$N8plxxi>mS%HjtAnjzK5nKsK46WH(Zz<Nh4Zpo0(KAYTMB7Xmo}=I{|_
z2n5GpB*t8=f(hf12{@J)Pv8QM{fZ5ff7S*Z`+Xm#{-O^@oO?#_-~OU;Y~P8AJtx?c
bIl=x*PO$%p6NjANcY@{MA1saDe@T1=QL*6=

delta 135
zcmbQvcaN1TIM^lR9uortquWF-X>Nb5nD}6)_~<4#t%(LAjJ^|Hw{uC>PEKQ(G&v)I
zVKOVD5|2#v<i2b!mdWkej0~HN7+n~(Wc<Pm3^?K)U4j@z1mazSeOZ?HIXn7fWM*YE
dMmNa;WevfyTuhS-Sw(n20!9!4=E=X=WB}VOBm4jW

diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
index 4c363a6d95a7e2e826568c85f5719127748e7932..2fcfc5fda955dc4ba78a5f4116eed99ec7202fbd 100644
GIT binary patch
literal 1817
zcmdUw%WD%+6voeF(q?kgN+yX|pX5I<?Lq_>I+-M9YF^Att1yLmNzx{zTx?yqYuZI?
z1Th`zLPREImV$f1om*F~+!x#nBDfImne>50v<ix5aqi=sd**k)Z<1(QK|dV>;JW#`
zT-LI+*@9B7vNZtYZ#85blhaFcrj|F2HED_ERlzJPg>gx4D7oC^6lAI=YqC@sr`2Lr
zY8tDxhEj(yfOwol*-DkF&`dzm=q513*YuK-HM-|8!Iuk_Vpc8AYT43EP0p4i_4?}P
zn9)szS+!EEW$Oh=U;PsE&v=VK#WYC<?~@n%&vwQ8Z&O#iPjfG=!Dat~x5%Ez4GTUz
zeQ<m5CMEaYDX(8ly>hI<sqkR#d0ZC9cg22Rfb7_lrsYrcy(VmV^Ohg?+7O657Y2?l
zA{bpjGTKHo|Li00VTVM$jSfdQI{*${cU<ZsF>T_VR*;rNZU54?O#}*#pyy{w*piA7
zXziTec5J%7iPv#p6LSE|EgV~SouEbU*@Oq%NMixmb+#X1$Ry2zR*eQI@%%!&1A?mQ
z5)(b9mJ~fM)JvKUbRGwaHK@>00XQx-%3(#Qk=3(+wV0t8u$e!$<%K%|1Em|5y<+1%
z1kYw_M8HT}BpcE(oKk=xbJb)I7w}>Z1$QUMQKWG#Jnf4fc1-}cpC2UsQEcYiacy_m
zu^eMfo~X^{a)K!pR4#LE#H?tFaKL}mD2_yd8)EBP&mvK+qDgENs?sf;rcUshu4}l5
zYdf$rN}M%RiJ;UPx|kpWdx^tO4>tgn2xlb9EHn4STL|Y&D6Fx5z%pWSZqH?c>6(#t
znKXEic~@b^2@JwysyxO8&S{E7uoCA;HXUPRHxsn&{2WeajrZYjzKmoJ26_z4(L>At
z368!<oUv9$6DC6wNF*a2!vzxg6&t4itPLdc`##+Gi#{B34vi4M{YI0>o)c3;C-~zz
a!T(E6@c)Su2b|w`f*0^VjQvV}l)nP3li&~l

delta 150
zcmbQq_kfivIM^lR0TTlQqx3{BX>LdDnD}6)_~<4Nt%(LAjQ$f{cXCPAPEKQ(G&v)I
zVKO_T5|2#v<i2b!mdWkej0~Gi7+n~>Wc<Pm3^?K)U4j@z1mazSeOZ?HIXn7fWM*YE
eMmNa;WevfyTudT@sM1_a5P2hrJoDtgY%%~CTPTVE

-- 
MST


