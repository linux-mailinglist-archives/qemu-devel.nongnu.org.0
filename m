Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87984652348
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:59:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7e4v-0001xv-1m; Tue, 20 Dec 2022 09:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7e4s-0001vR-Vd
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:58:46 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7e4r-0004w2-ET
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:58:46 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 r204-20020a1c44d5000000b003d6b8e8e07fso70148wma.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g9Hg2x5PuNsVa3BqqepfAccdKScNrKApGQjlopoPdvU=;
 b=TzAIeYe/csST69N43Q+zJ+69MV/EBTwQCJiMZmLaS46PieBncYKek2/f1yiYrpT2XZ
 nfuKQCWcbEywRpFoR/D3rJvaoI5tg+gy2IC4BsZ21hQGP65fzJGcCNfssGW5WACBjJ3C
 VYzBI9Z58e4x1G/IIPg+zenHQQfFZ7jGxVervS4GMB8c8E5pvRqDBzTEtOk8DLet80HQ
 5enmGuKVfqzLIwvYkOAvUvy+NgNZoL3BcjsW3m7fp//w1Rm0aHnX74j2QcnoJEnUU/mS
 Jf8ZgM88GitdU3wwwmPVfKLQGYTzmNpcUhkXHLuI8OBh6p194mkNBcU/Qfa5K/FDwktM
 XP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g9Hg2x5PuNsVa3BqqepfAccdKScNrKApGQjlopoPdvU=;
 b=i0swmq0Jt+M2nUBsWRGX0sekGfLRRolYmjWi2Nkqfg87TSWlt9RhSGQb0U8raIM8Qd
 TWXzOZvQ9fY0kNpFhMo0IcAAhI/8BcW9OvbQ/fya2KGzQG1LJ2hDmwUbYIyqtlaac+QT
 y2mHR1wxJJEjHFeET/Itynsvf0+/jEsvI4j56usgD4FDx2sWhBYrCtowry61hOyhCVNu
 xn2GKH9ZpGG36QUnr0FQNlOC4B9JuwlgMCDrKLlMK+DX3AN8SveyRS6+02nYL9CzBdua
 qmzft/29FzDS3JaVAr+5ZyUJ+JYEMsxdjZfsN5hf5hAbbpHfqYmZD5cu/uID9NIE3ut9
 /YjA==
X-Gm-Message-State: ANoB5plPLaPNLXZLHCnkRZR/jchNUKlG8qCum5fZ1m41xvWPmVk5Cj0X
 w1LgeZX7VgqNJBIZvMfQ6aB8Dg==
X-Google-Smtp-Source: AA0mqf4pCjJ+ursY9y6vmpIaBSQWDo2gY0qrowym+XgacvS1Ga7qMwSnbn95NiuEEuVSOCnUiXg7Bw==
X-Received: by 2002:a05:600c:500a:b0:3d2:3ca2:2d4f with SMTP id
 n10-20020a05600c500a00b003d23ca22d4fmr18120087wmr.36.1671548323995; 
 Tue, 20 Dec 2022 06:58:43 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c1d8d00b003d01b84e9b2sm16431279wms.27.2022.12.20.06.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 06:58:43 -0800 (PST)
Message-ID: <a87d9439-5ac3-aa95-4757-994d828df2a1@linaro.org>
Date: Tue, 20 Dec 2022 15:58:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] accel: Silent few -Wmissing-field-initializers warning
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221220143532.24958-1-philmd@linaro.org>
 <Y6HJ21W6Q5h2UvrE@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y6HJ21W6Q5h2UvrE@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 20/12/22 15:42, Daniel P. Berrangé wrote:
> On Tue, Dec 20, 2022 at 03:35:29PM +0100, Philippe Mathieu-Daudé wrote:
>> Silent few -Wmissing-field-initializers warnings enabled by -Wextra.
>>
>> Philippe Mathieu-Daudé (3):
>>    tcg: Silent -Wmissing-field-initializers warning
>>    accel/kvm: Silent -Wmissing-field-initializers warning
>>    softmmu: Silent -Wmissing-field-initializers warning
>>
>>   accel/kvm/kvm-all.c | 4 ++--
>>   softmmu/vl.c        | 2 +-
>>   tcg/tcg-common.c    | 2 +-
>>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> If we're going to the trouble of fixing violations (which is
> good), then we shouuld also add  -Wmissing-field-initializers
> (or -Wextra) to warn_flags in configure, to prevent regressions
> again in future.

Yes, I plan to add it at the end. I choose to split in small
contained series to avoid spamming every maintainers, but this
is actually that trivial that I could have sent as a big one...

Thanks for the review!

