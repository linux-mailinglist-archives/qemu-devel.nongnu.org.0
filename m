Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9AF6F5284
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:02:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu7QL-0005La-Ku; Wed, 03 May 2023 04:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pu7QJ-0005DZ-6F
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:01:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pu7QD-00032g-5R
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:01:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683100868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GJwJ5SBwqAyYWEb432D7rKlgjx5C7ieltMZT2oWDkb8=;
 b=XCP701fKHk1RM2h7hVaNg9VxRqdrMt32+k93Dg698yKzc3HyQXSWf6LUFzIoxKoPAm9C+9
 Hde9xhlZpW8rlc+gdJjCzIGRSIzY7KFlyF9c4DRab7Yqyj0vPsEXgrFD+u3Idbbk178Kjl
 qmgXk9Jl3A92imTPH2RQoqJ9B1VzKwY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-h_zbahIaOUiVHVIBwANCXg-1; Wed, 03 May 2023 04:01:03 -0400
X-MC-Unique: h_zbahIaOUiVHVIBwANCXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0BEB381D4CB;
 Wed,  3 May 2023 08:01:01 +0000 (UTC)
Received: from redhat.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B0B4C15BAE;
 Wed,  3 May 2023 08:00:58 +0000 (UTC)
Date: Wed, 3 May 2023 10:00:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
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
Message-ID: <ZFIUue5ouDtch31y@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-4-stefanha@redhat.com>
 <ZFEqEkG4ktn9bBFN@redhat.com> <20230502185624.GA535070@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j7CkwuFkyJz+LKdb"
Content-Disposition: inline
In-Reply-To: <20230502185624.GA535070@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--j7CkwuFkyJz+LKdb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 02.05.2023 um 20:56 hat Stefan Hajnoczi geschrieben:
> On Tue, May 02, 2023 at 05:19:46PM +0200, Kevin Wolf wrote:
> > Am 25.04.2023 um 19:26 hat Stefan Hajnoczi geschrieben:
> > > Only report a transport reset event to the guest after the SCSIDevice
> > > has been unrealized by qdev_simple_device_unplug_cb().
> > >=20
> > > qdev_simple_device_unplug_cb() sets the SCSIDevice's qdev.realized fi=
eld
> > > to false so that scsi_device_find/get() no longer see it.
> > >=20
> > > scsi_target_emulate_report_luns() also needs to be updated to filter =
out
> > > SCSIDevices that are unrealized.
> > >=20
> > > These changes ensure that the guest driver does not see the SCSIDevice
> > > that's being unplugged if it responds very quickly to the transport
> > > reset event.
> > >=20
> > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > Reviewed-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> >=20
> > > @@ -1082,6 +1073,15 @@ static void virtio_scsi_hotunplug(HotplugHandl=
er *hotplug_dev, DeviceState *dev,
> > >          blk_set_aio_context(sd->conf.blk, qemu_get_aio_context(), NU=
LL);
> > >          virtio_scsi_release(s);
> > >      }
> > > +
> > > +    if (virtio_vdev_has_feature(vdev, VIRTIO_SCSI_F_HOTPLUG)) {
> > > +        virtio_scsi_acquire(s);
> > > +        virtio_scsi_push_event(s, sd,
> > > +                               VIRTIO_SCSI_T_TRANSPORT_RESET,
> > > +                               VIRTIO_SCSI_EVT_RESET_REMOVED);
> > > +        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
> > > +        virtio_scsi_release(s);
> > > +    }
> > >  }
> >=20
> > s, sd and s->bus are all unrealized at this point, whereas before this
> > patch they were still realized. I couldn't find any practical problem
> > with it, but it made me nervous enough that I thought I should comment
> > on it at least.
> >=20
> > Should we maybe have documentation on these functions that says that
> > they accept unrealized objects as their parameters?
>=20
> s is the VirtIOSCSI controller, not the SCSIDevice that is being
> unplugged. The VirtIOSCSI controller is still realized.
>=20
> s->bus is the VirtIOSCSI controller's bus, it is still realized.

You're right, I misread this part.

> You are right that the SCSIDevice (sd) has been unrealized at this
> point:
> - sd->conf.blk is safe because qdev properties stay alive the
>   Object is deleted, but I'm not sure we should rely on that.

This feels relatively safe (and it's preexisting anyway), reading a
property doesn't do anything unpredictable and we know the pointer is
still valid.

> - virti_scsi_push_event(.., sd, ...) is questionable because the LUN
>   that's fetched from sd no longer belongs to the unplugged SCSIDevice.

This call is what made me nervous.

> How about I change the code to fetch sd->conf.blk and the LUN before
> unplugging?

You mean passing sd->id and sd->lun to virtio_scsi_push_event() instead
of sd itself? That would certainly look cleaner and make sure that we
don't later add code to it that does something with sd that would
require it to be realized.

Kevin

--j7CkwuFkyJz+LKdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmRSFLkACgkQfwmycsiP
L9ai9hAAhKY0YAEhZNY7SY5b0lE/PTJpz63IpPn12rH1l8oQFgwUK5larJcxRmnG
2dC+TkTReWSEiF5cs3ubVy72RpQtzO6TcBLneAPFoxj5cSVZ9KQG2CWZhdC51snx
+CIjJT5P818w0gd5YDlLPKvh9O+L9Uw6ljR3gJxPUuO13q3RwypT14PSCaeccr6k
mTbLr4iBx+4tUJ7SR5fBA+vwaoIj1XbGBvx97AlyI2yQ2wSz0e70ZLXXArNorUil
eyhXmh+aWYELab95fkGlqYWu1vz0YLhHCdsD5pSzQa8SSvlQ+WqMdt7mXm7zW2wp
tpGcAV7Ew/HDfCTINHWqSAED+csbdqvSk4Ujh+RevUmgQPSAr/SiX6477WIIVec8
xxjWlwskBs1OjGhPUhVISdOqG/bad/oHR2RJeEam1FeStFppDSw0up5Z+FDRwZK0
M0sQog8eLqLvCkb7/pdH0w838xTDieVOCJ2aKIGcKvEkmSBALduzeuBdDMo/Vjz4
UM1oM3jw4oCQhL2GUaz23sDbMtkbTRK0/DgPB1qK7Qxa1qA+fI+CHBbYgyaYzPpi
yIy2K+p2yGUuym35lFyOsfPjESFTOyaiKsrTG6cm/ZB3IymCGjfQ5R4UgObfeVkw
+aS2yboG/lBZzkxo1Hc6vHcC8NHMztxT2zfjD9EfzLnyQzc9TYM=
=hjg/
-----END PGP SIGNATURE-----

--j7CkwuFkyJz+LKdb--


