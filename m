Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7850D341879
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 10:34:43 +0100 (CET)
Received: from localhost ([::1]:33478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNBWk-0007jk-J2
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 05:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNBUX-0006Xk-Bg
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:32:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNBUV-0001dB-Sh
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616146342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJglv+voIJxzEv3DgHqcJOEHg8QsQJrSAIHO+TmMqZ8=;
 b=dLoBjiplCpregmSkovCRBhlW8UhETon2loFJqycT+AXhmKjARc5WEsrYVpAKgDfEiwBoS/
 hrWpuB3/boSjwtNA35ze32q0BGfKTVksGioieekIaZIpPB5dIDMLC6zBKTmWkGBsitIEIm
 iJ2yCyLQ0ZJNXm3L2mGYRuqxiwWUrd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-DxVodu21OYamGaSU0QJdLg-1; Fri, 19 Mar 2021 05:32:21 -0400
X-MC-Unique: DxVodu21OYamGaSU0QJdLg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94142190A7A1;
 Fri, 19 Mar 2021 09:32:19 +0000 (UTC)
Received: from [10.36.112.11] (ovpn-112-11.ams2.redhat.com [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C6F35D9C6;
 Fri, 19 Mar 2021 09:32:14 +0000 (UTC)
Subject: Re: [PATCH 3/3] migration: Pre-fault memory before starting
 background snasphot
From: David Hildenbrand <david@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, qemu-devel@nongnu.org
References: <20210318174611.293520-1-andrey.gruzdev@virtuozzo.com>
 <20210318174611.293520-4-andrey.gruzdev@virtuozzo.com>
 <a5c70d97-0560-0f7e-309e-a07f60a2e1a3@redhat.com>
Organization: Red Hat GmbH
Message-ID: <a8534b81-ecb8-ef58-6fe7-6531c19e95d7@redhat.com>
Date: Fri, 19 Mar 2021 10:32:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a5c70d97-0560-0f7e-309e-a07f60a2e1a3@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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

On 19.03.21 10:28, David Hildenbrand wrote:
>> +/*
>> + * ram_block_populate_pages: populate memory in the RAM block by reading
>> + *   an integer from the beginning of each page.
>> + *
>> + * Since it's solely used for userfault_fd WP feature, here we just
>> + *   hardcode page size to TARGET_PAGE_SIZE.
>> + *
>> + * @bs: RAM block to populate
>> + */
>> +volatile int ram_block_populate_pages__tmp;
>> +static void ram_block_populate_pages(RAMBlock *bs)
>> +{
>> +    ram_addr_t offset = 0;
>> +    int tmp = 0;
>> +
>> +    for (char *ptr = (char *) bs->host; offset < bs->used_length;
>> +            ptr += TARGET_PAGE_SIZE, offset += TARGET_PAGE_SIZE) {
> 
> You'll want qemu_real_host_page_size instead of TARGET_PAGE_SIZE
> 
>> +        /* Try to do it without memory writes */
>> +        tmp += *(volatile int *) ptr;
>> +    }
> 
> 
> The following is slightly simpler and doesn't rely on volatile semantics [1].
> Should work on any arch I guess.
> 
> static void ram_block_populate_pages(RAMBlock *bs)
> {
>       char *ptr = (char *) bs->host;
>       ram_addr_t offset;
> 
>       for (offset = 0; offset < bs->used_length;
>            offset += qemu_real_host_page_size) {
> 	char tmp = *(volatile char *)(ptr + offset)

I wanted to do a "= *(ptr + offset)" here.

> 
> 	/* Don't optimize the read out. */
> 	asm volatile ("" : "+r" (tmp));

So this is the only volatile thing that the compiler must guarantee to 
not optimize away.


-- 
Thanks,

David / dhildenb


