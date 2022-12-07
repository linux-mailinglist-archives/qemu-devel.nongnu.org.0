Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C955C6463E4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 23:09:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p32b7-0001P7-8E; Wed, 07 Dec 2022 17:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p32b2-0001OX-E7
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 17:08:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p32b0-0003UZ-3O
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 17:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670450932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5cTuMUZMRsr85jlN6rm0e+tfcSbftn3lRyaRgO+CO0=;
 b=OvYHTaNKU+2a/GOp41iIclwYPiMtnr1iSq2Sh8PYYz4kv4DhYelowXQ41DcCJ4lCYNEtXq
 cmgHJQvBKwtIFRrYnhIHm1e0j6pUOaZBpBN3/11XyuL3du4oHyDc1qF1Xm7qC9+T2xPc1a
 kefXdKG/N10mw9k10qtqZnHvII8Eyy4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-ncytYFAGPE2d6J1bh-ApJA-1; Wed, 07 Dec 2022 17:08:51 -0500
X-MC-Unique: ncytYFAGPE2d6J1bh-ApJA-1
Received: by mail-qv1-f72.google.com with SMTP id
 ln3-20020a0562145a8300b004b8c29a7d50so37425703qvb.15
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 14:08:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t5cTuMUZMRsr85jlN6rm0e+tfcSbftn3lRyaRgO+CO0=;
 b=A61oUnIoqZUQlCm6zAU7XvM+yWgoECO/phj5stEbdhnBDGWnK4mr79wsInTUAC8VrR
 sNmf6DiY1YKdb6Za6/X/enajbb3gh1qMAbemK9a7X9Qp2bymOsN4Ivc0w9ffB5onRzMk
 6qaiTOqnRSNS+b8icrrfSW1VHmBYQJjTT4hJI0ra8/oRa3fMvS6HiORz0hDZ3T7anGHq
 6fBfWtEgRIZwHtzFTZd+lRoJ9h0Fp1WX7eGTHWb7DH65kg/DJFi2zFm0q0TBCL0x94lq
 Fa6xrEmI2+YSSo7ct7ooSPZ00Ae8h1ouLC3EnFzLwk3yCMsSYVanqJe+6sXJGAAKmpRg
 mCSQ==
X-Gm-Message-State: ANoB5pmbAirsuRb+pL4elfC6yMDuW33SyAyQDkmmlynQuLOc5DAOhHvk
 6dyB+4iFrgTuBw4RixD55TktjfEEStDFTkbNHoWzRt8as3oXbBmfsap1F/XlXmYR3GjP4WAJp3Z
 qVh6fCpDajN4zffg=
X-Received: by 2002:a05:622a:2585:b0:3a6:8c86:ac4c with SMTP id
 cj5-20020a05622a258500b003a68c86ac4cmr1907917qtb.48.1670450930789; 
 Wed, 07 Dec 2022 14:08:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5bVG3AF0Z6J+bNPvtTmt9sI3Mf9900SBaAkp8E9WKteU8oIBNB8+1j/HetFhHQzuAHoXmMCg==
X-Received: by 2002:a05:622a:2585:b0:3a6:8c86:ac4c with SMTP id
 cj5-20020a05622a258500b003a68c86ac4cmr1907901qtb.48.1670450930507; 
 Wed, 07 Dec 2022 14:08:50 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 j1-20020a05620a410100b006fee9a70343sm1890036qko.14.2022.12.07.14.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 14:08:49 -0800 (PST)
Date: Wed, 7 Dec 2022 17:08:48 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 zhouyibo@bytedance.com, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [External] Re: [RFC PATCH] migration: reduce time of loading
 non-iterable vmstate
Message-ID: <Y5EO8HqNVj/Rq7M5@x1n>
References: <20221118083648.2399615-1-xuchuangxclwt@bytedance.com>
 <Y3+egjXTvLEHDjuT@x1n>
 <7e5c5d6c-8f23-c0c5-5f5c-5daad854c2e7@bytedance.com>
 <Y4Ty07M/HN9UnsGb@x1n>
 <1adf426d-a9c8-9015-383b-3e82eb6b7c54@bytedance.com>
 <Y44cNenFueVE4RFW@x1n>
 <faae03bb-7705-fb16-46a5-e4c2ea55a254@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <faae03bb-7705-fb16-46a5-e4c2ea55a254@bytedance.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Thu, Dec 08, 2022 at 12:07:03AM +0800, Chuang Xu wrote:
> 
> On 2022/12/6 上午12:28, Peter Xu wrote:
> > Chuang,
> > 
> > No worry on the delay; you're faster than when I read yours. :)
> > 
> > On Mon, Dec 05, 2022 at 02:56:15PM +0800, Chuang Xu wrote:
> > > > As a start, maybe you can try with poison address_space_to_flatview() (by
> > > > e.g. checking the start_pack_mr_change flag and assert it is not set)
> > > > during this process to see whether any call stack can even try to
> > > > dereference a flatview.
> > > > 
> > > > It's just that I didn't figure a good way to "prove" its validity, even if
> > > > I think this is an interesting idea worth thinking to shrink the downtime.
> > > Thanks for your sugguestions!
> > > I used a thread local variable to identify whether the current thread is a
> > > migration thread(main thread of target qemu) and I modified the code of
> > > qemu_coroutine_switch to make sure the thread local variable true only in
> > > process_incoming_migration_co call stack. If the target qemu detects that
> > > start_pack_mr_change is set and address_space_to_flatview() is called in
> > > non-migrating threads or non-migrating coroutine, it will crash.
> > Are you using the thread var just to avoid the assert triggering in the
> > migration thread when commiting memory changes?
> > 
> > I think _maybe_ another cleaner way to sanity check this is directly upon
> > the depth:
> > 
> > static inline FlatView *address_space_to_flatview(AddressSpace *as)
> > {
> >      /*
> >       * Before using any flatview, sanity check we're not during a memory
> >       * region transaction or the map can be invalid.  Note that this can
> >       * also be called during commit phase of memory transaction, but that
> >       * should also only happen when the depth decreases to 0 first.
> >       */
> >      assert(memory_region_transaction_depth == 0);
> >      return qatomic_rcu_read(&as->current_map);
> > }
> > 
> > That should also cover the safe cases of memory transaction commits during
> > migration.
> > 
> Peter, I tried this way and found that the target qemu will crash.
> 
> Here is the gdb backtrace:
> 
> #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:51
> #1  0x00007ff2929d851a in __GI_abort () at abort.c:118
> #2  0x00007ff2929cfe67 in __assert_fail_base (fmt=<optimized out>, assertion=assertion@entry=0x55a32578cdc0 "memory_region_transaction_depth == 0", file=file@entry=0x55a32575d9b0 "/data00/migration/qemu-5.2.0/include/exec/memory.h",
>     line=line@entry=766, function=function@entry=0x55a32578d6e0 <__PRETTY_FUNCTION__.20463> "address_space_to_flatview") at assert.c:92
> #3  0x00007ff2929cff12 in __GI___assert_fail (assertion=assertion@entry=0x55a32578cdc0 "memory_region_transaction_depth == 0", file=file@entry=0x55a32575d9b0 "/data00/migration/qemu-5.2.0/include/exec/memory.h", line=line@entry=766,
>     function=function@entry=0x55a32578d6e0 <__PRETTY_FUNCTION__.20463> "address_space_to_flatview") at assert.c:101
> #4  0x000055a324b2ed5e in address_space_to_flatview (as=0x55a326132580 <address_space_memory>) at /data00/migration/qemu-5.2.0/include/exec/memory.h:766
> #5  0x000055a324e79559 in address_space_to_flatview (as=0x55a326132580 <address_space_memory>) at ../softmmu/memory.c:811
> #6  address_space_get_flatview (as=0x55a326132580 <address_space_memory>) at ../softmmu/memory.c:805
> #7  0x000055a324e96474 in address_space_cache_init (cache=cache@entry=0x55a32a4fb000, as=<optimized out>, addr=addr@entry=68404985856, len=len@entry=4096, is_write=false) at ../softmmu/physmem.c:3307
> #8  0x000055a324ea9cba in virtio_init_region_cache (vdev=0x55a32985d9a0, n=0) at ../hw/virtio/virtio.c:185
> #9  0x000055a324eaa615 in virtio_load (vdev=0x55a32985d9a0, f=<optimized out>, version_id=<optimized out>) at ../hw/virtio/virtio.c:3203
> #10 0x000055a324c6ab96 in vmstate_load_state (f=f@entry=0x55a329dc0c00, vmsd=0x55a325fc1a60 <vmstate_virtio_scsi>, opaque=0x55a32985d9a0, version_id=1) at ../migration/vmstate.c:143
> #11 0x000055a324cda138 in vmstate_load (f=0x55a329dc0c00, se=0x55a329941c90) at ../migration/savevm.c:913
> #12 0x000055a324cdda34 in qemu_loadvm_section_start_full (mis=0x55a3284ef9e0, f=0x55a329dc0c00) at ../migration/savevm.c:2741
> #13 qemu_loadvm_state_main (f=f@entry=0x55a329dc0c00, mis=mis@entry=0x55a3284ef9e0) at ../migration/savevm.c:2939
> #14 0x000055a324cdf66a in qemu_loadvm_state (f=0x55a329dc0c00) at ../migration/savevm.c:3021
> #15 0x000055a324d14b4e in process_incoming_migration_co (opaque=<optimized out>) at ../migration/migration.c:574
> #16 0x000055a32501ae3b in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:173
> #17 0x00007ff2929e8000 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
> #18 0x00007ffed80dc2a0 in ?? ()
> #19 0x0000000000000000 in ?? ()
> 
> address_space_cache_init() is the only caller of address_space_to_flatview
> I can find in vmstate_load call stack so far. Although I think the mr used
> by address_space_cache_init() won't be affected by the delay of
> memory_region_transaction_commit(), we really need a mechanism to prevent
> the modified mr from being used.
> 
> Maybe we can build a stale list:
> If a subregion is added, add its parent to the stale list(considering that
> new subregion's priority has uncertain effects on flatviews).
> If a subregion is deleted, add itself to the stale list.
> When memory_region_transaction_commit() regenerates flatviews, clear the
> stale list.
> when address_space_translate_internal() is called, check whether the mr
> looked up matches one of mrs（or its child）in the stale list. If yes, a
> crash will be triggered.

I'm not sure that'll work, though.  Consider this graph:

                            A
                           / \
                          B   C
                       (p=1) (p=0)

A,B,C are MRs, B&C are subregions to A.  When B's priority is higher (p=1),
any access to A will go upon B, so far so good.

Then, let's assume D comes under C with even higher priority:

                            A
                           / \
                          B   C
                       (p=1) (p=0)
                              |
                              D
                             (p=2)


Adding C into stale list won't work because when with the old flatview
it'll point to B instead, while B is not in the stale list.  The AS
operation will carry out without noticing it's already wrong.

> 
> There may be many details to consider in this mechanism. Hope you can give
> some suggestions on its feasibility.

For this specific case, I'm wildly thinking whether we can just postpone
the init of the vring cache until migration completes.

One thing to mention from what I read it: we'll need to update all the
caches in virtio_memory_listener_commit() anyway, when the batched commit()
happens when migration completes with your approach, so we'll rebuild the
vring cache once and for all which looks also nice if possible.

There's some details to consider. E.g. the commit() happens only when
memory_region_update_pending==true.  We may want to make sure the cache is
initialized unconditionally, at least.  Not sure whether that's doable,
though.

Thanks,

-- 
Peter Xu


