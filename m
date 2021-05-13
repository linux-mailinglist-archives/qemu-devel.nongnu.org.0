Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A42F537F9A5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 16:28:20 +0200 (CEST)
Received: from localhost ([::1]:56514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhCK3-0007T0-Of
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 10:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lhCHn-0005k9-QX
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lhCHk-0008Cz-97
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620915954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=weXvaF6DXi/6EmG4dRXKYgNcLuRXwNEfMUtdkq7RrSA=;
 b=aaMvDMJpLV3BRD6oCJKQp6wg2yEV4MEqk5ZWww5t9gsAc4daQAP9YXdG9R7/PHit5wHYbe
 RJbQo3cT3+qhMZNwbFC76MQXIgQb7imV/9iwXwRXA6S7cAiWAYzb+z9/9wkiYjZGis6cFf
 DhU94KNxgs+CiuJ4fzp1uIZFZlvLAp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218--ANKkmOONLWBxk0t5dyYjg-1; Thu, 13 May 2021 10:25:52 -0400
X-MC-Unique: -ANKkmOONLWBxk0t5dyYjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3092188E3CA;
 Thu, 13 May 2021 14:25:50 +0000 (UTC)
Received: from localhost (ovpn-113-21.ams2.redhat.com [10.36.113.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2614C5D736;
 Thu, 13 May 2021 14:25:47 +0000 (UTC)
Date: Thu, 13 May 2021 15:25:46 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [RFC PATCH] block/io.c: Flush parent for quorum in generic code
Message-ID: <YJ026q2oFkTckc8u@stefanha-x1.localdomain>
References: <20210512074957.763711-1-chen.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210512074957.763711-1-chen.zhang@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="o4IPpsmItDPesDHm"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block <qemu-block@nongnu.org>, qemu-dev <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 Minghao Yuan <meeho@qq.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--o4IPpsmItDPesDHm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 03:49:57PM +0800, Zhang Chen wrote:
> Fix the issue from this patch:
> [PATCH] block: Flush all children in generic code
> From 883833e29cb800b4d92b5d4736252f4004885191
>=20
> Quorum driver do not have the primary child.
> It will caused guest block flush issue when use quorum and NBD.
> The vm guest flushes failed=EF=BC=8Cand then guest filesystem is shutdown=
.
>=20
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> Reported-by: Minghao Yuan <meeho@qq.com>
> ---
>  block/io.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
...
> +flush_data:
> +    if (no_primary_child) {
> +        /* Flush parent */
> +        ret =3D bs->file ? bdrv_co_flush(bs->file->bs) : 0;
> +    } else {
> +        /* Flush childrens */
> +        ret =3D 0;
> +        QLIST_FOREACH(child, &bs->children, next) {
> +            if (child->perm & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED=
)) {
> +                int this_child_ret =3D bdrv_co_flush(child->bs);
> +                if (!ret) {
> +                    ret =3D this_child_ret;
> +                }
>              }
>          }

I'm missing something:

The quorum driver has a valid bs->children list even though it does not
have a primary child. Why does QLIST_FOREACH() loop fail for you?

Does this patch effectively skip bdrv_co_flush() calls on all quorum
children? That seems wrong since children need to be flushed so that
data is persisted.

Stefan

--o4IPpsmItDPesDHm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCdNuoACgkQnKSrs4Gr
c8iL7ggAm4O+mZNxVVcu7h9oaYX9ksceOb4gVFdXmjZMvyi7be6ycJXjUHtTt0Vf
rGuDSrgd89dyzIWwBInWkrGVx7jMuWyGEIwmD0eD/QwWps82luL5NBcPcbWQU584
MosnRNVIN6Yaj5F72xxTSRo/IwRev0E+yEKFZZSccKcbLfi4xtblJehWpR8p2YqV
6/9JrkPyT665OjpdPANOXi9ysSVA/JdyBGvAq83TYNd5XfWlUBYR8z3XTVwtDjvj
rC6d5w56uLT6F2r1ZkObNHr8TYX5shUX+l76mODJZ9abZFe4XM8eCb1o44DbTdxp
yRgGAOA7DuAW4Xxz8jLS0jY67WlmnA==
=AtDQ
-----END PGP SIGNATURE-----

--o4IPpsmItDPesDHm--


