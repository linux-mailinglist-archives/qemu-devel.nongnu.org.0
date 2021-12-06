Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA461469655
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:09:00 +0100 (CET)
Received: from localhost ([::1]:44488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDjn-0004SQ-Aj
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:08:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muDey-0001US-P1
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 08:04:03 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:54617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muDew-0003X0-N7
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 08:04:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.13])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 2412C22646;
 Mon,  6 Dec 2021 13:03:55 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 14:03:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003ee6b9dd7-d3d4-4c79-8e3c-9e775afb5333,
 4EE5CA355A73348BB336A65EF5ADB9B11F7CB924) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <11cfaca1-eda5-68a6-1407-b2e4f69747ab@kaod.org>
Date: Mon, 6 Dec 2021 14:03:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] ppc/pvn.c: fix "system-id" FDT when -uuid is set
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211206124538.627920-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211206124538.627920-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 72759c2e-8b34-4d94-9e51-740de3582602
X-Ovh-Tracer-Id: 737182964410387424
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgdegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.076,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/6/21 13:45, Daniel Henrique Barboza wrote:
> Setting -uuid in the pnv machine does not work:
> 
> ./qemu-system-ppc64 -machine powernv8,accel=tcg  -uuid 7ff61ca1-a4a0-4bc1-944c-abd114a35e80
> qemu-system-ppc64: error creating device tree: (fdt_property_string(fdt, "system-id", buf)): FDT_ERR_BADSTATE
> 
> This happens because we're using "fdt_property_string" to retrieve a
> "system-id" attribute that does not exist, instead of using
> fdt_setprop_string() to create a "system-id" attribute with the uuid
> provided via command line.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
> 
> Cedric,
> 
> This isn't critical and probably not worth postponing 7.0 for one
> more week, but since we're pushing MIPS fixes for 6.2 I believe this
> one can also go in.

As you said, it is not critical :) and 6.2 is due for tomorrow !

Let's take it for 7.0.

Thanks,

C.

> 
>   hw/ppc/pnv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 32ab8071a4..9e532caa9f 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -552,7 +552,7 @@ static void *pnv_dt_create(MachineState *machine)
>       buf =  qemu_uuid_unparse_strdup(&qemu_uuid);
>       _FDT((fdt_setprop_string(fdt, 0, "vm,uuid", buf)));
>       if (qemu_uuid_set) {
> -        _FDT((fdt_property_string(fdt, "system-id", buf)));
> +        _FDT((fdt_setprop_string(fdt, 0, "system-id", buf)));
>       }
>       g_free(buf);
>   
> 


