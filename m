Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CAE4D4E80
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 17:18:37 +0100 (CET)
Received: from localhost ([::1]:42564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSLUq-0003Ty-JJ
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 11:18:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nSLTJ-0001vg-Kb; Thu, 10 Mar 2022 11:17:01 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:40475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nSLTI-0002Ox-2o; Thu, 10 Mar 2022 11:17:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.206])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A683E228C9;
 Thu, 10 Mar 2022 16:16:58 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 10 Mar
 2022 17:16:58 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005bcc28bdd-d4bf-45da-8458-153329688d47,
 50FE52C2FF4DE979A383A870B6AFEB2A520DEB89) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Message-ID: <33279312-29c0-ecfe-0213-13ede3278212@kaod.org>
Date: Thu, 10 Mar 2022 17:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] ppc/pnv: Fixes for user-created pnv-phb5 devices
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220310155101.294568-1-fbarrat@linux.ibm.com>
 <20220310155101.294568-3-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220310155101.294568-3-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d40f71ae-26b9-4c8d-8f30-13f821dfe43c
X-Ovh-Tracer-Id: 2628413336776379360
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvtddgkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 3/10/22 16:51, Frederic Barrat wrote:
> Two small fixes to fix user-created devices for POWER10:
> - always create the PECs (PCI Express Controller) for the system. The
> PECs host the PHBs and we try to find the matching PEC when creating a
> PHB, so it must exist. It also matches what we do on POWER9
> - the machine class must allow dynamically allocated system bus
> 
> Fixes: 623575e16cd5 ("ppc/pnv: Add model for POWER10 PHB5 PCIe Host bridge")
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>   hw/ppc/pnv.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Queued for 7.0.

Thanks,

C.


> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 0ac86e104f..df58403a3a 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1600,9 +1600,7 @@ static void pnv_chip_power10_instance_init(Object *obj)
>       object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
>       object_initialize_child(obj, "homer", &chip10->homer, TYPE_PNV10_HOMER);
>   
> -    if (defaults_enabled()) {
> -        chip->num_pecs = pcc->num_pecs;
> -    }
> +    chip->num_pecs = pcc->num_pecs;
>   
>       for (i = 0; i < chip->num_pecs; i++) {
>           object_initialize_child(obj, "pec[*]", &chip10->pecs[i],
> @@ -2171,6 +2169,8 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
>       pmc->dt_power_mgt = pnv_dt_power_mgt;
>   
>       xfc->match_nvt = pnv10_xive_match_nvt;
> +
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB5);
>   }
>   
>   static bool pnv_machine_get_hb(Object *obj, Error **errp)


