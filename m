Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3626250FD54
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 14:42:00 +0200 (CEST)
Received: from localhost ([::1]:38414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKVz-0008Bo-0S
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 08:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1njKTQ-0005DB-R2
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 08:39:22 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:42668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1njKTO-0004lW-S4
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 08:39:20 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-P9FvDOwvPbeT5CgHhYycgg-1; Tue, 26 Apr 2022 08:39:15 -0400
X-MC-Unique: P9FvDOwvPbeT5CgHhYycgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDA0285A5BE;
 Tue, 26 Apr 2022 12:39:14 +0000 (UTC)
Received: from bahia (unknown [10.39.195.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17604C4C7A1;
 Tue, 26 Apr 2022 12:38:58 +0000 (UTC)
Date: Tue, 26 Apr 2022 14:38:57 +0200
From: Greg Kurz <groug@kaod.org>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Message-ID: <20220426143857.716b9f33@bahia>
In-Reply-To: <94dfcb65-6901-6a56-d527-581b9b088d2c@gmail.com>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <1750044.XWheshbc2e@silver>
 <eafd4bbf-dbff-323a-179f-8f29905701e1@gmail.com>
 <3849551.ofAv5PygDX@silver>
 <94dfcb65-6901-6a56-d527-581b9b088d2c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Michael Roitzsch <reactorcontrol@icloud.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Keno Fischer <keno@juliacomputing.com>,
 Will Cohen <wwcohen@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 12:57:37 +0900
Akihiko Odaki <akihiko.odaki@gmail.com> wrote:

> On 2022/04/25 3:45, Christian Schoenebeck wrote:
> >>>>> +    }
> >>>>> +    err = chmod(addr.sun_path, mode);
> >>>>
> >>>> I'm not sure if it is fine to have a time window between bind() and
> >>>> chmod(). Do you have some rationale?
> >>>
> >>> Good question. QEMU's 9p server is multi-threaded; all 9p requests come in
> >>> serialized and the 9p server controller portion (9p.c) is only running on
> >>> QEMU main thread, but the actual filesystem driver calls are then
> >>> dispatched to QEMU worker threads and therefore running concurrently at
> >>> this point:
> >>>
> >>> https://wiki.qemu.org/Documentation/9p#Threads_and_Coroutines
> >>>
> >>> Similar situation on Linux 9p client side: it handles access to a mounted
> >>> 9p filesystem concurrently, requests are then serialized by 9p driver on
> >>> Linux and sent over wire to 9p server (host).
> >>>
> >>> So yes, there might be implications by that short time windows. But could
> >>> that be exploited on macOS hosts in practice?
> >>>
> >>> The socket file would have mode srwxr-xr-x for a short moment.
> >>>
> >>> For security_model=mapped* this should not be a problem.
> >>>
> >>> For security_model=none|passhrough, in theory, maybe? But how likely is
> >>> that? If you are using a Linux client for instance, trying to brute-force
> >>> opening the socket file, the client would send several 9p commands
> >>> (Twalk, Tgetattr, Topen, probably more). The time window of the two
> >>> commands above should be much smaller than that and I would expect one of
> >>> the 9p commands to error out in between.
> >>>
> >>> What would be a viable approach to avoid this issue on macOS?
> >>
> >> It is unlikely that a naive brute-force approach will succeed to
> >> exploit. The more concerning scenario is that the attacker uses the
> >> knowledge of the underlying implementation of macOS to cause resource
> >> contention to widen the window. Whether an exploitation is viable
> >> depends on how much time you spend digging XNU.
> >>
> >> However, I'm also not sure if it really *has* a race condition. Looking
> >> at v9fs_co_mknod(), it sequentially calls s->ops->mknod() and
> >> s->ops->lstat(). It also results in an entity called "path name based
> >> fid" in the code, which inherently cannot identify a file when it is
> >> renamed or recreated.
> >>
> >> If there is some rationale it is safe, it may also be applied to the
> >> sequence of bind() and chmod(). Can anyone explain the sequence of
> >> s->ops->mknod() and s->ops->lstat() or path name based fid in general?
> > 
> > You are talking about 9p server's controller level: I don't see something that
> > would prevent a concurrent open() during this bind() ... chmod() time window
> > unfortunately.
> > 
> > Argument 'fidp' passed to function v9fs_co_mknod() reflects the directory in
> > which the new device file shall be created. So 'fidp' is not the device file
> > here, nor is 'fidp' modified during this function.
> > 
> > Function v9fs_co_mknod() is entered by 9p server on QEMU main thread. At the
> > beginning of the function it first acquires a read lock on a (per 9p export)
> > global coroutine mutex:
> > 
> >      v9fs_path_read_lock(s);
> > 
> > and holds this lock until returning from function v9fs_co_mknod(). But that's
> > just a read lock. Function v9fs_co_open() also just gains a read lock. So they
> > can happen concurrently.
> > 
> > Then v9fs_co_run_in_worker({...}) is called to dispatch and execute all the
> > code block (think of it as an Obj-C "block") inside this (macro actually) on a
> > QEMU worker thread. So an arbitrary background thread would then call the fs
> > driver functions:
> > 
> >      s->ops->mknod()
> >      v9fs_name_to_path()
> >      s->ops->lstat()
> > 
> > and then at the end of the code block the background thread would dispatch
> > back to QEMU main thread. So when we are reaching:
> > 
> >      v9fs_path_unlock(s);
> > 
> > we are already back on QEMU main thread, hence unlocking on main thread now
> > and finally leaving function v9fs_co_mknod().
> > 
> > The important thing to understand is, while that
> > 
> >      v9fs_co_run_in_worker({...})
> > 
> > code block is executed on a QEMU worker thread, the QEMU main thread (9p
> > server controller portion, i.e. 9p.c) is *not* sleeping, QEMU main thread
> > rather continues to process other (if any) client requests in the meantime. In
> > other words v9fs_co_run_in_worker() neither behaves exactly like Apple's GCD
> > dispatch_async(), nor like dispatch_sync(), as GCD is not coroutine based.
> > 
> > So 9p server might pull a pending 'Topen' client request from the input FIFO
> > in the meantime and likewise dispatch that to a worker thread, etc. Hence a
> > concurrent open() might in theory be possible, but I find it quite unlikely to
> > succeed in practice as the open() call on guest is translated by Linux client
> > into a bunch of synchronous 9p requests on the path passed with the open()
> > call on guest, and a round trip for each 9p message is like what, ~0.3ms or
> > something in this order. That's quite huge compared to the time window I would
> > expect between bind() ... open().
> > 
> > Does this answer your questions?
> 
> The time window may be widened by a malicious actor if the actor knows 
> XNU well so the window length inferred from experiences is not really 
> enough to claim it safe, particularly when considering about security.
> 
> On the other hand, I'm wondering if there is same kind of a time window 
> between s->ops->mknodat() and s->ops->lstat(). Also, there should be 
> similar time windows among operations with "path name based fid" as they 
> also use path names as identifiers. If there is a rationale that it is 
> considered secure, we may be able to apply the same logic to the time 
> window between bind() and chmod() and claim it secure.
> I need a review from someone who understands that part of the code, 
> therefore.
> 

I think Christian's explanation is clear enough. We don't guarantee
that v9fs_co_foo() calls run atomically. As a consequence, the client
might see transient states or be able to interact with an ongoing
request. And to answer your question, we have no specific rationale
on security with that.

I'm not sure what the concerns are but unless you come up with a
valid scenario [*] I don't see any reason to prevent this patch
to go forward.

[*] things like:
    - client escaping the shared directory
    - QEMU crashing
    - QEMU hogging host resources
    - client-side unprivileged user gaining elevated privleges
      in the guest

Cheers,

--
Greg

> Regards,
> Akihiko Odaki


