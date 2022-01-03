Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C36482F08
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 09:33:12 +0100 (CET)
Received: from localhost ([::1]:46910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ImF-0005yF-PH
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 03:33:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4IlQ-0005Jf-Qe
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:32:20 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:44413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4IlO-00073T-TE
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:32:20 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 65B97D525993;
 Mon,  3 Jan 2022 09:32:17 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 3 Jan
 2022 09:32:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0057702cdee-6bd1-4026-8dd0-9428bfd8adf0,
 71ABFCEAB0EE88409933ED7B68EF8EFCD2601B88) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1be78adc-6266-e27d-55ce-5ee08240da05@kaod.org>
Date: Mon, 3 Jan 2022 09:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 05/17] pnv.c: simplify pnv_phb_attach_root_port()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
 <20211228193806.1198496-6-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211228193806.1198496-6-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5653b9d6-dc80-40b5-aaaf-0df6327a789e
X-Ovh-Tracer-Id: 13011180800978095072
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeftddguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/21 20:37, Daniel Henrique Barboza wrote:
> The root port 'chassis' and 'slot' attributes are being set in the
> realize() callback of phb3_root_port and phb4_root_port.
> 
> Remove the unneeded 'chassis' and 'slot' setting from
> pnv_phb_attach_root_port().

You should simply resend a modified version of the patch introducing
pnv_phb_attach_root_port() I think.

Thanks,

C.


> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/ppc/pnv.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 1bd84d20c1..605296fab5 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1222,12 +1222,10 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
>   }
>   
>   /* Attach a root port */
> -static void pnv_phb_attach_root_port(PCIHostState *pci, int id, const char *name)
> +static void pnv_phb_attach_root_port(PCIHostState *pci, const char *name)
>   {
>       PCIDevice *root = pci_new(PCI_DEVFN(0, 0), name);
>   
> -    qdev_prop_set_uint8(&root->qdev, "chassis", id);
> -    qdev_prop_set_uint16(&root->qdev, "slot", id);
>       pci_realize_and_unref(root, pci->bus, &error_fatal);
>   }
>   
> @@ -1326,7 +1324,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>               return;
>           }
>   
> -        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), phb->phb_id,
> +        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
>                                    TYPE_PNV_PHB3_ROOT_PORT);
>       }
>   }
> @@ -1506,7 +1504,7 @@ static void pnv_chip_power9_pec_realize(PnvChip *chip, Error **errp)
>           for (j = 0; j < pec->num_stacks; j++) {
>               PnvPHB4 *phb = &pec->stacks[j].phb;
>   
> -            pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), phb->phb_id,
> +            pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
>                                        TYPE_PNV_PHB4_ROOT_PORT);
>           }
>       }
> @@ -1754,7 +1752,7 @@ static void pnv_chip_power10_phb_realize(PnvChip *chip, Error **errp)
>           for (j = 0; j < pec->num_stacks; j++) {
>               PnvPHB4 *phb = &pec->stacks[j].phb;
>   
> -            pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), phb->phb_id,
> +            pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
>                                        TYPE_PNV_PHB5_ROOT_PORT);
>           }
>       }
> 


