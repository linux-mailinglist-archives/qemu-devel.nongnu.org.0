Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B731A49D1A6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 19:23:13 +0100 (CET)
Received: from localhost ([::1]:59564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmwq-0002mf-IA
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 13:23:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nCmtW-0000iG-7S
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:19:46 -0500
Received: from [2a00:1450:4864:20::52b] (port=46656
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nCmtU-0004DD-1t
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:19:45 -0500
Received: by mail-ed1-x52b.google.com with SMTP id m11so316232edi.13
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 10:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=gUpEgoemwjD1v+eGiGE0TXEicDs+5v/D/6z4WQwDDMA=;
 b=qTyGJLXj0RBRSZpIYfRypJmXFOV5hUz6o6TosuGu088xp21Nv5tlW4Op/wRXzUF0qF
 wvU8V0ssD+8HuU1Lhbxb2FCwLzkXYx/chUILzR6hV/+Zle4/dz0TYDmq0COY5aEk2iWG
 1gu0jsGeXNKgifr+oOYDe0SNMSXBOEIAIka8QUwcjCz+UjqK1ME6apK2Wdl8Jx+3XkRa
 crxLcOAOZ7i8uTCL/8vHQetRNp2oNV+Uw2yFcj0lx8P2/F1T8wA3xIqD1gXMA7RHrIwL
 vOFwYh1I2T6xvHHsv8Vpn8m7q0TtTfkUSX2iuRTCK8hhgnmJ++M5nM9uUhAU/PvSzfKm
 hdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=gUpEgoemwjD1v+eGiGE0TXEicDs+5v/D/6z4WQwDDMA=;
 b=h+huFZIitPzUEYO2SBJ84WvFIRuUNi/g8uWXBnObFPZdHsfxgo2Va1fvcpM/RmYR8p
 DeoomtkcCj+teI2o0ZFnGUuxPI7FJ3Ni9Bv9kq35IQ060j9NGWXXnBfwfyRmI4u0obVS
 urMAD0yQ3MKoiDWEnUnpgF/oW00YbsLuaC99Ye/f9KMya/BZkTeJ3gTx+M+EcB0PVZlZ
 OLyd9WIiZEUTwpUxz5qSapcZ06hp7AFAK2MrvJ8p6jZtccDN9wNQJzXaqbYlI1uGrK7R
 yJGxMnqUyngo8blZmQKFnPaWqHCeJ15Ud/CJRfZk1q1v7eBsHBanyBPWdChwiokSeCMI
 Lacg==
X-Gm-Message-State: AOAM53241hamvXVQdckbU0LN0e+mCXP0SxdJoYe7glTCH6P90TamLq09
 G4oV8+Dz1MrhMw23iP7nPh5Adw==
X-Google-Smtp-Source: ABdhPJwRgSghi8ZKMP+QBJZKeH+HNhSnQkaOim4XnwXn14jGlm8lPwMecjUso2V8fp2dRtCzOc/x5w==
X-Received: by 2002:aa7:d4c1:: with SMTP id t1mr227514edr.207.1643221182498;
 Wed, 26 Jan 2022 10:19:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v28sm10090847edw.95.2022.01.26.10.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 10:19:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A08A41FFB7;
 Wed, 26 Jan 2022 18:19:40 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-6-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 05/42] hw/cxl/device: Implement the CAP array
 (8.2.8.1-2)
Date: Wed, 26 Jan 2022 18:17:12 +0000
In-reply-to: <20220124171705.10432-6-Jonathan.Cameron@huawei.com>
Message-ID: <87tudqbbr7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> From: Ben Widawsky <ben.widawsky@intel.com>
>
> This implements all device MMIO up to the first capability. That
> includes the CXL Device Capabilities Array Register, as well as all of
> the CXL Device Capability Header Registers. The latter are filled in as
> they are implemented in the following patches.
>
> Endianness and alignment are managed by softmmu memory core.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/cxl/cxl-device-utils.c   | 105 ++++++++++++++++++++++++++++++++++++
>  hw/cxl/meson.build          |   1 +
>  include/hw/cxl/cxl_device.h |  28 +++++++++-
>  3 files changed, 133 insertions(+), 1 deletion(-)
>
> diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> new file mode 100644
> index 0000000000..cb1b0a8217
> --- /dev/null
> +++ b/hw/cxl/cxl-device-utils.c
> @@ -0,0 +1,105 @@
> +/*
> + * CXL Utility library for devices
> + *
> + * Copyright(C) 2020 Intel Corporation.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2. See =
the
> + * COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/cxl/cxl.h"
> +
> +/*
> + * Device registers have no restrictions per the spec, and so fall back =
to the
> + * default memory mapped register rules in 8.2:
> + *   Software shall use CXL.io Memory Read and Write to access memory ma=
pped
> + *   register defined in this section. Unless otherwise specified, softw=
are
> + *   shall restrict the accesses width based on the following:
> + *   =E2=80=A2 A 32 bit register shall be accessed as a 1 Byte, 2 Bytes =
or 4 Bytes
> + *     quantity.
> + *   =E2=80=A2 A 64 bit register shall be accessed as a 1 Byte, 2 Bytes,=
 4 Bytes or 8
> + *     Bytes
> + *   =E2=80=A2 The address shall be a multiple of the access width, e.g.=
 when
> + *     accessing a register as a 4 Byte quantity, the address shall be
> + *     multiple of 4.
> + *   =E2=80=A2 The accesses shall map to contiguous bytes.If these rules=
 are not
> + *     followed, the behavior is undefined
> + */
> +
> +static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    CXLDeviceState *cxl_dstate =3D opaque;
> +
> +    return cxl_dstate->caps_reg_state32[offset / 4];
> +}
> +
> +static uint64_t dev_reg_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    return 0;
> +}
> +
> +static const MemoryRegionOps dev_ops =3D {
> +    .read =3D dev_reg_read,
> +    .write =3D NULL, /* status register is read only */
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 1,
> +        .max_access_size =3D 8,
> +        .unaligned =3D false,
> +    },
> +    .impl =3D {
> +        .min_access_size =3D 1,
> +        .max_access_size =3D 8,
> +    },
> +};

I think for >64 bit registers you need to use the read_with_attrs=20

> +
> +static const MemoryRegionOps caps_ops =3D {
> +    .read =3D caps_reg_read,
> +    .write =3D NULL, /* caps registers are read only */
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 1,
> +        .max_access_size =3D 8,
> +        .unaligned =3D false,
> +    },
> +    .impl =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4,
> +    },
> +};
> +
> +void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dst=
ate)
> +{
> +    /* This will be a BAR, so needs to be rounded up to pow2 for PCI spe=
c */
> +    memory_region_init(&cxl_dstate->device_registers, obj, "device-regis=
ters",
> +                       pow2ceil(CXL_MMIO_SIZE));
> +
> +    memory_region_init_io(&cxl_dstate->caps, obj, &caps_ops, cxl_dstate,
> +                          "cap-array", CXL_CAPS_SIZE);
> +    memory_region_init_io(&cxl_dstate->device, obj, &dev_ops, cxl_dstate,
> +                          "device-status", CXL_DEVICE_REGISTERS_LENGTH);
> +
> +    memory_region_add_subregion(&cxl_dstate->device_registers, 0,
> +                                &cxl_dstate->caps);
> +    memory_region_add_subregion(&cxl_dstate->device_registers,
> +                                CXL_DEVICE_REGISTERS_OFFSET,
> +                                &cxl_dstate->device);
> +}
> +
> +static void device_reg_init_common(CXLDeviceState *cxl_dstate) { }
> +
> +void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
> +{
> +    uint32_t *cap_hdrs =3D cxl_dstate->caps_reg_state32;
> +    const int cap_count =3D 1;
> +
> +    /* CXL Device Capabilities Array Register */
> +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
> +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_VERSION, 1);
> +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY2, CAP_COUNT, cap_count);
> +
> +    cxl_device_cap_init(cxl_dstate, DEVICE, 1);
> +    device_reg_init_common(cxl_dstate);
> +}
> diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
> index 00c3876a0f..47154d6850 100644
> --- a/hw/cxl/meson.build
> +++ b/hw/cxl/meson.build
> @@ -1,3 +1,4 @@
>  softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
>    'cxl-component-utils.c',
> +  'cxl-device-utils.c',
>  ))
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index 3b6ed745f0..4bdfa80eb4 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -63,6 +63,8 @@
>  #define CXL_DEVICE_CAP_HDR1_OFFSET 0x10 /* Figure 138 */
>  #define CXL_DEVICE_CAP_REG_SIZE 0x10 /* 8.2.8.2 */
>  #define CXL_DEVICE_CAPS_MAX 4 /* 8.2.8.2.1 + 8.2.8.5 */
> +#define CXL_CAPS_SIZE \
> +    (CXL_DEVICE_CAP_REG_SIZE * (CXL_DEVICE_CAPS_MAX + 1)) /* +1 for head=
er */
>=20=20
>  #define CXL_DEVICE_REGISTERS_OFFSET 0x80 /* Read comment above */
>  #define CXL_DEVICE_REGISTERS_LENGTH 0x8 /* 8.2.8.3.1 */
> @@ -75,11 +77,18 @@
>  #define CXL_MAILBOX_REGISTERS_LENGTH \
>      (CXL_MAILBOX_REGISTERS_SIZE + CXL_MAILBOX_MAX_PAYLOAD_SIZE)
>=20=20
> +#define CXL_MMIO_SIZE                                           \
> +    (CXL_DEVICE_CAP_REG_SIZE + CXL_DEVICE_REGISTERS_LENGTH +    \
> +     CXL_MAILBOX_REGISTERS_LENGTH)
> +
>  typedef struct cxl_device_state {
>      MemoryRegion device_registers;
>=20=20
>      /* mmio for device capabilities array - 8.2.8.2 */
> -    MemoryRegion caps;
> +    struct {
> +        MemoryRegion caps;
> +        uint32_t caps_reg_state32[CXL_CAPS_SIZE / 4];
> +    };
>=20=20
>      /* mmio for the device status registers 8.2.8.3 */
>      MemoryRegion device;
> @@ -128,6 +137,23 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DE=
VICE_CAP_HDR1_OFFSET)
>  CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSE=
T + \
>                                                 CXL_DEVICE_CAP_REG_SIZE)
>=20=20
> +#define cxl_device_cap_init(dstate, reg, cap_id)                        =
   \
> +    do {                                                                =
   \
> +        uint32_t *cap_hdrs =3D dstate->caps_reg_state32;                =
     \
> +        int which =3D R_CXL_DEV_##reg##_CAP_HDR0;                       =
     \
> +        cap_hdrs[which] =3D                                             =
     \
> +            FIELD_DP32(cap_hdrs[which], CXL_DEV_##reg##_CAP_HDR0,       =
   \
> +                       CAP_ID, cap_id);                                 =
   \
> +        cap_hdrs[which] =3D FIELD_DP32(                                 =
     \
> +            cap_hdrs[which], CXL_DEV_##reg##_CAP_HDR0, CAP_VERSION, 1); =
   \
> +        cap_hdrs[which + 1] =3D                                         =
     \
> +            FIELD_DP32(cap_hdrs[which + 1], CXL_DEV_##reg##_CAP_HDR1,   =
   \
> +                       CAP_OFFSET, CXL_##reg##_REGISTERS_OFFSET);       =
   \
> +        cap_hdrs[which + 2] =3D                                         =
     \
> +            FIELD_DP32(cap_hdrs[which + 2], CXL_DEV_##reg##_CAP_HDR2,   =
   \
> +                       CAP_LENGTH, CXL_##reg##_REGISTERS_LENGTH);       =
   \
> +    } while (0)
> +
>  REG32(CXL_DEV_MAILBOX_CAP, 0)
>      FIELD(CXL_DEV_MAILBOX_CAP, PAYLOAD_SIZE, 0, 5)
>      FIELD(CXL_DEV_MAILBOX_CAP, INT_CAP, 5, 1)

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

