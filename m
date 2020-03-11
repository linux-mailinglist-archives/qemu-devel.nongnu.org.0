Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFEE181904
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 14:01:59 +0100 (CET)
Received: from localhost ([::1]:51440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC0zm-0007be-Eg
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 09:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51968)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>) id 1jC0yJ-0006Zb-D2
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 09:00:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vt@altlinux.org>) id 1jC0yI-0006U9-1M
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 09:00:27 -0400
Received: from vmicros1.altlinux.org ([194.107.17.57]:60240)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <vt@altlinux.org>)
 id 1jC0yH-0006Sa-Pm; Wed, 11 Mar 2020 09:00:25 -0400
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 1DDC672CCF0;
 Wed, 11 Mar 2020 16:00:23 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id 0A4CA4A4A16;
 Wed, 11 Mar 2020 16:00:23 +0300 (MSK)
Date: Wed, 11 Mar 2020 16:00:22 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] target/ppc: Fix rlwinm on ppc64
Message-ID: <20200311130022.sswvce3wx3dii4mf@altlinux.org>
References: <20200309204557.14836-1-vt@altlinux.org>
 <20200310231503.GR660117@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <20200310231503.GR660117@umbus.fritz.box>
User-Agent: NeoMutt/20171215-106-ac61c7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 194.107.17.57
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
Cc: qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David,

On Wed, Mar 11, 2020 at 10:15:03AM +1100, David Gibson wrote:
> On Mon, Mar 09, 2020 at 11:45:57PM +0300, Vitaly Chikunov wrote:
> > rlwinm cannot just AND with Mask if shift value is zero on ppc64 when
> > Mask Begin is greater than Mask End and high bits are set to 1.
> > 
> > Note that PowerISA 3.0B says that for `rlwinm' ROTL32 is used, and
> > ROTL32 is defined (in 3.3.14) so that rotated value should have two
> > copies of lower word of the source value.
> > 
> > This seems to be another incarnation of the fix from 820724d170
> > ("target-ppc: Fix rlwimi, rlwinm, rlwnm again"), except I leave
> > optimization when Mask value is less than 32 bits.
> > 
> > Fixes: 7b4d326f47 ("target-ppc: Use the new deposit and extract ops")
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> 
> Applied to ppc-for-5.0.

Thanks! FYI, there is at least one real case of this bug:
  https://github.com/iovisor/bcc/issues/2771
so this is not theoretical, and, probably, should go to the stable
too.

Thanks,


> 
> > ---
> >  target/ppc/translate.c | 20 +++++++++++---------
> >  1 file changed, 11 insertions(+), 9 deletions(-)
> > 
> > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > index 36fa27367c..127c82a24e 100644
> > --- a/target/ppc/translate.c
> > +++ b/target/ppc/translate.c
> > @@ -1938,15 +1938,17 @@ static void gen_rlwinm(DisasContext *ctx)
> >          me += 32;
> >  #endif
> >          mask = MASK(mb, me);
> > -        if (sh == 0) {
> > -            tcg_gen_andi_tl(t_ra, t_rs, mask);
> > -        } else if (mask <= 0xffffffffu) {
> > -            TCGv_i32 t0 = tcg_temp_new_i32();
> > -            tcg_gen_trunc_tl_i32(t0, t_rs);
> > -            tcg_gen_rotli_i32(t0, t0, sh);
> > -            tcg_gen_andi_i32(t0, t0, mask);
> > -            tcg_gen_extu_i32_tl(t_ra, t0);
> > -            tcg_temp_free_i32(t0);
> > +        if (mask <= 0xffffffffu) {
> > +            if (sh == 0) {
> > +                tcg_gen_andi_tl(t_ra, t_rs, mask);
> > +            } else {
> > +                TCGv_i32 t0 = tcg_temp_new_i32();
> > +                tcg_gen_trunc_tl_i32(t0, t_rs);
> > +                tcg_gen_rotli_i32(t0, t0, sh);
> > +                tcg_gen_andi_i32(t0, t0, mask);
> > +                tcg_gen_extu_i32_tl(t_ra, t0);
> > +                tcg_temp_free_i32(t0);
> > +            }
> >          } else {
> >  #if defined(TARGET_PPC64)
> >              tcg_gen_deposit_i64(t_ra, t_rs, t_rs, 32, 32);
> 
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson



