Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39363378409
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:49:08 +0200 (CEST)
Received: from localhost ([::1]:59170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg3TH-0004Yb-9W
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg3RH-0003r7-AE
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:47:04 -0400
Received: from mail-eopbgr70110.outbound.protection.outlook.com
 ([40.107.7.110]:37765 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg3RE-0002wb-6L
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:47:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=md5YWy4g4kBW2i+ZkumWd7oOVl0NZhqPvncS4ldPtl+K8lhWu5Pd+A3d8SL9StOkRrRJns1SVWKFTgnpvZT453HkDFdhyjY/ZZBglXXG+wzFwyGXoJaT6NqYVqMVmZ4xSjClUdH4irbdr2Lopa47KCk+krWOX255la9mfhEHrMHDxYXcimfz0ZH78d0rJsSLdnnFdZm8FAAJwhYDnX/ei1JSaScQL6WstT1s09ZRKXKu7+zZea/p7O44HFfz+9VmSAs3/ydVPJnF64gxoD63cQ2jE5J+EA9BrFazN0casPUNfkByD/r9NIN/+mXb68mMfaZnqIb0gwkkH/s8NTkeCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nx/tMF6ulEg/r4s65or1lH3DUIMNyKuIG2TeoQJlKUQ=;
 b=QYu5hfWCzKvom59I0lIqs85OJMWBkPtFCW+Gk7y/v/tSZMbpgIVy8XJ94wtDSodmw/FVUYfVOAFXRBcyqAMjQ7QhtNP3Eoa5RM54YZb5aR5HnXVns5kKEcKXMeDq5FGmYEk1oIOprkj7fSmqdEOqkLKcIaSUVeQExaBXCisFztdadpt54fXvRWowp5REJYyXEQqoCEeUQvYu7UiMLD50aXJ0vTDTNn5g9l/Efz8NLLg0vU5qDtKggnSHtxK97CtHFaJ6dN+FdQF09toivyxxF3ISc368iDHqmYeUdVGcOkAtiLcsJkLHw4rT/VsIBAh7HGv0pBGhCK64BOpl3uBVtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nx/tMF6ulEg/r4s65or1lH3DUIMNyKuIG2TeoQJlKUQ=;
 b=E+jpc5bx0BgBZXhRJXnDKMLvAi8JVQZSBFCDOEhWaD0BRnjD6osmUGZTi9G3R8Mbc+CCm16QAdA4BtbJJXfTDfSpffPL8+8HXdT7qZldz5q3SCdV0Ns9FxovlLJjBKn07960AhT6VKmlxxdsLqTWvF327GFij5yXoiAOznuA/uw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4949.eurprd08.prod.outlook.com (2603:10a6:20b:ee::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Mon, 10 May
 2021 10:46:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 10:46:54 +0000
Subject: Re: [PATCH 6/6] coroutine-sleep: introduce qemu_co_sleep
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com
References: <20210503112550.478521-1-pbonzini@redhat.com>
 <20210503112550.478521-7-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <158329fb-a392-01fa-d104-09263a4eff6c@virtuozzo.com>
Date: Mon, 10 May 2021 13:46:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210503112550.478521-7-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: AM3PR07CA0059.eurprd07.prod.outlook.com
 (2603:10a6:207:4::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 AM3PR07CA0059.eurprd07.prod.outlook.com (2603:10a6:207:4::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.12 via Frontend Transport; Mon, 10 May 2021 10:46:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b30e1e3-2410-4eff-eb7a-08d913a0ed4d
X-MS-TrafficTypeDiagnostic: AM6PR08MB4949:
X-Microsoft-Antispam-PRVS: <AM6PR08MB494958BBB21FBCC2814A052AC1549@AM6PR08MB4949.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZznUztGwRwQAFBoVb6AHfqvSGVXyRsGe+ALv9xSTyXCUv0XMA7umjh8EHQGD7SJGICgH/hdYyT7rno5Ks/WhDq6oVjXjhH7FRA8S07OB3zmbY7aD20qCONjCUeVnMVgTdiftueY/XzGmwklAa/n3Mz8z81vm+S1WPBF4Z5pmxJ3xQZnDS9QdsVQkK3mC30KuQMfeEhvKI6e6PVsQG4fURBs4jQlGe5JWv8g5x00GdNUxaUNgRW5sqI+nt2I8VawOvMB6iAnrJH5LfxnGcXpyQGOYAf2WplVAJlmidPgAuiZ9v97muP5o203Z3r2QQMdlsrr/6Iv0LbbT65xkx0DBdslwTfsUK+E7efnACL7Dk+eNc8JgRdfVwlq2li4moYXXRM1uYJyqNUj4ofAwh1ebon8TvtU64po0F3z9v7OwQYSFyomu5dc2yMS9xvFBa8zxr7vnwuRFzS8Mm26qDNmhxphLzdCZiAPnXOHFfV/pm/xSlGPDaOuDB02EYyuHDBHlH2HM8CLDWLvg3KL78n5kudRKRsQF2lopbGD2qwO6H42Er4qEKsIKvKs/vAuOhMiQi8//rK+drvLRpQsgcUmEvm6iL8H2SDy6Mm7PX1Q6+n2TPXlkoyjtdoDttFlU1hYhrJHR+xzmwLM0TMTSlemOVeZKqOOdV30/oCom9dQY4hMc7GV8nFc+trsEa68wZce4QMxMek7U13E/PtKB30bJpydaXtSimN5pB3a8Nh9ELms=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(376002)(366004)(396003)(31686004)(4744005)(52116002)(6486002)(2616005)(956004)(36756003)(86362001)(316002)(16576012)(2906002)(31696002)(478600001)(186003)(16526019)(26005)(8676002)(66946007)(4326008)(66556008)(8936002)(66476007)(38100700002)(38350700002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M3hGU1lOc3BFSlFoUkxIZVhoSzN4UHBXNEZxVzFLaXhLazJlZnN4clM2cStH?=
 =?utf-8?B?VDc5amtPNG9lb1MwSkMxOEZnNVdvd0Q5WXQvOWdNN2pPczhlVjVOQksvSnpJ?=
 =?utf-8?B?Y3ljUzROdU0xM0FDY281cUR5Mit0NFpXSlgvbUtML0gxNCs3ODM5TC9nc1hN?=
 =?utf-8?B?RnlNdFl1TlRDTzdNcVphYUQySjlLNDRDQmp4VUN6dlhSVXJwS2pJT2NSbXpG?=
 =?utf-8?B?SHQxdlJqVkxCRFk2SU5PenpQZ2ZqNjBHem81dElzNUZQTDBkWjRnWEhBWi9X?=
 =?utf-8?B?UGhhbnhXcCtxdjEwSWw3M3I4V3ZveGI1L09wQVBoaXptdW9Wck9naTVKbkVW?=
 =?utf-8?B?U293b3duUWNLWXBQanluUG1hYjZqVzRIY2ZXL0g0eUMrcUswRHppMnZTM2hF?=
 =?utf-8?B?RW8yV015NWpZOVZ2NVJkbnVzZWx3WGw3L29HaC9McFVlUjM1WlBJajJYZm9v?=
 =?utf-8?B?SEdTUW80aTczKzBRUUphUHB1N25Xb0FGaEd0TkhFTDM3Zm43RmUwVnRTUHN3?=
 =?utf-8?B?S21hcCtzczNvazBGVVVTRGFsRzE1ZGRaMDBzY0NQeWNBaExDTlB3Q3pHMlVm?=
 =?utf-8?B?UHpQdVdXYURIa09NcU52QWc5ZnB0M3JCV1dBanc5ZFRzYlA1YVBWUVZBdXpL?=
 =?utf-8?B?Z2NvclBmcTd5T3VpZGptdC9pR1BWdWFXUVdOc2QzRElIZ3B0MGhudXpOSnN0?=
 =?utf-8?B?MUNyRDh6MEdEKzVabUFqR1hsZXpMb2doZlByTktzUFJvMnZ0QnhrTUk5N0lO?=
 =?utf-8?B?S3BzR1F1TXQ5eFkrTEV6SnFEclhWSFQ1QlhMdExPTXlNTTR3WXA0V29LaG5q?=
 =?utf-8?B?alBndEtGSVlWSDNXNTNpcmV0NHViQnE3K2RpN2pYdHFRWGR4eVAvb1Y1UE5o?=
 =?utf-8?B?dTdodFI3dXc0UnRCMzRzWUVSVXBvYmI0MlR0RGlWY0t5dHNiK0l4dStMclBV?=
 =?utf-8?B?Vk12ekhRL1RQM3hUOSt5enBCZ25XS1h4UEhPSitraWUrRGJ6MFdpNmZvNERt?=
 =?utf-8?B?Mnphdk5wQmhUQStENjZxU0dDeUtzSEh0TlFxdFhNNUNSenZIUVdlVk1CZjNo?=
 =?utf-8?B?cHJHMGt0b2RXR2dHdWFuVThJU2dNSFptOTJXTmpuSSs5SXVZMzVyOFVXcWNB?=
 =?utf-8?B?TXlVUU1PQlQ2amVDUG9DejRPeWt2UHlpMTJLM3BFK2ZZcDY0UmErT1VLb1Jx?=
 =?utf-8?B?Y3NOVklqSloyUFZkRE1QZHVKYU5uQTl5WGZDdDZ0aGhVZnJ5M3FwR3JQR1lL?=
 =?utf-8?B?bnNkb0ZlUEJ0Zk13YTh5U1lJUkJsd3RXZ2VVcHE2czV5dmRyM3Jma0pxZStX?=
 =?utf-8?B?MFIwNTJVMXNIaEx0L1REQzlqUE5iYkNLN29JUG1xem13c01EOHJaQVNRYjRY?=
 =?utf-8?B?ZFVYU1NmVHpXZk1wWFNqTW5lMzBqSUowdnc3SGZkN09zNGNKVVZWVGJYNUdh?=
 =?utf-8?B?TnFjc1F6UHc1T0RwSHp5UzhaRlRVL2ZhZjlXbTk4TGVxOWhDaElzakxxdHl0?=
 =?utf-8?B?YytMczJSeE1UMHVkWXVPK1phMDhubG5xZFJnVGdEOVp1bmdXTlVISHFYNTdj?=
 =?utf-8?B?clh3TmZuUEJQdVhYbnJOdVNjNmg2SDJibE5vLzR2b2JCMFZYeUk4V2hVY2Vt?=
 =?utf-8?B?dXlWU2J5RjRDTTM1ZDlNUytnNVBwTUhnYTduOXRQM2VIdXVRQ3pqVzZ0bGtY?=
 =?utf-8?B?QndEajZZbXgwMW1OdGZiRXBrcStKdHdSem9CWGpsRms1MktJTDVremY4NlBp?=
 =?utf-8?Q?EwL3+50BC/gCnLE+r1WQu8n+z7YdfeeWc3dQ+bU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b30e1e3-2410-4eff-eb7a-08d913a0ed4d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 10:46:54.8340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3FoG84Nj28aL/lO9xj6zvhtyB9n3YonPJRReCewRJg2jj5mOyxWLr4UWFOBsyNiR7xth/ltVwpLYfWaGE0MO934R73xdnK5Vtefl4sxMO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4949
Received-SPF: pass client-ip=40.107.7.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

03.05.2021 14:25, Paolo Bonzini wrote:
> Allow using QemuCoSleep to sleep forever until woken by qemu_co_sleep_wake.
> This makes the logic of qemu_co_sleep_ns_wakeable easy to understand.
> 
> In the future we could introduce an API that can work even if the
> sleep and wake happen from different threads.  For now, initializing
> w->to_wake after timer_mod is fine because the timer can only fire in
> the same AioContext.

worth a comment inside qemu_co_sleep_ns_wakeable() ?

> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

