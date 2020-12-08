Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223DA2D3236
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:33:35 +0100 (CET)
Received: from localhost ([::1]:35540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhnq-0000ed-2y
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhS3-0000Ll-0W
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:11:03 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:34909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhS0-0007Qq-Cg
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:11:02 -0500
Received: by mail-ot1-x334.google.com with SMTP id i6so10563179otr.2
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kG18JKu3V0ysFLtfiJSCcfYcXq6e3oR0WypJay0rVzg=;
 b=VKUVQfLFTfrjJ+yaToNr1e8Yjbl1SbQFxHcsiLT+I6phFa3JeeE51DpvjjAPlMET0B
 soEq1fdQp5ni/oUWzneeXluDzfvezuZzGdblmYMSZWusIb2NVAv45G8Xxp0t8nd1psq3
 w3UHsbSeN1WhlwKVHe4LfCkgeBhamGvQr35ZqEHlbevWfcuyyAUFiMyXLMrEqtDQhTqg
 A8VurvL1hd4HfuSCzbLDtCMf7PmBNIeSXLuNmX1bfOtkRN6A3q1mWCK6FN3dVhaTPSTj
 HWd23JJ8mCuaBksCzlH6QVCIw0qWKOj22g/+GvViqLwCv/axOPj2lZD0uH3BXIun6oj+
 eAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kG18JKu3V0ysFLtfiJSCcfYcXq6e3oR0WypJay0rVzg=;
 b=X0m+UYno/hkFH2vPbIY2FSVonDP+Xt/1Va2zYOthnPqP+IzNedW3E7ETPvfMuJkCWr
 MAJhpdN27Yumcwf2JoTc/mQcCWhFY1duXEVpzH4Acgkb0tUDN2lMhiEzJ12plP0LZD2o
 jiK3qey4FiT/boWY+8kXIFaszRsftUyK9mD3fdxAc2LOpbuU5NmDeh/RaDTN9HpXz8T1
 On+yHAX4CC4Gw7DmwwM4yFkLsbkZrcj7TTHioCpNEEJCM+TkGsOFowd64Nhh5tQYUbpm
 HVkLEp9DjTN4yPXNk97gfwI8cAh9TZsaX2gBXV8RCS/0aLQIBHxhKOyUr+A3ftak7GJS
 q3KQ==
X-Gm-Message-State: AOAM530b6XBTe3G/94kT7QQVHjvUWF23AO19rR3E/SvfshnC/O/qL204
 ++5Eo87x97BgKw1ilUmg9apT7CAjLrGAJmMr
X-Google-Smtp-Source: ABdhPJwKFzq1eGEOxI49rd8uxDUuR0EF7RAz5vqCYTvAdIkDI+5MakisJl06YByorZ7zbGti/y3HFw==
X-Received: by 2002:a05:6830:22f9:: with SMTP id
 t25mr18151615otc.14.1607451058836; 
 Tue, 08 Dec 2020 10:10:58 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r25sm1543743otp.23.2020.12.08.10.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 10:10:58 -0800 (PST)
Subject: Re: Why do we have both CONFIG_SOFTMMU and CONFIG_USER_ONLY?
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <5176c935-2df0-e300-b1cf-67c7014e5d73@suse.de>
 <CAFEAcA9xLZCmjmBnPUN52wSDYdk2qd14RFXPyU0vWeW53Vg5aA@mail.gmail.com>
 <08bd879e-66db-0fe0-522d-0a378f36f763@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23e8d691-ac1f-8203-dd47-cd19dfb4c40e@linaro.org>
Date: Tue, 8 Dec 2020 12:10:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <08bd879e-66db-0fe0-522d-0a378f36f763@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 5:56 AM, Claudio Fontana wrote:
> On 12/7/20 12:50 PM, Peter Maydell wrote:
>> On Mon, 7 Dec 2020 at 11:39, Claudio Fontana <cfontana@suse.de> wrote:
>>>
>>> As in Subject,
>>>
>>> am I understanding correctly that the one or the other is redundant?
>>>
>>> Should we keep only one of them?
>>
>> I think that perhaps the idea at one point was that we
>> might have a version of linux-user which used a softmmu
>> (this would allow better control of the guest's view of
>> its address space, so guest mmap() to fixed addresses
>> would work better, for instance). But nobody's ever actually
>> tried to implement that, so I imagine that if we ever did
>> we'd find that some CONFIG_SOFTMMU and some CONFIG_USER_ONLY
>> defines were the wrong way around...
>>
>> thanks
>> -- PMM
>>
> 
> Hi Peter,
> 
> thanks for the background,
> 
> indeed I am seeing some of these cases, target/XXX/cpu.c is protecting code with #ifndef CONFIG_USER_ONLY,
> 
> but the header files in include/hw/core/cpu.h and others use #ifdef CONFIG_SOFTMMU.

In an ideal future in which linux-user could use softmmu, I would have softmmu
be a runtime option rather than a compile-time option.  The option would merely
affect how TCG generates code.

So while in that ideal future only CONFIG_USER_ONLY would remain, in an ideal
present CONFIG_SOFTMMU would mark those places where a runtime check should be
added.

But the present is not ideal, and system-ness (or non-user-only-ness) and
actual mmu emulation are often confused.  Cleanups welcome.  ;-)


r~

