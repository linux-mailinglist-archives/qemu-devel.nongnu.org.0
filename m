Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22153C6E59
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:23:29 +0200 (CEST)
Received: from localhost ([::1]:54984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3FZZ-0007aF-0v
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m3FYX-0006i9-Bt
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:22:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m3FYU-0004F3-AZ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:22:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626171740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MUt8GDjPfxK/nCgyW2MK4q/JJAJ4bPQ81O6I2j/jy6Q=;
 b=c6ILPY2gfGMWdrJzjt/DXiArfhl+6s/edp1S+KhLz/TV1dD8BLb40ACiqZGzgtJvUd/6Zb
 BxL4g8suS7fFP/Xn2sQcqTz+h0xcLmGzqvYkE9oaLs/C6AHUwQubA+JtuoAxcfpcLCOYFq
 uZNR8qGXKuAyZKUhnZOktkOsEONho68=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-9dcBt7E8PB2A-nkyX_ybfg-1; Tue, 13 Jul 2021 06:22:18 -0400
X-MC-Unique: 9dcBt7E8PB2A-nkyX_ybfg-1
Received: by mail-wr1-f69.google.com with SMTP id
 j6-20020adff5460000b029013c7749ad05so6193164wrp.8
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 03:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=MUt8GDjPfxK/nCgyW2MK4q/JJAJ4bPQ81O6I2j/jy6Q=;
 b=TR5RTbkN06sr/qbp9oEJbxBnb4keux8cRRBC8U36BKNd1VSdnK/dvjkzEv4uxAn4Yg
 ZuM8FSIpCWRhHIdVfkB5v1OXnaRQ3XOKyLQ9zAU5oyj1jhJ5dD+f+H7yJzvG5HisZB5d
 z1D9I4pmU4yHJZd9vaD31U5z7NHQ5AbiF0FteqMYEPWgmvz+IYEr62ALD6lhKyQvdDJJ
 dBjcfi6ztcel2Dvradm5alVcROSX5ZYfvK4+f/XYro14rkuBSwKqbhlOLm8HqbUsO6R5
 FeK6xkEf542fNu5e2itjve2ERw6RjCZ8bx5Q6a1R+Tb243ODSEWiWSgdpymx5euq0nVf
 R9kA==
X-Gm-Message-State: AOAM532wojCeSTKNCblalgM97tvdRzyw1r+QJX/pLzU0dj+cPsLpSzr0
 eRljuVYZY/99plwTRPMgADRGzFvVt4EuGKyo2Y8AdPoV+zcKOu0oKandwYCBM2nXuWdn8K3CSnf
 9gpSTbqckhlm3B2E=
X-Received: by 2002:adf:ce10:: with SMTP id p16mr4672154wrn.205.1626171737560; 
 Tue, 13 Jul 2021 03:22:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsar1EYYWTGZuOOs1AITrpx7wkowAvss5HN8ZQEnUjFVcRlMH6rhukhKJulFbaOvQ7Va4qhg==
X-Received: by 2002:adf:ce10:: with SMTP id p16mr4672136wrn.205.1626171737320; 
 Tue, 13 Jul 2021 03:22:17 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id f13sm17651288wrt.86.2021.07.13.03.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 03:22:16 -0700 (PDT)
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
To: "Wang, Wei W" <wei.w.wang@intel.com>, Peter Xu <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210630200805.280905-1-peterx@redhat.com>
 <9a8224c9a02b4d9395f6581b24deaa54@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <c12b6a4e-0802-6cfa-57b2-7c7f4e4f5241@redhat.com>
Date: Tue, 13 Jul 2021 12:22:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9a8224c9a02b4d9395f6581b24deaa54@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.07.21 10:40, Wang, Wei W wrote:
> On Thursday, July 1, 2021 4:08 AM, Peter Xu wrote:
>> Taking the mutex every time for each dirty bit to clear is too slow, especially we'll
>> take/release even if the dirty bit is cleared.  So far it's only used to sync with
>> special cases with qemu_guest_free_page_hint() against migration thread,
>> nothing really that serious yet.  Let's move the lock to be upper.
>>
>> There're two callers of migration_bitmap_clear_dirty().
>>
>> For migration, move it into ram_save_iterate().  With the help of MAX_WAIT
>> logic, we'll only run ram_save_iterate() for no more than 50ms-ish time, so taking
>> the lock once there at the entry.  It also means any call sites to
>> qemu_guest_free_page_hint() can be delayed; but it should be very rare, only
>> during migration, and I don't see a problem with it.
>>
>> For COLO, move it up to colo_flush_ram_cache().  I think COLO forgot to take
>> that lock even when calling ramblock_sync_dirty_bitmap(), where another
>> example is migration_bitmap_sync() who took it right.  So let the mutex cover
>> both the
>> ramblock_sync_dirty_bitmap() and migration_bitmap_clear_dirty() calls.
>>
>> It's even possible to drop the lock so we use atomic operations upon rb->bmap
>> and the variable migration_dirty_pages.  I didn't do it just to still be safe, also
>> not predictable whether the frequent atomic ops could bring overhead too e.g.
>> on huge vms when it happens very often.  When that really comes, we can
>> keep a local counter and periodically call atomic ops.  Keep it simple for now.
>>
>> Cc: Wei Wang <wei.w.wang@intel.com>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Cc: Juan Quintela <quintela@redhat.com>
>> Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
>> Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> FWIW
> Reviewed-by: Wei Wang <wei.w.wang@intel.com>
> 
> If no one could help do a regression test of free page hint, please document something like this in the patch:
> Locking at the coarser granularity is possible to minimize the improvement brought by free page hints, but seems not causing critical issues.
> We will let users of free page hints to report back any requirement and come up with a better solution later.

Can you send an official patch for the free page hinting clean_bmap 
handling I reported?

I can then give both tests in combination a quick test (before/after 
this patch here).

Cheers

-- 
Thanks,

David / dhildenb


