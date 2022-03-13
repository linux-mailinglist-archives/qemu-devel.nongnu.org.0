Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B45A4D743B
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 11:29:59 +0100 (CET)
Received: from localhost ([::1]:40814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTLU5-0007dg-PU
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 06:29:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nTLSD-0006uW-Vk
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 06:28:02 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:36131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nTLSB-0002Qe-Mk
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 06:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=/60jpaw0+Rp3IFhwyclzVE/OOlQrHf2eckpLbGbi0IQ=; b=wSFvuf35RubB+r6BPSlAsoTwqJ
 or84fGR/Vo15AOR3la2P3yNhnKYFQBf2sJiXvVqW8KJmmt/0rOQ6WVDNbtRWzUitNv+Es981ouJqA
 ZkcGhtE9QV/EdzxHUn0+hegLxQ2LoCM7lM8wrIpAT8O4aY9gl/iwrcNgvTc2RrVL7KDBM8KOXrGph
 6vUEnHNOLK3lMOYSb8LkS4MBhyLvxgCt8PqcrexcG2sTXF02bD/PBvvedz2G1dLjH1Ht2KSa7p2DU
 lOrU5Bk5hd28QgtBqhvBYe3eif9/ErNFsQXmUEAUUGOXgCrfLDtrPczIj9j94Cq5+mX5tLyGKEj4k
 nu9KwQGinhNHCEyTotyGHVjuKRfpNwNyxo1rBpVpGWTfOdHw314CYfDswdkFgSD7/x3HjWBBN9uZc
 1hT8fWdJ2IdysK1VQhygTlhU9lVdpp/Zcu1rcw/+rqDkhow/TEMRoh/YKCdUeNRV3sBouPmi0WFdc
 OjXyqw2gw4NUnxbcnkvb5mJuZR5JTpQKU4wsno1KYbu2kpdnzs6FQ+q0ttl1qGkigbpF2GbEoN3ok
 2UuamyoZ8aVmUKt4i1FsyBGr3GZ/fOBOBMLz5+0KDy7nucmOFWy9aGtto4goqwVZvKWReZwrepIlB
 2OoRK+FmAS2D8gMKbZ3I61UlaEJW+zn/jSaKS7aE0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3 7/7] tests/9pfs: check fid being unaffected in
 fs_walk_2nd_nonexistent
Date: Sun, 13 Mar 2022 11:27:56 +0100
Message-ID: <29415460.1Kctidrl30@silver>
In-Reply-To: <c553fe1cfcfef7560240a40638b5ebc40a992863.1647163863.git.qemu_oss@crudebyte.com>
References: <cover.1647163863.git.qemu_oss@crudebyte.com>
 <c553fe1cfcfef7560240a40638b5ebc40a992863.1647163863.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sonntag, 13. M=E4rz 2022 10:28:32 CET Christian Schoenebeck wrote:
> Extend previously added test case by checking that fid is unaffected
> by 'Twalk' request (i.e. when 2nd path component of request being
> invalid). Do that by comparing the QID of root fid with QID of walked
> fid; they should be identical.
>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  tests/qtest/virtio-9p-test.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index f6e78d388e..b9c6819d01 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -721,14 +721,19 @@ static void fs_version(void *obj, void *data,
> QGuestAllocator *t_alloc) do_version(obj);
>  }
>=20
> -static void do_attach(QVirtio9P *v9p)
> +static void do_attach_rqid(QVirtio9P *v9p, v9fs_qid *qid)
>  {
>      P9Req *req;
>=20
>      do_version(v9p);
>      req =3D v9fs_tattach(v9p, 0, getuid(), 0);
>      v9fs_req_wait_for_reply(req, NULL);
> -    v9fs_rattach(req, NULL);
> +    v9fs_rattach(req, qid);
> +}
> +
> +static void do_attach(QVirtio9P *v9p)
> +{
> +    do_attach_rqid(v9p, NULL);
>  }
>=20
>  static void fs_attach(void *obj, void *data, QGuestAllocator *t_alloc)
> @@ -1101,19 +1106,22 @@ static void fs_walk_2nd_nonexistent(void *obj, vo=
id
> *data, {
>      QVirtio9P *v9p =3D obj;
>      alloc =3D t_alloc;
> +    v9fs_qid root_qid;
>      uint16_t nwqid;
>      g_autofree v9fs_qid *wqid =3D NULL;
>      g_autofree char *path =3D g_strdup_printf(
>          QTEST_V9FS_SYNTH_WALK_FILE "/non-existent", 0
>      );
>=20
> -    do_attach(v9p);
> +    do_attach_rqid(v9p, &root_qid);
>      do_walk_rqids(v9p, path, &nwqid, &wqid);
>      /*
>       * The 9p2000 protocol spec says: "nwqid is therefore either nwname =
or
> the * index of the first elementwise walk that failed."
>       */
>      assert(nwqid =3D=3D 1);
> +    /* expect fid being unaffected by walk */
> +    g_assert(wqid && wqid[0] && is_same_qid(root_qid, wqid[0]));

Mmm, that's actually not checking whether fid was unaffected by the walk. I=
t=20
just checks whether the QID returned by Rwalk equals the root QID, period.

I suggest I leave this check here (just remove the false comment there), it=
's=20
still OK to do that check, but additionally I would send a Tgetatrr on the=
=20
walked fid to do the actual "fid unaffected" check?

I'll wait to see if you spot something else before posting any v4.

>  }
>=20
>  static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc=
)



