Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47033D5C03
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:43:09 +0200 (CEST)
Received: from localhost ([::1]:58092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81oy-0000Sh-Ky
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m81nx-00086A-4U; Mon, 26 Jul 2021 10:42:05 -0400
Received: from mail-eopbgr30094.outbound.protection.outlook.com
 ([40.107.3.94]:13966 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m81nu-0004CE-6Z; Mon, 26 Jul 2021 10:42:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsJ9pUoXjtKC6/08MDF8EyuErAGT+MF8eSEY+7BD41VNQ4btGc5cUfVHQ9Lffhsglqa1ewbOZEdgFf6eSuh3zIH0aPBY3QpleyCP5zqRy0HWeQ2gLjdLhsyQJMTVNJxlHIZ6kncS2/qB40SuqRTmi884TdUIF2XbiAfxNYAjP0twSRn0JrUZvmXsmhZpisW4GqyXiZcPcDiAuOwQEOZ8smvXDyM6DNNbdlK+tELlvNJI9I0+zV3gFxgExIZe46egjSL2MMprR4vtIkwzRtO6uTIgPk5n7HgyUT8aetIkksuFRgem/TrWrTn8QwdCjaaE/NIUScZaCbp5yK+fvhRV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKLmoX2UH1GxXIAX7WkBV6aMvTCSfyJLjCZV8yKZbmQ=;
 b=JT97pLzaTpovgwHX6DuoQ+IQzfB5JxvbW5ahkQ2yiN1TxLM/UsENjCvjlua2Cac6zpDEKCSC/SjGjGQo6bgmOjkZ42CLGmg8OH/7+CK3OTHkw0vGvTQ7wgd9sEEKkcGHq30PQQbeSYLGB31x9kmNZh5UUOQTZWJY05QGfVLSe1xcySHh3BPT0E697B2jx1700iwuR1OMUxjf1H8OV58Z8NHZ0+WUrl0MNXje9zU2uui/JxCCC4fKic4mD6cFwO5/GJGfmP/NwCzPpc2z/YTk9EZiyGKLB/6vQ0q10BiVZ0w2weB8WUUAqWTrr4YtN0pBAU//FdTaJFuguQDscau8Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKLmoX2UH1GxXIAX7WkBV6aMvTCSfyJLjCZV8yKZbmQ=;
 b=GXLdY3DTNlXs60PvEK23/Sm2RQwUw13DCaF7T3aXIajBZHU6WVwD2GpiDWgPvE8AXgDjZPVL5upU/XNkvoGOPjqvJpTQ/M9MQRj6nQ8BBEzwhHeF0TG0jvlSIcAkjbGlcpjMB5Vk1VBYbNTkooRX6QaG6GZzoag6exUlmgyPCsA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5910.eurprd08.prod.outlook.com (2603:10a6:20b:296::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Mon, 26 Jul
 2021 14:41:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 14:41:58 +0000
Subject: Re: [PATCH] raw-format: drop WRITE and RESIZE child perms when
 possible
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, afrosi@redhat.com,
 Max Reitz <mreitz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210726122839.822900-1-stefanha@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <57dd2772-352b-75b1-6ed2-474423d7680e@virtuozzo.com>
Date: Mon, 26 Jul 2021 17:41:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210726122839.822900-1-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0065.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 PR0P264CA0065.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Mon, 26 Jul 2021 14:41:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 204bd137-5bb4-4207-2bf0-08d950438539
X-MS-TrafficTypeDiagnostic: AS8PR08MB5910:
X-Microsoft-Antispam-PRVS: <AS8PR08MB59107787D06399D708CED901C1E89@AS8PR08MB5910.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RBnj3AZU/8DDiGZSTg8CFLr7lZhmhjNfFBT9HXr4hVfuA6EMCrL5lQi/XV2FbusEhMzCJtqTeUzZibq5tDG2aPmHvmAcf+8no6lh0DT8juDTFcvu8usAI4H41IHhrTQs7ZfN12XoBrQfcKqJwhy/Mc1jDk6vo6B5VARjLYVjefpw3Z3KVxZo7yHIX5wad5sxjTxbIN0cwXPc1O7ObgQLMY4OAy2Pb8q0Nn3d+HRwmsjhMn60qfhBt9WFyb9G3YcMlW27FmxAqlHiyTCD6LDd9XA9O1QV7WNm8sAlnYn+9hUaoLZFSUrAkSX+yzptZ42PrB4sO0+pCZM7up4bgUpjE/xT8z3obeme+Ul8Vpuhg/MPrbmY/3JRN7hOIS/wu1251mOPgXjc5AJmCuYKE5W+40R5K6HRDfJFFecStMtyDjE6KiPmgfg+6T0YFh5EX0CFssSfLgCmgnPWnm1A7QKJuduo1s0p3NLlFJyS8M3G2/JKLGSo7s3En4McjJZUh5Sqc/fk+xByZuA10P3jfJyt0OZ3qfp99h5LeTgepIrXKAMo2AALtwuhq9+ymoId3kLSkbgIl+iHvxd09Ck/h6m8zsYuFKrpnDU78oD2NH90AbpPV7qeO9N9HfF+FGZlhly56eJVgZpl1BLWoFWK28QNRQG4ev9I2piIIZB1Qad9T9OXTUHxtWGM8GxWzWmMg7mKWQgLlf7TVzY42jVpl90OUeMBWVmm5D84QQLeVJ6dV+rfnzhzaI/F5x9+3FhUB0Yp/2U1Hi134V7uBlT6HQmgIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(376002)(136003)(396003)(16576012)(52116002)(54906003)(66946007)(4326008)(5660300002)(8676002)(6486002)(66476007)(83380400001)(38100700002)(36756003)(38350700002)(66556008)(316002)(31696002)(956004)(26005)(8936002)(31686004)(478600001)(2906002)(2616005)(86362001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWc5YVZ2b1NONTJPbndVTTIrTUVFOHU4N0VIeDJCU0c2blFhdjhnMXZrQU5l?=
 =?utf-8?B?K0JsKzdNSjJrc3RHS3V5dXdDcklQZjBUam8rRWhrS3U2TFBlMGFSdVoyR1B5?=
 =?utf-8?B?YUxjR1NPOWhHOXdKeFA1UXZXTUt1SWYrNW12WlZOeVFoazNJdThwU0t1aW84?=
 =?utf-8?B?Rm5pdlFJZlpmOERhdnY0VmdpVC9UUksyVjBGZzl2TzZzUkhrU29uY3dOQkxY?=
 =?utf-8?B?TXVucU9YZC9mc1dzZ3pjbWlwaVJJeWlCZ0pPYnRXdmdVcldFdWpGejRiYklO?=
 =?utf-8?B?bXFJZEtHUFU3Z1J2YUQyY1E5bHpCa1RHeDU3Z0tHa2FBM2FDb3VINFpvMHVW?=
 =?utf-8?B?aXpEZ3RyMnpwSFV2OC9JbGpzbGhzcklIQkYyOEM1SktGcGs5Y3pmWVpuNERL?=
 =?utf-8?B?MFNKcHIrOVhpMzdXRGlOaU9hZ3MzS0gyVlF4QklXZlYvVkY1Q3o1UTN0M3dP?=
 =?utf-8?B?djZZQ3l3eU01QWZsOEpBWVBDUTZ0MXZ4SFIyOTdEOGZBTlNXR0JQaUtuQTJk?=
 =?utf-8?B?V044ci9RWVhoZ3RBMnNSNWNDNXpCQ3UvRE5JOWxlMmhxaDRYYm81RTI0dzlP?=
 =?utf-8?B?aXBheWxXN1I2OE1XQ05vdC92d3RFck1mOGJVSExsZE14azJvUmtQZ1Z6aU5h?=
 =?utf-8?B?czRDa3YySzdYV2UvUWFPaHlmenkwSnhHOUdPUS82ZS9zR25BaUlTaTBRS3ZT?=
 =?utf-8?B?OWFlU1hsbERnSjRrWDZka000QUQxNUtWZnRSU2VrbW1oY3REOG93Z082VWlE?=
 =?utf-8?B?OTRmOE9QWVRRVFYrNTFoRDJLQi8xemYxUStYNlgwZXdzcEV2S0x0c0FMeTRK?=
 =?utf-8?B?WTg0S0wyejRBTG1CUi9RSkNqV2FtMUNvalhwVXl5ZXErWUpObzJIdlVkNlNl?=
 =?utf-8?B?QnJUTHdxdzIxWUxoaFEvYVpZVGVwdEpDcFRhTDNPSndCbUxHUGZDUFlOZDZW?=
 =?utf-8?B?QjFjRXpyMk9oSWMyazV5dGNhdkc0azdTUmRyYmR3NllnejMxM05qL3ZvNDUx?=
 =?utf-8?B?SVZMQ2psOFd2QldubllXRGZXQ3JhWno2emQwMEZjMHZoZ3RGVnVtQWFaY2ZZ?=
 =?utf-8?B?em5qaVMrcnpkRERlUmw3emZGV0dEbkpZN2ZUazNVQ09ZSnM5Zlk4Qk9WUVNh?=
 =?utf-8?B?Y1pVM3R1VmFjcVgvWXFVUjNTUnR2QUdMQ3RLbkJiTXdrK25KUlRwSUFUS2hk?=
 =?utf-8?B?OEp5dlR1Mmk2Y0RpQmNEaXduZG5sZkNSUm9mWDd5cVkwU0YxZEsrcGpkL2Zo?=
 =?utf-8?B?KzA4ZFl4eWlMNEJOTnRSSGNSMlVBallQWEZVTWM0anNLRElyYmVEd3RFZnNq?=
 =?utf-8?B?VE92ODRuOGJDQ3JpeDdUUnd6VWY2cHZ3ZTZoczBjaVNneEVSbXVmMnhJaEVx?=
 =?utf-8?B?YWwzNDJVczZkQ3BKQ2lLa3owTlRQRVoxYlBsRE0zTGtTem5tNjE5RGdSK0ky?=
 =?utf-8?B?QkVFMXNiY3NTSnRJL0xOTWRzdnZnY2VYNTJxMi9SMHBQNkZSYnVteUtNa0lQ?=
 =?utf-8?B?ZU41alprVWlsMUJvditnTnJ2bEdvUE9UT3RLVnFjdGZWMzU4cllPcDdYOERp?=
 =?utf-8?B?QmswRVJtcS9walI3em1zdXdVK1hReEFUeGZBUVZqWlkvcmRidkIvbDFXb09a?=
 =?utf-8?B?dlBkRWdEWGw1dXdJMWVlUHRnRENmSzB6cEtOaWZiTVlGelNPYUpMYUpoMFJl?=
 =?utf-8?B?QUw5TUhYQzgyQmZCb1ZYY2FjKzJBYS9HU1R5b2E0MTk2TVcwZXR0REMvRXJL?=
 =?utf-8?Q?IUzQKn9ENGkm/T/kK8HGJVPz4NVnS9RyhG7gckg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204bd137-5bb4-4207-2bf0-08d950438539
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 14:41:58.0222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpkvselJ+3Gf3YHSqtbdlxzLzF+oJlECTwe5DIm3vjnLbf1lI44N0XX5tKOzQeeYH6U03IZDq5ByvvNvetixRhUmDjGMx21t11Lp7KsjvHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5910
Received-SPF: pass client-ip=40.107.3.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_NONE=-0.0001,
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

26.07.2021 15:28, Stefan Hajnoczi wrote:
> The following command-line fails due to a permissions conflict:
> 
>    $ qemu-storage-daemon \
>        --blockdev driver=nvme,node-name=nvme0,device=0000:08:00.0,namespace=1 \
>        --blockdev driver=raw,node-name=l1-1,file=nvme0,offset=0,size=1073741824 \
>        --blockdev driver=raw,node-name=l1-2,file=nvme0,offset=1073741824,size=1073741824 \
>        --nbd-server addr.type=unix,addr.path=/tmp/nbd.sock,max-connections=2 \
>        --export type=nbd,id=nbd-l1-1,node-name=l1-1,name=l1-1,writable=on \
>        --export type=nbd,id=nbd-l1-2,node-name=l1-2,name=l1-2,writable=on
> 
>    qemu-storage-daemon: --export type=nbd,id=nbd-l1-1,node-name=l1-1,name=l1-1,writable=on: Permission conflict on node 'nvme0': permissions 'resize' are both required by node 'l1-1' (uses node 'nvme0' as 'file' child) and unshared by node 'l1-2' (uses node 'nvme0' as 'file' child).
> 
> The problem is that block/raw-format.c relies on bdrv_default_perms() to
> set permissions on the nvme node. The default permissions add RESIZE in
> anticipation of a format driver like qcow2 that needs to grow the image
> file. This fails because RESIZE is unshared, so we cannot get the RESIZE
> permission.
> 
> Max Reitz pointed out that block/crypto.c already handles this case by
> implementing a custom ->bdrv_child_perm() function that adjusts the
> result of bdrv_default_perms().
> 
> This patch takes the same approach in block/raw-format.c so that RESIZE
> is only required if it's actually necessary (e.g. the parent is qcow2).
> 
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> This is not a bug fix, so I didn't mark it for QEMU 6.1. It's new
> behavior that hasn't been supported before. I want to split an NVMe
> drive using the raw format's offset=/size= feature.
> ---
>   block/raw-format.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/block/raw-format.c b/block/raw-format.c
> index 7717578ed6..c26f493688 100644
> --- a/block/raw-format.c
> +++ b/block/raw-format.c
> @@ -580,6 +580,25 @@ static void raw_cancel_in_flight(BlockDriverState *bs)
>       bdrv_cancel_in_flight(bs->file->bs);
>   }
>   
> +static void raw_child_perm(BlockDriverState *bs, BdrvChild *c,
> +                           BdrvChildRole role,
> +                           BlockReopenQueue *reopen_queue,
> +                           uint64_t parent_perm, uint64_t parent_shared,
> +                           uint64_t *nperm, uint64_t *nshared)
> +{
> +    bdrv_default_perms(bs, c, role, reopen_queue, parent_perm,
> +                       parent_shared, nperm, nshared);
> +
> +    /*
> +     * bdrv_default_perms() may add WRITE and/or RESIZE (see comment in
> +     * bdrv_default_perms_for_storage() for an explanation) but we only need
> +     * them if they are in parent_perm. Drop WRITE and RESIZE whenever possible
> +     * to avoid permission conflicts.
> +     */
> +    *nperm &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
> +    *nperm |= parent_perm & (BLK_PERM_WRITE | BLK_PERM_RESIZE);
> +}
> +
>   BlockDriver bdrv_raw = {
>       .format_name          = "raw",
>       .instance_size        = sizeof(BDRVRawState),
> @@ -588,7 +607,7 @@ BlockDriver bdrv_raw = {
>       .bdrv_reopen_commit   = &raw_reopen_commit,
>       .bdrv_reopen_abort    = &raw_reopen_abort,
>       .bdrv_open            = &raw_open,
> -    .bdrv_child_perm      = bdrv_default_perms,
> +    .bdrv_child_perm      = raw_child_perm,
>       .bdrv_co_create_opts  = &raw_co_create_opts,
>       .bdrv_co_preadv       = &raw_co_preadv,
>       .bdrv_co_pwritev      = &raw_co_pwritev,
> 

I think it's OK:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


Still, did you consider an alternative of making bdrv_filter_default_perm() function public and just do ".bdrv_child_perm = bdrv_filter_default_perm," here?

raw_format is not considered to be filter, but for it's permissions I think it works exactly like filter.


-- 
Best regards,
Vladimir

