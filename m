Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577B8347BC9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 16:11:07 +0100 (CET)
Received: from localhost ([::1]:39490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP5A2-0001Lf-EF
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 11:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP58u-0000dz-7Z
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 11:09:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP58o-0004il-Sx
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 11:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616598588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s7nIWmtOi8c8IxnO+eGMyt1Gb4eV216sdNGrLab0ubI=;
 b=OwcQYGrXo/TaiXcu/5LcwKF1NkuH48//yjhFfYr85+uT7fZEorApoGTPWGMamfdP3CaVHs
 raQM9DlsDBTvUhoeGrM0HqC/X1LGUw0xqCLp+UUcOkdJu0mZz1fRERBHQHPovYG5foeMF0
 FP3jyCm0jI50impPYmdvjjgMWqXsqe8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-am6AB97AOJqibz_BWNobxw-1; Wed, 24 Mar 2021 11:09:47 -0400
X-MC-Unique: am6AB97AOJqibz_BWNobxw-1
Received: by mail-qt1-f198.google.com with SMTP id m35so1391362qtd.11
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 08:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s7nIWmtOi8c8IxnO+eGMyt1Gb4eV216sdNGrLab0ubI=;
 b=gYmslHPa36fL5IHkymohk+RAr9VuHJ3NEgKA99G4KOBz7GOsTUa9ZHlX1uHbf73X60
 mh9/+lzn4/YTLVaf8rcOND44y2iRHsDXYWtuxQWhAjHZciirVl7GE5/ockxxgwhGO99A
 QKQVLnyNbmCO5vRzgZTZle4z3V8wLYZr8EG9racbgRawn5CGRm3RVQSkY+2CsuWMOnGq
 1tLc5oUwJ+u8RA6zafY94ddzFUU5TI/AJvLWqkAldFUg3d+IjSRiZ9VqQXNLnWCnB4DK
 //FTBitglLM24+o6CE4R+NuPBM5NGzM6wkO+fCyW0/u/FccQrvhX0u9OYUJHhyvxDXZD
 NGNQ==
X-Gm-Message-State: AOAM533k3Z+AZCis6voDQ2WsuWKqNoIgDPab+0x4l0YBcNP5IMWertqZ
 DpLXLATQKrRHzK+R+PY3frDbjo8g59kVDz9hJ9myRaaaRTOnxW02yY0dawOAl8PyukQUjZqRWQz
 a+A3uq/RgxaWL4XY=
X-Received: by 2002:a05:620a:38f:: with SMTP id
 q15mr3489301qkm.379.1616598586422; 
 Wed, 24 Mar 2021 08:09:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7TLwLKtOLoH706S1Nkk3qv+eRSbEBQSKv9s6Mll8xOKrmib29tQ1uIJmZ6uh0MX/gvl+oHw==
X-Received: by 2002:a05:620a:38f:: with SMTP id
 q15mr3489247qkm.379.1616598585912; 
 Wed, 24 Mar 2021 08:09:45 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id l17sm1536119qtk.60.2021.03.24.08.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:09:45 -0700 (PDT)
Date: Wed, 24 Mar 2021 11:09:43 -0400
From: Peter Xu <peterx@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH v5 00/10] KVM: Dirty ring support (QEMU part)
Message-ID: <20210324150943.GB219069@xz-x1>
References: <20210310203301.194842-1-peterx@redhat.com>
 <2e057323-8102-7bfc-051b-cd3950c93875@huawei.com>
 <20210322194533.GE16645@xz-x1>
 <ddf6bf41-ab29-8bbc-d3fb-94938e42e215@huawei.com>
 <20210323143429.GB6486@xz-x1>
 <5da1dd71-58e9-6579-c7c1-6cb60baf7ac1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5da1dd71-58e9-6579-c7c1-6cb60baf7ac1@huawei.com>
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

On Wed, Mar 24, 2021 at 10:56:22AM +0800, Keqian Zhu wrote:
> Hi Peter,
> 
> On 2021/3/23 22:34, Peter Xu wrote:
> > Keqian,
> > 
> > On Tue, Mar 23, 2021 at 02:40:43PM +0800, Keqian Zhu wrote:
> >>>> The second question is that you observed longer migration time (55s->73s) when guest
> >>>> has 24G ram and dirty rate is 800M/s. I am not clear about the reason. As with dirty
> >>>> ring enabled, Qemu can get dirty info faster which means it handles dirty page more
> >>>> quick, and guest can be throttled which means dirty page is generated slower. What's
> >>>> the rationale for the longer migration time?
> >>>
> >>> Because dirty ring is more sensitive to dirty rate, while dirty bitmap is more
> >> Emm... Sorry that I'm very clear about this... I think that higher dirty rate doesn't cause
> >> slower dirty_log_sync compared to that of legacy bitmap mode. Besides, higher dirty rate
> >> means we may have more full-exit, which can properly limit the dirty rate. So it seems that
> >> dirty ring "prefers" higher dirty rate.
> > 
> > When I measured the 800MB/s it's in the guest, after throttling.
> > 
> > Imagine another example: a VM has 1G memory keep dirtying with 10GB/s.  Dirty
> > logging will need to collect even less for each iteration because memory size
> > shrinked, collect even less frequent due to the high dirty rate, however dirty
> > ring will use 100% cpu power to collect dirty pages because the ring keeps full.
> Looks good.
> 
> We have many places to collect dirty pages: the background reaper, vCPU exit handler,
> and the migration thread. I think migration time is closely related to the migration thread.
> 
> The migration thread calls kvm_dirty_ring_flush().
> 1. kvm_cpu_synchronize_kick_all() will wait vcpu handles full-exit.
> 2. kvm_dirty_ring_reap() collects and resets dirty pages.
> The above two operation will spend more time with higher dirty rate.
> 
> But I suddenly realize that the key problem maybe not at this. Though we have separate
> "reset" operation for dirty ring, actually it is performed right after we collect dirty
> ring to kvmslot. So in dirty ring mode, it likes legacy bitmap mode without manual_dirty_clear.
> 
> If we can "reset" dirty ring just before we really handle the dirty pages, we can have
> shorter migration time. But the design of dirty ring doesn't allow this, because we must
> perform reset to make free space...

This is a very good point.

Dirty ring should have been better in quite some ways already, but from that
pov as you said it goes a bit backwards on reprotection of pages (not to
mention currently we can't even reset the ring per-vcpu; that seems to be not
fully matching the full locality that the rings have provided as well; but
Paolo and I discussed with that issue, it's about TLB flush expensiveness, so
we still need to think more of it..).

Ideally the ring could have been both per-vcpu but also bi-directional (then
we'll have 2*N rings, N=vcpu number), so as to split the state transition into
"dirty ring" and "reprotect ring", then that reprotect ring will be the clear
dirty log.  That'll look more like virtio as used ring.  However we'll still
need to think about the TLB flush issue too as Paolo used to mention, as
that'll exist too with any per-vcpu flush model (each reprotect of page will
need a tlb flush of all vcpus).

Or.. maybe we can make the flush ring a standalone one, so we need N dirty ring
and one global flush ring.

Anyway.. Before that, I'd still think the next step should be how to integrate
qemu to fully leverage current ring model, so as to be able to throttle in
per-vcpu fashion.

The major issue (IMHO) with huge VM migration is:

  1. Convergence
  2. Responsiveness

Here we'll have a chance to solve (1) by highly throttle the working vcpu
threads, meanwhile still keep (2) by not throttle user interactive threads.
I'm not sure whether this will really work as expected, but just show what I'm
thinking about it.  These may not matter a lot yet with further improving ring
reset mechanism, which definitely sounds even better, but seems orthogonal.

That's also why I think we should still merge this series first as a fundation
for the rest.

> 
> > 
> >>
> >>> sensitive to memory footprint.  In above 24G mem + 800MB/s dirty rate
> >>> condition, dirty bitmap seems to be more efficient, say, collecting dirty
> >>> bitmap of 24G mem (24G/4K/8=0.75MB) for each migration cycle is fast enough.
> >>>
> >>> Not to mention that current implementation of dirty ring in QEMU is not
> >>> complete - we still have two more layers of dirty bitmap, so it's actually a
> >>> mixture of dirty bitmap and dirty ring.  This series is more like a POC on
> >>> dirty ring interface, so as to let QEMU be able to run on KVM dirty ring.
> >>> E.g., we won't have hang issue when getting dirty pages since it's totally
> >>> async, however we'll still have some legacy dirty bitmap issues e.g. memory
> >>> consumption of userspace dirty bitmaps are still linear to memory footprint.
> >> The plan looks good and coordinated, but I have a concern. Our dirty ring actually depends
> >> on the structure of hardware logging buffer (PML buffer). We can't say it can be properly
> >> adapted to all kinds of hardware design in the future.
> > 
> > Sorry I don't get it - dirty ring can work with pure page wr-protect too?
> Sure, it can. I just want to discuss many possible kinds of hardware logging buffer.
> However, I'd like to stop at this, at least dirty ring works well with PML. :)

I see your point.  That'll be a good topic at least when we'd like to port
dirty ring to other archs for sure.  However as you see I hoped we can start to
use dirty ring first, find issues, fix it, even redesign some of it, make it
really beneficial at least on one arch, then it'll make more sense to port it,
or attract people porting it. :)

QEMU does not yet have a good solution for huge vm migration yet.  Maybe dirty
ring is a good start for it, maybe not (e.g., with uffd minor mode postcopy has
the other chance).  We'll see...

Thanks,

-- 
Peter Xu


