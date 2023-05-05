Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4406F84EE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 16:39:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puwZU-0003Bv-Of; Fri, 05 May 2023 10:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1puwZM-0003Am-HK
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:38:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1puwZK-0007Q5-J4
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683297477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wly7bBshxAvtC5Be+xhqmjmbL+lqyrzBtNlFYh8873c=;
 b=Nq05cfN56zi1aGgkrzoCNQaEaKf8j6Z/rRGXQHBEnDeiHnmS/m5EPCJ3qdZjLkY+z/K/ht
 3bqj52Nc/LcReZlxIsOTZ4JxsoKmsY/Q5b1Zctp4oBzFiIAk1fS3zKP5MF0FqNuSakwyS2
 0TGh1trM9PRxNCMSUHYnnh8JxMxqV50=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-2Oob4rR-OfmLBVKPT2ypbQ-1; Fri, 05 May 2023 10:37:55 -0400
X-MC-Unique: 2Oob4rR-OfmLBVKPT2ypbQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a341ee4fcso220559266b.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 07:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683297474; x=1685889474;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wly7bBshxAvtC5Be+xhqmjmbL+lqyrzBtNlFYh8873c=;
 b=iEWYIiEeQmHypMnyMFcLmAeaPWP49lgWerCIWNQqiLz8jqUmj7bQ+JoknkxGHoBnNL
 xnCGH4eBJ0zkvE73nUaS/+8MPtky9kDKr5r5C9ohyfhr78bnipLEDGY2x89FaiFvL5cs
 iFSv8AWV5W0iXWjrSU016XT20kScIOv8n5uNwht3Z3xWLkBpD3cm1O17zbBN8NvvywVX
 aeiGe8+nG04PvhH/AAIQuUsJVuLTbNT8bzcougT4mEMGT2cxkyo45/qJWwvbSSby3hxw
 26MHGWP8VRgSMBP2BVeWB7TWIOk8OUQZNsxWNNeKFQ2dJk1N4HRUfBd/8bmw6SBJMML4
 xasw==
X-Gm-Message-State: AC+VfDw+pBr14ra/kExy9X2mOuzUT4+Lc42IH9yAWl+RelWq5EW1UHjN
 Qau+RO24GGdViLMXKlaV14poR1/aGbJAp6viD4SxHYlQzEHG9ZX4kT1ZiWjYBk2/7cAsj5xcDsm
 erarnVdsoYdl32LA=
X-Received: by 2002:a17:906:fe0c:b0:961:78c2:1d27 with SMTP id
 wy12-20020a170906fe0c00b0096178c21d27mr1303109ejb.19.1683297474650; 
 Fri, 05 May 2023 07:37:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7+BUbNUKJAftcbX5r7Xgje9m2qFYX5uB2GgPLbHa0MlAGJ+RAAZnYxkf7EXC8WI8BeP4Vq9g==
X-Received: by 2002:a17:906:fe0c:b0:961:78c2:1d27 with SMTP id
 wy12-20020a170906fe0c00b0096178c21d27mr1303086ejb.19.1683297474359; 
 Fri, 05 May 2023 07:37:54 -0700 (PDT)
Received: from ?IPV6:2003:cf:d738:349d:9681:f818:3410:5693?
 (p200300cfd738349d9681f81834105693.dip0.t-ipconnect.de.
 [2003:cf:d738:349d:9681:f818:3410:5693])
 by smtp.gmail.com with ESMTPSA id
 w19-20020aa7da53000000b0050b2f588db6sm3031185eds.16.2023.05.05.07.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 07:37:53 -0700 (PDT)
Message-ID: <f04ed41d-39b6-a4e8-dfa5-c3e4936302ca@redhat.com>
Date: Fri, 5 May 2023 16:37:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/4] vhost-user-fs: Internal migration
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <e8cc4521-50a1-2e38-1fb3-8cfa7b0c967e@redhat.com>
 <CAJSP0QUFFYWwD5+8+1q41sNErJVNbkfnQ3VtB4z-HZUV8S0=zw@mail.gmail.com>
 <dfec96a1-84c3-3639-6f09-204c2d12244a@redhat.com>
 <71e47e3e-880d-38d8-c1b0-3287c60365e4@redhat.com>
 <CAJaqyWe13QxuC9BNBULJ1xu1saWE9Y3ET8eEef-7qtyL5R73SQ@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJaqyWe13QxuC9BNBULJ1xu1saWE9Y3ET8eEef-7qtyL5R73SQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 05.05.23 16:26, Eugenio Perez Martin wrote:
> On Fri, May 5, 2023 at 11:51 AM Hanna Czenczek <hreitz@redhat.com> wrote:
>> (By the way, thanks for the explanations :))
>>
>> On 05.05.23 11:03, Hanna Czenczek wrote:
>>> On 04.05.23 23:14, Stefan Hajnoczi wrote:
>> [...]
>>
>>>> I think it's better to change QEMU's vhost code
>>>> to leave stateful devices suspended (but not reset) across
>>>> vhost_dev_stop() -> vhost_dev_start(), maybe by introducing
>>>> vhost_dev_suspend() and vhost_dev_resume(). Have you thought about
>>>> this aspect?
>>> Yes and no; I mean, I haven’t in detail, but I thought this is what’s
>>> meant by suspending instead of resetting when the VM is stopped.
>> So, now looking at vhost_dev_stop(), one problem I can see is that
>> depending on the back-end, different operations it does will do
>> different things.
>>
>> It tries to stop the whole device via vhost_ops->vhost_dev_start(),
>> which for vDPA will suspend the device, but for vhost-user will reset it
>> (if F_STATUS is there).
>>
>> It disables all vrings, which doesn’t mean stopping, but may be
>> necessary, too.  (I haven’t yet really understood the use of disabled
>> vrings, I heard that virtio-net would have a need for it.)
>>
>> It then also stops all vrings, though, so that’s OK.  And because this
>> will always do GET_VRING_BASE, this is actually always the same
>> regardless of transport.
>>
>> Finally (for this purpose), it resets the device status via
>> vhost_ops->vhost_reset_status().  This is only implemented on vDPA, and
>> this is what resets the device there.
>>
>>
>> So vhost-user resets the device in .vhost_dev_start, but vDPA only does
>> so in .vhost_reset_status.  It would seem better to me if vhost-user
>> would also reset the device only in .vhost_reset_status, not in
>> .vhost_dev_start.  .vhost_dev_start seems precisely like the place to
>> run SUSPEND/RESUME.
>>
> I think the same. I just saw It's been proposed at [1].
>
>> Another question I have (but this is basically what I wrote in my last
>> email) is why we even call .vhost_reset_status here.  If the device
>> and/or all of the vrings are already stopped, why do we need to reset
>> it?  Naïvely, I had assumed we only really need to reset the device if
>> the guest changes, so that a new guest driver sees a freshly initialized
>> device.
>>
> I don't know why we didn't need to call it :). I'm assuming the
> previous vhost-user net did fine resetting vq indexes, using
> VHOST_USER_SET_VRING_BASE. But I don't know about more complex
> devices.
>
> The guest can reset the device, or write 0 to the PCI config status,
> at any time. How does virtiofs handle it, being stateful?

Honestly a good question because virtiofsd implements neither SET_STATUS 
nor RESET_DEVICE.  I’ll have to investigate that.

I think when the guest resets the device, SET_VRING_BASE always comes 
along some way or another, so that’s how the vrings are reset.  Maybe 
the internal state is reset only following more high-level FUSE commands 
like INIT.

Hanna


