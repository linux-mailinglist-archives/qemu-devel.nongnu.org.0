Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FFC47F0D0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 20:57:42 +0100 (CET)
Received: from localhost ([::1]:41060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0qhA-00043o-Uk
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 14:57:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0qfw-0003BB-4V
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 14:56:24 -0500
Received: from [2607:f8b0:4864:20::102f] (port=38406
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0qfu-0006tb-1b
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 14:56:23 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so7124791pjf.3
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 11:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SLENTLDKVX6gByRL9WSy8A9SbPO7USBuaJHCAX9qNa4=;
 b=bXeMyODwrlusjuGcnSp4W2KiHA9oCy7lp8vv/TW1yNIpglnoWex7gyC0rkg8WgsSP7
 WTRWLLYYoP2ej1N3g64+/KdqgvfRkJJJMHReltnVAC4iDWF0FGgPPSdZmItFHsfZvEfp
 k5VJmq7MUiGJFbemY+Be5zZ/c+Bu3/hSvIOhY8PUMXKxjMQlLWPMIUU6Vh28YXgCCkk0
 +NgenWc5H0V1bvIrwZITIo1VGzR0iU/bqNgdCOQG4aNXwAtVR0tkI0DfSGNXFlCtkB1b
 APIsWGCwanUjyUi2lRxiWXXvtwb3mm6FsJa0oOl7KDerq79Olkga2MmrE+x2OZa1UmK7
 N+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SLENTLDKVX6gByRL9WSy8A9SbPO7USBuaJHCAX9qNa4=;
 b=3AAHCpuA7PHGaWKsvY67VGVgtbTx1vtAl3sBvat5ArchcR1ve0dxudt2GAdPDCmomb
 7BzAqQbEhq6+dw2YAjRieJz1qQyDe0Pa/pFTYrhxa/KRPWsxZn0+Lr7YUeYP0Ub8KZyZ
 71QbtlJZ6tnLENF1ehPGy6r02LvU3DmenMjqt6fh5bV4iG8KmxTvks4qX26/badGcOoJ
 Tdq44mhYxPcRf54SlaGl33fwJkjL0xw1wbk5P28igORzaIl+xM17EGcJtJnOGIqGgdva
 NkkqrPn/BqpCdR4EW0rxthxDt4dQf3NPoMt2g1OSTY3Mo9fZgifU3iU2dRnvrEhMeUpx
 zj2g==
X-Gm-Message-State: AOAM533D+1Fy4BwvHHMDBV2JgQEE6QEAEeBbI5N/bKUiHTBYbO4LMRZF
 S30rFZEJvYSxaDjAOua+nAIw5w==
X-Google-Smtp-Source: ABdhPJwBzM/1sOnFPFiEshwb/DafzE/psYhS5635tg4I8wiW4ZJsfydeGkdqJo2M3UNlGszIVSiURg==
X-Received: by 2002:a17:902:6b46:b0:142:8470:862e with SMTP id
 g6-20020a1709026b4600b001428470862emr7971833plt.49.1640375779789; 
 Fri, 24 Dec 2021 11:56:19 -0800 (PST)
Received: from [172.20.100.20] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id y16sm9968131pfl.179.2021.12.24.11.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Dec 2021 11:56:19 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] accel/tcg: replace phys_pc with asid in TB htable
 key
To: Vasilev Oleg <vasilev.oleg@huawei.com>, Oleg Vasilev <me@svin.in>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211222164947.634759-1-me@svin.in>
 <20211222164947.634759-3-me@svin.in>
 <3f3440c3-4a1b-a272-c445-58ff7341bfd3@linaro.org>
 <e05dd835e5ad4cb9aec3ccf0c7369c30@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6df7fd7-7f0f-a223-0fe6-2ab25cf6eb59@linaro.org>
Date: Fri, 24 Dec 2021 11:56:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e05dd835e5ad4cb9aec3ccf0c7369c30@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.133,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/21 5:02 AM, Vasilev Oleg wrote:
> On 12/23/2021 7:31 PM, Richard Henderson wrote:
>> On 12/22/21 8:50 AM, Oleg Vasilev wrote:
>>> From: Oleg Vasilev <vasilev.oleg@huawei.com>
>>>
>>> Using a physical pc requires to translate address every time next block
>>> needs to be found and executed. This also contaminates TLB with code-related
>>> records.
>>>
>>> Instead, I suggest we introduce an architecture-specific address space
>>> identifier, and use it to distinguish between different AS's
>>> translation blocks.
>>
>> Why do you believe that asid is sufficient here?  You're not invalidating any more TBs
>> that I can see.  What happens when the kernel re-uses an asid?
> 
> Hi,
> 
> Sorry, I had some comments for the patch, but forgot to put it in.
> 
> So, I think I interpret the term "asid" in some other sense, namely, an
> identifier, which is constant during whole lifespan of an address space.
> Same as PID in that sense. Do you think this is a viable approach?

No, I do not.

> If we assume translation table wouldn't change during process life,
> after the death of the process, all it address space would be anyway
> unmapped and corresponding translation blocks would be invalidated.

While this assumption is often true, it certainly isn't universally true.
Consider the cases of dlclose, followed by another dlopen; or any JIT.


r~

