Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6BE5B3054
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 09:39:35 +0200 (CEST)
Received: from localhost ([::1]:34370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWYbt-0005ff-PN
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 03:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oWYZr-0003gP-6l; Fri, 09 Sep 2022 03:37:27 -0400
Received: from mail-am6eur05on2104.outbound.protection.outlook.com
 ([40.107.22.104]:24801 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oWYZn-0006de-AJ; Fri, 09 Sep 2022 03:37:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGtYbSfRszUT8eTB9sY2aggMfv4OKcU/PQTXdlbNcuooi+XjaAa9NiyB0zVhSnG9cxrzcq+Adhkj17pTyr7e4EbUBepy+glb7Uhg4UeICiHPJml2Af5Q+AM4q3wNIjIBbSuEG6igvN4Em2pvxsXK0+PRahidc2gI+G6vzi2w0l7Ha7W/kugmEpllZfRq4vAXiaprDrxdMnLRMmqMv8dzdNRGWduXiLwgSU30sAeI/woDgRNkomC/qCFq30J7hIDjia2Kv+wXp/xYOD65bgqoEBASr9pEj16iagVyZRrkvXbXR+cLU+KIWyXGYmi5wTVJEQrzPbxVT56zXtGKHXCCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iyR05muUc0+OMftTTgrY+iVXLxY8S3CTM7EQd1wGA4=;
 b=VdW9nHnRJYHhaNUmpB8GSZ0UwSg+7f9J36ZHGbveJle0kBrGB/kLEW2d654L0cdd3HJgFkhIVIgtxP23MbVvlJ295uOXBSaA2AGKtsqENBH0gj0M3X3H2JamNjQ0zvL2DrTC1qXUgg57lMoXHJzdiFJB6UTRDiVrYtkzOavjtu5Q1o4zSSLcumGIU9+QvcCfL4CvbFINfqo4OxfFh5xqER06As0ZPLJSsV0/Mecwp14+dAbpdEuewoFvaC+6b0pFngYHSuJFXq8q2dz6zC3EavhIDu4HsDuX1m+EsRWMfEDjBNVbPn36UU17bv0JUyiWC+NtTe/QlI0eEvPppd8lNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iyR05muUc0+OMftTTgrY+iVXLxY8S3CTM7EQd1wGA4=;
 b=uEHks+Ytwie71M5ox4soFnxmqwdUsoL4mGxxwdXNoFMZ1pcNerz+g3vorbejtNUQUtNJ4qHO7lDa1pI6b4K61RGrg4dSNWPK0jSGJC8FEvgm+8qARSaraZc7kLZFtmGzyLdzbimSzTOX3Q6mG8kpmFuV3YnAKpVszb22Xi1QvR+iNqttpzYc8uivRR1UdfUv3u1lX+wWyB78u/Hl4Z/H6vVD6bkSPMxmu72Ql1oH9ozA6dZolytp1XUfgZGxEK3FY7krAPwy4YgO+GJqrAMMZGAYQ43COQWCvKPyXEAurbjntHInLNp4cVWXuY2uF3QGuwCLMGEqOrt7C3VkKqW8Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS2PR08MB8747.eurprd08.prod.outlook.com (2603:10a6:20b:55f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.13; Fri, 9 Sep
 2022 07:37:16 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%7]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 07:37:16 +0000
Message-ID: <b908ea26-b3a2-4532-f738-5dacb95a3a54@virtuozzo.com>
Date: Fri, 9 Sep 2022 09:37:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] parallels: Add checking and repairing duplicate
 offsets in BAT
Content-Language: en-US
To: "Denis V. Lunev" <den@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
 <20220902085300.508078-4-alexander.ivanov@virtuozzo.com>
 <5d046d0c-a618-a7ad-3657-ba46fcee50aa@virtuozzo.com>
 <0f882207-89ae-559a-e8f0-a57ab0276c9b@virtuozzo.com>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <0f882207-89ae-559a-e8f0-a57ab0276c9b@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS2PR08MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: e7b3a292-b011-4f6d-40a8-08da92361eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: weVcmb82/FVV3B9X+Tg2yN5zEQDKoxpDyKHFvtQPP2Jz3GQTPr/P77OavXu2ZLeJs1ccnsAF/XwTJ/1rjteGqQMvMqLv6AUWwxPkV13lqqdT7kRhi3Aot/es4cBExQYP18HEh5a5JAR30spuJS9tbnkMoHIIKIHoqH1P3Y6vFeeZWF9tRinJwXDdYcNhWQPKPOWeaSoCm5DQapq8MrhzB4cfn41iT9rOYPMOG90HANCZ7n3EYyFzJr0WG2+ydPL4b8mJyFoMKuYDhtsFfuC62trGgyJeQpfYIfUZ9apaF/rdZguhpvlj+/yB6vdiKBi+Frv081vWqVlSD+XSzoAHpsKqZapzoRIGIIyqwqBYIG9vsKRMmySLGhmoDHbtwVgXrwjqp+c9UYgC/Ofz1WYZHA+AmC7gQByNGXLKKtqx9aZRdl0zRn12E3ZNS9FGMMpjDWuOV52A1BlWN6Fo/8CeYrpxdc0/F1Yo+gov+At08SUcj0gOpzkSQbMfOpJVNFy2/MrHzKAP04ZUy3waMAaQDWgQpvjnbfwTzGpE1doEeWo3nQsI3ui96RO2rnT++vuC4Ikpif88hR4wGNfFHr4EUSnoZDLiACLKTaTNwAYA4zP5nc0KYHVDwWR9+8nag91nE8aHxz5OeQ98UEx9W040lcgE/h8TPzrASeZ1TE6r1O8KhkTaPv7/9Geq3ozgS8v4pUrCtFaSqpwVO1ONlfzMPwR5im4rcOBAhGBHmuqEOs/TIHOGan8ewRI7Ij21jIvSEKR2oPezRU6ODLYxxWuAu3WBdntLEZs9LCBN8RolvBjxzfYy4NvKT4cG3yGE47eL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39850400004)(376002)(366004)(396003)(316002)(38350700002)(38100700002)(8676002)(66946007)(66476007)(4326008)(66556008)(2616005)(2906002)(53546011)(6512007)(44832011)(41300700001)(186003)(31686004)(5660300002)(8936002)(478600001)(83380400001)(6486002)(52116002)(26005)(31696002)(6666004)(6506007)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzNQSTVaYTdHZm9xekpJV0FHRUhPRWpZbjhDSHdXNjJTbHdqVVdjQkpKQnE2?=
 =?utf-8?B?N2pnQUF6dnNxaGtoQ0VvZ2dDQnd4T05OdXZEYndLT25RYUhINXB6Zkw4c3c2?=
 =?utf-8?B?R3kvM1JpOUlDS0IxSVdQcmhHSm8wS1krK2lDME9oMENVbDlucHYxZE1LaTBr?=
 =?utf-8?B?R3RlTVhPOUgxYUpSK1pjTnJQV2hLU3I5Z1BCaHk2YUc1Z0lGVHc1YU11cnJk?=
 =?utf-8?B?aTBsOTJKRW1kcEJWTG9vMktGcnhUVWNQUEF5QkdzL2M4NWx3N0MvRjlyK3Zx?=
 =?utf-8?B?L1ArUjg4WTlZRVFzb0w4L2MzckdBU1gxcTZwM1RUTGVsN3ZKV0V1RElOWEtx?=
 =?utf-8?B?QTg4Ly8xdTdBWllacnNWVW9kMFVqL0FVWUpkUHpEWktidURuUmFpV3dzR2dZ?=
 =?utf-8?B?UXltcDAzbTMxMmVXM05iZWFEUHN4L0UvaG9XNTZza1g5UjFwKzNaUVZzK1Nx?=
 =?utf-8?B?N2xObkN2MVJxNVNseFBWeXV4Vjhodzcvd1IyZDlIMzRJN3JWNlNxNHp1dFRE?=
 =?utf-8?B?Sk9HdWZyUmlJZlJmZEYvU2VqcklUOWR2QUt6Y1pLVkdsUG03NFg5MW52NHh6?=
 =?utf-8?B?aHg0d051MUFtM04wM0J5RE5xTHd4MzNBS1RoSys0R3I0eE10S20vaVJXOE1m?=
 =?utf-8?B?VVlyeDk3dmV2T3hqVnJDbEF6ZjhKMzl2djg0dGE1T3k2NlY1V01ENDJmZC96?=
 =?utf-8?B?ckxJY3lPV1FYK1pPNHJkN3pOVnlxTFZuRm5kTUFWS0gxcFNYM0hXczRLcHo0?=
 =?utf-8?B?dHVSbE9XOCtNVHl3QzJFbi9nR3FleVFYalJ1Q0NnR3ZIS253NFI3ZnF2em9L?=
 =?utf-8?B?aEtlRDlja3RSQlpqNDBPaXFzZDQ1eVpzZEk1cHRtQlhGaHlvaGZDZEdUOE0x?=
 =?utf-8?B?c0J0NUFCMDgycmtJd0ZYMEx2VENqVHVwdVk4ZUw3SXdXYVpDbnoxWjRVOStX?=
 =?utf-8?B?SDd2V0xjUWF0T2lwSzNraWhrbnFUYlJCV2NvY0J5aThRQ1ppMENpajJVMnhi?=
 =?utf-8?B?c3ZKQXUyTDF6TC9hblNOdm03UkdUN01YWloxVWM5eXEvdFhobUdWeWZVT09D?=
 =?utf-8?B?QjVxNTJRODhkY0QwaTcrbU1wY0xiUzI5dHMrcEh3dVZVdDdveXVSRGxYUzVI?=
 =?utf-8?B?ZmFuNmpoMEFxZFVoeUtlK0IySFM0QW43ZkJUdlQvNzNHUTZVU2t1VmpZL3Fy?=
 =?utf-8?B?bWNGaFgyNHJZOXM1S05vTDkxd0tEaVFZVnVjZEZKWE9sZHptT0p6V3IzdndS?=
 =?utf-8?B?ZXRvSjJtdnppVVNob2J1d2ZOUVY0WDRzMHVsWkF2SjRpUGpRalNlL3hzeDM2?=
 =?utf-8?B?M2tEdWtGZHpBanE3aHRhUzZMcDA4Z0dreTR1Qm9wSlNBblRPZWRPK0s3ZzVD?=
 =?utf-8?B?QUVvWnpOWjdnSDZockRZcEVlN3h0cHJMWDd5dkVJYUJ0K2UyZE1PUTJxWEZC?=
 =?utf-8?B?eEZiY3pRQitOYklaMXpiUTBzK1ZraHdVNUVDcWY0eEptUG4zTGhHQ0QyYTBl?=
 =?utf-8?B?dmE2ZURVZXRXbm9QdjlPTVdHMEVncU5qQzYreVhLL3hITEE5Z1A2ZkV2Titr?=
 =?utf-8?B?MGhoTUJLd25ONlljL0Vnck05WU5nMlZQZVU0MEN3N200S3JRUkJMbkRMZWF2?=
 =?utf-8?B?OUFHQWxSU2x2MkFmamhuWXJBMVE2dGYvV0crQk9rTzhuSDhUV296N0Q0djZl?=
 =?utf-8?B?VmJIODRBdEJpMTdYSkNaVStsdTVzbE50N2s5eEpUcjg2aW9mVG5mRDI1bTJV?=
 =?utf-8?B?RUc5ZUF5MkNmZi9GbWhaWno4Um9CVHdMVytvRWlIZTk3c0hNbmNhRE5YM21r?=
 =?utf-8?B?SElqQVFRQUxsNmlQMXpEaXEvSkVhaGwrK01ub3dORTVia0RzRWJGZUNTNFd4?=
 =?utf-8?B?QVBERmo1L0JlZy9mVkNKWC9ocEtVY2JwK3I2dmpKYm5Sb1NpSGRMaXhiMVRS?=
 =?utf-8?B?TWRjM3VMdmw1SU43K2hxMUt2OGpNWjVlMGZha2xYMHc0ZVdsOGJpOGhmMkhQ?=
 =?utf-8?B?bDZhMEFNS29TS2Z2RWNTcm9iR3ExWDA5UkxkdjZvZ3B0cFMyUlVUakZic25U?=
 =?utf-8?B?bW5LMzJRbVRmN3JIUkFJSTFWdnJlQnB0MkV1dDJuVW1JOEFkeXpLeURPK21m?=
 =?utf-8?B?ZkJmRkJKSmYzb2k4eXJ6dVpGYzBRdGdKNVVSb05zTlBUcUNYd0pKbk9HWENx?=
 =?utf-8?Q?hbOkzfBluygVC6CQt13/l0k=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b3a292-b011-4f6d-40a8-08da92361eb0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 07:37:16.8352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TstdA9VUih6gGyMjk+wjeOu+tmnUc9Gn+v0wI589OHI/aNmBGYEYGYXsbLytTu16OXohDLWXaI88dF9RHbpapb7LX+GBIB8wJsxrdN578Gg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8747
Received-SPF: pass client-ip=40.107.22.104;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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


On 08.09.2022 19:45, Denis V. Lunev wrote:
> On 9/8/22 19:15, Denis V. Lunev wrote:
>> On 9/2/22 10:52, Alexander Ivanov wrote:
>>> Cluster offsets must be unique among all BAT entries.
>>> Find duplicate offsets in the BAT.
>>>
>>> If a duplicated offset is found fix it by copying the content
>>> of the relevant cluster to a new allocated cluster and
>>> set the new cluster offset to the duplicated entry.
>>>
>>> Add host_cluster_index() helper to deduplicate the code.
>>> Add highest_offset() helper. It will be used for code deduplication
>>> in the next patch.
>>>
>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>> ---
>>>   block/parallels.c | 136 
>>> ++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 136 insertions(+)
>>>
>>> diff --git a/block/parallels.c b/block/parallels.c
>>> index dbcaf5d310..339ce45634 100644
>>> --- a/block/parallels.c
>>> +++ b/block/parallels.c
>>> @@ -136,6 +136,26 @@ static int cluster_remainder(BDRVParallelsState 
>>> *s, int64_t sector_num,
>>>       return MIN(nb_sectors, ret);
>>>   }
>>>   +static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t 
>>> off)
>>> +{
>>> +    off -= s->header->data_off << BDRV_SECTOR_BITS;
>>> +    return off / s->cluster_size;
>>> +}
>>> +
>>> +static int64_t highest_offset(BDRVParallelsState *s)
>>> +{
>>> +    int64_t off, high_off = 0;
>>> +    int i;
>>> +
>>> +    for (i = 0; i < s->bat_size; i++) {
>>> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>>> +        if (off > high_off) {
>>> +            high_off = off;
>>> +        }
>>> +    }
>>> +    return high_off;
>>> +}
>>> +
>>>   static int64_t block_status(BDRVParallelsState *s, int64_t 
>>> sector_num,
>>>                               int nb_sectors, int *pnum)
>>>   {
>>> @@ -547,6 +567,114 @@ static int 
>>> parallels_check_leak(BlockDriverState *bs,
>>>       return 0;
>>>   }
>>>   +static int parallels_check_duplicate(BlockDriverState *bs,
>>> +                                     BdrvCheckResult *res,
>>> +                                     BdrvCheckMode fix)
>>> +{
>>> +    BDRVParallelsState *s = bs->opaque;
>>> +    QEMUIOVector qiov;
>>> +    int64_t off, high_off, sector;
>>> +    unsigned long *bitmap;
>>> +    uint32_t i, bitmap_size, cluster_index;
>>> +    int n, ret = 0;
>>> +    uint64_t *buf = NULL;
>>> +    bool new_allocations = false;
>>> +
>>> +    high_off = highest_offset(s);
>>> +    if (high_off == 0) {
>>> +        return 0;
>>> +    }
>>> +
>>> +    /*
>>> +     * Create a bitmap of used clusters.
>>> +     * If a bit is set, there is a BAT entry pointing to this cluster.
>>> +     * Loop through the BAT entrues, check bits relevant to an 
>>> entry offset.
>>> +     * If bit is set, this entry is duplicated. Otherwise set the bit.
>>> +     */
>>> +    bitmap_size = host_cluster_index(s, high_off) + 1;
>>> +    bitmap = bitmap_new(bitmap_size);
>>> +
>>> +    buf = g_malloc(s->cluster_size);
>>> +    qemu_iovec_init(&qiov, 0);
>>> +    qemu_iovec_add(&qiov, buf, s->cluster_size);
>>> +
>>> +    for (i = 0; i < s->bat_size; i++) {
>>> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>>> +        if (off == 0) {
>>> +            continue;
>>> +        }
>>> +
>>> +        cluster_index = host_cluster_index(s, off);
>>> +        if (test_bit(cluster_index, bitmap)) {
>>> +            /* this cluster duplicates another one */
>>> +            fprintf(stderr,
>>> +                    "%s duplicate offset in BAT entry %u\n",
>>> +                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
>>> +
>>> +            res->corruptions++;
>>> +
>>> +            if (fix & BDRV_FIX_ERRORS) {
>>> +                /*
>>> +                 * Reset the entry and allocate a new cluster
>>> +                 * for the relevant guest offset. In this way we let
>>> +                 * the lower layer to place the new cluster properly.
>>> +                 * Copy the original cluster to the allocated one.
>>> +                 */
>>> +                parallels_set_bat_entry(s, i, 0);
>>> +
>>> +                ret = bdrv_pread(bs->file, off, s->cluster_size, 
>>> buf, 0);
>>> +                if (ret < 0) {
>>> +                    res->check_errors++;
>>> +                    goto out;
>>> +                }
>>> +
>>> +                sector = (i * s->cluster_size) >> BDRV_SECTOR_BITS;
>>> +                off = allocate_clusters(bs, sector, s->tracks, &n);
>>> +                if (off < 0) {
>>> +                    res->check_errors++;
>>> +                    ret = off;
>>> +                    goto out;
>>> +                }
>>> +                off <<= BDRV_SECTOR_BITS;
>>> +                if (off > high_off) {
>>> +                    high_off = off;
>>> +                }
>>> +
>>> +                ret = bdrv_co_pwritev(bs->file, off, 
>>> s->cluster_size, &qiov, 0);
>>> +                if (ret < 0) {
>>> +                    res->check_errors++;
>>> +                    goto out;
>>> +                }
>>> +
>>> +                new_allocations = true;
>>> +                res->corruptions_fixed++;
>>> +            }
>>> +
>>> +        } else {
>>> +            bitmap_set(bitmap, cluster_index, 1);
>>> +        }
>>> +    }
>>> +
>>> +    if (new_allocations) {
>>> +        /*
>>> +         * When new clusters are allocated, file size increases
>>> +         * by 128 Mb blocks. We need to truncate the file to the
>>> +         * right size.
>>> +         */
>>> +        ret = parallels_handle_leak(bs, res, high_off, true);
>>> +        if (ret < 0) {
>>> +            res->check_errors++;
>>> +            goto out;
>>> +        }
>>> +    }
>> OK. I have re-read the code with test case handy and now
>> understand the situation completely.
>>
>> The problem is that img_check() routine calls bdrv_check()
>> actually TWICE without image reopening and thus we
>> comes to some trouble on the second check as we have
>> had preallocated some space inside the image. This
>> is root of the problem.
>>
>> Though this kind of the fix seems like overkill, I still do not
>> like the resulted code. It at least do not scale with the checks
>> which we will add further.
>>
>> I think that we could do that in two ways:
>> * temporary set prealloc_mode to none at start of parallels_co_check
>>   and return it back at the end
>> * parallels_leak_check should just set data_end and do nothing
>>    more + we should have truncate at the end of the
>>    parallels_co_check() if we have had performed ANY fix
>
> better way found. We should check not file length in handle_leak!
> We should compare highest_off with the data_end and that is
> 146% correct.
>
> File length COULD be more than highest possible data cluster
> offset, but data_end should point to the correct location.
> That is it!
>
> Den

Initially data_end points to the end of the cluster with the highest

offset in the BAT, not to the file end. So we can't detect leaks in

such a way.


