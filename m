Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0FE6EFB0A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 21:24:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prkjM-0008R9-1u; Wed, 26 Apr 2023 15:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prkjE-0008Qt-7R; Wed, 26 Apr 2023 15:23:00 -0400
Received: from mail-db5eur01on0725.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::725]
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prkjB-00051A-Oq; Wed, 26 Apr 2023 15:22:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDIDMR9DMAPAmg0Jm8dwnJ8OB8OKVkLgplmigqhws03NdG0FBjNxavGP8Pc9klh4pA2RRbQT1yYgN5bDCjjduwYNaiIOvBMW0br+ruNauOZvEaitlxSgoMfUaOcBPM+sFjw8dIxqiowNQYMdnPFH8Y6W+eeruCIknYUUrO1GsYlhryPG+K9qzskIZqOclUiH8abv8cfYZcUb7cYq9IdZ9hIbfgVHzxKQ4M2MaXUUo2dHXoI4cyR3fV0fnfeILAKgPra1AYNZk/WBwXrYFeefDBX6GOETnTJcd9FBDh/GKu6VbY9evIL/bOP+GjdppBFafyVf3wyvMouTm6H8i1d4nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzUniS4+eJmZ1Y8H7yHKanPwrT68dCCndpBd1/nV8Pc=;
 b=mvqpdbtAz3BMQbAbjR7H4jUMlSIulK/IoHt/RZRClNiQNZxRnx538v2eVRBwHpZEcG8VEd1B1wTdkEwyGGN6u7cF5coN9ULOetsTJTyekvkBWyT+nrVRr7QZlN9XJpdGHVaRCNFNiaTxPt2Xem0U/fPJwlihbjWNC7yqxgyv1rt/iQi2bHYFaJWn4AS98Hoa3hIUyVAKbSWdfXA7T1bT2z8/Z5lAiBEUvdZpJzf443apX+AmJ2HfDXTC3a/U+CI1fp55z0TEFo13cyb2Z2Pl8u6RpT/IiQgRCPAC42H3wDR/mVZUvTVSiipuI9u2TlD+FdlHRiD5w/x1poXfkjd+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzUniS4+eJmZ1Y8H7yHKanPwrT68dCCndpBd1/nV8Pc=;
 b=zTSewlDnBpV9Qj0zt5WNKyyQu6i7ndVTK8ik9l+whnpGU83fAQay6HmemIXAhoYW0VNdGv6WJ+EpWz9KdSDyzLcYToBOAcWnxvTpl8anE0Ly5yd48XhAqNi0aqn6e6JnX9vKUy5ITPZHQ5dN6KKiT+HtkA0zx95xqjyeW0Jpkay4sE008niX03dngbEJi7KEF4Zg3kYbdXOHiJPxuuyzA46+vfjMTI+EaIpwx312OsNKmPyxyJxH2GRQ+QlOaaHz+MFtySVunb0M1uAEj5644vXZmtZ3SZa4UPOECOOWRm/HNSV3z0NKCF2BFJ7IW/DPl0waKu81JPlDpToGEK/Pig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB5715.eurprd08.prod.outlook.com (2603:10a6:20b:1d7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 19:22:51 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%7]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 19:22:51 +0000
Message-ID: <cac83a52-e220-c937-d7da-c0e5bbc04504@virtuozzo.com>
Date: Wed, 26 Apr 2023 21:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 00/12] parallels: Refactor the code of images checks
 and fix a bug
Content-Language: en-US
To: "Denis V. Lunev" <den@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
 <e865f9cc-82b1-cf51-5673-179e4b91fa64@virtuozzo.com>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <e865f9cc-82b1-cf51-5673-179e4b91fa64@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0602CA0012.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::22) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AM8PR08MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: a511d751-c79d-49c7-a98f-08db468ba0d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cyo1jCJUENT6Jqg5bTpUlAjIlGZZ89Be89gR0ME1YJ4oGHren20NlxXtT426cziLCeq50OZqtg1cPVOSIex3N4w8ceGZ1aT6y/YXIdPpLQPbp+jcTKojEKzGgsG1+zFGQXJoQxfjgdVAUyiXC0K0h647f2VvyBSORdPHxpumKdaHWMWFIcx3EtiBxd8J0gbgKnEUauXF6j0ZMrCAz5oKMm3M6TYMsHTeaj2HAV//ycfPsqaNJNP93qw3uu7A+zxoct4URaW+Al46RAUaXVUW2c/FqNCh9s2yv6JrMjnvLUzehVIT462r6tE5VFtE+c3BmfLTAIg8VWEZmNp6Sr1aHaXpleBeBuFhtqOgANJiYFRFJdw+RDipItH0pmV/T8L4MSYjVB2sg/hj/TJMgJSlpixU/YZ+H6Dzvn5AhbVzPglZnJa3QprdjMEle7MMnvGcHpKHoLQ2h4Ha5oz3jgad7J4B+QpRWr+oAZeom5BkpA/A8c8TqBxDUwR7qKAcqbYcxdca0fakyvf9Wr1GZwPP+AWx1jiSBnhfxE9szKCMnhpnbWpcV7xdEuoZQLEmM5pBY3VmEpbtJF/AzkaXRxYWZxt7/y+wbuRhuNwSO9O83ZYxN40a/VmXKu4alCfHWNEEYn7ASc5pNrt9EAEyt3yjVe7EJ/OEWe7St22MlB5+Mdx2Qna/dEpWdR4PKg12vij/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(136003)(376002)(396003)(366004)(346002)(451199021)(36756003)(86362001)(31696002)(478600001)(6486002)(52116002)(38100700002)(8936002)(38350700002)(8676002)(41300700001)(66946007)(66556008)(316002)(2616005)(4326008)(83380400001)(186003)(66476007)(6512007)(26005)(6506007)(31686004)(53546011)(2906002)(44832011)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm9oMFpNSWppcFptWGJxT2JPZTdiQkErVkR4YThvTm40cExQNW1rbmExU0lZ?=
 =?utf-8?B?UnZIVkljcHdKbjhFUnB1WDF3Y0JjYTZzTjVnUUsxbTFtWk55aGYxOEd0aUxi?=
 =?utf-8?B?WGRqK2YyOVowOUlycXRnb0FIV2FtOVM2dGxUTmhkbkxXSmJiV04xSmpDRU5I?=
 =?utf-8?B?d0tYYTd5eFIwdW9JVEZqU1RzelN2STZvWHN3am4xclZKRW5telNNZGIxeisv?=
 =?utf-8?B?WHFmcS81Y1JGMU8rVWRSZ25mdVp4Z0YvVExLQS8wWUl6bHlZcUNUVGJuYUZv?=
 =?utf-8?B?YzBjK1orRFlJMG41ZXlDaVpoYW9BYWhiK1Zsck13cnYvTzk3dG10R0NtSnc2?=
 =?utf-8?B?M2pqdlVIUUdWTHlMMndpTVQwd1NzSWFmeHNINUpEbDJnczNUWDZ2akJxUUZH?=
 =?utf-8?B?SitvZW41N29OLzVpL0k3Y20vbU15a3RUcEJpMHVockUwNlRmRWZVbnZuWjRM?=
 =?utf-8?B?WUJHaFRBMEJJMUZ2WlR0WXpvVEViRW9FQUhSamdiczRVNDhKTmFEN0s5b0Nw?=
 =?utf-8?B?eUZsTGViWHBWWUx2STZBZmpPdmVZc0NxNE43UTNjb0IwWnhYNlpod0gzdDFm?=
 =?utf-8?B?R01HckZ0SFdnQittWmVueGcwZm10N0Jua0liZ1FNeVkxaE5hWjJ3Y2YxNWNX?=
 =?utf-8?B?NURlNHlyZDhWLzVOc2xhVjgyblc1VUhoT3AzQ3UrNWRMT2tCYlFZMWlrR0kx?=
 =?utf-8?B?MnlnRmlxMnl4eVNralBiNzA5eGJObFYvUFVtMmJZMVNxUGhwb284N1UzcnFj?=
 =?utf-8?B?bHYyVEtUT1ZuLzVGWkpqdTh5K0hBdzl3cUs0clJxckF1eW13M2IvQTlLQVNz?=
 =?utf-8?B?NDNzL095SUlaaHdHUndGcjhZRjY5L2habVpmaG4wejN5NmdPYmQ4QldXRFYv?=
 =?utf-8?B?clFlYytPQlhWOFFUWUVHaFJ6anpobXk5UU5tK0RNZ240ZjFyNUx0OGRMSUdk?=
 =?utf-8?B?NmFjYzM1Ti9KZEVGV0hLTngyVldXT2kxL054YXNIYVhva1hhQk40azNwdVlJ?=
 =?utf-8?B?MzExQmFpeWhLNjlabjVOSG5sR3crMms5enFEMXpvZk03QkdrNWpPekpSUUwy?=
 =?utf-8?B?YVgrOTVFRStCU2oxQUZnZmJhYjZLODZBMk5CdjA1YmhIM1hwVEJLUmZYWW1P?=
 =?utf-8?B?NU04SFZ3UXR4enRuRUc2MGF2YjJ6WVZ1OHcyUlVQY0gvcmRoU3dyN3VpM1pB?=
 =?utf-8?B?bnJGaUR5RHFsdW1aM0ErZzNHWDF5NUNJbFVhdWIyMHBmRkg1WHFObm9ucEpO?=
 =?utf-8?B?a2w5REVXSnkyTDFxNVpoRCtSWjlpWEhIbXdBVGRGY1Fqbk9jdWdYQ0I0SFJE?=
 =?utf-8?B?SHFkM3JuTmdhL3R5S0w0UU8rQ3JTRUFYckx1OGFXSTJqQ3Zpc3NibVhhM25R?=
 =?utf-8?B?MkdkbGEzV0NRMHdOa051Z0lHMXp6YnpaYVdCNTV2UXVWWC8xOXRoczVLYktw?=
 =?utf-8?B?K0NmRURGQzF5UU80bVlqdWlWU1VNd1pZUDcvUW1OR2EzN1htRld4ejFhTnZv?=
 =?utf-8?B?M0dZb0ZjVUQyVnNWRDYxdDR3d2JQQXJWdUlScDRZVUh3U1BrM0dWcHQ1WWsy?=
 =?utf-8?B?WXJuRkVWR3gxdzR4aEJoWjN3TEZLRy9YZGVkNzgwWnpSMnVIT2xSeXl1VE9G?=
 =?utf-8?B?UTd3cjUzeGpnTlFGZE8rNUpRd011M3dHcUxDQ3VNSVBqQlJwcEJEekR1bkln?=
 =?utf-8?B?Z3JYT1ZJd2hZSFdReWdidXh4bEJubmZkZUVVS2tjSjZNbk5tbnl6MWtiL1pU?=
 =?utf-8?B?eGZndGlSZzM0Wmw1ektwUUlEb1dBQWh4aTI1RzY2MmlEdjhjZEdrZ29YK2Vo?=
 =?utf-8?B?aUlrWnNLZW9zQzZjWEF3T2Vhb0c5UTBrNTJuZ0lKT0lJTWNEaGJlTlVxR3ZB?=
 =?utf-8?B?a2s1K0FieGQ1US9XRjdGSmVEV2NxMDZqUGpRYXVVNm1XYWJMWTljNDhtRUF4?=
 =?utf-8?B?eXY0RGE1ckViSkt2RGp0RVlHcm1BQ0ZMdi8wV3RjV1lYL2RITUJzOHpCa3Av?=
 =?utf-8?B?UGNWcDVnblVLeGQyaUJwNGV2T3g5V1lqVkFhLzlrenVoNk83SlRhL3UyTGZr?=
 =?utf-8?B?NHYvWkFYU3BMeDA3WVdqb1B1M3p2Z0x4SHV0b0ZnTHdZd29TNjVvcTJrek5q?=
 =?utf-8?B?Yk9UcHVaSVZTR1QxR2pIR29MT3RSalJGVW9jcGFlWTBJaExQOXdQQ0paaUFo?=
 =?utf-8?Q?qAeP/CNcADYjTsdHyF6ezD8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a511d751-c79d-49c7-a98f-08db468ba0d8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 19:22:51.7517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuCV4MPtbp1+hVOH494Va+Un83m2hkxRcTtSRmNcZjmLm1x9EhqIX3OS9SUXVNWf705ukFR1wkIXB7aWYXRWY78Fk8zPQOqF5ZqQ35nie3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5715
Received-SPF: pass client-ip=2a01:111:f400:fe02::725;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The patchests are the same, but the first one has incorrect receivers. 
Please just ignore it.
I've sent a email about it, but i mistook twice and sent it to 
qemu-devel@nongnu.org only.


On 4/26/23 17:07, Denis V. Lunev wrote:
> On 4/24/23 11:31, Alexander Ivanov wrote:
>> Fix image inflation when offset in BAT is out of image.
>>
>> Replace whole BAT syncing by flushing only dirty blocks.
>>
>> Move all the checks outside the main check function in
>> separate functions
>>
>> Use WITH_QEMU_LOCK_GUARD for simplier code.
>>
>> Fix incorrect condition in out-of-image check.
>>
>> v11:
>> 1: Use bdrv_nb_sectors() instead of bdrv_getlength() to get image 
>> size in sectors.
>> 7,9: Add coroutine_fn and GRAPH_RDLOCK annotations.
>>
>> v10:
>> 8: Add a comment.
>> 9: Exclude unrelated changes.
>>
>> v9:
>> 3: Add (high_off == 0) case handling.
>> 7: Move res->image_end_offset setting to 
>> parallels_check_outside_image().
>> 8: Add a patch with a statistics calculation fix.
>> 9: Remove redundant high_off calculation.
>> 12: Change the condition to (off + s->cluster_size > size).
>>
>> v8: Rebase on the top of the current master branch.
>>
>> v7:
>> 1,2: Fix string lengths in the commit messages.
>> 3: Fix a typo in the commit message.
>>
>> v6:
>> 1: Move the error check inside the loop. Move file size getting
>>     to the function beginning. Skip out-of-image offsets.
>> 2: A new patch - don't let high_off be more than the end of the last 
>> cluster.
>> 3: Set data_end without any condition.
>> 7: Move data_end setting to parallels_check_outside_image().
>> 8: Remove s->data_end setting from parallels_check_leak().
>>     Fix 'i' type.
>>
>> v5:
>> 2: Change the way of data_end fixing.
>> 6,7: Move data_end check to parallels_check_leak().
>>
>> v4:
>> 1: Move s->data_end fix to parallels_co_check(). Split the check
>>     in parallels_open() and the fix in parallels_co_check() to two 
>> patches.
>> 2: A new patch - a part of the patch 1.
>>     Add a fix for data_end to parallels_co_check().
>> 3: Move offset convertation to parallels_set_bat_entry().
>> 4: Fix 'ret' rewriting by bdrv_co_flush() results.
>> 7: Keep 'i' as uint32_t.
>>
>> v3:
>>
>> 1-8: Fix commit message.
>>
>> v2:
>>
>> 2: A new patch - a part of the splitted patch 2.
>> 3: Patch order was changed so the replacement is done in 
>> parallels_co_check.
>>     Now we use a helper to set BAT entry and mark the block dirty.
>> 4: Revert the condition with s->header_unclean.
>> 5: Move unrelated helper parallels_set_bat_entry creation to a 
>> separate patch.
>> 7: Move fragmentation counting code to this function too.
>> 8: Fix an incorrect usage of WITH_QEMU_LOCK_GUARD.
>>
>> Alexander Ivanov (12):
>>    parallels: Out of image offset in BAT leads to image inflation
>>    parallels: Fix high_off calculation in parallels_co_check()
>>    parallels: Fix image_end_offset and data_end after out-of-image check
>>    parallels: create parallels_set_bat_entry_helper() to assign BAT 
>> value
>>    parallels: Use generic infrastructure for BAT writing in
>>      parallels_co_check()
>>    parallels: Move check of unclean image to a separate function
>>    parallels: Move check of cluster outside image to a separate function
>>    parallels: Fix statistics calculation
>>    parallels: Move check of leaks to a separate function
>>    parallels: Move statistic collection to a separate function
>>    parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD
>>    parallels: Incorrect condition in out-of-image check
>>
>>   block/parallels.c | 190 +++++++++++++++++++++++++++++++++-------------
>>   1 file changed, 136 insertions(+), 54 deletions(-)
>>
> I am a little bit puzzled - there are 2 series v11 sent within
> 15 minutes. Which one is correct?
>
> Den


