Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B933F7EC9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 00:52:01 +0200 (CEST)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ1kW-0000Ud-DU
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 18:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJ1jK-0008Gm-21
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 18:50:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJ1jI-000129-20
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 18:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629931843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BgDTBFE5vq39MbjQXZyudi2vYR4OT/NwBSGhSHhu1H8=;
 b=W1B1J/J3PfKr1GdHSbLqOiTreHIY+m7zvfq8H8AT3K+nzp2qBW7lghQYQ/TQSe7HxS8Z/H
 xxXUnf1VLnqSyLVfV8N/OBNl0JZrje+pfD/vV/MuTHqpeH2BE1vHIKZUElziP/6oCGF/0c
 HsecjuozkKspoZyowpev0TJfODYxpIA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-M7aWIe12NuSooWyHOp3t8Q-1; Wed, 25 Aug 2021 18:50:40 -0400
X-MC-Unique: M7aWIe12NuSooWyHOp3t8Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 c4-20020a1c9a04000000b002e864b7edd1so201944wme.6
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 15:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BgDTBFE5vq39MbjQXZyudi2vYR4OT/NwBSGhSHhu1H8=;
 b=uCgFzgNPKwbpzV2a+69VL/6YLO3eIft/3o0YdOx+6W3unvGw7oqZykddRYjPxr8R6G
 3jtf+0LSKSVdjBkn/Kx6FugTLFdj/jOedyuSzY9jQGMRwawvnY0/1zGRE8mWzYoCF4st
 UmHDi42xsutYm+CNJlztiyAYkjLv0+ZYnuNnjI30GrKSBWgHLK/Qlb3LE4gOvC+fjthq
 VGCSGMu77Z8zNHWlHUXuOjRbVerzmq4nR7c2ZREVX/8KIbUVTMnOi2IOeabSXcczlM9g
 icpq3exIpsm7BkF9BAgb0dK0Mb0DrpOHyMyt0+8ZwSq4ACPTq0hSUTtc1ffsKdeiktTr
 EBpQ==
X-Gm-Message-State: AOAM5331SUqEIgMwuuxTMdaexFWycBc8rxRHZHYOKVQFzfijCID1EJ2A
 M+SPYblUvRac568hh4K26Tvb3nJCZMh/n7jxFhhLK0pYc0cFt81Ywj28RIKFbSTXAphhgQMpqCP
 aDF9hu+8J3wwbe24=
X-Received: by 2002:a05:600c:19c7:: with SMTP id
 u7mr11494062wmq.61.1629931838341; 
 Wed, 25 Aug 2021 15:50:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQaM2Nn4+NSEqIWbOwpqRpRxZhrK21io3lMryjWb5iJwVfrrgcFef+r3oX2vG7I8eDs9rEmA==
X-Received: by 2002:a05:600c:19c7:: with SMTP id
 u7mr11494041wmq.61.1629931838095; 
 Wed, 25 Aug 2021 15:50:38 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id v5sm1165646wrw.44.2021.08.25.15.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 15:50:37 -0700 (PDT)
Subject: Re: [RFC PATCH] hw/virtio: Do not access vring cache if queue is not
 ready
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
References: <20210825200953.1684541-1-philmd@redhat.com>
 <9ea6cdbd-4ad0-f10c-5229-a68e31fa90c2@redhat.com>
Message-ID: <8cf6fe34-284b-7681-58a4-bccb8849f75f@redhat.com>
Date: Thu, 26 Aug 2021 00:50:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9ea6cdbd-4ad0-f10c-5229-a68e31fa90c2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.24, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cheolwoo Myung <cwmyung@snu.ac.kr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/21 10:36 PM, Philippe Mathieu-Daudé wrote:
> On 8/25/21 10:09 PM, Philippe Mathieu-Daudé wrote:
>> Do not intent to access the vring MemoryRegion cache if
>> the queue is not ready (no vring available).
>>
>> This fixes issue #301:
>>
>>   qemu-system-i386: include/exec/memory_ldst_cached.h.inc:77: void address_space_stw_le_cached(MemoryRegionCache *, hwaddr, uint16_t, MemTxAttrs, MemTxResult *):
>>   Assertion `addr < cache->len && 2 <= cache->len - addr' failed.
>>   Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
>>   (gdb) bt
>>   #1  0x00007ffff4d1a8a4 in abort () at /lib64/libc.so.6
>>   #4  0x0000555558f2a122 in address_space_stw_le_cached (cache=0x61300010bb70, addr=516, val=0, attrs=..., result=0x0) at include/exec/memory_ldst_cached.h.inc:77
>>   #5  0x0000555558f2964c in stw_le_phys_cached (cache=0x61300010bb70, addr=516, val=0) at include/exec/memory_ldst_phys.h.inc:109
>>   #6  0x0000555558f28da8 in virtio_stw_phys_cached (vdev=0x62d00004e680, cache=0x61300010bb70, pa=516, value=0) at include/hw/virtio/virtio-access.h:196
>>   #7  0x0000555558f287dc in vring_set_avail_event (vq=0x7fff5d23e800, val=0) at hw/virtio/virtio.c:428
>>   #8  0x0000555558efabb7 in virtio_queue_split_set_notification (vq=0x7fff5d23e800, enable=1) at hw/virtio/virtio.c:437
>>   #9  0x0000555558ef9f3c in virtio_queue_set_notification (vq=0x7fff5d23e800, enable=1) at hw/virtio/virtio.c:498
>>   #10 0x0000555558c94786 in virtio_blk_handle_vq (s=0x62d00004e680, vq=0x7fff5d23e800) at hw/block/virtio-blk.c:795
>>   #11 0x0000555558cb96c2 in virtio_blk_data_plane_handle_output (vdev=0x62d00004e680, vq=0x7fff5d23e800) at hw/block/dataplane/virtio-blk.c:165
>>   #12 0x0000555558f35937 in virtio_queue_notify_aio_vq (vq=0x7fff5d23e800) at hw/virtio/virtio.c:2323
>>   #13 0x0000555558f264b3 in virtio_queue_host_notifier_aio_read (n=0x7fff5d23e87c) at hw/virtio/virtio.c:3532
>>   #14 0x0000555559a9cd3e in aio_dispatch_handler (ctx=0x613000063000, node=0x60d000008f40) at util/aio-posix.c:329
>>   #15 0x0000555559a963ae in aio_dispatch_handlers (ctx=0x613000063000) at util/aio-posix.c:372
>>   #16 0x0000555559a95f82 in aio_dispatch (ctx=0x613000063000) at util/aio-posix.c:382
>>
>> and  #302:
>>
>>   qemu-system-i386: include/exec/memory_ldst_cached.h.inc:30: uint16_t address_space_lduw_le_cached(MemoryRegionCache *, hwaddr, MemTxAttrs, MemTxResult *):
>>   Assertion `addr < cache->len && 2 <= cache->len - addr' failed.
>>   Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
>>   0x00007ffff4d312a2 in raise () from /lib64/libc.so.6
>>   (gdb) bt
>>   #1  0x00007ffff4d1a8a4 in abort () at /lib64/libc.so.6
>>   #4  0x0000555558f2b8ec in address_space_lduw_le_cached (cache=0x61300010a7c0, addr=134, attrs=..., result=0x0) at include/exec/memory_ldst_cached.h.inc:30
>>   #5  0x0000555558f2ac6b in lduw_le_phys_cached (cache=0x61300010a7c0, addr=134) at include/exec/memory_ldst_phys.h.inc:67
>>   #6  0x0000555558f2a3cd in virtio_lduw_phys_cached (vdev=0x62d00003a680, cache=0x61300010a7c0, pa=134) at include/hw/virtio/virtio-access.h:166
>>   #7  0x0000555558f300ea in vring_avail_ring (vq=0x7fffdd55d8a0, i=65) at hw/virtio/virtio.c:326
>>   #8  0x0000555558f33b10 in vring_get_used_event (vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:332
>>   #9  0x0000555558f33677 in virtio_split_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2471
>>   #10 0x0000555558f1859f in virtio_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2523
>>   #11 0x0000555558f188cc in virtio_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2565
>>   #12 0x0000555557c2bd52 in virtio_input_handle_sts (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/input/virtio-input.c:100
>>   #13 0x0000555558f16df7 in virtio_queue_notify (vdev=0x62d00003a680, n=1) at hw/virtio/virtio.c:2363
>>   #14 0x00005555583f45c0 in virtio_pci_notify_write (opaque=0x62d000032400, addr=7, val=0, size=1) at hw/virtio/virtio-pci.c:1369
>>   #15 0x0000555558b80b04 in memory_region_write_accessor (mr=0x62d000033190, addr=7, value=0x7fffffff8eb0, size=1, shift=0, mask=255, attrs=...) at softmmu/memory.c:492
>>
>> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
>> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/301
>> BugLink: https://bugs.launchpad.net/qemu/+bug/1910941
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/302
>> BugLink: https://bugs.launchpad.net/qemu/+bug/1913510
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Could be more readable to use virtio_queue_ready()
>>
>> RFC because I have no clue about this hot path code,
>> I simply looked at the backtraces.
>> ---
>>  hw/virtio/virtio.c | 82 +++++++++++++++++++++++++++++++++++++---------
>>  1 file changed, 66 insertions(+), 16 deletions(-)
>>
>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index 874377f37a7..be1ec9e05ef 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -289,26 +289,38 @@ static VRingMemoryRegionCaches *vring_get_region_caches(struct VirtQueue *vq)
>>  /* Called within rcu_read_lock().  */
>>  static inline uint16_t vring_avail_flags(VirtQueue *vq)
>>  {
>> -    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
>> -    hwaddr pa = offsetof(VRingAvail, flags);
>> +    VRingMemoryRegionCaches *caches;
>> +    hwaddr pa;
>>  
>> +    if (unlikely(!vq->vring.avail)) {
>> +        return 0;
>> +    }
>> +
>> +    caches = vring_get_region_caches(vq);
>>      if (!caches) {
>>          return 0;
>>      }
>>  
>> +    pa = offsetof(VRingAvail, flags);
>>      return virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
>>  }
>>  
>>  /* Called within rcu_read_lock().  */
>>  static inline uint16_t vring_avail_idx(VirtQueue *vq)
>>  {
>> -    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
>> -    hwaddr pa = offsetof(VRingAvail, idx);
>> +    VRingMemoryRegionCaches *caches;
>> +    hwaddr pa;
>>  
>> +    if (unlikely(!vq->vring.avail)) {
>> +        return 0;
>> +    }
>> +
>> +    caches = vring_get_region_caches(vq);
>>      if (!caches) {
>>          return 0;
>>      }
>>  
>> +    pa = offsetof(VRingAvail, idx);
>>      vq->shadow_avail_idx = virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
>>      return vq->shadow_avail_idx;
>>  }
>> @@ -316,13 +328,19 @@ static inline uint16_t vring_avail_idx(VirtQueue *vq)
>>  /* Called within rcu_read_lock().  */
>>  static inline uint16_t vring_avail_ring(VirtQueue *vq, int i)
>>  {
>> -    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
>> -    hwaddr pa = offsetof(VRingAvail, ring[i]);
>> +    VRingMemoryRegionCaches *caches;
>> +    hwaddr pa;
>>  
>> +    if (unlikely(!vq->vring.avail)) {
>> +        return 0;
>> +    }
>> +
>> +    caches = vring_get_region_caches(vq);
>>      if (!caches) {
>>          return 0;
>>      }
>>  
>> +    pa = offsetof(VRingAvail, ring[i]);
>>      return virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
>>  }
> 
> Self-NAck.
> 
> While the previous part could be OK, what follows is crap (checking
> avail instead of used) so please disregard this patch.

Previous part is also crap :/


