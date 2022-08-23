Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE55D59D6A9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:38:49 +0200 (CEST)
Received: from localhost ([::1]:44364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQMy-0000zt-TC
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQL5-0006Qa-MN; Tue, 23 Aug 2022 05:36:51 -0400
Received: from mail-am6eur05on2138.outbound.protection.outlook.com
 ([40.107.22.138]:27873 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQL3-00070k-FY; Tue, 23 Aug 2022 05:36:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czBRe4k1j90hwK8EZxiWqVF4ioQunqDkKcYW0/bycI6iD76i2XZDe4racXBsSTJLhdqeLt2jBud1+orksKnTbuKYPUzxoY4yNzJ4R2pMuibJbx0UJIZS5/bslW1+E1PbP8XVjOFYjw1tB9Qvb8g8O4yuNwxeZkP/c07XIPv5VlCM9ZmgEp3QD6T/e0W6Z6fPglRJT6NNsXewz8YppWb3ja7BUWdV4SI7hmsFbC373a0M0+CLjzeYtxC0pir33X2S8Xn/vbuNt0HzENsy3tCUU8Jbytzo8KTxuYafW/CmgwhP4WvkRJDV70V1AJKDwZooZHphMJXri666sXYyQypKpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swUlBdK+PUqXopq8LeCerbguxHqdw4hcnq1EcjTyWtc=;
 b=iWEN0dCt4jQQNj0LkCcxSuTi7lwFrCbTF7lOVrDVMl190DFy7iyIW/tuD5122idAeRnFNZWK6y8zwcm+8vgDNPP5M+s1X8DP403JUoGlxDUxMIOQWmBrMCVzTHI5NtiJZmpmcqZ+0K041hCdDdLvlgcbStkAfjf0DOcITNQ3lEunAFnCrysNMsj7e389k5ETIeQxqrlcvRUI1lp1D2frq+N5FgClnCzT6wwhVaUs0a84lGpwX1V7zLAxnM+vgaZAnMw7SzK7f5WBFlB+v4b8HrlpKeVaQAdtpYHK2q5+1BGzej2tBrl9rtmY0gPA4Bf5CZ/s9huLiDNP0VDm0sYRAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swUlBdK+PUqXopq8LeCerbguxHqdw4hcnq1EcjTyWtc=;
 b=C9wLGbjo7dRPOq1XZburXx4fsxpmPU/9WRl2G4XJ9Yng1FST9DkXxjmGNPFO4+eKOzW9jW/IL5WPYgc1RE2ThsG74EtFX9z3457bioaw58u/0rl6Ra/hHtifNQcKE23SQ+kBEQnGXeayxOGXjzzpUTWcCiGHNjFb7agApTbPnFG0EgrF6d6MAxs3V/cPxccbI9y6EG8q+TDrLE5wdxJlFRkM3KJQS6kMpqYgoxDg7pTI4LzKtbDEFz1giJ7nMpR332RAE5/Nw1QzqihGAisbPEWSpa1QzRPGpXbi6IrYX/NNTA2ow1oKAsIAKKpsz8FmoBcpGd2LOhvK+Q5KPAeIvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VI1PR0802MB2287.eurprd08.prod.outlook.com (2603:10a6:800:9d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 09:36:41 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.014; Tue, 23 Aug 2022
 09:36:41 +0000
Message-ID: <acc62d4c-cb42-091c-5045-f4c9dffb055e@virtuozzo.com>
Date: Tue, 23 Aug 2022 11:36:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 4/9] parallels: Use generic infrastructure for BAT
 writing in parallels_co_check()
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-5-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220822090517.2289697-5-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0077.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::18) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5b18e79-90b5-4d35-a270-08da84eafc09
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2287:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6JfuspCF3M9bWqIEw/5jNLGZz3nmyMnIz8KoSzEgktJwCd3K0f072PDkqAeFmtaogreazNPkJ6zm/OajPexeoMAdkGrlpFto2Q/fpdn2Ag1A60KaLTD5f4rDJ3vK7I2li0eOHEoZeXVoY7EEpd2itnJg/qS/8Wj08iKeadISyOx2+oW385xtQgJgsKsV3iMWk5YWg1SMNwlCm6JINHcvpSScMV91kffYKWikRfYbH4zVmBooa3LEUcUUx6MC908Ul8Vu7HdL0Y6DiKXlQHcKboGAM6u8QWwUOEVcDp7Vu02WZLG+vbe/PPIJs/k9ZkYwnzw8jFcxkvMuvarY719HRcFlgAwXooWQXiLWcdfXz3OWJ+/wj3iDezNvwIkVO/108ekQMXiZ/ouLmnpMxuOMCPjYClhv4T9F9h98TTJdQA0LnSmVNdXF2PkCWwF7dAdTdSVrTav7mi8R9uK6UIzClAU+rWG+LneAotaG1Mf0XuxLeSLtYuhejedLiXk6zIonPd3e99DJjxPvtdQfE6wsiqncURLyLk9J1Npm+X4dnaRI5f6UF+9wDUdgP1gfJ8p6W8JvaD3hxZnnzamSJBKg2UDrn88BoCrW1YgEFtRECF8fj2SkZv3YUD6aHfKF9aJVwvmVJeaPtbh9DIQht8pPoqJmfuKmv0KlQJ2DfWgDScp16HDggTE6+SM6mIo/Fog3ud7paTEAsG6+RmgRB+mTsIN7n0mCj80I/6zm0mZ5qjb1KOp8ps9DohkVjosBJSHFWNMXjjqfoqWwaQtqdMeYlyo4Wnjr1P1S/TR1pJQFoMWHWmYRcdO2EFEA3aytIBJl4s8YF/j/ZU6nQsuN+HosVnM62gN+izHTgapmSRAYlHk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(366004)(39850400004)(136003)(86362001)(31696002)(316002)(38350700002)(38100700002)(5660300002)(8936002)(66946007)(66476007)(66556008)(186003)(8676002)(4326008)(2616005)(478600001)(83380400001)(53546011)(6512007)(6486002)(6506007)(41300700001)(52116002)(26005)(31686004)(2906002)(36756003)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjZ3anFWUFJnOGNmdjIxSVdQemJUQW5GV2dMdUhkcFBSRzJCQ1VXNStxNTl2?=
 =?utf-8?B?SzdwcHNseDBCSVNtaHpSWTZ0UU9VQ3dCRzQvQUZqOFNLTkZJcVNnNkFvdDVG?=
 =?utf-8?B?S3VKM3phaXFFbVRCcFY0dDJGc0lqQlY0dmZ6eHdoNS9tYVVXUjdBQkFVRzJK?=
 =?utf-8?B?Q1l2SlZqOHl6N2Y2K0h2cW1ybkNsK1VsL0lUVHJJOEFid1NON1dZVWxqeGp1?=
 =?utf-8?B?b295RXljQVVPeGxCVWxDU2QrOWhMQmVJZ2s4STBPZTVSWUw1aDNaK1ZhODJB?=
 =?utf-8?B?ckNJWDNMQ0c4L09TU20vcDgzRW1JVERTcVVYczZrTUdoQkE3OEVMYnVYejFo?=
 =?utf-8?B?b0dNTFhvUTZ6UFVMNGtrc0liNTlXOUdJbkw4bVdQeEU3WEJEMjV5aHpOZ0xI?=
 =?utf-8?B?a2lwTkdJQy9KSDdvM3l2dHNDVXovcHlFNWUxL1RFUjE2UVVwZmdXelZYaDkr?=
 =?utf-8?B?MnFIMldFT3RZVFljbUhHWGxpNzcxQXNOM2I4ZHZCRmZPbWNpNXFXYTIxWHov?=
 =?utf-8?B?bDhBdHZhN25KMnBmZlNVbnFNVjRhck5KTUNyTWpNbkRERDQrbytFT2tteXl5?=
 =?utf-8?B?aFh0Q0pwZnlTNDNQeHVyZkJLSGM2SnhUL28rK3ZtVFRlYXNlT2w1aEpKS3Zm?=
 =?utf-8?B?TmV5UGRPTm9JMytrUmt6OS9lL3hwVHc1U3YrU3J6NVpxSTZIL3M4NXNZR0Nl?=
 =?utf-8?B?UnJweWpCVmg0VlgvU3VndWpaVGFJS1hTRnZrQ2c1VFdMT0Fta2pRN01tVTN1?=
 =?utf-8?B?cDVxT09xaTcrOXQxeEZMbmxUczQ0VlhDQnRXNVBWMks4dFJEeGtoUXptNTJX?=
 =?utf-8?B?d0VvY0VpUHJwbVloNnBKT1Q2QkwyN1Z0ZmdvMlloREhmeWUyS1k1czlWaVZs?=
 =?utf-8?B?cnBqaG04UUFiOVYvejdPZjZ3cCszR0J1enY4cUZLN2ZtY0FKL2FSd0xYNzFT?=
 =?utf-8?B?SWRaUXhHdEczcTUzcEQwWDM4angvZzQxRytGY1hlcDZGU29ReDJuVDFLVUt1?=
 =?utf-8?B?NHNGN2RvQ2oxSjdjODJvN0kxWW9WNzFUYnA0aGd2MG9vd1ZMcExwUDhiR2U3?=
 =?utf-8?B?blJTVHNwRXdRWXM5d2ZVRURRa0EydE0rMk9CZElOa3RXMDVoZ3NiWEpqeG04?=
 =?utf-8?B?Q09SdTJibEpNaUpscEorNTJZWno2bGtHYXpmTDhjczlPMVRVdFU4eUxTZEZ4?=
 =?utf-8?B?NkwweCttZGdpeWJmdDhIdGNVWWpNNUpxK3drTUltTXlhS05MeVhKL0V0WFhm?=
 =?utf-8?B?TnRQNXFEOEN6cU1jMk1QU2dxaFcwOTR6ZnB2ZC96Njk4b2VmMytLdkJacVBI?=
 =?utf-8?B?Smw2T2VSWmE2RXJwN2o2azkvaTYxdDc2bnltVDIxNTF0ODZQb0U3NTZhUmVq?=
 =?utf-8?B?eXBTTW1VcFd0QjhlMlJXVXdnUmt1UW1FY0JKMElkWjJEMGpHSjB6WkZQSllv?=
 =?utf-8?B?TTB3a0lrbzhjZ0xVdGJobERHVVpWcWlHMWZMcitIaGRwR0VGWk9XUjYraDEr?=
 =?utf-8?B?UGR2TDFVVTZOUlg0cjlhaTZSTGhxTThaWklmVlB1OHdlaEVlUlRrU3BxUytJ?=
 =?utf-8?B?bDBGWkZrOTFIa1FxdjkvRGNkeVpRMlY0MGdkT0xQekU5aks3blIzZ2pFamFy?=
 =?utf-8?B?a05RZTRPQWJ0cUQrVXYydElEd096NzJPdEtnTzFwa0wrQmZpeUR4SHJ6RmRs?=
 =?utf-8?B?SkJYMnlMRVpoUytnNzAxSHVoSFhBVWNHUDhRb091UGY3ZXdHd0UvYXljZVlJ?=
 =?utf-8?B?VjFKMHRnL0ZzRm0wUktFcnZMK3dBeGFocnpXTzA0bGlCQ1YwdDQ2Umx1ZmhU?=
 =?utf-8?B?enAxdkVvdkJGaTlPRkdvMExCVW9oV1c5cHZYZmdQUTE2KzkwcTlBemVEQm1T?=
 =?utf-8?B?MmFPdGo4VE5VeUpGRUJSSUFiakxReU5Qc3VFeHlEWU1EMktBd1dNMmc2Tk9C?=
 =?utf-8?B?M0tBeVFNVVI0bnhNQWZ1ZVRHcWwwYllYYlBMMkZYaEtKSDlPek9LT2YrQWFG?=
 =?utf-8?B?WlhUMXNlTWw3R2N1QjIvQk50YVk5T2JrWDNxQSsvcXJ0OXkxL00zanlmOGJC?=
 =?utf-8?B?U1FVTmhCVlJFcVZkMjYyZExSZGlyYk9yekxVYWxnVEFPTjVBWGlmcTRVT280?=
 =?utf-8?Q?deIzPK1j/A+YHjKKpUOOr4Jpq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b18e79-90b5-4d35-a270-08da84eafc09
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:36:41.3768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQVcyV8ASc80VO7e72OC3wtXuntvt3Oem6i4vrpKwLMOzGcA+FWE+KRoZnyvoMYhh34Ans/apwwYzRJk+l04IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2287
Received-SPF: pass client-ip=40.107.22.138; envelope-from=den@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 22.08.2022 11:05, Alexander Ivanov wrote:
> BAT is written in the context of conventional operations over
> the image inside bdrv_co_flush() when it calls
> parallels_co_flush_to_os() callback. Thus we should not
> modify BAT array directly, but call parallels_set_bat_entry()
> helper and bdrv_co_flush() further on. After that there is no
> need to manually write BAT and track its modification.
>
> This makes code more generic and allows to split
> parallels_set_bat_entry() for independent pieces.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 23 ++++++++++-------------
>   1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 8733ef8a70..357c345517 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -425,9 +425,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>   {
>       BDRVParallelsState *s = bs->opaque;
>       int64_t size, prev_off, high_off;
> -    int ret;
> +    int ret = 0;
>       uint32_t i;
> -    bool flush_bat = false;
>   
>       size = bdrv_getlength(bs->file->bs);
>       if (size < 0) {
> @@ -466,9 +465,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               res->corruptions++;
>               if (fix & BDRV_FIX_ERRORS) {
>                   prev_off = 0;
> -                s->bat_bitmap[i] = 0;
> +                parallels_set_bat_entry(s, i, 0);
>                   res->corruptions_fixed++;
> -                flush_bat = true;
>                   continue;
>               }
>           }
> @@ -484,15 +482,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>           prev_off = off;
>       }
>   
> -    ret = 0;
> -    if (flush_bat) {
> -        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
> -        if (ret < 0) {
> -            res->check_errors++;
> -            goto out;
> -        }
> -    }
> -
>       res->image_end_offset = high_off + s->cluster_size;
>       if (size > res->image_end_offset) {
>           int64_t count;
> @@ -529,6 +518,14 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       s->data_end = size >> BDRV_SECTOR_BITS;
>   out:
>       qemu_co_mutex_unlock(&s->lock);
> +
> +    if (ret == 0) {
> +        ret = bdrv_co_flush(bs);
> +        if (ret < 0) {
> +            res->check_errors++;
> +        }
> +    }
> +
>       return ret;
>   }
>   
Reviewed-by: Denis V. Lunev <den@openvz.org>

