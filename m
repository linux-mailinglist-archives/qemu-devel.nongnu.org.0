Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4DC6E13C7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 19:55:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn1AJ-0004GT-DP; Thu, 13 Apr 2023 13:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pn1AC-0004AZ-Ei
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 13:55:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pn1A6-0000au-UE
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 13:55:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681408504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LpdQA5tSbVuaIb2cW85GfIwN3b8h2PHRrEUfZfQZ3/Y=;
 b=FfOhHBD0sVlVbvq07WobQBbnIA2EmjG6oZr5MdxYlhAWJD5sfc4bDvYq8ZSNizHwa+IBa+
 PG04NTn8JkTVMmLE06wNtOyjkejnMZbuDbCuCVrhAFaW54xxZf58Ji4m1dwHVJJGF2xjmU
 UJUOqYzEWEAQ8j8AS0nTS9ZsHOLHvyw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257--p4fAHU9Nna0ci9yXyT3nQ-1; Thu, 13 Apr 2023 13:55:03 -0400
X-MC-Unique: -p4fAHU9Nna0ci9yXyT3nQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n11-20020a05600c3b8b00b003f04739b77aso17941362wms.9
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 10:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681408502; x=1684000502;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LpdQA5tSbVuaIb2cW85GfIwN3b8h2PHRrEUfZfQZ3/Y=;
 b=ZqJlOeoVnOSs/TRNUx3qpzYIakUGwHagSzJkVrDvPAvFhNeKzrDRnVbUUQe1oBTmIy
 EFnBe6rX9roOx+38HtZm9fxmWBXXkAX8XoYjW1D8saOHd+GLh7hXojiV5gfSyfVSpQVv
 tkJialUGQ5j7tJB05x/2yFVfwkk0Gm6ed/PgvhCKbxmeuNRgkhH1f1fxCk4LMjJUXThJ
 NjMMO5PbyTojkjBZUpy+Qs/fJQn0nNpZ51wmn6cqwv5rn9XuYqC2ZXekdWGAsMCXpXlR
 A1UbvGBZEXrYWyxeTJyOSMV5JKBM0xG0dgo0QblNKByLtEnviCfmjKPVXx3WPMl7XBe/
 2V9w==
X-Gm-Message-State: AAQBX9faEVL6pn7+ZIaWUiXraUkfynRzmJx+9JUVMj0frmoPyhTam1MG
 g4vRDff6AETbN6VLw3BTKzQY1Sr+/8Kl0Tb8VddERO0ZNX/I6o9nXvzQrsMbEiBOHb4W+Ywd96t
 Bv5qVqGvb3T1ei7Q=
X-Received: by 2002:a05:600c:24e:b0:3ef:71d5:41d8 with SMTP id
 14-20020a05600c024e00b003ef71d541d8mr2174240wmj.32.1681408502249; 
 Thu, 13 Apr 2023 10:55:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z9XAtv/dtnmIHTerIaKzwHw/246TZMiVLubfmw4wUajppfezzUwmYFgiQRYWVDC+ofG7nH1Q==
X-Received: by 2002:a05:600c:24e:b0:3ef:71d5:41d8 with SMTP id
 14-20020a05600c024e00b003ef71d541d8mr2174227wmj.32.1681408501889; 
 Thu, 13 Apr 2023 10:55:01 -0700 (PDT)
Received: from ?IPV6:2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e?
 (p200300cfd735c67f6ed98c907a1de97e.dip0.t-ipconnect.de.
 [2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a05600c450700b003f0aefcc457sm259074wmo.45.2023.04.13.10.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 10:55:01 -0700 (PDT)
Message-ID: <b0cd4f54-94ed-09a4-cec2-e81f36da4008@redhat.com>
Date: Thu, 13 Apr 2023 19:55:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, =?UTF-8?Q?Eugenio_P=c3=a9rez?=
 <eperezma@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com> <20230412210641.GC2813183@fedora>
 <246691c3-2287-7472-3615-7ec0f074445c@redhat.com>
 <CAJSP0QU-iDTT+xtkZ_xRf4vX+hM0WY+H1SXSuyS+cjiogz3A_A@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJSP0QU-iDTT+xtkZ_xRf4vX+hM0WY+H1SXSuyS+cjiogz3A_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_PH_BODY_ACCOUNTS_PRE=0.001 autolearn=ham autolearn_force=no
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

On 13.04.23 13:38, Stefan Hajnoczi wrote:
> On Thu, 13 Apr 2023 at 05:24, Hanna Czenczek <hreitz@redhat.com> wrote:
>> On 12.04.23 23:06, Stefan Hajnoczi wrote:
>>> On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
>>>> So-called "internal" virtio-fs migration refers to transporting the
>>>> back-end's (virtiofsd's) state through qemu's migration stream.  To do
>>>> this, we need to be able to transfer virtiofsd's internal state to and
>>>> from virtiofsd.
>>>>
>>>> Because virtiofsd's internal state will not be too large, we believe it
>>>> is best to transfer it as a single binary blob after the streaming
>>>> phase.  Because this method should be useful to other vhost-user
>>>> implementations, too, it is introduced as a general-purpose addition to
>>>> the protocol, not limited to vhost-user-fs.
>>>>
>>>> These are the additions to the protocol:
>>>> - New vhost-user protocol feature VHOST_USER_PROTOCOL_F_MIGRATORY_STATE:
>>>>     This feature signals support for transferring state, and is added so
>>>>     that migration can fail early when the back-end has no support.
>>>>
>>>> - SET_DEVICE_STATE_FD function: Front-end and back-end negotiate a pipe
>>>>     over which to transfer the state.  The front-end sends an FD to the
>>>>     back-end into/from which it can write/read its state, and the back-end
>>>>     can decide to either use it, or reply with a different FD for the
>>>>     front-end to override the front-end's choice.
>>>>     The front-end creates a simple pipe to transfer the state, but maybe
>>>>     the back-end already has an FD into/from which it has to write/read
>>>>     its state, in which case it will want to override the simple pipe.
>>>>     Conversely, maybe in the future we find a way to have the front-end
>>>>     get an immediate FD for the migration stream (in some cases), in which
>>>>     case we will want to send this to the back-end instead of creating a
>>>>     pipe.
>>>>     Hence the negotiation: If one side has a better idea than a plain
>>>>     pipe, we will want to use that.
>>>>
>>>> - CHECK_DEVICE_STATE: After the state has been transferred through the
>>>>     pipe (the end indicated by EOF), the front-end invokes this function
>>>>     to verify success.  There is no in-band way (through the pipe) to
>>>>     indicate failure, so we need to check explicitly.
>>>>
>>>> Once the transfer pipe has been established via SET_DEVICE_STATE_FD
>>>> (which includes establishing the direction of transfer and migration
>>>> phase), the sending side writes its data into the pipe, and the reading
>>>> side reads it until it sees an EOF.  Then, the front-end will check for
>>>> success via CHECK_DEVICE_STATE, which on the destination side includes
>>>> checking for integrity (i.e. errors during deserialization).
>>>>
>>>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
>>>> ---
>>>>    include/hw/virtio/vhost-backend.h |  24 +++++
>>>>    include/hw/virtio/vhost.h         |  79 ++++++++++++++++
>>>>    hw/virtio/vhost-user.c            | 147 ++++++++++++++++++++++++++++++
>>>>    hw/virtio/vhost.c                 |  37 ++++++++
>>>>    4 files changed, 287 insertions(+)
>>>>
>>>> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
>>>> index ec3fbae58d..5935b32fe3 100644
>>>> --- a/include/hw/virtio/vhost-backend.h
>>>> +++ b/include/hw/virtio/vhost-backend.h
>>>> @@ -26,6 +26,18 @@ typedef enum VhostSetConfigType {
>>>>        VHOST_SET_CONFIG_TYPE_MIGRATION = 1,
>>>>    } VhostSetConfigType;
>>>>
>>>> +typedef enum VhostDeviceStateDirection {
>>>> +    /* Transfer state from back-end (device) to front-end */
>>>> +    VHOST_TRANSFER_STATE_DIRECTION_SAVE = 0,
>>>> +    /* Transfer state from front-end to back-end (device) */
>>>> +    VHOST_TRANSFER_STATE_DIRECTION_LOAD = 1,
>>>> +} VhostDeviceStateDirection;
>>>> +
>>>> +typedef enum VhostDeviceStatePhase {
>>>> +    /* The device (and all its vrings) is stopped */
>>>> +    VHOST_TRANSFER_STATE_PHASE_STOPPED = 0,
>>>> +} VhostDeviceStatePhase;
>>> vDPA has:
>>>
>>>     /* Suspend a device so it does not process virtqueue requests anymore
>>>      *
>>>      * After the return of ioctl the device must preserve all the necessary state
>>>      * (the virtqueue vring base plus the possible device specific states) that is
>>>      * required for restoring in the future. The device must not change its
>>>      * configuration after that point.
>>>      */
>>>     #define VHOST_VDPA_SUSPEND      _IO(VHOST_VIRTIO, 0x7D)
>>>
>>>     /* Resume a device so it can resume processing virtqueue requests
>>>      *
>>>      * After the return of this ioctl the device will have restored all the
>>>      * necessary states and it is fully operational to continue processing the
>>>      * virtqueue descriptors.
>>>      */
>>>     #define VHOST_VDPA_RESUME       _IO(VHOST_VIRTIO, 0x7E)
>>>
>>> I wonder if it makes sense to import these into vhost-user so that the
>>> difference between kernel vhost and vhost-user is minimized. It's okay
>>> if one of them is ahead of the other, but it would be nice to avoid
>>> overlapping/duplicated functionality.
>>>
>>> (And I hope vDPA will import the device state vhost-user messages
>>> introduced in this series.)
>> I don’t understand your suggestion.  (Like, I very simply don’t
>> understand :))
>>
>> These are vhost messages, right?  What purpose do you have in mind for
>> them in vhost-user for internal migration?  They’re different from the
>> state transfer messages, because they don’t transfer state to/from the
>> front-end.  Also, the state transfer stuff is supposed to be distinct
>> from starting/stopping the device; right now, it just requires the
>> device to be stopped beforehand (or started only afterwards).  And in
>> the future, new VhostDeviceStatePhase values may allow the messages to
>> be used on devices that aren’t stopped.
>>
>> So they seem to serve very different purposes.  I can imagine using the
>> VDPA_{SUSPEND,RESUME} messages for external migration (what Anton is
>> working on), but they don’t really help with internal migration
>> implemented here.  If I were to add them, they’d just be sent in
>> addition to the new messages added in this patch here, i.e. SUSPEND on
>> the source before SET_DEVICE_STATE_FD, and RESUME on the destination
>> after CHECK_DEVICE_STATE (we could use RESUME in place of
>> CHECK_DEVICE_STATE on the destination, but we can’t do that on the
>> source, so we still need CHECK_DEVICE_STATE).
> Yes, they are complementary to the device state fd message. I want to
> make sure pre-conditions about the device's state (running vs stopped)
> already take into account the vDPA SUSPEND/RESUME model.
>
> vDPA will need device state save/load in the future. For virtiofs
> devices, for example. This is why I think we should plan for vDPA and
> vhost-user to share the same interface.

While the paragraph below is more important, I don’t feel like this
would be important right now.  It’s clear that SUSPEND must come before
transferring any state, and that RESUME must come after transferring
state.  I don’t think we need to clarify this now, it’d be obvious when
implementing SUSPEND/RESUME.

> Also, I think the code path you're relying on (vhost_dev_stop()) on
> doesn't work for backends that implement VHOST_USER_PROTOCOL_F_STATUS
> because stopping the backend resets the device and throws away its
> state. SUSPEND/RESUME solve this. This looks like a more general
> problem since vhost_dev_stop() is called any time the VM is paused.
> Maybe it needs to use SUSPEND/RESUME whenever possible.

That’s a problem.  Quite a problem, to be honest, because this sounds
rather complicated with honestly absolutely no practical benefit right
now.

Would you require SUSPEND/RESUME for state transfer even if the back-end
does not implement GET/SET_STATUS?  Because then this would also lead to
more complexity in virtiofsd.

Basically, what I’m hearing is that I need to implement a different
feature that has no practical impact right now, and also fix bugs around
it along the way...

(Not that I have any better suggestion.)

Hanna


