Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7D942D645
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 11:40:56 +0200 (CEST)
Received: from localhost ([::1]:34608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maxEN-00078P-RO
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 05:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1max8l-00085u-88
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:35:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1max8j-0002wa-Ip
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:35:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634204104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E6EqkN6ao2lbF1TYWlR3gqk5zIYtKJf37sooyJezhUY=;
 b=JYbABoFWUT69Qrx7YxH3TgrBjqJZwIBmHxGUhJRwu7YSFcPU9jlep96k/8R4NuVqDCvUeR
 +Dxb3wxwY2ypigfwfQ52Mw7MMCIqyU2pCGx7W5ubM18aMGN/tbRBWMmwEmzP0QAnPtOiZ7
 fFEdtuM14bLUFMg+6FmyDV1L1OdiNmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-p_plYaD4PFaSgnA24fJzvQ-1; Thu, 14 Oct 2021 05:35:03 -0400
X-MC-Unique: p_plYaD4PFaSgnA24fJzvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAC7C19057A2;
 Thu, 14 Oct 2021 09:35:01 +0000 (UTC)
Received: from localhost (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79AB55C3E0;
 Thu, 14 Oct 2021 09:34:40 +0000 (UTC)
Date: Thu, 14 Oct 2021 10:34:39 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG skipping
 mmap_addr
Message-ID: <YWf5rw8wN65UfAgj@stefanha-x1.localdomain>
References: <20211011201047.62587-1-david@redhat.com>
 <YWapnsmfDMPj80Sd@stefanha-x1.localdomain>
 <20211014045239.GA21284@raphael-debian-dev>
MIME-Version: 1.0
In-Reply-To: <20211014045239.GA21284@raphael-debian-dev>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BP5r16zudHjvCYRP"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Coiby Xu <coiby.xu@gmail.com>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--BP5r16zudHjvCYRP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 04:52:48AM +0000, Raphael Norwitz wrote:
> On Wed, Oct 13, 2021 at 10:40:46AM +0100, Stefan Hajnoczi wrote:
> > On Mon, Oct 11, 2021 at 10:10:47PM +0200, David Hildenbrand wrote:
> > > We end up not copying the mmap_addr of all existing regions, resultin=
g
> > > in a SEGFAULT once we actually try to map/access anything within our
> > > memory regions.
> > >=20
> > > Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-use=
r")
> > > Cc: qemu-stable@nongnu.org
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > > Cc: "Marc-Andr=E9 Lureau" <marcandre.lureau@redhat.com>
> > > Cc: Stefan Hajnoczi <stefanha@redhat.com>
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > Cc: Coiby Xu <coiby.xu@gmail.com>
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > ---
> > >  subprojects/libvhost-user/libvhost-user.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/=
libvhost-user/libvhost-user.c
> > > index bf09693255..787f4d2d4f 100644
> > > --- a/subprojects/libvhost-user/libvhost-user.c
> > > +++ b/subprojects/libvhost-user/libvhost-user.c
> > > @@ -816,6 +816,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> > >              shadow_regions[j].gpa =3D dev->regions[i].gpa;
> > >              shadow_regions[j].size =3D dev->regions[i].size;
> > >              shadow_regions[j].qva =3D dev->regions[i].qva;
> > > +            shadow_regions[j].mmap_addr =3D dev->regions[i].mmap_add=
r;
> > >              shadow_regions[j].mmap_offset =3D dev->regions[i].mmap_o=
ffset;
> > >              j++;
> > >          } else {
> >=20
> > Raphael: Some questions about vu_rem_mem_reg():
> >=20
> > - What ensures that shadow_regions[VHOST_USER_MAX_RAM_SLOTS] is large
> >   enough? The add_mem_reg/set_mem_table code doesn't seem to check
> >   whether there is enough space in dev->regions[] before adding regions=
.
> >
>=20
> Correct - it does not check if there is enough space as is. I can add tha=
t.
>=20
> > - What happens when the master populated dev->regions[] with multiple
> >   copies of the same region? dev->nregions is only decremented once and
> >   no longer accurately reflects the number of elements in
> >   dev->regions[].
>=20
> That case is also not accounted for. I will add it.
>=20
> >=20
> > libvhost-user must not trust the vhost-user master since vhost-user
> > needs to provide process isolation. Please add input validation.
> >=20
>=20
> Got it - let me start working on a series.

Great, thank you!

Stefan

--BP5r16zudHjvCYRP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFn+a8ACgkQnKSrs4Gr
c8isbgf/X/IyP6YcYCgJlQO0/f3GhmsU2t/FOVw4AUIq8SWuiJCwb4HHZc32FiJY
MEX6HDZHzOY9fgObssrM1vw1hhyVazxj0OM27+pMfwfkiy9pfWxM84fapM4XmKvw
t0KeNVz0JaIpkXoyBCR9O3zq/OkZ2HQXaMxq9tyaLV+CdyiNAbJlTzCfzBlDw8xe
K4mc9eaTUJ3bGtGp+62wUPRlqxVPA3Vd1O1moG3d6hcnuO2fRMO/0R0NPxY94K2R
EdWo5iez+Lw+092OqyRu9pV8rdbrfBgZ6DOrgSVR9txdcaFvG7Q2/9GErVZt8j1H
FLk29sxPKo3xLKXnmQkQ0+izz5WGqQ==
=K4iL
-----END PGP SIGNATURE-----

--BP5r16zudHjvCYRP--


