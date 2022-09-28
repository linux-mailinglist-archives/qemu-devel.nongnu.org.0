Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177EE5EE5AA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 21:28:32 +0200 (CEST)
Received: from localhost ([::1]:32770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odcjP-0003je-7f
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 15:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1odcho-0001wn-83
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 15:26:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1odchZ-0004vO-Ue
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 15:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664393195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MHjt5pmI4EmcuVLyqGlqrWz+iXBX4jX508Dc6PsEg1o=;
 b=G5lQmfqv0UXsJIHz2nfu+uKCjrwOpdZ8+qqa3fQpEuydUA42NMSw9ZgMH5RTZg4NTBk6NP
 nqlD5iMw9gVaft8m41A4iJXmv342LeVyeguyIy9KLuEsXkVMuv/TcRspFCndGmDIwH/ceX
 HMM/LwAMORIDWxn+iTWm0PkpeyWGrXk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-Pnql5SMRM2KzOSZDIvO31A-1; Wed, 28 Sep 2022 15:26:33 -0400
X-MC-Unique: Pnql5SMRM2KzOSZDIvO31A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 449CA3C0218E;
 Wed, 28 Sep 2022 19:26:33 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.9.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07D092027061;
 Wed, 28 Sep 2022 19:26:33 +0000 (UTC)
Received: by fedora.redhat.com (Postfix, from userid 1000)
 id 9805F4ACDD; Wed, 28 Sep 2022 15:26:32 -0400 (EDT)
Date: Wed, 28 Sep 2022 15:26:32 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: German Maglione <gmaglione@redhat.com>
Cc: Colin Walters <walters@verbum.org>, qemu-devel@nongnu.org,
 virtio-fs-list <virtio-fs@redhat.com>, Sergio Lopez <slp@redhat.com>
Subject: Re: virtiofsd: Any reason why there's not an "openat2" sandbox mode?
Message-ID: <YzSf6NYs0vJhzPc7@redhat.com>
References: <4362261a-c762-4666-84e2-03c9daa6c4d9@www.fastmail.com>
 <YzMmu3xfOtQwuFUx@redhat.com> <YzMrYAJQeSP2hDSs@redhat.com>
 <CAJh=p+5rQDBJJC8VNGL10KYgDeq-Hg5WK7avONCti03eJGH+ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJh=p+5rQDBJJC8VNGL10KYgDeq-Hg5WK7avONCti03eJGH+ow@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 27, 2022 at 07:27:02PM +0200, German Maglione wrote:
> On Tue, Sep 27, 2022 at 6:57 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > On Tue, Sep 27, 2022 at 12:37:15PM -0400, Vivek Goyal wrote:
> > > On Fri, Sep 09, 2022 at 05:24:03PM -0400, Colin Walters wrote:
> > > > We previously had a chat here https://lore.kernel.org/all/348d4774-bd5f-4832-bd7e-a21491fdac8d@www.fastmail.com/T/
> > > > around virtiofsd and privileges and the case of trying to run virtiofsd inside an unprivileged (Kubernetes) container.
> > > >
> > > > Right now we're still using 9p, and it has bugs (basically it seems like the 9p inode flushing callback tries to allocate memory to send an RPC, and this causes OOM problems)
> > > > https://github.com/coreos/coreos-assembler/issues/1812
> > > >
> > > > Coming back to this...as of lately in Linux, there's support for strongly isolated filesystem access via openat2():
> > > > https://lwn.net/Articles/796868/
> > > >
> > > > Is there any reason we couldn't do an -o sandbox=openat2 ?  This operates without any privileges at all, and should be usable (and secure enough) in our use case.
> > >
> > > [ cc virtio-fs-list, german, sergio ]
> > >
> > > Hi Colin,
> > >
> > > Using openat2(RESOLVE_IN_ROOT) (if kernel is new enough), sounds like a
> > > good idea. We talked about it few times but nobody ever wrote a patch to
> > > implement it.
> > >
> > > And it probably makes sense with all the sandboxes (chroot(), namespaces).
> > >
> > > I am wondering that it probably should not be a new sandbox mode at all.
> > > It probably should be the default if kernel offers openat2() syscall.
> > >
> > > Now all the development has moved to rust virtiofsd.
> > >
> > > https://gitlab.com/virtio-fs/virtiofsd
> > >
> > > C version of virtiofsd is just seeing small critical fixes.
> > >
> > > And rust version allows running unprivileged (inside a user namespace).
> > > German is also working on allowing running unprivileged without
> > > user namespaces but this will not allow arbitrary uid/gid switching.
> > >
> > > https://gitlab.com/virtio-fs/virtiofsd/-/merge_requests/136
> > >
> > > If one wants to run unprivileged and also do arbitrary uid/gid switching,
> > > then you need to use user namepsaces and map a range of subuid/subgid
> > > into the user namepsace virtiofsd is running in.
> > >
> > > If possible, please try to use rust virtiofsd for your situation. Its
> > > already packaged for fedora.
> > >
> > > Coming back to original idea of using openat2(), I think we should
> > > probably give it a try in rust virtiofsd and if it works, it should
> > > work across all the sandboxing modes.
> >
> > Thinking more about it, enabling openat2() usage conditionally based on
> > some option probably is not a bad idea. I was assuming that using
> > openat2() by default will not break any of the existing use cases. But
> > I am not sure. I have burnt my fingers so many times and had to back
> > out on default settings that enabling usage of openat2() conditionally
> > will probably be a safer choice. :-)
> >
> 
> I could work on this for the next major version and see if anything breaks.
> But I prefer to add this as a compilation feature, instead of a command line
> option that we will then have to maintain for a while.

What does compilation feature mean? One can compile it out? If it is
compiled in, is it enabled by default?

> 
> Also, I don't see it as a sandbox feature, as Stefan mentioned, a compromised
> process can call openat2() without RESOLVE_IN_ROOT. I did some test with
> Landlock to lock virtiofsd inside the shared directory, but IIRC it requires a
> kernel 5.13

landlock sounds interesting. May be use it by default if kernel offers it.

Question will be, security mechanisms we are using, how many of these
are mutually exclusive and how many can be used together.

A. pivot_root()
B. chroot()
C. openat2()
D. landlock
E. seccomp

Seccomp goes well with everything. 
landlock probably will go well as well.

pivot_root() and chroot() are currently mutually exlusive.

openat2() is probably redundant if pivot_root()/chroot()/landlock is
being used. But should work anyway.

Something to document as Stefan suggested.

Vivek


