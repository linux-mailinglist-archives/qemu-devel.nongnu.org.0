Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3D0686F4E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 20:52:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNJ9U-0000OY-DO; Wed, 01 Feb 2023 14:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNJ9R-0000OD-Qq
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:52:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNJ9Q-0004w9-DF
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675281131;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xfGQzuIdPkvO/CMfMpkoumo9L+7HWQ2Pygy9GSmGc8Y=;
 b=Afz09GjXaH6B73EQY2vHr8a5mLOwKeMDre95yL74OD0UBMBju2PvMu6FJi6HOyl0vuDBz1
 IwxwGlBEVF/6Kugah7BWsGjxoB4zkPUjH446CaE6czifTucz8QsL67wWAJRkrQ/b6I+3T9
 yMncUW6oSEhTNa+Wjy8YaiL4j01rWBc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-F_0pGXbhN4eJdiIxVtUuRA-1; Wed, 01 Feb 2023 14:52:10 -0500
X-MC-Unique: F_0pGXbhN4eJdiIxVtUuRA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j24-20020a05600c1c1800b003dc4480f7bdso1628813wms.5
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 11:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xfGQzuIdPkvO/CMfMpkoumo9L+7HWQ2Pygy9GSmGc8Y=;
 b=XxW920YeCUHExQLahzQfapaTUhymBjea7qapAAWsVtGvZXmjThRZKfIFci42ki7GIc
 Og2sWQzjgPztMCjnit4vrAu5ixLuQWclGZJKYoB3CYXGQO3YQmCcDUdTgeu0xB/Kf2eE
 FODUs0sAINxbPQ4f/xt0aT9a/mb9zS3QXXGJYJGSKsSzTcUYA2lPwS6bmmfnqMso8tLI
 DAKCSn/OfWvEQWhbCZVl0MS55ieUQdXFh2smyuPvCE0O7+sbfU+cAqsb1wwGtJiHzdo4
 Mt0EqoIRMN85a2ey1lV3XLqaoPJCFP0daq+seGG65miamf1zZmUyummEffS4HNu+xOEY
 bVDg==
X-Gm-Message-State: AO0yUKUrkluTjuOCK/IMzZMwL5VPBO8OdCb9Cwqxa7bx6BUxf7FZGNSw
 ivYypuZo1emUABk74m4tiHStG+GBFX63xFIGP9OU/AavBNw7QTKmcZuHq3y/s0bWPWK/DqxvdDl
 29xMORzVDO2z5EwQ=
X-Received: by 2002:a05:600c:4f93:b0:3dc:59c3:9020 with SMTP id
 n19-20020a05600c4f9300b003dc59c39020mr3458383wmq.8.1675281128748; 
 Wed, 01 Feb 2023 11:52:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9xELnW2xphuhkPA4IyNcp4vN3OMQpmC3tJ6rS/oxqt30js9T+c8F9WHggOrbZhYb6tJIZ78g==
X-Received: by 2002:a05:600c:4f93:b0:3dc:59c3:9020 with SMTP id
 n19-20020a05600c4f9300b003dc59c39020mr3458374wmq.8.1675281128545; 
 Wed, 01 Feb 2023 11:52:08 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 j25-20020a05600c1c1900b003daf6e3bc2fsm4470427wms.1.2023.02.01.11.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 11:52:08 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 20/21] migration: Handle page faults using
 UFFDIO_CONTINUE
In-Reply-To: <87edr9w5mv.fsf@secure.mitica> (Juan Quintela's message of "Wed, 
 01 Feb 2023 20:24:40 +0100")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-21-peterx@redhat.com>
 <87edr9w5mv.fsf@secure.mitica>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 20:52:07 +0100
Message-ID: <871qn9w4d4.fsf@secure.mitica>
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

Juan Quintela <quintela@redhat.com> wrote:
> Peter Xu <peterx@redhat.com> wrote:
>> Teach QEMU to be able to handle page faults using UFFDIO_CONTINUE for
>> hugetlbfs double mapped ranges.
>>
>> To copy the data, we need to use the mirror buffer created per ramblock by
>> a raw memcpy(), then we can kick the faulted threads using UFFDIO_CONTINUE
>> by installing the pgtables.
>>
>> Move trace_postcopy_place_page(host) upper so that it'll dump something for
>> either UFFDIO_COPY or UFFDIO_CONTINUE.
>>
>> Signed-off-by: Peter Xu <peterx@redhat.com>
>
>> ---
>>  migration/postcopy-ram.c | 55 ++++++++++++++++++++++++++++++++++++++--
>>  migration/trace-events   |  4 +--
>>  2 files changed, 55 insertions(+), 4 deletions(-)
>>
>> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
>> index 8a2259581e..c4bd338e22 100644
>> --- a/migration/postcopy-ram.c
>> +++ b/migration/postcopy-ram.c
>> @@ -1350,6 +1350,43 @@ int postcopy_notify_shared_wake(RAMBlock *rb, uint64_t offset)
>>      return 0;
>>  }
>>  
>> +/* Returns the mirror_host addr for a specific host address in ramblock */
>> +static inline void *migration_ram_get_mirror_addr(RAMBlock *rb, void *host)
>> +{
>> +    return (void *)((__u64)rb->host_mirror + ((__u64)host - (__u64)rb->host));
>
> This is gross :-(
> I hate this C miss-feature.
>
> What about:
>     return (char *)rb->host_mirror + (char*)host - (char*)rb->host;

This was a generic suggestion.  But after looking at ramblock.h and
realizing that rb->host is not void*.

    return (uint8_t *)rb->host_mirror + (uint8_t *)host - rb->host;

Sorry for looking too late.

BTW, once here, why is the type of host_mirror different than the one
from host?  I don't know what is more confusing anymore.

Later, Juan.


