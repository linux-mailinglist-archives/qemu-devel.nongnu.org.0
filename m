Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652874198E2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:31:07 +0200 (CEST)
Received: from localhost ([::1]:42954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtX0-0000i7-Ae
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mUtUi-0007Ih-Fn
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:28:44 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:47601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mUtUg-0000Ao-Mv
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:28:44 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-SyGz2NCYPEu4OkpebxTplA-1; Mon, 27 Sep 2021 12:28:38 -0400
X-MC-Unique: SyGz2NCYPEu4OkpebxTplA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 972021006AA3;
 Mon, 27 Sep 2021 16:28:37 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E8E81972E;
 Mon, 27 Sep 2021 16:28:32 +0000 (UTC)
Date: Mon, 27 Sep 2021 18:28:31 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 2/2] 9pfs: simplify blksize_to_iounit()
Message-ID: <20210927182831.2cee0cf8@bahia.huguette>
In-Reply-To: <b84eb324d2ebdcc6f9c442c97b5b4d01eecb4f43.1632758315.git.qemu_oss@crudebyte.com>
References: <cover.1632758315.git.qemu_oss@crudebyte.com>
 <b84eb324d2ebdcc6f9c442c97b5b4d01eecb4f43.1632758315.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
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
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Sep 2021 17:50:36 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Use QEMU_ALIGN_DOWN() macro to reduce code and to make it
> more human readable.
>=20
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/9pfs/9p.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index c65584173a..29cc19c90a 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1280,8 +1280,7 @@ static int32_t blksize_to_iounit(const V9fsPDU *pdu=
, int32_t blksize)
>       * as well as less than (client msize - P9_IOHDRSZ)
>       */
>      if (blksize) {
> -        iounit =3D blksize;
> -        iounit *=3D (s->msize - P9_IOHDRSZ) / blksize;
> +        iounit =3D QEMU_ALIGN_DOWN(s->msize - P9_IOHDRSZ, blksize);
>      }
>      if (!iounit) {
>          iounit =3D s->msize - P9_IOHDRSZ;


