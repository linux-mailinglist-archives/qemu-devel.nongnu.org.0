Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493173FE0DC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 19:03:23 +0200 (CEST)
Received: from localhost ([::1]:47278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTdy-0002vf-C4
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 13:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mLTOe-0000RZ-2P
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:47:32 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:46941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mLTOc-00019B-5R
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:47:31 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-PkbgyiaXPDi3CmwN2ZdlzA-1; Wed, 01 Sep 2021 12:47:24 -0400
X-MC-Unique: PkbgyiaXPDi3CmwN2ZdlzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0869487D544;
 Wed,  1 Sep 2021 16:47:24 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20D37100238C;
 Wed,  1 Sep 2021 16:47:22 +0000 (UTC)
Date: Wed, 1 Sep 2021 18:47:21 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [SPAM] [PATCH] 9pfs: fix crash in v9fs_walk()
Message-ID: <20210901184721.57b1f611@bahia.lan>
In-Reply-To: <E1mLTBg-0002Bh-2D@lizzy.crudebyte.com>
References: <E1mLTBg-0002Bh-2D@lizzy.crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sep 2021 18:15:10 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> v9fs_walk() utilizes the v9fs_co_run_in_worker({...}) macro to run the
> supplied fs driver code block on a background worker thread.
>=20
> When either the 'Twalk' client request was interrupted or if the client
> requested fid for that 'Twalk' request caused a stat error then that
> fs driver code block was left by 'break' keyword, with the intention to
> return from worker thread back to main thread as well:
>=20
>     v9fs_co_run_in_worker({
>         if (v9fs_request_cancelled(pdu)) {
>             err =3D -EINTR;
>             break;
>         }
>         err =3D s->ops->lstat(&s->ctx, &dpath, &fidst);
>         if (err < 0) {
>             err =3D -errno;
>             break;
>         }
>         ...
>     });
>=20
> However that 'break;' statement also skipped the v9fs_co_run_in_worker()
> macro's final and mandatory
>=20
>     /* re-enter back to qemu thread */
>     qemu_coroutine_yield();
>=20
> call and thus caused the rest of v9fs_walk() to be continued being
> executed on the worker thread instead of main thread, eventually
> leading to a crash in the transport virtio transport driver.
>=20
> To fix this issue and to prevent the same error from happening again by
> other users of v9fs_co_run_in_worker() in future, auto wrap the supplied
> code block into its own
>=20
>     do { } while (0);
>=20
> loop inside the 'v9fs_co_run_in_worker' macro definition.
>=20
> Full discussion and backtrace:
> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg05209.html
> https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg00174.html
>=20
> Fixes: 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Cc: qemu-stable@nongnu.org
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/9pfs/coth.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
> index c51289903d..f83c7dda7b 100644
> --- a/hw/9pfs/coth.h
> +++ b/hw/9pfs/coth.h
> @@ -51,7 +51,9 @@
>           */                                                             =
\
>          qemu_coroutine_yield();                                         =
\
>          qemu_bh_delete(co_bh);                                          =
\
> -        code_block;                                                     =
\
> +        do {                                                            =
\
> +            code_block;                                                 =
\
> +        } while (0);                                                    =
\
>          /* re-enter back to qemu thread */                              =
\
>          qemu_coroutine_yield();                                         =
\
>      } while (0)


