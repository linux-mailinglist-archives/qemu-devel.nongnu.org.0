Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC84736825E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 16:22:37 +0200 (CEST)
Received: from localhost ([::1]:53972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZaE1-00033p-2j
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 10:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZaCT-0002V3-9O
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:21:01 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZaCQ-0003ov-UL
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:21:01 -0400
Received: by mail-wm1-x333.google.com with SMTP id y204so22808793wmg.2
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xQBl9wNf8fvdUg4fCgDSNbZTBZwgdN1IAxqkTh59dtc=;
 b=Y5/k8yiGjmgrluVcV0QmQgZCkNhT5jLhVe7TB65s/cxXahoXDq4c4yVIC70TVtijNv
 lZpI9D2m9RkpIMR4DYaZAZPLuC804Na70XhBgIjYKdBo+XwebGCfmN5q0XTn4kc79S53
 EzJ32aDtTWjI0q2HqafHhTGvCPGfyd5MGEnp99CXa0IzEQ0ThYAyLp6p9FmZENXBrSlt
 VYHHkxxLQtRfzhbz0j4LWrjxsgYTk9xFG7oBsGemwcDJ6/K1+Xvj5h8LBNP+z/eVzQf7
 b2z+FqARyjFJ/lfA/HVIf4MLw0J+Fqc/TlMV1paJFZnVYU1jNc7L2/Y3ALHfQp1KO1JS
 hLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xQBl9wNf8fvdUg4fCgDSNbZTBZwgdN1IAxqkTh59dtc=;
 b=iHPWPlAkBe3cZGudsuAG6Vx+ApdDhPHSXPJElNi8+PhEj58sgH0ZYDRFQuPv1kZPTQ
 RGEL4plVdYjf357vnoXvjq8Qir5lQ4Pj9fTRqouIG1wagjavKfpE0m/03v2nj2wFjNiX
 8WL3Pgv6aOqxH68ezXFEbmua4kT1n/KDh9VJLxzgJ50/T2xf8VWgsKpuilVq8nPdrftO
 Acw2GD2+YE/PMEvp170xR4XgmEx2yS0Jp2V9aRnjgrJZ0N2YOSQMY0RuGEl/a723pN6t
 y+EaxOOzE6kWiYsgbe4XKBaY0N0/1wcGrarmjiMMBKwndC3gZs/afs3I/C1bacwCm9sk
 6r5g==
X-Gm-Message-State: AOAM530jFsqn70+0L9fOitZoWHhjJcAPRTUvKwLEOKX3x4e2PkhAEJXB
 kO0WEdhykD9FdYRsRewD7DIhgVPpPoSr7w==
X-Google-Smtp-Source: ABdhPJwAZPOX/7+PfzxoG4khJdQ2OIrAlTD6gWP4Z4dBQfZX5Wn2vV8evIwVC+Uu8cqlvR49dGR/gQ==
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr4186391wmd.30.1619101256312; 
 Thu, 22 Apr 2021 07:20:56 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t6sm3747895wrx.38.2021.04.22.07.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 07:20:55 -0700 (PDT)
Subject: Re: Resetting non-qdev children in a 3-phase reset device
To: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA8k+RUNhAOzCeefBs+vcyAgrtHwHMH9KfQb6OJg0su_7w@mail.gmail.com>
 <fc080508-9b82-8a2b-79bb-ab4e9f812cce@amsat.org>
 <CAFEAcA8hs3Uw=8-_CFa_GoMhmqxCcHw5t751oKzicd0_+Dh8kA@mail.gmail.com>
 <87y2datpyw.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5570bf5a-3cab-c30c-2c21-0ab02543199e@amsat.org>
Date: Thu, 22 Apr 2021 16:20:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87y2datpyw.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 3:21 PM, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Sun, 18 Apr 2021 at 21:16, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> +Markus
>>>
>>> On 4/9/21 8:13 PM, Peter Maydell wrote:
>>>> Maybe some mechanism for marking "these things which are my
>>>> QOM children I want to be reset when I am reset (so make them
>>>> reset children of me and don't reset them as part of the
>>>> qbus-tree-walking)" would be useful. I do think that in a
>>>> lot of cases we want to be doing something closer to "reset
>>>> along the QOM tree".
>>>
>>> Eh here you mention QOM again... Shouldn't it be qdev?
>>
>> No, I meant QOM, ie the relation you see below in the "info qom-tree"
>> output:
>>
>>> I know the LED is just an example of a broader problem.
>>> I indeed took care to add the QOM parent relation:
>>>
>>> (qemu) info qom-tree
>>> /machine (mps2-an385-machine)
>>>   /fpgaio (mps2-fpgaio)
>>>     /mps2-fpgaio[0] (memory-region)
>>>     /userled0 (led)
>>>       /unnamed-gpio-in[0] (irq)
>>>     /userled1 (led)
>>>       /unnamed-gpio-in[0] (irq)
>>>   /scc (mps2-scc)
>>>     /mps2-scc[0] (memory-region)
>>>     /scc-led0 (led)
>>>       /unnamed-gpio-in[0] (irq)
>>>     /scc-led1 (led)
>>>       /unnamed-gpio-in[0] (irq)
>>>     ...
>>>
>>> So looking at this qom-tree, the reset tree seems to me
>>> more natural than the sysbus one, but IIRC not many models
>>> set this QOM relationship.
>>
>>> QOM objects aren't enforced to have a relation with a parent,
>>
>> I thought they always got parented into somewhere, even if it
>> was a catch-all bucket somewhere ?
> 
> If a *device* has no QOM parent at realize time, realize sets the QOM
> parent to the /machine/unattached/ orphanage.  In device_set_realized():
> 
>     if (value && !dev->realized) {
>         ...
>         if (!obj->parent) {
>             gchar *name = g_strdup_printf("device[%d]", unattached_count++);
> 
>             object_property_add_child(container_get(qdev_get_machine(),
>                                                     "/unattached"),
>                                       name, obj);
>             unattached_parent = true;
>             g_free(name);
>         }
> 
> As far as I understand this is a crutch to help us cope with
> incompletely QOMified devices.
> 
> The crutch does not apply to QOM objects that aren't devices.
> 
>>> as opposed as recent changes from Markus to always have a qdev
>>> on a qbus).
> 
> Most qdevs plug into a qbus, but some don't.
> 
> DeviceClass member @bus_type names the kind of bus the device plugs
> into.  It's a QOM type name.  Example: for a PCI device, it's
> TYPE_PCI_BUS, and the device must be plugged into an instance of a
> (subtype of) TYPE_PCI_BUS.
> 
> If @bus_type is null, the device does not plug into any qbus.
> 
> The qbus a device is plugged into is also called the parent bus.  Not to
> be confused with the QOM parent.
> 
>>>             But even without parent they end in the /unattached
>>> container below /machine, so if the reset were there, the
>>> machine could still iterate over the /unattached children.
>>
>> ...yes, /unattached is what I was thinking about.
>>
>> My current half-thought-through view is that where we ought
>> to try to end up is something like:
>>
>>  * "real" buses should continue to propagate reset
>>    (A "real" bus is like PCI, SCSI, and other buses where the real
>>    hardware has a concept of a "bus reset" or where the power to the
>>    plugged device comes from the bus so that powercycling the
>>    controller naturally powercycles the devices. Sysbus is not a
>>    "real" bus; I haven't checked the others to see if we have any
>>    other non-real buses)
>>  * reset should follow the QOM tree for objects not on a "real" bus
>>    (that is, the qdev "reset this device" function should do
>>    "iterate through my QOM children and reset those which are not
>>    on a real bus" as well as its current "reset myself" and "reset
>>    every qbus I have")
>>  * instead of reset starting with the sysbus and working along the
>>    qbus hierarchy, we start by resetting the machine. That should
>>    include resetting all the QOM children of the machine. Any
>>    device which has a qbus should reset the qbus as part of its
>>    reset, but only "real" buses reset their children when reset.
> 
> Sounds like an approximation of reset wire modelling :)
> 
> In a real machine, the reset signal travels along "wires" (in quotes,
> because it need not be a dedicated wire, although it commonly is)
> 
> We're not modelling these wires explicitly so far.  Instead, we make
> assumptions such as "reset flows along the qdev tree", which are close
> enough except when they aren't.
> 
> What you propose is likely closer to reality than what we have now.

Then maybe reality is easier to model =)

> Do I make sense?

I guess so. Now I wonder if Peter's approach is doable while still
having "incompletely QOMified devices".

But if we can propagate reset tree via QOM, it is a good excuse
to finish QOM'ifying devices and enforce the API to prohibit non-QOM
ones.

And remove the crutch in device_set_realized().

>> That means that, for instance, if you reset an SoC container object
>> it will reset all the sub-devices within the SoC and the miscellaneous
>> bits of glue logic like OR gates it might also own[*]. It also means that
>> CPU objects should no longer need weird special casing, because they
>> are part of the QOM hierarchy and get reset that way.
>>
>> [*] Fun fact: TYPE_OR_IRQ inherits directly from TYPE_DEVICE which
>> means that pretty much no instances of it ever get reset.
>>
>> There is of course a massive unsolved problem with this idea, which
>> is the usual "how do we get there from here" one.
>>
>> (Eventually I think we might be able to collapse TYPE_SYS_BUS_DEVICE
>> down into TYPE_DEVICE: there is no particular reason why a TYPE_DEVICE
>> can have GPIO inputs and outputs but only a TYPE_SYS_BUS_DEVICE can
>> claim to have MMIO regions and IRQs. "Only sysbus devices get reset"
>> is a big part of why a lot of devices today are sysbus.)
> 
> Sysbus may habe been a design mistake.  It goes back the qdev design
> assumption "every device plugs into exactly one bus, every bus is part
> of exactly one device, and the main system bus is the root of this
> tree".  The assumption ceased to hold long ago, but we still have
> sysbus.

This might explain the undocumented API called
'device_listener' in qdev which instead uses sysbus:

void device_listener_register(DeviceListener *listener);
void device_listener_unregister(DeviceListener *listener);

Thanks,

Phil.

