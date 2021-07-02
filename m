Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F9B3B9CBB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 09:08:07 +0200 (CEST)
Received: from localhost ([::1]:60418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzDHS-0006LM-Dm
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 03:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lzDGM-0005eK-2D
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 03:06:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lzDGK-0000Gu-2K
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 03:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625209615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzIlk66yEx93g1wZGKIlqOLGCHpKNJUpHs98PZcHugE=;
 b=Cv38RATcheeDoPzpj9jy6LSuwMAGKQ1cHjjBtEKFvTMxW1CDOSUN0pr2iQL7EzrG+gAGQw
 DPHcmN6CmkiXADa8HFf2oiWS/6cUSB6J9O3hbObcrpn5bVp3MS9qhinz57WPsFh38rLFdF
 PNDFH/qvQ5TXV4JygQpmdAxZZGaqO1k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-WaqNapl8MEWJMJ2Sa70FFg-1; Fri, 02 Jul 2021 03:06:47 -0400
X-MC-Unique: WaqNapl8MEWJMJ2Sa70FFg-1
Received: by mail-wm1-f69.google.com with SMTP id
 13-20020a1c010d0000b02901eca51685daso5866753wmb.3
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 00:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TzIlk66yEx93g1wZGKIlqOLGCHpKNJUpHs98PZcHugE=;
 b=IUbr14EZVtg7yboydraffrWnilE+YnxcGNy/obUN5d6r80KnopFRhAmeupBgqtQ5Zb
 zAnnMx8rvc4o/LE6nIpOd5iUFooAYD9Qd0Ex9vkfwNztT7A66OHB8IiHfKVOTrglK3Fu
 XgkEU+7nOo4mzwVEKcDdHFw4cR4FGM/TyVpYtgPV/AZWQntlqZGfYnmmaldv4La7ttfR
 ibGw4NXc+dGiWmFCk+Xga0u+WRGfbls9/eJW3oHcAYjTY/I2hgLlEe4MmOR0Co6tOVL1
 m1YeUxMSNIv7hHdlDVy418HG6hffIIbOy0RXnWqfGqVFPh5ysxcJES4A0ihqCczc3J2q
 D6ug==
X-Gm-Message-State: AOAM530YI8fyBWdTyM6115lBIYmWwZCsRxRYAma309vtczglz5Ke6kba
 dSsJnuaiNbdIQu3Zgnp3O1AVy02s/HUD/wq62Y+4CWS0b8G+LbRrhzc+mOivEYU/+xKL+pQtmyW
 5UcvJgquvXg/Uq3s=
X-Received: by 2002:a05:600c:3589:: with SMTP id
 p9mr15062584wmq.182.1625209606335; 
 Fri, 02 Jul 2021 00:06:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlfF7cm4bxWkVf+2/D4xg2DDdpzU7jInllEpzdLrG8zACl4Vn0yZ9Krqu/9hY0+7FBpFdd2w==
X-Received: by 2002:a05:600c:3589:: with SMTP id
 p9mr15062561wmq.182.1625209606111; 
 Fri, 02 Jul 2021 00:06:46 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23afb.dip0.t-ipconnect.de. [79.242.58.251])
 by smtp.gmail.com with ESMTPSA id 31sm2409475wrs.79.2021.07.02.00.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 00:06:45 -0700 (PDT)
To: "Wang, Wei W" <wei.w.wang@intel.com>, Peter Xu <peterx@redhat.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com> <YN26SDxZS1aShbHi@t490s>
 <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
 <604935aa45114d889800f6ccc23c6b13@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <824a1d77-eab0-239f-5104-49c49d6ad285@redhat.com>
Date: Fri, 2 Jul 2021 09:06:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <604935aa45114d889800f6ccc23c6b13@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.07.21 04:48, Wang, Wei W wrote:
> On Thursday, July 1, 2021 10:22 PM, David Hildenbrand wrote:
>> On 01.07.21 14:51, Peter Xu wrote:
>> Spoiler alert: the introduction of clean bitmaps partially broke free page hinting
>> already (as clearing happens deferred -- and might never happen if we don't
>> migrate *any* page within a clean bitmap chunk, so pages actually remain
>> dirty ...). "broke" here means that pages still get migrated even though they
>> were reported by the guest. We'd actually not want to use clean bmaps with free
>> page hinting ... long story short, free page hinting is a very fragile beast already
>> and some of the hints are basically ignored and pure overhead ...
> 
> Not really. Both clear_bmap and free page hint are to "clear" the bitmap.
> No matter who comes first to clear it, it won’t cause more (unexpected) pages to be sent.

I was able to reproduce something like that before my vacation by 
starting a 8GB VM, wait until Linux is up, migrate it.

With clear_bmap:

QEMU 6.0.50 monitor - type 'help' for more information
(qemu) info migrate
globals:
store-global-state: on
only-migratable: off
send-configuration: on
send-section-footer: on
decompress-error-check: on
clear-bitmap-shift: 18
Migration status: completed
total time: 4532 ms
downtime: 4 ms
setup: 3 ms
transferred ram: 578480 kbytes
throughput: 1047.05 mbps
remaining ram: 0 kbytes
total ram: 8389384 kbytes
duplicate: 1080349 pages
skipped: 0 pages
normal: 141969 pages
normal bytes: 567876 kbytes
dirty sync count: 4
page size: 4 kbytes
multifd bytes: 0 kbytes
pages-per-second: 4102921
(qemu)

Without clear_bmap:

(qemu) info migrate
globals:
store-global-state: on
only-migratable: off
send-configuration: on
send-section-footer: on
decompress-error-check: on
clear-bitmap-shift: 18
Migration status: completed
total time: 4891 ms
downtime: 61 ms
setup: 29 ms
transferred ram: 666400 kbytes
throughput: 1123.47 mbps
remaining ram: 0 kbytes
total ram: 8389384 kbytes
duplicate: 33427 pages
skipped: 0 pages
normal: 166202 pages
normal bytes: 664808 kbytes
dirty sync count: 4
page size: 4 kbytes
multifd bytes: 0 kbytes
pages-per-second: 32386
(qemu)

Without free page hinting:

QEMU 6.0.50 monitor - type 'help' for more information
(qemu) info migrate
globals:
store-global-state: on
only-migratable: off
send-configuration: on
send-section-footer: on
decompress-error-check: on
clear-bitmap-shift: 18
Migration status: completed
total time: 4975 ms
downtime: 48 ms
setup: 3 ms
transferred ram: 639982 kbytes
throughput: 1055.09 mbps
remaining ram: 0 kbytes
total ram: 8389384 kbytes
duplicate: 1942431 pages
skipped: 0 pages
normal: 155424 pages
normal bytes: 621696 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 0 kbytes
pages-per-second: 32386
(qemu)


Take a look at "duplicate". We seem to end up reading+migrating a lot 
more pages (all filled with zero, as the guest never touched them) with 
clear_bmap, but not as much as with free page hinting disabled.


Repeating the same experiment (not performing the "no free page hinting" 
step) by running "memhog 7g" in the guest before migrating, such that we 
don't have all-zero pages:

With clear_bmap:

QEMU 6.0.50 monitor - type 'help' for more information
(qemu) info migrate
globals:
store-global-state: on
only-migratable: off
send-configuration: on
send-section-footer: on
decompress-error-check: on
clear-bitmap-shift: 18
Migration status: completed
total time: 28574 ms
downtime: 73 ms
setup: 4 ms
transferred ram: 3715000 kbytes
throughput: 1065.33 mbps
remaining ram: 0 kbytes
total ram: 8389384 kbytes
duplicate: 21472 pages
skipped: 0 pages
normal: 926892 pages
normal bytes: 3707568 kbytes
dirty sync count: 4
page size: 4 kbytes
multifd bytes: 0 kbytes
pages-per-second: 32710
(qemu)

Without clear_bmap:

QEMU 6.0.50 monitor - type 'help' for more information
(qemu) info migrate
globals:
store-global-state: on
only-migratable: off
send-configuration: on
send-section-footer: on
decompress-error-check: on
clear-bitmap-shift: 18
Migration status: completed
total time: 5818 ms
downtime: 24 ms
setup: 29 ms
transferred ram: 672486 kbytes
throughput: 952.18 mbps
remaining ram: 0 kbytes
total ram: 8389384 kbytes
duplicate: 19449 pages
skipped: 0 pages
normal: 167751 pages
normal bytes: 671004 kbytes
dirty sync count: 4
page size: 4 kbytes
multifd bytes: 0 kbytes
pages-per-second: 32710
(qemu)



I think that clearly shows the issue.

My theory I did not verify yet: Assume we have 1GB chunks in the clear 
bmap. Assume the VM reports all pages within a 1GB chunk as free (easy 
with a fresh VM). While processing hints, we will clear the bits from 
the dirty bmap in the RAMBlock. As we will never migrate any page of 
that 1GB chunk, we will not actually clear the dirty bitmap of the 
memory region. When re-syncing, we will set all bits bits in the dirty 
bmap again from the dirty bitmap in the memory region. Thus, many of our 
hints end up being mostly ignored. The smaller the clear bmap chunk, the 
more extreme the issue.

-- 
Thanks,

David / dhildenb


