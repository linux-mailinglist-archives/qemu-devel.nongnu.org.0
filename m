Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F056E9081
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:42:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRjL-00060k-Sa; Thu, 20 Apr 2023 06:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppRjJ-000607-3B
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppRjG-0008TY-MS
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681987289;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=DqcdAjacGA9NO83iJk5KFOGsxhnp/5IfwJmUcO8MPuw=;
 b=duj030jPigFVXFu4fofy8UWuYwDnkVWmEqfzZ7lWMKWCml/4WHUGZaiZuPmgk/ExKcNKDA
 l8BkdHvabn+oZxKYh2WEVayibmp1vubh26O3ltOR7MHTiAPJ2r9a3vfAlEXFUIEF1TLY7O
 o3gW9+wle3WKM7kRhy441DTe21lTyM8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-7aLj8xtfMkuuc3wXFb01vg-1; Thu, 20 Apr 2023 06:41:28 -0400
X-MC-Unique: 7aLj8xtfMkuuc3wXFb01vg-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay37-20020a05600c1e2500b003f16b58cf01so535474wmb.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681987287; x=1684579287;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DqcdAjacGA9NO83iJk5KFOGsxhnp/5IfwJmUcO8MPuw=;
 b=E0/ZLoCiI8i9ensPw+VY2kZHOK2mE0i3DXM1279OHwFSIy7VV8B1nZsckCnUUb2lt7
 U7e975OU2qR/GP8tbB7Cck7JXiQohdmUenJBipF0C6le4mhN/Byrw1UOYwfq18w+QEpn
 m3YGOEPOw4Vt5pyNHG+812/Sp94Y4fyozQ3S1tGc9cysesI/bRWGHJWZEIoratTOJmXe
 25hG36XsUX7sauIxNLuRMMmbeWq7g2/fVfVPf9NyF3sm5wUjPHqNTDyOQuBhkzBAsawh
 OT9SWgLCYb/wmlwuulbuazUq7SrnzwxxcsetjKKUTf/rYB5JNbBRgMlMPKKI6mhh/2XL
 aj1Q==
X-Gm-Message-State: AAQBX9fPyo+zn636Nof5KMxZ7guzEp5V7MzMcgKBqI7fvAND9Dz71n87
 /dpB7KVMwd5fn50zLc46F3Ghmelgumk7KkL2En0ms8cSMVMI3h+6da60kuWykA8OnC6DSPlHDju
 +KUcyJmZtsl8X/fM=
X-Received: by 2002:a05:600c:230d:b0:3f1:70a2:ceb5 with SMTP id
 13-20020a05600c230d00b003f170a2ceb5mr935126wmo.13.1681987286840; 
 Thu, 20 Apr 2023 03:41:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350bdfWQ2TxQfHSMe/cA/EPJtD7Fpt5EHOr9HQebsDpr8ODmGePS9/cirgl2VHoVRWGoDYVltVw==
X-Received: by 2002:a05:600c:230d:b0:3f1:70a2:ceb5 with SMTP id
 13-20020a05600c230d00b003f170a2ceb5mr935113wmo.13.1681987286492; 
 Thu, 20 Apr 2023 03:41:26 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 k24-20020a7bc318000000b003f16fc33fbesm1651669wmj.17.2023.04.20.03.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:41:25 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] migration: Handle block device inactivation failures
 better
In-Reply-To: <20230414153358.1452040-1-eblake@redhat.com> (Eric Blake's
 message of "Fri, 14 Apr 2023 10:33:58 -0500")
References: <20230414153358.1452040-1-eblake@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 12:41:25 +0200
Message-ID: <878remzvhm.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Eric Blake <eblake@redhat.com> wrote:
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
>
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
>
> See also https://bugzilla.redhat.com/show_bug.cgi?id=2058982
>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.

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
>          }
>          qemu_mutex_unlock_iothread();

And I still have to look at the file to understand this "simple" patch.
(simple in size, not in what it means).

I will add this to my queue, but if you are in the "mood", I would like
to remove the declaration of inactivate and change this to something like:

             if (ret >= 0) {
                 /* Colo don't stop disks in normal operation */
                 s->block_inactive = !migrate_colo_enabled();
                 qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
                 ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
                                                          s->block_inactive);
             }

Or something around that lines?

> @@ -3522,6 +3520,7 @@ fail_invalidate:
>          bdrv_activate_all(&local_err);
>          if (local_err) {
>              error_report_err(local_err);
> +            s->block_inactive = true;
>          } else {
>              s->block_inactive = false;
>          }
> base-commit: 7dbd6f8a27e30fe14adb3d5869097cddf24038d6

Just wondering, what git magic creates this line?

Thanks, Juan.


