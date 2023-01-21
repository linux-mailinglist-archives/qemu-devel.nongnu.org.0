Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C53C6769CD
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 23:35:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJMRP-0005vB-DX; Sat, 21 Jan 2023 17:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1pJMRM-0005tm-Qe
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 17:34:24 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1pJMRK-0000x1-Kq
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 17:34:24 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-15f64f2791dso10280960fac.7
 for <qemu-devel@nongnu.org>; Sat, 21 Jan 2023 14:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ro2rOYWfBZUzLyVHwFL4TSvYpf8z5o4KYD5LUeak0p8=;
 b=fpiNTBRNHOjDEgmBhEk6xrkhUMCKt5iiBhTqhqUFs9mGtB73g9abPL+eZrtb+sUDEc
 ZT3+KHCIgUl9talxJlz8sk+79BvC+C2wOuMFMHpAGbUmVSkFEFlHLZgwItyFjK1G6tsh
 XS+95+f/QPUwhuqtZZ+OOFgnpAh68Rf/jlJf0vVyV9nRHQEwG+TaH8oRguIoI3Cf5v6H
 Xk9yMQbAXR8pi2SvUeqidGu+JoI9UjvikrNfmOGSsF0D6ZU5E1hhJUej318t9l1/Cd45
 HV/P2lL/q2SQfwwiA0GWAl5bjmCGtobsi/GGjWS+vkUOBb1+JciUjUQ7ZdLd5JGEZxd1
 zAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ro2rOYWfBZUzLyVHwFL4TSvYpf8z5o4KYD5LUeak0p8=;
 b=AyqWmBVDbbpoqNickVT1eUa/fygy1kUoghWEmIY6ytbDh3M9vKs7ZX4SP8J67yi3NY
 H7Kqo45AvfK56dV3K/4IAPqx75iMCkwFmuIVs3dQZmZZZD0oXNrbTegNC39loZfALErn
 2UfqtS9tSuoNidxvVQCGUp44URuhrdFMZ+MpAStHIGkxvKoHFPa6SHo2OToPlejT7d+4
 h+atSEuNwx8pSHYi/zt/ZXT3IY0DvtRcnvXVQp8Rmyz5XgxvNYBCRHLOlZ94eGA6zXcJ
 yXlGSmybHwGbMrvAiGvKRjFQMnqGRGOpNownZQ+dLS693a9qB+lerjxVV62NAWsbKOnv
 k1JQ==
X-Gm-Message-State: AFqh2kpw5A6Hu1xH3yr75bZbAmi/wWuXLcp3jl04wJx+fC3/cKDunLsJ
 yIygwrSXjU/eW4sgLjKtYzPBQw==
X-Google-Smtp-Source: AMrXdXt4IwowNwPZp/kv8+CtxsRqw/aUJ1/NTCedRVoITlULAlb6bvssHjsAkoDyPtDly3GP/zZdxA==
X-Received: by 2002:a05:6870:be8e:b0:15b:9ab9:75ee with SMTP id
 nx14-20020a056870be8e00b0015b9ab975eemr10221334oab.48.1674340460533; 
 Sat, 21 Jan 2023 14:34:20 -0800 (PST)
Received: from [192.168.86.224] ([136.62.38.22])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a9d590b000000b00677714a440fsm23193474oth.81.2023.01.21.14.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 14:34:20 -0800 (PST)
Message-ID: <43024388-8c05-b29a-9278-17645ed482a4@landley.net>
Date: Sat, 21 Jan 2023 16:46:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Commit 145e2198d749 broke mips big endian.
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Phil_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <d64812ad-5c7f-ac9e-bb87-ebc8451c3602@landley.net>
 <CAFEAcA8zsvLErJXJZG+HzKzWjACO9RH9PRbO3XemxnP=6TZJvg@mail.gmail.com>
From: Rob Landley <rob@landley.net>
In-Reply-To: <CAFEAcA8zsvLErJXJZG+HzKzWjACO9RH9PRbO3XemxnP=6TZJvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2001:4860:4864:20::2e;
 envelope-from=rob@landley.net; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/21/23 07:14, Peter Maydell wrote:
> On Sat, 21 Jan 2023 at 10:45, Rob Landley <rob@landley.net> wrote:
>>
>> wget https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/mips.tgz extract
>> and ./run-qemu.sh in there. Before this commit it goes:
> 
> Hi; does this patchset fix the regression for you?
> https://lore.kernel.org/qemu-devel/20230118095751.49728-1-philmd@linaro.org/
> ("[PATCH v2 0/2] hw/pci-host/gt64120: Fix regression on big-endian targets")

Yes it did.

Thanks,

Rob

