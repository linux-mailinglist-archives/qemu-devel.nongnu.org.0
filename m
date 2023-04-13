Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473486E1393
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 19:33:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn0nt-0006fq-Qp; Thu, 13 Apr 2023 13:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pn0np-0006fT-5s
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 13:32:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pn0nm-00045n-8R
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 13:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681407124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bDRQX9IE36bNOZR9iPqKBh6EpxmAZ6ZizCdlwUnRgU=;
 b=iJxwu3SFlbZaJeTZryoMno3S+scTwWpEYVic/zUG6oemyyVySUPkY/aMTsth/2iKjQfXUw
 4vSTByNQ3mr3zNT1U7iout9ohmuD9DynQQv+CCgdpC4dfqe+Qu8Mm8e1I/fZ+gLgyOsIMQ
 VW83tNX5hsvp3rKxcBO8e0+Tw1Xq9M0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-Ec0MUex7PlKw47XypNE_jQ-1; Thu, 13 Apr 2023 13:32:01 -0400
X-MC-Unique: Ec0MUex7PlKw47XypNE_jQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l20-20020a05600c4f1400b003f0a04fe9b9so2480684wmq.7
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 10:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681407120; x=1683999120;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/bDRQX9IE36bNOZR9iPqKBh6EpxmAZ6ZizCdlwUnRgU=;
 b=KBdBuanZUWyN9nLfeNQOaL3qNZTN0QdJrUYSbXS3fR6U7HeWtHNPeEyVeLptuhC+7t
 pf3/MDY0tNOeQghwd6ThGCYYg7q0K34Ndoh73iA2Vm2cZcdrSKchVpv1CgIK5xBUod4m
 H3iaWVW4uGkLZMNeKpPDfiD3tO9nFm7OVY+RWwvQBvqcpbPrWRVKccuQp5Y441eE13gP
 4a0gqf9mPdNypK+k+sObH/BOQGvFW4tmTaWGHbswbwsSfkrEmKK7+su5ecqg4fvpgpCa
 4xrI3m2ho7Tfj6SAMw8KxMeeZobYnlwnk+P/Hortn5dYX3a3kkRLs98ZisFwmDiq8cDy
 iMnw==
X-Gm-Message-State: AAQBX9c0AasQiOgX9LP238grr6CiHqjpiWG1LUnvSWqoZLjfBe41+MO9
 OE4dGu9LauUrWisRMhDcCjdiHYtVXJoZ7iK7HY9nh7bbagrYOZK1Hf56I0O7kXYGeptM1HlyMfJ
 ruJtEm+QD27/n9bc=
X-Received: by 2002:adf:edce:0:b0:2f5:7ce1:781d with SMTP id
 v14-20020adfedce000000b002f57ce1781dmr2203359wro.50.1681407119992; 
 Thu, 13 Apr 2023 10:31:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y+zPen700EcZTxc8pZESuNA0IMGcy7N+hcBC6bP/u3UckzqoIcnjPLDfwnnYvaDB4Bn/6FNQ==
X-Received: by 2002:adf:edce:0:b0:2f5:7ce1:781d with SMTP id
 v14-20020adfedce000000b002f57ce1781dmr2203333wro.50.1681407119576; 
 Thu, 13 Apr 2023 10:31:59 -0700 (PDT)
Received: from ?IPV6:2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e?
 (p200300cfd735c67f6ed98c907a1de97e.dip0.t-ipconnect.de.
 [2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c310800b003eddc6aa5fasm6024778wmo.39.2023.04.13.10.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 10:31:59 -0700 (PDT)
Message-ID: <d9d67f07-3d4c-9bdb-052b-28e21fa27dd6@redhat.com>
Date: Thu, 13 Apr 2023 19:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com> <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 13.04.23 12:14, Eugenio Perez Martin wrote:
> On Wed, Apr 12, 2023 at 11:06 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>> On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
>>> So-called "internal" virtio-fs migration refers to transporting the
>>> back-end's (virtiofsd's) state through qemu's migration stream.  To do
>>> this, we need to be able to transfer virtiofsd's internal state to and
>>> from virtiofsd.
>>>
>>> Because virtiofsd's internal state will not be too large, we believe it
>>> is best to transfer it as a single binary blob after the streaming
>>> phase.  Because this method should be useful to other vhost-user
>>> implementations, too, it is introduced as a general-purpose addition to
>>> the protocol, not limited to vhost-user-fs.
>>>
>>> These are the additions to the protocol:
>>> - New vhost-user protocol feature VHOST_USER_PROTOCOL_F_MIGRATORY_STATE:
>>>    This feature signals support for transferring state, and is added so
>>>    that migration can fail early when the back-end has no support.
>>>
>>> - SET_DEVICE_STATE_FD function: Front-end and back-end negotiate a pipe
>>>    over which to transfer the state.  The front-end sends an FD to the
>>>    back-end into/from which it can write/read its state, and the back-end
>>>    can decide to either use it, or reply with a different FD for the
>>>    front-end to override the front-end's choice.
>>>    The front-end creates a simple pipe to transfer the state, but maybe
>>>    the back-end already has an FD into/from which it has to write/read
>>>    its state, in which case it will want to override the simple pipe.
>>>    Conversely, maybe in the future we find a way to have the front-end
>>>    get an immediate FD for the migration stream (in some cases), in which
>>>    case we will want to send this to the back-end instead of creating a
>>>    pipe.
>>>    Hence the negotiation: If one side has a better idea than a plain
>>>    pipe, we will want to use that.
>>>
>>> - CHECK_DEVICE_STATE: After the state has been transferred through the
>>>    pipe (the end indicated by EOF), the front-end invokes this function
>>>    to verify success.  There is no in-band way (through the pipe) to
>>>    indicate failure, so we need to check explicitly.
>>>
>>> Once the transfer pipe has been established via SET_DEVICE_STATE_FD
>>> (which includes establishing the direction of transfer and migration
>>> phase), the sending side writes its data into the pipe, and the reading
>>> side reads it until it sees an EOF.  Then, the front-end will check for
>>> success via CHECK_DEVICE_STATE, which on the destination side includes
>>> checking for integrity (i.e. errors during deserialization).
>>>
>>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
>>> ---
>>>   include/hw/virtio/vhost-backend.h |  24 +++++
>>>   include/hw/virtio/vhost.h         |  79 ++++++++++++++++
>>>   hw/virtio/vhost-user.c            | 147 ++++++++++++++++++++++++++++++
>>>   hw/virtio/vhost.c                 |  37 ++++++++
>>>   4 files changed, 287 insertions(+)
>>>
>>> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
>>> index ec3fbae58d..5935b32fe3 100644
>>> --- a/include/hw/virtio/vhost-backend.h
>>> +++ b/include/hw/virtio/vhost-backend.h
>>> @@ -26,6 +26,18 @@ typedef enum VhostSetConfigType {
>>>       VHOST_SET_CONFIG_TYPE_MIGRATION = 1,
>>>   } VhostSetConfigType;
>>>
>>> +typedef enum VhostDeviceStateDirection {
>>> +    /* Transfer state from back-end (device) to front-end */
>>> +    VHOST_TRANSFER_STATE_DIRECTION_SAVE = 0,
>>> +    /* Transfer state from front-end to back-end (device) */
>>> +    VHOST_TRANSFER_STATE_DIRECTION_LOAD = 1,
>>> +} VhostDeviceStateDirection;
>>> +
>>> +typedef enum VhostDeviceStatePhase {
>>> +    /* The device (and all its vrings) is stopped */
>>> +    VHOST_TRANSFER_STATE_PHASE_STOPPED = 0,
>>> +} VhostDeviceStatePhase;
>> vDPA has:
>>
>>    /* Suspend a device so it does not process virtqueue requests anymore
>>     *
>>     * After the return of ioctl the device must preserve all the necessary state
>>     * (the virtqueue vring base plus the possible device specific states) that is
>>     * required for restoring in the future. The device must not change its
>>     * configuration after that point.
>>     */
>>    #define VHOST_VDPA_SUSPEND      _IO(VHOST_VIRTIO, 0x7D)
>>
>>    /* Resume a device so it can resume processing virtqueue requests
>>     *
>>     * After the return of this ioctl the device will have restored all the
>>     * necessary states and it is fully operational to continue processing the
>>     * virtqueue descriptors.
>>     */
>>    #define VHOST_VDPA_RESUME       _IO(VHOST_VIRTIO, 0x7E)
>>
>> I wonder if it makes sense to import these into vhost-user so that the
>> difference between kernel vhost and vhost-user is minimized. It's okay
>> if one of them is ahead of the other, but it would be nice to avoid
>> overlapping/duplicated functionality.
>>
> That's what I had in mind in the first versions. I proposed VHOST_STOP
> instead of VHOST_VDPA_STOP for this very reason. Later it did change
> to SUSPEND.
>
> Generally it is better if we make the interface less parametrized and
> we trust in the messages and its semantics in my opinion. In other
> words, instead of
> vhost_set_device_state_fd_op(VHOST_TRANSFER_STATE_PHASE_STOPPED), send
> individually the equivalent of VHOST_VDPA_SUSPEND vhost-user command.

I.e. you mean that this should simply be stateful instead of
re-affirming the current state with a parameter?

The problem I see is that transferring states in different phases of
migration will require specialized implementations.  So running
SET_DEVICE_STATE_FD in a different phase will require support from the
back-end.  Same in the front-end, the exact protocol and thus
implementation will (probably, difficult to say at this point) depend on
the migration phase.  I would therefore prefer to have an explicit
distinction in the command itself that affirms the phase we’re
targeting.

On the other hand, I don’t see the parameter complicating anything. The
front-end must supply it, but it will know the phase anyway, so this is
easy.  The back-end can just choose to ignore it, if it doesn’t feel the
need to verify that the phase is what it thinks it is.

> Another way to apply this is with the "direction" parameter. Maybe it
> is better to split it into "set_state_fd" and "get_state_fd"?

Well, it would rather be `set_state_send_fd` and `set_state_receive_fd`.
We always negotiate a pipe between front-end and back-end, the question
is just whether the back-end gets the receiving (load) or the sending
(save) end.

Technically, one can make it fully stateful and say that if the device
hasn’t been started already, it’s always a LOAD, and otherwise always a
SAVE.  But as above, I’d prefer to keep the parameter because the
implementations are different, so I’d prefer there to be a
re-affirmation that front-end and back-end are in sync about what should
be done.

Personally, I don’t really see the advantage of having two functions
instead of one function with an enum with two values.  The thing about
SET_DEVICE_STATE_FD is that it itself won’t differ much regardless of
whether we’re loading or saving, it just negotiates the pipe – the
difference is what happens after the pipe has been negotiated.  So if we
split the function into two, both implementations will share most of
their code anyway, which makes me think it should be a single function.

> In that case, reusing the ioctls as vhost-user messages would be ok.
> But that puts this proposal further from the VFIO code, which uses
> "migration_set_state(state)", and maybe it is better when the number
> of states is high.

I’m not sure what you mean (because I don’t know the VFIO code, I
assume).  Are you saying that using a more finely grained
migration_set_state() model would conflict with the rather coarse
suspend/resume?

> BTW, is there any usage for *reply_fd at this moment from the backend?

No, virtiofsd doesn’t plan to make use of it.

Hanna


