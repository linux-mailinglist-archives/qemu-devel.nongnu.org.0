Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0455A341B7F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:30:16 +0100 (CET)
Received: from localhost ([::1]:44648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDKZ-0003Af-2y
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNDI9-0008MG-LB
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:27:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNDI7-0002gz-Pu
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:27:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616153263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7kD5TIDePxAwXwolwGvIQihFkNzQyYj3Mbb6FnK58vo=;
 b=fihoVhWMEEkPJpG/t3Cp3zPmEy5npq1uLdRjBoJFbL1S4IlUGXlGp/DaIFyuXyrVYamDql
 d0H+6d+dMzIzL92pi2/L1hJsaS16xmYYF937ODlgeA7GuTOGqabnMG319CuLJV83gIM6bE
 B8ux08PGHQVMLvcTxyFI0KOGcKeinyA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-z_IXHZPqPcSyPMFdky9PuQ-1; Fri, 19 Mar 2021 07:27:31 -0400
X-MC-Unique: z_IXHZPqPcSyPMFdky9PuQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E244D7B9D;
 Fri, 19 Mar 2021 11:27:29 +0000 (UTC)
Received: from [10.36.112.11] (ovpn-112-11.ams2.redhat.com [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3639E19C79;
 Fri, 19 Mar 2021 11:27:24 +0000 (UTC)
Subject: Re: [PATCH 3/3] migration: Pre-fault memory before starting
 background snasphot
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, qemu-devel@nongnu.org
References: <20210318174611.293520-1-andrey.gruzdev@virtuozzo.com>
 <20210318174611.293520-4-andrey.gruzdev@virtuozzo.com>
 <a5c70d97-0560-0f7e-309e-a07f60a2e1a3@redhat.com>
 <a40d14b2-b10c-83bf-bdd5-48a465dac67d@virtuozzo.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <7a83e101-ea14-df93-3cbc-014279637d2e@redhat.com>
Date: Fri, 19 Mar 2021 12:27:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a40d14b2-b10c-83bf-bdd5-48a465dac67d@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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

On 19.03.21 12:05, Andrey Gruzdev wrote:
> On 19.03.2021 12:28, David Hildenbrand wrote:
>>> +/*
>>> + * ram_block_populate_pages: populate memory in the RAM block by
>>> reading
>>> + *   an integer from the beginning of each page.
>>> + *
>>> + * Since it's solely used for userfault_fd WP feature, here we just
>>> + *   hardcode page size to TARGET_PAGE_SIZE.
>>> + *
>>> + * @bs: RAM block to populate
>>> + */
>>> +volatile int ram_block_populate_pages__tmp;
>>> +static void ram_block_populate_pages(RAMBlock *bs)
>>> +{
>>> +    ram_addr_t offset = 0;
>>> +    int tmp = 0;
>>> +
>>> +    for (char *ptr = (char *) bs->host; offset < bs->used_length;
>>> +            ptr += TARGET_PAGE_SIZE, offset += TARGET_PAGE_SIZE) {
>>
>> You'll want qemu_real_host_page_size instead of TARGET_PAGE_SIZE
>>
> Ok.
>>> +        /* Try to do it without memory writes */
>>> +        tmp += *(volatile int *) ptr;
>>> +    }
>>
>>
>> The following is slightly simpler and doesn't rely on volatile
>> semantics [1].
>> Should work on any arch I guess.
>>
>> static void ram_block_populate_pages(RAMBlock *bs)
>> {
>>      char *ptr = (char *) bs->host;
>>      ram_addr_t offset;
>>
>>      for (offset = 0; offset < bs->used_length;
>>           offset += qemu_real_host_page_size) {
>>      char tmp = *(volatile char *)(ptr + offset)
>>
>>      /* Don't optimize the read out. */
>>      asm volatile ("" : "+r" (tmp));
>> }
>>
> Thanks, good option, I'll change the code.
> 
>> Compiles to
>>
>>      for (offset = 0; offset < bs->used_length;
>>      316d:       48 8b 4b 30             mov    0x30(%rbx),%rcx
>>      char *ptr = (char *) bs->host;
>>      3171:       48 8b 73 18             mov    0x18(%rbx),%rsi
>>      for (offset = 0; offset < bs->used_length;
>>      3175:       48 85 c9                test   %rcx,%rcx
>>      3178:       74 ce                   je     3148
>> <ram_write_tracking_prepare+0x58>
>>           offset += qemu_real_host_page_size) {
>>      317a:       48 8b 05 00 00 00 00    mov 0x0(%rip),%rax        #
>> 3181 <ram_write_tracking_prepare+0x91>
>>      3181:       48 8b 38                mov    (%rax),%rdi
>>      3184:       0f 1f 40 00             nopl   0x0(%rax)
>>          char tmp = *(volatile char *)(ptr + offset);
>>      3188:       48 8d 04 16             lea    (%rsi,%rdx,1),%rax
>>      318c:       0f b6 00                movzbl (%rax),%eax
>>           offset += qemu_real_host_page_size) {
>>      318f:       48 01 fa                add    %rdi,%rdx
>>      for (offset = 0; offset < bs->used_length;
>>      3192:       48 39 ca                cmp    %rcx,%rdx
>>      3195:       72 f1                   jb     3188
>> <ram_write_tracking_prepare+0x98>
>>
>>
>> [1]
>> https://programfan.github.io/blog/2015/04/27/prevent-gcc-optimize-away-code/
>>
>>
>> I'll send patches soon to take care of virtio-mem via RamDiscardManager -
>> to skip populating the parts that are supposed to remain discarded and
>> not migrated.
>> Unfortunately, the RamDiscardManager patches are still stuck waiting for
>> acks ... and now we're in soft-freeze.
>>
> RamDiscardManager patches - do they also modify migration code?
> I mean which part is responsible of not migrating discarded ranges.

I haven't shared relevant patches yet that touch migration code. I'm 
planning on doing that once the generic RamDiscardManager has all 
relevant acks. I'll put you on cc.

-- 
Thanks,

David / dhildenb


