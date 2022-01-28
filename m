Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0557D49FFB3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:41:44 +0100 (CET)
Received: from localhost ([::1]:56006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDVFn-0006Qr-4q
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:41:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nDUGn-00028o-Cw
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:38:41 -0500
Received: from [2a00:1450:4864:20::433] (port=41819
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nDUGl-00087g-Fg
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:38:40 -0500
Received: by mail-wr1-x433.google.com with SMTP id h21so11926348wrb.8
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 08:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=C4Ggj/gYiQ0JRxIpeEcODNj165LurJdj6zgn4gKVH28=;
 b=opBpVy4/+F9Wxe+Kn0TNRlXTKX+rTDhhUQRaxJ/TSdaR2HErtj8gSAhUMoDlpMV/FR
 uFrWv9rjSFN+NzSOf5eX3ozJv18QLh4rJDf6YIGbHHRxxz6SoxXJiHwEAMgyj5zmrUd/
 bJxhk97LRJXMy+7YOo8pYS2fLbDl7iFutxp4eiwQiGPW+C1fOmzhf5LBlyY/RF+vrH0p
 HkJZ1cl+SwiT1GAPX8SUqefEz9lKv+Tbr4oyebD+XM6TpIMx9bji6D4NmravFFyK9oQb
 DPbs2DGZdbGrVrzh5VKRFtPlWu2yWWGYAOZNQ7+0MNRZMDq9AhH3GZPnbmwOm8/dDFjW
 y3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=C4Ggj/gYiQ0JRxIpeEcODNj165LurJdj6zgn4gKVH28=;
 b=PqCFOG6oQitsHQOxY1G693z7RRd7/UDBkQjZjwu/ElgsxyLbg6rIK1CXXddFJ+iXyC
 DU0eH1oru6WEXWcFTVgEwCw+4GDgpQPsEd9gM9LKNiU6iEQ+I2lEcRRXjvClbLp0kmi1
 C193morDPhviudKwTZM/qKF7pmtguy4OnY3vSfFL6Ts7Rm8scgwQtq0wtR8IFcVKIeqE
 Cgg19XpRPEatQ9p4pqEIGkUCJlqklmKuancY34hMi4JoKEmL9onzY9z262J0OcmAY31c
 rmX9URSvnMEhlXebEDV1pH32xPVU+Gc4TPfvx1kbOguA6EAFKKgQDh0Tf7wEpPJz+hf9
 ZdfQ==
X-Gm-Message-State: AOAM533TDbhApeuTNpc7/WJAMJHsyXCL7yRlZsVv4tEXv3tYKPYNFNR3
 Ru1oMVb+bCd/2utXXUMtFDY/NA==
X-Google-Smtp-Source: ABdhPJwHby4B8sxBZ1gBb/xW91TLcnBNy08WeKk3H5DAk/M6rUSpsWp0iKRw99IyMwII+yyBc0ljow==
X-Received: by 2002:a05:6000:4:: with SMTP id h4mr7426100wrx.336.1643387916970; 
 Fri, 28 Jan 2022 08:38:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n2sm5784725wrw.63.2022.01.28.08.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 08:38:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C2FC1FFB7;
 Fri, 28 Jan 2022 16:38:35 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-6-Jonathan.Cameron@huawei.com>
 <87tudqbbr7.fsf@linaro.org> <20220128151607.000022b7@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 05/42] hw/cxl/device: Implement the CAP array
 (8.2.8.1-2)
Date: Fri, 28 Jan 2022 16:37:45 +0000
In-reply-to: <20220128151607.000022b7@huawei.com>
Message-ID: <87czkb95o4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

> On Wed, 26 Jan 2022 18:17:12 +0000
> Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
>> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
>>=20
>> > From: Ben Widawsky <ben.widawsky@intel.com>
>> >
>> > This implements all device MMIO up to the first capability. That
>> > includes the CXL Device Capabilities Array Register, as well as all of
>> > the CXL Device Capability Header Registers. The latter are filled in as
>> > they are implemented in the following patches.
>> >
>> > Endianness and alignment are managed by softmmu memory core.
>> >
>> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
>> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> > ---
>> >  hw/cxl/cxl-device-utils.c   | 105 ++++++++++++++++++++++++++++++++++++
>> >  hw/cxl/meson.build          |   1 +
>> >  include/hw/cxl/cxl_device.h |  28 +++++++++-
>> >  3 files changed, 133 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
>> > new file mode 100644
>> > index 0000000000..cb1b0a8217
>> > --- /dev/null
>> > +++ b/hw/cxl/cxl-device-utils.c
>> > @@ -0,0 +1,105 @@
>> > +/*
>> > + * CXL Utility library for devices
>> > + *
>> > + * Copyright(C) 2020 Intel Corporation.
>> > + *
>> > + * This work is licensed under the terms of the GNU GPL, version 2. S=
ee the
>> > + * COPYING file in the top-level directory.
>> > + */
>> > +
>> > +#include "qemu/osdep.h"
>> > +#include "qemu/log.h"
>> > +#include "hw/cxl/cxl.h"
>> > +
>> > +/*
>> > + * Device registers have no restrictions per the spec, and so fall ba=
ck to the
>> > + * default memory mapped register rules in 8.2:
>> > + *   Software shall use CXL.io Memory Read and Write to access memory=
 mapped
>> > + *   register defined in this section. Unless otherwise specified, so=
ftware
>> > + *   shall restrict the accesses width based on the following:
>> > + *   =E2=80=A2 A 32 bit register shall be accessed as a 1 Byte, 2 Byt=
es or 4 Bytes
>> > + *     quantity.
>> > + *   =E2=80=A2 A 64 bit register shall be accessed as a 1 Byte, 2 Byt=
es, 4 Bytes or 8
>> > + *     Bytes
>> > + *   =E2=80=A2 The address shall be a multiple of the access width, e=
.g. when
>> > + *     accessing a register as a 4 Byte quantity, the address shall be
>> > + *     multiple of 4.
>> > + *   =E2=80=A2 The accesses shall map to contiguous bytes.If these ru=
les are not
>> > + *     followed, the behavior is undefined
>> > + */
>> > +
>> > +static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned s=
ize)
>> > +{
>> > +    CXLDeviceState *cxl_dstate =3D opaque;
>> > +
>> > +    return cxl_dstate->caps_reg_state32[offset / 4];
>> > +}
>> > +
>> > +static uint64_t dev_reg_read(void *opaque, hwaddr offset, unsigned si=
ze)
>> > +{
>> > +    return 0;
>> > +}
>> > +
>> > +static const MemoryRegionOps dev_ops =3D {
>> > +    .read =3D dev_reg_read,
>> > +    .write =3D NULL, /* status register is read only */
>> > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>> > +    .valid =3D {
>> > +        .min_access_size =3D 1,
>> > +        .max_access_size =3D 8,
>> > +        .unaligned =3D false,
>> > +    },
>> > +    .impl =3D {
>> > +        .min_access_size =3D 1,
>> > +        .max_access_size =3D 8,
>> > +    },
>> > +};=20=20
>>=20
>> I think for >64 bit registers you need to use the read_with_attrs=20
>
> I don't follow this comment.  Max access to registers is 64 bits.
> A few are documented as 128 bit or indeed larger in the spec, but the
> access is as if they were multiple 64 bit registers accesses.
> It's not permissible to do a single 128bit access for example.

No that was my brain fart - of course 8 bytes =3D 64 bit which is fine for
the current accesses functions (unless you want bus faults).

>
> The F4 errata clarified that - previously it was rather unclear what
> the restrictions on access to the larger registers were.
>
> I've updated a few comments on this to reflect the errata.
>
> Thanks,
>
> Jonathan


--=20
Alex Benn=C3=A9e

