Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB08D4A8C4C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:12:30 +0100 (CET)
Received: from localhost ([::1]:43520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFhWv-0004pY-G0
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:12:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFghl-0002pE-5O
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:19:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFghh-0004Rg-Oz
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:19:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643912372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s8pjfXZhrbE0HJmFMdJ92D7P3ugrEAMvtww/NqpV7e0=;
 b=D9ATQjfC740aXIHvcHrJlzSYWHvS7nyqSy7Ny/ZNhGg8brRXlvhB2SjajEsZQnjha91ANw
 QdIQOpI0Rga5ZFYUoBNbnKdORK5tpQCU8LL5FpAYxiYZzurkiuKhZFjTfcr1Kmg+S1f0Q9
 jMumDtKT9p0NvMLWXckxC4qGv1uLVv8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-1TRLamxJPy66LUVs7ZHC5g-1; Thu, 03 Feb 2022 13:19:26 -0500
X-MC-Unique: 1TRLamxJPy66LUVs7ZHC5g-1
Received: by mail-wm1-f71.google.com with SMTP id
 m18-20020a7bca52000000b003552c4e2550so1503475wml.0
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 10:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=s8pjfXZhrbE0HJmFMdJ92D7P3ugrEAMvtww/NqpV7e0=;
 b=PcIRSpwzX3Tor4viN4yRTJ3iXsIPj3Dy2GAxRMfL1Ba7rLwQez7B8YJYHppS2u7gIK
 xTKVxMcaU3nnwsCtZAmNySwmbaWX5kXZwgosKXEMWmVeZQNYZs4vTK7cHZwaOjoL8JbA
 oVirNKHN62vIBm1ynwAVKygXzwSaPs7Ab6g5VEcIYsIIuJP8OKUnw7DfXfViW/hupk99
 hNuihehy34pcs+j0KkUXnGDmFAjql23odR7Uo4WStF1xkCCm52JVaQbbqZXDqnAEsphS
 WVolm71PbPgDszyU0NJ4on0xjYfJ+8XwVyT7u3rLzJvHkYdsZMMNS+YFyOnkuud/8vw1
 +PLw==
X-Gm-Message-State: AOAM531wIy7J1oYiok1x6cUahbItj2Fe77KaLG53HPbh+bN5moay6Bqn
 uiJuSW3qMLgTgQ4y1/8RQisTKQTtI/eyFDrL2Ax/LfaLKmo9l7TSIZ9pJkmfRY5OWHfVCyUQQKz
 ELzikpcOLCEodvkc=
X-Received: by 2002:adf:f68a:: with SMTP id v10mr19890015wrp.687.1643912365387; 
 Thu, 03 Feb 2022 10:19:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvPlaIH0lsIZB1g0nmbN+FWnfR+WpAc5r2tRGpOsO9qqabn3h8ubAnV3teOBrnjNQJ1+4msw==
X-Received: by 2002:adf:f68a:: with SMTP id v10mr19890002wrp.687.1643912365194; 
 Thu, 03 Feb 2022 10:19:25 -0800 (PST)
Received: from work-vm (82-132-239-190.dab.02.net. [82.132.239.190])
 by smtp.gmail.com with ESMTPSA id e17sm11408751wrt.27.2022.02.03.10.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 10:19:24 -0800 (PST)
Date: Thu, 3 Feb 2022 18:19:22 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 02/15] migration: Allow pss->page jump over clean pages
Message-ID: <YfwcqgbYEVtfSAbH@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-3-peterx@redhat.com>
 <YegVV6lmkkmKBv9p@work-vm> <YejE8+F1l0ugJruR@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YejE8+F1l0ugJruR@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: Kunkun Jiang <jiangkunkun@huawei.com>, Juan Quintela <quintela@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Wed, Jan 19, 2022 at 01:42:47PM +0000, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > Commit ba1b7c812c ("migration/ram: Optimize ram_save_host_page()") managed to
> > > optimize host huge page use case by scanning the dirty bitmap when looking for
> > > the next dirty small page to migrate.
> > > 
> > > However when updating the pss->page before returning from that function, we
> > > used MIN() of these two values: (1) next dirty bit, or (2) end of current sent
> > > huge page, to fix up pss->page.
> > > 
> > > That sounds unnecessary, because I see nowhere that requires pss->page to be
> > > not going over current huge page boundary.
> > > 
> > > What we need here is probably MAX() instead of MIN() so that we'll start
> > > scanning from the next dirty bit next time. Since pss->page can't be smaller
> > > than hostpage_boundary (the loop guarantees it), it probably means we don't
> > > need to fix it up at all.
> > > 
> > > Cc: Keqian Zhu <zhukeqian1@huawei.com>
> > > Cc: Kunkun Jiang <jiangkunkun@huawei.com>
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > 
> > 
> > Hmm, I think that's potentially necessary.  note that the start of
> > ram_save_host_page stores the 'start_page' at entry.
> > That' start_page' goes to the ram_save_release_protection and so
> > I think it needs to be pagesize aligned for the mmap/uffd that happens.
> 
> Right, that's indeed a functional change, but IMHO it's also fine.
> 
> When reaching ram_save_release_protection(), what we guaranteed is that below
> page range contains no dirty bits in ramblock dirty bitmap:
> 
>   range0 = [start_page, pss->page)
> 
> Side note: inclusive on start, but not inclusive on the end side of range0
> (that is, pss->page can be pointing to a dirty page).
> 
> What ram_save_release_protection() does is to unprotect the pages and let them
> run free.  If we're sure range0 contains no dirty page, it means we have
> already copied them over into the snapshot, so IIUC it's safe to unprotect all
> of it (even if it's already bigger than the host page size)?

I think what's worrying me is the alignment of the address going into
UFFDIO_WRITEPROTECT in uffd_change_protection - if it was previously
huge page aligned and now isn't, what breaks? (Did it support
hugepages?)

> That can be slightly less efficient for live snapshot in some extreme cases
> (when unprotect, we'll need to walk the pgtables in the uffd ioctl()), but I
> don't assume live snapshot to be run on a huge VM, so hopefully it's still
> fine?  Not to mention it should make live migration a little bit faster,
> assuming that's more frequently used..

Hmm I don't think I understand that statement.

Dave

> 
> Thanks,
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


