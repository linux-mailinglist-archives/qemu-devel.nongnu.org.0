Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F686F4075
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:55:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmiD-00044a-Vo; Tue, 02 May 2023 05:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ptmiC-00044R-9I
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:54:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ptmiA-0007vX-8n
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:54:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683021256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S9991V2fSTC6mvaIvGWYH08xCQm4sIfOOa4zo5BfmUM=;
 b=KrjdgPDq7dPMhy3tcX4ndXXuEb75t3yUzEplG/9grZ5v03OC8KYG5EhTvmJU1T2IK5o+wF
 WakLoPuRbyE74HBaPPpNgqKCES6T+O3TQkmDjQ0P/bWnVRWDy+2SUhN3vnARenXw/88X9q
 j1rWYopxavSyVIdFZTmlZqhotu82GXk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-6WrmCXu8P0eqi4TcRoCgXA-1; Tue, 02 May 2023 05:54:15 -0400
X-MC-Unique: 6WrmCXu8P0eqi4TcRoCgXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A21F2A5957E;
 Tue,  2 May 2023 09:54:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59C9FC15BAD;
 Tue,  2 May 2023 09:54:13 +0000 (UTC)
Date: Tue, 2 May 2023 11:54:12 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, groug@kaod.org
Subject: Re: [PATCH v2] migration: Handle block device inactivation failures
 better
Message-ID: <ZFDdxEZhnKqHu/pI@redhat.com>
References: <20230414153358.1452040-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414153358.1452040-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Hi Eric,

you asked me for a review downstream, but since you would have to bring
back any problem to upstream anyway, let's discuss it here. For the
start, let me state that (a) I don't fully understand why this patch
fixes things and (b) I hate this function. More below.

Am 14.04.2023 um 17:33 hat Eric Blake geschrieben:
> Consider what happens when performing a migration between two host
> machines connected to an NFS server serving multiple block devices to
> the guest, when the NFS server becomes unavailable.  The migration
> attempts to inactivate all block devices on the source (a necessary
> step before the destination can take over); but if the NFS server is
> non-responsive, the attempt to inactivate can itself fail.  When that
> happens, the destination fails to get the migrated guest (good,
> because the source wasn't able to flush everything properly):
> 
>   (qemu) qemu-kvm: load of migration failed: Input/output error
> 
> at which point, our only hope for the guest is for the source to take
> back control.  With the current code base, the host outputs a message, but then appears to resume:
> 
>   (qemu) qemu-kvm: qemu_savevm_state_complete_precopy_non_iterable: bdrv_inactivate_all() failed (-1)
> 
>   (src qemu)info status
>    VM status: running
> 
> but a second migration attempt now asserts:
> 
>   (src qemu) qemu-kvm: ../block.c:6738: int bdrv_inactivate_recurse(BlockDriverState *): Assertion `!(bs->open_flags & BDRV_O_INACTIVE)' failed.
> 
> Whether the guest is recoverable on the source after the first failure
> is debatable, but what we do not want is to have qemu itself fail due
> to an assertion.  It looks like the problem is as follows:
> 
> In migration.c:migration_completion(), the source sets 'inactivate' to
> true (since COLO is not enabled), then tries
> savevm.c:qemu_savevm_state_complete_precopy() with a request to
> inactivate block devices.  In turn, this calls
> block.c:bdrv_inactivate_all(), which fails when flushing runs up
> against the non-responsive NFS server.  With savevm failing, we are
> now left in a state where some, but not all, of the block devices have
> been inactivated; but migration_completion() then jumps to 'fail'
> rather than 'fail_invalidate' and skips an attempt to reclaim those
> those disks by calling bdrv_activate_all().  Even if we do attempt to
> reclaim disks, we aren't taking note of failure there, either.

Why do we even jump to 'fail'? In other words, should 'fail_inactivate'
really be called 'fail' and everything should jump there?

Greg added the 'fail_inactivate' label in fe904ea8242, but the commit
message doesn't seem to tell why he left one goto. I see no reason why
we wouldn't want to reactivate in this case, too. Maybe it's just for
the colo case?

> Thus, we have reached a state where the migration engine has forgotten
> all state about whether a block device is inactive, because we did not
> set s->block_inactive in enough places; so migration allows the source
> to reach vm_start() and resume execution, violating the block layer
> invariant that the guest CPUs should not be restarted while a device
> is inactive.  Note that the code in migration.c:migrate_fd_cancel()
> will also try to reactivate all block devices if s->block_inactive was
> set, but because we failed to set that flag after the first failure,
> the source assumes it has reclaimed all devices, even though it still
> has remaining inactivated devices and does not try again.  Normally,
> qmp_cont() will also try to reactivate all disks (or correctly fail if
> the disks are not reclaimable because NFS is not yet back up), but the
> auto-resumption of the source after a migration failure does not go
> through qmp_cont().  And because we have left the block layer in an
> inconsistent state with devices still inactivated, the later migration
> attempt is hitting the assertion failure.
> 
> Since it is important to not resume the source with inactive disks,
> this patch marks s->block_inactive before attempting inactivation,
> rather than after succeeding, in order to prevent any vm_start() until
> it has successfully reactivated all devices.

Here's the part that I don't understand: Even if you set
s->block_inactive, where do we actually use this value and reactivate
the image?

The only reader of the field is migrate_fd_cancel(), which is only
called by migration_cancel() (a very small wrapper, it's a mystery why
this exists when it's the only caller). migration_cancel() in turn is
called in very few places:

* qmp_migrate_cancel: In our case, migration fails by itself, it's not
  cancelled from QMP. So this is not where we're coming from.

* ram_mig_ram_block_resized: This one is an internal error during
  migration, but what we're seeing is not related to RAM at all. So this
  isn't where we're coming from either.

* migration_shutdown: Only called while shutting down QEMU. Doesn't look
  like our case either.

So while this patch fixes some state inconsistencies, how is it fixing
anything for the reported bug when this state is never used in the
relevant places?

(That I don't understand the fix is what blocks my downstream review.
The rest of my points are really only for upstream anyway.)

> See also https://bugzilla.redhat.com/show_bug.cgi?id=2058982
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> ---
> 
> v2: Set s->block_inactive sooner [Juan]
> ---
>  migration/migration.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index bda47891933..cb0d42c0610 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3444,13 +3444,11 @@ static void migration_completion(MigrationState *s)
>                                              MIGRATION_STATUS_DEVICE);
>              }
>              if (ret >= 0) {
> +                s->block_inactive = inactivate;
>                  qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
>                  ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
>                                                           inactivate);
>              }
> -            if (inactivate && ret >= 0) {
> -                s->block_inactive = true;
> -            }

This part of the code has now really become unintuitive. After commit
f07fa4cbf0b we had perfectly intuitive code:

    ret = bdrv_inactivate_all();
    if (ret >= 0) {
        s->block_inactive = true;
    }

Since then, the bdrv_inactivate_all() call has been moved to
qemu_savevm_state_complete_precopy_non_iterable(), and now you changed
the order because even on failure, we could end up with some inactivated
nodes. I'm not arguing that either was a bad change, but the assignment
to s->block_inactive looks really random now.

I think this desperately needs a comment.

>          }
>          qemu_mutex_unlock_iothread();
> 
> @@ -3522,6 +3520,7 @@ fail_invalidate:
>          bdrv_activate_all(&local_err);
>          if (local_err) {
>              error_report_err(local_err);
> +            s->block_inactive = true;

bdrv_activate_all() never inactivates a node that was active before. So
it seems that this line only ever comes into play if s->block_inactive
was incorrect before.

I feel what we should do here is only try to activate if
s->block_inactive was set above, and then have a single 'fail' label
that always runs the re-activation code.

>          } else {
>              s->block_inactive = false;
>          }

Kevin


