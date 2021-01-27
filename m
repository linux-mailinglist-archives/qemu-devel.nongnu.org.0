Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A32930541C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 08:12:47 +0100 (CET)
Received: from localhost ([::1]:34094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4f0Q-0003vG-1F
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 02:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l4eyN-0003Ho-Eo; Wed, 27 Jan 2021 02:10:39 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:47091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l4eyG-0007rm-Rn; Wed, 27 Jan 2021 02:10:39 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.149])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 87EDA864BA01;
 Wed, 27 Jan 2021 08:10:28 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 27 Jan
 2021 08:10:27 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0016ccd5de0-775f-4f62-951e-83339a7b87a9,
 27C0C699323DAAF51BAA1A079A14B1389549C008) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 3/7] ppc/pnv: Use skiboot addresses to load kernel and
 ramfs
To: <muriloo@linux.ibm.com>, David Gibson <david@gibson.dropbear.id.au>,
 <qemu-ppc@nongnu.org>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-4-clg@kaod.org> <4677115.31r3eYUQgx@kermit.br.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <98379f94-0fdf-da75-fe60-c743cf0193ab@kaod.org>
Date: Wed, 27 Jan 2021 08:10:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4677115.31r3eYUQgx@kermit.br.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9c231281-1308-4e89-9b15-0efdc8dba757
X-Ovh-Tracer-Id: 1289155397319035811
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdejgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeutdehgefhvdehtdeuleetgedvfeeukedtfeeihfffffeiuddutdduhffgvedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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
Cc: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 2:27 AM, Murilo Opsfelder Araújo wrote:
> Bonjour, Cédric.
> 
> On Tuesday, January 26, 2021 2:10:55 PM -03 Cédric Le Goater wrote:
>> The current settings are useful to load large kernels (with debug) but
>> it moves the initrd image in a memory region not protected by
>> skiboot. If skiboot is compiled with DEBUG=1, memory poisoning will
>> corrupt the initrd.
>>
>> Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>  If we want to increase the kernel size limit as commit b45b56baeecd
>>  ("ppc/pnv: increase kernel size limit to 256MiB") intented to do, I
>>  think we should add a machine option.
> 
> Is this a problem on bare-metal as well?
> 
> I'm wondering if we should address this the other way around by increasing
> KERNEL_LOAD_SIZE and INITRAMFS_LOAD_SIZE in skiboot to accomodate large kernel
> and initramfs images.

The different memory areas are all strictly defined here : 

  https://github.com/open-power/skiboot/blob/master/include/mem-map.h

C. 

> I think Linux debuginfo images won't get smaller with time and, assuming this
> also happens on bare-metal (I haven't verified), updating skiboot looks more
> appropriate.
> 
> Bear in mind that I'm not an skiboot expert, I'm just considering the
> possibilities.
> 
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
> 
> Cheers!
> 


