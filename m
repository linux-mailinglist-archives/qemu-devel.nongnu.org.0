Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DAE2D4AF9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:51:30 +0100 (CET)
Received: from localhost ([::1]:33014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5Un-0000O4-ME
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:51:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1kn4N8-0005qn-5H
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:39:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:39220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1kn4N5-0001Cb-RN
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:39:29 -0500
Date: Wed, 9 Dec 2020 18:39:20 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
Message-ID: <20201209183920.GI13566@gaia>
References: <b975422f-14fd-13b3-c8ca-e8b1a68c0837@arm.com>
 <0d0eb6da6a11f76d10e532c157181985@kernel.org>
 <20201207163405.GD1526@gaia> <874kkx5thq.wl-maz@kernel.org>
 <20201208172143.GB13960@gaia>
 <7ff14490e253878d0735633b792e1ea9@kernel.org>
 <20201209124443.GB13566@gaia>
 <ef14a5158fc65c00f6c3c842cfa83b2c@kernel.org>
 <20201209152741.GC13566@gaia>
 <8c39b104-39c3-7cca-82b9-2e47d7cb9a9a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c39b104-39c3-7cca-82b9-2e47d7cb9a9a@linaro.org>
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
 Marc Zyngier <maz@kernel.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Haibo Xu <haibo.xu@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm <kvmarm@lists.cs.columbia.edu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 09, 2020 at 12:27:59PM -0600, Richard Henderson wrote:
> On 12/9/20 9:27 AM, Catalin Marinas wrote:
> > On Wed, Dec 09, 2020 at 01:25:18PM +0000, Marc Zyngier wrote:
> >> Would this syscall operate on the guest address space? Or on the VMM's
> >> own mapping?
> ...
> > Whatever is easier for the VMM, I don't think it matters as long as the
> > host kernel can get the actual physical address (and linear map
> > correspondent). Maybe simpler if it's the VMM address space as the
> > kernel can check the access permissions in case you want to hide the
> > guest memory from the VMM for other reasons (migration is also off the
> > table).
> 
> Indeed, such a syscall is no longer specific to vmm's and may be used for any
> bulk move of tags that userland might want.

For CRIU, I think the current ptrace interface would do. With VMMs, the
same remote VM model doesn't apply (the "remote" VM is actually the
guest memory). I'd keep this under a KVM ioctl() number rather than a
new, specific syscall.

> > Without syscalls, an option would be for the VMM to create two mappings:
> > one with PROT_MTE for migration and the other without for normal DMA
> > etc. That's achievable using memfd_create() or shm_open() and two mmap()
> > calls, only one having PROT_MTE. The VMM address space should be
> > sufficiently large to map two guest IPAs.
> 
> I would have thought that the best way is to use TCO, so that we don't have to
> have dual mappings (and however many MB of extra page tables that might imply).

The problem appears when the VMM wants to use MTE itself (e.g. linked
against an MTE-aware glibc), toggling TCO is no longer generic enough,
especially when it comes to device emulation.

-- 
Catalin

