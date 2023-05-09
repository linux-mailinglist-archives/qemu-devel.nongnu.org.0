Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF5C6FC21A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:54:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJ6Q-00017R-Aw; Tue, 09 May 2023 04:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwJ6O-00016w-E2
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:53:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwJ6M-0002vB-Lt
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683622421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+ZH6m8g5agPyZ1jyezjjS95kEe9e17cahCz7wQDC1M=;
 b=PT/mJ9kp/FOPbt6eCPeVYPu3aaj/7xWRUxrTY+MgB6MccnfV9DmPSp68fh6XCbVnLUmsYJ
 mbMD1TiHrJtT8GEv6InlpYJpRKQWENAcWHzVwz0v8jmkq1i9z8gjZMXApTsd4kggbAnjol
 r24lpQAaRWtAQ4iF4dWNlx3sfLIHo/U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-eV4lu48FOw6n2zeHx9r6Rg-1; Tue, 09 May 2023 04:53:38 -0400
X-MC-Unique: eV4lu48FOw6n2zeHx9r6Rg-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50bcbb5724aso5160807a12.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 01:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683622417; x=1686214417;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N+ZH6m8g5agPyZ1jyezjjS95kEe9e17cahCz7wQDC1M=;
 b=DmN/V8Xt4nmaXAk86mhiW3nF05n8u26B7dE3gM4U8nRnotDNU8OS4JMYAM3qMi08IS
 HjUqasX37fZLtA7Ee2CfBToNFoXEmZcg4ohDDhlGkAPTB3uPiwLwsCNvXgYQ1xGyhBBX
 CTcKIyPjbjAzMeZDfILu4OOlzqW+J6qsvJGhV2LzKbiGCMLj47kISpY/SAbWt1N65kO8
 S7ZLGSk6D+KxDBrBijbZTSxH+AesDECiLdAs1dPLAn13bNjCu1kWW2DKkoZplPEf4Fxf
 y9YJA2czyPLNvrW1ubtI1no5L5l0fRTbRbT3/KfqT/MSq5IuIiAxpnDqnPowo77UAEZ5
 1/5g==
X-Gm-Message-State: AC+VfDymPL/AJe7WkZmYm6KmWGSTcrx+O+o++uxYFCX3M9n4lv3jeu77
 DZVotLuWjF0LvwwugvOcXFpW+IzYZNvucSZ9THGOMruvWbMrBR8UkMQHRQY7PTHaHqqitiI3GUg
 NoXf0XXLrhxLkDXU=
X-Received: by 2002:a17:907:72d6:b0:94e:43ce:95f6 with SMTP id
 du22-20020a17090772d600b0094e43ce95f6mr12435326ejc.47.1683622417466; 
 Tue, 09 May 2023 01:53:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4F8uouapszlDaL9DXruD6QauKm5cGOFiPW9HtZkLXCxL4DORzbCUAkIh6jdb9MWp2apxEbdw==
X-Received: by 2002:a17:907:72d6:b0:94e:43ce:95f6 with SMTP id
 du22-20020a17090772d600b0094e43ce95f6mr12435304ejc.47.1683622417066; 
 Tue, 09 May 2023 01:53:37 -0700 (PDT)
Received: from ?IPV6:2003:cf:d738:7fbf:bf54:7947:8c4:60ed?
 (p200300cfd7387fbfbf54794708c460ed.dip0.t-ipconnect.de.
 [2003:cf:d738:7fbf:bf54:7947:8c4:60ed])
 by smtp.gmail.com with ESMTPSA id
 mh25-20020a170906eb9900b00882f9130eafsm1035615ejb.26.2023.05.09.01.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 01:53:36 -0700 (PDT)
Message-ID: <a2e87bab-41c3-0402-927e-54d0a0e67d43@redhat.com>
Date: Tue, 9 May 2023 10:53:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/4] vhost-user-fs: Internal migration
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <e8cc4521-50a1-2e38-1fb3-8cfa7b0c967e@redhat.com>
 <CAJSP0QUFFYWwD5+8+1q41sNErJVNbkfnQ3VtB4z-HZUV8S0=zw@mail.gmail.com>
 <dfec96a1-84c3-3639-6f09-204c2d12244a@redhat.com>
 <CAJaqyWdhBq=0f-Qhbdg3AduS8zkPV5p6-uEEn24p1hRKcA3pOQ@mail.gmail.com>
 <05e9946d-f2be-f594-fea2-d1d03686b644@redhat.com>
 <20230508211002.GC926999@fedora>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230508211002.GC926999@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 08.05.23 23:10, Stefan Hajnoczi wrote:
> On Fri, May 05, 2023 at 02:51:55PM +0200, Hanna Czenczek wrote:
>> On 05.05.23 11:53, Eugenio Perez Martin wrote:
>>> On Fri, May 5, 2023 at 11:03 AM Hanna Czenczek <hreitz@redhat.com> wrote:
>>>> On 04.05.23 23:14, Stefan Hajnoczi wrote:
>>>>> On Thu, 4 May 2023 at 13:39, Hanna Czenczek <hreitz@redhat.com> wrote:
>> [...]
>>
>>>>> All state is lost and the Device Initialization process
>>>>> must be followed to make the device operational again.
>>>>>
>>>>> Existing vhost-user backends don't implement SET_STATUS 0 (it's new).
>>>>>
>>>>> It's messy and not your fault. I think QEMU should solve this by
>>>>> treating stateful devices differently from non-stateful devices. That
>>>>> way existing vhost-user backends continue to work and new stateful
>>>>> devices can also be supported.
>>>> It’s my understanding that SET_STATUS 0/RESET_DEVICE is problematic for
>>>> stateful devices.  In a previous email, you wrote that these should
>>>> implement SUSPEND+RESUME so qemu can use those instead.  But those are
>>>> separate things, so I assume we just use SET_STATUS 0 when stopping the
>>>> VM because this happens to also stop processing vrings as a side effect?
>>>>
>>>> I.e. I understand “treating stateful devices differently” to mean that
>>>> qemu should use SUSPEND+RESUME instead of SET_STATUS 0 when the back-end
>>>> supports it, and stateful back-ends should support it.
>>>>
>>> Honestly I cannot think of any use case where the vhost-user backend
>>> did not ignore set_status(0) and had to retrieve vq states. So maybe
>>> we can totally remove that call from qemu?
>> I don’t know so I can’t really say; but I don’t quite understand why qemu
>> would reset a device at any point but perhaps VM reset (and even then I’d
>> expect the post-reset guest to just reset the device on boot by itself,
>> too).
> DPDK stores the Device Status field value and uses it later:
> https://github.com/DPDK/dpdk/blob/main/lib/vhost/vhost_user.c#L2791
>
> While DPDK performs no immediate action upon SET_STATUS 0, omitting the
> message will change the behavior of other DPDK code like
> virtio_is_ready().
>
> Changing the semantics of the vhost-user protocol in a way that's not
> backwards compatible is something we should avoid unless there is no
> other way.

Well, I have two opinions on this:

First, that in DPDK sounds wrong.  vhost_dev_stop() is called mostly by 
devices that call it when set_status is called on them.  But they don’t 
call it if status == 0, they call it if virtio_device_should_start() 
returns false, which is the case when the VM is stopped.  So basically 
we set a status value on the back-end device that is not the status 
value that is set in qemu. If DPDK makes actual use of this status value 
that differs from that of the front-end in qemu, that sounds like it 
probably actually wrong.

Second, it’s entirely possible and probably probable that DPDK doesn’t 
make “actual use of this status value”; the only use it probably has is 
to determine whether the device is supposed to be stopped, which is 
exactly what qemu has tried to confer by setting it to 0.  So it’s 
basically two implementations that have agreed on abusing a value to 
emulate behavior that isn’t otherwise implement (SUSPEND), and that 
works because all devices are stateless.  Then, I agree, we can’t change 
this until it gets SUSPEND support.

> The fundamental problem is that QEMU's vhost code is designed to reset
> vhost devices because it assumes they are stateless. If an F_SUSPEND
> protocol feature bit is added, then it becomes possible to detect new
> backends and suspend/resume them rather than reset them.
>
> That's the solution that I favor because it's backwards compatible and
> the same model can be applied to stateful vDPA devices in the future.

So basically the idea is the following: vhost_dev_stop() should just 
suspend the device, not reset it.  For devices that don’t support 
SUSPEND, we still need to do something, and just calling GET_VRING_BASE 
on all vrings is deemed inadequate, so they are reset (SET_STATUS 0) as 
a work-around, assuming that stateful devices that care (i.e. implement 
SET_STATUS) will also implement SUSPEND to not have this “legacy reset” 
happen to them.

Sounds good to me.  (If I understood that right. :))

Hanna


