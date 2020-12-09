Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9B12D4477
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:37:22 +0100 (CET)
Received: from localhost ([::1]:47360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0am-0002ao-UL
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kn0Ku-0002aC-Kj
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:20:56 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:44786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kn0Kn-0000pU-Si
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:20:55 -0500
Received: by mail-io1-xd42.google.com with SMTP id z5so1770463iob.11
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xZlFFRSSgGUms4vekMfzEj2xvKdY51o2ZdZCfDqU4bc=;
 b=CqapVN9LbQHklD7TE/6Rl9hhUBs+HGFkwh/xeI0XklP17UXa9TeBJWRw0esTw/gkBm
 X5+Dpjp4lGuK7v1/LG63x9kz8RPrskd8MQtjl+USlb9LrLOGd9azA2FRJBMgjKxWLtvf
 UJRY/ixM42TuW7fDyOv27AowFaJ605ZLe+1nNDuzMjjAOxY7oIGPNGGKrgrArYIS/V/2
 Clo72GssKf54jKhqJF9dWXND9meI7ESu7/iAnQy0L+PbrdICJGPG4FO1bjLLYqhWzBjX
 1byuLrsnrbPBnGSb75ZFsXgckYkltCN0gFilqYSBpDuHCj5P5f8DPJ6FrcEe6UZ5CvC1
 y4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZlFFRSSgGUms4vekMfzEj2xvKdY51o2ZdZCfDqU4bc=;
 b=rFPBiIHPt9cUnYBmXhOQ5WKUZLFes320VzMQvVFmOVQlpX69fV2/hAnlD3iegCBMkT
 I+9IF2cxKpzmEaUMIYjM1TCqNuqZ0kdHBsBmk+ka2MvIdJYz6Gn/R5FwpmXC9FYEcWwW
 kOek0ScnOdlwmbpbASB9+GIlRK1LcEJw+qaQzVWecXEx+gbc0J4nz4MpVmCP2oHsp3Jr
 y8+b4QFQt5QM8vuKM5r5j+2kAufwRrH+wsPycy9CFg3ymsJTj8uubHWqmiOHI9fAWg7+
 k6zWPRyOVLDBBCsHOEnCcysnbNZnozA8OPfv1Mzz2G8za1PGtlLe2eZNGS2CLk1y+A6+
 mjLQ==
X-Gm-Message-State: AOAM531YDdW0G3G9msL1cn7kM7jlxHuVoNjMkRG5PlYxnjXltpt+XwLe
 tQ0M50HVxxyInzL10gLk8dK2bjifUSIFhuzCgdw=
X-Google-Smtp-Source: ABdhPJwfjb/ueWL6pvp5VSkQ8JVoyeeNYMZPmnucqkq3Xb+spDtDnBIzStKCBmc5olqGS0Kn4rEgZdMuLlD4rcBJIC8=
X-Received: by 2002:a6b:5d07:: with SMTP id r7mr3227169iob.84.1607523647202;
 Wed, 09 Dec 2020 06:20:47 -0800 (PST)
MIME-Version: 1.0
References: <6b704294ad2e405781c38fb38d68c744@h3c.com>
In-Reply-To: <6b704294ad2e405781c38fb38d68c744@h3c.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 9 Dec 2020 15:20:35 +0100
Message-ID: <CAM9Jb+jhfBqFurCQj_XpoP0cEOU9oiZcO9xrWm3GA3NAxcCdEg@mail.gmail.com>
Subject: Re: [PATCH v3] migration: Don't allow migration if vm is in
 POSTMIGRATE
To: Tuguoyi <tu.guoyi@h3c.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd42.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Li Zhang <li.zhang@cloud.ionos.com>,
 "vsementsov@virtuozzo.com" <vsementsov@virtuozzo.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
Similar issue is reported by Li Zhang(+CC) with almost same patch[3]
to fix this.

Reported-by: Li Zhang <li.zhang@cloud.ionos.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

[3] https://marc.info/?l=qemu-devel&m=160749859831357&w=2
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

