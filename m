Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A203AB363
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:16:44 +0200 (CEST)
Received: from localhost ([::1]:54110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqwr-0008Mw-Nk
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1ltqtu-0006Pz-Cs
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:13:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:53906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1ltqtm-0005St-5y
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:13:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C580D610EA;
 Thu, 17 Jun 2021 12:13:24 +0000 (UTC)
Date: Thu, 17 Jun 2021 13:13:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v15 0/7] MTE support for KVM guest
Message-ID: <20210617121322.GC6314@arm.com>
References: <20210614090525.4338-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614090525.4338-1-steven.price@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=cmarinas@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, qemu-devel@nongnu.org,
 Marc Zyngier <maz@kernel.org>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 14, 2021 at 10:05:18AM +0100, Steven Price wrote:
> I realise there are still open questions[1] around the performance of
> this series (the 'big lock', tag_sync_lock, introduced in the first
> patch). But there should be no impact on non-MTE workloads and until we
> get real MTE-enabled hardware it's hard to know whether there is a need
> for something more sophisticated or not. Peter Collingbourne's patch[3]
> to clear the tags at page allocation time should hide more of the impact
> for non-VM cases. So the remaining concern is around VM startup which
> could be effectively serialised through the lock.
[...]
> [1]: https://lore.kernel.org/r/874ke7z3ng.wl-maz%40kernel.org

Start-up, VM resume, migration could be affected by this lock, basically
any time you fault a page into the guest. As you said, for now it should
be fine as long as the hardware doesn't support MTE or qemu doesn't
enable MTE in guests. But the problem won't go away.

We have a partial solution with an array of locks to mitigate against
this but there's still the question of whether we should actually bother
for something that's unlikely to happen in practice: MAP_SHARED memory
in guests (ignoring the stage 1 case for now).

If MAP_SHARED in guests is not a realistic use-case, we have the vma in
user_mem_abort() and if the VM_SHARED flag is set together with MTE
enabled for guests, we can reject the mapping.

We can discuss the stage 1 case separately from this series.

-- 
Catalin

