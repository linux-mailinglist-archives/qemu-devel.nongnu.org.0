Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC03B074C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 16:22:47 +0200 (CEST)
Received: from localhost ([::1]:58248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvhIc-0004NA-Ow
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 10:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1lvhHt-0003hf-Gl
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:22:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:35994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1lvhHr-0000dz-79
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:22:00 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A66A1611BF;
 Tue, 22 Jun 2021 14:21:57 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=hot-poop.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1lvhHn-0097g1-MJ; Tue, 22 Jun 2021 15:21:55 +0100
From: Marc Zyngier <maz@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v17 0/6] MTE support for KVM guest
Date: Tue, 22 Jun 2021 15:21:51 +0100
Message-Id: <162437105102.29544.14666831489362675099.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210621111716.37157-1-steven.price@arm.com>
References: <20210621111716.37157-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, will@kernel.org,
 steven.price@arm.com, linux-kernel@vger.kernel.org, Dave.Martin@arm.com,
 peter.maydell@linaro.org, julien.thierry.kdev@gmail.com,
 suzuki.poulose@arm.com, quintela@redhat.com, dgilbert@redhat.com,
 drjones@redhat.com, qemu-devel@nongnu.org, tglx@linutronix.de,
 james.morse@arm.com, richard.henderson@linaro.org, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=198.145.29.99; envelope-from=maz@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 21 Jun 2021 12:17:10 +0100, Steven Price wrote:
> This series adds support for using the Arm Memory Tagging Extensions
> (MTE) in a KVM guest.
> 
> Changes since v16[1]:
> 
>  - Dropped the first patch ("Handle race when synchronising tags") as
>    it's not KVM specific and by restricting MAP_SHARED in KVM there is
>    no longer a dependency.
> 
> [...]

Applied to next, thanks!

[1/6] arm64: mte: Sync tags for pages where PTE is untagged
      commit: 69e3b846d8a753f9f279f29531ca56b0f7563ad0
[2/6] KVM: arm64: Introduce MTE VM feature
      commit: ea7fc1bb1cd1b92b42b1d9273ce7e231d3dc9321
[3/6] KVM: arm64: Save/restore MTE registers
      commit: e1f358b5046479d2897f23b1d5b092687c6e7a67
[4/6] KVM: arm64: Expose KVM_ARM_CAP_MTE
      commit: 673638f434ee4a00319e254ade338c57618d6f7e
[5/6] KVM: arm64: ioctl to fetch/store tags in a guest
      commit: f0376edb1ddcab19a473b4bf1fbd5b6bbed3705b
[6/6] KVM: arm64: Document MTE capability and ioctl
      commit: 04c02c201d7e8149ae336ead69fb64e4e6f94bc9

I performed a number of changes in user_mem_abort(), so please
have a look at the result. It is also pretty late in the merge
cycle, so if anything looks amiss, I'll just drop it.

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



