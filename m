Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460346E8028
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 19:13:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppBM1-0006Sz-DG; Wed, 19 Apr 2023 13:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppBLy-0006SN-55
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:12:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppBLr-0005QS-3p
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681924332;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrzVtPxUEWHlUzxtqyGW7xWvwnL0zlMXYMEjg2ImQ6Q=;
 b=Rti29eVkn6+upwPE2CZTYxQ8UP67tbyANUSLEBr/7L+/sIxhn7qAimryJqqZYO4TJLDHEk
 7O/SCzVkFrOcO/tsJjlqB55Qkk1TTQ76NEDvWdggG6tNZ6GhMg11fd0kjDT7Gx3F/tpo7W
 QcLK5kkzs0BdiEUrpuoSzNwq39ldtoQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-TmG6rTXvMTWmNc3Z2kP95w-1; Wed, 19 Apr 2023 13:12:08 -0400
X-MC-Unique: TmG6rTXvMTWmNc3Z2kP95w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6843D85A5A3;
 Wed, 19 Apr 2023 17:12:08 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DB7B2166B33;
 Wed, 19 Apr 2023 17:12:07 +0000 (UTC)
Date: Wed, 19 Apr 2023 18:12:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com,
 dfaggioli@suse.com, dgilbert@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
Message-ID: <ZEAg5QJS44jzAV/v@redhat.com>
References: <20230330180336.2791-1-farosas@suse.de> <ZCYCE0llX9WANK18@x1n>
 <87edp5oukh.fsf@suse.de> <ZCbzmZXz3JG/jElA@x1n>
 <878rfdos4a.fsf@suse.de> <ZCcCV8PIsuvab1lO@x1n>
 <ZCcF6I0qb+1xlPhJ@redhat.com> <ZCcKBDM9sLomGOQE@x1n>
 <ZD7MRGQ+4QsDBtKR@redhat.com> <ZD7u9YHTor4edGWw@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZD7u9YHTor4edGWw@x1n>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 18, 2023 at 03:26:45PM -0400, Peter Xu wrote:
> On Tue, Apr 18, 2023 at 05:58:44PM +0100, Daniel P. Berrangé wrote:
> > Libvirt has multiple APIs where it currently uses its migrate-to-file
> > approach
> > 
> >   * virDomainManagedSave()
> > 
> >     This saves VM state to an libvirt managed file, stops the VM, and the
> >     file state is auto-restored on next request to start the VM, and the
> >     file deleted. The VM CPUs are stopped during both save + restore
> >     phase
> > 
> >   * virDomainSave/virDomainRestore
> > 
> >     The former saves VM state to a file specified by the mgmt app/user.
> >     A later call to virDomaniRestore starts the VM using that saved
> >     state. The mgmt app / user can delete the file state, or re-use
> >     it many times as they desire. The VM CPUs are stopped during both
> >     save + restore phase
> > 
> >   * virDomainSnapshotXXX
> > 
> >     This family of APIs takes snapshots of the VM disks, optionally
> >     also including the full VM state to a separate file. The snapshots
> >     can later be restored. The VM CPUs remain running during the
> >     save phase, but are stopped during restore phase
> 
> For this one IMHO it'll be good if Libvirt can consider leveraging the new
> background-snapshot capability (QEMU 6.0+, so not very new..).  Or is there
> perhaps any reason why a generic migrate:fd approach is better?

I'm not sure I fully understand the implications of 'background-snapshot' ?

Based on what the QAPI comment says, it sounds potentially interesting,
as conceptually it would be nicer to have the memory / state snapshot
represent the VM at the point where we started the snapshot operation,
rather than where we finished the snapshot operation.

It would not solve the performance problems that the work in this thread
was intended to address though.  With large VMs (100's of GB of RAM),
saving all the RAM state to disk takes a very long time, regardless of
whether the VM vCPUs are paused or running.

Currently when doing this libvirt has a "libvirt_iohelper" process
that we use so that we can do writes with O_DIRECT set. This avoids
thrashing the host OS's  I/O buffers/cache, and thus negatively
impacting performance of anything else on the host doing I/O. This
can't take advantage of multifd though, and even if extended todo
so, it still imposes extra data copies during the save/restore paths.


So to speed up the above 3 libvirt APIs, we want QEMU to be able to
directly save/restore mem/vmstate to files, with parallization and
O_DIRECT.


> > All these APIs end up calling the same code inside libvirt that uses
> > the libvirt-iohelper, together with QEMU migrate:fd driver.
> > 
> > IIUC, Suse's original motivation for the performance improvements was
> > wrt to the first case of virDomainManagedSave. From the POV of actually
> > supporting this in libvirt though, we need to cover all the scenarios
> > there. Thus we need this to work both when CPUs are running and stopped,
> > and if we didn't use migrate in this case, then we basically just end
> > up re-inventing migrate again which IMHO is undesirable both from
> > libvirt's POV and QEMU's POV.
> 
> Just to make sure we're on the same page - I always think it fine to use
> the QMP "migrate" command to do this.
> 
> Meanwhile, we can also reuse the migration framework if we think that's
> still the good way to go (even if I am not 100% sure on this... I still
> think _lots_ of the live migration framework as plenty of logics trying to
> take care of a "live" VM, IOW, those logics will become pure overheads if
> we reuse the live migration framework for vm suspend).
> 
> However could you help elaborate more on why it must support live mode for
> a virDomainManagedSave() request?  As I assume this is the core of the goal.

No, we've no need for live mode for virDomainManagedSave. Live mode is
needed for virDomainSnapshot* APIs.

The point I'm making is that all three of the above libvirt APIs run exactly
the same migration code in libvirt. The only difference in the APIs is how
the operation gets striggered and whether the CPUs are running or not.

We wwant the improved performance of having parallel save/restore-to-disk
and use of O_DIRECT to be available to all 3 APIs. To me it doesn't make
sense to provide different impls for these APIs when they all have the
same end goal - it would be extra work on QEMU side and libvirt side alike
to use different solutions for each. 

> IMHO virDomainManagedSave() is a good interface design, because it contains
> the target goal of what it wants to do (according to above).  To ask in
> another way, I'm curious whether virDomainManagedSave() will stop the VM
> before triggering the QMP "migrate" to fd: If it doesn't, why not?  If it
> does, then why we can't have that assumption also for QEMU?
> 
> That assumption is IMHO important for QEMU because non-live VM migration
> can avoid tons of overhead that a live migration will need.  I've mentioned
> this in the other reply, even if we keep using the migration framework, we
> can still optimize other things like dirty tracking.  We probably don't
> even need any bitmap at all because we simply scan over all ramblocks.
> 
> OTOH, if QEMU supports live mode for a "vm suspend" in the initial design,
> not only it doesn't sound right at all from interface level, it means QEMU
> will need to keep doing so forever because we need to be compatible with
> the old interfaces even on new binaries.  That's why I keep suggesting we
> should take "VM turned off" part of the cmd if that's what we're looking
> for.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


