Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568863AE53D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:49:28 +0200 (CEST)
Received: from localhost ([::1]:45000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFcV-0001QS-Ef
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lvFbP-0000k3-UB
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:48:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:55884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lvFbL-0003Ec-U6
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:48:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 399FA60C3D;
 Mon, 21 Jun 2021 08:48:10 +0000 (UTC)
Date: Mon, 21 Jun 2021 09:48:07 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v16 7/7] KVM: arm64: Document MTE capability and ioctl
Message-ID: <20210621084806.GA11552@arm.com>
References: <20210618132826.54670-1-steven.price@arm.com>
 <20210618132826.54670-8-steven.price@arm.com>
 <20210618145241.GG16116@arm.com>
 <1273c642-d2b0-b81d-2052-1f2f0deafdae@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1273c642-d2b0-b81d-2052-1f2f0deafdae@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=cmarinas@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 qemu-devel@nongnu.org, Marc Zyngier <maz@kernel.org>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 09:18:31AM +0100, Steven Price wrote:
> On 18/06/2021 15:52, Catalin Marinas wrote:
> > On Fri, Jun 18, 2021 at 02:28:26PM +0100, Steven Price wrote:
> >> +When this capability is enabled all memory in (non-device) memslots must not
> >> +used VM_SHARED, attempts to create a memslot with a VM_SHARED mmap will result
> >> +in an -EINVAL return.
> > 
> > "must not used" doesn't sound right. Anyway, I'd remove VM_SHARED as
> > that's a kernel internal and not something the VMM needs to be aware of.
> > Just say something like "memslots must be mapped as shareable
> > (MAP_SHARED)".
> 
> I think I meant "must not use" - and indeed memslots must *not* be
> mapped as shareable. I'll update to this wording:
> 
>   When this capability is enabled all memory in memslots must be mapped as
>   not-shareable (no MAP_SHARED), attempts to create a memslot with MAP_SHARED
>   will result in an -EINVAL return.

It looks fine. Feel free to keep my reviewed-by.

-- 
Catalin

