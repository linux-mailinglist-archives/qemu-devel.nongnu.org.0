Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C46371491
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:50:12 +0200 (CEST)
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldX5X-0005Tf-Q0
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldX3o-00049h-1d; Mon, 03 May 2021 07:48:24 -0400
Received: from mail-db8eur05on2120.outbound.protection.outlook.com
 ([40.107.20.120]:44416 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldX3l-0007l4-VQ; Mon, 03 May 2021 07:48:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfAxI0Ktq2jy/ohTsasCyJG0xZKPHdEaliRWGLlG+v+M8RxH7Imz7Vba4UDDKSoToFzFAt7gD2jMI5ApS/tLraWkSnxzrXQJjYD0tS3nhFWZgbKtJvyIZf0Qgu6AGuMzMHMjcZKbgQWHIekQXxCFWVkPk2YXcjwbPzRE1A0N6DVU5ADvG6JRJfoicvMe96b4iZrXpXU3CCSlDkep+qdImnj9PkBEoTMW+j5yJlsmWAP0Y2TaHKSfXYg17ewArmgp1Gp7Zp4qZDkUE1Cap+upxjtzmnayrSAWkEsTW45OebQV6/tbzkuEc8d/z3oeg4jMC3mkl3iB2NUOuAveksil2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTz16QkzgMdb08WPnQ+sMQX1XQ8mTpEj6GhUITJPDsE=;
 b=anZJcSPjCWvtkGPzc6hRGeJ4yJCGhFahbW87/cUSiSVJOI9idiUJ/t2mhzfyMh2DB6MGuAwBi+ppH1edJgqNEy0mxrYfpQ35W7RJG2M677pNGeKlfNvsb73zrYqKHIkfrb9en0+B5fbaB4s2opMNvN9UEt3TDj49p8VU/e1VuFSK/Wfy9CkF6BifDnw7Ijy/MvyKTTWm5DIskmSC+gwBgbJ/6E2cFxbElwmJTKGV2NzKi38J8kL3V0oSsEbymOF/Rl2rR5qcUG9pte0TIN9iRorpQv33UmFMGq38NYqkT9GxuEgoITGW/gRgSD9N/OV1cTOdEiNQprAgIe09l9Pd+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTz16QkzgMdb08WPnQ+sMQX1XQ8mTpEj6GhUITJPDsE=;
 b=OfvVygbQLNZ28HM2Io4bww98GmBRK4wNwBKpseYTUlxiQtNb7cL7owUBv866ZNyAMk8/YcewRylkh95KMaNh6o4T1w1rUN6t3CgYeSb9v+C3hazKaWB0IYKs8TL4D8T3pVOwwhlfgTIl+VovWZzBBPqgDI7CwOP6P9OOyJw5Av8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Mon, 3 May
 2021 11:48:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 11:48:18 +0000
Subject: Re: [PATCH 4/6] block: improve bdrv_child_get_parent_desc()
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com
References: <20210503113402.185852-1-vsementsov@virtuozzo.com>
 <20210503113402.185852-5-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <630862a9-ef69-4bea-d6e9-6a8c086ed159@virtuozzo.com>
Date: Mon, 3 May 2021 14:48:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210503113402.185852-5-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: AM0PR10CA0096.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::49) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 AM0PR10CA0096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 11:48:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb66a8b3-5095-402b-cecc-08d90e29580e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-Microsoft-Antispam-PRVS: <AM6PR08MB46911B7E5637A8D9F3F76ABFC15B9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nNFxJ1TWkWDTssansw6xXoFp4MWTpZLPj/q0KcUDKaUBNNxnuUZoHcvXPZptim/dxkFMES2B+P+E65h35JS4FwadLhHFc/2WV+GEHt84+YsO1rX4L9UPKfVzDmXYR8GkxY/3VvOnEo/0heRgrIJTgYJJgTSaO/lyd5Q42CdI52JpTUipNVO+HQb4rd65MJVnZ1o7fDwaQZEYYfEbaj+oAssADOcUreoflfeGt3aT0fr/q0JAFPisd9JW5l+pagtQ5SLWJf5lgmWnrA1voj20dM3vwhW5/mTFvqn3RNtn1O+UGj5IHKVAUeOjZ/zBsQvCHRsQwxmjHj0wkBSh+0xmnMjCWkara69QrropYt8eb41T4WqmH3OIqMuOQ9EvnXWnKtb48c+gIjX4FC6bf/9iOa+dk4h0gepspSxnc8XzHiFKJAF6O+7AE9OlhZj+oflO07FD3TwZW0tFGYpcn8DfCVdKshn2skhMtbFmS747R8+lecc1jugAOYxresiz/qjWfnJYcsBnWMsJZt9bcLGlbkoGF1+c7Z/34E1jz1uNLbQuyU9TAFYZ66ADxfweEsQowbDk8Tq7/9te/ViPTig4Q4pRA29uCxSSRjl4Ertcrmj9qDdL+KzZTHDCL3sO+mo2tmuU+X36d3gHwD1kevBtWPghb8nT1DkBEu9qx9QGgBHQB078MuJYoqbn22AEaOLzTh3KTieL3DYBdXu1N83YGI8S9HKSAflWmIdbL4BMRjA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39830400003)(16576012)(8676002)(2906002)(956004)(316002)(4326008)(8936002)(6916009)(5660300002)(186003)(16526019)(86362001)(83380400001)(2616005)(26005)(38100700002)(38350700002)(52116002)(31696002)(31686004)(478600001)(66556008)(66476007)(66946007)(6486002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q2RjU0RETlI1RHpIV2phUmlPTjkvUE0wVEQ3ZEx1V090U2c0SCsrNnBYMnZt?=
 =?utf-8?B?OUpjTHV6SEZGMEY4eEswMjVEbUE5MDVLK0FuRHdReUlYd1Z0UExqaWlXWnVw?=
 =?utf-8?B?eUk0WUlRd0tKaUhrTlhnUDVxejdtajdCYTNrclRBYWxFK3l0TGRyYTZiZis3?=
 =?utf-8?B?L3Uwb1k1bFZvNnMvdjNhOUJKdHNpRWV2RWNKaVNGYXFpeHRvVzBMaDErcCtL?=
 =?utf-8?B?ZDRyOG92WCtBNnNaSjQ5Tzl0czFsdVd5RkI4dGZ5cmw3OXd1NitLalVFSG51?=
 =?utf-8?B?bUl0MUIvMzM4ZWtHWVJvKzJxQlNuVWZ4Nno0Q25aWEZicDhTWXdkRUtlUGlS?=
 =?utf-8?B?ZFNMQmtZQkFod2lyUG9Oc3p0ZlVrazlBTlJqaEZBb3JxbWl5MHlieXNFbENx?=
 =?utf-8?B?TUtSc2ZXeHUvSEFKVUwvcW5EaHlYUnlNV1EvaWhkV0VrNWY2dS9CZGd6M3Rs?=
 =?utf-8?B?NmZmZUJiczhWNEcyZVoxc2dnUzI3L09ZK2Q1NzVTdzJUWGEwS3U1bUVwYm5I?=
 =?utf-8?B?YnE2M0FmamF0aG9XQkpZOFptZzlQczNNQkxyRytTZDM0bWJDaTg1c25RNUVl?=
 =?utf-8?B?L0dyS0ZNSURheU9nSlRnK3RtU0M2WXRLVzhUb0ZCYzNrU0dTaHp5NmpzdGx3?=
 =?utf-8?B?U3BuTDNGVysrd004SXZSOFIrVGs4SEwxeWU0SU5rT2tHbGtqaFFVc0J1SU1L?=
 =?utf-8?B?Nm5hNHdQSDM5REFBS2NHaEhiajV3UUk4dUpwQlV2Y3hndDhXcmpKRXhSU3Vx?=
 =?utf-8?B?QTQ4Sm1ucG9QOFA5bWdPajMxZmk4QkNaa3ZZYU1TUitZTXNUVE1SRW45cjRT?=
 =?utf-8?B?TU5wYlhNUkJzZllMWHU1WlQvNVpneWhtL1hRU0xCanFjQnVTemlIVWcrUmxl?=
 =?utf-8?B?OUVGNkJTRXphNzBZQ2lNYVUrWHYzeWNJb1F1M0xoRXJjMllpTnpyVStkQnNS?=
 =?utf-8?B?TlBLNVBvV2wrUFQ3bjVudUdDSGFGWDh2ZEVrN1JhUTdQeDcyYmNXa2xEWjRv?=
 =?utf-8?B?ZDZMRDhHTGNtZURUL2psT205L3pSSXlBVmF2QzAydlZ4M1Q1SkNFR2U1bFpF?=
 =?utf-8?B?TXZnOVhqeHBmOGd5OFYxTUJBcDVIYk51Z1VwdWxaZmo4b2NtWUZRRlpwSXhY?=
 =?utf-8?B?M3o4ZXZrZjhCOWdhM0JnWWZDMjlhYWxHM3VGcFRtT0hhR1pkaVdsMXJpT0t1?=
 =?utf-8?B?QTdaZnljY0xiRytHTFJBL0FlZGVqK1FmWldHSDkwNm5PUUZ2V0hLTHBFNjRt?=
 =?utf-8?B?U1pmcHVjRVEvcm1IcGJ0ZlVKaHZHZG1mZFRTU1FtRnBpWkZmd3VSZzRSWEtU?=
 =?utf-8?B?bDZuaHIyUS83eUdhRFVWb05SWFA5TmdwN2s3czdSeGdQa3VnN3RLamJJMU12?=
 =?utf-8?B?NGJFb3RyYmFhaWFhMjRST1VRR3FNNE9CeFlORUNaWmh6d1lsRVhBRWN4bUEx?=
 =?utf-8?B?Yzl2RlIwaGd3MFMvNlZZZ2NJY1NQS09ObjJrNFpCV0MxN1FXNDBIQm5rcERW?=
 =?utf-8?B?TGhMMHlpZHJYUmt6TzJ3NUNOdHFaRzVncXVja0FYSXR4RGgwWVRmTC9NckZY?=
 =?utf-8?B?SVV4M3Q0cWNKelpFcXNyMHovaXJrcHpVUkFDUks4OWZaaGlKMHZ0ZmhJNWJC?=
 =?utf-8?B?Smw1UFRBQmx5Yml3aWMvV1h5dWMxZDZ4dnZXQi9FQzBKTCt3UjN6WDJoNTIw?=
 =?utf-8?B?YVl4QUdTUXRSNjhyTHdPY29YWERWcHNRUEFncTFQdCt3cWdzTzJVaVlBeFhK?=
 =?utf-8?Q?WdPISQ97UlXVt5+wGoEzgafk6OsMbG7/yXBlbH6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb66a8b3-5095-402b-cecc-08d90e29580e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 11:48:18.3986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcSTTDOGYyWVEtIuJW9xLPR9b6ts5OVHAQXZU0pRab52FKy9H6Nt3qaVgzH+x+vHmB96VxwdtLowR2R92+QG52xRsSlbTiCkeYrHRSasX1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.20.120;
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

03.05.2021 14:34, Vladimir Sementsov-Ogievskiy wrote:
> We have different types of parents: block nodes, block backends and
> jobs. So, it makes sense to specify type together with name.

I forget to note the main thing of the commit:

This handler us used to compose an error message about permission conflict. And permission conflict occurs in a specific place of block graph. We shouldn't report name of parent device (as it would define another place in block graph), but exactly and only the name of the node. So, use bdrv_get_node_name() directly.

> 
> iotest 283 output is updated.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block.c                    | 2 +-
>   tests/qemu-iotests/283.out | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/block.c b/block.c
> index c4023ab4f4..1de2365843 100644
> --- a/block.c
> +++ b/block.c
> @@ -1160,7 +1160,7 @@ int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough)
>   static char *bdrv_child_get_parent_desc(BdrvChild *c)
>   {
>       BlockDriverState *parent = c->opaque;
> -    return g_strdup(bdrv_get_device_or_node_name(parent));
> +    return g_strdup_printf("node '%s'", bdrv_get_node_name(parent));
>   }
>   
>   static void bdrv_child_cb_drained_begin(BdrvChild *child)
> diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
> index 97e62a4c94..c9397bfc44 100644
> --- a/tests/qemu-iotests/283.out
> +++ b/tests/qemu-iotests/283.out
> @@ -5,7 +5,7 @@
>   {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
>   {"return": {}}
>   {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
> -{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
> +{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by node 'source' as 'image', which does not allow 'write' on base"}}
>   
>   === backup-top should be gone after job-finalize ===
>   
> 


-- 
Best regards,
Vladimir

