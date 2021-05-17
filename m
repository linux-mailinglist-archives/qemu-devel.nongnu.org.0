Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC4A383D8F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:37:15 +0200 (CEST)
Received: from localhost ([::1]:36458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lij3C-0007Vk-Nv
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1liid2-0006cJ-8W
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:10:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1liicy-0002pA-VA
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621278606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DKSdrDEZ7E4yA5c3MhboS6bRZzYRxVtavJeFNn3AEsY=;
 b=WE/zbikQ2CS5YfJVCz4BOJOUbxNPRqZzuX5YMHHCF9K3p4ptJfSbunL1DRGyZwusvMUPGG
 YAwSLWO4IBfEY/9VjAxiHNIQ8kxRI7fzmU3ixpJ6Qbr6iHYZqq3/rMT9VBgf553N0K4Yvr
 zAnEJ+bURn7UHHjidjkrGSllX5vIM1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-vUNKBTHiNcmcppgxyIWkUA-1; Mon, 17 May 2021 15:10:04 -0400
X-MC-Unique: vUNKBTHiNcmcppgxyIWkUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA60D1009446;
 Mon, 17 May 2021 19:10:02 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2437D36D5;
 Mon, 17 May 2021 19:10:02 +0000 (UTC)
Date: Mon, 17 May 2021 13:10:01 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH V3 00/22] Live Update
Message-ID: <20210517131001.792593f0.alex.williamson@redhat.com>
In-Reply-To: <YKJWO6sGIFuzpdkZ@stefanha-x1.localdomain>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
 <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com>
 <YKJWO6sGIFuzpdkZ@stefanha-x1.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
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
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Steven Sistare <steven.sistare@oracle.com>,
 vfio-users@redhat.com,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 May 2021 12:40:43 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Fri, May 14, 2021 at 11:15:18AM -0400, Steven Sistare wrote:
> > On 5/14/2021 7:53 AM, Stefan Hajnoczi wrote:  
> > > On Thu, May 13, 2021 at 04:21:15PM -0400, Steven Sistare wrote:  
> > >> On 5/12/2021 12:42 PM, Stefan Hajnoczi wrote:  
> > >>> On Fri, May 07, 2021 at 05:24:58AM -0700, Steve Sistare wrote:  
> > >>>> Provide the cprsave and cprload commands for live update.  These save and
> > >>>> restore VM state, with minimal guest pause time, so that qemu may be updated
> > >>>> to a new version in between.
> > >>>>
> > >>>> cprsave stops the VM and saves vmstate to an ordinary file.  It supports two
> > >>>> modes: restart and reboot.  For restart, cprsave exec's the qemu binary (or
> > >>>> /usr/bin/qemu-exec if it exists) with the same argv.  qemu restarts in a
> > >>>> paused state and waits for the cprload command.  
> > >>>
> > >>> I think cprsave/cprload could be generalized by using QMP to stash the
> > >>> file descriptors. The 'getfd' QMP command already exists and QEMU code
> > >>> already opens fds passed using this mechanism.
> > >>>
> > >>> I haven't checked but it may be possible to drop some patches by reusing
> > >>> QEMU's monitor file descriptor passing since the code already knows how
> > >>> to open from 'getfd' fds.
> > >>>
> > >>> The reason why using QMP is interesting is because it eliminates the
> > >>> need for execve(2). QEMU may be unable to execute a program due to
> > >>> chroot, seccomp, etc.
> > >>>
> > >>> QMP would enable cprsave/cprload to work both with and without
> > >>> execve(2).
> > >>>
> > >>> One tricky thing with this approach might be startup ordering: how to
> > >>> get fds via the QMP monitor in the new process before processing the
> > >>> entire command-line.  
> > >>
> > >> Early on I experimented with a similar approach.  Old qemu passed descriptors to an
> > >> escrow process and exited; new qemu started and retrieved the descriptors from escrow.
> > >> vfio mostly worked after I hacked the kernel to suppress the original-pid owner check.
> > >> I suspect my recent vfio extensions would smooth the rough edges.  
> > > 
> > > I wonder about the reason for VFIO's pid limitation, maybe because it
> > > pins pages from the original process?  
> > 
> > The dma unmap code verifies that the requesting task is the same as the task that mapped
> > the pages.  We could add an ioctl that passes ownership to a new task.  We would also need
> > to fix locked memory accounting, which is associated with the mm of the original task.
> >   
> > > Is this VFIO pid limitation the main reason why you chose to make QEMU
> > > execve(2) the new binary?  
> > 
> > That is one.  Plus, re-attaching to named shared memory for pc.ram causes the vfio conflict
> > errors I mentioned in the previous email.  We would need to suppress redundant dma map calls,
> > but allow legitimate dma maps and unmaps in response to the ongoing address space changes and
> > diff callbacks caused by some drivers. It would be messy and fragile. In general, it felt like 
> > I was working against vfio rather than with it.
> > 
> > Another big reason is a requirement to preserve anonymous memory for legacy qemu updates (via
> > code injection which I briefly mentioned in KVM forum).  If we extend cpr to allow updates 
> > without exec, I still need the exec option.
> >   
> > >> However, the main issue is that guest ram must be backed by named shared memory, and
> > >> we would need to add code to support shared memory for all the secondary memory objects.
> > >> That makes it less interesting for us at this time; we care about updating legacy qemu 
> > >> instances with anonymous guest memory.  
> > > 
> > > Thanks for explaining this more in the other sub-thread. The secondary
> > > memory objects you mentioned are relatively small so I don't think
> > > saving them in the traditional way is a problem.
> > > 
> > > Two approaches for zero-copy memory migration fit into QEMU's existing
> > > migration infrastructure:
> > > 
> > > - Marking RAM blocks that are backed by named memory (tmpfs, hugetlbfs,
> > >   etc) so they are not saved into the savevm file. The existing --object
> > >   memory-backend-file syntax can be used.
> > > 
> > > - Extending the live migration protocol to detect when file descriptor
> > >   passing is available (i.e. UNIX domain socket migration) and using
> > >   that for memory-backend-* objects that have fds.
> > > 
> > > Either of these approaches would handle RAM with existing savevm/migrate
> > > commands.  
> > 
> > Yes, but the vfio issues would still need to be solved, and we would need new
> > command line options to back existing and future secondary memory objects with 
> > named shared memory.
> >   
> > > The remaining issue is how to migrate VFIO and other file descriptors
> > > that cannot be reopened by the new process. As mentioned, QEMU already
> > > has file descriptor passing support in the QMP monitor and support for
> > > opening passed file descriptors (see qemu_open_internal(),
> > > monitor_fd_param(), and socket_get_fd()).
> > > 
> > > The advantage of integrating live update functionality into the existing
> > > savevm/migrate commands is that it will work in more use cases with
> > > less code duplication/maintenance/bitrot prevention than the
> > > special-case cprsave command in this patch series.
> > > 
> > > Maybe there is a fundamental technical reason why live update needs to
> > > be different from QEMU's existing migration commands but I haven't
> > > figured it out yet.  
> > 
> > vfio and anonymous memory.
> > 
> > Regarding code duplication, I did consider whether to extend the migration
> > syntax and implementation versus creating something new.  Those functions
> > handle stuff like bdrv snapshot, aio, and migration which are n/a for the cpr
> > use case, and the cpr functions handle state that is n/a for the migration case.
> > I judged that handling both in the same functions would be less readable and
> > maintainable.  After feedback during the V1 review, I simplified the cprsave
> > code by by calling qemu_save_device_state, as Xen does, thus eliminating any
> > interaction with the migration code.
> > 
> > Regarding bit rot, I still need to add a cpr test to the test suite, when the 
> > review is more complete and folks agree on the final form of the functionality.
> > 
> > I do like the idea of supporting update without exec, but as a future project, 
> > and not at the expense of dropping update with exec.  
> 
> Alex: We're discussing how to live update QEMU while VFIO devices are
> running. This patch series introduces monitor commands that call
> execve(2) to run the new QEMU binary and inherit the memory/vfio/etc
> file descriptors. This way live update is transparent to VFIO but it
> won't work if a sandboxed QEMU process is forbidden to call execve(2).
> What are your thoughts on 1) the execve(2) approach and 2) extending
> VFIO to allow running devices to be attached to a different process so
> that execve(2) is not necessary?

Tracking processes is largely to support page pinning; we need to be
able to support both asynchronous page pinning to handle requests from
mdev drivers and we need to make sure pinned page accounting is
tracked to the same process.  If userspace can "pay" for locked pages
from one process on mappping, then "credit" them to another process on
unmap, that seems fairly exploitable.  We'd need some way to transfer
the locked memory accounting or handle it outside of vfio.  Thanks,

Alex


