Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760D36339FB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 11:24:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQRV-0008JW-24; Tue, 22 Nov 2022 05:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQRO-0008JK-GB
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQRJ-0004md-J7
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669112619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AFyfuScQTJkWiwItZL4ClYP9RpmGgHhVFjDOHIwKoSY=;
 b=V7NkZR+XdRZbY7KMWzvM3+uLFTqGggcr4N/5NbI1FFUE7fdqARaDlsiWTi+6I5CoHgmU5A
 bK/a2gYiaxHvVL8rrp9gSbFLTR2otnmXnZATnrckqPFL3N0GL/sIrUJbrNGrGlC1Gl/Kks
 tX+sFocz/71M/TCYyocGVPMy2yJu3bI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-jfz4yzwvOuaw-7t8eD4jDw-1; Tue, 22 Nov 2022 05:23:38 -0500
X-MC-Unique: jfz4yzwvOuaw-7t8eD4jDw-1
Received: by mail-wr1-f70.google.com with SMTP id
 j20-20020adfb314000000b002366d9f67aaso4047132wrd.3
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 02:23:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AFyfuScQTJkWiwItZL4ClYP9RpmGgHhVFjDOHIwKoSY=;
 b=HTsmmG3z+LSJSGKapfTtoRHum329YHjINFOh/Ux8zTlFNTF8O2vZA1ron7OSvYE38o
 CkQAj1hyMJVX0jAFyG2/MIrZTLLZk0lV9GOpoXQzYqu05YGRFOtPLWCd07mio9pXH4Zz
 HZaYlgkAKGpOcdERB1V2WONQfx43SfmniwBBk202nHyO7E7Nw3b4fgfgpvGxH8vOHyTl
 Ub2FauoSD5qPiybtzkbfZZ8NA3mUWCwKfM22YFibeR+tq2jr2IcGbYYf0W/9kae/Q/F0
 iQt9pTOomdjmS8WWfAp+Vz2UinlUQOpIGOxlP46Bw+Hg2xQQJMU8VK3tqL5AQewnwa5w
 bDzg==
X-Gm-Message-State: ANoB5pnV1V/Y5st4sGDbg7yNbQwS4qFFZO60fxZLERHfCIpALWLfqKcp
 WAQ+fta6/NBGGp+AYMml1E4nuYqGVbl5Tb87VS+fGNo55DLGo5LgDfWzU+a1jz2bPb2VFhisUjC
 uUVN4A53YgucNPhdq4lpQD+Fv3CncrYGYL/PIOJzyi1FfmI7wz/dKKPQ9mLn1
X-Received: by 2002:a1c:7504:0:b0:3cf:8ebf:69b with SMTP id
 o4-20020a1c7504000000b003cf8ebf069bmr6401383wmc.86.1669112616241; 
 Tue, 22 Nov 2022 02:23:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6hvCRRfx0eqVgZSE06LYEL1JzNFh138/j6bKrDvMC0VSE3+PssaFU0gTOMFaZAZXwmnIjFDA==
X-Received: by 2002:a1c:7504:0:b0:3cf:8ebf:69b with SMTP id
 o4-20020a1c7504000000b003cf8ebf069bmr6401354wmc.86.1669112615624; 
 Tue, 22 Nov 2022 02:23:35 -0800 (PST)
Received: from redhat.com ([2.52.21.254]) by smtp.gmail.com with ESMTPSA id
 v11-20020a5d43cb000000b00241bd177f89sm12881808wrr.14.2022.11.22.02.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 02:23:35 -0800 (PST)
Date: Tue, 22 Nov 2022 05:23:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 4/8] tests: acpi: x86: update expected DSDT after moving PRQx
 fields in _SB scope
Message-ID: <20221122102227.6603-5-mst@redhat.com>
References: <20221122102227.6603-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122102227.6603-1-mst@redhat.com>
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

Expected DSDT changes,
pc:
  -                Field (P40C, ByteAcc, NoLock, Preserve)
  +                Scope (\_SB)
                   {
  -                    PRQ0,   8,
  -                    PRQ1,   8,
  -                    PRQ2,   8,
  -                    PRQ3,   8
  +                    Field (PCI0.S08.P40C, ByteAcc, NoLock, Preserve)
  +                    {
  +                        PRQ0,   8,
  +                        PRQ1,   8,
  +                        PRQ2,   8,
  +                        PRQ3,   8
  +                    }
                   }

  -                Alias (PRQ0, \_SB.PRQ0)
  -                Alias (PRQ1, \_SB.PRQ1)
  -                Alias (PRQ2, \_SB.PRQ2)
  -                Alias (PRQ3, \_SB.PRQ3)

q35:
  -                Field (PIRQ, ByteAcc, NoLock, Preserve)
  -                {
  -                    PRQA,   8,
  -                    PRQB,   8,
  -                    PRQC,   8,
  -                    PRQD,   8,
  -                    Offset (0x08),
  -                    PRQE,   8,
  -                    PRQF,   8,
  -                    PRQG,   8,
  -                    PRQH,   8
  +                Scope (\_SB)
  +                {
  +                    Field (PCI0.SF8.PIRQ, ByteAcc, NoLock, Preserve)
  +                    {
  +                        PRQA,   8,
  +                        PRQB,   8,
  +                        PRQC,   8,
  +                        PRQD,   8,
  +                        Offset (0x08),
  +                        PRQE,   8,
  +                        PRQF,   8,
  +                        PRQG,   8,
  +                        PRQH,   8
  +                    }
                   }

  -                Alias (PRQA, \_SB.PRQA)
  -                Alias (PRQB, \_SB.PRQB)
  -                Alias (PRQC, \_SB.PRQC)
  -                Alias (PRQD, \_SB.PRQD)
  -                Alias (PRQE, \_SB.PRQE)
  -                Alias (PRQF, \_SB.PRQF)
  -                Alias (PRQG, \_SB.PRQG)
  -                Alias (PRQH, \_SB.PRQH)

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221121153613.3972225-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h   |  36 ------------------
 tests/data/acpi/pc/DSDT                       | Bin 6501 -> 6458 bytes
 tests/data/acpi/pc/DSDT.acpierst              | Bin 6461 -> 6418 bytes
 tests/data/acpi/pc/DSDT.acpihmat              | Bin 7826 -> 7783 bytes
 tests/data/acpi/pc/DSDT.bridge                | Bin 9575 -> 9532 bytes
 tests/data/acpi/pc/DSDT.cphp                  | Bin 6965 -> 6922 bytes
 tests/data/acpi/pc/DSDT.dimmpxm               | Bin 8155 -> 8112 bytes
 tests/data/acpi/pc/DSDT.hpbridge              | Bin 6461 -> 6418 bytes
 tests/data/acpi/pc/DSDT.hpbrroot              | Bin 3107 -> 3064 bytes
 tests/data/acpi/pc/DSDT.ipmikcs               | Bin 6573 -> 6530 bytes
 tests/data/acpi/pc/DSDT.memhp                 | Bin 7860 -> 7817 bytes
 tests/data/acpi/pc/DSDT.nohpet                | Bin 6359 -> 6316 bytes
 tests/data/acpi/pc/DSDT.numamem               | Bin 6507 -> 6464 bytes
 tests/data/acpi/pc/DSDT.roothp                | Bin 6699 -> 6656 bytes
 tests/data/acpi/q35/DSDT                      | Bin 8412 -> 8310 bytes
 tests/data/acpi/q35/DSDT.acpierst             | Bin 8429 -> 8327 bytes
 tests/data/acpi/q35/DSDT.acpihmat             | Bin 9737 -> 9635 bytes
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 8691 -> 8589 bytes
 tests/data/acpi/q35/DSDT.applesmc             | Bin 8458 -> 8356 bytes
 tests/data/acpi/q35/DSDT.bridge               | Bin 11541 -> 11439 bytes
 tests/data/acpi/q35/DSDT.core-count2          | Bin 32552 -> 32450 bytes
 tests/data/acpi/q35/DSDT.cphp                 | Bin 8876 -> 8774 bytes
 tests/data/acpi/q35/DSDT.cxl                  | Bin 9738 -> 9636 bytes
 tests/data/acpi/q35/DSDT.dimmpxm              | Bin 10066 -> 9964 bytes
 tests/data/acpi/q35/DSDT.ipmibt               | Bin 8487 -> 8385 bytes
 tests/data/acpi/q35/DSDT.ipmismbus            | Bin 8500 -> 8398 bytes
 tests/data/acpi/q35/DSDT.ivrs                 | Bin 8429 -> 8327 bytes
 tests/data/acpi/q35/DSDT.memhp                | Bin 9771 -> 9669 bytes
 tests/data/acpi/q35/DSDT.mmio64               | Bin 9542 -> 9440 bytes
 tests/data/acpi/q35/DSDT.multi-bridge         | Bin 8732 -> 8630 bytes
 tests/data/acpi/q35/DSDT.nohpet               | Bin 8270 -> 8168 bytes
 tests/data/acpi/q35/DSDT.numamem              | Bin 8418 -> 8316 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa          | Bin 8513 -> 8411 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 9018 -> 8916 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2             | Bin 9044 -> 8942 bytes
 tests/data/acpi/q35/DSDT.viot                 | Bin 9521 -> 9419 bytes
 tests/data/acpi/q35/DSDT.xapic                | Bin 35775 -> 35673 bytes
 37 files changed, 36 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index a4587652dd..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,37 +1 @@
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
-"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
-"tests/data/acpi/q35/DSDT.applesmc",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.cxl",
-"tests/data/acpi/q35/DSDT.core-count2",
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
index f1cf7fab349bd26e0f0fa461c715534c1426fbf5..b688686dc3614f56582991c0974f6ef1964ee6ce 100644
GIT binary patch
delta 92
zcmaEAw9AOgCD<jzN|J$rv3w&}IX9Q*^_cizr+5L!>yx{=ZJE4eC!gZB)fLbIi$*u9
n=rad6dm02ASi}dI7&tQq1O*y!00~17VFV(KIX1`hu<-%_+;JHN

delta 115
zcmdmG^wfyUCD<h-Rg!^$@xex}a&9h{TQTv$PVoXhHz#*<+cLQ-Og_bJ%N*S(HCdWR
m(uOS{D9|8A52OOb0&xxDTtg7o2+lPEagE_z<IN^KY`g%`W+4>-

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index 5cb477625e96f5526f0c7703ba3b443a0b35eefd..86259be9d1df3fcc89b780f3bae028a5ebd8bbe5 100644
GIT binary patch
delta 92
zcmdmMG|7m|CD<iINRokpamPlka&9iit1<DxPVoYsS0;CJ+cJ5{PCmtLt1F-b7L9IH
n(Ps{D_B04Ku!s*ZF>q!K2nsad01}2E!U#kdb8L?1xyJ(l#`_td

delta 115
zcmbPawAYBsCD<jzR+52%QE?+zIX9Qj^_cizr+5LE>yx{=ZJAsZCZFQAWsYu?nk>yD
mX~Px}6lf5m2T}oIfw+cnt|5qP1m_xoxW;g<@n#dAdprPA1R$^g

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index 76e8bef36fdb667447ad0320d35604031aae2c93..e2cc2a6fc9877380ef85c3540654e0691472f27c 100644
GIT binary patch
delta 92
zcmbPa``m`hCD<h-U5<f)(PSgn5&<sH>oM`cPVoYc*C+1~ux0X+o%~(ER#!j=EE?UY
nqR$-Q>}e2eU=bf+V&Kde5EN*@0VE7Tgb|1^=GfdL$i@o*_h}ic

delta 135
zcmaEEGs%|ACD<iok{kmA<J^s0O9Z%FZpFk0JH-q5+?>2az?R8XVe)qY+lc5!sQ?oL
yXU2e_Km!gSVF)6OK!h;|8%Qul52Opk0&xxDTtg7o2+lPEagE_z<IRbJY`g%l#wM!(

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index c94c1b54b3ac3085c02307d9564b258e791fcf1e..75016fd4b72aae544658e51c06a2940da31c81da 100644
GIT binary patch
delta 76
zcmaFvwa1IgCD<jzMwNkqF=ZoHIX8FrbjFzYV5fM2rs<P=xb2v{WGAoXGn)L5n_EOc
d2P_lasG`pt;OuD-Y+w;TnTJPmb0QC$Bmj1570dtt

delta 116
zcmdnv_1ufgCD<h-U6p}>@$5#fa&GRnS&T99!A|i4y)!5GaN9AtDoj4ZZOa_pC^cD@
nN79BZASlovMh~O{!~$^*;ao!y*9guv0&$JuT;t7VJZzEx@&h4V

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index eb3da0e232e4362bd5850e4eebf5916cbc1d565a..53eb0dd7d422e880a668cf3ea01b8b288004042a 100644
GIT binary patch
delta 92
zcmdmL)@8=!66_MfCC$LVczYw4J1>{#^_cizr+5L!>yx8-ZJE4eC(q)w)fLbIi$*u9
n=rad6dm02ASi}dI7&tQq1O*y!00~17VFV(KIX3I_vGD=`smT~C

delta 115
zcmeA&+iJ$;66_LUD$T&a=(3T^otMkyR!n@bQ@nuB&B@WcwoI-HlV|bTGDkN`O@7TQ
mX~Px}6lf5m2T}oIfw+cnt|5qP1m_xoxW;g<@n#l2HeLW?o*)bW

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index 6553e4c6053aff76ac42dad87d714e4e9ab28f72..9089d994e0324741190b48dfcfb4e6074ba102c1 100644
GIT binary patch
delta 71
zcmca@zrmi%CD<iogFFKR<MNGMZw0wLugAm(JH-n)UZ2b;WXt3wJJ~_VRzyGtEE?UY
YqR$-Q>}e2eU=csLK}d4*RUtNB03ZPsBme*a

delta 115
zcmdmBf7_nRCD<k8wmbs^qrgV4w}M<Qw_@Uho#F+2Zcb(tvSo5rnCu{A%N*S(HF=_t
nqzzj@P@qAK9!Ld<1>zdQxrQLF5u9rT;u^!b#+z3OvGD=`wTmG&

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 5cb477625e96f5526f0c7703ba3b443a0b35eefd..86259be9d1df3fcc89b780f3bae028a5ebd8bbe5 100644
GIT binary patch
delta 92
zcmdmMG|7m|CD<iINRokpamPlka&9iit1<DxPVoYsS0;CJ+cJ5{PCmtLt1F-b7L9IH
n(Ps{D_B04Ku!s*ZF>q!K2nsad01}2E!U#kdb8L?1xyJ(l#`_td

delta 115
zcmbPawAYBsCD<jzR+52%QE?+zIX9Qj^_cizr+5LE>yx{=ZJAsZCZFQAWsYu?nk>yD
mX~Px}6lf5m2T}oIfw+cnt|5qP1m_xoxW;g<@n#dAdprPA1R$^g

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index ff04ad360beb60571d48bd1e477a4e58e5ee9337..578468f4f00a9373366c92926b512c192dd6675b 100644
GIT binary patch
delta 126
zcmZ21@k5-;CD<k82R8!)qwYqodz`5biZSuQPVoXB3IWcZ2GLF2!3GBL9Py4WK@8DN
zZqmU977!i}PzOVFLx72aGZR+=7mI)nSYLFbias+)CrBYkk})7C(0~I-7=j2R5Mj)*
Jxq@poBLFAxAH@Iw

delta 170
zcmew%zF30GCD<iInTLUaaq32{dz|&&$}#c5PVoZH$^p)v2GLF2!3GBL9Py4WK@8DN
zj&i{U77!jt2Sap2fQf-K6ITKkOLU_Yh|L%f6llN!Bn&}>5r{D6U;_!p=z+`yu|Qly
aIM)!wHG**k1C2m@V;Dcsc(X6pYDNHVI4i{f

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index 83eec58a52b5844a02003665494f63a4ea0b26a7..39427103aadb969721257feb9af66863b25b6ad9 100644
GIT binary patch
delta 92
zcmZ2$++@t<66_MvB+0<Q$h48GoSVz>PE35TQ@nuZ?aAHTwoFb+lTUHm>I&$9MWY*4
m^qB*kJq>~lEaC%944fGQf&vXVfP^84Fai<A9Gl~L{CEMY1{k;i

delta 115
zcmZoNUTe(d66_MPR+52%F=iuIIX9Qjy_oo5r+5LEdy~7lZJB&kCZFQAWsYu?nk>yD
mX~Px}6lf5m2T}oIfw+cnt|5qP1m_xoxW;g<@n#bqKVATl)*#3L

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 9e2201d170a86652951a2a4b234bb58204010642..987a263339225c2cb5ba71cd1aa183c651bb353e 100644
GIT binary patch
delta 92
zcmdmD+iA<?66_MvDaXLTn7NVbm;jgO^_cizr+5L!>yvK@*fM#^PL>q3)fLbIi$*u9
n=rad6dm02ASi}dI7&tQq1O*y!00~17VFV(KIX15oWa9+@;u9HA

delta 135
zcmeCQ-D1n-66_MPMUH`i@zO@FV**?*w_@Uho#F+2Zce@>V9VsHFj-R2HX^!FD!|0R
ynK2+J(0~I-7=j2R5Mj*01`>?X1L*>>KwLvO*AT=tf^&^PTw^%bcyqHL8!rHbb0$y#

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index c969e0dae410763a5f749c4c4fc842ccbf901fc5..fc7598b76287648f4b35273c91e46417a50b640b 100644
GIT binary patch
delta 71
zcmca^xW<snCD<iojRXS&qvJ-dmt0()*JI*?o#F)?uTTEVWy|CxJK2WYRzyGtEE?UY
YqR$-Q>}e2eU=csLhFfy;MQ%1;03PoZR{#J2

delta 115
zcmZ2uc-@f8CD<k8x&#9Q<Eo8ZFS)o}ZpFk0JH-q5+?@QE%a+MiVX_UkEpv3E)Z|`n
nNgK9+pg@BdJ&+0z3&b^qa}7aUBRJOx#5IO<jW;jjX5$3_BXuHZ

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 1cecaa64e9ef29b5096ae1ba4882e2c8e080f0ea..85af400cdb5d19c3515f5443f27e23a7813542e4 100644
GIT binary patch
delta 71
zcmaEDbijzqCD<jzL6U)iQE?+zEjO3v^_cizr+5L!>ysyP+cJ5{PQJixD<Yr+7L9IH
Y(Ps{D_B04Ku!x^5z$3Xim4}TN0PqnL-T(jq

delta 115
zcmX?L^xBBaCD<h-Tatl+v1=n&EjO3Tt(f>=r+5LMo0BJU+cLQ-OuoQv%N*S(HCd5I
m(uOS{D9|8A52OOb0&xxDTtg7o2+lPEagE_z<IPq)Y`g%!6d>;a

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index f57a14cd5c48ddded4c5d0b7da037b9d021a9ecb..545512adfa0f9af81a7fafd353679f64f75e501e 100644
GIT binary patch
delta 85
zcmZ2&(qO{n66_MfAjQDI$i9)QoLk=iaZG%$Q@nut;{az*gXkviU;~4Aj(A6xAcp8B
kH|fa>xFtmdbiit&8&&j~L8^icEaE5c;g;Mi$RouE0OME}0RR91

delta 129
zcmZoLS#84Q66_M9EycjVSih00oLk=OSxkJeQ@nuFvjAsLgXkviU;~4Aj(A6xAcp8B
zN4d!hxFwmR8>J?n<(9Nz3kV7{h|vS72eCk0LpawE#5IC*jX+#uIM;adGj1t90AL*@
A5dZ)H

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index 8e989819a5f8c470a8933bf9b7af7b988048cce6..2771bcea89b531549557a19538606219a8e222b1 100644
GIT binary patch
delta 92
zcmccP_|1XKCD<jTOo4%cv2-I>qa2sFR7`xZQ@nt))a0ph_6A-e!EP4u9Py4WK|Bl$
r@(j@p0iHpDOk4?EJOa)vV5QNGR{G2V&YlJ!m6Jco>2IDX@5~4QhjbXu

delta 202
zcmez7aL19$CD<k8jsgP%<M)kRjdEO$iZSuQPVoYs3X`YG*~>Xd2fJCsbHqEk1o1F1
z$TLJY1b7AoGI1qv@kBQoOlFbSuV)Jg3UrLo1L*>>KwKv{*9pXRhI5@kTo*Xk1;llQ
jb6r7PH#pY~#C3;r-9cOrIM*Y($;8{qC4RG&ybU7&jZ8Ty

diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
index 03745d78de4c7e9639a4a37553361e0e18258633..b45abca7c289d8ae38faeca1fcaf6370ed621cd4 100644
GIT binary patch
delta 92
zcmaFs*zU;X66_MvuE4;+D7ulWQI5+;Iwn5YDPF)udh%4c00S?PU^k0+j(A6xARYz=
rd4}kQ0MDR6Cawf79sy?-u+r#8D}CkwXHNr=%E`>~`kPnDJ2L_RO!606

delta 202
zcmZp7eCx>N66_N4R)K+mar#ECMma7grI`3&r+5J`#mQ6U0^}T|gWW9RIpQ5%f_NAh
z<QbwH0z88PnYa?Tc%mB(CX34J*Rur#1v<v)fpmdbAg&Xf>jdID!@15Nt_z&&0^+*D
jxvn6t8=UI~;=04R?jWuQoa+(YWa91Q62IA7-i8qXA!9hS

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 3ad9ba3c987ca1cfbafc3778db889602ab53530e..d90fd4723a703df348c12a5a1c1c672b5af60a43 100644
GIT binary patch
delta 92
zcmeD5S?tZ_66_MPSe1c+(P$&rI%O_zshId+r+5KpsmX_w?G3y{g550QIpQ5%f_NAh
r<QbwH0z88PnYa?Tcm$kTz)GVVt@N1#oIMRdDksaU=x;uz;>-vDWY8D(

delta 202
zcmZ4N-RZ;S66_Mfsm8#-xOpSjI%O_L#hCbDr+5KRg~^AM?d2S#gWW9RIpQ5%f_NAh
z<QbwH0z88PnYa?Tc%mB(CL5~g*Rur#1v<v)fpmdbAg&Xf>jdID!@15Nt_z&&0^+*D
jxvn6t8=UI~;=04R?jWuQoa+(YWa91Q62CcJ#fA|8uwXb)

diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/acpi/q35/DSDT.acpihmat-noinitiator
index 8efa1c5ded52b8a9dfbb6945a3c75cdc6ef9b277..279fafa8219140687f1cdaab9739fc2f4c80ed6a 100644
GIT binary patch
delta 72
zcmezD-0RHc66_MvtH{8>_<JMQ40$eZshId+r+5KpsmW{P?U}qpCcl-J6cuo00SiYr
ZTIn+fIC~ldyII6f=2Xz%yg|X45darE6zu>2

delta 182
zcmeBm{_M=<66_N4S&@N(v34WZ40$d`#hCbDr+5KRg~@B=?U@{;C%=`KWR7k$m@KWJ
zU(Xg06zCYE2T}oIfw)d^t`mss4Cgw7xGr$63yA9q=emNpZg8#}i0cmLx`VhLaIQym
PlZm&JOZ?_Q1sg^HC4x0a

diff --git a/tests/data/acpi/q35/DSDT.applesmc b/tests/data/acpi/q35/DSDT.applesmc
index 5f01572dc2cf44aa0e730401e0709b95cd8db604..fdf6d144286860ff7f998df676ca9a50ce988d41 100644
GIT binary patch
delta 92
zcmeBjTH?s%66_MPM1g^UF?AzXqa2r~Y)pKxQ@ntq?BuC(_68o}!EP4u9Py4WK|Bl$
r@(j@p0iHpDOk4?EJOa)vV5QNGR{G2V&YlJ!m6Jco>2IDXU&sgmSo#=y

delta 202
zcmZ4D*yY6K66_MfrO3d*cw!@0qa2sNa!h=%Q@nt?^5m&<_Hur*!EP4u9Py4WK|Bl$
z@(j@p0iHpDOk4?EJkgB?lUd~T>)8T=0v%)YK)OII5Z4LLbpmmn;aq1B*9FdX0dZa7
jTvrg+4bF7~aoyoucM#VD&h?0H(h2r;j^Au0pT!6OWe+#t

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 97141f9db208e1948bc2bdb3f3452ac8f78f98b0..b41a4dddc0b7bdeb2349d874a390858453c927f8 100644
GIT binary patch
delta 93
zcmbOlwLX%|CD<ioy$%Bdqv}SkMma8*dol6BPVoXhcQ;R!%i}Td5(##*i06oRbP3{N
sV322sZV2!U3S{C+;NlT*W&x{>ZnV;84siA~0I8g;sI9;Ggtjju0OqzC%m4rY

delta 203
zcmZ1<IW>yQCD<iIRF{E)aoI+$Mma98Co%ECPVoXxPc~1L%j1!AkPddUi06oRbP3{N
zV322sZV2!U3S{C+;NppHG?;9xtzXX;5ESSbqX*IkVu83$aIO=G>kQ{QgSakmt_z6k
k3g^0lxNdN+8;I);=emQq9&oNlbd!m<lS};OOl>zt0QD+5CIA2c

diff --git a/tests/data/acpi/q35/DSDT.core-count2 b/tests/data/acpi/q35/DSDT.core-count2
index ca309f6569f1f4016cf7e67117b208d57fbc7365..375aceed6b16528f7986fad46b045eba76af9760 100644
GIT binary patch
delta 94
zcmZ4SkMYo7MlP3Nmykns3=E7DHgcV<;qsP>i4S&)7jTxE{IJH}z)K|9%_5#7-q9t9
thk-$!A-W;JGboUWD}jqgz?lWCG`i7BpE<zU(*UG$vR$qI=BKsJi~xlK98drN

delta 204
zcmX@~mvO~EMlP3Nmk^D51_nmKja+AIxEvK@;)9*y1w0idKdiBrbC3>pvxw)2cXSEj
zVPKGFh;9h*3<_l8O5oy&ZZw!2P^(|h77!HZ7^4T$1!94?PH?Uhi0cgJI)k__aIOo8
l>k8+(g1ByQt{aH!4(GaqxE^q>M|6{kx06f!=C)cJMgYi0JE{Nx

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index 622e8e5f3700abffc58683689b9470573c117cd0..a0ecafc36c57c6d4791b511f3febe210713d253c 100644
GIT binary patch
delta 92
zcmZ4Edd!8(CD<jzO^Jbl@#aRZKm{&ushId+r+5KpsmZAd_6A-e!EP4u9Py4WK|Bl$
r@(j@p0iHpDOk4?EJOa)vV5QNGR{G2V&YlJ!m6H!C=x@$cbY=tqT@V-a

delta 202
zcmX@+vc{FmCD<iojS>R`WAsL@Km{&G#hCbDr+5KRg~_Q3_Hqu=!EP4u9Py4WK|Bl$
z@(j@p0iHpDOk4?EJkgB?ldmY~*Rur#1v<v)fpmdbAg&Xf>jdID!@15Nt_z&&0^+*D
jxvn6t8=UI~;=04R?jWuQoa+(YWa91Q62F;C(S{KK;Vw8%

diff --git a/tests/data/acpi/q35/DSDT.cxl b/tests/data/acpi/q35/DSDT.cxl
index cecc1caaab81db8559781d23e45d8c615dc73740..f9c6dd4ee0502ca000509493411b421dfd23b96f 100644
GIT binary patch
delta 92
zcmeD3S>ny*66_MPM3sSoF>fPRuQHdfOiX;RQ@nty%;bg2i3VOG!EP4u9Py4WK|Bl$
r@(j@p0iHpDOk4?EJOa)vV5QNGR{G2V&YlJ!m6H`z^fw<@ab^SnaF-Y#

delta 202
zcmZ4D-Q~mO66_MfrN+R(_<kc-uQHdja!h=%Q@nt;(&UB8iE<9o!EP4u9Py4WK|Bl$
z@(j@p0iHpDOk4?EJkgB?lZ{mL>)8T=0v%)YK)OII5Z4LLbpmmn;aq1B*9FdX0dZa7
jTvrg+4bF7~aoyoucM#VD&h?0HGVykDiQk-|V#5dk&1pD!

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index e5be00b4fa658477a9ae7016ed72ae04430a3b2f..f0659716e3cef916ed0d8f583175a2edbc07141b 100644
GIT binary patch
delta 72
zcmccQ_r{mYCD<k8jT!?3<I;^>-&MH0rDEcPo#F+Yr6zN$+B12HO!iTg6cuo00SiYr
ZTIn+fIC~ldyII6f&QR6g%&+Fm2ml*$6h#04

delta 182
zcmaFkd&!T>CD<h-NS%R!QEemFcNH#2#hCbDr+5KRg~{Bi_Dl}alYLYrnWGyGCReHI
z*Rur#1v<v)fmDE4Ag&Xf>jdID!@15Nt_z&&0^+*Dxvn6t8=UI~;=04R?jWuQoa+(Y
PWa91Q62EzastqFmgBvuS

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index c4f8212c63be2a1d579d6ebc9ac41d4bd5be414b..9c52529919d72a43034b1bbf4d3f1810ba9e22b2 100644
GIT binary patch
delta 92
zcmZ4PbkLE@CD<k8paKH}<E)KbjdEOW@-gwjPVoYMa+9aZ*&Db@2D@3rbHqEk1o1F1
r$TLJY1b7AoGI1qv@d!AxfR#o!TIn+fIC~m^R8IaRr@wiod><nKidh*j

delta 202
zcmX@;xZH`$CD<iIU6Fx-k!K@Uqa2ryYD|2vQ@ntS>g1_%_Hy3x!EP4u9Py4WK|Bl$
z@(j@p0iHpDOk4?EJkgB?lUd~T>)8T=0v%)YK)OII5Z4LLbpmmn;aq1B*9FdX0dZa7
jTvrg+4bF7~aoyoucM#VD&h?0H@?`P#G~8?@-_8gC8UQyt

diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
index 05fb38820fa9213a20ace5943486ed18ad6a765c..3f32dffdbf3cd7e3791155530cf89417d8f2ec90 100644
GIT binary patch
delta 92
zcmdnubk32>CD<k8oB{&_qtr&OMma8Lg_!tYr+5Kx`N>n|><zp`g550QIpQ5%f_NAh
r<QbwH0z88PnYa?Tcm$kTz)GVVt@N1#oIMRdDkp!E)89N(el{ZjZ`&B)

delta 202
zcmX@-xW$RfCD<jzM3I4karQ>8Mma7|wV3!|r+5KJwaHWE?ByJ!gWW9RIpQ5%f_NAh
z<QbwH0z88PnYa?Tc%mB(CbP)v*Rur#1v<v)fpmdbAg&Xf>jdID!@15Nt_z&&0^+*D
jxvn6t8=UI~;=04R?jWuQoa+(YWa91Q62I9>ehMQ1mkc;N

diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
index 03745d78de4c7e9639a4a37553361e0e18258633..b45abca7c289d8ae38faeca1fcaf6370ed621cd4 100644
GIT binary patch
delta 92
zcmaFs*zU;X66_MvuE4;+D7ulWQI5+;Iwn5YDPF)udh%4c00S?PU^k0+j(A6xARYz=
rd4}kQ0MDR6Cawf79sy?-u+r#8D}CkwXHNr=%E`>~`kPnDJ2L_RO!606

delta 202
zcmZp7eCx>N66_N4R)K+mar#ECMma7grI`3&r+5J`#mQ6U0^}T|gWW9RIpQ5%f_NAh
z<QbwH0z88PnYa?Tc%mB(CX34J*Rur#1v<v)fpmdbAg&Xf>jdID!@15Nt_z&&0^+*D
jxvn6t8=UI~;=04R?jWuQoa+(YWa91Q62IA7-i8qXA!9hS

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 2a4635d48c017970ee38d14148b20d38b699b030..28a192c69af3c6df8f003bf8edc9586f0dda35ad 100644
GIT binary patch
delta 92
zcmZ4ObJUy5CD<k8s44>kWBNv}3(8#HQZeztPVoZHQj?!3+Z%X^1iM+pbHqEk1o1F1
r$TLJY1b7AoGI1qv@d!AxfR#o!TIn+fIC~m^R8DqO(ck<+#hDQRtI!!4

delta 202
zcmX@=z1oM%CD<iITaAH%@x?~23(8!MiZSuQPVoYs3X`8G+sipf2fJCsbHqEk1o1F1
z$TLJY1b7AoGI1qv@kBQoOb%AjuV)Jg3UrLo1L*>>KwKv{*9pXRhI5@kTo*Xk1;llQ
jb6r7PH#pY~#C3;r-9cOrIM*Y($;8{qC4O_KiVY(GXhAu1

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 0491761dc7132460b08b443579f0d4cad3fa3163..8fda921296e471f2b8dff8c195652841f95cbcf9 100644
GIT binary patch
delta 72
zcmX@+^}v(MCD<k8feHfyqw+?sTS{C$(lPPDPVoXR(v#mQ1u%JuOm<L~6cuo00SiYr
ZTIn+fIC~ldyII6fj#1X%%&g+f2mlYs6hQz0

delta 182
zcmaFhdCZH;CD<jzO_hOxamhxmTS{C`N-^=lPVoX>ij&_d1u!{CPj*n2WR7k$n4G7q
zU(Xg06zCYE2T}oIfw)d^t`mss4Cgw7xGr$63yA9q=emNpZg8#}i0cmLx`VhLaIQym
PlZm&JOZ?^~$~KGuBGEOP

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 485f571afd35cbd2044baeb7027ef077ba9a133d..3dba4d84369f1f2850fbdc771072519d34f58072 100644
GIT binary patch
delta 93
zcmbQ^vdx*xCD<ion<4`P<AaS{jdEPxdNJ|APVoZHdYh-pWiuLhi3Gb@#B;<ux&-ks
sFvv4RHw1VF1u}6ZaPbH@vw+n`H(Kd42RM5gfK*PFQ_$ahR3V%Z0JB9H<NyEw

delta 203
zcmdnyJjaF0CD<iIMu~xeF>xbTqa2r`X-s^uQ@ntu$>ynY*^F`y(!p*P@f`7vE<rpD
z4Dt-o4FR4(flOQpTs+Z@29pgG^y}FIf&v|5^g!A`ED+ZT&UFHDo#9+(5Z49Hbpdf*
k;apb`*A32f199EqTz3%H1J3n`ZZh$9a*5xZrVzjg0HHoOJ^%m!

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index 9c2ec9f2c96f6bdf536c28559fd804523134cf2c..b116947dacd4fe9b563ecc7e1510cdb2474011cb 100644
GIT binary patch
delta 92
zcmX@-@WP(UCD<k8g**cTqy0v%&$3+JQZeztPVoZHQj^)`><zp`g550QIpQ5%f_NAh
r<QbwH0z88PnYa?Tcm$kTz)GVVt@N1#oIMRdDkrDN>2KzicV+|tiJBL(

delta 202
zcmaE1f6jr+CD<jzPl17f@xVr|&$3*OiZSuQPVoYs3X|F8?ByJ!gWW9RIpQ5%f_NAh
z<QbwH0z88PnYa?Tc%mB(CYQ<S*Rur#1v<v)fpmdbAg&Xf>jdID!@15Nt_z&&0^+*D
jxvn6t8=UI~;=04R?jWuQoa+(YWa91Q62EzkoDCxY66`q(

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 2302de88e93a22118889cd33a8c63811925cff02..5eb6159d5f6101c0f75a6de6c83ad95ccd2e6176 100644
GIT binary patch
delta 72
zcmaFl_{V|ECD<jTMuCBWQGO#=yBwFdR7`xZQ@nt))a2Q6_Do(Plkdn$iV8ThfQ6$Q
Zt@N1#oIMSK-7MlK|B%z)JYU|K5dild6#W1I

delta 182
zcmez4@W_$NCD<k8kpcq)<HC(x?Q&d>iZSuQPVoYs3X^Bc*)usvPrf53$sFBiFqunU
zzn(21D9|xR52OOb0&$(-Tqh9M8P0VEab4hC7ZBGK&UFQG-QZj|5Z4{fbq8@h;9QUB
PCKGQbm-x*N@-~bBMn5%J

diff --git a/tests/data/acpi/q35/DSDT.pvpanic-isa b/tests/data/acpi/q35/DSDT.pvpanic-isa
index 5e4b51d33b8bb88ca2610254e6306c16e5b5b0db..908e7b6606b6141556e9df4ffd3f88f97fe13d98 100644
GIT binary patch
delta 92
zcmX@;blZ{3CD<k8wgLkKqsB(AMma7A#hCbDr+5Jmg~?Op><#>-g550QIpQ5%f_NAh
r<QbwH0z88PnYa?Tcm$kTz)GVVt@N1#oIMRdDkp!E)89N(egz`{g9#Za

delta 202
zcmccZc+iQ<CD<jzQIUaxan?qzMma7w^_cizr+5KBwaHWE?B!e)gWW9RIpQ5%f_NAh
z<QbwH0z88PnYa?Tc%mB(CbP)v*Rur#1v<v)fpmdbAg&Xf>jdID!@15Nt_z&&0^+*D
ixvn6t8=UI~;=04R?jWuQoa+(Y1T@VxY_pa8LPh|=n>bVe

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index 1723fca4464383694f806f93331d008e84b93fef..ce2c2c29c2c177071d6c1284b1c496e773942bec 100644
GIT binary patch
delta 92
zcmdnxcEy#;CD<k8iV_0@<Fbuhy>eW>_A&9nPVoY+_LCRN*&Fy+2D@3rbHqEk1o1F1
r$TLJY1b7AoGI1qv@d!AxfR#o!TIn+fIC~m^R8IaUr@wir{8VND#bz2F

delta 202
zcmccOy338rCD<jzN|}LyQGFv<uN;@NTTFbgQ@nt;>*R%U_Hs@R!EP4u9Py4WK|Bl$
z@(j@p0iHpDOk4?EJkgB?lLh4U>)8T=0v%)YK)OII5Z4LLbpmmn;aq1B*9FdX0dZa7
jTvrg+4bF7~aoyoucM#VD&h?0Ha!?Hk@ZIbt-^UC9wZ%AV

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index 1a0d6284da01addd0393b8aad96873398411895e..e9e4b7f6ed5094c5ca3635a59367eb1d88b12ad1 100644
GIT binary patch
delta 92
zcmccO_Rf{dCD<k8oe~2BW8g-vUO6sz$C&tFr+5K>hsg`&><!$kgWW9RIpQ5%f_NAh
r<QbwH0z88PnYa?Tcm$kTz)GVVt@N1#oIMRdDkuMw)8D*Qemye)$5k3M

delta 202
zcmaFodc}>)CD<h-M45qs@$g2jUO6sb_n7!#r+5KZ_sI+8?B#qMgWW9RIpQ5%f_NAh
z<QbwH0z88PnYa?Tc%mB(CJV^x*Rur#1v<v)fpmdbAg&Xf>jdID!@15Nt_z&&0^+*D
jxvn6t8=UI~;=04R?jWuQoa+(Y<fRr8;JevPeg!iCake>(

diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
index 6927d1cc96565f0e1e4c7f19fd709635873db912..6b436f9cd95776c26bec09066eb621bf97219dc6 100644
GIT binary patch
delta 72
zcmdn!b=s55CD<k8v<d?Qqwq$qNlIM)axwA2PVoZna+8-SH8XjMOx9MG6cuo00SiYr
ZTIn+fIC~ldyII6fc30Nl{7%`K5di9c6kz}W

delta 182
zcmX@@xzUTuCD<jzP?dp!amq%nNlIL<sxk4wPVoZ1DwCHfH8VL#Pu5nJWR7k$m>j9B
zU(Xg06zCYE2T}oIfw)d^t`mss4Cgw7xGr$63yA9q=emNpZg8#}i0cmLx`VhLaIQym
PlZm&JOZ?`3WgA8Sp+q#h

diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
index 4a8a4af625edb1fd01a1404e33f34e85c1a252f3..f47f09122287bdd20d7762d3d6dee6e05d944285 100644
GIT binary patch
delta 94
zcmdl#o$2N@CN7s?mypPA1_nm$ja(_6T;5VK@xe~<0?tyCD?05ByhMWCEaExh9bJNW
t7#QRkq8kD{g94ej61aE-oLRt1qZ_UCnFE|X4L~X<U+vW2T+`*u2ms=g8h`)*

delta 204
zcmcaPjcNaMCN7s?myrG43=E8GH*%$Paycr-#0NXY3wSC_uIRLvbC3>pvxw)2cXSEj
zVPKGFh;9h*3<_l8O5oy&ZZw$uyi>oPEg&e+F-8xh3&a9(o#0$25Z4*bbp~-=;9M6F
l*A>on1##WrTsIKc9nN(JaXsK%kLV^7Zzq@d&9YrKi~tUhJK6vM

-- 
MST


