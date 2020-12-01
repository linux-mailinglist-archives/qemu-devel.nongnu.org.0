Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366592CACE5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:02:55 +0100 (CET)
Received: from localhost ([::1]:45170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBrR-0001Lu-Mb
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkBpl-0000kv-FS
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:01:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkBpe-0000tR-Jv
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606852859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Xxe9ZSNt8nlXfpYxghkCByYa4R1uzrSJOXGB4MwP64=;
 b=etH9pLS9tJCmCBk6F0yLNQne5CG6923UwjPNE9Fw99fnrJJc2jUX6vI2n1T8kQ01Gxz2j7
 1o4mUTHOFX656wulSn1EB1/LlD7+CcsMtj78vJqeuuyAy70RiUXD0g6qRcK2RSWcT02MOw
 5UbEfZnAgB85Uo/HucDRwWU803UMLmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-fUv4qNSHMV--Z5bPUTdjSQ-1; Tue, 01 Dec 2020 15:00:57 -0500
X-MC-Unique: fUv4qNSHMV--Z5bPUTdjSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82C5D858182;
 Tue,  1 Dec 2020 20:00:56 +0000 (UTC)
Received: from work-vm (ovpn-115-1.ams2.redhat.com [10.36.115.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D59B5B4A1;
 Tue,  1 Dec 2020 20:00:50 +0000 (UTC)
Date: Tue, 1 Dec 2020 20:00:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
Message-ID: <20201201200048.GP4338@work-vm>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201201070820.GO105758@angien.pipo.sk>
 <f9c53596-912a-0b52-adfe-68afff8799dc@virtuozzo.com>
 <20201201105300.GQ105758@angien.pipo.sk>
 <d3b0c767-14d8-b7e7-345d-0314acb3d07e@virtuozzo.com>
 <20201201185438.GE3277@xz-x1>
MIME-Version: 1.0
In-Reply-To: <20201201185438.GE3277@xz-x1>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>, Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Tue, Dec 01, 2020 at 02:24:12PM +0300, Andrey Gruzdev wrote:
> > On 01.12.2020 13:53, Peter Krempa wrote:
> > > On Tue, Dec 01, 2020 at 11:42:18 +0300, Andrey Gruzdev wrote:
> > > > On 01.12.2020 10:08, Peter Krempa wrote:
> > > > > On Thu, Nov 26, 2020 at 18:17:28 +0300, Andrey Gruzdev via wrote:
> > > > > > This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
> > > 
> > > [...]
> > > 
> > > > > Note that in cases when qemu can't guarantee that the
> > > > > background_snapshot feature will work it should not advertise it. We
> > > > > need a way to check whether it's possible to use it, so we can replace
> > > > > the existing --live flag with it rather than adding a new one and
> > > > > shifting the problem of checking whether the feature works to the user.
> 
> Would it be fine if libvirt just try the new way first anyways?  Since if it
> will fail, it'll fail right away on any unsupported memory types, then
> logically the libvirt user may not even notice we've retried.
> 
> Previously I thought it was enough, because so far the kernel does not have a
> specific flag showing whether such type of memory is supported.  But I don't
> know whether it would be non-trivial for libvirt to retry like that.
> 
> Another solution is to let qemu test the uffd ioctls right after QEMU memory
> setup, so we know whether background/live snapshot is supported or not with
> current memory backends.  We should need to try this for every ramblock because
> I think we can have different types across all the qemu ramblocks.

I don't think we actually do that for postcopy; we do some checks like
checking if we have any hugepages, and if so checking for it's flags.
But note that we do tie it into migrate_caps_check to fail if you try
and set the capability.

> 
> > > > > 
> > > > 
> > > > Hi,
> > > > 
> > > > May be you are using hugetlbfs as memory backend?
> > > 
> > > Not exactly hugepages, but I had:
> > > 
> > >    <memoryBacking>
> > >      <access mode='shared'/>
> > >    </memoryBacking>
> > > 
> > > which resulted into the following commandline to instantiate memory:
> > > 
> > > -object memory-backend-file,id=pc.ram,mem-path=/var/lib/libvirt/qemu/ram/6-upstream-bj/pc.ram,share=yes,size=33554432000,host-nodes=0,policy=bind \
> > > 
> > > When I've removed it I got:
> > > 
> > > -object memory-backend-ram,id=pc.ram,size=33554432000,host-nodes=0,policy=bind \
> > > 
> > > And the migration didn't fail in my quick test. I'll have a more
> > > detailed look later, thanks for the pointer.
> > > 
> > 
> > Yep, seems that current userfaultfd supports hugetlbfs and shared memory for
> > missing pages but not for wr-protected..
> 
> Correct.  Btw, I'm working on both of them recently.  I have a testing kernel
> branch, but I don't think it should affect our qemu work, though, since qemu
> should do the same irrelevant of the memory type.  We can just test with
> anonymous memories, and as long as it works, it should work perfectly on all
> the rest of backends (maybe even for other file-backed memory, more below).
> 
> > 
> > > > I totally agree that we need somehow check that kernel and VM memory backend
> > > > support the feature before one can enable the capability.
> > > > Need to think about that..
> > > 
> > > Definitely. Also note that memory backed by memory-backend-file will be
> > > more and more common, for cases such as virtiofs DAX sharing and
> > > similar.
> > > 
> > 
> > I see.. That needs support from kernel side, so far 'background-snapshots'
> > are incompatible with memory-backend-file sharing.
> 
> Yes.  So as mentioned, shmem/hugetlbfs should be WIP, but I haven't thought
> about the rest yet.  Maybe... it's not hard to add uffd-wp for most of the
> file-backed memory?  Since afaict the kernel handles wr-protect in a quite
> straightforward way (do_wp_page() for whatever backend), and uffd-wp can be the
> first to trap all of them.  I'm not sure whether Andrea has thought about that
> or even on how to spread the missing usage to more types of backends (maybe
> missing is more special in that it needs to consider page caches).  So I'm
> copying Andrea too just in case there's further input.

Some would be good; we've got requests for it to work on pmem mmaped
devices.   You do have to be a little careful about semantics though;
I'm not sure it's that big of a problem for the wp case, but for the
absent case you need to worry about finding an equivalent of madvise or
fallocate that cna punch a hole.

Dave

> Thanks,
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


