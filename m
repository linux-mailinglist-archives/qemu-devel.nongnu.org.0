Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4466922FA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:09:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVwp-0002R4-RX; Fri, 10 Feb 2023 11:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQVwo-0002Qu-6L
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:08:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQVwm-0002lj-0b
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676045302;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Gf+jPtx7jFsKtqKoK//9S9ks3q94ICaKgoZoVqdelGg=;
 b=PDQd212ZNir3Yen1evseHpkRHRVPsdvo9pC2B5BTO3Jum+fPEHIhUa5/h4lOcd/xkzAQbT
 WJ9Lgu2xFw53npR/S/+ZE4y/3P+OD/OlH2oiNm3XRXFOZ5YbmubN/3PDY2NlTE/YlRpqHI
 MyqKK/Zo7XGJbgWBdLrwE7ti+SlTWxQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-519-_UUJxzBROlSGsGzwfAkexg-1; Fri, 10 Feb 2023 11:08:19 -0500
X-MC-Unique: _UUJxzBROlSGsGzwfAkexg-1
Received: by mail-wr1-f71.google.com with SMTP id
 b13-20020a5d4d8d000000b002c457ce3c9bso1386822wru.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gf+jPtx7jFsKtqKoK//9S9ks3q94ICaKgoZoVqdelGg=;
 b=4Z344SE05489Y+gLHdPY92iBwv+RMxXVRTMmYhCc0y1i1CxiYDeJsIsqeml1TNK2s2
 R7oH6eWwTHUQXL6WoK+xSUB4313Kn9jJ0zxdDLeu4qdyhEDtBijUNuOmlBWYBJTOagf7
 BoUyIONcQQn+BH5Q3aNimgHOG4U2RLszt/VzxOAQ+yuKZoj6Jw471S9WfUxc2qdiwtsO
 R1W4ts/T4PCxhKHlSGgB0TLg3OJhXoVh0h0FX93FuiJO1Oi2WMpDfbNwowrMOmv/mAVn
 SHMNPPiISviOC6xZy2TCQBUqfUKpmQe3OdWSnRcxzXTX1WwjHWJe+ARed4RVKO9jiDWv
 XSWg==
X-Gm-Message-State: AO0yUKX9c7r5KcewjQHBSmN9poXIYBfiBzbK1E7NXwwM1uWvkuD3ji7a
 JJBNUX5BodBQno0xCCvZodpuDQL2eW7j8fCMQWBRNVUyGsHEBThfwCKCrleOAEj2t030fWlB63B
 BTojX5tSsz6X5MF4=
X-Received: by 2002:a5d:595f:0:b0:2c3:9851:e644 with SMTP id
 e31-20020a5d595f000000b002c39851e644mr13322630wri.63.1676045298697; 
 Fri, 10 Feb 2023 08:08:18 -0800 (PST)
X-Google-Smtp-Source: AK7set/PGAQijvyXyMVxxiuQN1oZiZSorQ99sChQ9Vrj3iEKW/C1uwgibXytnq5bIJdHMEgSEWs4uA==
X-Received: by 2002:a5d:595f:0:b0:2c3:9851:e644 with SMTP id
 e31-20020a5d595f000000b002c39851e644mr13322606wri.63.1676045298460; 
 Fri, 10 Feb 2023 08:08:18 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b003da28dfdedcsm6215788wmq.5.2023.02.10.08.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 08:08:17 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,  qemu-devel@nongnu.org,
 virtio-fs@redhat.com,  Markus Armbruster <armbru@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,  yc-core@yandex-team.ru,  "Michael
 S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
In-Reply-To: <626f6e7c-07e4-4aa7-3cce-b96d9fd96d33@yandex-team.ru> (Anton
 Kuchin's message of "Fri, 10 Feb 2023 16:09:23 +0200")
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <CAJSP0QVKUKgkBMw1PiN8-L8Ykhq=gfvNTTs4sf1tuzoqHu+GXw@mail.gmail.com>
 <0d57cc40-693b-b36c-a135-fdac60dd00ec@yandex-team.ru>
 <CAJSP0QUXB0kgsCSsmi8dpnJFYho2cR_2Liep=pGmp6WzDZ_7pw@mail.gmail.com>
 <d6bf0b9a-a167-817d-2c17-c2e472961155@yandex-team.ru>
 <CAJSP0QXXe6KgLN2PJvi-5GqcELhUKJPB2pUARL2ktO9TQYAq=g@mail.gmail.com>
 <2fb6efb4-9155-99ad-3acd-c274783436ed@yandex-team.ru>
 <87h6w5ea1m.fsf@secure.mitica>
 <ed9832ec-eaf0-68a4-b7c1-9f1691ab149e@yandex-team.ru>
 <874js4v151.fsf@secure.mitica>
 <626f6e7c-07e4-4aa7-3cce-b96d9fd96d33@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 10 Feb 2023 17:08:16 +0100
Message-ID: <87mt5ly03z.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
> On 02/02/2023 11:59, Juan Quintela wrote:
>> Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>> On 01/02/2023 16:26, Juan Quintela wrote:
>>>> Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>>>> On 19/01/2023 18:02, Stefan Hajnoczi wrote:
>>>>>> On Thu, 19 Jan 2023 at 10:29, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>>>>>> On 19/01/2023 16:30, Stefan Hajnoczi wrote:
>>>>>>>> On Thu, 19 Jan 2023 at 07:43, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>>>>>>>> On 18/01/2023 17:52, Stefan Hajnoczi wrote:
>>>>>>>>>> On Sun, 15 Jan 2023 at 12:21, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>>> Once told that, I think that you are making your live harder in the
>>>> future when you add the other migratable devices.
>>>>
>>>> static const VMStateDescription vuf_vmstate = {
>>>>       .name = "vhost-user-fs",
>>>>       .minimum_version_id = 0,
>>>>       .version_id = 0,
>>>>       .fields = (VMStateField[]) {
>>>>           VMSTATE_INT8(migration_type, struct VHostUserFS),
>>>>           VMSTATE_VIRTIO_DEVICE,
>>>>           VMSTATE_END_OF_LIST()
>>>>       },
>>>>       .pre_save = vhost_user_fs_pre_save,
>>>>       .subsections = (const VMStateDescription*[]) {
>>>>           &vmstate_vhost_user_fs_internal_sub,
>>>>           NULL
>>>>       }
>>>> };
>>>>
>>>> And you are done.
>>>>
>>>> I will propose to use a property to set migration_type, but I didn't
>>>> want to write the code right now.
>
> I have a little problem with implementation here and need an advice:
>
> Can we make this property adjustable at runtime after device was realized?
> There is a statement in qemu wiki [1] that makes me think this is possible
> but I couldn't find any code for it or example in other devices.
>> "Properties are, by default, locked while the device is
>   realized. Exceptions
>> can be made by the devices themselves in order to implement a way
>   for a user
>> to interact with a device while it is realized."
>
> Or is your idea just to set this property once at construction and keep it
> constant for device lifetime?
>
> [1] https://wiki.qemu.org/Features/QOM

I have no clue here.  Markus?  Stefan?

>>>>
>>>> I think that this proposal will make Stephan happy, and it is just
>>>> adding and extra uint8_t that is helpul to implement everything.
>>> That is exactly the approach I'm trying to implement it right now. Single
>>> flag can be convenient for orchestrator but makes it too hard to account in
>>> all cases for all devices on qemu side without breaking future
>>> compatibility.
>>> So I'm rewriting it with properties.
>> Nice.  That would be my proposal.  Just a bit complicated for a proof of concetp.
>>
>>> BTW do you think each vhost-user device should have its own enum of
>>> migration
>>> types or maybe we could make them common for all device types?
>> I will put it for vhost-user, because as far as I know nobody else is
>> asking for this functionality.
>
> I mean do we need it for all vhost-user devices or only for vhost-user-fs
> that I'm implementing now?

I will put it only for vhost-user-fs, except if there is a central place
that is used for all vhost-user and its easy to put there.

But I don't know enough about vhost-user to know if there is any common
struct to put this.

>> The most similar device that I can think of right now is vfio devices.
>> But they are implemeting callbacks to save hardware device state, and
>> they go device by device, i.e. there is nothing general there.
>>
>> Later, Juan.
>>

Later, Juan.


