Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D57E4DD0F1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 23:58:26 +0100 (CET)
Received: from localhost ([::1]:57344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUz4a-0005O8-Pd
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 18:58:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUz3Y-0004Yh-17; Thu, 17 Mar 2022 18:57:21 -0400
Received: from mail-yb1-f179.google.com ([209.85.219.179]:41753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUz3U-0006cr-Bp; Thu, 17 Mar 2022 18:57:18 -0400
Received: by mail-yb1-f179.google.com with SMTP id l2so12922871ybe.8;
 Thu, 17 Mar 2022 15:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xz1H8jsqYeYPtw9mredevpkM5YbEwtBVd7V6tSAy6fE=;
 b=vtP/pYIWU9Va2+fRCY7lPm0tFrikzgzxCo1rF7/HzB3Ws5Q2iyGsjrWwKt9zk5sJJJ
 Vg42BDlEuVAIPojT0TkeEjYgKnEoDTtYSw8HRN3MbsTv/wlGwBe4qlJ3HjZVlAEKP9vL
 N+aIkgF1kJr1Bp1PZ5gVKNYmorklQOjcs5yr6zkBT+d8jYdMtE2NnHw3me1QP4MsNQUy
 bQZThl8UAXmW1lnCrfBC2LOyCDolgGoKrtdVgE58Yr986XVqBlWB4rxqfnugZVgNxtpw
 AyXOILkXWtiuldcv+kijEolKC4qqM3s492lKXnkpCJ0EIjPX4oK6PnLJqHl7PPLGs+ii
 vt6Q==
X-Gm-Message-State: AOAM531dYoO8HB7dsymJvQZYPxXqMt2HWFrjaaPJmap4tfm1vCITApWU
 l56t0x6MjjrLMKOnC79gGaX9NVsxphPCpy8dtm4=
X-Google-Smtp-Source: ABdhPJyV0ES15lDVZwZhAjfFtl6NFT8bx297uQX0qG1O9j2b3cmleK+D7WQHKiy9AtnFDxHR2SK7rMLRmejCTbGlCCU=
X-Received: by 2002:a25:c00a:0:b0:633:95d3:e2b with SMTP id
 c10-20020a25c00a000000b0063395d30e2bmr7645035ybf.366.1647557835005; Thu, 17
 Mar 2022 15:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220311221634.58288-1-muriloo@linux.ibm.com>
 <a7ce477a-ebed-dbb0-3257-8bc82fe27ce4@gmail.com>
 <11970663.O9o76ZdvQC@localhost.localdomain> <87tubyt0ez.fsf@pond.sub.org>
In-Reply-To: <87tubyt0ez.fsf@pond.sub.org>
Date: Thu, 17 Mar 2022 23:57:04 +0100
Message-ID: <CAAdtpL4tFmUYfhQEBXsJYMY_ArsOSLfkys149OL4xBKPZyjjkg@mail.gmail.com>
Subject: Re: [PATCH-for-7.0 v2] block-qdict: Fix -Werror=maybe-uninitialized
 build failure
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Murilo_Opsfelder_Ara=C3=BAjo?= <muriloo@linux.ibm.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.179;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f179.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Wed, Mar 16, 2022 at 3:52 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Murilo Opsfelder Ara=C3=BAjo <muriloo@linux.ibm.com> writes:
>
> > Hi, Philippe.
> >
> > On Monday, March 14, 2022 10:47:11 AM -03 Philippe Mathieu-Daud=C3=A9 w=
rote:
> >> On 11/3/22 23:16, Murilo Opsfelder Araujo wrote:
> >> > Building QEMU on Fedora 37 (Rawhide Prerelease) ppc64le failed with =
the
> >> > following error:
> >> >
> >> >      $ ../configure --prefix=3D/usr/local/qemu-disabletcg --target-l=
ist=3Dppc-softmmu,ppc64-softmmu --disable-tcg --disable-linux-user
> >> >      ...
> >> >      $ make -j$(nproc)
> >> >      ...
> >> >      FAILED: libqemuutil.a.p/qobject_block-qdict.c.o
> >>
> >> This part >>>
> >>
> >> >      cc -m64 -mlittle-endian -Ilibqemuutil.a.p -I. -I.. -Isubproject=
s/libvhost-user -I../subprojects/libvhost-user -Iqapi -Itrace -Iui -Iui/sha=
der -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/sy=
sprof-4 -I/usr/include/lib
> >> >      mount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/i=
nclude/p11-kit-1 -I/usr/include/pixman-1 -fdiagnostics-color=3Dauto -Wall -=
Winvalid-pch -Werror -std=3Dgnu11 -O2 -g -isystem /root/qemu/linux-headers =
-isystem linux-headers -iquote
> >> >       . -iquote /root/qemu -iquote /root/qemu/include -iquote /root/=
qemu/disas/libvixl -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GNU_=
SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wr=
edundant-decls -Wundef -Wwrite
> >> >      -strings -Wmissing-prototypes -fno-strict-aliasing -fno-common =
-fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wform=
at-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wne=
sted-externs -Wendif-label
> >> >      s -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missin=
g-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-stron=
g -fPIE -MD -MQ libqemuutil.a.p/qobject_block-qdict.c.o -MF libqemuutil.a.p=
/qobject_block-qdict.c.o.d -
> >> >      o libqemuutil.a.p/qobject_block-qdict.c.o -c ../qobject/block-q=
dict.c
> >>
> >> <<< is noise (doesn't provide any value) and could be stripped.
> >
> > Is this something the committer/maintainer could edit when applying the=
 commit
> > or do you need I resend the v3?
> >
> > Cheers!
>
> I'll take care of it unless Kevin or Hanna beat me to the punch.

Thanks!

Same error on latest Debian:

include/qapi/qmp/qobject.h: In function 'qdict_array_split':
include/qapi/qmp/qobject.h:49:17: error: 'subqdict' may be used
uninitialized [-Werror=3Dmaybe-uninitialized]
   49 |     typeof(obj) _obj =3D (obj);                                   \
      |                 ^~~~
../qobject/block-qdict.c:227:16: note: 'subqdict' declared here
  227 |         QDict *subqdict;
      |                ^~~~~~~~
cc1: all warnings being treated as errors
FAILED: libqemuutil.a.p/qobject_block-qdict.c.o

Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

