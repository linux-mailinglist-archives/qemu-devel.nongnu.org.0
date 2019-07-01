Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A721B657
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 14:48:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQANL-0001FW-By
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 08:48:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Dave.Martin@arm.com>) id 1hQALl-0000eo-3B
	for qemu-devel@nongnu.org; Mon, 13 May 2019 08:46:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Dave.Martin@arm.com>) id 1hQALi-0007sI-Of
	for qemu-devel@nongnu.org; Mon, 13 May 2019 08:46:37 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:51460
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Dave.Martin@arm.com>)
	id 1hQAGp-0005p5-PS; Mon, 13 May 2019 08:41:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 618D780D;
	Mon, 13 May 2019 05:41:30 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAAC03F6C4;
	Mon, 13 May 2019 05:41:28 -0700 (PDT)
Date: Mon, 13 May 2019 13:41:26 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20190513124126.GF28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
	<20190512083624.8916-12-drjones@redhat.com>
	<20190513112635.GD28398@e103592.cambridge.arm.com>
	<20190513123023.h4q5sihktqctkgml@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513123023.h4q5sihktqctkgml@kamzik.brq.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
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

On Mon, May 13, 2019 at 01:30:23PM +0100, Andrew Jones wrote:
> On Mon, May 13, 2019 at 12:26:36PM +0100, Dave Martin wrote:
> > On Sun, May 12, 2019 at 09:36:22AM +0100, Andrew Jones wrote:
> > > Introduce another cpu property to control SVE vector lengths,
> > > sve-vls-map, which allows the user to explicitly select the
> > > set of vector lengths the guest can use. The map must conform
> > > to QEMU's limits and architectural constraints, checked when
> > > the property is set. Inconsistencies with sve-max-vq are also
> > > checked. The bit number of a set bit in the map represents the
> > > allowed vector length in number of quadwords.
> > > 
> > > Note, as the map is implemented with a single 64-bit word we
> > > currently only support up to 8192-bit vectors. As QEMU and
> > > KVM only support up to 2048-bit vectors then this sufficient
> > > now, and probably for some time. Extending the bitmap beyond
> > > a single word will likely require changing the property to
> > > a string and adding yet another parser to QEMU.
> > > 
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > ---
> > >  target/arm/cpu.c     |  4 +++
> > >  target/arm/cpu.h     |  3 ++
> > >  target/arm/cpu64.c   | 70 +++++++++++++++++++++++++++++++++++++++++---
> > >  target/arm/helper.c  | 10 ++++++-
> > >  target/arm/monitor.c |  9 ++++--
> > >  5 files changed, 88 insertions(+), 8 deletions(-)
> > > 
> > 
> > [...]
> > 
> > > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > > index 8292d547e8f9..f0d0ce759ba8 100644
> > > --- a/target/arm/cpu.h
> > > +++ b/target/arm/cpu.h
> > > @@ -920,6 +920,9 @@ struct ARMCPU {
> > >  
> > >      /* Used to set the maximum vector length the cpu will support.  */
> > >      uint32_t sve_max_vq;
> > > +
> > > +    /* Each bit represents a supported vector length of (bitnum * 16) bytes */
> > > +    uint64_t sve_vls_map;
> > 
> > Just to be clear, the representation here is different from the
> > representation in KVM_REG_ARM64_SVE_VLS?
> > 
> > In the latter, bit n represents vector length ((n + 1) * 16) bytes.
> 
> KVM also uses bitnum * 16. bitnum is the the bit number, not the shift.

Can you point to the relevant kernel code?  This isn't what I thought I
wrote...

> So you can't have bitnum=0. 'n' must be a shift, as it would need to
> allow zero in order to represent KVM_ARM64_SVE_VQ_MIN.

[...]

> > > +static void cpu_set_sve_vls_map(Object *obj, Visitor *v, const char *name,
> > > +                                void *opaque, Error **errp)
> > > +{
> > > +    ARMCPU *cpu = ARM_CPU(obj);
> > > +    Error *err = NULL;
> > > +    uint64_t mask = ~(BIT_MASK(ARM_MAX_VQ - 1) - 1);
> > > +    int i;
> > > +
> > > +    visit_type_uint64(v, name, &cpu->sve_vls_map, errp);
> > > +
> > > +    if (!err) {
> > > +        if (cpu->sve_vls_map == 0) {
> > > +            error_setg(&err, "SVE vector length map cannot be zero");
> > 
> > Maybe say "empty" here, since the map represents a set?
> 
> Empty does sound better when considering the map represents a set, but
> the user will be inputting a number for the map, so zero will be what
> they attempted to input.

If the user is inputting the encoded number directly, I guess it makes
sense to describe the empty set as "zero".

> > (But it this is just for debug rather than reporting errors to the user,
> > it probably doesn't matter much.)
> 
> I'm also not too worried about which term we use, so I'm happy to change
> it if you'd like.

I guess I don't have a strong opinion.

[...]

> > > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > > index 1e6eb0d0f360..bedec1ea0b27 100644
> > > --- a/target/arm/helper.c
> > > +++ b/target/arm/helper.c
> > > @@ -5254,12 +5254,20 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
> > >  static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> > >                        uint64_t value)
> > >  {
> > > +    ARMCPU *cpu = arm_env_get_cpu(env);
> > >      int cur_el = arm_current_el(env);
> > >      int old_len = sve_zcr_len_for_el(env, cur_el);
> > >      int new_len;
> > >  
> > >      /* Bits other than [3:0] are RAZ/WI.  */
> > > -    raw_write(env, ri, value & 0xf);
> > > +    value &= 0xf;
> > 
> > You might want to sanity-check that the max vq you configured for the
> > vcpu is <= 16 here.
> 
> It's already checked by the cpu property set function at input time.

The check is in one place, but the assumptions based on it are
potentially all over the place -- it may be tricky to track them
all down if you ever add support for >8192-bit vectors.

(Not a big deal from my point of view, but I'd migration to larger
vectors to be as smooth as reasonably possible if we ever find we have
to do it.)
 
Cheers
---Dave

