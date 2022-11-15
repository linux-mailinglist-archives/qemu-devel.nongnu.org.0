Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46068629BD5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:19:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwkR-00036L-84; Tue, 15 Nov 2022 09:17:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ouwkN-00035Q-RF
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:17:08 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ouwkL-0003e5-My
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:17:07 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.240])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 1B99922A22;
 Tue, 15 Nov 2022 14:17:00 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 15 Nov
 2022 15:16:59 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0012ac8cfce-dd9e-4663-b561-bed5d819356e,
 4108EF7A520F6C47CD43A20CA0BA38D18DA47D40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <199aba7e-2ded-0309-45fd-d51c87c8eb5c@kaod.org>
Date: Tue, 15 Nov 2022 15:16:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Automatically zero-extend flash images
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Peter
 Delevoryas <peter@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <patrick@stwcx.xyz>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, Alistair Francis
 <alistair@alistair23.me>
References: <20221114190823.1888691-1-peter@pjd.dev>
 <890395fe-ed58-8a5d-be76-b28d99e6289a@kaod.org>
 <58687845-716a-76d0-a294-ffa26114ada0@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <58687845-716a-76d0-a294-ffa26114ada0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 5fef1503-4b94-47fc-b607-f0c363d28edd
X-Ovh-Tracer-Id: 11482771675897236402
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggdeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhpvghtvghrsehpjhgurdguvghvpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhprghtrhhitghksehsthiftgigrdighiiipdhfrhgrshhsvgdrihhglhgvshhirghssehgmhgrihhlrdgtohhmpdgrlhhishhtrghirh
 esrghlihhsthgrihhrvdefrdhmvgdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
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

On 11/15/22 15:06, Philippe Mathieu-Daudé wrote:
> On 15/11/22 14:06, Cédric Le Goater wrote:
>> Hello Peter,
>>
>> On 11/14/22 20:08, Peter Delevoryas wrote:
>>> I've been using this patch for a long time so that I don't have to use
>>> dd to zero-extend stuff all the time. It's just doing what people are
>>> doing already, right? I hope it's not controversial.
>>
>> I simply run :
>>
>>     truncate --size <size>
>>
>> on the FW file when needed and it is rare because most FW image builders
>> know the flash size of the target.
>>
>> However, the current error message is confusing and the following could
>> be an improvement :
>>
>> @@ -1606,6 +1606,13 @@ static void m25p80_realize(SSIPeripheral
>>       if (s->blk) {
>>           uint64_t perm = BLK_PERM_CONSISTENT_READ |
>>                           (blk_supports_write_perm(s->blk) ? BLK_PERM_WRITE : 0);
>> +
>> +        if (blk_getlength(s->blk) != s->size) {
> 
> '!=' -> '<' ?

Hey. yes :)

I will send a patch. I am not sure this is 7.2 material though.

Thanks,

C.

