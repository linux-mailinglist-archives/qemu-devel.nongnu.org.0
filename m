Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37506E7852
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 13:16:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp5nD-0003Ry-Gh; Wed, 19 Apr 2023 07:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pp5nA-0003NA-8V
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pp5n7-0001lo-Kt
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681902959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w/tU8n580GK+890wxXmWrVxhSROVyHuwDpZVkIoQz9k=;
 b=hLyrtFpg5V3UpM7XXIfLv3TrkzQsKkdrrmRqISAObFTdf46mRk7UhtqXl9IRzrXtUHy6Hx
 6pFYbmKENe8cvVemKSp8Bpp/zSxomNO32cr5OwXNJ+5USSzAiVKIJep/+v2lxu/tz8lPIZ
 5KnlMPSnY+R536/Dtto47ss0YG49cjw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-aHER7bfXNQOOBG3rpJ9lgA-1; Wed, 19 Apr 2023 07:15:58 -0400
X-MC-Unique: aHER7bfXNQOOBG3rpJ9lgA-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-506e62603f6so417886a12.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 04:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681902957; x=1684494957;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w/tU8n580GK+890wxXmWrVxhSROVyHuwDpZVkIoQz9k=;
 b=FbtLOp+yqpG8leWWLfNUl3/B8qLOmJ+0KyJsy3rFxo/NXgK1L6VR6APzm/Gp26sMqm
 JtoeqbHoGpR4nLINPHoG5hpYmna63tc5iEZ460ARGLlY6jaWhvPqg9vsiwFFaIAp0vbQ
 CerSElYjCQqS4fegUjWnmTPecxOC9CdionH1GYwdT4s1rAJ6qmdemm1jmSUx5g6hU3NV
 5Cx5lWPpJlyLyz98OR3YerhnIUQuo/ReHt6qfsrxxMSH5LE+pu5ZWBf6FJwUT9dX54wS
 vOQQdxuaH8ejrES0Ocejutzh2x2VKPdWuzsb6Kl0yqGo+aK0mFlmRODtDpjiBy0WcFoT
 YbpA==
X-Gm-Message-State: AAQBX9eoX/nakfs43SoOk5XUyxzJWpdHCnjjlsr3EUbJWZD3ExU9+4Mt
 TbveXxW9Wi+Hi+R9mlKevOuIEenPvQt4vp6v149jDkUsPefYQfGeUISzvNHRtlJ7m6HWaNDn7XS
 F7gvYjxgfvM+ITgc=
X-Received: by 2002:a05:6402:1109:b0:504:7f72:3db3 with SMTP id
 u9-20020a056402110900b005047f723db3mr4984291edv.9.1681902957180; 
 Wed, 19 Apr 2023 04:15:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350YosaFBcN7cw/k0dAp5g7dpQaUbmH1bmIfy8rVwYYuGdB0a+bxW5745h2+1SMuSUc9Eqsb+uw==
X-Received: by 2002:a05:6402:1109:b0:504:7f72:3db3 with SMTP id
 u9-20020a056402110900b005047f723db3mr4984268edv.9.1681902956802; 
 Wed, 19 Apr 2023 04:15:56 -0700 (PDT)
Received: from ?IPV6:2003:cf:d71b:cc43:1955:48c6:4ddb:556c?
 (p200300cfd71bcc43195548c64ddb556c.dip0.t-ipconnect.de.
 [2003:cf:d71b:cc43:1955:48c6:4ddb:556c])
 by smtp.gmail.com with ESMTPSA id
 wj7-20020a170907050700b0094f3d700868sm5454834ejb.80.2023.04.19.04.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 04:15:56 -0700 (PDT)
Message-ID: <844a1b66-30ce-a13d-cfcf-f9455ee81931@redhat.com>
Date: Wed, 19 Apr 2023 13:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Virtio-fs] [PATCH 2/4] vhost-user: Interface for migration state
 transfer
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Eugenio Perez Martin <eperezma@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Anton Kuchin <antonkuchin@yandex-team.ru>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com> <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
 <20230417153810.GE3852722@fedora>
 <CAJaqyWePM_a7AafP9qS40hmYXKHDyMsvn5g24zk=cH8L6s-kUw@mail.gmail.com>
 <CAJSP0QWUfxzad3EmT3r1hhaWmXDQt9Nj1LRPhPs_w79S9GAb1A@mail.gmail.com>
 <CAJaqyWfaDVZDJtMvPUhdRE283e80rB3WFd3RF9i=buaBYG=PKA@mail.gmail.com>
 <20230418175924.GB4041499@fedora>
 <fcb06652-1c27-6882-4818-2c54cbe76686@redhat.com>
 <CAJSP0QURNr0-U-ikUyLhOR2Nfmeoq-XfM1rHwPYO01_b=pBoSg@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJSP0QURNr0-U-ikUyLhOR2Nfmeoq-XfM1rHwPYO01_b=pBoSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.597, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 19.04.23 13:10, Stefan Hajnoczi wrote:
> On Wed, 19 Apr 2023 at 06:57, Hanna Czenczek <hreitz@redhat.com> wrote:
>> On 18.04.23 19:59, Stefan Hajnoczi wrote:
>>> On Tue, Apr 18, 2023 at 10:09:30AM +0200, Eugenio Perez Martin wrote:
>>>> On Mon, Apr 17, 2023 at 9:33 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>>>> On Mon, 17 Apr 2023 at 15:10, Eugenio Perez Martin <eperezma@redhat.com> wrote:
>>>>>> On Mon, Apr 17, 2023 at 5:38 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>>>>>> On Thu, Apr 13, 2023 at 12:14:24PM +0200, Eugenio Perez Martin wrote:
>>>>>>>> On Wed, Apr 12, 2023 at 11:06 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>>>>>>>> On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
>>>>>>>>>> So-called "internal" virtio-fs migration refers to transporting the
>>>>>>>>>> back-end's (virtiofsd's) state through qemu's migration stream.  To do
>>>>>>>>>> this, we need to be able to transfer virtiofsd's internal state to and
>>>>>>>>>> from virtiofsd.
>>>>>>>>>>
>>>>>>>>>> Because virtiofsd's internal state will not be too large, we believe it
>>>>>>>>>> is best to transfer it as a single binary blob after the streaming
>>>>>>>>>> phase.  Because this method should be useful to other vhost-user
>>>>>>>>>> implementations, too, it is introduced as a general-purpose addition to
>>>>>>>>>> the protocol, not limited to vhost-user-fs.
>>>>>>>>>>
>>>>>>>>>> These are the additions to the protocol:
>>>>>>>>>> - New vhost-user protocol feature VHOST_USER_PROTOCOL_F_MIGRATORY_STATE:
>>>>>>>>>>     This feature signals support for transferring state, and is added so
>>>>>>>>>>     that migration can fail early when the back-end has no support.
>>>>>>>>>>
>>>>>>>>>> - SET_DEVICE_STATE_FD function: Front-end and back-end negotiate a pipe
>>>>>>>>>>     over which to transfer the state.  The front-end sends an FD to the
>>>>>>>>>>     back-end into/from which it can write/read its state, and the back-end
>>>>>>>>>>     can decide to either use it, or reply with a different FD for the
>>>>>>>>>>     front-end to override the front-end's choice.
>>>>>>>>>>     The front-end creates a simple pipe to transfer the state, but maybe
>>>>>>>>>>     the back-end already has an FD into/from which it has to write/read
>>>>>>>>>>     its state, in which case it will want to override the simple pipe.
>>>>>>>>>>     Conversely, maybe in the future we find a way to have the front-end
>>>>>>>>>>     get an immediate FD for the migration stream (in some cases), in which
>>>>>>>>>>     case we will want to send this to the back-end instead of creating a
>>>>>>>>>>     pipe.
>>>>>>>>>>     Hence the negotiation: If one side has a better idea than a plain
>>>>>>>>>>     pipe, we will want to use that.
>>>>>>>>>>
>>>>>>>>>> - CHECK_DEVICE_STATE: After the state has been transferred through the
>>>>>>>>>>     pipe (the end indicated by EOF), the front-end invokes this function
>>>>>>>>>>     to verify success.  There is no in-band way (through the pipe) to
>>>>>>>>>>     indicate failure, so we need to check explicitly.
>>>>>>>>>>
>>>>>>>>>> Once the transfer pipe has been established via SET_DEVICE_STATE_FD
>>>>>>>>>> (which includes establishing the direction of transfer and migration
>>>>>>>>>> phase), the sending side writes its data into the pipe, and the reading
>>>>>>>>>> side reads it until it sees an EOF.  Then, the front-end will check for
>>>>>>>>>> success via CHECK_DEVICE_STATE, which on the destination side includes
>>>>>>>>>> checking for integrity (i.e. errors during deserialization).
>>>>>>>>>>
>>>>>>>>>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>>>>>>>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
>>>>>>>>>> ---
>>>>>>>>>>    include/hw/virtio/vhost-backend.h |  24 +++++
>>>>>>>>>>    include/hw/virtio/vhost.h         |  79 ++++++++++++++++
>>>>>>>>>>    hw/virtio/vhost-user.c            | 147 ++++++++++++++++++++++++++++++
>>>>>>>>>>    hw/virtio/vhost.c                 |  37 ++++++++
>>>>>>>>>>    4 files changed, 287 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
>>>>>>>>>> index ec3fbae58d..5935b32fe3 100644
>>>>>>>>>> --- a/include/hw/virtio/vhost-backend.h
>>>>>>>>>> +++ b/include/hw/virtio/vhost-backend.h
>>>>>>>>>> @@ -26,6 +26,18 @@ typedef enum VhostSetConfigType {
>>>>>>>>>>        VHOST_SET_CONFIG_TYPE_MIGRATION = 1,
>>>>>>>>>>    } VhostSetConfigType;
>>>>>>>>>>
>>>>>>>>>> +typedef enum VhostDeviceStateDirection {
>>>>>>>>>> +    /* Transfer state from back-end (device) to front-end */
>>>>>>>>>> +    VHOST_TRANSFER_STATE_DIRECTION_SAVE = 0,
>>>>>>>>>> +    /* Transfer state from front-end to back-end (device) */
>>>>>>>>>> +    VHOST_TRANSFER_STATE_DIRECTION_LOAD = 1,
>>>>>>>>>> +} VhostDeviceStateDirection;
>>>>>>>>>> +
>>>>>>>>>> +typedef enum VhostDeviceStatePhase {
>>>>>>>>>> +    /* The device (and all its vrings) is stopped */
>>>>>>>>>> +    VHOST_TRANSFER_STATE_PHASE_STOPPED = 0,
>>>>>>>>>> +} VhostDeviceStatePhase;
>>>>>>>>> vDPA has:
>>>>>>>>>
>>>>>>>>>     /* Suspend a device so it does not process virtqueue requests anymore
>>>>>>>>>      *
>>>>>>>>>      * After the return of ioctl the device must preserve all the necessary state
>>>>>>>>>      * (the virtqueue vring base plus the possible device specific states) that is
>>>>>>>>>      * required for restoring in the future. The device must not change its
>>>>>>>>>      * configuration after that point.
>>>>>>>>>      */
>>>>>>>>>     #define VHOST_VDPA_SUSPEND      _IO(VHOST_VIRTIO, 0x7D)
>>>>>>>>>
>>>>>>>>>     /* Resume a device so it can resume processing virtqueue requests
>>>>>>>>>      *
>>>>>>>>>      * After the return of this ioctl the device will have restored all the
>>>>>>>>>      * necessary states and it is fully operational to continue processing the
>>>>>>>>>      * virtqueue descriptors.
>>>>>>>>>      */
>>>>>>>>>     #define VHOST_VDPA_RESUME       _IO(VHOST_VIRTIO, 0x7E)
>>>>>>>>>
>>>>>>>>> I wonder if it makes sense to import these into vhost-user so that the
>>>>>>>>> difference between kernel vhost and vhost-user is minimized. It's okay
>>>>>>>>> if one of them is ahead of the other, but it would be nice to avoid
>>>>>>>>> overlapping/duplicated functionality.
>>>>>>>>>
>>>>>>>> That's what I had in mind in the first versions. I proposed VHOST_STOP
>>>>>>>> instead of VHOST_VDPA_STOP for this very reason. Later it did change
>>>>>>>> to SUSPEND.
>>>>>>> I noticed QEMU only calls ioctl(VHOST_VDPA_SUSPEND) and not
>>>>>>> ioctl(VHOST_VDPA_RESUME).
>>>>>>>
>>>>>>> The doc comments in <linux/vdpa.h> don't explain how the device can
>>>>>>> leave the suspended state. Can you clarify this?
>>>>>>>
>>>>>> Do you mean in what situations or regarding the semantics of _RESUME?
>>>>>>
>>>>>> To me resume is an operation mainly to resume the device in the event
>>>>>> of a VM suspension, not a migration. It can be used as a fallback code
>>>>>> in some cases of migration failure though, but it is not currently
>>>>>> used in qemu.
>>>>> Is a "VM suspension" the QEMU HMP 'stop' command?
>>>>>
>>>>> I guess the reason why QEMU doesn't call RESUME anywhere is that it
>>>>> resets the device in vhost_dev_stop()?
>>>>>
>>>> The actual reason for not using RESUME is that the ioctl was added
>>>> after the SUSPEND design in qemu. Same as this proposal, it is was not
>>>> needed at the time.
>>>>
>>>> In the case of vhost-vdpa net, the only usage of suspend is to fetch
>>>> the vq indexes, and in case of error vhost already fetches them from
>>>> guest's used ring way before vDPA, so it has little usage.
>>>>
>>>>> Does it make sense to combine SUSPEND and RESUME with Hanna's
>>>>> SET_DEVICE_STATE_FD? For example, non-iterative migration works like
>>>>> this:
>>>>> - Saving the device's state is done by SUSPEND followed by
>>>>> SET_DEVICE_STATE_FD. If the guest needs to continue executing (e.g.
>>>>> savevm command or migration failed), then RESUME is called to
>>>>> continue.
>>>> I think the previous steps make sense at vhost_dev_stop, not virtio
>>>> savevm handlers. To start spreading this logic to more places of qemu
>>>> can bring confusion.
>>> I don't think there is a way around extending the QEMU vhost's code
>>> model. The current model in QEMU's vhost code is that the backend is
>>> reset when the VM stops. This model worked fine for stateless devices
>>> but it doesn't work for stateful devices.
>>>
>>> Imagine a vdpa-gpu device: you cannot reset the device in
>>> vhost_dev_stop() and expect the GPU to continue working when
>>> vhost_dev_start() is called again because all its state has been lost.
>>> The guest driver will send requests that references a virtio-gpu
>>> resources that no longer exist.
>>>
>>> One solution is to save the device's state in vhost_dev_stop(). I think
>>> this is what you're suggesting. It requires keeping a copy of the state
>>> and then loading the state again in vhost_dev_start(). I don't think
>>> this approach should be used because it requires all stateful devices to
>>> support live migration (otherwise they break across HMP 'stop'/'cont').
>>> Also, the device state for some devices may be large and it would also
>>> become more complicated when iterative migration is added.
>>>
>>> Instead, I think the QEMU vhost code needs to be structured so that
>>> struct vhost_dev has a suspended state:
>>>
>>>           ,---------.
>>>        v         |
>>>     started ------> stopped
>>>       \   ^
>>>        \  |
>>>         -> suspended
>>>
>>> The device doesn't lose state when it enters the suspended state. It can
>>> be resumed again.
>>>
>>> This is why I think SUSPEND/RESUME need to be part of the solution.
>>> (It's also an argument for not including the phase argument in
>>> SET_DEVICE_STATE_FD because the SUSPEND message is sent during
>>> vhost_dev_stop() separately from saving the device's state.)
>> So let me ask if I understand this protocol correctly: Basically,
>> SUSPEND would ask the device to fully serialize its internal state,
>> retain it in some buffer, and RESUME would then deserialize the state
>> from the buffer, right?
> That's not how I understand SUSPEND/RESUME. I was thinking that
> SUSPEND pauses device operation so that virtqueues are no longer
> processed and no other events occur (e.g. VIRTIO Configuration Change
> Notifications). RESUME continues device operation. Neither command is
> directly related to device state serialization but SUSPEND freezes the
> device state, while RESUME allows the device state to change again.

I understood that a reset would basically reset all internal state, 
which is why SUSPEND+RESUME were required around it, to retain the state.

>> While this state needn’t necessarily be immediately migratable, I
>> suppose (e.g. one could retain file descriptors there, and it doesn’t
>> need to be a serialized byte buffer, but could still be structured), it
>> would basically be a live migration implementation already.  As far as I
>> understand, that’s why you suggest not running a SUSPEND+RESUME cycle on
>> anything but live migration, right?
> No, SUSPEND/RESUME would also be used across vm_stop()/vm_start().
> That way stateful devices are no longer reset across HMP 'stop'/'cont'
> (we're lucky it even works for most existing vhost-user backends today
> and that's just because they don't yet implement
> VHOST_USER_SET_STATUS).

So that’s what I seem to misunderstand: If stateful devices are reset, 
how does SUSPEND+RESUME prevent that?

>> I wonder how that model would then work with iterative migration,
>> though.  Basically, for non-iterative migration, the back-end would
>> expect SUSPEND first to flush its state out to a buffer, and then the
>> state transfer would just copy from that buffer.  For iterative
>> migration, though, there is no SUSPEND first, so the back-end must
>> implicitly begin to serialize its state and send it over.  I find that a
>> bit strange.
> I expected SET_DEVICE_STATE_FD to be sent while the device is still
> running for iterative migration. Device state chunks are saved while
> the device is still operating.
>
> When the VMM decides to stop the guest, it sends SUSPEND to freeze the
> device. The remainder of the device state can then be read from the fd
> in the knowledge that the size is now finite.
>
> After migration completes, the device is still suspended on the
> source. If migration failed, RESUME is sent to continue running on the
> source.

Sure, that makes perfect sense as long as SUSPEND/RESUME are unrelated 
to device state serialization,

>> Also, how would this work with currently migratable stateless
>> back-ends?  Do they already implement SUSPEND+RESUME as no-ops?  If not,
>> I think we should detect stateless back-ends and skip the operations in
>> qemu lest we have to update those back-ends for no real reason.
> Yes, I think backwards compatibility is a requirement, too. The
> vhost-user frontend checks the SUSPEND vhost-user protocol feature
> bit. If the bit is cleared, then it must assume this device is
> stateless and use device reset operations. Otherwise it can use
> SUSPEND/RESUME.

Yes, all stateful devices should currently block migration, so we could 
require them to implement SUSPEND/RESUME, and assume that any that don’t 
are stateless.

Hanna


