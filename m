Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0586D6C0D5E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 10:33:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peBtV-0008HC-EL; Mon, 20 Mar 2023 05:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1peBtR-0008FW-3j
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:33:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1peBtO-0001Ql-Ou
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679304804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xl5li1NS160qnbKOGow7ImwU6J257vxW12OlFGRsw64=;
 b=KUrOptqWEcl+RU9bpzt3hJEV8kz5p7FdOujE1fWwbQFCXtK864uSzM3TxnH3legh64gpiO
 BfbwoED3qmfvws8ECr/NXMG7THcIZyOAs3jblkLfNo37XMEL+7KXyJJlpdUjh6xHbHX7Uu
 TkYtNv8PGOMMsOUgAPa/pHiUGgqcZwA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-tq57myo7PV28eoRtV06eAg-1; Mon, 20 Mar 2023 05:33:21 -0400
X-MC-Unique: tq57myo7PV28eoRtV06eAg-1
Received: by mail-ed1-f72.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so16749236edb.21
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 02:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679304801;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xl5li1NS160qnbKOGow7ImwU6J257vxW12OlFGRsw64=;
 b=4wvQ92EgZZek3ZXe++zZrgjbsuac6MjJCjFTw4OX6dP3trxXAuAzvhEWOKVzEZzAkh
 kLwzJlVF+M+kW2PJbKHXcPM33qcY1pej42Va84tYznmsgEFayzm8gKsn+w4dFN2UuYEV
 bbR6xxZvKsFI2KXfJYNBaUVHQTw9bWy2WITiabXB6WLFwP1jm6/HRYPltiluarOVfDke
 tmk9uARVOEeZBOi56a122BE8hgZvmwoZ4Iy7/Aec7oC+IIX8rHoPOaz475PTPRwJKOKS
 hiMZ79W7716ffySWUNN80Vo/43Et2Pvka3sytUW5g2xrm++bZ2pma+jptXBwJtDncsLU
 fW0w==
X-Gm-Message-State: AO0yUKWyVY+pbcPiHoUVQEOImkoIXHukM43NBi2msJsOsAwYPFMqkP4q
 U5iuUgvwaXzj7Fq8SiPYUWdiCEfGsTa5zMhUTKBUXhZzx3f0tbwGCFiyF9Lwo7FIM5jtZplR25T
 WMg564F7/R1eOOxY=
X-Received: by 2002:a17:906:36d3:b0:932:4378:b237 with SMTP id
 b19-20020a17090636d300b009324378b237mr8170346ejc.77.1679304800836; 
 Mon, 20 Mar 2023 02:33:20 -0700 (PDT)
X-Google-Smtp-Source: AK7set86V+37QM+veUvAKYQv3mxAZAhFwa9brmXu+7i+bakIt5AJ15HaWEjplfymP7Lt3GIC1KGO0A==
X-Received: by 2002:a17:906:36d3:b0:932:4378:b237 with SMTP id
 b19-20020a17090636d300b009324378b237mr8170331ejc.77.1679304800467; 
 Mon, 20 Mar 2023 02:33:20 -0700 (PDT)
Received: from ?IPV6:2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93?
 (p200300cfd72bb3c384eccc633ddf7d93.dip0.t-ipconnect.de.
 [2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a50d506000000b004fd2aab4953sm4614422edi.45.2023.03.20.02.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 02:33:19 -0700 (PDT)
Message-ID: <85b7d10f-6846-066c-026f-ce75850846f4@redhat.com>
Date: Mon, 20 Mar 2023 10:33:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Virtio-fs] [RFC 2/2] vhost-user-fs: Implement stateful migration
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: virtio-fs@redhat.com, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20230313174833.28790-1-hreitz@redhat.com>
 <20230313174833.28790-3-hreitz@redhat.com>
 <035ba8d3-7943-ae8d-f4b2-76ac4fd74cf0@yandex-team.ru>
 <6892623a-f761-c334-b0a3-891a83e65125@redhat.com>
 <172b000e-1776-f98e-6e22-3e805de2e8d4@yandex-team.ru>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <172b000e-1776-f98e-6e22-3e805de2e8d4@yandex-team.ru>
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

On 17.03.23 19:37, Anton Kuchin wrote:
> On 17/03/2023 19:52, Hanna Czenczek wrote:
>> On 17.03.23 18:19, Anton Kuchin wrote:
>>> On 13/03/2023 19:48, Hanna Czenczek wrote:
>>>> A virtio-fs device's VM state consists of:
>>>> - the virtio device (vring) state (VMSTATE_VIRTIO_DEVICE)
>>>> - the back-end's (virtiofsd's) internal state
>>>>
>>>> We get/set the latter via the new vhost-user operations 
>>>> FS_SET_STATE_FD,
>>>> FS_GET_STATE, and FS_SET_STATE.
>>>>

[...]

>>>>   static const VMStateDescription vuf_vmstate = {
>>>>       .name = "vhost-user-fs",
>>>> -    .unmigratable = 1,
>>>> +    .version_id = 1,
>>>> +    .fields = (VMStateField[]) {
>>>> +        VMSTATE_VIRTIO_DEVICE,
>>>> +        {
>>>> +            .name = "back-end",
>>>> +            .info = &(const VMStateInfo) {
>>>> +                .name = "virtio-fs back-end state",
>>>> +                .get = vuf_load_state,
>>>> +                .put = vuf_save_state,
>>>> +            },
>>>> +        },
>>>
>>> I've been working on stateless migration patch [1] and there was 
>>> discussed that we
>>> need to keep some kind of blocker by default if orchestrators rely 
>>> on unmigratable
>>> field in virtio-fs vmstate to block the migration.
>>> For this purpose I've implemented flag that selects "none" or 
>>> "external" and is checked
>>> in pre_save, so it could be extended with "internal" option.
>>> We didn't come to conclusion if we also need to check incoming 
>>> migration, the discussion
>>> has stopped for a while but I'm going back to it now.
>>>
>>> I would appreciate if you have time to take a look at the discussion 
>>> and consider the idea
>>> proposed there to store internal state as a subsection of vmstate to 
>>> make it as an option
>>> but not mandatory.
>>>
>>> [1] 
>>> https://patchew.org/QEMU/20230217170038.1273710-1-antonkuchin@yandex-team.ru/
>>
>> So far I’ve mostly considered these issues orthogonal.  If your 
>> stateless migration goes in first, then state is optional and I’ll 
>> adjust this series.
>> If stateful migration goes in first, then your series can simply make 
>> state optional by introducing the external option, no?
>
> Not really. State can be easily extended by subsections but not 
> trimmed. Maybe this can be worked around by defining two types of 
> vmstate and selecting the correct one at migration, but I'm not sure.

I thought your patch included a switch on the vhost-user-fs device (on 
the qemu side) to tell qemu what migration data to expect.  Can we not 
transfer a 0-length state for 'external', and assert this on the 
destination side?

>>
>> But maybe we could also consider making stateless migration a special 
>> case of stateful migration; if we had stateful migration, can’t we 
>> just implement stateless migration by telling virtiofsd that it 
>> should submit a special “I have no state” pseudo-state, i.e. by 
>> having a switch on virtiofsd instead?
>
> Sure. Backend can send empty state (as your patch treats 0 length as a 
> valid response and not error) or dummy state that can be recognized as 
> stateless. The only potential problem is that then we need support in 
> backend for new commands even to return dummy state, and if backend 
> can support both types then we'll need some switch in backend to reply 
> with real or empty state.

Yes, exactly.

>>
>> Off the top of my head, some downsides of that approach would be
>> (1) it’d need a switch on the virtiofsd side, not on the qemu side 
>> (not sure if that’s a downside, but a difference for sure),
>
> Why would you? It seems to me that this affects only how qemu treats 
> the vmstate of device. If the state was requested backend sends it to 
> qemu. If state subsection is present in stream qemu sends it to the 
> backend for loading. Stateless one just doesn't request state from the 
> backend. Or am I missing something?
>
>> and (2) we’d need at least some support for this on the virtiofsd 
>> side, i.e. practically can’t come quicker than stateful migration 
>> support.
>
> Not much, essentially this is just a reconnect. I've sent a draft of a 
> reconnect patch for old C-virtiofsd, for rust version it takes much 
> longer because I'm learning rust and I'm not really good at it yet.

I meant these two downsides not for your proposal, but instead if we 
implemented stateless migration only in the back-end; i.e. the front-end 
would only implement stateful migration, and the back-end would send and 
accept an empty state.

Then, qemu would always request a “state” (even if it turns out empty 
for stateless migration), and qemu would always treat it the same, so 
there wouldn’t be a switch on the qemu side, but only on the virtiofsd 
side.  Doesn’t really matter, but what does matter is that we’d need to 
implement the migration interface in virtiofsd, even if in the end no 
state is transferred.

So exactly what you’ve said above (“The only potential problem is […]”). :)

Hanna


