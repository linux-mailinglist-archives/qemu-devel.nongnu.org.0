Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C8B1483F6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 12:41:16 +0100 (CET)
Received: from localhost ([::1]:41008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuxKt-0001aa-DC
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 06:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35671)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iuxK4-00017s-7T
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 06:40:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iuxK3-000239-20
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 06:40:24 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46449
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iuxK2-00022Z-Tx
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 06:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579866022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QpLVKspOzRwHfKxFO67Q23qrC2+Dc6VV2Cjqa5+Ay0=;
 b=MvURaLbRli3GnwWJ5EHNeMVjZNw0953miZ9JZ2yGdW7fPvNSieTCJFdLelJ/v+EC2fWmZi
 TSduD+a1kamyIBfKJCIBMB4oaej5G3n2+MJv7/bMfgg6nECEOWTr/SpchVUXYJ1lq8v107
 pzu1Vwg4C8n3h+IrodK4yuWX7qnYT7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-eTMghDMrNFSmgjW4gG-tyw-1; Fri, 24 Jan 2020 06:40:20 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E892107ACC5
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 11:40:19 +0000 (UTC)
Received: from work-vm (ovpn-117-253.ams2.redhat.com [10.36.117.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C01D84DB8;
 Fri, 24 Jan 2020 11:40:17 +0000 (UTC)
Date: Fri, 24 Jan 2020 11:40:15 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 13/21] multifd: multifd_send_sync_main only needs the
 qemufile
Message-ID: <20200124114015.GK2970@work-vm>
References: <20200123115831.36842-1-quintela@redhat.com>
 <20200123115831.36842-14-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200123115831.36842-14-quintela@redhat.com>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: eTMghDMrNFSmgjW4gG-tyw-1
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
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/migration/ram.c b/migration/ram.c
> index d4c829bc77..2783dc60f4 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1082,7 +1082,7 @@ void multifd_save_cleanup(void)
>      multifd_send_state =3D NULL;
>  }
> =20
> -static void multifd_send_sync_main(RAMState *rs)
> +static void multifd_send_sync_main(QEMUFile *f)
>  {
>      int i;
> =20
> @@ -1090,7 +1090,7 @@ static void multifd_send_sync_main(RAMState *rs)
>          return;
>      }
>      if (multifd_send_state->pages->used) {
> -        if (multifd_send_pages(rs->f) < 0) {
> +        if (multifd_send_pages(f) < 0) {
>              error_report("%s: multifd_send_pages fail", __func__);
>              return;
>          }
> @@ -1111,7 +1111,7 @@ static void multifd_send_sync_main(RAMState *rs)
>          p->packet_num =3D multifd_send_state->packet_num++;
>          p->flags |=3D MULTIFD_FLAG_SYNC;
>          p->pending_job++;
> -        qemu_file_update_transfer(rs->f, p->packet_len);
> +        qemu_file_update_transfer(f, p->packet_len);
>          ram_counters.multifd_bytes +=3D p->packet_len;
>          ram_counters.transferred +=3D p->packet_len;
>          qemu_mutex_unlock(&p->mutex);
> @@ -3426,7 +3426,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque=
)
>      ram_control_before_iterate(f, RAM_CONTROL_SETUP);
>      ram_control_after_iterate(f, RAM_CONTROL_SETUP);
> =20
> -    multifd_send_sync_main(*rsp);
> +    multifd_send_sync_main(f);
>      qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>      qemu_fflush(f);
> =20
> @@ -3526,7 +3526,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaq=
ue)
>  out:
>      if (ret >=3D 0
>          && migration_is_setup_or_active(migrate_get_current()->state)) {
> -        multifd_send_sync_main(rs);
> +        multifd_send_sync_main(rs->f);
>          qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>          qemu_fflush(f);
>          ram_counters.transferred +=3D 8;
> @@ -3585,7 +3585,7 @@ static int ram_save_complete(QEMUFile *f, void *opa=
que)
>      }
> =20
>      if (ret >=3D 0) {
> -        multifd_send_sync_main(rs);
> +        multifd_send_sync_main(rs->f);
>          qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>          qemu_fflush(f);
>      }
> --=20
> 2.24.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


