Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986F4319013
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 17:34:44 +0100 (CET)
Received: from localhost ([::1]:59422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAEvT-0008Tv-MW
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 11:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lAEql-0007FW-E5; Thu, 11 Feb 2021 11:29:51 -0500
Received: from mail-eopbgr60133.outbound.protection.outlook.com
 ([40.107.6.133]:36765 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lAEqX-0008OJ-Ny; Thu, 11 Feb 2021 11:29:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLtWD3sH5bIfbKUIS5AtctckxQKzP8IaQvdhE6TWWrAgx1EM9mVcP4RruYTRQG3d+bbw4xvWPrhjxR4opjljP61y7UDYOB2kqHnkYSfLE2CkeHRjWzgzzZbOXewN6ByIycwdV1quxQwXS20cTiofr5Vm+CuHLN36KbQfkmNCmeUViIQBhNbOSZzABmTeg5+maPUR8EQw7n2EkShCnzL3QJMedsYx4JXYqOFhMrPcBtaKPsTkU1qPm2mol3VyVQ48k0TodlEcnJApCYZpOczCia5U/ohiaQIWxsNorE4jc/AGlR9SYA4nNlVZ7NFgXAQ9PBkhf5aiJkbeybKWIv7B5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1VASyN6PIZ7ZCarTYKOwZ8vdi7tK4AEPkqWKn8Xuxw=;
 b=UFxI9/2mAUuuGKTCnhPMH/JXyD/P6QPrijCnSrfbOuReHJ9q2eSflrd7xhS4/l4qN3kSiRgxGmEzvrDd0Y7YLIJxQ88j4i83hUth/Nn0xq4YmRd+KK6FEEydsYHPWoTs++Vmv7Jxhdm5MooRYfUq63Pj5H5hj04bUQVTu6W6k8A8LR6jqdAYzLEma2CGG5MRrGvdT0R1DdfxPtabjbmmGJSJKC5Dark22orOJ7DbGzlGFKSCQUz315ejfE9gkLTRTnyOqZJHTOchRygWxXCZT5gCihmTxUV8f/8L2b0mJtSqFVgOZsSY5+EBcN/gmp4yTcUwIFF9DZbETCXdlo6nQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1VASyN6PIZ7ZCarTYKOwZ8vdi7tK4AEPkqWKn8Xuxw=;
 b=AG7cXIpv8uLQdr/Rc6+D8zCohNT8TImLR49D4HVSYkfdjBwmwbxFSRrQcBIngnbgfCP5E44eyTZ2b5PQLKAWh2vr2E4Mw56vpw+firzeFXwrCzZQmT8g9FUoJtaVJlLE3MpVJ75P6Z0pMGVHjIE+cQYJGJXOSTirjdlec60kZsA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4408.eurprd08.prod.outlook.com (2603:10a6:20b:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 11 Feb
 2021 16:29:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Thu, 11 Feb 2021
 16:29:31 +0000
Subject: Re: [PATCH v2 1/2] block: Explicit null-co uses 'read-zeroes=false'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210211142656.3818078-2-philmd@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <602836f0-848d-1840-635d-4a972e7a205f@virtuozzo.com>
Date: Thu, 11 Feb 2021 19:29:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210211142656.3818078-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.212]
X-ClientProxiedBy: AM0PR02CA0191.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.212) by
 AM0PR02CA0191.eurprd02.prod.outlook.com (2603:10a6:20b:28e::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 16:29:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb11e8e8-077e-48d5-8de8-08d8ceaa35e6
X-MS-TrafficTypeDiagnostic: AM6PR08MB4408:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4408882D5862AF86D10651ACC18C9@AM6PR08MB4408.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8MMKZ/243631KQKLeIpEaawrZKw+mmb515lLrrbjNKXign9v9c7LQg8aeRlKENr25HUoFJkmyfCv/8qmZFUy0ChjDtoqUVBPC0lET7gkp2wDOjEWlGTZcb6OBNz2ovSNtaWpW8A3S1hCMjhuCzD0R6YVKQgZjdT3pLwwesj200xftLGgT6F1fDXqWNPv/+1v40LWQxJWRe3FCxme3VCnKGlQ7ywKt0TahV6VOAqQkKzmnHFoCVt7adP7PcWfI7aSWx5jEhJMQlWCJIjKZSBaGOIlfcLA+YEZGgJ3imDQ8F7enIJCTjKc1nxGuhrteMs0NnaGEjxb9DdZBQgg2Mj7P00mzv/6+DhosdrmtPaDSeYhspCmG9mqy94J8Qehhn6H8pb6vOUR0wRQyXwcAICJ2otS2ZwSmYhv5ub7zTgTI6QP+0GWPn9GMJGMCbuoMKmilC1EE0UNbEFuS5qsGV8tps19cwyYCuLi0AHsUC6GLCEj33Sf5c1fDjNO0Qbzmhb6vhPZ6TbCczVLm/+TOkGz4xb+dSSRzQg1xP/PCYNM+9wifLmyxm8uW+Q0dB/ZPzzv7G29AijPZ5IQvHDzuLZ0IAvJuUXouP0XV5YmQY46p+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(136003)(366004)(396003)(376002)(66556008)(66476007)(52116002)(36756003)(478600001)(16576012)(8676002)(316002)(54906003)(5660300002)(31696002)(66946007)(4326008)(2906002)(26005)(83380400001)(6486002)(31686004)(7416002)(186003)(16526019)(8936002)(956004)(86362001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZXNZNWE4SERiUGZHTWVCek40K2tHa0dxUFJOU0l4ZXZvYVdQWmJ6cndJOUtj?=
 =?utf-8?B?SUF5bzZhSnVCdndsc3FoS28xaXk2Y1A5bmY4aFMxd3NNVHVDWUdCb1J1eXFk?=
 =?utf-8?B?V1czYlUwdzA4S0xJTWcwTkVQZGpMTWM2WkdGZEJmcklkcTMyL3pyaGVYdTUv?=
 =?utf-8?B?aHpPUnovVVFySERpTzZCTGJvQlkxRjVZWmo1cVdlcmFtM1NqQXNLcGpXMUlt?=
 =?utf-8?B?U1dVOGZYYnZ3NGw1YXRTUjZFa3h3MEJmSENieStBU0J6UitYTGJNVnJiOWg1?=
 =?utf-8?B?ZjZHNGxaRzZJNk51U1pQbWdzcnJBeFU5UDRFdWxlMXBnZ1Z6ZmZrbXpuK3Ez?=
 =?utf-8?B?cVkwbnN1MUtZQXhwb3c4Mnc4aW53dWI0UnNmN203U3IzQkt4UGZIdE5WSkZm?=
 =?utf-8?B?V2xzc1VnQTRmQWo0OEN5bWt3M0wvZHd5S3BLNHloclp4dTN3VVpNWXZDa1Y5?=
 =?utf-8?B?aU9qd1ZGTTFrREhWanoyYUdXck13WktuYnpmZEpWN0MzMmxoK3QyV1ZGN2Jn?=
 =?utf-8?B?MFVpZm9oQi9PWjNOb0hUU3MyVlJXNXRqRzl6OXdReFNadjBFbkVPaTBPWXVG?=
 =?utf-8?B?ek1wK1ZTU2hKcm42UFNOTVgzSERuRTlJZHFWaUFqdjhpempmUUczbDdwRUxC?=
 =?utf-8?B?R3ZwZThWdXVFN29Ed2pIZkxRQjBzckNtMy9jd2xKSVdsZmVQMngwMXJOSlRP?=
 =?utf-8?B?U0I1T1RuK21IemhWbmtpZGhXWmFOSkJNeEQ4T0haN0Ixc05oQW9GZmkwTWwv?=
 =?utf-8?B?VW1YLzhBb0lIeDhqOHVFMlppVlV2ZElyTDRzeW5ERktwVDk2UnNwWlJMaUJ5?=
 =?utf-8?B?NXJLU2M5M2I3b0tRekZiVk1LcXY3cDBuK1kzcXBsK2JjZG54YUU0d05zdXRX?=
 =?utf-8?B?aEhEa29UdlJ1U2dzb05kQlBoZThqRUZSclVsd2wzVWo5ZTZlN3NOOFdaUGlK?=
 =?utf-8?B?c1ljQUVUL1JXTHdSR3FUK2grcjRQZXRValFkZTVGeTRFZVhjTGFJWlpCWmh6?=
 =?utf-8?B?dHZIRlJIRE9sNlRaZHB1WkpCN0RVY0ZZRGRCYWloRWZKUmlQQjltZDVTUHRR?=
 =?utf-8?B?WGF4TzZZcUxzeGgyZnp4K21qVzNMMEpTM2pWQ3hYNUJJbDlkY3VBMWVURENW?=
 =?utf-8?B?WGZsZDJDWTBGMEdCb2RWdnNzRVp5R0wrb1NmVHpZc0crOTRybEQ3ZEZJY3Zo?=
 =?utf-8?B?U2R1L2RpcFJvVlU1NzhMUnAzQ01iZ2RidWJMQXBGWHhBN3lpNWhPazJ3YnQv?=
 =?utf-8?B?TzBhTWNlQkFYSVgrUkZPU2ZwK3RmdkduelhuRVRINy9Tc043QkNKSTFBaEFl?=
 =?utf-8?B?aHl6ZWdsVDM0Q3FTQnlSaEh1Y1lJbFYzdkxQaFZyZkt6QUVLOE5tWGZNVEtL?=
 =?utf-8?B?YVZtOFZQbmVjWXlsSUFXU09LbnZjU1M2MTQrNHhUbFBXT2lVdWZxRGR6djN5?=
 =?utf-8?B?NlhaM0ZZWURCSCt1UG1GakhnSEdoM3NySHFYVi8yd1RaMnI3ZnZEOWVBazh1?=
 =?utf-8?B?VlJsYkNTQUhVbUNsd0FtYUk3c09WN3RmdWVXaXFmVnNwczk5ZnJSNnVYSy8y?=
 =?utf-8?B?Q2pJUldLN3NWVGlEd0pxR2tTSjJ6VXNkSnRYVW5yY3VINTZJc2pWb0lkZG5j?=
 =?utf-8?B?VHZhM1lkeVNFTkFzamE1dmZHMEVDUGE3aEFTRjhrOU4ydUJWOFA4Rk8xTm9t?=
 =?utf-8?B?bnFHSEdxc2ZYQTZhOFo0M2NtL2NEa0R1Qk5yczJpT29xWTlJcUdxMkwzb1lX?=
 =?utf-8?Q?JtZDlhtSwbR3PlibrgI9x7EhCFUnIDU9JsQCWft?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb11e8e8-077e-48d5-8de8-08d8ceaa35e6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 16:29:31.8393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvUHpvlkOu8/BeUCQWbVNItptvl1aIRik3ArrzGzLv1Pf2gACt63XvTZ3yorA0IypLQ0Blr/V8uR6R6OTJTzxOGT7p6bh08+7tW7b2dyjE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4408
Received-SPF: pass client-ip=40.107.6.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_NONE=-0.0001,
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

11.02.2021 17:26, Philippe Mathieu-Daudé wrote:
> We are going to switch the 'null-co' default 'read-zeroes' value
> from FALSE to TRUE in the next commit. First explicit the FALSE
> value when it is not set.
> 
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> - Missing: 056 & 155. I couldn't figure out the proper syntax,
>    any help welcomed...
> - I'm unsure about 162, this doesn't seem to use the null-co
>    driver but rather testing global syntax.
> ---
>   docs/devel/testing.rst                     | 14 +++++++-------
>   tests/qtest/fuzz/generic_fuzz_configs.h    | 11 ++++++-----
>   tests/test-bdrv-drain.c                    | 10 ++++++++--
>   tests/acceptance/virtio_check_params.py    |  2 +-
>   tests/perf/block/qcow2/convert-blockstatus |  6 +++---
>   tests/qemu-iotests/040                     |  2 +-
>   tests/qemu-iotests/041                     | 12 ++++++++----
>   tests/qemu-iotests/051                     |  2 +-
>   tests/qemu-iotests/051.out                 |  2 +-
>   tests/qemu-iotests/051.pc.out              |  4 ++--
>   tests/qemu-iotests/087                     |  6 ++++--
>   tests/qemu-iotests/118                     |  2 +-
>   tests/qemu-iotests/133                     |  2 +-
>   tests/qemu-iotests/153                     |  8 ++++----
>   tests/qemu-iotests/184                     |  2 ++
>   tests/qemu-iotests/184.out                 | 10 +++++-----
>   tests/qemu-iotests/218                     |  3 +++
>   tests/qemu-iotests/224                     |  3 ++-
>   tests/qemu-iotests/224.out                 |  8 ++++----
>   tests/qemu-iotests/225                     |  2 +-
>   tests/qemu-iotests/227                     |  4 ++--
>   tests/qemu-iotests/227.out                 |  4 ++--
>   tests/qemu-iotests/228                     |  2 +-
>   tests/qemu-iotests/235                     |  1 +
>   tests/qemu-iotests/245                     |  2 +-
>   tests/qemu-iotests/270                     |  2 +-
>   tests/qemu-iotests/283                     |  3 ++-
>   tests/qemu-iotests/283.out                 |  4 ++--
>   tests/qemu-iotests/299                     |  1 +
>   tests/qemu-iotests/299.out                 |  2 +-
>   tests/qemu-iotests/300                     |  4 ++--

Why do you think these tests will work bad with new default?

At least everything under tests/qemu-iotests/ and tests/test-bdrv-drain are not about performance

tests/perf/block/qcow2/convert-blockstatus is OK with new default too.


-- 
Best regards,
Vladimir

