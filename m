Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2368363AF86
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 18:43:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozi8b-0001O1-Bw; Mon, 28 Nov 2022 12:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ozi8Z-0001Nb-Kz
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 12:41:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ozi8W-0007zt-N4
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 12:41:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669657303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQ2ZEgzfVSq+Y5oDZ4f7NL95L4uBPg5OCg/S/vU6t8Y=;
 b=JFkUYXpw/0JiyRamS/JfU3KZFXFsImhGaIQgmjPI/6R44Kbsu7fzCKFZlsKsaIrmDYQm1t
 +kCzF4CxUHQPFPuDcEpoTRNVG+Ziwa7LEiHXcNvCauBfm8j8/9e8OKCPCDUnZTbM+rKqGO
 7uMnF5ntxbtd09kOFSHbXygz6JD5v2E=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-1-bjD8jjb0P6-E4y03K3IIOA-1; Mon, 28 Nov 2022 12:41:41 -0500
X-MC-Unique: bjD8jjb0P6-E4y03K3IIOA-1
Received: by mail-qk1-f200.google.com with SMTP id
 h8-20020a05620a284800b006b5c98f09fbso21852489qkp.21
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 09:41:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UQ2ZEgzfVSq+Y5oDZ4f7NL95L4uBPg5OCg/S/vU6t8Y=;
 b=7EBhtl75C20VTX93L2MRk3V4WznT8PdQD4El1HO8UGIy6NryF1dwWBp+JFfcf/ax7g
 vJX2j64rK0cJ1/8Hdtk5cwWAd/2MQ7nB3R5FOlLw/Kn7Pa3c2DlV5GrM/vx89EH5/aRk
 F5XOqJXVXnLmE2zfIg5yxaNlsl/eeIMRHnAQQiXp38jQcg3rhtp7+i7gdtMry1J5ithM
 rj826wg8j9u9GIN5eUrPJJ2YX5vlE7+FG+yq99rUYsvVPOFeKqo3u8iR1E+G0bRgCL01
 1hIWW3Ezq38f4fN1WYf3YJtOE769j8OCnABz3kcYk/C3EhbweGhK47X1nuLSb3O4IgSY
 yvLA==
X-Gm-Message-State: ANoB5plXrdXSi9dQXEqbZUJBtN3OA6CSH2raqliGuDE1YWqFPOFMkjLR
 qfzUTg8cV0HIhkgZiHpH48TFPex2V8OpxRVHwFpjW5yCPp9XJzugqJtmTivEcRnO/RYZw4v9Iq/
 WFJ9To8ys1noUL1E=
X-Received: by 2002:a05:622a:1aa9:b0:3a5:32c8:7825 with SMTP id
 s41-20020a05622a1aa900b003a532c87825mr48976810qtc.486.1669657300803; 
 Mon, 28 Nov 2022 09:41:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5upUdzEOcSmTkty97FViZZx66SLpgSfa9aoaSmh/3R3rJ86tyDUkl9R0rf4a3RlJ6/hj4nJA==
X-Received: by 2002:a05:622a:1aa9:b0:3a5:32c8:7825 with SMTP id
 s41-20020a05622a1aa900b003a532c87825mr48976785qtc.486.1669657300415; 
 Mon, 28 Nov 2022 09:41:40 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05620a424a00b006cfc9846594sm8868842qko.93.2022.11.28.09.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 09:41:40 -0800 (PST)
Date: Mon, 28 Nov 2022 12:41:39 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 zhouyibo@bytedance.com, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] migration: reduce time of loading non-iterable vmstate
Message-ID: <Y4Ty07M/HN9UnsGb@x1n>
References: <20221118083648.2399615-1-xuchuangxclwt@bytedance.com>
 <Y3+egjXTvLEHDjuT@x1n>
 <7e5c5d6c-8f23-c0c5-5f5c-5daad854c2e7@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e5c5d6c-8f23-c0c5-5f5c-5daad854c2e7@bytedance.com>
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

On Mon, Nov 28, 2022 at 05:42:43PM +0800, Chuang Xu wrote:
> 
> On 2022/11/25 上午12:40, Peter Xu wrote:
> > On Fri, Nov 18, 2022 at 04:36:48PM +0800, Chuang Xu wrote:
> > > The duration of loading non-iterable vmstate accounts for a significant
> > > portion of downtime (starting with the timestamp of source qemu stop and
> > > ending with the timestamp of target qemu start). Most of the time is spent
> > > committing memory region changes repeatedly.
> > > 
> > > This patch packs all the changes to memory region during the period of
> > > loading non-iterable vmstate in a single memory transaction. With the
> > > increase of devices, this patch will greatly improve the performance.
> > > 
> > > Here are the test results:
> > > test vm info:
> > > - 32 CPUs 128GB RAM
> > > - 8 16-queue vhost-net device
> > > - 16 4-queue vhost-user-blk device.
> > > 
> > > 	time of loading non-iterable vmstate
> > > before		about 210 ms
> > > after		about 40 ms
> > > 
> > > Signed-off-by: Chuang Xu<xuchuangxclwt@bytedance.com>
> > This is an interesting idea..  I think it means at least the address space
> > operations will all be messed up if happening during the precopy loading
> 
> Sorry, I don't quite understand the meaning of "messed up" here.. Maybe I need
> more information about how the address space operations will be messed up.

AFAIK the major thing we do during commit of memory regions is to apply the
memory region changes to the rest (flatviews, or ioeventfds), basically it
makes everything matching with the new memory region layout.

If we allow memory region commit to be postponed for the whole loading
process, it means at least from flat view pov any further things like:

  address_space_write(&address_space_memory, ...)

Could write to wrong places because the flat views are not updated.

> 
> > progress, but I don't directly see its happening either.  For example, in
> > most post_load()s of vmsd I think the devices should just write directly to
> > its buffers, accessing MRs directly, even if they want DMAs or just update
> > fields to correct states.  Even so, I'm not super confident that holds
> 
> And I'm not sure whether the "its happening" means "begin/commit happening"
> or "messed up happening"? If it's the former, Here are what I observe:
> the stage of loading iterable vmstate doesn't call begin/commit, but the
> stage of loading noniterable vmstate calls a large amount of begin/commit
> in field->info->get() operation. For example:
> 
> #0  memory_region_transaction_commit () at ../softmmu/memory.c:1085
> #1  0x0000559b6f683523 in pci_update_mappings (d=d@entry=0x7f5cd8682010) at ../hw/pci/pci.c:1361
> #2  0x0000559b6f683a1f in get_pci_config_device (f=<optimized out>, pv=0x7f5cd86820a0, size=256, field=<optimized out>) at ../hw/pci/pci.c:545
> #3  0x0000559b6f5fcd86 in vmstate_load_state (f=f@entry=0x559b757eb4b0, vmsd=vmsd@entry=0x559b70909d40 <vmstate_pci_device>, opaque=opaque@entry=0x7f5cd8682010, version_id=2)
>     at ../migration/vmstate.c:143
> #4  0x0000559b6f68466f in pci_device_load (s=s@entry=0x7f5cd8682010, f=f@entry=0x559b757eb4b0) at ../hw/pci/pci.c:664
> #5  0x0000559b6f6ad38a in virtio_pci_load_config (d=0x7f5cd8682010, f=0x559b757eb4b0) at ../hw/virtio/virtio-pci.c:181
> #6  0x0000559b6f7dfe91 in virtio_load (vdev=0x7f5cd868a1a0, f=0x559b757eb4b0, version_id=1) at ../hw/virtio/virtio.c:3071
> #7  0x0000559b6f5fcd86 in vmstate_load_state (f=f@entry=0x559b757eb4b0, vmsd=0x559b709ae260 <vmstate_vhost_user_blk>, opaque=0x7f5cd868a1a0, version_id=1) at ../migration/vmstate.c:143
> #8  0x0000559b6f62da48 in vmstate_load (f=0x559b757eb4b0, se=0x559b7591c010) at ../migration/savevm.c:913
> #9  0x0000559b6f631334 in qemu_loadvm_section_start_full (mis=0x559b73f1a580, f=0x559b757eb4b0) at ../migration/savevm.c:2741
> #10 qemu_loadvm_state_main (f=f@entry=0x559b757eb4b0, mis=mis@entry=0x559b73f1a580) at ../migration/savevm.c:2937
> #11 0x0000559b6f632faa in qemu_loadvm_state (f=0x559b757eb4b0) at ../migration/savevm.c:3018
> #12 0x0000559b6f6d2ece in process_incoming_migration_co (opaque=<optimized out>) at ../migration/migration.c:574
> #13 0x0000559b6f9f9f0b in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:173
> #14 0x00007f5cfeecf000 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
> #15 0x00007fff04a2e8f0 in ?? ()
> #16 0x0000000000000000 in ?? ()
> 
> > true, not to mention any other side effects (e.g., would we release bql
> > during precopy for any reason?).
> > 
> > Copy Paolo and PeterM for some extra eyes.
> > 
> What I observe is that during the loading process, migration thread will call Condwait to
> wait for the vcpu threads to complete tasks, such as kvm_apic_post_load, and rcu thread
> will acquire the bql to do the flatview_destroy operation. So far, I haven't seen the
> side effects of these two situations.

Yes that's something I'd worry about.

The current memory API should be defined as: when we release the bql we
should guarantee the memory layout is persistent and no pending
transactions.  I used to have a patchset just for that because when
violating that rule it's prone to very weird bugs:

https://lore.kernel.org/all/20210728183151.195139-8-peterx@redhat.com/

One example report that was caused by wrongly releasing bql and you can
have a feeling of it by the stack dumped (after above patchset applied):

https://lore.kernel.org/qemu-devel/CH0PR02MB7898BBD73D0F3F7D5003BB178BE19@CH0PR02MB7898.namprd02.prod.outlook.com/

Said that, it's not exact the case here since it's not releasing bql during
a memory commit phase, so probably no immediate problem as rcu thread will
just ignore any updates to be committed.  It might be safe to do it like
that (and making sure no vcpu is running), but worth serious thoughts.

As a start, maybe you can try with poison address_space_to_flatview() (by
e.g. checking the start_pack_mr_change flag and assert it is not set)
during this process to see whether any call stack can even try to
dereference a flatview.

It's just that I didn't figure a good way to "prove" its validity, even if
I think this is an interesting idea worth thinking to shrink the downtime.

> 
> > > ---
> > >   migration/migration.c | 1 +
> > >   migration/migration.h | 2 ++
> > >   migration/savevm.c    | 8 ++++++++
> > >   3 files changed, 11 insertions(+)
> > > 
> > > diff --git a/migration/migration.c b/migration/migration.c
> > > index e6f8bc2478..ed20704552 100644
> > > --- a/migration/migration.c
> > > +++ b/migration/migration.c
> > > @@ -224,6 +224,7 @@ void migration_object_init(void)
> > >       qemu_sem_init(&current_incoming->postcopy_pause_sem_fast_load, 0);
> > >       qemu_mutex_init(&current_incoming->page_request_mutex);
> > >       current_incoming->page_requested = g_tree_new(page_request_addr_cmp);
> > > +    current_incoming->start_pack_mr_change = false;
> > >       migration_object_check(current_migration, &error_fatal);
> > > diff --git a/migration/migration.h b/migration/migration.h
> > > index 58b245b138..86597f5feb 100644
> > > --- a/migration/migration.h
> > > +++ b/migration/migration.h
> > > @@ -186,6 +186,8 @@ struct MigrationIncomingState {
> > >        * contains valid information.
> > >        */
> > >       QemuMutex page_request_mutex;
> > > +
> > > +    bool start_pack_mr_change;
> > >   };
> > >   MigrationIncomingState *migration_incoming_get_current(void);
> > > diff --git a/migration/savevm.c b/migration/savevm.c
> > > index 48e85c052c..a073009a74 100644
> > > --- a/migration/savevm.c
> > > +++ b/migration/savevm.c
> > > @@ -2630,6 +2630,12 @@ retry:
> > >           switch (section_type) {
> > >           case QEMU_VM_SECTION_START:
> > >           case QEMU_VM_SECTION_FULL:
> > > +            /* call memory_region_transaction_begin() before loading non-iterable vmstate */
> > > +            if (section_type == QEMU_VM_SECTION_FULL && !mis->start_pack_mr_change) {
> > > +                memory_region_transaction_begin();
> > > +                mis->start_pack_mr_change = true;
> > This is slightly hacky to me.  Can we just wrap the begin/commit inside the
> > whole qemu_loadvm_state_main() call?
> 
> The iterative copy phase doesn't call begin/commit, so There seems to be no essential
> difference between these two codes. I did try to wrap the begin/commit inside the whole
> qemu_loadvm_state_main() call, this way also worked well.
> But only calling begin/commit before/after the period of loading non-iterable vmstate may
> have less unkown side effect?

I don't worry much on the iterative migration phase, because they should be
mostly pure data movements unless I miss something important.  Having them
wrap qemu_loadvm_state_main() can avoid the flag completely and avoid the
special treatment within these migration internal flags which is hacky, imo.

> 
> > 
> > > +            }
> > > +
> > >               ret = qemu_loadvm_section_start_full(f, mis);
> > >               if (ret < 0) {
> > >                   goto out;
> > > @@ -2650,6 +2656,8 @@ retry:
> > >               }
> > >               break;
> > >           case QEMU_VM_EOF:
> > > +            /* call memory_region_transaction_commit() after loading non-iterable vmstate */
> > > +            memory_region_transaction_commit();
> > >               /* This is the end of migration */
> > >               goto out;
> > >           default:
> > > -- 
> > > 2.20.1
> > > 
> Peter, Thanks a lot for your advice! Hope for more suggestions from you!

-- 
Peter Xu


