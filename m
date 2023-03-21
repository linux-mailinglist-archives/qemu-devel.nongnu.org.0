Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E26C38A4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 18:51:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peg7V-0007km-Sx; Tue, 21 Mar 2023 13:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1peg7R-0007kb-5z
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 13:49:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1peg7O-0002ts-RC
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 13:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679420993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dzz2Z+1TdPeFVtZ6egWKYMEt/87p2y8B3kK4Qzb/9+4=;
 b=PnOKGSywzfDW2hByG+lCP4YMBb5c2P6M9dtEiS3D6/E40vn5ib7BrdIKcVRVefrTHryOqs
 y0Kjj6vjjgWd0o4YnRXJ5fRX7++iEY5erGvVInb3NvULjairKejIRuWO9uuHegFaI4XO8u
 bq0Gw/YP5aHXgVgy3Bjly0daQhieQQQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-wv38QXolO96xKM_i1mEM8g-1; Tue, 21 Mar 2023 13:49:51 -0400
X-MC-Unique: wv38QXolO96xKM_i1mEM8g-1
Received: by mail-ed1-f70.google.com with SMTP id
 f15-20020a50a6cf000000b0050050d2326aso13815435edc.18
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 10:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679420990;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dzz2Z+1TdPeFVtZ6egWKYMEt/87p2y8B3kK4Qzb/9+4=;
 b=lU48Rjq4I9pWSdwtV6DHCjkFBiCmav9yFOEPoBNSUNfV080Dk2fVfeIgzhKhxVgPbP
 pHYA/wDrDaT8YXEdNuygE2MHttvFG9ncplJKwpRgxnKmujrr35ctZstlMM2g/+9tZNjA
 eNfTpUXQzwqgNmSs6o8v8e68+Ie6sncFWVPE0okvuNud9tr7GbhldzVY5TYLwPXshIRd
 JAG+s8LBQr0+gqoWpfzMf8fi70KwL9+e4oghATTpJb/qsqGcoS01Y6YPZEOUIhFgKS+Y
 x046GSFP8gJlsmn1V4WXb1TSUhZjF3AQtV04ooqAC83D5AFElggWN5D96o0dwPIEO4pu
 xKNQ==
X-Gm-Message-State: AO0yUKVrKXzNu4630qOO/iMVpnMkt3sDEn2+Zm+SFVz89CvK05KahvT9
 lutwW5olk4fV/XP5J746vKNTVz19B+wDnUNxNoSZQD0zEjR8rm4xkEG0M4bw88YF0o7v4yT0E/7
 kLZ+8R6uBmsLfnxY=
X-Received: by 2002:a17:906:950f:b0:930:21a:c80 with SMTP id
 u15-20020a170906950f00b00930021a0c80mr3643491ejx.47.1679420990369; 
 Tue, 21 Mar 2023 10:49:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set8XR9u2qKn27sIkyoLLREKSSxcJXhDKEdz/ym8bsxNtoqWeze9Gy/ezz68fMZylXntOTnjLBA==
X-Received: by 2002:a17:906:950f:b0:930:21a:c80 with SMTP id
 u15-20020a170906950f00b00930021a0c80mr3643476ejx.47.1679420989981; 
 Tue, 21 Mar 2023 10:49:49 -0700 (PDT)
Received: from ?IPV6:2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93?
 (p200300cfd72bb3c384eccc633ddf7d93.dip0.t-ipconnect.de.
 [2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a17090626c400b00924916f9c21sm6031137ejc.87.2023.03.21.10.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 10:49:49 -0700 (PDT)
Message-ID: <ed4deff4-b4d5-aa29-c427-1a4b9023f796@redhat.com>
Date: Tue, 21 Mar 2023 18:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Virtio-fs] [RFC 2/2] vhost-user-fs: Implement stateful migration
Content-Language: en-US
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: virtio-fs@redhat.com, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20230313174833.28790-1-hreitz@redhat.com>
 <20230313174833.28790-3-hreitz@redhat.com>
 <035ba8d3-7943-ae8d-f4b2-76ac4fd74cf0@yandex-team.ru>
 <6892623a-f761-c334-b0a3-891a83e65125@redhat.com>
 <172b000e-1776-f98e-6e22-3e805de2e8d4@yandex-team.ru>
 <85b7d10f-6846-066c-026f-ce75850846f4@redhat.com>
 <06ffc2ce-8cec-139e-9c46-a6c62acb75b6@yandex-team.ru>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <06ffc2ce-8cec-139e-9c46-a6c62acb75b6@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 20.03.23 13:39, Anton Kuchin wrote:
> On 20/03/2023 11:33, Hanna Czenczek wrote:
>> On 17.03.23 19:37, Anton Kuchin wrote:
>>> On 17/03/2023 19:52, Hanna Czenczek wrote:
>>>> On 17.03.23 18:19, Anton Kuchin wrote:
>>>>> On 13/03/2023 19:48, Hanna Czenczek wrote:
>>>>>> A virtio-fs device's VM state consists of:
>>>>>> - the virtio device (vring) state (VMSTATE_VIRTIO_DEVICE)
>>>>>> - the back-end's (virtiofsd's) internal state
>>>>>>
>>>>>> We get/set the latter via the new vhost-user operations 
>>>>>> FS_SET_STATE_FD,
>>>>>> FS_GET_STATE, and FS_SET_STATE.
>>>>>>
>>
>> [...]
>>
>>>>>>   static const VMStateDescription vuf_vmstate = {
>>>>>>       .name = "vhost-user-fs",
>>>>>> -    .unmigratable = 1,
>>>>>> +    .version_id = 1,
>>>>>> +    .fields = (VMStateField[]) {
>>>>>> +        VMSTATE_VIRTIO_DEVICE,
>>>>>> +        {
>>>>>> +            .name = "back-end",
>>>>>> +            .info = &(const VMStateInfo) {
>>>>>> +                .name = "virtio-fs back-end state",
>>>>>> +                .get = vuf_load_state,
>>>>>> +                .put = vuf_save_state,
>>>>>> +            },
>>>>>> +        },
>>>>>
>>>>> I've been working on stateless migration patch [1] and there was 
>>>>> discussed that we
>>>>> need to keep some kind of blocker by default if orchestrators rely 
>>>>> on unmigratable
>>>>> field in virtio-fs vmstate to block the migration.
>>>>> For this purpose I've implemented flag that selects "none" or 
>>>>> "external" and is checked
>>>>> in pre_save, so it could be extended with "internal" option.
>>>>> We didn't come to conclusion if we also need to check incoming 
>>>>> migration, the discussion
>>>>> has stopped for a while but I'm going back to it now.
>>>>>
>>>>> I would appreciate if you have time to take a look at the 
>>>>> discussion and consider the idea
>>>>> proposed there to store internal state as a subsection of vmstate 
>>>>> to make it as an option
>>>>> but not mandatory.
>>>>>
>>>>> [1] 
>>>>> https://patchew.org/QEMU/20230217170038.1273710-1-antonkuchin@yandex-team.ru/
>>>>
>>>> So far I’ve mostly considered these issues orthogonal.  If your 
>>>> stateless migration goes in first, then state is optional and I’ll 
>>>> adjust this series.
>>>> If stateful migration goes in first, then your series can simply 
>>>> make state optional by introducing the external option, no?
>>>
>>> Not really. State can be easily extended by subsections but not 
>>> trimmed. Maybe this can be worked around by defining two types of 
>>> vmstate and selecting the correct one at migration, but I'm not sure.
>>
>> I thought your patch included a switch on the vhost-user-fs device 
>> (on the qemu side) to tell qemu what migration data to expect. Can we 
>> not transfer a 0-length state for 'external', and assert this on the 
>> destination side?
>
> Looks like I really need to make the description of my patch and the 
> documentation more clear :) My patch proposes switch on _source_ side 
> to select which data to save in the stream mostly to protect old 
> orchestrators that don't expect virtio-fs to be migratable (and for 
> internal case it can be extended to select if qemu needs to request 
> state from backend), Michael insists that we also need to check on 
> destination but I disagree because I believe that we can figure this 
> out from stream data without additional device flags.
>
>>
>>>>
>>>> But maybe we could also consider making stateless migration a 
>>>> special case of stateful migration; if we had stateful migration, 
>>>> can’t we just implement stateless migration by telling virtiofsd 
>>>> that it should submit a special “I have no state” pseudo-state, 
>>>> i.e. by having a switch on virtiofsd instead?
>>>
>>> Sure. Backend can send empty state (as your patch treats 0 length as 
>>> a valid response and not error) or dummy state that can be 
>>> recognized as stateless. The only potential problem is that then we 
>>> need support in backend for new commands even to return dummy state, 
>>> and if backend can support both types then we'll need some switch in 
>>> backend to reply with real or empty state.
>>
>> Yes, exactly.
>>
>>>>
>>>> Off the top of my head, some downsides of that approach would be
>>>> (1) it’d need a switch on the virtiofsd side, not on the qemu side 
>>>> (not sure if that’s a downside, but a difference for sure),
>>>
>>> Why would you? It seems to me that this affects only how qemu treats 
>>> the vmstate of device. If the state was requested backend sends it 
>>> to qemu. If state subsection is present in stream qemu sends it to 
>>> the backend for loading. Stateless one just doesn't request state 
>>> from the backend. Or am I missing something?
>>>
>>>> and (2) we’d need at least some support for this on the virtiofsd 
>>>> side, i.e. practically can’t come quicker than stateful migration 
>>>> support.
>>>
>>> Not much, essentially this is just a reconnect. I've sent a draft of 
>>> a reconnect patch for old C-virtiofsd, for rust version it takes 
>>> much longer because I'm learning rust and I'm not really good at it 
>>> yet.
>>
>> I meant these two downsides not for your proposal, but instead if we 
>> implemented stateless migration only in the back-end; i.e. the 
>> front-end would only implement stateful migration, and the back-end 
>> would send and accept an empty state.
>>
>> Then, qemu would always request a “state” (even if it turns out empty 
>> for stateless migration), and qemu would always treat it the same, so 
>> there wouldn’t be a switch on the qemu side, but only on the 
>> virtiofsd side.  Doesn’t really matter, but what does matter is that 
>> we’d need to implement the migration interface in virtiofsd, even if 
>> in the end no state is transferred.
>>
>> So exactly what you’ve said above (“The only potential problem is 
>> […]”). :)
>>
>> Hanna
>>
>
> Oh, yes, we were talking about the same thing. So do you agree that 
> storing internal state data in subsection will allow backend code to 
> be more straightforward without additional switches?

Sounds good.  I think we should rename VHOST_USER_MIGRATION_TYPE_NONE to 
..._INTERNAL, though, and then use that (default) mode for stateful 
migration (via VMState), because I think that should be the default 
migration type (and while there’s no support for it, it will just 
continue to block migration).

So I suppose you mean something like this, where 
vuf_stateful_migration() basically returns `fs->migration_type == 
VHOST_USER_MIGRATION_TYPE_INTERNAL`, and on the destination, you’d check 
whether the subsection is present to decide which kind of migration it 
is, right?

static const VMStateDescription vuf_backend_vmstate;

static const VMStateDescription vuf_vmstate = {
     .name = "vhost-user-fs",
     .version_id = 0,
     .fields = (VMStateField[]) {
         VMSTATE_VIRTIO_DEVICE,
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription*[]) {
         &vuf_backend_vmstate,
         NULL,
     }
};

static const VMStateDescription vuf_backend_vmstate = {
     .name = "vhost-user-fs-backend",
     .version_id = 0,
     .needed = vuf_stateful_migration,
     .fields = (VMStateField[]) {
         {
             .name = "back-end",
             .info = &(const VMStateInfo) {
                 .name = "virtio-fs back-end state",
                 .get = vuf_load_state,
                 .put = vuf_save_state,
             },
         },
         VMSTATE_END_OF_LIST()
     },
};


