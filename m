Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B12D6BEE1E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 17:26:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdCtn-00014Z-6X; Fri, 17 Mar 2023 12:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pdCtl-000147-3Q
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:25:45 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pdCtj-0001XT-5F
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:25:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.219])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 478D622195;
 Fri, 17 Mar 2023 16:25:30 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 17 Mar
 2023 17:25:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004e816bdf7-33a0-4acf-9c66-c250c43c054a,
 AA89701AE41F08E1E89E0E4F443EB3D827D1D8AD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <03a56c04-8afd-d4eb-b117-34698eb19484@kaod.org>
Date: Fri, 17 Mar 2023 17:25:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0 v3] memory: Prevent recursive memory access
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: <qemu-devel@nongnu.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, David Hildenbrand <david@redhat.com>, Peter Xu
 <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini
 <pbonzini@redhat.com>
References: <20230316162044.31607-1-akihiko.odaki@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230316162044.31607-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: c7ba82eb-1d8c-4e37-aca4-89d9494b9d0e
X-Ovh-Tracer-Id: 10698863867766541161
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefvddgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejteffvddviedtvedvhfdttefgteefheffgfehfffgfeelkeetleeghfeivdefveenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrkhhihhhikhhordhouggrkhhisegurgihnhhigidrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphhhihhlmhgusehlihhnrghrohdrohhrghdpuggrvhhiugesrhgvughhrghtrdgtohhmpdhpvghtvghrgiesrhgvughhrghtrdgtohhmpdgrlhignhgurhessghurdgvughupdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Hello,

On 3/16/23 17:20, Akihiko Odaki wrote:
> A guest may request ask a memory-mapped device to perform DMA. If the
> address specified for DMA is the device performing DMA, it will create
> recursion. It is very unlikely that device implementations are prepared
> for such an abnormal access, which can result in unpredictable behavior.
> 
> In particular, such a recursion breaks e1000e, a network device. If
> the device is configured to write the received packet to the register
> to trigger receiving, it triggers re-entry to the Rx logic of e1000e.
> This causes use-after-free since the Rx logic is not re-entrant.
> 
> As there should be no valid reason to perform recursive memory access,
> check for recursion before accessing memory-mapped device.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1543
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
> V1 -> V2: Marked the variable thread-local. Introduced linked list.
> 
>   softmmu/memory.c | 81 ++++++++++++++++++++++++++++++++++++++----------
>   1 file changed, 64 insertions(+), 17 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 4699ba55ec..6be33a9e3e 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -61,6 +61,15 @@ struct AddrRange {
>       Int128 size;
>   };
>   
> +typedef struct AccessedRegion AccessedRegion;
> +
> +struct AccessedRegion {
> +    const Object *owner;
> +    const AccessedRegion *next;
> +};
> +
> +static __thread const AccessedRegion *accessed_region;
> +
>   static AddrRange addrrange_make(Int128 start, Int128 size)
>   {
>       return (AddrRange) { start, size };
> @@ -1394,6 +1403,16 @@ bool memory_region_access_valid(MemoryRegion *mr,
>           return false;
>       }
>   
> +    for (const AccessedRegion *ar = accessed_region; ar; ar = ar->next) {
> +        if (ar->owner == mr->owner) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
> +                          ", size %u, region '%s', reason: recursive access\n",
> +                          is_write ? "write" : "read",
> +                          addr, size, memory_region_name(mr));
> +            return false;
> +        }
> +    }
> +
>       /* Treat zero as compatibility all valid */
>       if (!mr->ops->valid.max_access_size) {
>           return true;
> @@ -1413,6 +1432,29 @@ bool memory_region_access_valid(MemoryRegion *mr,
>       return true;
>   }
>   
> +static bool memory_region_access_start(MemoryRegion *mr,
> +                                       hwaddr addr,
> +                                       unsigned size,
> +                                       bool is_write,
> +                                       MemTxAttrs attrs,
> +                                       AccessedRegion *ar)
> +{
> +    if (!memory_region_access_valid(mr, addr, size, is_write, attrs)) {
> +        return false;
> +    }
> +
> +    ar->owner = mr->owner;
> +    ar->next = accessed_region;
> +    accessed_region = ar->next;

Isn't 'accessed_region' always NULL ?

> +
> +    return true;
> +}
> +
> +static void memory_region_access_end(void)
> +{
> +    accessed_region = accessed_region->next;
> +}
and so, this is a segv.

Thanks,

C.

