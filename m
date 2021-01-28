Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A57306E07
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 08:04:06 +0100 (CET)
Received: from localhost ([::1]:59884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l51LY-0003nM-Vy
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 02:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l51KU-0003KK-0Q; Thu, 28 Jan 2021 02:02:58 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:55131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l51KS-0003k9-6j; Thu, 28 Jan 2021 02:02:57 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.148])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 186FA8695CF5;
 Thu, 28 Jan 2021 08:02:42 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 28 Jan
 2021 08:02:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001d567b299-a186-4b04-b364-e5da92162c2d,
 E57BA53B85CD0AA8C573FC380C1E6825DC018892) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 3/7] ppc/pnv: Use skiboot addresses to load kernel and
 ramfs
To: Joel Stanley <joel@jms.id.au>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-4-clg@kaod.org>
 <CACPK8Xdp12MC2yg23t61pLjFL-HEQg1tqL=aOjrQ-jrZ17b=cQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <48a1fc34-88fe-105c-35af-729dae73e1fb@kaod.org>
Date: Thu, 28 Jan 2021 08:02:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xdp12MC2yg23t61pLjFL-HEQg1tqL=aOjrQ-jrZ17b=cQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f28a8cdc-bdeb-44df-a654-bf988ce92291
X-Ovh-Tracer-Id: 7030681969656367910
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 1:45 AM, Joel Stanley wrote:
> On Tue, 26 Jan 2021 at 17:11, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The current settings are useful to load large kernels (with debug) but
>> it moves the initrd image in a memory region not protected by
>> skiboot. If skiboot is compiled with DEBUG=1, memory poisoning will
>> corrupt the initrd.
>>
>> Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> Note that the machine's default ram size will change with this patch:
> 
>  mc->default_ram_size = INITRD_LOAD_ADDR + INITRD_MAX_SIZE;

Ah yes. I missed that.

> So we will go from 1.75GB to 768MB. Does anything break when the
> machine has less than 1GB of ram?

There is a warning if the machine has less than 1GB but we should
also change the default RAM size to 1G to be on the safe side.

Thanks,

C. 

> 
>> ---
>>
>>  If we want to increase the kernel size limit as commit b45b56baeecd
>>  ("ppc/pnv: increase kernel size limit to 256MiB") intented to do, I
>>  think we should add a machine option.
>>
>>  hw/ppc/pnv.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 14fc9758a973..e500c2e2437e 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -65,9 +65,9 @@
>>  #define FW_MAX_SIZE             (16 * MiB)
>>
>>  #define KERNEL_LOAD_ADDR        0x20000000
>> -#define KERNEL_MAX_SIZE         (256 * MiB)
>> -#define INITRD_LOAD_ADDR        0x60000000
>> -#define INITRD_MAX_SIZE         (256 * MiB)
>> +#define KERNEL_MAX_SIZE         (128 * MiB)
>> +#define INITRD_LOAD_ADDR        0x28000000
>> +#define INITRD_MAX_SIZE         (128 * MiB)
>>
>>  static const char *pnv_chip_core_typename(const PnvChip *o)
>>  {
>> --
>> 2.26.2
>>
>>


