Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7DB33C7C3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:34:19 +0100 (CET)
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtur-0000ip-KA
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lLtsR-0008LX-3F
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:31:47 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:58331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lLts5-0006n7-T4
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:31:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.244])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7B6109079CD9;
 Mon, 15 Mar 2021 21:31:21 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 15 Mar
 2021 21:31:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002ec0c526e-364c-4533-b15b-4c282975d09e,
 C2FE56B6373390384040EEB24197F6B99D02A218) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 15 Mar 2021 21:31:19 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 8/9] hw/9pfs/9p-synth: Replaced qemu_mutex_lock with
 QEMU_LOCK_GUARD
Message-ID: <20210315213119.560e949e@bahia.lan>
In-Reply-To: <14052416.xYJ9m3zWAp@silver>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <CAD-LL6iS11_2Z1hFa9-Or6J4-X2fKfMhriRMby5G3VEZhhpf9w@mail.gmail.com>
 <20210313085121.625fe50e@bahia.lan> <14052416.xYJ9m3zWAp@silver>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 3f04ff20-840c-4091-affa-29fc79aca116
X-Ovh-Tracer-Id: 14130325306691656123
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvledgudegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepmhhsthesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 17:07:50 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Samstag, 13. M=C3=A4rz 2021 08:51:21 CET Greg Kurz wrote:
> > On Sat, 13 Mar 2021 07:43:38 +0200
> >=20
> > Mahmoud Mandour <ma.mandourr@gmail.com> wrote:
> > > Thanks for the fast review. I asked on the QEMU IRC channel
> > > before committing whether to put all the changes into one patch
> > > or split them and was instructed that it was better to split them up.
> > > But in any case I was open to both ways and you can decide
> > > on the best way to go.
> >=20
> > People only do inline replies here. Please don't top-post for the
> > sake of clarity.
> >=20
> > So, the instructions to split the patches is obviously the way to go. T=
he
> > question here is rather : will each subsystem maintainer pick up patches
> > from this series or will only one maintainer pick up all the patches af=
ter
> > they have been acked by the other maintainers ?
>=20
> We need a call here. :)
>=20
> Soft freeze is tomorrow, so will one submaintainer handle this series all=
=20
> together or should each submaintainer handle only their specific patches?
>=20

I see that some of Mahmoud's patches in Dave Gilbert's latest PR, so I
guess you can go ahead and merge this one in the 9p tree.

> > > On Thu, Mar 11, 2021 at 1:59 PM Christian Schoenebeck <
> > >=20
> > > qemu_oss@crudebyte.com> wrote:
> > > > On Donnerstag, 11. M=C3=A4rz 2021 12:52:45 CET Greg Kurz wrote:
> > > > > On Thu, 11 Mar 2021 11:49:06 +0100
> > > > >=20
> > > > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > > > On Donnerstag, 11. M=C3=A4rz 2021 04:15:37 CET Mahmoud Mandour =
wrote:
> > > > > > > Replaced a call to qemu_mutex_lock and its respective call to
> > > > > > > qemu_mutex_unlock and used QEMU_LOCK_GUARD macro in their pla=
ce.
> > > > > > > This simplifies the code by removing the call required to unl=
ock
> > > > > > > and also eliminates goto paths.
> > > > > > >=20
> > > > > > > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > > > > > > ---
> > > > > > >=20
> > > > > > >  hw/9pfs/9p-synth.c | 12 ++++--------
> > > > > > >  1 file changed, 4 insertions(+), 8 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> > > > > > > index 7eb210ffa8..473ef914b0 100644
> > > > > > > --- a/hw/9pfs/9p-synth.c
> > > > > > > +++ b/hw/9pfs/9p-synth.c
> > > > > > > @@ -79,11 +79,11 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode
> > > > > > > *parent,
> > > >=20
> > > > int
> > > >=20
> > > > > > > mode, if (!parent) {
> > > > > > >=20
> > > > > > >          parent =3D &synth_root;
> > > > > > >     =20
> > > > > > >      }
> > > > > > >=20
> > > > > > > -    qemu_mutex_lock(&synth_mutex);
> > > > > > > +    QEMU_LOCK_GUARD(&synth_mutex);
> > > > > > >=20
> > > > > > >      QLIST_FOREACH(tmp, &parent->child, sibling) {
> > > > > > >     =20
> > > > > > >          if (!strcmp(tmp->name, name)) {
> > > > > > >         =20
> > > > > > >              ret =3D EEXIST;
> > > > > > >=20
> > > > > > > -            goto err_out;
> > > > > > > +            return ret;
> > > > > > >=20
> > > > > > >          }
> > > > > > >     =20
> > > > > > >      }
> > > > > > >      /* Add the name */
> > > > > > >=20
> > > > > > > @@ -94,8 +94,6 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *pa=
rent,
> > > >=20
> > > > int
> > > >=20
> > > > > > > mode, node->attr, node->attr->inode);
> > > > > > >=20
> > > > > > >      *result =3D node;
> > > > > > >      ret =3D 0;
> > > > > > >=20
> > > > > > > -err_out:
> > > > > > > -    qemu_mutex_unlock(&synth_mutex);
> > > > > > >=20
> > > > > > >      return ret;
> > > > > > > =20
> > > > > > >  }
> > > > > > >=20
> > > > > > > @@ -116,11 +114,11 @@ int qemu_v9fs_synth_add_file(V9fsSynthN=
ode
> > > > > > > *parent,
> > > > > > > int mode, parent =3D &synth_root;
> > > > > > >=20
> > > > > > >      }
> > > > > > >=20
> > > > > > > -    qemu_mutex_lock(&synth_mutex);
> > > > > > > +    QEMU_LOCK_GUARD(&synth_mutex);
> > > > > > >=20
> > > > > > >      QLIST_FOREACH(tmp, &parent->child, sibling) {
> > > > > > >     =20
> > > > > > >          if (!strcmp(tmp->name, name)) {
> > > > > > >         =20
> > > > > > >              ret =3D EEXIST;
> > > > > > >=20
> > > > > > > -            goto err_out;
> > > > > > > +            return ret;
> > > > > > >=20
> > > > > > >          }
> > > > > > >     =20
> > > > > > >      }
> > > > > > >      /* Add file type and remove write bits */
> > > > > > >=20
> > > > > > > @@ -136,8 +134,6 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode
> > > >=20
> > > > *parent,
> > > >=20
> > > > > > > int
> > > > > > > mode, pstrcpy(node->name, sizeof(node->name), name);
> > > > > > >=20
> > > > > > >      QLIST_INSERT_HEAD_RCU(&parent->child, node, sibling);
> > > > > > >      ret =3D 0;
> > > > > > >=20
> > > > > > > -err_out:
> > > > > > > -    qemu_mutex_unlock(&synth_mutex);
> > > > > > >=20
> > > > > > >      return ret;
> > > > > > > =20
> > > > > > >  }
> > > > > >=20
> > > > > > Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > > >=20
> > > > > > Greg, I suggest I'll push this onto my queue as you seem to be =
busy.
> > > > >=20
> > > > > This cleanup spans over multiple subsystems but I think it makes =
more
> > > > > sense to keep all these patches together. Let's wait for everyone=
 to
> > > > > ack/review and then we'll decide how to merge the patches.
> > > >=20
> > > > Sure, makes sense.
>=20
>=20
>=20


