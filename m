Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4761753BCF5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 19:02:02 +0200 (CEST)
Received: from localhost ([::1]:59430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwoCu-0001JD-Qy
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 13:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwoBl-0000Ze-9H
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 13:00:49 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:47169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwoBi-0002yx-33
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 13:00:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.253])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id EBA72106E08F9;
 Thu,  2 Jun 2022 19:00:41 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 2 Jun 2022
 19:00:41 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00524d0c4f5-1c79-476b-9f17-cf1b4df80230,
 123C0E545D135716686AEE7B3F9DB382F3F098BA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3f4bbf08-36b0-170b-2166-be1cda6888b1@kaod.org>
Date: Thu, 2 Jun 2022 19:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] pnv/xive2: Access direct mapped thread contexts from all
 chips
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220602165310.558810-1-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220602165310.558810-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 45ed240d-23d0-475d-bb0a-5cac34c08681
X-Ovh-Tracer-Id: 17057665067558931424
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrleefgdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/2/22 18:53, Frederic Barrat wrote:
> When accessing a thread context through the IC BAR, the offset of the
> page in the BAR identifies the CPU. From that offset, we can compute
> the PIR (processor ID register) of the CPU to do the data structure
> lookup. On P10, the current code assumes an access for node 0 when
> computing the PIR. Everything is almost in place to allow access for
> other nodes though. So this patch reworks how the PIR value is
> computed so that we can access all thread contexts through the IC BAR.
> 
> The PIR is already correct on P9, so no need to modify anything there.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Is that a P10 bug ? If so, a fixes tag is needed.

Thanks,

C.

> ---
>   hw/intc/pnv_xive2.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
> index a39e070e82..f31c53c28d 100644
> --- a/hw/intc/pnv_xive2.c
> +++ b/hw/intc/pnv_xive2.c
> @@ -1574,6 +1574,12 @@ static const MemoryRegionOps pnv_xive2_ic_sync_ops = {
>    * When the TM direct pages of the IC controller are accessed, the
>    * target HW thread is deduced from the page offset.
>    */
> +static uint32_t pnv_xive2_ic_tm_get_pir(PnvXive2 *xive, hwaddr offset)
> +{
> +    /* On P10, the node ID shift in the PIR register is 8 bits */
> +    return xive->chip->chip_id << 8 | offset >> xive->ic_shift;
> +}
> +
>   static XiveTCTX *pnv_xive2_get_indirect_tctx(PnvXive2 *xive, uint32_t pir)
>   {
>       PnvChip *chip = xive->chip;
> @@ -1596,10 +1602,12 @@ static uint64_t pnv_xive2_ic_tm_indirect_read(void *opaque, hwaddr offset,
>                                                 unsigned size)
>   {
>       PnvXive2 *xive = PNV_XIVE2(opaque);
> -    uint32_t pir = offset >> xive->ic_shift;
> -    XiveTCTX *tctx = pnv_xive2_get_indirect_tctx(xive, pir);
> +    uint32_t pir;
> +    XiveTCTX *tctx;
>       uint64_t val = -1;
>   
> +    pir = pnv_xive2_ic_tm_get_pir(xive, offset);
> +    tctx = pnv_xive2_get_indirect_tctx(xive, pir);
>       if (tctx) {
>           val = xive_tctx_tm_read(NULL, tctx, offset, size);
>       }
> @@ -1611,9 +1619,11 @@ static void pnv_xive2_ic_tm_indirect_write(void *opaque, hwaddr offset,
>                                              uint64_t val, unsigned size)
>   {
>       PnvXive2 *xive = PNV_XIVE2(opaque);
> -    uint32_t pir = offset >> xive->ic_shift;
> -    XiveTCTX *tctx = pnv_xive2_get_indirect_tctx(xive, pir);
> +    uint32_t pir;
> +    XiveTCTX *tctx;
>   
> +    pir = pnv_xive2_ic_tm_get_pir(xive, offset);
> +    tctx = pnv_xive2_get_indirect_tctx(xive, pir);
>       if (tctx) {
>           xive_tctx_tm_write(NULL, tctx, offset, val, size);
>       }


