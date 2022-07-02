Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6E7563ED2
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 08:25:57 +0200 (CEST)
Received: from localhost ([::1]:50812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7WZm-00029V-TL
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 02:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7WX7-0008BG-8g
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:23:09 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:59917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7WX4-0004ga-Vt
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:23:08 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.194])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id DDE8C200C4;
 Sat,  2 Jul 2022 06:23:04 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sat, 2 Jul 2022
 08:23:04 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005557f218b-a3e9-4613-bd9c-b0f54aa89b41,
 FB2626423410402F5F47B43F186DFD06AD25B17E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ba31e661-9b53-841d-f0f2-4ca563d973bb@kaod.org>
Date: Sat, 2 Jul 2022 08:23:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 6/9] ppc440_bamboo.c: handle clock freq read error in
 load_device_tree
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>
References: <20220630194249.886747-1-danielhb413@gmail.com>
 <20220630194249.886747-7-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220630194249.886747-7-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 19bb5a88-aefb-4d4b-8bd9-828ab8b83672
X-Ovh-Tracer-Id: 16449397641743272925
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/30/22 21:42, Daniel Henrique Barboza wrote:
> Let's put the default clock and timebase freq value in macros for better
> readability.  Use PPC440EP_CLOCK_FREQ as the default value of
> 'clock_freq' if kvmppc_get_clockfreq() throws an error.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/ppc/ppc440_bamboo.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index d23f881d9d..6318112393 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -50,6 +50,10 @@
>   
>   #define PPC440EP_SDRAM_NR_BANKS 4
>   
> +#define PPC440EP_TB_FREQ        400000000
> +#define PPC440EP_CLOCK_FREQ     400000000
> +
> +
>   static const ram_addr_t ppc440ep_sdram_bank_sizes[] = {
>       256 * MiB, 128 * MiB, 64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 0
>   };
> @@ -67,8 +71,8 @@ static int bamboo_load_device_tree(hwaddr addr,
>       char *filename;
>       int fdt_size;
>       void *fdt;
> -    uint32_t tb_freq = 400000000;
> -    uint32_t clock_freq = 400000000;
> +    uint32_t tb_freq = PPC440EP_TB_FREQ;
> +    uint32_t clock_freq = PPC440EP_CLOCK_FREQ;
>   
>       filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, BINARY_DEVICE_TREE_FILE);
>       if (!filename) {
> @@ -106,8 +110,15 @@ static int bamboo_load_device_tree(hwaddr addr,
>        * directly access the timebase without host involvement, we must expose
>        * the correct frequencies. */
>       if (kvm_enabled()) {
> +        Error *local_err = NULL;
> +
>           tb_freq = kvmppc_get_tbfreq();
> -        clock_freq = kvmppc_get_clockfreq(NULL);
> +        clock_freq = kvmppc_get_clockfreq(&local_err);
> +
> +        /* Use default clock if we're unable to read it from the DT */
> +        if (local_err) {

may be report the error to the user ?

> +            clock_freq = PPC440EP_CLOCK_FREQ;
> +        }
>       }
>   
>       qemu_fdt_setprop_cell(fdt, "/cpus/cpu@0", "clock-frequency",


