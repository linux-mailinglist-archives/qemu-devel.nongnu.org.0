Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C024E3FD9CC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:36:57 +0200 (CEST)
Received: from localhost ([::1]:44572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPU7-0007da-RJ
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLPGU-00054R-Pb; Wed, 01 Sep 2021 08:22:50 -0400
Received: from mail-eopbgr70113.outbound.protection.outlook.com
 ([40.107.7.113]:52814 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLPGO-0003CD-3s; Wed, 01 Sep 2021 08:22:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdp17IFl/OnaBS5EUsxDMsguJH1RrJwIaGTJAx3gYxNp4XjyQP3nJo8wJjZ+LST6VPNGJnA3U3ssHv0b/uD1CG69grsMu2Mrlw6BjYWT/OtshFWML6VLdzgbWnnDFK/A4DKmn46zlBeAnLjHaGv88MQIy7asswFFFZ4apfAa3G6ev23OMQp0GsR0xk4+ptBvtioPmXtVyvUk0f9f5bpg/Um9bU1naTepbUgMWi1W60zjRNc71LlL9Rp6N4nJJGqWgeI4FNt4VbhSnbtKbzSyNZMpiHwt4kZdSmlAaXjPXuidYUPOyx0NdZFPgeegNsITzQxy7b+E+1EZYTQaVWeReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=w/zC81xzimH2Ds+suf8Hgkpgm7NfbrXCRsTk1D7wS2w=;
 b=FksuBOUvhnyrRehDqvwNkINW8GaPcIwYELD8+sLG+6bmjw0riAA17H/gKzf0XD58mQMjVLi5lK7Rd7jnjDt16ErM3r1Ie/utUvkQso8hebK8Tle7pU2+TzO901+e1IUGyjv69R02f7DD9YUwZPAiRxqMoOnj+zxyvKwLviIo/bhV8SDIulSXspudbq5x/GKuljfOynV2arWFncTxmd4AqcHL6RM1/Rs8K66RSsYAzGtI0MU+iv7Ve8xu0b9f2W7oH+kaimu9Wje2zIEogl+izQdKTdeA+1kb91cuCdC+KsszdPl2aG2rTW/pMPAjkGtSUOBBJum3RS/lSJmqONOdvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/zC81xzimH2Ds+suf8Hgkpgm7NfbrXCRsTk1D7wS2w=;
 b=fX9yzbwi3J3IS4PzNLJOF5zcMtnQXxpkmAJvEQUYxXy1CyimUJ2u+0CLgIKw8U2oF97IBK4g/4pBesLSzNSu8+WW14EHxjj5yone9AmLjsI6iPpgfhrSf0JAElQbVGG/oWW6liG6+rBeW0llE6wQCpKry03E6tX5EGHG8u92y2Y=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR0802MB2221.eurprd08.prod.outlook.com (2603:10a6:800:9a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 12:22:39 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 12:22:39 +0000
Subject: Re: [PATCH for-6.2 v3 11/12] mirror: Do not clear .cancelled
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-12-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c59bdcb0-f7d9-4718-c6eb-c1f787198d4b@virtuozzo.com>
Date: Wed, 1 Sep 2021 15:22:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210806093859.706464-12-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::13) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR2P264CA0025.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Wed, 1 Sep 2021 12:22:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a7a1300-9af8-4527-9da7-08d96d433033
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2221:
X-Microsoft-Antispam-PRVS: <VI1PR0802MB22214C3EF27856FB4A63BC0DC1CD9@VI1PR0802MB2221.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mtuIKlapMozjRe7gscm+SZ1Jn8WQb94G2nODtByqFT77SZz3XIO0muoFUJ0Lwa+WpfV4hi+4jx52l5KdB/QWcNa5iRvAT/GJSA5/uaMONSqM5i+BCPpt2SqNqSgLKr/vhHgaRZLi6yJlrhaQ1cCa2xkbkV/CiAzEm/MyZitq/aKO5RZ9KVq7MmgudvBBO3MPH6t+WxxTx0RU6zL2+Ac5lpluD2LnwrwX7pC1QrQ1XQ0uNn28gF5NpHDn54orwKekj+o++jQW1pyIwiafc9Qpl9Tk4y9qY24CQzk7YYhOjlZzN5Hp0D69KAN/f2KkLArxLIM684CH77n3UMT3NmQkfsvylMlq+F8PxLxV0F1Pm7bdctcY1kWnnhgTU2jBgUxNRbCfr55Zw36mST3iJVZqrQIr3UElph9mwI1jkbe8VYhDo7UvtwmU08BctyWCAlmV6NwdiBxG57ziWoJIyGsWquD2FgUddnIY7kVB7CC4LUuRSzEYBzhzNqcYkEmiLnmxpaipD7oqK87J+pDxGAGVzrFOwcY6qUMkYXziL0tTCLp0sWSjIXEoKuW3DDG68PYZOIFbSNK8K2KTKXAoB44u566tAs9fz2x/3Q28/GUNIJRudPLc6gri5E7GDvtOM23FoKqzeMLcNUlFWtNH9AKLXfIS0DWZ6TNMb2Ae/YO2/raZQmeK2tqajjdYdJNY8ECldvgbx78fYPzb4E21j1/wEObVNXfkrSGCjQg2m+oqM9RRE8TDQ6yY81cDIEnUCBm7mBPcxaAL5Aay64H1Vd8hqOxw/04A0Oh5yl/H8DKij+4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39850400004)(396003)(366004)(8676002)(66946007)(66476007)(31696002)(36756003)(8936002)(66556008)(52116002)(31686004)(316002)(38350700002)(38100700002)(16576012)(478600001)(5660300002)(86362001)(2906002)(26005)(186003)(6486002)(2616005)(83380400001)(4326008)(956004)(142923001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K24xVVgwQ3FJMEdwLzBkRUF6M2lQQWF4ckpES0dWcHo3c1llSmpSNCtENm5m?=
 =?utf-8?B?NnM1V1M1WHdtZ3Ivc3RzVFN1cGxNSVNJazZpcVYreHZyeDdKbFNVQkVRQUdq?=
 =?utf-8?B?TUV2K2pMaHhuR2lFMVdIa2kzdlNadjk3ODE0d1dEVHI4TzI0UXcvMUdzZ1Mw?=
 =?utf-8?B?byt3NXRJRzNobWRSc2V2aXBKVWFhbUZ1bmxCWFhnVTZWZThqZTB5YTRQVlBB?=
 =?utf-8?B?d2lSWG1TNnZGYmlVU1VJYllmNWQxNDlLQmxlcTVBZThPK2I3dDI0OTJZajJR?=
 =?utf-8?B?QlVldFNyQXZMTjlTYTFXdzg5ZUQvZXV6b3pUNFZsUXBFUHFJTWNoTnBFUE1w?=
 =?utf-8?B?bUo1U3ZmSlpqRjJXMTYyZ21WR1paNk56S201cVgyOUpGdFVUa2phQTNUY0R3?=
 =?utf-8?B?SkVMY3hHSUdXaUR6WTRpWVBHcTNwRExudjl2UVRmOVY5bEpsaThUZTNlekhw?=
 =?utf-8?B?VXhMOWRKTzgySFBCNUN1QTBDZldyU3RDZ1JwdjB0MjVPNnZkR2o4eitFZWdO?=
 =?utf-8?B?Ni94TkFmcG5ZOG9XZkhjTFdiWGRPVzBNbmtGSlRnWmRlSG04Qy91VnJhOWl3?=
 =?utf-8?B?aS92WlBuVW03eEFZaE5YcGxvSUp2ZVVpTjg5dGJGSnVHdUZWZkZ0N3FxS1JI?=
 =?utf-8?B?TUdxbzcySHpNOFJENENQN2dZY09MTjgxcXZhNGszRitUNThEbVJFWmdHNkMr?=
 =?utf-8?B?Z2NaUUFPNVJwM0pCYTNDbSsxNGhpTGVsNFhHa3hzbjd4NllISk94M3pVRy92?=
 =?utf-8?B?SW1GTzExUWZ4SlRhZkhaMFhXVVZ3SEVoVzR6SnlVMjBqZzRndDI0YU5xOG5L?=
 =?utf-8?B?TGtuUzhic2U4Q3NOdEtsY3lXSlhXRENmZnF6WW9PZDR3Qk9nRnJWb1VwVU5o?=
 =?utf-8?B?ZGdKS0dQeVRxTGJvM1ovV3FLejFzTHk0dU4rOHIxQ1NQZktSTit2Yk9XQ1Fu?=
 =?utf-8?B?akUyVXlZeVVjYVE4UWZwdGxwTjRtdkdPL1VGRTNUWVRWQVZnQ0MyclZTazBx?=
 =?utf-8?B?eWlIdW14ZTJlbVhsdlB5cmlEN2tva0FtbENTRnoreFVOcFhiQ3lqaU11SjJJ?=
 =?utf-8?B?ajFnbVkrVUVwUjNUYU8ra0JPM0ZXS1gyS084c2pRa3VROFdZdFB3TkFHNmJh?=
 =?utf-8?B?REEwRW0wVWlWQitvb1B5Q3pSaTh2aDVkNVZOekJZMjd0T3V6S2YzMGNOWVo5?=
 =?utf-8?B?SzhqUWpwZFhDRlFpVVh6bDhWMnFVUnlvMTA4aDNiZVVCMWxQMG5HUE1YWXY0?=
 =?utf-8?B?ajgwTlJYbXVVSW0rbW5od3Z4Z28xbWtUaTVMVlhXekh6QTU1ZWo4Uk8zRnhP?=
 =?utf-8?B?UWE4aSs3SHhlUzd1VFNlckwxR0p3STVzSUlLUHJuL0tPZmc3SXhXejFiOHVX?=
 =?utf-8?B?Yklkc1drV2VDcHFkczBFM2tTODd5bGhmcnd4ZkcxYnhoMzh4RjY2MkJweVli?=
 =?utf-8?B?UGxxaUxJc1VNQnhKUzVkb1dBT3hES3B2SS8wUHNMeUJ6RlRlRGJVVTFYNDVG?=
 =?utf-8?B?cmlXaEUvMm4wK3VnZGZDSmNHZXp3NXNnOEl6aFdEQWVRYjJQRWtvemh4REpG?=
 =?utf-8?B?dDNBejVUN2N4UXByRy9yZkM5eVNBZXZCQ25FeFNrQjRmNlZmYXFOd09xcUx4?=
 =?utf-8?B?V1RvSWoyckppdFVnU1NPSzJ4b0JmcEsya1hPamRaaWhHOHNLRVJnMk04RnRl?=
 =?utf-8?B?N00rNE1ESW1DL09pYlN3QzlXWTJoSU1jL2d1T3hvMkVtRDNwSmVXbzJocDMx?=
 =?utf-8?Q?+42bG7U35P/mqCDOczicPv3zznjPCaHZFAqge7P?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7a1300-9af8-4527-9da7-08d96d433033
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 12:22:38.9616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxq80SHEy/Ufm2cWuQDlIiXBKV6ijaXQtiDjVQFelaBkG69Oy9CfQUDJQWJRS8NcnAYLMi76zIhgyhtFydT+YCipq2Iy6uzHf09NgVoIbh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2221
Received-SPF: pass client-ip=40.107.7.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_NONE=-0.0001,
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

06.08.2021 12:38, Max Reitz wrote:
> Clearing .cancelled before leaving the main loop when the job has been
> soft-cancelled is no longer necessary since job_is_cancelled() only
> returns true for jobs that have been force-cancelled.
> 
> Therefore, this only makes a differences in places that call
> job_cancel_requested().  In block/mirror.c, this is done only before
> .cancelled was cleared.
> 
> In job.c, there are two callers:
> - job_completed_txn_abort() asserts that .cancelled is true, so keeping
>    it true will not affect this place.
> 
> - job_complete() refuses to let a job complete that has .cancelled set.
>    It is correct to refuse to let the user invoke job-complete on mirror
>    jobs that have already been soft-cancelled.
> 
> With this change, there are no places that reset .cancelled to false and
> so we can be sure that .force_cancel can only be true of .cancelled is
> true as well.  Assert this in job_is_cancelled().
> 
> Signed-off-by: Max Reitz<mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

