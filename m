Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6942D148596
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 14:04:31 +0100 (CET)
Received: from localhost ([::1]:42062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuydS-0007Nf-Ep
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 08:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58118)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iuyc0-0006sG-1E
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 08:03:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iuybu-0001ZI-Es
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 08:02:59 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36549
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iuybu-0001Vw-AE
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 08:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579870971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=28oYsWnjVO1HsVjLkmuTXWQEQ3yNsQC7rUp6R51O0uk=;
 b=XcB4hEPaAMcyb0/+AThT1u9S7tP6oj6/naJLrFyN1k+tbZibjmUikLLyf2fMy1fB19zP84
 qMz8A9dyPRXnGCR4O7QbfIq3PUHCIqTXIK+OGuiFD3+sOzSkgWfZHbK4TwuB2Deg2dNWMz
 Rdl29anKbXpfrvqOMimrbfcC9d8jfuw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-zAKmoDxOM5KYwWxhIuIrpA-1; Fri, 24 Jan 2020 08:02:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A23D108F9D8
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 13:02:48 +0000 (UTC)
Received: from work-vm (ovpn-117-253.ams2.redhat.com [10.36.117.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B238B857A0;
 Fri, 24 Jan 2020 13:02:46 +0000 (UTC)
Date: Fri, 24 Jan 2020 13:02:44 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 08/21] migration: Make multifd_load_setup() get an
 Error parameter
Message-ID: <20200124130244.GR2970@work-vm>
References: <20200123115831.36842-1-quintela@redhat.com>
 <20200123115831.36842-9-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200123115831.36842-9-quintela@redhat.com>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: zAKmoDxOM5KYwWxhIuIrpA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> We need to change the full chain to pass the Error parameter.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>=20
> ---
>=20
> Always use a local_err, and in case of error propagate/print it as needed=
.
> ---
>  migration/migration.c | 35 +++++++++++++++++++++++++++++------
>  migration/migration.h |  2 +-
>  migration/ram.c       |  2 +-
>  migration/ram.h       |  2 +-
>  migration/rdma.c      |  2 +-
>  5 files changed, 33 insertions(+), 10 deletions(-)
>=20
> diff --git a/migration/migration.c b/migration/migration.c
> index 7140d1e040..ef17b9f3f2 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -518,13 +518,23 @@ fail:
>      exit(EXIT_FAILURE);
>  }
> =20
> -static void migration_incoming_setup(QEMUFile *f)
> +/**
> + * @migration_incoming_setup: Setup incoming migration
> + *
> + * Returns 0 for no error or 1 for error
> + *
> + * @f: file for main migration channel
> + * @errp: where to put errors
> + */
> +static int migration_incoming_setup(QEMUFile *f, Error **errp)
>  {
>      MigrationIncomingState *mis =3D migration_incoming_get_current();
> +    Error *local_err =3D NULL;
> =20
> -    if (multifd_load_setup() !=3D 0) {
> +    if (multifd_load_setup(&local_err) !=3D 0) {
>          /* We haven't been able to create multifd threads
>             nothing better to do */
> +        error_report_err(local_err);
>          exit(EXIT_FAILURE);
>      }
> =20
> @@ -532,6 +542,7 @@ static void migration_incoming_setup(QEMUFile *f)
>          mis->from_src_file =3D f;
>      }
>      qemu_file_set_blocking(f, false);
> +    return 0;
>  }
> =20
>  void migration_incoming_process(void)
> @@ -572,19 +583,27 @@ static bool postcopy_try_recover(QEMUFile *f)
>      return false;
>  }
> =20
> -void migration_fd_process_incoming(QEMUFile *f)
> +void migration_fd_process_incoming(QEMUFile *f, Error **errp)
>  {
> +    Error *local_err =3D NULL;
> +
>      if (postcopy_try_recover(f)) {
>          return;
>      }
> =20
> -    migration_incoming_setup(f);
> +    if (migration_incoming_setup(f, &local_err)) {
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +        }
> +        return;
> +    }
>      migration_incoming_process();
>  }
> =20
>  void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>  {
>      MigrationIncomingState *mis =3D migration_incoming_get_current();
> +    Error *local_err =3D NULL;
>      bool start_migration;
> =20
>      if (!mis->from_src_file) {
> @@ -596,7 +615,12 @@ void migration_ioc_process_incoming(QIOChannel *ioc,=
 Error **errp)
>              return;
>          }
> =20
> -        migration_incoming_setup(f);
> +        if (migration_incoming_setup(f, &local_err)) {
> +            if (local_err) {
> +                error_propagate(errp, local_err);
> +            }
> +            return;
> +        }
> =20
>          /*
>           * Common migration only needs one channel, so we can start
> @@ -604,7 +628,6 @@ void migration_ioc_process_incoming(QIOChannel *ioc, =
Error **errp)
>           */
>          start_migration =3D !migrate_use_multifd();
>      } else {
> -        Error *local_err =3D NULL;
>          /* Multiple connections */
>          assert(migrate_use_multifd());
>          start_migration =3D multifd_recv_new_channel(ioc, &local_err);
> diff --git a/migration/migration.h b/migration/migration.h
> index 44b1d56929..8473ddfc88 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -265,7 +265,7 @@ struct MigrationState
> =20
>  void migrate_set_state(int *state, int old_state, int new_state);
> =20
> -void migration_fd_process_incoming(QEMUFile *f);
> +void migration_fd_process_incoming(QEMUFile *f, Error **errp);
>  void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp);
>  void migration_incoming_process(void);
> =20
> diff --git a/migration/ram.c b/migration/ram.c
> index d537264ba5..125c6d0f60 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1463,7 +1463,7 @@ static void *multifd_recv_thread(void *opaque)
>      return NULL;
>  }
> =20
> -int multifd_load_setup(void)
> +int multifd_load_setup(Error **errp)
>  {
>      int thread_count;
>      uint32_t page_count =3D MULTIFD_PACKET_SIZE / qemu_target_page_size(=
);
> diff --git a/migration/ram.h b/migration/ram.h
> index da22a417ea..42be471d52 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -43,7 +43,7 @@ uint64_t ram_bytes_total(void);
> =20
>  int multifd_save_setup(Error **errp);
>  void multifd_save_cleanup(void);
> -int multifd_load_setup(void);
> +int multifd_load_setup(Error **errp);
>  int multifd_load_cleanup(Error **errp);
>  bool multifd_recv_all_channels_created(void);
>  bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
> diff --git a/migration/rdma.c b/migration/rdma.c
> index e241dcb992..2379b8345b 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -4004,7 +4004,7 @@ static void rdma_accept_incoming_migration(void *op=
aque)
>      }
> =20
>      rdma->migration_started_on_destination =3D 1;
> -    migration_fd_process_incoming(f);
> +    migration_fd_process_incoming(f, errp);
>  }
> =20
>  void rdma_start_incoming_migration(const char *host_port, Error **errp)
> --=20
> 2.24.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


