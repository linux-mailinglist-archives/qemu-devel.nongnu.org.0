Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA022CC6A0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 20:27:39 +0100 (CET)
Received: from localhost ([::1]:54512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkXms-0003wr-Fa
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 14:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kkXk4-0002MZ-BP
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 14:24:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kkXk0-0007jb-4A
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 14:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606937078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H10VDeG8Lniggc5ZFxNUfI+BkPxV7wGXCJ/Qd3caV+k=;
 b=WlKpmh7/HEpsh3bLy0gXU4k/a3aNzgCMSb6kbozan+L9Ey4yAMfZEeY5hHT42v8H4NrEn6
 6NeQrAy00HsSG9wfPWiDaA0+QIA77riXiqXKVr9ilN2O0JY8zcH3Lgk62S9TylrqJ2MdPM
 YHu6GUo5Ns6IlMf7YTARYP/4BZrbbBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-Tu8j45I2MZ-XTnTWo7gsnA-1; Wed, 02 Dec 2020 14:24:34 -0500
X-MC-Unique: Tu8j45I2MZ-XTnTWo7gsnA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 405F41006C81;
 Wed,  2 Dec 2020 19:24:33 +0000 (UTC)
Received: from w520.home (ovpn-112-10.phx2.redhat.com [10.3.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A73BB189B6;
 Wed,  2 Dec 2020 19:24:32 +0000 (UTC)
Date: Wed, 2 Dec 2020 12:24:32 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH v2 1/1] Fix to show vfio migration stat in migration status
Message-ID: <20201202122432.73aa3d12@w520.home>
In-Reply-To: <1606849994-10625-1-git-send-email-kwankhede@nvidia.com>
References: <1606849994-10625-1-git-send-email-kwankhede@nvidia.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Cc: cjia@nvidia.com, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, dnigam@nvidia.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Dec 2020 00:43:14 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> Header file where CONFIG_VFIO is defined is not included in migration.c
> file.
>=20
> Moved populate_vfio_info() to hw/vfio/common.c file. Added its stub in
> stubs/vfio.c file. Updated header files and meson file accordingly.
>=20
> Fixes: 3710586caa5d ("qapi: Add VFIO devices migration stats in Migration
> stats")
>=20
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> ---
>  hw/vfio/common.c              | 12 +++++++++++-
>  include/hw/vfio/vfio-common.h |  1 -
>  include/hw/vfio/vfio.h        |  2 ++
>  migration/migration.c         | 16 +---------------
>  stubs/meson.build             |  1 +
>  stubs/vfio.c                  |  7 +++++++
>  6 files changed, 22 insertions(+), 17 deletions(-)
>  create mode 100644 stubs/vfio.c
>=20
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 6ff1daa763f8..4868c0fef504 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -25,6 +25,7 @@
>  #endif
>  #include <linux/vfio.h>
> =20
> +#include "qapi/qapi-types-migration.h"
>  #include "hw/vfio/vfio-common.h"
>  #include "hw/vfio/vfio.h"
>  #include "exec/address-spaces.h"
> @@ -292,7 +293,7 @@ const MemoryRegionOps vfio_region_ops =3D {
>   * Device state interfaces
>   */
> =20
> -bool vfio_mig_active(void)
> +static bool vfio_mig_active(void)
>  {
>      VFIOGroup *group;
>      VFIODevice *vbasedev;
> @@ -311,6 +312,15 @@ bool vfio_mig_active(void)
>      return true;
>  }
> =20
> +void populate_vfio_info(MigrationInfo *info)
> +{
> +    if (vfio_mig_active()) {
> +        info->has_vfio =3D true;
> +        info->vfio =3D g_malloc0(sizeof(*info->vfio));
> +        info->vfio->transferred =3D vfio_mig_bytes_transferred();
> +    }
> +}
> +
>  static bool vfio_devices_all_saving(VFIOContainer *container)
>  {
>      VFIOGroup *group;
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.=
h
> index 6141162d7aea..cc47bd7d4456 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -205,7 +205,6 @@ extern const MemoryRegionOps vfio_region_ops;
>  typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
>  extern VFIOGroupList vfio_group_list;
> =20
> -bool vfio_mig_active(void);
>  int64_t vfio_mig_bytes_transferred(void);
> =20
>  #ifdef CONFIG_LINUX
> diff --git a/include/hw/vfio/vfio.h b/include/hw/vfio/vfio.h
> index 86248f54360a..d1e6f4b26f35 100644
> --- a/include/hw/vfio/vfio.h
> +++ b/include/hw/vfio/vfio.h
> @@ -4,4 +4,6 @@
>  bool vfio_eeh_as_ok(AddressSpace *as);
>  int vfio_eeh_as_op(AddressSpace *as, uint32_t op);
> =20
> +void populate_vfio_info(MigrationInfo *info);
> +
>  #endif
> diff --git a/migration/migration.c b/migration/migration.c
> index 87a9b59f83f4..c164594c1d8d 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -56,10 +56,7 @@
>  #include "net/announce.h"
>  #include "qemu/queue.h"
>  #include "multifd.h"
> -
> -#ifdef CONFIG_VFIO
> -#include "hw/vfio/vfio-common.h"
> -#endif
> +#include "hw/vfio/vfio.h"
> =20
>  #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throt=
tling */
> =20
> @@ -1041,17 +1038,6 @@ static void populate_disk_info(MigrationInfo *info=
)
>      }
>  }
> =20
> -static void populate_vfio_info(MigrationInfo *info)
> -{
> -#ifdef CONFIG_VFIO
> -    if (vfio_mig_active()) {
> -        info->has_vfio =3D true;
> -        info->vfio =3D g_malloc0(sizeof(*info->vfio));
> -        info->vfio->transferred =3D vfio_mig_bytes_transferred();
> -    }
> -#endif
> -}
> -
>  static void fill_source_migration_info(MigrationInfo *info)
>  {
>      MigrationState *s =3D migrate_get_current();
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 82b7ba60abe5..909956674847 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -53,3 +53,4 @@ if have_system
>    stub_ss.add(files('semihost.c'))
>    stub_ss.add(files('xen-hw-stub.c'))
>  endif
> +stub_ss.add(files('vfio.c'))
> diff --git a/stubs/vfio.c b/stubs/vfio.c
> new file mode 100644
> index 000000000000..9cc8753cd102
> --- /dev/null
> +++ b/stubs/vfio.c
> @@ -0,0 +1,7 @@
> +#include "qemu/osdep.h"
> +#include "qapi/qapi-types-migration.h"
> +#include "hw/vfio/vfio.h"
> +
> +void populate_vfio_info(MigrationInfo *info)
> +{
> +}

[989/8466] Compiling C object libqemu-s390x-softmmu.fa.p/hw_vfio_ap.c.o
FAILED: libqemu-s390x-softmmu.fa.p/hw_vfio_ap.c.o=20
cc -Ilibqemu-s390x-softmmu.fa.p -I. -I.. -Itarget/s390x -I../target/s390x -=
Iqapi -Itrace -Iui -Iui/shader -I/usr/include/spice-1 -I/usr/include/spice-=
server -I/usr/include/cacard -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/=
include -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/libmount -I=
/usr/include/blkid -I/usr/include/pixman-1 -I/usr/include/capstone -fdiagno=
stics-color=3Dauto -pipe -Wall -Winvalid-pch -std=3Dgnu99 -O2 -g -U_FORTIFY=
_SOURCE -D_FORTIFY_SOURCE=3D2 -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=
=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Ww=
rite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv =
-Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-secur=
ity -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-ext=
erns -Wendif-labels -Wexpansion-to-defined -Wno-missing-include-dirs -Wno-s=
hift-negative-value -Wno-psabi -fstack-protector-strong -isystem /tmp/tmp.J=
ZOEQpImbX/linux-headers -isystem linux-headers -iquote /tmp/tmp.JZOEQpImbX/=
tcg/i386 -iquote . -iquote /tmp/tmp.JZOEQpImbX -iquote /tmp/tmp.JZOEQpImbX/=
accel/tcg -iquote /tmp/tmp.JZOEQpImbX/include -iquote /tmp/tmp.JZOEQpImbX/d=
isas/libvixl -pthread -fPIC -isystem../linux-headers -isystemlinux-headers =
-DNEED_CPU_H '-DCONFIG_TARGET=3D"s390x-softmmu-config-target.h"' '-DCONFIG_=
DEVICES=3D"s390x-softmmu-config-devices.h"' -MD -MQ libqemu-s390x-softmmu.f=
a.p/hw_vfio_ap.c.o -MF libqemu-s390x-softmmu.fa.p/hw_vfio_ap.c.o.d -o libqe=
mu-s390x-softmmu.fa.p/hw_vfio_ap.c.o -c ../hw/vfio/ap.c
In file included from ../hw/vfio/ap.c:18:
/tmp/tmp.JZOEQpImbX/include/hw/vfio/vfio.h:7:25: error: unknown type name =
=E2=80=98MigrationInfo=E2=80=99
    7 | void populate_vfio_info(MigrationInfo *info);
      |                         ^~~~~~~~~~~~~


