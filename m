Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CB1F1F8C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 21:09:27 +0100 (CET)
Received: from localhost ([::1]:34736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSRcM-00057k-UK
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 15:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iSRba-0004gM-Jv
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 15:08:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iSRbZ-0006Pz-AU
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 15:08:38 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60308
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iSRbZ-0006Pk-6R
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 15:08:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573070916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ePQavxT9GPYAcwBeco3lr7cPERZaDZ6J5j5rmUZ0IuA=;
 b=H2eS0RZrPwwoi4KXW4yoe3/Iqynj+2KSE8fDJlaOvWjcHw50Fz7e0XOMxsEUH5+yYQsgC/
 G6fYY9JsxwrjnYNW7yj91Z080IbUbrnqyWI58kuBASF/xv6Xh9zhj2KIV6bDjU4p6/zk+x
 0QwbeFvPyVvIG/4TKktvGmMr6BcRLvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-p8iA-lzXPdGaE3kyi9kqRg-1; Wed, 06 Nov 2019 15:08:32 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA1AB107ACC3;
 Wed,  6 Nov 2019 20:08:31 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECF9E1001B36;
 Wed,  6 Nov 2019 20:08:30 +0000 (UTC)
Date: Wed, 6 Nov 2019 20:08:28 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 5/6] migration/postcopy: enable random order target page
 arrival
Message-ID: <20191106200828.GL2802@work-vm>
References: <20191018004850.9888-1-richardw.yang@linux.intel.com>
 <20191018004850.9888-6-richardw.yang@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20191018004850.9888-6-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: p8iA-lzXPdGaE3kyi9kqRg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> After using number of target page received to track one host page, we
> could have the capability to handle random order target page arrival in
> one host page.
>=20
> This is a preparation for enabling compress during postcopy.
>=20
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  migration/ram.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>=20
> diff --git a/migration/ram.c b/migration/ram.c
> index b5759793a9..da0596411c 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -4015,7 +4015,6 @@ static int ram_load_postcopy(QEMUFile *f)
>      MigrationIncomingState *mis =3D migration_incoming_get_current();
>      /* Temporary page that is later 'placed' */
>      void *postcopy_host_page =3D mis->postcopy_tmp_page;
> -    void *last_host =3D NULL;
>      bool all_zero =3D false;
>      int target_pages =3D 0;
> =20
> @@ -4062,24 +4061,15 @@ static int ram_load_postcopy(QEMUFile *f)
>               * that's moved into place later.
>               * The migration protocol uses,  possibly smaller, target-pa=
ges
>               * however the source ensures it always sends all the compon=
ents
> -             * of a host page in order.
> +             * of a host page in one chunk.
>               */
>              page_buffer =3D postcopy_host_page +
>                            ((uintptr_t)host & (block->page_size - 1));
>              /* If all TP are zero then we can optimise the place */
>              if (target_pages =3D=3D 1) {
>                  all_zero =3D true;
> -            } else {
> -                /* not the 1st TP within the HP */
> -                if (host !=3D (last_host + TARGET_PAGE_SIZE)) {
> -                    error_report("Non-sequential target page %p/%p",
> -                                  host, last_host);
> -                    ret =3D -EINVAL;
> -                    break;
> -                }

I think this is losing more protection than needed.
I think you can still protect against a page from a different host-page
arriving until we've placed the current host-page.
So something like:

    if (((uintptr_t)host & ~(block->page_size - 1)) !=3D
        last_host)

and then set last_host to the start of the host page.

Then you'll check if that flush is really working.

Dave

>              }
> =20
> -
>              /*
>               * If it's the last part of a host page then we place the ho=
st
>               * page
> @@ -4090,7 +4080,6 @@ static int ram_load_postcopy(QEMUFile *f)
>              }
>              place_source =3D postcopy_host_page;
>          }
> -        last_host =3D host;
> =20
>          switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
>          case RAM_SAVE_FLAG_ZERO:
> @@ -4143,7 +4132,8 @@ static int ram_load_postcopy(QEMUFile *f)
> =20
>          if (!ret && place_needed) {
>              /* This gets called at the last target page in the host page=
 */
> -            void *place_dest =3D host + TARGET_PAGE_SIZE - block->page_s=
ize;
> +            void *place_dest =3D (void *)QEMU_ALIGN_DOWN((unsigned long)=
host,
> +                                                       block->page_size)=
;
> =20
>              if (all_zero) {
>                  ret =3D postcopy_place_page_zero(mis, place_dest,
> --=20
> 2.17.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


