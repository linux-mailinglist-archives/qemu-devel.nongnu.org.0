Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA78324338
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:33:56 +0100 (CET)
Received: from localhost ([::1]:36146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEy2t-0008Ke-5g
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:33:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEy0I-00079i-Pw
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:31:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEy0G-0001Kk-1e
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:31:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614187870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E7o5NMHw3MOF7yt79r+NEPR1shwm1DlDYzH0xVVxxBQ=;
 b=Zu4ZzhAf7mVDuaWR+eXCNr56nvCUoRKXwLWGBoVGtgUwAJMUZNsYqY+n7w+xGo/epD7XCa
 qOSCCRhRDtTGiR1CkyPR1AsczizYH/HDwyd8fDC8XMR2AHgiXIwWXXPHDC+d3l9bqKNgk9
 GTLN2eqkCbyVlSKZsAmIdGZK6pYLUA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-p0VTK6SuM2e7hXiEtVM_kQ-1; Wed, 24 Feb 2021 12:31:06 -0500
X-MC-Unique: p0VTK6SuM2e7hXiEtVM_kQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD77D80196C;
 Wed, 24 Feb 2021 17:31:03 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A70595C22B;
 Wed, 24 Feb 2021 17:30:57 +0000 (UTC)
Date: Wed, 24 Feb 2021 18:30:56 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] block/file-posix: Optimize for macOS
Message-ID: <20210224173056.GH11025@merkur.fritz.box>
References: <20210219085148.90545-1-akihiko.odaki@gmail.com>
 <YDZ+gVgfvNejLfFQ@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YDZ+gVgfvNejLfFQ@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, pkrempa@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 John Snow <jsnow@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 24.02.2021 um 17:27 hat Stefan Hajnoczi geschrieben:
> On Fri, Feb 19, 2021 at 05:51:48PM +0900, Akihiko Odaki wrote:
> > This commit introduces "punch hole" operation and optimizes transfer
> > block size for macOS.
> >=20
> > This commit introduces two additional members,
> > discard_granularity and opt_io to BlockSizes type in
> > include/block/block.h. Also, the members of the type are now
> > optional. Set -1 to discard_granularity and 0 to other members
> > for the default values.
>=20
> I remember BlockSizes was added specifically for s390 DASD devices.
> Normally QEMU does not automatically expose details of the underlying
> hardware to the guest because it breaks live migration compatibility.
>=20
> If a VM is running on host A where the value happens to be 512 bytes and
> is migrated to host B where the value happens to be 4KB then:
>=20
> 1. The value reported to the guest by the storage device will change
>    unexpectedly and the guest software is probably not prepared for this
>    to happen.
>=20
> 2. I/O requests that violate the constraint imposed by host B's value
>    will suddenly start failing and the VM may no longer be operational.
>=20
> I think there was an argument that DASDs are passthrough devices and the
> user always knows what they are doing, so we can ignore this problem for
> DASDs.
>=20
> This reasoning does not apply to POSIX files on macOS hosts, so I think
> we need to figure out what to do here. The easiest option is not to
> merge this patch series, but if this feature is important to you then we
> need to think about how to extend the block size probing to be live
> migration friendly or to change the QEMU command-line to support this
> use case without unexpected live migration breakage.

Dave actually made a good point on IRC: Even if we change live migration
so that it doesn't break when we move to a host where different defaults
are autodetected (we could do this by including these values in the
migration stream and letting that override what the user specific on the
command line), it still means that the guest visible device would change
after the next reboot.

The same can happen without live migration, either by copying the image
to a different host, or by changing the hardware of the host.

I'm not sure how critical such changes are now, but I seem to remember
that in the past, one big reason to avoid them was that Windows guests
would require reactivation after a few changes.

(Also adding Peter to CC as the libvirt representative who, I suspect,
might not like the idea of autodetecting by default very much :-))

Kevin

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmA2jVAACgkQfwmycsiP
L9a95g//QMdMu1EVFql7cGteILENPdgwK/v/f3badwpvCNB9Eqse/T8ar6WjSFPR
gRrd6qIykVnlbnXJrx2xjTYWYv/sNxKmNJij4wPTlJWLmmsFnI5BCaIIsHpn3sfO
j4QI9DRHxOx1pKaTst6WwMYWP9ppgAHMtSiwyNJI36BcXZLXr3BtX7WpXKULhpS8
z5R5OU5suZOIVq5NTrQRLBjRk7yAeVCGOm71FHNKd+LbadjHtDzF6UNIcdzuDD2j
jGcwxPm5+2kchgqMreiH/sX5romJgSSmYTxl115xpecosFzQ7HwlYs09hsLweNel
bzwsGZj7BvEcoeZ4pg2HA68hTBIJ2ffxPTAlEaxkuDDi+HjIC6OUF/kj0NKugZoy
jY4DzW2skA9nrKaOkF5DIn5MOGgJUyYuCY0FPqgHIlhLbkIoBO7Zx3O2sxtJnYng
/r7zrAwhvm+ULuy9hiBHsBOzg8CW9DedrmWSnrtz4uk6uLJiJUX94rWJJshszgMa
hjFeT1wpJ+JEF/6PzIggDhVpvhlqCAdpOPthguyKmr84GuRLWQ5ynDH9s2Yhi+v6
+GIIj4brjfo59bkuwobp8n2pC/rY5ZuFvI43D6tQW0wiBOCtxhUd/LV/LyBuKwpM
NozLtUNvtUesEL3NRxWP6TfPd+Pv+1qS52YZakGkn79Q6kpHgik=
=Vhs8
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--


