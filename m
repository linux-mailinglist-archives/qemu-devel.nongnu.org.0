Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57531315654
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:52:58 +0100 (CET)
Received: from localhost ([::1]:56434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Y89-0003Pj-Ed
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9XyD-0001rO-42; Tue, 09 Feb 2021 13:42:41 -0500
Received: from mail-eopbgr10099.outbound.protection.outlook.com
 ([40.107.1.99]:10542 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9Xy8-0003dp-I0; Tue, 09 Feb 2021 13:42:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPuCzgaKqNr8Zg/pYSB8OyBtJTOyOQzKtNsIrwk47McqXaCmbw+CncjHWfiCG+nE2QvdVlkY4rYNNuqmauWuYFuT3MDvebNXoctUNfmjAYf6ZCtsMoOpJRqxHQfAoHDg/BOIu99JmsZlg4KdZaOFl5+6tktyrAhJFAz299kDnucV20TGUwAtg1dUXcmNNbEh6GqEAw6h/OC/+9WYZ9e+hsgRnzueNhlyyPhFdl1eLZOIuhPCn52cUGyKyXnNjDGm1AFwyftRihFKA9pOIDa1IxwGqaQYv+fxiIysnDik97M/pyO+/+o8iS3GatnJDLC3vDRJyCZi2AP6kdV8RuNk9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRkNWY4l4WpPr8jYjPGYTxui+Jmh69FvJXoug84JbGg=;
 b=dV5HbRlFyDcX2ZZCDw9LTnCS5mxQxr3XCSC61EAjvnGDXEdAjceomNG4Xwkwckm8KPvNNOIWeWlmrC0LDn6PaXpRlsYlqnkbNtq6s+COym8X32TuSJYtggTgDCf/STN2cnPNi6MyXnDn/98UUACbvNP7758pnd9XUiI3y0t0mIVNQS39D64rnCBr92J2K2Nr+5M9+V2Dm4JCbQBMGl1SlvILU8itPP1S6dOb9rTbhEH5LQFMgJbQVz7hg5RKZyxrht64P0uv6uCAobecaBHulJMeDfZYsHPJ8MAHIH7lduCyvpNkhM6E10RYSP2WJZIILmse2A3yerCMbPAXY314WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRkNWY4l4WpPr8jYjPGYTxui+Jmh69FvJXoug84JbGg=;
 b=Sp9AckyS+rG7jZkzOIeVF68VsdCMpu3uikk749kWNurzqP1T1z359CDr3BxGmBqhbn31Rg+InuzHGHplhzXdewlrBnsYj/IM5u3prUlmskiCMf+26EgrqO5cAOkTP/qbt0F5xQAt/Me5dXTFxpGAst+i8u15DRBtrKGUJdLwz8k=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3159.eurprd08.prod.outlook.com (2603:10a6:209:46::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Tue, 9 Feb
 2021 18:42:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Tue, 9 Feb 2021
 18:42:31 +0000
Subject: Re: [PATCH] iotests/210: Fix reference output
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20210209181923.497688-1-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <db571ea7-ba88-bf3f-0e62-a9468a7f5d09@virtuozzo.com>
Date: Tue, 9 Feb 2021 21:42:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210209181923.497688-1-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM3PR07CA0141.eurprd07.prod.outlook.com
 (2603:10a6:207:8::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM3PR07CA0141.eurprd07.prod.outlook.com (2603:10a6:207:8::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.11 via Frontend Transport; Tue, 9 Feb 2021 18:42:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef89eb88-d062-4eac-eef6-08d8cd2a7581
X-MS-TrafficTypeDiagnostic: AM6PR08MB3159:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3159FBB8C96E5B76FC43ABABC18E9@AM6PR08MB3159.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +BfZTRyJ+ToTQKx8LCrvsi0fXS1vs1TuaOE4E92cQAQPsHGILTNCovvph0sdkgTeq/jzM3BuUFyLqF+LBrKJGN8KwqL20Et1JbB+0wRLoVZrPQAw3hTE7HQ+05obUlENk5jGMS3SxNbBHTzcAcRGaVdASHmq/4C/n5lCnZiqLDz7FVDYJAK4NZOB7KjeRj3HqFjuuKBnAJaJ5cYkd4Z3aVf99pu5B5y64NEEUM0++k1g+CQ84T3KHql7y4F5sCky1RNgLhe4ZH6QLnaWtOA8dyzbOcz0aBUeVmXmYNxzeP8z7G8bF0nK94OJe7PYNjANVGxrhnnmBVFLtdtjkTDmpB0BaN3/JH5uhmZTfeawvR6dex8YHWNijnOlnNifj4svpPbHNIJEo/qKEq3oe0y+JR05uxFLllQ/x9ksR+z7pgy2mz2PsDMwrDGlf2pibVv45fBY6bprrEiBetiB/ckJo206xaodlmZj5qc1je4KyZCNvek9qalOBO6SvgtCw4Ehjf/Sp7AEVHuVQk16bQexoHIl54Vg0m7lvlJNJxzT9C/feL8EQ4Y7KtA/1Dusvg+HVAlPIqPijEGwqG33Fn8G6g79gurydwlFYzEcb1RxWIY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(86362001)(31686004)(2616005)(956004)(4326008)(8936002)(52116002)(5660300002)(2906002)(66556008)(66476007)(83380400001)(31696002)(16576012)(8676002)(26005)(54906003)(16526019)(186003)(498600001)(66946007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MkRJdWExeVpiVG1vMy81WEo4WDRyUXpXa2hTeWI4TWJER0VZaCtjVnRSUXNy?=
 =?utf-8?B?aWJUVUZ6Tnl3bHU4eDdDekIxWUdxOU1admdFamlnTmNzT1h1ZjU0R2VNTDhn?=
 =?utf-8?B?bTB5VFp5bnkrMk9UcHNwcG51MkZiOVZtZDlwVGRXM3dqZWl1WTdMK1FzZFZC?=
 =?utf-8?B?aGdnU0hvYXUybWtUMEFDSmE1dE9zTFZ5V0tTRDRXMG9iRENvS1VRTXhOc3gr?=
 =?utf-8?B?KzBwY0QrSmUxdmNibjJhSDFCVEFSaHVTNzY3S2FtQ3VmN3YxcEZBdTZvdEVR?=
 =?utf-8?B?WEZTNzRkUjluOUJ0VE9EZ28wLzBKU29KQ2d1d2tOWTBSZVMweDVDUGVZcEk0?=
 =?utf-8?B?YmExQTU3Qmx0Qkcza1RTNGRvQmdjaFVBQ1d0VXpic1JHKzgvbndMSVJWdk5W?=
 =?utf-8?B?U0dQUktjM1AyYVZISDBtZ3V4NzdOdldtY0tMb1ZnNGsydXg5eWRxYk1TS1Rl?=
 =?utf-8?B?YlBMKzFReE81ZlM4VjN5S3hha2ppUFc2eWZCRTBZZGhYanBlNis5Ry9iSlVa?=
 =?utf-8?B?bW5jR2RBbGZlWmhLeDN2RWJNaHc1R0tEMVBuZlJsQklQSEhxWFFMUGlzdnZP?=
 =?utf-8?B?SWgrYzAyRkViYUM3cXJBbDc0bWY0WU9OYUtCeDY0d0R1VW5Qb0ZXMzBPZzJp?=
 =?utf-8?B?K2trSkZGbXlVcEJTSWRGdENWaFFtMG9MNTk3c2QyTUd6SnRaN0xPTWVheEdk?=
 =?utf-8?B?SkcxUUpMRkxWNWdIcDU4aCs2VlJ3TDFjMU5mMDlmcWR4NDgxN3ZNUkV5U1Rz?=
 =?utf-8?B?d2ppR3ZUcTF3akh0ZDlxWWJndURrcWoyclJwcTYxTnQySVQwcFFQYkRxK2JN?=
 =?utf-8?B?UmNnK1R1d0RQUmlLazYrQmd5ZDZPNTdHaCtvS3loY0QvYUlnb2pJZmNRakJM?=
 =?utf-8?B?czhLdlRyd2JEZWFsUURHNklCS1c2RGdOcjBZOU9YMy80Nnk0eWowbGJsWUxK?=
 =?utf-8?B?UkUzd0RlNFlSeW5BVjRJVnBTNm1KMWFNcExZL0xyRFlxeEQzdUUwbkFIL3Nz?=
 =?utf-8?B?U0tNWXJnYkhUeWNXejRTYjdSOHA4bHVReUU1QkxDVFc4RkIvalhMSDZVWW5r?=
 =?utf-8?B?elVQU2JzNVJzQThmZDV4SkRWc2FrVmNmWGc1NFQxNnhIanNUUXgwWXM1Yytk?=
 =?utf-8?B?VEx0ZEVJVy9XZ0ZtN2xhMFAvZDZibDI0SHNGNEhYbTI4RjZJSGIrcXE2ak5V?=
 =?utf-8?B?V0pvdlN1eS9aNDM0VXYzTE5aQ2Q0S0MxVkJNVCtoeTVMWUFsa1MvU3c2Qis2?=
 =?utf-8?B?dWl2Tmhnc0MrL2hYTUdrWnVlb0JiYS9Qb0VjOHg4QTZpYUhINXBnd3RQSTBG?=
 =?utf-8?B?bGhybkhXVWdSSEcrNHo0dmw0NUVmNEE5Wkw3UGxTa2lvZTlOaHZ0M1NhTVIv?=
 =?utf-8?B?N0JidVIwSWhjOGEzaTVEa2x0eHZwMjB5WnI1cEVJVDRaVi81WFhUNWpGR0ZU?=
 =?utf-8?B?b2VwekVVZXozUjFzMTlSM2dvT21vQ2orcVBjWXY3K0F3b1F6N0twS1Vjdklq?=
 =?utf-8?B?YlpRclovdUE0L2FFTmYxRjk4YWdjdXpLNUM1K1BUcE1YR2tHMy91TDZVRVpH?=
 =?utf-8?B?Y3cvSllQTnZNYjBqZkF3ZEpCQXlUOUQrN0ZvSi9CbDRvUW9Jd1ovMUhGa2tQ?=
 =?utf-8?B?R3YvcUxpWXpKNVVDcnZUR3RxbTloclVrOS91Mk5FcUJNM1RiM2c5OFdpWHE5?=
 =?utf-8?B?Nm9pRzA4R010aVJmdVUrdG5CTmhnNDREYVprS3hXM0RVWDhobHZ4NFhHQVRt?=
 =?utf-8?Q?nFVmRBIQByfQKpQsaD6m56Cn6s9dvookcjmbuV3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef89eb88-d062-4eac-eef6-08d8cd2a7581
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 18:42:31.7611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9QLT8qK/obFBlWlDEAhY4nK3FQuEjZW7+gg0StrFzS3e3EZQz/vf+cWNyGHIT5ofSYROeYlLRqhcxpr343doDLz1Vrl508TYJo5gf7TrmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3159
Received-SPF: pass client-ip=40.107.1.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_NONE=-0.0001,
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

09.02.2021 21:19, Max Reitz wrote:
> Commit 69b55e03f has changed an error message, adjust the reference
> output to account for it.
> 
> Fixes: 69b55e03f7e65a36eb954d0b7d4698b258df2708
>         ("block: refactor bdrv_check_request: add errp")
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
> Fun fact: The branch name "fix-210-v1" was already taken for
> 8ba9c4d9b088d66aebfcb019f61ddc36fba2db88, which was only two months
> ago.  Ah, well. :)

Me again :( Hmm. I should definitely start running iotests with -luks, not only my favorite -raw, -qcow2, -nbd. Sorry.

> ---
>   tests/qemu-iotests/210.out | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/210.out b/tests/qemu-iotests/210.out
> index dc1a3c9786..2e9fc596eb 100644
> --- a/tests/qemu-iotests/210.out
> +++ b/tests/qemu-iotests/210.out
> @@ -182,7 +182,7 @@ Job failed: The requested file size is too large
>   === Resize image with invalid sizes ===
>   
>   {"execute": "block_resize", "arguments": {"node-name": "node1", "size": 9223372036854775296}}
> -{"error": {"class": "GenericError", "desc": "Required too big image size, it must be not greater than 9223372035781033984"}}
> +{"error": {"class": "GenericError", "desc": "offset(9223372036854775296) exceeds maximum(9223372035781033984)"}}
>   {"execute": "block_resize", "arguments": {"node-name": "node1", "size": 9223372036854775808}}
>   {"error": {"class": "GenericError", "desc": "Invalid parameter type for 'size', expected: integer"}}
>   {"execute": "block_resize", "arguments": {"node-name": "node1", "size": 18446744073709551104}}
> 


-- 
Best regards,
Vladimir

