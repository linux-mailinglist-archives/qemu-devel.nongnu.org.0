Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B7E14C715
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 08:53:47 +0100 (CET)
Received: from localhost ([::1]:42426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwiAU-00022P-ID
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 02:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42698)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1iwi9f-0001Wo-MH
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 02:52:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1iwi9e-0001fh-Sf
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 02:52:55 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:48884)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1iwi9e-0001dL-Io; Wed, 29 Jan 2020 02:52:54 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id E92ED299AC;
 Wed, 29 Jan 2020 02:52:48 -0500 (EST)
Date: Wed, 29 Jan 2020 18:52:48 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 13/14] dp8393x: Don't reset Silicon Revision
 register
In-Reply-To: <1e00d5c7-33c1-70b8-2ac3-de6004690406@redhat.com>
Message-ID: <alpine.LNX.2.22.394.2001291849440.9@nippy.intranet>
References: <cover.1579474761.git.fthain@telegraphics.com.au>
 <34caf9dea82cd30dc51b4f8768adb7a90b236bf2.1579474761.git.fthain@telegraphics.com.au>
 <dcd1dcd2-719c-1db0-e9ce-25d26ed1f6d4@redhat.com>
 <alpine.LNX.2.21.1.2001290922330.8@nippy.intranet>
 <1e00d5c7-33c1-70b8-2ac3-de6004690406@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-1938134163-1580284368=:9"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 98.124.60.144
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1938134163-1580284368=:9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 29 Jan 2020, Philippe Mathieu-Daud=C3=A9 wrote:

> >=20
> > This would allow the host to change the value of the Silicon Revision=
=20
> > register.
> How the guest can modify it? We have:
>=20
> 589 static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
> 590                           unsigned int size)
> 591 {
> 592     dp8393xState *s =3D opaque;
> 593     int reg =3D addr >> s->it_shift;
> 594
> ...
> 597     switch (reg) {
> ...
> 602         /* Prevent write to read-only registers */
> ...
> 606         case SONIC_SR:
> ...
> 608             DPRINTF("writing to reg %d invalid\n", reg);
> 609             break;
>=20

My mistake. I had completely overlooked that logic.

I'll revise this patch in accordance with your suggestion.
---1463811774-1938134163-1580284368=:9--

