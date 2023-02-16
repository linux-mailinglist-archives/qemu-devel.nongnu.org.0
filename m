Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11117699A9C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:54:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShWo-0003Cf-LP; Thu, 16 Feb 2023 11:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pShWm-0003CX-Qn
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:54:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pShWk-0006D8-F0
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:54:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676566473;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=x0z3ngKg2xBGltX3Sbu6kHzetshB8oD4CTlR4bejGBg=;
 b=Yk3+PuFcrgog/hXiyJ6N7+wE4F786Kbxx1wYjnusQkGzrOwAGMJjMgsEDba9vf0cr4cFiT
 ZASqCDeCpFQzoArfR1fThpCqGPyRHbDNwGFZahYyQ0NYeHlU2W1hKaS30YGzrEKkqIjtz3
 meW/JxZpvobtfTXKSBrMZ5veKehWUsk=
Received: from mail-wm1-f69.google.com (209.85.128.69 [209.85.128.69]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-441-7m8vE8NiPnOD6qKWXxxkjA-1; Thu,
 16 Feb 2023 11:52:46 -0500
X-MC-Unique: 7m8vE8NiPnOD6qKWXxxkjA-1
Received: by mail-wm1-f69.google.com with SMTP id
 t18-20020a05600c451200b003e1f2de4b2bso3441667wmo.6
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x0z3ngKg2xBGltX3Sbu6kHzetshB8oD4CTlR4bejGBg=;
 b=M7AN6vp8Oh19+puaeub3bP+FYVYfNGjX+Xqk/iEuY+a15Jsf3v5JefAcAQXart/2QR
 LRxS/6HkDsSstv377s0Dk+chPHvwAL9Bx3eBLtJkfM1fStZl2EITQbxz8bJqK3S719SY
 XQRGUWZFDNV+MUxUj8OLHSpr6G9KUhonNFkqOpOiJMZNJ44myJahC59D114QUNOaiAxW
 UiYnecso0l5N7F2CTOO7GhKHYxSC0GW3T3vXTMrq2teRJFQB5TuOAhYvKgQ44DdDAfqG
 IkO5JEmIdACNW+Qo9i9/ce+xWeoSzIDgmmoKY4Szg0+uNLqRADq06A5MjvGTf9ZKeddf
 skBw==
X-Gm-Message-State: AO0yUKVZju1qIaGL1w8N02q0DVvfFcWLQDNnrUUC7P579JI+8mUSreOu
 xMD/yd8JNJM7bRjK5X3zH52n62af0/lsVb8ssdINb9yEiXOXLHyKNMiPCe+fZoQK0pbL8KCeeg+
 wKEScPElapo13pWU=
X-Received: by 2002:a5d:4e82:0:b0:2c5:4add:9e46 with SMTP id
 e2-20020a5d4e82000000b002c54add9e46mr4459140wru.28.1676566355354; 
 Thu, 16 Feb 2023 08:52:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8ZGAgU2F862kzmCLuqHrfrqVEqc5SnHTSkHC2O0pyYm1Im/XOX7kAWht9Ryj41ZK7g5D02wA==
X-Received: by 2002:a5d:4e82:0:b0:2c5:4add:9e46 with SMTP id
 e2-20020a5d4e82000000b002c54add9e46mr4459125wru.28.1676566355014; 
 Thu, 16 Feb 2023 08:52:35 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 z17-20020adfdf91000000b002c4008f0daasm1911716wrl.107.2023.02.16.08.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:52:34 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org,  Alex Williamson <alex.williamson@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Cornelia Huck <cohuck@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,  Yishai
 Hadas <yishaih@nvidia.com>,  Jason Gunthorpe <jgg@nvidia.com>,  Maor
 Gottlieb <maorg@nvidia.com>,  Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>,  Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v11 08/11] vfio/migration: Implement VFIO migration
 protocol v2
In-Reply-To: <93eb428e-543c-8af1-44a7-2b1124a080c0@nvidia.com> (Avihai Horon's
 message of "Thu, 16 Feb 2023 18:40:58 +0200")
References: <20230216143630.25610-1-avihaih@nvidia.com>
 <20230216143630.25610-9-avihaih@nvidia.com>
 <87pma9hazm.fsf@secure.mitica>
 <93eb428e-543c-8af1-44a7-2b1124a080c0@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Feb 2023 17:52:33 +0100
Message-ID: <87edqpft7y.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Avihai Horon <avihaih@nvidia.com> wrote:
> On 16/02/2023 17:43, Juan Quintela wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Avihai Horon <avihaih@nvidia.com> wrote:
>>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>.
>>
>>
>> 1st comment is a bug, but as you just remove it.
>>
>>
>> Not that it matters a lot in the end (you are removing v1 on the
>> following patch).
>>
>>> @@ -438,7 +445,13 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>>>                   return false;
>>>               }
>>>
>>> -            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
>>> +            if (!migration->v2 &&
>>> +                migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
>>> +                continue;
>>> +            }
>> Are you missing here:
>>
>>
>>                 } else {
>>                     return false;
>>                 }
>>
>> Or I am missunderstanding the code.
>
> I think the code is OK:
>
> If the device uses v1 migration and is running, the first if is true
> and we continue.
> If the device uses v1 migration and is not running, the first if is
> false and the second if is false (since the device doesn't use v2
> migration) and we return false.
>
> If the device uses v2 migration and is running, the first if is false
> and the second if is true, so we continue.
> If the device uses v2 migration and is not running, first if is false
> and the second if is false, so we return false.

You win O:-)

I was looking at C level, not at the "semantic" level.

>>
>>         size_t size = DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>>                                   sizeof(struct vfio_device_feature_mig_data_size),
>>                                   sizeof(uint64_t));
>>         g_autofree struct vfio_device_feature *feature = g_malloc0(size * sizeof(uint64_t));
>>
>> I have to reread several times to see what was going on there.
>>
>>
>> And call it a day?
>
> I don't have a strong opinion here.
> We can do whatever you/Alex like more.

I think it is more readable, and we don't put (normally) big chunks in
the stack, but once told that, who wrotes the code has more to say O:-)

Later, Juan.


