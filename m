Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A468F2B8DCB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 09:45:08 +0100 (CET)
Received: from localhost ([::1]:52494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kffYx-0005L6-MU
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 03:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kffXW-0004lf-IF; Thu, 19 Nov 2020 03:43:38 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kffXU-0001r6-6w; Thu, 19 Nov 2020 03:43:38 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fb630390001>; Thu, 19 Nov 2020 00:43:37 -0800
Received: from [10.40.103.11] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov
 2020 08:43:28 +0000
Subject: Re: [PATCH RFC] vfio: Move the saving of the config space to the
 right place in VFIO migration
To: Shenming Lu <lushenming@huawei.com>, Alex Williamson
 <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20201114091731.157-1-lushenming@huawei.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <860bd707-8862-2584-6e12-67c86f092dba@nvidia.com>
Date: Thu, 19 Nov 2020 14:13:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201114091731.157-1-lushenming@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605775417; bh=bVTR1qHH100S+o2AgDc4IHFQc1f0QmlYVLK5l/gh6kw=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=WVcpyLB28TuIekFV8hjq4LLavoYO1QCMEmYqHTtZu/EoIfcIBwa4zAZ1gG63U/CCI
 tan7Bu6X9nRyZG+wycDZmd7opLq4UAwBWNdWLE7ZfWt0lyKDwcnI3ZElKRDJYrJdz3
 cmwWAL2ZGqrmXZ7IePSu//c5wN5rT3IgH80WKyB1mH4pCRiGu+7PzMpydf/SNbSQSo
 CG9Z1v4r5qxgZKP8iXMocb4aKIGz6pkU6rFlIqUONPwAw+IE7yd9DfXft8ZbUXlPu0
 K3FZ0R33nNsST6PsYZRDG+9veYeJ3xu0HeVwzmcRiOt5w3/5qOmhM3iJN5TArhbd4O
 +vUOHAyopDC+A==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:43:34
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Neo Jia <cjia@nvidia.com>, Marc Zyngier <maz@kernel.org>,
 qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/14/2020 2:47 PM, Shenming Lu wrote:
> When running VFIO migration, I found that the restoring of VFIO PCI devic=
e=E2=80=99s
> config space is before VGIC on ARM64 target. But generally, interrupt con=
trollers
> need to be restored before PCI devices.=20

Is there any other way by which VGIC can be restored before PCI device?

> Besides, if a VFIO PCI device is
> configured to have directly-injected MSIs (VLPIs), the restoring of its c=
onfig
> space will trigger the configuring of these VLPIs (in kernel), where it w=
ould
> return an error as I saw due to the dependency on kvm=E2=80=99s vgic.
>=20

Can this be fixed in kernel to re-initialize the kernel state?

> To avoid this, we can move the saving of the config space from the iterab=
le
> process to the non-iterable process, so that it will be called after VGIC
> according to their priorities.
>=20

With this change, at resume side, pre-copy phase data would reach=20
destination without restored config space. VFIO device on destination=20
might need it's config space setup and validated before it can accept=20
further VFIO device specific migration state.

This also changes bit-stream, so it would break migration with original=20
migration patch-set.

Thanks,
Kirti

> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> ---
>   hw/vfio/migration.c | 22 ++++++----------------
>   1 file changed, 6 insertions(+), 16 deletions(-)
>=20
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 3ce285ea39..028da35a25 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -351,7 +351,7 @@ static int vfio_update_pending(VFIODevice *vbasedev)
>       return 0;
>   }
>  =20
> -static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
> +static void vfio_save_device_config_state(QEMUFile *f, void *opaque)
>   {
>       VFIODevice *vbasedev =3D opaque;
>  =20
> @@ -365,13 +365,14 @@ static int vfio_save_device_config_state(QEMUFile *=
f, void *opaque)
>  =20
>       trace_vfio_save_device_config_state(vbasedev->name);
>  =20
> -    return qemu_file_get_error(f);
> +    if (qemu_file_get_error(f))
> +        error_report("%s: Failed to save device config space",
> +                     vbasedev->name);
>   }
>  =20
>   static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>   {
>       VFIODevice *vbasedev =3D opaque;
> -    uint64_t data;
>  =20
>       if (vbasedev->ops && vbasedev->ops->vfio_load_config) {
>           int ret;
> @@ -384,15 +385,8 @@ static int vfio_load_device_config_state(QEMUFile *f=
, void *opaque)
>           }
>       }
>  =20
> -    data =3D qemu_get_be64(f);
> -    if (data !=3D VFIO_MIG_FLAG_END_OF_STATE) {
> -        error_report("%s: Failed loading device config space, "
> -                     "end flag incorrect 0x%"PRIx64, vbasedev->name, dat=
a);
> -        return -EINVAL;
> -    }
> -
>       trace_vfio_load_device_config_state(vbasedev->name);
> -    return qemu_file_get_error(f);
> +    return 0;
>   }
>  =20
>   static int vfio_set_dirty_page_tracking(VFIODevice *vbasedev, bool star=
t)
> @@ -575,11 +569,6 @@ static int vfio_save_complete_precopy(QEMUFile *f, v=
oid *opaque)
>           return ret;
>       }
>  =20
> -    ret =3D vfio_save_device_config_state(f, opaque);
> -    if (ret) {
> -        return ret;
> -    }
> -
>       ret =3D vfio_update_pending(vbasedev);
>       if (ret) {
>           return ret;
> @@ -720,6 +709,7 @@ static SaveVMHandlers savevm_vfio_handlers =3D {
>       .save_live_pending =3D vfio_save_pending,
>       .save_live_iterate =3D vfio_save_iterate,
>       .save_live_complete_precopy =3D vfio_save_complete_precopy,
> +    .save_state =3D vfio_save_device_config_state,
>       .load_setup =3D vfio_load_setup,
>       .load_cleanup =3D vfio_load_cleanup,
>       .load_state =3D vfio_load_state,
>=20

