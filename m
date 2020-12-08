Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9D82D22F4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 06:16:37 +0100 (CET)
Received: from localhost ([::1]:44972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmVMZ-0004wO-O6
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 00:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmVKT-0004Su-SM
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 00:14:26 -0500
Received: from mail-eopbgr70124.outbound.protection.outlook.com
 ([40.107.7.124]:16544 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmVKR-0002VV-B1
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 00:14:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5xn5BIX2LkUDGICgyt//7UnFjYM55y746mutbpm+6YuoIyMVGmWd4h84jxsb6FjSjgE7KENM3hEt6dqbexq/zUlG24204MRm2F9yGqTDALjpki2u94QtvV8Hj55xMY/Vg86tnyxwc0kAO/2zfiSkLfqDUsEjz9ASmOeO9jFEpeowknz1e602cBJnqnUETXY8NltuJAGPhcsw/dWhtk0LeWyZR/GZcXBmVY+/lcSE17bnwmnD8kTSZnyrPDg1qb5JUQ2vPiiPsrjQWnWwswUnXZsOdjYoz4Nmm5jaqyXYHDZBgsUfBQ8OWN2RRHwaPT31WhsUNLJKhVAnKdfSHHPSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1AqaK/2I9D2zQ4ahu7pUTgAEu6JOdYrRU1P/mn9Azg=;
 b=YfOg709dGQqsDsyVyQWxbCArumapZGWnNK7qWiH9uOTUgBGz0ngRoGsrlyyuiXXf6toa2vRUkaNH33d53eCeU+v1i64Q9PJ2AY+nD8extgJVWoLB4seW399wClb3Cg5JwzHfWYnI4gco3XhfpJLt82csxg4Go22ZtAlVnqmLN98gG6jysRqapXTdLRy2DwsJH/3yOhVz3wk/GZd4TVdlyaHLwXWtfc1HdV508C25SXreA18p5we6qTDnDpHRiPyKrAqP2zhbhKOKRwWPPWWHvuDPvxw9YUymJDUClafT3EPFzWeH/uCuWmcHR2bhGkmZmM8wux6LSTNGF/QIasiqyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1AqaK/2I9D2zQ4ahu7pUTgAEu6JOdYrRU1P/mn9Azg=;
 b=Hw+kNL6+XyDpvYO3WhTe81bInGdaPsyYQMEzird0kAMYg8KwnjNRfA6WGjYcfzO02UCR0KKYpsgGoOn+HsEqqSeEAxMB54ClanB//yGgCfnhy8QdqBWS9EbW5LNcJ2F+zzUH2egPAXWCJA/ptVMr3OvXlr/e5FBMYu/UgWOeBDE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3222.eurprd08.prod.outlook.com (2603:10a6:209:43::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Tue, 8 Dec
 2020 05:14:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 05:14:19 +0000
Subject: Re: [PATCH v3] migration: Don't allow migration if vm is in
 POSTMIGRATE
To: Tuguoyi <tu.guoyi@h3c.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <6b704294ad2e405781c38fb38d68c744@h3c.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c3cbf611-4411-0080-b9ae-81d0b07c37f4@virtuozzo.com>
Date: Tue, 8 Dec 2020 08:14:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <6b704294ad2e405781c38fb38d68c744@h3c.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM3PR07CA0138.eurprd07.prod.outlook.com
 (2603:10a6:207:8::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM3PR07CA0138.eurprd07.prod.outlook.com (2603:10a6:207:8::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.8 via Frontend Transport; Tue, 8 Dec 2020 05:14:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f330182e-8cf4-4091-935b-08d89b381d7f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3222:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3222E0A55AEA986344F1CCFDC1CD0@AM6PR08MB3222.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4f5rUq8Y4Tm6iS7iWyEfce3tlhA4DzblKiFumjcSmN0/p8o4dhgcbl3/xdz9tIDTNISMsmEWIkYr+9VIuBCyn2Xbl8g8ZLCxDq8H7Kn401xuvkTr9NoRl71Z6aDbuzxH9JAlMCKfsjDbe678uhNA7Jz0ieN3SQxKU79QPpjodOQPsthyDoTlm4jIE/zsKlb/fhn3rLQelO5CwvqHOqzUp8jM9oJpC5O8mEAd0WpmQG7mBWFxldEhRQ59YRk/BhAVKoSqKsHXy6RMTi+54tMnItGWOE+YE6PY5i0N6V+4MVuyOBh5waszjFKW9CagQIHWPxVNPz8PKZvpxLx7UNyjj98Jsil4O0ycNqQqhUIsI9oTcrEFEt+tYX0oD+knPdetiv0qN5dwCGI5y7PoqARUE1dd32euf1miFOWwrqSVyj/OlGtBPmtqhYdJ5hZw68zr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(346002)(2906002)(2616005)(8936002)(186003)(52116002)(66556008)(8676002)(86362001)(83380400001)(31686004)(6486002)(26005)(31696002)(16576012)(66946007)(16526019)(4326008)(508600001)(66476007)(5660300002)(34490700003)(110136005)(36756003)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Sk5vWkNWS2JmWGRYMnd1SmlBTUg0ek4vKzNCaC8vTEFMTzlIYWJQNW5yRGlz?=
 =?utf-8?B?WGc2NVpRL0xKaDh2bHlxdFROVStySGpSQzl2cUl4YTJJUnRSSDRTekU2U0hV?=
 =?utf-8?B?NjU0NGpRL2lVK0w1WGtpSjh1SXpjMkNTK2lmb2xydzBMUlJVeDI0eDdETHk3?=
 =?utf-8?B?VXJaVnFpK1NtTFkzVlc5NVUyWHdDaWpaamlRQ1QreUdzOVY4SEhyWC9CMkRK?=
 =?utf-8?B?aXg5MXZuTENEQ29KOHF4aXRtMkhSdXpnSmNQUG1tZkF2WU1xYmIvOVdnVDF2?=
 =?utf-8?B?Vkd6TWtSUEc5SG1vbTBFSzRFeFpGeVp1Nzk4dStlZyt2TGJORVpjWlZpa1kv?=
 =?utf-8?B?ZjgzOThZTjFXWVcvSHd6Tms3V2FWSE9haXc4dzJrbE1ROVN4TjVBdHpFbFIr?=
 =?utf-8?B?VU9kN0dSaXBDRVE1NDNpelI2cWtqaVNQR3ExT0gzWkJ5U2dITnBKUHM0a3RJ?=
 =?utf-8?B?OUExRHFCSUZ5ZVVIUnlVc1Nab2VpYlNFZE9BUHZPeVlBQ21kUGJPSFlwd3N4?=
 =?utf-8?B?WlNWU0g1MUNxZGNIS1NJbUFmYXRMVHdkd0VNbms0OFU0eWJKV2V5cGttaFY5?=
 =?utf-8?B?cUFoZ3RQY3dBVXdYMHp6NktmM0pBME44ZXo2c0wzMEFraEZGa1FrVy9RWUtj?=
 =?utf-8?B?TFNLR01xT3plRGpET1k0K21wVU1BUEpOOFQvUkQra1BvYS9YbTRWYXpQYlVy?=
 =?utf-8?B?L2tLZHFDbkYwZER0d3JGMzhzR1FXcEd3eTBWNzc5eUdWbnRtSUJjTHZEbXJU?=
 =?utf-8?B?Z2FCb1FtNnpKTW1ESFFJRU5XYTNwOE5ydVRydmU2SjllVFpBQmtuWUpLYXRC?=
 =?utf-8?B?cUUwUHprVjBGRk5KUkU1d29lZFhYTWZnRWVnU3dzTXRWQWY4N1o3TkJNMkRV?=
 =?utf-8?B?SW5JamFXbTJacm1QM2piUVcxRzdYcWlMMi9lenFCeURxR09EZ0pVSXluQjBG?=
 =?utf-8?B?M1R0MVByOThZanpoYjNvQm80RVJMd2NkeFR4ZWNMckoyYjZpVDdsQm1FQlhV?=
 =?utf-8?B?emRCckZoa1RWaFBwR3F5eHhsbU42VGlERFp2eXdMbE81QkJ6VnA5WGkvai9B?=
 =?utf-8?B?YmhreVAxUXFQUXpTalhVak9NSGMrWTF5Q1JVd21IM0pCVkd5TjNzZmdYaUZx?=
 =?utf-8?B?dXk1USsvOHF2TGhjUHNhTWxQeGF4NkJwQnJRUGc2dzQvR3p5anViK2FqbVJz?=
 =?utf-8?B?eUNyalp4RjhoU3hLaVdZckJFNTFjR3JJdUpDb2xhYmdyVDI3WkptVGdtN0t5?=
 =?utf-8?B?TTlDa3hnb0cvSFRjUm5YTFlhTExnZS9pRDc5RHNBQzNROFVaVitCc3RWeWxB?=
 =?utf-8?Q?8y1WvpzQwyRG2LmxEt0jAAzPzgNJUkPjjb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f330182e-8cf4-4091-935b-08d89b381d7f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 05:14:19.0200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ghFY28Het89VrGHbt/U1+c2cn7BFfu4NCCs7MT77ahQtvk8630tyIxZPz4peQUzYjBc6nRN4J5ts1VQYPSoxZXdLnZJipKKoQDWCL8+dCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3222
Received-SPF: pass client-ip=40.107.7.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

08.12.2020 04:46, Tuguoyi wrote:
> The following steps will cause qemu assertion failure:
> - pause vm by executing 'virsh suspend'
> - create external snapshot of memory and disk using 'virsh snapshot-create-as'
> - doing the above operation again will cause qemu crash
> 
> The backtrace looks like:
> #0  0x00007fbf958c5c37 in raise () from /lib/x86_64-linux-gnu/libc.so.6
> #1  0x00007fbf958c9028 in abort () from /lib/x86_64-linux-gnu/libc.so.6
> #2  0x00007fbf958bebf6 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
> #3  0x00007fbf958beca2 in __assert_fail () from /lib/x86_64-linux-gnu/libc.so.6
> #4  0x000055ca8decd39d in bdrv_inactivate_recurse (bs=0x55ca90c80400) at /build/qemu-5.0/block.c:5724
> #5  0x000055ca8dece967 in bdrv_inactivate_all () at /build//qemu-5.0/block.c:5792
> #6  0x000055ca8de5539d in qemu_savevm_state_complete_precopy_non_iterable (inactivate_disks=true, in_postcopy=false, f=0x55ca907044b0)
>      at /build/qemu-5.0/migration/savevm.c:1401
> #7  qemu_savevm_state_complete_precopy (f=0x55ca907044b0, iterable_only=iterable_only@entry=false, inactivate_disks=inactivate_disks@entry=true)
>      at /build/qemu-5.0/migration/savevm.c:1453
> #8  0x000055ca8de4f581 in migration_completion (s=0x55ca8f64d9f0) at /build/qemu-5.0/migration/migration.c:2941
> #9  migration_iteration_run (s=0x55ca8f64d9f0) at /build/qemu-5.0/migration/migration.c:3295
> #10 migration_thread (opaque=opaque@entry=0x55ca8f64d9f0) at /build/qemu-5.0/migration/migration.c:3459
> #11 0x000055ca8dfc6716 in qemu_thread_start (args=<optimized out>) at /build/qemu-5.0/util/qemu-thread-posix.c:519
> #12 0x00007fbf95c5f184 in start_thread () from /lib/x86_64-linux-gnu/libpthread.so.0
> #13 0x00007fbf9598cbed in clone () from /lib/x86_64-linux-gnu/libc.so.6
> 
> When the first migration completes, bs->open_flags will set BDRV_O_INACTIVE
> flag by bdrv_inactivate_all(), and during the second migration the
> bdrv_inactivate_recurse assert that the bs->open_flags is already
> BDRV_O_INACTIVE enabled which cause crash.
> 
> As Vladimir suggested, this patch makes migrate_prepare check the state of vm and
> return error if it is in RUN_STATE_POSTMIGRATE state.
> 
> Signed-off-by: Tuguoyi<tu.guoyi@h3c.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

