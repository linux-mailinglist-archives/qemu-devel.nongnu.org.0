Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C46406D6
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 13:30:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p15Av-0000M0-92; Fri, 02 Dec 2022 07:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1p15At-0000Li-0K
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 07:29:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1p15Ar-000431-ER
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 07:29:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669984188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8z1usgBoZYU0af/z+uqFySpqPIZUIPG+8tU6wUjdyZs=;
 b=CNZcpDdmVzoOkTtYtu8DQ8pRTOiOG04a/Olle1Cxpe7ohA2sJDYAtlVy80QZMwqgVPH3Iw
 Li3ien9z9ndXLG7gbXMdWI3cOdFzBAM6sW6/++ngw1fDZ6d1z8E3lfltdapRQbQVZt7gLZ
 2nQb2fX1KFTRLokN0z1m7zDYhZerxnM=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-507-QC0L3iFUN6OrqukQpz7L3w-1; Fri, 02 Dec 2022 07:29:46 -0500
X-MC-Unique: QC0L3iFUN6OrqukQpz7L3w-1
Received: by mail-ot1-f69.google.com with SMTP id
 e6-20020a9d5606000000b0066e021a8561so2354619oti.17
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 04:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8z1usgBoZYU0af/z+uqFySpqPIZUIPG+8tU6wUjdyZs=;
 b=kp60g9nr9OR2WqGa4aggHgMmA//bgIy+lQTevgYYbfs7mhRcOi///Oog2TK1/AeS68
 nzSNiPwpJNtlmqgm0hyz6XE3bbCIDdqeMDu+MoeSLTCYQ0GQHwXhTO5hb36ZO0jN0Hnb
 2dd44L6fHpMB3/gMSw2RXvN3wQi9HKn8MUA/JfmGZUALSSJCIbp47K1oi9QHxFEWuhBn
 ZeGVLY/lrihJWgHqqvmtc/2SsT7eGhRhSv5ggs3woCcSDfDzTdJmhtEiUlH380DTmFVX
 GhOMxlCeAYUhJYMRkxS2wDD2YlnrT11vIs05C2KqRU4kxLg3NFZs32NaNCYDD7nCuRBB
 3gvQ==
X-Gm-Message-State: ANoB5plwBGr1O6loS2cG6I+jnL1iq/6+Jh8A5xJCWKkf+7TZniUYmBgJ
 3MIsvJ6JKn2iODGi+H2dihQWJNA62AeG2lHdIRLD+xRTlWito1N/2SGsQidGCXxL9h34K+Rf6Rh
 06P7m5tYeI7Mgri3kxNURM/SH//MD7Tc=
X-Received: by 2002:a9d:5d09:0:b0:661:94cb:32b9 with SMTP id
 b9-20020a9d5d09000000b0066194cb32b9mr26120449oti.62.1669984186169; 
 Fri, 02 Dec 2022 04:29:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Ihi8smcSafLq3nCu1Cg7g0bX3QClI0oV7A2tctLDMF6lGTAiL2EXhQAycq37KprZ1bIihC1Szc0NIFCL7zbg=
X-Received: by 2002:a9d:5d09:0:b0:661:94cb:32b9 with SMTP id
 b9-20020a9d5d09000000b0066194cb32b9mr26120439oti.62.1669984185906; Fri, 02
 Dec 2022 04:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20220905000021.157613-1-afaria@redhat.com>
 <CABgObfahkrhwwn6+D7uUbqKYPXmA3mQGXHwe6f-TiA+iQoFyAQ@mail.gmail.com>
In-Reply-To: <CABgObfahkrhwwn6+D7uUbqKYPXmA3mQGXHwe6f-TiA+iQoFyAQ@mail.gmail.com>
From: Alberto Faria <afaria@redhat.com>
Date: Fri, 2 Dec 2022 12:29:10 +0000
Message-ID: <CAELaAXzhsNYQZV_FCmaY06x0UOqPTw3Lwsao1veBCq+eM4eayg@mail.gmail.com>
Subject: Re: [PATCH v2] softmmu/physmem: Fix address of FlatView access in
 address_space_(read|write)_cached_slow()
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Sep 5, 2022 at 8:45 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Thanks, I will queue it.
>
> Paolo
>
> Il lun 5 set 2022, 02:00 Alberto Faria <afaria@redhat.com> ha scritto:
>>
>> flatview_(read|write)_continue() must be called with an address in the
>> FlatView's address space, but `addr` is relative to the
>> MemoryRegionCache.
>>
>> Convert `addr` from the MemoryRegionCache's address space to the
>> FlatView's before passing it to flatview_(read|write)_continue().
>>
>> This problem was uncovered while attempting to perform unaligned writes,
>> which caused flatview_write_continue() to reach the call to
>> flatview_translate(), which then translated the erroneous address and
>> caused the subsequent write to fail.
>>
>> Fixes: 48564041a7 ("exec: reintroduce MemoryRegion caching")
>> Co-Developed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Alberto Faria <afaria@redhat.com>
>> ---
>>  softmmu/physmem.c | 18 ++++++++++++++----
>>  1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 50231bab30..bdde4eb927 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -3420,6 +3420,14 @@ static inline MemoryRegion *address_space_translate_cached(
>>      return section.mr;
>>  }
>>
>> +/* Converts `addr` from the address space of `cache` to that of `cache->fv`. */
>> +static inline hwaddr addr_in_cache_to_in_flat_view(MemoryRegionCache *cache,
>> +                                                   hwaddr addr)
>> +{
>> +    hwaddr addr_in_mrs = addr + cache->xlat - cache->mrs.offset_within_region;
>> +    return addr_in_mrs + cache->mrs.offset_within_address_space;
>> +}
>> +
>>  /* Called from RCU critical section. address_space_read_cached uses this
>>   * out of line function when the target is an MMIO or IOMMU region.
>>   */
>> @@ -3434,8 +3442,9 @@ address_space_read_cached_slow(MemoryRegionCache *cache, hwaddr addr,
>>      mr = address_space_translate_cached(cache, addr, &addr1, &l, false,
>>                                          MEMTXATTRS_UNSPECIFIED);
>>      return flatview_read_continue(cache->fv,
>> -                                  addr, MEMTXATTRS_UNSPECIFIED, buf, len,
>> -                                  addr1, l, mr);
>> +                                  addr_in_cache_to_in_flat_view(cache, addr),
>> +                                  MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
>> +                                  mr);
>>  }
>>
>>  /* Called from RCU critical section. address_space_write_cached uses this
>> @@ -3452,8 +3461,9 @@ address_space_write_cached_slow(MemoryRegionCache *cache, hwaddr addr,
>>      mr = address_space_translate_cached(cache, addr, &addr1, &l, true,
>>                                          MEMTXATTRS_UNSPECIFIED);
>>      return flatview_write_continue(cache->fv,
>> -                                   addr, MEMTXATTRS_UNSPECIFIED, buf, len,
>> -                                   addr1, l, mr);
>> +                                   addr_in_cache_to_in_flat_view(cache, addr),
>> +                                   MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
>> +                                   mr);
>>  }
>>
>>  #define ARG1_DECL                MemoryRegionCache *cache
>> --
>> 2.37.2

This doesn't seem to be in master yet. Maybe it fell through the cracks?

Alberto


