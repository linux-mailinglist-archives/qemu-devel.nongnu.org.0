Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA778382B5A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:43:46 +0200 (CEST)
Received: from localhost ([::1]:49238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libf0-0002li-0m
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1libWs-00060s-5e
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:35:22 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:58537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1libWo-0006PL-06
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:35:20 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-J9EtDrPENaKlIa4n0lJxaQ-1; Mon, 17 May 2021 07:35:12 -0400
X-MC-Unique: J9EtDrPENaKlIa4n0lJxaQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A521801B13;
 Mon, 17 May 2021 11:35:11 +0000 (UTC)
Received: from bahia.lan (ovpn-112-167.ams2.redhat.com [10.36.112.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70D5E5B685;
 Mon, 17 May 2021 11:35:10 +0000 (UTC)
Date: Mon, 17 May 2021 13:35:09 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [SPAM] [PATCH] 9pfs: simplify v9fs_walk()
Message-ID: <20210517133509.05d1f4f9@bahia.lan>
In-Reply-To: <E1liKiz-0006BC-Ja@lizzy.crudebyte.com>
References: <E1liKiz-0006BC-Ja@lizzy.crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 16 May 2021 17:55:34 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> There is only one comparison between nwnames and P9_MAXWELEM required.
>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

Nice catch. It's been there for a decade :)

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/9pfs/9p.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 0fa776af09..89aa07db78 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1739,7 +1739,11 @@ static void coroutine_fn v9fs_walk(void *opaque)
> =20
>      trace_v9fs_walk(pdu->tag, pdu->id, fid, newfid, nwnames);
> =20
> -    if (nwnames && nwnames <=3D P9_MAXWELEM) {
> +    if (nwnames > P9_MAXWELEM) {
> +        err =3D -EINVAL;
> +        goto out_nofid;
> +    }
> +    if (nwnames) {
>          wnames =3D g_new0(V9fsString, nwnames);
>          qids   =3D g_new0(V9fsQID, nwnames);
>          for (i =3D 0; i < nwnames; i++) {
> @@ -1753,9 +1757,6 @@ static void coroutine_fn v9fs_walk(void *opaque)
>              }
>              offset +=3D err;
>          }
> -    } else if (nwnames > P9_MAXWELEM) {
> -        err =3D -EINVAL;
> -        goto out_nofid;
>      }
>      fidp =3D get_fid(pdu, fid);
>      if (fidp =3D=3D NULL) {


