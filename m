Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642BA3D22E5
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 13:45:55 +0200 (CEST)
Received: from localhost ([::1]:50052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6X9G-0001G8-14
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 07:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6X7H-0000ZI-MJ
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 07:43:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6X7E-0007r7-7u
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 07:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626954225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HtDUZPOGYtaEUVx7lGBDTp01QWz1Jl8EDk9+y7S5bbA=;
 b=aHfa7K8hbi6YLj8fxgtPKXkPHMjNN0NoDcBHmnXmjhhC3TtXwUNdp4qApiNMjo7J14Vg2a
 KQNIomavoQ6zvVJ0Rq0IwNCucDidLSd2Abch09/1mIlOgl61U+8BcLA+DqYoemli2wI7R5
 WtwkXAmo4h6KH8rcx63+FuUVccFunG8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-YP2noPMOOQuLoMKy2JN0IQ-1; Thu, 22 Jul 2021 07:43:44 -0400
X-MC-Unique: YP2noPMOOQuLoMKy2JN0IQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 y15-20020a5d614f0000b029013cd60e9baaso2359151wrt.7
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 04:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=HtDUZPOGYtaEUVx7lGBDTp01QWz1Jl8EDk9+y7S5bbA=;
 b=YS7a6g2FvZzrKmN8xsjYQ+exe8v2yBZc2zC7KPeVr2piaKHkT/OdWaWIEVx/zxzY9x
 ZNNG5RGYsnjHC5ZcLX5QTKtMwomB8jcnkm687jWH+83IUtQNMaFPERFBXoWGar2JYrfR
 LK6vI5JKN5uiZQWj8q87eayPiGdSmvOlFnlExgqEW2cgOMaAUqc7HEXfPnGeB7GiietX
 Xre4od5wTkIY07FwjMhLHqKqktzVQoDlOE7QULBdrnzH8w0jkcD7VKZmVx59Qe2DdYXI
 6dVUwvs20/0NqCy8tcYeNAblSh0SkGQlNM8oonCzVmRmeU+0nRd8QfgKM3FxNjKZ8Qqk
 L4cg==
X-Gm-Message-State: AOAM5305hpFmbR6sUiClD6hAfzqnhQ6bEA7Zk6Qf5oYqFwWwyd5P2cVJ
 dTajopHFpDWwRq2Cp3M0QygAF8sL76U7wILqimSYdaOpjBwH07L86IV6Fe460l5uzOJBxz9LIGV
 V2QgGCNoBHAslCCA=
X-Received: by 2002:a7b:c208:: with SMTP id x8mr8790302wmi.187.1626954222890; 
 Thu, 22 Jul 2021 04:43:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcMBf68MlF4WocrowpVgf7HP0Qw3E+m6dTDpj2+x5nn2wnWKLqIavrwwtz4boUvo+f62ZHuw==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr8790280wmi.187.1626954222681; 
 Thu, 22 Jul 2021 04:43:42 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6970.dip0.t-ipconnect.de. [91.12.105.112])
 by smtp.gmail.com with ESMTPSA id o5sm2326059wms.43.2021.07.22.04.43.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 04:43:42 -0700 (PDT)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210721092759.21368-1-david@redhat.com>
 <YPlWqs8N+NiFH/yj@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <800e421c-70b8-1ef2-56f7-cdbce7a7706b@redhat.com>
Date: Thu, 22 Jul 2021 13:43:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPlWqs8N+NiFH/yj@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.07.21 13:29, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> virtio-mem exposes a dynamic amount of memory within RAMBlocks by
>> coordinating with the VM. Memory within a RAMBlock can either get
>> plugged and consequently used by the VM, or unplugged and consequently no
>> longer used by the VM. Logical unplug is realized by discarding the
>> physical memory backing for virtual memory ranges, similar to memory
>> ballooning.
>>
>> However, important difference to virtio-balloon are:
>>
>> a) A virtio-mem device only operates on its assigned memory region /
>>     RAMBlock ("device memory")
>> b) Initially, all device memory is logically unplugged
>> c) Virtual machines will never accidentally reuse memory that is currently
>>     logically unplugged. The spec defines most accesses to unplugged memory
>>     as "undefined behavior" -- except reading unplugged memory, which is
>>     currently expected to work, but that will change in the future.
>> d) The (un)plug granularity is in the range of megabytes -- "memory blocks"
>> e) The state (plugged/unplugged) of a memory block is always known and
>>     properly tracked.
>>
>> Whenever memory blocks within the RAMBlock get (un)plugged, changes are
>> communicated via the RamDiscardManager to other QEMU subsystems, most
>> prominently vfio which updates the DMA mapping accordingly. "Unplugging"
>> corresponds to "discarding" and "plugging" corresponds to "populating".
>>
>> While migrating (precopy/postcopy) that state of such memory blocks cannot
>> change.
> 
> So no plugging/unplugging can happen during the migration?

Exactly:

static bool virtio_mem_is_busy(void)
{
     /*
      * Postcopy cannot handle concurrent discards and we don't want to migrate
      * pages on-demand with stale content when plugging new blocks.
      *
      * For precopy, we don't want unplugged blocks in our migration stream, and
      * when plugging new blocks, the page content might differ between source
      * and destination (observable by the guest when not initializing pages
      * after plugging them) until we're running on the destination (as we didn't
      * migrate these blocks when they were unplugged).
      */
     return migration_in_incoming_postcopy() || !migration_is_idle();
}

[...]

>>
>> Let's reuse the RamDiscardManager infrastructure to essentially handle
>> precopy, postcopy and background snapshots cleanly, which means:
>>
>> a) In precopy code, always clearing all dirty bits from the bitmap that
>>     correspond to discarded range, whenever we update the dirty bitmap. This
>>     results in logically unplugged memory to never get migrated.
> 
> Have you seen cases where discarded areas are being marked as dirty?
> That suggests something somewhere is writing to them and shouldn't be.

I have due to sub-optimal clear_bmap handling to be sorted out by

https://lkml.kernel.org/r/20210722083055.23352-1-wei.w.wang@intel.com

Whereby the issue is rather that initially dirty bits don't get cleared in
lower layers and keep popping up as dirty.

The issue with postcopy recovery code setting discarded ranges dirty in
the dirty bitmap, I did not try reproducing. But from looking at the
code, it's pretty clear that it would happen.

Apart from that, nothing should dirty that memory. Of course,
malicious guests could trigger it for now, in which case we wouldn't catch it
and migrate such pages with postcopy, because the final bitmap sync in
ram_postcopy_send_discard_bitmap() is performed without calling notifiers
right now.

-- 
Thanks,

David / dhildenb


