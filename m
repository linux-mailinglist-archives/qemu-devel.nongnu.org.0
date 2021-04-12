Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F6435BDCB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 10:54:41 +0200 (CEST)
Received: from localhost ([::1]:34104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVsLA-0007cx-HM
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 04:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lVsK4-00078M-Ir; Mon, 12 Apr 2021 04:53:33 -0400
Received: from mail-eopbgr70093.outbound.protection.outlook.com
 ([40.107.7.93]:41024 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lVsJz-0000SB-Cs; Mon, 12 Apr 2021 04:53:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gj8GBX+s0ydm20UOLKR9JOjsA1gh0JjUmqZ2QGjAk+HgJsGyrUKxJmMXFWn4JjepxGKQvXSZin9rBMfIWFJZJkq40hW+99afvavxju/gNf1VGAUL/e7dVMKj6BFPMmSMm5HW7O+97T/ztOzIK5mLUWOb2tL9axOOCV6l6i5VQANRVMbDUPaSXBputEj+bLEdqR03WX11dYJVzFV0s8IYftptf/gSUFNsxgQKrXLu6D54AGYKgXc7Pg7wRjI5vBChc6jmwjhEsj94vz7LMC8VB16uxqZxqSKigA5m/O3RcbIY2yDLVnsczpFircJygsDmg2TzyXaaUxjZbxq0RjJ8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=550+u2+xRRJqndONV8gJ3XPbhZm8YU9gggO7Ai5Vb5s=;
 b=MRjP7EpwCw+qu4DojGfMWPiV8kstsKRsuZedry5LxPX3eFgUm8XApd49d0qex5AD+kvPxFGuCS+BRlc0gIXogUH48XNWlBRqTQYi3XZFb2HzMLd2RwwOPtMSTp5st0M+Xp/S4ceNhN6RoIN9PTH2oaDT1lRf3gpoKSNKdjCgtQPxF4dFE+hUR7sYlEjD7Q+ZZYAzScZU1LwykGR0QSlp3mJCzUazfTOXcm3TJt08qVVwyTtsqmzud0K2REWeXx2Kamv2nmPBMk5jyPxEuY9wUBWdej2mR0zVve9Uskk7iy3IFDKmqBRh+d+PSrIVcylrohaK61RaKwlKnOr1ZvD+2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=550+u2+xRRJqndONV8gJ3XPbhZm8YU9gggO7Ai5Vb5s=;
 b=rNJ1hQdAz/zuwW/xFHbJX/QS28DmxggvuEAQ6s7U5Rl4fXwh27tIAwXGQ9jvxS3BXO0yjP2kkhw7rBUZXa553Mm/clEN4ELQxuBHx3Vhgjld+mst6Ax9vi4HL3XYr6NcOJf3PzB7jD+zbhLR95sp/4qGdt/TKLLZqBlApqYWbKQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Mon, 12 Apr
 2021 08:53:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 08:53:17 +0000
Subject: Re: [PATCH for-6.0] block/nbd: fix possible use after free of
 s->connect_thread
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com
References: <20210406155114.1057355-1-vsementsov@virtuozzo.com>
 <YHQIk6PF6F3+dl7J@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b7763aa3-09f9-5aea-8201-decdd352d43e@virtuozzo.com>
Date: Mon, 12 Apr 2021 11:53:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <YHQIk6PF6F3+dl7J@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.212]
X-ClientProxiedBy: PR0P264CA0162.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.212) by
 PR0P264CA0162.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.18 via Frontend Transport; Mon, 12 Apr 2021 08:53:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 459b8249-d257-4ddd-3d69-08d8fd906a23
X-MS-TrafficTypeDiagnostic: AM6PR08MB2981:
X-Microsoft-Antispam-PRVS: <AM6PR08MB29819944D9AE2C446D8E715FC1709@AM6PR08MB2981.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d94qdHs3N/KJ3C1KeYwmWqUAvEy7yrgoe/uWl68tbfD4VFXQo7mfC8lRdxX2aZ2b51/7aVMXNB13IHTwkzMWOuFcapawnLaK0Q548qsRqkQIrPrwDHdwVlR7zsHgBKlgsgNmbBFfUGgtK6wt+fGWVrzBfrFJNdzUyQucale2Jxr8dyCrHTovVLCWh2Cw6kQA7bObc7Wq72qhuKEdhPpmwZimqu8cg5qJ6i+4J1KCKIrP2DotA3DLH8vub9RJoW8abCH9oLqLW62LexPBxMGNn/4PRKJ7BpWMBs+5uaO1GvWyoLQAOA2LTlksuUg7W+iNgyFGZQtbopAingy6F29wfUZFV411J0hoSqodZwhzrMg+/z4LjTJvUqBv6dkBU1ettYH6KaXdcX9iLdE9CgN7Epinm1yacTPeqY2Zb4CTvLES5Qjg+ThMft555dPWAoVah5dDawLFX0etmYc4ppVxEdheEBjTgAzMX+n4TeYODlIyIhzXI8FpFfrAQwgFZoVONXHMyypiArfcBDZv27Mkfon/HUEAoGHtCWV/1PGxQ3S7vKht6x1X9RBm0aW9e6tKf5AAHG+a1+H2CS1MKRSsnOMahsxtAC0TrpGvQJGRHZjP1fgR9uhowOWtFgqcgMPbzCNYNCwUi0za5vE4sv1OPy5FDXUMpP3I/p0viTdVz023xnY+/7fimJOrWT58LsSHKZ9KYz+GW9d0lPbzSjKYyu1m4/JQT8Jy9mUHKF4+VLI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(396003)(346002)(376002)(136003)(26005)(5660300002)(8676002)(956004)(316002)(16576012)(52116002)(66946007)(38100700002)(66476007)(8936002)(186003)(66556008)(6486002)(16526019)(478600001)(31696002)(86362001)(2906002)(38350700002)(31686004)(2616005)(36756003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T2FNeUlpaFV5Z2FyeVJ1eGxhOU8wbVBrRzVtSCtHL3kxSUdWTFo3NzNwTmgx?=
 =?utf-8?B?eGZaS0tjNVpsbysxN2xkVWFDWWc5WExUL0ZHMjVsVHJNMmJNYWFyZXo5cklo?=
 =?utf-8?B?QlRuVE1VZ2pFZVA1QnJENXB6WHhuMldqcml0aGh5NlUwMVBRWERCV01MaE1k?=
 =?utf-8?B?M3BqbmtyZ2hrWHZtRk5CWWJzS1FiQXVWT0xvSlhnTUFhZUNOMlZVek5MbkZE?=
 =?utf-8?B?c0NXTkpvRmRJN3pqNGhYVExZUmRzWFR6azEzVitPMFBkMEhCdUc4WStVc1dj?=
 =?utf-8?B?cVQ0UUdXZEM2QS9PT2lTSFhBWGVSY3k2YkVDODN0c2hKRGtORm9TbUxZWGt2?=
 =?utf-8?B?akhHL3N6Ymg5NEFRWkFESmt5R2EySkxVYnYxdWdqUDJpeWhLVVRQMFVoVUNT?=
 =?utf-8?B?WmQraUxhRnk2bTNUcmtLYUFBaklaSDIrend3aHV2dzZ3M0kwL0hDUHZyMEky?=
 =?utf-8?B?cXVJYTBVUlBTWnZNZ0hEaGtBY2ladWxuQzlaeDdJZ2Q2N2xiZVpaN29ld242?=
 =?utf-8?B?a3RNR2RGaHI5dW1QTGhnMEhMa3lsQmJMbkVqbXNGcE11SmZxcU94a1BtNCtZ?=
 =?utf-8?B?NHQveTNSZHROVmd4N0VKOW1EYi9RT2xQbWZQZWZmSDFEVC90RHRjd2diNVJO?=
 =?utf-8?B?UE5sNlo4cEtCU3BJaWRNZWJBY3VzczduMUt5N0s5elFpYTlBanVYc0VBKy83?=
 =?utf-8?B?VkY1aGRJM21FT0NYcVhyekF3OTJUdWFLcGZ4UEpFVVBIR3RKekRoRFgyYUYy?=
 =?utf-8?B?cUZxRGQyS0pjVWJ2UTRLWnlCanpwMXZOVnZMOEZvYTFSQTIrb2w3Y2NtOEJF?=
 =?utf-8?B?YWtBdHAyM1REaEVONVo0M0Y1QlVvTm9FdlNvWjUrNFhXSWZkNXJ2cGJWb3dl?=
 =?utf-8?B?Z2tNRDRNUVRremlIT3lSTVMxYVpkakFUdXByOS8xb1ErWFhnYzFwTC8zMXJP?=
 =?utf-8?B?QUl1MDdQKy9RUkFyVkNZMWt3Q3JseTlTU3R4MlZjWmJpaVkvTk9iS1pOaWE2?=
 =?utf-8?B?aUgwMHcvNVh1UTJJQVlwQ2tOVmR4c08ySFpIbHVjTC85Nk90NXlWNXZnMHYz?=
 =?utf-8?B?VjRMMDliZk11Mk9xZWdKMXZKblBuVzlDaTg2dkl0L1FVc2d5b3MvcDhhTmIr?=
 =?utf-8?B?K3lzQVZHUHUvY3U4T0VkN2loQXhCL3FQak9sTkViTUExWkVuaUJnVk5NQ2px?=
 =?utf-8?B?SFlkTURuOWNIcmxFNHFhTTRmREdiWXVXbkt5NWl6YUk1MVNiOTJtVG1VUEEv?=
 =?utf-8?B?MWk0VVpLaS8zeXdlaWZicUhudVJnQ3BKRlNvRk8vb1B2QkFZMVlDYVFlUWV1?=
 =?utf-8?B?bXNMTmppbTM5MUVWeUEvelZkY21IMjVLaFMrLzFtK0Y1N0p4dHdYcEhxRmNO?=
 =?utf-8?B?YjlYVk5ucUF0NWJFVXV0WWpyZEFQakJpZFNsQ244QS9oQUs3bXJwbzZVR0tu?=
 =?utf-8?B?VW1FK1QweXBvQTYyb2g4L3BuOXBNMXFCeTFjRUJoV2hxUmJWZmdtZlFWbHNl?=
 =?utf-8?B?ekdEVmpIQ1JxSmo3NDhCWUc0cU1EakhHeldVUEFES3lsc2J4NGlqeUVkNnhH?=
 =?utf-8?B?eXR5N0tYeVc4VE1WWklVWDNhQ2NIdnJNejNGNzB0ZUR0VzlEMjIwZHd4Z2gv?=
 =?utf-8?B?L2V4eGtqZjhNa1dCZEduR3NxOHBuc1RtUzlwUUQ1ZUxudlRQS3pRb3A0bFFG?=
 =?utf-8?B?RmxCcDVPNHVOWmdmMEZGZHVoS0sxcmgzUXJHNFZPOEVQZXBUVXFVdGtPM3dH?=
 =?utf-8?Q?ItOL43L3+1yKPgWUD84P7Su7pAsaSy66MkytOrB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459b8249-d257-4ddd-3d69-08d8fd906a23
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 08:53:17.2270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRa447DL8DbLBFsUc841BqOpqcuhDI8TvwwhYlddkPF6PEtaJcD2iOo67HrEGqdWZg0dYDy1IrBHIssD0s/dpGsJUZ5uCzo80C1MZgHbDdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2981
Received-SPF: pass client-ip=40.107.7.93;
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

12.04.2021 11:45, Roman Kagan wrote:
> On Tue, Apr 06, 2021 at 06:51:14PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> If on nbd_close() we detach the thread (in
>> nbd_co_establish_connection_cancel() thr->state becomes
>> CONNECT_THREAD_RUNNING_DETACHED), after that point we should not use
>> s->connect_thread (which is set to NULL), as running thread may free it
>> at any time.
>>
>> Still nbd_co_establish_connection() does exactly this: it saves
>> s->connect_thread to local variable (just for better code style) and
>> use it even after yield point, when thread may be already detached.
>>
>> Fix that. Also check thr to be non-NULL on
>> nbd_co_establish_connection() start for safety.
>>
>> After this patch "case CONNECT_THREAD_RUNNING_DETACHED" becomes
>> impossible in the second switch in nbd_co_establish_connection().
>> Still, don't add extra abort() just before the release. If it somehow
>> possible to reach this "case:" it won't hurt. Anyway, good refactoring
>> of all this reconnect mess will come soon.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> Hi all! I faced a crash, just running 277 iotest in a loop. I can't
>> reproduce it on master, it reproduces only on my branch with nbd
>> reconnect refactorings.
>>
>> Still, it seems very possible that it may crash under some conditions.
>> So I propose this patch for 6.0. It's written so that it's obvious that
>> it will not hurt:
>>
>>   pre-patch, on first hunk we'll just crash if thr is NULL,
>>   on second hunk it's safe to return -1, and using thr when
>>   s->connect_thread is already zeroed is obviously wrong.
>>
>>   block/nbd.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
> 
> Can we please get it merged in 6.0 as it's a genuine crasher fix?
> 
> Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
> 

Thanks! I'm applying it to my nbd branch and will send PULL request for rc3 today

-- 
Best regards,
Vladimir

