Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C495A39A66B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:56:45 +0200 (CEST)
Received: from localhost ([::1]:51280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqeC-0006Mk-Q4
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1loqVy-0002X1-Mv
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:48:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:53242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1loqVw-0005Hz-QC
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:48:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B2D161026;
 Thu,  3 Jun 2021 16:48:08 +0000 (UTC)
Date: Thu, 3 Jun 2021 17:48:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v13 5/8] KVM: arm64: Save/restore MTE registers
Message-ID: <20210603164805.GF20338@arm.com>
References: <20210524104513.13258-1-steven.price@arm.com>
 <20210524104513.13258-6-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524104513.13258-6-steven.price@arm.com>
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

On Mon, May 24, 2021 at 11:45:10AM +0100, Steven Price wrote:
> diff --git a/arch/arm64/include/asm/kvm_mte.h b/arch/arm64/include/asm/kvm_mte.h
> new file mode 100644
> index 000000000000..eae4bce9e269
> --- /dev/null
> +++ b/arch/arm64/include/asm/kvm_mte.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 ARM Ltd.

You may want to update some of the years.

> + */
> +#ifndef __ASM_KVM_MTE_H
> +#define __ASM_KVM_MTE_H
> +
> +#ifdef __ASSEMBLY__
> +
> +#include <asm/sysreg.h>
> +
> +#ifdef CONFIG_ARM64_MTE
> +
> +.macro mte_switch_to_guest g_ctxt, h_ctxt, reg1
> +alternative_if_not ARM64_MTE
> +	b	.L__skip_switch\@
> +alternative_else_nop_endif
> +	mrs	\reg1, hcr_el2
> +	and	\reg1, \reg1, #(HCR_ATA)
> +	cbz	\reg1, .L__skip_switch\@

Nitpick: TBZ would be shorter, though you need the bit number.

The patch looks fine (as per my understanding of the KVM context
switching code):

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

