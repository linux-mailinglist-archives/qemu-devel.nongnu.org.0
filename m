Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A4268D290
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 10:20:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPK8n-0001BN-Ba; Tue, 07 Feb 2023 04:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pPK8j-00019q-MK
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:19:51 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pPK8g-000283-Hv
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:19:48 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.227])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 15910210CA;
 Tue,  7 Feb 2023 09:19:35 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 7 Feb
 2023 10:19:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006f7016b3b-93dc-4da5-823e-c7b48f09ad0d,
 904990D422014CC0AD0CD8052B6B5031CF8ACE51) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d09135a0-8ca7-d8af-bcf9-677e839b9d17@kaod.org>
Date: Tue, 7 Feb 2023 10:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PULL 03/38] pflash: Only read non-zero parts of backend image
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
CC: <qemu-block@nongnu.org>, <peter.maydell@linaro.org>,
 <qemu-devel@nongnu.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, <kraxel@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
 <20230120122633.84983-4-kwolf@redhat.com>
 <be61e573-1713-472c-899e-ac51b8a22345@kaod.org> <Y+IN+xWlJUl6I2u9@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <Y+IN+xWlJUl6I2u9@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: da4cc06a-f95e-4ac9-a5e3-45d7091d73aa
X-Ovh-Tracer-Id: 1704049512041843494
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffggefgveejueegvdduvdelheeftdevffekuedthffhuddtvedvudevleeugeeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpohhpvghnsghmtgdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepkhifohhlfhesrhgvughhrghtrdgtohhmpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpsggvrhhrrghnghgvsehrvgguhhgrthdrtghomhdpkhhrrgigvghlsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/7/23 09:38, Kevin Wolf wrote:
> Am 06.02.2023 um 16:54 hat Cédric Le Goater geschrieben:
>> On 1/20/23 13:25, Kevin Wolf wrote:
>>> From: Xiang Zheng <zhengxiang9@huawei.com>
>>>
>>> Currently we fill the VIRT_FLASH memory space with two 64MB NOR images
>>> when using persistent UEFI variables on virt board. Actually we only use
>>> a very small(non-zero) part of the memory while the rest significant
>>> large(zero) part of memory is wasted.
>>>
>>> So this patch checks the block status and only writes the non-zero part
>>> into memory. This requires pflash devices to use sparse files for
>>> backends.
>>>
>>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>>>
>>> [ kraxel: rebased to latest master ]
>>>
>>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>>> Message-Id: <20221220084246.1984871-1-kraxel@redhat.com>
>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>
>> This newly merged patch introduces a "regression" when booting an Aspeed
>> machine. The following extra m25p80 patch (not yet merged) is required
>> for the issue to show:
>>
>>    https://lore.kernel.org/qemu-devel/20221115151000.2080833-1-clg@kaod.org/
>>
>> U-Boot fails to find the filesystem in that case.
>>
>> It can be easily reproduced with the witherspoon-bmc machine and seems
>> to be related to the use of a UBI filesystem. Other Aspeed machines not
>> using UBI are not impacted.
>>
>> Here is a tentative fix. I don't know enough the block layer to explain
>> what is happening :/
> 
> I was puzzled for a moment, but...
> 
>> @@ -39,7 +39,7 @@ static int blk_pread_nonzeroes(BlockBack
>>               return ret;
>>           }
>>           if (!(ret & BDRV_BLOCK_ZERO)) {
>> -            ret = bdrv_pread(bs->file, offset, bytes,
> 
> 'bs->file' rather than 'bs' really looks wrong. I think replacing that
> would already fix the bug you're seeing.
> 
> Just to be sure, how did you configure the block backend? bs->file would
> happen to work more or less with raw over file-posix (which is probably
> what Gerd tested), but I think it breaks with anything else.

The command is  :

   $ qemu-system-arm -M witherspoon-bmc -net user \
	-drive file=/path/to/file.mtd,format=raw,if=mtd \
	-nographic -serial mon:stdio -snapshot

If I remove '-snapshot', all works fine.

Here is a file :

   https://jenkins.openbmc.org/job/ci-openbmc/distro=ubuntu,label=docker-builder,target=witherspoon/lastSuccessfulBuild/artifact/openbmc/build/tmp/deploy/images/witherspoon/obmc-phosphor-image-witherspoon-20230207051412.ubi.mtd

Thanks,

C.

> 
>> +            ret = blk_pread(blk, offset, bytes,
>>                                (uint8_t *) buf + offset, 0);
> 
> blk_*() makes even more sense conceptually, but it should behave the
> same.
> 
> Kevin
> 


