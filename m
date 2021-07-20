Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6F33D0425
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 23:57:28 +0200 (CEST)
Received: from localhost ([::1]:55916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xjz-0005N9-Bu
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 17:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m5xiF-0003WL-1W
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:55:39 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:43868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m5xiD-0003TG-Bp
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:55:38 -0400
Received: by mail-io1-xd34.google.com with SMTP id k16so137229ios.10
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 14:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p8eVHzJW2Big6B4By7WCJlMwwJ2MFQCNL8hgDXtdWjs=;
 b=hhKK7jRK9g/7HYhWYEknkWP6rJX+WvtQZHFIqIwi0y1UGVcLld0LSvyVAan9A73gqW
 FFsrgZlOo9MDiunBi8MAT3FvzYOZeBPPvtIPQUwijLgwsQs69hx6gE6qpQQqjM0bX6+S
 Kh+BOX9S8StiByyq4+5BuB222VGCGO7hI95unJv34tDqnVgtD/fTOLAh2jP6wYDSbD9s
 y37W4OaH028kIbB5/zZukjPIJme733rPMHSEnQcHd5jw+Wx2CzTmutAQijbjqKUAO67C
 CEhS8axHLc5OVDzSv9u69OYOhqkyeXhATKyLEucnvaADukSYWtt9d9XWeaJ0WBJmkLXu
 7k0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p8eVHzJW2Big6B4By7WCJlMwwJ2MFQCNL8hgDXtdWjs=;
 b=i1BBBhlaFy7oHoXtC5Fc0TN/pc6hwvpikZbM7XPbA9eunYEn/M8KLER3gMYXOHGsZM
 rVWTrYZiDuLD/bIj3q96jJuyaw4uLgFVyGMB7hZbA2yICD3pKFR02n7nvHaIY09XVdQC
 d4znkNWZ54cLvarr8KfHsg456xiriBFqmdjMQYYlcFCL4mUS8xm15FEqQEWpF9eW5x3n
 qzJUV9xy55VGVK6695sGtIP5EwAOdcBjy9Jwf9Lw6ASlZ5gmwLi7dPCWflyhOJxf29SN
 y7TcsjTEql6VcE5Guanq/KCVTv8s7+toyFcw5fq/OXo1l6yOA7fitPyYkT/DoRw7KrBT
 b8EQ==
X-Gm-Message-State: AOAM5313VBFA8Vp7pC3aEVRl8IPIDPPALAz2kcB56fOmbY2hZ0rsaO9N
 kSqOCRCnQjdbOlmjO3cA7ek87w0TxdEGPVeZ/xQ=
X-Google-Smtp-Source: ABdhPJzUfLxEuYRqXOLYRCHMj5+KOUhFS/3RA+Gf+qmr7y9PxopeAw+io18D+0p8JYJ+iTLkgKkXoFp6aw+ixd9t81Q=
X-Received: by 2002:a02:4b04:: with SMTP id q4mr18707641jaa.89.1626818135641; 
 Tue, 20 Jul 2021 14:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-11-armbru@redhat.com>
In-Reply-To: <20210720125408.387910-11-armbru@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Tue, 20 Jul 2021 23:55:24 +0200
Message-ID: <CAM9Jb+j5338NW07QzovrgVyF1DUnFsR=+MB0PGcbbgzzC+ak2g@mail.gmail.com>
Subject: Re: [PATCH 10/16] migration: Handle migration_incoming_setup() errors
 consistently
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Commit b673eab4e2 "multifd: Make multifd_load_setup() get an Error
> parameter" changed migration_incoming_setup() to take an Error **
> argument, and adjusted the callers accordingly.  It neglected to
> change adjust multifd_load_setup(): it still exit()s on error.  Clean
> that up.
>
> The error now gets propagated up two call chains: via
> migration_fd_process_incoming() to rdma_accept_incoming_migration(),
> and via migration_ioc_process_incoming() to
> migration_channel_process_incoming().  Both chain ends report the
> error with error_report_err(), but otherwise ignore it.  Behavioral
> change: we no longer exit() on this error.
>
> This is consistent with how we handle other errors here, e.g. from
> multifd_recv_new_channel() via migration_ioc_process_incoming() to
> migration_channel_process_incoming().  Wether it's consistently right
> or consistently wrong I can't tell.
>
> Also clean up the return value from the unusual 0 on success, 1 on
> error to the more common true on success, false on error.
>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  migration/migration.c | 27 +++++++++------------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 231dc24414..c1c0a48647 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -609,30 +609,25 @@ fail:
>  }
>
>  /**
> - * @migration_incoming_setup: Setup incoming migration
> - *
> - * Returns 0 for no error or 1 for error
> - *
> + * migration_incoming_setup: Setup incoming migration
>   * @f: file for main migration channel
>   * @errp: where to put errors
> + *
> + * Returns: %true on success, %false on error.
>   */
> -static int migration_incoming_setup(QEMUFile *f, Error **errp)
> +static bool migration_incoming_setup(QEMUFile *f, Error **errp)
>  {
>      MigrationIncomingState *mis = migration_incoming_get_current();
> -    Error *local_err = NULL;
>
> -    if (multifd_load_setup(&local_err) != 0) {
> -        /* We haven't been able to create multifd threads
> -           nothing better to do */
> -        error_report_err(local_err);
> -        exit(EXIT_FAILURE);
> +    if (multifd_load_setup(errp) != 0) {
> +        return false;
>      }
>
>      if (!mis->from_src_file) {
>          mis->from_src_file = f;
>      }
>      qemu_file_set_blocking(f, false);
> -    return 0;
> +    return true;
>  }
>
>  void migration_incoming_process(void)
> @@ -675,14 +670,11 @@ static bool postcopy_try_recover(QEMUFile *f)
>
>  void migration_fd_process_incoming(QEMUFile *f, Error **errp)
>  {
> -    Error *local_err = NULL;
> -
>      if (postcopy_try_recover(f)) {
>          return;
>      }
>
> -    if (migration_incoming_setup(f, &local_err)) {
> -        error_propagate(errp, local_err);
> +    if (!migration_incoming_setup(f, errp)) {
>          return;
>      }
>      migration_incoming_process();
> @@ -703,8 +695,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>              return;
>          }
>
> -        if (migration_incoming_setup(f, &local_err)) {
> -            error_propagate(errp, local_err);
> +        if (!migration_incoming_setup(f, errp)) {
>              return;
>          }
>

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

