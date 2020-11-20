Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39CD2BA6B1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 10:57:21 +0100 (CET)
Received: from localhost ([::1]:57170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg3AO-00010f-HX
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 04:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1kg39M-0000Z9-EH
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:56:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:44426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1kg39K-0008K1-KN
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:56:16 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1B9F22244;
 Fri, 20 Nov 2020 09:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605866172;
 bh=VVkthN6PzsNwKav+jWWYSe0oOoxcnTuHAa2bW9xdrDk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JlrTMzujpVHAOquvVdCT/TeBVpQc9kSlLkdIIHP9135juQpOAi/z/xxwAM8ARp6Jc
 g7gIsav3XkXJ2n250Yjt7HUdDMJBusaeWwC7fss+cFVmZrHSWcXl55swf3T/6MCQAJ
 CHXtwiv8tpj+QdbNUoJpFPlDvUN9ZTcbIge9ZxjA=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kg39G-00CDQp-FA; Fri, 20 Nov 2020 09:56:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 20 Nov 2020 09:56:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
In-Reply-To: <c25c297e-e9b5-ab3f-e401-c21ddd4d2ad1@arm.com>
References: <20201119153901.53705-1-steven.price@arm.com>
 <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
 <20201119184248.4bycy6ouvaxqdiiy@kamzik.brq.redhat.com>
 <db5ad775fa7cfe7defbd78d9ca6ccfd8@kernel.org>
 <c25c297e-e9b5-ab3f-e401-c21ddd4d2ad1@arm.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <d615a77783bbfb60d3b1a9ab4b33c1dc@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: steven.price@arm.com, drjones@redhat.com,
 peter.maydell@linaro.org, mark.rutland@arm.com, dgilbert@redhat.com,
 Haibo.Xu@arm.com, suzuki.poulose@arm.com, qemu-devel@nongnu.org,
 catalin.marinas@arm.com, quintela@redhat.com, richard.henderson@linaro.org,
 linux-kernel@vger.kernel.org, Dave.Martin@arm.com, james.morse@arm.com,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, will@kernel.org,
 kvmarm@lists.cs.columbia.edu, julien.thierry.kdev@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=198.145.29.99; envelope-from=maz@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Haibo Xu <Haibo.Xu@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 James Morse <james.morse@arm.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 kvmarm <kvmarm@lists.cs.columbia.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Julien Thierry <julien.thierry.kdev@gmail.com>, Will Deacon <will@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-11-20 09:50, Steven Price wrote:
> On 19/11/2020 19:11, Marc Zyngier wrote:

> Does this sound reasonable?
> 
> I'll clean up the set_pte_at() change and post a v6 later today.

Please hold on. I still haven't reviewed your v5, nor have I had time
to read your reply to my comments on v4.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

