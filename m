Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDEF6FB59C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 19:02:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw4EQ-0001KI-Cy; Mon, 08 May 2023 13:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pw4EL-0001K5-I3
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pw4EI-0005xd-G9
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683565253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKaLYqNShPYncZEdEzt9+Dehl0y/l/zI3Yehb2Tgj5I=;
 b=DE83ADW2luN+RF5Cenn3yZvSq6EHhq5jNAbaEG0nscyb/9au7iMcb8DnvO3fhNjB/6QFZa
 XEdi5tzTyguEG+mShUZCq/kt24fZQ7+MMkpm+7ZtswVChL33LU0acIAEEdYSxmeLvxpN57
 1H0RjTbV2iAkAR1g/aycB/otNY49cJA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-509oVDgAMYudlmN6rIGUiw-1; Mon, 08 May 2023 13:00:49 -0400
X-MC-Unique: 509oVDgAMYudlmN6rIGUiw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50bc6c6b9dbso765009a12.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 10:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683565248; x=1686157248;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sKaLYqNShPYncZEdEzt9+Dehl0y/l/zI3Yehb2Tgj5I=;
 b=BRPlpaGT7AZGBz5FPGnbQBKV0qMblRTqpGFQ2g/j0L4FHc0DmLpYpZOcJ/HgUJqHJ0
 ehs2IirIRDXCZjXxxoG2OEtHWxJX0PX2Fq0BG5Ap4SR3bi8jmn1QE2QughStyXLmRhs6
 y4dnh0XeiNSNce5KlkrQLptMiXOlPC5O8yHGuNreRjHKuDMQnwYtnqIEsKt3JWNymav2
 ClRJWX0sw6nleKFokE7vqjTOuSLDYcCEfXyUKMuDd53sFycalD4rqTgbVBLfQfDUm1Zx
 ZZ7fAE7l4xsPPFIxoqzcf0GTKfwbz+KuGNTWjxt1hh6vGug7r0jwUa0s/UUDbVUjmo6i
 ghHw==
X-Gm-Message-State: AC+VfDxNT7B7P2rJmLjgv5mDHBAHRns2wIDz7cg2F/27Hayys55xGa/t
 DLt8OWBl9BQbPHVjSfO2fmwhq7ShT3mvFcGyc0oi9p9gL0vB/W/FAtArD7NYjcosEn8PmhmjRoL
 F9XDErZzOMmJts2g=
X-Received: by 2002:a17:907:7208:b0:966:550f:9bfe with SMTP id
 dr8-20020a170907720800b00966550f9bfemr3880766ejc.33.1683565248371; 
 Mon, 08 May 2023 10:00:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6RVwOS6UN65OIs8XdWomqvhlDMtNfMSFBiMFHj3WxG46UdpziHJA89yGeEvTozXOFqa6HKeg==
X-Received: by 2002:a17:907:7208:b0:966:550f:9bfe with SMTP id
 dr8-20020a170907720800b00966550f9bfemr3880741ejc.33.1683565248051; 
 Mon, 08 May 2023 10:00:48 -0700 (PDT)
Received: from ?IPV6:2003:cf:d738:7fbf:bf54:7947:8c4:60ed?
 (p200300cfd7387fbfbf54794708c460ed.dip0.t-ipconnect.de.
 [2003:cf:d738:7fbf:bf54:7947:8c4:60ed])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b009693ea7db1esm212777ejc.11.2023.05.08.10.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 10:00:47 -0700 (PDT)
Message-ID: <d25a7982-cfca-6c6b-5dff-1a197fa0d262@redhat.com>
Date: Mon, 8 May 2023 19:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/4] vhost-user-fs: Internal migration
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
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
 <f04ed41d-39b6-a4e8-dfa5-c3e4936302ca@redhat.com>
In-Reply-To: <f04ed41d-39b6-a4e8-dfa5-c3e4936302ca@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 05.05.23 16:37, Hanna Czenczek wrote:
> On 05.05.23 16:26, Eugenio Perez Martin wrote:
>> On Fri, May 5, 2023 at 11:51 AM Hanna Czenczek <hreitz@redhat.com> 
>> wrote:
>>> (By the way, thanks for the explanations :))
>>>
>>> On 05.05.23 11:03, Hanna Czenczek wrote:
>>>> On 04.05.23 23:14, Stefan Hajnoczi wrote:
>>> [...]
>>>
>>>>> I think it's better to change QEMU's vhost code
>>>>> to leave stateful devices suspended (but not reset) across
>>>>> vhost_dev_stop() -> vhost_dev_start(), maybe by introducing
>>>>> vhost_dev_suspend() and vhost_dev_resume(). Have you thought about
>>>>> this aspect?
>>>> Yes and no; I mean, I haven’t in detail, but I thought this is what’s
>>>> meant by suspending instead of resetting when the VM is stopped.
>>> So, now looking at vhost_dev_stop(), one problem I can see is that
>>> depending on the back-end, different operations it does will do
>>> different things.
>>>
>>> It tries to stop the whole device via vhost_ops->vhost_dev_start(),
>>> which for vDPA will suspend the device, but for vhost-user will 
>>> reset it
>>> (if F_STATUS is there).
>>>
>>> It disables all vrings, which doesn’t mean stopping, but may be
>>> necessary, too.  (I haven’t yet really understood the use of disabled
>>> vrings, I heard that virtio-net would have a need for it.)
>>>
>>> It then also stops all vrings, though, so that’s OK.  And because this
>>> will always do GET_VRING_BASE, this is actually always the same
>>> regardless of transport.
>>>
>>> Finally (for this purpose), it resets the device status via
>>> vhost_ops->vhost_reset_status().  This is only implemented on vDPA, and
>>> this is what resets the device there.
>>>
>>>
>>> So vhost-user resets the device in .vhost_dev_start, but vDPA only does
>>> so in .vhost_reset_status.  It would seem better to me if vhost-user
>>> would also reset the device only in .vhost_reset_status, not in
>>> .vhost_dev_start.  .vhost_dev_start seems precisely like the place to
>>> run SUSPEND/RESUME.
>>>
>> I think the same. I just saw It's been proposed at [1].
>>
>>> Another question I have (but this is basically what I wrote in my last
>>> email) is why we even call .vhost_reset_status here.  If the device
>>> and/or all of the vrings are already stopped, why do we need to reset
>>> it?  Naïvely, I had assumed we only really need to reset the device if
>>> the guest changes, so that a new guest driver sees a freshly 
>>> initialized
>>> device.
>>>
>> I don't know why we didn't need to call it :). I'm assuming the
>> previous vhost-user net did fine resetting vq indexes, using
>> VHOST_USER_SET_VRING_BASE. But I don't know about more complex
>> devices.
>>
>> The guest can reset the device, or write 0 to the PCI config status,
>> at any time. How does virtiofs handle it, being stateful?
>
> Honestly a good question because virtiofsd implements neither 
> SET_STATUS nor RESET_DEVICE.  I’ll have to investigate that.
>
> I think when the guest resets the device, SET_VRING_BASE always comes 
> along some way or another, so that’s how the vrings are reset.  Maybe 
> the internal state is reset only following more high-level FUSE 
> commands like INIT.

So a meeting and one session of looking-into-the-code later:

We reset every virt queue on GET_VRING_BASE, which is wrong, but happens 
to serve the purpose.  (German is currently on that.)

In our meeting, German said the reset would occur when the memory 
regions are changed, but I can’t see that in the code.  I think it only 
happens implicitly through the SET_VRING_BASE call, which resets the 
internal avail/used pointers.

[This doesn’t seem different from libvhost-user, though, which 
implements neither SET_STATUS nor RESET_DEVICE, and which pretends to 
reset the device on RESET_OWNER, but really doesn’t (its 
vu_reset_device_exec() function just disables all vrings, doesn’t reset 
or even stop them).]

Consequently, the internal state is never reset.  It would be cleared on 
a FUSE Destroy message, but if you just force-reset the system, the 
state remains into the next reboot.  Not even FUSE Init clears it, which 
seems weird.  It happens to work because it’s still the same filesystem, 
so the existing state fits, but it kind of seems dangerous to keep e.g. 
files open.  I don’t think it’s really exploitable because everything 
still goes through the guest kernel, but, well.  We should clear the 
state on Init, and probably also implement SET_STATUS and clear the 
state there.

Hanna


