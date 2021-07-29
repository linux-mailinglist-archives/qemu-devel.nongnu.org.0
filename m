Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AA03DA2E8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:16:01 +0200 (CEST)
Received: from localhost ([::1]:37284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94xE-0002Qv-Ib
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m94w7-0001i3-AS
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:14:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m94w4-0001Mp-Dw
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:14:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627560885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmtyUB6TijekX4ppIrpHDKbBzUUCMwRAVelBT+y77f8=;
 b=fqWmF5mfUYFi+oNtFlxdF0nLF3P6zTBjwZxMepqhsRcinecjYKAEqBCwiFxS844leo1Zml
 O81mBQtlG+XR7vb/wRUQQp3Q2SCEQjxoE0TxWdyx9M6TMsE8lZukLJXCzPT8iQCSaMaEMN
 KQIl8n9lOapy6KZf9MAcSluVWh3Dxxg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-x9JPRSZPOUmRJUmY2Em1qw-1; Thu, 29 Jul 2021 08:14:44 -0400
X-MC-Unique: x9JPRSZPOUmRJUmY2Em1qw-1
Received: by mail-wm1-f72.google.com with SMTP id
 f142-20020a1c1f940000b029025093cddc1eso2131261wmf.3
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 05:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=XmtyUB6TijekX4ppIrpHDKbBzUUCMwRAVelBT+y77f8=;
 b=YG9LT8TL/xSZcHXIZyD5wsx0AvpQw0o5CfBGMmAMrYaPSya6/ZsH97+6gp3LLN5qKO
 HmXXE2kxjAV5mdmvlf2v1LpGb05SndhkvrRK45kKNWhN3K/qEa6oE3qGsoEU29c3t80y
 ENoAJGrO+TiRcag6uR7yk9EDkC3GoDz2A8pnRFSyTo0NQF5F9IErhIOy1JIrt4ykNuCF
 MgO3DBZVod0KUGzCGAQtsZrkt/SEJ4SNxZ3YjMYptaWmtMUjb8YJc+r0d1X3Fa9N7QmB
 cfbCHBjnUSPdHTifgrDNzG5vNBAVh/dLpJDG35H8EdY0oxqqVp46KzYa17Pk978XERrZ
 hInw==
X-Gm-Message-State: AOAM531iYzq/gQo/sKVSwcH0/GgPkFSmVY237AmhETCXVRNMMTX8RyDJ
 k8Xs5Rmnshgl5o+ZheTmorUDPgwG76fvvC7BBPiV2TsQoJaJrPIyRj0YF/8r3zIiijw5SXoXKHD
 jMNNTFGGntdoGQxg=
X-Received: by 2002:a5d:598f:: with SMTP id n15mr4511857wri.133.1627560883553; 
 Thu, 29 Jul 2021 05:14:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdHneGyzO6VFNKyu8POpEPtBJRHHCb0snEZPCkAApfhUMrtgrJldBXO8WQSjQ7lenNSXvA3A==
X-Received: by 2002:a5d:598f:: with SMTP id n15mr4511835wri.133.1627560883366; 
 Thu, 29 Jul 2021 05:14:43 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id o28sm3372466wra.71.2021.07.29.05.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 05:14:42 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
To: Peter Xu <peterx@redhat.com>
References: <20210721092759.21368-1-david@redhat.com>
 <20210721092759.21368-6-david@redhat.com> <YPrvfST43SFOMA1F@t490s>
 <2ce949f2-6950-5404-70e4-73a2e41b4ca8@redhat.com> <YPsP8+STD836MO3L@t490s>
 <124693ef-5595-85c9-da5a-8f8e6a827c19@redhat.com> <YPs+cO7u1eXMomE0@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <de4bd533-efaa-a6e5-c73c-01016d0f229c@redhat.com>
Date: Thu, 29 Jul 2021 14:14:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPs+cO7u1eXMomE0@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.07.21 00:10, Peter Xu wrote:
> On Fri, Jul 23, 2021 at 09:01:42PM +0200, David Hildenbrand wrote:
>> It can happen in corner cases and is valid: with the current virtio-mem
>> spec, guests are allowed to read unplugged memory. This will, for example,
>> happen on older Linux guests when reading /proc/kcore or (with even older
>> guests) when dumping guest memory via kdump. These corner cases were the
>> main reason why the spec allows for it -- until we have guests properly
>> adjusted such that it won't happen even in corner cases.
>>
>> A future feature bit will disallow it for the guest: required for supporting
>> shmem/hugetlb cleanly. With that in place, I agree that we would want to
>> warn in this case!
> 
> OK that makes sense; with the page_size change, feel free to add:

I just realized that relying on the page_size would be wrong.

We migrate TARGET_PAGE_SIZE chunks and the offset might not be page_size 
aligned. So if we were to replace TARGET_PAGE_SIZE by rb->page_size, we 
might accidentally cover a "too big" range.

Makes sense?

> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> 


-- 
Thanks,

David / dhildenb


