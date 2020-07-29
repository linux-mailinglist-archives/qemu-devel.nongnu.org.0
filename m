Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC8E231DFA
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 14:03:22 +0200 (CEST)
Received: from localhost ([::1]:51160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0knp-0002a3-6E
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 08:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k0kmy-0002AG-FW
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 08:02:28 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k0kmw-0006By-SP
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 08:02:28 -0400
Received: by mail-ej1-x631.google.com with SMTP id f14so8192683ejb.2
 for <qemu-devel@nongnu.org>; Wed, 29 Jul 2020 05:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TFdASNcQcm/v85ZE9LlhYG7oDqa2ikGwGq8e0g3/ydk=;
 b=sgRIOPqOUq74C7aj5LqByK+0W99agEclTg7azBB7wLCwQvIcvl1d/0G3f+JdBoFBo5
 sxH29/C33ApH+4siGMv3Jva8Q1C7BeNWtv3x6i38yNYNOuf9hgaVJ9wUARhC/QxBMtOJ
 WN3gealNhFeG5aw5PV/h7pLVlZ9S8wQ64vHkbh6nc46oJykibPq7zfX9yi6vwqndDP77
 uOhWkPkb2zP9SS7PTZfT0gKdF9KWCuhFFXYvEg4X14ndbyr+dW1CVv+Uh0/XJeJNlJV+
 Z5xw7PPMO6ZHghR28NkV4K68AHpRFxRXF9vCz0TV6vB1f31b9+lQsSzi5qnffa2w1WKC
 uprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TFdASNcQcm/v85ZE9LlhYG7oDqa2ikGwGq8e0g3/ydk=;
 b=OvJHh6RBYT0V0KPm0xUBHeGjbJ5v+PCUSHOSDhgJxnq68A4q/XuXi3vLiCDjWW8u18
 ypuohhq1wLOrjWgiwXUjR3l7Py3pm7Hv0xFn4qo6058pAInEmNZl/xixZDQyGSKGVRes
 UsnoOydJVkzX8vuXws/X3GEa5YW4DalhhTWzIKSe4ENdLGnKkzOxXuhNp0RUdesZIdLp
 iyF5zFZMITDBXbaOoYUA1O5gLtfw/FpoLMe0yBNtJW6O6goYg/xZG05k6HtGbbI8cO/j
 F+q5YzRWMSOdo9Zbf7+/YitsVWMsvDeWmq/FvyzWDTVoLYZPNSPDyzAAldT77wtfA8Th
 iwUg==
X-Gm-Message-State: AOAM531ayheFtEHEDO7wwEDVib5PpeTfJEYKk5b2bTPA2+7FkmtCbJGk
 JuYz17fQEUMj6mN/qIvIAB7180ac
X-Google-Smtp-Source: ABdhPJyPejvHbzFtR7b2gkL55qlCcxhAnzdmZHYxlkJ0Exe2962AyR302l/phrPZTb0KaLwlrB4OpA==
X-Received: by 2002:a17:906:381b:: with SMTP id
 v27mr1396214ejc.88.1596024144488; 
 Wed, 29 Jul 2020 05:02:24 -0700 (PDT)
Received: from [192.168.1.39] (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id be2sm1632029edb.92.2020.07.29.05.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 05:02:23 -0700 (PDT)
Subject: Re: [PATCH-for-5.2 v4] hw/core/qdev: Increase qdev_realize() kindness
To: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200727175112.6820-1-f4bug@amsat.org>
 <87d04gf5i4.fsf@dusky.pond.sub.org>
 <b5cd0d50-c0a6-afee-5b63-80bb83e7e001@redhat.com>
 <87r1suahxu.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a73edd14-ab57-0072-36cb-91222a9a1638@amsat.org>
Date: Wed, 29 Jul 2020 14:02:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87r1suahxu.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/20 9:39 AM, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 28/07/20 09:44, Markus Armbruster wrote:
>>>> -        assert(!DEVICE_GET_CLASS(dev)->bus_type);
>>>> +    } else if (DEVICE_GET_CLASS(dev)->bus_type) {
>>>> +        error_setg(errp, "Unexpected bus '%s' for bus-less device '%s'",
>>>> +                   DEVICE_GET_CLASS(dev)->bus_type,
>>>> +                   object_get_typename(OBJECT(dev)));
>>>> +        return false;
>>>>      }
>>>>  
>>>>      object_property_set_bool(OBJECT(dev), true, "realized", &err);
>>> Objection.  This turns an abort into something else unless the caller
>>> passes &error_abort.  The caller in your commit message's example does,
>>> others don't.
>>>
>>> Keep the unconditional abort, please.  Feel free to print something kind
>>> right before.  I doubt it's all that useful, as I believe whoever gets
>>> to fix the bug will have to figure out the code anyway, but I could be
>>> wrong.
>>>
>>
>> This was my request, actually.  We have an Error**, we should use it in
>> case this code is reached via device_add.
> 
> That's not actually possible.

I agree this condition is not possible in current mainstream.

What I'm working on is:

qmp command that:
- create a SDCard or FloppyDisk medium
- eventually link a block driver to it
- insert the medium into a slot

then another qmp command that
- eject the medium
- unlink the block driver
- destroy the medium

second step is a command that takes as argument
(block driver, bus endpoint) and automatically
creates the envelope media and insert it to the bus.

> qdev_device_add():
> 
>     path = qemu_opt_get(opts, "bus");
>     if (path != NULL) {
> 
> If user passed bus=...,
> 
>         bus = qbus_find(path, errp);
>         if (!bus) {
>             return NULL;
>         }
>         if (!object_dynamic_cast(OBJECT(bus), dc->bus_type)) {
>             error_setg(errp, "Device '%s' can't go on %s bus",
>                        driver, object_get_typename(OBJECT(bus)));
> 
> but the device is bus-less, error out.
> 
>             return NULL;
>         }
>     } else if (dc->bus_type != NULL) {
> 
> 
> If user did not pass bus=..., but the device needs one,
> 
>         bus = qbus_find_recursive(sysbus_get_default(), NULL, dc->bus_type);
> 
> pick a default bus, or else ...
> 
>         if (!bus || qbus_is_full(bus)) {
>             error_setg(errp, "No '%s' bus found for device '%s'",
>                        dc->bus_type, driver);
>             return NULL;
> 
> error out.
> 
>         }
>     }
> 
> Taking a step back, I disagree with the notion that assertions should be
> avoided just because we have an Error **.  A programming error doesn't
> become less wrong, and continuing when the program is in disorder
> doesn't become any safer when you add an Error ** parameter to a
> function.
> 
> If you're calling for recovering from programming errors where that can
> be done safely, we can talk about creating the necessary infrastructure.
> Handling them as if they were errors the user can do something about can
> only lead to confusion.
> 
> 

