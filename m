Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320122EAF45
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 16:48:07 +0100 (CET)
Received: from localhost ([::1]:47078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwoZ3-0004Qa-Os
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 10:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kwoXI-0003mp-81
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 10:46:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kwoX9-0004u4-SQ
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 10:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609861565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mx7qaCHH6002yxDORbH0FB36tN9Wc9dNAYuWN4pSheI=;
 b=DeTiRSK/T6Fvrs8Q9jmcmceqYZ9ujaz8Gw+Ydg5zIg7OmmeteXL/c7MH22hUhO+qYO1wtu
 skAVBQNdVNXAY+1C79FeHVFPeZ1d4b6BQU6HK0ahTMs1jHXq6pet5x9x37y40e3FOXS5Q5
 +EFNFoiarMoo1rqhCfjx7B7FioLYQ00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-XBuDVgnTNYqNy_wKIXHerw-1; Tue, 05 Jan 2021 10:46:03 -0500
X-MC-Unique: XBuDVgnTNYqNy_wKIXHerw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B274801AE8;
 Tue,  5 Jan 2021 15:46:02 +0000 (UTC)
Received: from horse.redhat.com (ovpn-117-227.rdu2.redhat.com [10.10.117.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A85E5D9D2;
 Tue,  5 Jan 2021 15:45:55 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id B5742220BCF; Tue,  5 Jan 2021 10:45:54 -0500 (EST)
Date: Tue, 5 Jan 2021 10:45:54 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: Some performance numbers for virtiofs, DAX and virtio-9p
Message-ID: <20210105154554.GC3200@redhat.com>
References: <20201210161126.GA125438@redhat.com>
 <CAOssrKcKaosJo1W+sek0AOA3CdyE+ZUWzx8KPsn=Gz3Nor+_iQ@mail.gmail.com>
 <20201211160603.GD3285@redhat.com> <20201211182956.GF3380@work-vm>
 <20201211192517.GF3285@redhat.com>
 <CAOssrKejTsvg6jZtOFVZ-5iGRmh=RdgfiAre+cbYDQLrrosvJA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOssrKejTsvg6jZtOFVZ-5iGRmh=RdgfiAre+cbYDQLrrosvJA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: "Venegas Munoz, Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, virtio-fs-list <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 05, 2021 at 04:08:34PM +0100, Miklos Szeredi wrote:
> On Fri, Dec 11, 2020 at 8:25 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > On Fri, Dec 11, 2020 at 06:29:56PM +0000, Dr. David Alan Gilbert wrote:
> >
> > [..]
> > > > >
> > > > > Could we measure at what point does a large window size actually make
> > > > > performance worse?
> > > >
> > > > Will do. Will run tests with varying window sizes (small to large)
> > > > and see how does it impact performance for same workload with
> > > > same guest memory.
> > >
> > > I wonder how realistic it is though;  it makes some sense if you have a
> > > scenario like a fairly small root filesystem - something tractable;  but
> > > if you have a large FS you're not realistically going to be able to set
> > > the cache size to match it - that's why it's a cache!
> >
> > I think its more about active dataset size and not necessarily total
> > FS size. FS might be big but if application is not accessing all of
> > the in reasonabl small time window, then it does not matter.
> >
> > What worries me most is that cost of reclaim of a dax range seems
> > too high (or keeps the process blocked for long enogh), that it
> > kills the performance. I will need to revisit the reclaim path
> > and see if I can optimize something.
> 
> Can we dynamically increase the dax window size?  Or hot plug
> additional dax ranges on demand?

I don't think we can do that yet. In fact I am skeptical that currently
hotplug of whole virtio-fs device itself might not work.

> 
> That would solve the problem of trying to find the active set size in advance.

Agreed. Being able to grow dax window dynamically or be able to add
a new dax window to existing device dynamically will help.

David, Stefan, WDYT. Is it possible given current code of qemu and
virtio device. Do other virtio device allow similar operations.

Thanks
Vivek

> 
> We'd still need reclaim in order to prevent the window from growing
> indefinitely, but that would always be background reclaim and be done
> after some time of inactivity.
> 
> Thanks,
> Miklos
> 


