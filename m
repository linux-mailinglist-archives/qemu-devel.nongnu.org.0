Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A572DD1F6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 14:13:27 +0100 (CET)
Received: from localhost ([::1]:50806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpt5y-00009Z-LH
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 08:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kpt2P-0006bk-1O
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:09:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kpt2M-00045U-Jg
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:09:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608210582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YYl58uYPe2iXP8wZfDNNl6jDEd/ToJVvWvG2lXD7l0E=;
 b=U5Z5UCXAQVcGWswNKt5X0Yqs0eiWQ6pcu54tJqEMaXUALAmQGGm1FVWZjKcac2Tt7iQ16l
 UAKm9dYjWj/LXstU1eKsdbjhi50EZ3dEgcyGYFDOjNSYCZjES0Z3XzVekbA9kDcwvmNalL
 7ARExlkQsSF/6Cupq3OzW0AbhYVVSLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-rjtvrmtQOwqgUwPTRmmT4g-1; Thu, 17 Dec 2020 08:09:36 -0500
X-MC-Unique: rjtvrmtQOwqgUwPTRmmT4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDDB06D524;
 Thu, 17 Dec 2020 13:09:34 +0000 (UTC)
Received: from localhost (ovpn-112-215.rdu2.redhat.com [10.10.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98E3518993;
 Thu, 17 Dec 2020 13:09:27 +0000 (UTC)
Date: Thu, 17 Dec 2020 14:09:26 +0100
From: Sergio Lopez <slp@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 2/4] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
Message-ID: <20201217130926.lqbthako23t4o3s5@mhamilton>
References: <20201214170519.223781-3-slp@redhat.com>
 <20201215121233.GD8185@merkur.fritz.box>
 <20201215131527.evpidxevevtfy54n@mhamilton>
 <20201215150119.GE8185@merkur.fritz.box>
 <20201215172337.w7vcn2woze2ejgco@mhamilton>
 <20201216123514.GD7548@merkur.fritz.box>
 <20201216145502.yiejsw47q5pfbzio@mhamilton>
 <20201216183102.GH7548@merkur.fritz.box>
 <20201217093744.tg6ik73o45nidcs4@mhamilton>
 <20201217105830.GA12328@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201217105830.GA12328@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jvwub2mrtajxdnkv"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--jvwub2mrtajxdnkv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 11:58:30AM +0100, Kevin Wolf wrote:
> Am 17.12.2020 um 10:37 hat Sergio Lopez geschrieben:
> > Do you think it's safe to re-enter backup-top, or should we look for a
> > way to avoid this?
>=20
> I think it should be avoided, but I don't understand why putting all
> children of backup-top into the ignore list doesn't already avoid it. If
> backup-top is in the parents list of qcow2, then qcow2 should be in the
> children list of backup-top and therefore the BdrvChild should already
> be in the ignore list.
>=20
> The only way I can explain this is that backup-top and qcow2 have
> different ideas about which BdrvChild objects exist that connect them.
> Or that the graph changes between both places, but I don't see how that
> could happen in bdrv_set_aio_context_ignore().

I've been digging around with gdb, and found that, at that point, the
backup-top BDS is actually referenced by two different BdrvChild
objects:

(gdb) p *(BdrvChild *) 0x560c40f7e400
$84 =3D {bs =3D 0x560c40c4c030, name =3D 0x560c41ca4960 "root", klass =3D 0=
x560c3eae7c20 <child_root>,=20
  role =3D 20, opaque =3D 0x560c41ca4610, perm =3D 3, shared_perm =3D 29, h=
as_backup_perm =3D false,=20
  backup_perm =3D 0, backup_shared_perm =3D 31, frozen =3D false, parent_qu=
iesce_counter =3D 2, next =3D {
    le_next =3D 0x0, le_prev =3D 0x0}, next_parent =3D {le_next =3D 0x0, le=
_prev =3D 0x560c40c44338}}

(gdb) p sibling
$72 =3D (BdrvChild *) 0x560c40981840
(gdb) p *sibling
$73 =3D {bs =3D 0x560c40c4c030, name =3D 0x560c4161be20 "main node", klass =
=3D 0x560c3eae6a40 <child_job>,=20
  role =3D 0, opaque =3D 0x560c4161bc00, perm =3D 0, shared_perm =3D 31, ha=
s_backup_perm =3D false,=20
  backup_perm =3D 0, backup_shared_perm =3D 0, frozen =3D false, parent_qui=
esce_counter =3D 2, next =3D {
    le_next =3D 0x0, le_prev =3D 0x0}, next_parent =3D {le_next =3D 0x560c4=
0c442d0, le_prev =3D 0x560c40c501c0}}

When the chain of calls to switch AIO contexts is started, backup-top
is the first one to be processed. blk_do_set_aio_context() instructs
bdrv_child_try_set_aio_context() to add blk->root (0x560c40f7e400) as
the first element in ignore list, but the referenced BDS is still
re-entered through the other BdrvChild (0x560c40981840) by one the
children of the latter.

I can't think of a way of preventing this other than keeping track of
BDS pointers in the ignore list too. Do you think there are any
alternatives?

Thanks,
Sergio.

--jvwub2mrtajxdnkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/bWHwACgkQ9GknjS8M
AjVmmxAAnOyVZGFSmhLixYFUU37Rpkw5SAKaWvauoce3mDVaCBpyDf7NajfTq25j
GK0NOL/mRp+trxC1absAN0tBULadrMbkT4UIUGyrRvcntEGdFrfQJ44LOKZ4lEw+
QlZG/bS0MwDQ+cql/WjWPicqTdr+pdyjzhWxZzoJtUkRKMWBHkt6e2UQMkzR3DaB
eTUdx6LF+Tfm6w36ZqAIdH0pMZu1Te084hWIQmgj+6FMGZSUqYKpKgn8sGxqQ20Y
XOv3PHtuAu6wugqd3bCs5A+mTenG+dtW/NKPFcMkI6U30u8pOciXSMnfx0+o3mpd
L4K+7qXPUSziR+9XRFvPMBwblkKCpP5Zt91CEbES9jRS9EQSnbs3E3eW9tshBUFE
akQD6qJgN3XvfqhqGQDlJGyz0R14qzFrehnbloTFQuOEM2dXEfVo6rXD+pfGX04o
886fgxqJezmL44XdaxLQ8k/Q3ywtnwfgaD/0jK7XKZrD8f/GwSvTp+b+PWmYp2eL
NCO0zWybPocN/5PsYPsnN0+w37GX1vaIhhhCX1nXo2BfbzO3Z/8bfCkLBhUFLfE4
a7/lT7Q3NVvRnIt0o9MEqPXkYTfIN4Zwcji6Zx0jV/ex8o0lCyk/EKL8DiZ5Ri9e
xrDqHyeL1BnTrdSb5quyXv3tS72m9XrpYpgzKNGhD6ZyS+Wi/rU=
=9hdX
-----END PGP SIGNATURE-----

--jvwub2mrtajxdnkv--


