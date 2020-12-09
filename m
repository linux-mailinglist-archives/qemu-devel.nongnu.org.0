Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780482D4AA7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:42:32 +0100 (CET)
Received: from localhost ([::1]:40008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5M7-0008Go-HH
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:42:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn4CD-0003SZ-EU
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:28:14 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn4C7-00064A-9u
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:28:12 -0500
Received: by mail-oi1-x242.google.com with SMTP id p126so2735354oif.7
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EMdXn/we+ASAb31gRQdJr6+sKTP4Qjrqm7l5vM7/2N0=;
 b=uBjDfzU8tJe6+V30aOzUET0Fi/1DWGtprJdABI/JEt+ZE2s94Y30fhKOBxmqCUuDeF
 fCcuThp2wkHoxOI9GJmd/AiRPoHa0OZCK5WvKsYdMHLxuoZqZkPae4ik5Rs50LTv7UeP
 WBe9p+LoNI1L76wVobsLQC868+hlmkTN5wIhYZYSXca0eIiTDq7OWBi6ZpodCQNmeqSp
 f9iV5sMKIXZ7cde2m1WxX3kjYqxldYCrtpw2IF15hMkzldHDeUBuifaPwEl/hkntsmNy
 KxRuzDUyZHihNDp5TVjZ9G5WE5RYOOhQgQS2IIcd5F33cWzTIOb/CxOyKXAwwGHpqBlh
 CLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EMdXn/we+ASAb31gRQdJr6+sKTP4Qjrqm7l5vM7/2N0=;
 b=ROp1CjQ+wWbDy/NmX93+ensxb/cayswBoBN69rsk6qJDqrLwrPL4fYzmS3ZFyHZ9Iy
 65AYPWPdmiCFqT5rAGm0RQFPVLtKK1rCsMZJMHlnXvg93aWwEYJoiYGT/uxF68RG99dH
 sM0FszxiVDJ8HjUMUdJWHbZLg2f3TOBR/GEIx8CwpmWTkkUEOaewq5Kavk0rszdqBy/O
 SWhPrGj66cex+jXVOOJilco1KTm70jPbQJ13eaiMsTBvLvj6urqrgwyUGsJCP2iOLURu
 4aVLozIXacFxnB+0i8S/nR/exSIcSSnH7w7rWfRUQ547SNa2ov6tg1Q7l9QjtAAiU7ER
 CFkw==
X-Gm-Message-State: AOAM532NLxqjjZIwXGURBwQAAacLG1meOCPQwynV1PYIYCDmAeq50Mtq
 jGv+6FnXofrILS9W81UUJX2hXg==
X-Google-Smtp-Source: ABdhPJwXF7F87GnE1UfMS2EBOABWhLPgRg1PmpgpVMqLuUiQHVmPOMnB+cm8yzRRg6ho4iiOn74A4w==
X-Received: by 2002:aca:5889:: with SMTP id m131mr2737051oib.41.1607538485699; 
 Wed, 09 Dec 2020 10:28:05 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k5sm461045oot.30.2020.12.09.10.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 10:28:04 -0800 (PST)
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>
References: <46fd98a2-ee39-0086-9159-b38c406935ab@arm.com>
 <CAFEAcA_Q8RSB-zcS8+cEfvWz_0U5GLzmsf12m_7BFjX8h-1hrA@mail.gmail.com>
 <b975422f-14fd-13b3-c8ca-e8b1a68c0837@arm.com>
 <0d0eb6da6a11f76d10e532c157181985@kernel.org> <20201207163405.GD1526@gaia>
 <874kkx5thq.wl-maz@kernel.org> <20201208172143.GB13960@gaia>
 <7ff14490e253878d0735633b792e1ea9@kernel.org> <20201209124443.GB13566@gaia>
 <ef14a5158fc65c00f6c3c842cfa83b2c@kernel.org> <20201209152741.GC13566@gaia>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c39b104-39c3-7cca-82b9-2e47d7cb9a9a@linaro.org>
Date: Wed, 9 Dec 2020 12:27:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201209152741.GC13566@gaia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Dave Martin <Dave.Martin@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Haibo Xu <haibo.xu@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>,
 kvmarm <kvmarm@lists.cs.columbia.edu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 9:27 AM, Catalin Marinas wrote:
> On Wed, Dec 09, 2020 at 01:25:18PM +0000, Marc Zyngier wrote:
>> Would this syscall operate on the guest address space? Or on the VMM's
>> own mapping?
...
> Whatever is easier for the VMM, I don't think it matters as long as the
> host kernel can get the actual physical address (and linear map
> correspondent). Maybe simpler if it's the VMM address space as the
> kernel can check the access permissions in case you want to hide the
> guest memory from the VMM for other reasons (migration is also off the
> table).

Indeed, such a syscall is no longer specific to vmm's and may be used for any
bulk move of tags that userland might want.

> Without syscalls, an option would be for the VMM to create two mappings:
> one with PROT_MTE for migration and the other without for normal DMA
> etc. That's achievable using memfd_create() or shm_open() and two mmap()
> calls, only one having PROT_MTE. The VMM address space should be
> sufficiently large to map two guest IPAs.

I would have thought that the best way is to use TCO, so that we don't have to
have dual mappings (and however many MB of extra page tables that might imply).


r~

