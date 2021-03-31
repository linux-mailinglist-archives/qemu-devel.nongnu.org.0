Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636D93505A9
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 19:40:48 +0200 (CEST)
Received: from localhost ([::1]:42452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRepj-0001z6-Ff
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 13:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lRemg-00011C-D7
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 13:37:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lReme-0006Mz-OK
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 13:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617212255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Oe6hJR0i7Yg/OwmrgBzrw2GRzodsvMSm7rEM1Liif8=;
 b=ajATLuYSz6B/15g4xmTX/WUZsR4tx4kcupkCY4hIcNpwSmCXf8aegv9xoJ2ELtRgBuPV50
 mg2qKZQaAm7+qD6t7PckA/1yHB4woOPj3Fb6yTE2n0d4YnBC7GT2dEn1KeNMuiMIL3pq3C
 89toWl8sw2RX215DHV09uZqVpczuRt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-fS_5mUDbN8ywZBClFOdV8Q-1; Wed, 31 Mar 2021 13:37:33 -0400
X-MC-Unique: fS_5mUDbN8ywZBClFOdV8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F6521083E80;
 Wed, 31 Mar 2021 17:37:32 +0000 (UTC)
Received: from [10.36.113.60] (ovpn-113-60.ams2.redhat.com [10.36.113.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 289F45D9CC;
 Wed, 31 Mar 2021 17:37:26 +0000 (UTC)
Subject: Re: [PATCH for-6.0 3/3] migration: Pre-fault memory before starting
 background snasphot
From: David Hildenbrand <david@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, qemu-devel@nongnu.org
References: <20210331172803.87756-1-andrey.gruzdev@virtuozzo.com>
 <20210331172803.87756-4-andrey.gruzdev@virtuozzo.com>
 <cf44ad26-c7f0-ed62-e348-9e99d7d6ede8@redhat.com>
Organization: Red Hat GmbH
Message-ID: <79c7a862-58d8-2fa4-da75-f299f1728d52@redhat.com>
Date: Wed, 31 Mar 2021 19:37:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <cf44ad26-c7f0-ed62-e348-9e99d7d6ede8@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31.03.21 19:33, David Hildenbrand wrote:
> On 31.03.21 19:28, Andrey Gruzdev wrote:
>> This commit solves the issue with userfault_fd WP feature that
>> background snapshot is based on. For any never poluated or discarded
>> memory page, the UFFDIO_WRITEPROTECT ioctl() would skip updating
>> PTE for that page, thereby loosing WP setting for it.
>>
>> So we need to pre-fault pages for each RAM block to be protected
>> before making a userfault_fd wr-protect ioctl().
>>
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> ---
>>    migration/migration.c |  6 ++++++
>>    migration/ram.c       | 48 +++++++++++++++++++++++++++++++++++++++++++
>>    migration/ram.h       |  1 +
>>    3 files changed, 55 insertions(+)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index be4729e7c8..71bce15a1b 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -3827,6 +3827,12 @@ static void *bg_migration_thread(void *opaque)
>>    
>>        update_iteration_initial_status(s);
>>    
>> +    /*
>> +     * Prepare for tracking memory writes with UFFD-WP - populate
>> +     * RAM pages before protecting.
>> +     */
>> +    ram_write_tracking_prepare();
>> +
>>        qemu_savevm_state_header(s->to_dst_file);
>>        qemu_savevm_state_setup(s->to_dst_file);
>>    
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 40e78952ad..24c8627214 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1560,6 +1560,54 @@ out:
>>        return ret;
>>    }
>>    
>> +/*
>> + * ram_block_populate_pages: populate memory in the RAM block by reading
>> + *   an integer from the beginning of each page.
>> + *
>> + * Since it's solely used for userfault_fd WP feature, here we just
>> + *   hardcode page size to qemu_real_host_page_size.
>> + *
>> + * @bs: RAM block to populate
>> + */
>> +static void ram_block_populate_pages(RAMBlock *bs)
> 
> Usually we use "rb" or "block"; however migration/ram.c seems to do
> things differently.
> 
>> +{
>> +    char *ptr = (char *) bs->host;
>> +
>> +    for (ram_addr_t offset = 0; offset < bs->used_length;
>> +            offset += qemu_real_host_page_size) {
>> +        char tmp = *(ptr + offset);
> 
> ^ missing empty line.
> 
>> +        /* Don't optimize the read out */
>> +        asm volatile("" : "+r" (tmp));
>> +    }
> 
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 
> 
> and might want to add
> 
> Reported-by: David Hildenbrand <david@redhat.com>
> 
> (also to patch #2)
> 

Also, proper "Fixes:" tags would be handy as well.

-- 
Thanks,

David / dhildenb


