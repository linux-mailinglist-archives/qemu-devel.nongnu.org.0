Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1216E7891
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 13:25:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp5vb-0007L2-72; Wed, 19 Apr 2023 07:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pp5vU-0007Ki-Js
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:24:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pp5vR-0006o0-VC
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681903476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hp5pcqzDheIbhSOXFLGXahYL2B0aIHaHYUkuBt6WKwc=;
 b=Um7vcqqKUPtkXQAaGaLlCwXfaW21z8bGO4CgH8Y4zVwTXT1ComDZzdlJRnRv1MViGiUxaA
 KBoxemA7OvB+SR3QXleWms92ew1eDplOV2gEaV5pIzkMHr2P2AwuzZL1PuwPhytT8KQq5a
 QMQ1qpMVU23f+91GBO2bAeAADUNTVkU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-BRfw1WHjNxWKjD1AphQmIQ-1; Wed, 19 Apr 2023 07:24:34 -0400
X-MC-Unique: BRfw1WHjNxWKjD1AphQmIQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 q24-20020a170906361800b0094fb847ed94so3224872ejb.0
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 04:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681903472; x=1684495472;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hp5pcqzDheIbhSOXFLGXahYL2B0aIHaHYUkuBt6WKwc=;
 b=ff+c2/XHa8o2x3+xVr2nb3yt1Yb27w/EzWfi+2bidv6LCbJo8B4QbpzjzPSOjxyzIu
 kfsV2P0cDbsN4M7D8JWvHvqyJVlFrKKmtk9RRgQEOAIHCwPsIE1pd+bor3bXeJtlE5zU
 q55B8ta2EctahEK4YzFSMXu7www3GcTD1Bf/eejWaofXLSP8IN6LjmXZDwGpOKbWH+Yg
 ctAxZl7TGajcvPcAVymo1vlTfwcCv2W7QtiOstE5B5YIwqbHVPQ6Npoo8wx+Xt9WapZW
 pjk6JLnsCzW6MxAocsfqkd43wg+gImgt2et91Imry6jeHHzumDd+Fb4ZrMy2ExNK2j8d
 N2dQ==
X-Gm-Message-State: AAQBX9fK8SmKoeJ4hc6J5LX6MJq5jOMQh8mRgRx/8PYGg5hjQFIV1oGy
 iKfytKUyfJfuTqAmpiNoJ+OU+CCyrjKYsx1/rawcNHv7jny842YIjCTGcRcIB65CEGx2HNRgFX1
 GDhcGJGXliMCbjfA=
X-Received: by 2002:a17:907:d01:b0:94f:1ce7:1864 with SMTP id
 gn1-20020a1709070d0100b0094f1ce71864mr15471207ejc.38.1681903472056; 
 Wed, 19 Apr 2023 04:24:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350YS9vd+ZsRDJnF032QebC3fjFm+KBrEpxZKKpZTuNsRRK7MzkME2lZHkc5YvSpdCxFnVEIyxA==
X-Received: by 2002:a17:907:d01:b0:94f:1ce7:1864 with SMTP id
 gn1-20020a1709070d0100b0094f1ce71864mr15471180ejc.38.1681903471531; 
 Wed, 19 Apr 2023 04:24:31 -0700 (PDT)
Received: from ?IPV6:2003:cf:d71b:cc43:1955:48c6:4ddb:556c?
 (p200300cfd71bcc43195548c64ddb556c.dip0.t-ipconnect.de.
 [2003:cf:d71b:cc43:1955:48c6:4ddb:556c])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a170906498c00b0094e4eabb402sm9100032eju.128.2023.04.19.04.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 04:24:30 -0700 (PDT)
Message-ID: <e8459c3d-7716-b62d-ac8a-b50dd65e7059@redhat.com>
Date: Wed, 19 Apr 2023 13:24:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com> <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
 <20230417171405.GA3890522@fedora>
 <CAJaqyWePywgd11mA5D=SqSyGOjzdhj1kjNHVkjG1iWv9Ox0ytg@mail.gmail.com>
 <CAJSP0QUriW5D9QNX+=YHYepXVAzOKjL6Dc93zSYihTTZhif0ig@mail.gmail.com>
 <CAJaqyWc_59dhPcXOQDYh3vpMfV_4uZooYpQnRrcCkBBu1QO8tw@mail.gmail.com>
 <5620d5c8-a9fb-a65b-74ab-16a1ae12c8e3@redhat.com>
 <CAJSP0QWbGQ9BaXDGMgasfk=qWt1DKHxcE=rK9BeuotQvQUuomw@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJSP0QWbGQ9BaXDGMgasfk=qWt1DKHxcE=rK9BeuotQvQUuomw@mail.gmail.com>
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

On 19.04.23 13:21, Stefan Hajnoczi wrote:
> On Wed, 19 Apr 2023 at 07:10, Hanna Czenczek <hreitz@redhat.com> wrote:
>> On 18.04.23 09:54, Eugenio Perez Martin wrote:
>>> On Mon, Apr 17, 2023 at 9:21 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>>> On Mon, 17 Apr 2023 at 15:08, Eugenio Perez Martin <eperezma@redhat.com> wrote:
>>>>> On Mon, Apr 17, 2023 at 7:14 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>>>>> On Thu, Apr 13, 2023 at 12:14:24PM +0200, Eugenio Perez Martin wrote:
>>>>>>> On Wed, Apr 12, 2023 at 11:06 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>>>>>>> On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
>>>>>>>>> So-called "internal" virtio-fs migration refers to transporting the
>>>>>>>>> back-end's (virtiofsd's) state through qemu's migration stream.  To do
>>>>>>>>> this, we need to be able to transfer virtiofsd's internal state to and
>>>>>>>>> from virtiofsd.
>>>>>>>>>
>>>>>>>>> Because virtiofsd's internal state will not be too large, we believe it
>>>>>>>>> is best to transfer it as a single binary blob after the streaming
>>>>>>>>> phase.  Because this method should be useful to other vhost-user
>>>>>>>>> implementations, too, it is introduced as a general-purpose addition to
>>>>>>>>> the protocol, not limited to vhost-user-fs.
>>>>>>>>>
>>>>>>>>> These are the additions to the protocol:
>>>>>>>>> - New vhost-user protocol feature VHOST_USER_PROTOCOL_F_MIGRATORY_STATE:
>>>>>>>>>     This feature signals support for transferring state, and is added so
>>>>>>>>>     that migration can fail early when the back-end has no support.
>>>>>>>>>
>>>>>>>>> - SET_DEVICE_STATE_FD function: Front-end and back-end negotiate a pipe
>>>>>>>>>     over which to transfer the state.  The front-end sends an FD to the
>>>>>>>>>     back-end into/from which it can write/read its state, and the back-end
>>>>>>>>>     can decide to either use it, or reply with a different FD for the
>>>>>>>>>     front-end to override the front-end's choice.
>>>>>>>>>     The front-end creates a simple pipe to transfer the state, but maybe
>>>>>>>>>     the back-end already has an FD into/from which it has to write/read
>>>>>>>>>     its state, in which case it will want to override the simple pipe.
>>>>>>>>>     Conversely, maybe in the future we find a way to have the front-end
>>>>>>>>>     get an immediate FD for the migration stream (in some cases), in which
>>>>>>>>>     case we will want to send this to the back-end instead of creating a
>>>>>>>>>     pipe.
>>>>>>>>>     Hence the negotiation: If one side has a better idea than a plain
>>>>>>>>>     pipe, we will want to use that.
>>>>>>>>>
>>>>>>>>> - CHECK_DEVICE_STATE: After the state has been transferred through the
>>>>>>>>>     pipe (the end indicated by EOF), the front-end invokes this function
>>>>>>>>>     to verify success.  There is no in-band way (through the pipe) to
>>>>>>>>>     indicate failure, so we need to check explicitly.
>>>>>>>>>
>>>>>>>>> Once the transfer pipe has been established via SET_DEVICE_STATE_FD
>>>>>>>>> (which includes establishing the direction of transfer and migration
>>>>>>>>> phase), the sending side writes its data into the pipe, and the reading
>>>>>>>>> side reads it until it sees an EOF.  Then, the front-end will check for
>>>>>>>>> success via CHECK_DEVICE_STATE, which on the destination side includes
>>>>>>>>> checking for integrity (i.e. errors during deserialization).
>>>>>>>>>
>>>>>>>>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>>>>>>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
>>>>>>>>> ---
>>>>>>>>>    include/hw/virtio/vhost-backend.h |  24 +++++
>>>>>>>>>    include/hw/virtio/vhost.h         |  79 ++++++++++++++++
>>>>>>>>>    hw/virtio/vhost-user.c            | 147 ++++++++++++++++++++++++++++++
>>>>>>>>>    hw/virtio/vhost.c                 |  37 ++++++++
>>>>>>>>>    4 files changed, 287 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
>>>>>>>>> index ec3fbae58d..5935b32fe3 100644
>>>>>>>>> --- a/include/hw/virtio/vhost-backend.h
>>>>>>>>> +++ b/include/hw/virtio/vhost-backend.h
>>>>>>>>> @@ -26,6 +26,18 @@ typedef enum VhostSetConfigType {
>>>>>>>>>        VHOST_SET_CONFIG_TYPE_MIGRATION = 1,
>>>>>>>>>    } VhostSetConfigType;
>>>>>>>>>
>>>>>>>>> +typedef enum VhostDeviceStateDirection {
>>>>>>>>> +    /* Transfer state from back-end (device) to front-end */
>>>>>>>>> +    VHOST_TRANSFER_STATE_DIRECTION_SAVE = 0,
>>>>>>>>> +    /* Transfer state from front-end to back-end (device) */
>>>>>>>>> +    VHOST_TRANSFER_STATE_DIRECTION_LOAD = 1,
>>>>>>>>> +} VhostDeviceStateDirection;
>>>>>>>>> +
>>>>>>>>> +typedef enum VhostDeviceStatePhase {
>>>>>>>>> +    /* The device (and all its vrings) is stopped */
>>>>>>>>> +    VHOST_TRANSFER_STATE_PHASE_STOPPED = 0,
>>>>>>>>> +} VhostDeviceStatePhase;
>>>>>>>> vDPA has:
>>>>>>>>
>>>>>>>>     /* Suspend a device so it does not process virtqueue requests anymore
>>>>>>>>      *
>>>>>>>>      * After the return of ioctl the device must preserve all the necessary state
>>>>>>>>      * (the virtqueue vring base plus the possible device specific states) that is
>>>>>>>>      * required for restoring in the future. The device must not change its
>>>>>>>>      * configuration after that point.
>>>>>>>>      */
>>>>>>>>     #define VHOST_VDPA_SUSPEND      _IO(VHOST_VIRTIO, 0x7D)
>>>>>>>>
>>>>>>>>     /* Resume a device so it can resume processing virtqueue requests
>>>>>>>>      *
>>>>>>>>      * After the return of this ioctl the device will have restored all the
>>>>>>>>      * necessary states and it is fully operational to continue processing the
>>>>>>>>      * virtqueue descriptors.
>>>>>>>>      */
>>>>>>>>     #define VHOST_VDPA_RESUME       _IO(VHOST_VIRTIO, 0x7E)
>>>>>>>>
>>>>>>>> I wonder if it makes sense to import these into vhost-user so that the
>>>>>>>> difference between kernel vhost and vhost-user is minimized. It's okay
>>>>>>>> if one of them is ahead of the other, but it would be nice to avoid
>>>>>>>> overlapping/duplicated functionality.
>>>>>>>>
>>>>>>> That's what I had in mind in the first versions. I proposed VHOST_STOP
>>>>>>> instead of VHOST_VDPA_STOP for this very reason. Later it did change
>>>>>>> to SUSPEND.
>>>>>>>
>>>>>>> Generally it is better if we make the interface less parametrized and
>>>>>>> we trust in the messages and its semantics in my opinion. In other
>>>>>>> words, instead of
>>>>>>> vhost_set_device_state_fd_op(VHOST_TRANSFER_STATE_PHASE_STOPPED), send
>>>>>>> individually the equivalent of VHOST_VDPA_SUSPEND vhost-user command.
>>>>>>>
>>>>>>> Another way to apply this is with the "direction" parameter. Maybe it
>>>>>>> is better to split it into "set_state_fd" and "get_state_fd"?
>>>>>>>
>>>>>>> In that case, reusing the ioctls as vhost-user messages would be ok.
>>>>>>> But that puts this proposal further from the VFIO code, which uses
>>>>>>> "migration_set_state(state)", and maybe it is better when the number
>>>>>>> of states is high.
>>>>>> Hi Eugenio,
>>>>>> Another question about vDPA suspend/resume:
>>>>>>
>>>>>>     /* Host notifiers must be enabled at this point. */
>>>>>>     void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
>>>>>>     {
>>>>>>         int i;
>>>>>>
>>>>>>         /* should only be called after backend is connected */
>>>>>>         assert(hdev->vhost_ops);
>>>>>>         event_notifier_test_and_clear(
>>>>>>             &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier);
>>>>>>         event_notifier_test_and_clear(&vdev->config_notifier);
>>>>>>
>>>>>>         trace_vhost_dev_stop(hdev, vdev->name, vrings);
>>>>>>
>>>>>>         if (hdev->vhost_ops->vhost_dev_start) {
>>>>>>             hdev->vhost_ops->vhost_dev_start(hdev, false);
>>>>>>             ^^^ SUSPEND ^^^
>>>>>>         }
>>>>>>         if (vrings) {
>>>>>>             vhost_dev_set_vring_enable(hdev, false);
>>>>>>         }
>>>>>>         for (i = 0; i < hdev->nvqs; ++i) {
>>>>>>             vhost_virtqueue_stop(hdev,
>>>>>>                                  vdev,
>>>>>>                                  hdev->vqs + i,
>>>>>>                                  hdev->vq_index + i);
>>>>>>           ^^^ fetch virtqueue state from kernel ^^^
>>>>>>         }
>>>>>>         if (hdev->vhost_ops->vhost_reset_status) {
>>>>>>             hdev->vhost_ops->vhost_reset_status(hdev);
>>>>>>             ^^^ reset device^^^
>>>>>>
>>>>>> I noticed the QEMU vDPA code resets the device in vhost_dev_stop() ->
>>>>>> vhost_reset_status(). The device's migration code runs after
>>>>>> vhost_dev_stop() and the state will have been lost.
>>>>>>
>>>>> vhost_virtqueue_stop saves the vq state (indexes, vring base) in the
>>>>> qemu VirtIONet device model. This is for all vhost backends.
>>>>>
>>>>> Regarding the state like mac or mq configuration, SVQ runs for all the
>>>>> VM run in the CVQ. So it can track all of that status in the device
>>>>> model too.
>>>>>
>>>>> When a migration effectively occurs, all the frontend state is
>>>>> migrated as a regular emulated device. To route all of the state in a
>>>>> normalized way for qemu is what leaves open the possibility to do
>>>>> cross-backends migrations, etc.
>>>>>
>>>>> Does that answer your question?
>>>> I think you're confirming that changes would be necessary in order for
>>>> vDPA to support the save/load operation that Hanna is introducing.
>>>>
>>> Yes, this first iteration was centered on net, with an eye on block,
>>> where state can be routed through classical emulated devices. This is
>>> how vhost-kernel and vhost-user do classically. And it allows
>>> cross-backend, to not modify qemu migration state, etc.
>>>
>>> To introduce this opaque state to qemu, that must be fetched after the
>>> suspend and not before, requires changes in vhost protocol, as
>>> discussed previously.
>>>
>>>>>> It looks like vDPA changes are necessary in order to support stateful
>>>>>> devices even though QEMU already uses SUSPEND. Is my understanding
>>>>>> correct?
>>>>>>
>>>>> Changes are required elsewhere, as the code to restore the state
>>>>> properly in the destination has not been merged.
>>>> I'm not sure what you mean by elsewhere?
>>>>
>>> I meant for vdpa *net* devices the changes are not required in vdpa
>>> ioctls, but mostly in qemu.
>>>
>>> If you meant stateful as "it must have a state blob that it must be
>>> opaque to qemu", then I think the straightforward action is to fetch
>>> state blob about the same time as vq indexes. But yes, changes (at
>>> least a new ioctl) is needed for that.
>>>
>>>> I'm asking about vDPA ioctls. Right now the sequence is SUSPEND and
>>>> then VHOST_VDPA_SET_STATUS 0.
>>>>
>>>> In order to save device state from the vDPA device in the future, it
>>>> will be necessary to defer the VHOST_VDPA_SET_STATUS 0 call so that
>>>> the device state can be saved before the device is reset.
>>>>
>>>> Does that sound right?
>>>>
>>> The split between suspend and reset was added recently for that very
>>> reason. In all the virtio devices, the frontend is initialized before
>>> the backend, so I don't think it is a good idea to defer the backend
>>> cleanup. Especially if we have already set the state is small enough
>>> to not needing iterative migration from virtiofsd point of view.
>>>
>>> If fetching that state at the same time as vq indexes is not valid,
>>> could it follow the same model as the "in-flight descriptors"?
>>> vhost-user follows them by using a shared memory region where their
>>> state is tracked [1]. This allows qemu to survive vhost-user SW
>>> backend crashes, and does not forbid the cross-backends live migration
>>> as all the information is there to recover them.
>>>
>>> For hw devices this is not convenient as it occupies PCI bandwidth. So
>>> a possibility is to synchronize this memory region after a
>>> synchronization point, being the SUSPEND call or GET_VRING_BASE. HW
>>> devices are not going to crash in the software sense, so all use cases
>>> remain the same to qemu. And that shared memory information is
>>> recoverable after vhost_dev_stop.
>>>
>>> Does that sound reasonable to virtiofsd? To offer a shared memory
>>> region where it dumps the state, maybe only after the
>>> set_state(STATE_PHASE_STOPPED)?
>> I don’t think we need the set_state() call, necessarily, if SUSPEND is
>> mandatory anyway.
>>
>> As for the shared memory, the RFC before this series used shared memory,
>> so it’s possible, yes.  But “shared memory region” can mean a lot of
>> things – it sounds like you’re saying the back-end (virtiofsd) should
>> provide it to the front-end, is that right?  That could work like this:
>>
>> On the source side:
>>
>> S1. SUSPEND goes to virtiofsd
>> S2. virtiofsd maybe double-checks that the device is stopped, then
>> serializes its state into a newly allocated shared memory area[1]
>> S3. virtiofsd responds to SUSPEND
>> S4. front-end requests shared memory, virtiofsd responds with a handle,
>> maybe already closes its reference
>> S5. front-end saves state, closes its handle, freeing the SHM
>>
>> [1] Maybe virtiofsd can correctly size the serialized state’s size, then
>> it can immediately allocate this area and serialize directly into it;
>> maybe it can’t, then we’ll need a bounce buffer.  Not really a
>> fundamental problem, but there are limitations around what you can do
>> with serde implementations in Rust…
>>
>> On the destination side:
>>
>> D1. Optional SUSPEND goes to virtiofsd that hasn’t yet done much;
>> virtiofsd would serialize its empty state into an SHM area, and respond
>> to SUSPEND
>> D2. front-end reads state from migration stream into an SHM it has allocated
>> D3. front-end supplies this SHM to virtiofsd, which discards its
>> previous area, and now uses this one
>> D4. RESUME goes to virtiofsd, which deserializes the state from the SHM
>>
>> Couple of questions:
>>
>> A. Stefan suggested D1, but it does seem wasteful now.  But if SUSPEND
>> would imply to deserialize a state, and the state is to be transferred
>> through SHM, this is what would need to be done.  So maybe we should
>> skip SUSPEND on the destination?
>> B. You described that the back-end should supply the SHM, which works
>> well on the source.  On the destination, only the front-end knows how
>> big the state is, so I’ve decided above that it should allocate the SHM
>> (D2) and provide it to the back-end.  Is that feasible or is it
>> important (e.g. for real hardware) that the back-end supplies the SHM?
>> (In which case the front-end would need to tell the back-end how big the
>> state SHM needs to be.)
> How does this work for iterative live migration?

Right, probably not at all. :)

Hanna


