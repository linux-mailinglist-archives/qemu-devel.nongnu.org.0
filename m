Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0F13086F3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:20:40 +0100 (CET)
Received: from localhost ([::1]:51978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5P1D-0008Uy-KE
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5P00-0007uS-Vh; Fri, 29 Jan 2021 03:19:24 -0500
Received: from mail-eopbgr60094.outbound.protection.outlook.com
 ([40.107.6.94]:15996 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5Ozx-0004YK-Sp; Fri, 29 Jan 2021 03:19:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHNUIwK2lLEobbSrg11codDeAYNwdcwMvyR506eQsk3l+3CZvQL66uuZCMDNcX+87RatGb6dLZc90XAi5f19PRuU4W6rcFx5De3piUk30QHLCxYRm/Qo3JBhYg+5d9LVTJK65GbbaBLVqv9/O7O0vHZdoQMYyieL0mtkfU3IHf154wGwYhYVJtMx80lxSjrlgu2NmvadIxY1zWRnk/mDgJxDAXAVqiFdH0FHFeAZWrYYPIFvVJglZlvqrZwBCjBeMznTvSj1zEX07b2mrrwms+joQcImoqa7TvMLB6PyNUSc8mr6m4349UNNDrfPvfmKs35PcP1prk6oZyPwo/dbBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLmERZpE4Iyz79cJpcoUzHhtVdvlKwQIrMqoknWX9rc=;
 b=Li98tVyIeRb53GNKreUFz336OWhCUGaDRsHm0sjjDMhh+DeP95jUQQHt1bAssrlrvGRkQptLEsi+oTbqXGRm6pyP/Zp5CqdjJrT7yPoP28uq6RxTt4bIXVnl4DLkXjqzHBt7YfcswYrzayq1ZnQF/zcp+m5In1EUn9br1qa9OzlPYrGkNu762gLQREo5rnT5sSrue0aVkeZkQxlaeV16xPaYUPb0LkQjrURONbZeQxLVkbwsLX1K/nPCNu2DD52iGq/2dwSpLqKNyiPvZLI5Qq37ln5TEPfYdaLbPOpUoXV4AdRzg2s70kie2J+7iFHqmDHF9OZIBoz4pdEB96uwVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLmERZpE4Iyz79cJpcoUzHhtVdvlKwQIrMqoknWX9rc=;
 b=F0azp2e3HrkuvfNSLHvitRUCYkTQIung3TFFgFHBAu5gLoLaG9fDJ8nUZJN9JXpaDBF/STGIeqYWPTVoeiV5zBfFtNEAB7pRygxP5sSNO2cDCQYAhtnV4OXR0pCOroWfDzfXQ/91zfWBQ8A8MmKW7a5zTuNvFqBHt6ubEprLPC0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3095.eurprd08.prod.outlook.com (2603:10a6:209:45::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Fri, 29 Jan
 2021 08:19:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 08:19:17 +0000
Subject: Re: [PATCH 0/3] block/nbd: fix crashers in reconnect while migrating
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210128201418.607640-1-rvkagan@yandex-team.ru>
 <7555daaf-1e1b-1ef7-a5d1-24d98a18599d@virtuozzo.com>
 <20210129073527.GC3053@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e773ab0d-0593-bd77-b4fa-8689267d6fa3@virtuozzo.com>
Date: Fri, 29 Jan 2021 11:19:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210129073527.GC3053@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.152]
X-ClientProxiedBy: AM0PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:208:14::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.152) by
 AM0PR03CA0010.eurprd03.prod.outlook.com (2603:10a6:208:14::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 08:19:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8576b4ae-2429-4688-0c99-08d8c42e9264
X-MS-TrafficTypeDiagnostic: AM6PR08MB3095:
X-Microsoft-Antispam-PRVS: <AM6PR08MB309573584E296045831BC165C1B99@AM6PR08MB3095.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /xqmNgXOgLw2KNF3v2ypOsjWky4TgrCnPmFlmike9DPPJ6EeqKtByc5YkOr5quIgEuzTovNnfJqt64dz1HpN41oeHxxUagPQQCMMIrkvIV2KkADg5mrs9Qe4hnVkK3CqdFMxJ0SPXg2xHyxsTFf3OTCyBRWvicWeD2LhKfOBrOuunYy/zsAwLhIlLuV9eSFyrc6o/RzZLKKcJ/vjGBmaHe3j/fTykpuYxHxbbvN6Tpzo7geXtvw/ou7N1FKUBRdyYkUTFpba/jtY0UAbKAWmT6P4T8wrXrPZ4sYhaP2h3z66+x7Ywp9NuFbuKp44rzMPZebUL+rpY+qs5x96xWjuHNeK9jscFXp6Joysj/1d2tqpb+sgLyHqr/vTcjsTRbXQ9I3ybzGmscTSr5SQlhvquU8gSDlYeGs+V50gQlXl8S5eWqm8h6iLh7BMp/opSZmS6ElyvRN9C0Vl+Ad3tvrIRNe84PQGB20ThmV7H9WLMq84y8iUQ4NP9HI5gny/aerOjdeelIHGhknoJ84fTaAHUc7iFUZMiNbLn2K0EznuiVovU/NgwHhkSnHufyef6OBC0A6TdFoPWRNX7lnHTpKuCjdGGrBAqy+xeDgYbUaRoAU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(376002)(346002)(136003)(396003)(66476007)(83380400001)(110136005)(2616005)(186003)(16576012)(86362001)(316002)(31696002)(8676002)(36756003)(66556008)(26005)(478600001)(31686004)(5660300002)(66946007)(956004)(52116002)(2906002)(8936002)(6486002)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z2Q4ZGJQWldXRkcwVm94U1lHdWdXWm1xcTJkWDJnU0lGQkF4dHlwTTVLQVZp?=
 =?utf-8?B?VXpKN0RRS3JDbWJqbkYvS3pXZTBqN0VJR3ZwUHRNSzBFdkczYXR4ZTQwYXJF?=
 =?utf-8?B?Sy9PQktxSWpqMllRT0lLc0ZxV2JremY0SWZLc3FSZ2NjTDc4dHZCNHJod3NE?=
 =?utf-8?B?dWYwTlMxZ2MzNWdDekJSUnpUUWQvVDZsODJJd1lvV1NvT3VPYTdYanNTczYz?=
 =?utf-8?B?alFaWTRxc05ENTRROHpWTi91aU1HVFpEWkFzTHlTM1RacU1hQVdVVHVQMnZn?=
 =?utf-8?B?Vzlhd1F1aUYrdW15S2ordWZOeEg0WE5BZWtES0RjK2ZGTVNvRGlzK0tsWXkr?=
 =?utf-8?B?RTNnMHVTeVVjYXJvRy9LT0VtOHpsZS9adVpoSmhISzBJTm4rTW9lZGptMUs3?=
 =?utf-8?B?akFXMTFPQ0tRYm1jMG1GcndMdm1MaTBBQ1RlajU4Y0lGTm1xQk9hN0NnRCt3?=
 =?utf-8?B?aGE3WCsxQmgyY3dLZWt1UUdtUThGcGd2Q0E2N0duMVVFbTVLMldwY1RreXF5?=
 =?utf-8?B?bitsYkN4VlFYeEJPdTI1cHlnek5qVzhBOFNaVzFuWTFIOWhrV1d6QTNFZzhU?=
 =?utf-8?B?ZExXKzM1eUc3V2t4YjRvQzYySjJxK0w4RWFlcHlMb1ZEbDU1Y2hVSndmb0lq?=
 =?utf-8?B?elhab2d0VE9ocmRTbC85b1ZGaXFleFVXSStTenNqLzdjQ0krMWwvakIzRXhY?=
 =?utf-8?B?eStOdmRzU3ZxdzBBb044SXp6TmFlS1ZNUVpTeExQVDlTOVVXcXlmT25JY1lZ?=
 =?utf-8?B?ZzQwbGVJamplbHFlRDhha0FONTdWNC9uNG9iRTNOejZJK0F2RXhLVW4yckNm?=
 =?utf-8?B?dldmV3dPZVZRditWNzJnaWNpL3R4alFWNERBUWdLUHFKaW54VmVjT0ZQZ3M1?=
 =?utf-8?B?NDRHYzVPOXpNcTEycDFHU2JabWlnTlh6Zy9NZmUwSHJGTjE3SnV0QXZ0Nk8z?=
 =?utf-8?B?RnVPWkQ5Tmw4SXZvZXoraGFFS3U0UEwwK3R5ZEg2WU5LVGt2V3o3TUNQRE04?=
 =?utf-8?B?dnZkL25CRGw5T256Q1Nzc0NtMGo4SXdNWXdSMS9qMEVrbi9ySlorc0FYelAv?=
 =?utf-8?B?cDN6TExXVkFwenBPdG5hZWovZ2lQS1pKWUhWNWNUUEk4UGVZZStlcXc2ZmZp?=
 =?utf-8?B?THVIZmZsK1pZNDB2QVBQQnJSWHRwbk9kY3JrN2FqNkI0SHBNVld2M3g0TTdE?=
 =?utf-8?B?NlhRSjIvMzdkYjFZeklHRU1JL05wRHVNTGNMU0NyeTNDdXJrV2dJMUR4Nndi?=
 =?utf-8?B?SkN2aFpvb1FCcEZzQ0cwY2VPMjlQU3lRZ0pEd1NrUzl3NzNxOWExS1lhcXNC?=
 =?utf-8?B?MFpwdW80V1NkUXFqYVczNjJiaEd6VnltYkQ1RkxxbGhwcXpwcmJkR01JbFlr?=
 =?utf-8?B?eHFNeFdZM0c5bllwbTZtdE9CZm9BSDZVTzIrOThrUDBrWk5FMmI3VGlhS2oy?=
 =?utf-8?Q?3hBCf2gx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8576b4ae-2429-4688-0c99-08d8c42e9264
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 08:19:17.8098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: meTtN5eqvX+A5VNOPG1PdvC+4Y+EABqRZllM0k1tOAh6xmzOU0HZvgoSWXoGPfHpT1nmYAkmGz00HZBuNwe7k+mMVqDvUyye9+jGB6lRfoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3095
Received-SPF: pass client-ip=40.107.6.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

29.01.2021 10:35, Roman Kagan wrote:
> On Fri, Jan 29, 2021 at 08:51:39AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 28.01.2021 23:14, Roman Kagan wrote:
>>> During the final phase of migration the NBD reconnection logic may
>>> encounter situations it doesn't expect during regular operation.
>>>
>>> This series addresses some of them that make qemu crash.  They are
>>> reproducible when a vm with a secondary drive attached via nbd with
>>> non-zero "reconnect-delay" runs a stress load (fio with big queue depth)
>>> in the guest on that drive and is migrated (e.g. to a file), while the
>>> nbd server is SIGKILL-ed and restarted every second.
>>>
>>> See the individual patches for specific crash conditions and more
>>> detailed explanations.
>>>
>>> Roman Kagan (3):
>>>     block/nbd: only detach existing iochannel from aio_context
>>>     block/nbd: only enter connection coroutine if it's present
>>>     nbd: make nbd_read* return -EIO on error
>>>
>>>    include/block/nbd.h |  7 ++++---
>>>    block/nbd.c         | 25 +++++++++++++++++--------
>>>    2 files changed, 21 insertions(+), 11 deletions(-)
>>>
>>
>> Thanks a lot for fixing!
>>
>> Do you have some reproducer scripts? Could you post them or may be add
>> an iotest?
> 
> I don't have it scripted, just ad hoc command lines.  I'll look into
> making up a test.  Can you perhaps suggest what existing test to base
> on?
> 

For now reconnect feature is covered only by two tests tests/qemu-iotests/264 and tests/qemu-iotests/277.

Also note, that since "f203080bbd iotests: rewrite check into python" you should add new iotests with human-readable file names into tests/qemu-iotests/tests subdirectory. Also you don't need to update tests/qemu-iotests/group file (it's absent now), test groups are defined in tests themselves in a comment, like "# group: rw quick".

-- 
Best regards,
Vladimir

