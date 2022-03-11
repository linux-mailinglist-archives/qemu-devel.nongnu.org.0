Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281884D6696
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 17:42:16 +0100 (CET)
Received: from localhost ([::1]:37576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSiLG-0005vl-N5
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 11:42:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nSiJK-0004eP-4q
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:40:14 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:35132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nSiJI-0001hp-HR
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:40:13 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-i28LD9OAOeSHGvJFidzlww-1; Fri, 11 Mar 2022 11:40:09 -0500
X-MC-Unique: i28LD9OAOeSHGvJFidzlww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86C6458DF;
 Fri, 11 Mar 2022 16:40:08 +0000 (UTC)
Received: from bahia (unknown [10.39.192.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D40DA1077C9A;
 Fri, 11 Mar 2022 16:40:07 +0000 (UTC)
Date: Fri, 11 Mar 2022 17:40:06 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 6/6] tests/9pfs: guard recent 'Twalk' behaviour fix
Message-ID: <20220311174006.398d42df@bahia>
In-Reply-To: <51e7f12fad3f36ce166e2f6e415784b13c4df5c4.1646850707.git.qemu_oss@crudebyte.com>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <51e7f12fad3f36ce166e2f6e415784b13c4df5c4.1646850707.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Mar 2022 19:21:18 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Previous 9p patch fixed 'Twalk' request handling, which was previously no=
t
> behaving as specified by the 9p2000 protocol spec. This patch adds a new =
test
> case which guards the new 'Twalk' behaviour in question.
>=20
> More specifically: it sends a 'Twalk' request where the 1st path componen=
t
> is valid, whereas the 2nd path component transmitted to server does not
> exist. The expected behaviour is that 9p server would respond by sending
> a 'Rwalk' response with exactly 1 QID (instead of 'Rlerror' response).
>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  tests/qtest/virtio-9p-test.c | 42 +++++++++++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 9098e21173..f29de1ca64 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -638,8 +638,12 @@ static void do_version(QVirtio9P *v9p)
>      g_assert_cmpmem(server_version, server_len, version, strlen(version)=
);
>  }
> =20
> -/* utility function: walk to requested dir and return fid for that dir *=
/
> -static uint32_t do_walk(QVirtio9P *v9p, const char *path)
> +/*
> + * utility function: walk to requested dir and return fid for that dir a=
nd
> + * the QIDs of server response
> + */
> +static uint32_t do_walk_rqids(QVirtio9P *v9p, const char *path, uint16_t=
 *nwqid,
> +                              v9fs_qid **wqid)
>  {
>      char **wnames;
>      P9Req *req;
> @@ -649,12 +653,18 @@ static uint32_t do_walk(QVirtio9P *v9p, const char =
*path)
> =20
>      req =3D v9fs_twalk(v9p, 0, fid, nwnames, wnames, 0);
>      v9fs_req_wait_for_reply(req, NULL);
> -    v9fs_rwalk(req, NULL, NULL);
> +    v9fs_rwalk(req, nwqid, wqid);
> =20
>      split_free(&wnames);
>      return fid;
>  }
> =20
> +/* utility function: walk to requested dir and return fid for that dir *=
/
> +static uint32_t do_walk(QVirtio9P *v9p, const char *path)
> +{
> +    return do_walk_rqids(v9p, path, NULL, NULL);
> +}
> +
>  /* utility function: walk to requested dir and expect passed error respo=
nse */
>  static void do_walk_expect_error(QVirtio9P *v9p, const char *path, uint3=
2_t err)
>  {
> @@ -1048,9 +1058,33 @@ static void fs_walk_nonexistent(void *obj, void *d=
ata, QGuestAllocator *t_alloc)
>      alloc =3D t_alloc;
> =20
>      do_attach(v9p);
> +    /*
> +     * The 9p2000 protocol spec sais: "If the first element cannot be wa=
lked

s/sais/says/ and elsewhere

LGTM.

Reviewed-by: Greg Kurz <groug@kaod.org>

> +     * for any reason, Rerror is returned."
> +     */
>      do_walk_expect_error(v9p, "non-existent", ENOENT);
>  }
> =20
> +static void fs_walk_2nd_nonexistent(void *obj, void *data,
> +                                    QGuestAllocator *t_alloc)
> +{
> +    QVirtio9P *v9p =3D obj;
> +    alloc =3D t_alloc;
> +    uint16_t nwqid;
> +    g_autofree v9fs_qid *wqid =3D NULL;
> +    g_autofree char *path =3D g_strdup_printf(
> +        QTEST_V9FS_SYNTH_WALK_FILE "/non-existent", 0
> +    );
> +
> +    do_attach(v9p);
> +    do_walk_rqids(v9p, path, &nwqid, &wqid);
> +    /*
> +     * The 9p2000 protocol spec sais: "nwqid is therefore either nwname =
or the
> +     * index of the first elementwise walk that failed."
> +     */
> +    assert(nwqid =3D=3D 1);
> +}
> +
>  static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc=
)
>  {
>      QVirtio9P *v9p =3D obj;
> @@ -1531,6 +1565,8 @@ static void register_virtio_9p_test(void)
>                   fs_walk_dotdot,  &opts);
>      qos_add_test("synth/walk/non_existent", "virtio-9p", fs_walk_nonexis=
tent,
>                    &opts);
> +    qos_add_test("synth/walk/2nd_non_existent", "virtio-9p",
> +                 fs_walk_2nd_nonexistent, &opts);
>      qos_add_test("synth/lopen/basic", "virtio-9p", fs_lopen,  &opts);
>      qos_add_test("synth/write/basic", "virtio-9p", fs_write,  &opts);
>      qos_add_test("synth/flush/success", "virtio-9p", fs_flush_success,


