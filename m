Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8200D3B1C1B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:09:54 +0200 (CEST)
Received: from localhost ([::1]:49852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw3Zh-0002eH-Il
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lw3Yw-0001dK-Mk
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:09:06 -0400
Received: from foss.arm.com ([217.140.110.172]:56980)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lw3Yu-0007Sv-RA
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:09:06 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9DADED1;
 Wed, 23 Jun 2021 07:09:03 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B3B43F718;
 Wed, 23 Jun 2021 07:09:01 -0700 (PDT)
Subject: Re: [PATCH v17 0/6] MTE support for KVM guest
To: Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
References: <20210621111716.37157-1-steven.price@arm.com>
 <162437105102.29544.14666831489362675099.b4-ty@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <7cc69f75-a6df-0a64-873e-69e438a43bdf@arm.com>
Date: Wed, 23 Jun 2021 15:09:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <162437105102.29544.14666831489362675099.b4-ty@kernel.org>
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
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, Thomas Gleixner <tglx@linutronix.de>,
 Dave Martin <Dave.Martin@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/06/2021 15:21, Marc Zyngier wrote:
> On Mon, 21 Jun 2021 12:17:10 +0100, Steven Price wrote:
>> This series adds support for using the Arm Memory Tagging Extensions
>> (MTE) in a KVM guest.
>>
>> Changes since v16[1]:
>>
>>  - Dropped the first patch ("Handle race when synchronising tags") as
>>    it's not KVM specific and by restricting MAP_SHARED in KVM there is
>>    no longer a dependency.
>>
>> [...]
> 
> Applied to next, thanks!
> 
> [1/6] arm64: mte: Sync tags for pages where PTE is untagged
>       commit: 69e3b846d8a753f9f279f29531ca56b0f7563ad0
> [2/6] KVM: arm64: Introduce MTE VM feature
>       commit: ea7fc1bb1cd1b92b42b1d9273ce7e231d3dc9321
> [3/6] KVM: arm64: Save/restore MTE registers
>       commit: e1f358b5046479d2897f23b1d5b092687c6e7a67
> [4/6] KVM: arm64: Expose KVM_ARM_CAP_MTE
>       commit: 673638f434ee4a00319e254ade338c57618d6f7e
> [5/6] KVM: arm64: ioctl to fetch/store tags in a guest
>       commit: f0376edb1ddcab19a473b4bf1fbd5b6bbed3705b
> [6/6] KVM: arm64: Document MTE capability and ioctl
>       commit: 04c02c201d7e8149ae336ead69fb64e4e6f94bc9
> 
> I performed a number of changes in user_mem_abort(), so please
> have a look at the result. It is also pretty late in the merge
> cycle, so if anything looks amiss, I'll just drop it.

It all looks good to me - thanks for making those changes.

Steve

