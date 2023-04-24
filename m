Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A786ED153
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:29:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqy7X-0007rn-Ml; Mon, 24 Apr 2023 11:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqy7L-0007M4-Gk
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:28:40 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqy7J-00072o-3U
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:28:38 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so82902515e9.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682350110; x=1684942110;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zg2y8bRDWMoVXOWYzxb+HDrO1PvP860APqmju3jmv0Y=;
 b=OfngBHQD7MTTFgAmTrW8kYt/+dI84DNcMtIxSj8uH1p072nuajfKriCEGpasfiXDkH
 YeYv5qh1FHLhWc9tc5YzIoYgEzg0ZCdvp6kh2nszrFkkax7pajTuQEjexeNk3ck3MdJT
 3aJDjL66XT8HYo4PH7xmF1rrLwl2/Tk3iilETTLbN3jmV2lc/79HBJSXxIYH2IfUN8Pz
 wk96M8llqbVh47F9F4VvWUUdpUz5F6wKOIuhz3CeZNebVPwlCpv6ltZPaewUGvNB//N6
 tX6PrqgbKF0/OUNhYLEipwvmKSxH5IrzChmPtQK8rGAPEYKZl/SDWVY8lnanOTD5mKIO
 Cb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350110; x=1684942110;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zg2y8bRDWMoVXOWYzxb+HDrO1PvP860APqmju3jmv0Y=;
 b=ifAk0/53IWPtFjvIuPG/DjseDWHolSm7Hv12iWc2UgpEyOojajhFX+QOjwJaq19tca
 HmHYrZW7ITMNQ7ny5uv1B2G8bJV2mC5W03zALaS5Pr+htU5dehM4JrkxOwtFJNy3pGhH
 peyzbvSqxaDyDqSDjd9PW2uJUhNHzGA03r4YsxrpCD7uj2m0P91zP8/Qck0UpBqjP3+t
 hfOOza8Dn/NTZOvkwYKOJl4NgLzpF7ptyWuNBuF3WJjsTKu//qZ1rRyXujUg+GX/Q+QW
 Afs7xai5ALuufNv195DmO5tM36ZrilNUJ2jM9Z8Q093ENy2iGP9O1XXwciFyHk8BGTzt
 lLQw==
X-Gm-Message-State: AAQBX9dV2HlV6YoAEJtGXM4+fZYbKfnwmGfG50rD3+u2uHFXCThCgLub
 sIlH5gf/RZ3UN6m8TFg5XOncPPcCKspE/AOmTK1YAQ==
X-Google-Smtp-Source: AKy350YwWqjXaZh8db1MXqXZKalt84ZJpTd7wVmWhT9fxsIuLD2MvDFIpLTV7Io7xnx0GSC0ZTOxwg==
X-Received: by 2002:adf:ee91:0:b0:2f0:2e16:7e0c with SMTP id
 b17-20020adfee91000000b002f02e167e0cmr13826975wro.26.1682350110466; 
 Mon, 24 Apr 2023 08:28:30 -0700 (PDT)
Received: from [192.168.2.175] (230.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.230]) by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f191c9c4b0sm9382506wmc.11.2023.04.24.08.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 08:28:29 -0700 (PDT)
Message-ID: <2d1655e9-e77a-a09e-056a-5ea5e3cadf5a@linaro.org>
Date: Mon, 24 Apr 2023 17:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 7/8] cpu: Replace target_ulong with vaddr in
 tb_invalidate_phys_addr()
Content-Language: en-US
To: anjo@rev.ng, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, qemu-devel@nongnu.org
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-8-anjo@rev.ng>
 <19f888bd-f0f4-2307-90c1-744f16ca77c2@linaro.org>
 <fe84e730-88e6-3b68-1929-758868757c68@linaro.org>
 <2c803abc-0f24-ecc6-fc14-56e674994829@linaro.org> <87jzy2e6i2.fsf@linaro.org>
 <97043d98-60f1-8820-8ae6-998b44e41528@linaro.org>
 <e9768a73-7055-bbca-3642-dbfc0c43075a@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e9768a73-7055-bbca-3642-dbfc0c43075a@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 24/4/23 14:52, Anton Johansson wrote:
> 
> On 4/23/23 21:42, Richard Henderson wrote:
>> On 4/23/23 20:35, Alex Bennée wrote:
>>>
>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>
>>>> On 4/23/23 18:29, Philippe Mathieu-Daudé wrote:
>>>>> On 23/4/23 11:14, Richard Henderson wrote:
>>>>>> On 4/20/23 22:28, Anton Johansson wrote:
>>>>>>> -void tb_invalidate_phys_addr(target_ulong addr)
>>>>>>> +void tb_invalidate_phys_addr(vaddr addr)
>>>>>>
>>>>>> Hmm.  This isn't a virtual address, so 'vaddr' isn't right.
>>>>>> I'm sure we have something more appropriate.
>>>>> tb_page_addr_t?
>>>>
>>>> No, it isn't a ram_addr_t either (see exec-all.h).
>>>> Perhaps just uint64_t.
>>>
>>> Surely hwaddr?

But hwaddr is only defined on system emulation...

>>
>> Duh.  Thanks,
> 
> Thanks guys, and hwaddr it shall be!
> 


