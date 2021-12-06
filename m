Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FF84695A5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 13:28:23 +0100 (CET)
Received: from localhost ([::1]:40962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muD6T-0003pK-Oj
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 07:28:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1muD54-00032W-DH; Mon, 06 Dec 2021 07:26:54 -0500
Received: from mail-eopbgr70124.outbound.protection.outlook.com
 ([40.107.7.124]:5062 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1muD51-0000tA-8H; Mon, 06 Dec 2021 07:26:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kG0mRRTyl1QcezNc1ORuU2IJLTAfwvn+OPPzrKxibaWuW4w4oUoKL27sNXQ/uhgUaYnjmXvOEaxpJg14C9RVvsjxEov4zEWCtDyDjHYhTabFMI4oMBUGuBDUadDMfeRn1dHWu4F9jIym64+htW+N1X+cd9l3yB6e2C/IgRng/TYB4qRVqRAq8erJv9MEhjpzRGEFCEplWhyf0yxtqnNAxglL5clzVLkXR2OOZ495GtXBzXyKLxbPQBss32E5O/QGHyzLzCESwEayOkyno3lHLjCB6OqFAqs2Hdbe5hCK0kBe80dpL4A0l1aA+DbEfgDjWCbnKxW7sea6Kbb5oOnXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZsQ1332tgCv6yB1xd0lNpOI+ezb5V3M/30PhxKUeMw=;
 b=ZkP71BOv6mPMFh+DA9C91GNuCN/QZPaKz1KNwcxazZi95G2Nz9bS1RvEXBYcJ4YOYvIX3yucD58kNgN0OodNsIJNbvgLdW2fIrq5BepoIE1IoHCrk5aNJmG8hAhyAMrJcHs34sR8x+yy7iRBCfN2hwuHbctBqDK7FyMI1Rty/t3VXOk/Vv1AkXTiCy4jKYWqyPZYnl4qfT9uNHi0ESFFszQRzEsJrNPrABvePvaZFX/wWhWXCxJmULY2ZhhjFIjJ+EYYSmR9jb9t7/ylHcD+9BEM8+nymYwHAx499ZjbBix+aYTOh0vyxPFGA0RvwW8Qgbf0jU6QQkBZtyX0rFXsyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZsQ1332tgCv6yB1xd0lNpOI+ezb5V3M/30PhxKUeMw=;
 b=tm9lbAkpG2CSDvUQZsUAisf+hOaybwDuJktMt1Z2qZNKSG+RmY4DwHQREaPxMi4gh/lgXYP44t7G648ItCEglQ6b52ywAeiUniK+BlQiWHqd4B0FYGUpXptuaVb2RohWKB4jxoBPMb23Zub+MjvGgt0qxUB9tb8MrA1fldtz62Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3283.eurprd08.prod.outlook.com (2603:10a6:208:5e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19; Mon, 6 Dec
 2021 12:26:47 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Mon, 6 Dec 2021
 12:26:47 +0000
Message-ID: <cbe0759e-c621-6736-50bf-2fe696b92f21@virtuozzo.com>
Date: Mon, 6 Dec 2021 15:26:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 03/14] qemu-io: Allow larger write zeroes under no fallback
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: nbd@other.debian.org, qemu-block@nongnu.org, libguestfs@redhat.com,
 nsoffer@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231539.3900865-1-eblake@redhat.com>
 <20211203231539.3900865-4-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211203231539.3900865-4-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0004.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AS9PR0301CA0004.eurprd03.prod.outlook.com (2603:10a6:20b:468::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19 via Frontend
 Transport; Mon, 6 Dec 2021 12:26:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb579664-c4db-4d86-c56d-08d9b8b3abe0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3283:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB32832C031CB1DA5643B379B3C16D9@AM0PR08MB3283.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tyN+kWEKAzeGCOCZMi5zyXu6vjNXjlHVnOj7a6fVz42JhsbMDXAPYjpVJmexR9/IMozHOJq3hWk56yIpusB09zkCx+xJZeXywlm4FJOrzjTjr0jW/uSklMuHFLTMmvBqY3kMGbvSfkSP+hIuYAA2f79m8QXk3dYx3n2nWPZ4ISEc7epi6ZHpqteMg8PGTrhvcm0xNsDj5WjKJLwx5dgq3/Jmst3/EP3bQbAqcYfls0cWtrNfENcCoijJEXQcPc3mGeP7qLIx6B3TiRQ6tl3TXWPPd/BWSXp8hnNPAR7N8g7kdCEx6aGgMFjmZXzoYnoO1XPL+3NmIL7jhvg8n1hdTDFuuj/spmisJsICWNMQvkxFXyfGZR3LDAXynP4RDzZK8xcuh21HxYJoE24npn7VwNySC1U/om3HZYFrMPv1jq5eA88m22oicu6yR71okNOXLB2Ff0+q2Qn/tmysh7HhgtCicl03j/izjrugnZZvyTwWrSkGJOQapmSyq786Osfxxuqvy/8u2l5bx5Utk9RD76gggRnlvtrt1FlMBPDDuXT5G4Fcv/4cA0Zdro+i5mowPzNsFhqt++1aIqHq0tvBsDJjJQGENkqCuKufcF6Vmy0wOIYFUwTX673ZdBrUhPZ9O2TKNBbDrjxHBnRpVijDgJ9ltuyRyCsbHOYz7m7ezq0QNmkW3GkPPgFUj+E56cEwy+Uw9riP5PmSTIpNKZ2dhB08HEgzn0qeHcVXnY5P0cV2mbtxva1lsf7YPRSHOszlwxVYI6K8k6A3VdZhvlx9IQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(83380400001)(66476007)(508600001)(8936002)(66556008)(2616005)(956004)(4326008)(54906003)(86362001)(66946007)(38350700002)(2906002)(316002)(31686004)(38100700002)(5660300002)(6486002)(186003)(16576012)(31696002)(8676002)(26005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3FLMmVWMmVLR1dmb1FkZ3N3MGMzdE92Ny9IbXZ1dTlqdDhqTFA0WEtZMXZ6?=
 =?utf-8?B?TzV6Z0JuRGxyQmNMMXR0Ylg5WjZyREd5S3h1b1hnQkVxSld5ZGViL2VvTS9v?=
 =?utf-8?B?Qk9IUHhXejZMbnc2YVJVZXk4WC9lMU1UNEY0YzJRdTd5anBrSkJKZ1JhZlQv?=
 =?utf-8?B?bERWMW1PdFRtM1dVTzZTT2gwUGVnc0N4T2lOZmNMMlEyR05pY2ViT3pFbnp1?=
 =?utf-8?B?bUVVS2xLR3ozcWpkdVV2QUx4dGdzQmxhMjhVZENMS2VrblB6eXhEOXkyRm1K?=
 =?utf-8?B?b1lwMEJKdmRTQzJXRDJyNzRRdU0xdlVXZ1ZRT1NGZW5ZNU01ZVdRcTZmcVlq?=
 =?utf-8?B?RDVHR3ZuZDVKWklXWjIvN0t0S083TXlxOE1qdlhRRWlTTE9LZGJ4S3RNblp1?=
 =?utf-8?B?ckE2dURqVlAwVHFkc1liUGZZQkQvMkhsTnM4R0NCQjhIWFdBWTltVllJMWFF?=
 =?utf-8?B?cTJ4WUcweVpTbkMzY2crcUhIU0Y0MlIyald2SzdhQkFkTkxrRXl5YWc2YVg3?=
 =?utf-8?B?MG96U25qc000Nng1S0RtZm1hbXBjYkpsd3hOQUI4N2NFNElIWXJkajdqelVP?=
 =?utf-8?B?a3NXT2VZN25MWDhHUUV2cUIraHhwUXRrYjFQMVZzcm42K3grUE1SSXBzLzBB?=
 =?utf-8?B?NXJMOXVqL09WQlNWZ2lVeVBmSUowTFRNMXZ3blNnSm9RQUtYalYwdnN3WDZ5?=
 =?utf-8?B?TU9ROTlydmhubUZEN0lnL1EyWEZDMERVR1pDRzY1YmVUMmM1UEk0QnBhQmI5?=
 =?utf-8?B?OU80b0RQLzZRV3lXS0Zrd1hNTWhiOWxIZlR2cUM4d1dBNzNJWll5Mkd5bFY4?=
 =?utf-8?B?Y3o3aUlhbld6SGVEV3oxcVVPajRrVXM2aitBNTNkRjZVcmpJcmNXRDVWU29t?=
 =?utf-8?B?aTVzbXBtQStMSHFNYzdEWkJjVkxXV3YwYm1RZ3o0YlBEY25ZVUovWVdhYkFZ?=
 =?utf-8?B?ZEErN2NwVnVVbW50VldXLzhLak5EYWNPU2RZUDM5dFA2ZjI5QzlXRnErcGNx?=
 =?utf-8?B?NExJSnpBa0dWdldncnZva3BLaWdQZFpuMmdEMWJOYnY1UENCaFRuK2RlZlFO?=
 =?utf-8?B?NUd1Tit3RHlzVGZXOWdxcUVPZFZDOUlqeHIrbWdlR0pLRWRURUhqWU56WjF1?=
 =?utf-8?B?SGhzU1JWa0xmR1c3UWRDUHFmWkY0REgrRllaNWhWeUlDMmlrWUR3M0dIbmw3?=
 =?utf-8?B?UkJoRk1NT1p3aXovRDF2cURHSHRRdXVvbjNTeEdFS1JFRWFwZERQYkd4ZkxP?=
 =?utf-8?B?SWtWN3JXNC85YkR6ZnYwK2hWc2YrYi9wUGlXQ05SelBTMkFtVjVkNGhSVXR3?=
 =?utf-8?B?NXJXN08vTkhRTmJJQndvQVR2c1RlcHJiOHRhVDhlYXRvK0R0eGJaVGdjL2xs?=
 =?utf-8?B?TWwzMnRZMjlabFRYaVVLck1HcnJONW5pbUdLN3FoR1dubzNQbEY2MllPYkpM?=
 =?utf-8?B?d2lMNHkwNUhuQlhPV2svOUM3alltZmNaRkdkZGJGdDByd2RRcmE5NEluUjc1?=
 =?utf-8?B?U3ZPSEV3S2FrWUJjVklWWTVueStwSlh6Z1o1NjVYWTVBTW9iRjJnc28vMkhx?=
 =?utf-8?B?VGJLZjVFcjBlcHJyeHZUZUthSCsxc0drMW1pSngrRnlVK3VTemk5QjRNU1RI?=
 =?utf-8?B?Vk95Yzlybnk0cW1rM3RrY2svdXNlWDAreEMzdkE3andQKy83M1RLSkZMMzhy?=
 =?utf-8?B?bktEM0xBRXB0akY5bUJ4SzBJa2FiazV3TWs0bjcyNjU5UlJmRkdSbjdnK3Vs?=
 =?utf-8?B?K2xQQ3ZjZWVCbC8xRTRPdEFUU1AxdGRYaEJkL2xrbGQ4SEhXL21qOG1JbVoy?=
 =?utf-8?B?TTZWdnFyaE4wTUlPZFBhY1c0L0oyb1FTaUJRdzFnZjN3ZVBDcFZaQlEzMGVr?=
 =?utf-8?B?VmZGRzVGWklEdTI4dUdLbzB2UXo1aGRnaDU4MmVNYWhxNDdHMWZwYm02WmhD?=
 =?utf-8?B?TGtUcFdFT1dUdmNONGsvZ2x6UE5TbTZVRzBSYWVoYmJteXpBUVZSYUVYNldu?=
 =?utf-8?B?R3FLQVhKakVqd3BtMEhaQ2ZxdUc0N1ZGcmo1TjdvcVAvTE4xMVEyK05WZjNH?=
 =?utf-8?B?ME4vZFhJRkcrOUltRDA2T0UxYzh4Zm5wd0dlSlBlbVhxajlCUFdmZzRGNHNj?=
 =?utf-8?B?eFB3dGVEN2dnZUlJTk5OeG9tOENHUkhQTzJsb0FiMDR4cFl5MS9PVUdNemh4?=
 =?utf-8?B?M2dZZnJyM1pBVGo2ZWhVUncrdXBHbHNlN1BvaGd2LzVvZ3p2OHZLWFdFK1h4?=
 =?utf-8?Q?do5Py8IgPMkeTwFygjPI+UwJIU+qPaAJHjmHsGYZSY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb579664-c4db-4d86-c56d-08d9b8b3abe0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 12:26:47.6039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QESAaaEFxBNYO8Obi/HQQcG59HfbOP1SEIeKjVjVoq3hgVv6Ql+/5CLYo6Snyq1QwY+LLCkXMYl3FDZmQEKlcqxHbklurdFIeAFlpuhd40g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3283
Received-SPF: pass client-ip=40.107.7.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.076, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

04.12.2021 02:15, Eric Blake wrote:
> When writing zeroes can fall back to a slow write, permitting an
> overly large request can become an amplification denial of service
> attack in triggering a large amount of work from a small request.  But
> the whole point of the no fallback flag is to quickly determine if
> writing an entire device to zero can be done quickly (such as when it
> is already known that the device started with zero contents); in those
> cases, artificially capping things at 2G in qemu-io itself doesn't
> help us.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   qemu-io-cmds.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 954955c12fb9..45a957093369 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -603,10 +603,6 @@ static int do_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
>           .done   = false,
>       };
> 
> -    if (bytes > INT_MAX) {
> -        return -ERANGE;
> -    }
> -
>       co = qemu_coroutine_create(co_pwrite_zeroes_entry, &data);
>       bdrv_coroutine_enter(blk_bs(blk), co);
>       while (!data.done) {
> @@ -1160,8 +1156,9 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
>       if (count < 0) {
>           print_cvtnum_err(count, argv[optind]);
>           return count;
> -    } else if (count > BDRV_REQUEST_MAX_BYTES) {
> -        printf("length cannot exceed %" PRIu64 ", given %s\n",
> +    } else if (count > BDRV_REQUEST_MAX_BYTES &&
> +               !(flags & BDRV_REQ_NO_FALLBACK)) {
> +        printf("length cannot exceed %" PRIu64 " without -n, given %s\n",

Actually, I don't see the reason to restrict qemu-io which is mostly a testing tool in this way. What if I want to test data reqeust > 2G, why not?

So, we restring user in testing, but don't avoid any kind of DOS: bad gues can always modify the code and rebuild qemu-io to overcome the restriction.

But I don't really care of it, patch is not wrong:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

