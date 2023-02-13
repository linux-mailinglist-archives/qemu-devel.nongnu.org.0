Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7574E694075
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:13:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRUsM-0007jE-NI; Mon, 13 Feb 2023 04:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRUs1-0007iQ-9L
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:11:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRUrz-00080R-L2
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676279489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EmnA+sfeF0T9ZdUFo5KIHrAyNOx25PvBhUg4i3zTw/A=;
 b=em+fqeKes0+8PbQeL4ln3X6rQADLwHGbg94bYEQjhfTfletJ6fRO4SbKcphVt4cP/hlG3u
 lobfea4kfsoiaeeyLWKwzgdRnJnV/jWvHCG3jTe7dYiL+hYb9JabQYDddwGWBMsr+G0tZF
 BUUmEJ8a6h9ZYvY0UzCSZ3aA7gNAL1w=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-50jRVq3QMgyiLfNXDJxA0w-1; Mon, 13 Feb 2023 04:11:28 -0500
X-MC-Unique: 50jRVq3QMgyiLfNXDJxA0w-1
Received: by mail-qv1-f72.google.com with SMTP id
 w2-20020a0cc702000000b0055c8ef137ddso6489994qvi.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 01:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EmnA+sfeF0T9ZdUFo5KIHrAyNOx25PvBhUg4i3zTw/A=;
 b=wFbfV1dWh4/wFOd2UB1Z1QiJQuCM2eE3AZhAI/wOSSCFD+2O41TU6OTKBup2RdiXV3
 s0W/GvW602mr9AKWkgtVMsWmMIJMI/fDJ5ssyjshohN0LiEW2YoKxsIOZ9Lo6wFdIKXm
 6yNKG5Q4bxRZ/ENh9sgQK1AGZLB0hiOHs3ltk5b13iVOvOVpOVhNMXOKqOzfSiywXcLJ
 LabFXy+YLM0op/1fvB9BponLS0t+AN6hpSQhdJ1XD5gWQzjRR2n8U+WanuvUCKNL3+nK
 z+4q6K/MgkZmTQd7MPvftzapzfDjrU3OT9PLgYb52RQTaJB/8Z01F6pWbXUaRluo6psy
 y0hA==
X-Gm-Message-State: AO0yUKV3vnbQ4PtetSKhPHa9vyhVBXet2WZksCigRvfccALA20ASs9HH
 Q5s9Wj+KJX0j6ggXZxzjUeyW47UvZxvrT7LtyeZVMGbEees/WId0DpSm6xha8FGjD0CJhJsZ35V
 +v7huIqmXLf/oTq0=
X-Received: by 2002:ac8:5a4c:0:b0:3b9:a523:2bb5 with SMTP id
 o12-20020ac85a4c000000b003b9a5232bb5mr40611162qta.14.1676279487707; 
 Mon, 13 Feb 2023 01:11:27 -0800 (PST)
X-Google-Smtp-Source: AK7set/pgrD6I9xhlVyImNORbnH8wxm1csXP/amZixCb70eHf3zPSHGnNpOoQBnFfasNjqBsW9PTZA==
X-Received: by 2002:ac8:5a4c:0:b0:3b9:a523:2bb5 with SMTP id
 o12-20020ac85a4c000000b003b9a5232bb5mr40611140qta.14.1676279487450; 
 Mon, 13 Feb 2023 01:11:27 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-185.web.vodafone.de.
 [109.43.177.185]) by smtp.gmail.com with ESMTPSA id
 q20-20020ac84514000000b003b9b48cdbe8sm8910503qtn.58.2023.02.13.01.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 01:11:26 -0800 (PST)
Message-ID: <ad356f64-dca0-8117-d22a-a530e620ddb0@redhat.com>
Date: Mon, 13 Feb 2023 10:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20230213070820.76881-1-philmd@linaro.org>
 <20230213070820.76881-20-philmd@linaro.org>
 <265f782c-d3c8-b7d5-d1ea-4d10edd2ad4f@redhat.com>
 <755f5b86-02fe-16b2-7b45-f31935a19d86@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH v2 19/19] hw/usb: Inline usb_bus_from_device()
In-Reply-To: <755f5b86-02fe-16b2-7b45-f31935a19d86@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.348, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 13/02/2023 09.44, Philippe Mathieu-Daudé wrote:
> On 13/2/23 09:11, Thomas Huth wrote:
>> On 13/02/2023 08.08, Philippe Mathieu-Daudé wrote:
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> RFC Other devices don't use such helper. Maybe it should
>>>      be the other way around, introduce more bus_from_device()
>>>      helpers?
>>> ---
>>>   hw/usb/bus.c        | 10 +++++-----
>>>   hw/usb/core.c       |  6 +++---
>>>   hw/usb/dev-hub.c    |  4 ++--
>>>   hw/usb/dev-serial.c | 10 +++++-----
>>>   hw/usb/hcd-xhci.c   |  2 +-
>>>   include/hw/usb.h    |  5 -----
>>>   6 files changed, 16 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
>>> index d7c3c71435..4a1b67761c 100644
>>> --- a/hw/usb/bus.c
>>> +++ b/hw/usb/bus.c
>>> @@ -427,7 +427,7 @@ void usb_unregister_port(USBBus *bus, USBPort *port)
>>>   void usb_claim_port(USBDevice *dev, Error **errp)
>>>   {
>>> -    USBBus *bus = usb_bus_from_device(dev);
>>> +    USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));
>>
>> You're certainly missing a proper justification in the patch description 
>> here. The "other devices don't use such a helper" does not sound like a 
>> real justification to me, since the code lines rather get longer this way. 
>> Thus this rather looks like unnecessary code churn to me --> rather drop 
>> the patch?
> 
> The idea is to avoid having 7 different ways of implementing something
> with 3 different APIs and 2 unfinished API conversions in flight.

Ok, then please add such information to the patch description.

> I'm wondering if the QOM DECLARE_xxx() macros could also define some
> xxx_BUS_FROM_DEV() or xxx_PARENT_BUS() macros. So here it would become:
> 
>      USBBus *bus = USB_PARENT_BUS(dev);

Sounds more readable at a first glance, but when looking at the output of:

   grep -r '(qdev_get_parent_bus' hw/

it seems like there aren't that many other places using this pattern (many 
places rather use BUS() instead), so it's maybe hard to justify such a 
change. Thus I think your patch here is likely the better solution right now 
(when you add a proper patch description).

  Thomas


