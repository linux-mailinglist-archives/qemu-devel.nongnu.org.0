Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95F44BC82A
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 12:22:47 +0100 (CET)
Received: from localhost ([::1]:43126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLNp8-0002ja-9c
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 06:22:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1nLNmI-0001bT-Pg; Sat, 19 Feb 2022 06:19:51 -0500
Received: from mail-vi1eur05on2114.outbound.protection.outlook.com
 ([40.107.21.114]:63105 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1nLNlc-0006Yh-Tz; Sat, 19 Feb 2022 06:19:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1laiI0mGi28nt3uth5dYotWMYyZbNcuLJ8UFh28a/VJlo4Laa13v04yfsbXpGMXfWSB+WMWQHkngwPkm8ltRpKGZGPCHFkuIK3pRE0S2x2PLwOg7+PoIwKkLPatD70XbIfUI+h0BqYQJzg45ciwO5NVmJnITqEYMf+r/fRP9bWL9n75hkBlw7w01wsod35Pash5Ce9jyoFcCGmoJEb6YxLby/DGkuG9yVuzbUZw7ne/r5A/aKGjAlsMJ7629ayH6Y7bodpUnZHNxKZVW2zx5bhBoq0ak3BQUgXs+Dmh6M7aYLgxiSmwHwxKacH5WgpHgJhAvVaAPmQYogqIR9N1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gW/goWvFwLwXvwxSyPlGvA4ACHg+DSHYAQl2D29d3AQ=;
 b=b73mQ/f5+9grQgt+Ve2Tkn0V72EpH50dbEmySztRty2KlYhu1OOnnjwV7Ti87x57pHJO14aPBpIZ99kf9aoIzmpSWbTlG6CuFqedndsvSRTNbFfLLybhHabHRmuHMfD5jdQBmfX2B923TouFYaKgy0d1QbZY32HpFAY5GmPk+Q7lZFNnEutYtXYtS6kdcCRHHGNOrXBeG+xYIKwDIuL3UBoTBIApXKxgjOyS3ts7tgABlTsK1Bb2esIA0dL7J0K28TC0h4XBGBmwpqr9TJ5h6Gf+gwITCIooA9VVYF2fvHvA3OaFADB+3aB/sclgpNIzl/Q5icGG5OkvS4533dhz6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gW/goWvFwLwXvwxSyPlGvA4ACHg+DSHYAQl2D29d3AQ=;
 b=VXzaiYUVQ7nYq8/lmig8LqGD4ksXw8uW7+mbjiIXwB2yx/AAyu1PAnl1RIMI6v3ehs9C/Qo1aUrMKaJDDQuv+ifBwq4IcbhsK3OBzlgfkYcLly8A+ipoHU6fYDlMvYF+iHtWTvMYvP9m4IU7+7aa0q8BS4GmGY2XezrymZ9ymZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25)
 by AS8PR08MB7174.eurprd08.prod.outlook.com (2603:10a6:20b:405::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Sat, 19 Feb
 2022 10:29:14 +0000
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::7484:a32f:3a89:cd47]) by DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::7484:a32f:3a89:cd47%4]) with mapi id 15.20.4995.024; Sat, 19 Feb 2022
 10:29:14 +0000
Content-Type: multipart/alternative;
 boundary="------------fMysm0ynPLXtFFNqE6P8VZaX"
Message-ID: <61db0a30-97f2-9234-fc55-b7707619dc82@virtuozzo.com>
Date: Sat, 19 Feb 2022 13:29:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/4] block: improve block_dirty_bitmap_merge(): don't
 allocate extra bitmap
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com
References: <20220215175310.68058-1-vsementsov@virtuozzo.com>
 <20220215175310.68058-4-vsementsov@virtuozzo.com>
From: Nikta Lapshin <nikita.lapshin@virtuozzo.com>
In-Reply-To: <20220215175310.68058-4-vsementsov@virtuozzo.com>
X-ClientProxiedBy: AS9PR06CA0331.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::28) To DB7PR08MB3484.eurprd08.prod.outlook.com
 (2603:10a6:10:45::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22ac8577-7935-4251-ec5e-08d9f392ad14
X-MS-TrafficTypeDiagnostic: AS8PR08MB7174:EE_
X-Microsoft-Antispam-PRVS: <AS8PR08MB71743FF3C857398AB22FB00086389@AS8PR08MB7174.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EzQ/cf593+Dj/6gFxXxppWt7CdodaNsmczK8uVcOhQBlLDCPgl5kgLQLV5ISoI1v7qZC6djo1jZy5bBTq3QTS1EgH94q5l6GT6km4qI3nlGo/EWRFis1D9JXil2T59JVI5jPt/hj1RErT+eMj1ZtpjE56sGXpjYjx42FmfmlyyADCRjEfGg5fcgaj5LUZsiQscQmP2/CEKAZgZmFaAR2dwgRSimmtz2B+ruB/XgVTNmTv7iQs8FmsnNlyqmM2EmVUhDKC6irlZ3YWfaMhYlxn1nYBd6Yku719GZHnXi2wfx8gRctPjYtwrSsQU7YkKmbxFriwhM99tswaWeRM2DTEkJQSlUvhp/fOpcvu3vzBHBnF64rkg1jfRtM+gOuy9d+rvZygFQD919FVFDXZXbFWVSOknGqoh9xY2HCMMEZxIxM8p+v+XrSnZ0zbMfQ5Gpeveqm7SxpFyy7dMa3DZRNneB8HP8Hu1vsHu4nTYmBayd1G8MjNC5stWl8ZimL2pgzvwStn/OTNW2j62R78pqRaCMBp4SYE0EvI6T3T9FANZfcoJ12//GPqpbP8eKziaFTc9KAgzZQgZZTRcaeVM7U4uSvubSKPFSoEor7xoKR5KUzismskyL2uK6lpKZa+R7FcfYcM+JlVVce2E+sTl2nOrHPsFIHxJ0LNhTfEMA8giIwT5f65Br4BzC9EI2efa2S600hh4RgEsJC36gxtybsLrro4I11bRWJfTl1keMFLiO3HCO42uesLzXhT7Da9hVh/oKTp9B0ukJHX8YGNixkoZHNocp8im+YU6u2XLZwF+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR08MB3484.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38350700002)(38100700002)(52116002)(316002)(66946007)(36756003)(66476007)(86362001)(66556008)(2906002)(31696002)(8676002)(4326008)(2616005)(8936002)(6512007)(83380400001)(53546011)(26005)(5660300002)(186003)(6486002)(6666004)(33964004)(31686004)(6506007)(508600001)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE9YWjRQMi9BS0dCVzlTd3NoM0l3M1BJdllESmpvd25Sck5Ta0M3ZGFZamFY?=
 =?utf-8?B?bE5YSGlVVG5wZDZNa2Nta3NYRzF2YTk0MmxMOFo2UGZnT3hhOFNVYUY0S0tU?=
 =?utf-8?B?NG9PM1ZlV3hKTU16Yko1VXo5NGZtWjNYN2NqRWRzTEVjZ0Z6T1g3dWR6dTMr?=
 =?utf-8?B?RXhDSjJTdS91b3RjSUhrU1RBTmtYaU9ScUlPclZGdmg2ZVg5ZlRxNnQ2NC9p?=
 =?utf-8?B?emN5QzR2M1FkbnVmbVpzdk5JM0hhaGhud0ZBeHhnb0VidlA2MkIxdUZ4amRz?=
 =?utf-8?B?dytNWEk5dGJJbEdCaW1mbCtDME1MK0dYbWlSWXh2Z0tJZWdMZ1h6SCtYempI?=
 =?utf-8?B?L0FJS29nMlNUYitIak1YYUN4b1QvM0Q3VDBaeFNmbTdZbzFwWVNLeldmZVk4?=
 =?utf-8?B?NnNhM0FRSE1VcjRFVElMd0V4SlRQKzZPY3NCWHdtczdjalJjOXhQV1hCdmo3?=
 =?utf-8?B?ZGE4TGhsajJ0ZHVDaTBoQzUwbHZUNXBTYVk4azlJSnorL2grWmFHYjR6T1Bs?=
 =?utf-8?B?L3lLOTFVbjQxVE1Nc292aEVZbkJodjY0NjU3OE5Qbk9mcUw2cGFMWHcxaVBl?=
 =?utf-8?B?S1k2cGVWUXRmcTRydEpaeVdmS0tXM0lQOTk5WFN1WXE1MTFOT2JsSE84VHAx?=
 =?utf-8?B?UHY3YS9HQVJLbjFKcXNINjkwOEpjQ2haak9VbnduZml0eVQwaXRsMy9JalFJ?=
 =?utf-8?B?TGVnM251K3lhS1pqY3B4WEx4TGRIb1p6RUZTTkNoM2UwNDFIVldnYjNHL2M1?=
 =?utf-8?B?bDVGRVBjTWxqNlVQTk5XVmtjL05ONnBBQ1IzRDBoN0RGWWl5MUtZTm9USTBY?=
 =?utf-8?B?Uzl4TzVobmUvK1FxOVR2V2Z0NGZieHdtNEJqK1JqT1ZXb0lHM2gxaC9ObDN1?=
 =?utf-8?B?MXUxRTdTcDdSTVZ2c0VKU2dZQzNGbzVUTzJHam9Db3FWZ1V2NFlDR1l4WHBx?=
 =?utf-8?B?NFkwVXlNWmVBVjZVQWkrSUxLQURGM1NzVHNSbWxSeHYzaHZLNm04Z0RUZS93?=
 =?utf-8?B?ME8rWFIyaEV5UVBZeUs3UEhqUHkxODlDNDRJYTBQMFJSZEtmNXBrL3EvM1lp?=
 =?utf-8?B?eEZjWkJmdlBhdGNBL2hLRGk1Z2FGUXB6QjFPT3VEQzF6S0JGWkd0ZXl6YW5k?=
 =?utf-8?B?M0tNbStYS3F2Ny9wZ1lVSW51aGh6b1YzYUdzTGNyZXFET2dpZUgzS0pXSjVF?=
 =?utf-8?B?aWFZck5jejBVbXIxeUNUSlFjUDZiUS9zLy9NUjRtVGxHRG5sUEt3SDZBejd2?=
 =?utf-8?B?Zlo1QVV3VGZzbHlQZzdyeDV2RWFobHFxdzkySTZlRTJReU45NkZnMWFWYmt1?=
 =?utf-8?B?Q1B6TnZ6MW15eG04RzgxRjQrUlRRVjNYT1QvbGZPNEp0UDFjdDJRSFhDOHJ0?=
 =?utf-8?B?elFjK3BxNTRaeHlJeDBiR3NKQVdlbXp4U3J3UEpaU3A0SGRGV0lkQVRhbDQv?=
 =?utf-8?B?cm4rTGtsd0FjV1djbVF0ZWFaUmJ0ZGJRSndMdmE3akFNdmc5aUpoM3pIZUVM?=
 =?utf-8?B?K2ZpSHB6Y0UyZTRha0JTOTRBL2RsZjI4U3ZFUFhTOE05U092dXB3aFdRR2RS?=
 =?utf-8?B?b3c0eUZRL0FPU1NYZHRmQndhWUpUSUxPTnVEMEFwc2EycVZXcG5pTXFXU05r?=
 =?utf-8?B?UWQyYWxrRUxPTW5peFFzRXVQVVRyenRseXkycDg2am1tQ25ZdWttWlplK3NT?=
 =?utf-8?B?blpOWTJXbVgzaXhSU1BIeER3bVV3MS9hR3FRL3lWSGtwaUpoWWdrcVJtTC93?=
 =?utf-8?B?Z2RpcFI0a0YxQnIwS3plK3lYZUtLQVB4SjQzV1REYWRZOHRzOWpiSEJCWTBF?=
 =?utf-8?B?WG00NVNpSnJKSlJhSER0YytqdnJKcGd5c3hzdm1kTElvK28reG05RE1LVWNN?=
 =?utf-8?B?TFRDeHUwU0pGNENMUVhGb3QraVBuVVlLb2hsZzd0QmE4V0RVVkgzZUdzeG1s?=
 =?utf-8?B?cFU5Q1QyN1BKcTEzWk1JeVZqd2RUWGtWa1BESHdTVDNHUTltdW11WEhCUlM3?=
 =?utf-8?B?UUo3ZnhqZHpJSk16ZldiY2xGVmtZWlA5T3kvcEJHZ1dEd2JQZ2djTko4QXFE?=
 =?utf-8?B?TVFibXlJU2lFdjRTRGR4THhnTFAvaVpKMlhkbXQvbXBwWjVQS1hJdUQvdmpk?=
 =?utf-8?B?K3pYMEZ0eFNNODFEdFFZeWE1MmhDRm5selJ6VEdSeWJ0KzJJZllrMHdrcTc1?=
 =?utf-8?B?WHpudW4vWkYrNG5mdG9yZGZ2aVlSdjhSS1dKTkd3ditPdkJWek1FWXJ4Rlgy?=
 =?utf-8?B?alplRC9mYjNIZ0FTeUdvaGFmbkRRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ac8577-7935-4251-ec5e-08d9f392ad14
X-MS-Exchange-CrossTenant-AuthSource: DB7PR08MB3484.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2022 10:29:14.5802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zam8N7PbG/dInaUUx3VhsSRFYjbbsePb23tes5vdoX2PTiO8jKnjBWCX+aahligdOoDTEPrbZalMMlym7BnBfD8U7yhD7gFTHBKO+nLTAxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7174
Received-SPF: pass client-ip=40.107.21.114;
 envelope-from=nikita.lapshin@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------fMysm0ynPLXtFFNqE6P8VZaX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/15/22 20:53, Vladimir Sementsov-Ogievskiy wrote:

> We don't need extra bitmap. All we need is to backup the original
> bitmap when we do first merge. So, drop extra temporary bitmap and work
> directly with target and backup.
>
> Note that block_dirty_bitmap_merge() semantics changed: on failure
> target may be modified now, and caller should call
> block_dirty_bitmap_restore() if needed. The only caller is
> qmp_transaction() and ->abort() is called for failed action. So, we are
> OK.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> ---
>   block/monitor/bitmap-qmp-cmds.c | 31 +++++++++----------------------
>   1 file changed, 9 insertions(+), 22 deletions(-)
>
Reviewed-by: Nikita Lapshin<nikita.lapshin@virtuozzo.com>

--------------fMysm0ynPLXtFFNqE6P8VZaX
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>On 2/15/22 20:53, Vladimir Sementsov-Ogievskiy wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20220215175310.68058-4-vsementsov@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">We don't need extra bitmap. All we need is to backup the original
bitmap when we do first merge. So, drop extra temporary bitmap and work
directly with target and backup.

Note that block_dirty_bitmap_merge() semantics changed: on failure
target may be modified now, and caller should call
block_dirty_bitmap_restore() if needed. The only caller is
qmp_transaction() and -&gt;abort() is called for failed action. So, we are
OK.

Signed-off-by: Vladimir Sementsov-Ogievskiy <a class="moz-txt-link-rfc2396E" href="mailto:vsementsov@virtuozzo.com">&lt;vsementsov@virtuozzo.com&gt;</a>
---
 block/monitor/bitmap-qmp-cmds.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

</pre>
    </blockquote>
    <pre>Reviewed-by: Nikita Lapshin <a class="moz-txt-link-rfc2396E" href="mailto:nikita.lapshin@virtuozzo.com">&lt;nikita.lapshin@virtuozzo.com&gt;</a></pre>
  </body>
</html>
--------------fMysm0ynPLXtFFNqE6P8VZaX--

