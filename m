Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C0833C14F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:12:46 +0100 (CET)
Received: from localhost ([::1]:57726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLppk-000891-O6
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lLpli-0005tN-Rf
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:08:35 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:42883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lLplg-0007Ln-D6
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=5/aLjHg5LG9OoCNVgeYhfRtED3+mqJBrtOwAljAe2cY=; b=HJhZUWJV3Z7+dC0tg13Wbj78Bb
 5aQRqrxfLn23bh1H0Lv7MJjE0hbQTDYu2miiP7lFRLnpOsaN3mtRsyPAi/bUUTXsFhn4HVqgoDqGk
 3uuHtR8w1hXubTqvYRrj/sElZIX1S09joXBPDLRw8ULvw0LjY5ax+3W/zepZQux2ZJHgsbYPW/yks
 pkEKhXwu08baeRRTX789r2GirNk9em4aupkUOVaY1SXInjYrLeUyEX27nQAQ5ply+Z8kNuNtRlYqJ
 +BTueFfzm6PJcoFUoZrtwcE0pZ2ZmA8tXwi3bQhLjSa/FnW+6PxdgVLvfNfjaPQFEVJBU1Uh3HMKf
 9VxpDVAZa7lrtA8CoDO5/TYq+2zC6chzpzbQGxYIdUkjeKLIhY9sOOSvzvuW2zREBSngKCGu5dmhN
 88VZLCIZ3TEETibIudcgrZNHtWCflFE2LkoSy1Ue9p+sEkwurL3Qy1jnYdEgCCWeU6wHfc3NCD9S1
 Pop5OddjyFY7YQjhWdH2EKVD2bXHMspZoZ1uyjRdf0F3dmtvkkM6H/ZAn6wN0eQvbrU/k/IcsAe50
 wjd6tDJCiOMbzzz1ZwWKVZ7GLEXPNU/71oc+fGY3nIcnKGi8MvEKPqrWCoy3XJoz6z4Pp8kfuVziz
 J9E3br82VgP3YhyxPK95PCl3F+NMeo8/A02TEUVak=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 8/9] hw/9pfs/9p-synth: Replaced qemu_mutex_lock with
 QEMU_LOCK_GUARD
Date: Mon, 15 Mar 2021 17:07:50 +0100
Message-ID: <14052416.xYJ9m3zWAp@silver>
In-Reply-To: <20210313085121.625fe50e@bahia.lan>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <CAD-LL6iS11_2Z1hFa9-Or6J4-X2fKfMhriRMby5G3VEZhhpf9w@mail.gmail.com>
 <20210313085121.625fe50e@bahia.lan>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Samstag, 13. M=E4rz 2021 08:51:21 CET Greg Kurz wrote:
> On Sat, 13 Mar 2021 07:43:38 +0200
>=20
> Mahmoud Mandour <ma.mandourr@gmail.com> wrote:
> > Thanks for the fast review. I asked on the QEMU IRC channel
> > before committing whether to put all the changes into one patch
> > or split them and was instructed that it was better to split them up.
> > But in any case I was open to both ways and you can decide
> > on the best way to go.
>=20
> People only do inline replies here. Please don't top-post for the
> sake of clarity.
>=20
> So, the instructions to split the patches is obviously the way to go. The
> question here is rather : will each subsystem maintainer pick up patches
> from this series or will only one maintainer pick up all the patches after
> they have been acked by the other maintainers ?

We need a call here. :)

Soft freeze is tomorrow, so will one submaintainer handle this series all=20
together or should each submaintainer handle only their specific patches?

> > On Thu, Mar 11, 2021 at 1:59 PM Christian Schoenebeck <
> >=20
> > qemu_oss@crudebyte.com> wrote:
> > > On Donnerstag, 11. M=E4rz 2021 12:52:45 CET Greg Kurz wrote:
> > > > On Thu, 11 Mar 2021 11:49:06 +0100
> > > >=20
> > > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > > On Donnerstag, 11. M=E4rz 2021 04:15:37 CET Mahmoud Mandour wrote:
> > > > > > Replaced a call to qemu_mutex_lock and its respective call to
> > > > > > qemu_mutex_unlock and used QEMU_LOCK_GUARD macro in their place.
> > > > > > This simplifies the code by removing the call required to unlock
> > > > > > and also eliminates goto paths.
> > > > > >=20
> > > > > > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > > > > > ---
> > > > > >=20
> > > > > >  hw/9pfs/9p-synth.c | 12 ++++--------
> > > > > >  1 file changed, 4 insertions(+), 8 deletions(-)
> > > > > >=20
> > > > > > diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> > > > > > index 7eb210ffa8..473ef914b0 100644
> > > > > > --- a/hw/9pfs/9p-synth.c
> > > > > > +++ b/hw/9pfs/9p-synth.c
> > > > > > @@ -79,11 +79,11 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode
> > > > > > *parent,
> > >=20
> > > int
> > >=20
> > > > > > mode, if (!parent) {
> > > > > >=20
> > > > > >          parent =3D &synth_root;
> > > > > >     =20
> > > > > >      }
> > > > > >=20
> > > > > > -    qemu_mutex_lock(&synth_mutex);
> > > > > > +    QEMU_LOCK_GUARD(&synth_mutex);
> > > > > >=20
> > > > > >      QLIST_FOREACH(tmp, &parent->child, sibling) {
> > > > > >     =20
> > > > > >          if (!strcmp(tmp->name, name)) {
> > > > > >         =20
> > > > > >              ret =3D EEXIST;
> > > > > >=20
> > > > > > -            goto err_out;
> > > > > > +            return ret;
> > > > > >=20
> > > > > >          }
> > > > > >     =20
> > > > > >      }
> > > > > >      /* Add the name */
> > > > > >=20
> > > > > > @@ -94,8 +94,6 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *pare=
nt,
> > >=20
> > > int
> > >=20
> > > > > > mode, node->attr, node->attr->inode);
> > > > > >=20
> > > > > >      *result =3D node;
> > > > > >      ret =3D 0;
> > > > > >=20
> > > > > > -err_out:
> > > > > > -    qemu_mutex_unlock(&synth_mutex);
> > > > > >=20
> > > > > >      return ret;
> > > > > > =20
> > > > > >  }
> > > > > >=20
> > > > > > @@ -116,11 +114,11 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode
> > > > > > *parent,
> > > > > > int mode, parent =3D &synth_root;
> > > > > >=20
> > > > > >      }
> > > > > >=20
> > > > > > -    qemu_mutex_lock(&synth_mutex);
> > > > > > +    QEMU_LOCK_GUARD(&synth_mutex);
> > > > > >=20
> > > > > >      QLIST_FOREACH(tmp, &parent->child, sibling) {
> > > > > >     =20
> > > > > >          if (!strcmp(tmp->name, name)) {
> > > > > >         =20
> > > > > >              ret =3D EEXIST;
> > > > > >=20
> > > > > > -            goto err_out;
> > > > > > +            return ret;
> > > > > >=20
> > > > > >          }
> > > > > >     =20
> > > > > >      }
> > > > > >      /* Add file type and remove write bits */
> > > > > >=20
> > > > > > @@ -136,8 +134,6 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode
> > >=20
> > > *parent,
> > >=20
> > > > > > int
> > > > > > mode, pstrcpy(node->name, sizeof(node->name), name);
> > > > > >=20
> > > > > >      QLIST_INSERT_HEAD_RCU(&parent->child, node, sibling);
> > > > > >      ret =3D 0;
> > > > > >=20
> > > > > > -err_out:
> > > > > > -    qemu_mutex_unlock(&synth_mutex);
> > > > > >=20
> > > > > >      return ret;
> > > > > > =20
> > > > > >  }
> > > > >=20
> > > > > Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > >=20
> > > > > Greg, I suggest I'll push this onto my queue as you seem to be bu=
sy.
> > > >=20
> > > > This cleanup spans over multiple subsystems but I think it makes mo=
re
> > > > sense to keep all these patches together. Let's wait for everyone to
> > > > ack/review and then we'll decide how to merge the patches.
> > >=20
> > > Sure, makes sense.




