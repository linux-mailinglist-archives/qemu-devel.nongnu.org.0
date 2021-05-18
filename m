Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18B93880E6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:03:29 +0200 (CEST)
Received: from localhost ([::1]:44134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5w8-0001NN-HI
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lj5v3-0000iS-Vh
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:02:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lj5v0-00086l-9O
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:02:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621368136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z8X5cXFQfX8ENLKb4kw5ir/EnlHV4aWGaZrPYh0HbW8=;
 b=ebhxLKNsdW2ybvP6sq+3Dg/I993MauvL3kGbnL7x7zYJXgQyaPPBUWQQ0SAfWNmTOj+apm
 yqhJ5isSYYRUTWUCvcgwsoyTorXgQTWkBD5tvDG6kTXOIYoNviLO+FkKEBlCwyerMM1FBf
 EO7ceCqTVnn/a3y53P0PBgiN23/CDco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-7iyixi6oP8-G6qdQdXAKdg-1; Tue, 18 May 2021 16:02:14 -0400
X-MC-Unique: 7iyixi6oP8-G6qdQdXAKdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B54068015F8;
 Tue, 18 May 2021 20:02:12 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8107DE171;
 Tue, 18 May 2021 20:01:56 +0000 (UTC)
Date: Tue, 18 May 2021 14:01:55 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH V3 00/22] Live Update
Message-ID: <20210518140155.0d302324.alex.williamson@redhat.com>
In-Reply-To: <YKQULUn5F+x1wrYI@work-vm>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
 <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com>
 <YKOPnkefxgRZ8PoQ@work-vm>
 <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com>
 <YKQULUn5F+x1wrYI@work-vm>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Steven Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 May 2021 20:23:25 +0100
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Steven Sistare (steven.sistare@oracle.com) wrote:
> > On 5/18/2021 5:57 AM, Dr. David Alan Gilbert wrote:  
> > > * Steven Sistare (steven.sistare@oracle.com) wrote:  
> > >> On 5/14/2021 7:53 AM, Stefan Hajnoczi wrote:  
> > >>> On Thu, May 13, 2021 at 04:21:15PM -0400, Steven Sistare wrote:  
> > >>>> On 5/12/2021 12:42 PM, Stefan Hajnoczi wrote:  
> > >>>>> On Fri, May 07, 2021 at 05:24:58AM -0700, Steve Sistare wrote:  
> > >>>>>> Provide the cprsave and cprload commands for live update.  These save and
> > >>>>>> restore VM state, with minimal guest pause time, so that qemu may be updated
> > >>>>>> to a new version in between.
> > >>>>>>
> > >>>>>> cprsave stops the VM and saves vmstate to an ordinary file.  It supports two
> > >>>>>> modes: restart and reboot.  For restart, cprsave exec's the qemu binary (or
> > >>>>>> /usr/bin/qemu-exec if it exists) with the same argv.  qemu restarts in a
> > >>>>>> paused state and waits for the cprload command.  
> > >>>>>
> > >>>>> I think cprsave/cprload could be generalized by using QMP to stash the
> > >>>>> file descriptors. The 'getfd' QMP command already exists and QEMU code
> > >>>>> already opens fds passed using this mechanism.
> > >>>>>
> > >>>>> I haven't checked but it may be possible to drop some patches by reusing
> > >>>>> QEMU's monitor file descriptor passing since the code already knows how
> > >>>>> to open from 'getfd' fds.
> > >>>>>
> > >>>>> The reason why using QMP is interesting is because it eliminates the
> > >>>>> need for execve(2). QEMU may be unable to execute a program due to
> > >>>>> chroot, seccomp, etc.
> > >>>>>
> > >>>>> QMP would enable cprsave/cprload to work both with and without
> > >>>>> execve(2).
> > >>>>>
> > >>>>> One tricky thing with this approach might be startup ordering: how to
> > >>>>> get fds via the QMP monitor in the new process before processing the
> > >>>>> entire command-line.  
> > >>>>
> > >>>> Early on I experimented with a similar approach.  Old qemu passed descriptors to an
> > >>>> escrow process and exited; new qemu started and retrieved the descriptors from escrow.
> > >>>> vfio mostly worked after I hacked the kernel to suppress the original-pid owner check.
> > >>>> I suspect my recent vfio extensions would smooth the rough edges.  
> > >>>
> > >>> I wonder about the reason for VFIO's pid limitation, maybe because it
> > >>> pins pages from the original process?  
> > >>
> > >> The dma unmap code verifies that the requesting task is the same as the task that mapped
> > >> the pages.  We could add an ioctl that passes ownership to a new task.  We would also need
> > >> to fix locked memory accounting, which is associated with the mm of the original task.  
> > >   
> > >>> Is this VFIO pid limitation the main reason why you chose to make QEMU
> > >>> execve(2) the new binary?  
> > >>
> > >> That is one.  Plus, re-attaching to named shared memory for pc.ram causes the vfio conflict
> > >> errors I mentioned in the previous email.  We would need to suppress redundant dma map calls,
> > >> but allow legitimate dma maps and unmaps in response to the ongoing address space changes and
> > >> diff callbacks caused by some drivers. It would be messy and fragile. In general, it felt like 
> > >> I was working against vfio rather than with it.  
> > > 
> > > OK the weirdness of vfio helps explain a bit about why you're doing it
> > > this way; can you help separate some difference between restart and
> > > reboot for me though:
> > > 
> > > In 'reboot' mode; where the guest must do suspend in it's drivers, how
> > > much of these vfio requirements are needed?  I guess the memfd use
> > > for the anonymous areas isn't any use for reboot mode.  
> > 
> > Correct.  For reboot no special vfio support or fiddling is needed.
> >   
> > > You mention cprsave calls VFIO_DMA_UNMAP_FLAG_VADDR - after that does
> > > vfio still care about the currently-anonymous areas?  
> > 
> > Yes, for restart mode.  The physical pages behind the anonymous memory remain pinned and 
> > are targets for ongoing DMA.  Post-exec qemu needs a way to find those same pages.  
> 
> Is it possible with vfio to map it into multiple processes
> simultaneously or does it have to only be one at a time?

The IOMMU maps an IOVA to a physical address, what Steve is saying is
that mapping persists across the restart.  A given IOVA can only map to
a specific physical address, so mapping into multiple processes doesn't
make any sense.  The two processes need to map the same IOVA to the
same HPA, only the HVA is allowed to change.

> Are you saying that you have no way to shut off DMA, and thus you can
> never know it's safe to terminate the source process?

Stopping DMA, ex. disabling PCI bus master, would be not only visible
to the behavior of the device, but likely detrimental.  You'd need
driver or device participation to some extent to make this seamless.

> > >> Another big reason is a requirement to preserve anonymous memory for legacy qemu updates (via
> > >> code injection which I briefly mentioned in KVM forum).  If we extend cpr to allow updates 
> > >> without exec, I still need the exec option.  
> > > 
> > > Can you explain what that code injection mechanism is for those of us
> > > who didn't see that?  
> > 
> > Sure.  Here is slide 12 from the talk.  It relies on mmap(MADV_DOEXEC) which was not
> > accepted upstream.  
> 
> In this series, without MADV_DOEXEC, how do you guarantee the same HVA
> in source and destination - or is that not necessary?

It's not necessary, the HVA is used to establish the IOVA to HPA
mapping for the IOMMU.  We have patches upstream that suspend (block)
that translation for the window when the HVA is invalid and resume when
it becomes valid.  It's expected that the new HVA is equivalent to the
old HVA and that the user can only hurt themselves should they violate
this, ie. they can still only map+pin memory they own, so at worst they
create a bad translation for their own device.  Thanks,

Alex


