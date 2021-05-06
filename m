Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AA437567E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:22:47 +0200 (CEST)
Received: from localhost ([::1]:41440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefpu-00012m-5w
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lefmu-0007Lm-PT
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:19:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lefmr-0008Ah-Bg
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620314376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VKKgN9vR4kr/4AryJ1pyGPzvREntaHqwtVe7qV5BuNs=;
 b=fJfO3EcQFThXtDDO5WArtE3EprjVjE/lVT5uAZ2KWvEZDIlBOXNikf6XiQSXwOyhIdLBGU
 Vvon+FNvZiN2v7AnJvfgpC/cvgnMC4lcd0zk5ZlegsExkF2Wmey0Ortl6jcSEnbWdaZIr4
 z0V9PsdyJ83CtjmZt9dRAcD9oLgxu04=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-F6mMmmphMRq7bS5agR0lKw-1; Thu, 06 May 2021 11:19:35 -0400
X-MC-Unique: F6mMmmphMRq7bS5agR0lKw-1
Received: by mail-wm1-f70.google.com with SMTP id
 s66-20020a1ca9450000b0290149fce15f03so2778824wme.9
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 08:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VKKgN9vR4kr/4AryJ1pyGPzvREntaHqwtVe7qV5BuNs=;
 b=DNGgk4ucHY2AVBCeo/RA8hBBUvZhgz9AXOLd5RHNAHuQc9EO2QTCEDZQADx9Atu01p
 CRDcR1GrbfYF03fpA6QL01rFRjhDB4B/ykotUUIAVkPTAvme3WGeXAy6hgGFlbB9rsfO
 hUxotFekbyFjbAQcXrptazYWsc3CYQHT9FZKJrtPv7EwTh/g1AeDxjLeOgQqTzBoh25N
 vv+i6qItik2tQosCziGYnUoFexjEvjEdpBE4snr8lLL/p9DSsGsAHvMFAwpbvgoGyUeg
 +uXy14JTG4OZUp2rPhR7x9+90gSlHhUtIEtIG2h28EIT2BCtZRHjmfBJ7e5R1NzRUuaY
 4t7w==
X-Gm-Message-State: AOAM5339KjClh6E48m2EUEAirxtlWh72JU7dP0F02QQY1TDnSKpgcTmA
 tcx+EXMNfwrN16QdDSer+FGn4q0baa0OCS13HMrCHWp5vJU3OZwKDSqTJWzOTtzbeAnxJ18PZty
 4oq8GaFCfRygsGao=
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr5877725wrv.239.1620314373887; 
 Thu, 06 May 2021 08:19:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3/OXKu/+VYeOPvgv18GYTo3Sekg/B2vq8ClwRPtnN+XlpUgTKY9COuRgml/zdiqnUeH7XRw==
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr5877694wrv.239.1620314373682; 
 Thu, 06 May 2021 08:19:33 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id l22sm9771373wmq.28.2021.05.06.08.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 08:19:33 -0700 (PDT)
Subject: Re: [PATCH 06/23] hw/block/dataplane/virtio-blk: Avoid dynamic stack
 allocation
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-7-philmd@redhat.com>
 <YJOuesiuqgQugO+Q@stefanha-x1.localdomain>
 <124ddeb2-ca4a-c551-19ad-d1125451226f@redhat.com>
 <YJQBd+lnvQnbK0XH@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5356dd0d-c60a-5b37-46d9-1ddef039a8ab@redhat.com>
Date: Thu, 6 May 2021 17:19:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJQBd+lnvQnbK0XH@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 4:47 PM, Stefan Hajnoczi wrote:
> On Thu, May 06, 2021 at 11:01:47AM +0200, Philippe Mathieu-Daudé wrote:
>> On 5/6/21 10:53 AM, Stefan Hajnoczi wrote:
>>> On Wed, May 05, 2021 at 11:10:30PM +0200, Philippe Mathieu-Daudé wrote:
>>>> Use autofree heap allocation instead of variable-length
>>>> array on the stack.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  hw/block/dataplane/virtio-blk.c | 7 ++++---
>>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> Why?
>>
>> The motivation behind removing all variable-length allocations
>> (and adding CPPFLAG+=-Wvla at the end) is to avoid security
>> vulnerabilities such CVE-2021-3527.
> 
> I see. Please mention it in the commit description. There could be other
> reasons for this change, like minimizing stack usage, so I wasn't sure
> why.

Fair enough.

>>> This is a performance-critical code path and BITS_TO_LONGS(nvqs) is
>>> small.
>>
>> OK, having looked better at nvqs, I suppose this is preferred:
>>
>> -- >8 --
>> @@ -60,7 +60,7 @@ static void notify_guest_bh(void *opaque)
>>  {
>>      VirtIOBlockDataPlane *s = opaque;
>>      unsigned nvqs = s->conf->num_queues;
>> -    unsigned long bitmap[BITS_TO_LONGS(nvqs)];
>> +    unsigned long bitmap[BITS_TO_LONGS(VIRTIO_QUEUE_MAX)];
>>      unsigned j;
>>
>>      memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
>> ---
>>
>> Would that work for you?
> 
> It's a little risky since s->batch_notify_vqs does not have
> sizeof(bitmap). That makes uninitialized data and buffer overflows more
> likely. Your example has the bug:
> 
>   memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
>                                       ^^^^^^^^^^^^^^
>   Accesses beyond the end of s->batch_notify_vqs[].

Doh I missed that :/

> Can we eliminate bitmap[] entirely by using bitops.h APIs on
> s->batch_notify_vqs instead?

You meant the bitmap.h API I assume, OK, better idea!

Thanks,

Phil.


