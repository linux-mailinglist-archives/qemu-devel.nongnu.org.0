Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5AD5236BA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 17:10:04 +0200 (CEST)
Received: from localhost ([::1]:46404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nonyV-0000dR-C9
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 11:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nonxc-0007xL-Pq
 for qemu-devel@nongnu.org; Wed, 11 May 2022 11:09:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nonxY-0004lx-ID
 for qemu-devel@nongnu.org; Wed, 11 May 2022 11:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652281741;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VMYr/jO4g/+AcOPUtGKv5UoHnlBwcnDIltIQ4vMribU=;
 b=KS6Bi2InBKB2szSrqDTJonPXN7f5f8kMO4Fz1W23BB2Hwjyy2HL1qBoexQvXg4kApL8ZDU
 M1yXY7quUU9/kbvX6eO4y0CQ5z1XVBw08VmnegzyzSdkfLJjx9himnGV9jttwARXMzRnwa
 osoW+zPBn4F2u+g5AaDuOoVwAge/OYA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-ILiFL3CcOEKTc7Y29EIFkQ-1; Wed, 11 May 2022 11:09:00 -0400
X-MC-Unique: ILiFL3CcOEKTc7Y29EIFkQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A1F0803B22
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 15:09:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 074E6454A69;
 Wed, 11 May 2022 15:08:58 +0000 (UTC)
Date: Wed, 11 May 2022 16:08:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>
Cc: qemu-devel@nongnu.org, david@redhat.com
Subject: Re: [PATCH] util: NUMA aware memory preallocation
Message-ID: <YnvRiAfFbDQIjfgY@redhat.com>
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
 <YnoshVqLNjGFpfEl@redhat.com>
 <c8d84b1f-2a64-fdb4-35f3-875da0575c4d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8d84b1f-2a64-fdb4-35f3-875da0575c4d@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 11, 2022 at 03:16:55PM +0200, Michal Prívozník wrote:
> On 5/10/22 11:12, Daniel P. Berrangé wrote:
> > On Tue, May 10, 2022 at 08:55:33AM +0200, Michal Privoznik wrote:
> >> When allocating large amounts of memory the task is offloaded
> >> onto threads. These threads then use various techniques to
> >> allocate the memory fully (madvise(), writing into the memory).
> >> However, these threads are free to run on any CPU, which becomes
> >> problematic on NUMA machines because it may happen that a thread
> >> is running on a distant node.
> >>
> >> Ideally, this is something that a management application would
> >> resolve, but we are not anywhere close to that, Firstly, memory
> >> allocation happens before monitor socket is even available. But
> >> okay, that's what -preconfig is for. But then the problem is that
> >> 'object-add' would not return until all memory is preallocated.
> >>
> >> Long story short, management application has no way of learning
> >> TIDs of allocator threads so it can't make them run NUMA aware.
> > 
> > So I'm wondering what the impact of this problem is for various
> > scenarios.
> 
> The scenario which I tested this with was no <emulatorpin/> but using
> 'virsh emulatorpin' afterwards to pin emulator thread somewhere. For
> those which are unfamiliar with libvirt, this is about placing the main
> qemu TID (with the main eventloop) into a CGroup that restricts on what
> CPUs it can run.
> 
> > 
> > The default config for a KVM guest with libvirt is no CPU pinning
> > at all. The kernel auto-places CPUs and decides on where RAM is to
> > be allocated. So in this case, whether or not libvirt can talk to
> > QMP in time to query threads is largely irrelevant, as we don't
> > want todo placement in any case.
> > 
> > In theory the kernel should allocate RAM on the node local to
> > where the process is currently executing. So as long as the
> > guest RAM fits in available free RAM on the local node, RAM
> > should be allocated from the node that matches the CPU running
> > the QEMU main thread.
> > 
> > The challenge is if we spawn N more threads to do pre-alloc,
> > these can be spread onto other nodes. I wonder if the kernel
> > huas any preference for keeping threads within a process on
> > the same NUMA node ?
> 
> That's not exactly what I saw. I would have thought too that initially
> the prealloc thread could be spawned just anywhere but after few
> iterations the scheduler realized what NUMA node the thread is close to
> and automatically schedule it to run there. Well, it didn't happen.

Thinking about it, this does make sense to some extent. When a
thread is first spawned, how can the kernel know what region of
memory it is about to start touching ? So at the very least the
kernel schedular can get it wrong initially. It would need something
to watch memory acces patterns to determine whether the initial
decision was right or wrong, and fine tune it later.

Seems like the kernel typically tries todo the opposite to what
we thought, and instead of moving CPUs, has ways to move the
memory instead.

https://www.kernel.org/doc/html/latest/vm/page_migration.html

> > Overall, if libvirt is not applying pinning to the QEMU guest,
> > then we're 100% reliant on the kernel todo something sensible,
> > both for normal QEMU execution and for prealloc. Since we're
> > not doing placement of QEMU RAM or CPUs, the logic in this
> > patch won't do anything either.
> > 
> > 
> > If the guest has more RAM than can fit on the local NUMA node,
> > then we're doomed no matter what, even ignoring prealloc, there
> > will be cross-node traffic. This scenario requires the admin to
> > setup proper CPU /memory pinning for QEMU in libvirt.
> > 
> > If libvirt is doing CPU pinning (as instructed by the mgmt app
> > above us), then when we first start QEMU, the process thread
> > leader will get given affinity by libvirt prior to exec. This
> > affinity will be the union of affinity for all CPUs that will
> > be later configured.
> > 
> > The typical case for CPU pinning, is that everything fits in
> > one NUMA node, and so in this case, we don't need todo anything
> > more. The prealloc threads will already be constrained to the
> > right place by the affinity of the QEMU thread leader, so the
> > logic in this patch will run, but it won't do anything that
> > was not already done.
> > 
> > So we're left with the hardest case, where the guest is explicitly
> > spread across multiple NUMA nodes. In this case the thread leader
> > affinity will span many NUMA nodes, and so the prealloc threads
> > will freely be placed across any CPU that is in the union of CPUs
> > the guest is placed on. Just as with thue non-pinned case, the
> > prealloc will be at the mercy of the kernel making sensible
> > placement decisions.
> 
> Indeed, but it's at least somewhat restricted. NB, in real scenario
> users will map guest NUMA nodes onto host ones with 1:1 relationship.
> And each guest NUMA node will have its own memdev=, i.e. its own set of
> threads, so in the end, prealloc threads won't jump between host NUMA
> nodes but stay local to the node they are allocating memory on.

Thinking about this from a completely different QEMU angle.

Right now the preallocation happens when we create the memory
device, and takes place in threads spawned from the main
QEMU thread.

We are doing memory placement in order that specific blocks of
virtual RAM are co-located with specific virtual CPUs. IOW we
know we already have some threads that will match locality of
the RAM we have.

We are doing memory pre-allocation to give predictable
performance once the VM starts, and to have a guarantee
that the memory is actually available  for use.

We don't actually need the memory pre-allocation to take
place so early in object creation, as we have it right now.
It just needs to be done before VM creation is done and
vCPUs start guest code.


From the POV of controlling QEMU VM resource usage, we don't
really want memory pre-allocation to consume more host CPUs
than we've assigned to the VM for its vCPUs.

So what if instead of creating throwaway threads for memory
allocation early, we ran the preallocation in the vCPU
threads before they start executing guest code ? This is
still early enough to achieve our goals for preallocation.

These vCPU threads already have the right affinity setup. This
ensures that the CPU burn for preallocation doesn't exceed
what we've allowed for guest CPU usage in general, so resource
limits will be naturally enforced.

Is this kind of approach possible ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


