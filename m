Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD962C027C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 10:48:48 +0100 (CET)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh8Sl-0000iM-47
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 04:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miklos@szeredi.hu>) id 1kh8RA-00088X-MR
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:47:11 -0500
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43]:35766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <miklos@szeredi.hu>) id 1kh8R7-0001CP-4b
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:47:07 -0500
Received: by mail-vs1-xe43.google.com with SMTP id v8so8294357vso.2
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 01:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZsMt2XnoIlYnnG5BiedHbtTd+nxdVSn63U6LZGHCEbY=;
 b=cgA1U9oYtIMjlL5Yp4PqP3SYhuTk8FYirONLJ2I0gkGY5MedBfhscaEwdlnWa6jU6Y
 K6t76/mJ1boIMSKLcrH9IBb9Zve5sslmFr306M8ODmBg9xEYrBe2JRHEbxrKBh2prJJg
 CWQ36QR7rWz7zU1Ar/YGdHmLmdaNSH49r09ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZsMt2XnoIlYnnG5BiedHbtTd+nxdVSn63U6LZGHCEbY=;
 b=fUcu8Z9vngy9apJ4YWYnvziM99Ci6tpWm7CjX+8c8SAsVjEVaNiJYYuvKRbi05LnA2
 xfdLTmTIVyG1w2CGgtbJIuAh0i3DSLMUh8zz55/DncfM8To7B7ufIPxbFcOWNBAP5TYp
 ucFvKIQ339f8c1ovhnEESBnuA4lAeFlRJ0lu7YOpHzo/IL45SEINc74+2Y4ahOdEtgrf
 Nz/ubdUQFr1U2yViJ8W7tW6FyLlsz1WT3GAH9IarI86AYZYBxxAad3y4ist/X23Qmn4/
 gvxKEJpnR9EjIUXSIg9X0IdVtBFszekbFC4x0gvRSF89HYhYaR4qYtksfnvp+RYG4VFk
 miAg==
X-Gm-Message-State: AOAM532B0a6i0UuKctzfOYaPtdF66hFThP+yCU5AEKEpZBnad8hIw35D
 eLMpQXKUUsWJ+sQ1JKQfPgpL6mlr/GlNWosWplueSg==
X-Google-Smtp-Source: ABdhPJy/rSQfuF5AEH6P58plY0W4wVdx1VYe25ptRu0KINtPib26uBfc0mNIzOikXXn2lAV6AKOPEZ/GIVQMqw8g0WM=
X-Received: by 2002:a67:e981:: with SMTP id b1mr19861393vso.47.1606124822229; 
 Mon, 23 Nov 2020 01:47:02 -0800 (PST)
MIME-Version: 1.0
References: <20201105194416.GA1384085@redhat.com>
 <20201105195253.GB1384085@redhat.com>
 <D9233684-9B76-468E-A5F1-B35DA3F3C091@intel.com>
 <20201106223524.GG1436035@redhat.com>
 <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
 <20201118195153.GB111728@redhat.com>
In-Reply-To: <20201118195153.GB111728@redhat.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 23 Nov 2020 10:46:50 +0100
Message-ID: <CAJfpeguJiVw=6Sd764Eqaw5hdkW4tOgRedek5H4G38++e0jxGA@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Use --thread-pool-size=0 to mean
 no thread pool
To: Vivek Goyal <vgoyal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e43;
 envelope-from=miklos@szeredi.hu; helo=mail-vs1-xe43.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, Miklos Szeredi <mszeredi@redhat.com>,
 "Shinde, Archana M" <archana.m.shinde@intel.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 8:52 PM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> On Thu, Nov 12, 2020 at 10:06:37AM +0100, Miklos Szeredi wrote:
> > On Fri, Nov 6, 2020 at 11:35 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> > >
> > > On Fri, Nov 06, 2020 at 08:33:50PM +0000, Venegas Munoz, Jose Carlos wrote:
> > > > Hi Vivek,
> > > >
> > > > I have tested with Kata 1.12-apha0, the results seems that are better for the use fio config I am tracking.
> > > >
> > > > The fio config does  randrw:
> > > >
> > > > fio --direct=1 --gtod_reduce=1 --name=test --filename=random_read_write.fio --bs=4k --iodepth=64 --size=200M --readwrite=randrw --rwmixread=75
> > > >
> > >
> > > Hi Carlos,
> > >
> > > Thanks for the testing.
> > >
> > > So basically two conclusions from your tests.
> > >
> > > - for virtiofs, --thread-pool-size=0 is performing better as comapred
> > >   to --thread-pool-size=1 as well as --thread-pool-size=64. Approximately
> > >   35-40% better.
> > >
> > > - virtio-9p is still approximately 30% better than virtiofs
> > >   --thread-pool-size=0.
> > >
> > > As I had done the analysis that this particular workload (mixed read and
> > > write) is bad with virtiofs because after every write we are invalidating
> > > attrs and cache so next read ends up fetching attrs again. I had posted
> > > patches to gain some of the performance.
> > >
> > > https://lore.kernel.org/linux-fsdevel/20200929185015.GG220516@redhat.com/
> > >
> > > But I got the feedback to look into implementing file leases instead.
> >
> > Hmm, the FUSE_AUTO_INVAL_DATA feature is buggy, how about turning it
> > off for now?   9p doesn't have it, so no point in enabling it for
> > virtiofs by default.
>
> If we disable FUSE_AUTO_INVAL_DATA, then client page cache will not
> be invalidated even after 1 sec, right? (for cache=auto).

Unless FOPEN_KEEP_CACHE is used (only cache=always, AFAICS) data cache
will be invalidated on open.

I think it's what NFS does, except NFS does invalidation based on
mtime *at the time of open*.   At least that's what I remember from
past reading of NFS code.

> Given now we also want to target sharing directory tree among multiple
> clients, keeping FUSE_AUTO_INVAL_DATA enabled should help.

Depends what applications expect.  THe close-to-open coherency
provided even without FUSE_AUTO_INVAL_DATA should be enough for the
case when strong coherency is not required.

>
> >
> > Also I think some confusion comes from cache=auto being the default
> > for virtiofs.    Not sure what the default is for 9p, but comparing
> > default to default will definitely not be apples to apples since this
> > mode is nonexistent in 9p.
> >
> > 9p:cache=none  <-> virtiofs:cache=none
> > 9p:cache=loose <-> virtiofs:cache=always
> >
> > "9p:cache=mmap" and "virtiofs:cache=auto" have no match.
>
> Agreed from performance comparison point of view.
>
> I will prefer cache=auto default (over cache=none) for virtiofsd. During
> some kernel compilation tests over virtiofs, cache=none was painfully
> slow as compared to cache=auto.

It would also be interesting to know the exact bottleneck in the
kernel compile with cache=none case.

Thanks,
Miklos

