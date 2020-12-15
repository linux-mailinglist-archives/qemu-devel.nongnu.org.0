Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D342DA999
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 10:02:41 +0100 (CET)
Received: from localhost ([::1]:55152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp6EA-0005Sm-J3
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 04:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kp6Cj-000512-SK; Tue, 15 Dec 2020 04:01:10 -0500
Received: from mail-eopbgr140091.outbound.protection.outlook.com
 ([40.107.14.91]:1422 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kp6Ca-0001Mi-Gq; Tue, 15 Dec 2020 04:01:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBBbFsHNcZWWFmZ0bVCm7gH+IVjZOC0f7uo8zWMmyM3R9IcQMXwvAo9oua7RE/R1Py0cxErJuuOsDBoRDj6XUTS7iKhYhdiKMlxvC59G37fN2B3SSwqbWtjtjmdnIEAveC9o3Bh3zCUYP/JTPYTBCykFxRfq28R9DiOvAGHHk7P0KsEjLWy5fRAMKCPoVyeQpkOc2z0Uxa21J0eYKW98f4CpdNReO3yt+Y9MNMZrdRfbZizSeDVCjiRSYqh/ma9y15NFtRj/uu5Bc0Jgg4h/YKjb6BBU25pRxRGJQH/0t6UtYg6u7S2ulbg0WXKQ5bpOTBmtFcHjueOrFm7Hsl0ePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZcWVwSETte+SJ2AGdbrnk8oLIdLMlS45HVHQPEltV0=;
 b=RH/SGuQCcHQd2ph4CDRQg8RZWyzZ/BBWoqIb8MGbDu+Q/PDdWAqbdb1IVFMJMTxnXPHwUrPKo/TyvZilsb+C+qOVzrOqfMzBywjAJpxU67PWXv9DRm3rhhKII+Bbyqc+1GNvdfxN9UJttiQnEI0zQ6QuMhDIYepDm84uXxR7NJGBjDmT7oAAmFMaYPUw1p2o1OXTc7Pt5VW5S3D1Dk2RI+JhFkZHGgSEb+AoKSex/11Lhda5nPsvWEHnAAnXJtLzYB41Tr+3AmFh62VH0r2lc9/3xxiaPV1FCKC6f/x6yS1FDwT2yEKRAef7idBej9ooWnvx1S/0aDtEXumrN2eSyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZcWVwSETte+SJ2AGdbrnk8oLIdLMlS45HVHQPEltV0=;
 b=cMQTY7n2+5gRHr/TlTBp+KhOaCu+aPRcb2zt2QXcLLtWr36SyJq/+7hxCM4W++ZbXKVubtWmmN1lFrvOIXYA1XJGNVMQrGizlgDkqeNkQfCO9W31U52cqkYhKQl4Hfwb6Pg6SRXHNVhUIKWal48tRCOk1WzokNKrjN1GVnKLaGk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.20; Tue, 15 Dec
 2020 09:00:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Tue, 15 Dec 2020
 09:00:53 +0000
Subject: Re: [PATCH] iotests/210: Fix reference output
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201214175158.299919-1-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6b49f207-e854-e491-96c9-746dae5d3850@virtuozzo.com>
Date: Tue, 15 Dec 2020 12:00:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201214175158.299919-1-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR02CA0143.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR02CA0143.eurprd02.prod.outlook.com (2603:10a6:20b:28d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Tue, 15 Dec 2020 09:00:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6403e2f-a19c-425d-7b26-08d8a0d7ed40
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-Microsoft-Antispam-PRVS: <AS8PR08MB5912EEB2AA06E4B9CCEE3683C1C60@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EpdquGyemJQnAamA5hsc/xa4uhsV1LncASlwNUvUL4Mosk7EQgiuhZP2CM8YGH2iYFG+rCuJS25uTS9IDIaYONRbEXSLzhxSq9COsVtJZRYUAuRawOaz2vGppvOkyWqkQQ8mfnhVrQQnIVxXOBuJTBrWgrFlcWZZ8i09Du4T1ltL9Kl6S8loheZd1OTTj/zrF+o9TAoKq5xA5FFIcpqwgQDNWnPFk7ir6IO0XGyUldr2VMMUNDPRhPQDFoVw0m4Qe8vcuiegwKCQNDregg7krltyj35ESjLXrdOlSuRQpbHl/alaa7b4pf8iXKDJzxa0MncyBm8C3b8XmifRvzu9rymOGpB2xRd5ItA5hP+QNOLVEi5qNwphJZgg2JtznRsau327YVN6nHhh5UsnFnk3hGYcdQXy6NB5BZM6QaracWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39830400003)(366004)(396003)(346002)(86362001)(66556008)(6486002)(4326008)(36756003)(66946007)(66476007)(31696002)(186003)(16526019)(5660300002)(52116002)(4744005)(8676002)(2616005)(8936002)(16576012)(478600001)(83380400001)(956004)(26005)(31686004)(316002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZUVFcDZUMzJLUUR4S1NxVkl1MHhzZXNXZGk1UEtVZWNxZmxGR1BqSkdLZEtU?=
 =?utf-8?B?WFhpNVQrRGowdVI2dVhpc09WWjZsR2J1MzhkUmwydlF1bGdSeGJJVUMrQTdz?=
 =?utf-8?B?MHBlU1JQTno3TE5UOHZCclJQSmhzMEFEdlZvKzNXelFYbCt1ZHBrV0QvYUpy?=
 =?utf-8?B?LzVuSElLL1llb2dkaXppWlJWTll5aEVQRXVvWEwyS1dxdE5hNVhGK2R0VzlO?=
 =?utf-8?B?NXllOWkybnlzeEp3NWUwL2RjWW5DQlRmZkwxbWlPMjVwcW9YQUVBMVdUWW5a?=
 =?utf-8?B?aXF3ODJXNy9RUm5DVDBzdmxwWEpZaDZVOCtMZTl0cW8xSk1ndUFJMWZ4TjdJ?=
 =?utf-8?B?OEFDN3NuWnhzb0dpQm1wNnpoZTFtdFFROWZ6UHpVRWVpZml1VFgwWFg0akdj?=
 =?utf-8?B?WWdlN2xFY0p3SmhadUxnVVFUYmtUUURjaU5PZ3BPaXhMZmtyZnlRS0ZOeTVD?=
 =?utf-8?B?alk1YklPNVF0Q1pIZWJGUGNkQmRWUzFib0xoaEhrK054SmtNQis3aW5TNk5i?=
 =?utf-8?B?bzJHWjVJQjlwUncrWmQ4aHI4ZE1RdjJqREQvRUlMVzVDWFhhblhhWTF2Y2VR?=
 =?utf-8?B?SG9kMkZnZEpwdmcvMVpZNE8rQmw3RUdCdTREUVFGSmtlTHhHN01vMkE0UXBB?=
 =?utf-8?B?bnpSM1BGYnFnZXhhWXMveS9xVjNhNURsQVVXSUV6TnUrTndmM29BVUpxckJv?=
 =?utf-8?B?eldraFduUlNiNGpDL2VyQUJjcVRtZ3FZd2IvYTlxVUVRaUkyaXNxZ1NtL0dy?=
 =?utf-8?B?b2ZxeFcvZ1NEVjRFVkZJeHlZQWkyQkdRb3JjRkdDQ2xEM2dXTno2bHgycjZP?=
 =?utf-8?B?RTN1a3NQdVpCVnRZRkRoemI2K2VvZDB1dklmUC8zUHZmN1plUkVIS2xGOUdY?=
 =?utf-8?B?TC8vM2t2ZHcxbW12ZWtuV1RqY2hRWm9sZ2o0SG5iSERsTTVvSVJBZ2ZORjlZ?=
 =?utf-8?B?UnNFNkgwNmFaeTVzYXJRWGtsa1hIRXdtbjNyY0dxdEtKUkZablk3dEtlNnVs?=
 =?utf-8?B?OGhZLzRFc0wvZFVEMDU3cXJSdEIrVXBic2RlSUN6RkVIaWVXQWlCNUR0dGl5?=
 =?utf-8?B?bzF3T0ZEQlhwT3N6NytSTnZ5aFVjOWp5ZGxzdjVDVzhlbUZsdldIQTA0MHRX?=
 =?utf-8?B?VkxHS0s3S3FENk12S29ZQ3gzeEFJcXNrcmQ4ZFFSaXF3RWdTWkNrZ2taR1JK?=
 =?utf-8?B?dzBLbUtBRnpaZ2xSNGxyS1pDQ1Q4TTA1NFVuRDEvUGJ6U0h0V1kwYzE1bjAy?=
 =?utf-8?B?NjRlWWwxOFNGZVhGVlF5MXdXMStyRXpzbjV6RjFVUGwxU096eEZvanE0b1Jr?=
 =?utf-8?Q?N9G+ZOjHl4vEYORCsnP189EZy28k+YTsv9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 09:00:53.0519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: d6403e2f-a19c-425d-7b26-08d8a0d7ed40
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70we27KnCqCS9bG65ZeHSgmfzkGVzmbzhkgc8mtU2X8tU+d1qwsFIj8pqi/fYvwLcTJPqwi5GMwnXWCmNX9OdNRAEx/NcSxE9GFFWkHbsYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.14.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

14.12.2020 20:51, Max Reitz wrote:
> Commit 8b1170012b1 has added a global maximum disk length for the block
> layer, so the error message when creating an overly large disk has
> changed.
> 
> Fixes: 8b1170012b1de6649c66ac1887f4df7e312abf3b
>         ("block: introduce BDRV_MAX_LENGTH")
> Signed-off-by: Max Reitz<mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

