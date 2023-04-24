Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BC36EC8DB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:30:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsWG-00045X-78; Mon, 24 Apr 2023 05:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsW3-0003zA-6x
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:29:50 -0400
Received: from mail-vi1eur04on071d.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::71d]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsW1-0006gG-70
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:29:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCOEsXHPf51yVyqa+JMiWCo0Bw91fTYWqrtNNag117hByoWOg+2Fqo+oePgiSn7BQ2J0/z2XId8jE2dFoTIbb5kxWI4ExGZ1VCuDMx4xVosx+X06EMwmk5HAY6MyxEQcv07yqFslg2OD7r3IDx5xJ5lRT7+YX7Ao7CLFMNlrtMArsrJ4xXf3f2cVDI5xBmUJu5Yjm664hR9OgMEdmZIGTLVNMucf+/p5Mm4x50CGf/OHCALTpIupWKURL56sGAs+PYsTlH6UqaFGPYJIB5YUVAQBl5Q2O/vsRgHjE7KDaoRtMQoL09DATSrmE9dlu1uIRqhNVli3Dq7sR+mgNN8Www==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K//hfceYfmjVqYoPQg3ZtYGKMfGjXo45dEQJNFS7aUg=;
 b=K5Sjs/YQnqsXhhTiEcCXOePeKbsMvZDAyUbKhnkeyxDEA1Ay/H/5QAZrK/zzrjFs/KMGqKX7SMoRP59wyPBs6FOqKbK/FfxAi3O2HXEi3fkQz9DMEJmRkFeuCkK80nAdRBCiUggt5Y6pQJ/39uSzZMzUQS2ls/jyvuW9kCzUhInHqYOWkV8YgvDv/2eBI+HCIMHlODNv+1vZ1cLCN72O40Ni8RWeRnmNUrH17a7jZMk2LaSV+zbbt8JKWlhlpjhbc/yoWyYPcv4Ekya3HwoDYOmN/Sny56tj3hYZOYD/ROotUMYiLxQSjYZSxKdsR4wUvfQMuWYhtUUPqeq0Fl/+mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K//hfceYfmjVqYoPQg3ZtYGKMfGjXo45dEQJNFS7aUg=;
 b=ufRSqsTkZuCa6rMGnCOi0OKRpO01SiwlRwPvHpZG9PTFpV93Z4hoQjWn+zO1BOdtsp9y1Tzqs4xIP6tJ4vpJfre+S/WErNJYGxm4EUTDPjElEQhVU/UqQxZskMswh6VRxWdh+HSkWszo5M34+w/zX4LI8fLTBdsKqt2sTaizFH440M708YRAX6/f//5EbBibvMPSuSOqXQ/wADiSZMdAvvWFFlgxrNq1KggaBSnI1QHBAmTasvAHEjRxl51zisvXGvIAAwFPu9Ri0fCYE6WRZ7NaNVRi1WMF65/mSSBH0nIQl8THKWjKmK8eUyAGyRquHMzHSfw2wPSTOoC/HejM6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PR3PR08MB5609.eurprd08.prod.outlook.com (2603:10a6:102:81::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:29:25 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:29:25 +0000
Message-ID: <3e08340d-7d01-9c19-2fd4-387c6fa03067@virtuozzo.com>
Date: Mon, 24 Apr 2023 11:29:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 00/12] parallels: Refactor the code of images checks
 and fix a bug
Content-Language: en-US
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
References: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0601CA0003.eurprd06.prod.outlook.com
 (2603:10a6:800:1e::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PR3PR08MB5609:EE_
X-MS-Office365-Filtering-Correlation-Id: 2910685d-9670-47b2-0661-08db44a664e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vxHEqsgx0RE081J2GMA0oB9ZOJwSRLE/56Z2EQyDF2rV6H8M8ZcnjTzKbR+F/Mrb38LQastnLeQHtkA+qqE0a23QAqB/bsGRg/YnoDmUV4uP0xIJNp/fOhVWfJcOYnp+JYSxcj9xP35OBZbYUKOhoGEp1n8bJ5x7BxB5mlEFNSTWX+02PHkkY6D+nnHiqwvf/0cK2bxfYurJ9bYwmSms6ILEufK6/BvDEuxy/gDEzQiBEAmV1TxXdNfiHA5DrH1Z3SjQRT0dthNWFgs9MsC3xTar2p792AMxazFaX8gXP6hMWFpTpOrcCQqwgNmnCx1jZ7Kotjq/RJ6dvTCU2MA8D5wGYp6vHqypP1AtRIq4LXbkzVhw+7HIReJ66mOYWH1+s1iGPkZQbmEgHGKf3WaDfAbkmO6BrThxitw5CtFFoKFBYEvrIq7456EFSiGRNp0Rb1knYKCeezgyV9+HfMy2F7gsm8HL9TFkPuUVOwdYbam7IJ2fynA0nkMStlbYmpbpjTp3D8eBYS/Y9yYr6Xmq0YcF2aXssMoBCIzMk8NS/+Wrj139GzxYJLTNTNUr/16RMbZ4LnncybXOlcrdtmVRT4ul020KFQiM6yiwcudT6ezJRYiv9LOZz4jB6YXNPUP4T/t5DHCgBsjZPn/toYcYgFir0ylvfvYbiLDrE4fS6kQ/XSx32Yfaq9dWmOeccCKi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39850400004)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(6916009)(316002)(44832011)(8676002)(8936002)(5660300002)(41300700001)(36756003)(31696002)(86362001)(6512007)(26005)(186003)(53546011)(38100700002)(38350700002)(478600001)(52116002)(6486002)(6666004)(83380400001)(31686004)(2616005)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wnp6Z2FjV3p1UjluUTVKR1kwcU9XZXk2NGJibjJIQVlGdEhLcnJjRnRNZlRM?=
 =?utf-8?B?RUM3eHZ2OEtaWmpDd2JwZzZUQm5DTnJvU3oxYStwT0V4QXMyeUIwVWg4TXRD?=
 =?utf-8?B?UG41WGhQbDd6cVlES1l5dmdyZ1hWNERhTk9DN202bmdzaXlnZmdKVE1YdFlG?=
 =?utf-8?B?UWljTjY4MWNYTmtra2prNmVBUFpORHU4Tk9OZ3FsVEo3aGpnclRoMmpoSnE0?=
 =?utf-8?B?T1dhdngyemcrV3lsUjZZYWJ6Qi9paHNzU0FVUnhDcGZKR3c0eU1jZ2NDV0M3?=
 =?utf-8?B?ZndQTEY2WXQ3N0NzdSszK0FPOUUwSU02VFdvbDhHKzRySTByNEpGSG42NVRJ?=
 =?utf-8?B?TG9wSHdhRTV0dGplbCtISXJoeVdKTGJTZk5PRitTWFpXbmswM3RzdlhKbFU5?=
 =?utf-8?B?TGdZcVJZZU9NOG9zK0NDU2s3aWNndEhYUGIvVkx0a2hjMzJwVEFWQVhFVVQv?=
 =?utf-8?B?cW1WZUVmcUU5Q2F4QUxUWmtmRThTZlJZNndtM0lZQXZLTFhHNGhwTlg3M0R1?=
 =?utf-8?B?Y3Bzb2t3R0x2bnRFKzZhUk1DZnhyRWttcktGUUYwU2lnL0UvMVBPRFRjZzRX?=
 =?utf-8?B?d0VuN0JYcVEzN0V5bUR2R01OSi85bHJwb3dWMkZlckhmV2ZkUVlGdTRiRXF2?=
 =?utf-8?B?Q3NyY2QrZzVYbjk3SnZUNmxiVGp0QWM2a0M3amtZM21WdGNrenk2Q0xmUDNk?=
 =?utf-8?B?bU9PSnVGbW4yZUFyWVc5TWFCWmF4aFZ1QnJNbmg4eTFXOVQ1VHRaWTBRcktD?=
 =?utf-8?B?dE5qUXJtSW1XMHkxam1EL2sxUVhqR3YvbXVrV3JBOGFWS3FCS3o0T3ZwbmdL?=
 =?utf-8?B?eVgrcEVhRFRuOG5IRUdiY21IaWRDVEk4cHVaVFQyd014L0FIalM4cHFlWENB?=
 =?utf-8?B?b0I2d1IxdkgzbElRRDBodExjK0FmMlFIN3pOeUVIalk4RlFqNFZPZlptbUlQ?=
 =?utf-8?B?VWM3Y1lZRXQxWGhJUTF3L0RKcFdmWG9zQ2lQd1pvZHpOcEtBSzVxUld2dGZ2?=
 =?utf-8?B?U003Q0YwRmJIRi9KZklBOGI5eGRCV2NmbDdyMHkzeGI5SnlRR2lKd05IT1Vy?=
 =?utf-8?B?a0xDMk0wUzJQQXIzNzVjYy85SUZORTNUTDVOYVpxOVc0YVNRdzkreFRzSmJT?=
 =?utf-8?B?dERveXV2dFV4QUdTUnN6SU9ld3IxUklUN3lIVTE0WmRVdFBjRE94cEIvTExL?=
 =?utf-8?B?THVqUHBiMkkvTTEyd3RPK2x4TkM2ckxWR2xKNmN6SS9VcmlweXpGOTRLbjhP?=
 =?utf-8?B?Lyt3NFVwZVBGSVZqYmxUcFZVeDlNZzBZcnUveFZ2REh1TzY5V242N2Y1SFBZ?=
 =?utf-8?B?MkhVWDl4blNBeHorUWkyYjFXNk5rU0w2Uk5FZjFQRFM5eWp4UWM4ejF6RThv?=
 =?utf-8?B?RGdudktMVDZpVUl6ZHZvYWh3dTV3S002WWdvY2xBbWd2NHhObFRIblNzeitx?=
 =?utf-8?B?WnV4N1dLaC9HYTRNSHRiNHkyY2NVb1J5ZEF6eWcyV3N1eTRubUFTSS9WdzdX?=
 =?utf-8?B?NmordW0zaHFlQzBMaHJ0eGhYenlBS3hPencraEN1SmFmQnBsbkVyQ0h4TDRF?=
 =?utf-8?B?cjBaaGxEeGF5Y1lrUHByZDRtdTNxWmNlczVsRlIzMUIyRHpGZEtKdFY4UkE2?=
 =?utf-8?B?SGRMNjU3bnZOVGV5am1TM1VKekd3QU9nNlNld1FsVlJCSEtOc0FHREI5MG9u?=
 =?utf-8?B?bjM1TmhJWjNzUGUvQUdGajJYU0FrRnpmUHZsd2ZvcFo4ci8vL3Qyb0VQYk80?=
 =?utf-8?B?MmZrWVdrSzdoYnl5ckoxMDZxOVJIYWFhbFduOXpVU012S0VZcmVNWllESDhD?=
 =?utf-8?B?Vjg2cUhVZ3YxZUJoKzZnQUsxeGJWWGtqaEV5RmdmbkxhT25zTVRwVGFKQUNW?=
 =?utf-8?B?MXRvQWNZbThBUjZSd09veDl3UTM2Q3VUMlNiVTJhM2tCUzBOZjQ3aktjcWU0?=
 =?utf-8?B?czRjeFFnKzQwVlM0UzBPV1hmdTlPWVRjQmpKblhTajMvYS9GQzB3Q0p4L3J6?=
 =?utf-8?B?Z0JySFZBV0F1TlRvbFN2YUV0MmpQNmpYR0xFSXF3UWpQUzZqQXJERmMzVzZo?=
 =?utf-8?B?VVc2bEEwc1k0VjA5SWJ4MkExcEtPQWRCcTFBVmVZWUJXUGoyNzhnZWJjWE4w?=
 =?utf-8?B?U2lLa0NleTd3RHZ5cCtaZjViV1pJMUJDNXFvSFJKSkRmNS91eDJYTEE4TzVJ?=
 =?utf-8?B?YlE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2910685d-9670-47b2-0661-08db44a664e1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:29:25.1778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YsNuLLlugF7pHV7CfcwSXwpzgq1ia8FkjkWuOiXV4f5H+DH+xUjEupRVpMH4jQuQAisQ9U0+UQLiGP59PvpCtw9KZVQN2zIqENdLOFPYUMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5609
Received-SPF: pass client-ip=2a01:111:f400:fe0e::71d;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
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

Sorry, this patchset has incorrect//recipients.

On 4/24/23 11:16, Alexander Ivanov wrote:
> Fix image inflation when offset in BAT is out of image.
>
> Replace whole BAT syncing by flushing only dirty blocks.
>
> Move all the checks outside the main check function in
> separate functions
>
> Use WITH_QEMU_LOCK_GUARD for simplier code.
>
> Fix incorrect condition in out-of-image check.
>
> v11:
> 1: Use bdrv_nb_sectors() instead of bdrv_getlength() to get image size in sectors.
> 7,9: Add coroutine_fn and GRAPH_RDLOCK annotations.
>
> v10:
> 8: Add a comment.
> 9: Exclude unrelated changes.
>
> v9:
> 3: Add (high_off == 0) case handling.
> 7: Move res->image_end_offset setting to parallels_check_outside_image().
> 8: Add a patch with a statistics calculation fix.
> 9: Remove redundant high_off calculation.
> 12: Change the condition to (off + s->cluster_size > size).
>
> v8: Rebase on the top of the current master branch.
>
> v7:
> 1,2: Fix string lengths in the commit messages.
> 3: Fix a typo in the commit message.
>
> v6:
> 1: Move the error check inside the loop. Move file size getting
>     to the function beginning. Skip out-of-image offsets.
> 2: A new patch - don't let high_off be more than the end of the last cluster.
> 3: Set data_end without any condition.
> 7: Move data_end setting to parallels_check_outside_image().
> 8: Remove s->data_end setting from parallels_check_leak().
>     Fix 'i' type.
>
> v5:
> 2: Change the way of data_end fixing.
> 6,7: Move data_end check to parallels_check_leak().
>
> v4:
> 1: Move s->data_end fix to parallels_co_check(). Split the check
>     in parallels_open() and the fix in parallels_co_check() to two patches.
> 2: A new patch - a part of the patch 1.
>     Add a fix for data_end to parallels_co_check().
> 3: Move offset convertation to parallels_set_bat_entry().
> 4: Fix 'ret' rewriting by bdrv_co_flush() results.
> 7: Keep 'i' as uint32_t.
>
> v3:
>
> 1-8: Fix commit message.
>
> v2:
>
> 2: A new patch - a part of the splitted patch 2.
> 3: Patch order was changed so the replacement is done in parallels_co_check.
>     Now we use a helper to set BAT entry and mark the block dirty.
> 4: Revert the condition with s->header_unclean.
> 5: Move unrelated helper parallels_set_bat_entry creation to a separate patch.
> 7: Move fragmentation counting code to this function too.
> 8: Fix an incorrect usage of WITH_QEMU_LOCK_GUARD.
>
> Alexander Ivanov (12):
>    parallels: Out of image offset in BAT leads to image inflation
>    parallels: Fix high_off calculation in parallels_co_check()
>    parallels: Fix image_end_offset and data_end after out-of-image check
>    parallels: create parallels_set_bat_entry_helper() to assign BAT value
>    parallels: Use generic infrastructure for BAT writing in
>      parallels_co_check()
>    parallels: Move check of unclean image to a separate function
>    parallels: Move check of cluster outside image to a separate function
>    parallels: Fix statistics calculation
>    parallels: Move check of leaks to a separate function
>    parallels: Move statistic collection to a separate function
>    parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD
>    parallels: Incorrect condition in out-of-image check
>
>   block/parallels.c | 190 +++++++++++++++++++++++++++++++++-------------
>   1 file changed, 136 insertions(+), 54 deletions(-)
>


