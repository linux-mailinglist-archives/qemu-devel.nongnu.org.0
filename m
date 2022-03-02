Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56B74CA1DE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 11:10:44 +0100 (CET)
Received: from localhost ([::1]:54862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPLwQ-0007gB-Nz
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 05:10:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPLue-0006zX-1Z
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:08:52 -0500
Received: from [2a00:1450:4864:20::431] (port=41687
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPLub-0004pd-Rf
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:08:51 -0500
Received: by mail-wr1-x431.google.com with SMTP id i8so1874583wrr.8
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 02:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BmU1Cm68ARI4+Jb/RYpxJtQVrn5VLXdD9Ez9K9XLa1c=;
 b=o/1QB1clQoqj1I+aOQujXjKtsG1nFEug0DpSJ719ZJo8lfFPPiap/fP1Lb1Q3L83p+
 WDAEv77AMUv0QgGXzzGkQlxwtu51W5W/Kkk92k0WKavCCuwlb/80kruTPVUlcKODVkKa
 FLw8mmCCGNzRX7/X1MTd4+tfXXnwSnVT8RK8onCZ/37jwqv+EUwsnPQUXpfR2kxdLIvZ
 8l0+9w0my9626O5JN3trpx1+Gce7zUQ2eMSsLv1sAbbaQe014H6xkFZ5bpRVJ4ufn0W6
 3SVqdmKdFguNdovQk6QXwpkupawD1mGQmUz1kTCGfACtEqCP4XD/7DMRZhuypggFPdM1
 Xdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BmU1Cm68ARI4+Jb/RYpxJtQVrn5VLXdD9Ez9K9XLa1c=;
 b=OkI3r1dFJjUQmqKwckrIgkD6h5526tVmaabKQd3o4QvC8bk7Dl6YHk0MLWR5ueFnzT
 8KDAG2Kg/nfEimmiD4DIk/vYXS00XGlb6UhlMunWWdDC4cXHzz9XLbP9lQRvt7ftXxt8
 U0cqQhEIRh3cBLVjX+LgItdCsAN1Azf+ckWshzTA1wZtW3WAfn1mHC3GhQ6zfRIRZzhl
 tDSCPzAhFw9nHxW3EXoI8MQr6RkvRyZmXQdf+83niq6SCon7+NKUgODWXDodqtKQ+9dY
 l07WaltibvI5gUejUAiCatKCgoBfe/Mzwn54ss/wOY5YDI7WRNrE+vO6puv02wl65wqr
 0CeQ==
X-Gm-Message-State: AOAM530QxGtnCOJT+a82kjYbuuRkUPYFRB5gXePOrD/ohHb371yZQPUo
 BdBiQPxspocjIZ/tcq9H33xG3Q==
X-Google-Smtp-Source: ABdhPJxrbOqoHGlW2XaQPKaIP2lmjMQsu/hiYMPvJ39LggA5+JpenT2XyrUqoldwg3Jjy2j1PqxoQA==
X-Received: by 2002:adf:fcd0:0:b0:1ef:31fe:d08e with SMTP id
 f16-20020adffcd0000000b001ef31fed08emr20505654wrs.667.1646215727318; 
 Wed, 02 Mar 2022 02:08:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a5d6089000000b001f0256761b9sm3121267wrt.45.2022.03.02.02.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 02:08:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 710C81FFB7;
 Wed,  2 Mar 2022 10:08:45 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-23-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 22/43] hw/cxl/device: Implement get/set Label Storage
 Area (LSA)
Date: Wed, 02 Mar 2022 10:03:34 +0000
In-reply-to: <20220211120747.3074-23-Jonathan.Cameron@huawei.com>
Message-ID: <87wnhck6oi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
> Implement get and set handlers for the Label Storage Area
> used to hold data describing persistent memory configuration
> so that it can be ensured it is seen in the same configuration
> after reboot.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/cxl/cxl-mailbox-utils.c  | 57 +++++++++++++++++++++++++++++++++++++
>  hw/mem/cxl_type3.c          | 56 +++++++++++++++++++++++++++++++++++-
>  include/hw/cxl/cxl_device.h |  5 ++++
>  3 files changed, 117 insertions(+), 1 deletion(-)
>
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index ccf9c3d794..f4a309ddbf 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -56,6 +56,8 @@ enum {
>          #define MEMORY_DEVICE 0x0
>      CCLS        =3D 0x41,
>          #define GET_PARTITION_INFO     0x0
> +        #define GET_LSA       0x2
> +        #define SET_LSA       0x3
>  };
>=20=20
>  /* 8.2.8.4.5.1 Command Return Codes */
> @@ -327,7 +329,59 @@ static ret_code cmd_ccls_get_partition_info(struct c=
xl_cmd *cmd,
>      return CXL_MBOX_SUCCESS;
>  }
>=20=20
> +static ret_code cmd_ccls_get_lsa(struct cxl_cmd *cmd,
> +                                 CXLDeviceState *cxl_dstate,
> +                                 uint16_t *len)
> +{
> +    struct {
> +        uint32_t offset;
> +        uint32_t length;
> +    } __attribute__((packed, __aligned__(8))) *get_lsa;
> +    CXLType3Dev *ct3d =3D container_of(cxl_dstate, CXLType3Dev, cxl_dsta=
te);
> +    CXLType3Class *cvc =3D CXL_TYPE3_DEV_GET_CLASS(ct3d);
> +    uint32_t offset, length;
> +
> +    get_lsa =3D (void *)cmd->payload;
> +    offset =3D get_lsa->offset;
> +    length =3D get_lsa->length;
> +
> +    *len =3D 0;

This can drop into the failure leg.

> +    if (offset + length > cvc->get_lsa_size(ct3d)) {
> +        return CXL_MBOX_INVALID_INPUT;
> +    }
> +
> +    *len =3D cvc->get_lsa(ct3d, get_lsa, length, offset);
> +    return CXL_MBOX_SUCCESS;
> +}
> +
> +static ret_code cmd_ccls_set_lsa(struct cxl_cmd *cmd,
> +                                 CXLDeviceState *cxl_dstate,
> +                                 uint16_t *len)
> +{
> +    struct {
> +        uint32_t offset;
> +        uint32_t rsvd;
> +    } __attribute__((packed, __aligned__(8))) *set_lsa =3D (void *)cmd->=
payload;
> +    CXLType3Dev *ct3d =3D container_of(cxl_dstate, CXLType3Dev, cxl_dsta=
te);
> +    CXLType3Class *cvc =3D CXL_TYPE3_DEV_GET_CLASS(ct3d);
> +    uint16_t plen =3D *len;
> +
> +    *len =3D 0;
> +    if (!plen) {
> +        return CXL_MBOX_SUCCESS;
> +    }
> +
> +    if (set_lsa->offset + plen > cvc->get_lsa_size(ct3d) + sizeof(*set_l=
sa)) {
> +        return CXL_MBOX_INVALID_INPUT;
> +    }
> +
> +    cvc->set_lsa(ct3d, (void *)set_lsa + sizeof(*set_lsa),
> +                 plen - sizeof(*set_lsa), set_lsa->offset);

All these sizeof's make me wonder if these structures should be public
with a #define? Failing that having

  const size_t lsa_len =3D sizeof(*set_lsa);

and use that might make the flow a bit easier to scan. That said why
isn't set_lsa taking a type of *set_lsa instead of having void casts?

> +    return CXL_MBOX_SUCCESS;
> +}
> +
>  #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
> +#define IMMEDIATE_DATA_CHANGE (1 << 2)
>  #define IMMEDIATE_POLICY_CHANGE (1 << 3)
>  #define IMMEDIATE_LOG_CHANGE (1 << 4)
>=20=20
> @@ -350,6 +404,9 @@ static struct cxl_cmd cxl_cmd_set[256][256] =3D {
>          cmd_identify_memory_device, 0, 0 },
>      [CCLS][GET_PARTITION_INFO] =3D { "CCLS_GET_PARTITION_INFO",
>          cmd_ccls_get_partition_info, 0, 0 },
> +    [CCLS][GET_LSA] =3D { "CCLS_GET_LSA", cmd_ccls_get_lsa, 0, 0 },
> +    [CCLS][SET_LSA] =3D { "CCLS_SET_LSA", cmd_ccls_set_lsa,
> +        ~0, IMMEDIATE_CONFIG_CHANGE | IMMEDIATE_DATA_CHANGE },
>  };
>=20=20
>  void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index b16262d3cc..b1ba4bf0de 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -8,6 +8,7 @@
>  #include "qapi/error.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> +#include "qemu/pmem.h"
>  #include "qemu/range.h"
>  #include "qemu/rcu.h"
>  #include "sysemu/hostmem.h"
> @@ -114,6 +115,11 @@ static void cxl_setup_memory(CXLType3Dev *ct3d, Erro=
r **errp)
>      memory_region_set_enabled(mr, true);
>      host_memory_backend_set_mapped(ct3d->hostmem, true);
>      ct3d->cxl_dstate.pmem_size =3D ct3d->hostmem->size;
> +
> +    if (!ct3d->lsa) {
> +        error_setg(errp, "lsa property must be set");
> +        return;
> +    }
>  }
>=20=20
>=20=20
> @@ -168,12 +174,58 @@ static Property ct3_props[] =3D {
>      DEFINE_PROP_SIZE("size", CXLType3Dev, size, -1),
>      DEFINE_PROP_LINK("memdev", CXLType3Dev, hostmem, TYPE_MEMORY_BACKEND,
>                       HostMemoryBackend *),
> +    DEFINE_PROP_LINK("lsa", CXLType3Dev, lsa, TYPE_MEMORY_BACKEND,
> +                     HostMemoryBackend *),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>=20=20
>  static uint64_t get_lsa_size(CXLType3Dev *ct3d)
>  {
> -    return 0;
> +    MemoryRegion *mr;
> +
> +    mr =3D host_memory_backend_get_memory(ct3d->lsa);
> +    return memory_region_size(mr);
> +}
> +
> +static void validate_lsa_access(MemoryRegion *mr, uint64_t size,
> +                                uint64_t offset)
> +{
> +    assert(offset + size <=3D memory_region_size(mr));
> +    assert(offset + size > offset);
> +}
> +
> +static uint64_t get_lsa(CXLType3Dev *ct3d, void *buf, uint64_t size,
> +                    uint64_t offset)
> +{
> +    MemoryRegion *mr;
> +    void *lsa;
> +
> +    mr =3D host_memory_backend_get_memory(ct3d->lsa);
> +    validate_lsa_access(mr, size, offset);
> +
> +    lsa =3D memory_region_get_ram_ptr(mr) + offset;
> +    memcpy(buf, lsa, size);
> +
> +    return size;
> +}
> +
> +static void set_lsa(CXLType3Dev *ct3d, const void *buf, uint64_t size,
> +                    uint64_t offset)
> +{
> +    MemoryRegion *mr;
> +    void *lsa;
> +
> +    mr =3D host_memory_backend_get_memory(ct3d->lsa);
> +    validate_lsa_access(mr, size, offset);
> +
> +    lsa =3D memory_region_get_ram_ptr(mr) + offset;
> +    memcpy(lsa, buf, size);
> +    memory_region_set_dirty(mr, offset, size);
> +
> +    /*
> +     * Just like the PMEM, if the guest is not allowed to exit gracefull=
y, label
> +     * updates will get lost.
> +     */
>  }
>=20=20
>  static void ct3_class_init(ObjectClass *oc, void *data)
> @@ -194,6 +246,8 @@ static void ct3_class_init(ObjectClass *oc, void *dat=
a)
>      device_class_set_props(dc, ct3_props);
>=20=20
>      cvc->get_lsa_size =3D get_lsa_size;
> +    cvc->get_lsa =3D get_lsa;
> +    cvc->set_lsa =3D set_lsa;
>  }
>=20=20
>  static const TypeInfo ct3d_info =3D {
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index ebb391153a..43908f161b 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -257,6 +257,11 @@ struct CXLType3Class {
>=20=20
>      /* public */
>      uint64_t (*get_lsa_size)(CXLType3Dev *ct3d);
> +
> +    uint64_t (*get_lsa)(CXLType3Dev *ct3d, void *buf, uint64_t size,
> +                        uint64_t offset);
> +    void (*set_lsa)(CXLType3Dev *ct3d, const void *buf, uint64_t size,
> +                    uint64_t offset);
>  };
>=20=20
>  #endif


--=20
Alex Benn=C3=A9e

