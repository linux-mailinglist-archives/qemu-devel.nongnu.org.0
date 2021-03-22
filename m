Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE6A344F22
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 19:54:04 +0100 (CET)
Received: from localhost ([::1]:41982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOPgh-0001C4-Ju
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 14:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOPf2-0000Du-OQ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 14:52:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOPf0-0001n4-VD
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 14:52:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616439138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YMxhku0claahJdF1WpH8Mqapy15BVaPMRed13/124eQ=;
 b=NsoSkWYvbfDJnIOcQlYzrGWQ/p4K4zMyrb5uvhvU/RolaPThNkykshWxG5EnhW3meQkxe5
 J0NqOG/1MLKog1eJfbgDDab8t73LR/baRiBuGNXuIpBhjrIimlJbtnyI39XAkKCrT2uX9f
 xt2dVRRNh6FvQno0W1u0t5mcX67K/tc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-T0vvpGpYPC-lROQOznYe6A-1; Mon, 22 Mar 2021 14:52:16 -0400
X-MC-Unique: T0vvpGpYPC-lROQOznYe6A-1
Received: by mail-qv1-f70.google.com with SMTP id e10so57060qvr.17
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 11:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YMxhku0claahJdF1WpH8Mqapy15BVaPMRed13/124eQ=;
 b=mPSYtEBWOWUc3Qb8PsHb2+QgaQjum0FiB6N+CFwR5q6vbfx8n9PEMFOx9hTBg1oRe+
 ABqN6V9rwupOzcFPnAegIGdZoGyDDw0HaJxNDDUKlWB1thwGGNXtNcKj5igjKwZIIX+A
 TNRsPMg8R77T/d01uiKgMp741e9/FULX0yWC3RGF87U/LKzmoHkX2B/ufqbVgdNrFWUr
 vlSQawHRn396b16IK+dS37WauPxD7siJRpG/YrDv4NcVPWQ3iszrzZgYt+D6EzOh4/nF
 yML5gZXp7UwaNeHqZuByk26rToEW5R3/72dQ7RobCNjyhK8S1i2G0oStRSg2dA47mC5e
 2Yfw==
X-Gm-Message-State: AOAM531q0WTBastQZlJ2n3smHMXq+kerYOQfzb5OYo/jldC6eFUreyjC
 POyR/vYp9T8j4L97IadW6eg/HegHa0oddgO680zR8PogjcQsg8N62vuWiAeCD5SCWpw1LLr+KFN
 zEOGq2MHUL6xr2wY=
X-Received: by 2002:ac8:3a41:: with SMTP id w59mr1319103qte.8.1616439135773;
 Mon, 22 Mar 2021 11:52:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcIG2j6HmH/y341MkoG7HKwdKAukxNkanZR+gdk8vpAmL2l9UGtcY5VGx0M2Go+yjw/SaZdg==
X-Received: by 2002:ac8:3a41:: with SMTP id w59mr1319079qte.8.1616439135440;
 Mon, 22 Mar 2021 11:52:15 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id i6sm11544629qkk.31.2021.03.22.11.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 11:52:14 -0700 (PDT)
Date: Mon, 22 Mar 2021 14:52:13 -0400
From: Peter Xu <peterx@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH v5 10/10] KVM: Dirty ring support
Message-ID: <20210322185213.GD16645@xz-x1>
References: <20210310203301.194842-1-peterx@redhat.com>
 <20210310203301.194842-11-peterx@redhat.com>
 <deeb1fcb-bfad-ec47-49d0-fec7bf4d4391@huawei.com>
MIME-Version: 1.0
In-Reply-To: <deeb1fcb-bfad-ec47-49d0-fec7bf4d4391@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 09:37:19PM +0800, Keqian Zhu wrote:
> > +/* Should be with all slots_lock held for the address spaces. */
> > +static void kvm_dirty_ring_mark_page(KVMState *s, uint32_t as_id,
> > +                                     uint32_t slot_id, uint64_t offset)
> > +{
> > +    KVMMemoryListener *kml;
> > +    KVMSlot *mem;
> > +
> > +    if (as_id >= s->nr_as) {
> > +        return;
> > +    }
> > +
> > +    kml = s->as[as_id].ml;
> > +    mem = &kml->slots[slot_id];
> > +
> > +    if (!mem->memory_size || offset >= (mem->memory_size / TARGET_PAGE_SIZE)) {
> It seems that TARGET_PAGE_SIZE should be qemu_real_host_page_size.

Fixed.

[...]

> > +/*
> > + * Flush all the existing dirty pages to the KVM slot buffers.  When
> > + * this call returns, we guarantee that all the touched dirty pages
> > + * before calling this function have been put into the per-kvmslot
> > + * dirty bitmap.
> > + *
> > + * This function must be called with BQL held.
> > + */
> > +static void kvm_dirty_ring_flush(struct KVMDirtyRingReaper *r)
> The argument is not used.

Indeed, removed.

> 
> > +{
> > +    trace_kvm_dirty_ring_flush(0);
> > +    /*
> > +     * The function needs to be serialized.  Since this function
> > +     * should always be with BQL held, serialization is guaranteed.
> > +     * However, let's be sure of it.
> > +     */
> > +    assert(qemu_mutex_iothread_locked());
> > +    /*
> > +     * First make sure to flush the hardware buffers by kicking all
> > +     * vcpus out in a synchronous way.
> > +     */
> > +    kvm_cpu_synchronize_kick_all();
> Can we make this function to be architecture specific?
> It seems that kick out vCPU is an architecture specific way to flush hardware buffers
> to dirty ring (for x86 PML).

I can do that, but I'd say it's kind of an overkill if after all the kernel
support is not there yet, so I still tend to make it as simple as possible.

[...]

> > +static void *kvm_dirty_ring_reaper_thread(void *data)
> > +{
> > +    KVMState *s = data;
> > +    struct KVMDirtyRingReaper *r = &s->reaper;
> > +
> > +    rcu_register_thread();
> > +
> > +    trace_kvm_dirty_ring_reaper("init");
> > +
> > +    while (true) {
> > +        r->reaper_state = KVM_DIRTY_RING_REAPER_WAIT;
> > +        trace_kvm_dirty_ring_reaper("wait");
> > +        /*
> > +         * TODO: provide a smarter timeout rather than a constant?
> > +         */
> > +        sleep(1);
> > +
> > +        trace_kvm_dirty_ring_reaper("wakeup");
> > +        r->reaper_state = KVM_DIRTY_RING_REAPER_REAPING;
> > +
> > +        qemu_mutex_lock_iothread();
> > +        kvm_dirty_ring_reap(s);
> > +        qemu_mutex_unlock_iothread();
> > +
> > +        r->reaper_iteration++;
> > +    }
> I don't know when does this iteration exit?
> And I see that we start this reaper_thread in kvm_init(), maybe it's better to start it
> when start dirty log and stop it when stop dirty log.

Yes we can make it conditional, but note that we can't hook at functions like
memory_global_dirty_log_start() because that is only for migration purpose.

Currently QEMU exports the dirty tracking more than that, e.g., to the VGA
code.  We'll need to try to detect whether there's any existing MR got its
mr->dirty_log_mask set (besides global_dirty_log being set).  When all of them
got cleared we'll need to detect too so as to turn the thread off.

It's just easier to me to run this thread with such a timeout, then when not
necessary it'll see empty ring and return fast (index comparison for each
ring).  Not to mention the VGA dirty tracking should be on for most of the VM
lifecycle, so even if we have that knob this thread will probably be running
for 99% of the time as long as any MR has its DIRTY_MEMORY_VGA bit set.

[...]

> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index c68bc3ba8af..2f0991d93f7 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -323,6 +323,11 @@ struct qemu_work_item;
> >   * @ignore_memory_transaction_failures: Cached copy of the MachineState
> >   *    flag of the same name: allows the board to suppress calling of the
> >   *    CPU do_transaction_failed hook function.
> > + * @kvm_dirty_ring_full:
> > + *   Whether the kvm dirty ring of this vcpu is soft-full.
> > + * @kvm_dirty_ring_avail:
> > + *   Semaphore to be posted when the kvm dirty ring of the vcpu is
> > + *   available again.
> The doc does not match code.

Right; fixed.

Thanks for taking a look, keqian.

-- 
Peter Xu


