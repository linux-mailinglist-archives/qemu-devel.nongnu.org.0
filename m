Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AC732D8F4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 18:49:56 +0100 (CET)
Received: from localhost ([::1]:38566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHs6l-00065t-Mr
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 12:49:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHs4L-00058R-2Z
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:47:25 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHs4J-0007OT-HF
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:47:24 -0500
Received: by mail-wr1-x42e.google.com with SMTP id u14so28623596wri.3
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 09:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tauvy2cPis472mTRA824/cAxWghZpli7zaT5+Fc8dNA=;
 b=GrH1Fl1cjplBKV1F/ickYdwgl8P/JhngAZjZH1L4WPbl8kGHmA3QMoWM9GZ2kQIEbw
 2bnYALqiTXQBfXM16X2OAyBJnjgZbgfPzmUVdfWwJLoTVLljqIYPqtS5k+pv7ibr3cfR
 OlVsudpgpBKcevQqoUJDfbpKhUHN3Nb5nCHVr5gmvBjV9QhZX4t2AoHWJehU/Y90a1+L
 V0ANArWgDz2BbDjOMrICltjc+ZjgDMKLHmFqRfDL0ggkBhKQTuRxEbdP0mwUSWlhvqNY
 QQIInEWOj7aChtpineyzoohKH+gckgRQpHHeMzwS5zrL+dG1eG2aSfsRntL7kAjlLiu+
 HBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tauvy2cPis472mTRA824/cAxWghZpli7zaT5+Fc8dNA=;
 b=ZjiwWgLUeqZAUlx+xBpaehcndKtpqa2ECsicQeOlZo+AijJ8grWYMx5DJajXPh+7tK
 pDBm716GG+3UglX3k3m8qemz/VPbtL3eQU5zPBsbxPc9HadnChhp8oBTCeYc/ztF4JRY
 n8WwwTkgKNANoUpeiHLqXfn9c/Wc64Mlk0/i29Kls4JhHJnefUS/hRafulRGI8/l0m6d
 94hAVrTLFsUWam4Zc5ACO0BAXNg9rbpgmEgwz+8E7vSRMGztdp9lcJfFVya2EKXU4/JG
 jFQbBcOxX2XZZvr3dLHKnCZ8RsXjVR/k2AkoB+6xIxgTtBTUYh/YdMrB0a+CGPNZ3YVQ
 YiAQ==
X-Gm-Message-State: AOAM531zIg2h8OJoygTHoeZ71V2YN8lsCzjSxKd7NYeZN5HGQl+KrkdZ
 X3LZ+PAmOIJ8PniLZzCC8sZGwjzJuJQ=
X-Google-Smtp-Source: ABdhPJwd7EmUZUZs5lgGP4NPa2PTaZrKlkIKLMCETCmZ/3j7MzdLR4Moz/pRupBgp0QgPqBrkknZjA==
X-Received: by 2002:adf:a1d8:: with SMTP id v24mr5014710wrv.378.1614880041473; 
 Thu, 04 Mar 2021 09:47:21 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n6sm246697wmd.27.2021.03.04.09.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 09:47:20 -0800 (PST)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <875z2k53mn.fsf@linaro.org> <a3ed4064-6dec-24c6-8138-ce8301f01e1e@redhat.com>
 <63847c79-93c2-5ee3-d568-9091fedf325c@suse.de> <87a6rmkffo.fsf@linaro.org>
 <8d4a427a-94dd-7472-e8ae-98c4efa44ce0@suse.de>
 <CAFEAcA_eWrgo9CcLF3ZpAPeK08_PmKNLjqKAzuBPcSGh+1SFCA@mail.gmail.com>
 <5fb3cf49-fc09-7e7c-d34e-299f04e9842a@suse.de>
 <335966c3-9f31-5868-54e5-edb28a37c50c@suse.de>
 <a9190376-ba0b-02d5-124d-a336c586ad5d@linaro.org>
 <dabd15eb-109a-802a-6abc-3831d7b1c203@suse.de>
 <1b92cbea-8abf-40b9-337a-15f34ef40f61@linaro.org>
 <38f0a65d-b5e4-3795-03a3-d6b1b3346816@amsat.org>
 <c3417aa6-22f6-7d4c-07a5-dceacd598b41@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <185dff80-99cd-8c80-a5e3-92b269396f3c@amsat.org>
Date: Thu, 4 Mar 2021 18:47:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c3417aa6-22f6-7d4c-07a5-dceacd598b41@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 6:19 PM, Claudio Fontana wrote:
> On 3/4/21 5:39 PM, Philippe Mathieu-Daudé wrote:
>> On 3/3/21 7:54 PM, Richard Henderson wrote:
>>> On 3/3/21 10:45 AM, Claudio Fontana wrote:
>>>> It is a bit weird that qemu-system-aarch64 runs with a cortex-a15
>>>> model tbh, as cortex-a15 is not capable of aarch64.
>>>
>>> No, but qemu-system-aarch64 is capable of 32-bit emulation (because most
>>> 64-bit cpus retain 32-bit mode).  It takes no extra effort to run
>>> cortex-a15 than it does a cortex-a57.
>>
>> IIRC qemu-system-arm starts the aa64 cores in 32-bit mode, while
>> qemu-system-aarch64 in 64-bit (this gave me trouble because the
>> kernels for the raspi 64-bit SoCs are in 32-bit mode -- because
>> the GPU starts them in this mode).
>>
>>> I have wondered if we should have just one qemu-system-arm that does it
>>> all and drop the separate qemu-system-aarch64 -- or vice versa.  But
>>> we've had the separation around so long I'm sure someone would be confused.
>>
>> That would be great cleanup IMHO.
>>
> 
> Would we still be able to configure a lean AARCH64-only qemu that only contains the cpu models we want,
> (via board configuration / KConfig?),

We shouldn't even worry about this IMO. Because ...

> for example, a kvm-only build that only has a few 64-bit cpu models in it, plus max/host and removes all the rest?

... since host word-size becomes irrelevant, you only have to consider
the accelerator possibilities. Restricting to KVM directly select a
subset of CPUs usable.

