Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D9639B20C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 07:37:32 +0200 (CEST)
Received: from localhost ([::1]:38776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp2WR-0002xS-HQ
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 01:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lp2VW-00029s-VQ; Fri, 04 Jun 2021 01:36:36 -0400
Received: from mail-eopbgr30118.outbound.protection.outlook.com
 ([40.107.3.118]:10428 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lp2VU-0007Qe-Us; Fri, 04 Jun 2021 01:36:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqfro9lZ0uzWE7Cne/+JP6h39PUNCfOI4xxS+LgTMpsRLkqC2tVYWcfqz25Mj9vubd9Z3QU8o+Y8nK37SOndQwZEU/tuwiEX5aFBsGiRCTxvP+t5AcKBHd1Vv2z0wGyLIdSdO/jVakLliUPEjrkESgGJ0P97SbYL17KMmrB4EWEts4yxRWJXjgC0xSPg1Kmunyrs3rryvzKRRK2WigbSba9nr8FDUOzMynutPJEYuVUXIhhSDrAA6G2GJo7LLgduvE3lI5kv9csQNiu5E6jCoV8R4+DsKiF0IWzWF2Xc4i33GV1DTK+CJ6pV9XRIWsMP1YbiTZ5SG4eTGylDbBkRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuljCy66DIYHNDP/h0o1PBs1hVffRxtQPF84suRwcnI=;
 b=YU3UrYMHOyiSszeS2jWPAxOJLQqzmeG7FMj4PmCPD658A/m/VCxgQLQH1AyKrkS/iuPO50XH1TxuLHxEJwTaDAwb+bGUvwolAFLSAEvcXif3JE1xSC/i9rL+axM2G34nFnI2trtkiX1knqzyrpBdV69AolpbHOfxiOyPmZAKf0CXrn2M3xqM/lbhj4XydUogsd2txh6wehoI2vDF/xghV6K3ZU9G4T2jzJmDQEAT5ajqnM7ZSM9mO8+1Ob3Dcj3yogHTtsB4m/xcjNejbmdRDtN4cq8o4t1tgLAA48Y1KwuieL2PUaxVNZPapQNXsjKiez6LBM0u6x2IhvXpT/1aJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuljCy66DIYHNDP/h0o1PBs1hVffRxtQPF84suRwcnI=;
 b=mtz9BdYOVHffvzhbwGe9/VvVj20J4D7yePevuv73dSLx7UNJrUAIE8fzoLqiBdQzMTZvCN0pgfB/T37Z3tBYnxVm/JVEbIasiwsViiRWqDr5TagVxNT0u5Up2KofqxXfg/m+eTk380PB9bD/dRaC0RMWqj1c7t0flmnwIbjiGC8=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6808.eurprd08.prod.outlook.com (2603:10a6:20b:39c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 4 Jun
 2021 05:36:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 05:36:29 +0000
Subject: Re: [PATCH v3 32/33] block/nbd: safer transition to receiving request
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-33-vsementsov@virtuozzo.com>
 <20210603211129.asvngeqkvskrobzc@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d1e96b17-fd5e-269b-f460-254b83f7e0b1@virtuozzo.com>
Date: Fri, 4 Jun 2021 08:36:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210603211129.asvngeqkvskrobzc@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: AM3PR04CA0138.eurprd04.prod.outlook.com (2603:10a6:207::22)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 AM3PR04CA0138.eurprd04.prod.outlook.com (2603:10a6:207::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20 via Frontend Transport; Fri, 4 Jun 2021 05:36:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b3e1929-35e3-471e-b34d-08d9271ab43f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6808:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB680810C6CA31517157CFA49EC13B9@AS8PR08MB6808.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QmkiY3OzR7ASwI042plGcgzvzmsgdqXO0negw3a5MJaYj9MHyZ8KAnQEVouorvEiwsGfjNfLldg8U8MbxsbyQTMKcH2zGRnLCTDbwXC29YeXdjfflmr5VcC7ZBsbinpEdYxNoUuLEj2Ae+68zGRYE0x+DS+I01pvqYl25pGlBMNHwQky+cf3v6Xd0r8SQbxAnywWr1mK4ceyn3E0vNbQfsQPG2mYCg8VC2FHA5aIym03CZ9P7CxUqfHKUaaxDdZD2O9NK8K4PYocIOdTPw7mbFyLfWLiSz7CQsVlvue6Rezw663YH0XloNN35R18xt9mYZUFnBRXWHad8yZcB0SZSNVDXJf1HGxmp4i8pT1C2GOnpgQZy6nX/pNnBbUX2eoa1z55Yo+DW1XV8WXICX5MTohjt/DszkveQJ/sDQDXYcjV2floMK7QZHcfx05LGUUWGTYb2nhElTR9Qdrdnmr1re4g3NRJT2dn+RbfaofDN35peL3/0OmbnIn7w7Gi91yKD6QrDo55BlD+IyRc5sfyWP2ctMVMAB4aeNefCqZAaJvBOYq2BJ9EbdO1xSKfSuScgKgd9rX1chbyFZ507JDJMnZZMHK8GI3LodF4+DHmuPYFGZMOiN3FDBJimw5tLv7PezKr0x97W91w5pLdNS+Ih6y5CTmQQBC+gujEuLWpSgJhByLh6k5LtajA1FFkox7lh5CUloSZokLqFLUccu0pTnObLVpaSsrGJAjo6Hcn8GM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(136003)(366004)(346002)(376002)(478600001)(8936002)(31696002)(66476007)(5660300002)(66556008)(8676002)(66946007)(16526019)(107886003)(26005)(6916009)(36756003)(31686004)(52116002)(186003)(4326008)(6486002)(83380400001)(86362001)(38350700002)(38100700002)(2906002)(2616005)(316002)(16576012)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NCtJTVp1NnhTV0NvN2o0VVRkVEZrUVlVMHRYNTE2ZDR5VWZkamh3dmt4Rm5V?=
 =?utf-8?B?cWRIN0FFLzFQa0NDdFd3SjZEU216bm5yRUpabUNyclBOc2NXcE41ZW4yMGRX?=
 =?utf-8?B?Q0tTN1JVNFd0UFBERldXWjN2TkRoK1VvMC9tWjk1djJqUkxBbmh5N1hZZ1E0?=
 =?utf-8?B?QTd3L2hrcFdZZG1laXpsMUcyKzdIV3JkVzJkeFVNNkZaWFZnaFFlckVZODlO?=
 =?utf-8?B?MHpKVit6S0s2aVQ2UVh6TG4rVnBZTTRNY0xXQjAyVng0VTBqMkNXbjJBaWhK?=
 =?utf-8?B?VWxoaDRpN29TSVJuWUNMSGYxN3RpSWhLVmtZNzFuSzZaV2pJY3BRRGU1cVBw?=
 =?utf-8?B?MytLd3JVS2RTcGtEWVI5KzRaMlltbTV1OCt0c2lBSmdhOG43TGptNy9TY0Jy?=
 =?utf-8?B?V1FHeXR1Z2RhK21kWk5zRWIrZXZKM3ltMzBIUFJuRVFzYW45VEN0TnRPcTdD?=
 =?utf-8?B?SDZ2bGVxeERGMyszZHVDdHVjVnR3Z2pHaEFHRjlWcVp5YnFBaCtLMXo2OWRJ?=
 =?utf-8?B?SW9TV08zNXYvM05PTHkwbit5eWt3Rm1pcXhwTVVYV0tQSXZmak1Wd3JjRXVP?=
 =?utf-8?B?cWhNZm04YnZ5SUdKNGNXTDdnTWowZlNIMU1xTFIwWXI0eVYvSkU5RDhLd1VL?=
 =?utf-8?B?STB0TWlGY2ptczQ3VzJJdC9CN2V1NHdLRG9ST1dFemtNZUJYRDhaOHZWVm5q?=
 =?utf-8?B?b1JQZVRTbmlqNzg0ZlR0SUF5YU9FM1J0ZVVqZmpNRnlIOUxqbjRCRUNZVmpF?=
 =?utf-8?B?QVlVZVV4MExuUGdmb3lSYk9BWkErU0FnZ2NkdUNHOE5CelY4SE1zcktoNVBm?=
 =?utf-8?B?ZjRVcGxvTzR0Uy9WSlZLb1hRM0phL09jKzlvdUNQRDREQU01WXJwUThVaXhZ?=
 =?utf-8?B?cVFBczJKZVRvYWgzWlZIV2xiYUJ3NmhoeVhPVUFieTBQM0lkZFFmVnhnWGJH?=
 =?utf-8?B?OU94S2V0Z1NqZUxUU0lHcDVwYzZCVjduc3UrZ3BNWTRxN3NtODIrQ0NlS3gz?=
 =?utf-8?B?RmtIakZyN1M0NFJVY2hYZVJGNTFBYTNqWmRiZDg2QUE5VVB5N25pcUlBRm8v?=
 =?utf-8?B?Z1Zqck9FcVppMml2SzVIYmFGSVdVVmNpNlBkalBGMFNHNHhKaUNrVEkzOUcy?=
 =?utf-8?B?SGtTYXEySVRwT0lVNVZXeXMrTDR5TmFDeXFVV2RFWHhvMlBZMGdVVHovZVFM?=
 =?utf-8?B?OXcrT3d4dUd5RlBiMjYyZkhIcGJrdlJGdjhHR3U0MVhjcGRNYUNRSFJLYXd6?=
 =?utf-8?B?UTZ6MHBVT29nTURGUmJpbzZlWitlcHJ6ZWhxcHFWbnBnM1dDL2VBcTFpeUQ1?=
 =?utf-8?B?aVl2Sk9PZ2dtYnQvMm1rU1BJYnpoUktvbStuZVFTVW5tWlY0NXY5ZzcxelA1?=
 =?utf-8?B?ZFI1c2pJNkkrbGtIUHliZmRQYk95TVVMbUplM0xDYnhET29abnJoeENtYjJW?=
 =?utf-8?B?NUZsY0ZhUVcwZTZiM2Q4NS9kcWNQZVRzaHhsUU1DTnVLUU5WaHJkYTFoMlR6?=
 =?utf-8?B?THRZZGJyT3RJZjFYd1VrUUltMUZvQXZxRVhoWGdiMjh1Y3hKdG85azM5RU5r?=
 =?utf-8?B?aUZhS0JkczViNHV1VE9vcklVeTVZWkxCY2l0d2xuYjI5c2Z0eXp0azViQ1F5?=
 =?utf-8?B?SGxaczFRYUFkNXoyMElkOVhFYTdjNzJoZXRSbWJWbkx6a0FwTzFmZEdZM1ZF?=
 =?utf-8?B?b0RhK01CenNPMFRYUGtiNXNCWDVwMk1aUjZnUUw2dExrQ3hkaHJmOHNCeVhy?=
 =?utf-8?Q?NxT3penZU91Qf2yTT7ozZkZ/DdZwczki0OQWzrv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3e1929-35e3-471e-b34d-08d9271ab43f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 05:36:29.7417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLpGxMGgfpv0axdxi42gIWvuvAKAkffbolEypj0MagRfTfBFPkGhIFx4p9xiGnem3+4Wo/+SLNZahAjAFXLVgHSPWfEQCbDEL/E/ujYqhfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6808
Received-SPF: pass client-ip=40.107.3.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7,
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

04.06.2021 00:11, Eric Blake wrote:
> On Fri, Apr 16, 2021 at 11:09:10AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> req->receiving is a flag of request being in one concrete yield point
>> in nbd_co_do_receive_one_chunk().
>>
>> Such kind of boolean flag is always better to unset before scheduling
>> the coroutine, to avoid double scheduling. So, let's be more careful.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/nbd.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
> 
>> @@ -614,7 +616,7 @@ static int nbd_co_send_request(BlockDriverState *bs,
>>       if (qiov) {
>>           qio_channel_set_cork(s->ioc, true);
>>           rc = nbd_send_request(s->ioc, request);
>> -        if (nbd_clinet_connected(s) && rc >= 0) {
>> +        if (nbd_client_connected(s) && rc >= 0) {
> 
> Ouch - typo fix in clinet seems unrelated in this fix; please hoist it
> into the correct point in the series so that we don't have the typo in
> the first place.

That also means that I didn't made my favorite "git rebase -x 'make -j9' master".. Not good, will fix of course.

> 
> Otherwise,
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 


-- 
Best regards,
Vladimir

