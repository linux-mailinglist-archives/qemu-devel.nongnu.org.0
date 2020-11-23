Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFF32C0148
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 09:22:49 +0100 (CET)
Received: from localhost ([::1]:44362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh77X-0004Z2-RZ
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 03:22:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kh75b-0002qu-32
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 03:20:47 -0500
Received: from indium.canonical.com ([91.189.90.7]:53548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kh75W-0002LV-As
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 03:20:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kh75U-00077C-D1
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 08:20:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5EC252E813A
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 08:20:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2020 08:14:37 -0000
From: Mark Cave-Ayland <1892540@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: sparc testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gson laurent-vivier mark-cave-ayland mst-0 philmd
 pmaydell
X-Launchpad-Bug-Reporter: Andreas Gustafsson (gson)
X-Launchpad-Bug-Modifier: Mark Cave-Ayland (mark-cave-ayland)
References: <159803735569.2614.10182276398047269277.malonedeb@chaenomeles.canonical.com>
 <20201120081754.18250-1-mark.cave-ayland@ilande.co.uk>
Message-Id: <7ec9f656-fa32-90a2-01a2-8f05e1b4ea53@ilande.co.uk>
Subject: [Bug 1892540] Re: [PATCH for-5.2] hw/display/tcx: add missing 64-bit
 access for framebuffer blitter
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: fa1ecdcf851dd8d6497a44194e1faad53f6001c8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1892540 <1892540@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/2020 08:17, Mark Cave-Ayland wrote:

> Commit ae5643ecc6 "hw/display/tcx: Allow 64-bit accesses to framebuffer s=
tippler
> and blitter" enabled 64-bit access for the TCX framebuffer stippler and b=
litter
> but missed applying the change to one of the blitter MemoryRegions.
> =

> Whilst the original change works for me on my local NetBSD test image, th=
e latest
> NetBSD ISO panics on startup without this fix.
> =

> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: ae5643ecc6 ("hw/display/tcx: Allow 64-bit accesses to framebuffer =
stippler and blitter")
> Buglink: https://bugs.launchpad.net/bugs/1892540
> ---
>   hw/display/tcx.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> =

> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
> index 878ecc8c50..3799d29b75 100644
> --- a/hw/display/tcx.c
> +++ b/hw/display/tcx.c
> @@ -649,10 +649,14 @@ static const MemoryRegionOps tcx_blit_ops =3D {
>       .read =3D tcx_blit_readl,
>       .write =3D tcx_blit_writel,
>       .endianness =3D DEVICE_NATIVE_ENDIAN,
> -    .valid =3D {
> +    .impl =3D {
>           .min_access_size =3D 4,
>           .max_access_size =3D 4,
>       },
> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 8,
> +    },
>   };
>   =

>   static const MemoryRegionOps tcx_rblit_ops =3D {

Adding CC to qemu-stable so that this follow-up fix also gets applied to
5.1.1.


ATB,

Mark.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892540

Title:
  qemu can no longer boot NetBSD/sparc

Status in QEMU:
  Fix Committed

Bug description:
  Booting NetBSD/sparc in qemu no longer works.  It broke between qemu
  version 5.0.0 and 5.1.0, and a bisection identified the following as
  the offending commit:

    [5d971f9e672507210e77d020d89e0e89165c8fc9] memory: Revert "memory:
  accept mismatching sizes in memory_region_access_valid"

  It's still broken as of 7fd51e68c34fcefdb4d6fd646ed3346f780f89f4.

  To reproduce, run

    wget http://ftp.netbsd.org/pub/NetBSD/NetBSD-9.0/images/NetBSD-9.0-spar=
c.iso
    qemu-system-sparc -nographic -cdrom NetBSD-9.0-sparc.iso -boot d

  The expected behavior is that the guest boots to the prompt

    Installation medium to load the additional utilities from:

  The observed behavior is a panic:

    [   1.0000050] system[0]: trap 0x29: pc=3D0xf0046b14 sfsr=3D0xb6 sfva=
=3D0x54000000
    [   1.0000050] cpu0: data fault: pc=3D0xf0046b14 addr=3D0x54000000 sfsr=
=3D0xb6<PERR=3D0x0,LVL=3D0x0,AT=3D0x5,FT=3D0x5,FAV,OW>
    [   1.0000050] panic: kernel fault
    [   1.0000050] halted

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892540/+subscriptions

