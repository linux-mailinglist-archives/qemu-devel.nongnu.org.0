Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927381B770
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 15:53:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQBOV-0004is-MX
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 09:53:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1hQBM2-00039x-IS
	for qemu-devel@nongnu.org; Mon, 13 May 2019 09:50:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1hQBGa-0004s6-Ec
	for qemu-devel@nongnu.org; Mon, 13 May 2019 09:45:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55434)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1hQBGY-0004lz-Nn; Mon, 13 May 2019 09:45:18 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 008D23091761;
	Mon, 13 May 2019 13:45:18 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-151.ams2.redhat.com
	[10.36.116.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C35E1001943;
	Mon, 13 May 2019 13:45:15 +0000 (UTC)
Date: Mon, 13 May 2019 15:45:12 +0200
From: Andrew Jones <drjones@redhat.com>
To: Dave Martin <Dave.Martin@arm.com>
Message-ID: <20190513134512.alclwrqnxlyai6uy@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
	<20190512083624.8916-12-drjones@redhat.com>
	<20190513112635.GD28398@e103592.cambridge.arm.com>
	<20190513123023.h4q5sihktqctkgml@kamzik.brq.redhat.com>
	<20190513124126.GF28398@e103592.cambridge.arm.com>
	<20190513125740.ukyx4vuili3f5wbe@kamzik.brq.redhat.com>
	<20190513131248.GI28398@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513131248.GI28398@e103592.cambridge.arm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 13 May 2019 13:45:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 11/13] target/arm/cpu64: max cpu: Introduce
 sve-vls-map
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"abologna@redhat.com" <abologna@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 13, 2019 at 02:12:48PM +0100, Dave Martin wrote:
> On Mon, May 13, 2019 at 01:57:40PM +0100, Andrew Jones wrote:
> > On Mon, May 13, 2019 at 01:41:26PM +0100, Dave Martin wrote:
> > > On Mon, May 13, 2019 at 01:30:23PM +0100, Andrew Jones wrote:
> > > > On Mon, May 13, 2019 at 12:26:36PM +0100, Dave Martin wrote:
> > > > > On Sun, May 12, 2019 at 09:36:22AM +0100, Andrew Jones wrote:
> > > > > > Introduce another cpu property to control SVE vector lengths,
> > > > > > sve-vls-map, which allows the user to explicitly select the
> > > > > > set of vector lengths the guest can use. The map must conform
> > > > > > to QEMU's limits and architectural constraints, checked when
> > > > > > the property is set. Inconsistencies with sve-max-vq are also
> > > > > > checked. The bit number of a set bit in the map represents the
> > > > > > allowed vector length in number of quadwords.
> > > > > > 
> > > > > > Note, as the map is implemented with a single 64-bit word we
> > > > > > currently only support up to 8192-bit vectors. As QEMU and
> > > > > > KVM only support up to 2048-bit vectors then this sufficient
> > > > > > now, and probably for some time. Extending the bitmap beyond
> > > > > > a single word will likely require changing the property to
> > > > > > a string and adding yet another parser to QEMU.
> > > > > > 
> > > > > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > > > > ---
> > > > > >  target/arm/cpu.c     |  4 +++
> > > > > >  target/arm/cpu.h     |  3 ++
> > > > > >  target/arm/cpu64.c   | 70 +++++++++++++++++++++++++++++++++++++++++---
> > > > > >  target/arm/helper.c  | 10 ++++++-
> > > > > >  target/arm/monitor.c |  9 ++++--
> > > > > >  5 files changed, 88 insertions(+), 8 deletions(-)
> > > > > > 
> > > > > 
> > > > > [...]
> > > > > 
> > > > > > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > > > > > index 8292d547e8f9..f0d0ce759ba8 100644
> > > > > > --- a/target/arm/cpu.h
> > > > > > +++ b/target/arm/cpu.h
> > > > > > @@ -920,6 +920,9 @@ struct ARMCPU {
> > > > > >  
> > > > > >      /* Used to set the maximum vector length the cpu will support.  */
> > > > > >      uint32_t sve_max_vq;
> > > > > > +
> > > > > > +    /* Each bit represents a supported vector length of (bitnum * 16) bytes */
> > > > > > +    uint64_t sve_vls_map;
> > > > > 
> > > > > Just to be clear, the representation here is different from the
> > > > > representation in KVM_REG_ARM64_SVE_VLS?
> > > > > 
> > > > > In the latter, bit n represents vector length ((n + 1) * 16) bytes.
> > > > 
> > > > KVM also uses bitnum * 16. bitnum is the the bit number, not the shift.
> > > 
> > > Can you point to the relevant kernel code?  This isn't what I thought I
> > > wrote...
> > 
> > The Documentation/virtual/kvm/api.txt documentation has
> > 
> >  > if (vq >= SVE_VQ_MIN && vq <= SVE_VQ_MAX &&
> >  >    ((vector_lengths[(vq - KVM_ARM64_SVE_VQ_MIN) / 64] >>
> >  >                ((vq - KVM_ARM64_SVE_VQ_MIN) % 64)) & 1))
> >  >        /* Vector length vq * 16 bytes supported */
> >  > else
> >  >        /* Vector length vq * 16 bytes not supported */
> > 
> > Taking vq=1, we check (vector_lengths[0] >> 0) to see if we have the
> > length (1 * 16) bytes. Since bitnum 1 is (1 << 0) that means the shift
> > is zero and (bitnum * 16) is the same as (vq * 16). With ((n + 1) * 16),
> > n would have to be zero, which is not a valid bitnum, but is a valid
> > bit shift.
> 
> OK, so it sounds like the interpretation of the KVM ABI is what I intended.
> 
> What is "bitnum" though?  Most of the time, people seem to number bits
> starting from 0 -- though of course that's just a convention.

Eh, I see the problem. I used the word 'number', when I meant 'position'.
Indeed the bit number of bit position 1 is zero. Sorry about the confusion.
For v2 I can try to ensure I don't use the wrong terminology.

> 
> > > > So you can't have bitnum=0. 'n' must be a shift, as it would need to
> > > > allow zero in order to represent KVM_ARM64_SVE_VQ_MIN.
> 
> [...]
> 
> > > > > > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > > > > > index 1e6eb0d0f360..bedec1ea0b27 100644
> > > > > > --- a/target/arm/helper.c
> > > > > > +++ b/target/arm/helper.c
> > > > > > @@ -5254,12 +5254,20 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
> > > > > >  static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> > > > > >                        uint64_t value)
> > > > > >  {
> > > > > > +    ARMCPU *cpu = arm_env_get_cpu(env);
> > > > > >      int cur_el = arm_current_el(env);
> > > > > >      int old_len = sve_zcr_len_for_el(env, cur_el);
> > > > > >      int new_len;
> > > > > >  
> > > > > >      /* Bits other than [3:0] are RAZ/WI.  */
> > > > > > -    raw_write(env, ri, value & 0xf);
> > > > > > +    value &= 0xf;
> > > > > 
> > > > > You might want to sanity-check that the max vq you configured for the
> > > > > vcpu is <= 16 here.
> > > > 
> > > > It's already checked by the cpu property set function at input time.
> > > 
> > > The check is in one place, but the assumptions based on it are
> > > potentially all over the place -- it may be tricky to track them
> > > all down if you ever add support for >8192-bit vectors.
> > > 
> > > (Not a big deal from my point of view, but I'd migration to larger
> > > vectors to be as smooth as reasonably possible if we ever find we have
> > > to do it.)
> > >
> > 
> > Adding asserts might be a good idea to catch bugs when expanding the
> > supported vector lengths. I can certainly add one here. Maybe Richard
> > has some ideas as well for this.
> 
> Sure, just wanted to make the point, since this might be an issue in the
> future.
> 
> The compromise in the kernel implementation was similar: in many places
> the code is agnostic to larger vectors, but in a few (such as the ioctl
> reg accessors) this seemed too cumbersome to justify for now, so I went
> with a simpler implementation with some added sanity-checks.
>

Thanks,
drew

