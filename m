Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F9A6389B8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 13:25:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyXlZ-0002IR-Ki; Fri, 25 Nov 2022 07:25:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oyXlX-0002Hn-Og
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 07:25:11 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oyXlW-0005Mk-1Y
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 07:25:11 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 85F61143D48E0;
 Fri, 25 Nov 2022 13:25:08 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 25 Nov
 2022 13:25:08 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00307e062c6-c425-45ee-bfaf-e94fd4be830f,
 0943508581586B5A13DEB77E74985CDFB59E8D1E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c9f0c950-988d-3973-0412-25a632b0f601@kaod.org>
Date: Fri, 25 Nov 2022 13:25:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 6/7] hw/intc/xics: Convert TYPE_ICS to 3-phase
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, <qemu-ppc@nongnu.org>
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
 <20221125115240.3005559-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221125115240.3005559-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 10c96807-04d7-4813-a040-38adafae162d
X-Ovh-Tracer-Id: 12980500026501335916
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhkrhgrgigvlhesrhgvughhrghtrdgtohhmpdhmshhtsehrvgguhhgrthdrtghomhdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpmhgrrhgtvghlrdgrphhfvghlsggruhhmsehgmhgrihhlrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpe
 hsmhhtphhouhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/25/22 12:52, Peter Maydell wrote:
> Convert the TYPE_ICS class to 3-phase reset; this will allow us
> to convert the TYPE_PHB3_MSI class which inherits from it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/intc/xics.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/intc/xics.c b/hw/intc/xics.c
> index dd130467ccc..c7f8abd71e4 100644
> --- a/hw/intc/xics.c
> +++ b/hw/intc/xics.c
> @@ -564,9 +564,9 @@ static void ics_reset_irq(ICSIRQState *irq)
>       irq->saved_priority = 0xff;
>   }
>   
> -static void ics_reset(DeviceState *dev)
> +static void ics_reset_hold(Object *obj)
>   {
> -    ICSState *ics = ICS(dev);
> +    ICSState *ics = ICS(obj);
>       g_autofree uint8_t *flags = g_malloc(ics->nr_irqs);
>       int i;
>   
> @@ -584,7 +584,7 @@ static void ics_reset(DeviceState *dev)
>       if (kvm_irqchip_in_kernel()) {
>           Error *local_err = NULL;
>   
> -        ics_set_kvm_state(ICS(dev), &local_err);
> +        ics_set_kvm_state(ics, &local_err);
>           if (local_err) {
>               error_report_err(local_err);
>           }
> @@ -688,16 +688,17 @@ static Property ics_properties[] = {
>   static void ics_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>   
>       dc->realize = ics_realize;
>       device_class_set_props(dc, ics_properties);
> -    dc->reset = ics_reset;
>       dc->vmsd = &vmstate_ics;
>       /*
>        * Reason: part of XICS interrupt controller, needs to be wired up,
>        * e.g. by spapr_irq_init().
>        */
>       dc->user_creatable = false;
> +    rc->phases.hold = ics_reset_hold;
>   }
>   
>   static const TypeInfo ics_info = {


