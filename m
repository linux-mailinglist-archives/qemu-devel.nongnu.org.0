Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5C8142DB3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 15:37:30 +0100 (CET)
Received: from localhost ([::1]:37690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itYBE-0002cr-Pb
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 09:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1itY4Y-0004f2-NA
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:30:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1itY4X-0003yl-Lg
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:30:34 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45545)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1itY4X-0003wk-E2; Mon, 20 Jan 2020 09:30:33 -0500
Received: by mail-pf1-x444.google.com with SMTP id 2so15939963pfg.12;
 Mon, 20 Jan 2020 06:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=znlMZaoDSxa/NOLijW+/RJsZp6cxdD3KLBVjU0LI0cw=;
 b=SJmSOa2t4a2J6FLlQuA3+5mocrFAfVFGKJ6J/FXfsBV+/dhwbAqK9slwd7eUetCf5X
 hdYKMnKhMAlpKivQk2HIsDkj/FVGnYJvvAcHdqeEpW52XTpCqLS5J97dKS9xZewcn/S+
 Qou848fvJa4tYvmR1kPHCEBSUjo0uwdthxNdbrp9nlDtMHJlQ1kVpCYuL65/skqw5lRb
 MVcjhPIsBDpqbUvRqeQmUEBnx17yXr6/kvQKPFPVS1hdBZRANerMDo7FjBq2rrSmKSx2
 yhcSC+kxXh847MRhzhvWmu/pkW84h31wR8IEh13YUcYqjgPskGBREVJcIzW7mDWvP7D6
 6/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=znlMZaoDSxa/NOLijW+/RJsZp6cxdD3KLBVjU0LI0cw=;
 b=dLxW1oQSzgPk/s7nq+lWpvDGamQqL/Lv7CxONM2lrIPvxQ4zLQDY+bO/itqU73hSu8
 L32w5eKO9mr2bO6C7yvDuD3mIlZCTMOfiRgY7/69BFyvP7YigbBT053GLw8NiuXmY4om
 ppYQBPCdqWNtR0AFOHFqRpQs6Gyxdx+hF6U6DPcUbxvAn59jZVWd330qPmDXM6ymocsl
 9Fexccz6LfEAnIqoGuaB7HVLXgbHzqjDbb/NSVwq7JvsWRPA3po1/55+yhVum6CsJknT
 MOSBaHeh22PfZMKN6TRanvfaXco4hulKDIsnjq7lNN6IBm81LQmJC1M02Y8YCDLtNNq7
 t+ZQ==
X-Gm-Message-State: APjAAAUvYN2CSjyZYuiE034ZUfbfmRdtTQH0nx8GrhuhUra8+SkAQASf
 RD8P9IVMQhNsMJbTvmyJPHgmuQ+F
X-Google-Smtp-Source: APXvYqwWLpEjQwi9fClxjlNalehCqkX7Q6g/v6Vgipc5O2yNYI5eSxuONFdL8cUHBNgo99TKmSKleg==
X-Received: by 2002:a63:d807:: with SMTP id b7mr62630742pgh.52.1579530631392; 
 Mon, 20 Jan 2020 06:30:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d14sm41400847pfq.117.2020.01.20.06.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2020 06:30:30 -0800 (PST)
Subject: Re: [PATCH v2 2/7] hw/arm/exynos4210: Fix DMA initialization
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200118164229.22539-1-linux@roeck-us.net>
 <20200118164229.22539-3-linux@roeck-us.net>
 <CAFEAcA8yH8deTL6PrX42Lh_TbR=gx4QbukuKUOo1XgLod=2ZXg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <526c74cf-bbaf-2c79-08ec-9472288aaa59@roeck-us.net>
Date: Mon, 20 Jan 2020 06:30:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8yH8deTL6PrX42Lh_TbR=gx4QbukuKUOo1XgLod=2ZXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/20 5:35 AM, Peter Maydell wrote:
> On Sat, 18 Jan 2020 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
[ ... ]
>> v2: Use interrupt combiner instead of connecting all events to a
>>      single interrupt. Limit number of events per DMA channel
>>      to 31 to meet qemu interrupt combiner limitations.
>>      [Not sure if "assert(s->num_lines < MAX_OR_LINES);" should be
>>       "assert(s->num_lines <= MAX_OR_LINES);"]
> 
> Yes, that looks like a bug in or-irq.c -- it should be using <=,
> so 32 is permissible.
> 
> As the comment in or-irq.h notes, we can safely simply bump the
> #define value without breaking anything if you need more input
> OR lines than 32.
> 

Yes, I noticed the comment, and I did that initially, but then
I noticed the complexity of actually doing it in the code
increasing it from 16 to 32, and decided I better leave it alone.
I'll add another patch fixing the check and use 32.

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 

Thanks,
Guenter

