Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9B04CA1BC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 11:05:18 +0100 (CET)
Received: from localhost ([::1]:51574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPLrB-0005Cs-IC
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 05:05:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPLon-0004N6-1e
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:02:49 -0500
Received: from [2a00:1450:4864:20::62c] (port=40463
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPLok-0003sE-TS
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:02:48 -0500
Received: by mail-ej1-x62c.google.com with SMTP id p15so2551354ejc.7
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 02:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CEyFdGZ4NDGvlPW9W8Qw2obeZKrSwxw5+wQygpI24AU=;
 b=qhCTZs6n7Gt12TSqKvV52YSX9+FaG/NF3/OIB+ut4wvyhxrBSkX0958Ky41AElqq3B
 LzbgJ0oTXS7fajPDSbzBbPdEZfvtvXl9b7O4vjQ6v3nVDCX4C1H87081yr4CRrGojtY1
 KArfqm+aKh7+oQKHz9C95BvK+UgNe5J7hpP6Mmz5xvIAbp7crQcxi4AF3OJtnbqCzThc
 CojrWnC5O67LbOvi8EoGJgzqnTEx9fFrDYicSoLpe0VQelYyakyzZM44gKSxoivFlXrJ
 mG43fCqns/rfzKqRVhpxQCDmErj5pTJV4xkvWDlKuJQ/+aYLdbT9ogVTNLhQvFlOb495
 uzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CEyFdGZ4NDGvlPW9W8Qw2obeZKrSwxw5+wQygpI24AU=;
 b=PR/6eAdBfo/qF10UXQn7Wc2EIAlIw8ztNr/FToMbb7vxSzLERyvUIfUgTYyBBVdE0a
 riktx29o4IE6PRnXj526ZsuFpfzsr4Sz+BRtKQ9OnHR+230Mht3yh7I5j3YMhxdDs5IR
 YxEkn6mPusQMc8hgPOHvnqDi3iZn5nN3PYjrfcKsNj9OmtFwYf4+Kja2iSOV86/p1QkF
 6FS4Oc1CsJ5+7vth1gPBHkQePK1/jNWk8SkghTpsfMAdeYeJTW9Er8oLRJqtEpHzchtS
 Vdz01YJLS77mIs2pe4pw3qXqDj5YaWYEncvEvDI+22wUr3kZUSq4tGhPrNvZt7XRIfqR
 j7rQ==
X-Gm-Message-State: AOAM533moLFRUY+Vgl2zK6FwdrrJU7h633sNFJc0Waw0HLHHEyPW3dDG
 GdReAklQkNI1oDv05soxkiKnXA==
X-Google-Smtp-Source: ABdhPJwTGSgcywkqr8NTeW2GoIzODYYijilJ1R1QbnEGEr12DgzIbDLkHICcD+MqTBmSbjW0qLrFTw==
X-Received: by 2002:a17:907:1c9a:b0:6d8:633c:be32 with SMTP id
 nb26-20020a1709071c9a00b006d8633cbe32mr2804272ejc.159.1646215364736; 
 Wed, 02 Mar 2022 02:02:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a056402051600b00415a0cbd561sm1204294edv.74.2022.03.02.02.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 02:02:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 915881FFB7;
 Wed,  2 Mar 2022 10:02:42 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-22-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 21/43] hw/cxl/device: Plumb real Label Storage Area
 (LSA) sizing
Date: Wed, 02 Mar 2022 10:01:48 +0000
In-reply-to: <20220211120747.3074-22-Jonathan.Cameron@huawei.com>
Message-ID: <871qzkllj1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 .  Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
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
> This should introduce no change. Subsequent work will make use of this
> new class member.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/cxl/cxl-mailbox-utils.c  |  3 +++
>  hw/mem/cxl_type3.c          | 24 +++++++++---------------
>  include/hw/cxl/cxl_device.h | 29 +++++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+), 15 deletions(-)
>
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index d022711b2a..ccf9c3d794 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -278,6 +278,8 @@ static ret_code cmd_identify_memory_device(struct cxl=
_cmd *cmd,
>      } __attribute__((packed)) *id;
>      _Static_assert(sizeof(*id) =3D=3D 0x43, "Bad identify size");
>=20=20
> +    CXLType3Dev *ct3d =3D container_of(cxl_dstate, CXLType3Dev, cxl_dsta=
te);
> +    CXLType3Class *cvc =3D CXL_TYPE3_DEV_GET_CLASS(ct3d);
>      uint64_t size =3D cxl_dstate->pmem_size;
>=20=20
>      if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
> @@ -292,6 +294,7 @@ static ret_code cmd_identify_memory_device(struct cxl=
_cmd *cmd,
>=20=20
>      id->total_capacity =3D size / (256 << 20);
>      id->persistent_capacity =3D size / (256 << 20);
> +    id->lsa_size =3D cvc->get_lsa_size(ct3d);
>=20=20
>      *len =3D sizeof(*id);
>      return CXL_MBOX_SUCCESS;
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index da091157f2..b16262d3cc 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -13,21 +13,6 @@
>  #include "sysemu/hostmem.h"
>  #include "hw/cxl/cxl.h"
>=20=20
> -typedef struct cxl_type3_dev {
> -    /* Private */
> -    PCIDevice parent_obj;
> -
> -    /* Properties */
> -    uint64_t size;
> -    HostMemoryBackend *hostmem;
> -
> -    /* State */
> -    CXLComponentState cxl_cstate;
> -    CXLDeviceState cxl_dstate;
> -} CXLType3Dev;
> -
> -#define CT3(obj) OBJECT_CHECK(CXLType3Dev, (obj), TYPE_CXL_TYPE3_DEV)
> -

If the structure had been in the header to start with it would be easier
to see the changes added for this bit.


>  static void build_dvsecs(CXLType3Dev *ct3d)
>  {
>      CXLComponentState *cxl_cstate =3D &ct3d->cxl_cstate;
> @@ -186,10 +171,16 @@ static Property ct3_props[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>=20=20
> +static uint64_t get_lsa_size(CXLType3Dev *ct3d)
> +{
> +    return 0;
> +}
> +
>  static void ct3_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(oc);
>      PCIDeviceClass *pc =3D PCI_DEVICE_CLASS(oc);
> +    CXLType3Class *cvc =3D CXL_TYPE3_DEV_CLASS(oc);
>=20=20
>      pc->realize =3D ct3_realize;
>      pc->class_id =3D PCI_CLASS_STORAGE_EXPRESS;
> @@ -201,11 +192,14 @@ static void ct3_class_init(ObjectClass *oc, void *d=
ata)
>      dc->desc =3D "CXL PMEM Device (Type 3)";
>      dc->reset =3D ct3d_reset;
>      device_class_set_props(dc, ct3_props);
> +
> +    cvc->get_lsa_size =3D get_lsa_size;
>  }
>=20=20
>  static const TypeInfo ct3d_info =3D {
>      .name =3D TYPE_CXL_TYPE3_DEV,
>      .parent =3D TYPE_PCI_DEVICE,
> +    .class_size =3D sizeof(struct CXLType3Class),
>      .class_init =3D ct3_class_init,
>      .instance_size =3D sizeof(CXLType3Dev),
>      .instance_finalize =3D ct3_finalize,
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index 8102d2a813..ebb391153a 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -230,4 +230,33 @@ REG64(CXL_MEM_DEV_STS, 0)
>      FIELD(CXL_MEM_DEV_STS, MBOX_READY, 4, 1)
>      FIELD(CXL_MEM_DEV_STS, RESET_NEEDED, 5, 3)
>=20=20
> +typedef struct cxl_type3_dev {
> +    /* Private */
> +    PCIDevice parent_obj;
> +
> +    /* Properties */
> +    uint64_t size;
> +    HostMemoryBackend *hostmem;
> +    HostMemoryBackend *lsa;
> +
> +    /* State */
> +    CXLComponentState cxl_cstate;
> +    CXLDeviceState cxl_dstate;
> +} CXLType3Dev;
> +
> +#ifndef TYPE_CXL_TYPE3_DEV
> +#define TYPE_CXL_TYPE3_DEV "cxl-type3"
> +#endif
> +
> +#define CT3(obj) OBJECT_CHECK(CXLType3Dev, (obj), TYPE_CXL_TYPE3_DEV)
> +OBJECT_DECLARE_TYPE(CXLType3Device, CXLType3Class, CXL_TYPE3_DEV)
> +
> +struct CXLType3Class {
> +    /* Private */
> +    PCIDeviceClass parent_class;
> +
> +    /* public */
> +    uint64_t (*get_lsa_size)(CXLType3Dev *ct3d);
> +};
> +
>  #endif


--=20
Alex Benn=C3=A9e

