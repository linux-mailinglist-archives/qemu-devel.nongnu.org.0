Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687F05B240F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 18:57:11 +0200 (CEST)
Received: from localhost ([::1]:59744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWKpy-0002G0-4X
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 12:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oWKnh-0000cH-0w; Thu, 08 Sep 2022 12:54:49 -0400
Received: from mail-am7eur03on2091.outbound.protection.outlook.com
 ([40.107.105.91]:48864 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oWKnd-0004lA-JF; Thu, 08 Sep 2022 12:54:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1ZSpbfArowzXtem0/Klc0aq9DmGfn5yndB2kX0H+ljS+M2lfgOl/vvYZKxqJpU2hbEabSlHkEUtsmhMMx+4EHlwPhxAdhUUePfvvXsMykrh1GJDI44xDVBmwdK9JQ54xSH1bC8bPiMEPA8Z+BrE3zp8+HrcG7tktBfhY88y1hCYrXTHL/dzYiEr8GqEUUJiaItvV7IwyldGgC+bp6dy1+tZ99U8FPN6OE4u2weq1SgRiLFrkpWeiipvIARS8tJSeyZg8raLRqrwGvHv4m0N7TChm7IFvQTNnxZJQ9sz1F9qWPBtL9TyJN12TGF0o2RsvWuyPsdQ8161Mf9QxJ1OmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVIVevstv0RkgJXz0FPpUmPz6l2JU/lANG/yNQotqcE=;
 b=bYBqwAsmhG52GmtHjejqgds08R3t8YkMZBLvkExQbD3poUbI4kpqysSli9M6214rmHAMGOxXjxLw4hA0uYaKUrzsmrh6z+4kmC3rA/+rN25kydUUwXFPbnOai4r/XeD5QgaeOC2Sk5QeoFux6sRMhbj5yzFdmp748YabBgbfN0aj9G+ZlLbPv703zo7blCR24G111xRbqRrZ9/SVhsffPEe5yePPuL5N0O1QAcOPulcOvQK/jojsyn/AWinND9nd29vzkW8hKQQgXqGdVypxyElYJ5cm2Jz58cMQOpgsEUTc/uyEMPR359fzCmrqE1GBLBYwpfiW+jr9OmZ5ArI0Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVIVevstv0RkgJXz0FPpUmPz6l2JU/lANG/yNQotqcE=;
 b=n06zp5B0zDqixp4tgRPrZ5u9011NjmdhPgPbnpf+Yzh+vih8P1MBG3JkV7qYcmqJ0zb+sKZyAyn5ulWYmCPZSPsWKCrKkm78P58Eiw/wklq3YGM08GMkmzkWbDcj9KCSGLl3ifDb8jWRX7lHlkFpJ2ONuek/o5Teu37v4YuTT7lu21ETXIFh6M0CUEPGlBA6jujUi/EnVyVtP2w8Un+lsIZU61jRFO1zAsN07+vDBPokefwyrwqLkncoTR2ia/F62dnE1srDF02evKgOG5Pfn4rGb1tlNEo8mF+YmxH9UPcrzA/Kyzgh8K7U1oRwI9UmbLRPjsQYmqMHl1sk0lXmQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB9PR08MB6393.eurprd08.prod.outlook.com (2603:10a6:10:25a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Thu, 8 Sep
 2022 16:54:39 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::8824:508c:fb16:ef6e]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::8824:508c:fb16:ef6e%5]) with mapi id 15.20.5612.016; Thu, 8 Sep 2022
 16:54:39 +0000
Message-ID: <8bb1c2df-2f39-49f2-385d-a6f0d1f8fbde@virtuozzo.com>
Date: Thu, 8 Sep 2022 18:54:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/6] parallels: Image repairing in parallels_open()
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
 <20220902085300.508078-7-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220902085300.508078-7-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0109.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::38) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|DB9PR08MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 91edc3f2-36aa-4952-77fe-08da91bad19a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8+GybCjxio+82S2nCzMjnc+uF0vKXKwu6AyXsziaxKF2BEBvqhN6QRAJHFP+Tc86Ltw90gQwNPaT4i06L3QUzYPg76bXM4b4KtSAAgPVvSy0QUVmkq1c5FCgakK/bpnbjahr93gsBPDV7ZaDkcpgoPgBEF+HvFexoHZbvhW5pgNnpJLFJa38iE1zcgHvbkzcChS3kGXlBnMp3/om3D+dqy4t9CA0LTR5bsWhiTViRSGB+duNTkcIFVxcu6OD+6hRgvozVfGY9KU+3wQAwFkF5/l1PzTb8TzKp0tVCdiME1aZWa3B3I4vas3rPt+o0PeAAohAQGF9F1xODC6hv5mX6aq8Fpii7f3lnuIijlMot+MvyzQEFxJm5GRmWoBWGqhX+wUoYJuG4xBe7Fzcqj39NxpkY9A8t+GLCQmcuqhVDsXfw88VoVCv6lhWJHZG2oOG/XmT0Q4ChiH9mN4Fy1rZGRpQ3bVg4kXlpqzHa3gLYC/J9DqxMSV5uACt6QAbIbtJf9G4Y53S0X2AJb4CnWNu/Vg0TguBmST86zXyuX0SvLJHluLjEz2EL4S5ySpxdmEPAtWGRqdurMcfczjk34bygKst2E+BaKVTPW70nYcrgZBDvah/iZQ4jbaPJkaRKWgwoUxd4UtYuSpBY73QoN/VjlKJV9bPMOwrXfT27jXGnXVxtUiGoOeULpF8wBbcjFWaS+HxDNqr7r7djjV9AWhMVJbRcVCJjxfOlYZ4uA/MXsMmbVplOHNO0oGI87hJZ24GEjcbNSFnQm9lhK1CaX9kmfdLr5yHzJdvb33zTocuIj26jyu1YZQa4/b32yToCjrXbzm0zaNqksCpOKH9R2COJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(366004)(396003)(39840400004)(346002)(8936002)(2906002)(31686004)(83380400001)(36756003)(66476007)(66556008)(8676002)(66946007)(4326008)(38100700002)(38350700002)(5660300002)(316002)(31696002)(86362001)(41300700001)(6506007)(2616005)(26005)(478600001)(186003)(6486002)(6512007)(52116002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0dIbUZjUlVQTjBZNDY5TVl3VmhXL2JHMDRJMHdxTU1JOUkyOXBIL1Ntb3Fo?=
 =?utf-8?B?R2ZRY2kwNCs1TGN3MW1oYllIQjcxRHBOV3VsT1loZnhBMFhDU0xRWEtlTHp0?=
 =?utf-8?B?eXFJdmpMWGtOUWpTZ3lWRWlhWEdET1JoL3J1ZFEwTmNBNmFHME92Zy9pWVpV?=
 =?utf-8?B?Vk9CMUxTbVE3ZGlSRUZqZnhoZW0ybVRoZVhqeUtvZFZjUlhmSjhIdmh2eWpj?=
 =?utf-8?B?aVRjT2s1WUs1cXFrRjdXeVNISTJicnliVFJZL3lUWkVyUGh6VWpWUStqN0d1?=
 =?utf-8?B?WmxjWE8rVGovbklJQ3k0aXdSenJFcE1rbi9Va2UrV1YzMnpZT0J6UC9JZGxB?=
 =?utf-8?B?SkJjNmJscDk0ZFlYWjl0RS9sT01SUnBBaktkTC85Y1lUQnhsc05DVDg0anlH?=
 =?utf-8?B?NEQweWY2cjZIUm5neDRqanhsYXFNS0NhK0ZCeXhLWk13bHBrVG55N1hpL2k2?=
 =?utf-8?B?ODhLbmJQb0ZVRFR0R2g0VlNFODhhQk1SRmZtdmlHRFVUY3VKdXpmY0kyckhB?=
 =?utf-8?B?V05nMmIwQjZFT1R1YXNyejB1RE82aWh0R2hLSWpqdmdrYUNOVm1iUncvVnBs?=
 =?utf-8?B?ZUYyUE1mT0xudjdpVkdMcUZ2ZVJQS09udUFwVy9lTE5tR1Q0QmtYSWx1N09Y?=
 =?utf-8?B?RHB4aDZqOUlsUXJjSUNuYUFWQXcyMWVEUGJ2UU0xWFJpT1N1LzBqMmtwemZU?=
 =?utf-8?B?eWV2N0NaOXFNejIwVTU1dDc5aHlnSUJuV1hCNWtVVkhuSjJtdEpZRUx3ZHU0?=
 =?utf-8?B?TmhuaWRQdnJlVUhPbVpIYk5Iay9EaDVZaEVJV0U1Vk1sZU5SRVFwSUJQckh5?=
 =?utf-8?B?WUpXVkxwVXdEOFpvNWlGUjIvcXNRRXNGNHFRU2RpalNhb2RVdmI5SVNEY2hj?=
 =?utf-8?B?dGc3bXd5OHZTQXRyVFY1WUl1N1JiQ2tUaWU4T0tlcUVTSlJSTklKczZ2SFZM?=
 =?utf-8?B?Znh2MVR0MGlpWjg0UmZiM0dUWldieUN2QjdnL25WeE9BV3ZLZGJqNzJrZFV2?=
 =?utf-8?B?djVTRUJiU3VIbEJtMmhURmZKM0wxZ0hvWUNha05SbVIwS0VKdGJhMnNMbnJQ?=
 =?utf-8?B?dklXelIxREMyRDFxbVFWa3JzU0Ercjd2ODhseHlKam94a0VjZk5tK3B0S20w?=
 =?utf-8?B?YlpRRTBXdkJUaGk0QUEyVjRRMERiSFpReHFoNXVNR01tTzZuN3cxa1M5cUVF?=
 =?utf-8?B?L3pOeEhpNklOQmF3cVJhU2FIOEIrWDMwcGh0ZEZzdWxpTFlJQUdPYlhxYzZH?=
 =?utf-8?B?WlZBb2pzS0ZHdmxTZ0ZmczY0azExbVg3M2MrV2VON3MxMExGYzIrWlFOU0Q0?=
 =?utf-8?B?YXBQRHhMdyszVmZFRExjNzErNGNDcjM3VU9LSC91eDNMNkVabDBrZGZYT2tV?=
 =?utf-8?B?N1A2ZGcxRnRwTGRuZHNzWlJRN1pPTDU1ZTVEQ1pCQ3BpRUorSXRYV2hMRXkr?=
 =?utf-8?B?Q3ZMQkxPOW81cFhBTG9wMmZ0ZFVwU3RuNDFSOHpUeS9zWjBsN1pQc3lqRGhw?=
 =?utf-8?B?OGpYaUUzTmtsOGphZmlpVmt5eEU2VnA2OTR0QXp3ZkFzS3htZytDRDRaeVZh?=
 =?utf-8?B?US9OeE5kNVpjbmR4Y2pWbjQzQ0NQUzdsR3FQWHF4OU92cTdzTlFpV3RYeDJF?=
 =?utf-8?B?QWszUGdTUzVlNXZsVlZLK2VUb01jUHBaUG9FMzFOckJ5WG9DSWIyeUdoanVH?=
 =?utf-8?B?R3I4bTEvNGNxQUU1YVhyN3BOdnhRQzFnT2EzblJGbWZxRnZTTU44K3NscTJx?=
 =?utf-8?B?N0VoZHFPa1dmdWVHNkhkUnJ6VXVxNktqNnViV3BNWFFKa2xHb2Q0L1pDbUFw?=
 =?utf-8?B?ejZXQ0swTVZuNzMwNlg1QUlyLzhhbEQ0d2U0MGQwVHNjUjV5Q1pYUjFsTi8w?=
 =?utf-8?B?eUMzKyt6NWtWRnBMYy85WUwvMTgvSi9kV2IraWVPZHAzMGJIRlVHVU5VOGhz?=
 =?utf-8?B?RXZqRmxxbXRJeE9jL05tYzcyNlFKdkowdDNURUsxcXk2VmFhY0hRQjJZU1Mz?=
 =?utf-8?B?M21GWitLYm1nQmxaa2NJQWh3R0MydDVNcHJSYVdkcVN4NEo1bitVYTc2dVFP?=
 =?utf-8?B?dzRDek1mcVY5TFFoekxqRk9DdExIUmdJRjZoa2sxeUZrV3BEZTlaZlZlUFU3?=
 =?utf-8?Q?DazLbymy84Elf1VcHKi6hd5pS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91edc3f2-36aa-4952-77fe-08da91bad19a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 16:54:39.4415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sS6E844+dsgqQ3vi1iJQkeWJUYWvGxMNrIICHJLtTIO1+bzZRj6qnAerpqkOBwKJAXTJ9T6UjIQGKGWJr46OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6393
Received-SPF: pass client-ip=40.107.105.91; envelope-from=den@virtuozzo.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 9/2/22 10:53, Alexander Ivanov wrote:
> Repair an image at opening if the image is unclean or
> out-of-image corruption was detected.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 95 ++++++++++++++++++++++++++++++++---------------
>   1 file changed, 65 insertions(+), 30 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 08526196da..a7c3af4ef2 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -735,6 +735,18 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       return ret;
>   }
>   
> +typedef struct ParallelsOpenCheckCo {
> +    BlockDriverState *bs;
> +    BdrvCheckResult *res;
> +    BdrvCheckMode fix;
> +    int ret;
> +} ParallelsOpenCheckCo;
> +
> +static void coroutine_fn parallels_co_open_check(void *opaque)
> +{
> +    ParallelsOpenCheckCo *poc = opaque;
> +    poc->ret = parallels_co_check(poc->bs, poc->res, poc->fix);
> +}
>   
>   static int coroutine_fn parallels_co_create(BlockdevCreateOptions* opts,
>                                               Error **errp)
> @@ -947,8 +959,8 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>   {
>       BDRVParallelsState *s = bs->opaque;
>       ParallelsHeader ph;
> -    int ret, size, i;
> -    int64_t file_size;
> +    int ret, size;
> +    int64_t file_size, high_off;
>       QemuOpts *opts = NULL;
>       Error *local_err = NULL;
>       char *buf;
> @@ -1027,34 +1039,6 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>       }
>       s->bat_bitmap = (uint32_t *)(s->header + 1);
>   
> -    for (i = 0; i < s->bat_size; i++) {
> -        int64_t off = bat2sect(s, i);
> -        if (off >= file_size) {
> -            if (flags & BDRV_O_CHECK) {
> -                continue;
> -            }
> -            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
> -                       "is larger than file size (%" PRIi64 ")",
> -                       off, i, file_size);
> -            ret = -EINVAL;
> -            goto fail;
> -        }
> -        if (off >= s->data_end) {
> -            s->data_end = off + s->tracks;
> -        }
> -    }
> -
> -    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
> -        /* Image was not closed correctly. The check is mandatory */
> -        s->header_unclean = true;
> -        if ((flags & BDRV_O_RDWR) && !(flags & BDRV_O_CHECK)) {
> -            error_setg(errp, "parallels: Image was not closed correctly; "
> -                       "cannot be opened read/write");
> -            ret = -EACCES;
> -            goto fail;
> -        }
> -    }
> -
>       opts = qemu_opts_create(&parallels_runtime_opts, NULL, 0, errp);
>       if (!opts) {
>           goto fail_options;
> @@ -1116,7 +1100,58 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>           error_free(s->migration_blocker);
>           goto fail;
>       }
> +
>       qemu_co_mutex_init(&s->lock);
> +
> +    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
> +        s->header_unclean = true;
> +    }
> +
> +    high_off = highest_offset(s) >> BDRV_SECTOR_BITS;
> +    if (high_off >= s->data_end) {
> +        s->data_end = high_off + s->tracks;
> +    }
> +
> +    /*
> +     * We don't repair the image here if it is opened for checks.
> +     * Also let to work with images in RO mode.
> +     */
> +    if ((flags & BDRV_O_CHECK) || !(flags & BDRV_O_RDWR)) {
> +        return 0;
> +    }
> +
> +    /*
> +     * Repair the image if it's dirty or
> +     * out-of-image corruption was detected.
> +     */
> +    if (s->data_end > file_size ||
> +        le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
> +        BdrvCheckResult res = {0};
> +        Coroutine *co;
> +        ParallelsOpenCheckCo poc = {
> +            .bs = bs,
> +            .res = &res,
> +            .fix = BDRV_FIX_ERRORS | BDRV_FIX_LEAKS,
> +            .ret = -EINPROGRESS
> +        };
> +
> +        if (qemu_in_coroutine()) {
> +            /* From bdrv_co_create.  */
> +            parallels_co_open_check(&poc);
> +        } else {
> +            assert(qemu_get_current_aio_context() == qemu_get_aio_context());
> +            co = qemu_coroutine_create(parallels_co_open_check, &poc);
> +            qemu_coroutine_enter(co);
> +            BDRV_POLL_WHILE(bs, poc.ret == -EINPROGRESS);
> +        }
> +
> +        if (poc.ret < 0) {
> +            error_setg_errno(errp, -poc.ret,
> +                             "Could not repair corrupted image");
> +            goto fail;
> +        }
> +    }
> +
bdrv_check() is your friend. No need to duplicate the code


>       return 0;
>   
>   fail_format:


