Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB3A6E0A26
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 11:25:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmtCu-00040Q-F3; Thu, 13 Apr 2023 05:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmtCr-000409-Ls
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmtCp-0007X4-Sg
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681377927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJwcp4sObwm40iHPCIID0wgzpKF0ycU2AlbMmD2Ks4M=;
 b=QH62/PCxoGRUvqTpYEHq/WVHUZ1tVoPSXJo7/LJNi+7SuCBKCWBz+TG+TIVqMPE7Su7uWW
 SCRDLuRQ9zTbcITtWssG1lL1CBl7EYAxUkirnbIPfrvrbGd0Th4iZFq/DoRKF/0oszj3MV
 /RG+C0fTFH1ylWU6D10FJJP6A0RZP0E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-fsAja9IHNn6m1E_DrQ9C6A-1; Thu, 13 Apr 2023 05:25:25 -0400
X-MC-Unique: fsAja9IHNn6m1E_DrQ9C6A-1
Received: by mail-wm1-f71.google.com with SMTP id
 w16-20020a05600c475000b003f082eecdcaso5252459wmo.6
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 02:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681377924; x=1683969924;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJwcp4sObwm40iHPCIID0wgzpKF0ycU2AlbMmD2Ks4M=;
 b=NMKNNNpD0uwIg+vo3edk32bDKin9Uz7++xZMt7Rpmp3LRn89n1kLfXTnPpu0zIFUVL
 JzCVSxYwAXYFsHQCIRfKImclgPgdJJGad4LXw2cxKciXYcULOozjK6MgfXyID0mUxSsK
 ZAUc1AABZdaOijUW/4oSvGS4SYR0l63LaPurRVMtU4ShLfbN0uk2Xb0xPA+R5B0xFVSU
 xUDjfDmQNqCaYgsB05yaUl1FiFYP9N2wfDFhZ1u1IIwyEyR3Fl40An4RojPghK1D0Kay
 tZWAEEFrButODtHTNlrneeohEccR/delTGL+o0Fa8oSxXEJcFaJa0cbdxjse+QFuwOwA
 W8dA==
X-Gm-Message-State: AAQBX9dpXDpvte2pE2fAsTKEUsvaBU7SLVGMXmAEY1oz8uWb9kr4xag1
 /j6AVTakRlo+UhqBhnOyaxAIJ0ANkqTvqtG5VeYUZwGoEYeUz4oCxM9yMjY198NBXD0E8txlyo/
 AyMps3sbt0QZy52Y=
X-Received: by 2002:a1c:7218:0:b0:3df:ee64:4814 with SMTP id
 n24-20020a1c7218000000b003dfee644814mr1261764wmc.20.1681377924660; 
 Thu, 13 Apr 2023 02:25:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350aqcCx6CmP6WgZoz6dqZX8a2eFDEUWi79X2kJdEQz0uGpH2EOkvbJ/v4sEzuBq9vrogZi4kLg==
X-Received: by 2002:a1c:7218:0:b0:3df:ee64:4814 with SMTP id
 n24-20020a1c7218000000b003dfee644814mr1261739wmc.20.1681377924260; 
 Thu, 13 Apr 2023 02:25:24 -0700 (PDT)
Received: from ?IPV6:2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e?
 (p200300cfd735c67f6ed98c907a1de97e.dip0.t-ipconnect.de.
 [2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a1ccc04000000b003f071466229sm1293886wmb.17.2023.04.13.02.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 02:25:23 -0700 (PDT)
Message-ID: <af50a052-0f3e-a03c-598d-dff841720dd6@redhat.com>
Date: Thu, 13 Apr 2023 11:25:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, German Maglione
 <gmaglione@redhat.com>, Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <CAJaqyWf8twfendAqcuPopeeZv84JcevPdDm=rKaKiRFvft+30A@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJaqyWf8twfendAqcuPopeeZv84JcevPdDm=rKaKiRFvft+30A@mail.gmail.com>
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

On 13.04.23 10:50, Eugenio Perez Martin wrote:
> On Tue, Apr 11, 2023 at 5:33 PM Hanna Czenczek <hreitz@redhat.com> wrote:
>> So-called "internal" virtio-fs migration refers to transporting the
>> back-end's (virtiofsd's) state through qemu's migration stream.  To do
>> this, we need to be able to transfer virtiofsd's internal state to and
>> from virtiofsd.
>>
>> Because virtiofsd's internal state will not be too large, we believe it
>> is best to transfer it as a single binary blob after the streaming
>> phase.  Because this method should be useful to other vhost-user
>> implementations, too, it is introduced as a general-purpose addition to
>> the protocol, not limited to vhost-user-fs.
>>
>> These are the additions to the protocol:
>> - New vhost-user protocol feature VHOST_USER_PROTOCOL_F_MIGRATORY_STATE:
>>    This feature signals support for transferring state, and is added so
>>    that migration can fail early when the back-end has no support.
>>
>> - SET_DEVICE_STATE_FD function: Front-end and back-end negotiate a pipe
>>    over which to transfer the state.  The front-end sends an FD to the
>>    back-end into/from which it can write/read its state, and the back-end
>>    can decide to either use it, or reply with a different FD for the
>>    front-end to override the front-end's choice.
>>    The front-end creates a simple pipe to transfer the state, but maybe
>>    the back-end already has an FD into/from which it has to write/read
>>    its state, in which case it will want to override the simple pipe.
>>    Conversely, maybe in the future we find a way to have the front-end
>>    get an immediate FD for the migration stream (in some cases), in which
>>    case we will want to send this to the back-end instead of creating a
>>    pipe.
>>    Hence the negotiation: If one side has a better idea than a plain
>>    pipe, we will want to use that.
>>
>> - CHECK_DEVICE_STATE: After the state has been transferred through the
>>    pipe (the end indicated by EOF), the front-end invokes this function
>>    to verify success.  There is no in-band way (through the pipe) to
>>    indicate failure, so we need to check explicitly.
>>
>> Once the transfer pipe has been established via SET_DEVICE_STATE_FD
>> (which includes establishing the direction of transfer and migration
>> phase), the sending side writes its data into the pipe, and the reading
>> side reads it until it sees an EOF.  Then, the front-end will check for
>> success via CHECK_DEVICE_STATE, which on the destination side includes
>> checking for integrity (i.e. errors during deserialization).
>>
>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
>> ---
>>   include/hw/virtio/vhost-backend.h |  24 +++++
>>   include/hw/virtio/vhost.h         |  79 ++++++++++++++++
>>   hw/virtio/vhost-user.c            | 147 ++++++++++++++++++++++++++++++
>>   hw/virtio/vhost.c                 |  37 ++++++++
>>   4 files changed, 287 insertions(+)

[...]

>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>> index 2fe02ed5d4..29449e0fe2 100644
>> --- a/include/hw/virtio/vhost.h
>> +++ b/include/hw/virtio/vhost.h
>> @@ -346,4 +346,83 @@ int vhost_dev_set_inflight(struct vhost_dev *dev,

[...]

>> +/**
>> + * vhost_set_device_state_fd(): After transferring state from/to the
> Nitpick: This function doc is for vhost_check_device_state not
> vhost_set_device_state_fd.
>
> Thanks!

Oops, right, thanks!

Hanna

>> + * back-end via vhost_set_device_state_fd(), i.e. once the sending end
>> + * has closed the pipe, inquire the back-end to report any potential
>> + * errors that have occurred on its side.  This allows to sense errors
>> + * like:
>> + * - During outgoing migration, when the source side had already started
>> + *   to produce its state, something went wrong and it failed to finish
>> + * - During incoming migration, when the received state is somehow
>> + *   invalid and cannot be processed by the back-end
>> + *
>> + * @dev: The vhost device
>> + * @errp: Potential error description
>> + *
>> + * Returns 0 when the back-end reports successful state transfer and
>> + * processing, and -errno when an error occurred somewhere.
>> + */
>> +int vhost_check_device_state(struct vhost_dev *dev, Error **errp);
>> +


