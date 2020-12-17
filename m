Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A852DD835
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 19:24:24 +0100 (CET)
Received: from localhost ([::1]:37380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpxwt-0004i9-Au
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 13:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpxve-0004Cz-OL
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:23:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpxvZ-0007fO-6w
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:23:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608229379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xDu83V6Mp8vvtIRh7zS78DJSQXWtfjLu5wa46lLlIrU=;
 b=VwiNlehXlVbFmc+x4vMYKCaOO8nxFByUZoduWPiElQT361s/nwLeU5DGQIyFhq9ojN1iLQ
 yUcSSIa0l4WI28BY4kj2L6VMf4SmbG/P5n3kDi6FxS1okxRqF6Lqb1qA4UrcqFLBMlN1En
 gHq2CASeqtD/xlfQuDIU5Yj56uDyI5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-cPrSYLL-OZOok-YUMRelow-1; Thu, 17 Dec 2020 13:22:54 -0500
X-MC-Unique: cPrSYLL-OZOok-YUMRelow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 651051005504;
 Thu, 17 Dec 2020 18:22:53 +0000 (UTC)
Received: from work-vm (ovpn-112-208.ams2.redhat.com [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC63519CBA;
 Thu, 17 Dec 2020 18:22:51 +0000 (UTC)
Date: Thu, 17 Dec 2020 18:22:49 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tuguoyi <tu.guoyi@h3c.com>
Subject: Re: [PATCH v3] migration: Don't allow migration if vm is in
 POSTMIGRATE
Message-ID: <20201217182249.GO4117@work-vm>
References: <6b704294ad2e405781c38fb38d68c744@h3c.com>
MIME-Version: 1.0
In-Reply-To: <6b704294ad2e405781c38fb38d68c744@h3c.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, "vsementsov@virtuozzo.com" <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Tuguoyi (tu.guoyi@h3c.com) wrote:
> The following steps will cause qemu assertion failure:
> - pause vm by executing 'virsh suspend'
> - create external snapshot of memory and disk using 'virsh snapshot-create-as'
> - doing the above operation again will cause qemu crash
> 
> The backtrace looks like:
> #0  0x00007fbf958c5c37 in raise () from /lib/x86_64-linux-gnu/libc.so.6
> #1  0x00007fbf958c9028 in abort () from /lib/x86_64-linux-gnu/libc.so.6
> #2  0x00007fbf958bebf6 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
> #3  0x00007fbf958beca2 in __assert_fail () from /lib/x86_64-linux-gnu/libc.so.6
> #4  0x000055ca8decd39d in bdrv_inactivate_recurse (bs=0x55ca90c80400) at /build/qemu-5.0/block.c:5724
> #5  0x000055ca8dece967 in bdrv_inactivate_all () at /build//qemu-5.0/block.c:5792
> #6  0x000055ca8de5539d in qemu_savevm_state_complete_precopy_non_iterable (inactivate_disks=true, in_postcopy=false, f=0x55ca907044b0)
>     at /build/qemu-5.0/migration/savevm.c:1401
> #7  qemu_savevm_state_complete_precopy (f=0x55ca907044b0, iterable_only=iterable_only@entry=false, inactivate_disks=inactivate_disks@entry=true)
>     at /build/qemu-5.0/migration/savevm.c:1453
> #8  0x000055ca8de4f581 in migration_completion (s=0x55ca8f64d9f0) at /build/qemu-5.0/migration/migration.c:2941
> #9  migration_iteration_run (s=0x55ca8f64d9f0) at /build/qemu-5.0/migration/migration.c:3295
> #10 migration_thread (opaque=opaque@entry=0x55ca8f64d9f0) at /build/qemu-5.0/migration/migration.c:3459
> #11 0x000055ca8dfc6716 in qemu_thread_start (args=<optimized out>) at /build/qemu-5.0/util/qemu-thread-posix.c:519
> #12 0x00007fbf95c5f184 in start_thread () from /lib/x86_64-linux-gnu/libpthread.so.0
> #13 0x00007fbf9598cbed in clone () from /lib/x86_64-linux-gnu/libc.so.6
> 
> When the first migration completes, bs->open_flags will set BDRV_O_INACTIVE
> flag by bdrv_inactivate_all(), and during the second migration the
> bdrv_inactivate_recurse assert that the bs->open_flags is already
> BDRV_O_INACTIVE enabled which cause crash.
> 
> As Vladimir suggested, this patch makes migrate_prepare check the state of vm and
> return error if it is in RUN_STATE_POSTMIGRATE state.
> 
> Signed-off-by: Tuguoyi <tu.guoyi@h3c.com>

Yes, we've had this problem for a long long time; there are a bunch of
other similar conditions; the real answer is to figure out some command
for explicitly handing back control of the block devices (without
actually restarting the CPUs).

However, this is a reasonable patch to cover the common case.

Queued

> ---
>  migration/migration.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 87a9b59..5e33962 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2115,6 +2115,12 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
>          return false;
>      }
>  
> +    if (runstate_check(RUN_STATE_POSTMIGRATE)) {
> +        error_setg(errp, "Can't migrate the vm that was paused due to "
> +                   "previous migration");
> +        return false;
> +    }
> +
>      if (migration_is_blocked(errp)) {
>          return false;
>      }
> -- 
> 2.7.4
> 
> [Patch v2]: https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg01318.html
> [Patch v1]: https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05950.html
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


