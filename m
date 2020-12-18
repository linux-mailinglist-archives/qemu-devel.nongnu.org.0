Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5342DE1C4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:07:42 +0100 (CET)
Received: from localhost ([::1]:35148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDbp-0008VS-OC
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:07:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kqDZY-0006e2-Cu; Fri, 18 Dec 2020 06:05:20 -0500
Received: from mail-vi1eur05on2108.outbound.protection.outlook.com
 ([40.107.21.108]:44224 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kqDZU-0003ij-Am; Fri, 18 Dec 2020 06:05:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtarlTeJp59gdNPuemtVfjd+pe6YyQ+YaPZxMmQ8tTDlK6PUusgu6az4UyUrC0cJaZXwqqQewRrHAEavjzadsNINYhniJxH0DMJ64SQxiRlYUx9uvADw+B5zv7z/G/nlz3MQOa6eUpNZUeXzIISvKclKMWEWQhCCkY8I7zKGHZMp3reDntJU67pdvGFONnS84EIZqPeCdgfxjASyM941ZlpjhIVcPnSSSta83nbignmqidbQJBs3bXj+t8XFFBHf8sarQGrhYNj/GErHvYuoqH23yDr6DeCJIs2HS9dCX8QslCw+7EFppSRhw3+jABpvHjY39NQ5a94tsnK/JfAEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=529xNXK8uViau7NWtT/db1AerBVKFRIg+LoAu2tFTig=;
 b=CCeTG7kb5fjXML0Ehg/GssRiXckXgnSfNgFvubURemKhRfpuUIEATkKanAWH3CY+ak/qu8/kj/6rDJdnlnth3dJ/w5GpcCOlV9doKhDqZVfKJWVVrIzpiYfTv8BiXiBvoAFjzkhNZWl9Sufl3UZRuqcT6loUJT3tLD6rkWp1oXXRDDPdciFSYdCfnupf+ieY1u6UndHswAtbsiKt+kbMbNT/8kclW9O6QfyD5RNRC3CmFnYAcJMcrC4Ms0Dy9D9VuVBEKDNIosQj72Lgipmymv/QVye0J9vooz5dym8g2gpeI/nBJYgk8a1fQHeHHksDvAJ9gihx2RZYm8iU+A78Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=529xNXK8uViau7NWtT/db1AerBVKFRIg+LoAu2tFTig=;
 b=OzdG/i8DS3Fuzy80qdOdMW8QX9T/qp3YfBBuNEEF0uwaRiLovRMia7b6aiTIbdQJy8ZIU1KSfaEHXYvHcxS93N3IjSsR6v+Se/yFPdHpQwSp6ZvG1z0R2T3GwnrORPnsJ9BBCL35F6Mq7KFHNiumS2bf7+b4hOJFNOLrQB2RTww=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1777.eurprd08.prod.outlook.com (2603:10a6:203:3a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Fri, 18 Dec
 2020 11:05:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.026; Fri, 18 Dec 2020
 11:05:10 +0000
Subject: Re: [PATCH 00/11] mirror: cancel nbd reconnect
To: qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ce2d8ba1-14f2-104a-3304-c15cf0cda954@virtuozzo.com>
Date: Fri, 18 Dec 2020 14:05:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201118180433.11931-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR02CA0185.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR02CA0185.eurprd02.prod.outlook.com (2603:10a6:20b:28e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend
 Transport; Fri, 18 Dec 2020 11:05:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb88cddf-2d46-4104-b737-08d8a344c930
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1777:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1777D0493A31EEF5F1612C1BC1C30@AM5PR0801MB1777.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qHj+obzJsKdPpaE5bYcBNfFlDwlYyBtm30l01y20oTK2oSkJwJuIsufMbnBSvfYLidtZZYn2hDcRgp/GLZK8n3a/ZWqN8TuKiMN3c4pQ+fm72uowx5L367dWp7Kwn0xl/SDDdp364Lfqwa1a9NeW92Um9oAd10SQkVjrzuD4UaJ8EE5SuZNKTUGQ+XtEx8TZBzuNUVYdcR7QaIc1LIg7aapDO/HLxkGK7NtJYtZYX6nCc3wS2vpRVpRVWxc1MwDDn/DyYiN3FCqI/Thv9DMaPEDghZaJIq4ZbUecsMGW0D4VyIol+xyIkMGdWH7HD4si0pifaaRVOs2nQGf8Pr8tAsgkH4neuyI2qq/qiRNPNYX8CuDBj6oejo6Gl3AJQppG1KU171DAaZ5k/p7FCtPC+n2pegD3yPtGTxnIQFDVcX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(136003)(346002)(396003)(376002)(31696002)(8936002)(8676002)(16526019)(6916009)(36756003)(4326008)(83380400001)(66946007)(186003)(956004)(6486002)(31686004)(5660300002)(2616005)(107886003)(52116002)(86362001)(66556008)(478600001)(2906002)(16576012)(66476007)(26005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SWNYakEzUkV4Nlg4ZmlkWWF5amp6RmIwOW5RUlRIaHFiSVFVR3VGaml0azcw?=
 =?utf-8?B?dnlJQW5ZTEtFS3ZJdUVseGE4OGc4SkdFeno3UVdUaE9mQjZ6TE5SNWNPdGk5?=
 =?utf-8?B?RHJEVmYwL1dNVzUyMUZyN29aMTdtQmZESG1BVTBuY3JqODBVVDByOEd5N2Ev?=
 =?utf-8?B?Z1Y4Z3IwQjlSWEdkckVab2o1Q3krQ2lMVGR5US9NZHNlOVJHNTQ0S2NST3VV?=
 =?utf-8?B?ZWRsVVJlSDNVZWdqZEhhSzJMV1F6MTZpb3NqN20rb284OS9FVkRiVjhhTWk2?=
 =?utf-8?B?Z29Od0lWMDFvcEVFbUtRT1dlUjZVTTAzSUlQd04zeFFIZkhUOTV4U0NsQXFl?=
 =?utf-8?B?Rkd6bURKWG5KUDdNaFN5NllkSmgwZ1Rrb1liRDJvck0vdDZYNEhhREUrbHo1?=
 =?utf-8?B?aDRqUjVjRjMvVUhPUXRxUEk2a3FaenlOUVlJM0VXZHRacUlNSmpZc2NvbWpq?=
 =?utf-8?B?T0JxZjRuZlZ0cVF5WnRqSVB6QmwrS0xFMXprNE5hM3VERXlFaTRVZUpyTWlp?=
 =?utf-8?B?bnFicklLU2xjWVdZT29WbStkTFBGR0RuR3lkSGdvOVVEd1lxK2ovYVdRMTFY?=
 =?utf-8?B?dm1QQU5BUUtncklWNnVtcFhBbUQxSVJuNUZJZm9iUkhjODFnTUtsRFFBOGVV?=
 =?utf-8?B?NENwbTMvME1Vd3BkUWFNQVRES2I5cHJFVWVPUzcwaEJ3aytjeGdoS3lKWGV0?=
 =?utf-8?B?TDRMQzYzelBieWRZdkREZjQ3VzVERDNIcjA3YS8ySzV0Y3hxV29qc0FjMlJN?=
 =?utf-8?B?bUZ4ZEZCWmZyR1hDRGxuRitndEJrV2l1Ry8rYjVtUU1qSkQ2alg3K3RVN3Zz?=
 =?utf-8?B?VlFNSnJLc3BSQTFXQ3BWQmNsdzRzd0pCdDJBZU5rZjZkUFpxQlBEdVhjSTRh?=
 =?utf-8?B?R1dmRVY2Wm1kTkJrZHhaQmtoa3hBUWVDYVZaZHMraTQxeXRHcjVkNW8vVDM5?=
 =?utf-8?B?T2Q4UytQOWtpOE5WSGlwWUxHbVdsbnVEd3NnTFVwbFkvd2RTMXREbmF1aWdG?=
 =?utf-8?B?Zit5Wk5idzRzWUdhekczb05EcUVNQldsZkhaVUNETmJxazlxUmI0VkZjTEJ1?=
 =?utf-8?B?MGNidWF6c1JhK29tSWRObHY0eW5FczZROVJXYXVWczRMN08zcWdlMm9qYU44?=
 =?utf-8?B?MDBKQ3hGbkQwS2JuZ0ZIU09ZeXc4VHZzWWJMOWxPdWdKQWsxTUI5dkdHdHFD?=
 =?utf-8?B?ODZlU2k4ZjNIM1BLTEhPdWlTQnYxN2dJTUdPK1RBdG04NFVCTDBGK1Riamo4?=
 =?utf-8?B?UXBBR0kzdDF6b1VNcDN4Z0FGb3J2K3ZhZ0F5RHYxb1hYZERMSmpVd0VlZVdJ?=
 =?utf-8?Q?O/pZZi8F/rH9jGEIQnDJoMJYtqR84YIdxZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 11:05:10.0585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: cb88cddf-2d46-4104-b737-08d8a344c930
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIkHQNeNsr5COvOIvdtsJNlsXPzbGkN5N/P7gZ+SFV3C9rny/Tsm4eySKAVzTWNsewNrdelMo1qVmS3aS1KEFYjnkanCeLWI9YdD7FlyaT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1777
Received-SPF: pass client-ip=40.107.21.108;
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
Cc: fam@euphon.net, kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

18.11.2020 21:04, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> The problem
> 
> Assume we have mirror job with nbd target node with enabled reconnect.
> Connection failed. So, all current requests to nbd node are waiting for
> nbd driver to reconnect. And they will wait for reconnect-delay time
> specified in nbd blockdev options. This timeout may be long enough, for
> example, we in Virtuozzo use 300 seconds by default.
> 
> So, if at this moment user tries to cancel the job, job will wait for
> its in-flight requests to finish up to 300 seconds. From the user point
> of view, cancelling the job takes a long time. Bad.
> 
> Solution
> 
> Let's just cancel "waiting for reconnect in in-flight request coroutines"
> on mirror (and backup) cancel. Welcome the series below.
> 
> Vladimir Sementsov-Ogievskiy (11):
>    block: add new BlockDriver handler: bdrv_cancel_in_flight
>    block/nbd: implement .bdrv_cancel_in_flight
>    block/raw-format: implement .bdrv_cancel_in_flight handler
>    job: add .cancel handler for the driver
>    block/mirror: implement .cancel job handler
>    iotests/264: fix style
>    iotests/264: move to python unittest
>    iotests.py: qemu_nbd_popen: remove pid file after use
>    iotests/264: add mirror-cancel test-case
>    block/backup: implement .cancel job handler
>    iotests/264: add backup-cancel test-case
> 
>   include/block/block.h         |   3 +
>   include/block/block_int.h     |   9 +++
>   include/qemu/job.h            |   5 ++
>   block/backup.c                |  10 +++
>   block/io.c                    |  11 +++
>   block/mirror.c                |   9 +++
>   block/nbd.c                   |  15 ++++
>   block/raw-format.c            |   6 ++
>   job.c                         |   3 +
>   tests/qemu-iotests/264        | 143 ++++++++++++++++++++++------------
>   tests/qemu-iotests/264.out    |  20 ++---
>   tests/qemu-iotests/iotests.py |   6 +-
>   12 files changed, 173 insertions(+), 67 deletions(-)
> 


-- 
Best regards,
Vladimir

