Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6BA4D4E7D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 17:18:28 +0100 (CET)
Received: from localhost ([::1]:41998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSLUh-00036F-Aa
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 11:18:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nSLT0-0001a7-29
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:16:42 -0500
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:60235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nSLSx-0002Me-Jl
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:16:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 3487422913;
 Thu, 10 Mar 2022 16:16:29 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 10 Mar
 2022 17:16:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005bd386be3-3c86-4dc6-8291-93ac589ded40,
 50FE52C2FF4DE979A383A870B6AFEB2A520DEB89) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Message-ID: <2d028874-39c3-fd8b-3c6c-bb2c5ba233d9@kaod.org>
Date: Thu, 10 Mar 2022 17:16:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] ppc/pnv: Introduce a pnv-phb5 device to match root
 port
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220310155101.294568-1-fbarrat@linux.ibm.com>
 <20220310155101.294568-2-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220310155101.294568-2-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e6721956-1fc7-473c-bfdf-ccd8981700f7
X-Ovh-Tracer-Id: 2620250559969594336
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvtddgkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 16:50, Frederic Barrat wrote:
> We already have the pnv-phb3 and pnv-phb4 devices for POWER8 and
> POWER9 respectively. POWER10 uses version 5 of the PHB. It is very
> close to the PHB4 from POWER9, at least in our model and we could
> almost keep using the PHB4 model. However the matching root port
> pnv-phb5-root-port is specific to POWER10 so to avoid confusion as
> well as making it easy to introduce differences later, we create a
> pnv-phb5 class, which is mostly an alias for pnv-phb4 for now.
> 
> With this patch, the command line for a user-created PHB on powernv10
> becomes:
>    -machine powernv10 -nodefaults -device pnv-phb5 -device pnv-phb5-root-port
> 
> Fixes: 623575e16cd5 ("ppc/pnv: Add model for POWER10 PHB5 PCIe Host bridge")
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Queued for 7.0.

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4.c         | 7 +++++++
>   hw/pci-host/pnv_phb4_pec.c     | 9 +++++----
>   include/hw/pci-host/pnv_phb4.h | 5 +++++
>   3 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index b5b384e9ee..d1a911f988 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1783,6 +1783,12 @@ static const TypeInfo pnv_phb4_type_info = {
>       }
>   };
>   
> +static const TypeInfo pnv_phb5_type_info = {
> +    .name          = TYPE_PNV_PHB5,
> +    .parent        = TYPE_PNV_PHB4,
> +    .instance_size = sizeof(PnvPHB4),
> +};
> +
>   static void pnv_phb4_root_bus_class_init(ObjectClass *klass, void *data)
>   {
>       BusClass *k = BUS_CLASS(klass);
> @@ -1907,6 +1913,7 @@ static void pnv_phb4_register_types(void)
>       type_register_static(&pnv_phb5_root_port_info);
>       type_register_static(&pnv_phb4_root_port_info);
>       type_register_static(&pnv_phb4_type_info);
> +    type_register_static(&pnv_phb5_type_info);
>       type_register_static(&pnv_phb4_iommu_memory_region_info);
>   }
>   
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 0ab36e9c8f..a0dfa77c84 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -116,7 +116,8 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>                                           int stack_no,
>                                           Error **errp)
>   {
> -    PnvPHB4 *phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> +    PnvPHB4 *phb = PNV_PHB4(qdev_new(pecc->phb_type));
>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
>   
>       object_property_set_link(OBJECT(phb), "pec", OBJECT(pec),
> @@ -131,9 +132,7 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>       }
>   
>       /* Add a single Root port if running with defaults */
> -    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
> -                             PNV_PHB4_PEC_GET_CLASS(pec)->rp_model);
> -
> +    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), pecc->rp_model);
>   }
>   
>   static void pnv_pec_realize(DeviceState *dev, Error **errp)
> @@ -265,6 +264,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
>       pecc->stk_compat = stk_compat;
>       pecc->stk_compat_size = sizeof(stk_compat);
>       pecc->version = PNV_PHB4_VERSION;
> +    pecc->phb_type = TYPE_PNV_PHB4;
>       pecc->num_phbs = pnv_pec_num_phbs;
>       pecc->rp_model = TYPE_PNV_PHB4_ROOT_PORT;
>   }
> @@ -317,6 +317,7 @@ static void pnv_phb5_pec_class_init(ObjectClass *klass, void *data)
>       pecc->stk_compat = stk_compat;
>       pecc->stk_compat_size = sizeof(stk_compat);
>       pecc->version = PNV_PHB5_VERSION;
> +    pecc->phb_type = TYPE_PNV_PHB5;
>       pecc->num_phbs = pnv_phb5_pec_num_stacks;
>       pecc->rp_model = TYPE_PNV_PHB5_ROOT_PORT;
>   }
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index fbcf5bfb55..b02ecdceaa 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -203,6 +203,7 @@ struct PnvPhb4PecClass {
>       const char *stk_compat;
>       int stk_compat_size;
>       uint64_t version;
> +    const char *phb_type;
>       const uint32_t *num_phbs;
>       const char *rp_model;
>   };
> @@ -211,6 +212,10 @@ struct PnvPhb4PecClass {
>    * POWER10 definitions
>    */
>   
> +#define TYPE_PNV_PHB5 "pnv-phb5"
> +#define PNV_PHB5(obj) \
> +    OBJECT_CHECK(PnvPhb4, (obj), TYPE_PNV_PHB5)
> +
>   #define PNV_PHB5_VERSION           0x000000a500000001ull
>   #define PNV_PHB5_DEVICE_ID         0x0652
>   
x	

