Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19C73734FF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 08:36:29 +0200 (CEST)
Received: from localhost ([::1]:39554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leB92-0004uj-PM
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 02:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leB6w-0003wX-Em; Wed, 05 May 2021 02:34:18 -0400
Received: from mail-eopbgr140125.outbound.protection.outlook.com
 ([40.107.14.125]:55470 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leB6r-0007Sf-HO; Wed, 05 May 2021 02:34:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7Y9ftbFeHMEMrt7RBsX7gFpMR/NktXIkh6OoGfUiQx4ZnRhWTEVOgRLuzUjY9bZxCBosNeBsPtp33kQAyTU1AqkY7h1e/1d0o7KN9E56VsSo1vJupPl9klZoDxm5PAa0oeW8z0M8Aw/cZlI+6oMlM/gP4UIbK2JkPZ8tpx1Gk69uWtqMYS+jOmWxavfaIqku+fE6mQKUT3lqSFJCyn0lBSaqcq0QHAkPoBolUlRZaNGW2aIdKmEFMrRPNU6UpmDiRTSdELKRaIz9PwZGNiH9EUHCfLYiK/YD/UULbKlQRPcqIbd+7k3n2LGudEvGDbuwUtBPk8BUfSHyuhvVj8Iqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5ZBGeYQkrmYvH+XO4TuM9AAaYgOxw4DPA9g7MaYez4=;
 b=UydwEBmRvykcCaZC5ygSC0BhmqpOFboJuOzSVgEL68u74mp17FKihDn0m6QhZnhJbMjgbCg7ZxHnTSpnzWy6aM6XcFxKws3rC9Y2mOZzLe+DbjaKI4L7sKLKjKpY2rMwkPwTuJQX4tKNXh2lwAQt9E5ZJP3eR60g/avtIHqSm1Sq5dt/cxCBG2i2MVPiPl5jRHS56tsmDXt+GowhvfUuAagmdVPDwti73kOzE/2owZ6BbBDaOTfI9awbzi5qQwZMwsUJT9M1PULyEGwTKynuk1qlXzRol3z7CgchSR8EyFUunkFxKR02vvbv4yksU+BWo0PhGzTuaR2zZ1hYmD/S9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5ZBGeYQkrmYvH+XO4TuM9AAaYgOxw4DPA9g7MaYez4=;
 b=QT2o63VCStgX8Ts4Dx+Z14iRRBW07yQ2VFUBglLZiRyFRicntFeHtl8m1vpI0twB16/Q+TA6WJfaOM62fho+cq2iFbtaoTL3ArzVvD3ClH8Qf/atS8vpJyatL2epuym99qhmp9KrsHgzvJBLoKEzgsTKatbytyPtQSx9D/hyE6w=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6948.eurprd08.prod.outlook.com (2603:10a6:20b:347::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Wed, 5 May
 2021 06:34:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 06:34:09 +0000
Subject: Re: [PATCH 08/10] qcow2-refcount: improve style of
 check_refcounts_l1()
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, ktkhai@virtuozzo.com
References: <20210504152023.322862-1-vsementsov@virtuozzo.com>
 <20210504152023.322862-9-vsementsov@virtuozzo.com>
 <d3b3564b-16c7-40d4-d229-363b77d2c0ee@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1b1d77f7-d39c-132c-f3d9-9c7f8ba60d79@virtuozzo.com>
Date: Wed, 5 May 2021 09:34:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <d3b3564b-16c7-40d4-d229-363b77d2c0ee@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: AM8P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 AM8P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Wed, 5 May 2021 06:34:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7beaa68-7db0-4bdc-d25b-08d90f8fc9fa
X-MS-TrafficTypeDiagnostic: AS8PR08MB6948:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6948AAE4F5E962849463E62AC1599@AS8PR08MB6948.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SHS2Y+TDE2rrUd7Ft8QN3JrnWNZyAdEZe18QAvEqkK/W6yGOiC2wpIX2ulyWcGPnyk9xWOSEmyp1nxpKWTDX9TkR5/fU0R9VKCDBKo7Wl6V0k4C+3wzLJX/r6GfB4CEcF16DHctR8lDyUZHjzR7VWKxmxfFpKJ0SfJrjNnzutQKpw1A84b48v2ZXsl5ydh3ToVgrswNzt6LamWxKDvrBQ3PqqVP4fvtCTvCWB6VnqPKKE7uVCnX397Gtz0TSQZZGK7PJZ1iKNKRM4h3LloXvdKyP/0J108z3vK7bJAzLFA0jLEWh4YGUmkEPUfp8KtK1EqGdnr+Nh+wwk1cOSpAuMCHQHFrM91RSaPAIx84LzJvBQn5PUPaB5BB8DE3NSfEXjW+ChueD1r77UGVPzdfJTKZWOAOFQUM0lK7zQ3JMMFXq2tD52lIC3vT/LqukolZseuC4NuV80QYsdBJW5Nzs+wWYTY6BH2DwE/MH+ZNNFH5SxULE7WzsS6vnGkSV/qPOmQEVZjuJC7jH/j7J9B5wCgJQSDFY545GCLdFrs7Eb9BLK5bktr14lR/DmBHgWAT52iEuB7h7kn5FVnp/I8dJDcz/gqLmc/RGfiqlfsBEex32C++nHjxq10CxKwQaRQcfcrwOOcsqcXMQH/dTl80R7CabENYw2UlkTQKpR5J7O9K46uDI9jsZ/WE7ECDd5e+IUIGWHMV88PWjxkpVPEwCoRJRMTPlFekCCirnveu/q5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39830400003)(366004)(396003)(376002)(36756003)(6486002)(5660300002)(31686004)(8936002)(31696002)(186003)(478600001)(2616005)(86362001)(8676002)(66556008)(66476007)(16576012)(956004)(2906002)(38100700002)(26005)(38350700002)(83380400001)(107886003)(52116002)(4326008)(16526019)(66946007)(316002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bUxqTGpVWFZHa3YvOVBUU0JvS0lQRUpPQlNlUG9BLzQ1cTc5V0N2S251OFdw?=
 =?utf-8?B?b0ZOdktXU0djTTltS1NHTmw0Ny9UVGRQSzM4Zm55MUN4Sk5SYTU4NWNWdVBN?=
 =?utf-8?B?VkxPcGtZcGpwZi8xd09WcnM3QzArZzFiRTBpZU1rV2h3VTVXbXl2bDB3U2NQ?=
 =?utf-8?B?bVZsZXluTisxVjQ2Z3hidlJpSzVlbFU3aUdRZWh5SWJ3VmUyOWhXVEo3NWpw?=
 =?utf-8?B?REJPYTdtRU9MTmRFcDVTSHo3bW1HOU5MVUVNbHVDWWptTmw4Z3JOUnRBcUM3?=
 =?utf-8?B?b0NrNFhoZ0NDTWlTUmdrVlppN3RxQ2VpM0xwRm9kRWNZeTZQWjR2MG5xc01s?=
 =?utf-8?B?K21FNkF3dk9qYWYyWHEvQU1wYVloTlU3SzNQL1AyYm1oSHo0WDlWQU5VMlRF?=
 =?utf-8?B?bjlGWExzQk0wbG5MY2p0bzQ4ajdKdEFLbGlydXBPOW9ZT1dVam8xWGpGdHBG?=
 =?utf-8?B?NHhxZHlOSEhyeU9xK3Z2bkhoeHZFcWtLSTRtU2wwSXFvem5XT2kzdm9tWmtJ?=
 =?utf-8?B?cDJjbnZ4SnY0T1UybHNpRTZGSVJmKzVVcFgyQ29CcG5YdG5maG5PbEg2cXEr?=
 =?utf-8?B?dE9GNm5EL3Y5cllKbDRIWnlRbDVhZzF0U0ZFNFUyZGttTmZQd2xQek9NLzlV?=
 =?utf-8?B?NlBjZDZTZmM2bzV2MWozdEZ1ZHRTNVNvZ2U1YTIwQUJtajA0NStqNWZaUmtt?=
 =?utf-8?B?NnI1WnEzOWVQSXg1SXVHblNLOHVYaHl3cTRzWkZGODgrSnhrdm1waVZNMHBz?=
 =?utf-8?B?Y3N0djNYMWpoZXBySTZPeEdKdVNaUTFUYkxwNStnWE1ZV2FDdUpRb2Y1Y2J0?=
 =?utf-8?B?V0V6YmdHNWRuaUFteDFtd2k5R2h0aFpBYVdtc2pnVU1KTjB5YUhoK1Y4YjV0?=
 =?utf-8?B?MHp2SWt0bWZaMnFteUpBLytLMmpuajhmbElHUXpORExmRDFwNDNZS1l0cXNx?=
 =?utf-8?B?cUR1OU1Hc2I4M3c5NEpnS2M2a2NuTWtmRC9ieWxxN3FBblNIY1YrZ0lYZlFT?=
 =?utf-8?B?RDJDQ2xpQ0xjeEpzWnQ5bFFyWk9PSEtZUDRjZSthU3V4M1pnMUFXZUZNa2NQ?=
 =?utf-8?B?c0dEdU5vS2lmSGh4SlRvM1RkTFhCMDIvTzhHd05EMEtKSFJ2K3o0WU45MzI2?=
 =?utf-8?B?NmtKMEJvRy92T0pNTlIrV0FPd3ZBVHQ5aUgvMXpsald1NHhlRUtJWHlXRUI2?=
 =?utf-8?B?TVp6Y1Bwb0RnYkhMUkZLdUNDLzFzN0tHd3VRN1JQZlBsUnhvUFdVdUoyMW5Y?=
 =?utf-8?B?dGtsYUFVUEQvOUNiSjV6dDUrQkdXdlBHM3ZaMFR2enFZT0ZYbnAyRC9zR3JL?=
 =?utf-8?B?TE1hZTZXaG1lbHU2ODI4Q3ZZZUlrZkRWYmRMZGpWcEd3amV1Yjd6ODR3U1Vk?=
 =?utf-8?B?SjByMG1hRVQ5R0d2T09hd3RNaTNWV0VtL3U0amJoNXhuMFJFNzVHV0hJem54?=
 =?utf-8?B?V0RoaDB3KzcxWWx0MkZFV3EvYjFOYUhycnQ0cnRLbmMxKzI1UllqcTE0dmxr?=
 =?utf-8?B?MVhlOTJlaHNCYkZqRUh4M0hnVDRrOHBlc0lrQVZ5UWZNTU5OcWl2ZVNDbGZN?=
 =?utf-8?B?RGRqbDRSdW1NUnJEM0VJWEVtVkRYcmtGK1VMelhiMjJvU2xSRUxUZzMvckpZ?=
 =?utf-8?B?WFNoclNPVVNYbHJxU3QyaHl3di9NZG5UdTRZWkkycng5WUxOSHc2Smc0QkFX?=
 =?utf-8?B?bGxFV2tHM1BlU0xtNmpCVnh2eGxLL0Jma3N0eXM0dnowZ0hVcVhiMHF6Q1dm?=
 =?utf-8?Q?kQmMJepVd7MSMrrG50RBN+hD3aGD6IjbJF3rcnk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7beaa68-7db0-4bdc-d25b-08d90f8fc9fa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 06:34:09.4597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7T7orz6TeCKBYthYGwdWivm6siR5kwKCstfUsksdnAuF6gme/a2ASnLBf2XFB8opviXD3ihGt43T2ZUKGbMvUeWzDG+4DIpQNjw80o1yuJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6948
Received-SPF: pass client-ip=40.107.14.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

04.05.2021 22:53, Eric Blake wrote:
> On 5/4/21 10:20 AM, Vladimir Sementsov-Ogievskiy wrote:
>>   - use g_autofree for l1_table
>>   - better name for size in bytes variable
>>   - reduce code blocks nesting
>>   - whitespaces, braces, newlines
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/qcow2-refcount.c | 97 +++++++++++++++++++++---------------------
>>   1 file changed, 49 insertions(+), 48 deletions(-)
>>
>> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
>> index 44fc0dd5dc..eb6de3dabd 100644
>> --- a/block/qcow2-refcount.c
>> +++ b/block/qcow2-refcount.c
>> @@ -1864,71 +1864,72 @@ static int check_refcounts_l1(BlockDriverState *bs,
>>                                 int flags, BdrvCheckMode fix, bool active)
>>   {
>>       BDRVQcow2State *s = bs->opaque;
>> -    uint64_t *l1_table = NULL, l2_offset, l1_size2;
>> +    size_t l1_size_bytes = l1_size * L1E_SIZE;
>> +    g_autofree uint64_t *l1_table = g_try_malloc(l1_size_bytes);
> 
> Note that this now happens...
> 
>> +    uint64_t l2_offset;
>>       int i, ret;
>>   
>> -    l1_size2 = l1_size * L1E_SIZE;
>> +    if (!l1_size) {
>> +        return 0;
> 
> ...before you validate whether l1_size is non-zero, which can result in
> g_try_malloc(0).  Probably harmless, but it might be better if you declare
>   g_autofree uint64_t *l1_table = NULL;
> and then initialize it via malloc only after the sanity check.
> 

Thinking a bit, another thing I don't like is that check if (l1_table == NULL) doesn't immediately follow g_try_malloc() call. So, will move it.

-- 
Best regards,
Vladimir

