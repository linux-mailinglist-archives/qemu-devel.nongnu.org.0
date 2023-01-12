Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AA0667E0D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 19:23:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG2Cf-00015g-Uk; Thu, 12 Jan 2023 13:21:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG2Ce-00015Y-14
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 13:21:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG2Cb-0000LD-W7
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 13:21:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673547684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9UXvTA5OXDnUffBhoC5JIaj9JE24PA3VQ5bpVo3JZf8=;
 b=KvPAL+MOmy+hJMZqCcdDraCx3SMOWoBr5M7ZvyaXZ/PpwCQK9EfWZK5SNiP3AwBzeIjBnf
 7fTo4Kl8LRQIDvLMelMsLsSlkXeWl/WY2pGJeVCS1ev/7P71XafWxLYgZZcxwi8178v4dG
 cxSg6MO7szDCkmyTglqcAsytS7/DFV4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-183-JIU8qG5_P22b2Jx2qHbgUw-1; Thu, 12 Jan 2023 13:21:22 -0500
X-MC-Unique: JIU8qG5_P22b2Jx2qHbgUw-1
Received: by mail-wr1-f69.google.com with SMTP id
 q3-20020adfab03000000b002b32e25058dso3727893wrc.5
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 10:21:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9UXvTA5OXDnUffBhoC5JIaj9JE24PA3VQ5bpVo3JZf8=;
 b=ZH6fakALB9uilDGDHhn2E2MaSnEUJ15zQJBhufbtyySuzcJl9SzKMMHsVWuP2xPeB+
 46Kvb7iD426qvPwEgBpVYQeJAdI6nZ4bwTU7k8fOUGGwcQiKg8yXpBzwlop9xlpgE855
 cjR42OT/ZOyUKc2mEF9tM4Dl8U9496qorCbdocNlhkJPIG2433L5WoJSCVRg2FIvQh5e
 PO80iloI8dQpNSy1P6tAw2m+uY/iFR2G/13Krl2WFONAegcaNSugZwh2B5pIf85MYyMR
 wFbnuCKNy9OYuVH3/KXfUZiMM3pRJv2AIxWoXQcGfoLvpOMdSHi89Yh33KzPrUSBTe0f
 HxdQ==
X-Gm-Message-State: AFqh2krU2gDGm6PDymAjKnOkI2jj4elFcwlQ4OhlZC6JC29BJ9uzB9Dg
 KbBJghU33X0+wT6F8lo9H655Y0S6nPOX/QAm50kDWSp14O7qdt7KYweiWCzNm4rlhxEhaS1CMNO
 OL7l1QWz5hbEGTGc=
X-Received: by 2002:a05:600c:3d90:b0:3d9:f798:dcba with SMTP id
 bi16-20020a05600c3d9000b003d9f798dcbamr9366410wmb.38.1673547681796; 
 Thu, 12 Jan 2023 10:21:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsd/bqChDAqT35siglfQo2fRSWzbnoYNCCKio8z99B1FJk/Y1FbCJwntaK9Y9nqx+rZuthYmQ==
X-Received: by 2002:a05:600c:3d90:b0:3d9:f798:dcba with SMTP id
 bi16-20020a05600c3d9000b003d9f798dcbamr9366393wmb.38.1673547681547; 
 Thu, 12 Jan 2023 10:21:21 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:4b00:f595:490f:692:a6f3?
 (p200300cbc7074b00f595490f0692a6f3.dip0.t-ipconnect.de.
 [2003:cb:c707:4b00:f595:490f:692:a6f3])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a1cf207000000b003d98438a43asm21216654wmc.34.2023.01.12.10.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 10:21:20 -0800 (PST)
Message-ID: <11b7237a-000a-5ad7-3747-246825188d83@redhat.com>
Date: Thu, 12 Jan 2023 19:21:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 3/8] migration/savevm: Allow immutable device state to
 be migrated early (i.e., before RAM)
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-4-david@redhat.com> <Y8BJ02EiHNSr6xMv@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y8BJ02EiHNSr6xMv@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 12.01.23 18:56, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> For virtio-mem, we want to have the plugged/unplugged state of memory
>> blocks available before migrating any actual RAM content, and perform
>> sanity checks before touching anything on the destination. This
>> information is immutable on the migration source while migration is active,
>>
>> We want to use this information for proper preallocation support with
>> migration: currently, we don't preallocate memory on the migration target,
>> and especially with hugetlb, we can easily run out of hugetlb pages during
>> RAM migration and will crash (SIGBUS) instead of catching this gracefully
>> via preallocation.
>>
>> Migrating device state via a vmsd before we start iterating is currently
>> impossible: the only approach that would be possible is avoiding a vmsd
>> and migrating state manually during save_setup(), to be restored during
>> load_state().
>>
>> Let's allow for migrating device state via a vmsd early, during the
>> setup phase in qemu_savevm_state_setup(). To keep it simple, we
>> indicate applicable vmds's using an "immutable" flag.
>>
>> Note that only very selected devices (i.e., ones seriously messing with
>> RAM setup) are supposed to make use of such early state migration.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   include/migration/vmstate.h |  5 +++++
>>   migration/savevm.c          | 14 ++++++++++++++
>>   2 files changed, 19 insertions(+)
>>
>> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
>> index ad24aa1934..dd06c3abad 100644
>> --- a/include/migration/vmstate.h
>> +++ b/include/migration/vmstate.h
>> @@ -179,6 +179,11 @@ struct VMStateField {
>>   struct VMStateDescription {
>>       const char *name;
>>       int unmigratable;
>> +    /*
>> +     * The state is immutable while migration is active and is saved
>> +     * during the setup phase, to be restored early on the destination.
>> +     */
>> +    int immutable;
> 
> A bool would be nicer (as it would for unmigratable above)

Yes, I chose an int for consistency with "unmigratable". I can turn that 
into a bool.

I'd even include a cleanup patch for unmigratable if it wouldn't be ...

$ git grep "unmigratable \=" | wc -l
29

> 
>>       int version_id;
>>       int minimum_version_id;
>>       MigrationPriority priority;
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index ff2b8d0064..536d6f662b 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -1200,6 +1200,15 @@ void qemu_savevm_state_setup(QEMUFile *f)
>>   
>>       trace_savevm_state_setup();
>>       QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>> +        if (se->vmsd && se->vmsd->immutable) {
>> +            ret = vmstate_save(f, se, ms->vmdesc);
>> +            if (ret) {
>> +                qemu_file_set_error(f, ret);
>> +                break;
>> +            }
>> +            continue;
>> +        }
>> +
> 
> Does this give you the ordering you want? i.e. there's no guarantee here
> that immutables come first?

Yes, for virtio-mem at least this is fine. There are no real ordering 
requirements in regard to save_setup().

I guess one could use vmstate priorities to affect the ordering, if 
required.

So for my use case this is good enough, any suggestions? Thanks.

-- 
Thanks,

David / dhildenb


