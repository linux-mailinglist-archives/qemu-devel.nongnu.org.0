Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624AC520E40
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 09:02:54 +0200 (CEST)
Received: from localhost ([::1]:48184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noJtV-0005EY-HD
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 03:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1noJo5-0002Yu-TR; Tue, 10 May 2022 02:57:17 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:47001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1noJo3-0002Dv-PI; Tue, 10 May 2022 02:57:17 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.186])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6C6B6FE2C9B7;
 Tue, 10 May 2022 08:57:11 +0200 (CEST)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 10 May
 2022 08:57:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003dbac5db2-a2ee-445e-98e1-1886c0b14679,
 1EE4DC631931028654B42CA219073376F40F54F0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5bf799ff-492f-286a-66f1-2d43a87f3a4b@kaod.org>
Date: Tue, 10 May 2022 08:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 10/17] hw/sd: Add sd_cmd_SEND_TUNING_BLOCK() handler
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
CC: Bin Meng <bin.meng@windriver.com>, Joel Stanley <joel@jms.id.au>,
 <qemu-block@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-11-clg@kaod.org>
 <12c97f3b-6d3a-cab3-3768-d41ed68e5de6@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <12c97f3b-6d3a-cab3-3768-d41ed68e5de6@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9e311fc1-1a91-4f08-b910-ad0fb36baf81
X-Ovh-Tracer-Id: 920704651038395299
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtheekleeitedvtdelgfevueehudehteelvddtgfefffelvdejkeejgeelvdekueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/9/22 23:05, Philippe Mathieu-Daudé wrote:
> On 18/3/22 14:28, Cédric Le Goater wrote:
>> From: Joel Stanley <joel@jms.id.au>
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/sd/sd.c | 28 +++++++++++++++++-----------
>>   1 file changed, 17 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
>> index 25e86c893bba..602ed6eb0701 100644
>> --- a/hw/sd/sd.c
>> +++ b/hw/sd/sd.c
>> @@ -1042,6 +1042,22 @@ static sd_rsp_type_t sd_cmd_SEND_RELATIVE_ADDR(SDState *sd, SDRequest req)
>>       }
>>   }
>> +static sd_rsp_type_t sd_cmd_SEND_TUNING_BLOCK(SDState *sd, SDRequest req)
>> +{
>> +        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
>> +            return sd_invalid_state_for_cmd(sd, req);
> 
> There was a bug here, this should be:
> 
>                 return sd_illegal;
> 
> (see https://lore.kernel.org/qemu-devel/20220509141320.98374-1-philippe.mathieu.daude@gmail.com/. I can fix upon applying).

I missed that.

> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks,

C.

>> +        }
>> +
>> +        if (sd->state != sd_transfer_state) {
>> +            return sd_invalid_state_for_cmd(sd, req);
>> +        }
>> +
>> +        sd->state = sd_sendingdata_state;
>> +        sd->data_offset = 0;
>> +
>> +        return sd_r1;
>> +}
>> +
>>   static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>   {
>>       uint32_t rca = 0x0000;
>> @@ -1285,17 +1301,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>           }
>>           break;
>> -    case 19:    /* CMD19: SEND_TUNING_BLOCK (SD) */
>> -        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
>> -            break;
>> -        }
>> -        if (sd->state == sd_transfer_state) {
>> -            sd->state = sd_sendingdata_state;
>> -            sd->data_offset = 0;
>> -            return sd_r1;
>> -        }
>> -        break;
>> -
>>       case 23:    /* CMD23: SET_BLOCK_COUNT */
>>           if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
>>               break;
>> @@ -2132,6 +2137,7 @@ static const SDProto sd_proto_sd = {
>>           [2]         = sd_cmd_ALL_SEND_CID,
>>           [3]         = sd_cmd_SEND_RELATIVE_ADDR,
>>           [5]         = sd_cmd_illegal,
>> +        [19]        = sd_cmd_SEND_TUNING_BLOCK,
>>           [52 ... 54] = sd_cmd_illegal,
>>           [58]        = sd_cmd_illegal,
>>           [59]        = sd_cmd_illegal,
> 


