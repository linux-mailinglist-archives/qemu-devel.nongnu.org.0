Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E0F4C9349
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 19:30:41 +0100 (CET)
Received: from localhost ([::1]:44716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP7Gi-0002Bv-AG
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 13:30:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nP7Eb-0000zW-96
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:28:29 -0500
Received: from [2a00:1450:4864:20::632] (port=40492
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nP7EZ-0005pK-Ln
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:28:28 -0500
Received: by mail-ej1-x632.google.com with SMTP id p15so33244655ejc.7
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 10:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qWn8f/zcEThACHHu7HzVrOzQdOqQBxED78bE6EUhDxE=;
 b=uyjWNcsW6mwFZ+AJ9vhsG4li0vju83daLrm05o/Dhis7pnHymq26RkKNv+rLIeCOzm
 bOTqZj+HQQBjTGh2DqhkO+3N4Jxl+y10jTQq6EcuUUEIpxFFG9Bb1YyDeLCBrlVrn7cm
 9BVXzPAAdsditQS3xSgdvyzqJvuhhKZz/4iJt+BuyMTEESONCpVmhIoEbsZZaS1q12/B
 fkNyN5y2/lO+ASUGAn2CQ8uWgDG1gkWC76A6Rsuy8sJgtRq0SI79WpFlBYgiwwmyeQ0G
 GvLUe2byeA84JAPip+49OgF55gwvGPnZ1P5Iu/ygD4s92k4DDi4wZmhutTjqzcETz/5E
 DMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qWn8f/zcEThACHHu7HzVrOzQdOqQBxED78bE6EUhDxE=;
 b=DIz1HsfNx0hcC2jvHJ1r3NTZz0rSIIjVVw5iXT4hCRP6LokUDh1HGa9SLt1Mqn86eR
 zyDkOtFPEJNTq+GuzIASfgx/h1iuCLTLNrHIeWUovHEjVHHcddAohmCfmxVo9Rmt4BLA
 h0VKrVIWClJlbfQMPKzXLjNP7dCw9CfzjGx628EDxYaYjH1q1XFr256cTSLBZ3kf7tmW
 mFDG2A6bzkK4FbTcmlNSKgj+r9bJ02WM9xLo//omlRs3ef3yyU562vzWTWQRioZCqN9H
 J7RWkVUZz/TDEzQi1t0cXHJPS6DPbMRMPn/5gHjZcZN2Q9bbxjmby0A1xXHYuq6GJ4JU
 X4vQ==
X-Gm-Message-State: AOAM533tkv2HVROJWx06N8XWDaEiZtMrexT6Itqn70EkkMHtKr1YOKDh
 BhYwcQw95uf6SXe+PUKNXbjN6w==
X-Google-Smtp-Source: ABdhPJwYK263NnIBiELmpbYksqmULeF1YL2l/SICdrtOZ6R5LGVyVPMFshHx7y980IKq5nQHJllq2w==
X-Received: by 2002:a17:906:a1a:b0:6cf:d2d9:410c with SMTP id
 w26-20020a1709060a1a00b006cfd2d9410cmr20199459ejf.713.1646159305949; 
 Tue, 01 Mar 2022 10:28:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 h30-20020a056402095e00b00412b81dd96esm7371133edz.29.2022.03.01.10.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 10:28:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F05E1FFB7;
 Tue,  1 Mar 2022 18:28:24 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-20-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 19/43] hw/cxl/device: Implement MMIO HDM decoding
 (8.2.5.12)
Date: Tue, 01 Mar 2022 18:17:35 +0000
In-reply-to: <20220211120747.3074-20-Jonathan.Cameron@huawei.com>
Message-ID: <87a6e9le7r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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
> A device's volatile and persistent memory are known Host Defined Memory
> (HDM) regions. The mechanism by which the device is programmed to claim
> the addresses associated with those regions is through dedicated logic
> known as the HDM decoder. In order to allow the OS to properly program
> the HDMs, the HDM decoders must be modeled.
>
> There are two ways the HDM decoders can be implemented, the legacy
> mechanism is through the PCIe DVSEC programming from CXL 1.1 (8.1.3.8),
> and MMIO is found in 8.2.5.12 of the spec. For now, 8.1.3.8 is not
> implemented.
>
> Much of CXL device logic is implemented in cxl-utils. The HDM decoder
> however is implemented directly by the device implementation.
> Whilst the implementation currently does no validity checks on the
> encoder set up, future work will add sanity checking specific to
> the type of cxl component.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/mem/cxl_type3.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index c4021d2434..da091157f2 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -61,6 +61,56 @@ static void build_dvsecs(CXLType3Dev *ct3d)
>                                 REG_LOC_DVSEC_REVID, dvsec);
>  }
>=20=20
> +static void hdm_decoder_commit(CXLType3Dev *ct3d, int which)
> +{
> +    ComponentRegisters *cregs =3D &ct3d->cxl_cstate.crb;
> +    uint32_t *cache_mem =3D cregs->cache_mem_registers;
> +
> +    assert(which =3D=3D 0);
> +
> +    /* TODO: Sanity checks that the decoder is possible */
> +    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
> +    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, ERR, 0);
> +
> +    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
> +}
> +
> +static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
> +                           unsigned size)
> +{
> +    CXLComponentState *cxl_cstate =3D opaque;
> +    ComponentRegisters *cregs =3D &cxl_cstate->crb;
> +    CXLType3Dev *ct3d =3D container_of(cxl_cstate, CXLType3Dev, cxl_csta=
te);
> +    uint32_t *cache_mem =3D cregs->cache_mem_registers;
> +    bool should_commit =3D false;
> +    int which_hdm =3D -1;
> +
> +    assert(size =3D=3D 4);

Maybe add:

      g_assert(offset <=3D (CXL2_COMPONENT_CM_REGION_SIZE >> 2));


> +
> +    switch (offset) {
> +    case A_CXL_HDM_DECODER0_CTRL:
> +        should_commit =3D FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, COMMI=
T);
> +        which_hdm =3D 0;
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    stl_le_p((uint8_t *)cache_mem + offset, value);
> +    if (should_commit) {
> +        hdm_decoder_commit(ct3d, which_hdm);
> +    }
> +}
> +
> +static void ct3_finalize(Object *obj)
> +{
> +    CXLType3Dev *ct3d =3D CT3(obj);
> +    CXLComponentState *cxl_cstate =3D &ct3d->cxl_cstate;
> +    ComponentRegisters *regs =3D &cxl_cstate->crb;
> +
> +    g_free((void *)regs->special_ops);

nit: you don't need to cast her.

> +}
> +
>  static void cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
>  {
>      MemoryRegion *mr;
> @@ -103,6 +153,9 @@ static void ct3_realize(PCIDevice *pci_dev, Error **e=
rrp)
>      ct3d->cxl_cstate.pdev =3D pci_dev;
>      build_dvsecs(ct3d);
>=20=20
> +    regs->special_ops =3D g_new0(MemoryRegionOps, 1);
> +    regs->special_ops->write =3D ct3d_reg_write;
> +
>      cxl_component_register_block_init(OBJECT(pci_dev), cxl_cstate,
>                                        TYPE_CXL_TYPE3_DEV);
>=20=20
> @@ -155,6 +208,7 @@ static const TypeInfo ct3d_info =3D {
>      .parent =3D TYPE_PCI_DEVICE,
>      .class_init =3D ct3_class_init,
>      .instance_size =3D sizeof(CXLType3Dev),
> +    .instance_finalize =3D ct3_finalize,
>      .interfaces =3D (InterfaceInfo[]) {
>          { INTERFACE_CXL_DEVICE },
>          { INTERFACE_PCIE_DEVICE },

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

