Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5476A6441DB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 12:09:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2VnX-00063A-3E; Tue, 06 Dec 2022 06:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2VnU-00062p-Oc
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 06:07:36 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2VnS-0001hE-L8
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 06:07:36 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 n9-20020a05600c3b8900b003d0944dba41so7711541wms.4
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 03:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vq2tbgs6yGWcP/m50Si7XddLsC72RsjGWhzK1IMjT6Q=;
 b=epiEV8MM+jvxveHfV7NSSyotruJVJJgXTSrxcdfOiuEVpgs0uQl/MH7JWwR5+tQMvw
 J5jU3+BopkUL8tvzRFxVb58g8hGSvZbQ0PzI9e4kZw/WOCHIRtCz2YMxOUIn4sjkLFOM
 zfTiU2lHXSJ2/wW1vLnhC7D6TzYvohjrwVKzPVl10sOQgKZjwF5+s9Dx9WCaI8oWf7Ih
 vhDuRNBzFRPTvJ9IhLmx1rgsjXYtRtodwC0dpmaEe4cxL5TDpRs+guvRS7QDC6Iu4ul3
 N8vdGG0WgqXM2Do/zgtXQQDud4P14teceIlSzTKHxfgPKDtF0B2igC0kxHSgzJCXZYd3
 wG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vq2tbgs6yGWcP/m50Si7XddLsC72RsjGWhzK1IMjT6Q=;
 b=NXoeogfnKwunExHt1w4OghqOmSgLGRl0/ZRi0FmOf9cMRs010H+7GHAQ8gtjjW8cFW
 T+Tb31y2Wdai476w5jhljC1ZJc7nJtj82vaGFHUvOM05LBwMhwN3GsSmGeaWwaE6Hotw
 V6QJxjai1Elm8nl+2DkU1ucRwjXzBEQfLgyhkITiebz1yUABekKEwY6677WgqQ+oKFuJ
 j24PwrQ3VwyyMGEzfZ0/j5Nm6nxIa5/8L7fgSTPDRmIp36Q0OHu+tbcf248ok8GXJWRM
 B4exmwERhXyNWUHcD+Kj7RsS1fKlPwzkcNl6m2hxTnAjHpNeiqhv9Nn0fbLN3/OUJkR5
 6Vqg==
X-Gm-Message-State: ANoB5pmdWjWDHs38PqYyZzv4b4JQXiz/A43K8iikoaB7r/ZEHIM1TNh3
 F0rs/b154xBbRP6BGHDn21XrLQ==
X-Google-Smtp-Source: AA0mqf5pq6yFPLJwg+6rc9NpIFrqUQkDxtLTUGWH4s8tV8oVO85KHufPml/knUFqPw4J8Wt3iTnH+Q==
X-Received: by 2002:a7b:c456:0:b0:3a5:f600:502e with SMTP id
 l22-20020a7bc456000000b003a5f600502emr54233687wmi.39.1670324852812; 
 Tue, 06 Dec 2022 03:07:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r11-20020a05600c35cb00b003a84375d0d1sm26840942wmq.44.2022.12.06.03.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 03:07:32 -0800 (PST)
Message-ID: <13c836aa-ec54-453c-d8fc-01f3efe631f8@linaro.org>
Date: Tue, 6 Dec 2022 12:07:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 10/21] i386/xen: handle guest hypercalls
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, Thomas Huth <thuth@redhat.com>
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-11-dwmw2@infradead.org>
 <efef965d-3c9b-abc0-ac5f-c252b10722bd@linaro.org>
 <cb4cdc7944c74ee1918667ba455b9afd0fae351c.camel@infradead.org>
 <d203e13d-e2f9-5816-030d-c1449bde364d@linaro.org>
 <af9c1310fafaeee28f3ce33c6f2cc2c5f260cd9f.camel@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <af9c1310fafaeee28f3ce33c6f2cc2c5f260cd9f.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 6/12/22 10:40, David Woodhouse wrote:
> On Tue, 2022-12-06 at 09:16 +0100, Philippe Mathieu-Daudé wrote:
>> +Thomas
>>
>> On 6/12/22 02:10, David Woodhouse wrote:
>>> On Mon, 2022-12-05 at 23:11 +0100, Philippe Mathieu-Daudé wrote:
>>>> On 5/12/22 18:31, David Woodhouse wrote:
>>>>> +#ifdef CONFIG_XEN
>>>>
>>>> CONFIG_XEN is set when the _host_ has Xen development files available.
>>>>
>>>> IIUC here you want to check if Xen HVM guest support is enabled.
>>>>
>>>> You might want to use a different CONFIG_XEN_xxx key, which itself
>>>> depends on CONFIG_XEN.
>>>
>>> Yeah, I'd be interested in opinions on that one.
>>>
>>> Strictly, the only one that *needs* to be a configure option is
>>> CONFIG_XEN for the Xen libraries, which is support for actually running
>>> on Xen.
>>>
>>> Any time KVM is present, we *could* pull in the rest of the xenfv
>>> machine support unconditionally, since that's no longer dependent on
>>> true Xen.
>>>
>>> But because there's a non-trivial amount of code in the event channel
>>> and grant table stuff, *perhaps* we want to make it optional? I don't
>>> really want to call that CONFIG_KVM_XEN since as noted, it's
>>> theoretically possible to do it with TCG or other accelerators too. So
>>> we could call it CONFIG_XEN_EMULATION.
>>
>> I concur CONFIG_KVM_XEN is confusing; CONFIG_XEN_EMULATION /
>> CONFIG_XEN_EMU sounds better.
>>
>> Is it useful to have the CONFIG_XEN_EMU code under target/i386/ built
>> without having the xenfv machine built in?
> 
> It isn't useful, no.
> 
>> I rather have hw/ and target/ features disentangled, so I'd use
>> CONFIG_XEN_EMU under target/ and CONFIG_XENFV_MACHINE under hw/,
>> eventually having CONFIG_XEN_EMU depending on CONFIG_XENFV_MACHINE
>> and -- for now -- CONFIG_KVM.
> 
> Hm, I was thinking of XENFV_MACHINE as the parts which are needed by
> *both* XEN_EMU and real Xen. I think there are arch-independent things
> which want to go into hw/ like event channels and grant table support;
> you can think of those as an IRQ chip and an IOMMU respectively. Since
> those are emulation-only, they want to be conditional on XEN_EMU, not
> XENFV_MACHINE.
> 
> The core hypercall support lives in target/ and would call directly to
> gnttab_op/evtchn_op functions in hw/xen/ but I think that's OK. The
> vCPU-specific things like timers and runstate can also stay in target/.
> 
> Nothing in hw/ should explicitly mention KVM; the code in
> target/i386/xen.c should wrap the KVM-specific implementations unless
> the pretence of future TCG support is really making it look awful.
> 
> Does that sound reasonable? Probably close enough, and we can take an
> other look at it once we see how it works out.
> 
>>> I don't think we'd make that depend on CONFIG_XEN though, since none of
>>> the actual Xen libraries would be needed once everything's implemented
>>> and cleaned up.
>>
>> Agreed.
>>
>>> So things like the xenfv machine code would then depend on
>>> (CONFIG_XEN || CONFIG_XEN_EMULATION)... or we could make a new
>>> automatic config symbol CONFIG_XEN_MACHINE which has the same effect?
>>
>> So per what you just cleared, not CONFIG_XEN but CONFIG_KVM.
> 
> I think it looks something like this...
> 
>  From 0a90999e37ec48b7fbd0467c243769b9bf726401 Mon Sep 17 00:00:00 2001
> From: David Woodhouse <dwmw@amazon.co.uk>
> Date: Tue, 6 Dec 2022 09:03:48 +0000
> Subject: [PATCH] Add CONFIG_XENFV_MACHINE and CONFIG_XEN_EMU options for Xen
>   emulation
> 
> The XEN_EMU option will cover core Xen support in target/, which exists
> only for x86 with KVM today but could theoretically also be implemented
> on Arm/Aarch64 and with TCG or other accelerators. It will also cover
> the support for architecture-independent grant table and event channel
> support which will be added in hw/xen/.
> 
> The XENFV_MACHINE option is for the xenfv platform support, which will
> now be used both by XEN_EMU and by real Xen.
> 
> The XEN option remains dependent on the Xen runtime libraries, and covers
> support for real Xen. Some code which currently resides under CONFIG_XEN
> will be moving to CONFIG_XENFV_MACHINE over time.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   accel/Kconfig  | 2 ++
>   hw/Kconfig     | 1 +
>   hw/xen/Kconfig | 2 ++
>   meson.build    | 1 +
>   target/Kconfig | 3 +++
>   5 files changed, 9 insertions(+)
>   create mode 100644 hw/xen/Kconfig
> 
> diff --git a/accel/Kconfig b/accel/Kconfig
> index 8bdedb7d15..87d2880cad 100644
> --- a/accel/Kconfig
> +++ b/accel/Kconfig
> @@ -15,7 +15,9 @@ config TCG
>   
>   config KVM
>       bool
> +    select XEN_EMU if (I386 || X86_64)

We certainly can build KVM without XEN_EMU...

You might want to s/select/imply/ here.

>   config XEN
>       bool
>       select FSDEV_9P if VIRTFS
> +    select XENFV_MACHINE

This is the XEN (host) accelerator switch... You said previously
it is not related to the guest xenfv machine.

> diff --git a/hw/Kconfig b/hw/Kconfig
> index 38233bbb0f..ba62ff6417 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -41,6 +41,7 @@ source tpm/Kconfig
>   source usb/Kconfig
>   source virtio/Kconfig
>   source vfio/Kconfig
> +source xen/Kconfig
>   source watchdog/Kconfig
>   
>   # arch Kconfig
> diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
> new file mode 100644
> index 0000000000..066d74e4ff
> --- /dev/null
> +++ b/hw/xen/Kconfig
> @@ -0,0 +1,2 @@
> +config XENFV_MACHINE
> +    bool

        select XEN_EMU

> diff --git a/meson.build b/meson.build
> index 5c6b5a1c75..9348cf572c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3828,6 +3828,7 @@ if have_system
>     if xen.found()
>       summary_info += {'xen ctrl version':  xen.version()}
>     endif
> +  summary_info += {'Xen emulation':     config_all.has_key('CONFIG_XEN_EMU')}
>   endif
>   summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
>   if config_all.has_key('CONFIG_TCG')
> diff --git a/target/Kconfig b/target/Kconfig
> index 83da0bd293..ceb6ddbf2a 100644
> --- a/target/Kconfig
> +++ b/target/Kconfig
> @@ -18,3 +18,6 @@ source sh4/Kconfig
>   source sparc/Kconfig
>   source tricore/Kconfig
>   source xtensa/Kconfig
> +
> +config XEN_EMU
> +    select XENFV_MACHINE

No, a target feature should not select a hw/machine component.

        depends on KVM

