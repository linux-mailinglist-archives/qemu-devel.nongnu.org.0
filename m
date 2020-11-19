Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA592B9965
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 18:42:42 +0100 (CET)
Received: from localhost ([::1]:60208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfnxB-0007pl-7E
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 12:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kfnw7-0007OF-V2
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:41:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kfnw5-0004nU-3r
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:41:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605807692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7Bjm34hEll8fa3YsD6yCHLabQOWQPX60ow+irsuV44=;
 b=fuxzCAWKMtIDbzXjtIRYlvwuc/o5LvP2x/H0b6MTmr9Ft2LDv3uQ95k+7DA5XU3SxwTTP5
 7rwbw5Y2g8rL057DM0ZEghT7xajRIQ454jC3rBAupQdYpiBcQEbaLAV+QK6Wqg0bnvBF2w
 GsKhjeMx9PZ6xXYz88gkmEsb030mfvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-s5B1lekfNumiZF8C3B-6zA-1; Thu, 19 Nov 2020 12:41:30 -0500
X-MC-Unique: s5B1lekfNumiZF8C3B-6zA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 400CE1858EC6;
 Thu, 19 Nov 2020 17:41:28 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E1E910021B3;
 Thu, 19 Nov 2020 17:41:27 +0000 (UTC)
Date: Thu, 19 Nov 2020 10:41:27 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH RFC] vfio: Move the saving of the config space to the
 right place in VFIO migration
Message-ID: <20201119104127.5e243efa@w520.home>
In-Reply-To: <860bd707-8862-2584-6e12-67c86f092dba@nvidia.com>
References: <20201114091731.157-1-lushenming@huawei.com>
 <860bd707-8862-2584-6e12-67c86f092dba@nvidia.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Neo Jia <cjia@nvidia.com>, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, dgilbert@redhat.com,
 Shenming Lu <lushenming@huawei.com>, qemu-arm@nongnu.org, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020 14:13:24 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> On 11/14/2020 2:47 PM, Shenming Lu wrote:
> > When running VFIO migration, I found that the restoring of VFIO PCI dev=
ice=E2=80=99s
> > config space is before VGIC on ARM64 target. But generally, interrupt c=
ontrollers
> > need to be restored before PCI devices.  =20
>=20
> Is there any other way by which VGIC can be restored before PCI device?
>=20
> > Besides, if a VFIO PCI device is
> > configured to have directly-injected MSIs (VLPIs), the restoring of its=
 config
> > space will trigger the configuring of these VLPIs (in kernel), where it=
 would
> > return an error as I saw due to the dependency on kvm=E2=80=99s vgic.
> >  =20
>=20
> Can this be fixed in kernel to re-initialize the kernel state?
>=20
> > To avoid this, we can move the saving of the config space from the iter=
able
> > process to the non-iterable process, so that it will be called after VG=
IC
> > according to their priorities.
> >  =20
>=20
> With this change, at resume side, pre-copy phase data would reach=20
> destination without restored config space. VFIO device on destination=20
> might need it's config space setup and validated before it can accept=20
> further VFIO device specific migration state.
>=20
> This also changes bit-stream, so it would break migration with original=
=20
> migration patch-set.

Config space can continue to change while in pre-copy, if we're only
sending config space at the initiation of pre-copy, how are any changes
that might occur before the VM is stopped conveyed to the target?  For
example the guest might reboot and a device returned to INTx mode from
MSI during pre-copy.  Thanks,

Alex


> > Signed-off-by: Shenming Lu <lushenming@huawei.com>
> > ---
> >   hw/vfio/migration.c | 22 ++++++----------------
> >   1 file changed, 6 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> > index 3ce285ea39..028da35a25 100644
> > --- a/hw/vfio/migration.c
> > +++ b/hw/vfio/migration.c
> > @@ -351,7 +351,7 @@ static int vfio_update_pending(VFIODevice *vbasedev=
)
> >       return 0;
> >   }
> >  =20
> > -static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
> > +static void vfio_save_device_config_state(QEMUFile *f, void *opaque)
> >   {
> >       VFIODevice *vbasedev =3D opaque;
> >  =20
> > @@ -365,13 +365,14 @@ static int vfio_save_device_config_state(QEMUFile=
 *f, void *opaque)
> >  =20
> >       trace_vfio_save_device_config_state(vbasedev->name);
> >  =20
> > -    return qemu_file_get_error(f);
> > +    if (qemu_file_get_error(f))
> > +        error_report("%s: Failed to save device config space",
> > +                     vbasedev->name);
> >   }
> >  =20
> >   static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
> >   {
> >       VFIODevice *vbasedev =3D opaque;
> > -    uint64_t data;
> >  =20
> >       if (vbasedev->ops && vbasedev->ops->vfio_load_config) {
> >           int ret;
> > @@ -384,15 +385,8 @@ static int vfio_load_device_config_state(QEMUFile =
*f, void *opaque)
> >           }
> >       }
> >  =20
> > -    data =3D qemu_get_be64(f);
> > -    if (data !=3D VFIO_MIG_FLAG_END_OF_STATE) {
> > -        error_report("%s: Failed loading device config space, "
> > -                     "end flag incorrect 0x%"PRIx64, vbasedev->name, d=
ata);
> > -        return -EINVAL;
> > -    }
> > -
> >       trace_vfio_load_device_config_state(vbasedev->name);
> > -    return qemu_file_get_error(f);
> > +    return 0;
> >   }
> >  =20
> >   static int vfio_set_dirty_page_tracking(VFIODevice *vbasedev, bool st=
art)
> > @@ -575,11 +569,6 @@ static int vfio_save_complete_precopy(QEMUFile *f,=
 void *opaque)
> >           return ret;
> >       }
> >  =20
> > -    ret =3D vfio_save_device_config_state(f, opaque);
> > -    if (ret) {
> > -        return ret;
> > -    }
> > -
> >       ret =3D vfio_update_pending(vbasedev);
> >       if (ret) {
> >           return ret;
> > @@ -720,6 +709,7 @@ static SaveVMHandlers savevm_vfio_handlers =3D {
> >       .save_live_pending =3D vfio_save_pending,
> >       .save_live_iterate =3D vfio_save_iterate,
> >       .save_live_complete_precopy =3D vfio_save_complete_precopy,
> > +    .save_state =3D vfio_save_device_config_state,
> >       .load_setup =3D vfio_load_setup,
> >       .load_cleanup =3D vfio_load_cleanup,
> >       .load_state =3D vfio_load_state,
> >  =20
>=20


