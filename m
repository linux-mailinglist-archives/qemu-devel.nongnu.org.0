Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179C537263A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 09:07:29 +0200 (CEST)
Received: from localhost ([::1]:36322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldp9U-0000fp-6M
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 03:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldoyf-0004i3-58; Tue, 04 May 2021 02:56:17 -0400
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:12807 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldoyd-0004hk-7c; Tue, 04 May 2021 02:56:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCjgj37d13smZNap46/1lrAioenOP0PLe7hp7HORx12QZtmJ7rLnWyM7viS3eZpFDE2nRiLcYOl1fZ83GEKv6A8qrHjuimHiQ0mPOhEaeF8MF+C+U/yhgmKLKdAm9MeSce0A5pGdafdY7jncNLbAlUKcplwx7qSs+cQOqr8klT097xmQkJfBr1rL5A9IehihEX8OsUZA//jrBkWzv7MwBM95fcmZv9w7QJ+k2ZGKDcgo3ygOCmDaBwKULzrVUYqFwKRES+TwqNYtHNOJnHK1XX4QWWhEZUtJ0Ozc19NF8rQKFG3qxJPNOr9Lv0YCM6PKTOwWxIWVi/ORIPWgJkzZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLqQo/xqXwDXxGgjqGB6+LQuO6GBCRMX8Y+C5g+irFg=;
 b=Y6UHzBAPg/CAC2Oh0Y2Scc0R1vPcppMNeun/yWkXFj+uRo3AXs5U8z/jM2zTQiWLTcZ7PrKpGV4JMnI6G2fTwCNe4F8oZcuQvHGogGMyji9/mBopLjwlEx/U7cfkjxMqYtOG+5/QJZ1WA4TGPMC8P9yoOFV3FUZy76c8uA9bmbO/85+tFNQKyA/SHoqieAJ0/hI71yKmHKOhGOc/+HPuNuuqbB/4GWUl1ZsCSjf7/aV5VJX+5HcPLpKxV95HNh4pwqFfLD5NWVvYESmaRCgIh9ylqRgOdjv7hKMn92ySx+5WwY32+sywt76h7Zk/McuLpyQKC6Qbl0x4aSgyORS+4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLqQo/xqXwDXxGgjqGB6+LQuO6GBCRMX8Y+C5g+irFg=;
 b=fw2rCiNZQb0zdAmaslOVTWOu8Nra4hkW8CV6ZTvHDgvuEaHW9c+5n3/98b6BAdhVqur4APDNu52KGW86vIjRbGDnL59i5efJwhUZlxFWwHmKkZ46lLQknXenxBQKwZ5iM0tXZUyx9SxBiiYR66wYlfZnri7KfW41iqAKE1vVFPE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1779.eurprd08.prod.outlook.com (2603:10a6:203:2f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.42; Tue, 4 May
 2021 06:56:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 06:56:11 +0000
Subject: Re: [PATCH 0/2] block: Fix Transaction leaks
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: mreitz@redhat.com, qemu-devel@nongnu.org
References: <20210503110555.24001-1-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <306a7acd-87a0-aa31-16cf-a0c00a281d6e@virtuozzo.com>
Date: Tue, 4 May 2021 09:56:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210503110555.24001-1-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: PR3P189CA0072.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 PR3P189CA0072.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 06:56:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9d32b34-0f9d-4839-0694-08d90ec9b355
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1779:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17792A8B7CCBD5762A12552EC15A9@AM5PR0801MB1779.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kccsoBhOFcGfsOt0kkM7zR1RaCGyu5oag0W9ia9uy1SdIBfDskDJ5ruGdrlqrAwnyh6pd9PwRWHBKab+udpHHWqSJg9WXmcEIHr0s+4Jn/8v10cla4B9JxWdQSovguaarvMpsgUhGZcLAICoQ+HsWZRni2bHTUlZDrAHCG8xeAJ+SJBTWsxqjmSO9riy4yB6P2aYV1Q+/kPKXxUJRzsBIvtnZbstsCuwTIrfYgrf5JsHAFTolpbXacgnLgG+itAKCbC7A9m09zkBoe4MU+Zc/+qBD3U94DJ2BTxWU0cjQzLdcMw8MEu8sYeKDfJnGjyWBTmEHmUFAeNu9RMiLweBs9B5Z0S5kuJ+aMUSfnvBOzwgKEDJPo+rgv7u5RuA+AhvhvwpMvKvuNUoFGgyWxCEWkHENntq/nqObu1qkQTu95HtYTm4cztZoddr9QNw82whjlU74NVSJ1CtxUboGNRMhQdL67RGI8On6a906JFmpxFbR8FmI5S9/nYmDuiu3fvQ2+XkLk58ROGKcU7BqtfzKovz7nfaYD7cAVhk126eNHOsitAndgvyD6HzP15kAcBQNZengtl1XRAAUbDWduKTA9dZv/n0GaNTCGZGL54j46vJcpSZJ1/M4exdeTPbTd+Cb7NCkIwijovgHDsIzM1xnK0XtjEMt8+HSEZGgJslDx2W6cREzhx0yYkwzKDGqlm2AW+oX1ig6iwfuaUb/Nide0JS7OQkGr80bakmSFWu2q4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(136003)(346002)(366004)(52116002)(6486002)(16576012)(316002)(5660300002)(36756003)(478600001)(66476007)(66556008)(66946007)(8936002)(4744005)(38100700002)(4326008)(38350700002)(8676002)(2906002)(31696002)(86362001)(31686004)(83380400001)(16526019)(186003)(2616005)(956004)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d1FmaUs4OGN0YW95RHlSdHg5ZnRBRlNueGtwTHlPRlRvMzZyblJlaWlvaEhT?=
 =?utf-8?B?dHJUcGJGK0x1UjJTemZYak13NjVRYmovcWlobm1sekcvWjdiTVZXdldYUnIx?=
 =?utf-8?B?eHNiTGJmdWZlNlRMeFVIZVJKdU9lU1VPbGRpTXltaW1JWDlwdUIybmVaNTRh?=
 =?utf-8?B?aG1yS0U0STVvWitMN3prTEJmU3dZUEdPRDJnN1QzRmJuZ2MyOHkvYlBBM2p4?=
 =?utf-8?B?aUhOWlJrbFRwRzN5UG5Pb1BmbzhENmJRYVZEdTAvd1JJeW90TjRtSTZFeXp3?=
 =?utf-8?B?VFZZcGE1dEduM1BHSWwxQnFCU3pJdjYrcWY2QXNYeURvRk80T3dCK3JuemJX?=
 =?utf-8?B?S01uL3ByWlk1eDZ3QkxnWjZmZ1JJZHl5bTJQaDMrOFdqamlTRTYwQU9MczlO?=
 =?utf-8?B?U2NqVy9ZVG1rT3BXajV2cE5vT1JQWlZhK3BLQWo5VmVhN1RIVnBLMXBpTDJG?=
 =?utf-8?B?dTl6UWNiTXl5VmlZVkZFNEREeGpQWDlITDBEZCtSZnM0aEhQWE45TjZKWjdF?=
 =?utf-8?B?a1FXOUpMYW9vR0F2YUlheU5TUkVEZmJ0NThTVngvR2pKcXNHY2NtbnB1dExC?=
 =?utf-8?B?Z0l2czl5QUxDNFVIeTBvT1ExdEdyeE9UOU84Y21BVnVyVDFRSVdUNGQ3TXdF?=
 =?utf-8?B?aFo3UGpTcUh0aWFMWDNReVJkb0pXYWxpajl5Y1NyNHRFNEsyWURlSEJleHdB?=
 =?utf-8?B?U05INnhaSEhUbXFtVVp0SFNES3diNE5kMXE1YTNTa3Q3c2Z1UTNFVmo2UU1h?=
 =?utf-8?B?YlgrK2RhTTVaTXhmVGExSXNxMG8xeUJUZnFmSjdoRFlNZ2Jtb21nMWE5cXM2?=
 =?utf-8?B?V2xxTXlWcWZYQmJPUUlwVW5FOW5xUE9OQVFCdjdHaE5vaERRTnd2VW9VQ0E1?=
 =?utf-8?B?WW5US0VOejZGOWF6WWU2UFA0dzR0T1V3ekQ0RTI2NGZva1QzRzhMeVZYNnpU?=
 =?utf-8?B?akc3SnVDS0xaOThma3ZIeS9HaXlNVjQ2bEhoMHV6ditJNXZBRkVLMTAxdmhX?=
 =?utf-8?B?UWpVSlhEK1djNEl6NWVlVmgrY0FVQW9RR283a1JPOFRyVXlJcldEUDRZeVN1?=
 =?utf-8?B?MGZQVnJzcS83aWEzTjdxa1hpQ2J2OFpNUExrbWFMSzFPNlBjSUR6Vkl2VG9y?=
 =?utf-8?B?cnNPY243ZzZLankyREpXTCs3TVBMS3ZhVzJCS25jS2gyVC8zL0QyNVBCNW5H?=
 =?utf-8?B?MW9lM0pPVGFZNytWR2dwOWJQV09EU1lKb0t3T2swRUtoTkMvN29BMXlWN3JU?=
 =?utf-8?B?ZlVUSW5QNlJUMnhpWkpNcDlzVmZQV1FNemxvUXhFQnRBdGJtNGdTZ2dLVkk0?=
 =?utf-8?B?bmNNZVdxZGdBeWw5cmh4QnVqWjFjVjJ1Y0lDaUVGd2wrMU9LRVdOV1IwS1Nu?=
 =?utf-8?B?Z2t6aDhXZitDcUtITmwrYTVuWXFtTSthVng1V0NEcDdIYjRYVUlhQWxsd3lR?=
 =?utf-8?B?bXdsZlgrMzVyQUpLR3dIZWQyMVdya2xMSzBGQlJSSk5jbFZVQUdEd24wZys0?=
 =?utf-8?B?YVgwQ3NrZkhqdXl6bCtETXIwaUo5Sm82dEluM3FFbGFwMWFHNVIvbjYyS3ZD?=
 =?utf-8?B?ZEw2RVNCV3VUOGZhRUFrejNoa0hUVkQ0K3BSM0hXdnZpKzcwQUMzbHhxYllw?=
 =?utf-8?B?RjVNRHF2Q2t0Qk5ZTXdQMDU2NTdqNUlwb01XcUVxOFUrTklaaWY4TllKYVZj?=
 =?utf-8?B?YXBjOHVwaFFDRXNVUytJWS8yeVdRWi80MUhtN2dxanEwU0JrdmdvbEVMTmpq?=
 =?utf-8?Q?+ee6jsdo9DX1bV8lkjk3Sluai6BCm/fl8dYz9BY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d32b34-0f9d-4839-0694-08d90ec9b355
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 06:56:11.0341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31zc0RfO2s/57+558sSqC7xj822xeKT266LYb3iMeaLw8GB/aZwhv535RO1trLbqhNMa5yPW7EkVYO3ySFz3B6aC8YsP75KIFqoTkh5eMkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1779
Received-SPF: pass client-ip=40.107.21.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

03.05.2021 14:05, Kevin Wolf wrote:
> These are two follow-up fixes for Vladimir's "block: update graph
> permissions update". The bugs were reported by Coverity.
> 
> Kevin Wolf (2):
>    block: Fix Transaction leak in bdrv_root_attach_child()
>    block: Fix Transaction leak in bdrv_reopen_multiple()
> 
>   block.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 

I'll rebase my "[PATCH 0/6] block permission updated follow-up" on top of this.

-- 
Best regards,
Vladimir

