Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97C161DC6F
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:28:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMoO-0007PE-SY; Sat, 05 Nov 2022 13:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmm-0006e6-Kr
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMma-0007Mt-VQ
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TnTdBtFcln1TK5GiO0mgh++oAqYXxTV8Gyt6F0Cchwo=;
 b=bMd+o59u1fnagYyffIFdqcNUKcHQXLESLzQlac1oaWzm9cy8h/9FSp8kAvyM8gtfzkw7Rk
 HtpUeZbfDD5VObKz8loGte8dy3ZyFhxabyM1PkMmyOpGGgQspwqcRuBOHapa63uYKxqOUP
 ToDvjHGYZnPkhI4ZRYnacYJt+79pewE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-59-FjgqK2xnMa27gOxzKqAm6Q-1; Sat, 05 Nov 2022 13:16:33 -0400
X-MC-Unique: FjgqK2xnMa27gOxzKqAm6Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 r206-20020a1c44d7000000b003cf9bd60855so425557wma.6
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TnTdBtFcln1TK5GiO0mgh++oAqYXxTV8Gyt6F0Cchwo=;
 b=eqeCohaQyE03uYK3OsPzNwdOl9FpvEYjNhyW/3aWPaOJ4/e4GiLa7zexrBdLqkRhy2
 39TqphLEoWjc0BVt1OXu5L5PPlcAB95tg3MRD3q4i+4oGET4e3MebhSYQLbs3Nx7Wiw1
 ocNWDYIXBZt5PLTttuLpplpJEGWBxi9OWrvn1bZxwH3rj93W7bcz7DgQ9vvR5/z2DBr0
 Qa6cjuTuHuX5zv/bCoBhcGM3bbMVNj0d4RkTDX1oFAk/aye25TiKpone/PgFGt9HL5Um
 ROtislhjjUSn2wgVlI4Y7HG1sx+kya/3kZ2f0PHSsNiQ04JHKcCPPX5wViOrnDgJDjEN
 7jCA==
X-Gm-Message-State: ACrzQf0Eg8Nd1a6tFQGyYGQsm1ITkPuUZKP6yFyD5+E3Xg1Lhf1jLkaW
 gA3eP3S4G8QLtOv1BYZBxY8+2ZEuRfOB/V3Z2xUjfAJhpB/3B10bBH4tmJ5t4DHGGnJZOe2EoYa
 TOlYBLMu61syd1cvqJJhoPThOldL58EfNOVkl79/aXEE42Doqc/dTIiSsjeIR
X-Received: by 2002:a7b:cbcd:0:b0:3cf:68d3:3027 with SMTP id
 n13-20020a7bcbcd000000b003cf68d33027mr25081118wmi.58.1667668592013; 
 Sat, 05 Nov 2022 10:16:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7BezZ5H0kKFzRCU1K0nTNvqq8NHGj3A4ZmpHu9jeLm/AnWclqGZDMKR2URagWHmyuxVuaT6Q==
X-Received: by 2002:a7b:cbcd:0:b0:3cf:68d3:3027 with SMTP id
 n13-20020a7bcbcd000000b003cf68d33027mr25081094wmi.58.1667668591327; 
 Sat, 05 Nov 2022 10:16:31 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 o34-20020a05600c512200b003cf894dbc4fsm3240768wms.25.2022.11.05.10.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:16:30 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:16:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 21/81] tests/acpi: update tables for new core count test
Message-ID: <20221105171116.432921-22-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Julia Suvorova <jusual@redhat.com>

Changes in the tables (for 275 cores):
FACP:
+                 Use APIC Cluster Model (V4) : 1

APIC:
+[02Ch 0044   1]                Subtable Type : 00 [Processor Local APIC]
+[02Dh 0045   1]                       Length : 08
+[02Eh 0046   1]                 Processor ID : 00
+[02Fh 0047   1]                Local Apic ID : 00
+[030h 0048   4]        Flags (decoded below) : 00000001
+                           Processor Enabled : 1
...
+
+[81Ch 2076   1]                Subtable Type : 00 [Processor Local APIC]
+[81Dh 2077   1]                       Length : 08
+[81Eh 2078   1]                 Processor ID : FE
+[81Fh 2079   1]                Local Apic ID : FE
+[820h 2080   4]        Flags (decoded below) : 00000001
+                           Processor Enabled : 1
+                      Runtime Online Capable : 0
+
+[824h 2084   1]                Subtable Type : 09 [Processor Local x2APIC]
+[825h 2085   1]                       Length : 10
+[826h 2086   2]                     Reserved : 0000
+[828h 2088   4]          Processor x2Apic ID : 000000FF
+[82Ch 2092   4]        Flags (decoded below) : 00000001
+                           Processor Enabled : 1
+[830h 2096   4]                Processor UID : 000000FF
...

DSDT:
+            Processor (C001, 0x01, 0x00000000, 0x00)
+            {
+                Method (_STA, 0, Serialized)  // _STA: Status
+                {
+                    Return (CSTA (One))
+                }
+
+                Name (_MAT, Buffer (0x08)  // _MAT: Multiple APIC Table Entry
+                {
+                     0x00, 0x08, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00   // ........
+                })
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
+                {
+                    CEJ0 (One)
+                }
+
+                Method (_OST, 3, Serialized)  // _OST: OSPM Status Indication
+                {
+                    COST (One, Arg0, Arg1, Arg2)
+                }
+            }
...
+            Processor (C0FE, 0xFE, 0x00000000, 0x00)
+            {
+                Method (_STA, 0, Serialized)  // _STA: Status
+                {
+                    Return (CSTA (0xFE))
+                }
+
+                Name (_MAT, Buffer (0x08)  // _MAT: Multiple APIC Table Entry
+                {
+                     0x00, 0x08, 0xFE, 0xFE, 0x01, 0x00, 0x00, 0x00   // ........
+                })
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
+                {
+                    CEJ0 (0xFE)
+                }
+
+                Method (_OST, 3, Serialized)  // _OST: OSPM Status Indication
+                {
+                    COST (0xFE, Arg0, Arg1, Arg2)
+                }
+            }
+
+            Device (C0FF)
+            {
+                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
+                Name (_UID, 0xFF)  // _UID: Unique ID
+                Method (_STA, 0, Serialized)  // _STA: Status
+                {
+                    Return (CSTA (0xFF))
+                }
+
+                Name (_MAT, Buffer (0x10)  // _MAT: Multiple APIC Table Entry
+                {
+                    /* 0000 */  0x09, 0x10, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00,  // ........
+                    /* 0008 */  0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00   // ........
+                })
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
+                {
+                    CEJ0 (0xFF)
+                }
+
+                Method (_OST, 3, Serialized)  // _OST: OSPM Status Indication
+                {
+                    COST (0xFF, Arg0, Arg1, Arg2)
+                }
+            }
+
...

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Message-Id: <20220731162141.178443-6-jusual@redhat.com>
Message-Id: <20221011111731.101412-6-jusual@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   3 ---
 tests/data/acpi/q35/APIC.core-count2        | Bin 0 -> 2478 bytes
 tests/data/acpi/q35/DSDT.core-count2        | Bin 0 -> 32460 bytes
 tests/data/acpi/q35/FACP.core-count2        | Bin 0 -> 244 bytes
 4 files changed, 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index e81dc67a2e..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/APIC.core-count2",
-"tests/data/acpi/q35/DSDT.core-count2",
-"tests/data/acpi/q35/FACP.core-count2",
diff --git a/tests/data/acpi/q35/APIC.core-count2 b/tests/data/acpi/q35/APIC.core-count2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..a255082ef5bc39f0d92d3e372b91f09dd6d0d9a1 100644
GIT binary patch
literal 2478
zcmXZeWl$AS7=Youz=a#M-K}6ZwgLuNAQ;$~*xjvQcY@uCVs{~Sf`WpLVt2Rbe!ORA
z_B`J^b9R56*&pj2=<ge2)-*$cPk^sqaDJbVK;QiOWzaNDW>M2p(=#;b`y@>U1KQZ2
ztu5Nwq0xx;_UPb%CKH;?XtAKxijI!x<b=-7=;DH|uIT25?(Uc=6K2kgS+Zc(te7nu
zX3vf}a$wG!m@60N&W(BUVBWl#FCTI)nyEkmx?n*pR0s<f#v(<qXi+Ry3_U#1(-Vsq
z#}Xy5WJxSl3QL#9GG(xASu9r$%a_Lr6|iDOtW*grS4J-{tWpK5R>f-7uzGc@Q3Gq%
z#9Fnmc5SRv2fe+~#|M4+PE2*{()H?L{rcFT0s8r&zdtr?h>aRy<Hp#e2{vtt0Rb2o
zh|QW|P!I+OWAo<Nq6M~WiLF{;NC>uWjcwXs+qT%Q9ky?e9Xepgju;w>ojPIX&e)|3
zcI}GYx?%V37#4;-dSK6<*sB-z?u~u=VBfyjuOIgBj{^qaz=1eu5Dp%ULx$kcp*U<9
z4j+yqM&QViIBFD*9*twh;MlP^ZXAvuj}s=~#ECd*5{8FkL<CNrj8mrI)Tuaa8cv^%
zGiKn-nK)|}&Yq2P=HT49IBy=#pN|U`;KGHtXb~=6j7yeaWF$sK;nJnJY#A<Jjw@E+
z%9Xfk6|P>5Yu4b}wYY8_u3wKEHsHpMxM>q^-i%we;MT3UZ5u{M<M!>iV+Y2>;Le@6
zYZva`jeGXs-o3bQAMW3e2M*xDgLvo=9zKjmj^NRwc<dM+KaM9(;K`F18;hq-VO$)Z
zK8<J2;Mucy?i`*!j~6cB#fy095?;QHSFYgIt9b1i#>Znq0$#t4H*R2JA|@r_&6{}Z
z7A7ZSN($b-jd$+g-Me`29^Su?4<6vdhnSj*j~?OU$C#FePoCh@r}*p{K7WocUf|1@
z`05qDevNP5;M=$O?j62=j~_nZ$B+2w6Mp`TU%ueiulVg7e*ca?e&Ela`0E$`{*8bB
z;NQQPo-UeQHSM3S%%ZeJ#vXl<HmDY*ZB&cWwyH&GJJq7JQMD*-uUeFLP%TQEREyGP
z)uOaTwJ2>>ElNA87Nwn3i_*@jMQIn+qO_}OQQA$lDDAE~Lr49*wAgf6Z7ljNgG@%F
cu9Hk={TGbMqHkcbS~Dh#{`5cn(qE|k2lzA_5C8xG

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.core-count2 b/tests/data/acpi/q35/DSDT.core-count2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..eb0a4d643ce04f66d823e69f91d951d852fe4fe9 100644
GIT binary patch
literal 32460
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
PL0K{=w}UKxidg>x=dFLV

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/FACP.core-count2 b/tests/data/acpi/q35/FACP.core-count2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..31fa5dd19c213034eef4eeefa6a04e61dadd8a2a 100644
GIT binary patch
literal 244
zcmZ>BbPo8!z`($~*~#D8BUr&HBEVSz2pEB4AU24G0Y(N+hD|^Y6El!tgNU*~X%LSC
z$X0-fGcm9T0LA|E|L2FOWMD92VqjR>!otAF!NBm72O<iWged~jj0!*k$y^{03>bk1
YBHITON2VDSAnpK(F*YFF1LDH~0O^Si0RR91

literal 0
HcmV?d00001

-- 
MST


