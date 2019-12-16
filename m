Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECA011F508
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Dec 2019 00:22:55 +0100 (CET)
Received: from localhost ([::1]:34448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igGkQ-0008SJ-5h
	for lists+qemu-devel@lfdr.de; Sat, 14 Dec 2019 18:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1igGjW-0007kY-0i
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 18:21:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1igGjU-0007wK-Sr
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 18:21:57 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:55304)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1igGjU-0007vW-Od; Sat, 14 Dec 2019 18:21:56 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 918D923F85;
 Sat, 14 Dec 2019 18:21:54 -0500 (EST)
Date: Sun, 15 Dec 2019 10:21:51 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 01/10] dp8393x: Mask EOL bit from descriptor addresses
In-Reply-To: <7f28e2ae-e3d1-d4b8-f753-c418b72293c6@redhat.com>
Message-ID: <alpine.LNX.2.21.1.1912151020200.8@nippy.intranet>
References: <cover.1576286757.git.fthain@telegraphics.com.au>
 <7d220205700c43b15d6ae6cefd6520a97c763709.1576286757.git.fthain@telegraphics.com.au>
 <7f28e2ae-e3d1-d4b8-f753-c418b72293c6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 qemu-stable@nongnu.org, Herve Poussineau <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 14 Dec 2019, Philippe Mathieu-Daud? wrote:

> Hi Finn,
> 
> On 12/14/19 2:25 AM, Finn Thain wrote:
> > The LSB of descriptor address registers is used as an EOL flag.
> > It has to be masked when those registers are to be used as actual
> > addresses for copying memory around. But when the registers are
> > to be updated the EOL bit should not be masked.
> > 
> > Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> > ---
> >   hw/net/dp8393x.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> > index 3d991af163..164311c055 100644
> > --- a/hw/net/dp8393x.c
> > +++ b/hw/net/dp8393x.c
> > @@ -197,7 +197,7 @@ static uint32_t dp8393x_crba(dp8393xState *s)
> >     static uint32_t dp8393x_crda(dp8393xState *s)
> >   {
> > -    return (s->regs[SONIC_URDA] << 16) | s->regs[SONIC_CRDA];
> > +    return (s->regs[SONIC_URDA] << 16) | (s->regs[SONIC_CRDA] & 0xfffe);
> >   }
> >     static uint32_t dp8393x_rbwc(dp8393xState *s)
> > @@ -217,7 +217,7 @@ static uint32_t dp8393x_tsa(dp8393xState *s)
> >     static uint32_t dp8393x_ttda(dp8393xState *s)
> >   {
> > -    return (s->regs[SONIC_UTDA] << 16) | s->regs[SONIC_TTDA];
> > +    return (s->regs[SONIC_UTDA] << 16) | (s->regs[SONIC_TTDA] & 0xfffe);
> >   }
> >     static uint32_t dp8393x_wt(dp8393xState *s)
> > @@ -506,8 +506,8 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
> >                                sizeof(uint16_t) *
> >                                (4 + 3 * s->regs[SONIC_TFC]) * width,
> >                   MEMTXATTRS_UNSPECIFIED, (uint8_t *)s->data, size, 0);
> > -            s->regs[SONIC_CTDA] = dp8393x_get(s, width, 0) & ~0x1;
> > -            if (dp8393x_get(s, width, 0) & 0x1) {
> > +            s->regs[SONIC_CTDA] = dp8393x_get(s, width, 0);
> > +            if (s->regs[SONIC_CTDA] & 0x1) {
> 
> Can you add a definition for the EOL bit and use it, instead of these magic
> 0x1/0xfffe values? That way the meaning will be obvious for future reviewers.
> 

Sure. I'll prepare v2.

Thanks for your review.

