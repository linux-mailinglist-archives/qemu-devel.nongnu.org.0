Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507AB5FA384
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:43:24 +0200 (CEST)
Received: from localhost ([::1]:49696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxkJ-0001a6-DS
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdr-0005E3-3O
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdn-0007f5-2Q
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NtyP7ytxL9h0BfmDPBVaAKYQBVzFxNdIxa/Yf31ijto=;
 b=BEDzutBw86WpDJHjOvC4MM7VTH8bIytvWTTY1wdWomthwSSLXr+IuoOiRA2bXXCO7p++cP
 mn9/6wne6gOB11wAfmBtKGW/aDkv+j4gWenXSUrmFwwdUE+99E7YEjJUhvQjG6HiXk9UuS
 kqyXm5ni2+/6oMw6AUhAOGkxm7UlsNY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-441-lJrPybFZPOChfGLc39XuiQ-1; Mon, 10 Oct 2022 13:32:33 -0400
X-MC-Unique: lJrPybFZPOChfGLc39XuiQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l15-20020a05600c4f0f00b003b4bec80edbso7285324wmq.9
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NtyP7ytxL9h0BfmDPBVaAKYQBVzFxNdIxa/Yf31ijto=;
 b=BG2Wpg+CeXjkQ/KMaVoFQ6sCuUNuNScHB418RZVAepoSq12NMgORREBvYEg7XNNGeA
 o0XKdFGmhLZ86k0UAnN7VFRd9xv4eFwo8uGxKiyttLsjIWSYHVSFhB1MQ53+1Of+uQNj
 xn46JsxY4Or+zLlofyZDu9OA82h9SZQ6x64CshnOHVG+pn3d6VEmK6KYmUr3+cEU3DS6
 CM1DsxPPi6tQlofB/oujLWhH6mv7WhG5KVYRjXKEtI6jzzczVMr/17A/dFOfnC7qhSxD
 hEsav58OCQ/ZPVQRWLYb9+6pdIymKkGcCHQMW//BGWKdG2OQxHxhutCuttPdhxoCg+Dh
 7jkg==
X-Gm-Message-State: ACrzQf0aNPCeBxHgLlc+osRSppWamf+GWHIflgYuqCO4DaV4Ljxme2an
 tE757mdn5UxtPfsNgpsFU7MZqdT1TiL4PmJWhF1WBLQsjl79v8MqLmOW2UaJUH8dApmnrbHb0SJ
 LAQWWDDacp3KU5xNSSBgv+fjj0vP5E8gbD+/AkSQ+LQi4BhtvrFQZAW1DqcSG
X-Received: by 2002:adf:e6cc:0:b0:22c:e0b9:ef60 with SMTP id
 y12-20020adfe6cc000000b0022ce0b9ef60mr12780131wrm.404.1665423151523; 
 Mon, 10 Oct 2022 10:32:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5OIJ8a3itRHdLFsUEokGswqd9Cpp7kCXbTDFJnOmb6XQ3uTqU2mMmRfq/P494q5Pdyh80UHg==
X-Received: by 2002:adf:e6cc:0:b0:22c:e0b9:ef60 with SMTP id
 y12-20020adfe6cc000000b0022ce0b9ef60mr12780100wrm.404.1665423151055; 
 Mon, 10 Oct 2022 10:32:31 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c089600b003c43dc42b4dsm7817916wmp.16.2022.10.10.10.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:32:30 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:32:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 51/55] tests: acpi: update expected blobs
Message-ID: <20221010172813.204597-52-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Expected change:
  -                Name (_SUN, 0x0X)  // _SUN: Slot User Number
                   Name (_ADR, 0xY)  // _ADR: Address
  ...
  +                Name (_SUN, 0xX)  // _SUN: Slot User Number

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-14-imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  14 --------------
 tests/data/acpi/pc/DSDT                     | Bin 6422 -> 6422 bytes
 tests/data/acpi/pc/DSDT.acpierst            | Bin 6382 -> 6382 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 7747 -> 7747 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 9496 -> 9496 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 6886 -> 6886 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 8076 -> 8076 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 6382 -> 6382 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 6494 -> 6494 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 7781 -> 7781 bytes
 tests/data/acpi/pc/DSDT.nohpet              | Bin 6280 -> 6280 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 6428 -> 6428 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 6656 -> 6656 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 11449 -> 11449 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 8640 -> 8640 bytes
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
index 8282d449ceaefd914b419f507a13f3fb7b318aaf..fd79a602a2aaac0f7d91d2ee2b1af8f2e6cdd4b3 100644
GIT binary patch
delta 758
zcmYk(y-LGi6vpvN(>6`>{pO=-zHY!lJG6Ch2&kij;v8>4a26a~os<Key#&Qwa2DLf
zo3YJ#`W~mi|CeVt$$Gw?zh-XQHYXQ$uh;LH&E?g()i>MjK@aXy9keFc02_4YHa_A2
zaX?=ZhloQeJpJYfaYQ!~O+=GEB#sfs<oSATAzE}Tae_FZH^14PVI$gnhP^pskuO&I
z4hQbAJ6orxz}W3wxXbQ#`=#tXxX12wzLM|c!+mz2UG@PyU=KP!l6?pd*+X{OE4X4;
z^sN5>rU)F-qtah5MvUoKVuF~^ex%<_5mUOCI7OV&x5NxFqdL~}8RCp?CFY1Zea8AX
s6^I3&QFLdX%9$m+WG}Z)FNyw56})1vy8W5#Yk19GZ~XB6IQ`lC1Mb_IlmGw#

delta 758
zcmYMxJ5Iw;5QX7EaT3R|uOHWsIDTz_0#YQQps)m#6d-D|0VHZ93R)`ANU2!@h#rX=
zi5{^TlIuC5{Xd^#d^d~D;x$)UdwF&44D7Bwxp0XFWOpX;gIei>&Ngg;E#f=X1||*>
zhs0lqBg7GL>C2a6#4+&=qK#-1e;`f}C&Ydra|h8OzDArPPKn=wwm-u~bma_pd&aU@
zuH_C7?umOl=cmx>_X@7WmD#Vb_u;;{Z+wma6u<-Vpm*#;cqkqkKf*qON8(ZM*lV~J
z*Zi#ipD6~%#E)A3UV@kq|01S{De-<RUuK9I@jc=UaYp=&m?P%IO(OF-;+*&vu|O<{
vKNEST60wvsN^|BZ&aB{-c(rqWN#&Vpcr9L={TcQRyb*7<e)xWz{p|e#W3`!-

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index 9520f3b7303a43091e8c77b64d1f76407e85f1f4..bcaebed6837b0ffafe1128e1f8c2e55d4c66679c 100644
GIT binary patch
delta 772
zcmYMx%T2>T6ouh{ocR5o_-&_vY={I2TZ@n-NFdfOfd=T}HWG;jXn+P-!Init3CMF#
ze7FCnGt$hQHmA+;F^GnK|K!bP#?0!UUmhHThM+&kIpUm-5*LUIx(NFma}&|DhVc}W
ze&TI?eKlBc3vRJnqtkb2ocA`|X1DeJM)nTeVRzVXr}JI7%kFC5%HD%}>>j)9eYnr=
zYv0K}fCucs=xQhX5FXN3JUw587|}YJVvHEmo5Tb$p-+h^VoF^)%@v}eSBXo+C4ETD
z5HpI^^iMfr&iBamJ@4e61-xJ{MyEeD{Zk1q*-O3O%f5nF>=nDbQw^`#Ywh>4Z{Q7k
e!!G+4-m<sa53=vz9eX#rI>>$nU%mfk#^pcHH={rR

delta 772
zcmXxhyG;W@6ougnT6^E`@xFImfD<f%O}fH31PMgECC~s}+(s<X01eOp5u^kbC7_+T
zC;dO2k!I$+J#SBsQ8GTiJb0Efjfbaz$ReJi(ZmJfg7}2EL|hVI#AB)FHlj_=G@obl
zPr7TbuO>&k19!xo+4(!R%-)5&;;!D`VDG^_anJazobSVZabNom`v4w@2gb1v;h}h_
zeUE(vkHn+d)gJp89ut41@_Y$mLcGZ&ridx=8)Al-5q~1)h&l0)%UmHU;#b5K;)?hK
zu|O<{QzidYB9?NGQs46q_pIQRcr`o!Dfy=wUW?ayf55(hH{y+Pyi*Hr#ar$7*mv+w
fyfcn{5AVf$?MLhf_#i&au8!ER;cI&TEv(CbKs2L3

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index 33169838bed50710495d45e0d9486ac59b4e504c..973320cb25120818a45ddb3d8e3b3211f0c00adc 100644
GIT binary patch
delta 760
zcmYMxy-LGS7{>8PlQvC1@^z9lP1;<79|frpkQ8we2gSL&SK$o^!n+9$u1*Cnp;yq+
zMQ|3p0T<1ApPqLL{C{}}=VV)N>&<1Ht(%LRp=EU}x4FH$_B!rbKj>AR7AHq*7jDCC
zcAI@^+<`mnj`oG@yYMc1w{^9UeGlHFXVnDwsEg>*x5PeTpX$WC=^=XbC~<%|pihZI
z#33D~W<Ek3(SyV>;+S@6v%e=F(dTpc`kYHSX8;e_gVt%2+53G657|S#Ka+g~kJux2
zxu+N&v&Y&S*(<nWSM0J+;0b%8eI@%8p0cN{tCj3Cct&rzxxNYFgnlLFh&f$N&6`ui
tDZNN65DWT|SR$5mUYPj|aYj!P=ZJIqD$IYX5Gy`M^?#1z_xtkW;13f0o_hcQ

delta 760
zcmXxhy-LGi6vpu*P0}<?o3A%X^U>xKsurX|KvKj>92Dp5UWGRx2xk)<T%8JDLa(5s
zi{LDH11>dh&a?i1c_`=YuHMz#t0-;m?r)rd-8PrEF42JORtJ7lXT|ApYil>)hPcuD
zTHJ)2;->Z$_7>a{w>noV?1%6n@r!DF{i8ObP5gs6LL3p-v3%(uI>b+iW5hA>7ov;k
z5-$^(PY@@>kBC#mDe*pO`gigWJ-Nfvcdl`#5BJ6W&Uu>}{XT#P;(^|uV;{mp@vwKi
zQv{F1Bkc|L3a-Re@7TxiSUlFg!9IZ};z{RfgMA85iQhAMz8T_-_zy8d%!sdZ`7%e$
uiC+;5#De%2u|zD1FAAB@5$D9uhzrC8@pmErQ-xT`9o7FGCm#>x=g|R&$ew!u

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 407066e1ac46922751969b823000e4fdfa542662..9583da4e4f558cb0bf6912733fbe8db7c1ad255f 100644
GIT binary patch
delta 1438
zcmeIyOG?8~6vpu+O`9}*B~6>8P1;zT3T;t*fQX@v3OcX|&bkFRAkGExaVEu?I}o}8
zHy}<N3F2JbgH7(&dt8B|PCEGg?@7bqwzKhU{Cr+@rpeK%VkVQb6UCgSpLFkRM#uVO
zusb!=SXLBO98j|Z>f*q5I2_2TiE3$CwlvXsI)|PUJ(qU6tLZkLuA}R8)lQa}2j=OG
zu>dSkFHC%l8$d%m-pIawi(k(~H$^wo{t)TQ@gj0j<l-XlxIAqkTXgNnmn#8F^ubsL
zmT99dPgZ~xx@4>ZtMtlP1J)>Z<+u&B>4MP#I`qO=2iEDQE5}`+O9!#U2CzZ5j7?yZ
zz8F2AN5eI_ZXf82efinCN4&5AJrF%eJJ~(C?-qJX^cFpNfA`%+ZquVDUpWMZ^vxIn
yBii@n$qukXH;i3imp&O|U_9>!huZSmt?pv_dtcqf>~HV??;`bsz4>VUUHt`{a3nzh

delta 1438
zcmeIwOG?8~6vpwBG;Pz{SJJde+N6!esn8b12Z$KzsGtLj;H+D41L9l|A7@gWxdWjq
za0BARks!{+J=i4Y!zDQBq?F(Pp5$`Kd@`RrpV#bodUitQEIvA2{wDwV-rfw4jp=ZA
zW+qWfV}(e|4rt2*+rem<Riz{ASyp=1Wm@IXbJBB3=exRLB~Modx<P!^i8IUt^Tcn!
z0<b{b4`MGJF9M75_+t9{EnLq;H>I0Ne+Z3iyo6kmTw3NG2h$2!5ntPKxiYX!`~j>0
zE5sWOIavi(i7$aQV2$_{SO?aLBS*$9phbKEw1GD93$Ouf5dZXK+yOeo2a#YC*d)FM
zwty|-FQ5x_iAQU)ZV%|mzPxnZV=T-^_oe$uXR9y!ZlkxQxB1Ea+jj@KL;UE<l>=Zv
w{0$6&A@RN^C%eEd@eQyC>=AzgBVa^}fq$s4zQxtIsQ&+3<bl7p7_Yx;zlqi)K>z>%

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 013de154913063ed1ce3f154444b9e11f4608eac..27d1fc90f5f51c48a44bace866a19a42d7170129 100644
GIT binary patch
delta 758
zcmYk(J4yp#6o%nQCdp(n_sQHcw=KjX7Yo4wwGb3kY-~n%;1=9~Ag2`EfK9;FSlI;x
z!3|iL%=z*ktAY37E6)7u*?PA6a^j{wzA`(VZbz@LZ!V0k-n1XObQi(2(ZL#6qcgX5
z5qpR|dXd;i?9;cz0pfrTJvG-6b$XIGL>$tmL<7;FsjucE#1TFE_3jK4(d0AC%^CA-
zzEpQuaEsmAI^6}@Zg0bFcDvm#WbeQocBl2F{3jRgvb*fE_uwA8*ZP6%eYnr=v&%k!
z2kZgehyR~x3?9>MsD4z47}A@>2r;5xi7{eK=aHHxhzY$)Oc7K1kvKt|&{3@B8Dd7y
uv3jN)G3PV#_RJGGvw#=u#n$N|QO{JuOZKwepUS?1SM1fs_usAbWA6{Dl9@*U

delta 758
zcmYMxJ4ypl6vpu*nIx0RJnqb7UYXYxVv&c1;DA~P3Mw`>qdRa5Za|Pz3U0tA;A*Vw
z0)pTMEKKg458MBbuQ>N^=9~HY%S)Q;n+vOFw$1UCP1GZ^)qyY7GMu%hW&>;xpQ%Ra
z*hlOWzaS0}2gKiqL&PERp)Ye2(IkFC93hT~KM^fNi+C2ue2h3IehixK3>(pwGwkgd
zi+r(?I~=$p?(CfJLZjQea97;b`z7`s+!Ob-ukcO^uEbU6*!yr_+}D19eE<){gU+!J
z;h}iQ_tF11O~4c4+ejWNLX3#t5M#uc_!lujOo-28nWu;;@hf76m=XUVP7$ZXM~TdH
x#GLp!k#8yx3pu0EXP)595?+dzJLiW~zNvy&;+5W?Vqe2+@p|j~?@soy_Xi(rnMVKs

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index 289ec07c07734f6fb10e1f1f3de7b3de2a4642fd..efa46bc7860f0b026f23175ccf3ef1e1eba59c15 100644
GIT binary patch
delta 790
zcmYk(J5Iwu6op}nIDR{^<M%6pmMRDcbde#nNPuX`0$2iDh=jyl080RgmPN4y@Z6KR
zwEw3w(#-7EyY=U58g2W{eP9?P!|5L$Z@m${r~N*fh$j6=93zgY&-wy$3(<16!zmUW
zm8<6Ta_hitxXo@4PKUX<-#c)J-BJ59*}HI;-Bo_R)aQF}kKJRJy$|=<edR0J2k?MB
zV3&Oe581;%zer?00Z*td_3KR$r}Qi_LX7BJVvHD5Sn2r;aYj!P6U2l*B&LYzTdmg_
zT1I!Z{-qo-=Ue3JmREAi0$#8egVVCnzf{6Y_EPPyWnaN7_DcCio~ee{>@~aW8+gOs
mD8G??3vbz5cG-9Ej=iIk?*A{%!E-w9^g}HW7hf-3eDDj{aG22m

delta 790
zcmYMxJ5Iwu6oug{;@IO?V#n{Xoj^+!1O&Rs5LzTaw0Hq5fh|Nr;x2$CfJDopSOR!_
zk7)l-XQY|gZ};2J*EH%L9&f#g>bu>2Kr|tKPrET%h!*h=;uLX8++|&1<~E{Dsvpj?
z`Ka8~r<c7l?!X;!XK+5ut#Pm5N?e)!8TKyR6?cuFujPCX?umP&WADR#ao_j``v4w@
z2cu&j!b9=!&o2_pXW$vJF6H&+h;!m+#0W7W{zi-uW8$!q`2ul4{DhbwCd40zDPl@*
zTGkm_MtrB`mvY2hZjqZ?Ug4Gnybv!2=XEW=RKiQ~((JFXui%w<WqgNc(r_)VN5{T~
p*W$JD8|)i+Bi@XTeG6~JTRv(3e`yI`5+AqnP%Fe0eZ92t!7oipn9%?L

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 9520f3b7303a43091e8c77b64d1f76407e85f1f4..bcaebed6837b0ffafe1128e1f8c2e55d4c66679c 100644
GIT binary patch
delta 772
zcmYMx%T2>T6ouh{ocR5o_-&_vY={I2TZ@n-NFdfOfd=T}HWG;jXn+P-!Init3CMF#
ze7FCnGt$hQHmA+;F^GnK|K!bP#?0!UUmhHThM+&kIpUm-5*LUIx(NFma}&|DhVc}W
ze&TI?eKlBc3vRJnqtkb2ocA`|X1DeJM)nTeVRzVXr}JI7%kFC5%HD%}>>j)9eYnr=
zYv0K}fCucs=xQhX5FXN3JUw587|}YJVvHEmo5Tb$p-+h^VoF^)%@v}eSBXo+C4ETD
z5HpI^^iMfr&iBamJ@4e61-xJ{MyEeD{Zk1q*-O3O%f5nF>=nDbQw^`#Ywh>4Z{Q7k
e!!G+4-m<sa53=vz9eX#rI>>$nU%mfk#^pcHH={rR

delta 772
zcmXxhyG;W@6ougnT6^E`@xFImfD<f%O}fH31PMgECC~s}+(s<X01eOp5u^kbC7_+T
zC;dO2k!I$+J#SBsQ8GTiJb0Efjfbaz$ReJi(ZmJfg7}2EL|hVI#AB)FHlj_=G@obl
zPr7TbuO>&k19!xo+4(!R%-)5&;;!D`VDG^_anJazobSVZabNom`v4w@2gb1v;h}h_
zeUE(vkHn+d)gJp89ut41@_Y$mLcGZ&ridx=8)Al-5q~1)h&l0)%UmHU;#b5K;)?hK
zu|O<{QzidYB9?NGQs46q_pIQRcr`o!Dfy=wUW?ayf55(hH{y+Pyi*Hr#ar$7*mv+w
fyfcn{5AVf$?MLhf_#i&au8!ER;cI&TEv(CbKs2L3

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index 59a6d5860887b511b7ce5f17d7044a08c14f0f60..67b60cc44a6ebff029524abc27ef48f90868f948 100644
GIT binary patch
delta 791
zcmYk(IZnes6vlCjcz5D`ca|$eW^E`8sgOV{qM<Q40!QEiG_T|cG)TEmxBy3>fXw^i
zNBjTj8);^??Y8|~`(fX$?#G%o((LZx@x~p|i{BN9I-+j(JJabdI%(Ro-i8}+gWcFU
z-3I!8Z^BJ>Q|%9BZ^12gOZm}qINyfb>^8gX9k|2pC_k3H3wPOFcG-JykKOz8(?sTD
z@R+WmZvRjd#0kAi^bvjfmKY!gbRG}$5HX}Ti4kH%UlL=)n3l;fPY@G&O@?nu5mUZK
zs;=3|H8Xg|p6#5T)8U(Pc+Q@y{e|occ)?yMzm#_>;U#;?F8c~zu~*7hvajJad(AHU
m2HvnYw9fy3(-b_Vr+j#*8RCpSB+e1%^doVBxY%45(ZMh8bDdxS

delta 791
zcmYMxIZnes6vpu<VmsdAeRq~CL}qO$45^SnETW+?IRZ!E0yMAW2sB8!Pq+X_pa9Rj
zPqhD^KT9*S@Alp2Hi-I%#~XKI5B=ueCz=qy1bwNZfoPCDj9(di7oW7<*<dR-;ikAb
zI^Twd-dk`>+*12P?5FUl_*D7PTK;dtZE;&W_72<;ca$Gv@4{ViS3C9|+!Ocy{4~Yf
z2m8cVaj!3GhBzaBM+^`H;%~$dF(f`uWF8?##BYc(Vodynm>?#^>s00`VoLm)$}?q%
znH(ci$Lw*;9G;8kqw{kn&s4w*@j~q{urJ}Ic&Ypn_f)|v@k%@PHM|zDm2a?b;Ei~r
q9s3sEinqKi{-0?Mo)bS6a#0J!1@Q;s5^+iVgSbLm(eAp84}Jk;O`Tu>

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 47d63dec8f997417d7512a694a4825fee874d995..084957e53fb51e313dc824e5a8733f02ff77542c 100644
GIT binary patch
delta 759
zcmYMxO-jR16o%nS(>6`>pPQul$El;*fmZ0ifH)LXoEn@7f*WuPjywxda4NU~H{b%g
z4^7V3dq#ox;TxQr-FCPAc#P7ny|}SQqw&aWZ||<GvDpnDI#egcdexb518%Szy{q*`
z`vg9rT(v$%Q^YAfNt_|h=u4uBXp$4_`5bXh_Yy5ci{2$J5EpNWUfXCkT_^4SOb5~7
zGo0bfQ#sRxyX<c7v`UTr-h+GW-mu@u-iQ0_KD#_q01w!M!OvtL!bA3uUG@<?Vvh!I
zWv}3hUG=V7*~jphjxzmH31UJo5>v#Kek3jtmsI6?o*`!REHOvS>04rfSdd@nd5Kuk
nL!tjug;?<&)o|yf+*!kG_PTdEFZF+F;0=58@5i67<?q2CR<o2j

delta 759
zcmXxhJ5Iwu6oui7;v|max5sw;7A;js0YOT^NQe>%5G@uR5)vC=3sl^NfJBSL2G{@#
z$Uea1d)oigDelaEx8Hp{Cb_=7yK*LWuP<&~q6yi(34Ewds?EB$jazU_+!|bMw&GLx
zl(<wnG@}{fjQ9z0jyNa&LbMTWVlS2X0&zinkLVye#P5hp#3j9DvUbs2;_FP0XL^X9
zoZ*=>PjRLX_r?9ed7WG1K7a?}f!S}d58<JBI69swf=A+!@iXjWcq|@|j(q}8#1rEh
zdj(hGYH+2oPvI%?Q6VptA!fuch&f_T{DZhcToE^=%nQVV_!+T8EQ!AnE5wR8tYlsz
p*2E8${8NM2$Q_Nj^AdNq@K(GXoX>0drw-nUcmIC;`C9)T`~k~;lsNzZ

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index 47e4bf62ebe742304783e76984045d7322c3a421..46827e285421d4fb38160f6c15dc9134d7da5446 100644
GIT binary patch
delta 770
zcmYMxO-{m46o%m%3Y7l;(LxJ!3osCvnAilJ=|JPeNp%Nq!5N8(i8(_PH{d`LSL4VH
zn79E4(tAGcnZ8fIruTNc*e-TYUf9%|E7veOhE-qRT-qIa_3A@35l#A$*hTEpiLamR
zA@=B5Vjr<j-x4iEi{^oz4-g0R7}PmF$wsuTru{OT?&D>7ylyPG19#Y+*6A)Z4|^Bx
zvb$=(l)VS{*gfT|xqiP7_t|}R*$41|Jy5=ueFzWPLw4Cm@Q6Ly`zn!n436nG))$o^
zCiE^bMNH{W;t+927m1!{h#9>}%n@_?l{i8i(P^sZW5hANr201%hy@>`P{-WJF-v&K
vUbapTL;ag3@Co}w?ayRCg-_Y1%FpGVX7CyNj9vB>ykf8RzWDsezK;F@Q0JT}

delta 770
zcmXxhOG?8~6vpu*P1`i@ciKF+&<t!l5e!skI#8TAiSEEHI4cN(oT1<b99VEQj@*FY
z1{~PjoNxO7<qNqtyJpwypKPzazPU6;de?5RETR$dtKAM!L)3_W5XXpP;uA-noFGn!
zpAn~sQ{rz#9Z@G<x-y?3&WIn~HdUWwAR451{WltXAFT4@O{Xh2;ikCRJKuTQu(#lr
zxTW?h>}|L$ZYy6e<^2xa5qAd1-i5p3uJR4`9^4c62FKoq`{Mq=*CFNsI3T_a<f1~v
zkoX-jLX3$25M#uc_#%{ff|wA$A*P5a@h{>WaZY?1$$WvhAbyGDH)V*K93xZ5+~Sxy
vJQvS<=Z9E+Qvol;3$;JPzJ!<JrSfy!Qw6WYtHH6a;k9^u@aFR)`8xUs#j>0!

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 1c4e0c80216b53463fbec8fc548007f0326c1829..ebdccc880def932fcba0cef8a7cf47ff7cc67f53 100644
GIT binary patch
delta 791
zcmYk(J5Iwu6op}nIF8@(D}KaDyaZ5yK!*&WLlhutZ-pfw-8O81Du|AXEP*Ak0X9Gb
zo_jKv_Wyh=&CF)GS#Fy!>e}_4Zx{o^Ztov%-2okj?LL}_COt|VA`a;@YzxdSM9c2_
zzgYAduj=FT&W4ZRBlc16v>luKy$!e7ZM8p<y#sgH9p$G-`u{H6Wp~+S@4-EGPx(sr
zKHO*b*<~NV1NPw0&r+F(;E-NoeS2fXG5tu45F@%t^p`PWOwSS%#Du;jridwBq<Wqq
zX7nU+f;geCR6kRWnDa4mb<9gSW&tnQi{9xY)6Z1GOZHOjuVi1rEA~qHTJC8IpR!Nc
rWnaT<_FDP1>}T*9`;1-obNHNnPP_d7GcCXide8OkHHgidSHuUuW5%QY

delta 791
zcmYMxJ5Iwu6oug{;`sfx<G14_1O*6m$PhY20iyO+SOU^*!v?5==%`=`EP)NM0UGf5
z9?|}vkENN}t#|8v=ZF2>{f#{{hkkqO63vKLem_MGQ6qjpoFmSOKm9&ea~)A9a~S`p
z^Gmd;kIn{DxdAuCjnR1@Xw%+=o8qS0A7gL9Epbcv$)Wt;hTG!y<k&lKN8C}q!QO?t
z;_l?wdvH(O`}5NTb06#zKSy$V0b)S>gBT))#MiNW86if*Plz#MO#F?QAST4;iOf^P
zl=u;Gfw&<4O5~X`#7vHnsbgN?m^nNb&qwF?RGz7T7vhE5Ut(XvOYu_q7WY)aEAeV_
r>}z-}UMs)CzJWL5&E(j(@K(I#kL>@Mmf$7vTPC;HA$IiY<k7(|*pZ|D

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index f9a5164e0cba7c209bd3e52020cb855e8688f682..f9aacee095bbb62251fc8231532f0d6e9f555a58 100644
GIT binary patch
delta 838
zcmYMxOG?8~6vpxNou+x*v`N#vS~nn6s5Kyhf$G44h~l_z!3{_q3r^0kn-E-x8xX{?
z4qSpw&ewZ}`Tz2T++?%ZEZ)8yYhA8x4YRzvzos9j^r}nSFdCd1bn2cfv?e#JNiS}>
zk1fO&eM)R2w&~E*cXkjv^dzy1*rgANJ;WXzC_Oh3O?p&igjeb#_RaO~09Kz$cbOi~
z*CyP8TkKZlbmO=8`vH8wKB)Ig+1qfN-DWTJ^BuUu?$mxFdl&AqyX>;};2yhIdm(!T
zSL~|tppd-}_vvb+ztj+MNLz^`#1Z{U3=ji43-mlh4Cz(k7;#Kr5+lTj=AoWX5GV8;
z>i-lY#(a*rKIcl#nZOhFq;h%~>;II(Q}(ppU&ua#XY3ife5V|qv*)#6%6<x;vQOD%
QKZDQMXFET7|BF=fA6I&(EdT%j

delta 838
zcmXxhOG?8~6vpw>^p)q$ZJRVr(}x=nD%2Vf!9aE3Ktyp|x8Me(js+)Y*i8s7#0?1I
zSO+e_-kb9c^Z(@wxyg39UA}!sesy<$P41>z-||mX#pbeMFGHdR@u@o3ruhz{L;Rwu
zIyMoT#Gi;Q#1`>kEO)jM+r&?Z9mEdt2VxhoOMIYZ?jpLxkGjh2D|v|C{s873J+9QM
zI9_aA>pt8U_l@&SuT}2@cpx6w{R;aK9*T#xm-74w9*IZRPq0^TC9Z16K8DBQvGo#r
z4cFq@cv52DgZGH92J)r)h<)N6;s9|#{EL_%Cd6ln%u~da_!V)8I3)f;%n&o;MJn?V
z;)wV;mH(6@=5mhQo^y?Jj^ShRv2lJF%6}^0g?M527uZkW6Y)vy_)b&!RD5dv68jl^
UCO)ej`#F3rKHvM%`(LJ=f7IirEdT%j

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index f8a0bc150f5a249bd5d09be6949c97160de1ef82..37ef245f673bcbd5385cb332cc0ccf06d5355485 100644
GIT binary patch
delta 846
zcmYk(y-vbV7{>9o6k5txODW|W3}Uc}2}q*oWQ~K9gT{f0cmpKPCf<PKyLlBRPE6i_
zi8o-p7U_8(&+F3R|I3r~oU>hRS8uPQV4Ysw8g6=be`C1o>`U|Uf__F$lu6kzOjc8=
zxziJx?b$KZV)ZP=o|SobzFfQT96ZOKQ+_<tZo_SMn_c#Kc%D74d?EV+yue;ym%Rgb
z*qxo9hB9}-E+ymC$3GVli}WPXL-goVVhOQC{e3+zBbI3+v4U8k4~bR8D)|#VuOZgx
zVUqq`vybTWF?@B*r5rPW2kb%Sba9}csSdBR*VX<^_8~lE50$5KPYrm3y}>T~2p+LV
z$}eT#gg4on?6QyHF?&qu^#3!pz%4qT>WgY4w&_J;2eCun61#|9Iy%(z9%7H4CH4{f
V^d)hCIG|CY=R?Hd`(tu#{Q@-vsJZ|E

delta 846
zcmYMxOG?8~6vpw>Jeo9pB~8=x-AJv}fY4gd>d1%#M-CJR9ThhqI2PQ1!!vUgf}@Vy
zfZztiwV2#{KAeQ`|M5ZY&2F>XyuT$uc6Wb6?l!x+&7Z|PFQ+U1O`NEZl9C!xNoy(B
z6JG3DaiN|8HZ*%i;e+LR>nb<lrnss6cp+}VEpbab_BPxWx0SE3FT=~?W$oBIa7Wz9
z{WQef1-r!QH1pLrR}d@2&xjtPNBo6YMXVB!_GMl}tPwvV))DK(pNI{_2C+Yrc@wco
z{4mS(HT#IZ9K%<~T;rGlJP;2G=ZgdRO)Yp!yruSM*oW{?JXD_Hp4#xXcw0O65j+x)
zlwV@sfp^3^+Odz}v3Shc{Qoy~!Cm6>xm;8au}A!h*hlOW{~!(!2gFB*G9MxiiC+*$
Yh$G@}#4+NSI7wwbL7dRXQ+jRu0kUnVx&QzG

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index df91b798f79d4564b049e8a7dbeaa5bb99abe635..e9b67e9ebe1e3b4de513b68129f719018ebeeb2f 100644
GIT binary patch
delta 41
lcmX@$e873bECsH3N0%T54#(h7zsXjL!IQr$SfUEG0RSXw4F>=K

delta 41
lcmX@$e873bECnvd;7~sXj(A6xpvhK>!IQr$SfUEG0RSX+4F>=K

-- 
MST


