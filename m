Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA14A2D2E20
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 16:23:32 +0100 (CET)
Received: from localhost ([::1]:43546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmepv-0002A0-Dm
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 10:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kmenG-0000lk-Mb
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:20:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:34736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kmenC-0001Qr-Jd
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:20:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kmen9-0006UA-M3
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 15:20:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 91BFE2E813B
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 15:20:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Dec 2020 15:13:33 -0000
From: Mark Cave-Ayland <1906905@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: sparc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mark-cave-ayland philmd yapkv
X-Launchpad-Bug-Reporter: yapkv (yapkv)
X-Launchpad-Bug-Modifier: Mark Cave-Ayland (mark-cave-ayland)
References: <160714087524.10652.4920404623701840898.malonedeb@soybean.canonical.com>
 <20201205150903.3062711-1-f4bug@amsat.org>
Message-Id: <566df971-ffe6-317d-3dec-6bd120757921@ilande.co.uk>
Subject: [Bug 1906905] Re: [PATCH] hw/timer/slavio_timer: Allow 64-bit accesses
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: a6b54b5542f2239a8f864a49f2aa680ac7a60812
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1906905 <1906905@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/12/2020 15:09, Philippe Mathieu-Daud=C3=A9 wrote:

> Per the "NCR89C105 Chip Specification" referenced in the header:
> =

>                    Chip-level Address Map
> =

>    ------------------------------------------------------------------
>    | 1D0 0000 ->   | Counter/Timers                        | W,D    |
>    |   1DF FFFF    |                                       |        |
>    ...
> =

>    The address map indicated the allowed accesses at each address.
>    [...] W indicates a word access, and D indicates a double-word
>    access.
> =

> The SLAVIO timer controller is implemented expecting 32-bit accesses.
> Commit a3d12d073e1 restricted the memory accesses to 32-bit, while
> the device allows 64-bit accesses.
> =

> This was not an issue until commit 5d971f9e67 which reverted
> ("memory: accept mismatching sizes in memory_region_access_valid").
> =

> Fix by renaming .valid MemoryRegionOps as .impl, and add the valid
> access range (W -> 4, D -> 8).
> =

> Since commit 21786c7e598 ("memory: Log invalid memory accesses")
> this class of bug can be quickly debugged displaying 'guest_errors'
> accesses, as:
> =

>    $ qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25_rom -serial stdio=
 -d guest_errors
> =

>    Power-ON Reset
>    Invalid access at addr 0x0, size 8, region 'timer-1', reason: invalid =
size (min:4 max:4)
> =

>    $ qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25_rom -monitor stdi=
o -S
>    (qemu) info mtree
>    address-space: memory
>      0000000000000000-ffffffffffffffff (prio 0, i/o): system
>        ...
>        0000000ff1300000-0000000ff130000f (prio 0, i/o): timer-1
>               ^^^^^^^^^                                 ^^^^^^^
>                     \ memory region base address and name /
> =

>    (qemu) info qtree
>    bus: main-system-bus
>      dev: slavio_timer, id ""              <-- device type name
>        gpio-out "sysbus-irq" 17
>        num_cpus =3D 1 (0x1)
>        mmio 0000000ff1310000/0000000000000014
>        mmio 0000000ff1300000/0000000000000010 <--- base address
>        mmio 0000000ff1301000/0000000000000010
>        mmio 0000000ff1302000/0000000000000010
>        ...
> =

> Reported-by: Yap KV <yapkv@yahoo.com>
> Buglink: https://bugs.launchpad.net/bugs/1906905
> Fixes: a3d12d073e1 ("slavio_timer: convert to memory API")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Cc: Benoit Canet <benoit.canet@gmail.com>
> Cc: <1906905@bugs.launchpad.net>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>   hw/timer/slavio_timer.c | 4 ++++
>   1 file changed, 4 insertions(+)
> =

> diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
> index 5b2d20cb6a5..03e33fc5926 100644
> --- a/hw/timer/slavio_timer.c
> +++ b/hw/timer/slavio_timer.c
> @@ -331,6 +331,10 @@ static const MemoryRegionOps slavio_timer_mem_ops =
=3D {
>       .write =3D slavio_timer_mem_writel,
>       .endianness =3D DEVICE_NATIVE_ENDIAN,
>       .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 8,
> +    },
> +    .impl =3D {
>           .min_access_size =3D 4,
>           .max_access_size =3D 4,
>       },

I don't really use the proprietary Sun ROMs here, but the fix looks good
to me:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

It's probably also worth a CC to qemu-stable to try and also get this into =
5.1.1 to =

accompany the related TCX issues.


ATB,

Mark.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906905

Title:
  qemu-system-sparc stucked while booting using ss20_v2.25_rom

Status in QEMU:
  Confirmed

Bug description:
  I cannot boot up OBP using the current (5.1) version of qemu with
  ss20_v2.25_rom. It just stuck at "Power-ON reset" and hanged.  However
  using the previous version from 2015 I can successfully both up the
  OBP.

  qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25.rom -nographic

  Power-ON Reset

  (*hang)

  regards
  Yap KV

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906905/+subscriptions

