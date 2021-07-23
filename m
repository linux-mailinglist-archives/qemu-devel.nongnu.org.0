Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53B13D409C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 21:17:03 +0200 (CEST)
Received: from localhost ([::1]:49796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m70fO-0008No-Gq
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 15:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m70eL-0007dX-BE
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:15:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m70eG-0006Vx-Sx
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627067749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5589nGDaWbQaH0o1zhXcop9hLxZKdbnVZ3SdcfrDRA=;
 b=i5Y7hFs05QbUJRZghUP8WWe3/K+kkZaEOMMNHiKMSLFRomzBBkP7YSnS/+9YMlDFSLABiP
 9HWJTLZE/Wi2jRzg0uw8Ts6YOZjkucUaQFK9jSuQFnTE2lRzN9mfKumFj6kXNyTGGXfJUB
 4dI+lmU+t0qyMsOT/6jxCjenjme8OnU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-2olBwYeUO7K1OBihfvR30g-1; Fri, 23 Jul 2021 15:15:46 -0400
X-MC-Unique: 2olBwYeUO7K1OBihfvR30g-1
Received: by mail-wm1-f70.google.com with SMTP id
 n7-20020a05600c3b87b029024e59a633baso725684wms.5
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=I5589nGDaWbQaH0o1zhXcop9hLxZKdbnVZ3SdcfrDRA=;
 b=c7i/Gc/xAWopvPBHMf7ZThPH/obhHyHirICL0ib+XwjKWUp2yAEFglACE98oMTJaR1
 0xiqiFiIJPF+BiUXK16ktrAKRMe1wsJ02NxZOSnHVBzFrm5zVqqeziIZEUyhmQj1OnOd
 KjzVNFJ8PhrK1UAC8LYIFRw9whU5kZ9T2+LMLI4jDOkQnp1ZVUwQcRoRCi5W9ooAK5jo
 xltTx860emhvVZxVGIHkoq6dxNBVHjLP8BTTbgtWhTExGY1GI4h4I6GQykiSLpdKeER9
 aW8Wk2T5hQQsP2oK4sZmA7Cj66ao00e49kN52nHRxHMJqDRpoV2kZDCeO1dS9XwJIMnT
 6Xhg==
X-Gm-Message-State: AOAM530mihHylwnAleeuNReslJf9RhRz28zostGQZA8dYPRiRgS199Ov
 GgWjZzjtWzSrTsAUcmXegwGdimOpJj8n4bhLKUovpJz9sc1t/Gmwu3X5N2UkF3y+2I6W/q+r+hp
 uJ3/uCNt6bT1xTYY=
X-Received: by 2002:adf:fac7:: with SMTP id a7mr6730690wrs.384.1627067744916; 
 Fri, 23 Jul 2021 12:15:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhMuuCO6QS8ZSFt3jE2Y7e/OmTaKlrR5vu77yXCfBeh9uPZCW0Tji1rZi7M/FplQlYZe0mxg==
X-Received: by 2002:adf:fac7:: with SMTP id a7mr6730664wrs.384.1627067744723; 
 Fri, 23 Jul 2021 12:15:44 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c676e.dip0.t-ipconnect.de. [91.12.103.110])
 by smtp.gmail.com with ESMTPSA id y19sm5865104wma.21.2021.07.23.12.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 12:15:44 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>
References: <20210720130304.26323-1-david@redhat.com>
 <20210720130304.26323-2-david@redhat.com> <YPrXutNkup2E4k6k@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH resend v2 1/5] tpm: mark correct memory region range dirty
 when clearing RAM
Message-ID: <c4bc5d98-7a34-6a9c-3c07-10e5b52cd06a@redhat.com>
Date: Fri, 23 Jul 2021 21:15:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPrXutNkup2E4k6k@t490s>
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
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.07.21 16:52, Peter Xu wrote:
> On Tue, Jul 20, 2021 at 03:03:00PM +0200, David Hildenbrand wrote:
>> @@ -30,11 +30,13 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
>>           guest_phys_blocks_init(&guest_phys_blocks);
>>           guest_phys_blocks_append(&guest_phys_blocks);
>>           QTAILQ_FOREACH(block, &guest_phys_blocks.head, next) {
>> +            ram_addr_t mr_start = memory_region_get_ram_addr(block->mr);
>> +
>>               trace_tpm_ppi_memset(block->host_addr,
>>                                    block->target_end - block->target_start);
>>               memset(block->host_addr, 0,
>>                      block->target_end - block->target_start);
>> -            memory_region_set_dirty(block->mr, 0,
>> +            memory_region_set_dirty(block->mr, block->target_start - mr_start,
>>                                       block->target_end - block->target_start);
> 
> target_start should falls in gpa range, while mr_start is ram_addr_t.  I am not
> sure whether this is right..

When I wrote that code I was under the impression that 
memory_region_get_ram_addr() would give the GPA where the memory region 
starts, but ... that's not correct as you point out. "offset" confusion :)

> 
> Neither do I know how to get correct mr offset with the existing info we've got
> from GuestPhysBlock.  Maybe we need to teach guest_phys_blocks_region_add() to
> also record section->offset_within_region?

We might actually want offset_within_address_space + 
offset_within_region, so we can calculate the GPA difference to see 
where inside the ramblock we end up.

I'll have a look next week, thanks for noticing!

-- 
Thanks,

David / dhildenb


