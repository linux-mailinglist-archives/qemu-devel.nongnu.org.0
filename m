Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA392D310A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 18:30:11 +0100 (CET)
Received: from localhost ([::1]:53410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmgoU-0000jX-Mq
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 12:30:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1kmggT-0002Ke-QV
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:21:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:55900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1kmggR-0000GW-LD
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:21:53 -0500
Date: Tue, 8 Dec 2020 17:21:43 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
Message-ID: <20201208172143.GB13960@gaia>
References: <20201119184248.4bycy6ouvaxqdiiy@kamzik.brq.redhat.com>
 <db5ad775fa7cfe7defbd78d9ca6ccfd8@kernel.org>
 <c25c297e-e9b5-ab3f-e401-c21ddd4d2ad1@arm.com>
 <CAJc+Z1H7akXwDtVvQLiGVVyZ0DfmsxyJQhE7Sno6aAO9GaafEA@mail.gmail.com>
 <46fd98a2-ee39-0086-9159-b38c406935ab@arm.com>
 <CAFEAcA_Q8RSB-zcS8+cEfvWz_0U5GLzmsf12m_7BFjX8h-1hrA@mail.gmail.com>
 <b975422f-14fd-13b3-c8ca-e8b1a68c0837@arm.com>
 <0d0eb6da6a11f76d10e532c157181985@kernel.org>
 <20201207163405.GD1526@gaia> <874kkx5thq.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874kkx5thq.wl-maz@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=cmarinas@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Dave Martin <Dave.Martin@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Haibo Xu <haibo.xu@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm <kvmarm@lists.cs.columbia.edu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 07, 2020 at 07:03:13PM +0000, Marc Zyngier wrote:
> On Mon, 07 Dec 2020 16:34:05 +0000,
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Mon, Dec 07, 2020 at 04:05:55PM +0000, Marc Zyngier wrote:
> > > What I'd really like to see is a description of how shared memory
> > > is, in general, supposed to work with MTE. My gut feeling is that
> > > it doesn't, and that you need to turn MTE off when sharing memory
> > > (either implicitly or explicitly).
> > 
> > The allocation tag (in-memory tag) is a property assigned to a physical
> > address range and it can be safely shared between different processes as
> > long as they access it via pointers with the same allocation tag (bits
> > 59:56). The kernel enables such tagged shared memory for user processes
> > (anonymous, tmpfs, shmem).
> 
> I think that's one case where the shared memory scheme breaks, as we
> have two kernels in charge of their own tags, and they obviously can't
> be synchronised

Yes, if you can't trust the other entity to not change the tags, the
only option is to do an untagged access.

> > What we don't have in the architecture is a memory type which allows
> > access to tags but no tag checking. To access the data when the tags
> > aren't known, the tag checking would have to be disabled via either a
> > prctl() or by setting the PSTATE.TCO bit.
> 
> I guess that's point (3) in Steven's taxonomy. It still a bit ugly to
> fit in an existing piece of userspace, specially if it wants to use
> MTE for its own benefit.

I agree it's ugly. For the device DMA emulation case, the only sane way
is to mimic what a real device does - no tag checking. For a generic
implementation, this means that such shared memory should not be mapped
with PROT_MTE on the VMM side. I guess this leads to your point that
sharing doesn't work for this scenario ;).

> > The kernel accesses the user memory via the linear map using a match-all
> > tag 0xf, so no TCO bit toggling. For user, however, we disabled such
> > match-all tag and it cannot be enabled at run-time (at least not easily,
> > it's cached in the TLB). However, we already have two modes to disable
> > tag checking which Qemu could use when migrating data+tags.
> 
> I wonder whether we will have to have something kernel side to
> dump/reload tags in a way that matches the patterns used by live
> migration.

We have something related - ptrace dumps/resores the tags. Can the same
concept be expanded to a KVM ioctl?

-- 
Catalin

