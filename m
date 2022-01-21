Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAE94964FE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 19:26:49 +0100 (CET)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAyca-0002Oo-Dm
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 13:26:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nAxp0-0005wH-Sw
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:35:34 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:33787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nAxoy-0002HN-ME
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:35:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.243])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 002DCD93F641;
 Fri, 21 Jan 2022 18:35:29 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 21 Jan
 2022 18:35:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002a8ad68f7-91bf-4c32-ab9c-0d15dca61a4d,
 0868046A3D5FFD4A19DAA1F3199B5438DDC438D4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ae1f4df9-ff4e-e49b-4365-711c6476b90c@kaod.org>
Date: Fri, 21 Jan 2022 18:35:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] ppc/pnv: Fail DMA access if page permissions are not
 correct
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220121152350.381685-1-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220121152350.381685-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b662c9f8-a382-407b-b4e6-6dfb13cc59bf
X-Ovh-Tracer-Id: 17213039253289208739
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegrihhksehoiihlrggsshdrrhhu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: aik@ozlabs.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/22 16:23, Frederic Barrat wrote:
> If an iommu page has wrong permissions, an error message is displayed,
> but the access is allowed, which is odd. This patch fixes it.


Being curious. How do you generate such errors ? could we have the
output ?

Thanks,

C.


> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>   hw/pci-host/pnv_phb3.c | 11 ++++++-----
>   hw/pci-host/pnv_phb4.c | 11 ++++++-----
>   2 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 7fb35dc031..a757f1a58e 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -816,18 +816,19 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace *ds, hwaddr addr,
>           }
>   
>           /* We exit the loop with TCE being the final TCE */
> -        tce_mask = ~((1ull << tce_shift) - 1);
> -        tlb->iova = addr & tce_mask;
> -        tlb->translated_addr = tce & tce_mask;
> -        tlb->addr_mask = ~tce_mask;
> -        tlb->perm = tce & 3;
>           if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
>               phb3_error(phb, "TCE access fault at 0x%"PRIx64, taddr);
>               phb3_error(phb, " xlate %"PRIx64":%c TVE=%"PRIx64, addr,
>                          is_write ? 'W' : 'R', tve);
>               phb3_error(phb, " tta=%"PRIx64" lev=%d tts=%d tps=%d",
>                          tta, lev, tts, tps);
> +            return;
>           }
> +        tce_mask = ~((1ull << tce_shift) - 1);
> +        tlb->iova = addr & tce_mask;
> +        tlb->translated_addr = tce & tce_mask;
> +        tlb->addr_mask = ~tce_mask;
> +        tlb->perm = tce & 3;
>       }
>   }
>   
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index a78add75b0..ee56377c02 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1291,18 +1291,19 @@ static void pnv_phb4_translate_tve(PnvPhb4DMASpace *ds, hwaddr addr,
>           }
>   
>           /* We exit the loop with TCE being the final TCE */
> -        tce_mask = ~((1ull << tce_shift) - 1);
> -        tlb->iova = addr & tce_mask;
> -        tlb->translated_addr = tce & tce_mask;
> -        tlb->addr_mask = ~tce_mask;
> -        tlb->perm = tce & 3;
>           if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
>               phb_error(ds->phb, "TCE access fault at 0x%"PRIx64, taddr);
>               phb_error(ds->phb, " xlate %"PRIx64":%c TVE=%"PRIx64, addr,
>                          is_write ? 'W' : 'R', tve);
>               phb_error(ds->phb, " tta=%"PRIx64" lev=%d tts=%d tps=%d",
>                          tta, lev, tts, tps);
> +            return;
>           }
> +        tce_mask = ~((1ull << tce_shift) - 1);
> +        tlb->iova = addr & tce_mask;
> +        tlb->translated_addr = tce & tce_mask;
> +        tlb->addr_mask = ~tce_mask;
> +        tlb->perm = tce & 3;
>       }
>   }
>   
> 


