Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF6839D060
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 20:14:25 +0200 (CEST)
Received: from localhost ([::1]:37202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpxHz-0004Ov-VK
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 14:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lpxGo-0003iO-JW
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 14:13:10 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:34358
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lpxGl-00087p-V4
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 14:13:09 -0400
Received: from edv-macbook-pro.fritz.box (p57b42637.dip0.t-ipconnect.de
 [87.180.38.55])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 07A46DA1694;
 Sun,  6 Jun 2021 20:13:03 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1496414138-7622-1-git-send-email-peter.maydell@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [Qemu-devel] [PATCH] configure: Define NCURSES_WIDECHAR if we're
 using curses
Message-ID: <5b59b9d2-8b9c-e204-098f-b540f8bd1117@weilnetz.de>
Date: Sun, 6 Jun 2021 20:13:02 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1496414138-7622-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, patches@linaro.org,
 Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?Q?Rainer_M=c3=bcller?= <raimue@codingfarm.de>,
 Chad Joan <chadjoan@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.06.17 um 16:35 schrieb Peter Maydell:

> We want the wide character functions from the ncurses header.
> Unfortunately it doesn't provide them by default, but only
> if either:
>   * NCURSES_WIDECHAR is defined (for ncurses 20111030 and up)
>   * _XOPEN_SOURCE/_XOPEN_SOURCE_EXTENDED are suitably defined
>
> So far we have been implicitly relying on the latter, because
> for GNU libc when we define _GNU_SOURCE this causes libc
> to define the _XOPEN_SOURCE macros for us. Unfortunately
> this doesn't work on all libcs, because some (like OSX and
> musl libc) do not define _XOPEN_SOURCE when _GNU_SOURCE
> is defined.
>
> We can't fix this by defining _XOPEN_SOURCE ourselves, because
> that also means "and don't provide any functions that aren't in
> that standard", and not all libcs provide any way to override
> that to also get the non-standard functions. In particular
> FreeBSD has no such mechanism, and OSX's _DARWIN_C_SOURCE
> doesn't reenable everything (for instance getpagesize()
> is still not prototyped if _DARWIN_C_SOURCE and _XOPEN_SOURCE
> are both defined).
>
> So we have to define NCURSES_WIDECHAR. (This will only work
> if your ncurses is at least 20111030, as older versions
> don't honour this macro.)


I answer to this very old e-mail because I noticed today that defining=20
NCURSES_WIDECHAR does not work with the latest MacOS on M1:

Apple still delivers a curses.h which indicates NCURSES_VERSION "5.7"=20
(20081102). It does not know NCURSES_WIDECHAR, but support for curses=20
can be enabled with _XOPEN_SOURCE_EXTENDED=3D1.

I used this patch for git master:

diff --git a/meson.build b/meson.build
index 626cf932c1..513332a76d 100644
--- a/meson.build
+++ b/meson.build
@@ -606,7 +606,7 @@ if have_system and not get_option('curses').disabled(=
)
 =C2=A0=C2=A0=C2=A0=C2=A0 endif
 =C2=A0=C2=A0 endforeach
 =C2=A0=C2=A0 msg =3D get_option('curses').enabled() ? 'curses library no=
t found' : ''
-=C2=A0 curses_compile_args =3D ['-DNCURSES_WIDECHAR']
+=C2=A0 curses_compile_args =3D ['-DNCURSES_WIDECHAR',=20
'-D_XOPEN_SOURCE_EXTENDED=3D1']
 =C2=A0=C2=A0 if curses.found()
 =C2=A0=C2=A0=C2=A0=C2=A0 if cc.links(curses_test, args: curses_compile_a=
rgs, dependencies:=20
[curses])
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 curses =3D declare_dependency(compi=
le_args: curses_compile_args,=20
dependencies: [curses])


Then curses is detected and works when configure is given the right=20
PKG_CONFIG_PATH:

PKG_CONFIG_PATH=3D/opt/homebrew/Library/Homebrew/os/mac/pkgconfig/11=20
=2E/configure

Regards

Stefan



