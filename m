Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1264D2B8527
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 20:56:48 +0100 (CET)
Received: from localhost ([::1]:36292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfTZN-0002pX-Ct
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 14:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kfTUu-0007Jq-Nf
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:52:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kfTUr-0005uj-Gd
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605729123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8rvfWxZ64h5PBQ6Y5KN5GtQceq0+b1Fp7KLd2gkriC8=;
 b=UL4Q7pTBOK5Y/3qnVsyKvL7fJaY5oEC8Vk7aWAm4BS7Z6fpt82NchAxAPUrSTVP0VWHvP/
 rhSmY2CPSuNqZuDzqO3LfDY0ayAcKOkMFzWrApd7w8Nx6z8dJts9bAmcYDlmEsXCxELrr7
 6L4RvHZXUdviKwvdEw5MRhw4yw1KrK0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-AtUbrL5_MEC6d53LkKQf1w-1; Wed, 18 Nov 2020 14:51:59 -0500
X-MC-Unique: AtUbrL5_MEC6d53LkKQf1w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58E7A1823A80;
 Wed, 18 Nov 2020 19:51:58 +0000 (UTC)
Received: from horse.redhat.com (ovpn-117-157.rdu2.redhat.com [10.10.117.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45CE05C1A3;
 Wed, 18 Nov 2020 19:51:54 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id B9765220203; Wed, 18 Nov 2020 14:51:53 -0500 (EST)
Date: Wed, 18 Nov 2020 14:51:53 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Use --thread-pool-size=0 to mean
 no thread pool
Message-ID: <20201118195153.GB111728@redhat.com>
References: <20201105194416.GA1384085@redhat.com>
 <20201105195253.GB1384085@redhat.com>
 <D9233684-9B76-468E-A5F1-B35DA3F3C091@intel.com>
 <20201106223524.GG1436035@redhat.com>
 <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, "Shinde,
 Archana M" <archana.m.shinde@intel.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Miklos Szeredi <miklos@szeredi.hu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 12, 2020 at 10:06:37AM +0100, Miklos Szeredi wrote:
> On Fri, Nov 6, 2020 at 11:35 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > On Fri, Nov 06, 2020 at 08:33:50PM +0000, Venegas Munoz, Jose Carlos wrote:
> > > Hi Vivek,
> > >
> > > I have tested with Kata 1.12-apha0, the results seems that are better for the use fio config I am tracking.
> > >
> > > The fio config does  randrw:
> > >
> > > fio --direct=1 --gtod_reduce=1 --name=test --filename=random_read_write.fio --bs=4k --iodepth=64 --size=200M --readwrite=randrw --rwmixread=75
> > >
> >
> > Hi Carlos,
> >
> > Thanks for the testing.
> >
> > So basically two conclusions from your tests.
> >
> > - for virtiofs, --thread-pool-size=0 is performing better as comapred
> >   to --thread-pool-size=1 as well as --thread-pool-size=64. Approximately
> >   35-40% better.
> >
> > - virtio-9p is still approximately 30% better than virtiofs
> >   --thread-pool-size=0.
> >
> > As I had done the analysis that this particular workload (mixed read and
> > write) is bad with virtiofs because after every write we are invalidating
> > attrs and cache so next read ends up fetching attrs again. I had posted
> > patches to gain some of the performance.
> >
> > https://lore.kernel.org/linux-fsdevel/20200929185015.GG220516@redhat.com/
> >
> > But I got the feedback to look into implementing file leases instead.
> 
> Hmm, the FUSE_AUTO_INVAL_DATA feature is buggy, how about turning it
> off for now?   9p doesn't have it, so no point in enabling it for
> virtiofs by default.

If we disable FUSE_AUTO_INVAL_DATA, then client page cache will not
be invalidated even after 1 sec, right? (for cache=auto).

Given now we also want to target sharing directory tree among multiple
clients, keeping FUSE_AUTO_INVAL_DATA enabled should help.

> 
> Also I think some confusion comes from cache=auto being the default
> for virtiofs.    Not sure what the default is for 9p, but comparing
> default to default will definitely not be apples to apples since this
> mode is nonexistent in 9p.
> 
> 9p:cache=none  <-> virtiofs:cache=none
> 9p:cache=loose <-> virtiofs:cache=always
> 
> "9p:cache=mmap" and "virtiofs:cache=auto" have no match.

Agreed from performance comparison point of view.

I will prefer cache=auto default (over cache=none) for virtiofsd. During
some kernel compilation tests over virtiofs, cache=none was painfully
slow as compared to cache=auto.

Thanks
Vivek


