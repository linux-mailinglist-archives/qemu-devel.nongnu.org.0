Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE844C2CFC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 14:30:29 +0100 (CET)
Received: from localhost ([::1]:51340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNECT-0005PD-1g
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 08:30:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNE9m-0004Jp-8y; Thu, 24 Feb 2022 08:27:44 -0500
Received: from [2a01:111:f400:fe0d::713] (port=14087
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNE9i-00009A-8o; Thu, 24 Feb 2022 08:27:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duwRBeYyPPMu5N8aTfdBW3XBYFzHuJdJm4w9h7pjgzBXqtw3P5XNkMpSskUpDAnX/E8cSOEDU4Gx10MJ89QmFEGWa84TgwVVHiljZPShBLw2GBPQ2ppsQiM4CaeOcRApt4hwBFGgueouujc6NXX4mT7lEmt8QsTRSM6tRDKbnKALwykVn8xOfB+mwEUlRSDUazUjQh9WLva89QBHFVVjViceA0lOw71ZV5ULRlGuq6M+bh4XRqCXtNG671gYF4Ta8D8ixnI6g+9+hGLSua/cQIh7upTfFYz5AZhdzSJDDB6/e4Mlu1nbnb7b1KmfSVAEERz1BDiGNXhYP4JGklmK3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uwFH73R+1VAisWsjBGG8f9hGkFXU8XHB4Lc4dHCBQc=;
 b=loyfdhxJh1w4dSsCdS+mD4TA23ahrv62WuLOirXFih4Bnjdxq9v3t2FSz2OPdyYX4G7VD/kVGj3bQ6UncQkNEz/YVti5v4XS3JcPElhYMSxxS6wPoDRYZYKj6Z4mq61Q16ul2XKGFmuuuhQSzIt5b3otlLwluGse/QIV0ZFqID/tVu3L7Yrav1Ehz4HGCcnEqRw4AFOInhRz8iK7Wa0sEJiq6IkcQoB7nMoi7NjorLvsXNVKjArMUh4T2iNsJoWARgQOBuwFmUe4/uoJIV8DRQ5vEUxAkd/r+YLRofENka3IvYp60yeZavd7xYIkSmPNc79CIIIf75GQPtqHxtNH7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uwFH73R+1VAisWsjBGG8f9hGkFXU8XHB4Lc4dHCBQc=;
 b=M3NwvmgCFPlma1hPFHDAbr6NSheOj2/cq95ECy9Z97vgE99aG/6Cwh4Dlnjd3hQmvXjPWKu7o+Xm++WbpGKEvpSPKc/UzxFe3YP/CXvOwiFW19a7FR+z6gRo7VvqdD25P3hXk+VpLpDENeP231k+ERkGcFLKUD/GtCI8C6zrYGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5652.eurprd08.prod.outlook.com (2603:10a6:20b:1d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 24 Feb
 2022 13:27:31 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Thu, 24 Feb 2022
 13:27:31 +0000
Message-ID: <e8c500b0-aaab-eaac-c8cc-d6b1749268c4@virtuozzo.com>
Date: Thu, 24 Feb 2022 16:27:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 04/18] block/copy-before-write: add bitmap open
 parameter
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-5-vsementsov@virtuozzo.com>
 <681b2420-e4c3-5849-3d08-c85711243fa1@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <681b2420-e4c3-5849-3d08-c85711243fa1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0191.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::16) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8c81ca2-cf1d-45c5-6a35-08d9f7996903
X-MS-TrafficTypeDiagnostic: AM8PR08MB5652:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB5652740BA14110A85B7AB46CC13D9@AM8PR08MB5652.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sCE5LG3zHpYilwMJk16UEK8IQ8nLnqIxL0fxeBYcfd5toHUVOrcoLK1mqtw22HwKrpHHHnIVmJ98TLavEjn2toMlz5Vw0WE4xyW1OTsNm6Rq4lCOPy0wF6ciUwXQALwdJmSH2/riq7dNaOql0gr+MLwuI5SPoU2/1eaIvBtWSDQ2JLj/yG2GsfPaeqwto6zpLv+SMvrl22ADaR0jk4wuI10ZFmLjlybopm8gpjUEXhFPruz1XAeN39bjZuVClcS6d3YmeY5n6nhLEUTambHkuym6Ati4hjjf4fjdeLMRC0dvVrWc1jrQd31SHcVpUyzVHXKTHbjE3Nn61LURP7FAWSk0Zhp6DdL63J8T0ZElkxbcLxp24JPifE+ATK13CYoybBRFugF81biwoR4IGlEt9IH7cOipt4EdiXsLu38wDQBEeeuaZSUuKls+dBtebCB1TpSCoaddm6IMW31jenUoNUkxAGjcvXn09t+e30MMAjH9nohK8axsTfVar3euWPNigSOqW9eCrTpdbCQz4amvhrsmCmlmq+vZtBHra40I2sWz1+e+NmH/Tq4skWgCN2GZ49o5o1yLQV+Fyf8vYkWEDteZ6Nf9dpo6b6JY2vOU85kkPaRBiMnX64OJYFlXoOM5qug6Gywx6aEqFC/I0an6lv5crwCpBF6rgykXPTTnYO1yfa6EOylq4BShCdl55K2Qz+nqhHXJkN/XHMTUisl38MwNtGGeaUemVkoqr/CtFZnIMt0uTAQwCPJTcR+Q/HHQ71Tg4OhTlFQScnN6oxGFLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38350700002)(2616005)(7416002)(8936002)(2906002)(86362001)(26005)(107886003)(6512007)(38100700002)(5660300002)(316002)(31696002)(186003)(83380400001)(31686004)(508600001)(6486002)(52116002)(66476007)(8676002)(36756003)(6506007)(53546011)(66556008)(4326008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amJvejdyTnRRYjloenh6MVVLejJNZmM3VXFlTGluM3BLckpGNkE5SUE3Q2tZ?=
 =?utf-8?B?NDZtb2VhTlVjVTZwSTl6Mkk2ZWRaRVRsazU4cEJtU3ZIVW95TnNFTm9PSnF2?=
 =?utf-8?B?cXBHM3E4ZXkzNFIzRm5URnZJMjQ1YStQa0dEWSsyUWt5SEp5QnRsbE8ySUxi?=
 =?utf-8?B?MXFnWThkMHpRODk4VS9sWlVCa3prTGw0NjhUbUtUQm5kc3pXZngwZjBRaE9r?=
 =?utf-8?B?NmJBYzVjTjduUlVEbkx1YUhXNVNQM3dDQzhMVFhLcnFkL0tTTUUwa3ZZSUsr?=
 =?utf-8?B?djdybUpXUmlYUWc1Z1lCWnE3akN0Zm1hYzN3cUNFajNOang3a3dmWkVwb2pa?=
 =?utf-8?B?eDFpUDNSbk9FZyt6MDdtTXFZRjhnZGk4YjZhTjUrSTNxZkhrWWY4d0hqcWZD?=
 =?utf-8?B?MXNpNTBKcmRyckRaQmk5VURTdHZsa3EvOGhQUHpzZkhweU4rUERqY0UwRkM0?=
 =?utf-8?B?UVBvZHpmd05KQXI0UnJuclVKMENPNzMrNHdGT0JzeEpabkRqVVNMVkZ3a1dv?=
 =?utf-8?B?dnl2U1ZlaHBUaDB4cVhZQU9WUjhCSnQ1NzE2bDNBdlp2MG9sR2VGNnhwb005?=
 =?utf-8?B?VE5KVmJzSnVXSndCMGMyQWZ1d1VPVDdVUGpLQXBuT0NDMFdXQThFUEhkVDlU?=
 =?utf-8?B?VGpYWWM5QVU4YUV1SkloOHRKdXcxc0xZOFBQSnBObnNKaWo0aDNpN21BOGJ4?=
 =?utf-8?B?Nnl1YjM5ays1MmJ3eGtsUmlHbHJzWmpUQkk2Z09SWGx6d20xazlJaW40YWhJ?=
 =?utf-8?B?dmt5MmFneVdkMXNheDAyU3RuVmk3bVBQWkJtY1pnZjRHai9yRmgyQmQ4VWFm?=
 =?utf-8?B?Q2JnTUJWWGxlSW9kTGlkWUNsa0MvS3U5NnZsMG10UXpjYThQK0RsMXBxK1cx?=
 =?utf-8?B?anVoNE1Gc1d4U29WRHJ0UzJ3Q1F5a3dhZE41SDRNM3lnSldyMEdvVmpMWjRJ?=
 =?utf-8?B?N09sV3FoUTE0QXdKc2xDMDhGTHZRaU1jTWFQTWd0VzNkeUdxSEZyQzdocmpE?=
 =?utf-8?B?WVJ0YmVMbHNaejROMUhOU1ZZTnk3dHZIZ2hnRXl5cmVpZTIwckg3OWtFMi8w?=
 =?utf-8?B?YWZwVGp6SzAyL0tXelJsS3RTR1d0aXlsTDJpRmJhWU9TWUpZQnd0emEzTFZt?=
 =?utf-8?B?SzhPUEZGQVJWUU5QWDlWbmNRWGkrczFaODRGK3oyT2wyWTVmT2JoVVk4Smdm?=
 =?utf-8?B?WTJCTnY1Q3craHh5QSt0QmtDQkt0ZnFheVZTem4reVhRTGc2S1hkd2VlM2Zk?=
 =?utf-8?B?S0xJc3ptMENsQjdSS1MzZ2tpcTNkdVc5NlVodjBzcDNOUDFoS0FIbTh5ZkhN?=
 =?utf-8?B?dWZqNGxDaWlrY1RXWWFFeHBqbDhIT2N2cVVRei9sSGF6blFSZWxGTzVGcFlQ?=
 =?utf-8?B?QTFya1NqR0JNVWU0QkcvbmF6UU9ycktlZUhRdFFXV1E2MlMyVWw0NnlTaDJa?=
 =?utf-8?B?WWVxMU05TUZLRDdLNnVONVE3N0MxNDNEdnZxY0F6MDAwZWRNcGsyeVFaTGJI?=
 =?utf-8?B?aC82K1B2L250NlVsazA0ZWNRQXpoSjR6RjdXcklUeTRnUFFkSklYNU9wZmds?=
 =?utf-8?B?Tnl3YW1oOVU2U0FRNENxYm0vdjFUejl3QkczSTc4aXFUUldkVGhGeWEwSjJM?=
 =?utf-8?B?a2dlOHRyejBpaFlzT0NLLytWSkw3aDdEUnRMUmUrdFNmdFVjSHloci8wT1c5?=
 =?utf-8?B?ZmRhc0lCeWdUeVFiOStwS0xUY3pVWmFub2xES1o5UHh2ZDBOdXVDVEorUUdJ?=
 =?utf-8?B?bmtBcFRlZHUwUVk0d1hSZ3kxZzJwUXF1VzhNVDNHdldqTTF5WFk5UXp0SUdP?=
 =?utf-8?B?cW4zZHlmdW1vUkZZN1BkNVdGaGgydldZM2xOU1k4M2F0WDlUVzA5RmpwRFdr?=
 =?utf-8?B?TEdqYVNpUHhzSVVhcDAzc3h0N24xN052Zk5YLzlzazNDTEViMDJGRWpDUENz?=
 =?utf-8?B?cVZtc1VxK0JJcFVJV0VocngwMmFmT2FHeVozMHpKOWZsVElEamgvc0oyZERP?=
 =?utf-8?B?Sm9QSjBUakNIYXZHdE0vcDcrSzJmUDlrMUFqaUM2MzYyLzcxVGdQTU5iK0ZT?=
 =?utf-8?B?NUY3MHdJcCt4T3ltWmxCWXd4VEJBeWpLWHNBdFh2aTI5R3ZZeWJZQm1vdVpB?=
 =?utf-8?B?S0puM0s2TDczN21jSUczL3ZqUWlOdFdYTmhYNEJFZzlxYnJhYTI4S3lCZkVZ?=
 =?utf-8?B?VEttREUwbnlYMlNGcnhaSG1aNyt5QUZBZHhrN3owSlc2MlZSaDBoQ25yT3Rm?=
 =?utf-8?B?eEhMUzJIOTM5ZDAxb3U3d1BIbEl3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c81ca2-cf1d-45c5-6a35-08d9f7996903
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:27:31.6180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+T1QrhUXpt4JgtyK69p7+BioDaSAsGMUJrFIdwVbtxudWgNCKA6sb6lEYpoc7TnhyjND2Fh37JSUVJg+vdqAd8ze+mV0NyB2XftpEnZVsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5652
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0d::713
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0d::713;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

24.02.2022 15:07, Hanna Reitz wrote:
> On 16.02.22 20:46, Vladimir Sementsov-Ogievskiy wrote:
>> This brings "incremental" mode to copy-before-write filter: user can
>> specify bitmap so that filter will copy only "dirty" areas.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qapi/block-core.json      | 10 +++++++-
>>   block/copy-before-write.c | 51 ++++++++++++++++++++++++++++++++++++++-
>>   2 files changed, 59 insertions(+), 2 deletions(-)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 9a5a3641d0..3bab597506 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -4171,11 +4171,19 @@
>>   #
>>   # @target: The target for copy-before-write operations.
>>   #
>> +# @bitmap: If specified, copy-before-write filter will do
>> +#          copy-before-write operations only for dirty regions of the
>> +#          bitmap. Bitmap size must be equal to length of file and
>> +#          target child of the filter. Note also, that bitmap is used
>> +#          only to initialize internal bitmap of the process, so further
>> +#          modifications (or removing) of specified bitmap doesn't
>> +#          influence the filter.
> 
> Sorry, missed this last time: There should be a “since: 7.0” here.
> 
>> +#
>>   # Since: 6.2
>>   ##
>>   { 'struct': 'BlockdevOptionsCbw',
>>     'base': 'BlockdevOptionsGenericFormat',
>> -  'data': { 'target': 'BlockdevRef' } }
>> +  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
>>   ##
>>   # @BlockdevOptions:
>> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
>> index 799223e3fb..91a2288b66 100644
>> --- a/block/copy-before-write.c
>> +++ b/block/copy-before-write.c
>> @@ -34,6 +34,8 @@
>>   #include "block/copy-before-write.h"
>> +#include "qapi/qapi-visit-block-core.h"
>> +
>>   typedef struct BDRVCopyBeforeWriteState {
>>       BlockCopyState *bcs;
>>       BdrvChild *target;
>> @@ -145,10 +147,53 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
>>       }
>>   }
>> +static bool cbw_parse_bitmap_option(QDict *options, BdrvDirtyBitmap **bitmap,
>> +                                    Error **errp)
>> +{
>> +    QDict *bitmap_qdict = NULL;
>> +    BlockDirtyBitmap *bmp_param = NULL;
>> +    Visitor *v = NULL;
>> +    bool ret = false;
>> +
>> +    *bitmap = NULL;
>> +
>> +    qdict_extract_subqdict(options, &bitmap_qdict, "bitmap.");
>> +    if (!qdict_size(bitmap_qdict)) {
>> +        ret = true;
>> +        goto out;
>> +    }
>> +
>> +    v = qobject_input_visitor_new_flat_confused(bitmap_qdict, errp);
>> +    if (!v) {
>> +        goto out;
>> +    }
>> +
>> +    visit_type_BlockDirtyBitmap(v, NULL, &bmp_param, errp);
>> +    if (!bmp_param) {
>> +        goto out;
>> +    }
>> +
>> +    *bitmap = block_dirty_bitmap_lookup(bmp_param->node, bmp_param->name, NULL,
>> +                                        errp);
>> +    if (!*bitmap) {
>> +        goto out;
>> +    }
>> +
>> +    ret = true;
>> +
>> +out:
>> +    qapi_free_BlockDirtyBitmap(bmp_param);
>> +    visit_free(v);
>> +    qobject_unref(bitmap_qdict);
>> +
>> +    return ret;
>> +}
>> +
>>   static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>>                       Error **errp)
>>   {
>>       BDRVCopyBeforeWriteState *s = bs->opaque;
>> +    BdrvDirtyBitmap *bitmap = NULL;
>>       bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
>>                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
>> @@ -163,6 +208,10 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>>           return -EINVAL;
>>       }
>> +    if (!cbw_parse_bitmap_option(options, &bitmap, errp)) {
>> +        return -EINVAL;
> 
> Hm...  Just to get a second opinion on this: We don’t need to close s->target here, because the failure paths of bdrv_open_inherit() and bdrv_new_open_driver_opts() both call bdrv_unref(), which will call bdrv_close(), which will close all children including s->target, right?

I think I just followed existing error path in cbw_open() on block_copy_state_new() failure. But I think you are right and bdrv_close() should take care of all bs children.

> 
>> +    }
>> +
>>       bs->total_sectors = bs->file->bs->total_sectors;
>>       bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
>>               (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
>> @@ -170,7 +219,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>>               ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
>>                bs->file->bs->supported_zero_flags);
>> -    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
>> +    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, errp);
>>       if (!s->bcs) {
>>           error_prepend(errp, "Cannot create block-copy-state: ");
>>           return -EINVAL;
> 


-- 
Best regards,
Vladimir

