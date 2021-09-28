Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B1841B191
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 16:05:58 +0200 (CEST)
Received: from localhost ([::1]:42544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVDk5-0000Tf-J5
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 10:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVDg6-00055o-UC
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 10:01:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVDg5-00030T-1Q
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 10:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632837708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YlYehJdj67qgoAunCag/J/4Pk7lysiTbNyTLe/0Wj0k=;
 b=GoH8l2QBCzO4caDnaGR6z1KOcXmyVCRy6Aqf92+495wvQQdClwQVQxOV6jsc0qjfc9KUUl
 T9NAf6Qpo99XlLvi2fmlWaawl1ZzVuXiPOYoNvbLYbt8SUOhivqM+MjV3fSLDLNc3CCZti
 QVUtoX/ODdnCFvpxiUqSpk3vGlS+dtU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-iPTIljUuPCC3inbTqVTjKA-1; Tue, 28 Sep 2021 10:01:44 -0400
X-MC-Unique: iPTIljUuPCC3inbTqVTjKA-1
Received: by mail-wr1-f71.google.com with SMTP id
 a10-20020a5d508a000000b00160723ce588so566247wrt.23
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 07:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YlYehJdj67qgoAunCag/J/4Pk7lysiTbNyTLe/0Wj0k=;
 b=yoFNBXsFEM76RN+7RhFiMI1VuspPg1SUrpTCG3ci3IowzNitzGHmIG7UDMs5v17SJD
 XWVkY8PWfaNf2nLv4347y1Eu/27Lt021FnjKNkJzDGl8crbbpWxmmArIWDXt7qBoHD7+
 bVr5CZByNf8AUhWH+4hU0YkKUjjdHqRCG5eY+yDGhCjYFxYcCQU9DqpTwojfE1epkbjj
 vAgtB9R/TeOs7BnVaCj6huiXMLdZ+Yr+bMdBLXQ0bOCs9k4wuCm2GZLOdnELBQY+/9zh
 MN4yquW+7Jxx2chvCg0x9B0F2x9v/1nkUBWA9fEbvvsYxnb9LUPbdlo5tEXnZ3aa4rzs
 5miA==
X-Gm-Message-State: AOAM532ZmV9seeWBqbkTh/Aqko2XSpPfch+Rdf6OJ1wIl0ftQVp5/Js/
 1dyumef0clTqZMMOh6UsS9jk/f68t1DacJdbKFSfHq9uHsNslhjuCWlP+lBgQhRwu2h9MilKMrS
 fstwU6Fh+ezz38bw=
X-Received: by 2002:a05:6000:81:: with SMTP id m1mr123404wrx.389.1632837703422; 
 Tue, 28 Sep 2021 07:01:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB8xyfRKqDs1yb9341gdkBJeQbcQNGH2JBe4V29FcIU7XFCdNREAo/bYsKBhrD1eUSHEqcRQ==
X-Received: by 2002:a05:6000:81:: with SMTP id m1mr123378wrx.389.1632837703229; 
 Tue, 28 Sep 2021 07:01:43 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23aaf.dip0.t-ipconnect.de. [79.242.58.175])
 by smtp.gmail.com with ESMTPSA id z6sm4089372wmp.1.2021.09.28.07.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 07:01:42 -0700 (PDT)
Subject: Re: [PATCH v5 0/9] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
To: qemu-devel@nongnu.org
References: <20210904160913.17785-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d6a57ce1-ae0b-185a-7598-746adf1c19dd@redhat.com>
Date: Tue, 28 Sep 2021 16:01:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210904160913.17785-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.09.21 18:09, David Hildenbrand wrote:
> virtio-mem exposes a dynamic amount of memory within RAMBlocks by
> coordinating with the VM. Memory within a RAMBlock can either get
> plugged and consequently used by the VM, or unplugged and consequently no
> longer used by the VM. Logical unplug is realized by discarding the
> physical memory backing for virtual memory ranges, similar to memory
> ballooning.
> 
> However, important difference to virtio-balloon are:
> 
> a) A virtio-mem device only operates on its assigned memory region /
>     RAMBlock ("device memory")
> b) Initially, all device memory is logically unplugged
> c) Virtual machines will never accidentally reuse memory that is currently
>     logically unplugged. The spec defines most accesses to unplugged memory
>     as "undefined behavior" -- except reading unplugged memory, which is
>     currently expected to work, but that will change in the future.
> d) The (un)plug granularity is in the range of megabytes -- "memory blocks"
> e) The state (plugged/unplugged) of a memory block is always known and
>     properly tracked.
> 
> Whenever memory blocks within the RAMBlock get (un)plugged, changes are
> communicated via the RamDiscardManager to other QEMU subsystems, most
> prominently vfio which updates the DMA mapping accordingly. "Unplugging"
> corresponds to "discarding" and "plugging" corresponds to "populating".
> 
> While migrating (precopy/postcopy) that state of such memory blocks cannot
> change, as virtio-mem will reject any guest requests that would change
> the state of blocks with "busy". We don't want to migrate such logically
> unplugged memory, because it can result in an unintended memory consumption
> both, on the source (when reading memory from some memory backends) and on
> the destination (when writing memory). Further, migration time can be
> heavily reduced when skipping logically unplugged blocks and we avoid
> populating unnecessary page tables in Linux.
> 
> Right now, virtio-mem reuses the free page hinting infrastructure during
> precopy to exclude all logically unplugged ("discarded") parts from the
> migration stream. However, there are some scenarios that are not handled
> properly and need fixing. Further, there are some ugly corner cases in
> postcopy code and background snapshotting code that similarly have to
> handle such special RAMBlocks.
> 
> Let's reuse the RamDiscardManager infrastructure to essentially handle
> precopy, postcopy and background snapshots cleanly, which means:
> 
> a) In precopy code, fixing up the initial dirty bitmaps (in the RAMBlock
>     and e.g., KVM) to exclude discarded ranges.
> b) In postcopy code, placing a zeropage when requested to handle a page
>     falling into a discarded range -- because the source will never send it.
>     Further, fix up the dirty bitmap when overwriting it in recovery mode.
> c) In background snapshot code, never populating discarded ranges, not even
>     with the shared zeropage, to avoid unintended memory consumption,
>     especially in the future with hugetlb and shmem.
> 
> Detail: When realizing a virtio-mem devices, it will register the RAM
>          for migration via vmstate_register_ram(). Further, it will
>          set itself as the RamDiscardManager for the corresponding memory
>          region of the RAMBlock via memory_region_set_ram_discard_manager().
>          Last but not least, memory device code will actually map the
>          memory region into guest physical address space. So migration
>          code can always properly identify such RAMBlocks.
> 
> Tested with precopy/postcopy on shmem, where even reading unpopulated
> memory ranges will populate actual memory and not the shared zeropage.
> Tested with background snapshots on anonymous memory, because other
> backends are not supported yet with upstream Linux.
> 

Gentle ping.


-- 
Thanks,

David / dhildenb


