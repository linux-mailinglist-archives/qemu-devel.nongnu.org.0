Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5543F46BB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 10:39:57 +0200 (CEST)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5Uq-0006Dk-4a
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 04:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mI5Tl-0005ZV-5P
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mI5Ti-00077Z-OV
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629707925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wtePJUUuMxixOgqdNTrZMYvhI6FknwZO/iFyo2Zm1qI=;
 b=gnXD7tcC27WuJfRYngPmAcDLq0ksDb7HJSdSpA63mZtPEUiogz0ZJMEAGmXDKaGwRmofrY
 D6f1gqrUaJq3kx6DjWA18iHPgcuuY95D/LYuIkAPfuoYi6FiXzstr5Ps8BYojidW4BJC1a
 8U8/l9jsI4++hpGqNP2Ybce7/r6e55k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-2oLpNaCjPquolX1uwVEr-g-1; Mon, 23 Aug 2021 04:38:43 -0400
X-MC-Unique: 2oLpNaCjPquolX1uwVEr-g-1
Received: by mail-wm1-f72.google.com with SMTP id
 201-20020a1c01d2000000b002e72ba822dcso3817982wmb.6
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 01:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wtePJUUuMxixOgqdNTrZMYvhI6FknwZO/iFyo2Zm1qI=;
 b=Dg9yzvhw1ltc19QCB+LZJHMX7F+5OmnpdJ02QjLjJRBxJzRnDv2F9U4VWfaSGftsSN
 yjSIRi0wRhgncGDdkvAdKTSBh21rCJTSD5+Dsq39r5yI0qUFZ46UhXDMqmdcPDcnUQmi
 /RKaV5XfZmq0vBCYZASMQtHBq7FhcemxW1tzKyKHGn+kGuOe57jcddL6hfl/zN6RpXgr
 YOECfb7wQ2id9iqR1F5RywG+hdjUWXT5zyJuTqlVu4dl+yW8alH8oEwQQIH/zVQwy7wf
 OVMfovMI23Itv5K+SGOosx2/v9e30V1B/U9IqLvdxcoo0C3i6A52vlP6OFWX9BjCB+nT
 UwFA==
X-Gm-Message-State: AOAM533uwMb/pdGgFRrHPfjmxH5WqdGPzz6LI9OvRw6nGovAVvasCm+7
 Jq5s+sP5TuWymDLd3CEFLWg0Msghysu8q8i9g3A/xYkrtlKMj/yO3aXqB05amyAxCPjvZw918G2
 Wl/Jrr7t4yaRv1NA=
X-Received: by 2002:a05:600c:a49:: with SMTP id
 c9mr14730165wmq.159.1629707921863; 
 Mon, 23 Aug 2021 01:38:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyT8ReJEN3fBVufFCal8pn57tGS8YJaYnrGLHmxAEGZlCa4rBBLwWkITXqWh1CHEwu+eiaZg==
X-Received: by 2002:a05:600c:a49:: with SMTP id
 c9mr14730151wmq.159.1629707921674; 
 Mon, 23 Aug 2021 01:38:41 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id l2sm12469826wme.28.2021.08.23.01.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 01:38:41 -0700 (PDT)
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210820155211.3153137-1-philmd@redhat.com>
 <20a53e29-ba23-fe0d-f961-63d0b5ca9a89@redhat.com>
 <d68297ca-7be3-48ab-e25c-4f55dc735670@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d3cdb3bb-e05f-f909-1a98-ba45ff9b2b28@redhat.com>
Date: Mon, 23 Aug 2021 10:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d68297ca-7be3-48ab-e25c-4f55dc735670@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.08.21 18:00, Philippe Mathieu-Daudé wrote:
> On 8/20/21 5:53 PM, David Hildenbrand wrote:
>> On 20.08.21 17:52, Philippe Mathieu-Daudé wrote:
>>> When Linux refuses to overcommit a seriously wild allocation we get:
>>>
>>>     $ qemu-system-i386 -m 40000000
>>>     qemu-system-i386: cannot set up guest memory 'pc.ram': Cannot
>>> allocate memory
>>>
>>> Slighly improve the error message, displaying the memory size
>>> requested (in case the user didn't expect unspecified memory size
>>> unit is in MiB):
>>>
>>>     $ qemu-system-i386 -m 40000000
>>>     qemu-system-i386: Cannot set up 38.1 TiB of guest memory 'pc.ram':
>>> Cannot allocate memory
>>>
>>> Reported-by: Bin Meng <bmeng.cn@gmail.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>    softmmu/physmem.c | 4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>> index 2e18947598e..2f300a9e79b 100644
>>> --- a/softmmu/physmem.c
>>> +++ b/softmmu/physmem.c
>>> @@ -1982,8 +1982,10 @@ static void ram_block_add(RAMBlock *new_block,
>>> Error **errp)
>>>                                                     
>>> &new_block->mr->align,
>>>                                                      shared, noreserve);
>>>                if (!new_block->host) {
>>> +                g_autofree char *size_s =
>>> size_to_str(new_block->max_length);
>>>                    error_setg_errno(errp, errno,
>>> -                                 "cannot set up guest memory '%s'",
>>> +                                 "Cannot set up %s of guest memory
>>> '%s'",
>>> +                                 size_s,
>>>                                     memory_region_name(new_block->mr));
>>>                    qemu_mutex_unlock_ramlist();
>>>                    return;
>>>
>>
>> IIRC, ram blocks might not necessarily be used for guest memory ... or
>> is my memory wrong?
> 
> No clue, this error message was already here.
> 
> No problem to change s/guest/block/ although.

We should probably just adjust that as well (separate patch) ... but 
your patch subject also mentions "guest memory".

Not opposed to printing the size, although I doubt that it will really 
stop similar questions/problems getting raised.

-- 
Thanks,

David / dhildenb


