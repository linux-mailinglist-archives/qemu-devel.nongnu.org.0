Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4117681B75
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:27:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMaiy-00044H-7e; Mon, 30 Jan 2023 15:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaet-0007JF-8L
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeZ-0007QX-Gc
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L5wj4RmbJOasqA5r8UahMa9G9QP4bHcGpOAHZKSQzsk=;
 b=I8jtqfJQE6TUlRVKyPGygPr8HpJP642WHS15gzrAe3lDGHn4yF5Hcx0Mpn0i844t14xzPf
 lLkqfiM6McLCE+xu3R+iruA0VOBvPFZ5q3GMZiowtP1JclEGwQKDu61GpbbbftTb+M5Hzs
 wUP2xJOvqVybN0d0P+6DxsBIMz4YUi8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-7fMts-MbOGqhhASOsZ2Jyw-1; Mon, 30 Jan 2023 15:21:13 -0500
X-MC-Unique: 7fMts-MbOGqhhASOsZ2Jyw-1
Received: by mail-ej1-f70.google.com with SMTP id
 xh12-20020a170906da8c00b007413144e87fso8125916ejb.14
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L5wj4RmbJOasqA5r8UahMa9G9QP4bHcGpOAHZKSQzsk=;
 b=vAikH251d8f7/H6XZKiY3oDeyy5AfDoooni6hxpKuSj3jsJuYgmr3hSUvo+MD6x9rX
 7qxtk6Ly0pMlwi2HT0av4H7VG6grEgiHifaHKp1+WoBVoJLhmD+zpaAaCoWIQPXfGhJe
 FFi3N8hW2wDuHISg0RhBT9pZv5HLsfvilGXwEeeZR+AEP/kBEU9ggZ5YOQT5L5PVc+OY
 IQn+UEeT3vBmWA1cw5zgtqo1FJ78HaYy+7fZR9KHbLtT9mMN1G81q2OaDMAT1RJKdq2S
 8IkiTTql1Xo75q80QwEZOaQSeM9FqBMvIAanYcT/FSL4EhnzNm4/OyT3QUBzV2uWdzpO
 2fkw==
X-Gm-Message-State: AO0yUKXD0MGRehUuQHxJd9fGDy1aQkCnIcDslvuG78rP0B0JmRwZYRob
 SzUhjsiwL4hhPx61+r79HH0MDJ/oXhG4yF+bsvBSfLwtMYrpQIdmfrtgxZV8p/WOYQgkMNO+LNz
 tqpS0lGlRpeBuNTSSXDfclhZwhf1JOsUj/Vb+d3b+FWHzt3+kYS+zn1g2fBDb
X-Received: by 2002:a17:906:26d8:b0:878:47d2:6f3d with SMTP id
 u24-20020a17090626d800b0087847d26f3dmr19202402ejc.48.1675110071956; 
 Mon, 30 Jan 2023 12:21:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9i36ZCL8EPpJl74y21DMxqmYvJ3Isk9HYgzWfbXEXMir0NQ8fyQn/HIFAku2YCd9lPBDfBQw==
X-Received: by 2002:a17:906:26d8:b0:878:47d2:6f3d with SMTP id
 u24-20020a17090626d800b0087847d26f3dmr19202377ejc.48.1675110071683; 
 Mon, 30 Jan 2023 12:21:11 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 bx26-20020a170906a1da00b00889c115cf6asm1483313ejb.145.2023.01.30.12.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:11 -0800 (PST)
Date: Mon, 30 Jan 2023 15:21:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 44/56] tests: acpi: update expected blobs
Message-ID: <20230130201810.11518-45-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
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

Expected change for non-populated slots is that
thay are moved after non-hotpluggable PCI tree description.

And expected change for hotplug capable populated slots is:
  - ...
  +                Name (BSEL, 0x03)
  +                Scope (S00)
  +                {
  +                    Name (ASUN, Zero)
  +                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
  +                    {
  +                        Local0 = Package (0x02)
  +                            {
  +                                BSEL,
  +                                ASUN
  +                            }
  +                        Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
  +                    }
  [ ... other hotplug depended bits ]
  +                }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-35-imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  14 --------------
 tests/data/acpi/pc/DSDT                     | Bin 6470 -> 6487 bytes
 tests/data/acpi/pc/DSDT.acpierst            | Bin 6430 -> 6453 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 7795 -> 7812 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 12634 -> 12699 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 6934 -> 6951 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 8124 -> 8141 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 6430 -> 6459 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 6542 -> 6559 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 7829 -> 7846 bytes
 tests/data/acpi/pc/DSDT.nohpet              | Bin 6328 -> 6345 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 6476 -> 6493 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 9775 -> 9787 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 11475 -> 11481 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 12375 -> 12423 bytes
 15 files changed, 14 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 1983fa596b..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,15 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/DSDT.acpierst",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.nohpet",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.multi-bridge",
diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index c99179b35254725daeebb416400b1b6f9f1d74c4..1bc656f2a4897d2932d593e8768173e0d2597d45 100644
GIT binary patch
delta 153
zcmX?Rblr%{CD<h-T#|u-al%Hfa&BF(YccV`PVoXx*8-e94WgU4gAEMgIpQ5%f*7Kk
z+@ymIEFe4{pbm!3f4EmL@@oYfLX`jonHVPD<dqiUa0+(yVGz&+>vjwd^<$VE$S=nO
c5&#+i5?}-g@CraQg9NykKq8yJ@CI=M05Z-dWdHyG

delta 145
zcmca^bj*m$CD<jzO_G6u(R(9TIk%$c)tLBTr+5L!s{ziQ1{_You09OWP5QwG2Jsy6
zjxIqAlY4koB%+(VWP=SXAVNGq%?uol!J&SPlLh(ZHm~De!6@Ls8f*yF0+eTBnEZfO
bRa%52KG@KOVF?3>VFY6sgBY7x`GU9s%t#|s

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index b0ae8c2cf52616836dae14c0a971f56fcfa7cdc8..0d4639906ddce689b3dcd9d749c79e3a511d548a 100644
GIT binary patch
delta 186
zcmbPdwAF~qCD<jzRFZ*#ao$F*a&BFZD>3oGPVoW`R|1?p4WgU4gAEMgIpQ5%f*7Kk
z+@ymIEFe4{pbm!3f4EmL@@oYfLX`jonHVPD<ds$A4>m+7WM<%S3U>8j5YPl0<`^96
p$1r)LkQ@(40H_Qkzz7oH6@Zup65wKji$IldF@r=lYw>;I0st<`Evf(j

delta 162
zcmdmLG|!03CD<iIPLhFvv1cP!Ik%$Y<(T+jr+5L+O99TF1{_You09OWP5QwG2Jsy6
zjxIqAljriPNJKYz$p#x(K!kXJni)78gG2ooCr=cR+q{l@1*3oiYp@|y3s9bkVe&^_
lRUHwI_+Ud9h9wLjh7pWm3}Qq#nFJdm3}j~5EW;<s4FFxJCnx{_

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index a4c82f7222a8477aa6e9bbfbfcbc73c2867f7bfa..5077adb043e8021c62e3bf1355bb9645b27e9d2c 100644
GIT binary patch
delta 162
zcmext(_+iz66_MvBFDhM=(~|?iGZ%xwV3!|r+5LUYXQ!l2GLF2!3GBL9Py4WK@8DN
zZqmU977!i}PzS?iO~Dn6W?I39P$fV?CI%6X_+Ud9h9zKz5sYCBVsJPGyZSH)XoAd~
jd|p6>2gC##=olR8$2hrARE|vmY}n+7LaLh;g@d>OKjtUM

delta 151
zcmZp%{cOYK66_LEEXTmW$gz=YiGaH2)tLBTr+5L!s{ziQ1{_You09OWP5QwG2Jsy6
zjxIqA9FD=EehiZhMdc)-o4jO$4J;rMJU}BLl8hk9&9?<sFbX)Z1{*>(0_B+)Ci4ob
bN{evB2OGLDEMWjKj9?675M#5Ea1b{De|;nj

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 783a9d7b2964612626268905837d108679603432..4c2d77b8051de2ed21fe43c8283003d8083747f7 100644
GIT binary patch
delta 429
zcmcbWG&`BgCD<iowjl!p<C~3K<=pz+Axtsx!A|i4O(9GH&YlL*P29l-2Jsy6jxIqA
z(M@jB!3Gu(9uH6t!{&e7D;W8;f(@ZcfPzd6lW+6N8uZmO1{)%jG6OZEnB;c=)uhE+
z`FM=^Q4NZ20tz6T!Qm9_>cc4D%mQ|kV{oV+!(>4L<;mH6B5VShAOj~)<Wu1jaAg4-
z1X94o1XQ6i`Gb@QL>OosSeO|ky!i?LM~=-#Dwi3Z`GbuReqaH*7ASzQniVWyj8MVG
z0Co!l$X1{z%qen6&fpb*gbUmia$pf;2gtF5oC>sfGM9iogbnmUG?WdrZu1%eO^(eE
H^s1NuJu71d

delta 124
zcmbQ8d@G5|CD<h-%8-G9aq>p4a&F140H&DuV5fM2#sH=OXHNqTr(jnfhUg~!$@_Wr
zSfZP}WG8d+8ExLcy@HX+fpu~upYh~$URmbu2FA&&_)J(qsu?Hm=JjQAIt)~3ym>3{
bf9}oUe6^gLH!5Fd-29X8HpgZ~{VFB^@bxCy

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 659ad3d6b9026c090e0d8d8e21ece5df44249ec0..ef487176e117acf8f271d0a54bfad8dfa33ef696 100644
GIT binary patch
delta 153
zcmbPcw%m-%CD<iIU7CS`@ykXocV1nuYccV`PVoXx*8-e94WgU4gAEMgIpQ5%f*7Kk
z+@ymIEFe4{pbm!3XLwgI@@oYfLX`jonHVOo<d+uWa0+(yVGz&+>vjwd^<$W<C@9AR
c5&#+i5?}-g@CraQg9NykKq8xu@CR`N0N7V00RR91

delta 145
zcmZ2(HqDI7CD<iIOqzj#as5UvcV0!$t1<DxPVoYcR|A|q4LF>FU40m$oAiSX4B|QB
z9bJMLCdcrrNJKYz$p#x(K!kXJni)78gG2ooCqERB+g!)Hf>FSMHP{fU1t`zNFnI&N
cs<a44e6XPl!x9D%!wAMO1~E2Y<qzTp0J9V%8vp<R

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index 77f42eecd40faac52e517e3c8e2528115d54ca1a..d32787aa8669517f6ebbe2e6d6f1f58bb5964ad9 100644
GIT binary patch
delta 140
zcmdmEf7YJMCD<k8tULn)<AIG_Zv}O|uEoR$JH-n)T?=sbG>C5E4mL1|=ZJT731WzD
za+3}=uz>J*fI1j97YVIk<kt!|gen0FGBHf{7m*g?a0+(yVGz&+>vjwd^<$W9C?dxO
Z60nG$>?fqcCIHqpSxZE9bCyUDHvq0iBSHWG

delta 128
zcmX?WzsH`-CD<iok30hdWA#R^w}R@PS7YLXo#F)?uLd}K8gMuTyZSIhH|Yl(7{qhL
zJGulha5x5s`Y}x2C?O{l-Q*=3Y+wPA-~k%JFj+@LWwVOV3Py1U)?h=Z7N86hL>m_q
PNZ;h!!qS_oMS{2i7_T9@

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index b0ae8c2cf52616836dae14c0a971f56fcfa7cdc8..ce2e1430a38b467b212573a896b94c306caa12fb 100644
GIT binary patch
delta 211
zcmbPdwA+ZwCD<jzT9Sc*F?l0bIk&Fgm6-Tor+5LkD*?`)2GLF2!3GBL9Py4WK@8DN
zZqmU977!i}PzS^2Kin%A`L%)#p-O;)ObnB6^2!?V2OA<3G6S{p2OA+2u`qBr1-tq%
z2xx*$cMJ~oW0<^ANR9_20MrK(U<3*93P21832-sNMW9N!m_Z`!0<J6|!#CUTJ>miY
DjxaJ>

delta 203
zcmdmOG|!03CD<iIPLhFvv1cP!Ik%$Y<(T+jr+5L+O99TF1{_You09OWP5QwG2Jsy6
zjxIqAlh^U8NJKYz$p#x(K!kXJni)78gG2ooCvW7F+q{l@1*5nFYp@|y3s9a3BG1JH
zQlKNk5g%;m!mxw^#4v&}j6sa(CX--8gt^QNlXdx2C8L}CS%Qra#<4(+V*whcvblwC
GI~M?0urSX6

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index 474c2c2bc23315f0b003b6b9210883d7919426ce..119885e89c14f2d59839d04e2d6ae67db75e3748 100644
GIT binary patch
delta 146
zcmeA(o^Q<M66_K(Uy^}=k!K@UIk&FU?U?vrr+5LcTLI3V2GLF2!3GBL9Py4WK@8DN
ze)7Qv77!i}PzS^2KinS}`L%)#p-O;)ObnA1`J{z7oPu3_7z8xIx*dZ<{eZ$kay%db
YpaCEOMvwrT09f<nKfJ1&ZTNz?0mOkLt^fc4

delta 128
zcmbPl+-J<?66_MvC&|FTcx@wBIk&pwt(f>=r+5L+n*q+A1{_You09OWP5QwG2Jsy6
zjxIqA9FD=EehiZz3d#vZH#sQ<8(2Ujcz{MQO#a8KvUwf%2S#xR)?h=Z7N86hL>m_q
PNZ;hOywaO}`GU9s3acV^

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index b2a7c042a902d1bbac79961639e27d302ad8799f..45b434d485444750cf00ebc1b2658f2fa40f0884 100644
GIT binary patch
delta 169
zcmbPgyUdo$CD<ionH&QHW79^iV*<Kf*J9#>o#F+Yt_3)I8bmj72OAi~bHqEk1TjQ6
zxk(2bSU`9@KphO5y#-e=nrQ_aLX`jonHWSk;)4xc7?yw;Mlgmkh{53$?CQfHpb0W_
l@<#y`9uN~~pkr{TALHbYB67R}5W_$MTudO5&CbF>+yIwfDo6kT

delta 145
zcmZ2xJJpuUCD<iosvH9YqwPknV*-kvS7YLXo#F)?uLd}K8gMuTyZSIhH|Yl(7{qhL
zJGulhOuj9oA`#u>B^zvD0TJQ>YG&YY3=Z{UocvHoZu4J(6^sH7tigs*EkJoDhROQE
cs?s7H@xg{J3`-b53?mrB7{u5dA{@jG06rHa#Q*>R

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index b64da36b14edd13270dfd9db040a3b99219a36a0..dbed1404bb70eebf1c3cf0f882d3b4b7cccd53a8 100644
GIT binary patch
delta 153
zcmdmCc+!x|CD<k8qyz&4W7I~jmt4AD*J9#>o#F+Yt_3)I8bmj72OAi~bHqEk1TjQ6
zxk(2bSU`9@KphO5^SD<q@@oYfLX`jonHVN}^GXYGI0d`<FbHUZbvp)!`Y}va<dfq8
b2>=ZM2{3{Lcm*JuK>}P%Ad$^!yg}Rm8F(bN

delta 152
zcmX?UxWkakCD<iohXexyqv%Gimt2aTS7YLXo#F)?uLd}K8gMuTyZSIhH|Yl(7{qhL
zJGulhO#a8CA`#u>B^zvD0TJQ>YG&YY3=Z{UocxeiZnFaS3Py1U)?h=Z7N9&6M4pQY
cq(EAPBR<&Bg<%N;h+za{7=sv_%Xx#i0ZK(CPXGV_

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index f554b0b09db33fa90d65267c2687e90d4ab7d92e..6ee52f1230445c0dff01c77e72a74ca37e5864f1 100644
GIT binary patch
delta 140
zcmX?Obk~T>CD<h-R+52%(P|@CEw`@MwV3!|r+5LUYXQ!l2GLF2!3GBL9Py4WK@8DN
zZqmU977!i}PzS?iCY}|H{93_=P$fV?CWguPd8LIooPu3_7z8xIx*dZ<{TL=6<dtIs
Z30TBWzQ?V?CIHqpc^9wh=3l%)+yE7|Bn<!n

delta 128
zcmca>bjFCwCD<jzN0Nbo@#{veT5fgEt1<DxPVoYcR|A|q4LF>FU40m$oAiSX4B|QB
z9bJMLI2?mR{TL=Y3dspYH+jhh8(2Ujcz{MQOy0w*vUv;l3Py1U)?h=Z7N86hL>m_q
PNZ;gaUg^!;d_mj*>(n5J

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index d58f4d2f0adbb86f8f6403a1cf9b13e1cabed035..578de7540f6f09c05ad81f62abd142be8cb288ee 100644
GIT binary patch
delta 128
zcmZ4Qv)hNuCD<jzT8)8$@y|xCa&E5H1&lHA!A|i4J)66^e=-_0)-whhTEuh2JGun%
zFfcGPL^p8<8yG+YfE?cg!3GFvMuyEYe1ExlIh=xBeHa9sSwKoB8}Qk(321`UO|Iut
P*}R9Zo^$gI<>^cS3y&i8

delta 80
zcmV-W0I&bMOs`A|L{mgmFD3v00g<r^cMA%Mp8;H7Q$k-5fU}DW`2iP&egRW4I9~`~
mK}1pv000932trduOaPO*4NU?;!;=XPGqbe~{0p-s8Ws$$N*3S%

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 3a01bb196b047b875be07be28d07f3139716e82f..e411d40fd1e297879d78dcf15486dd465ab54568 100644
GIT binary patch
delta 92
zcmcZ{c{7sBCD<k8rVaxGBiBZ*Mma98J2COWPVoXxcP3Ajvo~-)7;I<|&k^tF62!y6
oz{C*U#2st^6=2|S3U>8j5O8Jz3poad`Y}v?sGz)AQGOFI0QXoKo&W#<

delta 76
zcmcZ^c{!5HCD<k8vJL|SqxMFwMma8*J2COWPVoXhw<k}Pvsdvw5Nv1=&k^tF62!y6
bz{J4e6zuB55Z&a-5^Mk!XW0Bt?lvy~k5d+*

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index e6b64345e822fa632126cbc63dcdec3bf3835580..502ae9e745a3899378ea770725836da347d1f804 100644
GIT binary patch
delta 394
zcmcbf(4NTU66_MvZot66sJD@;Nsfz^F(y9PDPEw1W%4vR2W@ZmU_*m=j(A6xARYz=
zCWh!H?qCC`00W0pu&WOjn}9P5NNjSPLJ(NJAyhphcJ)k1>b1Op<{LrPGhtQFh_2ii
zs+<|Cat0*j5pJh~4K3lWVFtS1=P1JY(M@g#k$Ffyi*Di%Hb(fH4eC`^gyFWETNEcV
z@(H-IfE79hhx&1`O>R_H*&L#Lhm#i)G%Ny|(2!9P5n*!)^9x~uNH8NLHk<1zFarSE
CJzC`e

delta 344
zcmZoqyq>`266_KZZot66_;w>#lN=WlV@!OoQ@lV2<K$^_4yvx~!G;F$9Py4WK|Bl$
zObi@O!LB}BY|%}gEWrj)35Lmx@<CvghESD^aFtA$Dpg#7W*R|NGQm_b;!tP|Rmcoe
z$bhL()$c^Gp(WgIW~eKfqnrGWp}1021nhhkpu{0;608_z+is3koXj{mL5)?!7!eL^
j3>=QZp?+L!lRqk}Y*tdf!^tkf<`U)?!n8SESAiJ-)N@Yo

-- 
MST


