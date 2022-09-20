Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0129F5BE788
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:49:03 +0200 (CEST)
Received: from localhost ([::1]:47496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadcU-00026f-1X
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oabGo-0006yh-7m
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:18:30 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:49235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oabGe-00063i-FZ
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:18:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.249])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3952F12A7D839;
 Tue, 20 Sep 2022 13:18:00 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 20 Sep
 2022 13:17:59 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002e259e746-f106-4dad-b80d-8e4b650cc609,
 441AFC317D3E5D064EE6C0DCC588AAD1A9B9E513) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f37dbbc9-0f1d-73b9-562b-c59043445fc0@kaod.org>
Date: Tue, 20 Sep 2022 13:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 28/39] hw/pci-host: pnv_phb{3, 4}: Fix heap out-of-bound
 access failure
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, <qemu-devel@nongnu.org>
CC: Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng
 <bin.meng@windriver.com>, <qemu-ppc@nongnu.org>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-29-bmeng.cn@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220920103159.1865256-29-bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 4e37f937-3ecc-4b62-b0ad-be2a6e5b2c93
X-Ovh-Tracer-Id: 11630546038215510947
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvledgfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.182,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/22 12:31, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> pnv_phb3_root_bus_info and pnv_phb4_root_bus_info are missing the
> instance_size initialization. This results in accessing out-of-bound
> memory when setting 'chip-id' and 'phb-id', and eventually crashes
> glib's malloc functionality with the following message:
> 
>    "qemu-system-ppc64: GLib: ../glib-2.72.3/glib/gmem.c:131: failed to allocate 3232 bytes"
> 
> This issue was noticed only when running qtests with QEMU Windows
> 32-bit executable. Windows 64-bit, Linux 32/64-bit do not expose
> this bug though.
> 
> Fixes: 9ae1329ee2fe ("ppc/pnv: Add models for POWER8 PHB3 PCIe Host bridge")
> Fixes: 4f9924c4d4cf ("ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge")
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Nice !

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> 
> Changes in v2:
> - new patch: "hw/pci-host: pnv_phb{3,4}: Fix heap out-of-bound access failure"
> 
>   hw/pci-host/pnv_phb3.c | 1 +
>   hw/pci-host/pnv_phb4.c | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index af8575c007..9054c393a2 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1169,6 +1169,7 @@ static void pnv_phb3_root_bus_class_init(ObjectClass *klass, void *data)
>   static const TypeInfo pnv_phb3_root_bus_info = {
>       .name = TYPE_PNV_PHB3_ROOT_BUS,
>       .parent = TYPE_PCIE_BUS,
> +    .instance_size = sizeof(PnvPHB3RootBus),
>       .class_init = pnv_phb3_root_bus_class_init,
>   };
>   
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 824e1a73fb..ccbde841fc 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1773,6 +1773,7 @@ static void pnv_phb4_root_bus_class_init(ObjectClass *klass, void *data)
>   static const TypeInfo pnv_phb4_root_bus_info = {
>       .name = TYPE_PNV_PHB4_ROOT_BUS,
>       .parent = TYPE_PCIE_BUS,
> +    .instance_size = sizeof(PnvPHB4RootBus),
>       .class_init = pnv_phb4_root_bus_class_init,
>   };
>   


