Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6BC365B4E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 16:38:36 +0200 (CEST)
Received: from localhost ([::1]:45346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYrWO-0000DF-0H
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 10:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lYrPv-0006kA-0C; Tue, 20 Apr 2021 10:31:55 -0400
Received: from mail-db8eur05on2104.outbound.protection.outlook.com
 ([40.107.20.104]:43265 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lYrPq-00065z-Ak; Tue, 20 Apr 2021 10:31:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWA967lFfgigDFFV00IT1uJZ/rMI39xrIK1bIZtFdVboqvzLZcPoHg2QTL2P+VkpRt5XoqhPvQXLearUYzTk7EFtoiu4bUf8ABBSFbWC1pz7mf7yG4iWrZpXkEy/wlIXEmjeACVdBBNTXjkNFf1qIiWjIomOPPjEBbISPyihBlZ0LwPWBu0JdmKdGiaNAfPAU1llOKF9+HhCqq1GMbYqAqW43ZB7kjz8N2rhtseGiJYjcMp1FzPkhMj+ueuZvVU2rIRfTX0UiHjDNMdxLwInCrGL8W5/vPNm0Xx9stlNrrRHLGAyqfBRCealCd4CfNKWPNdXdTbmWPVMockFpGDhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTQgMLeLSHs8JB1U3nADQtPqaK5S1oabffqOGLb1Ico=;
 b=e/DYE4Sah5LQObflqATm8giwgip9RvaIjI59lsvq6kesEuLIxdPc71KfadZ9bPRyAL3oF5WCoyGL0QaFwTaTqM0qz+Fp5Cey07ugOoL4DPTLCGSXkXso9Vr1bduTXyZJp3KAFn2gNEvitXnZFkQoS/yl/PxZVoHWb5Q4Mg3oSuBFWt3NMIfa6d8U4Dr98LpPIcax9TcaOI/M4QHTF63ix5wq8KA7HSgd1CPNXdV3kxwFE6XKeJiHeqEIGkJJi4im5Z1HuNnNyMdwzHDd3pGCCpsZ6HcMysC90mNZg+hkX9GM3azfOjEJOf+ih4Um/DtYnCw1NPmcNIcRW6MhX8ai4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTQgMLeLSHs8JB1U3nADQtPqaK5S1oabffqOGLb1Ico=;
 b=XBkavDW+BGxcWMvLuCKDroVzNfcZfszzORtwcaPBOl4d5EtCctz++2SVUWP4c2jaNfrNnNuqHC0gBAK7ytcJQwg/qUqLHNIvZAhmDCx3XEOGiKN5Z8mj5NVG2ASGTmr45rs2bHQArbztOmZNB3+Mt29WCzDoOFigDd3qDMctwRM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4536.eurprd08.prod.outlook.com (2603:10a6:20b:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Tue, 20 Apr
 2021 14:31:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 14:31:44 +0000
Subject: Re: [RFC PATCH 2/2] qemu-img convert: Fix sparseness detection
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: pl@kamp.de, qemu-devel@nongnu.org, mreitz@redhat.com
References: <20210415152214.279844-1-kwolf@redhat.com>
 <20210415152214.279844-3-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <06e1910c-102a-e41d-116f-00458f41243c@virtuozzo.com>
Date: Tue, 20 Apr 2021 17:31:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210415152214.279844-3-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR3P192CA0012.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR3P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 14:31:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22dba618-546e-4cb2-cc81-08d904090595
X-MS-TrafficTypeDiagnostic: AM6PR08MB4536:
X-Microsoft-Antispam-PRVS: <AM6PR08MB453603D4FBE01E492C31023BC1489@AM6PR08MB4536.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HrwTU+ZCK27jv7jM3IcRw95OjBgX9U2f2ezyNWsIZVorHMsa5Ty2y1x71g7/Awtr14FaUpcFi+a8hSNzqUF9tO9cuU2L8Mhea8Q+fgX4JVPGBuSuzD6IR3Go80HMAI+T9HVYo7KfEw0JOj1Bx6tOZVrO6KslqeqOdFX8sxmMfhCqyucQjURaEj3jwnIJXheaRtOGsi0uKJcrukWjeyjSkokkRX1K0s89FTNh2Dwn+kHbXhhobT0zLLRK7c7xaf3q3GcFKBgtM0LVFah0zsq5/+TVek6Z/9QJL+sJprNxg7H0OwZ+D6Kx9a4nngPfO2ih8Zm9K9YCA1WJjCfNBDCe6sdRr08IyHtF5+GojukDY9IpAbgGLen41/b2+8UtmfqofLsRgDpCSIkVJOtKFI/AzFziNg9fqya9JJjka7PEN3X4BimzHjD8Pxt58drJnCdJHuMM4hvHyutJq7bZMsDidXDVx/+eDcDFUY5C8dirGyi9QMFUIQV3SkanloBeh09WjPcccOelRdagUOq6SxjvjlWVjqB3Y27OzAKyowIyZf71eY4zKgqNxr0mZlYK4laz14Wx05yOwQYdj8ucmJtdAhyQ6nSv1ugvRU+spkWuMdYETYjq6AJplyG3UbXtherMLdGphvsT/A00qIT22jJyKuNeoXXKecLIbNhW/gFYAqpCGYrgVc1NyBQrm6YK2o4vyFcI2GaZnd3fDmyLloST1xXcZN16OBOGkNrFoyb7nQ67PcjeCCSGUHGch/sxS7FmFB+XVTUniwMWPF28pjeor0//P2fM2YtqufAct1QvG1l01ByYlHu0DtuP+n3vvghx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(346002)(396003)(136003)(366004)(8936002)(316002)(38350700002)(38100700002)(52116002)(478600001)(6486002)(36756003)(4326008)(86362001)(2906002)(956004)(66946007)(16576012)(31696002)(2616005)(8676002)(31686004)(966005)(66556008)(26005)(16526019)(66476007)(186003)(5660300002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z0cxWXNKSjRscXkxQjVJQ1I1ZExJM3kwNGEzam9PdXJMNGRsNk1wYVVyTk0x?=
 =?utf-8?B?cnNqWG9SM3ZGTWkvd2dhdEJQMmJiZVBhaXFyV1ZpNTNDNm56UTdVSmNvQVAv?=
 =?utf-8?B?SjM3dWJwZ3ZGVHJCTCtwVjRwNXQ4ZWdDWnErblRyOVIwVWljcXBxbFZRRzhR?=
 =?utf-8?B?dUpWNlI1M3RYbmVqY2Y1RmkzWWw5ZHlMalEwRU5sZVZNdXMyNTBYdW9hcmZ1?=
 =?utf-8?B?eXJGUjJVZkVFNTRKcHRJaFFzcUNPcHhZQmY5dWV3TnFiUEFCZ28rZ2lqdkxR?=
 =?utf-8?B?QUU2VDdNeDJLUE1NVnMxMGRQNmNMbGUycWhvOXZzUE00NGdyeEUvNDdFVmI5?=
 =?utf-8?B?MjlneGw0eGh3Zk1EbE9pNnhGc2VOQnN2YXlmRHkxcU9UOUNYa3I2aUoyTitO?=
 =?utf-8?B?dHowS01SczBEdTdZbjFxYUdzMWNBTUJ2a0NJc05PSlpkYVJJYlBMblA1Vnp4?=
 =?utf-8?B?NGtCY1N0U2F1Z0FEdjhUU2x4bEZJZy8zSjYxQjNVUE4zV0NQY0lVenFNTDd2?=
 =?utf-8?B?SHdjamxKODQ4eXU0MjlBNkIvaHJlK2RNOXJQNUhjOEJleS9CSGcyQUVxampv?=
 =?utf-8?B?TGdWeE16aGlocjVva29aTkQ2OVRMUmRoMU5hUG5lZFZBc0p3dUw2bkZtRDZZ?=
 =?utf-8?B?Ri9DbDAySWwvZS9abGFXKzNFM1B5Tk9UYklHb3JqeXg3L0NJOFkrSGNsZWVq?=
 =?utf-8?B?aVUxbDB5M0JVYlpPUGRicklxZVlESHp0WmVZUmRoTGZzdUpKaWgxVXl0NWVU?=
 =?utf-8?B?WCt6L2ZmZ1hXUWFqZVVCdld5M2tiNXN3eEZmS25OL0htaHBzZHNZQ3Q1S20x?=
 =?utf-8?B?Wks5eG9aV2hEZHJoMUVPeURPdCszd0luNVlHQXJRQWZ2UFcwVktMVU1oN2Fy?=
 =?utf-8?B?VTBxd1V3aEhaa0ZoWmZMNjRYbEtzYTdBdS9SSEpqNE02UVVoZzJCMVhQMFdh?=
 =?utf-8?B?a1RJMU15Mk9wM0d5WU12LytYdGQveUZmb3U2ZS84czBQMFhKYXVaOEN1ajZ5?=
 =?utf-8?B?YU5QMXNOYXRyRVBvSUtKbVhUeTZRV0NjcUJEeHkvWDhJS3pPVUtOVkZYZjRs?=
 =?utf-8?B?QTcrc1NzNU9JV1poTmg5T2JDOVAzMCtXckFIb0J6bVNjZW42SHM5Ykozbkhq?=
 =?utf-8?B?dkFxdnk1MGNIWEFYc2dpUHNCZHJieVI4WlFxWTRJUlBKaWNMb0N5MFNwOHpn?=
 =?utf-8?B?NFNhT0NTRlR2SWJOWUxLK2xTc0hCZ0JOSkZtVzlGZ0tRK21UL09sckpoSHZp?=
 =?utf-8?B?L2pieFRkbHBud3JtSVFrSFRQVDNkQnYyWHd5RHFVTFdlL1A2M0gxRzdQSGsy?=
 =?utf-8?B?cEdlckNKWmRlK1FlUlM0VGtpRFhaMmNCWVV5ZjJ5SG80RWRZNkIyQmxuajFZ?=
 =?utf-8?B?cTg5WmpldFY0VzZhTTkvbEVHMXMrRjJuYWhoWnRNQUlBeHNWNmx6c2V0aVJQ?=
 =?utf-8?B?d2FUYjdvSFlFTjJhZFVIRDR0c3JRWEhsUUxUM25Dd3RGNSsvbzJZR3N1Z1B1?=
 =?utf-8?B?TXp5Z3lSSXg0cVI3QllQcHNxbVlUNkR1WGtscmhuNFhFRzB0c1dvanFQRVUr?=
 =?utf-8?B?L0FMdDg2dGxTeWN0Nk16c1IzbEd6S1dqL2N5ZjZiZCswUDRuRlExalVSZWIw?=
 =?utf-8?B?cE0yclQveGVJbUxrVFNncUxqWDM1QkkvTWx1OUxSbHg5VGxiMjd6YnpDakgw?=
 =?utf-8?B?SlV5RWVlTjZINFhCRVZjWlNRS0FiQ0xJa2VVOXY4d09UNG4zSVJRR2RFRzB5?=
 =?utf-8?Q?KrjLrwq+pFKIT58HU+M9IT0QD2BMDIV4rBKLV8m?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22dba618-546e-4cb2-cc81-08d904090595
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:31:44.6248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqSK0uWZHyeqn6MPGU1Dc6ZIq3aC5Ri/7iZG42CGozBL0DhnCJVCYhGI7P8Vrb8ELO+4Df+61UfXdWEXUeW8o+tR3GiiIWe3MM8HSmukAk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4536
Received-SPF: pass client-ip=40.107.20.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

15.04.2021 18:22, Kevin Wolf wrote:
> In order to avoid RMW cycles, is_allocated_sectors() treats zeroed areas
> like non-zero data if the end of the checked area isn't aligned. This
> can improve the efficiency of the conversion and was introduced in
> commit 8dcd3c9b91a.
> 
> However, it comes with a correctness problem: qemu-img convert is
> supposed to sparsify areas that contain only zeros, which it doesn't do
> any more. It turns out that this even happens when not only the
> unaligned area is zeroed, but also the blocks before and after it. In
> the bug report, conversion of a fragmented 10G image containing only
> zeros resulted in an image consuming 2.82 GiB even though the expected
> size is only 4 KiB.
> 
> As a tradeoff between both, let's ignore zeroed sectors only after
> non-zero data to fix the alignment, but if we're only looking at zeros,
> keep them as such, even if it may mean additional RMW cycles.
> 

Hmm.. If I understand correctly, we are going to do unaligned write-zero. And that helps. Doesn't that mean that alignment is wrongly detected?

> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1882917
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   qemu-img.c                 | 18 ++++--------------
>   tests/qemu-iotests/122.out | 12 ++++--------
>   2 files changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/qemu-img.c b/qemu-img.c
> index a5993682aa..ca4eba2dd1 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -1168,20 +1168,10 @@ static int is_allocated_sectors(const uint8_t *buf, int n, int *pnum,
>       }
>   
>       tail = (sector_num + i) & (alignment - 1);
> -    if (tail) {
> -        if (is_zero && i <= tail) {
> -            /* treat unallocated areas which only consist
> -             * of a small tail as allocated. */
> -            is_zero = false;
> -        }
> -        if (!is_zero) {
> -            /* align up end offset of allocated areas. */
> -            i += alignment - tail;
> -            i = MIN(i, n);
> -        } else {
> -            /* align down end offset of zero areas. */
> -            i -= tail;
> -        }
> +    if (tail && !is_zero) {
> +        /* align up end offset of allocated areas. */
> +        i += alignment - tail;
> +        i = MIN(i, n);
>       }
>       *pnum = i;
>       return !is_zero;
> diff --git a/tests/qemu-iotests/122.out b/tests/qemu-iotests/122.out
> index dcc44a2304..fe0ea34164 100644
> --- a/tests/qemu-iotests/122.out
> +++ b/tests/qemu-iotests/122.out
> @@ -199,11 +199,9 @@ convert -S 4k
>   [{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
>   { "start": 4096, "length": 4096, "depth": 0, "zero": true, "data": false},
>   { "start": 8192, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
> -{ "start": 12288, "length": 4096, "depth": 0, "zero": true, "data": false},
> -{ "start": 16384, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
> -{ "start": 20480, "length": 46080, "depth": 0, "zero": true, "data": false},
> -{ "start": 66560, "length": 1024, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
> -{ "start": 67584, "length": 67041280, "depth": 0, "zero": true, "data": false}]
> +{ "start": 12288, "length": 5120, "depth": 0, "zero": true, "data": false},
> +{ "start": 17408, "length": 3072, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
> +{ "start": 20480, "length": 67088384, "depth": 0, "zero": true, "data": false}]
>   
>   convert -c -S 4k
>   [{ "start": 0, "length": 1024, "depth": 0, "zero": false, "data": true},
> @@ -215,9 +213,7 @@ convert -c -S 4k
>   
>   convert -S 8k
>   [{ "start": 0, "length": 24576, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
> -{ "start": 24576, "length": 41984, "depth": 0, "zero": true, "data": false},
> -{ "start": 66560, "length": 1024, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
> -{ "start": 67584, "length": 67041280, "depth": 0, "zero": true, "data": false}]
> +{ "start": 24576, "length": 67084288, "depth": 0, "zero": true, "data": false}]
>   
>   convert -c -S 8k
>   [{ "start": 0, "length": 1024, "depth": 0, "zero": false, "data": true},
> 


-- 
Best regards,
Vladimir

