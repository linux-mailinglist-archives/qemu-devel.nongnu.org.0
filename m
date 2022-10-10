Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206775FA387
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:45:03 +0200 (CEST)
Received: from localhost ([::1]:36926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxlu-0004Gz-1u
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdS-0004TO-Lt
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdN-0007YL-Ha
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MMhesCiaEL22+rYIJMiKtV9ezaSZJdXsGwAzhglkeLs=;
 b=N/vNyd9e4ENIxqPbVnL1BcZfY82RSZRWeyigkr1W1+bDPiuii5PtnwHY++XdPVjVSGDaww
 2TOscaQrvnIf3nk+Ofqg3wrtr3pa986Dmjtrmc4LePVTK1N05+6DM4gWBSAf/jyhsP0mEM
 GRTzUUv4AMn+rJ0sz3YGsc3Mk/IpHkY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-530-sFhdUVBiOw-mhCrC5zDKlw-1; Mon, 10 Oct 2022 13:32:07 -0400
X-MC-Unique: sFhdUVBiOw-mhCrC5zDKlw-1
Received: by mail-wm1-f71.google.com with SMTP id
 az35-20020a05600c602300b003c5273b79fdso3669846wmb.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MMhesCiaEL22+rYIJMiKtV9ezaSZJdXsGwAzhglkeLs=;
 b=siHdSaQ3T9p1SFnP3U2ZU9m8Z63kKNLLRmBt3KAvICubd3yS8ZZQy7tjJTUreYf80L
 4aZYz+GcOxc5udRhpcQjwKfhbv72kqgp03lQnceRuwbHcdawi9uYnHw4p2o6WMZHzi6b
 DVZyiZ3t8Vm3uZ/ICiJsCo522V1OBAtGkrtZBjsn+nE4Mq/VOc+qEfXjCpE2JRSGUWGo
 M4aotMGrcyAs6H2rd3WQHTOX5ell6MeRkbnsEcylT8L6KZ60Aky3O89UvnfKB/Jx+YR8
 mY3ma4GDbyf15/xXm7vPtfKf9qdMMpWaCmBOEGAAVhSuXV7x3IWZ97smPAzmnXIf3FlW
 wT8Q==
X-Gm-Message-State: ACrzQf2JNdDncbe2B1xRbOmA35/N/b41CCbTQymkhpJ711apEoDFSwmV
 M31I683o6p7GOV5Sp7l19DgfEXLQVHj8utwvFIQcp+mSnTERQbISy/2E4Kwg/BsyQEAtULoTkvB
 ZbsSoMPrWeDm9SlPAneCQ5sK21+t4A3BZBApF/oA/JmUg58ETZe7IiYLgUb5k
X-Received: by 2002:a05:6000:18a2:b0:22e:72fd:c5d0 with SMTP id
 b2-20020a05600018a200b0022e72fdc5d0mr12052738wri.682.1665423125903; 
 Mon, 10 Oct 2022 10:32:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6fOQubk3814Rkia6GzvMJiitA0wWZ5N4e/Mi6yJ10sLgnfv/4nvxLbJ1vjoYwLwesxB5dysA==
X-Received: by 2002:a05:6000:18a2:b0:22e:72fd:c5d0 with SMTP id
 b2-20020a05600018a200b0022e72fdc5d0mr12052708wri.682.1665423125385; 
 Mon, 10 Oct 2022 10:32:05 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c1c0500b003b477532e66sm37348515wms.2.2022.10.10.10.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:32:04 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:32:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 45/55] tests: acpi: update expected blobs
Message-ID: <20221010172813.204597-46-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 LOTS_OF_MONEY=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Igor Mammedov <imammedo@redhat.com>

An intermediate blobs update to keep changes (last 2 patches)
reviewable.

Includes refactored PDSM that uses Package argument for custom
parameters.

 ===== PDSM taking package as arguments

             Return (Local0)
         }

-        Method (PDSM, 6, Serialized)
+        Method (PDSM, 5, Serialized)
         {
-            If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
+            If ((Arg2 == Zero))
             {
-                Local0 = AIDX (Arg4, Arg5)
-                If ((Arg2 == Zero))
-                {
-                    If ((Arg1 == 0x02))
+                Local0 = Buffer (One)
                     {
-                        If (!((Local0 == Zero) | (Local0 == 0xFFFFFFFF)))
-                        {
-                            Return (Buffer (One)
-                            {
-                                 0x81                                             // .
-                            })
-                        }
+                         0x00                                             // .
                     }
+                Local1 = Zero
+                If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
+                {
+                    Return (Local0)
+                }

-                    Return (Buffer (One)
-                    {
-                         0x00                                             // .
-                    })
+                If ((Arg1 < 0x02))
+                {
+                    Return (Local0)
                 }
-                ElseIf ((Arg2 == 0x07))
+
+                Local2 = AIDX (DerefOf (Arg4 [Zero]), DerefOf (Arg4 [One]
+                    ))
+                If (!((Local2 == Zero) | (Local2 == 0xFFFFFFFF)))
                 {
-                    Local1 = Package (0x02)
-                        {
-                            Zero,
-                            ""
-                        }
-                    Local1 [Zero] = Local0
-                    Return (Local1)
+                    Local1 |= One
+                    Local1 |= (One << 0x07)
                 }
+
+                Local0 [Zero] = Local1
+                Return (Local0)
+            }
+
+            If ((Arg2 == 0x07))
+            {
+                Local0 = Package (0x02)
+                    {
+                        Zero,
+                        ""
+                    }
+                Local2 = AIDX (DerefOf (Arg4 [Zero]), DerefOf (Arg4 [One]
+                    ))
+                Local0 [Zero] = Local2
+                Return (Local0)
             }
         }
     }

 =====  PCI slot using Package to pass arguments to _DSM

                 Name (ASUN, Zero)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
+                    Local0 = Package (0x02)
+                        {
+                            BSEL,
+                            ASUN
+                        }
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
                 }
             }

 ===== hotpluggable PCI slot using Package to pass arguments to _DSM

                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                    Local0 = Package (0x02)
+                        {
+                            BSEL,
+                            _SUN
+                        }
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
                 }
             }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-8-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  34 --------------------
 tests/data/acpi/pc/DSDT                     | Bin 5987 -> 6219 bytes
 tests/data/acpi/pc/DSDT.acpierst            | Bin 5954 -> 6186 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 7312 -> 7544 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 8653 -> 9078 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 6451 -> 6683 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 7641 -> 7873 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 5954 -> 6186 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 6059 -> 6291 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 7346 -> 7578 bytes
 tests/data/acpi/pc/DSDT.nohpet              | Bin 5845 -> 6077 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 5993 -> 6225 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 6195 -> 6434 bytes
 tests/data/acpi/q35/DSDT                    | Bin 8274 -> 8320 bytes
 tests/data/acpi/q35/DSDT.acpierst           | Bin 8291 -> 8337 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9599 -> 9645 bytes
 tests/data/acpi/q35/DSDT.applesmc           | Bin 8320 -> 8366 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 10988 -> 11227 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8738 -> 8784 bytes
 tests/data/acpi/q35/DSDT.cxl                | Bin 9600 -> 9646 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9928 -> 9974 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 8349 -> 8395 bytes
 tests/data/acpi/q35/DSDT.ipmismbus          | Bin 8363 -> 8409 bytes
 tests/data/acpi/q35/DSDT.ivrs               | Bin 8291 -> 8337 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9633 -> 9679 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 9404 -> 9450 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 8568 -> 8628 bytes
 tests/data/acpi/q35/DSDT.nohpet             | Bin 8132 -> 8178 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 8280 -> 8326 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa        | Bin 8375 -> 8421 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8880 -> 8926 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8906 -> 8952 bytes
 tests/data/acpi/q35/DSDT.viot               | Bin 9383 -> 9429 bytes
 tests/data/acpi/q35/DSDT.xapic              | Bin 35637 -> 35683 bytes
 34 files changed, 34 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 452145badd..dfb8523c8b 100644
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
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.pvpanic-isa",
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-"tests/data/acpi/q35/DSDT.viot",
-"tests/data/acpi/q35/DSDT.xapic",
-"tests/data/acpi/q35/DSDT.nohpet",
-"tests/data/acpi/pc/DSDT.nohpet",
diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index 2d543fbf94e42f03814019c146b49f94e76bf15d..cb718f1a8a591b27ca841f70f40762562c15c837 100644
GIT binary patch
delta 1368
zcmaE?ciMo<CD<jzTY`asQEwxcJQI_T$YgD%9raF}0WQJ5ybD~|CTB4e2r@G=Bor_t
zE|8iuIYUsGOW=a}$)~}lRlXC&U-?QNcJ^J8uz-DPCKuC^gaSuTmx$($90mp;!N`yV
z)KWV+iD7aQ&wn6bs7+){tWB(B<YH$?EJ*A~U|;}hRh^v0#a<x9%EZ76v<75=Fp>!c
zNf2e5-I-aqJe}6Y#0NXY3wW&waP~Cda0+(yVTf+h4>mA}=ZJT731Z-I3=Z{U5Rr`s
zx}T>&h>HoN1SFQQ1mvZR%&hE$=q3l&$$h+HvUpWZ-pwn^=rQ>wua*L;x_ETcJSNNX
z5uqrN7)48oQS_1+MY{Y%xT%mBMO%qc^phAxwgN=BsgW2(M~P9yDM*BMzQib+NQ|PZ
z#3+&!BEn6v#3))wjH0K+DAE)r!cDovDB4JjqOZg#vJ@f0O|`@*I!KHnR#76X^Ay!W
OD>Kl_g3Vo`HyHuis-Nrt

delta 1204
zcmX?Y@K}$_CD<h-S)74^F@GbMJQI_j;ACy49rZ430WQJ5d<%S7Cuax>a|v89KlwD+
zw90p)_$yz@!_K}1j-D<NIk^c7lqY8~ERdX>$;Grlcv9`;1cu28JpX}!VTm9!V<U)Q
zSSY?gbaECKdw~!u69X?pVnISjA_K#cL;*ju_+Y1a0dKAVXHNqW7q0k#pb&-vA*P0e
z%@deka@Kn+i~%cfSO`+U;S}uZ!w}u18Ejw>&k^tF62!pa7#!-yAR-<QbSuvikc%@i
zv$8?zKoZeSUM#_eP_;Y^3``L9Tuit$h;YOQ8@ezoVE{3VT==0ZV~|jElhb5jJ}oIM
zcEyA3a+(~AUwS!y>5urOt@-iV-HKoOJbr0O0lbDM<Ck8GU-~<KX-7f4c6Z~KzKUO3
zUI?$@nfRqQ<Cp%6U)o(5uiX>zOW(#Xttx`o@O=EzJMl|1i{drh7r*p${L&BcOKXd1
OiQ~v)n~TJ5G6DeTf_9hy

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index 798349aa3f85e0803396471237e94604d00a1f90..aebb29c2a4ae67b732bef3eb8e72c5665bb3a7b3 100644
GIT binary patch
delta 1385
zcmX@4x5|LaCD<iIOM-!c(PSf+JQI_T$YgD%9raF}0WQJ5ybD~|CTB4e2r@G=Bor_t
zE|8iuIYUsGOW=a}$)~}lRlXC&U-?QNcJ^J8uz-DPCKuC^gaSuTmx$($90mp;!N`yV
z)KWV+iD7aQ&wn6bs7+){tWB(B<YH$?EJ*A~U|;}hRh^v0#a<x9%EZ76v<75=Fp>!c
zNf2e5-I-aqJRMiZ#0NXY3wW*yaP~Cda0+(yVTf+h4>mA}=ZJT731Z-I3=Z{U5Rr`s
zx}T>&h>HoN1SFQQ1mvZR%&hE$=q3l&$$h+HvUpWZ-pwm(ZW3&00Wq0}fq@xfIu|n`
z<2@#G@@XlcnjVkt29L?U#3-6bjH0W=D3atS!cDQnC|XF2qNl_t(i9-VO}WG<+DMF|
zuf!;_6ePk;wZteoNQ@#@AtJ2vBt}s$F^Vn{qexVk2scF%qi8NMiXIZ9NL7RgH)Rr|
aXe}{{J`$tIR8$MC5JAi4o6AJcFaiL0S)o4w

delta 1221
zcmZ2wa7d5KCD<jzNt}U!F>NE4JQI_j;ACy49rZ430WQJ5d<%S7Cuax>a|v89KlwD+
zw90p)_$yz@!_K}1j-D<NIk^c7lqY8~ERdX>$;Grlcv9`;1cu28JpX}!VTm9!V<U)Q
zSSY?gbaECKdw~!u69X?pVnISjA_K#cL;*ju_+Y1a0dKAVXHNqW7q0k#pb&-vA*P0e
z%@deka@M=gj{z(2p9fOF;S}uZ!w}u18Ejw>&k^tF62!pa7#!-yAR-<QbSuvikc%@i
zv$8?zKoZeSUM#_eP_;Y^3``L9Tuit$h;YOQ8@ezoVE{3VT<oDNV~|jElU}f)1;k#U
zS<Fzgm~ojE-Q+aclTS+ui`(MCZgZME8Nc*h{L<?DcnvSaFTESTG^+q!!~O9~&%`hN
z7{9cxAYQx6@k<}XFU>84*YHsM()004zr-(XER5IgTKv+-@k<Me;59rNzw}c4((mz0
bTZ-bfyBWXqS^U!CVp`%jGSTKZu``SSlAd?5

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index 2b0fd3433b586fd7665b9a0b5b2f8bb3fcc09b44..b7c5de46346d2777b33f7fc464d319bd762fda8d 100644
GIT binary patch
delta 1388
zcmbPW`NN9KCD<jTLY9Gn@%2V7c_t<wk;&RjJL;V{16+cAc^9~_P0nH{5M*X#NGM=P
zTp%@Ra)zKVm%s({lTU+9t9&Plzw(tl?CiTFVFCNpOfIG+2?dUxE)mTgISdRyf{`H!
zsHJvt62s&qp8r6=P@Bk@SesbM$i>c(SdiF}z`y|1syaD~i@iXIm5G5DXbs2!VI&g@
zk|4@9yE7Z|*E_9^i4S&)7w}pW;OuF@;S}uZ!w}u1A8cR{&k^tF62!pa7#!-yAR-$N
zbU#ml5Em0j2}mqq3CK$snOWHh(M=Al!G=&BJPZs>5M5kM__c{}#7}-LB*o}4nN3(r
z0o8_hbQ?S-dl93kj~GRlh*2aaLWG;5h*30;7)6hWQKTkHgqyO6QM8U2MW2XKWF|(0
zo2rOWw2v4?OyWdX=SGa8E@Bj&BSw*s1QBiuBSz6IViesYMv;;v5pGH&M$sx_6ul!x
Wk&zS;ZYq<~lEqsVY~C()lMw*;SEL>Q

delta 1186
zcmexiHNle0CD<iof(!!#qs~Syc_t=5!O7Z8JL+B70$hT9`4;%FPR<Y%<`TGIe)4Is
zX_fCp@mIc*hn;;396enka&i+EC{NB}SRgq$lZ$DA@TA(w2@I1Hc>V(c!xBMe#zqjq
zuuyz~=;SOe_5vYRCI()H#Dav5L<WW>i2{CR@xe~<0^VE!&YlJ$E?n^eK_LtULQD+_
zn<p@f@jH7gi~%cfSO`+U;S}uZ!w}u18Ejw>&k^tF62!pa7#!-yAR-<QbSuvikc%@i
zv$8?zKoZeSUM!Q}3yGQHkQd>I4>ojRSi%5e7{M6EAVzeP(_{x>Eh#KI<H067P42=k
zeFeX?oCsdSGw@4q!Y};?zqFeuUb`pYm%fExT15=6;d%I_ci@+1631(}4}R%s_@y7<
zm)4TNYj+8L>3#U6IVABK9)w?d4u0up_@xb`@Y-F4U-}4sX+CMZhDS(iiQ~v)o99d4
GWCQ>bvvXkp

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 56398fc0147c9ab9d59947e24cddb08380b6a13e..e04b5b2035fb665b1e75075d4c47776a51fa77e2 100644
GIT binary patch
literal 9078
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
R_IU7$9`ENDsa>Zr{{!R>?|A?K

delta 2214
zcmez7cGj88CD<k8tRe#gW9&vQc_t=5!O7Z8JL+B70$hT9`4;%FPR<Y%<`TGIe)4Is
zX_fCp@mIc*hn;;396enka&i+EC{NB}SRgq$lZ$DA@TA(w2@I1Hc>V(c!xBMe#zqjq
zuuyz~=;SOe_5vYRCI()H#Dav5L<WW>i2{CR@xe~<0^VE!&YlJ$E?n^eK_LtULQD+_
zn<p^8<g9P<V2lB)=yYcUDdBJmcJ*P1Zqf`kFo@@fcXSD2;BX8M^<xkbj|aMzX9>v7
z8JStxAax*#=q4|gU_+={9tH*`h<Yw2TpC0;;)4xc7?v=A7?WA}1T1`41shsGECU+A
z3^jlmmjPfWGDbJqOb+H#k;3Avc(Ah^Cr{_o#4YVK`2n96K4~p}ywcs0c%}E@*DWuF
zS9d0U={W*;b^pb$+dvSn?upWPrElYx<`crJJ6{H`^iKTJZ}1!LD~s3g24TF?5Ao~P
zmcy$%P6V&?e*C&Q<?-sa5ydM#7r*Wc_;nj9;5ED&zw|mWyt?@n@k&Q3YKh~>z?(b8
l8JQTJCXePblp+^WwmD56&1YDHWi+2*4HkU)Y=Po6MgUdmwrT(X

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 38cb47c675edb6d4797b008d2deae656739230ef..3e8a202b0f32d585b38d4f8c85247124de5ec73d 100644
GIT binary patch
delta 1368
zcmdmNG~0yBCD<iIT8e>zaneREc_t<wk;&RjJL;V{16+cAc^9~_P0nH{5M*X#NGM=P
zTp%@Ra)zKVm%s({lTU+9t9&Plzw(tl?CiTFVFCNpOfIG+2?dUxE)mTgISdRyf{`H!
zsHJvt62s&qp8r6=P@Bk@SesbM$i>c(SdiF}z`y|1syaD~i@iXIm5G5DXbs2!VI&g@
zk|4@9yE9+m_H<es6CdmpFW|K%z}eG)!ztL+hatL2KiI$^o+IATC5VB;F*wwZK}0ql
z=zg98AucA65|CKJ5|EcNGPAN1qMIC8C&%%N$>LQtxtm{>(PQ#Tek}!5b@Aw?c}#vw
zj3Pq;B1|eJM$t}U6#XSek)t3HZfYe)(Me(y@d^=PT_7=vrV^v*CNYX+g^6%eA~A}V
z5~JuPF^Y6Wh;UOOF^aYlqv$6wifl!Ra8n~OijESah*OLR>wJk(G?5rZSBX(1DXxW9
OW}uY?o1?^UG6Dd56QI=q

delta 1204
zcmbPjve}5sCD<jzSdxK(@$yD4c_t=5!O7Z8JL+B70$hT9`4;%FPR<Y%<`TGIe)4Is
zX_fCp@mIc*hn;;396enka&i+EC{NB}SRgq$lZ$DA@TA(w2@I1Hc>V(c!xBMe#zqjq
zuuyz~=;SOe_5vYRCI()H#Dav5L<WW>i2{CR@xe~<0^VE!&YlJ$E?n^eK_LtULQD+_
zn<p^u<gWKv7z0+|un?qx!ztL+hatL2GuXf&o+IATC5VB;F*wwZK}0+r=vJO3AQxw3
zW@Urafh3}vyjX$_p=x;;7?>dHxtMTi5aEaqHgsWF!T@3zx$r|-#vq~SCa1}d`L(35
z*cA`9%W1N%0AA^G{L%;UOLGh2H9Qo*^nCo%FY!wo3*oi97Qggy{L+HLcny!nFTE7M
z^n3i$mLhoVZpJTt7QeK(C|<)8@k_79FZ~t2w7nQ!yF2kqU&b#jD~{Ljbo|mA@k{>}
P*AmB($2L1j+++j*x9fJ^

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index 06a7aa59465238bfbf715ae83540f68b1f2f3ea5..f7d6ca1448cf0ae3c609fc1e1391cccc2d7221fc 100644
GIT binary patch
delta 1387
zcmca<ebAQ6CD<k8pd14OW6ee`c_t<wk;&RjJL;V{16+cAc^9~_P0nH{5M*X#NGM=P
zTp%@Ra)zKVm%s({lTU+9t9&Plzw(tl?CiTFVFCNpOfIG+2?dUxE)mTgISdRyf{`H!
zsHJvt62s&qp8r6=P@Bk@SesbM$i>c(SdiF}z`y|1syaD~i@iXIm5G5DXbs2!VI&g@
zk|4@9yE9h_)H|(>i4S&)7w}pW;OuF@;S}uZ!w}u1A8cR{&k^tF62!pa7#!-yAR-$N
zbU#ml5Em0j2}mqq3CK$snOWHh(M=Al!G=&BJPZs>5M5kM__c{}#7{O6kz(|i>@T9F
zfNDcLx(yzaCljOSIx&i*MTxL3o)|@oiBa^N7)9D*M7SxR7)6_jQS_Y{Mb_d(xT&5P
zMTdz|#4bUEb>74%>L*6gWnvVGOA_IxXkrx2Cq~g@Vic)M5#gq6Vic_>M$u<t6q!pC
V;ihV06z!MRlEqsVY?8Uj2mtE`q*wp|

delta 1194
zcmX?Td()cBCD<k8rYr*k<KB&2@=Q#Af|IqGcGSDD1-JzJ@-6UTotz;k%q4Ka{N&SM
z(<<MI;;(!q4?Fu7IC{E7<m4tSP@bH{ut0KhCKuBJ;YqcV6Bs5Z@cah?h9!c`jEx|I
zVWIc}(aBj{>;*!sObomXi3JHAi3|)&5(WIs;)9*y1-!WeoIMRhT)5%`f<hPygqRu<
zHcw!V7pV7G7z0+|un?qx!ztL+hatL2GuXf&o+IATC5VB;F*wwZK}0+r=vJO3AQxw3
zW@Urafh3}vyjX$_p=x;;7?>dHxtMTi5aEaqHgsWF!T@3zxlFDS;bU}~+$o|Zg~f(=
zunkU=FXNY%6~(JN9l!KO{L;ViOS_8UwYwj`^iBNI%Hntp&&4mj9ltcA1YX0v@k>v|
zFMS`sw5B9pyNmHl@5L|8E``_dK>X6P@k>9&FRd?)*X~OE(ueU&^UB~gJRHCDLK!V_
M9C>W>3z?gY07V3KG5`Po

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 798349aa3f85e0803396471237e94604d00a1f90..aebb29c2a4ae67b732bef3eb8e72c5665bb3a7b3 100644
GIT binary patch
delta 1385
zcmX@4x5|LaCD<iIOM-!c(PSf+JQI_T$YgD%9raF}0WQJ5ybD~|CTB4e2r@G=Bor_t
zE|8iuIYUsGOW=a}$)~}lRlXC&U-?QNcJ^J8uz-DPCKuC^gaSuTmx$($90mp;!N`yV
z)KWV+iD7aQ&wn6bs7+){tWB(B<YH$?EJ*A~U|;}hRh^v0#a<x9%EZ76v<75=Fp>!c
zNf2e5-I-aqJRMiZ#0NXY3wW*yaP~Cda0+(yVTf+h4>mA}=ZJT731Z-I3=Z{U5Rr`s
zx}T>&h>HoN1SFQQ1mvZR%&hE$=q3l&$$h+HvUpWZ-pwm(ZW3&00Wq0}fq@xfIu|n`
z<2@#G@@XlcnjVkt29L?U#3-6bjH0W=D3atS!cDQnC|XF2qNl_t(i9-VO}WG<+DMF|
zuf!;_6ePk;wZteoNQ@#@AtJ2vBt}s$F^Vn{qexVk2scF%qi8NMiXIZ9NL7RgH)Rr|
aXe}{{J`$tIR8$MC5JAi4o6AJcFaiL0S)o4w

delta 1221
zcmZ2wa7d5KCD<jzNt}U!F>NE4JQI_j;ACy49rZ430WQJ5d<%S7Cuax>a|v89KlwD+
zw90p)_$yz@!_K}1j-D<NIk^c7lqY8~ERdX>$;Grlcv9`;1cu28JpX}!VTm9!V<U)Q
zSSY?gbaECKdw~!u69X?pVnISjA_K#cL;*ju_+Y1a0dKAVXHNqW7q0k#pb&-vA*P0e
z%@deka@M=gj{z(2p9fOF;S}uZ!w}u18Ejw>&k^tF62!pa7#!-yAR-<QbSuvikc%@i
zv$8?zKoZeSUM#_eP_;Y^3``L9Tuit$h;YOQ8@ezoVE{3VT<oDNV~|jElU}f)1;k#U
zS<Fzgm~ojE-Q+aclTS+ui`(MCZgZME8Nc*h{L<?DcnvSaFTESTG^+q!!~O9~&%`hN
z7{9cxAYQx6@k<}XFU>84*YHsM()004zr-(XER5IgTKv+-@k<Me;59rNzw}c4((mz0
bTZ-bfyBWXqS^U!CVp`%jGSTKZu``SSlAd?5

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index be7f22f1c29f25351bcb5620dcfe8f955bd083d7..a7b4760817e07cb36e13c835d04abd7bedcabe7a 100644
GIT binary patch
delta 1410
zcmZ3jKiQDWCD<iovIGMI<F<`l=}b&MB9n`mcGNp@2Dk+K@-A>;o1Dc^Ajr(fkWj#o
zxIk*s<P1S!E`bZ?C!YqJR{2g8f8{HA*x7eU!UFcGnOsau5(*qWT_T!0au^tZ1S3Nd
zP)qIPB!<aJJpX}!p*E2*u{N=ik&B%nu^_P{fq?<2RdsR}7khyaD-#1R&>D~d!bm0*
zBtevI?q_D<s&`r&6CdmpFW|K%z}eG)!ztL+hatL2KiI$^o+IATC5VB;F*wwZK}0ql
z=zg98AucA65|CKJ5|EcNGPAN1qMIC8gAJiNco-O%AiB7i@M{y{h?fpFbYWP+0AvLl
z!5GFMMs$<MWJNwL1yp<E(e3q^oJx$MmBc7|ON=5zej?mdN{phN#3=epj3P$?BHYwU
zjG~joDB=|)!n#0W6ip>Y(M@6$$qEtSrbJ>CEhR?LOJWr13KQX`LShtcB}UOtViehm
i5aFgqViX-EMiHkd5!U$<qiCY2mMq?~VDlx>n~VTXH>qd<

delta 1167
zcmbPixLTjfCD<iowKxL<<M)kR=}b(1f|HAxcBHtl1-JzJ@-6UTotz;k%q4Ka{N&SM
z(<<MI;;(!q4?Fu7IC{E7<m4tSP@bH{ut0KhCKuBJ;YqcV6Bs5Z@cah?h9!c`jEx|I
zVWIc}(aBj{>;*!sObomXi3JHAi3|)&5;yN<X5p&$SQrx@>=ZBHurR>c(}2S%*wu$2
zx=AzGz#yI@-q9t9fx|I4)Q>?#JRayEo+Th>Wn^Y$gVcc}qMN)}f(@Z+c^DX&AnLi8
zaA^?Xhz~Y&VOYWdVi>th_Tl4WbebH^rzM5OhIp_IPLr47mwu05+L9ly;m!D^&*GOB
z7r<+HB7W)B_@%$%m$nzgYj-Dp>C5<~Wrgq>o{nF7BYx@M_@!Ni@!H*wU-~9~X=M?-
qhUem!-i}|IQ53J?-uR`b;+MXUUs_WPuieFBTH-kJ*ydegHyHsB4Q@aH

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index b81e3dd8ecd89f4690d69a90096df095fe218425..63fdfe8c025f8b2f19411792817cd21b506fa984 100644
GIT binary patch
delta 1387
zcmdmFIm?>MCD<iomMjAUqryfmc_t<wk;&RjJL;V{16+cAc^9~_P0nH{5M*X#NGM=P
zTp%@Ra)zKVm%s({lTU+9t9&Plzw(tl?CiTFVFCNpOfIG+2?dUxE)mTgISdRyf{`H!
zsHJvt62s&qp8r6=P@Bk@SesbM$i>c(SdiF}z`y|1syaD~i@iXIm5G5DXbs2!VI&g@
zk|4@9yE6y#*E_9^i4S&)7w}pW;OuF@;S}uZ!w}u1A8cR{&k^tF62!pa7#!-yAR-$N
zbU#ml5Em0j2}mqq3CK$snOWHh(M=Al!G=&BJPZs>5M5kM__c{}#82iGmSXgntRbwW
zfNDcLx(yzabBIy2ffz+!h*4xALWG-Yh*5Na7)30iL|ErRjG`W56kQ-jk%$-(Zi*mA
z(HvqFJs?JriZ~H&${<G38e$ZEAV!gi1QBkkAV$$1A{0%MB*HcqVia`{qv#AViUg#H
Wa8n2|ie^Y@$>J>vHs6%G$p`@bk)nP8

delta 1186
zcmbPby~&cxCD<iolMDj`W8y|Gc_t=5!O7Z8JL+B70$hT9`4;%FPR<Y%<`TGIe)4Is
zX_fCp@mIc*hn;;396enka&i+EC{NB}SRgq$lZ$DA@TA(w2@I1Hc>V(c!xBMe#zqjq
zuuyz~=;SOe_5vYRCI()H#Dav5L<WW>i2{CR@xe~<0^VE!&YlJ$E?n^eK_LtULQD+_
zn<p?^@H=}fi~%cfSO`+U;S}uZ!w}u18Ejw>&k^tF62!pa7#!-yAR-<QbSuvikc%@i
zv$8?zKoZeSUM!OZg~d#9$cu2q2OGLDEMWjKj9?675F@(DX>yXVmJ}A9@nDmkCa=LS
z{SCjgg9u*3yYNe2!7nW*ir4TA{L-87OaH+y?IwoT?g{v%Z{e3#5yxwI9)9T^_@$X7
z@EY!eUwRsT=?D0wwIuP{U4mbFAAV^LDZGXU;g_C+U-}t-X#;7zc2`MjiQ~v)n-5Cg
GWCQ@s6m!7<

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index cb7bf7d850f340e12a7237c987f570300fd9c92b..281b0955ca223a1bd2c24f5e58fb8b73ae37a957 100644
GIT binary patch
delta 1367
zcmcbryH}sfCD<iouQ&q(<ByG8@=Q!VB9pb5cGNp@2Dk+K@-A>;o1Dc^Ajr(fkWj#o
zxIk*s<P1S!E`bZ?C!YqJR{2g8f8{HA*x7eU!UFcGnOsau5(*qWT_T!0au^tZ1S3Nd
zP)qIPB!<aJJpX}!p*E2*u{N=ik&B%nu^_P{fq?<2RdsR}7khyaD-#1R&>D~d!bm0*
zBtevIc4sc*^mJMq6CdmpFW|K%z}eG)!ztL+hatL2KiI$^o+IATC5VB;F*wwZK}0ql
z=zg98AucA65|CKJ5|EcNGPAN1qMIC8C-I8O;#D+Rmsgh2W3o4|mIA7}cyz-&CifGg
z=rS>i#QBJ@E}9rc^NCUPm>5Os{6x4Zn;1pwiBa^K7)9m+M7XJ%7)ASuQN%1rgmv!3
zDC#Cg(RpGN2@4V7rf^~u%_c_CePR?T3lrg{bYc{(CPvYFViXyR5aFhBVifHb(LyUT
N(8_|%e?)FF0syVjpr`-<

delta 1194
zcmdn1e^r;uCD<k8su%+Uqvb{}c_t=5!O7Z8JL+B70$hT9`4;%FPR<Y%<`TGIe)4Is
zX_fCp@mIc*hn;;396enka&i+EC{NB}SRgq$lZ$DA@TA(w2@I1Hc>V(c!xBMe#zqjq
zuuyz~=;SOe_5vYRCI()H#Dav5L<WW>i2{CR@xe~<0^VE!&YlJ$E?n^eK_LtULQD+_
zn<p?wbJlw-i~%cfSO`+U;S}uZ!w}u18Ejw>&k^tF62!pa7#!-yAR-<QbSuvikc%@i
zv$8?zKoZeSUM#_eP_;Y^3``L9Tuit$h;YOQ8@ezoVE{3VTqc+C@-aG1ZspaI!eT=_
z*aoM`=kZHR^5NB;j9+>!e(CS{r5*Y4+TD#``YL{Dc>%nJXX2OMj9>aMerb0>ymn8-
zFMS)ow5kwZ!}IY=@5C?7ER5H1U;NV3@k>9%FRd+t*X~mM();mCbBf|MJQ%<9Tv07?
M9C>W>6VaQD0Dwkx9smFU

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 230aaae37169ec2f78ebeae735ccc905a112d284..34914bf1ed362ebd07f0dbc22434dfddd26d9a82 100644
GIT binary patch
delta 1388
zcmaE<chP{$CD<h-P=bMh@y13jc_t<wk;&RjJL;V{16+cAc^9~_P0nH{5M*X#NGM=P
zTp%@Ra)zKVm%s({lTU+9t9&Plzw(tl?CiTFVFCNpOfIG+2?dUxE)mTgISdRyf{`H!
zsHJvt62s&qp8r6=P@Bk@SesbM$i>c(SdiF}z`y|1syaD~i@iXIm5G5DXbs2!VI&g@
zk|4@9yEAif)jO??i4S&)7w}pW;OuF@;S}uZ!w}u1A8cR{&k^tF62!pa7#!-yAR-$N
zbU#ml5Em0j2}mqq3CK$snOWHh(M=Al!G=&BJPZs>5M5kM__c{}#7{oLE5+zB`980f
z0;&!1=r(vvR^}r@Q93b-RuiM>Ju!-m`H65-IWdZM6Qk%qF^Zf8h;UOoF^WzTqljOS
z2<w80Q8b+xMYoAjBrimSo05r9w44}4uZdBlFHD4+iiuIQoft*GiBV)PLWG-|iBWW%
X7)9KoL|Er9swIoJEZ96j^d=(!3GJkI

delta 1194
zcmca;@KTS<CD<h-Q=EZ;QF0@fJQI_j;ACy49rZ430WQJ5d<%S7Cuax>a|v89KlwD+
zw90p)_$yz@!_K}1j-D<NIk^c7lqY8~ERdX>$;Grlcv9`;1cu28JpX}!VTm9!V<U)Q
zSSY?gbaECKdw~!u69X?pVnISjA_K#cL;*ju_+Y1a0dKAVXHNqW7q0k#pb&-vA*P0e
z%@dg4bJlw-i~%cfSO`+U;S}uZ!w}u18Ejw>&k^tF62!pa7#!-yAR-<QbSuvikc%@i
zv$8?zKoZeSUM#_eP_;Y^3``L9Tuit$h;YOQ8@ezoVE{3VTqbkz@i970mgLit!eT=_
z*aoM`$@rz$;+Ou8U)qr$uif4FrLW?bmKVTlcqV@7&G@DN;+J+8#B29N{L;7aOREau
zH9Q}`^iKTJ%))pL_r)(g9l!KL{L<PYc<nC5FTEeXG^Z$D!-Mfl&&4nO9KW=on3gz>
LJhr()>?R`sl%I1@

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 7091ee019191d822869f9a9f35ebd635eea4a9eb..bba1612c972948911ca5f5b301b10a380b8d83b7 100644
GIT binary patch
delta 1407
zcmdmNu*itZCD<iINs@tqF=8W^JQI_T$YgD%9raF}0WQJ5ybD~|CTB4e2r@G=Bor_t
zE|8iuIYUsGOW=a}$)~}lRlXC&U-?QNcJ^J8uz-DPCKuC^gaSuTmx$($90mp;!N`yV
z)KWV+iD7aQ&wn6bs7+){tWB(B<YH$?EJ*A~U|;}hRh^v0#a<x9%EZ76v<75=Fp>!c
zNf2e5-I-aqxIA~o#0NXY3pnnY9Lj4i<-aA^&?25A-q9t9hk=2afx{`-)rTRv$(d#H
zT3!_e*?6EYcnXBLm_Xw3!J&Q$OF$mW$jr)4h;DM9{F+yjkRp%CdVE@h6%`SqXd5w#
zei5U{j-LoOH4&re7%_^t1c<QCj~GRhh*5Nn7)4ToM7SxA7)6VSQS^)$MOs2cxG9eq
zMVp9G^o<xrR>DNMsg4*$hlo+cCPIXDUc@NsBSz6BVibvq65*yOVie6IM$sctEm^!p
K&t_#Y0VV)Uf2(8w

delta 1194
zcmZ2vwAp~mCD<jzSb~9pQEDTXJQI_j;ACy49rZ430WQJ5d<%S7Cuax>a|v89KlwD+
zw90p)_$yz@!_K}1j-D<NIk^c7lqY8~ERdX>$;Grlcv9`;1cu28JpX}!VTm9!V<U)Q
zSSY?gbaECKdw~!u69X?pVnISjA_K#cL;*ju_+Y1a0dKAVXHNqW7q0k#pb&-vA*P0e
z%@deka&mdBivcTeSU0(u*Iv?ZMX;eoJV(5vOArqO12Y4MQ?RQKLv)kP<U717QsVJI
z2lFfeIXfdWD;p#i9~|lz-Q+k~flm{+wA18FJ}rFGoAFEk#V_s7kJs>t_@!^-msS<P
zYj{3>>7DqcnFaA0?u%b~I)3Sg_@%Xl@Y-F9UwS`&X-;9hh6m%9o{L}lIeuwF5xjO+
r<Ci{)Uz%SOui=sSr5EFuev4n)Tnw+>jrgTci)o4D$iSP0#08iDx-NI%

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index a85c608022b9e0878bcedc785b9bdf27e50a760b..3870958969b1c0e29f9dd26a1256359e90897d3e 100644
GIT binary patch
delta 179
zcmccQ(BR1B66_MvpuoVu=(Le5o{7mvWO6psj(R7~0GD82-UTjfld~8K1eqBb5(*d+
z7f4N-oFOR8C2+y~<kMi&D&L9XuY4sBJNqt4Sin9tlZ$CdLV=^FOGI-=4g&*_U}Q)F
zYN?%^#4tID=RXiI)Fv_})+Sama<MZc79@5gFfahMs!q=0VlNP4Wn$n3S_3jb7|Dc!
MB#5%j?aZfT0OS!lX#fBK

delta 159
zcmZp0yyU>;66_KZq`<(ycx@wBJQI_j;N)zk9rZ430WQJ5d<%S7Cuax>a|v89KlwD+
zw90p)_$yz@!_K}1j-D<NIk^c7lqY8~ERdX>$;Grlcv9`;1cu28JpX}!VTm9!V<U)Q
zSSY?gbaECKdw~!u69X?pVnISjA_K#cM2-MYXEz2Bo_HY5SdanY3G_uW#s@paZ@$31
GK?VQ|Y%)&(

diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
index f768380c1c2aa8fcd6ff6bc1048e0ccd2037eb2c..c9c18fa4e45288fb6c2182a793a8e6aff72b33d9 100644
GIT binary patch
delta 179
zcmaFtFwv3ACD<ioq5=a0<D-pS@k~rUB9pV3cGNp@2Dk+K@-A>;o1Dc^Ajr(fkWj#o
zxIk*s<P1S!E`bZ?C!YqJR{2g8f8{HA*x7eU!UFcGnOsau5(*qWT_T!0au^tZ1S3Nd
zP)qIPB!<aJJpX}!p*E2*u{N=ik&B%nu^_P{fq?<2RdsR}7khyaD-#1R&>D~d!bm0*
NBtevIZfCwD0|0JNI!yoo

delta 159
zcmbQ}_}GEVCD<h-S%HCpv1}t(JQI_j;N)zk9rZ430WQJ5d<%S7Cuax>a|v89KlwD+
zw90p)_$yz@!_K}1j-D<NIk^c7lqY8~ERdX>$;Grlcv9`;1cu28JpX}!VTm9!V<U)Q
zSSY?gbaECKdw~!u69X?pVnISjA_K#cM2-MYXEz2Bo_HY5SdanY3G_uW#s@paZ@$2M
GPzC_>5i&CX

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 51e79b3b0754224aa6cd1e1257b404182506f1d1..a32e90b5d913d07bc9ed9aca521420305559f357 100644
GIT binary patch
delta 179
zcmezGwbq-<CD<iotttZp<Nu9Z@k~rUB9pV3cGNp@2Dk+K@-A>;o1Dc^Ajr(fkWj#o
zxIk*s<P1S!E`bZ?C!YqJR{2g8f8{HA*x7eU!UFcGnOsau5(*qWT_T!0au^tZ1S3Nd
zP)qIPB!<aJJpX}!p*E2*u{N=ik&B%nu^_P{fq?<2RdsR}7khyaD-#1R&>D~d!bm0*
NBtevIZfE|X2ms6HI`{wp

delta 159
zcmZ4M{ojkrCD<jTUX_7?aq>p4cqS%4!O7W7JL+B70$hT9`4;%FPR<Y%<`TGIe)4Is
zX_fCp@mIc*hn;;396enka&i+EC{NB}SRgq$lZ$DA@TA(w2@I1Hc>V(c!xBMe#zqjq
zuuyz~=;SOe_5vYRCI()H#Dav5L<WW>i5vl*&Tb4MJn=x9u^<D)6X=U%j1P8--+Y1j
Gt|9<N?=s#1

diff --git a/tests/data/acpi/q35/DSDT.applesmc b/tests/data/acpi/q35/DSDT.applesmc
index 33ca7ee26fee6718c72dd63374bea98e858066c2..5507b6b8f5e6ae4fd4275601eb85caf29bddc352 100644
GIT binary patch
delta 179
zcmZp0T<6H;66_MPPJw}e(Rd?QFB6lG$mE$!JL;V{16+cAc^9~_P0nH{5M*X#NGM=P
zTp%@Ra)zKVm%s({lTU+9t9&Plzw(tl?CiTFVFCNpOfIG+2?dUxE)mTgISdRyf{`H!
zsHJvt62s&qp8r6=P@Bk@SesbM$i>c(SdiF}z`y|1syaD~i@iXIm5G5DXbs2!VI&g@
Nk|4@9Z)H9$0{|KaIqv`f

delta 159
zcmZ4I*x<<J66_MvpuoVuczh#QFB6lW;N+Q1JL+B70$hT9`4;%FPR<Y%<`TGIe)4Is
zX_fCp@mIc*hn;;396enka&i+EC{NB}SRgq$lZ$DA@TA(w2@I1Hc>V(c!xBMe#zqjq
zuuyz~=;SOe_5vYRCI()H#Dav5L<WW>i5vl*&Tb4MJn=x9u^<D)6X=U%j1P8--~5kx
GgA4#WaWd5a

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 40457ec74d272f4ce971b66a1b19a397ed9af770..d03e14b24d0841b4003e7954b70cd7601e571902 100644
GIT binary patch
delta 1390
zcmaD8dOMuUCD<k8wl)I;qufTWcqS$vk;&OiJL;V{16+cAc^9~_P0nH{5M*X#NGM=P
zTp%@Ra)zKVm%s({lTU+9t9&Plzw(tl?CiTFVFCNpOfIG+2?dUxE)mTgISdRyf{`H!
zsHJvt62s&qp8r6=P@Bk@SesbM$i>c(SdiF}z`y|1syaD~i@iXIm5G5DXbs2!VI&g@
zk|4@9w=>tuaCz>Ei4S&)7jWD)nNPu<$$!gae+4lnXO_un3MvY+@jyrO6bNxKIR(4=
z#0Q7^B`g8?BO@~_J0ZHseex0oO+t!1CO=ouBCJSTkqAZk#3<TKjH2(vD6&=}!cFzW
zC^}4xB6ejWtn(&DQ9m(?E)%0jT!jcXMH8cFJ~4_O6Qf97l?XRw6QgK7F^WDDqsUy1
w2sc#|qi8=dikQ`ju+E(rMcu?GI!}xuVGSbO6i$qy*&151c#EFRcQgc;0IdwHng9R*

delta 1193
zcmcZ|{w9>mCD<k8jTQp~<AaS{@k~s9f|IkEcGSDD1-JzJ@-6UTotz;k%q4Ka{N&SM
z(<<MI;;(!q4?Fu7IC{E7<m4tSP@bH{ut0KhCKuBJ;YqcV6Bs5Z@cah?h9!c`jEx|I
zVWIc}(aBj{>;*!sObomXi3JHAi3|)&5;+1qo!uBjc;bOHV?hRpC(swk7$58uzxe`l
zk_?x}x)=~gz+v5F8wGnwzZJoT2Jsy6jxIqw3=B*R98STmJ`B-KHj}3+s7Q&&10Bq>
z1mx_D%&csXTzqh-Uv!h><eLhbxTT#YD=BK>lg_~}y$!GQBqh9Nd*PR!f?xU`erXM5
zymlAim)?V4noR|-;Q{!iXW^HAf?rxs6|dbD_@xiwm*!E!Yj_xb=>_<uU*VTFQO9d{
p9e(K(_@#w3@ERV2UwRpS=@0m&tu*o4-J+=_jwAnWKCLOh1OP7veAWN}

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index fe87e060d5cf41b20cf1a37928ed31ca9b15ed66..2d8cb603c9c937501247d32e6a5b2e79bb01eea3 100644
GIT binary patch
delta 179
zcmZ4Fa>0emCD<h-K#75YaoI+$cqS$vk;&OiJL;V{16+cAc^9~_P0nH{5M*X#NGM=P
zTp%@Ra)zKVm%s({lTU+9t9&Plzw(tl?CiTFVFCNpOfIG+2?dUxE)mTgISdRyf{`H!
zsHJvt62s&qp8r6=P@Bk@SesbM$i>c(SdiF}z`y|1syaD~i@iXIm5G5DXbs2!VI&g@
Nk|4@9w=>U{0{|dEIhX(d

delta 159
zcmccMvdD$YCD<iINr{1h(P|@CJQI_j;N)zk9rZ430WQJ5d<%S7Cuax>a|v89KlwD+
zw90p)_$yz@!_K}1j-D<NIk^c7lqY8~ERdX>$;Grlcv9`;1cu28JpX}!VTm9!V<U)Q
zSSY?gbaECKdw~!u69X?pVnISjA_K#cM2-MYXEz2Bo_HY5SdanY3G_uW#s@paZ@$3X
GAO`@jH!*$y

diff --git a/tests/data/acpi/q35/DSDT.cxl b/tests/data/acpi/q35/DSDT.cxl
index 82d7563a73f6b7a4ead15ca0933d0e57ae8be48e..20d0fb64ea52b2f4979105c934aadb6f416e2b71 100644
GIT binary patch
delta 179
zcmZqhUgyo_66_MPPL+Xy(Q6}DJQI_T$mDFM9raF}0WQJ5ybD~|CTB4e2r@G=Bor_t
zE|8iuIYUsGOW=a}$)~}lRlXC&U-?QNcJ^J8uz-DPCKuC^gaSuTmx$($90mp;!N`yV
z)KWV+iD7aQ&wn6bs7+){tWB(B<YH$?EJ*A~U|;}hRh^v0#a<x9%EZ76v<75=Fp>!c
NNf2e5+nIkV0ssJjImiG2

delta 159
zcmZ4I-QdmT66_Mvpvu6&cyA+DJQI_j;N)zk9rZ430WQJ5d<%S7Cuax>a|v89KlwD+
zw90p)_$yz@!_K}1j-D<NIk^c7lqY8~ERdX>$;Grlcv9`;1cu28JpX}!VTm9!V<U)Q
zSSY?gbaECKdw~!u69X?pVnISjA_K#cM2-MYXEz2Bo_HY5SdanY3G_uW#s@paZ@$2M
GPZ0nmS~9Kx

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index 304c8229d81e333ed7564423cf50ad2b963b0a2e..b23339513af3be457c1974e0288fc4c6720690d8 100644
GIT binary patch
delta 179
zcmX@%`^}fjCD<k8n;HWH<AjY|@k~rUB9pV3cGNp@2Dk+K@-A>;o1Dc^Ajr(fkWj#o
zxIk*s<P1S!E`bZ?C!YqJR{2g8f8{HA*x7eU!UFcGnOsau5(*qWT_T!0au^tZ1S3Nd
zP)qIPB!<aJJpX}!p*E2*u{N=ik&B%nu^_P{fq?<2RdsR}7khyaD-#1R&>D~d!bm0*
NBtevIZfAB>1^~m2IyC?Q

delta 159
zcmez7d%~B?CD<k8gc<__qsm6EcqS%4!O7W7JL+B70$hT9`4;%FPR<Y%<`TGIe)4Is
zX_fCp@mIc*hn;;396enka&i+EC{NB}SRgq$lZ$DA@TA(w2@I1Hc>V(c!xBMe#zqjq
zuuyz~=;SOe_5vYRCI()H#Dav5L<WW>i5vl*&Tb4MJn=x9u^<D)6X=U%j1P8--+X~t
GO&I_{t1=q^

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index b9a5ae240c62f29d952d94a280bc97d608b3c2e5..8af2695edeeadbde2a1e8f04ab567f5c00b76945 100644
GIT binary patch
delta 179
zcmbR1c-oQ6CD<k8v;qSIWBNv}RZL7iB9pf<?WlL+3~&kd<z3*yHaUx-K#-Y{A)$aF
zae>sN$r*yeTml!&Pd*Jct@52H{>oSKu(R)ygazzVGr5?SBosJ$x<oX0<S;M*2}Xt_
zpqARnNeq*dc>V(cLv12sVr^n2BNsbEVnJd@0s{k3tLo$|F7^T;Rwf2spfw-^gpo`r
NNP;Nae2MwA3;>&(I?(_C

delta 131
zcmX@@IM<QOCD<iot^xxC<L`}JtC*Pl1SfA}+L7YI7T^->%eTOXb#jKFFqgmu^OH}5
zO{;t-iof!eJnZaS;OOZRk&~OSKzVW&!ve|4nOsZ@geTQbPGFdv!1Esn7?ub!Gd6+<
ihK1q_L?>r)u@?xjGBNNnBo-ueBr-58N!-M8S_S}whAYtk

diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
index a0eeae95c07fe3708509c3e652c3aeff9c21ac82..479df48cd37af888317d63eac8f565f370201490 100644
GIT binary patch
delta 179
zcmZ4Oc+-)~CD<k8rUC;4<H3zw@k~rUB9pV3cGNp@2Dk+K@-A>;o1Dc^Ajr(fkWj#o
zxIk*s<P1S!E`bZ?C!YqJR{2g8f8{HA*x7eU!UFcGnOsau5(*qWT_T!0au^tZ1S3Nd
zP)qIPB!<aJJpX}!p*E2*u{N=ik&B%nu^_P{fq?<2RdsR}7khyaD-#1R&>D~d!bm0*
NBtevIZf91J1pt!1InDq8

delta 159
zcmccVxZ07+CD<iowE_bJW9UY%cqS%4!O7W7JL+B70$hT9`4;%FPR<Y%<`TGIe)4Is
zX_fCp@mIc*hn;;396enka&i+EC{NB}SRgq$lZ$DA@TA(w2@I1Hc>V(c!xBMe#zqjq
zuuyz~=;SOe_5vYRCI()H#Dav5L<WW>i5vl*&Tb4MJn=x9u^<D)6X=U%j1P8--+Y0Y
GQx*UfEHShI

diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
index f768380c1c2aa8fcd6ff6bc1048e0ccd2037eb2c..c9c18fa4e45288fb6c2182a793a8e6aff72b33d9 100644
GIT binary patch
delta 179
zcmaFtFwv3ACD<ioq5=a0<D-pS@k~rUB9pV3cGNp@2Dk+K@-A>;o1Dc^Ajr(fkWj#o
zxIk*s<P1S!E`bZ?C!YqJR{2g8f8{HA*x7eU!UFcGnOsau5(*qWT_T!0au^tZ1S3Nd
zP)qIPB!<aJJpX}!p*E2*u{N=ik&B%nu^_P{fq?<2RdsR}7khyaD-#1R&>D~d!bm0*
NBtevIZfCwD0|0JNI!yoo

delta 159
zcmbQ}_}GEVCD<h-S%HCpv1}t(JQI_j;N)zk9rZ430WQJ5d<%S7Cuax>a|v89KlwD+
zw90p)_$yz@!_K}1j-D<NIk^c7lqY8~ERdX>$;Grlcv9`;1cu28JpX}!VTm9!V<U)Q
zSSY?gbaECKdw~!u69X?pVnISjA_K#cM2-MYXEz2Bo_HY5SdanY3G_uW#s@paZ@$2M
GPzC_>5i&CX

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index b4a9f5a0fe5cf3b44ebe7659a2bf3687e1073482..a5730b8ab8abb2602334633cd6c760f79915e564 100644
GIT binary patch
delta 179
zcmZ4JecqePCD<k8yeb0&qsd0DcqS$vk;&OiJL;V{16+cAc^9~_P0nH{5M*X#NGM=P
zTp%@Ra)zKVm%s({lTU+9t9&Plzw(tl?CiTFVFCNpOfIG+2?dUxE)mTgISdRyf{`H!
zsHJvt62s&qp8r6=P@Bk@SesbM$i>c(SdiF}z`y|1syaD~i@iXIm5G5DXbs2!VI&g@
Nk|4@9w=+vA0RS{(IX3_R

delta 159
zcmX@_z0jM>CD<iop(+Cd<B5%2@k~s9f|IkEcGSDD1-JzJ@-6UTotz;k%q4Ka{N&SM
z(<<MI;;(!q4?Fu7IC{E7<m4tSP@bH{ut0KhCKuBJ;YqcV6Bs5Z@cah?h9!c`jEx|I
zVWIc}(aBj{>;*!sObomXi3JHAi3|)&5;+1qo!uBjc;bOHV?hRpC(swk7$58uzxe|5
Ge?<UQI5Qjo

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 3af5ef2ea473322d8697281d3a20f7282f3238ac..a4293c20fed04d1ccfc4f4fc1ccf46ca81453854 100644
GIT binary patch
delta 179
zcmdnv`O1^aCD<k8l?np`<A;r0@k~rUB9pV3cGNp@2Dk+K@-A>;o1Dc^Ajr(fkWj#o
zxIk*s<P1S!E`bZ?C!YqJR{2g8f8{HA*x7eU!UFcGnOsau5(*qWT_T!0au^tZ1S3Nd
zP)qIPB!<aJJpX}!p*E2*u{N=ik&B%nu^_P{fq?<2RdsR}7khyaD-#1R&>D~d!bm0*
NBtevIZf7=C1OVaDI#~b!

delta 159
zcmaFmxyO^sCD<ioj|u|=W6MUacqS%4!O7W7JL+B70$hT9`4;%FPR<Y%<`TGIe)4Is
zX_fCp@mIc*hn;;396enka&i+EC{NB}SRgq$lZ$DA@TA(w2@I1Hc>V(c!xBMe#zqjq
zuuyz~=;SOe_5vYRCI()H#Dav5L<WW>i5vl*&Tb4MJn=x9u^<D)6X=U%j1P8--+X~t
GN)Z5C2QohZ

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 238668b95f33e831d66e2e2fa5e952f00ea7260b..ae47b004e39f9f78f3c98093727fb92a0c6c74cb 100644
GIT binary patch
delta 310
zcmez2w8fdrCD<ioiy{L9<G+nu@k~rUB9pV3cGNp@2Dk+K@-A>;o1Dc^Ajr(fkWj#o
zxIk*s<P1S!E`bZ?C!YqJR{2g8f8{HA*x7eU!UFcGnOsau5(*qWT_T!0au^tZ1S3Nd
zP)qIPB!<aJJpX}!p*E2*u{N=ik&B%nu^_P{fq?<2RdsR}7khyaD-#1R&>D~d!bm0*
zBtevIZfCBQ;c}9Qi4S&)7w{6F%%@<_=r`F<L7d5%W%7Fk6<OJMpqqILgt(ZTf?a*$
zgG2oimVmsGk(rg9FnOVZsgxf_u%Tr<N4%p;5Dy~*GXn=mAwzT%kp@Ulc2zV60C7HE
A8UO$Q

delta 290
zcmdnu{KJXMCD<jTLXm-iF>51NJQI_j;N)zk9rZ430WQJ5d<%S7Cuax>a|v89KlwD+
zw90p)_$yz@!_K}1j-D<NIk^c7lqY8~ERdX>$;Grlcv9`;1cu28JpX}!VTm9!V<U)Q
zSSY?gbaECKdw~!u69X?pVnISjA_K#cM2-MYXEz2Bo_HY5SdanY3G_uW#s@paZ@$2s
zB*Wz*9s}YC_=rumQLvYE=Lj}5i06oRbP3{NU|?e4a0+(yVT^9FnLJfNMO-`{=wO~D
lAZKS}W@Urq;)6r|CSOx91?#kg>SSbKhUjD<q%%#?4*)MbRNw#r

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index 0fb09121cf8f6ad8810587c8b77df9552dd31f42..6feed2ee106087d24d51f468df1b4d44e65143f0 100644
GIT binary patch
delta 179
zcmX?N|H+=qCD<k8lRN_hBhN;zcqS$vk;&OiJL;V{16+cAc^9~_P0nH{5M*X#NGM=P
zTp%@Ra)zKVm%s({lTU+9t9&Plzw(tl?CiTFVFCNpOfIG+2?dUxE)mTgISdRyf{`H!
zsHJvt62s&qp8r6=P@Bk@SesbM$i>c(SdiF}z`y|1syaD~i@iXIm5G5DXbs2!VI&g@
Nk|4@9w=>(y002%mId=d6

delta 159
zcmexlf5e{4CD<k8h&%%W<ARM`@k~s9f|IkEcGSDD1-JzJ@-6UTotz;k%q4Ka{N&SM
z(<<MI;;(!q4?Fu7IC{E7<m4tSP@bH{ut0KhCKuBJ;YqcV6Bs5Z@cah?h9!c`jEx|I
zVWIc}(aBj{>;*!sObomXi3JHAi3|)&5;+1qo!uBjc;bOHV?hRpC(swk7$58uzxe{Q
Gk_-T9Q8HZs

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 37fa4c3a45b0d7db0d3d368df5e027e7e1acf9d2..414b8af67bdf79238915de0d609ce45e150eb958 100644
GIT binary patch
delta 179
zcmccN(B{bH66_Mvroh0!_+}$lJQI_T$mDFM9raF}0WQJ5ybD~|CTB4e2r@G=Bor_t
zE|8iuIYUsGOW=a}$)~}lRlXC&U-?QNcJ^J8uz-DPCKuC^gaSuTmx$($90mp;!N`yV
z)KWV+iD7aQ&wn6bs7+){tWB(B<YH$?EJ*A~U|;}hRh^v0#a<x9%EZ76v<75=Fp>!c
NNf2e5+nF!Q003SRIx7GG

delta 159
zcmZp3yy3v*66_KZp}@ev*szf+o{7m%aB?=&j(Qii0GD82z6Cz4lQRT`xdbklpL`l@
zTID-Y{FSfdVQ1e0M^BfCoZN&3%9FDg7D!Ic<YHPNJgIha0>k74p8r6=utboVu@OWt
zEEHcLIysAry+DYSiGi0Pu^^!%k%3`JB1eFyvm1j5Pdt!jEXV-y1o|Qw<Aa^zH(y}h
GCIbNFpE3~u

diff --git a/tests/data/acpi/q35/DSDT.pvpanic-isa b/tests/data/acpi/q35/DSDT.pvpanic-isa
index 8705309748d1d7352c6623b32c28eab7fbbce2a4..7277a0105035f984dc0a0f09747d441c21e62d1c 100644
GIT binary patch
delta 179
zcmdn)_|%chCD<k8sR9E7<HwC$N0^v=L?&Ng+EMSs8Q>D^%e%mZZE_Yvfgm#@LqY*V
z;sU8jlQRT`xdbklpL`l@TID-Y{FSfdVQ1eZ2@BY#W^yqtNhomibcty0$YEdr5{wK<
zKrOYClNcr^@%#q@hT25N#M;D4MlN=S#Dc_*1O^76R@KQ_T<irxtV|5NKx;q-2qT$L
NkOWb-`3>`F830PWJNEzp

delta 115
zcmaFrxZRP<CD<ioy8;6PW9vq)BTP(wf|D;W?cj1@3vdbc<y+vxI(Z?pm`j19r%Oam
zZo&fP$yp2wBqwKbF)a|DR699=VR8b`e;{C3BFN0x2qG93iZ2kIoW;dnAjHbVz{`+W
RkkFCHz_287vlPo|832BhB&PrX

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index 7408f03e4b571c352f9fdf2afc8718aa7b37da06..253a66e65818d1df67b13d4b70f68add78adff98 100644
GIT binary patch
delta 161
zcmdnsde4>1CD<k8o)QBC<E)Kb8(ElqL?-WL*&*q~8Q>D^%e%mZZE_Yvfgm#@LqY*V
z;sU8jlj~W<l9wbbV4s@F#k3@$z|qqsqPZi7fdNP`G9&?2)J{%fn4HA(9|#y~6B!e0
s6Dt|H*clQF5<3zY7=T(;Cuec77YMO3G4KLSMKhov38HHAP1fr&08&;n{Qv*}

delta 115
zcmccTy1|vpCD<iogAxM+quxfYjVw%lf|K{M?BH@?3vdbc<y+vxI=PQk%%#B5(<LG&
zH(`PD<Sd2-l9MyJm=*|6s-2v`FgbzeKM*i15oBg;1Q84i#TST9&f;P(5MpIw;AKcG
RNa#ppU|5p4nVs#r3;;!mBn<!n

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index 134c2fbccacd0e9383df094f9b4deb03b4e46abb..76bd4661e6655d2a8f246f4bf38490df14da82ad 100644
GIT binary patch
delta 179
zcmX@*`oopWCD<k8hY|w=qvJ-d(=1FrB9pJP?5KC*3~&kd<z3*yHaUx-K#-Y{A)$aF
zae>sN$r*yeTml!&Pd*Jct@52H{>oSKu(R)ygazzVGr5?SBosJ$x<oX0<S;M*2}Xt_
zpqARnNeq*dc>V(cLv12sVr^n2BNsbEVnJd@0s{k3tLo$|F7^T;Rwf2spfw-^gpo`r
NNP;Na{F(K-3;+_8JFx%&

delta 132
zcmez2ddii{CD<k8loA62<JFB^r&*Z%1Sel-*^%PH7T^->%eTOXb#jKFFqgmu^OH}5
zO{;t-iof!eJnZaS;OOZRk&~OSKzVW&!ve|4nOsZ@geTQbPGFdv!1Esn7?ub!Gd6+<
jhK1q_L?>r)u@?xjGBNNnBo-ueBr-58N!+Z+c3lPl1?w!b

diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
index be4a254e93a9cb360f42a25121c5fcefbd47480f..3f14b57f0797ab13fc4c90dd2949cf4bd6c30896 100644
GIT binary patch
delta 179
zcmZ4PdDWB4CD<k8stN-G<NJ+V@k~rUB9pV3cGNp@2Dk+K@-A>;o1Dc^Ajr(fkWj#o
zxIk*s<P1S!E`bZ?C!YqJR{2g8f8{HA*x7eU!UFcGnOsau5(*qWT_T!0au^tZ1S3Nd
zP)qIPB!<aJJpX}!p*E2*u{N=ik&B%nu^_P{fq?<2RdsR}7khyaD-#1R&>D~d!bm0*
NBtevIZf90d1OT<%Is^a!

delta 159
zcmccWx!jY>CD<ioxe5aVWAjF?cqS%4!O7W7JL+B70$hT9`4;%FPR<Y%<`TGIe)4Is
zX_fCp@mIc*hn;;396enka&i+EC{NB}SRgq$lZ$DA@TA(w2@I1Hc>V(c!xBMe#zqjq
zuuyz~=;SOe_5vYRCI()H#Dav5L<WW>i5vl*&Tb4MJn=x9u^<D)6X=U%j1P8--+Y0Y
GRS^I*5;5uk

diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
index 2327152da1b7d777c1f3da358ae5ae1406384d11..baa88f6f219a2a47fe20ee0c08b92371cc7e2aa7 100644
GIT binary patch
delta 181
zcmdlwjp^|;CN7s?myqOc1_s6-8@b|{n0!PgXEW`ncj63i3HIe(;KDXJi=jY}nUNu(
zfFW^#)TGH7g2G$^7tBvS4K}UvohbgwSMsp4?~;TC>{Bzjn3g0IIC{E7G<W1MFaQZg
zh9sbt+Q~@_laqM<0|7&AB4c80VkILNJ40eYVn+f415m5#<SZ`s0wGo=240{wAOnPv
POejc#DBIl5ysjMpI!-&V

delta 161
zcmaDnjcMyNCN7s?mk`r#1_s8Sja>0eOn!osvzd0(yRZeg1pD$W@L`>tAt=lxaKZfK
z(_qso--+U{d?gP%`xZEQx<usUCM-~%oW-y}a&jgY(*og1wUZMVCMWRx2LgsAg3OGK
zAcA3`_yW<%SzPP|Laa;-ybOs22_1<H3`-I@0z94F7({sDfiz=528bun7s(hO>=eKG
I0`uf{0IEYXmH+?%

-- 
MST


