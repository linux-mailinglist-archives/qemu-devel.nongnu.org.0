Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2980F6EF77B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 17:07:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prgjm-0004Qx-JR; Wed, 26 Apr 2023 11:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1prgjk-0004QC-30; Wed, 26 Apr 2023 11:07:16 -0400
Received: from mail-vi1eur02on2070a.outbound.protection.outlook.com
 ([2a01:111:f400:fe16::70a]
 helo=EUR02-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1prgjg-0007u8-LO; Wed, 26 Apr 2023 11:07:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyJk1XPOcot47e7w7JkeC7pVt0QN4mo+rKnt2em/4ynpj+ubzW49r6Ct9svWZapanZNLNRNJn3DGMJLl2SuE21cw6/OX3CS3w255DBg3crGpUge4dtfMjvbnCT+JdORL8y2aHLvWhjxiVbfXgsC1yUrNCYjnJEjufnJFISjam8JPEVlgVzv5otKUcHorOPXbHxblO3C4feXC42pUK9WlS/HCWFtNqEdevfOZwGw0kqsrBj2JIzQkhLEGg5tAyRw/xOfYX5ZZ8IZn/SAYnMuk5Ge3yoB7zK1SNknf08H1IGqphdq0FvYDFe2Zi2DSYFUEQXiGAUPfXfnJctubMU146Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92I+8K1BV4PDzQa++EcBiwkUgvpUpZ4fhJSTr90fj4A=;
 b=fE5HOy1/Z5D86Zc17qmv0+j+c2vth+ExZp/mgAKjsVFLADVyNyr+6ixpOkh03Ia5O4cQXugR+n8uJz5jWFwp6sVJBbp6SxBK9BySmQL386JXvXMqY+06iLLYe2uH5cS2fQy+LdufBaWfyptRjVXSUPN280RfIKolj5FHicyGAxHQMaY0jIowP4KA8dS/sP3VWD6aOOci8X6sTgL4gxW/7ANFiI0cMwPB60hAA/snyhYEOCcgAI6sw4eUHY4S8n+gk4canYMsP/AWHlsdiURLRembgy+yLnE8KfOxwH4uNXua7H1AmXkyy1UEKNDnN/KWVpEBO9R7jirRfS2AInh09g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92I+8K1BV4PDzQa++EcBiwkUgvpUpZ4fhJSTr90fj4A=;
 b=v7DC5xS+7TajdJBXKlgVpSnzNAASij9Xvtw15g3YjkskuyBN7WDHiYfvmptebU83PKJkCL44C6vfWBMHJ2Y8dzBPW7yOxccgUkeidSfRLE2tOtwN++WleLXONxxA0MU8Jh4MYDPbiQnSzhALlIIbASjWZCDypeITGjYt0g8FjgGGT5cVY1kHosDLN6AJhEPKieyNKXyq7eIw72mMC6Bmd2qtzDPScviWUhq27FzDXUO3bNYeF0IqY3iXPYDObOhvKvA6ULu5nQh3dlaXtQKQf7MnOTY7tZyZMv4cW+YnKidoTaVZXhY60ioPZTWx35Q767L0MR0njUGzxl3/ku48WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM7PR08MB5367.eurprd08.prod.outlook.com (2603:10a6:20b:dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 15:07:07 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::b50f:b94:a801:adaa]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::b50f:b94:a801:adaa%5]) with mapi id 15.20.6319.034; Wed, 26 Apr 2023
 15:07:07 +0000
Message-ID: <e865f9cc-82b1-cf51-5673-179e4b91fa64@virtuozzo.com>
Date: Wed, 26 Apr 2023 17:07:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 00/12] parallels: Refactor the code of images checks
 and fix a bug
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::16) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|AM7PR08MB5367:EE_
X-MS-Office365-Filtering-Correlation-Id: a9330f17-5e9b-41e7-e003-08db4667e6be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0OZk7Lv5Qw5DAH/ptVmrvEVzMySr0/IwZSXPjBaTodFwn+inWw+N/0p2PRZRMhtWzoao2miDUKKmttnH66p3Qxta0+ZVJXOa8aOdUgTIjraL6GlC+3vGDd4I3eRNphkQ+bfX884meZSUFUfa8afqC66hB7hrg0dT22D8NpKEQAur0bbBHbYQ62ZxIieilhub4Kkd1hQ/ouwiy1V62F1stevLGXpxLrJ5qavcgji9orh0vzzcPKW8MMO51jPBobDwhKTWQ3GMysup7dPWTUqD+fpoKy1b48KvDsBGuJ2nya4dNnpGhEwKESI7Olg95k7WVhqafZMgn7Sbg7ScSbj9kkqJn+g563KIToxOK/TAC9QmNgF3SjUXkDIRpJANwGv5sNcMAhjUOzL5i3Sk/BNFJSgyq+KNHhHy5Va+PQNVip3KBi8r43uA/UE2SA5Ao11rHWadmfMMzcXGr1qn3hlwavigr9lYUplcacYcGZI0rmUiqd4nkI8CPXyKdsHC0WzNB85/6U0J1CbXSU+THkDrADrl5eSB2Bk+scnIsrMyx2UTIszoA1Z/rarcvG1hX9VAJPg+Xv4Ew1JoYuC10qX5CTuX4vxp+bh5YZGRNg/9VQgh6p1M0Cp+rU5fHtUkzOnzEy0dX9e47sCUYtMZiS/Z/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(366004)(396003)(346002)(136003)(376002)(451199021)(83380400001)(31686004)(478600001)(38100700002)(5660300002)(41300700001)(8936002)(8676002)(6486002)(316002)(36756003)(186003)(86362001)(2906002)(2616005)(66946007)(66556008)(66476007)(53546011)(26005)(6506007)(31696002)(6512007)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blZucDREMEFPR0IzWUZtemlxMGxIYk1LbEdTNXdXS3VrMDZUTlBmcUFVYXNE?=
 =?utf-8?B?NzJvb1JYbi9ORHU5UzFBalVXV1VXNmQxNW50cDlRaUpVNzY2YWRzNlBlRG4r?=
 =?utf-8?B?dTN1akZIUEZ6TnYrSXVCdFhkQll3S2lRTU9aTEZlaHVuTHZKZnYyTzBKRmlm?=
 =?utf-8?B?djhiUmx3ZXlYMGpLUy9xT0cwdjRaOG9TU2lvMVZxSDlkK1RyUTRKeEZQa082?=
 =?utf-8?B?SXRxUW15TFNBWTZ1aFhUUngzQVZERmN3VzBtNE8vUjJWZkFoeVZKRGs3c2Fm?=
 =?utf-8?B?MTU2azRTTnJPMSt0L0swYnVxZUJKUFFVSS9MZkhZQXRTSS9XN2t0cUdIZzRQ?=
 =?utf-8?B?RnhGN1I4NkdJYWlJbjJ1Yk9mU1RuTVdmMXpzWnhlYmd0WjZ3cDc4cnFxcU0x?=
 =?utf-8?B?Z25hYkRzNXh3UGNrclpFdENmSEFwc0wzUzZicVRJK0dOcE13aGozaC9hNnM1?=
 =?utf-8?B?NmhkZWhaTENpTk5PczByTzFzTndxbUgxcTl4V01JNHRDMVBzc2dXbGtub3FO?=
 =?utf-8?B?SGpaalUxY3VzU0ZvWGMrcithM05mL1ZuM242KzVLVUMvVEl1aDZHWlhzeTlp?=
 =?utf-8?B?b1lVYWhMUjRRMEg2Y0FOK21CZFZzS1BTa05MQlNEWEtGLzhwZDk1U0FUNGRl?=
 =?utf-8?B?Rk02RjVURnZwSG85RHVpNnpCRmhZZlkxVFBRem9LeGtGQU9hME9JcXFCMjl0?=
 =?utf-8?B?REJhdnM3UmhyTnptaWZKd0s0d0JrQjMxWElBalFCYmF0RXBnSldkZjFVMzM3?=
 =?utf-8?B?VHhxWlpUOW1DVUhQRytuZWp3S2xOOWJLWVNOOXlkOVoySlQwK1hsamFPQVdB?=
 =?utf-8?B?QmpObkdLWGdtVjNLbXpMRDk5SUFHbkY4S3VjYm5leExMUkJpWDlvd0N5dnRR?=
 =?utf-8?B?VHRaTmxRZUJGU2Q4NmJIVDViTXliTmk1SWFZOGVBTlpKZG1ZMXkwRTNTajJC?=
 =?utf-8?B?RnQ4R0N6elorcEYrRWlqZ0tzZnhhZndhRlVaTEgzcjlIZlVkbHpTYjlvUHpK?=
 =?utf-8?B?dVZOWkJ6RVpLblVodVErL256OG5ZaGVBR0xYdk1QeVZTM0twcHNzZ1RvYUxw?=
 =?utf-8?B?MGprcGNaM0M2bC9mVXgzNXpiWk5WQkNlRVgyclk1OEo5a3B5VjQrMVNpMnp1?=
 =?utf-8?B?WWNwUUI1Uk4reU5wTVo2TlJEdnh3aUJGc2NPYkxvenp5QnQwSTVEVi93Q1dq?=
 =?utf-8?B?Ni9zVjByTU5tSGhnbkFpeU1VOXA4cVdkTHhwMHRQczNjWTZZcDJhWEtMSURN?=
 =?utf-8?B?WjZ6akV6WFROOWpBWitIdFY0Qy9nMCtHVlB4SFFqdHJHcEpEd0FpN0hKY25j?=
 =?utf-8?B?eXhUaHM3UDhleWtJb05yOWhXZFFBKzYzd0UwblVBeW5TRVlLc2FmWUwxcTdq?=
 =?utf-8?B?MVJmQ3NROCtrL1FJeDNJdVVPVHdXZHB6MGVGdXU3V2VpVHlFMy9NZnhTNkha?=
 =?utf-8?B?dXRoMlorMnNzYkRCRGlNd1p3MFc4NEcwNE9GTi8vNXBtRDNXekxRNm00Nm1H?=
 =?utf-8?B?K25jK3hKVGNLQk9uVExmanFSZmJXVGlGSGdrSjJIN3lkb0MrWCt6bERpeUNn?=
 =?utf-8?B?S0lsdWhOU1ljUjNUM05RK0tmaWVaTVNOVHIzWldTWjh5bEZ6WkY1blFjRVBy?=
 =?utf-8?B?WHdleGV2UnYvWElUc01TaWxVYVJ1WkExVTFzb3Fab2cvV2hRb3piWTNwTEtD?=
 =?utf-8?B?cU5zL2RrNnJscWplS0hsZlRKSlVsbER4Ky9IbG1IdkdxK0NQcWJtOE44eUJn?=
 =?utf-8?B?SnlRUkVpVUh1d0EvZm5FdU4zR2VJOG1mMjBFaUUrRFNwN2xzaERUY0VXWjcr?=
 =?utf-8?B?SWhYZSszVWpqWWc1c3lIdE44TUxXdGZuUHJkNjlPZUFUc0ZRMTZ5ajJDbU9l?=
 =?utf-8?B?YmxxMDRiQ2tmL3pCOTM3alJCZWJYNk9vSWduTzZwb05TWTNhMkQyV09YUnZs?=
 =?utf-8?B?UEFkdk5QdXFLZHZVMGpXMzRCeFhXQzdFd0cvT2QxeEROTk8wdWU2WVNyM2dT?=
 =?utf-8?B?bnQyaWxFUWwzSUJYQ2dQZFdiZU0zRkJBM2E1NUlERllHQkk2dnRZOUV6Qkhr?=
 =?utf-8?B?dUx3Z2ZwaEhEeVk5QVFpMThoc1ZpN203NXhQQnhyaEZJczNyRWJ0YURhOFhu?=
 =?utf-8?Q?7wknjX/a2YctjqcqzqpMTVwBZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9330f17-5e9b-41e7-e003-08db4667e6be
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 15:07:07.1716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NjayuXe0XTLswHcEotNg9COvL9xSfpixXKNCr14RXtXkOaBjfj1qgOPhNYSqHTSQG+EFSiorQMkUZjjJpfPtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5367
Received-SPF: pass client-ip=2a01:111:f400:fe16::70a;
 envelope-from=den@virtuozzo.com;
 helo=EUR02-VI1-obe.outbound.protection.outlook.com
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

On 4/24/23 11:31, Alexander Ivanov wrote:
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
I am a little bit puzzled - there are 2 series v11 sent within
15 minutes. Which one is correct?

Den

