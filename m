Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565A02BB8AB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 23:03:47 +0100 (CET)
Received: from localhost ([::1]:34052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgEVO-0005IK-0U
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 17:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kgETj-0004Mc-0Z
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 17:02:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kgETg-0005HZ-1K
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 17:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605909717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OMXWp+Zp2ViIPR/6li4QjmkulwhO039NFdnZo+OadRY=;
 b=U/FxtSp1GpCUDY9/HRZXFlMpOVWT7g0XY+N/UUZ4EhGfU6pdLZ01OJdgD+lct5nWZ4yjHw
 fxLeBJImfbW3uhSzhzKn7tlFz6X79l0tiAx9xa8aYgTytBq0LS+fjFypX8zkuu/vBjybSJ
 6EUnonIFtmYLex7KmkUqG6Vs40cKlcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-Q9NYYIAHMAm_jez-k-6CAA-1; Fri, 20 Nov 2020 17:01:53 -0500
X-MC-Unique: Q9NYYIAHMAm_jez-k-6CAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF94D10151E7;
 Fri, 20 Nov 2020 22:01:51 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90CDC1002388;
 Fri, 20 Nov 2020 22:01:47 +0000 (UTC)
Date: Fri, 20 Nov 2020 15:01:46 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [PATCH RFC] vfio: Move the saving of the config space to the
 right place in VFIO migration
Message-ID: <20201120150146.5e5693e9@w520.home>
In-Reply-To: <a7be9306-f800-0323-293e-217e2e9f6015@huawei.com>
References: <20201114091731.157-1-lushenming@huawei.com>
 <860bd707-8862-2584-6e12-67c86f092dba@nvidia.com>
 <20201119104127.5e243efa@w520.home>
 <a7be9306-f800-0323-293e-217e2e9f6015@huawei.com>
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
Cc: Neo Jia <cjia@nvidia.com>, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, dgilbert@redhat.com,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Nov 2020 22:05:49 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> On 2020/11/20 1:41, Alex Williamson wrote:
> > On Thu, 19 Nov 2020 14:13:24 +0530
> > Kirti Wankhede <kwankhede@nvidia.com> wrote:
> >  =20
> >> On 11/14/2020 2:47 PM, Shenming Lu wrote: =20
> >>> When running VFIO migration, I found that the restoring of VFIO PCI d=
evice=E2=80=99s
> >>> config space is before VGIC on ARM64 target. But generally, interrupt=
 controllers
> >>> need to be restored before PCI devices.    =20
> >>
> >> Is there any other way by which VGIC can be restored before PCI device=
? =20
>=20
> As far as I know, it seems to have to depend on priorities in the non-ite=
rable process.
>=20
> >> =20
> >>> Besides, if a VFIO PCI device is
> >>> configured to have directly-injected MSIs (VLPIs), the restoring of i=
ts config
> >>> space will trigger the configuring of these VLPIs (in kernel), where =
it would
> >>> return an error as I saw due to the dependency on kvm=E2=80=99s vgic.
> >>>    =20
> >>
> >> Can this be fixed in kernel to re-initialize the kernel state? =20
>=20
> Did you mean to reconfigure these VLPIs when restoring kvm's vgic?
> But the fact is that this error is not caused by kernel, it is due to the=
 incorrect
> calling order of qemu...
>=20
> >> =20
> >>> To avoid this, we can move the saving of the config space from the it=
erable
> >>> process to the non-iterable process, so that it will be called after =
VGIC
> >>> according to their priorities.
> >>>    =20
> >>
> >> With this change, at resume side, pre-copy phase data would reach=20
> >> destination without restored config space. VFIO device on destination=
=20
> >> might need it's config space setup and validated before it can accept=
=20
> >> further VFIO device specific migration state.
> >>
> >> This also changes bit-stream, so it would break migration with origina=
l=20
> >> migration patch-set. =20
> >=20
> > Config space can continue to change while in pre-copy, if we're only
> > sending config space at the initiation of pre-copy, how are any changes
> > that might occur before the VM is stopped conveyed to the target?  For
> > example the guest might reboot and a device returned to INTx mode from
> > MSI during pre-copy.  Thanks, =20
>=20
> What I see is that the config space is only saved once in save_live_compl=
ete_precopy
> currently...
> As you said, a VFIO device might need it's config space setup first, and
> the config space can continue to change while in pre-copy, Did you mean w=
e
> have to migrate the config space in save_live_iterate?
> However, I still have a little doubt about the restoring dependence betwe=
en
> the qemu emulated config space and the device data...
>=20
> Besides, if we surely can't move the saving of the config space back, can=
 we
> just move some actions which are triggered by the restoring of the config=
 space
> back (such as vfio_msix_enable())?

It seems that the significant benefit to enabling interrupts during
pre-copy would be to reduce the latency and failure potential during
the final phase of migration.  Do we have any data for how much it adds
to the device contributed downtime to configure interrupts only at the
final stage?  My guess is that it's a measurable delay on its own.  At
the same time, we can't ignore the differences in machine specific
dependencies and if we don't even sync the config space once the VM is
stopped... this all seems not ready to call supported, especially if we
have concerns already about migration bit-stream compatibility.

Given our timing relative to QEMU 5.2, the only path I feel comfortable
with is to move forward with downgrading vfio migration support to be
enabled via an experimental option.  Objections?  Thanks,

Alex

>=20
> The demo patch is as follows (but it seems that .save_state is not a appr=
opriate
> place to do it. -_-):
>=20
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 55261562d4..9cf0310148 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -44,6 +44,7 @@
>  #define VFIO_MIG_FLAG_DEV_CONFIG_STATE  (0xffffffffef100002ULL)
>  #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
>  #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
> +#define VFIO_MIG_FLAG_DEV_STATE_TRIGGER (0xffffffffef100005ULL)
>=20
>  static int64_t bytes_transferred;
>=20
> @@ -368,6 +369,15 @@ static int vfio_save_device_config_state(QEMUFile *f=
, void *opaque)
>      return qemu_file_get_error(f);
>  }
>=20
> +static void vfio_device_state_trigger(void *opaque)
> +{
> +    VFIODevice *vbasedev =3D opaque;
> +
> +    if (vbasedev->ops && vbasedev->ops->vfio_trigger_config) {
> +        vbasedev->ops->vfio_trigger_config(vbasedev);
> +    }
> +}
> +
>  static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev =3D opaque;
> @@ -620,6 +630,13 @@ static int vfio_save_complete_precopy(QEMUFile *f, v=
oid *opaque)
>      return ret;
>  }
>=20
> +static void vfio_save_state_trigger(QEMUFile *f, void *opaque)
> +{
> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_STATE_TRIGGER);
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> +}
> +
>  static int vfio_load_setup(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev =3D opaque;
> @@ -700,6 +717,18 @@ static int vfio_load_state(QEMUFile *f, void *opaque=
, int version_id)
>              }
>              break;
>          }
> +        case VFIO_MIG_FLAG_DEV_STATE_TRIGGER:
> +        {
> +            vfio_device_state_trigger(opaque);
> +            data =3D qemu_get_be64(f);
> +            if (data =3D=3D VFIO_MIG_FLAG_END_OF_STATE) {
> +                return ret;
> +            } else {
> +                error_report("%s: STATE TRIGGER: EOS not found 0x%"PRIx6=
4,
> +                             vbasedev->name, data);
> +                return -EINVAL;
> +            }
> +        }
>          default:
>              error_report("%s: Unknown tag 0x%"PRIx64, vbasedev->name, da=
ta);
>              return -EINVAL;
> @@ -720,6 +749,7 @@ static SaveVMHandlers savevm_vfio_handlers =3D {
>      .save_live_pending =3D vfio_save_pending,
>      .save_live_iterate =3D vfio_save_iterate,
>      .save_live_complete_precopy =3D vfio_save_complete_precopy,
> +    .save_state =3D vfio_save_state_trigger,
>      .load_setup =3D vfio_load_setup,
>      .load_cleanup =3D vfio_load_cleanup,
>      .load_state =3D vfio_load_state,
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 58c0ce8971..4cd2feee92 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2441,13 +2441,19 @@ static int vfio_pci_load_config(VFIODevice *vbase=
dev, QEMUFile *f)
>      vfio_pci_write_config(pdev, PCI_COMMAND,
>                            pci_get_word(pdev->config + PCI_COMMAND), 2);
>=20
> +    return ret;
> +}
> +
> +static void vfio_pci_trigger_config(VFIODevice *vbasedev)
> +{
> +    VFIOPCIDevice *vdev =3D container_of(vbasedev, VFIOPCIDevice, vbased=
ev);
> +    PCIDevice *pdev =3D &vdev->pdev;
> +
>      if (msi_enabled(pdev)) {
>          vfio_msi_enable(vdev);
>      } else if (msix_enabled(pdev)) {
>          vfio_msix_enable(vdev);
>      }
> -
> -    return ret;
>  }
>=20
>  static VFIODeviceOps vfio_pci_ops =3D {
> @@ -2457,6 +2463,7 @@ static VFIODeviceOps vfio_pci_ops =3D {
>      .vfio_get_object =3D vfio_pci_get_object,
>      .vfio_save_config =3D vfio_pci_save_config,
>      .vfio_load_config =3D vfio_pci_load_config,
> +    .vfio_trigger_config =3D vfio_pci_trigger_config,
>  };
>=20
>  int vfio_populate_vga(VFIOPCIDevice *vdev, Error **errp)
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.=
h
> index baeb4dcff1..4680a3e8d0 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -138,6 +138,7 @@ struct VFIODeviceOps {
>      Object *(*vfio_get_object)(VFIODevice *vdev);
>      void (*vfio_save_config)(VFIODevice *vdev, QEMUFile *f);
>      int (*vfio_load_config)(VFIODevice *vdev, QEMUFile *f);
> +    void (*vfio_trigger_config)(VFIODevice *vdev);
>  };
>=20
>  typedef struct VFIOGroup {


