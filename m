Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B999C690B9A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 15:22:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ7o4-0006NX-Jo; Thu, 09 Feb 2023 09:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pQ7nz-0006N1-4T
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:21:43 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pQ7nw-000323-Cr
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:21:42 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pQ7nt-002GDD-PK; Thu, 09 Feb 2023 15:21:37 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1pQ7nt-0028DE-II; Thu, 09 Feb 2023 15:21:37 +0100
Message-ID: <48f42e259498adc7953853572eb481279ee06e71.camel@physik.fu-berlin.de>
Subject: Re: Linker failures trying to build static qemu-user binary
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Date: Thu, 09 Feb 2023 15:21:36 +0100
In-Reply-To: <CAFEAcA-Le_YbaYn6i15EesDMan+OF0S7uteanSXrWYK37HbdvQ@mail.gmail.com>
References: <f71df8f625e4110b84b6c4fefd9e95619b3ab92e.camel@physik.fu-berlin.de>
 <CAFEAcA-Le_YbaYn6i15EesDMan+OF0S7uteanSXrWYK37HbdvQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
Received-SPF: pass client-ip=130.133.4.66;
 envelope-from=glaubitz@zedat.fu-berlin.de; helo=outpost1.zedat.fu-berlin.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Hi!

On Thu, 2023-02-09 at 14:14 +0000, Peter Maydell wrote:
> The "Using getpwuid in statically linked applications" etc warnings
> are expected, so we can ignore those; this is the key error:

OK.

> > /usr/bin/ld: /usr/lib/x86_64-linux-gnu/libdw.a(debuginfod-client.o): in=
 function `__libdwfl_debuginfod_init':
> > (.text.startup+0x17): undefined reference to `dlopen'
> > /usr/bin/ld: (.text.startup+0x32): undefined reference to `dlsym'
> > /usr/bin/ld: (.text.startup+0x4b): undefined reference to `dlsym'
> > /usr/bin/ld: (.text.startup+0x64): undefined reference to `dlsym'
> > /usr/bin/ld: (.text.startup+0x7d): undefined reference to `dlsym'
> > /usr/bin/ld: (.text.startup+0xdc): undefined reference to `dlclose'
> > collect2: error: ld returned 1 exit status
>=20
> We use pkg-config to find out what the libdw library needs on
> the compiler/linker command line to link successfully, so
> maybe your distro's pkg-config info isn't right. What does
> "pkg-config --static --libs libdw" say ?

glaubitz@nofan:~> pkg-config --static --libs libdw
-ldw -lbz2 -llzma -pthread -lpthread -lelf -lz
glaubitz@nofan:~>

I'm building on Debian stable (Bullseye).

> If libdw needs libdl
> then it ought to list it in that output, I think. IME pkg-config
> information is often incorrect for static linking, though.
> I guess this one happened to work previously because glibc didn't
> actually mandate linking with '-ldl', and now on your system it
> apparently does. On my system pkg-config says
> -ldw -lbz2 -llzma -pthread -lpthread -lelf -lz
> which looks like it's missing -ldl, but the link succeeds anyway,
> presumably because the symbols are provided by the main glibc .a.
>=20
> On the other hand, if libdw wants to use dlopen/dlsym then
> I wonder if we should just suppress it for static linking:
> on my (Ubuntu 22.04) ld warns:
> /usr/bin/ld: /usr/lib/x86_64-linux-gnu/libdw.a(debuginfod-client.o):
> in function `__libdwfl_debuginfod_init':
> (.text.startup+0x1b): warning: Using 'dlopen' in statically linked
> applications requires at runtime the shared libraries from the glibc
> version used for linking
>=20
> so whatever libdw is trying to do will likely not work in most
> statically-linked situations anyway.

So, just include "-ldl" in LD_FLAGS?

> I've cc'd the author of the commit that added the libdw
> dependency.

Thank you!

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

