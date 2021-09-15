Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70A540C03B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 09:10:20 +0200 (CEST)
Received: from localhost ([::1]:49080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQP3j-0001Ht-KW
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 03:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQOyV-0005IY-Rz; Wed, 15 Sep 2021 03:04:55 -0400
Received: from mail-ve1eur01on0703.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::703]:50567
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQOyT-0004IT-2m; Wed, 15 Sep 2021 03:04:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWUHRFQxokWy2RpEo5dkDPKKpSIXEB7JSwCnopbKVpxVtrMiVABgL2FcINIQyEGj+3eyvDOcB/mBk9lGdMcg8gN1CfaIaF55MrG6r23qW4qCQO0GIgka2vlU5TuwrZebH7Hu6UvxlFjw+PHzhaZEarcatMlQcQSge60Aks308mjPAPiJOiiZAm41o43nMK4RlP5n1vY5irbhzrwryioDG2MRTzGhpyTf2hYlnmCBQYpfqEo5aMHb6556bW1jstU6xWevaWml0zP0JZ95+cJN10RmS2OFtfbsgMoH45fq5MCXsws0POGPmtxeRuzzWjkYdk5QhOnLVZUZSPkEEFFtWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=PBZhxyFj4fB5XiNcS+Ars75m70Y4GuumHrt8O1+QhCs=;
 b=my4zoCz2hs9/AP930G+RCoBHNPWt7WlTQuKbSSR0aKn4JtZQw6th3oOdj9zK949Cg2tFTDGvKjZngLUpHpR/g6j+mPMEDG6MIPiusxWSdM1ORZ8buGNRJkAZJTyzZHK0KNND8xHt3FMXVceQYsbjKQZXx1E6zuV8OKTlVglBC4hriIP2T7A/d2GDNloT54lmR7YoHL6INf7MdWTry/lOg0ADUZ40mhUVjNekVIi8DRDDhm97mu9CK2jwnvgYDRRmlCTkKZdEiuE3h+nTXiUUPq+D+he3kHn52yVrfNKu3Qidtk0LVTA/TxnN+qysxtl/yI1RJeoTIZFfMuvkeq+tVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBZhxyFj4fB5XiNcS+Ars75m70Y4GuumHrt8O1+QhCs=;
 b=hgG6TO7tuXFYbJw5Lpv+K9cyz6R4Tct+GirxEmNu+YaR11gq1Y4Djph4K/ST2jd7nX+bpDTR7FvjYyW2g/gLRKhGF59r/VskuL1XL9Tz7UNs941NLCQGXaLhUGohpI6fm23LWgJpwCNmAGVmMqyGa9Sk0r0xTZ5Q5qH/Fhr1zGA=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4952.eurprd08.prod.outlook.com (2603:10a6:20b:e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Wed, 15 Sep
 2021 06:59:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 06:59:47 +0000
Subject: Re: [PATCH v4 07/10] qcow2-refcount: check_refcounts_l2(): check
 reserved bits
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, den@openvz.org,
 ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com
References: <20210914122454.141075-1-vsementsov@virtuozzo.com>
 <20210914122454.141075-8-vsementsov@virtuozzo.com>
 <34618a0a-db34-9d84-a7fa-57f6ab6f88b5@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0ea5361f-4cc5-f976-0a2c-d32cbf891b53@virtuozzo.com>
Date: Wed, 15 Sep 2021 09:59:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <34618a0a-db34-9d84-a7fa-57f6ab6f88b5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.5 via Frontend Transport; Wed, 15 Sep 2021 06:59:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 850fee22-a9a5-419b-3bf8-08d978166782
X-MS-TrafficTypeDiagnostic: AM6PR08MB4952:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB49524E9AC00AC62D9D721390C1DB9@AM6PR08MB4952.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:366;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sAkv82zcOxE9epRPSpZWWMuGQ5mUNOwoEvjwj1h7s4Qlt83mB1E8K/zmg2aHsf1hQjukSTNlPRCi9b1XBsK6ylvUvDUhNzqvFlJ9t1b8/M0NEI/CHh13DloDOdAo9cYO7NJi/TOtO52l3Qu2/Z9iWAmKm2rRb6QUIiwJvo/yx0u6kwT0XAooPK7uHjyz5ALSc+Dhr+LiyI+YP/Y/aiieMtjx0NjkCpoGYeLKwFsYjeAse/c5xTv0C7n2evX33h3i6l3s1QSfTFYrixrZhlSnfi/07aVkDfSUPuR8Erf95S4JPW50nTWdarOfWBARJmDlouljnHcIV96xaQmmmeNgWLnnnDq8IuRhCdf6vS8kW/NaZCGxphhRAxn4IMuRQdoCi93PgQChBjIZ6LgNS1h14PjjlI58iTrPbG/x/6mwUN3RUA72ydw0YvX7LHG9I6rtZP46OCw6++Jeis/yglJkfxx+zA9S64uKdtuG+LdP0/k3tYDePuvSv3T3maowBx2YnEFjpqeGVZv8aupJCdwh62e64m4qfqUTPgeB6JLfqA7eKQbufGdE9H2EdjqyOmwjVo9mPr4YMq1cQxUbTrkiSQ8Mv3VASNGiBq9S5v2Zzk6wT/Ffmz2M1dwbZMrb5/OwjU7aEI+sEbfSvgYDr8Vf1cKVJDT+IplBZGb3YTBAnpb5xrZdHelpxKCMSIkbJVchEqf5TzPo1YKllPXVRHt6mMYcEb/WK3cVVdyBUgXJ3t85ATl+4dAe6/+GZYdzVosZSAGG6PmzUeW1BnjXEBgebg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(39840400004)(136003)(396003)(478600001)(186003)(19627235002)(52116002)(6486002)(83380400001)(86362001)(2906002)(26005)(66476007)(31696002)(36756003)(16576012)(956004)(316002)(8676002)(66556008)(31686004)(66946007)(5660300002)(38100700002)(2616005)(53546011)(8936002)(38350700002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUNuTzJGbHo2eWxyeTBic3htRWtETVZNMDJaaGVLeVB5SzhYdTFUei9CSjlr?=
 =?utf-8?B?RWwzSHB1UHRWMmF0SE5jcmFnRE5wVlJtV0g5T0l5YStCODBoZHdJZ3RLalVG?=
 =?utf-8?B?UnN3S1gzbU1nTzB2UG1YRm5ka1lCK2dFTE1nQUs3N3NHQnd2anVoVUo0Z0Q5?=
 =?utf-8?B?T0VCUlZrRFdaR2tMb01GTlJUUFpMN05td0tGSUhCbVBraGtUSmxJVmRSdTMy?=
 =?utf-8?B?QkRHM3NXeEh1UVQzNy9qYXQ4WEtRUFhWSXg0dStIc1BHemNEYVJTM2o3R3Rm?=
 =?utf-8?B?aThlbDZycnNHUFpyUGhRUzczL2hoQjVYYVFJL2UvYWVqVGlFK2Nkbk0rRm9t?=
 =?utf-8?B?WS93TGk2NWowNUxGZ0ZUUk9rWXNwNFF5UVNSS0N4UGtKbjYwN0tJR2tSSVVv?=
 =?utf-8?B?L0hjMWNudjBpazFxZGNmK0FsRDBDcTRCOWpYcHBJUTRvalREblM1RUtJLzNS?=
 =?utf-8?B?WDFGRDk4RVBra0pKYmhFZUcrcEdZT1NoZmNxNDVXcVdjY2V2bENMcmVhVjRq?=
 =?utf-8?B?bTFmMHc5b3MzaTZLTGdkdUxEblVjazN1RWRNZUxJL1J1dVBNRTNzano0UFkx?=
 =?utf-8?B?Q3BaYlVMbXRMSWsxMnlqV0lXNVRiclpKVkZoUHovRjNyLzlmbmhHWFdvZ1Yx?=
 =?utf-8?B?eVlzY2k2MUpDSkFpNjBVd1VFTFRRMXlZU3ZrcXNMRXhHZ0U2TmNWUXR6S0hQ?=
 =?utf-8?B?UXdvKzdGTlVkRk5BRGQ4aFhEbDM5REVTa0cxTWRydDhhcVpORWkvaVUvS0lP?=
 =?utf-8?B?NE40VE5KYVRGbEdsZTJxZ01WUXcrK00rNzZIM1crM3RpaXU3V1c2VXhKL3hE?=
 =?utf-8?B?YjFTWnZZYkRXTWF5bFl0Z2tjQkw2Zk9XSWlKMmhzdjBBR3NYL3hHTndYdjkx?=
 =?utf-8?B?RmhDa1B4MmYxVjhWU0o2V3NCL0hVbmdSNVJrRUNlUlAwNE1oWXNSTndkSUNU?=
 =?utf-8?B?M2Z5ODZuN0hVYWdhQWlzZDJ1THVPTjZCM1FQUnQrUDdGOHpDRkRYVFNYQUdK?=
 =?utf-8?B?cVpGYmt6bHRuemw3ODFVbVJQUng4bVpMWkwrdWZOSmtMdktlMWc4QWVQTUx6?=
 =?utf-8?B?cTBkSUxVbFVIQVJQalVwNHRaR2RvSXY3bFBQNUhndGIxYmlTaUFiOCtJcHg5?=
 =?utf-8?B?eDdiQ0VBbEtvVFk4azNsVmIwVWtzcm9mVS91RGZZY3N3T294dmpVWk91eFov?=
 =?utf-8?B?WWlNMWZuWWJ3MCthMU1Ld2NMREFnVkp1dU8xb1JwSllEbjZzUXphSFVVbzlP?=
 =?utf-8?B?UXlzSVgyaW5Na1NPcTU2T3lrb2h3WXN2MUQxdFlXNWdFZGY0dVJ4QW45UHlV?=
 =?utf-8?B?UDdkUjg5ZWFGMmNhazVrK3dEVlB4ZnIyaWNlYnNJS2ZCRGFvTlNIRVBXdHpP?=
 =?utf-8?B?T2xSa1RLZzJQZXRKL2NYa3NYTTV3TitpSHBaakMzbXVWZHk0Nk1PWGJyMEUv?=
 =?utf-8?B?VnYxS3ErcHNKemc1Rm5SZWJuNDNoWEovTWFJS0FMV3NCMUkweGRRY2dGNTV3?=
 =?utf-8?B?bGt1M3J6WjZPYlNBT3YxN283V1JTdW9STGRRWWMxbC9CYjJub0NFa2xUSWt2?=
 =?utf-8?B?Q3Ezc3BKam1qRXYvRWdlb1VQb1IwUVhHMmszSVFnc2dwcHZXVldaZFFUZlhp?=
 =?utf-8?B?Sm1KWGFJU0xvKzBPU3BpVjdFaisxNDQwazZYRHFHWTlCaDNtRTBYMGVaZjd6?=
 =?utf-8?B?MXdZYXBjNk10UEN1amZWQ3h5UDZnVEkrKzlnc2dEL3JHcVVCeW55YzNsUXRk?=
 =?utf-8?Q?O+PLledg79M+h0vwSSKJ0BJfSdQ8oCI9HXczElp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 850fee22-a9a5-419b-3bf8-08d978166782
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 06:59:47.5372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMIPfnuLV28DFOlnycBg+MOs9O6fPwz+Geqg4hsDI4waH0mnigU9wD/FWo35X6lJ+EchDoocMlN7SZsfFE669r/U+04HXPusYCQ/Wz7O3z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4952
Received-SPF: pass client-ip=2a01:111:f400:fe1f::703;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.969, SPF_HELO_PASS=-0.001,
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

14.09.2021 20:15, Hanna Reitz wrote:
> On 14.09.21 14:24, Vladimir Sementsov-Ogievskiy wrote:
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
>> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   block/qcow2.h          |  1 +
>>   block/qcow2-refcount.c | 12 +++++++++++-
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/qcow2.h b/block/qcow2.h
>> index c0e1e83796..b8b1093b61 100644
>> --- a/block/qcow2.h
>> +++ b/block/qcow2.h
>> @@ -587,6 +587,7 @@ typedef enum QCow2MetadataOverlap {
>>   #define L1E_OFFSET_MASK 0x00fffffffffffe00ULL
>>   #define L2E_OFFSET_MASK 0x00fffffffffffe00ULL
>> +#define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
>>   #define REFT_OFFSET_MASK 0xfffffffffffffe00ULL
>> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
>> index 9a5ae3cac4..5d57e677bc 100644
>> --- a/block/qcow2-refcount.c
>> +++ b/block/qcow2-refcount.c
>> @@ -1682,8 +1682,18 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>>           int csize;
>>           l2_entry = get_l2_entry(s, l2_table, i);
>>           l2_bitmap = get_l2_bitmap(s, l2_table, i);
>> +        QCow2ClusterType type = qcow2_get_cluster_type(bs, l2_entry);

Oh :(

> 
> Hm, with l2_bitmap being declared next to l2_entry, this is now the patch that adds a declaration after a statement here.
> 
> (The possible resolutions seem to be the same, either move the declaration up to the function’s root block, or move l2_entry and l2_bitmap’s declarations here...)
> 
> (I don’t think we need a v5 for this, it should be fine if you tell me which way you prefer.)
> 

I'd keep type here:

QCow2ClusterType type;

l2_entry = ...
l2_bitmap = ...
type = qcow2_get_cluster_type(bs, l2_entry);


-- 
Best regards,
Vladimir

