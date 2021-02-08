Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E726B31415C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:12:22 +0100 (CET)
Received: from localhost ([::1]:60698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DpV-0006VI-VI
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9AOC-0004jW-Du
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:31:58 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9AO8-0003PD-DM
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:31:56 -0500
Received: by mail-ed1-x531.google.com with SMTP id s5so19392712edw.8
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 09:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=150RTcQf9BfKKICDDXV9LKFJabVH26+mj9gc5y6fe7Y=;
 b=hyAFs0fKGKFRmcciR03ZZ+YgXacp92jIDmnU50sMK4A9BRuJZf1z7VY29bDmosfHTb
 1WxxFJmX4Gx2fA5LbII7eG20wFGqZn2bS948AI6OJ6Alo0QsDcr/UWtsoB9PEoSSrQs6
 Sgp9ku+9stH6xnurZ6pYqxXLqFor2p8XQ8xdOHBcBbW6DZ9qjJXHVcwNrJ9g2FJfHgrr
 nJ7wG+20YbrL/0Rdm7sCRiO2XEvUYsLQR+ZhObZcRDg0iMfiwvTqtzC1QFMWLyLnPeZW
 eyTK7lotvYRoGNA1ptcR3iRB9VOCPrva6py9K0rLj2MnNZz0HANq9733DQWdvkSShO8W
 u1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=150RTcQf9BfKKICDDXV9LKFJabVH26+mj9gc5y6fe7Y=;
 b=a6g1O/v9eO/1+lqFhzi31p48fVLfIq6BdiW+qcXbkeGfsVPzxih5kCg7MG7wHc8eOS
 sTI2jBMBshkHZIEI+3u2eC3gTX35VDuBhdIw+A8W8itQObOzYuh64Hg9qyIQj0c5XGnR
 mGlbRs85qdsCvgg/WUwG0TK9u+u1a2ZSNzZAl02SQjpdKODLpkX0YgLayj+HaX8zvGiw
 mN8GUBdrL08QBtpDb5t5ij+6GSTPZJhxThhU6QFIzNyUT9VT4yLo61Wi6LK+Jv6FzVkh
 dKiItz0/UAEw6ebpeBvw8+nOGY6vg+cmamquQxqGvIp5iCcOjWiu9uqlnQq5kDW9GoW+
 2dvg==
X-Gm-Message-State: AOAM531GysnXmO8KJwa99FQf7r5KWnjDi8VM7cxCsIpCwHCAw0w1WuPE
 rxe+Z0JlAZxnSolYlpx92Wo2GoIi7XDvf7isbX7ajA==
X-Google-Smtp-Source: ABdhPJyfU7DR5l4b18tnpHL187lOP8zLT1R2zc8ro9MwTmAB+zuO7xlpf0gqcrlNJL178r53Bg3pYOpuitw0w/ezOBI=
X-Received: by 2002:a50:e80d:: with SMTP id e13mr17842705edn.251.1612805510357; 
 Mon, 08 Feb 2021 09:31:50 -0800 (PST)
MIME-Version: 1.0
References: <20210205135803.48321-1-steven.price@arm.com>
 <20210205135803.48321-6-steven.price@arm.com>
In-Reply-To: <20210205135803.48321-6-steven.price@arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 17:31:39 +0000
Message-ID: <CAFEAcA99kV_d6ev9wC4ySiyoD7Cp=HCD0v2bBhGSOU-KrzkqaQ@mail.gmail.com>
Subject: Re: [RFC PATCH v8 5/5] KVM: arm64: ioctl to fetch/store tags in a
 guest
To: Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm <kvmarm@lists.cs.columbia.edu>,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 13:58, Steven Price <steven.price@arm.com> wrote:
>
> The VMM may not wish to have it's own mapping of guest memory mapped
> with PROT_MTE because this causes problems if the VMM has tag checking
> enabled (the guest controls the tags in physical RAM and it's unlikely
> the tags are correct for the VMM).
>
> Instead add a new ioctl which allows the VMM to easily read/write the
> tags from guest memory, allowing the VMM's mapping to be non-PROT_MTE
> while the VMM can still read/write the tags for the purpose of
> migration.
>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  arch/arm64/include/uapi/asm/kvm.h | 13 +++++++
>  arch/arm64/kvm/arm.c              | 57 +++++++++++++++++++++++++++++++
>  include/uapi/linux/kvm.h          |  1 +
>  3 files changed, 71 insertions(+)

Missing the update to the docs in Documentation/virtual/kvm/api.txt :-)

thanks
-- PMM

