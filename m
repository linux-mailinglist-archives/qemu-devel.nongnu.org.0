Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B956A7CE0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:36:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHm-0007vZ-NX; Thu, 02 Mar 2023 03:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHe-0006y5-7n
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHb-0002fJ-NX
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w16c6O5L85j1u7aO8euRCxbVgQ1wD1YQJCSN4IXKOs8=;
 b=CEIpTrE6L98rAIr1ZIvK+gGUmRYIUEZS+qta0dmvwGR6JTSdRFJfQ0UeJOs4J4HymHUE46
 nhC+TMQexeBtj1At4TnCdvXAOmTGbnyRoE04xVPMZPgltYOgMLvqfTT0HtoSUPCAoMvJeE
 /x5BIsP3guUw0Z0fYLvV39ezCGkXe20=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-r-Yag-MFMWKYU4gXf5W03A-1; Thu, 02 Mar 2023 03:27:22 -0500
X-MC-Unique: r-Yag-MFMWKYU4gXf5W03A-1
Received: by mail-wm1-f70.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so936038wml.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:27:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745640;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w16c6O5L85j1u7aO8euRCxbVgQ1wD1YQJCSN4IXKOs8=;
 b=fQjH30sXne3TmPZEAhCKsrukKhKR8/1PYVokdvsXmDK+YmEajMgq6vu/y7o+9fcy0D
 QJBKxrsTHfdFc5MjzMXa62z9me7a5X01NszhIDx/CcWuq0WWHnyfFbYUt1huOrYVS9f+
 cl+vgPZ6ivtnE9cz7bsnBDDbq0ReNoObGonLVEL8aKsmLxdmQ7sOuOBifOL3xm9NgYxx
 6BfAx4C880BWAVKtRej07MGELHLLM+r0IwKLEnvb3A8XcBvt6sOxrFsdzRdAP9O9nG4X
 sTGNpIUfm5FlgLOCvUZxnnkCFup9WO9I3ylFFxHRpZxb+FCm5zOIciRFpE+IpfKhJD2c
 uLzA==
X-Gm-Message-State: AO0yUKUhwB7nezorUA8+5hFe5NzW8/DhiYDodM75X6S51VwqO2NpDZoe
 gq3wgw6VVyH31P1xt5iRvysU34TwLh1rzXZpJT6opSvcdkBcCTaTbvM1KmgF6ItpoE9nd9w5Zpv
 gZFbpDW8GKFP7Zz91FgDXo9pfXDHSfxA2KVhq8D+0tlSgpJdj7bXxTM0K203GEsexxQ==
X-Received: by 2002:a05:600c:2eca:b0:3dc:42d2:aee4 with SMTP id
 q10-20020a05600c2eca00b003dc42d2aee4mr6571435wmn.25.1677745640154; 
 Thu, 02 Mar 2023 00:27:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+e1DUMQ4SGywscmbBk2FI8s1GcGwo2vyJZGrrTkMHRFgN+o6Wcrxi37JdRjlWO6yv5sVOCpA==
X-Received: by 2002:a05:600c:2eca:b0:3dc:42d2:aee4 with SMTP id
 q10-20020a05600c2eca00b003dc42d2aee4mr6571419wmn.25.1677745639828; 
 Thu, 02 Mar 2023 00:27:19 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c198a00b003e11f280b8bsm2155292wmq.44.2023.03.02.00.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:27:19 -0800 (PST)
Date: Thu, 2 Mar 2023 03:27:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 53/53] tests/data/acpi/virt: drop (most) duplicate files.
Message-ID: <20230302082343.560446-54-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
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

When virt ACPI files were added, lots of duplicates were created because
we forgot that there's a no-prefix fallback: e.g. if
tests/data/acpi/virt/APIC.memhp is not there then test will use
tests/data/acpi/virt/APIC.

Drop these.

These were found with
$find tests/data/acpi/ -type f -exec sha256sum '{}' ';'|sort -d|uniq -w 64 --all-repeated=separate
(trick: -d does a dictionary sort so a no-suffix file ends up first).

Note: there are still a bunch of issues with duplicates left even after this.

First pc and q35 are often identical.
Second, sometimes files are identical but not identical to the default
fallback, e.g.
tests/data/acpi/pc/SLIT.cphp and tests/data/acpi/pc/SLIT.memhp
or
tests/data/acpi/q35/HMAT.acpihmat-noinitiator and tests/data/acpi/virt/HMAT.acpihmatvirt

Finding a way to deduplicate these is still a TODO item - softlinks
maybe?

We also need to make rebuild-expected-aml.sh smarter about not creating
these duplicates in the 1st place.

And maybe we should use softlinks instead of relying on a fallback
to make it explicit what version does each test expect?

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/data/acpi/virt/APIC.memhp   | Bin 172 -> 0 bytes
 tests/data/acpi/virt/APIC.numamem | Bin 172 -> 0 bytes
 tests/data/acpi/virt/DSDT.numamem | Bin 5196 -> 0 bytes
 tests/data/acpi/virt/FACP.memhp   | Bin 276 -> 0 bytes
 tests/data/acpi/virt/FACP.numamem | Bin 276 -> 0 bytes
 tests/data/acpi/virt/GTDT.memhp   | Bin 96 -> 0 bytes
 tests/data/acpi/virt/GTDT.numamem | Bin 96 -> 0 bytes
 tests/data/acpi/virt/IORT.memhp   | Bin 128 -> 0 bytes
 tests/data/acpi/virt/IORT.numamem | Bin 128 -> 0 bytes
 tests/data/acpi/virt/IORT.pxb     | Bin 128 -> 0 bytes
 tests/data/acpi/virt/MCFG.memhp   | Bin 60 -> 0 bytes
 tests/data/acpi/virt/MCFG.numamem | Bin 60 -> 0 bytes
 tests/data/acpi/virt/SPCR.memhp   | Bin 80 -> 0 bytes
 tests/data/acpi/virt/SPCR.numamem | Bin 80 -> 0 bytes
 14 files changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 tests/data/acpi/virt/APIC.memhp
 delete mode 100644 tests/data/acpi/virt/APIC.numamem
 delete mode 100644 tests/data/acpi/virt/DSDT.numamem
 delete mode 100644 tests/data/acpi/virt/FACP.memhp
 delete mode 100644 tests/data/acpi/virt/FACP.numamem
 delete mode 100644 tests/data/acpi/virt/GTDT.memhp
 delete mode 100644 tests/data/acpi/virt/GTDT.numamem
 delete mode 100644 tests/data/acpi/virt/IORT.memhp
 delete mode 100644 tests/data/acpi/virt/IORT.numamem
 delete mode 100644 tests/data/acpi/virt/IORT.pxb
 delete mode 100644 tests/data/acpi/virt/MCFG.memhp
 delete mode 100644 tests/data/acpi/virt/MCFG.numamem
 delete mode 100644 tests/data/acpi/virt/SPCR.memhp
 delete mode 100644 tests/data/acpi/virt/SPCR.numamem

diff --git a/tests/data/acpi/virt/APIC.memhp b/tests/data/acpi/virt/APIC.memhp
deleted file mode 100644
index 179d274770a23209b949c90a929525e22368568b..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 172
zcmZ<^@N{0oz`(%b?&R<65v<@85#X!<1dKp25F13p0FMNW#lQh$F##Fe0Wcl|15CX*
gLI}uWgsNwO(#&xED9WH5UbsC>V09of9T)-_08#k}0RR91

diff --git a/tests/data/acpi/virt/APIC.numamem b/tests/data/acpi/virt/APIC.numamem
deleted file mode 100644
index 179d274770a23209b949c90a929525e22368568b..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 172
zcmZ<^@N{0oz`(%b?&R<65v<@85#X!<1dKp25F13p0FMNW#lQh$F##Fe0Wcl|15CX*
gLI}uWgsNwO(#&xED9WH5UbsC>V09of9T)-_08#k}0RR91

diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/DSDT.numamem
deleted file mode 100644
index c47503990715d389914fdf9c8bccb510761741ac..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 5196
zcmZvg%WoT16o>EFlh__VVmr>uc{qhq@vO#n^Jr;H?6H%$#EJ2w4N@w(5&}`OsYHcT
zDx{D_3)#^~Yza~%{tYBn?AWnj&4zz~9p>D*Gs*8LXQYhh%-r+M{l>@f@oo97-K~;R
zv7eed-lo6U{J7^W(q<{8^s#=;zie6$2Yz#~e^mBd*G&#KJFRTP>vbqtQOUvmPD||{
z-ST$2(Y1be({-!W@LF=<_5DKGnR<~@8kkafrM@3kmUV@qXOz3TzUQqQ?nmwJed5+A
z*WYb8X-f7QmO&JpoI%7=(_v=Ae$bDmw6)#eq12^|+n#4$+}u&I@a8Tes^;z-p>KN$
z5mOh4YKUm+S=1zi6O$M=FlxxCi;TF$7zIWh88<|REisb7xPgo%kuf4M9AGRVV_9U3
zN{kFJmXWa{G7=Ia2aFYDtcr}J#K;3<6&W{0MoMB7fpHTU)$qf?OU!X3MhO_VkRg^S
z|BytbJ_(HXks;S<Mw-VoFm5A5uG6f<C<EgTGUPhVNsKvQ+(m|5r(+Uh0T>@3L$1@j
z#8?Ez8ZzWMEl7;lfYCsPT&G2eaTOR%WXN?oE-|hF!vjW5uG5mlcoP^cWXN?oAu-+t
zMjIJ&olZ)OcY(2v47pCHB*t}MY#>9f(`kv}0%H>ya-Ggdj2bXH$dK!_EHQ2X;~p~P
zI-Qjm%fR>$8FHP@NsLusY#~Fg(|L(;3m9Es)a5!|kQldtv5gG5PAd}QE--dN#`Z5g
zuM^Irx7~9a?kY7O9<@g%s_QPMy+QkCbNjq4@pt=$iZj<!p6aMi)uM9guSG{+smJOQ
zdQ}<{G#<VF?)cW1&S5car-wte;dfkRjx9Q_s$xc;cVZOOq99H|T@|x-W;nEz&Y^K(
zq_b#X&Rh%fXlNAbOyUP)sY^0r!$@aFL#YMQcch^~CWSgPx=TFBjAjs5Ix`v?H<>gv
z$fQtb(u{(;*g<AA13So!hEmHES_YXEqUQ+n90@Wb&k>UuO`byZ9A%!=l+t{nq10lb
zCxz&lV4ex)nc$ujqGytMCYdL-WavpDdZw5swbSP51&<`fJt;&_hj}{8lUg|Rq!2yR
z%rnhA)7+Cn^vp2N4D+Ox4?QVF&n)xIGS4jcq!2xG%rnP4sYOIj3ej_nd5$s9G44qr
zdeYAsQ{zDu=b0z9l;}wzdKQ>xfq53VCxz%)WS&LlNi8UPQiz`8%yXQ1j&n~6(UX2C
zf@g_&Qp<{-6r$$@^PFIw6Wo(R^qgd#lgyJ^T=b+6J*SxG6!V<oo)n@d{kR0rY34~S
zF?v#no-@pIhI!6#PYThq%sk7?lUiu>q!2x4nddC?oaLSrqURj*oMWEUa-%1O=sC|k
z=b7g`_oNU#7ntV)^Q0CXJt;)b3iGTm&kFaX(0J}2b!`1snxAj_OWAYR&%cO!v@DTx
z(!o;1>%mt#eeYg6R~jAoecuXEVaLEwv`&Dis{+cLJ4fBqvkDtrhSKW=$a+IynRA>K
zHoBZe>jucWCa}!8kX6bLyk<k4(f?4DU!$FQ9GeN}>33NbqkreL4fW1?NuRC^br->w
z9}fT1Kg(zvUZ*QohI#<AQPV=(kgi(l_#MazE+6V^dJCe9oj(6eCH?!oo=SSV{Vi2m
zPYrf_&ptj-UTd#<x|ulnyfE(M_q%`9|E<ie{kZqE@#~#GKRZ5fY#LCb*Cf5xpXfky
z^g&&tp6i`c(fiZ<tCPppH*}>MjIN$ezB-A<nbUcF@rfR+&z~LqoHOV3O{!-HrS}Fc
zziXdfF|+w&<@dk+rLVg`O#RcH`OWK|rcS<4XN9<B=^ZU}b?tuJXVs_|x^&Ie9rx1n
z3El&GI+eAHN28DE`^K!BH4_i7>y^2Uc57ft+$_sgb>m6Pa#^|%@=cw`t+!0-VY^R#
zDZQh~lw<FIo7SP%_S;*FrTIbo!EWk_4j!H6Po6(=bienax7Tkvhx<n}`T##qp1GI$
EABWcyJpcdz

diff --git a/tests/data/acpi/virt/FACP.memhp b/tests/data/acpi/virt/FACP.memhp
deleted file mode 100644
index ac05c35a69451519bd1152c54d1e741af36390f5..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 276
zcmZ>BbPf<<WME(ub@F%i2v%^42yj*a0-z8Bhz+8t3j|P&V@Bl;Brnj_Hxy()0OQ~X
A0RR91

diff --git a/tests/data/acpi/virt/FACP.numamem b/tests/data/acpi/virt/FACP.numamem
deleted file mode 100644
index ac05c35a69451519bd1152c54d1e741af36390f5..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 276
zcmZ>BbPf<<WME(ub@F%i2v%^42yj*a0-z8Bhz+8t3j|P&V@Bl;Brnj_Hxy()0OQ~X
A0RR91

diff --git a/tests/data/acpi/virt/GTDT.memhp b/tests/data/acpi/virt/GTDT.memhp
deleted file mode 100644
index 6f8cb9b8f30b55f4c93fe515982621e3db50feb2..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 96
zcmZ<{aS2IaU|?XH<K*w`5v<@85#X!<1dKp25F14QhXNpzK^8;+fgBLC0I@WP0|ZhK
J3PmkQ2mn(n7XbhO

diff --git a/tests/data/acpi/virt/GTDT.numamem b/tests/data/acpi/virt/GTDT.numamem
deleted file mode 100644
index 6f8cb9b8f30b55f4c93fe515982621e3db50feb2..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 96
zcmZ<{aS2IaU|?XH<K*w`5v<@85#X!<1dKp25F14QhXNpzK^8;+fgBLC0I@WP0|ZhK
J3PmkQ2mn(n7XbhO

diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
deleted file mode 100644
index 7efd0ce8a6b3928efa7e1373f688ab4c5f50543b..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 128
zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB

diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
deleted file mode 100644
index 7efd0ce8a6b3928efa7e1373f688ab4c5f50543b..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 128
zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB

diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
deleted file mode 100644
index 7efd0ce8a6b3928efa7e1373f688ab4c5f50543b..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 128
zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB

diff --git a/tests/data/acpi/virt/MCFG.memhp b/tests/data/acpi/virt/MCFG.memhp
deleted file mode 100644
index f4ae3203a4e9258a397c9912332178640209637b..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 60
scmeZuc5}C3U|?W;<K*w`5v<@85#X!<1dKp25F11z0RaaH=Rb%706Iko0RR91

diff --git a/tests/data/acpi/virt/MCFG.numamem b/tests/data/acpi/virt/MCFG.numamem
deleted file mode 100644
index f4ae3203a4e9258a397c9912332178640209637b..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 60
scmeZuc5}C3U|?W;<K*w`5v<@85#X!<1dKp25F11z0RaaH=Rb%706Iko0RR91

diff --git a/tests/data/acpi/virt/SPCR.memhp b/tests/data/acpi/virt/SPCR.memhp
deleted file mode 100644
index 24e0a579e7d73f432a614380e29aa95113344186..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 80
zcmWFza1IJ!U|?W6?d0$55v<@85#X!<1dKp25F11@12F>!1Bl59VJZSCW(Gzk28RDY
I01|@%0RBM>0RR91

diff --git a/tests/data/acpi/virt/SPCR.numamem b/tests/data/acpi/virt/SPCR.numamem
deleted file mode 100644
index 24e0a579e7d73f432a614380e29aa95113344186..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 80
zcmWFza1IJ!U|?W6?d0$55v<@85#X!<1dKp25F11@12F>!1Bl59VJZSCW(Gzk28RDY
I01|@%0RBM>0RR91

-- 
MST


