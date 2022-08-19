Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1191E59995F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 12:01:51 +0200 (CEST)
Received: from localhost ([::1]:40444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOyp1-0002US-Mc
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 06:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oOygp-000449-Q0; Fri, 19 Aug 2022 05:53:20 -0400
Received: from mail-vi1eur05on20721.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::721]:37793
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oOygm-0007eL-MQ; Fri, 19 Aug 2022 05:53:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHKfm4Ij+YhA6gpgL5kwrohLlRK94vr1DNLfDsRiBMWopHiGl5dkaYfhvMOf2GBwGWqvPt4UA9DhB6MoxIKIc+ofjOuVF78JfoSsjtZTX240dciVoOgQ298HVVw+3FoPXG5VsYs/aOjTbRMeDwQnQBX2teytC+JCJh0PoILxPauidvtvqEKUWNJt6ErNa3nnu5WYyVlFeofNmR1SAQQJHSMInegUIZN+zqFtC2PiiIWTLh25otJ/yyQvOu4EHzkL/YJQKfsj8etLX3ww7zRQ7Nk8/Rl3GPswgEi5q6KYMCJVB2B7uh0JtFqPx/Hhz4NE/MoPf8tGAAZAS6LDxhDjyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfhyfnAHF5LoVjGaFSDEtAyqeTF1zkO8M7cCSzF1D1Y=;
 b=R5mNWHmaystQms/2I726xinR5qfcpXyI+k6p/vhSucwwn9YpDsEz+HXyD0EpisMMpaJEocQM9pAfY91raTArzP0RrTNXLHYV7s0fTtn+oaGkYCSJ8fPlTVeZKJ2DcrC9BWwO+IGMGyDPb17boVb2Kp53PZQAqlWEzkAyN56LLcOsZ1+aZoTCFlupO6FURbtT0p7WPRb6hrlYDNXMesaXVupbZ3G8ALAFVjGAEOdw+4yihGne19hA3i05ircfBNbAUmXRXSvjXrBSGpaTtft3hQQ2jup2EERu/uY0219xev0XvY5Ryso6CLYu5xpLVsvGayRXk23bHb6xTrF0GyCjtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfhyfnAHF5LoVjGaFSDEtAyqeTF1zkO8M7cCSzF1D1Y=;
 b=dQdhAOvOtjBHc6fmpE/3NEmiLegjkFtljpw1/YA4SisFMEk+Zb+t3rtN6L13tCAFQX5zNPxf35rIYj5WuD0jmRzoAPheHmD8ZrgArjWQr7BZW7Y3I3PjPK3GeUjf0eq9OgbyXy+mYDmX60ZeRHdZm2ysNHkAjP/yDKjRvDcFswEQyKfRDVgnyVdsWkaNRXCxsCem0Y10Xl8ALU5Zvx+4iW8gBcFbDcFcX3C/PNlfVdwijKWijoh3bfkctTJQt0ecGwi4XLH0BEGkKXdseag6dKGwA9T5evqEnWbZVjy4AhniFfHOkelpPzq57CEyH1ayL1tJXEwCBG9C15gZXSVNnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6946.eurprd08.prod.outlook.com (2603:10a6:20b:345::17)
 by DB6PR0801MB1655.eurprd08.prod.outlook.com (2603:10a6:4:38::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.17; Fri, 19 Aug
 2022 09:48:08 +0000
Received: from AS8PR08MB6946.eurprd08.prod.outlook.com
 ([fe80::f8b4:ced7:1f39:17b7]) by AS8PR08MB6946.eurprd08.prod.outlook.com
 ([fe80::f8b4:ced7:1f39:17b7%5]) with mapi id 15.20.5546.016; Fri, 19 Aug 2022
 09:48:08 +0000
Message-ID: <65b8fec4-7c54-83fa-d553-170ce1fb2a85@virtuozzo.com>
Date: Fri, 19 Aug 2022 11:48:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/9] parallels: Refactor the code of images checks and fix
 a bug
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0038.eurprd09.prod.outlook.com
 (2603:10a6:802:1::27) To AS8PR08MB6946.eurprd08.prod.outlook.com
 (2603:10a6:20b:345::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3ac97f1-8bbe-44ae-4ad9-08da81c7ec19
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1655:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yf7Gm3Z019oHbSJ8pUH10gd+Mr27PQtS98eUQf8QDOOZSnCTPBTqxPQO99hHhdKWUw0hUPlxsApk6NAG9tBll7MwPT6agxIZcIT2eIGoHiWolsqLwiPZROlupxF/QpAhuv9h/bQHT2h0prvrWrUPyjXwcpytUYREdI5w6Yn2dCq373RegPRDdrM2qBsuTNff+mU8mvALugYh2QOWVp1xoM32hsX4bZnmvjztFRFHR+VfsZrSx3vXX2cSCH03/zaAinrI3kusQWcl+nQicE9t0XeQTQAmjUg0a7iR5htOTYxufJ5AdD4WdyUMb3klNr9hMmiOuhZUtyk6I+ukTFA4uKmKBzz52jDhll8Sf3ubeBxsgZpzzMYQ3aCgb1SqKWr6Qj1NdHscwtiYtZfaeZHxrkFFJmGNo1wJHgkIt+xwjS+krVf7mopKwWHSiJCdi/zgma/BYNldXP3Ul8i9OPC7OLdZW7AtGF6fsNd64q+6z+O/FdulJF4J3Qzkn13E4xD6jxBUV/aR9eBXoNE/Td4sraV+QofyCuRMCL6TUxN3KUWegPXXBip8n3r4epA7TKrfZfT/bn7pp5ejEiiv5hhQYE73mr30Ex6mO46r0FlxRwedVOPyHW/NPHL7d1/VuRLtaB5473xbNZXMgY0X2qGFIictK/IMMrK99uHP/YNUaO/OB7cTsFdOGtVQ31IYip67dzVvBCyGf+28mHYt00WyUWx53Le01VXWmSIj67FOqR7SouEOXk1gFDBmrTxaMBwxUP0oDyZ2zU3XdY4Nqoj7N09jPx+50VY7kMguoVNTtiHSPPXKc3xskCoWV6mpQKxt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6946.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(376002)(396003)(366004)(346002)(136003)(36756003)(31696002)(86362001)(38350700002)(31686004)(38100700002)(83380400001)(53546011)(52116002)(6506007)(2616005)(26005)(186003)(6512007)(6486002)(316002)(41300700001)(478600001)(8676002)(4326008)(66946007)(66556008)(66476007)(5660300002)(8936002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0t5bWQzRENLTWlocWcrNHVLcVNaWk1yYlo1dTd6aHYvei9MRDloeXFJcmxM?=
 =?utf-8?B?dUVGRUFrTklZdjdsVS9oalFtNFo5bG1CMXRvTWtSckQ4VFI5L1FRWnE3VVRY?=
 =?utf-8?B?WmRFeHVWR2dFSUlrM1N4Z292NC94a3V1OC9nYlgrYjlseTM4aEFHTXJJeHRk?=
 =?utf-8?B?cFZlZnJjSXdQUVFhd2pkS0JEbm1BZEJUN0FydDFPOThDRGxHdHg4QytHSXZz?=
 =?utf-8?B?ajRSeXNPOXRmcU03VFppajRrTk1PZHlGdk9RK0lSYzhVWDd0S1U5MjZIWXVw?=
 =?utf-8?B?eCt1TmtQdHJKOWhTWG5adThlOS9obldLQ2p6enB5VkFrWkh3WndIU0FqOE5U?=
 =?utf-8?B?Y2tyem91aUJ4S2NqTFRVUXhnQ0FFRG1qTTRJT1I1YUxlem1wcjBUMnBjeStu?=
 =?utf-8?B?bE5ZWUpZd05tbHY1b3hqNHR5WFlnK1drMU5MNzBpSjVLMTgwOGh1eVBPWThZ?=
 =?utf-8?B?K0twVEJlSGJlcG14VklQaUVHODVZNmJvbndmK0ROMWVUaElHTG9FZCtLSEhT?=
 =?utf-8?B?cVNrZlJMMlhDYmxVeTdXZ1ZNcEtpWWRNdi9yV3o2bUs4eU9yS094WFprUUxx?=
 =?utf-8?B?L3BFcW0yRisvcUpSN1ljSWllY1VWZjlZc2lNdkJ6SWpJOVlhcml3MXJnNlk3?=
 =?utf-8?B?dEhyd20wOUNIS1dkUVFiQWovTXFzMXZ6OVJvN2xZeEZDdkNGcytMWFpyb0Ni?=
 =?utf-8?B?d3MrY2V3KzJBeHpuZnZid3BMWUc0MUhvMmJYN1hiejVrQ2paaVVMUUxadlB1?=
 =?utf-8?B?T3JCbE5mbk1EV21EZGNNcndkdFpURWY4bGNQaUc4U3lsRnBaNFJtOFBPTEkx?=
 =?utf-8?B?UEc5N0cyL1FaZ21WTGxWSVloNm9TMFlQTVRxNHdMSC9MNlppMk53VlNhTEds?=
 =?utf-8?B?aVpQYzFwNnViL0sxMXhPUHI4N3RTUmVWdVErbDRENVlCVXlGV0FKRzJFQUN2?=
 =?utf-8?B?UERmOXZDR0Y1dm8wRFpMWXJ0WVhhMTlXc1VDNFlzL0ZoaytxYVpDKzZsV29x?=
 =?utf-8?B?YldEL0hRN01zczhqcjlyUVFReGIwN2JyOXFmMjRzL1ZOdytpL2hYWmtnbUlm?=
 =?utf-8?B?eVlYSkxBU3lzM2IrS05VMjFuMEZISEpWenF1Q1ZYNXNHcEdKVHhwTm5iN1FW?=
 =?utf-8?B?ZW1TVGZQaVJoVEZuYVkrSi9COVhPTzBUVUdoMUdYTCsweHdaNnd4aHIrTy9x?=
 =?utf-8?B?YnNyWHNUVllRMktDUXFBOFJSeVkzaWhORk9USXp3K3ZFZUxDYVZvdkZvWjRk?=
 =?utf-8?B?bm9xcTNtVHZpR1dQUGRTTHZGaFVSYlZEZGE1Um1vSldPYlhUQWs0NlNlcGxv?=
 =?utf-8?B?c2xQc2JwTnFrSUszRFZtSHh2OTEvcE9MMkFmMW1YRVpxRU41enp5K1YrNjFa?=
 =?utf-8?B?YlFFS3BuWmpDUkdHejhqcnF5QzRnNHBadkJpUmw4ZGlpTi9kYlpkcWdtdFhB?=
 =?utf-8?B?ZHozdm1jV3ZaY3ZTM1ZzMXloQzVxSWtwM3M1aGtKMDdwcEhEb1pHNk01UUZU?=
 =?utf-8?B?SEVPM3VGeWlHdDVUZlFNZGEzM25TQjZpNG8rR3UrQmsrdlUyYlFUTGkzazVG?=
 =?utf-8?B?ci9LMWNTbDE2U29NL1pHM09YelN0Tmo2T2llcld3cXV6dm1KSjRZcy9HSGht?=
 =?utf-8?B?ajk2TEdjb2M4clFrcUw0UVNQOWJJS3JLR08vWUo1dWFsemNoR05HWlpXdDlG?=
 =?utf-8?B?eXRvRUVCWkl0NUkrcU9VZlFWaXJ1QWZoclZGd2NKc3BzL0ZpSUVmUW56WERs?=
 =?utf-8?B?bUVlWG9uTFZabm1IOXpscER3Tk02amVZRGJpbVk0SzA2ZXpFeHRSb0FwM1M5?=
 =?utf-8?B?ZGJYMEVFUmNjcFlhM2xYb2RQYjFxSW54cFVQakd3b0N4Mk9LeVNRWHFSdHFr?=
 =?utf-8?B?aENOZyswT1Y4WWdLUDd0NUdaSkxKZk5TNW1PWlFPTlJMZk1BbGFnRiszOWtl?=
 =?utf-8?B?aXB0cHo0WDViZUkzd0xlNi9iMUFCZ3A4MGZUZFd4RUdmV2M4cGI2RE8wL0dn?=
 =?utf-8?B?NEdGSVo5SlB0Z2xMV2J4NEt0N2hvZW5wRDdxMXd5eDZCZllFSXlSbS9hU2pk?=
 =?utf-8?B?bkt3QmRTNHkyMDB5bUN1UEdQM3hPcjBPNTBhYzdqZENBU09JUU0ySFRaTDBj?=
 =?utf-8?Q?pg2+NBI236nBLdgNEdfYpyMDu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ac97f1-8bbe-44ae-4ad9-08da81c7ec19
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6946.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 09:48:08.7776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fBVo+baLPYbtD9dAPJ4WI5GY4E+0jlGS1Ikmip47GULnATxLnqRe4wiirGlR3EhgfVb/25kGYVRmBJnuS2kYbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1655
Received-SPF: pass client-ip=2a01:111:f400:7d00::721;
 envelope-from=den@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 18.08.2022 17:14, Alexander Ivanov wrote:
> Fix image inflation when offset in BAT is out of image.
>
> Replace whole BAT syncing by flushing only dirty blocks.
>
> Move all the checks outside the main check function in
> separate functions
>
> Use WITH_QEMU_LOCK_GUARD for simplier code.
>
> v4 changes:
>
>    Move s->data_end fixing to parallels_co_check(). Split the check
>    in parallels_open() and the fix in parallels_co_check() to two patches.
>
>    Move offset convertation to parallels_set_bat_entry().
>
>    Fix 'ret' rewriting by bdrv_co_flush() results.
>
>    Keep 'i' as uint32_t.
>
> Alexander Ivanov (9):
>    parallels: Out of image offset in BAT leads to image inflation
>    parallels: Fix data_end field value in parallels_co_check()
>    parallels: create parallels_set_bat_entry_helper() to assign BAT value
>    parallels: Use generic infrastructure for BAT writing in
>      parallels_co_check()
>    parallels: Move check of unclean image to a separate function
>    parallels: Move check of cluster outside image to a separate function
>    parallels: Move check of leaks to a separate function
>    parallels: Move statistic collection to a separate function
>    parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD
>
>   block/parallels.c | 197 +++++++++++++++++++++++++++++++++-------------
>   1 file changed, 141 insertions(+), 56 deletions(-)
>
That is VERY bad that:
* you have lost (not applied) Reviewed-by: from previous iteration for 
unchanged patches
* you have lost v4 tag in the subject

Den

