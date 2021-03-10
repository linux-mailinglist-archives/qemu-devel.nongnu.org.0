Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DFB3337A5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:44:10 +0100 (CET)
Received: from localhost ([::1]:37888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJuRt-0003bV-SQ
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJuPt-0002XM-7b
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:42:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJuPr-0003uo-45
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615365722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=joYhIbpcPaNp3ElSvifk+utKlJY+NCRnEW8oQTSJon8=;
 b=iTWonuP1jPfxISXh0MZp1y6Z/L+0WhSt5Wl93tJHOCs0/0XUCYZXtoDLVih3jQXr8Sc4i8
 AodAgQIV5YX37Iq0m79MwMoPRjwN8xRqgChH8pFtnlJM0oZSMRY4J3hYWh/1QZc2ZZ0Vc3
 3CMlxURSHIZcnhrgOzF40XTmoT+rKJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-KqTSe9R1NrC6QqbJ_wd5Zw-1; Wed, 10 Mar 2021 03:42:00 -0500
X-MC-Unique: KqTSe9R1NrC6QqbJ_wd5Zw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A01F8018A7;
 Wed, 10 Mar 2021 08:41:58 +0000 (UTC)
Received: from [10.36.114.87] (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA0DE5C261;
 Wed, 10 Mar 2021 08:41:43 +0000 (UTC)
To: Peter Xu <peterx@redhat.com>
References: <20210309200451.GF763132@xz-x1>
 <29372C8B-7F57-4AB6-99DB-5E73179D7555@redhat.com>
 <20210309205809.GI763132@xz-x1>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v3 09/12] util/mmap-alloc: Pass flags instead of separate
 bools to qemu_ram_mmap()
Message-ID: <8f1f955d-f3b8-298b-eb43-b5d51824af44@redhat.com>
Date: Wed, 10 Mar 2021 09:41:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309205809.GI763132@xz-x1>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.21 21:58, Peter Xu wrote:
> On Tue, Mar 09, 2021 at 09:27:10PM +0100, David Hildenbrand wrote:
>>
>>> Am 09.03.2021 um 21:04 schrieb Peter Xu <peterx@redhat.com>:
>>>
>>> ﻿On Mon, Mar 08, 2021 at 04:05:57PM +0100, David Hildenbrand wrote:
>>>> Let's introduce a new set of flags that abstract mmap logic and replace
>>>> our current set of bools, to prepare for another flag.
>>>>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>> include/qemu/mmap-alloc.h | 17 +++++++++++------
>>>> softmmu/physmem.c         |  8 +++++---
>>>> util/mmap-alloc.c         | 14 +++++++-------
>>>> util/oslib-posix.c        |  3 ++-
>>>> 4 files changed, 25 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
>>>> index 456ff87df1..55664ea9f3 100644
>>>> --- a/include/qemu/mmap-alloc.h
>>>> +++ b/include/qemu/mmap-alloc.h
>>>> @@ -6,6 +6,15 @@ size_t qemu_fd_getpagesize(int fd);
>>>>
>>>> size_t qemu_mempath_getpagesize(const char *mem_path);
>>>>
>>>> +/* Map PROT_READ instead of PROT_READ|PROT_WRITE. */
>>>> +#define QEMU_RAM_MMAP_READONLY      (1 << 0)
>>>> +
>>>> +/* Map MAP_SHARED instead of MAP_PRIVATE. */
>>>> +#define QEMU_RAM_MMAP_SHARED        (1 << 1)
>>>> +
>>>> +/* Map MAP_SYNC|MAP_SHARED_VALIDATE if possible, fallback and warn otherwise. */
>>>> +#define QEMU_RAM_MMAP_PMEM          (1 << 2)
>>>
>>> Sorry to speak late - I just noticed that is_pmem can actually be converted too
>>> with "MAP_SYNC | MAP_SHARED_VALIDATE".  We can even define MAP_PMEM_EXTRA for
>>> use within qemu if we want.  Then we can avoid one layer of QEMU_RAM_* by
>>> directly using MAP_*, I think?
>>>
>>
>> No problem :) I don‘t think passing in random MAP_ flags is a good interface (we would at least need an allow list).
>>
>>   I like the abstraction / explicit semenatics of QEMU_RAM_MMAP_PMEM as spelled out in the comment. Doing the fallback when passing in the mmap flags is a little ugly. We could do the fallback in the caller, I think I remember there is only a single call site.
>>
>> PROT_READ won‘t be covered as well, not sure if passing in protections improves the interface.
>>
>> Long story short, I like the abstraction provided by these flags, only exporting what we actually support/abstracting it, and setting some MAP_ flags automatically (MAP_PRIVATE, MAP_ANON) instead of having to spell that put in the caller.
> 
> Yeh the READONLY flag would be special, it will need to be separated from the
> rest flags.  I'd keep my own preference, but if you really like the current
> way, maybe at least move it to qemu/osdep.h?  So at least when someone needs a
> cross-platform flag they'll show up - while mmap-alloc.h looks still only for
> the posix world, then it'll be odd to introduce these flags only for posix even
> if posix definied most of them.

I'll give it another thought today. I certainly want to avoid moving all 
that MAP_ flag and PROT_ logic to the callers. E.g., MAP_SHARED implies 
!MAP_PRIVATE. MAP_SYNC implies that we want MAP_SHARED_VALIDATE. fd < 0 
implies MAP_ANONYMOUS.

Maybe something like

/*
  * QEMU's MMAP abstraction to map guest RAM, taking care of alignment
  * requirements and guard pages.
  *
  * Supported flags: MAP_SHARED, MAP_SYNC
  *
  * Implicitly set flags:
  * - MAP PRIVATE: When !MAP_SHARED and !MAP_SYNC
  * - MAP_ANONYMOUS: When fd < 0
  * - MAP_SHARED_VALIDATE: When MAP_SYNC
  *
  * If mapping with MAP_SYNC|MAP_SHARED_VALIDATE fails, fallback to
  * !MAP_SYNC|MAP_SHARED and warn.
  */
  void *qemu_ram_mmap(int fd,
                      size_t size,
                      size_t align,
                      bool readonly,
                      uint32_t mmap_flags,
                      off_t map_offset);


I also thought about introducing
	QEMU_MAP_READONLY 0x100000000ul

and using "uint64_t mmap_flags" - thoughts?

> 
> At the meantime, maybe rename QEMU_RAM_MMAP_* to QEMU_MMAP_* too?  All of them
> look applicable to no-RAM-backends too.

Hm, I don't think this is a good idea unless we would have something 
like qemu_mmap() - which I don't think we'll have in the near future.

-- 
Thanks,

David / dhildenb


