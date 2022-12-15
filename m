Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37B264DE2A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 17:06:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5qjB-0005Ok-PH; Thu, 15 Dec 2022 11:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5qj4-0005Gb-Vl
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 11:04:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5qj2-0006Wc-Pq
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 11:04:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671120287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjEJ6MIthG4lk7/54iEU67tJktZhxVBrOgE6Hd/L0S8=;
 b=iVoU7fde8kELLZ0x3j/taTSlx39G4gUfdwIWZkGOBTD8TBFzETV11/tNECXah1+4amPYYy
 kS7T7PzJGC4Qwweyx1Bq7y6v+8LmSUDZgD6cCcoy1S2k/9kooiFthDASG8ZAn4ZcTYdbrF
 yOfKuqTYJ4+cS5JpBdfJ8sQ7qHhFHUY=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-115-O8OcSB5IOtqM6gJIL_C-wg-1; Thu, 15 Dec 2022 11:04:36 -0500
X-MC-Unique: O8OcSB5IOtqM6gJIL_C-wg-1
Received: by mail-oi1-f198.google.com with SMTP id
 k26-20020a54469a000000b0035ac1417866so2085523oic.18
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 08:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jjEJ6MIthG4lk7/54iEU67tJktZhxVBrOgE6Hd/L0S8=;
 b=5ud0e6qL8v6tww/8NeozJ0aXvo6hxGyOkBN46E0sqXmEEaEmDS6EuYZuSJMRtwE01F
 heQM2SkxNBv5XfiJhiMNJlE2jpxo4duag/tabKd0gjaBwsP6PKCNufO1Jlf7CDZ2nq+n
 lRbmKwIwAf6PUV5VrA9Lsb7We4jQdGE7+97iz03SWKYOg0fr804CLSCpO6kCNBLMu9ai
 cBkygnTHJuC6uZbU5+y2F/gBs7tW91bB7jQVTWVTlfyypMAKYL3Ks/V35GZZqglLQ5Iw
 QhB40UvlvyhoepKXwQmqaqK7cfSNZsjohZZCLsuGFyYirXxLSPSnbc0AjGQ69htcxeBn
 Fufw==
X-Gm-Message-State: ANoB5plXf70HxgCdXbBaBERJ28yJiW7R/Ita/cYzPiG1hc3w9BSqoWEv
 57GMUamTGjgXcZndUUPf9X2mN1zas8KkzH5wWU2UMoe+xUFNmB77ZxXZ0KKk5/6rXfIlNPO1u9p
 kxlYKlbyasR2a5Qw=
X-Received: by 2002:a05:6359:4e09:b0:dd:2054:91aa with SMTP id
 oq9-20020a0563594e0900b000dd205491aamr1459067rwb.0.1671120275045; 
 Thu, 15 Dec 2022 08:04:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4KRa+HEYcoE31CkQb15QGaIOoHBpnWLeewYpANXvA8aeQvuG4a5OOx4gZ5bhcxlGE7l9zluQ==
X-Received: by 2002:a05:6359:4e09:b0:dd:2054:91aa with SMTP id
 oq9-20020a0563594e0900b000dd205491aamr1459050rwb.0.1671120274711; 
 Thu, 15 Dec 2022 08:04:34 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-45-70-31-26-132.dsl.bell.ca.
 [70.31.26.132]) by smtp.gmail.com with ESMTPSA id
 bs33-20020a05620a472100b006b61b2cb1d2sm12664965qkb.46.2022.12.15.08.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 08:04:33 -0800 (PST)
Date: Thu, 15 Dec 2022 11:04:32 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 david@redhat.com, f4bug@amsat.org, zhouyibo@bytedance.com
Subject: Re: [RFC v3 1/3] memory: add depth assert in address_space_to_flatview
Message-ID: <Y5tFkJpo0abKBc4U@x1n>
References: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
 <20221213133510.1279488-2-xuchuangxclwt@bytedance.com>
 <CALophuvwZHsqfTo=vshQawO+hPs6rkfHVDFZuukmaf_s+TGqJA@mail.gmail.com>
 <Y5pCbClzAz/BFDVE@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y5pCbClzAz/BFDVE@x1n>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, Dec 14, 2022 at 04:38:52PM -0500, Peter Xu wrote:
> On Wed, Dec 14, 2022 at 08:03:38AM -0800, Chuang Xu wrote:
> > On 2022/12/13 下午9:35, Chuang Xu wrote:
> > 
> > Before using any flatview, sanity check we're not during a memory
> > region transaction or the map can be invalid.
> > 
> > Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
> > <xuchuangxclwt@bytedance.com>
> > ---
> >  include/exec/memory.h | 9 +++++++++
> >  softmmu/memory.c      | 1 -
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index 91f8a2395a..b43cd46084 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -1069,8 +1069,17 @@ struct FlatView {
> >      MemoryRegion *root;
> >  };
> > 
> > +static unsigned memory_region_transaction_depth;
> > +
> >  static inline FlatView *address_space_to_flatview(AddressSpace *as)
> >  {
> > +    /*
> > +     * Before using any flatview, sanity check we're not during a memory
> > +     * region transaction or the map can be invalid.  Note that this can
> > +     * also be called during commit phase of memory transaction, but that
> > +     * should also only happen when the depth decreases to 0 first.
> > +     */
> > +    assert(memory_region_transaction_depth == 0);
> >      return qatomic_rcu_read(&as->current_map);
> >  }
> > 
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index bc0be3f62c..f177c40cd8 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -37,7 +37,6 @@
> > 
> >  //#define DEBUG_UNASSIGNED
> > 
> > -static unsigned memory_region_transaction_depth;
> >  static bool memory_region_update_pending;
> >  static bool ioeventfd_update_pending;
> >  unsigned int global_dirty_tracking;
> > 
> > Here are some new situations to be synchronized.
> > 
> > I found that there is a probability to trigger assert in the QEMU startup phase.
> > 
> > Here is the coredump backtrace:
> > 
> > #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> > #1  0x00007f7825e33535 in __GI_abort () at abort.c:79
> > #2  0x00007f7825e3340f in __assert_fail_base (fmt=0x7f7825f94ef0
> > "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x5653c643add8
> > "memory_region_transaction_depth == 0",
> >     file=0x5653c63dad78
> > "/data00/migration/qemu-open/include/exec/memory.h", line=1082,
> > function=<optimized out>) at assert.c:92
> > #3  0x00007f7825e411a2 in __GI___assert_fail
> > (assertion=assertion@entry=0x5653c643add8
> > "memory_region_transaction_depth == 0",
> >     file=file@entry=0x5653c63dad78
> > "/data00/migration/qemu-open/include/exec/memory.h",
> > line=line@entry=1082,
> >     function=function@entry=0x5653c643bd00 <__PRETTY_FUNCTION__.18101>
> > "address_space_to_flatview") at assert.c:101
> > #4  0x00005653c60f0383 in address_space_to_flatview (as=0x5653c6af2340
> > <address_space_memory>) at
> > /data00/migration/qemu-open/include/exec/memory.h:1082
> > #5  address_space_to_flatview (as=0x5653c6af2340
> > <address_space_memory>) at
> > /data00/migration/qemu-open/include/exec/memory.h:1074
> > #6  address_space_get_flatview (as=0x5653c6af2340
> > <address_space_memory>) at ../softmmu/memory.c:809
> > #7  0x00005653c60fef04 in address_space_cache_init
> > (cache=cache@entry=0x7f781fff8420, as=<optimized out>,
> > addr=63310635776, len=48, is_write=is_write@entry=false)
> >     at ../softmmu/physmem.c:3352
> > #8  0x00005653c60c08c5 in virtqueue_split_pop (vq=0x7f781c576270,
> > sz=264) at ../hw/virtio/virtio.c:1959
> > #9  0x00005653c60c0b7d in virtqueue_pop (vq=vq@entry=0x7f781c576270,
> > sz=<optimized out>) at ../hw/virtio/virtio.c:2177
> > #10 0x00005653c609f14f in virtio_scsi_pop_req
> > (s=s@entry=0x5653c9034300, vq=vq@entry=0x7f781c576270) at
> > ../hw/scsi/virtio-scsi.c:219
> > #11 0x00005653c60a04a3 in virtio_scsi_handle_cmd_vq
> > (vq=0x7f781c576270, s=0x5653c9034300) at ../hw/scsi/virtio-scsi.c:735
> > #12 virtio_scsi_handle_cmd (vdev=0x5653c9034300, vq=0x7f781c576270) at
> > ../hw/scsi/virtio-scsi.c:776
> > #13 0x00005653c60ba72f in virtio_queue_notify_vq (vq=0x7f781c576270)
> > at ../hw/virtio/virtio.c:2847
> > #14 0x00005653c62d9706 in aio_dispatch_handler
> > (ctx=ctx@entry=0x5653c84909e0, node=0x7f68e4007840) at
> > ../util/aio-posix.c:369
> > #15 0x00005653c62da254 in aio_dispatch_ready_handlers
> > (ready_list=0x7f781fffe6a8, ctx=0x5653c84909e0) at
> > ../util/aio-posix.c:399
> > #16 aio_poll (ctx=0x5653c84909e0, blocking=blocking@entry=true) at
> > ../util/aio-posix.c:713
> > #17 0x00005653c61b2296 in iothread_run
> > (opaque=opaque@entry=0x5653c822c390) at ../iothread.c:67
> > #18 0x00005653c62dcd8a in qemu_thread_start (args=<optimized out>) at
> > ../util/qemu-thread-posix.c:505
> > #19 0x00007f7825fd8fa3 in start_thread (arg=<optimized out>) at
> > pthread_create.c:486
> > #20 0x00007f7825f0a06f in clone () at
> > ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
> 
> This does look like a bug to me.
> 
> Paolo/Michael?

Hmm, I found that virtqueue_split_pop() took the rcu lock.. then I think
it's fine.

Chuang, I think what you can try next is add a helper to detect holding of
rcu lock, then assert with "depth==0 || rcu_read_locked()".  I think that's:

static inline bool rcu_read_locked(void)
{
    struct rcu_reader_data *p_rcu_reader = get_ptr_rcu_reader();
    
    return p_rcu_reader->depth > 0;
}

Then IIUC you can even drop patch 2 because virtio_load() also takes the
rcu lock.

-- 
Peter Xu


