Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6E668022
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jul 2019 18:20:05 +0200 (CEST)
Received: from localhost ([::1]:33224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmhEJ-00009H-5p
	for lists+qemu-devel@lfdr.de; Sun, 14 Jul 2019 12:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47868)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <glaubitz@physik.fu-berlin.de>) id 1hmhE5-0008Cc-6w
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 12:19:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <glaubitz@physik.fu-berlin.de>) id 1hmhE4-0005i9-61
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 12:19:49 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:38401)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1hmhE3-0005gL-KH
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 12:19:48 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.85)
 with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id <1hmhDz-000uS5-7O>; Sun, 14 Jul 2019 18:19:43 +0200
Received: from tmo-116-129.customers.d1-online.com ([80.187.116.129]
 helo=[10.149.213.229]) by inpost2.zedat.fu-berlin.de (Exim 4.85)
 with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id <1hmhDz-003Ogv-06>; Sun, 14 Jul 2019 18:19:43 +0200
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-Mailer: iPhone Mail (16F203)
In-Reply-To: <20190714134028.315-2-laurent@vivier.eu>
Date: Sun, 14 Jul 2019 18:19:42 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <1F76A574-2A97-4070-8EE0-0EE83A4241E9@physik.fu-berlin.de>
References: <20190714134028.315-1-laurent@vivier.eu>
 <20190714134028.315-2-laurent@vivier.eu>
To: Laurent Vivier <laurent@vivier.eu>
X-Originating-IP: 80.187.116.129
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 130.133.4.66
Subject: Re: [Qemu-devel] [PATCH 2/2] linux-user: manage binfmt-misc
 preserve-arg[0] flag
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

> On Jul 14, 2019, at 3:40 PM, Laurent Vivier <laurent@vivier.eu> wrote:
>=20
> Add --preserve-arg0 in qemu-binfmt-conf.sh to configure the preserve-arg0
> flag.
>=20
> Now, if QEMU is started with -0 or QEMU_ARGV0 and an empty parameter
> argv[0] (the full pathname provided by binfmt-misc) is removed and
> replaced by argv[1] (the original argv[0] provided by binfmt-misc when
> 'P'/preserve-arg[0] is set)
>=20
> For instance:
>=20
>  $ sudo QEMU_ARGV0=3D chroot m68k-chroot sh -c 'echo $0'
>  sh
>=20
> without this patch:
>=20
>  $ sudo chroot m68k-chroot sh -c 'echo $0'
>  /usr/bin/sh

As a regular user of qemu-user (we=E2=80=99re using qemu-user to run Debian=E2=
=80=99s buildds for m68k and sh4), I would like to add that the idea of havi=
ng to pass additional environment variables to make qemu behave as expected,=
 i.e. as the real hardware, is sub-optimal.

I would prefer that enabling the preserve flag with the qemu-binfmt.sh scrip=
t would make qemu-user behave correctly.

If I understand correctly, the current design with the environment variable w=
as chosen because my preferred approach would break compatibility in certain=
 cases. However, I think that correct emulation is more important than compa=
tibility to an old broken behavior and I would therefore be in favor to make=
 the correct behavior default.

This will also be necessary when using qemu-user with Debian=E2=80=99s sbuil=
d to =E2=80=9Ccross=E2=80=9D-build packages with qemu-user. This particular b=
ug was actually discovered while building Debian packages for m68k and sh4 u=
sing qemu-user.

Thanks,
Adrian

PS: I have disabled receiving messages for this list, so please keep me CC=E2=
=80=99ed.=


