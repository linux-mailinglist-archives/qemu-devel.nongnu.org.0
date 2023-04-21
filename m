Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4956EA532
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 09:48:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pplV8-0007T8-MP; Fri, 21 Apr 2023 03:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pplV6-0007Sv-9n
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:48:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pplV4-0001IK-CY
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682063289;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTCZKzJAZSe9fH7Kv+RTm8I6LZMjmvPB80hzyug6r0o=;
 b=VGGQtwcodjIvev31ohIDqUhCHQwIAraIMmV6W4Z58v5sHmDZIfAQgcJ6GnUYqUfIwsj7tl
 jyJbco+qfiX4QLHIEWOFoIhmknLPUCjREPRQfZsWe7o2lhFJBCsopmemHUjLo7Cf3Ion7j
 QQMTcswYbsWyBM4mTjCjAdlvv1ebzCo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-c-ieKPqNPICKPCrvYqPZMQ-1; Fri, 21 Apr 2023 03:48:06 -0400
X-MC-Unique: c-ieKPqNPICKPCrvYqPZMQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C19E53C0ED4E;
 Fri, 21 Apr 2023 07:48:05 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1C3E2026D25;
 Fri, 21 Apr 2023 07:48:04 +0000 (UTC)
Date: Fri, 21 Apr 2023 08:48:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com,
 dfaggioli@suse.com, dgilbert@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
Message-ID: <ZEI/sgTCwzsWv6l6@redhat.com>
References: <878rfdos4a.fsf@suse.de> <ZCcCV8PIsuvab1lO@x1n>
 <ZCcF6I0qb+1xlPhJ@redhat.com> <ZCcKBDM9sLomGOQE@x1n>
 <ZD7MRGQ+4QsDBtKR@redhat.com> <ZD7u9YHTor4edGWw@x1n>
 <ZEAg5QJS44jzAV/v@redhat.com> <ZEA759BSs75ldW6Y@x1n>
 <ZED/s1zB0NWnqs6P@redhat.com> <ZEGQS++pjDODjwks@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZEGQS++pjDODjwks@x1n>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Apr 20, 2023 at 03:19:39PM -0400, Peter Xu wrote:
> On Thu, Apr 20, 2023 at 10:02:43AM +0100, Daniel P. Berrangé wrote:
> > On Wed, Apr 19, 2023 at 03:07:19PM -0400, Peter Xu wrote:
> > > On Wed, Apr 19, 2023 at 06:12:05PM +0100, Daniel P. Berrangé wrote:
> > > > On Tue, Apr 18, 2023 at 03:26:45PM -0400, Peter Xu wrote:
> > > > > On Tue, Apr 18, 2023 at 05:58:44PM +0100, Daniel P. Berrangé wrote:
> > > > > > Libvirt has multiple APIs where it currently uses its migrate-to-file
> > > > > > approach
> > > > > > 
> > > > > >   * virDomainManagedSave()
> > > > > > 
> > > > > >     This saves VM state to an libvirt managed file, stops the VM, and the
> > > > > >     file state is auto-restored on next request to start the VM, and the
> > > > > >     file deleted. The VM CPUs are stopped during both save + restore
> > > > > >     phase
> > > > > > 
> > > > > >   * virDomainSave/virDomainRestore
> > > > > > 
> > > > > >     The former saves VM state to a file specified by the mgmt app/user.
> > > > > >     A later call to virDomaniRestore starts the VM using that saved
> > > > > >     state. The mgmt app / user can delete the file state, or re-use
> > > > > >     it many times as they desire. The VM CPUs are stopped during both
> > > > > >     save + restore phase
> > > > > > 
> > > > > >   * virDomainSnapshotXXX
> > > > > > 
> > > > > >     This family of APIs takes snapshots of the VM disks, optionally
> > > > > >     also including the full VM state to a separate file. The snapshots
> > > > > >     can later be restored. The VM CPUs remain running during the
> > > > > >     save phase, but are stopped during restore phase
> > > > > 
> > > > > For this one IMHO it'll be good if Libvirt can consider leveraging the new
> > > > > background-snapshot capability (QEMU 6.0+, so not very new..).  Or is there
> > > > > perhaps any reason why a generic migrate:fd approach is better?
> > > > 
> > > > I'm not sure I fully understand the implications of 'background-snapshot' ?
> > > > 
> > > > Based on what the QAPI comment says, it sounds potentially interesting,
> > > > as conceptually it would be nicer to have the memory / state snapshot
> > > > represent the VM at the point where we started the snapshot operation,
> > > > rather than where we finished the snapshot operation.
> > > > 
> > > > It would not solve the performance problems that the work in this thread
> > > > was intended to address though.  With large VMs (100's of GB of RAM),
> > > > saving all the RAM state to disk takes a very long time, regardless of
> > > > whether the VM vCPUs are paused or running.
> > > 
> > > I think it solves the performance problem by only copy each of the guest
> > > page once, even if the guest is running.
> > 
> > I think we're talking about different performance problems.
> > 
> > What you describe here is about ensuring the snapshot is of finite size
> > and completes in linear time, by ensuring each page is written only
> > once.
> > 
> > What I'm talking about is being able to parallelize the writing of all
> > RAM, so if a single thread can saturate the storage, using multiple
> > threads will make the overal process faster, even when we're only
> > writing each page once.
> 
> It depends on how much we want it.  Here the live snapshot scenaior could
> probably leverage a same multi-threading framework with a vm suspend case
> because it can assume all the pages are static and only saved once.
> 
> But I agree it's at least not there yet.. so we can directly leverage
> multifd at least for now.
> 
> > 
> > > Different from mostly all the rest of "migrate" use cases, background
> > > snapshot does not use the generic dirty tracking at all (for KVM that's
> > > get-dirty-log), instead it uses userfaultfd wr-protects, so that when
> > > taking the snapshot all the guest pages will be protected once.
> > 
> > Oh, so that means this 'background-snapshot' feature only works on
> > Linux, and only when permissions allow it. The migration parameter
> > probably should be marked with 'CONFIG_LINUX' in the QAPI schema
> > to make it clear this is a non-portable feature.
> 
> Indeed, I can have a follow up patch for this.  But it'll be the same as
> some other features, like, postcopy (and all its sub-features including
> postcopy-blocktime and postcopy-preempt)?
> 
> > 
> > > It guarantees the best efficiency of creating a snapshot with VM running,
> > > afaict.  I sincerely think Libvirt should have someone investigating and
> > > see whether virDomainSnapshotXXX() can be implemented by this cap rather
> > > than the default migration.
> > 
> > Since the background-snapshot feature is not universally available,
> > it will only ever be possible to use it as an optional enhancement
> > with virDomainSnapshotXXX, we'll need the portable impl to be the
> > default / fallback.
> 
> I am actually curious on how a live snapshot can be implemented correctly
> if without something like background snapshot.  I raised this question in
> another reply here:
> 
> https://lore.kernel.org/all/ZDWBSuGDU9IMohEf@x1n/
> 
> I was using fixed-ram and vm suspend as example, but I assume it applies to
> any live snapshot that is based on current default migration scheme.
> 
> For a real live snapshot (not vm suspend), IIUC we have similar challenges.
> 
> The problem is when migration completes (snapshot taken) the VM is still
> running with a live disk image.  Then how can we take a snapshot exactly at
> the same time when we got the guest image mirrored in the vm dump?  What
> guarantees that there's no IO changes after VM image created but before we
> take a snapshot on the disk image?
> 
> In short, it's a question on how libvirt can make sure the VM image and
> disk snapshot image be taken at exactly the same time for live.

It is just a matter of where you have the synchronization point.

With background-snapshot, you have to snapshot the disks at the
start of the migrate operation. Without background-snapshot
yu have to snapshot the disks at the end of the migrate
operation. The CPUs are paused at the end of the migrate, so
when the CPUs pause, initiate the storage snapshot in the
background and then let the CPUs resume.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


