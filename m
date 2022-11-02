Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592C26168AF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:25:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJD-00046M-2a; Wed, 02 Nov 2022 12:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIy-0003Xt-A8
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIv-0002RA-KM
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fjz0fLLGH1eiskacw6wCA/OO0SuA+nSv7OkmsDZLxuc=;
 b=PBSKPX/VzltVQYUQsPf4C6MMshX7YkXmxUzld7fR5EgK5ANpnkMzGyxTJyxzR+3z0yCNHW
 4ijmV+0xw5A7oY5RS8puyj8pi2YMaBwzlUZXg8ooAbsBNFMH9NqSmXt5R8r3zHW25IoziW
 Rw0IA8e/p2InLNwsw70Pdvh6/cprCiM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-252-6rjIyaj3N4icibZFrZHxag-1; Wed, 02 Nov 2022 12:09:23 -0400
X-MC-Unique: 6rjIyaj3N4icibZFrZHxag-1
Received: by mail-wr1-f72.google.com with SMTP id
 c18-20020adfa312000000b002364fabf2ceso4977235wrb.2
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fjz0fLLGH1eiskacw6wCA/OO0SuA+nSv7OkmsDZLxuc=;
 b=ebc+fD+nt7qwBD+H6ZRpJqcEbeXsMVNuuO/tqKq3LkqY/VtTVes8IwuPTk8LIuZb10
 kTeMGJCV/LVRzBNWUc1A4ZbJdILTIeS+AkzNg9I5LE16goi6+pbaoSRhOhpjY7xy8tPL
 l6bj+9cw0xNwKV/ZO7f8opTnRyCyILtcEv4YqRDWM8fsNNBqzjALFVmold5ukcjcs0zc
 csKuQZ8dcgX96kDLFqYFjkQNCEFAxj2Kt4P4NouE4vHClORWT8gB4/AliuQf9m38oJ4J
 pnxFsLNo+KPCk7hUJWu+gPZT3xJ6d4vvIvEtN6imIt18qQWg29YIY2UN6eslCLhhMyXU
 Tddw==
X-Gm-Message-State: ACrzQf1YW9qAfYtx4kOnrzUkR7DOX4qkM6C79t8w994tU0cnHXPboMf9
 MVRCRMxsiuMiH7AD+laP/lGazTVnWaLyFmvvzZo+Dnj3AHnfzoSIdcOtN63OiI+ObrzJsX+n3hl
 gGgwomdQWN5Ki8nLD60p9mzfcnLJFlR6QVz+0qmBQcZ7h1g3eGBOeVFgLA3I9
X-Received: by 2002:adf:da4f:0:b0:236:cdd4:4ce2 with SMTP id
 r15-20020adfda4f000000b00236cdd44ce2mr10383516wrl.626.1667405361273; 
 Wed, 02 Nov 2022 09:09:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7vb81JdUYLelWrXUxzfi/xwi+S0/a1M1+9uFnSl/dTfMDUkbK+laR1IxIpiw9qsmGkqifVQA==
X-Received: by 2002:adf:da4f:0:b0:236:cdd4:4ce2 with SMTP id
 r15-20020adfda4f000000b00236cdd44ce2mr10383439wrl.626.1667405360452; 
 Wed, 02 Nov 2022 09:09:20 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003cf7055c014sm2749562wmb.1.2022.11.02.09.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:09:20 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 21/82] tests/acpi: update tables for new core count test
Message-ID: <20221102160336.616599-22-mst@redhat.com>
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
 tests/data/acpi/q35/DSDT.core-count2        | Bin 0 -> 32552 bytes
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
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..ca309f6569f1f4016cf7e67117b208d57fbc7365 100644
GIT binary patch
literal 32552
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
ZUuyB+icMWG#<_Sp+`;4dkGZ-={0~gKnzR4_

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


