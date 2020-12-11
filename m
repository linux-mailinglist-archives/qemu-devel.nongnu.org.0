Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC32F2D7E3E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:43:37 +0100 (CET)
Received: from localhost ([::1]:38008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnOC-0007m0-Ql
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1knnBS-0007of-EB
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:30:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1knnBP-0004su-K0
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:30:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607711422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1NoQZ2AEP4+jZfn1x03J22DnqVgnf2YKFz2ra0SAsrU=;
 b=i9IHyVVBoytJRgKSru6dhNlvFpwGxLBeI7KDLfMCDkN53jo1BAMiuvkYMKgJ3JDoFhKCif
 4Fkyv3pdxpuWRc4+TKWkcBcL3Gl8hjZia1vCrsQbUd7nI9XK5SPpxDGk+oMz+VnwJThPOO
 G0MrbL9yh/645Rvk2WQGcNEGGPXyaPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-v3bhNZUUP-K8R-FeAaaMzg-1; Fri, 11 Dec 2020 13:30:18 -0500
X-MC-Unique: v3bhNZUUP-K8R-FeAaaMzg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15338107ACF9;
 Fri, 11 Dec 2020 18:30:17 +0000 (UTC)
Received: from work-vm (ovpn-113-63.ams2.redhat.com [10.36.113.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4896360657;
 Fri, 11 Dec 2020 18:29:59 +0000 (UTC)
Date: Fri, 11 Dec 2020 18:29:56 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: Some performance numbers for virtiofs, DAX and virtio-9p
Message-ID: <20201211182956.GF3380@work-vm>
References: <20201210161126.GA125438@redhat.com>
 <CAOssrKcKaosJo1W+sek0AOA3CdyE+ZUWzx8KPsn=Gz3Nor+_iQ@mail.gmail.com>
 <20201211160603.GD3285@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201211160603.GD3285@redhat.com>
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
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Miklos Szeredi <mszeredi@redhat.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>, virtio-fs-list <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> On Thu, Dec 10, 2020 at 08:29:21PM +0100, Miklos Szeredi wrote:
> > On Thu, Dec 10, 2020 at 5:11 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> > 
> > > Conclusion
> > > -----------
> > > - virtiofs DAX seems to help a lot in many workloads.
> > >
> > >   Note, DAX performance well only if data fits in cache window. My total
> > >   data is 16G and cache window size is 16G as well. If data is larger
> > >   than DAX cache window, then performance of dax suffers a lot. Overhead
> > >   of reclaiming old mapping and setting up a new one is very high.
> > 
> > Which begs the question: what is the optimal window size?
> 
> Yep. I will need to run some more tests with data size being constant
> and varying DAX window size.
> 
> For now, I would say optimal window size is same as data size. But
> knowing data size might be hard in advance. So a rough guideline
> could be that it could be same as amount of RAM given to guest.
> 
> > 
> > What is the cost per GB of window to the host and guest?
> 
> Inside guest, I think two primary structures are allocated. There
> will be "struct page" allocated per 4K page. Size of struct page
> seems to be 64. And then there will be "struct fuse_dax_mapping"
> allocated per 2MB. Size of "struct fuse_dax_mapping" is 112.
> 
> This means per 2MB of DAX window, memory needed in guest is.
> 
> memory per 2MB of DAX window = 112 + 64 * 512 = 32880 bytes.
> memory per 1GB of DAX window = 32880 * 512 = 16834560 (16MB approx)
> 
> I think "struct page" allocation is biggest memory allocation
> and that's roughly 1.56% (64/4096) of DAX window size. And that also
> results in 16MB memory allocation per GB of dax window.
> 
> So if a guest has 4G RAM and 4G dax window, then 64MB will be
> consumed in dax window struct pages. I will say no too bad.
> 
> I am looking at qemu code and its not obvious to me what memory
> allocation will be needed 1GB of guest. Looks like it just 
> stores the cache window location and size and when mapping
> request comes, it simply adds offset to cache window start. So
> it might not be allocating memory per page of dax window.
> 
> mmap(cache_host + sm->c_offset[i], sm->len[i]....
> 
> David, you most likely have a better idea about this.

No, I don't think we do any more; it might make sense of us to store a
per-mapping structure though at some point.
I'm assuming the host kernel is going to get some overhead as well.

> > 
> > Could we measure at what point does a large window size actually make
> > performance worse?
> 
> Will do. Will run tests with varying window sizes (small to large)
> and see how does it impact performance for same workload with
> same guest memory.

I wonder how realistic it is though;  it makes some sense if you have a
scenario like a fairly small root filesystem - something tractable;  but
if you have a large FS you're not realistically going to be able to set
the cache size to match it - that's why it's a cache!

Dave

> > 
> > >
> > > NAME                    WORKLOAD                Bandwidth       IOPS
> > > 9p-none                 seqread-psync           98.6mb          24.6k
> > > 9p-mmap                 seqread-psync           97.5mb          24.3k
> > > 9p-loose                seqread-psync           91.6mb          22.9k
> > > vtfs-none               seqread-psync           98.4mb          24.6k
> > > vtfs-none-dax           seqread-psync           660.3mb         165.0k
> > > vtfs-auto               seqread-psync           650.0mb         162.5k
> > > vtfs-auto-dax           seqread-psync           703.1mb         175.7k
> > > vtfs-always             seqread-psync           671.3mb         167.8k
> > > vtfs-always-dax         seqread-psync           687.2mb         171.8k
> > >
> > > 9p-none                 seqread-psync-multi     397.6mb         99.4k
> > > 9p-mmap                 seqread-psync-multi     382.7mb         95.6k
> > > 9p-loose                seqread-psync-multi     350.5mb         87.6k
> > > vtfs-none               seqread-psync-multi     360.0mb         90.0k
> > > vtfs-none-dax           seqread-psync-multi     2281.1mb        570.2k
> > > vtfs-auto               seqread-psync-multi     2530.7mb        632.6k
> > > vtfs-auto-dax           seqread-psync-multi     2423.9mb        605.9k
> > > vtfs-always             seqread-psync-multi     2535.7mb        633.9k
> > > vtfs-always-dax         seqread-psync-multi     2406.1mb        601.5k
> > 
> > Seems like in all the -multi tests 9p-none performs consistently
> > better than vtfs-none.   Could that be due to the single queue?
> 
> Not sure. In the past I had run -multi tests with shared thread pool
> (cache=auto) and single thread seemed to perform better. I can
> try shared pool and run -multi tests again and see if that helps.
> 
> Thanks
> Vivek
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


