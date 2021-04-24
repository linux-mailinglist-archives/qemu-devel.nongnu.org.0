Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCC136A158
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 15:17:55 +0200 (CEST)
Received: from localhost ([::1]:56784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laIAU-0003vC-FO
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 09:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laI8Q-000313-TW
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 09:15:46 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laI8M-00078Z-P5
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 09:15:45 -0400
Received: by mail-wr1-x429.google.com with SMTP id e5so22471528wrg.7
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 06:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yeu6AJwn2Tt8rXiCbkoG8l9yatHUjp+e7ScPBaWR8EY=;
 b=lolAqQ18K0jy0jWB0ACirNIUvDvja66Fj0jEk6ptSjuaEfC7FxAJ3N5RRohxfOqKrd
 dUoVB6gf0/ShAAOUf61WSKW/kiV5Rx/kO/l3/gXjss64rLelMS5l0W5KHCOZMhcnW6GS
 sqzWNDAjvVDB7hyxTSmWUY+Z5CaO6PlQ4jJh7G+r4PeOKRUDtDL8ebSKqUFAA1vmXQDS
 k/aaIsN8NigA0nJe+7Msntyix08yRjpUcAwnNAY6cQvPzkn+IS4kVFrXZVvtj2EkJ/DQ
 Zi+VyszyR1eKJpbPpmAqkIoFhS/5/II039zLSJoVB1QqtPRyo5FLGFTNj6OfxAfU2mRq
 Aetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yeu6AJwn2Tt8rXiCbkoG8l9yatHUjp+e7ScPBaWR8EY=;
 b=TizWCIXifsyz6G+RAScpYWUciiRyBoKU/NKBCcN58AA9sc6wwvH0lBN4qZ/xGY+RXn
 sdL93T7KQs3d1wJMk2xszWBzCCyFXjY5zKr4bi7bcxo0QFqJ/dNush/1uwh4sAnuV/HC
 OYmTU9g3Ss4K8sW9FNiXpDERx5pZ7fJRCGq3nK7JChEUkeTAsGpOyBZAxz3lQYpwLpoN
 QOyB9G0HYXeVsUQ4YkLXkx+O/JIKnYZksqSslM/ozSe5Rl9WAIkZIkRde0uno+l7Sx57
 fKonODY9Gq+vEhNuHu4FmMWYph/0wLX3MfrWZYucSOAfDcTzmlNy946zr+OH7hLyznR3
 u2xw==
X-Gm-Message-State: AOAM530z3g65/mkdJ/aEscQRxgU/QcO4fwt4FBh/F4IFhHSClSUFeqkJ
 IQNNZxTro/PEN9V0UQLOxgQFJ2CATOXwPw==
X-Google-Smtp-Source: ABdhPJz2ixswlCB4YNkyl1F2IVTPZpeFHbx+Mw5ydKZLFp1tWU0p7MQIyJeo1Q4SWjc1/214WZof2A==
X-Received: by 2002:a5d:510c:: with SMTP id s12mr9127746wrt.231.1619270139734; 
 Sat, 24 Apr 2021 06:15:39 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id e10sm12723593wrw.20.2021.04.24.06.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 06:15:39 -0700 (PDT)
Subject: Re: Resetting non-qdev children in a 3-phase reset device
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <CAFEAcA8k+RUNhAOzCeefBs+vcyAgrtHwHMH9KfQb6OJg0su_7w@mail.gmail.com>
 <fc080508-9b82-8a2b-79bb-ab4e9f812cce@amsat.org>
 <CAFEAcA8hs3Uw=8-_CFa_GoMhmqxCcHw5t751oKzicd0_+Dh8kA@mail.gmail.com>
 <87y2datpyw.fsf@dusky.pond.sub.org>
 <5570bf5a-3cab-c30c-2c21-0ab02543199e@amsat.org>
 <2f4155ca-ee84-75f0-8b35-aac6b18ee4f0@amsat.org>
 <3dcb8efa-8f6b-0f45-a753-cc58d3bf9855@amsat.org>
 <87im4cb6ag.fsf@dusky.pond.sub.org>
 <b7f6752b-6f4c-a3d2-074c-0b41094d7dfa@amsat.org>
Message-ID: <b9881828-dc07-d9a8-fb70-f1597b2fc53c@amsat.org>
Date: Sat, 24 Apr 2021 15:15:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b7f6752b-6f4c-a3d2-074c-0b41094d7dfa@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 3:04 PM, Philippe Mathieu-Daudé wrote:
> On 4/24/21 7:28 AM, Markus Armbruster wrote:
>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>
>>>> Looking at qemu_register_reset() uses I found this commit:
>>>>
>>>> commit 0c7322cfd3fd382c0096c2a9f00775818a878e13
>>>> Date:   Mon Jun 29 08:21:10 2015 +0200
>>>>
>>>>  watchdog/diag288: correctly register for system reset requests
>>>>
>>>>  The diag288 watchdog is no sysbus device, therefore it doesn't get
>>>>  triggered on resets automatically using dc->reset.
>>>>
>>>>  Let's register the reset handler manually, so we get correctly notified
>>>>  again when a system reset was requested. Also reset the watchdog on
>>>>  subsystem resets that don't trigger a full system reset.
>>>>
>>>> Why is the reset() handler in DeviceClass and not in SysbusDeviceClass
>>>> if "Only sysbus devices get reset"? ...
>>>
>>> Ah, probably because the problem is generic to all busses (ISA, ...)
>>> and not just sysbus.
>>
>> diag288 is a bus-less device.  Propagating reset from the root of the
>> qtree to the leaves won't reach it, because the qtree contains only the
>> devices that plug into a qbus.
> 
> I now understand better the diag288 case, but I still don't understand
> the TYPE_APIC one. It has no DeviceClass::reset(), its abstract parent
> TYPE_APIC_COMMON register apic_reset_common() but being TYPE_DEVICE it
> is not on a qbus. It is somehow connected to the X86CPU object, but the
> single call to apic_init_reset() is from do_cpu_init() - not a reset
> method -.
> Is apic_reset_common() dead code? I don't think so because git-blame
> report activity:
> 
>   2013-11-05 266) static void apic_reset_common(DeviceState *dev)
>   2011-10-16 267) {
>   2013-11-05 268)     APICCommonState *s = APIC_COMMON(dev);
>   2012-02-17 269)     APICCommonClass *info = APIC_COMMON_GET_CLASS(s);
>   2015-04-07 270)     uint32_t bsp;
>   2011-10-16 271)
>   2015-04-07 272)     bsp = s->apicbase & MSR_IA32_APICBASE_BSP;
>   2015-04-07 273)     s->apicbase = APIC_DEFAULT_ADDRESS | bsp |
> MSR_IA32_APICBASE_ENABLE;
>   2016-10-19 274)     s->id = s->initial_apic_id;
>   2011-10-16 275)
>   2017-01-31 276)     apic_reset_irq_delivered();
>   2017-01-31 277)
>   2012-02-17 278)     s->vapic_paddr = 0;
>   2012-02-17 279)     info->vapic_base_update(s);
>   2012-02-17 280)
>   2013-11-05 281)     apic_init_reset(dev);
>   2011-10-16 282) }

Similarly the KVM counterpart:

  2014-12-10 220) static void kvm_apic_reset(APICCommonState *s)
  2011-10-16 221) {
  2014-08-28 222)     /* Not used by KVM, which uses the CPU mp_state
instead.  */
  2014-08-28 223)     s->wait_for_sipi = 0;
  2016-09-12 224)
  2016-10-31 225)     run_on_cpu(CPU(s->cpu), kvm_apic_put,
RUN_ON_CPU_HOST_PTR(s));
  2014-12-10 226) }

> 
> Cc'ing APIC maintainers because I'm lost.
> 

