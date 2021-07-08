Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5D23BF63A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 09:24:54 +0200 (CEST)
Received: from localhost ([::1]:58448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1OOz-0006qu-Qj
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 03:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1ONS-0006AP-MS
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 03:23:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1ONO-0007Xl-3G
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 03:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625728993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xMOggDAkOdxjQigCxigY5pOcddrmosF6jLQXjagmN6M=;
 b=bY4QebGyejTNEtttdJxI5+Rz/kjGKzj/7duJ3wHJqubEUkG4MLoleMB9Hi/WZGhS5DFFGT
 LaRwGPu+BusEriu6BD3cYHNsERHdhy0dwXo8LYPS+DWXVsLbDE2JH/z0YAVfw8J7H3Arrc
 O57IkNr8ZgkjwVJjo6t6zOA1BrL3OkE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-iV10ahBHO9ChXtgZcHU6kQ-1; Thu, 08 Jul 2021 03:23:12 -0400
X-MC-Unique: iV10ahBHO9ChXtgZcHU6kQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 w4-20020a05600018c4b0290134e4f784e8so1625804wrq.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 00:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xMOggDAkOdxjQigCxigY5pOcddrmosF6jLQXjagmN6M=;
 b=B51L2U7ckw37gopwR3VATjj2TvwxQNyk1ADPsf8LaHGBTUZpXn+hE0ci7PaFIjHdWt
 uS6D32+mtlDY0vjz+LjW24Y18LuSZ467PMN4QHrygOXomfq4YrD+qwDuqBye96uG5a+t
 AqWHDN3UusHEcOWXb1pr/JdsAohtzTMvgIz7sK9xMCiUX7z4h07MTn6rFYHrcgOvr983
 XD0S77vJYwj/a8z7aLj1ijvbitt6v1/exXnMuOAYElQ/ZBgilBBAfVItob1uuMMSxpgq
 70B51Q2WX4hNeGvy4v2C/iykqiSIvmjxSzqhwhmzld9oaNmK+zn28ZlZLUwSqexjLwDS
 T3GQ==
X-Gm-Message-State: AOAM532gLGAFPO07QshXFJxuWEcvs+EhMR2pC5/6HlVApEoHpSJ+enj9
 R02zdfeg3EJuj1SAdkFWCptkBLBwL7F2AJ87bqgQjfZsFIw2DZ0wxdwN4s85gSM0ErhSTG6B1gW
 4QNqm0QiptXnSgIo=
X-Received: by 2002:adf:aacb:: with SMTP id i11mr32408500wrc.371.1625728990855; 
 Thu, 08 Jul 2021 00:23:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvrhXeOy7Wg4VDUDxGyeaI3Cv7oRB1mSi97FFAzzLLplQLtKsvBPCCWPvsXmVY00YFEF4msw==
X-Received: by 2002:adf:aacb:: with SMTP id i11mr32408477wrc.371.1625728990698; 
 Thu, 08 Jul 2021 00:23:10 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23cf9.dip0.t-ipconnect.de. [79.242.60.249])
 by smtp.gmail.com with ESMTPSA id y66sm1141932wmy.39.2021.07.08.00.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 00:23:10 -0700 (PDT)
To: Alexander Duyck <alexander.duyck@gmail.com>, Peter Xu <peterx@redhat.com>
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-3-david@redhat.com> <YOXsTQoq6eeIR8B5@t490s>
 <5f5dd7f3-ce09-53d6-db48-1a333119205d@redhat.com> <YOYJsMUfx1XHFk6G@t490s>
 <CAKgT0Ucp60nxvk4ysydE29RPXUEFUU2f4+=3XMaXFagMef+hbA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <a3183ca9-419e-18db-966c-090efc75ebc1@redhat.com>
Date: Thu, 8 Jul 2021 09:23:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKgT0Ucp60nxvk4ysydE29RPXUEFUU2f4+=3XMaXFagMef+hbA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org, Wei Wang <wei.w.wang@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.07.21 23:22, Alexander Duyck wrote:
> On Wed, Jul 7, 2021 at 1:08 PM Peter Xu <peterx@redhat.com> wrote:
>>
>> On Wed, Jul 07, 2021 at 08:57:29PM +0200, David Hildenbrand wrote:
>>> On 07.07.21 20:02, Peter Xu wrote:
>>>> On Wed, Jul 07, 2021 at 04:06:55PM +0200, David Hildenbrand wrote:
>>>>> As it never worked properly, let's disable it via the postcopy notifier on
>>>>> the destination. Trying to set "migrate_set_capability postcopy-ram on"
>>>>> on the destination now results in "virtio-balloon: 'free-page-hint' does
>>>>> not support postcopy Error: Postcopy is not supported".
>>>>
>>>> Would it be possible to do this in reversed order?  Say, dynamically disable
>>>> free-page-hinting if postcopy capability is set when migration starts? Perhaps
>>>> it can also be re-enabled automatically when migration completes?
>>>
>>> I remember that this might be quite racy. We would have to make sure that no
>>> hinting happens before we enable the capability.
>>>
>>> As soon as we messed with the dirty bitmap (during precopy), postcopy is no
>>> longer safe. As noted in the patch, the only runtime alternative is to
>>> disable postcopy as soon as we actually do clear a bit. Alternatively, we
>>> could ignore any hints if the postcopy capability was enabled.
>>
>> Logically migration capabilities are applied at VM starts, and these
>> capabilities should be constant during migration (I didn't check if there's a
>> hard requirement; easy to add that if we want to assure it), and in most cases
>> for the lifecycle of the vm.
> 
> Would it make sense to maybe just look at adding a postcopy value to
> the PrecopyNotifyData that you could populate with
> migration_in_postcopy() in precopy_notify()?
> 
> Then all you would need to do is check for that value and if it is set
> you shut down the page hinting or don't start it since I suspect it
> wouldn't likely add any value anyway since I would think flagging
> unused pages doesn't add much value in a postcopy environment anyway.

I don't think that's true. With free page hinting you reduce the 
effective VM size you have to migrate. Any page that has to be migrated 
will consume bandwidth.

1. Although postcopy transfers only the currently requested pages, the 
background thread will keep pushing pages, making postcopy eventually 
run longer. While in postcopy (well, and in precopy) we are faced with a 
clear performance degradation, so we want to minimize the overall time 
spent.

2. Usually you let precopy run for a while before switching to postcopy. 
With free page hinting you might be able to greatly reduce the number of 
pages you'll have to migrate later in the same amount of time.


So there would be value, but at least I am not too interested in making 
it work in combination perfectly if it results in significant migration 
code changes; my goal is to not silently break guests when used in 
combination -- once there is the actual requirement to optimize this 
setup, we can work on that optimization (as discussed with MST here).

So I'll explore going the migrate_postcopy_ram() way to silently (or at 
least warn) disable free page hinting. Thanks.

-- 
Thanks,

David / dhildenb


