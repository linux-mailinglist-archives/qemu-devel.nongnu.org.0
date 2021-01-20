Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C42FCE84
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 11:56:27 +0100 (CET)
Received: from localhost ([::1]:53302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2BA2-0005E3-4H
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l2AzU-0003MN-4E
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:45:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l2AzR-0006rh-Ao
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611139528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JDrReyzPZ7Rd59QCamdR3u8pWWFPQyKoqFGgjV17uJ0=;
 b=Ge4LiB45hc/QHO6yWzsesi+UEqUNOeHvfsL3N2js7tXtomO/aqqFq81gtjsPE/AZB8SwRw
 VuX/OJSbM5TlGg1GU12XmfnSmIG9E/JATNaQHCUt910biMMcs+48myPt+tgXsCr1iBtgw+
 ADN1isJwRR58ZraQrSgEcxFt092hNvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-1jOp5UQfNqqNlgZLjwCvVw-1; Wed, 20 Jan 2021 05:45:22 -0500
X-MC-Unique: 1jOp5UQfNqqNlgZLjwCvVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5214B802B40;
 Wed, 20 Jan 2021 10:45:20 +0000 (UTC)
Received: from work-vm (ovpn-115-106.ams2.redhat.com [10.36.115.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 250ED71D5F;
 Wed, 20 Jan 2021 10:45:03 +0000 (UTC)
Date: Wed, 20 Jan 2021 10:45:01 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: What are libvhost-user locking requirements
Message-ID: <20210120104501.GB2930@work-vm>
References: <20210119221849.GC77840@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210119221849.GC77840@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: gkurz@redhat.com, slp@redhat.com, johannes.berg@intel.com,
 qemu-devel@nongnu.org, virtio-fs-list <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Hi,
> 
> Current virtiofsd code uses libvhost-user and I am assuming virtiofsd-rs
> uses it too. I am wondering what are the locking requirements for
> this library.

No, virtiofsd-rs uses the rust crate: https://github.com/rust-vmm/vhost-user-backend
I guess that's where they get their dose of 'Fearless concurrency'

> Looking at it it does not look like thread safe. Well parts of of kind
> of look thread safe. For example, David Gilbert introduced a slave_mutex
> to control reading/writeing on slave_fd. But dev->slave_fd can be modified
> vu_set_slave_req_fd() without any locks. Similiarly _vu_queue_notify()
> uses dev->slave_fd but  does not take any lock. May be these are just
> bugs and we can take slave_mutex in those paths so not a big deal.

That would be my assumption; I don't think libvhost-user really thought
about it much.

> But this library does not talk about locking at all. Of course there
> are many shared data structures like "struct VuDev" and helpers which
> access this structure. Is client supposed to provide locking and
> make sure not more than one thread is calling into the library
> at one point of time.

I don't think it's defined.

> But in virtiofsd I see that we seem to be in mixed mode. In some cases
> we are holding ->vu_dispatch_rwlock in read-only mode. So that will
> allow multipler threads to call into library for one queue.

I think that lock is really protecting against the queue management
actions on vhost-user remapping the queue conflicting with things
operating on the queue.

> In other places like lo_setupmapping() and lo_removemapping(), we are
> not holding ->vu_dispatch_rwlock() at all and simply call into
> library vu_fs_cache_request(VHOST_USER_SLAVE_FS_MAP/...). So multiple
> threads can call in. I think precisely for this use case dev->slave_mutex
> has been introduced in library.

Note that those calls don't actually read/write interact on the queue
itself; so I don't *think* they need the vu_dispatch_rwlock.

> So few queries.
> 
> - what's the locking model needed to use libvhost-user. Is there one? 

I don't think it really had one.

> - Is it ok to selectively add locking for some data structures in
>   libvhost-user. As slave_mutex has been added. So user will have to
>   go through the code to figure out which paths can be called without
>   locks and which paths can't be.

Well it certainly needed something added; hence why I added slave_mutex,
but the slave_mutex is mostly separate from the actual queue processing,
and actually rarely used.

> /me is confused and trying to wrap my head around the locking requirements
> while using libvhost-user.

It's not well defined at all.

Dave

> 
> Vivek
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


