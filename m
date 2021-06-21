Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFE53AE4A8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:19:41 +0200 (CEST)
Received: from localhost ([::1]:37536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvF9g-00014r-Nk
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lvF8j-0000N3-1p
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:18:41 -0400
Received: from foss.arm.com ([217.140.110.172]:50880)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lvF8g-0000Wi-FZ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:18:40 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DA03D6E;
 Mon, 21 Jun 2021 01:18:35 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D6FA3F718;
 Mon, 21 Jun 2021 01:18:32 -0700 (PDT)
Subject: Re: [PATCH v16 7/7] KVM: arm64: Document MTE capability and ioctl
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20210618132826.54670-1-steven.price@arm.com>
 <20210618132826.54670-8-steven.price@arm.com>
 <20210618145241.GG16116@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <1273c642-d2b0-b81d-2052-1f2f0deafdae@arm.com>
Date: Mon, 21 Jun 2021 09:18:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210618145241.GG16116@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On 18/06/2021 15:52, Catalin Marinas wrote:
> On Fri, Jun 18, 2021 at 02:28:26PM +0100, Steven Price wrote:
>> +When this capability is enabled all memory in (non-device) memslots must not
>> +used VM_SHARED, attempts to create a memslot with a VM_SHARED mmap will result
>> +in an -EINVAL return.
> 
> "must not used" doesn't sound right. Anyway, I'd remove VM_SHARED as
> that's a kernel internal and not something the VMM needs to be aware of.
> Just say something like "memslots must be mapped as shareable
> (MAP_SHARED)".

I think I meant "must not use" - and indeed memslots must *not* be
mapped as shareable. I'll update to this wording:

  When this capability is enabled all memory in memslots must be mapped as
  not-shareable (no MAP_SHARED), attempts to create a memslot with MAP_SHARED
  will result in an -EINVAL return.

> Otherwise:
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 

Thanks,

Steve

