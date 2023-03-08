Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2D56AFBF6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:15:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiML-00065F-Kq; Tue, 07 Mar 2023 20:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMH-0005al-SW
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMF-0001gA-SJ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lzIkUjr/QYt2mzV+mGVZPiVPR9/LNVK8AnObS8YCn8U=;
 b=bCTq1ZgDy0DaDs42IDv9YdIlUrwkH4G2G2VoTiy2e0V5K2inHIE1w9YOIgKQhtluQPfSYh
 uQAFlqGXrlsl6YblW0w7Yd6O2GjrxdlPYQeN6Vblnp1aElQimXeTDdwfD92yMlzDGTiHfw
 ka02w5/L/VITSxqPqW4i9XTJ5F27JEA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-zaqI1yMcPH2N0TT1MqO1EQ-1; Tue, 07 Mar 2023 20:12:42 -0500
X-MC-Unique: zaqI1yMcPH2N0TT1MqO1EQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 h11-20020a0564020e8b00b004e59d4722a3so11262286eda.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237960;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lzIkUjr/QYt2mzV+mGVZPiVPR9/LNVK8AnObS8YCn8U=;
 b=bCuPA8jBE77zCndVKJipLxMDsOCggSgYwPYGMXy57xkumcSNHIOppCVdADrfSuZM0d
 XM9gUW3gPDw4w6TGunnTIIX3LX27aMYSsSAqF0CRd62IcGkVj7zHv768a7OI7Dsf6ZHm
 AdkL+YK1fbl+H+qrtEVZGUJTpU1fUEwMP4TshvlAZocbzLV4n+zHy52EhjjWBDPoY3iq
 NTyQcC2AtYQ6a5fV/mQKPPXwl2MI+zmqGaXhlboAOdeOO/qZpaTnnzustVNw7l7hGpke
 N2OuF1GpRQZoyJbdvJKnnsaXOqk2tm75ET2OG4gC9/h6KESFwSxnBn7ja6MHB1g67ueS
 3nKQ==
X-Gm-Message-State: AO0yUKVl42Qu1cVU87WVGJtWdqcOero97HoBhALXZ3eAct1IGhFU29o5
 NwNlAMhTqggU7A3k19ulvM95TbyhOubmtzDYY8UHRI2f56QDntk+QgonkzaVHfpkPXVT9Xl9J+t
 BnXh47X8qYBgVnpRAsHFSwJ4ytNS3yp7VAaArbDreRs63LK7C1azA/h6l0efwk1poIf2o
X-Received: by 2002:a17:906:3503:b0:8af:40b0:3dd1 with SMTP id
 r3-20020a170906350300b008af40b03dd1mr16377778eja.27.1678237960381; 
 Tue, 07 Mar 2023 17:12:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9YkKYRkxnqRHMzZXPuDIdxBuD4C2ePvVs9hPBpVXuUkqgWogxLkVEJQHNvhZCqm0FlNbLYxA==
X-Received: by 2002:a17:906:3503:b0:8af:40b0:3dd1 with SMTP id
 r3-20020a170906350300b008af40b03dd1mr16377763eja.27.1678237960157; 
 Tue, 07 Mar 2023 17:12:40 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 g26-20020a17090613da00b008d044ede804sm6662221ejc.163.2023.03.07.17.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:39 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 36/73] tests: acpi: update expected blobs
Message-ID: <30216b3eaf3b5c3c36d90a5c7402a67ed6a5fcb9.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
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

From: Igor Mammedov <imammedo@redhat.com>

BNUM numbering changes across DSDT due to addition of new bridges.

Fixed missing PCI tree brunch (q35/DSDT.multi-bridge case):

  //  -device pcie-root-port,id=rpnohp,chassis=8,addr=0xA.0,hotplug=off
  +            Device (S50)
  +            {
  +                Name (_ADR, 0x000A0000)  // _ADR: Address
  //  -device pcie-root-port,id=rp3,chassis=9,bus=rpnohp
  +                Device (S00)
  +                {
  +                    Name (_ADR, Zero)  // _ADR: Address
  +                    Name (BSEL, Zero)
  +                    Device (S00)
  +                    {
  +                        Name (_ADR, Zero)  // _ADR: Address
  +                        Name (ASUN, Zero)
  +                        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
  +                        {
  +                            Local0 = Package (0x02)
  +                                {
  +                                    BSEL,
  +                                    ASUN
  +                                }
  +                            Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
  +                        }
  +
  +                        Name (_SUN, Zero)  // _SUN: Slot User Number
  +                        Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
  +                        {
  +                            PCEJ (BSEL, _SUN)
  +                        }
  +                    }
  +
  +                    Method (DVNT, 2, NotSerialized)
  +                    {
  +                        If ((Arg0 & One))
  +                        {
  +                            Notify (S00, Arg1)
  +                        }
  +                    }
  +                }
  +            }

Fixed hotplug notification for leaf root port (hotplug=on) attached to
intermediate root port (hotplug=off) (q35/DSDT.multi-bridge case)

  //  -device pcie-root-port,id=rpnohp,chassis=8,addr=0xA.0,hotplug=off
  +        Scope (S50)
  +        {
  //  -device pcie-root-port,id=rp3,chassis=9,bus=rpnohp
  +            Scope (S00)
  +            {
  +                Method (PCNT, 0, NotSerialized)
  +                {
  +                    BNUM = Zero
  +                    DVNT (PCIU, One)
  +                    DVNT (PCID, 0x03)
  +                }
  +            }
  +
  +            Method (PCNT, 0, NotSerialized)
  +            {
  +                ^S00.PCNT ()
  +            }
  +        }
  ...
           Method (PCNT, 0, NotSerialized)
           {
  +            ^S50.PCNT ()
               ^S13.PCNT ()

Populated slots being described on coldplugged bridges even if
ACPI bridge hotplug is disabled.
(pc/DSDT.hpbridge and pc/DSDT.hpbrroot)
  ...
               Device (S18)
               {
                   Name (_ADR, 0x00030000)  // _ADR: Address
  +                Device (S08)
  +                {
  +                    Name (_ADR, 0x00010000)  // _ADR: Address
  +                }
  +
  +                Device (S10)
  +                {
  +                    Name (_ADR, 0x00020000)  // _ADR: Address
  +                }
               }
  ...
               Device (S18)
               {
                   Name (_ADR, 0x00030000)  // _ADR: Address
  +                Device (S00)
  +                {
  +                    Name (_ADR, Zero)  // _ADR: Address
  +                }
               }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-11-imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 6289 -> 6323 bytes
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3115 -> 3166 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 12337 -> 12545 bytes
 tests/data/acpi/q35/DSDT.noacpihp           | Bin 7932 -> 8022 bytes
 5 files changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index a0dbb28cde..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.multi-bridge",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/q35/DSDT.noacpihp",
diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 834c27002edbd3e2298a71c9ff1b501e3a3314f7..5dea100bc9492bb2367aac8660522201785c1efb 100644
GIT binary patch
delta 89
zcmbPexY>})CD<iovjhVJqvb}fa&9iSGcobOPVoYMr#E+Ve`ho>3^ufg=ZJT73F2X3
bU}lJJ;tw`J2rz;L3=QBam^M$~W#k3`PB0c2

delta 55
zcmdmNIMI;HCD<ioq67m2qvA%ca&9h{Q!(+uPVoXhCpUL<e`n<54>q)j=ZJT73F2X3
LVBWlmmysI)zZnl0

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index d77752960285a5afa6d0c0a04e400842f6acd2ed..893ab221c2cca1829937a4c26152680313633df4 100644
GIT binary patch
delta 121
zcmZ22aZiHFCD<h-j)#GPaneSvdz@Tu>M`-bPVoYMYMVcCerGf=3^p=|=ZJT72?DBN
iVTf+x4>quX3owEO3=t}rCV%HvRZs{vMyO%O)C2%vb{qNt

delta 70
zcmca7v08%5CD<iIn}>mc@#99Wdz@U(DlzfFPVoZX%9}rNerM$44>mH0=ZJT72?DBN
SnJmep%FiEcYylTyX8-`NSP<#}

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 66b39be294a261a6bd991c6bcbd8e2a04a03403f..f2f60fdbb3b44ab9adb69bb36e4a80978536af9b 100644
GIT binary patch
delta 312
zcmdm((3r&K66_MfXvo08IA<eQqa05Y2V+cpuv5H1Cp+Whsd7n-?2|vrM@|luS7u}e
zu^7E4pO;shTr3|y*-t@k@(1~-$;T7|CV!W6-5jmBoSUCjgv}+)FNBH1DcIGAi)FH)
zu9T4zN3f|uJV(5vOArqO0~bSdlLLFO0aSzmtP&{Z$$}7@{9i6;v$k#wqqwtlj2_56
z0nVNV0yZFX1XO|QCeP4Q6cZ5$aP|vfh|>dU1Tle9hQ^ck>8bJ<#fvC_B@4KiCNI<%
zpL}1BALs!Pi%nm4@&bLy$u{~Nla=))CdcRtPj=B)5)e=eHZ(wJV+Sgh5OijNSpl>e
K#GJfezX$-13sfWk

delta 216
zcmZon+L*xQ66_LUXu!b0*uIggQI5;|e@uL^Q@nul|H;$kk{H=07brwdz97#sIb2?T
z@@M(D$yem%Cg&?eP4-n#Vq^fyu4H5dk}jL$6qj?Wvxu;{g!zRqaX1CL`fxErdC^V$
z!A2JG9Py4WK|Bl$tPGns=*BS$dWps8f$R!!_B0Ss4K_5Mtg5fb3St>ej?q`;F^m^c
z2ypfbVJP5YnyjxcKKZo1EYLE2eTm6B23nJ~4LB!n2C{t&BqzVnmt?a5tDW3$Py_&m
C13TgX

diff --git a/tests/data/acpi/q35/DSDT.noacpihp b/tests/data/acpi/q35/DSDT.noacpihp
index f35338db30a44638cc3a55d2870e0e377af4246f..4ea982de2df3cf7cd89cb3b4467a350eaf8f5d29 100644
GIT binary patch
delta 213
zcmexkd(Do^CD<h-OrC*(F=8Xv3mGmKwV3!|r+5J$)yaQk0_qiljSS*B;vHRrco-O1
z7^0i_gAFX;0*pWbpbCTlD>fA}!Nv$P*nldygAJepKn_qAp`RU1R<}tv*aV@O1FYTz
Op`H^({pNYHaf|>-)-eG9

delta 122
zcmca+_s5pYCD<k8j~oL7<Ase}FJ!p96k_6oo#F+Y6ej<X2?*j3HZq9kh<9`e;$dK5
jVTf)53Ru7eSiu6u2o-D)0fY*6uz(3d1;^$evT=+6@ys3p

-- 
MST


