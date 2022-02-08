Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF94AD581
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:30:08 +0100 (CET)
Received: from localhost ([::1]:58538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNl9-00026J-Bl
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:30:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nHNYf-0003AM-7a
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:17:13 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:41919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nHNYd-0004C2-HR
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:17:12 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-n10xAg0XNMi7RnHHnmUVVQ-1; Tue, 08 Feb 2022 05:17:00 -0500
X-MC-Unique: n10xAg0XNMi7RnHHnmUVVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 196AD1091DA0;
 Tue,  8 Feb 2022 10:16:59 +0000 (UTC)
Received: from bahia (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFAA77C808;
 Tue,  8 Feb 2022 10:16:56 +0000 (UTC)
Date: Tue, 8 Feb 2022 11:16:55 +0100
From: Greg Kurz <groug@kaod.org>
To: Will Cohen <wwcohen@gmail.com>
Subject: Re: [PATCH v5 11/11] 9p: darwin: Adjust assumption on virtio-9p-test
Message-ID: <20220208111655.4103a556@bahia>
In-Reply-To: <20220207224024.87745-12-wwcohen@gmail.com>
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <20220207224024.87745-12-wwcohen@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 hi@alyssa.is, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  7 Feb 2022 17:40:24 -0500
Will Cohen <wwcohen@gmail.com> wrote:

> The previous test depended on the assumption that P9_DOTL_AT_REMOVEDIR
> and AT_REMOVEDIR have the same value.
>=20
> While this is true on Linux, it is not true everywhere, and leads to an
> incorrect test failure on unlink_at, noticed when adding 9p to darwin:
>=20
> Received response 7 (RLERROR) instead of 77 (RUNLINKAT)
> Rlerror has errno 22 (Invalid argument)
> **
>=20
> ERROR:../tests/qtest/virtio-9p-test.c:305:v9fs_req_recv: assertion
> failed (hdr.id =3D=3D id): (7 =3D=3D 77) Bail out!
>=20
> ERROR:../tests/qtest/virtio-9p-test.c:305:v9fs_req_recv: assertion
> failed (hdr.id =3D=3D id): (7 =3D=3D 77)
>=20
> Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
> [Will Cohen: - Add explanation of patch and description
>                of pre-patch test failure]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> ---

LGTM but this patch should go before patch 10 that enables
Darwin host support to avoid qtest breakage while bisecting.

Reviewed-by: Greg Kurz <groug@kaod.org>

>  tests/qtest/virtio-9p-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 41fed41de1..6bcf89f0f8 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -1270,7 +1270,7 @@ static void fs_unlinkat_dir(void *obj, void *data, =
QGuestAllocator *t_alloc)
>      /* ... and is actually a directory */
>      g_assert((st.st_mode & S_IFMT) =3D=3D S_IFDIR);
> =20
> -    do_unlinkat(v9p, "/", "02", AT_REMOVEDIR);
> +    do_unlinkat(v9p, "/", "02", P9_DOTL_AT_REMOVEDIR);
>      /* directory should be gone now */
>      g_assert(stat(new_dir, &st) !=3D 0);
> =20


