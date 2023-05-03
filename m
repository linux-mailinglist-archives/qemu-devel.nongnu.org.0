Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47176F58C1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:13:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puCHr-0002Vf-2q; Wed, 03 May 2023 09:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1puCHj-0002QJ-Eq
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1puCHh-0004J1-JX
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683119561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MvTBKYXxzCnGpUAnqw7NUl7Kpg6AmIw7nyBP3ZgVcq8=;
 b=iqUIPMLWvVnp/4Gp7FUidiwWhr/F4Z/ywKAlIvp6pAgHnHTnhBqBkJXCa9+yyNAGFLyMfU
 ZSPvh70ivnRYrBlFUsvsfjI2qckHojtQ2HIWua6FfG/RusZ43etiVL/a0nkx4uKOzJmhtc
 /yDsbxJlpdlhraLdxu1POHoCPdgF+30=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-nouLQjL3P5uWvchsYPzZzg-1; Wed, 03 May 2023 09:12:37 -0400
X-MC-Unique: nouLQjL3P5uWvchsYPzZzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4C4B38173C1;
 Wed,  3 May 2023 13:12:36 +0000 (UTC)
Received: from localhost (unknown [10.39.195.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3686B40C6E68;
 Wed,  3 May 2023 13:12:35 +0000 (UTC)
Date: Wed, 3 May 2023 09:12:34 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: Re: [PATCH v4 03/20] virtio-scsi: avoid race between unplug and
 transport event
Message-ID: <20230503131234.GC757667@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-4-stefanha@redhat.com>
 <ZFEqEkG4ktn9bBFN@redhat.com> <20230502185624.GA535070@fedora>
 <ZFIUue5ouDtch31y@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hRXnVXzvq+032LBu"
Content-Disposition: inline
In-Reply-To: <ZFIUue5ouDtch31y@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--hRXnVXzvq+032LBu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2023 at 10:00:57AM +0200, Kevin Wolf wrote:
> Am 02.05.2023 um 20:56 hat Stefan Hajnoczi geschrieben:
> > On Tue, May 02, 2023 at 05:19:46PM +0200, Kevin Wolf wrote:
> > > Am 25.04.2023 um 19:26 hat Stefan Hajnoczi geschrieben:
> > > > Only report a transport reset event to the guest after the SCSIDevi=
ce
> > > > has been unrealized by qdev_simple_device_unplug_cb().
> > > >=20
> > > > qdev_simple_device_unplug_cb() sets the SCSIDevice's qdev.realized =
field
> > > > to false so that scsi_device_find/get() no longer see it.
> > > >=20
> > > > scsi_target_emulate_report_luns() also needs to be updated to filte=
r out
> > > > SCSIDevices that are unrealized.
> > > >=20
> > > > These changes ensure that the guest driver does not see the SCSIDev=
ice
> > > > that's being unplugged if it responds very quickly to the transport
> > > > reset event.
> > > >=20
> > > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > > Reviewed-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > >=20
> > > > @@ -1082,6 +1073,15 @@ static void virtio_scsi_hotunplug(HotplugHan=
dler *hotplug_dev, DeviceState *dev,
> > > >          blk_set_aio_context(sd->conf.blk, qemu_get_aio_context(), =
NULL);
> > > >          virtio_scsi_release(s);
> > > >      }
> > > > +
> > > > +    if (virtio_vdev_has_feature(vdev, VIRTIO_SCSI_F_HOTPLUG)) {
> > > > +        virtio_scsi_acquire(s);
> > > > +        virtio_scsi_push_event(s, sd,
> > > > +                               VIRTIO_SCSI_T_TRANSPORT_RESET,
> > > > +                               VIRTIO_SCSI_EVT_RESET_REMOVED);
> > > > +        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED)=
);
> > > > +        virtio_scsi_release(s);
> > > > +    }
> > > >  }
> > >=20
> > > s, sd and s->bus are all unrealized at this point, whereas before this
> > > patch they were still realized. I couldn't find any practical problem
> > > with it, but it made me nervous enough that I thought I should comment
> > > on it at least.
> > >=20
> > > Should we maybe have documentation on these functions that says that
> > > they accept unrealized objects as their parameters?
> >=20
> > s is the VirtIOSCSI controller, not the SCSIDevice that is being
> > unplugged. The VirtIOSCSI controller is still realized.
> >=20
> > s->bus is the VirtIOSCSI controller's bus, it is still realized.
>=20
> You're right, I misread this part.
>=20
> > You are right that the SCSIDevice (sd) has been unrealized at this
> > point:
> > - sd->conf.blk is safe because qdev properties stay alive the
> >   Object is deleted, but I'm not sure we should rely on that.
>=20
> This feels relatively safe (and it's preexisting anyway), reading a
> property doesn't do anything unpredictable and we know the pointer is
> still valid.
>=20
> > - virti_scsi_push_event(.., sd, ...) is questionable because the LUN
> >   that's fetched from sd no longer belongs to the unplugged SCSIDevice.
>=20
> This call is what made me nervous.
>=20
> > How about I change the code to fetch sd->conf.blk and the LUN before
> > unplugging?
>=20
> You mean passing sd->id and sd->lun to virtio_scsi_push_event() instead
> of sd itself? That would certainly look cleaner and make sure that we
> don't later add code to it that does something with sd that would
> require it to be realized.

Yes, I'll do that in the next revision.

Stefan

--hRXnVXzvq+032LBu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRSXcIACgkQnKSrs4Gr
c8iBrQgAnO/r1Kps6Svp0/9nUqUx3S65i1XwWIAK1IbuFqWP6Nq2R+xecFEdmAUN
8f6QyslrUI1EnQ9qXoMRagSDc8iw5CBtA9CtPTg/32uRelh111GM85U3uYvhBlGY
dd9GPbB17c/u2Y2CuxBrfc2w2TpDgp0tazuXiQHYO1drrGYyyZu73XdGF+W4DChc
Gvk2FofPZ7luLv/kcZvR9UAn9hmBHXpLjByS2XM4QxB+1qXKMYnac6NPl5Icr14H
1TIthHvPJkBklFGrMFyz7CFIYzMIdqFYWT74NpSeEveAODZMxWuZ8JVZtdLIbC6q
ZK0P/CdfiC3AKLh1BYuQFDGdrkDJWQ==
=7qbb
-----END PGP SIGNATURE-----

--hRXnVXzvq+032LBu--


