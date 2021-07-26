Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FB03D54EC
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 10:10:51 +0200 (CEST)
Received: from localhost ([::1]:55760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7vhK-00046T-EF
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 04:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m7vfg-0003QC-1b
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:09:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m7vfd-0004Oe-Iy
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627286945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Okvx680teGegtLt5PO1GNnBBkm83jDU/VkZIKogoXL4=;
 b=SFVluoPtap1ZX6hM0t7rrvZrWyMI3OYWcDnUYWOcTmbWSuR6XZRtAHeVHafRSae01ZGJvw
 8oJJUCjsfgBoNid3VDqR5ANx86Rnzz+2NWZXd9+SlIzuUcVavpyYadFXy0zaQVp3yYIJu8
 myqqDUaFTTxibhewseZoUMzCpHCd3GM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-4B_jLda7OjOgcLs3hXP47Q-1; Mon, 26 Jul 2021 04:09:02 -0400
X-MC-Unique: 4B_jLda7OjOgcLs3hXP47Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 l12-20020a5d6d8c0000b029011a3b249b10so4386259wrs.3
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 01:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Okvx680teGegtLt5PO1GNnBBkm83jDU/VkZIKogoXL4=;
 b=Dv+E0Q9dC2t+COO7KGf423N2v+ANd8q0vKUe+FZGhqmiCuWvIxwtBjPnxJe4dA+Wwk
 MUoRk8wo33I6dbGzB18oMxlQZW2JE+XqJ6Nb82EVZenwD1k79FxszMxpVPPDRTRS/I9s
 8Nd1fBz53W4AvYknzVnKN4ivQfWghSjSHz4mz37KY0qiuXI93XUBR0D6+A53dBFq79J+
 Nhtg7d3If0uM2Q79yPGf73xRk5eMjWnMqjKZq++XetUERs0Z/8/TYgBxhAERcsrf9HvB
 9RRWS0X6T3wel36N/Ta+AesJ8xIobHcQFoK2i31hFVAMweUqYnnFbPpJe9v9MKLXSsCS
 Kldg==
X-Gm-Message-State: AOAM530rL1oXR9G9zl2bYGqlgbIQqi+tp+d5l8+kshb2Rpws/TM2FRWA
 rDq4yI7X2YNvzRoYNvowdscdy8cJNFnAeVl58oW8VVD22oH7kkYx1RpWCLRLyKirc2fTDHqK6v9
 ldDKSvb/Qj6sUc5c=
X-Received: by 2002:a5d:6708:: with SMTP id o8mr8296594wru.304.1627286941302; 
 Mon, 26 Jul 2021 01:09:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySMKBwp0riwLDbe4I3JgTUmdtmTtLXKqTbWqNdJbXprabxPsjKdfd0AoJFPDjkzFeGaNpVxg==
X-Received: by 2002:a5d:6708:: with SMTP id o8mr8296564wru.304.1627286941105; 
 Mon, 26 Jul 2021 01:09:01 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23b33.dip0.t-ipconnect.de. [79.242.59.51])
 by smtp.gmail.com with ESMTPSA id
 j16sm41250275wrw.62.2021.07.26.01.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 01:09:00 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>
References: <20210720130304.26323-1-david@redhat.com>
 <20210720130304.26323-2-david@redhat.com> <YPrXutNkup2E4k6k@t490s>
 <c4bc5d98-7a34-6a9c-3c07-10e5b52cd06a@redhat.com> <YPtEGpcLd4bT/5sD@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH resend v2 1/5] tpm: mark correct memory region range dirty
 when clearing RAM
Message-ID: <c8da89a3-dc2a-c0fc-a562-ed3028b2acf3@redhat.com>
Date: Mon, 26 Jul 2021 10:08:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPtEGpcLd4bT/5sD@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.091, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.07.21 00:35, Peter Xu wrote:
> On Fri, Jul 23, 2021 at 09:15:43PM +0200, David Hildenbrand wrote:
>> On 23.07.21 16:52, Peter Xu wrote:
>>> On Tue, Jul 20, 2021 at 03:03:00PM +0200, David Hildenbrand wrote:
>>>> @@ -30,11 +30,13 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
>>>>            guest_phys_blocks_init(&guest_phys_blocks);
>>>>            guest_phys_blocks_append(&guest_phys_blocks);
>>>>            QTAILQ_FOREACH(block, &guest_phys_blocks.head, next) {
>>>> +            ram_addr_t mr_start = memory_region_get_ram_addr(block->mr);
>>>> +
>>>>                trace_tpm_ppi_memset(block->host_addr,
>>>>                                     block->target_end - block->target_start);
>>>>                memset(block->host_addr, 0,
>>>>                       block->target_end - block->target_start);
>>>> -            memory_region_set_dirty(block->mr, 0,
>>>> +            memory_region_set_dirty(block->mr, block->target_start - mr_start,
>>>>                                        block->target_end - block->target_start);
>>>
>>> target_start should falls in gpa range, while mr_start is ram_addr_t.  I am not
>>> sure whether this is right..
>>
>> When I wrote that code I was under the impression that
>> memory_region_get_ram_addr() would give the GPA where the memory region
>> starts, but ... that's not correct as you point out. "offset" confusion :)
>>
>>>
>>> Neither do I know how to get correct mr offset with the existing info we've got
>>> from GuestPhysBlock.  Maybe we need to teach guest_phys_blocks_region_add() to
>>> also record section->offset_within_region?
>>
>> We might actually want offset_within_address_space + offset_within_region,
>> so we can calculate the GPA difference to see where inside the ramblock we
>> end up.
> 
> I still think offset_within_region is exactly what we want to fill in here, but
> you can do a double check.

I remember when I first looked into that months ago I wanted to avoid
extending GuestPhysBlock. The commit message actually tells us what to do,
and where my optimization went wrong :)

"We might not start at the beginning of the memory region. We could also
  calculate via the difference in the host address; however,
  memory_region_set_dirty() also relies on memory_region_get_ram_addr()
  internally, so let's just use that."

So, avoiding the optimization, we'd be left with:


diff --git a/hw/tpm/tpm_ppi.c b/hw/tpm/tpm_ppi.c
index 362edcc5c9..fab49524d7 100644
--- a/hw/tpm/tpm_ppi.c
+++ b/hw/tpm/tpm_ppi.c
@@ -30,11 +30,14 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
          guest_phys_blocks_init(&guest_phys_blocks);
          guest_phys_blocks_append(&guest_phys_blocks);
          QTAILQ_FOREACH(block, &guest_phys_blocks.head, next) {
+            hwaddr mr_offs = (uint8_t *) memory_region_get_ram_ptr(block->mr) -
+                             block->host_addr;
+
              trace_tpm_ppi_memset(block->host_addr,
                                   block->target_end - block->target_start);
              memset(block->host_addr, 0,
                     block->target_end - block->target_start);
-            memory_region_set_dirty(block->mr, 0,
+            memory_region_set_dirty(block->mr, mr_offs,
                                      block->target_end - block->target_start);
          }
          guest_phys_blocks_free(&guest_phys_blocks);


That should make more sense :)


-- 
Thanks,

David / dhildenb


