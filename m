Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227974896E2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 12:01:10 +0100 (CET)
Received: from localhost ([::1]:49350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6sQG-0006qO-Oc
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 06:01:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6sOZ-0005vh-GH
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:59:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6sOV-0001WW-Pz
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641812358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vuTYfzt/zrExOGomK9Ykgb/hatF6ywDrGXJi4o2RI8s=;
 b=Vl/ZzErduJU5Jq/AlnOd1HB7ijgct4vxOwGwTGyvxQ3X9QkffbZms0DULAEDeKlJwUNypl
 rQN84DyD91zhBuKtsjjob489w/z43WqjPkrUoThhFcS+V6hEq4zAMUbFrrK9yWgcDkU67d
 7VglCXPCdDuc4dap5FZgQFlDiC33jf0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-vwb-blIXOeyGYKbWYUGR1Q-1; Mon, 10 Jan 2022 05:59:16 -0500
X-MC-Unique: vwb-blIXOeyGYKbWYUGR1Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 o20-20020a056402439400b003f83cf1e472so9809431edc.18
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 02:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=vuTYfzt/zrExOGomK9Ykgb/hatF6ywDrGXJi4o2RI8s=;
 b=M1/Dc+uLl12XsTvISTekZzfUQ2uYrcj2VjRIP+a3OGb7BFaFEtj34kJ0gmCajbgPtz
 gi40AfifEX77NWxqDy75XIr83wzUNwuN6uG820Zhpche3alXMUEfQktSFwsofLwmfZJy
 iNT7ajiRD/2XQKoSOEQ12iMI7oGITSwnNTWCysIqV3HYXg/EVxhaFyyHOt1GloEFs+3J
 5nDsuO63pwXHLa7W+gY3itORwc7XmOOgDyAQn70m/IhnUz6VonM0uOdrQqsYm7TopjIZ
 fHbLkgzEt9VhGLrkOxhud3AoGkob/qoeBNcp/pHFzn1aLOEwOHn3qVa67oss0WXbeTVS
 UBzg==
X-Gm-Message-State: AOAM533AgwJXLTSBly3LZksg8eD03ZH4UX3cpGyNyGq9mL74J6cBkGnH
 HPUVNlkpvUFhUUAeg4+rE8zpQ0+o5msX9KaMilAZmvEjSaGNf4aO9vp6jzcJpoJVKYwuqRknIJo
 2rp4DTbZlJYZId0w=
X-Received: by 2002:a17:906:dc8e:: with SMTP id
 cs14mr3924938ejc.590.1641812355560; 
 Mon, 10 Jan 2022 02:59:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwXVrysiNepn36nT0okpbJCS8rLWYTuSifIIR5cwaWhQa6p+3Q6CqkAYXeRBzdHds99EcuCg==
X-Received: by 2002:a17:906:dc8e:: with SMTP id
 cs14mr3924913ejc.590.1641812355218; 
 Mon, 10 Jan 2022 02:59:15 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:cf00:ac25:f2e3:db05:65c3?
 (p200300cbc701cf00ac25f2e3db0565c3.dip0.t-ipconnect.de.
 [2003:cb:c701:cf00:ac25:f2e3:db05:65c3])
 by smtp.gmail.com with ESMTPSA id o12sm3422383edz.71.2022.01.10.02.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 02:59:14 -0800 (PST)
Message-ID: <cc6bae57-c2d0-327f-7cba-55029727b1ca@redhat.com>
Date: Mon, 10 Jan 2022 11:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>
References: <20211203233404.37313-1-gshan@redhat.com>
 <20211203233404.37313-3-gshan@redhat.com>
 <CAFEAcA8hd000vwp8A602uw4yueea4uU0xttELcC8sn34X+N5-A@mail.gmail.com>
 <3528fa8b-bfa6-2127-dfe6-4135b3b0989f@redhat.com>
 <CAFEAcA_qW9d9ACZFEi+K+yKJMPAESMQyU+O5JLOL934gdXk-Vg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 2/2] hw/arm/virt: Support for virtio-mem-pci
In-Reply-To: <CAFEAcA_qW9d9ACZFEi+K+yKJMPAESMQyU+O5JLOL934gdXk-Vg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: drjones@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 jonathan.cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.01.22 11:50, Peter Maydell wrote:
> On Sat, 8 Jan 2022 at 07:22, Gavin Shan <gshan@redhat.com> wrote:
>>
>> Hi Peter,
>>
>> On 1/8/22 12:40 AM, Peter Maydell wrote:
>>> On Fri, 3 Dec 2021 at 23:34, Gavin Shan <gshan@redhat.com> wrote:
>>>> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
>>>> index b20595a496..21e4d572ab 100644
>>>> --- a/hw/virtio/virtio-mem.c
>>>> +++ b/hw/virtio/virtio-mem.c
>>>> @@ -125,7 +125,7 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
>>>>    * The memory block size corresponds mostly to the section size.
>>>>    *
>>>>    * This allows e.g., to add 20MB with a section size of 128MB on x86_64, and
>>>> - * a section size of 1GB on arm64 (as long as the start address is properly
>>>> + * a section size of 512MB on arm64 (as long as the start address is properly
>>>>    * aligned, similar to ordinary DIMMs).
>>>>    *
>>>>    * We can change this at any time and maybe even make it configurable if
>>>> @@ -134,6 +134,8 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
>>>>    */
>>>>   #if defined(TARGET_X86_64) || defined(TARGET_I386)
>>>>   #define VIRTIO_MEM_USABLE_EXTENT (2 * (128 * MiB))
>>>> +#elif defined(TARGET_ARM)
>>>> +#define VIRTIO_MEM_USABLE_EXTENT (2 * (512 * MiB))
>>>>   #else
>>>>   #error VIRTIO_MEM_USABLE_EXTENT not defined
>>>>   #endif
>>>
>>> Could this comment explain where the 128MB and 512MB come from
>>> and why the value is different for different architectures ?
>>>
>>
>> Yes, the comment already explained it by "section size", which is the
>> minimal hotpluggable unit. It's defined by the linux guest kernel as
>> below. On ARM64, we pick the larger section size without considering
>> the base page size. Besides, the virtio-mem is/will-be enabled on
>> x86_64 and ARM64 guest kernel only.
> 
> Oh, so "section" is a Linux kernel concept? It wasn't clear to me
> that that was a fixed value rather than something we were arbitrarily
> defining in QEMU.

It's somewhat an arbitrary value, as the section size can change in the
future, and there are other memory hotplug granularity restrictions on
some architectures (e.g., x86 with boot memory size of >64GiB can
usually only hotplug in 2 GiB granularity, not 128 MiB granularity). So
what we're doing here is really best-effort for Linux guests we expect.
As the comment states, we can always change that magic value in the
future if there is need to (e.g., increase it to granularity we expect).

If our guesstimate is wrong, the guest won't be able to hotplug all
requested device memory, until we actually increase the requested size
such that it gets again possible for the VM.

We'd be running into similar issues when trying hotplug of a 128MiB DIMM
to an arm64 64k guest: Linux guests can currently only hotplug 512 MiB
granularity in such a setup and smaller DIMMs can simply not be exposed
to the page alloator and remain essentially unusable. But in contrast to
DIMMs, with virtio-mem we can actually detect that the guest cannot make
use of that memory, figure out why, and optimize.

-- 
Thanks,

David / dhildenb


