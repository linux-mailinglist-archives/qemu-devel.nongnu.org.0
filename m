Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7476E2306
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 14:20:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnIO0-0005vL-AM; Fri, 14 Apr 2023 08:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pnIMZ-0004va-Kz
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 08:17:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pnIMQ-0004CO-By
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 08:17:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681474621;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=PbmcGD/Ai6XGwAGfqSP2V5QIYn2HQatVZT4Zk5EPdDc=;
 b=Rs1BJGpBH/SAYJobv5TF+AuT3HLXSXH1euyvHEUoHkc91a9z7KRfBlmTzVUO8M9mOn7yZy
 phdutkkY2AQitjYTG9CMhd/ryiUtB2eCHn074i9luAZC5AZtGQUVPOzju2389o+RHb1PSo
 Ssg/Q1GcMoShHrfAEUJMr3SvnTssXfc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-HU5ShfKoMP2PtTiE_8W8mQ-1; Fri, 14 Apr 2023 08:15:48 -0400
X-MC-Unique: HU5ShfKoMP2PtTiE_8W8mQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d21-20020adfa415000000b002f68de99106so876470wra.19
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 05:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681474547; x=1684066547;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PbmcGD/Ai6XGwAGfqSP2V5QIYn2HQatVZT4Zk5EPdDc=;
 b=i4XgoDf7dRcmutS0NCSiVtDoNGwq+gYTOnlWpNt6t63bMZTUd0LIkMdqYdgH7XeJzX
 kvdpDCMEzfGgjzKHYtYs0sg5etD/vPR0UaYUim3DnHkRvMFkTrnIFi4ilTORZ80ZKa61
 Uee2dBh3b0ITkeWOmu9VONNim8HNELjCdT8NXG8TFBeCglezuE7k5FMiAVakyQ7P00Mv
 HcFXkb2MFjfBiShbo0cse2OewxiBuJ3vRaaRpOpdKf80uGz6YKAjnMiFeYs0+LTbpk6z
 ooqPHvcbF7OeIGCOE31hyVooXGd1L/syLEuf+9sn7TiqYqkiv3CpSMlG6MMGdORKSoJ6
 Kvvw==
X-Gm-Message-State: AAQBX9f7elb73ZEfrgsCT+mSJIPCpGWF5mtdG+HNDiWkG0errZCnwQvX
 MFzYmEs1o0hWWgAh6WQbzWow84Xpxw4u8ktFI5soL9OH1EPnlrmM9wROmDxjFFSN6leiDxhSuEb
 +ra0qWZWLhHzYoq8=
X-Received: by 2002:a05:600c:22d0:b0:3ee:2552:7512 with SMTP id
 16-20020a05600c22d000b003ee25527512mr4615476wmg.13.1681474547632; 
 Fri, 14 Apr 2023 05:15:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350YO8+SH0tzligdLTlknfkf5uBCzfv6hSo8x/R8qEyTI4D4ey/I5s7PL+bIX6ZeTq2fa8+Wrkw==
X-Received: by 2002:a05:600c:22d0:b0:3ee:2552:7512 with SMTP id
 16-20020a05600c22d000b003ee25527512mr4615461wmg.13.1681474547288; 
 Fri, 14 Apr 2023 05:15:47 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 c4-20020a05600c0ac400b003edff838723sm4212574wmr.3.2023.04.14.05.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 05:15:46 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  kwolf@redhat.com,  qemu-block@nongnu.org,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [RFC PATCH] migration: Handle block device inactivation
 failures better
In-Reply-To: <20230411183654.1229293-1-eblake@redhat.com> (Eric Blake's
 message of "Tue, 11 Apr 2023 13:36:54 -0500")
References: <20230411183654.1229293-1-eblake@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 14 Apr 2023 14:15:45 +0200
Message-ID: <87zg7aek26.fsf@secure.mitica>
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
> been inactivated; the 'fail_invalidate' label of
> migration_completion() then wants to reclaim those disks by calling
> bdrv_activate_all() - but this too can fail, yet nothing takes note of
> that failure.
>
> Thus, we have reached a state where the migration engine has forgotten
> all state about whether a block device is inactive, because we did not
> set s->block_inactive; so migration allows the source to reach
> vm_start() and resume execution, violating the block layer invariant
> that the guest CPUs should not be restarted while a device is
> inactive.  Note that the code in migration.c:migrate_fd_cancel() will
> also try to reactivate all block devices if s->block_inactive was set,
> but because we failed to set that flag after the first failure, the
> source assumes it has reclaimed all devices, even though it still has
> remaining inactivated devices and does not try again.  Normally,
> qmp_cont() will also try to reactivate all disks (or correctly fail if
> the disks are not reclaimable because NFS is not yet back up), but the
> auto-resumption of the source after a migration failure does not go
> through qmp_cont().  And because we have left the block layer in an
> inconsistent state with devices still inactivated, the later migration
> attempt is hitting the assertion failure.
>
> Since it is important to not resume the source with inactive disks,
> this patch tries harder at tracking whether migration attempted to
> inactivate any devices, in order to prevent any vm_start() until it
> has successfully reactivated all devices.
>
> See also https://bugzilla.redhat.com/show_bug.cgi?id=2058982
>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Wow

Such a big comment for such a small patch.
And then people think that there is not "nuance" anymore :-)
> @@ -3518,6 +3519,7 @@ fail_invalidate:
>          bdrv_activate_all(&local_err);
>          if (local_err) {
>              error_report_err(local_err);
> +            s->block_inactive = inactivate;

Why not just put here:

s->block_inactive = true;

And call it a day?

if bdrv_activate_all() fails, we can't continue anyways.

Or I am missing something?

Later, Juan.

>          } else {
>              s->block_inactive = false;
>          }
>
> base-commit: f1426881a827a6d3f31b65616c4a8db1e9e7c45e


