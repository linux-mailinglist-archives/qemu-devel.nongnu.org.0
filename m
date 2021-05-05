Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D69373C68
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:29:44 +0200 (CEST)
Received: from localhost ([::1]:41506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHaw-0005RZ-M2
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leHYi-0004Sk-J0; Wed, 05 May 2021 09:27:24 -0400
Received: from mail-vi1eur05on2136.outbound.protection.outlook.com
 ([40.107.21.136]:30177 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leHYe-0003kd-PH; Wed, 05 May 2021 09:27:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLf0GXvXvUF7NWcHO3V/Vi5RZ1Zs3SM+YKfrkR71YUiTdK/3VrfX5+ajE7KAfB3FG/c50nltbbOhwnmtD1kUWInVDN2723MSPebx2OAWd2kVx6VLOTRxGiKWJMOjIMbJ8PQRnMTJEJF2qGOV0pRLyZYn/19D3n5B30MF5VjaL2tO3PdrbD28MtalLNHRAqyrZBs+kzvVvk7JL+Absc4f2QVU2Q9jdjqiWzWb0mdJBCd4imLl3NZpO0f6YfT9KsUh7x7+BM6uuG+jkvhXCcjqunZuvaJFTwLaeL/nw80tFyqePa5jpCj28mfIUkAxuOlfC8aY8iLnz0H09jBF6goO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1g2Bv1/AXQOY2/5yrf04dn3sgdX6sje4ct/7qyLpZA=;
 b=FQUGPmlPcjol6rjzHQoMfd/4vjdsSFXLrU4vzEaBg9Lk/XZqEZHNjsQu5pRrWN2ez4r2R0klbXdDPr5c6imgfSkY2jFR4CwWxxyby4e4zPQnbktkrzryChAGOdCMuJKI8hupvyAI8LTx8q4WCJ0ZczH2UUyCTnd5dTb+1rgk4bCPNL77fMVLd61Gq9+W5XHAmKzMh08T+37NKpTbFMfD5sylE8Yu7Mi6/jVLAnguKy68vVDQUHbgTmRBsgk/xELHliEjP0vkbcFhBkSMqpwZnImbG8jhtkZZBJs1c+HTOSK9i2AbVG123V5CuXDnVXBEd/QEb92gy6l/RqVD4X5Tow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1g2Bv1/AXQOY2/5yrf04dn3sgdX6sje4ct/7qyLpZA=;
 b=thQzhnETLvvy6ezpwNETWF2N4fG6TKFWjjQAV1RIR+VTC48nPPrHJz2bUy9gAtnm3XaCOa1MI1Lg88VfabA09Wj/fEkx1Ua4V59ISNAf2Y6BSHi/cCrE84oqmUI0NV2fWETD1fK9Iv6Bz5kBZ6w00PRbOlrWnqK6UzU24DPfKGc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2449.eurprd08.prod.outlook.com (2603:10a6:203:9c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Wed, 5 May
 2021 13:27:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 13:27:13 +0000
Subject: Re: [PATCH v2 1/9] block/write-threshold: don't use write notifiers
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 kwolf@redhat.com, eesposit@redhat.com, pbonzini@redhat.com
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
 <20210504082553.20377-2-vsementsov@virtuozzo.com>
 <712e9661-e296-b960-d6ca-9173f9ecb2f3@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d43fc068-61a0-3b50-04d8-bc30d507254b@virtuozzo.com>
Date: Wed, 5 May 2021 16:27:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <712e9661-e296-b960-d6ca-9173f9ecb2f3@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.9 via Frontend Transport; Wed, 5 May 2021 13:27:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4d6475e-0fbd-44e8-71b6-08d90fc97e77
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2449:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2449BF402A961197D5B65E0CC1599@AM5PR0802MB2449.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qVcVfOlyLwKfKL/YHQu5WCEO5+IZxi0e6GdxOIPU/h24u5Mh1UBkdwdGV6TcbeHtuCFJ4sMrma2exMNbg/1oflNLpbrp2mgnize1d2fy6vP7wGQ28oKRyJfnCufuY4u2mlI47OgMED/Ayw87Fy19WRjxgsvE5Yaq+KpgMkDk3Emh5+7Ehm5BINS5k/YD6CWMG8yNjnoD6yvByo7vjNRDiLApgdN2seuhc7wiegckUV5Mb1Y7BehTwgcWx9v/E9lheU/qYaFX2+sVbMyuT8ILLN5Hcy2AqME2vgSGo6/GhpNxKR3HQCevBBVZRJI+WYxPocLs9/Q1pdbrJBSAf7aEHrWlYYwqmWw//t9npDUPO2d7jIX4/DV2dIj4wX8UqwZ1YUfWq91LfGEZmw26UJgCA2QZ6rjR2/FhE1GM9ULwb1jUttGJRLjPoDFk2R6MHVTF/BZa0nl3yiIZcQ90GgfdjEDZAufWAue2CS5udbcaQ066xp2TUt/hyVoguBUxl02ZNX7hFFP6MSPXQKWmnIiLvrbi7NA5BD5LgV20HsRnSfMQcY/XFP8rl/ZflN1GTo+GP/DfObJc7G2+c68jydNFXC2X74LxBVdPi1dVxSF9g49W1Y40r/h9KFNqcn/4NwOhBO2okW1ZPcUDjGyw3LWEryHYd7qMnQFdGx3kbrfl6K+mbPKTqHyh4s/tsxiW7P/Ao6Q2tK4GoiV/usMb/UVTm3oRGslxE53sW6EvdMt6Df8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(376002)(346002)(396003)(366004)(38100700002)(5660300002)(4326008)(316002)(31696002)(66556008)(86362001)(38350700002)(8676002)(26005)(2906002)(478600001)(83380400001)(6486002)(66946007)(8936002)(36756003)(186003)(52116002)(53546011)(16526019)(31686004)(2616005)(16576012)(956004)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Yi9OditzaVovWmdOQWhZYnpENUhDSEhOWGVRVU1hVEtMQ2J0VEQwU0MvUkNT?=
 =?utf-8?B?eDBQaG9VeVpZcURkN01BZHNsaU04aVY4dEtMeGQ1bVV5TUxzWkNpQmZPVTN2?=
 =?utf-8?B?NTNsS3g5eVJSUTVHVS83NHZDdjMrWGhKZml5b1FTYzd4VWJFY2FnUWtiWmFK?=
 =?utf-8?B?MkFMZENoMmZ6WVNNdjdkblJpMFBCMnRncTRZRENJMCtBYmRjcmdlV0ZMK3U5?=
 =?utf-8?B?SHpwb0dETk5CVENoUGRoazNGbmhYTFBWRURGNTlGZnErQ3ZmUXk2a3EvQTZa?=
 =?utf-8?B?eS96RmlPeGlCT3ZVRGJhQmR3WFdTYi9zTDh0RmNjTVAzOUxuUlZObGZOY2pW?=
 =?utf-8?B?dlhmMTR0TTUzTy8yNXQ5ay9EWCtZMjBUTXNIVDBQZ1ducVBRWjU0NCs2N1lz?=
 =?utf-8?B?MFVQYWxOYVdjTW1UZENidldBR3ZuMlNLOHJUcGg1UDNxazBWcHVJTjBQeVZz?=
 =?utf-8?B?RFZjdlRyMjd5VXpZdnJPdE5RODd4QUdiSlYvb2wwOXJ4Zkl1Y3FjRmNhRCs1?=
 =?utf-8?B?MGxTZjdFYUVJTmQzclZDTlpoOGRCejkvWXAwN2hWQzJjY2VWODRwL3A4bmVm?=
 =?utf-8?B?NTQ1WUFmazVUNm5qMldrVy9XUHVaeGt4Nm41VUZTUGQyaWNCUTVEdjZ5Nm04?=
 =?utf-8?B?TEhBaUJlUDJuZXZlRGRTRm9SUTBuc1BaeTdSU1dsWHFZSExlUmQxSGc5RS94?=
 =?utf-8?B?Z0JtVXZQVHNTMVhnUk80T1V2ODFtbWhtUW5ZQ1NrLzZHcWxXUVRkamJqM0Jk?=
 =?utf-8?B?Mk5veWRGcHlRK2Q3MU53ZXpEVVJZU1BDUm82Z3RiWk9GKy9TcXJ0T1BEaTdH?=
 =?utf-8?B?NFlmOWV5QUN4cHVWWUl4MjhBOVBUSVdNU1VUS21FRmhxd0pqSEJVRWZBSWFJ?=
 =?utf-8?B?RGc5Tlc0Zlg1WHZtaGJ1RG1WWW5JcE40bldPU29XMzg2dDZ0UmJtVUx0N3Zh?=
 =?utf-8?B?ajlqbWVNNTFIQldJT0xRdnVBRmszUWhUWUFzeWIwNHU4dGV4YTFNNFBXU1Bv?=
 =?utf-8?B?a1JMWkErVTlNbWJsOUh0WWJSQlVhQ1NMOHVCSFN1TDZGWWJUMTBxM3ZrRW5S?=
 =?utf-8?B?cGdDZksvN3VBVSsxamRSV0FhMFhhN1RtUzh0Y0JkQUN5ZncxNC9tMUpJUXdZ?=
 =?utf-8?B?UloxRlYxQ2t4RmpUZVY1cTBoT1NZUGxkWks1SDBGVFNnMjhmak8wbGx2Rjlu?=
 =?utf-8?B?a3hrVC9KUTdYM0UxZUJyUHN1TCtVcTZaMC95QmVRTXZJNUR2MmZiZ0E0QUsr?=
 =?utf-8?B?eEVLV2lyN29iY3pFMlFhcWJOTWFldHFCNHo3cVlRNFBMVHlHUHhMckNyNDZK?=
 =?utf-8?B?WE85U042S3M3cUpZU0FEMmhHOS9PMW1NQ1hxQXhMNzhPemlRem5LNjRVei9h?=
 =?utf-8?B?NVBHcnZxQWdkQXlieXJSNDJRbEl4L0NrVmc4UTRHSUM1SEFmbGVQTEJ6SUNZ?=
 =?utf-8?B?TzhpaTl4Ukp5MEdObUNvd0VkK01YbGcvbmlGRGthQjlQeWJqMVNrdzdyZkhZ?=
 =?utf-8?B?bmpnakl3WEd1WTloQnR5SFgyeVZHdVlnRnJoaVM2QU40a285QmV0NUZabUc5?=
 =?utf-8?B?dFgyekJIeFVZTlRPQ3I5ODZoN2JENDNFeEdQeWduL0lMZ3kyNC9FQ3htVDcr?=
 =?utf-8?B?QnFjeTJmNUZidFJmbHpCaTlDbUZIZTVFR0wxc01nRG5MQ0huU1FOS3F2OVRa?=
 =?utf-8?B?NEJ5ZzduWDVWZ05IUXFWWjBkWjUza2QwVmJDTW5MZUFVNFVDMWlPN091TFNq?=
 =?utf-8?Q?W85LcPdhAi5mzQV1AzgE7HVm8FAc6pPXK4MTtOM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d6475e-0fbd-44e8-71b6-08d90fc97e77
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 13:27:13.5520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkhbvQXiCxEq+z3z3QcuFC0WMmff0g6yPCObFaA/SiPGrWTTaHBeJwO1wTN4+9I4X+DKmuucTX37zIDB/bTNqhFNDW5bpSNDcyiNoqJOjkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2449
Received-SPF: pass client-ip=40.107.21.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

05.05.2021 15:37, Max Reitz wrote:
> On 04.05.21 10:25, Vladimir Sementsov-Ogievskiy wrote:
>> write-notifiers are used only for write-threshold. New code for such
>> purpose should create filters.
>>
>> Let's better special-case write-threshold and drop write notifiers at
>> all. (Actually, write-threshold is special-cased anyway, as the only
>> user of write-notifiers)
> 
> Not noted here: That write-threshold.c is also reorganized.  (Doesn’t seem entirely necessary to do right in this patch, but why not.)
> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/block_int.h       |  1 -
>>   include/block/write-threshold.h |  9 +++++
>>   block/io.c                      |  5 ++-
>>   block/write-threshold.c         | 68 +++++++--------------------------
>>   4 files changed, 25 insertions(+), 58 deletions(-)
> 
> [...]
> 
>> diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
>> index c646f267a4..7942dcc368 100644
>> --- a/include/block/write-threshold.h
>> +++ b/include/block/write-threshold.h
>> @@ -59,4 +59,13 @@ bool bdrv_write_threshold_is_set(const BlockDriverState *bs);
>>   uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
>>                                          const BdrvTrackedRequest *req);
>> +/*
>> + * bdrv_write_threshold_check_write
>> + *
>> + * Check, does specified request exceeds write threshold. If it is, send
> 
> I’d prefer either “Check: Does the specified request exceed the write threshold?” or “Check whether the specified request exceeds the write threshold.”
> 
>> + * corresponding event and unset write threshold.
> 
> I’d call it “disable write threshold checking” instead of “unset write threshold”, because I don’t it immediately clear what unsetting the threshold means.
> 
>> + */
>> +void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
>> +                                      int64_t bytes);
>> +
>>   #endif
> 
> [...]
> 
>> @@ -122,3 +68,15 @@ void qmp_block_set_write_threshold(const char *node_name,
>>       aio_context_release(aio_context);
>>   }
>> +
>> +void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
>> +                                      int64_t bytes)
>> +{
>> +    int64_t end = offset + bytes;
>> +    uint64_t wtr = bs->write_threshold_offset;
>> +
>> +    if (wtr > 0 && end > wtr) {
>> +        qapi_event_send_block_write_threshold(bs->node_name, end - wtr, wtr);
> 
> OK, don’t understand why bdrv_write_threshold_exceeded() had two cases (one for offset > wtr, one for end > wtr).  Perhaps overflow considerations?  Shouldn’t matter though.

I don't think it helps with overflow:) Still, offset + bytes should never overflow in block layer, requests are checked at the entrance.

> 
>> +        bdrv_write_threshold_set(bs, 0);
> 
> I’d keep the comment from before_write_notify() here (i.e. “autodisable to avoid flooding the monitor”).

I'm OK with it and both your rewording suggestions. Will apply if v3 needed.

> 
> But other than that, I have no complaints:
> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> 

Thanks for reviewing my patches!


-- 
Best regards,
Vladimir

