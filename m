Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E203F396E76
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 10:02:30 +0200 (CEST)
Received: from localhost ([::1]:50246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnzM5-0006AY-Vt
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 04:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzI8-0001gY-SH; Tue, 01 Jun 2021 03:58:24 -0400
Received: from mail-he1eur02on072e.outbound.protection.outlook.com
 ([2a01:111:f400:fe05::72e]:15359
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzI6-0000W3-7h; Tue, 01 Jun 2021 03:58:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGmhcT/RjmtHlb5c5X9jokI3hA8C43z/eFgN7Arnu+Qu2AgOknClkdLiH++08GKmQ88LNDOe+H3qmk98mLXP6dKN2HBtG+Bp3umndIjeKqA7RX0IL8P7DqIqa+GrOep5KZgAb37G9OXmyAvrMXdgDnU43YxiYQCv/1GN8DDsMGOSXUToT77oTTlHRgS4V3d9ta7q2IQnl6myDyccmJnDfGrVbkB0EsZducIoasrFPS2iAZ6IgND+dgcmAx8wQYyoeQ+VgS6HeUXlAzGvXD9F+WOIHslazofvxCOpxiYqCusy1NVSwKZM6IeD1d8odaBrVei5K1i31zqOagIzUIcrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTA4L/jCQGah7qdWRO4gKQjtDvnd+0O5EPC/Qft6aHw=;
 b=XfhPQCmBUdZw48g7KOPNQYIs6yt1Lm1ipYm/E/B2eFfZQIq2OKJLtD3KeIabqvzKryvUy9g6DPaFRaDCIjixPtcYRKQLRydW6BPNhmIFbt8YsEPvFAjaboturcQ+5FWuGgqf1/dLeGJ2TeO73IYo7P2Vf61+g0xTTop0elYJSpk8fnfS7FYzepyEcH3eYymv7k3vQIGT+DAVM8OcVgmc1KtUJMmWXRLc5TIF0wq3+R9GxBHRNRC8FW0wkvRArgf26Bs2AXptkSeAmUFNOjenLZajH67xyMsmn2lmPcjjoF02231dfyL2YNLRl2Vqck/hk299+jAb8pgPN/uaMzKBdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTA4L/jCQGah7qdWRO4gKQjtDvnd+0O5EPC/Qft6aHw=;
 b=nWj4cn/KR04T/FHJIdEHwsgLKckHwBYOT/JbCxc/xiatUW3a0InLdLgk0R7vd8vqWpxeNWnqs0WOsnTnEJjRh4OVLJ9+6diIglNqmzIn9ypixSIHCwR1vo9+Q/YUPzG3CeAY74jwF75f2WgOh2sVyAcce6ZRFAu7/GujZH1KE7Y=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4951.eurprd08.prod.outlook.com (2603:10a6:20b:eb::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 07:58:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 07:58:16 +0000
Subject: Re: [PATCH v3 4/5] blkdebug: do not suspend in the middle of
 QLIST_FOREACH_SAFE
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210517145049.55268-1-eesposit@redhat.com>
 <20210517145049.55268-5-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <88b38ab9-4392-2ab3-442d-44713147a952@virtuozzo.com>
Date: Tue, 1 Jun 2021 10:58:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210517145049.55268-5-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: AM0PR10CA0066.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.210) by
 AM0PR10CA0066.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 07:58:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee8b360d-d46b-4803-1849-08d924d3031e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4951:
X-Microsoft-Antispam-PRVS: <AM6PR08MB495186486BCFC959D223A482C13E9@AM6PR08MB4951.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CUuVCHqfEgTTd4FXIErpuXEY6u7lqYTRHKH+2MuOPTSQC6x/7PxwyfY8BySXqsj2AgE0CyjAGybswGAkGfOV7WmRGoIyYpL9oXBo09xdUs0vbUkra4w27lEzD0cIf5HkQrZzk2T+BmlLuhsu6u37xJyYHQx3F7FRlSTwK4gtED/tsylXsMInOF+Ag3X+7R7wOy2oWoTol4UFtcxL2D5GxIH9n1OOAfKaIF9jeaeitUvpQw6GMHHAtVq+YVa67GkOMCvi4U64ni1O6/l8v0y54o4rP+yCZxgYX1gEXq0QK2aYqruNPM+nBppV8RNU0AyJxdvVmvbxKEzZtzgmNXgdGXACnitbTk/4kcLUH6RvhsaGpkLilC79al/tLsw/p52Nhy2NJPHG/A62B7LvimKla6ENaJJxGaV6QPcoqdDNqc/cRiE7DAd79uR6hkDiuccONlfTkZLCSm+gIQO4JXpQo2EPbjvIFTh2tdY6kJGTzrmJeQCxG8ZvgUlab6HaQhDeMnP8HzZHDtW/MGDuD38TiHHBuflMltW3+Q9l3re/6xeYUI8kd4lsvyqAV2NoqjXof7cQylzhe0LL7IuCCPKRBNe6IH75z0CYDjANmG08m0N0jrglBvM/q2PJK61G+VKBT0xDNB5F5VE19sf2EFPY6+9W/H5epTapimFJk4+cPQn+WD8iAAPlyTXZPZwTwL22PRtuTEZOKrwW70MfOq1zCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39840400004)(136003)(396003)(54906003)(316002)(8936002)(478600001)(2616005)(66946007)(4326008)(83380400001)(66556008)(66476007)(16576012)(26005)(956004)(15650500001)(36756003)(2906002)(6486002)(31696002)(38100700002)(38350700002)(86362001)(16526019)(5660300002)(31686004)(186003)(52116002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RVFIWHIvZVoxN2FZaXRWWXkvOTN2UDVxS2dHLzQ1TnJ3cVJtYWpFUWMxR3ZI?=
 =?utf-8?B?cG94Wlo5VExvWWhNZS9FTVZOMVQ0bTFHT2tPcy9tL3RiTFVvNFRsdkRTZ3hk?=
 =?utf-8?B?dUUycEFrT2dMUXIvU2hRWlNONUJNQVVpMnlMYzd1VTJXQ3ZIay8wNXI1cnQv?=
 =?utf-8?B?cTZ1UnNKTEdjRG8xSEQvc3pyOGkyTkF0ZEdiTVdFeDFBSE5sblUwTVZOajNj?=
 =?utf-8?B?d2hFbm9FYlJkYTQrS2pCLzdtdmt6QXRaYkFqK2hVYTVycjIzSkRabTlBY2Rt?=
 =?utf-8?B?RzZ0RVMweENPcVlLcDF5RDBPUmxzZldFU3RndzdWcmpxVDFVTU5qMUFJaEpo?=
 =?utf-8?B?Wlljb0oxY1QyeXhXSk1nMmtDZUZOWXpQMHBMQityUFkvcm1uYVZDcDRWVmY4?=
 =?utf-8?B?bkZBZHhwMmRTVWtSQ3YzKzBpdXkxWWJ1Qjh3UEhJd2FEZ2pEMExZWnBuUG9s?=
 =?utf-8?B?NmJHVGtCKy9sN3FqYlVpeW15U0hDVUpwcGZsVTh3QlltWnpnd3AwRTJHZTNP?=
 =?utf-8?B?QmpPZ2VOVWhCV1dZV2dHb3F2aEdEblFaWGNSQ3lvbTBHQXdsTGpqSlNiWXly?=
 =?utf-8?B?WW4vOXBKM1hnMy9KNmpabTZralR2Ui9FNHArYkhZbDE5dXpLQVRNSmF4Szcx?=
 =?utf-8?B?VkhrV3hjaE1YM21jWjhja2xJODB5a2tCdVlQaDFtTUpDcThSUXRUaTBnSFJk?=
 =?utf-8?B?WHZqdkx2MldrQTJDWXJLUjRiMlVGV093RHUrZ3VPcmhDdUlxcDFhYUR1VFor?=
 =?utf-8?B?c29qY3Y4L1J3bjZDd2dqdlhtTDFXUTVPalJvbmhiNjB5Y3kxSlpUN2MwdEd0?=
 =?utf-8?B?dGlSSUswR2gyT0dHa1Z3M1RlK1BJV292aEFHSktFdmpKTTgwZEZPa2xpd0hl?=
 =?utf-8?B?OU5RT3UvMXByZEplZ3lwa0V1S2MxWGladWtzUk5IMlZSZWJuU04xR0UzdTJZ?=
 =?utf-8?B?Ynl2MHpYZUFNSE5FNU1VT2dibjRiU0RMQm41SkpHOXFPVlIxb3A0SEFNWCt6?=
 =?utf-8?B?TUQzQkVmVC9DcmY1QXhCdzluVG5NbDEvVnJXOFpRMEI5NEx5WTFtOE9DYXJR?=
 =?utf-8?B?UkEyV0t5d3gzU0NOLzJYM0R2dlgwcnU4M3RWamUrcENQYVZQanN4eWI5NGRj?=
 =?utf-8?B?WE9pdWZ3TXJwcS9meWlGVGtpVG1mSUhvOG9WVzRsQ2RoVjNCTmcwTVlhQWwz?=
 =?utf-8?B?TDhpcTVHbkM3NEcxY0lzZWxjYkVqMnowZk9LS3plOW0zZkFMSUxramhOd3Bl?=
 =?utf-8?B?Y2xBYSt0dlRVNFFaNUgyVFphdjd5SkdqWlRDa2FrZmsvWVAxYWdGQkdxUXkz?=
 =?utf-8?B?b3dSZEtaYWM1WVVyb1FRM0JmeXltQkQwMDhJS2hDV25CVTQyVFcwSk9NYXVZ?=
 =?utf-8?B?eVhCYVhlZDI3VjVlTzBWZ01OM2RrS0wwSEY4Z3VtcEUxYUtDSlRKVEk4NDE4?=
 =?utf-8?B?ZUlCemI1UjhkZHpiSjNUV3VONmt2d2NvbFFNY1liUDFQbVdsSkw0Q0t1Nmpm?=
 =?utf-8?B?dGUzSld3b0N2M296bmRZY2lxRFVjb0hqWTRtSStKbFZGVm1mZjlZVEdkbFU3?=
 =?utf-8?B?R09rZXpXdXlaYWtKaFBEV3N1cFdJUXVjc1UvY05wdkY1VFJwM1hOVVp6OFor?=
 =?utf-8?B?QUY1R09obUxRdS9GOUZnM0RVMXZqcXdJU0Jpdkw5RFVEdXN2dG9tdXhocUFQ?=
 =?utf-8?B?TkZCM2R4VTZiQkZUY2hpbi9Cc0tMQzhwMTRqTlozSFRBS2g3K0M2RktQMDlv?=
 =?utf-8?Q?LYIk7h8/DS5Sh3bLlNSLNGsrV5r8ysFVwJ8ghpC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8b360d-d46b-4803-1849-08d924d3031e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 07:58:16.0172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9X8ayknLXtaWbn5EwS14Sthex6yFnt0eyKUXEw3sT6D8Q5L6iInAHbiaIAm9hMnmlbDIfwP+bTnZeL+KSrJkocMpzJsWjh6J05kbpopTyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4951
Received-SPF: pass client-ip=2a01:111:f400:fe05::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.591, SPF_HELO_PASS=-0.001,
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

17.05.2021 17:50, Emanuele Giuseppe Esposito wrote:
> That would be unsafe in case a rule other than the current one
> is removed while the coroutine has yielded.
> Keep FOREACH_SAFE because suspend_request deletes the current rule.
> 
> After this patch, *all* matching rules are deleted before suspending
> the coroutine, rather than just one.
> This doesn't affect the existing testcases.
> 
> Use actions_count to see how many yield to issue.
> 
> Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/blkdebug.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index 388b5ed615..dffd869b32 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -789,7 +789,6 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
>       if (!qtest_enabled()) {
>           printf("blkdebug: Suspended request '%s'\n", r->tag);
>       }
> -    qemu_coroutine_yield();
>   }
>   
>   static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
> @@ -834,6 +833,12 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
>       QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
>           process_rule(bs, rule, actions_count);
>       }
> +
> +    while (actions_count[ACTION_SUSPEND] > 0) {
> +        qemu_coroutine_yield();
> +        actions_count[ACTION_SUSPEND]--;
> +    }
> +
>       s->state = s->new_state;
>   }
>   
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

two thoughts:

  - suspend_request() should probably be renamed
  - actions_count logic is a bit overcomplicated, actually we need only suspend_count.

-- 
Best regards,
Vladimir

