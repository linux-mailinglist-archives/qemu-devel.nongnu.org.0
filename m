Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA523ACF60
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:44:32 +0200 (CEST)
Received: from localhost ([::1]:40006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGfX-0004ig-Ht
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1luGe7-0003CM-FD
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:43:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:50334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1luGe4-000159-UM
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:43:02 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B71CF61222;
 Fri, 18 Jun 2021 15:42:58 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1luGe0-008TnC-Er; Fri, 18 Jun 2021 16:42:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 18 Jun 2021 16:42:56 +0100
From: Marc Zyngier <maz@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v16 1/7] arm64: mte: Handle race when synchronising tags
In-Reply-To: <20210618144013.GE16116@arm.com>
References: <20210618132826.54670-1-steven.price@arm.com>
 <20210618132826.54670-2-steven.price@arm.com>
 <20210618144013.GE16116@arm.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <3551d8ea9c9464e982d75acdd5f855b4@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, steven.price@arm.com,
 will@kernel.org, james.morse@arm.com, julien.thierry.kdev@gmail.com,
 suzuki.poulose@arm.com, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dave.Martin@arm.com, mark.rutland@arm.com, tglx@linutronix.de,
 qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org, drjones@redhat.com
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
 Peter Maydell <peter.maydell@linaro.org>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, qemu-devel@nongnu.org,
 Dave Martin <Dave.Martin@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Steven Price <steven.price@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-06-18 15:40, Catalin Marinas wrote:
> On Fri, Jun 18, 2021 at 02:28:20PM +0100, Steven Price wrote:
>> mte_sync_tags() used test_and_set_bit() to set the PG_mte_tagged flag
>> before restoring/zeroing the MTE tags. However if another thread were 
>> to
>> race and attempt to sync the tags on the same page before the first
>> thread had completed restoring/zeroing then it would see the flag is
>> already set and continue without waiting. This would potentially 
>> expose
>> the previous contents of the tags to user space, and cause any updates
>> that user space makes before the restoring/zeroing has completed to
>> potentially be lost.
>> 
>> Since this code is run from atomic contexts we can't just lock the 
>> page
>> during the process. Instead implement a new (global) spinlock to 
>> protect
>> the mte_sync_page_tags() function.
>> 
>> Fixes: 34bfeea4a9e9 ("arm64: mte: Clear the tags when a page is mapped 
>> in user-space with PROT_MTE")
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
> 
> Although I reviewed this patch, I think we should drop it from this
> series and restart the discussion with the Chromium guys on what/if 
> they
> need PROT_MTE with MAP_SHARED. It currently breaks if you have two
> PROT_MTE mappings but if they are ok with only one of the mappings 
> being
> PROT_MTE, I'm happy to just document it.
> 
> Not sure whether subsequent patches depend on it though.

I'd certainly like it to be independent of the KVM series, specially
as this series is pretty explicit that this MTE lock is not required
for KVM.

This will require some rework of patch #2, I believe. And while we're
at it, a rebase on 5.13-rc4 wouldn't hurt, as both patches #3 and #5
conflict with it...

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

