Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E222D7FC4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 21:05:34 +0100 (CET)
Received: from localhost ([::1]:34254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knofV-0006df-8P
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 15:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1knobY-0005Df-AY
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:01:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1knobS-0007Zo-OX
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607716881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bFM8FSVJwubnfTnJrWGXX+7jwf6vCqgFqrrJzhSWcMY=;
 b=Fm9Hi3NrGqYZuFcBtjW1lAdIVF3n/ncAVVUB6rmiY8OtgsIADS5tZLKbWQ8W0PFpkZooOD
 fFGgXt9HLIH2ZmVmiecyMzqCvwJB0fU4Ay3fLckBNjQm+5w7gF5lQU0eRGZnXNpcrknm+K
 8LPx+sFGbC0YzTcwycthCyOa9IbnhW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-jRIxGeBiOqe9rkcKOCaOiA-1; Fri, 11 Dec 2020 15:01:17 -0500
X-MC-Unique: jRIxGeBiOqe9rkcKOCaOiA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11E69107ACE3;
 Fri, 11 Dec 2020 20:01:16 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-237.rdu2.redhat.com [10.10.115.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 485656F45B;
 Fri, 11 Dec 2020 20:01:09 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id CF0DE220BCF; Fri, 11 Dec 2020 15:01:08 -0500 (EST)
Date: Fri, 11 Dec 2020 15:01:08 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: Some performance numbers for virtiofs, DAX and virtio-9p
Message-ID: <20201211200108.GG3285@redhat.com>
References: <20201210161126.GA125438@redhat.com>
 <CAOssrKcKaosJo1W+sek0AOA3CdyE+ZUWzx8KPsn=Gz3Nor+_iQ@mail.gmail.com>
 <20201211160603.GD3285@redhat.com> <20201211182956.GF3380@work-vm>
 <20201211192517.GF3285@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201211192517.GF3285@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Miklos Szeredi <mszeredi@redhat.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>, virtio-fs-list <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 11, 2020 at 02:25:17PM -0500, Vivek Goyal wrote:
> On Fri, Dec 11, 2020 at 06:29:56PM +0000, Dr. David Alan Gilbert wrote:
> 
> [..]
> > > > 
> > > > Could we measure at what point does a large window size actually make
> > > > performance worse?
> > > 
> > > Will do. Will run tests with varying window sizes (small to large)
> > > and see how does it impact performance for same workload with
> > > same guest memory.
> > 
> > I wonder how realistic it is though;  it makes some sense if you have a
> > scenario like a fairly small root filesystem - something tractable;  but
> > if you have a large FS you're not realistically going to be able to set
> > the cache size to match it - that's why it's a cache!
> 
> I think its more about active dataset size and not necessarily total
> FS size. FS might be big but if application is not accessing all of
> the in reasonabl small time window, then it does not matter.
> 
> What worries me most is that cost of reclaim of a dax range seems
> too high (or keeps the process blocked for long enogh), that it
> kills the performance. I will need to revisit the reclaim path
> and see if I can optimize something.

I see that while reclaiming a range, we are sending a remvemapping
command to virtiofsd. We are holding locks so that no new mappings
can be added to that inode.

We had decided that removemapping is not necessary. It helps in
the sense that if guest is not using a mapping, qemu will unmap
it too.

If we stop sending remove mapping, then it might improve reclaim
performance significantly. With the downside that host will
have something mapped (despite the fact that guest is not using
it anymore). And these will be cleaned up only when guest shuts
down.

Vivek


