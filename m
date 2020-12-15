Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA5A2DADE4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 14:18:28 +0100 (CET)
Received: from localhost ([::1]:38562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpADj-0000AQ-7q
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 08:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kpAB8-0007xK-Cp
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:15:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kpAB4-0004qf-Np
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608038142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z79n8v+sbiSgNAX7d3rn1sXk7k+bJlB46c28y6qkcZQ=;
 b=RDxxXZ9yv4QDXgX4cczT+UBWL7qj1MTfvYNpRRu5iOFmKIn8ffwY0FNr1PTCiqHfhWnqDh
 1FU67PhlMnJvYXZuMI7dkhNIFgmsc7f3HzCudc4GJRxITnS0Yf7L8LpjDt0up6baMsX0AH
 +PxKNy8vIlhePYro1ZyE5FPRax/OhIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-udzab7_jMkuYDONNk2Yxlw-1; Tue, 15 Dec 2020 08:15:38 -0500
X-MC-Unique: udzab7_jMkuYDONNk2Yxlw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D398102CB29;
 Tue, 15 Dec 2020 13:15:36 +0000 (UTC)
Received: from localhost (ovpn-114-253.rdu2.redhat.com [10.10.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB18010013C1;
 Tue, 15 Dec 2020 13:15:28 +0000 (UTC)
Date: Tue, 15 Dec 2020 14:15:27 +0100
From: Sergio Lopez <slp@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 2/4] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
Message-ID: <20201215131527.evpidxevevtfy54n@mhamilton>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-3-slp@redhat.com>
 <20201215121233.GD8185@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201215121233.GD8185@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mgsiejcqqudu3t6r"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--mgsiejcqqudu3t6r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 01:12:33PM +0100, Kevin Wolf wrote:
> Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> > While processing the parents of a BDS, one of the parents may process
> > the child that's doing the tail recursion, which leads to a BDS being
> > processed twice. This is especially problematic for the aio_notifiers,
> > as they might attempt to work on both the old and the new AIO
> > contexts.
> >=20
> > To avoid this, add the BDS pointer to the ignore list, and check the
> > child BDS pointer while iterating over the children.
> >=20
> > Signed-off-by: Sergio Lopez <slp@redhat.com>
>=20
> Ugh, so we get a mixed list of BdrvChild and BlockDriverState? :-/

I know, it's effective but quite ugly...

> What is the specific scenario where you saw this breaking? Did you have
> multiple BdrvChild connections between two nodes so that we would go to
> the parent node through one and then come back to the child node through
> the other?

I don't think this is a corner case. If the graph is walked top->down,
there's no problem since children are added to the ignore list before
getting processed, and siblings don't process each other. But, if the
graph is walked bottom->up, a BDS will start processing its parents
without adding itself to the ignore list, so there's nothing
preventing them from processing it again.

I'm pasting here an annotated trace of bdrv_set_aio_context_ignore I
generated while triggering the issue:

<----- begin ------>
bdrv_set_aio_context_ignore: bs=3D0x555ee2e48030 enter
bdrv_set_aio_context_ignore: bs=3D0x555ee2e48030 processing children
bdrv_set_aio_context_ignore: bs=3D0x555ee2e5d420 enter
bdrv_set_aio_context_ignore: bs=3D0x555ee2e5d420 processing children
bdrv_set_aio_context_ignore: bs=3D0x555ee2e52060 enter
bdrv_set_aio_context_ignore: bs=3D0x555ee2e52060 processing children
bdrv_set_aio_context_ignore: bs=3D0x555ee2e52060 processing parents
bdrv_set_aio_context_ignore: bs=3D0x555ee2e52060 processing itself
bdrv_set_aio_context_ignore: bs=3D0x555ee2e5d420 processing parents

 - We enter b_s_a_c_i with BDS 2fbf660 the first time:
=20
bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 enter
bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 processing children

 - We enter b_s_a_c_i with BDS 3bc0c00, a child of 2fbf660:
=20
bdrv_set_aio_context_ignore: bs=3D0x555ee3bc0c00 enter
bdrv_set_aio_context_ignore: bs=3D0x555ee3bc0c00 processing children
bdrv_set_aio_context_ignore: bs=3D0x555ee3bc0c00 processing parents
bdrv_set_aio_context_ignore: bs=3D0x555ee3bc0c00 processing itself

 - We start processing its parents:
=20
bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 processing parents

 - We enter b_s_a_c_i with BDS 2e48030, a parent of 2fbf660:
=20
bdrv_set_aio_context_ignore: bs=3D0x555ee2e48030 enter
bdrv_set_aio_context_ignore: bs=3D0x555ee2e48030 processing children

 - We enter b_s_a_c_i with BDS 2fbf660 again, because of parent
   2e48030 didn't found us it in the ignore list:
  =20
bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 enter
bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 processing children
bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 processing parents
bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 processing itself
bdrv_set_aio_context_ignore: bs=3D0x555ee2e48030 processing parents
bdrv_set_aio_context_ignore: bs=3D0x555ee2e48030 processing itself

 - BDS 2fbf660 will be processed here a second time, triggering the
   issue:
  =20
bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 processing itself
<----- end ------>

I suspect this has been happening for a while, and has only surfaced
now due to the need to run an AIO context BH in an aio_notifier
function that the "nbd/server: Quiesce coroutines on context switch"
patch introduces. There the problem is that the first time the
aio_notifier AIO detach function is called, it works on the old
context (as it should be), and the second one works on the new context
(which is wrong).

> Maybe if what we really need to do is not processing every edge once,
> but processing every node once, the list should be changed to contain
> _only_ BDS objects. But then blk_do_set_aio_context() probably won't
> work any more because it can't have blk->root ignored any more...

I tried that in my first attempt and it broke badly. I didn't take a
deeper look at the causes.

> Anyway, if we end up changing what the list contains, the comment needs
> an update, too. Currently it says:
>=20
>  * @ignore will accumulate all visited BdrvChild object. The caller is
>  * responsible for freeing the list afterwards.
>=20
> Another option: Split the parents QLIST_FOREACH loop in two. First add
> all parent BdrvChild objects to the ignore list, remember which of them
> were newly added, and only after adding all of them call
> child->klass->set_aio_ctx() for each parent that was previously not on
> the ignore list. This will avoid that we come back to the same node
> because all of its incoming edges are ignored now.

I don't think this strategy will fix the issue illustrated in the
trace above, as the BdrvChild pointer of the BDS processing its
parents won't be the on ignore list by the time one of its parents
starts processing its own children.

Thanks,
Sergio.

> >  block.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/block.c b/block.c
> > index f1cedac362..bc8a66ab6e 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -6465,12 +6465,17 @@ void bdrv_set_aio_context_ignore(BlockDriverSta=
te *bs,
> >      bdrv_drained_begin(bs);
> > =20
> >      QLIST_FOREACH(child, &bs->children, next) {
> > -        if (g_slist_find(*ignore, child)) {
> > +        if (g_slist_find(*ignore, child) || g_slist_find(*ignore, chil=
d->bs)) {
> >              continue;
> >          }
> >          *ignore =3D g_slist_prepend(*ignore, child);
> >          bdrv_set_aio_context_ignore(child->bs, new_context, ignore);
> >      }
> > +    /*
> > +     * Add a reference to this BS to the ignore list, so its
> > +     * parents won't attempt to process it again.
> > +     */
> > +    *ignore =3D g_slist_prepend(*ignore, bs);
> >      QLIST_FOREACH(child, &bs->parents, next_parent) {
> >          if (g_slist_find(*ignore, child)) {
> >              continue;
> > --=20
> > 2.26.2
> >=20
>=20

--mgsiejcqqudu3t6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/YtuwACgkQ9GknjS8M
AjWu7xAAtCuMZM0F+PLvGZwJNfkdkzIwymByhID9/nb2Bp3OB/76uSBeJebeTJpB
/PywhpZAso5RaRygiZRn0v0Fbo8dvPSlk4nyFkqJRCHITQaAYsh/bQaznQ7LdUBo
3r0HVQ78H1QBVEmWxkQNa/XajGaPXyMj8ShWCvKMJAkNHH2FRMXYF5bz8vn5P7tD
98zQpArgME/Ai7knKEOMsbhrp4TxNlmWAw0qtUeOmFoYqJFjhgOM1ZzbI52jbA2K
SKcPh3moULw53+UOqiIyw4iUvQTR611ozA+sHxIuSXJq2D29P6c0q2ozanAxnm4c
9ejn3EPH3ynMMPMBh/c/vJcMHwgIacPQFdv7nOu5zPkwTwHhn6hOle/Spre+Sd6Y
hPSBWMB5JHFBAhsufxcsenTwXbFpXurBrhtxI/hlO+izV+bR7masSjahtlwTyJug
BnRtQu0ZRXiFZna5XicNeOGruwj09hF0kCrQ3U8x5X9BuNFwiGawZHAvrSMYpb2l
4GNwfBHBaXFthu1wjmCk6JayH9JfOk3p+JdDhFAZzNOTCPiMwJ56QQt7KCCiu38R
+RL977/C3VH/Y+Gzbdm0EtaMiNUa3jKnCgeiPiylJUAo6TXIoMdPAvzvdbMcV5ZT
kMRSR4oY5a99W9ai1fzZWqpvQ4H6O7MHgqTu0Y0coGnh4ZuHUtk=
=lne5
-----END PGP SIGNATURE-----

--mgsiejcqqudu3t6r--


