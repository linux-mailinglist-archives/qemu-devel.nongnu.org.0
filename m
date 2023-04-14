Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4FB6E243C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 15:27:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnJSS-0006dT-2r; Fri, 14 Apr 2023 09:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pnJSD-0006cl-Qu
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 09:27:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pnJS9-0004A0-0T
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 09:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681478816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7AvHjU+q2Uk0ioJG0vnHcKB/qjo54+JLXOK7ohCmUc0=;
 b=YJ6n7vLanhvqAXuz0wt4/xt6e0/NTWOqHHPqwizmRUb7IpbvHX5a0Gpb8xA6CI4lAtJ29I
 VZoeR11xITjFZQTVj9lNVxytK6aCEZiJq5ZsAy+GVqIob4wu06vsFpqTo8107MClHI89fy
 ScPNaIev9nX5QmDyCOHtqp9g76e3K7U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-mRwVX_WbO6qqgzs9AWYCjA-1; Fri, 14 Apr 2023 09:26:54 -0400
X-MC-Unique: mRwVX_WbO6qqgzs9AWYCjA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70DE71C08984;
 Fri, 14 Apr 2023 13:26:54 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 618362027043;
 Fri, 14 Apr 2023 13:26:53 +0000 (UTC)
Date: Fri, 14 Apr 2023 08:26:51 -0500
From: Eric Blake <eblake@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, qemu-block@nongnu.org, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [RFC PATCH] migration: Handle block device inactivation failures
 better
Message-ID: <a4lrlsqj7azyowc4wctqlcdyl63ym6zeot7krndtzqwkwd5tmk@yx5vlmjobvff>
References: <20230411183654.1229293-1-eblake@redhat.com>
 <87zg7aek26.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zg7aek26.fsf@secure.mitica>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Apr 14, 2023 at 02:15:45PM +0200, Juan Quintela wrote:
> Eric Blake <eblake@redhat.com> wrote:
> > Consider what happens when performing a migration between two host
> > machines connected to an NFS server serving multiple block devices to
> > the guest, when the NFS server becomes unavailable.  The migration
> > attempts to inactivate all block devices on the source (a necessary
> > step before the destination can take over); but if the NFS server is
> > non-responsive, the attempt to inactivate can itself fail.  When that
> > happens, the destination fails to get the migrated guest (good,
> > because the source wasn't able to flush everything properly):
> >
> >   (qemu) qemu-kvm: load of migration failed: Input/output error
> >
> > at which point, our only hope for the guest is for the source to take
> > back control.  With the current code base, the host outputs a message, but then appears to resume:
> >
> >   (qemu) qemu-kvm: qemu_savevm_state_complete_precopy_non_iterable: bdrv_inactivate_all() failed (-1)
> >
> >   (src qemu)info status
> >    VM status: running
> >
> > but a second migration attempt now asserts:
> >
> >   (src qemu) qemu-kvm: ../block.c:6738: int bdrv_inactivate_recurse(BlockDriverState *): Assertion `!(bs->open_flags & BDRV_O_INACTIVE)' failed.
> >
> > Whether the guest is recoverable on the source after the first failure
> > is debatable, but what we do not want is to have qemu itself fail due
> > to an assertion.  It looks like the problem is as follows:
> >
> > In migration.c:migration_completion(), the source sets 'inactivate' to
> > true (since COLO is not enabled), then tries
> > savevm.c:qemu_savevm_state_complete_precopy() with a request to
> > inactivate block devices.  In turn, this calls
> > block.c:bdrv_inactivate_all(), which fails when flushing runs up
> > against the non-responsive NFS server.  With savevm failing, we are
> > now left in a state where some, but not all, of the block devices have
> > been inactivated; the 'fail_invalidate' label of
> > migration_completion() then wants to reclaim those disks by calling
> > bdrv_activate_all() - but this too can fail, yet nothing takes note of
> > that failure.
> >
> > Thus, we have reached a state where the migration engine has forgotten
> > all state about whether a block device is inactive, because we did not
> > set s->block_inactive; so migration allows the source to reach
> > vm_start() and resume execution, violating the block layer invariant
> > that the guest CPUs should not be restarted while a device is
> > inactive.  Note that the code in migration.c:migrate_fd_cancel() will
> > also try to reactivate all block devices if s->block_inactive was set,
> > but because we failed to set that flag after the first failure, the
> > source assumes it has reclaimed all devices, even though it still has
> > remaining inactivated devices and does not try again.  Normally,
> > qmp_cont() will also try to reactivate all disks (or correctly fail if
> > the disks are not reclaimable because NFS is not yet back up), but the
> > auto-resumption of the source after a migration failure does not go
> > through qmp_cont().  And because we have left the block layer in an
> > inconsistent state with devices still inactivated, the later migration
> > attempt is hitting the assertion failure.
> >
> > Since it is important to not resume the source with inactive disks,
> > this patch tries harder at tracking whether migration attempted to
> > inactivate any devices, in order to prevent any vm_start() until it
> > has successfully reactivated all devices.
> >
> > See also https://bugzilla.redhat.com/show_bug.cgi?id=2058982
> >
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> Wow
> 
> Such a big comment for such a small patch.
> And then people think that there is not "nuance" anymore :-)

It took me a while to figure out the control paths - it is not obvious
that not all migration paths attempt to deactivate images, and
therefore not all paths need to try to reactivate them.  Yes, this
commit message is proof that our code base is complex!

> > @@ -3518,6 +3519,7 @@ fail_invalidate:
> >          bdrv_activate_all(&local_err);
> >          if (local_err) {
> >              error_report_err(local_err);
> > +            s->block_inactive = inactivate;
> 
> Why not just put here:
> 
> s->block_inactive = true;
> 
> And call it a day?

Interesting idea.  Note that it is possible to reach the
fail_invalidate label WITHOUT having first tried to invalidate disk
images (for example, if s->state != MIGRATION_STATUS_ACTIVE on entry,
but qemu_file_get_error() fails) - but then again, in the
fail_invalidate label, we only attempt to reactivate if s->state is
MIGRATION_STATUS_ACTIVE or MIGRATION_STATUS_DEVICE (the latter
possible right before we attempt to inactivate devices above).

> 
> if bdrv_activate_all() fails, we can't continue anyways.

Good point.  And I think it points out yet another problem: if
qemu_savevm_state_complete_precopy() fails, we 'goto fail' instead of
'goto fail_invalidate', but without potentially marking
s->block_inactive.

> 
> Or I am missing something?

I'll post a v2 along those lines.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


