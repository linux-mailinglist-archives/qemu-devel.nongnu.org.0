Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048CC2CACE6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:03:37 +0100 (CET)
Received: from localhost ([::1]:46486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBs8-0001tP-2P
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkBqU-00013e-3d
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:01:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkBqP-0001KQ-R3
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606852908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p08iSY+kgBnjqJyreM/eyA6iPuemeoYxK+gGxA5dnnM=;
 b=IoyH2P7MZ11g2Ttl9d8fhppHZXHRctS9GGRXMOIIRipRZhcS2HV8m1IPfKA7S6nSUB+1pF
 pgykKd47RxoEJQ3EEd6RJxNc0jbUjri5irYLJJQ78injcm8senuBrrOiLibhqmRUyRMM6n
 GX0W6FBQqvBtH/W+rrrpHC5JU5zXOpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-Pl55aTfwMOa8ETXcJcqUWw-1; Tue, 01 Dec 2020 15:01:46 -0500
X-MC-Unique: Pl55aTfwMOa8ETXcJcqUWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3754C858182;
 Tue,  1 Dec 2020 20:01:45 +0000 (UTC)
Received: from work-vm (ovpn-115-1.ams2.redhat.com [10.36.115.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 634F560BFA;
 Tue,  1 Dec 2020 20:01:40 +0000 (UTC)
Date: Tue, 1 Dec 2020 20:01:37 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
Message-ID: <20201201200137.GQ4338@work-vm>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201201070820.GO105758@angien.pipo.sk>
 <f9c53596-912a-0b52-adfe-68afff8799dc@virtuozzo.com>
 <20201201105300.GQ105758@angien.pipo.sk>
 <d3b0c767-14d8-b7e7-345d-0314acb3d07e@virtuozzo.com>
 <20201201184055.GM4338@work-vm> <20201201192247.GF3277@xz-x1>
MIME-Version: 1.0
In-Reply-To: <20201201192247.GF3277@xz-x1>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Krempa <pkrempa@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Tue, Dec 01, 2020 at 06:40:55PM +0000, Dr. David Alan Gilbert wrote:
> > > Yep, seems that current userfaultfd supports hugetlbfs and shared memory for
> > > missing pages but not for wr-protected..
> > 
> > For hugepages, you'd need kernel support - but also you'd want to make
> > sure you write the whole hugepage at once.
> 
> Or we can do similar things by splitting the huge pages just like when we
> migrate.
> 
> I should have overlooked these facts when I replied previusly - we do need the
> same logic, but also special care on these special memory types.
> 
> > 
> > For shared, there's a harder problem to ask; what happens if RAM is
> > written by the other process - for postcopy, we get the other process
> > to send us a userfaultfd that they have registered with their VM.
> 
> Good point... so we should need similar things too.
> 
> Looks like we'd better explicitly disable shmem/hugetlbfs for now from qemu
> background snapshots before we have prepared these utilities, just in case it
> got run on some "future" kernels and accidentally got enabled, so the snapshot
> files could be corrupted ones.
> 
> Is shmem used a lot in libvirt, or is it even a default configuration?

No, but it's used with vhost-user applications; like dpdk.

Dave

> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


