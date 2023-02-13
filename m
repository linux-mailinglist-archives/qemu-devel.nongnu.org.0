Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DA4693EF2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:34:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRTKJ-0003Fv-6g; Mon, 13 Feb 2023 02:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pRTKE-0003FV-HR; Mon, 13 Feb 2023 02:32:36 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pRTKA-0008SB-K4; Mon, 13 Feb 2023 02:32:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.66])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3F41E28FBA;
 Mon, 13 Feb 2023 07:32:24 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 13 Feb
 2023 08:32:23 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001cabf56fb-9c5f-42e5-a8d1-ffe58499f531,
 F14F4AD8ED0BD1E75D9128D0FAA1081513448E0E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <fc37a0c0-aada-72d3-20bc-d2744e157b7c@kaod.org>
Date: Mon, 13 Feb 2023 08:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 6/9] hw/ppc: Replace dev->parent_bus by
 qdev_get_parent_bus(dev)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>, Eduardo Habkost <eduardo@habkost.net>
CC: Gonglei Arei <arei.gonglei@huawei.com>, Li Qiang <liq3ea@163.com>, Cao jin
 <caoj.fnst@cn.fujitsu.com>, Hu Tao <hutao@cn.fujitsu.com>,
 <qemu-block@nongnu.org>, <qemu-ppc@nongnu.org>, xiaoqiang zhao
 <zxq_yx_007@163.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, David
 Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20230213070423.76428-1-philmd@linaro.org>
 <20230213070423.76428-7-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230213070423.76428-7-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 94eaa9df-1ef9-4690-a623-feb5fbf644df
X-Ovh-Tracer-Id: 16683584823194717115
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeitddguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgvughurghrughosehhrggskhhoshhtrdhnvghtpdgrrhgvihdrghhonhhglhgviheshhhurgifvghirdgtohhmpdhlihhqfegvrgesudeifedrtghomhdptggrohhjrdhfnhhsthestghnrdhfuhhjihhtshhurdgtohhmpdhhuhhtrghosegtnhdrfhhujhhithhsuhdrtghomhdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhngh
 hnuhdrohhrghdpiiigqhgphiigpgdttdejseduieefrdgtohhmpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.348,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2/13/23 08:04, Philippe Mathieu-Daudé wrote:
> DeviceState::parent_bus is an internal field and should be
> accessed by the qdev_get_parent_bus() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/ppc/spapr_vio.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
> index 9d4fec2c04..dfc5c436bd 100644
> --- a/hw/ppc/spapr_vio.c
> +++ b/hw/ppc/spapr_vio.c
> @@ -382,7 +382,7 @@ static void rtas_quiesce(PowerPCCPU *cpu, SpaprMachineState *spapr,
>   
>   static SpaprVioDevice *reg_conflict(SpaprVioDevice *dev)
>   {
> -    SpaprVioBus *bus = SPAPR_VIO_BUS(dev->qdev.parent_bus);
> +    SpaprVioBus *bus = SPAPR_VIO_BUS(qdev_get_parent_bus(DEVICE(dev)));
>       BusChild *kid;
>       SpaprVioDevice *other;
>   
> @@ -492,7 +492,7 @@ static void spapr_vio_busdev_realize(DeviceState *qdev, Error **errp)
>           }
>       } else {
>           /* Need to assign an address */
> -        SpaprVioBus *bus = SPAPR_VIO_BUS(dev->qdev.parent_bus);
> +        SpaprVioBus *bus = SPAPR_VIO_BUS(qdev_get_parent_bus(DEVICE(dev)));
>   
>           do {
>               dev->reg = bus->next_reg++;


