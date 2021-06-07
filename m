Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7C939E62C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 20:05:33 +0200 (CEST)
Received: from localhost ([::1]:48812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJcz-0004xn-2B
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 14:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lqIiq-0004y7-3r
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:07:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:49920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lqIij-0002mm-NC
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:07:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48E3B6101A;
 Mon,  7 Jun 2021 17:07:17 +0000 (UTC)
Date: Mon, 7 Jun 2021 18:07:14 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v14 2/8] arm64: Handle MTE tags zeroing in
 __alloc_zeroed_user_highpage()
Message-ID: <20210607170714.GA17957@arm.com>
References: <20210607110816.25762-1-steven.price@arm.com>
 <20210607110816.25762-3-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607110816.25762-3-steven.price@arm.com>
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

On Mon, Jun 07, 2021 at 12:08:10PM +0100, Steven Price wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
> 
> Currently, on an anonymous page fault, the kernel allocates a zeroed
> page and maps it in user space. If the mapping is tagged (PROT_MTE),
> set_pte_at() additionally clears the tags under a spinlock to avoid a
> race on the page->flags. In order to optimise the lock, clear the page
> tags on allocation in __alloc_zeroed_user_highpage() if the vma flags
> have VM_MTE set.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>

I think you can drop this patch now that Peter's series has been queued
via the arm64 tree:

https://lore.kernel.org/r/20210602235230.3928842-4-pcc@google.com

-- 
Catalin

