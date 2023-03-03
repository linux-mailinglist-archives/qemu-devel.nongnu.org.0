Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451876A9C8E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:59:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8kB-0004vH-Td; Fri, 03 Mar 2023 11:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pY8k7-0004ud-Do
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:58:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pY8k5-0004mN-RT
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677862728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+U9iTWrYqCTEup69rAFqKGfXtAXffBsYRmACvVrbrT4=;
 b=EMEFcB07w+7f0C/GnT5SyXd75+ulnh1bdo7BLNiDTlyQTo3v1qNsXBfAtR2CBJBauiiXz/
 oXgSMh1rbGkenpz4n6A/x5lgfCJbnMJiOeO9SRxsMVgGMRnImk3ex+LoSO8I19DXfzY/pl
 W08ZOs26+SocT+q07cXU/UjU0dLP0GE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-LvqzZ23PNRGC2JDfUI0HUw-1; Fri, 03 Mar 2023 11:58:47 -0500
X-MC-Unique: LvqzZ23PNRGC2JDfUI0HUw-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so1162737wmb.8
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:58:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+U9iTWrYqCTEup69rAFqKGfXtAXffBsYRmACvVrbrT4=;
 b=pIc6+1UvxMknCdALbn19AjfSD77N9CJFzapz6ctG+9OhSuUeYR9vNfN5cQq3SF/g7N
 MjgYo9oMLfSd9nIPC7ZRu3yJ1A7PNu8WHw8dJ+cYd1adJbj7vQws31f7khCKjgZ6Dw2g
 EDcLtAJHbh+LEe4elGxYswgomcGdvRiHXq+iLds+d5mARxmLJGvnhlYS8c5RLuAIvV9Q
 4emDvI9PCt8YIjAVPLMxttUbs+ioT1SkRnpgbSXiQdyQQUpN9Pf9StAm8VAeiV9piLGL
 QzklayGc4GrBKZZEJsh/qiAWAHqkBAr4DqYdMnwYf24G7rh40WjKjX75p77TWLawoYBs
 uqEg==
X-Gm-Message-State: AO0yUKV8DVphgDdOH8PZSsDFRhaTeW6x2z7GmGHVl723cBIlevFY456r
 qeNSzx+UtVjCcLKmNTb16Ce+wzIv3SfyKQO4pYhNXbcTCGNphgqqR7/++AF8fxshfYC0YJHhLiX
 P7XAP3bEc8x0elWI=
X-Received: by 2002:a5d:5410:0:b0:2c7:5ad:9c69 with SMTP id
 g16-20020a5d5410000000b002c705ad9c69mr1419758wrv.71.1677862725905; 
 Fri, 03 Mar 2023 08:58:45 -0800 (PST)
X-Google-Smtp-Source: AK7set967/36GT8l0h/PrK+4pAcIHim16HNK9TfWBuSztSj11NK0gZwl6atJY6RrJ2O3feopONB0+g==
X-Received: by 2002:a5d:5410:0:b0:2c7:5ad:9c69 with SMTP id
 g16-20020a5d5410000000b002c705ad9c69mr1419743wrv.71.1677862725575; 
 Fri, 03 Mar 2023 08:58:45 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:6100:f5c9:50a5:3310:d8ac?
 (p200300cbc7026100f5c950a53310d8ac.dip0.t-ipconnect.de.
 [2003:cb:c702:6100:f5c9:50a5:3310:d8ac])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a5d49c1000000b002c563b124basm2570958wrs.103.2023.03.03.08.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 08:58:44 -0800 (PST)
Message-ID: <3cfb0c17-eb86-c358-0ab2-05b21d2992f8@redhat.com>
Date: Fri, 3 Mar 2023 17:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Chuang Xu <xuchuangxclwt@bytedance.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230225163141.1209368-1-peterx@redhat.com>
 <6c75e2e2-5ba9-bc52-2c6c-a0bfb5f5b56f@redhat.com> <ZAC2ccoQpFLa07ZK@x1n>
 <4f130497-1200-8c42-7d48-cadf54f3f6a4@redhat.com> <ZAEaO7Yqw2F8hbbV@x1n>
 <c4b70513-7cbc-a858-58ed-537c8fe7795e@redhat.com> <ZAIeWjRX08C8MRF0@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH RFC 0/4] memory: Fix (/ Discuss) a few rcu issues
In-Reply-To: <ZAIeWjRX08C8MRF0@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03.03.23 17:20, Peter Xu wrote:
> On Fri, Mar 03, 2023 at 10:10:12AM +0100, David Hildenbrand wrote:
>> On 02.03.23 22:50, Peter Xu wrote:
>>> On Thu, Mar 02, 2023 at 04:11:56PM +0100, David Hildenbrand wrote:
>>>> I guess the main concern here would be overhead from gabbing/releasing the
>>>> BQL very often, and blocking the BQL while we're eventually in the kernel,
>>>> clearing bitmaps, correct?
>>>
>>> More or less yes.  I think it's pretty clear we move on with RCU unless
>>> extremely necessary (which I don't think..), then it's about how to fix the
>>> bug so rcu safety guaranteed.
>>
>> What about an additional simple lock?
>>
>> Like:
>>
>> * register/unregister requires that new notifier lock + BQL
>> * traversing notifiers requires either that new lock or the BQL
> 
> This will work, but this will also brings us backstep a bit.
> 
> I think we shouldn't allow concurrency for notifiers, more below.  It's
> more about sometimes QEMU walking the two lists has nothing to do with
> notifiers (like memory_region_find_rcu), that's the major uncertainty to
> me.  Also on the future plans of using more RCU in QEMU code.
> 
>> We simply take the new lock in that problematic function. That would work as
>> long as we don't require traversal of the notifiers concurrently -- and as
>> long as we have a lot of bouncing back and forth (I don't think we have,
>> even in the migration context, or am I wrong?).
>>
>> That way we also make sure that each notifier is only called once. I'm not
>> 100% sure if all notifiers would expect to be called concurrently.
> 
> Yes I think so.  AFAIU most of the notifiers should only be called with BQL
> then they'll already be serialized (and hooks normally has yet another
> layer of protection like kvm).
> 
> Clear log is something special. Afaik it's protected by RAMState's
> bitmap_mutex so far, but not always..
> 
> The unaccuracy is because clear log can also be triggered outside migration
> where there's no context of bitmap_mutex.
> 
> But AFAICT concurrent clear log is also fine because it was (somehow
> tailored...) for kvm, so it'll anyway be serialized at kvm_slots_lock().
> We'll need to be careful when growing log_clear support, though.
> 

On a related not, I was wondering if we should tackle this from a 
different direction and not care about locking at all for this special 
migration case.

The thing is, during migration most operation either are (or should be) 
disabled. Consequently, I would expect that it's very rare that we even 
get a register/unregister while migration is running. Anything that 
might do it could already indicate a potential problem.

For example, device hotplug/unplug should be forbidden while migration 
is happening.

guest_phys_blocks_append() temporarily registers a listener. IIRC, we 
already disable memory dumping while migration is active. From what I 
can tell, qmp_dump_skeys() and tpm_ppi_reset() could still call it, AFAIKs.


Do we have any other known call paths that are problematic while 
migration is active? The guest_phys_blocks_append() could be 
re-implemented easily to handle it without a temporary notifier 
registration.

There are not too many calls of memory_listener_unregister().

-- 
Thanks,

David / dhildenb


