Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9406A369D2B
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:10:59 +0200 (CEST)
Received: from localhost ([::1]:40620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4ws-00017F-NM
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la4sf-0003df-8Y
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:06:37 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la4sd-000667-Cj
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:06:36 -0400
Received: by mail-wr1-x42c.google.com with SMTP id c4so10910058wrt.8
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=++1usbpoyKUb3pYP/7mURDOk81+FaVfRUhg89jqxGRU=;
 b=cnHe4f6+prRU69oWPkePqAqP9cnY0IBXsFR7pYGRWsE7yPX5uGSTJC6O0nG7Ol5UYk
 WvQbw9GLPrbMAL7Y8L2lTuKp176bqcGQVrIxh/mVmhOEzgX72QA3dhJwZS6a2K2EzbFs
 eppYgJ8su1BVy1EHsAbsgNY/7aNlfulh6KXWRVhsLkl72sdxLrl/JITQUVnACYIpqDNs
 4nuouuSiLrpQt/Fk/EiQJjn7kb5RSaXApAfsn+IO/UtmTqqzUbQ1Qqg71na+zmZOe4dd
 1mrBZYUZzwUp3DwGy9VmHFSlOhD93f4/Tou1ujB1HNqZrv3eYrDt1oc0ceBKsNUQWdxS
 u58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=++1usbpoyKUb3pYP/7mURDOk81+FaVfRUhg89jqxGRU=;
 b=ANYO8UheojfMovqgoxxja6NgdEnLmuHojMN4TO88T0tsllfiNhgw6leiWvtp8TY9rQ
 enQamWlh9vhIGTp4ALDomKDBW+pXQvs7yHxiA3doujRStVgSZFa1zv01MQ0NbdjBxfbv
 aSHyUtqQPHE33UlEjMX4qHw3uRJSvT5O2oqF5veqH3sFbFdbPvIKpln2+NkGsCgUAdNM
 pgriYxhWAEy9zxOiWMKW0QOWyvwAMYJh5PXC9mrNlggFADb1x6oiQP/pR8jSzaRv0Hoe
 sR9EEp8PO+sRNgie+tTaup8a6DMEDYDP8gVUEMU+ILLuEyXMaPepkdKf/a1DDGwYI4sK
 nzjw==
X-Gm-Message-State: AOAM5335+fhOPWuuO7rfCLeiJAsyk2W2EfZXoccREY+AmN5DKhrH2x14
 nbREyO4+bjKjqgCp3eANmAnC0iv7SzDltg==
X-Google-Smtp-Source: ABdhPJyeEmfSO+CLTeafpQIu/TOY5wQhYuZ2U5ug1TGaAZCPmYIXsx1X8zMZyz5xaBjpUUgKNKDD/Q==
X-Received: by 2002:a5d:5407:: with SMTP id g7mr7531215wrv.149.1619219193450; 
 Fri, 23 Apr 2021 16:06:33 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u3sm9136025wmg.48.2021.04.23.16.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:06:32 -0700 (PDT)
Subject: Re: Resetting non-qdev children in a 3-phase reset device
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <CAFEAcA8k+RUNhAOzCeefBs+vcyAgrtHwHMH9KfQb6OJg0su_7w@mail.gmail.com>
 <fc080508-9b82-8a2b-79bb-ab4e9f812cce@amsat.org>
 <CAFEAcA8hs3Uw=8-_CFa_GoMhmqxCcHw5t751oKzicd0_+Dh8kA@mail.gmail.com>
 <87y2datpyw.fsf@dusky.pond.sub.org>
 <5570bf5a-3cab-c30c-2c21-0ab02543199e@amsat.org>
Message-ID: <2f4155ca-ee84-75f0-8b35-aac6b18ee4f0@amsat.org>
Date: Sat, 24 Apr 2021 01:06:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5570bf5a-3cab-c30c-2c21-0ab02543199e@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 4/22/21 4:20 PM, Philippe Mathieu-Daudé wrote:
> On 4/22/21 3:21 PM, Markus Armbruster wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:

>> Most qdevs plug into a qbus, but some don't.
>>
>> DeviceClass member @bus_type names the kind of bus the device plugs
>> into.  It's a QOM type name.  Example: for a PCI device, it's
>> TYPE_PCI_BUS, and the device must be plugged into an instance of a
>> (subtype of) TYPE_PCI_BUS.
>>
>> If @bus_type is null, the device does not plug into any qbus.
>>
>> The qbus a device is plugged into is also called the parent bus.  Not to
>> be confused with the QOM parent.
>>
>>>>             But even without parent they end in the /unattached
>>>> container below /machine, so if the reset were there, the
>>>> machine could still iterate over the /unattached children.
>>>
>>> ...yes, /unattached is what I was thinking about.
>>>
>>> My current half-thought-through view is that where we ought
>>> to try to end up is something like:
>>>
>>>  * "real" buses should continue to propagate reset
>>>    (A "real" bus is like PCI, SCSI, and other buses where the real
>>>    hardware has a concept of a "bus reset" or where the power to the
>>>    plugged device comes from the bus so that powercycling the
>>>    controller naturally powercycles the devices. Sysbus is not a
>>>    "real" bus; I haven't checked the others to see if we have any
>>>    other non-real buses)
>>>  * reset should follow the QOM tree for objects not on a "real" bus
>>>    (that is, the qdev "reset this device" function should do
>>>    "iterate through my QOM children and reset those which are not
>>>    on a real bus" as well as its current "reset myself" and "reset
>>>    every qbus I have")
>>>  * instead of reset starting with the sysbus and working along the
>>>    qbus hierarchy, we start by resetting the machine. That should
>>>    include resetting all the QOM children of the machine. Any
>>>    device which has a qbus should reset the qbus as part of its
>>>    reset, but only "real" buses reset their children when reset.
>>
>> Sounds like an approximation of reset wire modelling :)
>>
>> In a real machine, the reset signal travels along "wires" (in quotes,
>> because it need not be a dedicated wire, although it commonly is)
>>
>> We're not modelling these wires explicitly so far.  Instead, we make
>> assumptions such as "reset flows along the qdev tree", which are close
>> enough except when they aren't.
>>
>> What you propose is likely closer to reality than what we have now.
> 
> Then maybe reality is easier to model =)
> 
>> Do I make sense?
> 
> I guess so. Now I wonder if Peter's approach is doable while still
> having "incompletely QOMified devices".
> 
> But if we can propagate reset tree via QOM, it is a good excuse
> to finish QOM'ifying devices and enforce the API to prohibit non-QOM
> ones.
> 
> And remove the crutch in device_set_realized().
> 
>>> That means that, for instance, if you reset an SoC container object
>>> it will reset all the sub-devices within the SoC and the miscellaneous
>>> bits of glue logic like OR gates it might also own[*]. It also means that
>>> CPU objects should no longer need weird special casing, because they
>>> are part of the QOM hierarchy and get reset that way.
>>>
>>> [*] Fun fact: TYPE_OR_IRQ inherits directly from TYPE_DEVICE which
>>> means that pretty much no instances of it ever get reset.
>>>
>>> There is of course a massive unsolved problem with this idea, which
>>> is the usual "how do we get there from here" one.
>>>
>>> (Eventually I think we might be able to collapse TYPE_SYS_BUS_DEVICE
>>> down into TYPE_DEVICE: there is no particular reason why a TYPE_DEVICE
>>> can have GPIO inputs and outputs but only a TYPE_SYS_BUS_DEVICE can
>>> claim to have MMIO regions and IRQs. "Only sysbus devices get reset"
>>> is a big part of why a lot of devices today are sysbus.)

Looking at qemu_register_reset() uses I found this commit:

commit 0c7322cfd3fd382c0096c2a9f00775818a878e13
Date:   Mon Jun 29 08:21:10 2015 +0200

 watchdog/diag288: correctly register for system reset requests

 The diag288 watchdog is no sysbus device, therefore it doesn't get
 triggered on resets automatically using dc->reset.

 Let's register the reset handler manually, so we get correctly notified
 again when a system reset was requested. Also reset the watchdog on
 subsystem resets that don't trigger a full system reset.

Why is the reset() handler in DeviceClass and not in SysbusDeviceClass
if "Only sysbus devices get reset"? ...

>>
>> Sysbus may habe been a design mistake.  It goes back the qdev design
>> assumption "every device plugs into exactly one bus, every bus is part
>> of exactly one device, and the main system bus is the root of this
>> tree".  The assumption ceased to hold long ago, but we still have
>> sysbus.

