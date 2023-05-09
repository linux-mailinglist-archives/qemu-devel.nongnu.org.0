Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43EE6FC238
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:00:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJBm-0002ud-CE; Tue, 09 May 2023 04:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwJBj-0002tk-Qo
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:59:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwJBh-0003lA-Jm
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683622752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qTr+uRwA5FR0fz0GA58ZistfrvgNJttTGyc4ZEwdsjo=;
 b=fwm1O0XLN5URqBDXjc6E7kdX3/Fvzyi8WUS9el/vbMeHwy3+L0EPOOKKkOVo8Ke7GUK7Yq
 l76JIBC+QE4V6SK7M4oD7ZgkmDwlDpDz2AljvB1dMHpGlBN8EsBuACZyUobzC9UwQqajnd
 3LdM+exYbBpxsqKnX5aI7kJh6Cn1twY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-WXK_rzVzNpO34tVHorzDYw-1; Tue, 09 May 2023 04:59:11 -0400
X-MC-Unique: WXK_rzVzNpO34tVHorzDYw-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50bd1f08901so5339615a12.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 01:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683622750; x=1686214750;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qTr+uRwA5FR0fz0GA58ZistfrvgNJttTGyc4ZEwdsjo=;
 b=dBwBB1Q5Ddi+Tfpuofnf4hOQJa0g1KAUWeZTApYcMa3y7Sne3dhKzA66JhAiWVZotK
 wRogxjtnSGbcH0nqbMydTNXcl8GjMfnjJJi/JN7wgPfh6qYKFZunddva3zSNaK1H46NH
 Ckv15m1/bSZbKQayH9TUWM+Z0EBEm/wKDIwfzMjkbHeOah0Xhvhc82JtwjTK6wmO0e2N
 Un3GL4JNecjTteyaqGgyiM5aw6F3l3IoHtLHngrWWPEixsUYWs2XNgIr0lt42kdH+/TF
 8wq/2p2h/PgIknRnfrF07jtYqoaen+oZKYZXlQnviQGkTZmUSI7d7ayYbK7i+/arWEeb
 vl6A==
X-Gm-Message-State: AC+VfDyWq47UrrFE0cgeRW1NMwV3xdQUI/wBZMSHoGh6eRz370A3asiP
 //8sVudTeqeP3HlI+5x/P2uDOyZ6EC7IiDNbxNZUl3m+aZwMbYDhTYig0elBg3do/fnMMm/pEUN
 56X4Y8Jn2x0bJFuzbYU6dcho=
X-Received: by 2002:a05:6402:482:b0:50c:52d:7197 with SMTP id
 k2-20020a056402048200b0050c052d7197mr9881630edv.2.1683622749784; 
 Tue, 09 May 2023 01:59:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ikx7pOfTeqOWWcuXyXSRqbzZEh2Ce9CEVZVkV6SiK+PVDnR6UkJ/BmM9GiDYSjLiZPbvvZA==
X-Received: by 2002:a05:6402:482:b0:50c:52d:7197 with SMTP id
 k2-20020a056402048200b0050c052d7197mr9881613edv.2.1683622749458; 
 Tue, 09 May 2023 01:59:09 -0700 (PDT)
Received: from ?IPV6:2003:cf:d738:7fbf:bf54:7947:8c4:60ed?
 (p200300cfd7387fbfbf54794708c460ed.dip0.t-ipconnect.de.
 [2003:cf:d738:7fbf:bf54:7947:8c4:60ed])
 by smtp.gmail.com with ESMTPSA id
 h21-20020aa7c615000000b0050bcaedc299sm516609edq.33.2023.05.09.01.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 01:59:08 -0700 (PDT)
Message-ID: <7a959ff0-8b7c-2a9e-8023-8e541bf427d8@redhat.com>
Date: Tue, 9 May 2023 10:59:07 +0200
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
 <f04ed41d-39b6-a4e8-dfa5-c3e4936302ca@redhat.com>
 <d25a7982-cfca-6c6b-5dff-1a197fa0d262@redhat.com>
 <CAJaqyWcf-U4tB3FxPWBKHh02ZNk7nEfLiZ=cnns8AdHSasv6CA@mail.gmail.com>
 <CAJaqyWc19cpOx7pFqC3e4fy=NNWVtDKNziLJfTo3p9sT-SvLRw@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJaqyWc19cpOx7pFqC3e4fy=NNWVtDKNziLJfTo3p9sT-SvLRw@mail.gmail.com>
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

On 08.05.23 21:31, Eugenio Perez Martin wrote:
> On Mon, May 8, 2023 at 7:51 PM Eugenio Perez Martin <eperezma@redhat.com> wrote:
>> On Mon, May 8, 2023 at 7:00 PM Hanna Czenczek <hreitz@redhat.com> wrote:
>>> On 05.05.23 16:37, Hanna Czenczek wrote:
>>>> On 05.05.23 16:26, Eugenio Perez Martin wrote:
>>>>> On Fri, May 5, 2023 at 11:51 AM Hanna Czenczek <hreitz@redhat.com>
>>>>> wrote:
>>>>>> (By the way, thanks for the explanations :))
>>>>>>
>>>>>> On 05.05.23 11:03, Hanna Czenczek wrote:
>>>>>>> On 04.05.23 23:14, Stefan Hajnoczi wrote:
>>>>>> [...]
>>>>>>
>>>>>>>> I think it's better to change QEMU's vhost code
>>>>>>>> to leave stateful devices suspended (but not reset) across
>>>>>>>> vhost_dev_stop() -> vhost_dev_start(), maybe by introducing
>>>>>>>> vhost_dev_suspend() and vhost_dev_resume(). Have you thought about
>>>>>>>> this aspect?
>>>>>>> Yes and no; I mean, I haven’t in detail, but I thought this is what’s
>>>>>>> meant by suspending instead of resetting when the VM is stopped.
>>>>>> So, now looking at vhost_dev_stop(), one problem I can see is that
>>>>>> depending on the back-end, different operations it does will do
>>>>>> different things.
>>>>>>
>>>>>> It tries to stop the whole device via vhost_ops->vhost_dev_start(),
>>>>>> which for vDPA will suspend the device, but for vhost-user will
>>>>>> reset it
>>>>>> (if F_STATUS is there).
>>>>>>
>>>>>> It disables all vrings, which doesn’t mean stopping, but may be
>>>>>> necessary, too.  (I haven’t yet really understood the use of disabled
>>>>>> vrings, I heard that virtio-net would have a need for it.)
>>>>>>
>>>>>> It then also stops all vrings, though, so that’s OK.  And because this
>>>>>> will always do GET_VRING_BASE, this is actually always the same
>>>>>> regardless of transport.
>>>>>>
>>>>>> Finally (for this purpose), it resets the device status via
>>>>>> vhost_ops->vhost_reset_status().  This is only implemented on vDPA, and
>>>>>> this is what resets the device there.
>>>>>>
>>>>>>
>>>>>> So vhost-user resets the device in .vhost_dev_start, but vDPA only does
>>>>>> so in .vhost_reset_status.  It would seem better to me if vhost-user
>>>>>> would also reset the device only in .vhost_reset_status, not in
>>>>>> .vhost_dev_start.  .vhost_dev_start seems precisely like the place to
>>>>>> run SUSPEND/RESUME.
>>>>>>
>>>>> I think the same. I just saw It's been proposed at [1].
>>>>>
>>>>>> Another question I have (but this is basically what I wrote in my last
>>>>>> email) is why we even call .vhost_reset_status here.  If the device
>>>>>> and/or all of the vrings are already stopped, why do we need to reset
>>>>>> it?  Naïvely, I had assumed we only really need to reset the device if
>>>>>> the guest changes, so that a new guest driver sees a freshly
>>>>>> initialized
>>>>>> device.
>>>>>>
>>>>> I don't know why we didn't need to call it :). I'm assuming the
>>>>> previous vhost-user net did fine resetting vq indexes, using
>>>>> VHOST_USER_SET_VRING_BASE. But I don't know about more complex
>>>>> devices.
>>>>>
>>>>> The guest can reset the device, or write 0 to the PCI config status,
>>>>> at any time. How does virtiofs handle it, being stateful?
>>>> Honestly a good question because virtiofsd implements neither
>>>> SET_STATUS nor RESET_DEVICE.  I’ll have to investigate that.
>>>>
>>>> I think when the guest resets the device, SET_VRING_BASE always comes
>>>> along some way or another, so that’s how the vrings are reset.  Maybe
>>>> the internal state is reset only following more high-level FUSE
>>>> commands like INIT.
>>> So a meeting and one session of looking-into-the-code later:
>>>
>>> We reset every virt queue on GET_VRING_BASE, which is wrong, but happens
>>> to serve the purpose.  (German is currently on that.)
>>>
>>> In our meeting, German said the reset would occur when the memory
>>> regions are changed, but I can’t see that in the code.
>> That would imply that the status is reset when the guest's memory is
>> added or removed?

No, but that whenever the memory in which there is a vring is changed, 
or whenever a vring’s address is changed, that vring is reset.

>>> I think it only
>>> happens implicitly through the SET_VRING_BASE call, which resets the
>>> internal avail/used pointers.
>>>
>>> [This doesn’t seem different from libvhost-user, though, which
>>> implements neither SET_STATUS nor RESET_DEVICE, and which pretends to
>>> reset the device on RESET_OWNER, but really doesn’t (its
>>> vu_reset_device_exec() function just disables all vrings, doesn’t reset
>>> or even stop them).]
>>>
>>> Consequently, the internal state is never reset.  It would be cleared on
>>> a FUSE Destroy message, but if you just force-reset the system, the
>>> state remains into the next reboot.  Not even FUSE Init clears it, which
>>> seems weird.  It happens to work because it’s still the same filesystem,
>>> so the existing state fits, but it kind of seems dangerous to keep e.g.
>>> files open.  I don’t think it’s really exploitable because everything
>>> still goes through the guest kernel, but, well.  We should clear the
>>> state on Init, and probably also implement SET_STATUS and clear the
>>> state there.
>>>
>> I see. That's in the line of assuming GET_VRING_BASE is the last
>> message received from qemu.
>>
> Actually, does it prevent device recovery after a failure in
> migration? Is the same state set for the device?

In theory no, because GET_VRING_BASE will return the current index, so 
it’ll be restored by SET_VRING_BASE even if the vring is reset in between.

In practice yes, because the current implementation has GET_VRING_BASE 
reset the vring before fetching the index, so the returned index is 
always 0, and it can’t be restored.  But this also prevents device 
recovery in successful migration.  German has sent a pull request for 
that: https://github.com/rust-vmm/vhost/pull/154

Hanna


