Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5233D5167A0
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 22:05:11 +0200 (CEST)
Received: from localhost ([::1]:53018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlFob-00033v-Op
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 16:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1nlFn0-0002EC-0X
 for qemu-devel@nongnu.org; Sun, 01 May 2022 16:03:30 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43732 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1nlFmw-0005ve-8i
 for qemu-devel@nongnu.org; Sun, 01 May 2022 16:03:29 -0400
Received: from smtpclient.apple
 (dynamic-095-115-014-159.95.115.pool.telefonica.de [95.115.14.159])
 by csgraf.de (Postfix) with ESMTPSA id 8975760800D2;
 Sun,  1 May 2022 22:03:21 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Alexander Graf <agraf@csgraf.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v10] isa-applesmc: provide OSK forwarding on Apple hosts
Date: Sun, 1 May 2022 22:03:20 +0200
Message-Id: <C28D4FF4-928A-45C9-9D33-9006B01E2A6D@csgraf.de>
References: <20220429191827.8917-1-yaroshchuk2000@gmail.com>
In-Reply-To: <20220429191827.8917-1-yaroshchuk2000@gmail.com>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
X-Mailer: iPhone Mail (19E258)
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, phil@philjordan.eu, t0rr3sp3dr0@gmail.com,
 rene@exactcode.de, ehabkost@redhat.com, marcel.a@redhat.com,
 jan.kiszka@siemens.com, alistair.francis@xilinx.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, marcandre.lureau@redhat.com, r.bolshakov@yadro.com,
 berrange@redhat.com, pbonzini@redhat.com, gsomlo@gmail.com, suse@csgraf.de,
 armbru@redhat.com, chetan4windows@gmail.com, imammedo@redhat.com,
 afaerber@suse.de, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> Am 29.04.2022 um 21:18 schrieb Vladislav Yaroshchuk <yaroshchuk2000@gmail.=
com>:
>=20
> =EF=BB=BFOn Apple hosts we can read AppleSMC OSK key directly from host's
> SMC and forward this value to QEMU Guest.
>=20
> New 'hostosk' property is added:
> * `-device isa-applesmc,hostosk=3Don`
> The property is set to 'on' by default for machine version > 7.0
>=20
> Apple licence allows use and run up to two additional copies
> or instances of macOS operating system within virtual operating system
> environments on each Apple-branded computer that is already running
> the Apple Software, for purposes of:
> * software development
> * testing during software development
> * using macOS Server
> * personal, non-commercial use
>=20
> Guest macOS requires AppleSMC with correct OSK. The most legal
> way to pass it to the Guest is to forward the key from host SMC
> without any value exposion.
>=20
> Based on https://web.archive.org/web/20200103161737/osxbook.com/book/bonus=
/chapter7/tpmdrmmyth/
>=20
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
> hw/core/machine.c  |   4 +-
> hw/misc/applesmc.c | 125 +++++++++++++++++++++++++++++++++++++++++++--
> 2 files changed, 125 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index cb9bbc844d..7f4a27406a 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,7 +37,9 @@
> #include "hw/virtio/virtio.h"
> #include "hw/virtio/virtio-pci.h"
>=20
> -GlobalProperty hw_compat_7_0[] =3D {};
> +GlobalProperty hw_compat_7_0[] =3D {
> +    { "isa-applesmc", "hostosk", "off" }
> +};
> const size_t hw_compat_7_0_len =3D G_N_ELEMENTS(hw_compat_7_0);
>=20
> GlobalProperty hw_compat_6_2[] =3D {
> diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> index 81cd6b6423..8672c9d56e 100644
> --- a/hw/misc/applesmc.c
> +++ b/hw/misc/applesmc.c
> @@ -37,6 +37,11 @@
> #include "qemu/module.h"
> #include "qemu/timer.h"
> #include "qom/object.h"
> +#include "qapi/error.h"
> +
> +#if defined(__APPLE__) && defined(__MACH__)
> +#include <IOKit/IOKitLib.h>
> +#endif
>=20
> /* #define DEBUG_SMC */
>=20
> @@ -80,7 +85,7 @@ enum {
> #define smc_debug(...) do { } while (0)
> #endif
>=20
> -static char default_osk[64] =3D "This is a dummy key. Enter the real key "=

> +static char default_osk[65] =3D "This is a dummy key. Enter the real key "=

>                               "using the -osk parameter";
>=20
> struct AppleSMCData {
> @@ -109,6 +114,7 @@ struct AppleSMCState {
>     uint8_t data_pos;
>     uint8_t data[255];
>     char *osk;
> +    bool hostosk;
>     QLIST_HEAD(, AppleSMCData) data_def;
> };
>=20
> @@ -312,6 +318,101 @@ static const MemoryRegionOps applesmc_err_io_ops =3D=
 {
>     },
> };
>=20
> +#if defined(__APPLE__) && defined(__MACH__)
> +/*
> + * Based on
> + * https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chap=
ter7/tpmdrmmyth/
> + */
> +enum {
> +    SMC_HANDLE_EVENT     =3D 2,
> +    SMC_READ_KEY         =3D 5
> +};
> +
> +struct AppleSMCParam {
> +    uint32_t key;
> +    uint8_t pad0[22];
> +    IOByteCount data_size;
> +    uint8_t pad1[10];
> +    uint8_t command;
> +    uint32_t pad2;
> +    uint8_t bytes[32];
> +};
> +
> +static bool applesmc_read_host_osk(char *host_osk, Error **errp)
> +{
> +    assert(host_osk !=3D NULL);
> +
> +    io_service_t hostsmc_service =3D IO_OBJECT_NULL;
> +    io_connect_t hostsmc_connect =3D IO_OBJECT_NULL;
> +    size_t smc_param_size =3D sizeof(struct AppleSMCParam);
> +    IOReturn status =3D kIOReturnError;
> +    int i;
> +
> +    struct AppleSMCParam smc_param[2] =3D {
> +         {
> +             .key =3D ('OSK0'),
> +             .data_size =3D sizeof(smc_param[0].bytes),
> +             .command =3D SMC_READ_KEY,
> +         }, {
> +             .key =3D ('OSK1'),
> +             .data_size =3D sizeof(smc_param[0].bytes),
> +             .command =3D SMC_READ_KEY,
> +         },
> +    };
> +
> +    hostsmc_service =3D IOServiceGetMatchingService(
> +        kIOMasterPortDefault,
> +        IOServiceMatching("AppleSMC"));
> +    if (hostsmc_service =3D=3D IO_OBJECT_NULL) {
> +        error_setg(errp, "Unable to get host-AppleSMC service");
> +        goto error;
> +    }
> +
> +    status =3D IOServiceOpen(hostsmc_service,
> +                           mach_task_self(),
> +                           0,
> +                           &hostsmc_connect);
> +    if (status !=3D kIOReturnSuccess || hostsmc_connect =3D=3D IO_OBJECT_=
NULL) {
> +        error_setg(errp, "Unable to open host-AppleSMC service");
> +        goto error;
> +    }
> +
> +    for (i =3D 0; i < ARRAY_SIZE(smc_param); ++i) {
> +        status =3D IOConnectCallStructMethod(
> +                hostsmc_connect,
> +                SMC_HANDLE_EVENT,
> +                &smc_param[i],
> +                sizeof(struct AppleSMCParam),
> +                &smc_param[i],
> +                &smc_param_size
> +            );
> +
> +        if (status !=3D kIOReturnSuccess) {
> +            error_setg(errp, "Unable to read OSK from host-AppleSMC");
> +            goto error;
> +        }
> +    }
> +
> +    memcpy(host_osk, smc_param[0].bytes, 32);
> +    memcpy(host_osk + 32, smc_param[1].bytes, 32);
> +
> +    IOServiceClose(hostsmc_connect);
> +    IOObjectRelease(hostsmc_service);
> +    return true;
> +
> +error:
> +    IOServiceClose(hostsmc_connect);
> +    IOObjectRelease(hostsmc_service);
> +    return false;
> +}
> +#else
> +static bool applesmc_read_host_osk(char *host_osk, Error **errp)
> +{
> +    error_setg(errp, "OSK read is not supported on this host");
> +    return false;
> +}
> +#endif
> +
> static void applesmc_isa_realize(DeviceState *dev, Error **errp)
> {
>     AppleSMCState *s =3D APPLE_SMC(dev);
> @@ -331,9 +432,26 @@ static void applesmc_isa_realize(DeviceState *dev, Er=
ror **errp)
>     isa_register_ioport(&s->parent_obj, &s->io_err,
>                         s->iobase + APPLESMC_ERR_PORT);
>=20
> -    if (!s->osk || (strlen(s->osk) !=3D 64)) {
> -        warn_report("Using AppleSMC with invalid key");
> +    if (s->osk && s->hostosk) {
> +        error_setg(errp, "-osk property cannot be used with -hostosk=3Don=
");
> +    }
> +
> +    if (!s->osk && !s->hostosk) {
>         s->osk =3D default_osk;
> +        warn_report("Using AppleSMC with default (dummy) OSK");
> +    }
> +
> +    if (s->hostosk) {
> +        s->osk =3D g_malloc0(65);
> +        /* Fail hard if we cannot read requested host OSK */
> +        if (!applesmc_read_host_osk(s->osk, errp)) {
> +            g_assert_not_reached();
> +        }
> +    }
> +
> +    if (s->osk && strlen(s->osk) !=3D 64) {
> +        /* Only valid OSK is accepted within 'osk' property */
> +        error_setg(errp, "Using AppleSMC with key of invalid length");
>     }
>=20
>     QLIST_INIT(&s->data_def);
> @@ -344,6 +462,7 @@ static Property applesmc_isa_properties[] =3D {
>     DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState, iobase,
>                        APPLESMC_DEFAULT_IOBASE),
>     DEFINE_PROP_STRING("osk", AppleSMCState, osk),
> +    DEFINE_PROP_BOOL("hostosk", AppleSMCState, hostosk, true),

I think this should only default to true on x86 macOS. On Linux hosts or M1,=
 we want to go through the normal 3rd party provided osk logic by default. O=
therwise in 15 years when x86 Macs are fully deprecated, we'd still need to p=
ass hostosk=3Dfalse on the cmdline for archeology QEMU macOS VMs ;).

Alex

>     DEFINE_PROP_END_OF_LIST(),
> };
>=20
> --=20
> 2.34.1.vfs.0.0
>=20

