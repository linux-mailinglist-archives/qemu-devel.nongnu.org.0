Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09C8332CA2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:55:06 +0100 (CET)
Received: from localhost ([::1]:34676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfdR-0001uN-1d
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJeuJ-0002zg-HA
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:08:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJeuC-00088V-8D
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615306099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I6mFHR2Dr5tdLZ7QbR+jqB24GsTxVD855Nj85/otRn8=;
 b=LiOdsyPg+JivseBbFJEmsd3Iabp3CBwXoGfRukS4YgCcf4fySA7O9V3QljIXqcAY59c44N
 L7dccRhlCcLbU5DLFabQHIZao6a5xzl4FQgc883Z0UYQk1ivevQPBEIKvGlM3DLrp7NqOR
 MWIw0ELfJzfWv3rr4qygorCyfPfJvyQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-GfuegAk5Pl-aHcdbrHtREw-1; Tue, 09 Mar 2021 11:08:17 -0500
X-MC-Unique: GfuegAk5Pl-aHcdbrHtREw-1
Received: by mail-qt1-f197.google.com with SMTP id o20so10729510qtx.22
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:08:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I6mFHR2Dr5tdLZ7QbR+jqB24GsTxVD855Nj85/otRn8=;
 b=Guh7hFHxW41b+656XwCbOendBvxHfCs11py2zzGeMgU9msmjec9KXX27vGB9It06TN
 GmSFUurSFE+dywenrqBrwx2fDt2takKdVqC8i2F1xOq7p3i42Hvp8niMEHntx34E8osu
 yWEQG4iHA5FN0fVRXmNYDVs/RcT5kN2/JYG5lul3V3Q6Mjc3XoqxgCq7imugsZHN2rVS
 7fDCeYJpYVbi6Kgdfq+g/jIMxqcgSogAkAbTLRyHyzSUZqrnbTRAaMdRGKfyfFXANUKE
 bZdqxIHkEebUfVCwY36bXUuo8rDCYD7xNsniD/1R4qFMgAjrNbKAbg6dWnUif5+Hk+5n
 KvvQ==
X-Gm-Message-State: AOAM532j11kVkQYgLU5EkDZKMMTuGvPBxw6iWsldGkX+3vPf2QUU6aSE
 /5uq4QKYEmITZXlkXuNwO6nJ+IH/XePbw8FF6CHbjEGGTMeDucViJ4c8vKKIYyYp+dYllrBKU68
 Ef+Nocnr76ZZPq3U=
X-Received: by 2002:ac8:4b7b:: with SMTP id g27mr6803842qts.220.1615306097024; 
 Tue, 09 Mar 2021 08:08:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/Wttu2YCKnXJtDdRTu6hO7mIW1sxdAf0jfhxm83yRAlQ7d7HFGfLmAl60QYCAHNZeo4ns5Q==
X-Received: by 2002:ac8:4b7b:: with SMTP id g27mr6803791qts.220.1615306096648; 
 Tue, 09 Mar 2021 08:08:16 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id h16sm7215844qto.45.2021.03.09.08.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:08:16 -0800 (PST)
Date: Tue, 9 Mar 2021 11:08:14 -0500
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 2/2] accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot
Message-ID: <20210309160814.GA763132@xz-x1>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <20201217014941.22872-3-zhukeqian1@huawei.com>
 <65c92236-5212-f725-047a-cb1d231eff25@redhat.com>
 <759785ef-f29e-f05f-9f2f-357e71ae3680@huawei.com>
 <11854ebf-ed88-496d-8381-5385ef1b403a@redhat.com>
 <YEeM8eUUzm9AlaFI@work-vm>
MIME-Version: 1.0
In-Reply-To: <YEeM8eUUzm9AlaFI@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 jiangkunkun@huawei.com, Andrew Jones <drjones@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 wanghaibin.wang@huawei.com, Zenghui Yu <yuzenghui@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 02:57:53PM +0000, Dr. David Alan Gilbert wrote:
> * Thomas Huth (thuth@redhat.com) wrote:
> > On 09/03/2021 15.05, Keqian Zhu wrote:
> > > 
> > > 
> > > On 2021/3/9 21:48, Thomas Huth wrote:
> > > > On 17/12/2020 02.49, Keqian Zhu wrote:
> > > > > The parameters start and size are transfered from QEMU memory
> > > > > emulation layer. It can promise that they are TARGET_PAGE_SIZE
> > > > > aligned. However, KVM needs they are qemu_real_page_size aligned.
> > > > > 
> > > > > Though no caller breaks this aligned requirement currently, we'd
> > > > > better add an explicit assert to avoid future breaking.
> > > > > 
> > > > > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > > > > ---
> > > > >    accel/kvm/kvm-all.c | 7 +++++++
> > > > >    1 file changed, 7 insertions(+)
> > > > > 
> > > > > ---
> > > > > v2
> > > > >    - Address Andrew's commment (Use assert instead of return err).
> > > > > 
> > > > > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > > > > index f6b16a8df8..73b195cc41 100644
> > > > > --- a/accel/kvm/kvm-all.c
> > > > > +++ b/accel/kvm/kvm-all.c
> > > > > @@ -692,6 +692,10 @@ out:
> > > > >    #define KVM_CLEAR_LOG_ALIGN  (qemu_real_host_page_size << KVM_CLEAR_LOG_SHIFT)
> > > > >    #define KVM_CLEAR_LOG_MASK   (-KVM_CLEAR_LOG_ALIGN)
> > > > >    +/*
> > > > > + * As the granule of kvm dirty log is qemu_real_host_page_size,
> > > > > + * @start and @size are expected and restricted to align to it.
> > > > > + */
> > > > >    static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
> > > > >                                      uint64_t size)
> > > > >    {
> > > > > @@ -701,6 +705,9 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
> > > > >        unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
> > > > >        int ret;
> > > > >    +    /* Make sure start and size are qemu_real_host_page_size aligned */
> > > > > +    assert(QEMU_IS_ALIGNED(start | size, psize));
> > > > 
> > > > Sorry, but that was a bad idea: It triggers and kills my Centos 6 VM:
> > > > 
> > > > $ qemu-system-x86_64 -accel kvm -hda ~/virt/images/centos6.qcow2 -m 1G
> > > > qemu-system-x86_64: ../../devel/qemu/accel/kvm/kvm-all.c:690: kvm_log_clear_one_slot: Assertion `QEMU_IS_ALIGNED(start | size, psize)' failed.
> > > > Aborted (core dumped)
> > > Hi Thomas,
> > > 
> > > I think this patch is ok, maybe it trigger a potential bug?
> > 
> > Well, sure, there is either a bug somewhere else or in this new code. But it's certainly not normal that the assert() triggers, is it?
> > 
> > FWIW, here's a backtrace:
> > 
> > #0  0x00007ffff2c1584f in raise () at /lib64/libc.so.6
> > #1  0x00007ffff2bffc45 in abort () at /lib64/libc.so.6
> > #2  0x00007ffff2bffb19 in _nl_load_domain.cold.0 () at /lib64/libc.so.6
> > #3  0x00007ffff2c0de36 in .annobin_assert.c_end () at /lib64/libc.so.6
> > #4  0x0000555555ba25f3 in kvm_log_clear_one_slot
> >     (size=6910080, start=0, as_id=0, mem=0x555556e1ee00)
> >     at ../../devel/qemu/accel/kvm/kvm-all.c:691
> > #5  0x0000555555ba25f3 in kvm_physical_log_clear
> >     (section=0x7fffffffd0b0, section=0x7fffffffd0b0, kml=0x555556dbaac0)
> >     at ../../devel/qemu/accel/kvm/kvm-all.c:843
> > #6  0x0000555555ba25f3 in kvm_log_clear (listener=0x555556dbaac0, section=0x7fffffffd0b0)
> >     at ../../devel/qemu/accel/kvm/kvm-all.c:1253
> > #7  0x0000555555b023d8 in memory_region_clear_dirty_bitmap
> >     (mr=mr@entry=0x5555573394c0, start=start@entry=0, len=len@entry=6910080)
> >     at ../../devel/qemu/softmmu/memory.c:2132
> > #8  0x0000555555b313d9 in cpu_physical_memory_snapshot_and_clear_dirty
> >     (mr=mr@entry=0x5555573394c0, offset=offset@entry=0, length=length@entry=6910080, client=client@entry=0) at ../../devel/qemu/softmmu/physmem.c:1109
> > #9  0x0000555555b02483 in memory_region_snapshot_and_clear_dirty
> >     (mr=mr@entry=0x5555573394c0, addr=addr@entry=0, size=size@entry=6910080, client=client@entry=0)
> >     at ../../devel/qemu/softmmu/memory.c:2146
> 
> Could you please figure out which memory region this is?
> WTH is that size? Is that really the problem that the size is just
> crazy?

It seems vga_draw_graphic() could call memory_region_snapshot_and_clear_dirty()
with not-page-aligned size.  cpu_physical_memory_snapshot_and_clear_dirty()
actually took care of most of it on alignment, however still the "length"
parameter got passed in without alignment check or so.

Cc Gerd too.

I'm not sure how many use cases are there like this.. if there're a lot maybe
we can indeed drop this assert patch, but instead in kvm_log_clear_one_slot()
we should ALIGN_DOWN the size to smallest host page size. Say, if we need to
clear dirty bit for range (0, 0x1020), we should only clean (0, 0x1000) since
there can still be dirty data on range (0x1020, 0x2000).

Thanks,

> 
> Dave
> 
> > #10 0x0000555555babe99 in vga_draw_graphic (full_update=0, s=0x5555573394b0)
> >     at ../../devel/qemu/hw/display/vga.c:1661
> > #11 0x0000555555babe99 in vga_update_display (opaque=0x5555573394b0)
> >     at ../../devel/qemu/hw/display/vga.c:1784
> > #12 0x0000555555babe99 in vga_update_display (opaque=0x5555573394b0)
> >     at ../../devel/qemu/hw/display/vga.c:1757
> > #13 0x00005555558ddd32 in graphic_hw_update (con=0x555556a11800)
> >     at ../../devel/qemu/ui/console.c:279
> > #14 0x00005555558dccd2 in dpy_refresh (s=0x555556c17da0) at ../../devel/qemu/ui/console.c:1742
> > #15 0x00005555558dccd2 in gui_update (opaque=opaque@entry=0x555556c17da0)
> >     at ../../devel/qemu/ui/console.c:209
> > #16 0x0000555555dbd520 in timerlist_run_timers (timer_list=0x555556937c50)
> >     at ../../devel/qemu/util/qemu-timer.c:574
> > #17 0x0000555555dbd520 in timerlist_run_timers (timer_list=0x555556937c50)
> >     at ../../devel/qemu/util/qemu-timer.c:499
> > #18 0x0000555555dbd74a in qemu_clock_run_timers (type=<optimized out>)
> >     at ../../devel/qemu/util/qemu-timer.c:670
> > #19 0x0000555555dbd74a in qemu_clock_run_all_timers () at ../../devel/qemu/util/qemu-timer.c:670
> > 
> > Looks like something in the vga code calls this with size=6910080
> > and thus triggers the alignment assertion?
> > 
> >  Thomas
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 

-- 
Peter Xu


