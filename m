Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C342F4D57
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:40:18 +0100 (CET)
Received: from localhost ([::1]:44140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhJp-0005ng-7W
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzhBb-0007Eo-9Q; Wed, 13 Jan 2021 09:31:47 -0500
Received: from mail-am6eur05on2118.outbound.protection.outlook.com
 ([40.107.22.118]:9505 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzhBX-00064S-O7; Wed, 13 Jan 2021 09:31:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVj6R3p6X9PCbDKqiTmGCguD9EFfDGghTeHxWNQ/wY2cg2HNdZWgyIeifdxy5IUctVbwcBnmw063EYdB5XP/MAV28ohVfOwubo+JM7KBiJGbuAIvrGxoey6g9x2gz5ClQCHrPlyM8fTn42KAaPnHoynT3vuHpFBIFM1x8MvTxWNiQGC3xmNkqCriASiZXeQFEneR/Ruhd4MnH7Sat61iIhhEqnmxp5rFt0695pFzKmwLJxraqaP+to/+zdkPPUzH+5d8t2UxJ4TT2bWDmvKMWwWK8NqjiRQ2EcrIrVrFMPKn//tRQgipe8H7SqZleGYjnJzUrmtMBP5PB8hPhEiofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S0yXMGDkpSuzwCT0qwWFUgbT6aa6LzPZ56zgloMsH4=;
 b=HM+VE2LnKyjophUqlJevoxF3gWquzMWBiAOp4n36NWIddn9daQDGO46SgiljoTRA6F03/cDwUwsGT22moUoKlS+An19xYOx/XYWpZ5Bf6f6eN8ywmKGwl7UXmtD7ezOaRqB1V3NIv9GAmncYnRKP5imvrwx3lO3e5qhsD6HGFHKTZ2b1Su+l3iaLd59iTQXCwgeJQQtAazUpF8u1VT5sgpD2W7N33uqxnU88yKQypgXtKEliUSO0xNXfrr7uhfB6e9n/RGUraEX+dUyy39Yv8MWxf8eCcBPfTgJnVS5IhEYexklnX+xVK7DMbn2UJN33whN8DJOjo5Bbw1J+C/FCgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S0yXMGDkpSuzwCT0qwWFUgbT6aa6LzPZ56zgloMsH4=;
 b=vaPJ/4kOzqk4vfi7wM7d3Hk7Y3i/O+Cv+miXq3+bTdFyHoZYGDQt37eY0Y+Jd5nVsb9oSok5lv5Q/NYdR4ZFAIKRhN4ZCIVncObkTQGCfPQTpWPQq+1QDaJOJ8YEUnxheCilX9uP5VcY24qbWnB8d5FF2Bu1a/FSa1rFI3Gtgmc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4849.eurprd08.prod.outlook.com (2603:10a6:20b:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 14:31:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 14:31:37 +0000
Subject: Re: [PATCH 0/7] iotests/129: Fix it
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113140616.150283-1-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <746f2be4-4093-fcff-fddb-60b0cae74c31@virtuozzo.com>
Date: Wed, 13 Jan 2021 17:31:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210113140616.150283-1-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.2 via Frontend Transport; Wed, 13 Jan 2021 14:31:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 623eb161-a1f5-4aab-a2ba-08d8b7cfefa0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4849:
X-Microsoft-Antispam-PRVS: <AM6PR08MB48498CF01D87A024A51B70E0C1A90@AM6PR08MB4849.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yq1COGLIv7vFkjaF0PEFYrHOlPOgjXLQDMcdr3XScl+vVIB8oNy7e7phgNbQ5KbZrCkzQOXs7WubiGT6IdpGLvqG+RbGMog1CHdhJezjCsDhI2JM4iY1DubzQ4oLGdiwGFsro4fArq/kiBtJry3Ug2qngNTpK1c/L5dzEwDP1P1eNjZG0vGOXdLA1D1ZU253DZegk0Y4u2xIs1MB3UX+v+niSts9jH5Qwd3a3avXxOiZSlnOswantATA5b1A6YhIG89kQjVImsI7RHGNFD7HrKRwiiOpI/zLwUhPsuqiQM1w9zYD+B4vSt4RkXggGguvR0i/TuYaJ20oqCE/ULRsrmhNl8yr7I9buDISXXMl4pObbmTsT+695C2zr34izbiJl7mrbkhYeWMP58UoZBQWNCBIjlPbeNMRPQXzU0x8RdjgqLaUu1em7bq6gGydD7nC7qj9Q3cOmrbSU1NHIh2aChSj6k5vKOUngJ+qfwkK16c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(39840400004)(366004)(376002)(52116002)(86362001)(83380400001)(2616005)(6486002)(956004)(16576012)(26005)(36756003)(316002)(16526019)(8936002)(4326008)(66476007)(31696002)(66946007)(186003)(31686004)(66556008)(478600001)(8676002)(2906002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S2cvdHovMm5FSHdqSGJkRkRmTnFrczIxWFdHaHA1d21VQ3k5clhOUFB6WnJr?=
 =?utf-8?B?VkpvZm9LYWNXaXlIeFhibFovRkRwRk5iVGRoMWVmQS9qbXRZZGZMWjB1alE3?=
 =?utf-8?B?QklsdTN0UCtTRnBJa2JHUjJhQU5zU0puU1dGQnJ1aUU5Mjg2Y3NIdDZIYkE0?=
 =?utf-8?B?d2tKWTBOdFBIWEdBaEZYaktDQzd3aml2TTBCVUFGOFI3U3h6cnZUb0NMU2s3?=
 =?utf-8?B?NWRzVVdncjVKRkllblNSUDc4aktheXRzd01US3l0RmZKMlVZYzVwM1o4M2xZ?=
 =?utf-8?B?akR0ZlkzUWVOWUR2UllMdldSYWUxN0l3SFBqbjQ5RUxXb3ZzWi9pUTVDaU1y?=
 =?utf-8?B?UmcxNzlVWUpFM0RuMFpBdDdIRHRiYXd1NEs4UlArWDVQMEQ1d2J4MUVpVFdG?=
 =?utf-8?B?aEgvUllqNTcxUURGUTZCNDAzaWpRZ0NJbkNLSFpSbUxDTmJucWhsUkxCREVN?=
 =?utf-8?B?Z2RrVlJJaHVjWnBSeU10R09pVGg1R0xpSHIwSERnRFlyZWMwY3hkdktjclEv?=
 =?utf-8?B?Mmd2WGZhTWlGMnJiejNoN2dSUzNKNWhkUVhOdzQ1L0tBVUpFNE5QVmJ3aVkv?=
 =?utf-8?B?NlRRcG9CYVlWNUcxc0xrWG40YTJ2UzhicWx0QU9uYmZCRSszMW0weTNKN2I1?=
 =?utf-8?B?U0FvTkQzejIyanppZWFkMFpMYWpKUmJ1dkF2SWcyQUJzK216Ky9BdlBnL3Rj?=
 =?utf-8?B?NkJYUE5UV2V3RUFBbytiYUVDRWNCZVU5aUU4ektPTVM4K1RLUUJiZUU5V0Q5?=
 =?utf-8?B?SHZhakh3Rkx4OEJXeTZZc2ZNWlRLT0ZoUWowQmZwTlc2dEJsSDJMY1hQakZL?=
 =?utf-8?B?aWlQYVlPSXkweVpzTWtCdWg0bzBncGtFRnFiRWdubE9qV1VRWi9rZ1FGVUhP?=
 =?utf-8?B?R1RMRkxDQ0ljYnlud3FkT1liUWsySmJJU1FZUUI4T0ZiUXZxVW1za2owRjV0?=
 =?utf-8?B?eEpDMUZXMFp6ZHRSL1RITDMxN1Y3eHYxVjBNY2EvbUo2eHhtTlltUWw0L2RB?=
 =?utf-8?B?S2xWd1k2T0VWZzZGNjBkdWdHdTFGTVJJMVp1SVZMRmkvREZxRHg3b29UQ0hK?=
 =?utf-8?B?MFB6bTFBR1lSc0s3Sy9yY1lNQ3VNVElISWtyQlZJWGlCdzlCYm9WRG1GMlJ3?=
 =?utf-8?B?YmdIaFpkaVJoUld5U2p0YU1tVEhrb0lFQWYxMS9IZ0Nza1E3SWRMLzRxOVhL?=
 =?utf-8?B?R2xiaUlqMUFCQXE4OUdJNTNEUG90UDVIS2xZc1RSKzUwRncwUjRYd1g5S3py?=
 =?utf-8?B?ZE5KR3kwVTVvTndFdG0xT0hxeWZtMzFQOHVNTi9kNnA4SStGTENKcU5xNG1J?=
 =?utf-8?Q?gk5fEb4WDLnqgG4Ra+klFtPs4ZBK9Ae3+N?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 14:31:37.8573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 623eb161-a1f5-4aab-a2ba-08d8b7cfefa0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pssemVkz8ollaohnsU7ol2YRsWLp6wlu/KzZXRZYBTyEMXdVYUGjrlPiCnlHaOidRXRN8xQkXvuKQ1HoCHMGXM+9CzSbn8xCdHUuOpEKN3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4849
Received-SPF: pass client-ip=40.107.22.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.01.2021 17:06, Max Reitz wrote:
> Hi,
> 
> There are some problems with iotests 129 (perhaps more than these, but
> these are the ones I know of):
> 
> 1. It checks @busy to see whether a block job is still running; however,
>     block jobs tend to unset @busy all the time (when they yield).
>     [Fixed by patch 3]
> 
> 2. It uses blockdev throttling, which quite some time ago has been moved
>     to the BB level; since then, such throttling will no longer affect
>     block jobs.  We can get throttling to work by using a throttle filter
>     node.
>     [Fixed by patch 4]
> 
> 3. The mirror job has a large buffer size by default.  A simple drain
>     may lead to it making significant process, which is kind of
>     dangerous, because we don’t want the job to complete.

Not quite clear to me. iotest 129 wants to mirror 128M of data. Mirror by
default will have 1M chunk size and maximum of 16 parallel requests. So with
throttling (even if throttling can't correctly handle parallel requests)
we will not exceed 16M of progress.. Why we need limiting buffer size?

>     To get around this, we can simply limit its buffer size.  (And we
>     should make the commit job an actual commit job instead of an active
>     commit (which is just mirror), because the commit interface does not
>     allow setting a buffer size.)
>     [Fixed by patches 5 and 6]
> 
> This series fixes those things, and now 129 seems to reliably pass for
> me.
> 
> 
> Apart from the major issues above, there are also minor flaws:
> 
> - It doesn’t remove the test images.
>    [Fixed by patches 1 and 2]
> 
> - pylint and mypy complain.
>    (Running mypy with the options given in 297.)
>    [Patch 4 removes one pylint complaint; patch 7 the rest.]
> 
> 
> Max Reitz (7):
>    iotests: Move try_remove to iotests.py
>    iotests/129: Remove test images in tearDown()
>    iotests/129: Do not check @busy
>    iotests/129: Use throttle node
>    iotests/129: Actually test a commit job
>    iotests/129: Limit mirror job's buffer size
>    iotests/129: Clean up pylint and mypy complaints
> 
>   tests/qemu-iotests/124        |  8 +---
>   tests/qemu-iotests/129        | 76 ++++++++++++++++++++++-------------
>   tests/qemu-iotests/iotests.py | 11 +++--
>   3 files changed, 55 insertions(+), 40 deletions(-)
> 


-- 
Best regards,
Vladimir

