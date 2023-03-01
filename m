Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC7F6A66C9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:48:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXDR2-0006Nq-NE; Tue, 28 Feb 2023 22:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pXDR0-0006KK-Gu
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:47:18 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pXDQx-0006on-6F
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:47:18 -0500
Received: by mail-pl1-x62d.google.com with SMTP id v11so9122080plz.8
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1677642434;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6DIIvV+J2/gX3ZTdoxywRfientpt493vTSWL87R4DYQ=;
 b=2VedGTQ/qkY8twF0ejTHUm7WjeAYbYHEzaWGjHPKgxl2rmROxSEXjLDmKrvg0Zee2Z
 N2/vf+es+ThiZapopQXu/sL/+e5SsaXS1TvP2asyOJ0utr6KeoH8bhtrRhOuo/RWEius
 DmTrVGvqqXcRz8cPt7M+BcmVFgQ3lZHBD+g+JZdIvMN/UC9CY+4v8slH0QRdViXCLnw7
 mPjNOVpcI3LiWcNEcTNwZfbOmT5vEDSt7fzIxgJCgWW6efNaR6IiZfPYgSHKRlZrmtyf
 eHQK3ircgxEAgDDclv95g98OtFWUAywsxG3COpQbzRe9eK0AuNo/j0KSxsfKeCAjI+0I
 8uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677642434;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6DIIvV+J2/gX3ZTdoxywRfientpt493vTSWL87R4DYQ=;
 b=xYGRyuDcm3gXzemZhkY5CrzqkXGRfFq2oUYtoN40sXJLbj4MHwO42GL4KrvOFEfMpe
 uTmkICJ8Pxkbae587U6bSh1UUHzf3rTjln3oM5mjTRFJ+7ciTo1YZDR55d2XDKs06EK1
 yALe0LAMYr5LXI3J70+SFg4bFIPa8G9enc8tpf5gCuk5T1uJFh1GE2Y/2nq1nbCQqC8T
 5AB9DrV+9PcFE6e4VzobTnbCuKY6GvunzQq6E6UUpR1+fRQByvy6nf21oOLL+WBOPv7I
 Z1+vuSl83f+hVBrZjoDblQElQu4wvps642EOjCxNYoMbCjkwdYhOPOU0KoDYbCuPWPYt
 XPhw==
X-Gm-Message-State: AO0yUKXAbwRYBSiU+vbSMYPNmwgqFGCncuXGEKz/VOcU8OeL31E4GKM+
 VbvrNjjMO9P2peMZC+QuQnB2+A==
X-Google-Smtp-Source: AK7set9F7HaIEALUWZPKYtjGr+XhEVVVfOcIP6UBzQbD7zJD8Bj7A66UKUOuMvaxhYduxPyONyjmog==
X-Received: by 2002:a05:6a20:6a11:b0:cb:c6f4:62fd with SMTP id
 p17-20020a056a206a1100b000cbc6f462fdmr6299910pzk.18.1677642433718; 
 Tue, 28 Feb 2023 19:47:13 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u1-20020aa78381000000b005cd81a74821sm6707926pfm.152.2023.02.28.19.47.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 19:47:13 -0800 (PST)
Message-ID: <53a3ac13-2780-bf45-16b8-3d6d15090159@daynix.com>
Date: Wed, 1 Mar 2023 12:47:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] hw/timer/hpet: Fix expiration time overflow
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20230130135001.76841-1-akihiko.odaki@daynix.com>
 <73c73f7a-f182-7892-162f-daa9f39be45a@linaro.org>
 <20230228075717-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230228075717-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
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

On 2023/02/28 21:57, Michael S. Tsirkin wrote:
> On Mon, Jan 30, 2023 at 11:55:18PM +0100, Philippe Mathieu-Daudé wrote:
>> On 30/1/23 14:50, Akihiko Odaki wrote:
>>> The expiration time provided for timer_mod() can overflow if a
>>> ridiculously large value is set to the comparator register. The
>>> resulting value can represent a past time after rounded, forcing the
>>> timer to fire immediately. If the timer is configured as periodic, it
>>> will rearm the timer again, and form an endless loop.
>>>
>>> Check if the expiration value will overflow, and if it will, stop the
>>> timer instead of rearming the timer with the overflowed time.
>>>
>>> This bug was found by Alexander Bulekov when fuzzing igb, a new
>>> network device emulation:
>>> https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/
>>>
>>> The fixed test case is:
>>> fuzz/crash_2d7036941dcda1ad4380bb8a9174ed0c949bcefd
>>>
>>> Fixes: 16b29ae180 ("Add HPET emulation to qemu (Beth Kon)")
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> ---
>>>    hw/timer/hpet.c | 19 +++++++++++++------
>>>    1 file changed, 13 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
>>> index 9520471be2..3657d5f463 100644
>>> --- a/hw/timer/hpet.c
>>> +++ b/hw/timer/hpet.c
>>> @@ -352,6 +352,16 @@ static const VMStateDescription vmstate_hpet = {
>>>        }
>>>    };
>>> +static void arm(HPETTimer *t, uint64_t ticks)
>>
>> Could we rename as hpet_[re]arm() similarly to this file's other helpers?
> 
> Akihiko Odaki, I expect there will be a new version of this?

There is v2:
https://patchew.org/QEMU/20230131030037.18856-1-akihiko.odaki@daynix.com/

Regards,
Akihiko Odaki

> 
>>> +{
>>> +    if (ticks < ns_to_ticks(INT64_MAX / 2)) {
>>> +        timer_mod(t->qemu_timer,
>>> +                  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ticks_to_ns(ticks));
>>> +    } else {
>>> +        timer_del(t->qemu_timer);
>>> +    }
>>> +}
> 

