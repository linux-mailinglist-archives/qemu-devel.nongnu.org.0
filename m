Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89DE638B97
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 14:50:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZ4S-0003ut-Sk; Fri, 25 Nov 2022 08:48:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oyZ4D-0003sh-JB
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:48:40 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oyZ49-000291-FI
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:48:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.244])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2FE6E20636;
 Fri, 25 Nov 2022 13:48:25 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 25 Nov
 2022 14:48:24 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002984d95d0-42e2-4094-8baa-774236ca8d89,
 A118ED2DA2C78367863551B1AF5232D1EC2EEEED) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 25 Nov 2022 14:48:23 +0100
From: Greg Kurz <groug@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-ppc@nongnu.org>
Subject: Re: [PATCH for-8.0 6/7] hw/intc/xics: Convert TYPE_ICS to 3-phase
 reset
Message-ID: <20221125144823.4ab5f378@bahia>
In-Reply-To: <20221125115240.3005559-7-peter.maydell@linaro.org>
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
 <20221125115240.3005559-7-peter.maydell@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 9fa0c7e6-ca64-42fc-9b92-37354fa36def
X-Ovh-Tracer-Id: 14387030484743919980
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgdehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegkeejtdevgeekieelffdvtedvvdegtdduudeigffhhffgvdfhgeejteekheefkeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhkrhgrgigvlhesrhgvughhrghtrdgtohhmpdhmshhtsehrvgguhhgrthdrtghomhdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpmhgrrhgtvghlrdgrphhfvghlsggruhhmsehgmhgrihhlrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdgtlhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtph
 houhht
Received-SPF: pass client-ip=46.105.45.231; envelope-from=groug@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 25 Nov 2022 11:52:39 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> Convert the TYPE_ICS class to 3-phase reset; this will allow us
> to convert the TYPE_PHB3_MSI class which inherits from it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/intc/xics.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/intc/xics.c b/hw/intc/xics.c
> index dd130467ccc..c7f8abd71e4 100644
> --- a/hw/intc/xics.c
> +++ b/hw/intc/xics.c
> @@ -564,9 +564,9 @@ static void ics_reset_irq(ICSIRQState *irq)
>      irq->saved_priority = 0xff;
>  }
>  
> -static void ics_reset(DeviceState *dev)
> +static void ics_reset_hold(Object *obj)
>  {
> -    ICSState *ics = ICS(dev);
> +    ICSState *ics = ICS(obj);
>      g_autofree uint8_t *flags = g_malloc(ics->nr_irqs);
>      int i;
>  
> @@ -584,7 +584,7 @@ static void ics_reset(DeviceState *dev)
>      if (kvm_irqchip_in_kernel()) {
>          Error *local_err = NULL;
>  
> -        ics_set_kvm_state(ICS(dev), &local_err);
> +        ics_set_kvm_state(ics, &local_err);


>          if (local_err) {
>              error_report_err(local_err);
>          }
> @@ -688,16 +688,17 @@ static Property ics_properties[] = {
>  static void ics_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>  
>      dc->realize = ics_realize;
>      device_class_set_props(dc, ics_properties);
> -    dc->reset = ics_reset;
>      dc->vmsd = &vmstate_ics;
>      /*
>       * Reason: part of XICS interrupt controller, needs to be wired up,
>       * e.g. by spapr_irq_init().
>       */
>      dc->user_creatable = false;
> +    rc->phases.hold = ics_reset_hold;
>  }
>  
>  static const TypeInfo ics_info = {


