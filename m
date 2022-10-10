Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1055FA3BB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:54:19 +0200 (CEST)
Received: from localhost ([::1]:50206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxus-0000VV-7V
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwe5-0005Lv-AV
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdy-0007gi-Op
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IDBo91oRwmEPRkeCAunt7k0JY86OJfBlL6lG6/lMqdA=;
 b=HUuNTp3yHiWDhkQ3983sfeb9cYDblqmAaGw5yfIzyQ4sbPhlGWjshz3VbtSEWseLfzzI4X
 ezPi5E/fQ89EDh7h/I7pKRvDXrbejxyRBJL+QHQ/ufZbsl2ROzvDyCr1YYQrKhpDY6tjx3
 Lcx/lZ6hmJvbRb4nPMsE/+olZXmCBLA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-2E9kfM1qMAutGGHXOTS9UA-1; Mon, 10 Oct 2022 13:32:45 -0400
X-MC-Unique: 2E9kfM1qMAutGGHXOTS9UA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n6-20020a7bc5c6000000b003c6bbe5d5cfso1409766wmk.4
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IDBo91oRwmEPRkeCAunt7k0JY86OJfBlL6lG6/lMqdA=;
 b=ufQsZ3osvcQjC4uiDgzxKKZjgFliqIyViXljmz1GTae8m+jxJQDUIHI3vPWfZ65sLD
 G+83DuJPXLEIQJe5g9n82v/fzyLPHYucITW/FbXZ8dXeS0JOiUszLyzWuvaZh81QRNuD
 0vkMbsdTmLvdFsNd31oR0fQazKta2BFZMCOoo0jye9KHXWpZUxcLxB6CWR2jTKWZgstN
 Weo0Ttm+bRLYECbojVjRGUdldC+34YZwgsp2NpJx84K9J5KKnRUpqVOMjuI8u8yw7mgm
 6dM/D0PiHCx8SpHDacG279iDapDRTVXPG6noNoloYesmrqHjejJeTYX1GQEcvlN+66od
 nYtA==
X-Gm-Message-State: ACrzQf1DJJ1hJFmHgU9lI4Mk2qA878sHwyesTk55bmbj/IVp14rQSx3k
 CilvZcH2krFsdkaVgWYkjcN4jiYH/E9mHmrEH67RFg9+mHN1rGJpOfH8VxidC5RMKK9xxMXQo/j
 TQlrA5EPlS/XAHkB8rSi1iX49hdmSG2qhq17oPwVUhyzxMEaJrq9zF/AE2R/C
X-Received: by 2002:a05:6000:4084:b0:22e:5b99:4c4a with SMTP id
 da4-20020a056000408400b0022e5b994c4amr12940457wrb.538.1665423163458; 
 Mon, 10 Oct 2022 10:32:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7htTVbQLL62aRSOs5W4Hchx4ZFZdXo0mOxVIoyRdt/H6Fp3hQmlGeTJ4OqGW5swOHaS3NPbQ==
X-Received: by 2002:a05:6000:4084:b0:22e:5b99:4c4a with SMTP id
 da4-20020a056000408400b0022e5b994c4amr12940425wrb.538.1665423162923; 
 Mon, 10 Oct 2022 10:32:42 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 n25-20020a05600c3b9900b003c6237e867esm4627655wms.0.2022.10.10.10.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:32:42 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:32:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 54/55] tests: acpi: update expected blobs
Message-ID: <20221010172813.204597-55-mst@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
      +            Device (SE8)
      +            {
      +                Name (_ADR, 0x001D0000)  // _ADR: Address
      +                Name (ASUN, 0x1D)
                       Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                       {
                           Local0 = Package (0x02)
                               {
                                   BSEL,
                                   ASUN
                               }
                           Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
                       }
      -            }

      -            Device (SE8)
      -            {
      -                Name (_ADR, 0x001D0000)  // _ADR: Address
      -                Name (ASUN, 0x1D)
                       Name (_SUN, 0x1D)  // _SUN: Slot User Number
                       Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                       {
                           PCEJ (BSEL, _SUN)
                       }
      +            }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-17-imammedo@redhat.com>
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
index fd79a602a2aaac0f7d91d2ee2b1af8f2e6cdd4b3..da2a3e5c0551ac2d1d8a0a40b92d3235d5757475 100644
GIT binary patch
delta 864
zcmY+?y-LGS90l-*wn@``wE1k(q;(Y(B-P?1MB7!t;^Yv006|wlL088>7hl5SE;tLi
z3i=2>gx-Ho@=w;o@1A=($vl}S&l^U*um-Y{%}$Th)%@PD^9v&oS$<=L!P&#{+AP`2
zlq{W`Xp+>BlvKzDiT6T`woB23Xp)Fbbd0z|hLA~I7Gj4x6bOaHYbm&+1<@j5c5urs
zcc>65iStr$M;oF|Vo``OcW4lr5ZFi)8!dMkbC(XOSENpBK6YtMoHi)?sbwZ*TUOO|
zD7&j=UCKUdnMK*UT|H}4c3sOHku6`H@~d6E+NA})ZLD~}3wRJ7iA|>v+~Gs`ByJ0F
z$Q?b19*K`qa7O^K{O^V?ZkcdL2oX}pRVlcm578&_R){HgL=ce>_#P4OGUcuqGOoy&
XR(<lSOAjdft!2ai%z4@OzgGSL?0V1k

delta 861
zcmY+>%}&BV5C`xYDJ`Y+gVL6k4}0}MLaGvD!l4LPO(dQ?G(G|^K%!R?FOzWLB{V(=
zXA=@%fQK-+GdtVsKfnF&?#wpd=AW02VV2A12kRUPH-Im12(M0pS&g#n<^8d?%x_Dx
zEap$Prs<kloKETDuud@fhgV|>>j>*`=ccE66kKJXFkqvKYwj>nm~f~F?r5NBz{pc>
zx#12Ag$3)1;EpDWChS!);SL*x4VkapGU1LEiWaPdfQ?VXbZAC!keMs9QJb76v$f28
zneAoPmRT0i*+6D1nRO@=ODy=cA-*;gOAM=U#vhLmMgm3z#V%*u7$b~f*HI>P&sAL%
zT{u<*cO)nhn1)KnoI6q!DST7}cl1#7;8zt3?&zcF!#GlIS#ZYy#Q@%ffL%m$9?}Hh
ND6<R7zNhie*&o-A%ys|(

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index bcaebed6837b0ffafe1128e1f8c2e55d4c66679c..abcd6d9d309a8f9a9080edc64df7a6c195b5885f 100644
GIT binary patch
delta 766
zcmY+>y-LGS7{>7gY;&wN&B=GFrh}t`);d&hNp)7RI634J^a2#b-Ray&!5h$76kHVq
zXQ9`idGaRjIqRQao|Bv`$IJ1ebd@c0Rl39M>fwB4elRUXS)5+<EvsXRVt#qn>p(0T
zG1+fLmqZuB9?-^wHyjd9B^*&!dye{%L4DdGZwZn@lcJL9YmjMe6>ZnkTMzBdXlrQi
zM(d-Er2gzW+Ktg%w3oW6Pf6c3<+t_dZ9RPXj^7CWa!Eo$+&1EfH+&L4#9J$PBOnn#
z<N=*h@J2`?gt%@6Z$u;_i04Mkcq1keL&%U$nej$KBB=!Z#iY8U`Y)dFR!TC}WQyDT
r4fR{k(2gU$4bdKrwt@C-v`w_VSbug4?cQiP+K16b|1EslPG0RlrVOx+

delta 749
zcmY+Ay-osA5Js0o*cEaAe^^x3SeqbXu_iQ&)|yDHEcO+60TN<Q^>uc>0SQk)Z%C+3
zcmWcg!QjrFxwI$eo|!xQ{=UB`ZA|SBYEC!(_<TJX-{+-O7SC@j!>AipF@Aq(*0I)&
z!5te7G8)Jntuc^>Nrs7uZahfCBE!O}GVtr9rd1v$pW@pO4!hyjRjkQu%Iu8Unpulk
z=Bc;m%qGliW-DfnV%PsS$z@xYwsoroT_sk>%jM%9i5|Xu?KF>)^2zYAJ2IpZkP%=Q
zXpKS|AsHd&M}{;aG9qksV<e53j2OL8n=+C{LPmm_Zahh&O-37=%D^sEM^Dv_FpL!I
gFq<>GV76s;$*dQvw^z(&%(~1r%reE6H_1=!59yMsfB*mh

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index 973320cb25120818a45ddb3d8e3b3211f0c00adc..884d4871a2a0b87db2c0dd7e6f32486ba9b7e424 100644
GIT binary patch
delta 842
zcmY+>ze>YU7zOZ(Rns(WqDkBQYw`$o(ApuOrLB{Hz@m#o9>AAScSX6Ipy2Ex_yp1?
zaC1_e1$_V=^qzdlce5UTIp5`EmdujJBU?P%(UO)<5BKzWaqrmT()N_BitN3VEg<VT
zs#`>MmSy6`@x9~o{pxhBmul&7d|*^6T16YmE1GN<pM@9{qDG<yk+i5|ojY_AI>bdG
zxT8*@4)K<YK6e--42ab>UFma2gG2-3G#4A((InA?cqs&Tm?TUoXkSxql<hL$E{mk4
zNDFH|bkv2Hk^Ppk6=b`v>TG0prOZM0UCLU>wmkLQHnQtd){$BE>Jh)%rB}OH;K!pC
zN4$VX0{vpgCo$#@pM;N&+d^<hKq7$n%Eg2`LJ}dwW<Xaa+|eb`g}BPaHg`lMB8ZPd
Va7RocmV*9f{J)FybP~SK{Q>oY)Cm9p

delta 847
zcmZ9}KTZNc6vy#3q72LON0<FG`wx#mp-4diakWE@L<^1C*m?^+fC+g$7a%bvmX@4A
zJ1dXC1xPex-n=(!`^|^nEHlgDa`<-RRz)$rKDW2w!E@o$&)~(C*ecY1sO?beb+p^1
z_C&3!+ri!QMP+)}D?~BQuN=z~mKbkN6zX81p;T}{u!gV(w_ddQG$oFB%0^+sq9k~u
zj-n20Q}lVmLE*r}H%{sEMgv6y=B7C2jV6jFtV)76S}0mD3XD?*ywOI{hM5wu2=oQ-
z={tfowS8)nP&=2}oLYz4ike4lB=v87YBOqqZt4+F_-jM_+E6`W_z&_Qmk6bTQbYBY
zIWI;CBlw7n8_IbqMiGM(8{(8V5)=vCmjrL5C{lPe#Tjp8C^Gmh3Et?U=)z?Z!<V1F
IKPKN>e+E?3EC2ui

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 9583da4e4f558cb0bf6912733fbe8db7c1ad255f..31a79aa47673c14f7e564475c39bd38c872f8165 100644
GIT binary patch
delta 1069
zcmbQ?HN$H|GT-DyymD+D@xh^f43j4c3QI&c`LYBXSj2P0JGun%FfcGOa5w@b87FTP
zfU08zsbh(5@@JWRgx8oIte1-kAt=UY!Ui&riy0&~xtm`Sq<3<?l+@%qQ1%5NTUP)g
zt|%=vxemgHn#B&*cOFHI11zQ>2-X8t#|aiIgosV<5|o-eR|aC{Z6Ny{l&vEqHQ8Pk
zB3=t*Pk^$|0of0sY<XcRNsxzvEezlu7l3%2O91Tp0=No9&<H|R2!d4{gsHGZm>~pJ
zAp}<ORt{>5CBh70s0v}Q3OjkJ$+JZuZtVxM-$2<9fNWb)h`6DG)Z{)08yXJc;BdH)
zA|?SAGY|vofvS@Pi#4K%NrA=IDniVDEhaVjACzq)E;ZR-2_oJLWG{fS?*Z8#p=^B#
W>CG7u;!I%2k4EtDj9_QwtBe5r@-&P9

delta 1082
zcmeH^u}Z^G6o!+uV2sixxm9zMRBN4uxV1wm6{kQA8k{<0aB%Jm2<a-6!dVKX&|M0G
zPoOWLlao-omqK?b-g-}N;wy;T$Ir)q?m2hp5B;ax0>lLhFXYhb^xFB*t3_(my13qz
zBw12h;mxHC?_8jrUXTyZJRvAt&=jZ??M($5X+;i=9CWz>4@C-N`^Sb)#!KW=okG*$
z`90$S@*Cqha>bxqYQ&zTZNrsGHWQ&MGEHP-H}Q5vwsa}@Chu>SDU6T@j2Fmr#to9$
zq?Ycg<0d-ve;Mhn1{wy;vPM1aFwro<D`lqC(++|LftVXGDp8mo@pms6uaO&j6oLxR
z`-~^ZGsY`qZ$G&M6?ce5W{YfkoOq7N)*^F77E~!b9`KnH#$U)Q#%;@iS5khyvn=KR
Mga7acpPzil-&s66RR910

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 27d1fc90f5f51c48a44bace866a19a42d7170129..8b0cae4dbfbd083a43751a7c94dc5c76f89084a7 100644
GIT binary patch
delta 864
zcmY+?y-LGS90l-*woTKdO`GpDsjpB!Qd|V1=^|Ls;?yAz;8WBG5G12eA3z7e)dz8N
z>m=wZDCqs?B>!YR{O-AzldPk4^!(k+mgcA>r}L|svYB1zMz*7SBFj#7-&@?AZ_RfP
zQaO#2OI4B@k{k=!AaP%ay>Tg;5KR&vrQnVhM2o~>AGhpthYTT;xGe>Dv?1Cg-U|_N
zhXSFH7!Pnu#2p=o4vA$UCfuPys6t>PRcw^+GT|-_QmaUf)?660CQf%Ld#YtU%6@B^
zPT9<?p6yfiP|F6Cebq99ve>GgHAR-cI_6hfc(p|fJX+Z3m=~}iY!W}E;0_1EA#rA-
z<Agh02$#gF6x`uK<p14gArkKJA$;mMa&Sw+9YcsAiMv8fxg&rGguwR*c$X=6g^*!I
YhP3LnTU~WT*=sG^{?E*puJ^X_2TT;p0RR91

delta 860
zcmY+>O-{l<6bJAcDJ`WH+R{%x^ay^{xE+LTjS^Q)>;X819>I42E<mCQTQ1@SShICO
zVqo5zH{Jg8d;ghvvnzJR&tK27>&08?oP+O&@DWVlrk`QfqU@^rd~PjnA8Wf7vsc$J
zOv4t(DN_!c1hW&oyH>D`unmr%AL~(Ym4(8BN*DLsVWY5N-4NW-LD7MOE(-2&P&iNq
z+C2*H=%VPtN*52@;i7P1-w@p4q3}S2r&FK`X_*(aBUr1fr?P{}`YJ02H0!HurLsU}
zdzFPM6A{f0D3hNk__h(=Hj<whHQ|&W9wUq;j0wuWoN{A=Fo9*PZTX3-QWPm{8-hDB
z6d8Dl)-mIb97PWA4Z$5l6hrvd#hg1vC`MnYcF3G7#t6pnA_Xi{TIqxq09%z^QnvB3
G-?M)mx5a`0

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index efa46bc7860f0b026f23175ccf3ef1e1eba59c15..38865fb66747a6ee1cf2066b925be6eba064625a 100644
GIT binary patch
delta 799
zcmY+BJ5Iw;5Jeryu}w%w9RKau5j71W1)+*wgeXA}Q6b?4fW!izqE3YukR=c)lpwJI
zdX~Ww(7PUc-fNG}-1)5+>&15CS0XB^jh`lWuUF>k<hXQ7aemV`4AXGL>h`i{!uV^A
zd24jZ=)w>IWz0CkBEyn~?UXXlst#kX?l$8rn@n3VZE03nm?+Evd(_w-*q6q7U<Z*}
zyAM`stPi%;*Z`~(qqa(8+Uu039n!QzZ2r&~bKZPJ#t6n|YjB23h6`hmP?s~#7?UxE
zao-x8;gR9NcyA2B89o{K^IJ+y1V;oU1c<n9j3q~eWQ5Y7Cx-Gw^%Iwz6_FV!W`tuN
zW$GhhuosObU_Tm5!HS7mn}I!PYy$SJu^i0J)!IU`dg=?FdP-AIae?PN+kND}oqut6
Bv2y?b

delta 790
zcmY+BJx;?w5JqjuiA@N09RJ&~O`irO1*VFO5G6=NR1|vwq+B2sb-FnKSFn^iQZA4K
zK*vo`va>Vm_UX;H-_Gn-yH)oc!XeC|jjHV9>(yE>?t~-Sr?;_TSccQC-(N-+xRGu&
zWDL+4fY6O4XAIF8Lf11m!$!jfGrqh6MV#4=IKS+`UmBdd!6&gRVh3U)Vs4^luZam_
zV`3e#8)9avW?jW@FFU#CwjQ?iWI<1fa(NAZe1hTxep79E4M+KC_%P2j<AF1#XiQ<-
zGdLqaBY=}`w44#55ki$~ue6*Ip%KAGHy$}7Mk9t}&)|#%jRgEc9&ui%Wu|IJuqBoe
rI}yu?RWmhP5Ze%&5jzqqiTS0PtrU|-eCD<_wyot6YbEaY<&XIflB&Ev

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index bcaebed6837b0ffafe1128e1f8c2e55d4c66679c..abcd6d9d309a8f9a9080edc64df7a6c195b5885f 100644
GIT binary patch
delta 766
zcmY+>y-LGS7{>7gY;&wN&B=GFrh}t`);d&hNp)7RI634J^a2#b-Ray&!5h$76kHVq
zXQ9`idGaRjIqRQao|Bv`$IJ1ebd@c0Rl39M>fwB4elRUXS)5+<EvsXRVt#qn>p(0T
zG1+fLmqZuB9?-^wHyjd9B^*&!dye{%L4DdGZwZn@lcJL9YmjMe6>ZnkTMzBdXlrQi
zM(d-Er2gzW+Ktg%w3oW6Pf6c3<+t_dZ9RPXj^7CWa!Eo$+&1EfH+&L4#9J$PBOnn#
z<N=*h@J2`?gt%@6Z$u;_i04Mkcq1keL&%U$nej$KBB=!Z#iY8U`Y)dFR!TC}WQyDT
r4fR{k(2gU$4bdKrwt@C-v`w_VSbug4?cQiP+K16b|1EslPG0RlrVOx+

delta 749
zcmY+Ay-osA5Js0o*cEaAe^^x3SeqbXu_iQ&)|yDHEcO+60TN<Q^>uc>0SQk)Z%C+3
zcmWcg!QjrFxwI$eo|!xQ{=UB`ZA|SBYEC!(_<TJX-{+-O7SC@j!>AipF@Aq(*0I)&
z!5te7G8)Jntuc^>Nrs7uZahfCBE!O}GVtr9rd1v$pW@pO4!hyjRjkQu%Iu8Unpulk
z=Bc;m%qGliW-DfnV%PsS$z@xYwsoroT_sk>%jM%9i5|Xu?KF>)^2zYAJ2IpZkP%=Q
zXpKS|AsHd&M}{;aG9qksV<e53j2OL8n=+C{LPmm_Zahh&O-37=%D^sEM^Dv_FpL!I
gFq<>GV76s;$*dQvw^z(&%(~1r%reE6H_1=!59yMsfB*mh

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index 67b60cc44a6ebff029524abc27ef48f90868f948..e819ce69461a36b6fab5e2ffeba90dfe558724a7 100644
GIT binary patch
delta 800
zcmY+CJ5Iwu5QdFp6BCHv51f$X3c*E43Xm)T1&APss8aY0J^~b!P`Css2Y>>J%TOg8
z03;3o687)0XSZ8@`sUx6*<Hn}_$@Q?%o^mG(Tx^&m+CworFxniU+*Z2s_4o5X4Y0q
zqot?S`O0?5oHV9JrY4wLUYPm083}9?>{((huy2X!U`Li%y9M?ru{PMJ#J0iqZPeyx
zHqABWZadU%2a`Y5#sN=mkWuaCt1&pkB*R3;p+mP!IKv{tg7MH8oMDq;!&ukGlrtPM
z92g^)Zkck1ONI;Mwl)&Z@W}8=gI>`qcT~M%!dX6<zF_*;=E4(SA^>}pSP1qfv0bp4
zFV;q2ONn*Cek9fdO9HWWuVhu%C){<Py6$5GF9Gf7ls7OSqxj{;PycNU&KQz0gmDq}
J-tWVYjemqBysrQN

delta 797
zcmY+BPfEj35QihAHpb@Ve`8vcdIXz=Z8t(dyAdK-TxF31xT;4GTz4^Bp%>^v@HB2p
zFCg>+1!>>BnV0RyH$Q$evn{s8_fo)03}7kpwElQD7sYL3HRZ!g&oE5GDi^PnZNjc)
zOv&h=(Sfmh%77;~?OM%o>KyzaJm$g|u`aPcVivJ`Pt9HsTM@H~?TB3x8~bXur`XMD
zpF3{rU|UBPbd)F;pYY-WMFDo8oo2#OE*dV>x-sPp4-F4CErT<BG<-Pd#*8xpGy<qX
zt;dWrLNr2H>qf~L5gHNfTLx#uXv9!P@`-h%j@ef?f(@~R*n!v;u_{)xDX}%N0kJ)?
zA+fTrX0H{KPkiLI8Me*j6SKBB=f!grb1CLZl;56n;t0hNyd^_;7unBe@_Y6VYPGlp

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 084957e53fb51e313dc824e5a8733f02ff77542c..03a9decdc1563f5e759e34dffdab4bb34645d9b3 100644
GIT binary patch
delta 863
zcmY+?y-LGS90l+eOOvKaY)zW)M4Vj&>j&7SA37?vI0*)4L03Vi?k?s*EVv5#0J{4E
zeGk3=oZSD-didRQFDF@#)}z&<Q_O=*)APmExv^2~xK6QhLM3Za)^sT=A~y=Jmlv(Y
z{$8%<<JqOzXtW#pSe$N)Q^lPW$5Lnz8i|ie47o#x&`DSW+%n{j4n&8<O(hPv!+<bI
zyh*_wU5Ks_uO2Qr<O&nOq>8x|Twy_2LSQyaOjOQt#9cO|tw@{3-1XIgHz|9rWj)G%
zYFVGMEKtvGQT9;F9Lm0GnM+weRL>4XR=#?|ulDe2j}~|evC)JV@F9E>-<6nhM*tC!
zNF#Jixg&%qf2#XR%(x?hh^XUJ3hsy@ViLU=x14fE0+Eoom4Z7`h*SuC&6IaJ<E{)c
VQ)EV~o+Rq3+y9yS{*wGQ{{Yt$zl#6>

delta 861
zcmZ9}y-vbl6b9fDu`Q*bwWa@5oJov{zX>b|I%<?SIrI`(9Y{=^+0KoScmv!3iK`|K
z4%~;q@BDmqee?7^U(eYLH^b$NZ`tMa>CV}KpTLKQuz;nXU{>d>7ErcJS?~GnzCJxY
zDeZDJd2|iKH0;r~$y9|V!9>9;h898#zJhc+Qi(IEvQgO3@90808Ymht*TuPXI4B%g
zSA=vlQ8b|lwJ8_U;i7P1RuR(CLeYYiE-s~`jiL=+^fv|i5iN6%b_8?I_BmT~=5bcU
z^z8v>GtPX@R-6T#c?o^np-dg|T3#FCYeRL!@E?>Pj}S%*Mg-L@$I=)hjA4*!TOLbQ
zf+B&1E+*2EqDbMpBBUcjk->4MO}UYd97PVV6(Jp66kYhx#jSJ{C<-{r)h!1(?evf~
J@V>}DYrlC)%KZQU

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index 46827e285421d4fb38160f6c15dc9134d7da5446..b413d9f31d483eca02f45ad09af2f556581ec381 100644
GIT binary patch
delta 842
zcmY+>PfEi;6bA4JX_F>R+cbaLBwDY~Y74p$jLp^x7B?0Qu02IvbtOoag?a#86x@0c
zcV0ly11M;|yyVSnKYsJgym_n9YP4Nj+0q_lYby*E_ZRB?V3_J@oLn{)MOE~8el;^x
zh|fwKRiZ|s2657&jzjLKlc+;HRDwG+5*oxuDaPEPlh7fCZMtR59Ssr<h-E1z++mO~
za-r#IK9`Z*cAaAC33r(!O+lKu%od$M$ePGrq|8G0D`hQYGg~~{M)o9S9c159W+RKc
zIGbH}Y4T%!twXPMF!^&SVxHV3;X?dWf;&7C9>lprx14c@Pr`@TRDwHtBzh2ErI>O@
zpF|(x)TLXd+!2r{rhP0$!W|)rFz=u(hWQ^ATTHksA{hxX!f)Pr;wE;Hy-C>~GRqg;
R0NIU{?f+-)>(+nY`2!^e#-IQI

delta 839
zcmY+>Pfo%>6bA4b3oV8IW7<NCqDK(LM3<vo*C=t-gdTuX=!&&(>4FQ8K;o8*cndB-
zLZENnn{L1S=9`)KmXqaV`|DbEHTx`_O9(vyU;a2Pzu(N+{as~OGXLlqhH2RHBusF;
zOcPHeS}0mj>f(Vr+9=wvZV2wMP*`x##gsd26gCvT_KqocbWn6)rHe=Ia8Nj~ZwT(_
zqUeGQ&bL4rq&TCVnh~rib16Ge=22FJ>a0)Min4&RJ!K(fvaineRd##c%`?AN;A=&_
zMA3wjKOP~BY8WY4Z(DL>j4+0U(5C#tRSAj&b`8ND0~7;rBdz0=JBBERFmDL%NKvG)
x(M8T38H(&D)-K7pVuWA>@3nwMtVVjJ1^_$Ct|@a9<;IlFDZ5eG-zNFLI09ThzxDtC

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index ebdccc880def932fcba0cef8a7cf47ff7cc67f53..9e701b2983f9ec45af9c26d801545c2b5d112a10 100644
GIT binary patch
delta 800
zcmY+>O-_SA7{>9MP{0<;H%P1P5o+i{Tq#ZC%CFeCGKQ-dPoQC2P2ASRXk2=V?%a9-
zJ%A>fd3fQS+5Yq6VHg(aB7GV6%9S%L$Gv`Xd2_1G)1AUB^4Yo7YH2MqpI@AGG>Gd)
zWQ}N(XhW=OG2soJgf4_(7Gh5?UtPa?+l03al7=J=A<HK_k(!D2tF(2rV@Gx!v<Ibi
z(Y}>tp&hvLvm0o4RV$Y+-OVna)~3_i`0}4xWc=k02?yfHqm7I=ToNwCeJ%EQ!z1BA
zd^LhMd=fsyzE5w-c_SbZK-@NhH$oC2#Ahw0yb+OzgrL6|i94$P;*_^ylCdOX+~#{A
z-|!}y70N9^yHZ*o?OAC9v_GY7p`AtY-Zt8!(uSf{r#|FUkLc7R+(0)Tyv^c|wSNky
B%^&~(

delta 790
zcmY+B&rZTX5Ql40Xu;a;|5{Y)8)(YGa-(Rxp+w@zklwxd3cdlED<R=*LP$LF6drvF
zUcdx`J3F&nzkK_f-_Fd7d9l86VdQq;$L(fspU>u`xUKEFdU$aR!!+z_^7_;^VR2-X
zWHiudz*aYUoY6$12?L=`>2ZdIh6OWez?aA@yFN^|;UfqS-QbT{i`d9hUYpp0*eS6s
zF^AZ|S8vaV&4{^*UH|Xoj@t@sD`Y{TM7g|@KklLE!F!;6yyPe!4IehT(dUc+jR2fb
z%jk1Ph(-ug-KaPtLL-9Jk--@;8Zqp2W5^i^8VQUet;divQZ!OnN&_~LTJX8r5je48
t8L=s`4zU%n3t~HBm&C@2%DW=AB-T|-9`TXe=GZouN6eM@eV_iG>;Xco#{2*P

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index f9aacee095bbb62251fc8231532f0d6e9f555a58..8c3956c9ecc63133cc800f1d2d07a1392a35d548 100644
GIT binary patch
delta 937
zcmY+>O-{l<7{+lv3X}>h^pjRaFJJ<QiNt79WoN`h;)(@l-~tBOlIWsKO}u~$6A$7A
zO!NSC;Q>sfPv7>P+5YpJr^B!uE{AV%Gg_G4C~o?l+3HG}_KxT3JRILN3WZ`p4X3x0
zBEX66`?J-xGVS+rP)dPTf>`ST37#mEC_{W^V!#^;2?gT7pp5}<R7g}H?lN)68&wij
zh>u+GMvX)bV!uUS8S;ioLWNl5f;Z|U>WQeS^Uc#}^(fS>^j9D8mPS$&q?X9&vh53P
z3+-8I4YVJrHPOyY@vM&aC^ZA^TWT$|z9pV*CoR48h;MDutxdeZlSOYd;uo+;SP*e0
zLf)`R*bt{SZG^nxkZ>R#GI7ouE(sUnD;K=sk?<gT4t?c<H##Ib5cj#@4WESgE<V4@
tn70CwL9#{vdw^G+x#H<<v{$L^p#4d07j5E+XS--GQrp`!`~BB5O8+xX*Gd2Y

delta 939
zcmZ9}Pfo%>6bA6N6k00Kf6&sZ=n<%5q8pMbJ0d0$S6%cB-hglc7H><!1z4DPAr2r3
zYZDTcdGp@X?U&ztZ|2Qnv>1JSwHtOhf17EbyCJ-LgF&%;Hs{0p(k}DKYfIB~&CY*;
zeqy?0*TwS1oM%H~hG33ya*iQkA|UtG5Z2(klm1N<;)bhC6edhvRd7cgMIF|vxaE!p
ziU#Z}f;%h}7K}Y*%7{B`6gI3Xf;*Zhny^#F9d|e=9LW6B6qx#nC3bWscLZz7T9oZ6
zYg0B3<k=2oE6QBTc9eOPWuZLl%S?RY1K&2l+Xmu-!9U0k4-tj}h7yXu%(=0PunR?3
z*>cWRJrq6Is^XD5A`}rED}p;>6fw+t%9JPW=%eVvrXsi_L6N{g6%+1AQKXPZ;xCIx
g?(|%40JfA}P<Ev3lCoJW&kiWtP<AD=&qM4PKZ5Agt^fc4

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 37ef245f673bcbd5385cb332cc0ccf06d5355485..a42eb674fa3469a815b1c91ba99b2d4cf85c9380 100644
GIT binary patch
delta 878
zcmY+>y-vbV7{>962&EKg#Sds{`KTXQqtQgAi4zeSHA)<a1Mvnl&KgZzb?Y^_IGH#x
z=>=%?0`Ok6Pv7?KS^xQ+rzfZ5;duD^-0)9Yc19iz&W<F1+bR2#MupQ9(t5KRq%4$@
zLc0~(G}@QY(r9)od3FZvN@y9h520nzbO&dB*D<Q+569`jjyIA=-QKAxNjXXG{@+>2
z1vm3=BC)#_3x$LN@fi!=$dkxJSWEPkJ>F1Bs1TR2;Ee)_0>pbHI=oRNQH0Qz=_?)H
zD3K^ZTtvd-4UL2r2>K6N@J8Xgc)X>P)Du$2YwoWk|HLfXlhDd&ze1Zs+gweaokzPD
z+5*~-&=%2}?c~`?(860E@U5$K>+pX+w&{&}`~n6E18+2m1#g%nOo)v&+BoEm8i^Xj
lT`YLRB4I&%N21RgHVGS|;nG+7yiq4nhq!jlw->jR`UCcd%hdn?

delta 891
zcmY+By-LGS6o6x`ZIY%xvHmnkleX4Wtxz1)779W!b`caT9g0KI7w`pyf^)&)tga4j
zf>SqNK<ES57Z4nL12sAKoSXIIJKsI`-q~n2dVQ{@)bU_=p}<eQ2sge5pVd-?mI&?F
ztaNDU31auemWh23OA_<8#Ow;OJ7Otf@5Iu?%(|FW1*={^TqXyHov}LZ1y_cmXo}kV
z+h5nB1vMdBp?GvaqK={tUv>Ncrf6^~gGL6r+mdn24Fe4WrZIyXSv0b+kc~Dsa%kkB
z<x8iuxsgXB4-?twaHD`m0p>A-8zvei)EeO_&~1pvTorEwQ({G83u0@;T03HPo!Erf
z2C+G@O=7iOF<TNW`ovS-*1~PA=o78D81Thy6zxc~g&6&1z(of|2hR7TS3cuZ8I3YL
n#SCt^Xt?k#8+~qgXn1haluqe$qk={S9-9u_`tI9Hvyk`&Hv`}D

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index e9b67e9ebe1e3b4de513b68129f719018ebeeb2f..88bf47ab1805e4ef1dd8039933c5aa8144da37ac 100644
GIT binary patch
delta 35
icmX@$e873bQiaL;6yzpbD@skis}P68mYUqFXbb=f{tdVQ

delta 79
zcmX@$e873bQUytl_~1}K1`(lnS1$v`0B2V(r(jnfkl18vMY+j$6ygc0ke=MDXbb?Y
Cnio<4

-- 
MST


