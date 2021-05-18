Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCBE38807D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:25:09 +0200 (CEST)
Received: from localhost ([::1]:34204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5Kx-0005Zt-8F
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lj5Jr-000408-At
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:23:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lj5Jo-0001ja-Na
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:23:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621365831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C7nAvQPrswXUvhTuGIFwaMvG+ChXCKk9b6BTECFbi+g=;
 b=AiYk6KPsXarJcDFK2NXsU3pqbHwcOc3dA1aQdGznldQLTvXDzqUN79Q9HF7UAvU12tnz7E
 tDW3+AXHJXzLDZG3V6zHo9yqpt3HHki72fj+v6ozoX5k8lwn29CG7SFdVd5YY9RRTx3HOX
 2bIjRLM2j66hwymjIJv2hQDLWm3hHKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-XP41Yne4PvG1oqQIf4ducA-1; Tue, 18 May 2021 15:23:49 -0400
X-MC-Unique: XP41Yne4PvG1oqQIf4ducA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C679E10082E4;
 Tue, 18 May 2021 19:23:47 +0000 (UTC)
Received: from work-vm (ovpn-115-45.ams2.redhat.com [10.36.115.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55E095D9C0;
 Tue, 18 May 2021 19:23:28 +0000 (UTC)
Date: Tue, 18 May 2021 20:23:25 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 00/22] Live Update
Message-ID: <YKQULUn5F+x1wrYI@work-vm>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
 <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com>
 <YKOPnkefxgRZ8PoQ@work-vm>
 <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com>
MIME-Version: 1.0
In-Reply-To: <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Steven Sistare (steven.sistare@oracle.com) wrote:
> On 5/18/2021 5:57 AM, Dr. David Alan Gilbert wrote:
> > * Steven Sistare (steven.sistare@oracle.com) wrote:
> >> On 5/14/2021 7:53 AM, Stefan Hajnoczi wrote:
> >>> On Thu, May 13, 2021 at 04:21:15PM -0400, Steven Sistare wrote:
> >>>> On 5/12/2021 12:42 PM, Stefan Hajnoczi wrote:
> >>>>> On Fri, May 07, 2021 at 05:24:58AM -0700, Steve Sistare wrote:
> >>>>>> Provide the cprsave and cprload commands for live update.  These save and
> >>>>>> restore VM state, with minimal guest pause time, so that qemu may be updated
> >>>>>> to a new version in between.
> >>>>>>
> >>>>>> cprsave stops the VM and saves vmstate to an ordinary file.  It supports two
> >>>>>> modes: restart and reboot.  For restart, cprsave exec's the qemu binary (or
> >>>>>> /usr/bin/qemu-exec if it exists) with the same argv.  qemu restarts in a
> >>>>>> paused state and waits for the cprload command.
> >>>>>
> >>>>> I think cprsave/cprload could be generalized by using QMP to stash the
> >>>>> file descriptors. The 'getfd' QMP command already exists and QEMU code
> >>>>> already opens fds passed using this mechanism.
> >>>>>
> >>>>> I haven't checked but it may be possible to drop some patches by reusing
> >>>>> QEMU's monitor file descriptor passing since the code already knows how
> >>>>> to open from 'getfd' fds.
> >>>>>
> >>>>> The reason why using QMP is interesting is because it eliminates the
> >>>>> need for execve(2). QEMU may be unable to execute a program due to
> >>>>> chroot, seccomp, etc.
> >>>>>
> >>>>> QMP would enable cprsave/cprload to work both with and without
> >>>>> execve(2).
> >>>>>
> >>>>> One tricky thing with this approach might be startup ordering: how to
> >>>>> get fds via the QMP monitor in the new process before processing the
> >>>>> entire command-line.
> >>>>
> >>>> Early on I experimented with a similar approach.  Old qemu passed descriptors to an
> >>>> escrow process and exited; new qemu started and retrieved the descriptors from escrow.
> >>>> vfio mostly worked after I hacked the kernel to suppress the original-pid owner check.
> >>>> I suspect my recent vfio extensions would smooth the rough edges.
> >>>
> >>> I wonder about the reason for VFIO's pid limitation, maybe because it
> >>> pins pages from the original process?
> >>
> >> The dma unmap code verifies that the requesting task is the same as the task that mapped
> >> the pages.  We could add an ioctl that passes ownership to a new task.  We would also need
> >> to fix locked memory accounting, which is associated with the mm of the original task.
> > 
> >>> Is this VFIO pid limitation the main reason why you chose to make QEMU
> >>> execve(2) the new binary?
> >>
> >> That is one.  Plus, re-attaching to named shared memory for pc.ram causes the vfio conflict
> >> errors I mentioned in the previous email.  We would need to suppress redundant dma map calls,
> >> but allow legitimate dma maps and unmaps in response to the ongoing address space changes and
> >> diff callbacks caused by some drivers. It would be messy and fragile. In general, it felt like 
> >> I was working against vfio rather than with it.
> > 
> > OK the weirdness of vfio helps explain a bit about why you're doing it
> > this way; can you help separate some difference between restart and
> > reboot for me though:
> > 
> > In 'reboot' mode; where the guest must do suspend in it's drivers, how
> > much of these vfio requirements are needed?  I guess the memfd use
> > for the anonymous areas isn't any use for reboot mode.
> 
> Correct.  For reboot no special vfio support or fiddling is needed.
> 
> > You mention cprsave calls VFIO_DMA_UNMAP_FLAG_VADDR - after that does
> > vfio still care about the currently-anonymous areas?
> 
> Yes, for restart mode.  The physical pages behind the anonymous memory remain pinned and 
> are targets for ongoing DMA.  Post-exec qemu needs a way to find those same pages.

Is it possible with vfio to map it into multiple processes
simultaneously or does it have to only be one at a time?
Are you saying that you have no way to shut off DMA, and thus you can
never know it's safe to terminate the source process?

> >> Another big reason is a requirement to preserve anonymous memory for legacy qemu updates (via
> >> code injection which I briefly mentioned in KVM forum).  If we extend cpr to allow updates 
> >> without exec, I still need the exec option.
> > 
> > Can you explain what that code injection mechanism is for those of us
> > who didn't see that?
> 
> Sure.  Here is slide 12 from the talk.  It relies on mmap(MADV_DOEXEC) which was not
> accepted upstream.

In this series, without MADV_DOEXEC, how do you guarantee the same HVA
in source and destination - or is that not necessary?

> -----------------------------------------------------------------------------
> Legacy Live Update
> 
>  * Update legacy qemu process to latest version
>    - Inject code into legacy qemu process to perform cprsave: vmsave.so
>      . Access qemu data structures and globals
>        - eg ram_list, savevm_state, chardevs, vhost_devices
>        - dlopen does not resolve them, must get addresses via symbol lookup.
>      . Delete some vmstate handlers, register new ones (eg vfio)
>      . Call MADV_DOEXEC on guest memory. Find devices, preserve fd
>  * Hot patch a monitor function to dlopen vmsave.so, call entry point
>    - write patch to /proc/pid/mem
>    - Call the monitor function via monitor socket
>  * Send cprload to update qemu
>  * vmsave.so has binary dependency on qemu data structures and variables
>    - Build vmsave-ver.so per legacy version
>    - Indexed by qemu's gcc build-id
> 
> -----------------------------------------------------------------------------

That's hairy!
At that point isn't it easier to recompile a patched qemu against the
original sources and ptrace something in to mmap the new qemu?

Dave

> - Steve
>  
> >>>> However, the main issue is that guest ram must be backed by named shared memory, and
> >>>> we would need to add code to support shared memory for all the secondary memory objects.
> >>>> That makes it less interesting for us at this time; we care about updating legacy qemu 
> >>>> instances with anonymous guest memory.
> >>>
> >>> Thanks for explaining this more in the other sub-thread. The secondary
> >>> memory objects you mentioned are relatively small so I don't think
> >>> saving them in the traditional way is a problem.
> >>>
> >>> Two approaches for zero-copy memory migration fit into QEMU's existing
> >>> migration infrastructure:
> >>>
> >>> - Marking RAM blocks that are backed by named memory (tmpfs, hugetlbfs,
> >>>   etc) so they are not saved into the savevm file. The existing --object
> >>>   memory-backend-file syntax can be used.
> >>>
> >>> - Extending the live migration protocol to detect when file descriptor
> >>>   passing is available (i.e. UNIX domain socket migration) and using
> >>>   that for memory-backend-* objects that have fds.
> >>>
> >>> Either of these approaches would handle RAM with existing savevm/migrate
> >>> commands.
> >>
> >> Yes, but the vfio issues would still need to be solved, and we would need new
> >> command line options to back existing and future secondary memory objects with 
> >> named shared memory.
> >>
> >>> The remaining issue is how to migrate VFIO and other file descriptors
> >>> that cannot be reopened by the new process. As mentioned, QEMU already
> >>> has file descriptor passing support in the QMP monitor and support for
> >>> opening passed file descriptors (see qemu_open_internal(),
> >>> monitor_fd_param(), and socket_get_fd()).
> >>>
> >>> The advantage of integrating live update functionality into the existing
> >>> savevm/migrate commands is that it will work in more use cases with
> >>> less code duplication/maintenance/bitrot prevention than the
> >>> special-case cprsave command in this patch series.
> >>>
> >>> Maybe there is a fundamental technical reason why live update needs to
> >>> be different from QEMU's existing migration commands but I haven't
> >>> figured it out yet.
> >>
> >> vfio and anonymous memory.
> >>
> >> Regarding code duplication, I did consider whether to extend the migration
> >> syntax and implementation versus creating something new.  Those functions
> >> handle stuff like bdrv snapshot, aio, and migration which are n/a for the cpr
> >> use case, and the cpr functions handle state that is n/a for the migration case.
> >> I judged that handling both in the same functions would be less readable and
> >> maintainable.  After feedback during the V1 review, I simplified the cprsave
> >> code by by calling qemu_save_device_state, as Xen does, thus eliminating any
> >> interaction with the migration code.
> >>
> >> Regarding bit rot, I still need to add a cpr test to the test suite, when the 
> >> review is more complete and folks agree on the final form of the functionality.
> >>
> >> I do like the idea of supporting update without exec, but as a future project, 
> >> and not at the expense of dropping update with exec.
> >>
> >> - Steve
> >>
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


