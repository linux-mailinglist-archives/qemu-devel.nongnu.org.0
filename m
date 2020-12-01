Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C8E2CAB21
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 19:56:13 +0100 (CET)
Received: from localhost ([::1]:49200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkAot-0004yX-T6
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 13:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kkAnm-0004FZ-3K
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 13:55:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kkAnj-0007RW-3p
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 13:55:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606848897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Ml8F09HDvC3tLAggkBnXIe8NYBKmMVaqpWNEkOd2nE=;
 b=X8h1Lo/gT+N7CSjcUoKAPpqtFI6V79fm9AgRfz0fbyPBPYZS+vQs+SK271K0yze+7GeFeK
 MeiJd2i+4y1QMMGL0WdcBVxVedUvpSm8LYBveyZ87r5XPpP54JwdQERkrlC0QnTSzENdZA
 DA/ZASpJw3/Ite+TKjeVpRWfdtQUhrU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-e9iQndn0OmSibsDDT-WfNA-1; Tue, 01 Dec 2020 13:54:47 -0500
X-MC-Unique: e9iQndn0OmSibsDDT-WfNA-1
Received: by mail-qv1-f70.google.com with SMTP id o16so1906588qvq.4
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 10:54:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4Ml8F09HDvC3tLAggkBnXIe8NYBKmMVaqpWNEkOd2nE=;
 b=l3wvSbl9jO7ek3N2i2+YG2zSyzlvrpNzt4hoFOin/yol8tBaO544CJyKAiX6RFYUZs
 KnWTQy2ZRkds57IWavgAc0LiTGb13VHdNUhSmfXhsaMradr+YEu7o3jN46p+Jjwo46MP
 91EtkQ7h3jcr+OBymi7tzNuriQZNWLDUJ+U9SEpjInCiJcqkYw/M2e4o5hmmJXg0Oj2b
 cbXTVFBMnCUUJ9eyZVRCwUALOUH0QTzXuqwHlioOQIDfaeZ5gJ8DakbyPKyx+C6q9flo
 LvXoAg+WRmCPI6n9B5aqlX3qPEOyMApNc0WosGi+oFPsIeGvPIiyVJFMSZPLmyfhqZsc
 D7wA==
X-Gm-Message-State: AOAM5321N10MKG3DuD0a8H86f3wd5q13tZDhhR9ZE94Oqq7/YnwurDwO
 YrXFLJph3uLagl9xqW73Ebd9BfusAREd8wAjO+M+a4yfnJQkqYKImx8X34bR7la5Kwpu4a5dZml
 kLBfStLgnjGxxbxU=
X-Received: by 2002:ac8:5ac3:: with SMTP id d3mr4302445qtd.66.1606848886537;
 Tue, 01 Dec 2020 10:54:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjOY7wfwSDzW0rmGFdsZS1zCefOr1+SWQWYcY+YLbZ371lBqQ49fg1YmPbJdC3p3a2wTxAtg==
X-Received: by 2002:ac8:5ac3:: with SMTP id d3mr4302396qtd.66.1606848885736;
 Tue, 01 Dec 2020 10:54:45 -0800 (PST)
Received: from xz-x1 ([142.126.94.187])
 by smtp.gmail.com with ESMTPSA id j17sm515757qtn.2.2020.12.01.10.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 10:54:44 -0800 (PST)
Date: Tue, 1 Dec 2020 13:54:38 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
Message-ID: <20201201185438.GE3277@xz-x1>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201201070820.GO105758@angien.pipo.sk>
 <f9c53596-912a-0b52-adfe-68afff8799dc@virtuozzo.com>
 <20201201105300.GQ105758@angien.pipo.sk>
 <d3b0c767-14d8-b7e7-345d-0314acb3d07e@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <d3b0c767-14d8-b7e7-345d-0314acb3d07e@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 01, 2020 at 02:24:12PM +0300, Andrey Gruzdev wrote:
> On 01.12.2020 13:53, Peter Krempa wrote:
> > On Tue, Dec 01, 2020 at 11:42:18 +0300, Andrey Gruzdev wrote:
> > > On 01.12.2020 10:08, Peter Krempa wrote:
> > > > On Thu, Nov 26, 2020 at 18:17:28 +0300, Andrey Gruzdev via wrote:
> > > > > This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
> > 
> > [...]
> > 
> > > > Note that in cases when qemu can't guarantee that the
> > > > background_snapshot feature will work it should not advertise it. We
> > > > need a way to check whether it's possible to use it, so we can replace
> > > > the existing --live flag with it rather than adding a new one and
> > > > shifting the problem of checking whether the feature works to the user.

Would it be fine if libvirt just try the new way first anyways?  Since if it
will fail, it'll fail right away on any unsupported memory types, then
logically the libvirt user may not even notice we've retried.

Previously I thought it was enough, because so far the kernel does not have a
specific flag showing whether such type of memory is supported.  But I don't
know whether it would be non-trivial for libvirt to retry like that.

Another solution is to let qemu test the uffd ioctls right after QEMU memory
setup, so we know whether background/live snapshot is supported or not with
current memory backends.  We should need to try this for every ramblock because
I think we can have different types across all the qemu ramblocks.

> > > > 
> > > 
> > > Hi,
> > > 
> > > May be you are using hugetlbfs as memory backend?
> > 
> > Not exactly hugepages, but I had:
> > 
> >    <memoryBacking>
> >      <access mode='shared'/>
> >    </memoryBacking>
> > 
> > which resulted into the following commandline to instantiate memory:
> > 
> > -object memory-backend-file,id=pc.ram,mem-path=/var/lib/libvirt/qemu/ram/6-upstream-bj/pc.ram,share=yes,size=33554432000,host-nodes=0,policy=bind \
> > 
> > When I've removed it I got:
> > 
> > -object memory-backend-ram,id=pc.ram,size=33554432000,host-nodes=0,policy=bind \
> > 
> > And the migration didn't fail in my quick test. I'll have a more
> > detailed look later, thanks for the pointer.
> > 
> 
> Yep, seems that current userfaultfd supports hugetlbfs and shared memory for
> missing pages but not for wr-protected..

Correct.  Btw, I'm working on both of them recently.  I have a testing kernel
branch, but I don't think it should affect our qemu work, though, since qemu
should do the same irrelevant of the memory type.  We can just test with
anonymous memories, and as long as it works, it should work perfectly on all
the rest of backends (maybe even for other file-backed memory, more below).

> 
> > > I totally agree that we need somehow check that kernel and VM memory backend
> > > support the feature before one can enable the capability.
> > > Need to think about that..
> > 
> > Definitely. Also note that memory backed by memory-backend-file will be
> > more and more common, for cases such as virtiofs DAX sharing and
> > similar.
> > 
> 
> I see.. That needs support from kernel side, so far 'background-snapshots'
> are incompatible with memory-backend-file sharing.

Yes.  So as mentioned, shmem/hugetlbfs should be WIP, but I haven't thought
about the rest yet.  Maybe... it's not hard to add uffd-wp for most of the
file-backed memory?  Since afaict the kernel handles wr-protect in a quite
straightforward way (do_wp_page() for whatever backend), and uffd-wp can be the
first to trap all of them.  I'm not sure whether Andrea has thought about that
or even on how to spread the missing usage to more types of backends (maybe
missing is more special in that it needs to consider page caches).  So I'm
copying Andrea too just in case there's further input.

Thanks,

-- 
Peter Xu


