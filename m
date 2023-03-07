Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1BE6AE6D6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:38:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaK9-0007cl-P9; Tue, 07 Mar 2023 11:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pZaK7-0007aH-Gx
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:37:59 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pZaK5-0003Nr-Ov
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:37:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.2])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DF34D211D2;
 Tue,  7 Mar 2023 16:37:51 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 7 Mar
 2023 17:37:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00137bf3014-d49a-4b2d-9f0f-35ae05992ebc,
 D586700EEA543FC8D630564B717DAE7078976E4F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ef54354e-f3c6-37a9-1ddd-42caca106b44@kaod.org>
Date: Tue, 7 Mar 2023 17:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PULL 2/5] pflash: Fix blk_pread_nonzeroes()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>
References: <20230307155528.3655534-1-clg@kaod.org>
 <20230307155528.3655534-3-clg@kaod.org>
 <be44cfd0-d107-76a3-abe5-fba82d15a646@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <be44cfd0-d107-76a3-abe5-fba82d15a646@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 00ca6a21-b2ce-436c-bd50-87ee1f7e3e44
X-Ovh-Tracer-Id: 7520729905972612003
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddgkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeikeehkeehheejgfffkeffveegleduffeiteejuefgfedtjeekgefgveffveeigfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpkhifohhlfhesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/7/23 17:22, Philippe Mathieu-Daudé wrote:
> On 7/3/23 16:55, Cédric Le Goater wrote:
>> From: Kevin Wolf <kwolf@redhat.com>
>>
>> Commit a4b15a8b introduced a new function blk_pread_nonzeroes(). Instead
>> of reading directly from the root node of the BlockBackend, it reads
>> from its 'file' child node. This can happen to mostly work for raw
>> images (as long as the 'raw' format driver is in use, but not actually
>> doing anything), but it breaks everything else.
>>
>> Fix it to read from the root node instead.
>>
>> Fixes: a4b15a8b9ef25b44fa92a4825312622600c1f37c
> 
> You missed:
> 
> Tested-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> Fixes: a4b15a8b9e ("pflash: Only read non-zero parts of backend image")
> 
> by 3min:
> https://lore.kernel.org/qemu-devel/c5c82d88-df2a-e968-4d81-0da1cfa2ab09@maciej.szmigiero.name/


yes :) I waited for the CI to complete and didn't check my email before
sending. If I respin, I will fix.

C.


> 
>> Reported-by: Cédric Le Goater <clg@kaod.org>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> Message-Id: <20230307140230.59158-1-kwolf@redhat.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/block/block.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/hw/block/block.c b/hw/block/block.c
>> index af0710e477..9f52ee6e72 100644
>> --- a/hw/block/block.c
>> +++ b/hw/block/block.c
>> @@ -39,8 +39,7 @@ static int blk_pread_nonzeroes(BlockBackend *blk, hwaddr size, void *buf)
>>               return ret;
>>           }
>>           if (!(ret & BDRV_BLOCK_ZERO)) {
>> -            ret = bdrv_pread(bs->file, offset, bytes,
>> -                             (uint8_t *) buf + offset, 0);
>> +            ret = blk_pread(blk, offset, bytes, (uint8_t *) buf + offset, 0);
>>               if (ret < 0) {
>>                   return ret;
>>               }
> 


