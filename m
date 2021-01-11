Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5658F2F0D3C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 08:33:22 +0100 (CET)
Received: from localhost ([::1]:33410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyrhY-000573-UZ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 02:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1kyrea-0004Vc-8j
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 02:30:19 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:38698
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1kyreT-0003dq-CF
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 02:30:15 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 2CA41DA004B;
 Mon, 11 Jan 2021 08:30:00 +0100 (CET)
To: Thomas Huth <thuth@redhat.com>, Joshua Watt <jpewhacker@gmail.com>,
 qemu-devel@nongnu.org
References: <20210107213856.34170-1-JPEWhacker@gmail.com>
 <8ea87ea1-093d-81b0-13d6-60caa9fcdad4@redhat.com>
 <0e956e41-4862-f979-3247-40d03c5054e4@gmail.com>
 <e2885e2e-cf8a-51f7-6dd8-a28ac4871eef@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] configure: Add flags for MinGW32 standalone build
Message-ID: <a0cbc0c3-7c5b-ed81-8cfa-2129dda6a268@weilnetz.de>
Date: Mon, 11 Jan 2021 08:29:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e2885e2e-cf8a-51f7-6dd8-a28ac4871eef@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.012,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.01.21 um 08:04 schrieb Thomas Huth:

> On 08/01/2021 19.30, Joshua Watt wrote:
>>
>> On 1/8/21 1:25 AM, Thomas Huth wrote:
>>> On 07/01/2021 22.38, Joshua Watt wrote:
>>>> There are two cases that need to be accounted for when compiling QEM=
U
>>>> for MinGW32:
>>>> =C2=A0 1) A standalone distribution, where QEMU is self contained an=
d
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 extracted by the user, such as a user would=
 download from the=20
>>>> QEMU
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 website. In this case, all of the QEMU file=
s should be rooted in
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 $prefix to ensure they can be easily packag=
ed together for
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 distribution
>>>> =C2=A0 2) QEMU integrated into a distribution image/sysroot/SDK and
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 distributed with other programs. In this ca=
se, the provided
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 arguments for bindir/datadir/etc. should be=
 respected as they=20
>>>> for a
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Linux build.
>>>>
>>>> Add a configure time flags --enable-standalone-mingw and
>>>> --disable-standalone-mingw that allows the user to control this
>>>> behavior. The flag defaults to "enabled" if unspecified to retain th=
e
>>>> existing build behavior
>>>>
>>>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>>> ---
>>>> =C2=A0 configure | 8 +++++++-
>>>> =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/configure b/configure
>>>> index 5860bdb77b..5c83edb502 100755
>>>> --- a/configure
>>>> +++ b/configure
>>>> @@ -358,6 +358,7 @@ strip_opt=3D"yes"
>>>> =C2=A0 tcg_interpreter=3D"no"
>>>> =C2=A0 bigendian=3D"no"
>>>> =C2=A0 mingw32=3D"no"
>>>> +mingw32_standalone=3D"yes"
>>>> =C2=A0 gcov=3D"no"
>>>> =C2=A0 EXESUF=3D"$default_feature"
>>>> =C2=A0 HOST_DSOSUF=3D".so"
>>>> @@ -1558,6 +1559,10 @@ for opt do
>>>> =C2=A0=C2=A0=C2=A0 ;;
>>>> =C2=A0=C2=A0=C2=A0 --disable-fuse-lseek) fuse_lseek=3D"disabled"
>>>> =C2=A0=C2=A0=C2=A0 ;;
>>>> +=C2=A0 --enable-standalone-mingw) mingw32_standalone=3D"yes"
>>>> +=C2=A0 ;;
>>>> +=C2=A0 --disable-standalone-mingw) mingw32_standalone=3D"no"
>>>> +=C2=A0 ;;
>>>> =C2=A0=C2=A0=C2=A0 *)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "ERROR: unknown opti=
on $opt"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "Try '$0 --help' for=
 more information"
>>>> @@ -1570,7 +1575,7 @@ libdir=3D"${libdir:-$prefix/lib}"
>>>> =C2=A0 libexecdir=3D"${libexecdir:-$prefix/libexec}"
>>>> =C2=A0 includedir=3D"${includedir:-$prefix/include}"
>>>> =C2=A0 -if test "$mingw32" =3D "yes" ; then
>>>> +if test "$mingw32" =3D "yes" && test "$mingw32_standalone" =3D "yes=
";=20
>>>> then
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mandir=3D"$prefix"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 datadir=3D"$prefix"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docdir=3D"$prefix"
>>>> @@ -1897,6 +1902,7 @@ disabled with --disable-FEATURE, default is=20
>>>> enabled if available
>>>> =C2=A0=C2=A0=C2=A0 libdaxctl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lib=
daxctl support
>>>> =C2=A0=C2=A0=C2=A0 fuse=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 FUSE block device export
>>>> =C2=A0=C2=A0=C2=A0 fuse-lseek=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SEEK_HOL=
E/SEEK_DATA support for FUSE exports
>>>> +=C2=A0 standalone-mingw=C2=A0 Build for standalone distribution on =
MinGW
>>>> =C2=A0 =C2=A0 NOTE: The object files are built at the place where co=
nfigure=20
>>>> is launched
>>>> =C2=A0 EOF
>>>
>>> I think this should maybe be done independently from MinGW, so that=20
>>> it could be used on other systems, too. Thus maybe rather name the=20
>>> switch "--enable-standalone-distribution" or=20
>>> "--enable-standalone-installation" or something like this? On MinGW, =

>>> the value of the switch could then default to "yes" while on other=20
>>> systems it would be "no" by default.
>>
>> We could, but I'm curious how useful that is? Does that make the=20
>> option just a shorthand for "--mandir=3D$prefix --bindir=3D$prefix=20
>> --datadir=3D$prefix etc..." for all builds?
>
> Yes, that would basically be a shorthand for that. Could be useful for =

> people who want to create standalone binaries on Linux etc., too.
>
> =C2=A0Thomas


Aren't nearly all files already rooted in $prefix? The only exception I=20
know is /etc/qemu.

Rooting in $prefix still allows hierarchical subdirectories. I'd prefer=20
them for MinGW, too.

Stefan




