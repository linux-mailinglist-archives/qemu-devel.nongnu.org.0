Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99BA37C07B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:43:11 +0200 (CEST)
Received: from localhost ([::1]:43660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgq4s-0004Ho-Bl
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lgq3w-0003R1-RL
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:42:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lgq3u-000378-3h
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:42:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620830529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M3CMOt2wSvA4gzMIlsDJ/j+xzQBfx07VEAslvt/fIcA=;
 b=YBxuJuPPo3AYHUjo0xgQk+H4MvpYpoYe9UOHQOguhqEWDIDsmdN71kZpNpg0jTRf6gEtI2
 NAGyTDhzIODlqcS9vPJzP2m9oQ6FppV73x0UGjsKI6Qaus8sHyUIg31wSSA0cnfslErkBu
 2lbAE1AVFvWiN5JJb+jQZobX6EPODqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-FnjaDDWiN4qyoKbvyz7Sqw-1; Wed, 12 May 2021 10:42:06 -0400
X-MC-Unique: FnjaDDWiN4qyoKbvyz7Sqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFF4F1922963;
 Wed, 12 May 2021 14:42:05 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-75.ams2.redhat.com [10.36.114.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E55412CFAD;
 Wed, 12 May 2021 14:41:58 +0000 (UTC)
Date: Wed, 12 May 2021 16:41:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] block/export: improve vu_blk_sect_range_ok()
Message-ID: <YJvpNcxbHmE61byd@merkur.fritz.box>
References: <20210331142727.391465-1-stefanha@redhat.com>
 <YJo/fGeyttorPzWQ@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YJo/fGeyttorPzWQ@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CO+MCItWCIaTTD91"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Coiby Xu <Coiby.Xu@gmail.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--CO+MCItWCIaTTD91
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 11.05.2021 um 10:25 hat Stefan Hajnoczi geschrieben:
> On Wed, Mar 31, 2021 at 03:27:27PM +0100, Stefan Hajnoczi wrote:
> > The checks in vu_blk_sect_range_ok() assume VIRTIO_BLK_SECTOR_SIZE is
> > equal to BDRV_SECTOR_SIZE. This is true, but let's add a
> > QEMU_BUILD_BUG_ON() to make it explicit.
> >=20
> > We might as well check that the request buffer size is a multiple of
> > VIRTIO_BLK_SECTOR_SIZE while we're at it.
> >=20
> > Suggested-by: Max Reitz <mreitz@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  block/export/vhost-user-blk-server.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> Ping for QEMU 6.1.

Thanks, applied to the block branch.

Kevin

--CO+MCItWCIaTTD91
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmCb6TUACgkQfwmycsiP
L9ZHEA/+IKdp1AwKXQw54zb7SvxT0zswXp7207XjJekCd28wVBtJBSU5iXJcGDQQ
Cq8Wh4xfujG7dSRSKiSnnWQYG0SrHl/WuW7+5sXXkvMPQE5Uxsh99lD7+W/JIe5a
5/vGFPIs3L5XOrZkzGXUj9kD7C5u7YdNr60D6tGHVw04WjZJTnMZ33vRMPVCYeom
vggwBkU9mr+kXm3lcCdaWsGPWlJkTN16Ae86VcnYh7F2Cl7a1S5GlibJOFe3M7TT
66DvGB2WOddR85AazDNPBeZ0Kb/bVWvxzDEzXqkFQ1OQQgY9qyW6tGzncnYAJKKH
K6llA0+QVhpA72Knh0ozr95CnOCQ/SInL/usj6iLVLgDZydMFI0UlJ2uLAx4A/A9
NX8ZSEBlLYY2CJOzyvttc/RIe/6MwL9g6GsSiNhrgKAhNxyN7edA3i7bw2VuLtBX
WkspMd3Dlqzs9ZbgI+oAvUyCNVlMpWBIQlzgySu4urR3mYkxTsIJZmUBPo1fzkv1
Fff1b9WatZW7iXuwhnP68UF+XmdBQMott8FfSEoYAh5pAQvo+A1/eSTNhF/HAYuL
86JmPPSJuhLSpaHluvZFKbFSlesLCmE4MRvYrySNy55XIQFSvgRR7o8+lZHz0Tr6
RK+MLrf8OyF+SCG+iPnnAn3d9H0P7l8EyXbK8lW//Cgk/sTcW8A=
=JMUT
-----END PGP SIGNATURE-----

--CO+MCItWCIaTTD91--


