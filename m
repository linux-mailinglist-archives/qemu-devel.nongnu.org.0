Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2214C2542
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 09:12:55 +0100 (CET)
Received: from localhost ([::1]:58402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN9F8-0007ub-PI
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 03:12:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nN9DG-00077u-Jt
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 03:10:58 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:51009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nN9DD-0003AP-Nv
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 03:10:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id F2AD9240E1;
 Thu, 24 Feb 2022 08:10:52 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 24 Feb
 2022 09:10:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004780a8a74-ecec-4d5e-a7f1-f6943c97dc04,
 2C0FAB1A59FC2EFD04F2AC9235B2D2637189D3E8) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.58.215.209
Message-ID: <ae217469-9f0f-5f1e-f01b-4a6f525f1ff2@kaod.org>
Date: Thu, 24 Feb 2022 09:10:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Fix a potential memory leak bug in write_boot_rom() (v6.2.0).
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, <wliang@stu.xidian.edu.cn>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <6e7748f1.25d8.17f2705c420.Coremail.wliang@stu.xidian.edu.cn>
 <c91392a4-f75b-4e5d-9e6c-04777fb7ca79@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <c91392a4-f75b-4e5d-9e6c-04777fb7ca79@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 25628b8f-6106-48f4-9927-5451cc4e791a
X-Ovh-Tracer-Id: 4434919735754525661
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrledugdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
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

Hello Wentao,

On 2/23/22 17:15, Philippe Mathieu-Daudé wrote:
> On 23/2/22 15:39, wliang@stu.xidian.edu.cn wrote:
>> Hi all,
>>
>> I find a memory leak bug in QEMU 6.2.0, which is in write_boot_rom()(./hw/arm/aspeed.c).
>>
>> Specifically, at line 276, a memory chunk is allocated with g_new0() and assigned to the variable 'storage'. However, if the branch takes true at line 277, there will be only an error report at line 278 but not a free operation for 'storage' before function returns. As a result, a memory leak bug is triggered.
>>
>>
>> 259    BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
>> ...
>> 276    storage = g_new0(uint8_t, rom_size);
>> 277    if (blk_pread(blk, 0, storage, rom_size) < 0) {
>> 278        error_setg(errp, "failed to read the initial flash content");
>> 279        return;
>> 280    }
>>
>>
>> I believe that the problem can be fixed by adding a g_free() before the function returns.
>>
>>
>> 277    if (blk_pread(blk, 0, storage, rom_size) < 0) {
>> 278        error_setg(errp, "failed to read the initial flash content");
>> +++    g_free(storage);
>> 279        return;
>> 280    }
>>
>>
>> I'm looking forward to your confirmation.
> 
> Correct.
> 
> Or using g_autofree:

yes. Could you please send a patch using  g_autofree ?

Thanks,

C.

> 
> -- >8 --
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index d911dc904f..170e773ef8 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -257,7 +257,7 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
>                              Error **errp)
>   {
>       BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
> -    uint8_t *storage;
> +    g_autofree void *storage = NULL;
>       int64_t size;
> 
>       /* The block backend size should have already been 'validated' by
> @@ -273,14 +273,13 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
>           rom_size = size;
>       }
> 
> -    storage = g_new0(uint8_t, rom_size);
> +    storage = g_malloc0(rom_size);
>       if (blk_pread(blk, 0, storage, rom_size) < 0) {
>           error_setg(errp, "failed to read the initial flash content");
>           return;
>       }
> 
>       rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
> -    g_free(storage);
>   }
> ---


