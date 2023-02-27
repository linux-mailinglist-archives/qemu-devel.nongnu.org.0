Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B686A4C95
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 21:58:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWkYY-0003Y4-Cl; Mon, 27 Feb 2023 15:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pWkYV-0003Vv-NT
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 15:57:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pWkYT-0004i2-Em
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 15:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677531424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ckMWzDQVCO29cZWyl8f7rv0kIIFprH8GLR/YnCbse7w=;
 b=S2QpYPK8NjjHC6nEsnD/Lv6oI50Mk8XX5Z2N4RdltKmz20tdCC9UMbT2PhA8mFXfk4sxXa
 YSbnpH9dQV9AgPNll8N9jB6UmkC9GCqkYRU2uiU15PtNbtQIiK6Oz0pBS0T1rNtMLOqzj9
 ye75IQdnTihGtq4x0ZA8sMOj6Ct3FOM=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-359-1Uqt9SFcMk-mhi8WoBWOOw-1; Mon, 27 Feb 2023 15:57:02 -0500
X-MC-Unique: 1Uqt9SFcMk-mhi8WoBWOOw-1
Received: by mail-io1-f72.google.com with SMTP id
 z5-20020a6b5c05000000b007447572f3f8so4825483ioh.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 12:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ckMWzDQVCO29cZWyl8f7rv0kIIFprH8GLR/YnCbse7w=;
 b=C8m+BAhNFZsjuWQdY4l1yRn8sAO3yLLRDSCSxkwUJOP/QTyc8rw17TueoUG/EcAAvL
 EwcH4Sp0ZWa7st4r4f4dZTduYLVCVc+iYiDFw4Y1vk2t/HpEiQLnAy6BgskgQ2WJEHvB
 rpdIgtszoG2tSmPWiwH75Xt0kMwNuKWhLjLpw9G5ig6rti0Pawmm1W3WTtEWJXgRFDE8
 qJLkRg2m58w7ZLU2xNA8JfPs2DVYzZJ3Gy99ivOpb+xNYdmxhqE61y+j1+nzfh/TkiwO
 cIny6NMide8Y2EWU4szlSgsQz6b3ZbZX9lEU0kf36X3IYet9flUnFMuHuWOcWp3eCNMr
 nHpA==
X-Gm-Message-State: AO0yUKVTXzbKOeqmyliocDAjdDs1eeo6bJfTTAoQMJntDIvfDC8GAyyt
 8bRVS306pwjfFYGXPV/aXidI+NSKd2mgqbfSQmzVrHqT/1yO9yG0HVOhYNdAaobJfZe4vheae5O
 q7byekvZz+Jfsjzs=
X-Received: by 2002:a92:b106:0:b0:317:5547:70c0 with SMTP id
 t6-20020a92b106000000b00317554770c0mr492892ilh.2.1677531421945; 
 Mon, 27 Feb 2023 12:57:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8EMoItUG+o/Fe5Nzee6aLwyk1vXkpp11XZ+3JMNH0EAXbyaLnSpaD/Sc2NuhFfixM3NqSupg==
X-Received: by 2002:a92:b106:0:b0:317:5547:70c0 with SMTP id
 t6-20020a92b106000000b00317554770c0mr492879ilh.2.1677531421611; 
 Mon, 27 Feb 2023 12:57:01 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 t11-20020a92d14b000000b00314132b824bsm2202426ilg.80.2023.02.27.12.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 12:57:00 -0800 (PST)
Date: Mon, 27 Feb 2023 15:56:59 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
Message-ID: <Y/0ZG86xj5lQJOZA@x1n>
References: <abcb08b7-460c-d88c-af48-c1d256f89c54@bytedance.com>
 <Y++i1NmxUxOPDM/V@x1n>
 <76a253ef-6989-f92d-cb33-6456a270a8d1@bytedance.com>
 <51d862b2-96be-0b93-7ed2-fcd15ffaa76e@bytedance.com>
 <Y/UrXwRK7rB2KRKO@x1n>
 <44f02b6f-2809-5e2d-bbc4-e4a43a4a8b75@bytedance.com>
 <Y/Y7Txt3Utq5AfbZ@x1n>
 <e748090b-3053-17f1-66f6-15d24b70170b@bytedance.com>
 <Y/op+bM6IimMTvIx@x1n>
 <12113de1-ad85-2bdc-aa94-2e8a565c848c@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12113de1-ad85-2bdc-aa94-2e8a565c848c@bytedance.com>
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

On Mon, Feb 27, 2023 at 09:19:39PM +0800, Chuang Xu wrote:
> Hi, Peter

Hi, Chuang,

> 
> On 2023/2/25 下午11:32, Peter Xu wrote:
> > On Thu, Feb 23, 2023 at 11:28:46AM +0800, Chuang Xu wrote:
> > > Hi, Peter
> > Hi, Chuang,
> > 
> > > On 2023/2/22 下午11:57, Peter Xu wrote:
> > I don't see why it's wrong, and that's exactly what I wanted to guarantee,
> > that if memory_region_update_pending==true when updating ioeventfd, we may
> > have some serios problem.
> > 
> > For this, I split my patch into two parts and I put this change into the
> > last patch.  See the attachment.  If you worry about this, you can e.g. try
> > applying patch 1 only later, but I still don't see why it could.
> 
> Sorry, I made some mistakes in my previous understanding of the code. However,
> if this assertion is added, it will indeed trigger some coredump in qtest with
> my patches. Here is the coredump(This is the only one I found):
> 
> #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> #1  0x00007fa5e7b17535 in __GI_abort () at abort.c:79
> #2  0x00007fa5e7b1740f in __assert_fail_base (fmt=0x7fa5e7c78ef0 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n",
>     assertion=0x56305fc02d60 "qemu_mutex_iothread_locked() && !memory_region_update_pending", file=0x56305fc028cb "../softmmu/memory.c", line=855, function=<optimized out>) at assert.c:92
> #3  0x00007fa5e7b251a2 in __GI___assert_fail (assertion=assertion@entry=0x56305fc02d60 "qemu_mutex_iothread_locked() && !memory_region_update_pending",
>     file=file@entry=0x56305fc028cb "../softmmu/memory.c", line=line@entry=855, function=function@entry=0x56305fc03cc0 <__PRETTY_FUNCTION__.38596> "address_space_update_ioeventfds")
>     at assert.c:101
> #4  0x000056305f8a9194 in address_space_update_ioeventfds (as=as@entry=0x563061293648) at ../softmmu/memory.c:855
> #5  0x000056305f8afe4f in address_space_init (as=as@entry=0x563061293648, root=root@entry=0x5630612936a0, name=name@entry=0x5630612934f0 "virtio-net-pci") at ../softmmu/memory.c:3172
> #6  0x000056305f686e43 in do_pci_register_device (errp=0x7fa5e4f39850, devfn=<optimized out>, name=0x563061011c40 "virtio-net-pci", pci_dev=0x563061293410) at ../hw/pci/pci.c:1145
> #7  pci_qdev_realize (qdev=0x563061293410, errp=0x7fa5e4f39850) at ../hw/pci/pci.c:2036
> #8  0x000056305f939daf in device_set_realized (obj=<optimized out>, value=true, errp=0x7fa5e4f39ae0) at ../hw/core/qdev.c:510
> #9  0x000056305f93d156 in property_set_bool (obj=0x563061293410, v=<optimized out>, name=<optimized out>, opaque=0x5630610221d0, errp=0x7fa5e4f39ae0) at ../qom/object.c:2285
> #10 0x000056305f93f403 in object_property_set (obj=obj@entry=0x563061293410, name=name@entry=0x56305fba6bc3 "realized", v=v@entry=0x563061e52a00, errp=errp@entry=0x7fa5e4f39ae0)
>     at ../qom/object.c:1420
> #11 0x000056305f94247f in object_property_set_qobject (obj=obj@entry=0x563061293410, name=name@entry=0x56305fba6bc3 "realized", value=value@entry=0x563061e61cb0,
>     errp=errp@entry=0x7fa5e4f39ae0) at ../qom/qom-qobject.c:28
> #12 0x000056305f93f674 in object_property_set_bool (obj=0x563061293410, name=name@entry=0x56305fba6bc3 "realized", value=value@entry=true, errp=errp@entry=0x7fa5e4f39ae0)
>     at ../qom/object.c:1489
> #13 0x000056305f93959c in qdev_realize (dev=<optimized out>, bus=bus@entry=0x563061c9c400, errp=errp@entry=0x7fa5e4f39ae0) at ../hw/core/qdev.c:292
> #14 0x000056305f7244a0 in qdev_device_add_from_qdict (opts=0x563061e64c00, from_json=<optimized out>, errp=<optimized out>, errp@entry=0x7fa5e4f39ae0)
>     at /data00/migration/qemu-open/include/hw/qdev-core.h:17
> #15 0x000056305f846c75 in failover_add_primary (errp=0x7fa5e4f39ad8, n=0x563062043530) at ../hw/net/virtio-net.c:933
> #16 virtio_net_set_features (vdev=<optimized out>, features=4611687122246533156) at ../hw/net/virtio-net.c:1004
> #17 0x000056305f872238 in virtio_set_features_nocheck (vdev=vdev@entry=0x563062043530, val=val@entry=4611687122246533156) at ../hw/virtio/virtio.c:2851
> #18 0x000056305f877e9e in virtio_load (vdev=0x563062043530, f=0x56306125bde0, version_id=11) at ../hw/virtio/virtio.c:3027
> #19 0x000056305f73c601 in vmstate_load_state (f=f@entry=0x56306125bde0, vmsd=0x56305fef16c0 <vmstate_virtio_net>, opaque=0x563062043530, version_id=11) at ../migration/vmstate.c:137
> #20 0x000056305f757672 in vmstate_load (f=0x56306125bde0, se=0x563062176700) at ../migration/savevm.c:919
> #21 0x000056305f757905 in qemu_loadvm_section_start_full (f=f@entry=0x56306125bde0, mis=0x56306101d3e0) at ../migration/savevm.c:2503
> #22 0x000056305f75aca8 in qemu_loadvm_state_main (f=f@entry=0x56306125bde0, mis=mis@entry=0x56306101d3e0) at ../migration/savevm.c:2719
> #23 0x000056305f75c17a in qemu_loadvm_state (f=0x56306125bde0) at ../migration/savevm.c:2809
> #24 0x000056305f74980e in process_incoming_migration_co (opaque=<optimized out>) at ../migration/migration.c:606
> #25 0x000056305fab25cb in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:177

I thought about something like this one and assumed it was fine, but I
forgot this can trigger after your other patch applied..  It means we need
to drop the 2nd patch that I provided in the last reply.

> 
> > I really think changing depth is a hack... :(
> > 
> > Here IMHO the problem is we have other missing calls to
> > address_space_to_flatview() during commit() and that caused the issue.
> > There aren't a lot of those, and sorry to miss yet another one.
> > 
> > So let me try one more time on this (with patch 1; I think I've got two
> > places missed in the previous attempt).  Let's see how it goes.
> > 
> > We may want to add a tracepoint or have some way to know when enfornced
> > commit() is triggered during the vm load phase.  I just noticed when you
> > worried about having enforced commit() to often then it beats the original
> > purpose and I think yes that's something to worry.
> > 
> > I still believe AHCI condition is rare (since e.g. you've passed all Juan's
> > tests even before we have this "do_commit" stuff), but in short: I think it
> > would still be interesting if you can capture all the users of enforced
> > commit() like the AHCI case you quoted before, and list them in the cover
> > letter in your next post (along with a new perf measurements, to make sure
> > your worry is not true on having too much enforced commit will invalid the
> > whole idea).
> > 
> > When I was digging this out, I also found some RCU issue when using
> > address_space_to_flatview() (when BQL was not taken), only in the
> > memory_region_clear_dirty_bitmap() path.  I hope the new assertion
> > (rcu_read_is_locked()) won't trigger on some of the use cases for you
> > already, but anyway feel free to ignore this whole paragraph for now until
> > if you see some assert(rcu_read_is_locked()) being triggered.  I plan to
> > post some RFC for fixing RCU and I'll have you copied just for reference
> > (may be separate issue as what you're working on).
> > 
> > Thanks,
> > 
> Unfortunately, there is another case of stack overflow...
> 
> #8  memory_region_transaction_do_commit () at ../softmmu/memory.c:1145
> #9  0x00005610e96d3665 in address_space_to_flatview (as=0x5610e9ece820 <address_space_memory>) at /data00/migration/qemu-open/include/exec/memory.h:1119
> #10 address_space_get_flatview (as=0x5610e9ece820 <address_space_memory>) at ../softmmu/memory.c:818
> #11 0x00005610e96dfa14 in address_space_cache_init (cache=cache@entry=0x56111cdee410, as=<optimized out>, addr=addr@entry=1048576, len=len@entry=4096, is_write=false)
>     at ../softmmu/physmem.c:3350
> #12 0x00005610e96a0928 in virtio_init_region_cache (vdev=vdev@entry=0x5610eb72bf10, n=n@entry=0) at ../hw/virtio/virtio.c:247
> #13 0x00005610e96a0db4 in virtio_memory_listener_commit (listener=0x5610eb72bff8) at ../hw/virtio/virtio.c:3592
> #14 0x00005610e96d2e5e in address_space_update_flatviews_all () at ../softmmu/memory.c:1126
> #15 memory_region_transaction_do_commit () at ../softmmu/memory.c:1145
> 
> Fortunately, this is probably the last one (at least according to the qtest results)😁.

I think this issue will also go away if you drop my previous patch 2,
because that patch contains a very tiny little functional change, where we
will reset memory_region_update_pending only after the global commit().

        MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
        memory_region_update_pending = false;

While I think we need at least for this stack to not trigger:

        memory_region_update_pending = false;
        MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);

I do think this is tricky, though, e.g. if someone calls _to_flatview() in
either begin() or region_add() we can loop again, even though I really,
really don't think we should do that.

Today I also went back and had a look at the AHCI issue, it seems it's not
because of mr->ram not updated (FIR address is a random buffer on guest
RAM), but because we have "bus master as" for PCI devices.  That explains
why it happened before, and unfortunately I still can't think of any better
way than this do_commit() thing even if I tried one more time.

As a summary: please drop patch 2 and retry (with a rewritten do_commit()
by yourself; note the ordering I mentioned above!).  I hope this is the
last piece of puzzle, or we should revisit.

> 
> BTW, Perhaps you can define do_commit as a non-static function? Because I'll use it in
> address_space_to_flatview later.

Feel free to modify whatever piece ofcode piece I offered in this thread to
suite your need; as long as it works for you. :)

Thanks,

-- 
Peter Xu


