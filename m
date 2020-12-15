Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF732DB271
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:25:35 +0100 (CET)
Received: from localhost ([::1]:52546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpE4r-0006qh-Ti
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kpE3T-0006Fh-Iy
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:24:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kpE3O-0005Ak-2A
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608053039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rUdEUiX0emWRYmCkDrP17XYuL2iUgaq+xIQzZwTCHCQ=;
 b=UsVGToaQD6wMJrXaeRuuUisJ5jYbCF9lqAkq9cMWp1m9XIBUd64IIOIKjhW41v4uTY9uqU
 4Hvm7g08iHhJ0PED6vMmmS//5m5hhXenD/oX7nJ4awAvJIuV4pLQQes6CpfKIrzJRHXz2Y
 R6I8PSCL64nGW5bwJ0qz1CvVoUFIwQw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-hCy7xXOIO3OqX7U5VVhdwg-1; Tue, 15 Dec 2020 12:23:53 -0500
X-MC-Unique: hCy7xXOIO3OqX7U5VVhdwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28CE119251A6;
 Tue, 15 Dec 2020 17:23:51 +0000 (UTC)
Received: from localhost (ovpn-114-253.rdu2.redhat.com [10.10.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB8B260C0F;
 Tue, 15 Dec 2020 17:23:38 +0000 (UTC)
Date: Tue, 15 Dec 2020 18:23:37 +0100
From: Sergio Lopez <slp@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 2/4] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
Message-ID: <20201215172337.w7vcn2woze2ejgco@mhamilton>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-3-slp@redhat.com>
 <20201215121233.GD8185@merkur.fritz.box>
 <20201215131527.evpidxevevtfy54n@mhamilton>
 <20201215150119.GE8185@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201215150119.GE8185@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="smfgrrjgqasjiwvo"
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

--smfgrrjgqasjiwvo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 04:01:19PM +0100, Kevin Wolf wrote:
> Am 15.12.2020 um 14:15 hat Sergio Lopez geschrieben:
> > On Tue, Dec 15, 2020 at 01:12:33PM +0100, Kevin Wolf wrote:
> > > Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> > > > While processing the parents of a BDS, one of the parents may proce=
ss
> > > > the child that's doing the tail recursion, which leads to a BDS bei=
ng
> > > > processed twice. This is especially problematic for the aio_notifie=
rs,
> > > > as they might attempt to work on both the old and the new AIO
> > > > contexts.
> > > >=20
> > > > To avoid this, add the BDS pointer to the ignore list, and check th=
e
> > > > child BDS pointer while iterating over the children.
> > > >=20
> > > > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > >=20
> > > Ugh, so we get a mixed list of BdrvChild and BlockDriverState? :-/
> >=20
> > I know, it's effective but quite ugly...
> >=20
> > > What is the specific scenario where you saw this breaking? Did you ha=
ve
> > > multiple BdrvChild connections between two nodes so that we would go =
to
> > > the parent node through one and then come back to the child node thro=
ugh
> > > the other?
> >=20
> > I don't think this is a corner case. If the graph is walked top->down,
> > there's no problem since children are added to the ignore list before
> > getting processed, and siblings don't process each other. But, if the
> > graph is walked bottom->up, a BDS will start processing its parents
> > without adding itself to the ignore list, so there's nothing
> > preventing them from processing it again.
>=20
> I don't understand. child is added to ignore before calling the parent
> callback on it, so how can we come back through the same BdrvChild?
>=20
>     QLIST_FOREACH(child, &bs->parents, next_parent) {
>         if (g_slist_find(*ignore, child)) {
>             continue;
>         }
>         assert(child->klass->set_aio_ctx);
>         *ignore =3D g_slist_prepend(*ignore, child);
>         child->klass->set_aio_ctx(child, new_context, ignore);
>     }

Perhaps I'm missing something, but the way I understand it, that loop
is adding the BdrvChild pointer of each of its parents, but not the
BdrvChild pointer of the BDS that was passed as an argument to
b_s_a_c_i.

> You didn't dump the BdrvChild here. I think that would add some
> information on why we re-entered 0x555ee2fbf660. Maybe you can also add
> bs->drv->format_name for each node to make the scenario less abstract?

I've generated another trace with more data:

bs=3D0x565505e48030 (backup-top) enter
bs=3D0x565505e48030 (backup-top) processing children
bs=3D0x565505e48030 (backup-top) calling bsaci child=3D0x565505e42090 (chil=
d->bs=3D0x565505e5d420)
bs=3D0x565505e5d420 (qcow2) enter
bs=3D0x565505e5d420 (qcow2) processing children
bs=3D0x565505e5d420 (qcow2) calling bsaci child=3D0x565505e41ea0 (child->bs=
=3D0x565505e52060)
bs=3D0x565505e52060 (file) enter
bs=3D0x565505e52060 (file) processing children
bs=3D0x565505e52060 (file) processing parents
bs=3D0x565505e52060 (file) processing itself
bs=3D0x565505e5d420 (qcow2) processing parents
bs=3D0x565505e5d420 (qcow2) calling set_aio_ctx child=3D0x5655066a34d0
bs=3D0x565505fbf660 (qcow2) enter
bs=3D0x565505fbf660 (qcow2) processing children
bs=3D0x565505fbf660 (qcow2) calling bsaci child=3D0x565505e41d20 (child->bs=
=3D0x565506bc0c00)
bs=3D0x565506bc0c00 (file) enter
bs=3D0x565506bc0c00 (file) processing children
bs=3D0x565506bc0c00 (file) processing parents
bs=3D0x565506bc0c00 (file) processing itself
bs=3D0x565505fbf660 (qcow2) processing parents
bs=3D0x565505fbf660 (qcow2) calling set_aio_ctx child=3D0x565505fc7aa0
bs=3D0x565505fbf660 (qcow2) calling set_aio_ctx child=3D0x5655068b8510
bs=3D0x565505e48030 (backup-top) enter
bs=3D0x565505e48030 (backup-top) processing children
bs=3D0x565505e48030 (backup-top) calling bsaci child=3D0x565505e3c450 (chil=
d->bs=3D0x565505fbf660)
bs=3D0x565505fbf660 (qcow2) enter
bs=3D0x565505fbf660 (qcow2) processing children
bs=3D0x565505fbf660 (qcow2) processing parents
bs=3D0x565505fbf660 (qcow2) processing itself
bs=3D0x565505e48030 (backup-top) processing parents
bs=3D0x565505e48030 (backup-top) calling set_aio_ctx child=3D0x565505e402d0
bs=3D0x565505e48030 (backup-top) processing itself
bs=3D0x565505fbf660 (qcow2) processing itself


So it seems this is happening:

backup-top (5e48030) <---------| (5)
   |    |                      |
   |    | (6) ------------> qcow2 (5fbf660)
   |                           ^    |
   |                       (3) |    | (4)
   |-> (1) qcow2 (5e5d420) -----    |-> file (6bc0c00)
   |
   |-> (2) file (5e52060)

backup-top (5e48030), the BDS that was passed as argument in the first
bdrv_set_aio_context_ignore() call, is re-entered when qcow2 (5fbf660)
is processing its parents, and the latter is also re-entered when the
first one starts processing its children again.

Sergio.

--smfgrrjgqasjiwvo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/Y8RgACgkQ9GknjS8M
AjV8gA/6AzvhEg8xeUBjecxy67BEBGuQYW5n0uFMZ3eWYWc3rtBB2CEWtYIWwtc+
4D74Ez21djBsCAoS3AjQeeMQ6eGSRT7IP3A1g5FONqVqzgouny7jJMUfUgXe12lg
goBFlYA8eoYWB4lVHxLn1vbAImEyOkBg3c1DkMj+auBLkRS7cVGusvWGv8XYqQc5
Nnfu/6MYS2eT0K8noWtRMoccu8nPvAUJP6ijAhA7ktXonsS7B/+IdX0Ongfc0IdU
531DOnmQwm8P67V+EKj7pe5g/W/UKwfeeRbVvIMptUD0wktJfjQUuE9nqeG8iEm/
LH5KcLIZlM9S6EbQp2pXhYWBJR/g4jblbf8dyRYLi/Hv36LI5vQdSg+DghkyhvVp
3RSROZypQxVxBCb3W/5n4OIbpKEm87WnES2Lr5lyzy4QEKSjr6owi6EXP8WTfmU7
0+7HtStBZ51C84ZkvkneV7W9dGwCzzIrQyJ6aRnirwN6fVtrv65GUXkhi/ysln4x
N/j95DF1xZU8yawCKkrP7GY7clHOyYhhpeLvcEmn9mi9r2ypIAlRN7d2tfR5BKjH
cjkF6M5uq9gxrcLFjmLgAGo1f/D5S7T6qo3Pkt6gcuUX0R2SlP0PspN15y1aEjPF
8kiVA9FS+I/zXvLZ3R8Rt/sbZslb5/SNUP4Y1NnwYivDOmVOszI=
=8V3n
-----END PGP SIGNATURE-----

--smfgrrjgqasjiwvo--


