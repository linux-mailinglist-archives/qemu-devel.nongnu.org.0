Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF48E4A6195
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:48:38 +0100 (CET)
Received: from localhost ([::1]:35184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwKb-00078q-IP
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:48:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nEugO-0003km-9R; Tue, 01 Feb 2022 10:03:03 -0500
Received: from mail-eopbgr130108.outbound.protection.outlook.com
 ([40.107.13.108]:28577 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nEug5-0005kA-CE; Tue, 01 Feb 2022 10:02:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfFf4crW/LCE+uoZ+4ZD+W9803jDPXmwkvo9YFq0MqMjposmh5J9sVIZCTIxVRSviGyQxyW/VzeVHVvlTLi26U4VHlcIgbXwejdSpbkDQZALTnQsnuhE9aU17zSPwdV+wkhwJdDsMGLkIAgeCM1AOneQ4XJ4wniUkB6f4GwY2/ABNai1As4O4/yJhqislE9c4GmJDb3zsYdxIBmfMJvGPy2a7M1yT2aQ97Ze5095/blaW3vZ3vI2dU1w/NYzT7pTUdKukMKTLEswxwqAgdpHgwsSuzUbEiDjRuvEKCP44i5eXOWKFB8Y6HZbYCxjlkxop+uPLcvneRqWXkKJrgWw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2DR8RJE+zpHoCIlr0AQlIHjw3QZt1YsXCMMp7XL1WA=;
 b=bOFjevB8Wc2MNlfymWk0W+6CTc5QPd634lWGbCNc7z5VO7JTF37dSNrVwOl2VNCPBLF7mp3NFCn8GACrwW/kVoOd5IR97keUu4euSeIhLzSRaI359p/1WdckeM3cRwoqWAp0waazgGVfqGiQA4YiSnFSaESbtqJ66k9rLqnBbBg7f+SsjLAj6jKySRsTaWjhdjDoCANqvsRiHG6TVqV1NRT8KNLFImPL2JUwdkmjL8+t+SZ+qLAmXU05G4ojmNQiVyqby1UWSFBOMn6ZsmN6gh0V0q6I25TfC9cOo+Jh9Cch/D/bU5Gm6osad5WrEraTG7HZzogzQGv+eQF33ndMKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2DR8RJE+zpHoCIlr0AQlIHjw3QZt1YsXCMMp7XL1WA=;
 b=Ryl3FAgXeN5jAATD7fXgSPdHKT7eZ88/OoPwx8bxPoPul7zIOnaQbJCBIO+duKV08+D9zUxap/upVFTAfuidSOgBuMBMJ2GUjh7iKW8P3/nI+KvY6izyHq6MzstLP1olv6sagKnrgA+2XxHsSnWwdYadL+u3No5OOG7anrwMzaU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PAXPR08MB6910.eurprd08.prod.outlook.com (2603:10a6:102:132::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Tue, 1 Feb
 2022 14:29:29 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 14:29:29 +0000
Message-ID: <efe6c729-165f-1c67-a466-4fddcf3475a2@virtuozzo.com>
Date: Tue, 1 Feb 2022 17:29:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 00/14] block: cleanup backing and file handling
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com
References: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cc8386e-f884-4d7a-a62a-08d9e58f4182
X-MS-TrafficTypeDiagnostic: PAXPR08MB6910:EE_
X-Microsoft-Antispam-PRVS: <PAXPR08MB6910F06F9191D1ADA0539387C1269@PAXPR08MB6910.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eptD8c8DxgRR3sGzPcD/s8m2iCahEdOE2l2/hjNF2WTon9+w1vQBR58FYJ+DYdaqFRoGbX6Aykxpmn9eEVw0e0Nf5dG1Wq0DlklsWXh7zckVNMAX6NICAkCQg7b+wAPTTA5SAFBxm+EJEazHBU4XC28CIdcyMH/g1EdEtczZNCcdtzPgGbfRK6BqlvZIe1Lry2nUUAM748dBaR31PUTtSyAA9KeNLIANkUWgLYKrs8H041L9xWHZ5b/8gZQWS3XcmotGfJr3uF9hvaJlZtG+OijFl24clBAXlPMe9xET2662Pu4kK9r970SwVs6EeNjxnrVGyslPbghdo2RUAy/Lvy0zF5n4KuDZtvY60bolg6VsGXm4bTIOWtkUM3/LZ1mHaoqQ5j59FZlp6JB7+b3qW2CeVke209WIGP+e/Kr5OZyUZbagzLB3c4/MUMg3QnqKIoPjZEonvR3Hy/n8A+Bwqp5GbuZvZO1OnSnqHNMpx1wfkMh560OenWrM7MiPfaFkiwzeL1lXHwQCrki1BxMnFGqYo7dNlvD6MXU7wxIidZFv7hTKj7IQK1EAvdmmQ5GV5q/kmJzOYnankvms17Vsp6wIv2gT3hVUtfXk4xde6NeA9F4e2u19IGBxudxKE+4UMP6TNdokde45MR9DnTbT2XJ8UxC68JALXJSv+e7W9aD1cu8LHfbpkthlYmEHijC7loTYCN6zWPyVMwReBwMVVwoIULh3NPYCsbc3hR53k7hXzS2TozQCISGOCu0Hg23NldBvU9fNeTTzsy+6mdv3Tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(66476007)(8676002)(8936002)(5660300002)(2616005)(66946007)(2906002)(4326008)(31696002)(6512007)(6506007)(52116002)(86362001)(508600001)(6486002)(31686004)(83380400001)(38350700002)(38100700002)(186003)(6916009)(316002)(36756003)(26005)(45080400002)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm85b3JoRjJLK25vVmJvZ1Ryd3JUVFVUbzl6eXN2UFVVakRDaXZ4cDBhUnFG?=
 =?utf-8?B?TmxMMyt3ZkozNEJBSjJEQ2gxTW1HNU55Y3RNSW5laVR0UUtybzUyNjNHRjFa?=
 =?utf-8?B?K1EyTk8yN2tJTTk1c3NPZGJTaG5OVFdyb1FwK3ppTFRxckM5NnJ3MEJiVjRP?=
 =?utf-8?B?eldDWHFnRXQxcHhhRGpIM2IyV3N0Wk9nTGdwZ2RtTllkWkcxd2JldFJLaHNh?=
 =?utf-8?B?YytDdW9wZEVSWWNzVklrdkFCOElLbkw2QXJiQzBVOGk3VVZmYVppTDB2Q2hk?=
 =?utf-8?B?NmgyZXpCVDlKRjR1d2pHZFJhd1lHSlZrWWJBd050UDlmK1lEVkt4SjNza3Zq?=
 =?utf-8?B?L0JrajUwV3QwS3JWSmNyUVkyTTc3VEI1dm85NTR1TnZsbDA0QUtCZWk4TnBh?=
 =?utf-8?B?ZVM5eG02aUdkSWFKQUE4UUZtSWxXeEdObUJidmZvbndWQlEzN0dqUlo2Q3oz?=
 =?utf-8?B?M0pYTDdiKzNSblNhR05YdVNmOW1DcndqN3dCZXprdWNMcER4YlpIVCtldnFN?=
 =?utf-8?B?UW1KRnphN21jbEkvQlkvcW13NU9Hb2kra0U4QUtId3RUNUkvc08zVHl5bkFq?=
 =?utf-8?B?aGlwYXZoYnZ5ZTBhRm5uRWYxWlc5Skl6T2x3QXBBeVdjdm5iRnFGZW83T0lx?=
 =?utf-8?B?NlJZdVcyMjJPL2xMQzJlZzB2V2o5Sm9KUnZwbW1sVERvWFVGZmJkYWk0Q1Fh?=
 =?utf-8?B?SGlpOXZrQzl4TlRDWkNvRUozZ04xOXVyMjA2U1JCcGwzcFJWZlVFY3FSWi9E?=
 =?utf-8?B?c1c2RHIxYVFpM3o4VnFoM1lQQUhlUWtnYTl5ZEw2Y0hiM3ZwMVFMVVdrSUcx?=
 =?utf-8?B?U3lYOVlFaXVTQTh0aGFET2hWSnVyYlJhdjRQamZJVmUyWVNJMk52MThoaVdM?=
 =?utf-8?B?RUtpVC9wWCthb0tMUXh1TXFKZDJ6K2lwWXlBaEhRaCtnMmppNVVQTEJYQ3Vz?=
 =?utf-8?B?NVhmN1dCYW1UUXFJWmw3RzA0Nmh0RW9ORWF4ZnJNWjJBWWh0YlZtUUJTN1JU?=
 =?utf-8?B?L01BVWNUWFpMTkNqY3EzaFMydjJmdEN0SG1FVTExN1hrTHFGUzJycnd3cUZ1?=
 =?utf-8?B?UysvQVlEWDY2R3JWalViMkhHdks0K0xUcndHWkhRTFNLWkZTL0o3UTJ6Y0Js?=
 =?utf-8?B?Um5aclZ5NS9MVHBZbFdoZGJDeC9BUWpOSzNsUXVmU2RYRFhrZFBBRUNyM3R2?=
 =?utf-8?B?RXBOMkx1Rkd6NHRpTkdzS2dSb040YzNWOEYwc1k4RHo3MnFLdE9BekxhZjMy?=
 =?utf-8?B?Sk8rYk1BV2dPWFdvSytEOE9XM3hDUUNFdmJHUVY3ajA2Qi9jVWVsczZKYWFI?=
 =?utf-8?B?QXNmbnpSdm9ac2RnR0V2TmdYQkpocjdzS2FTMjZiZUhvUjl0TmExazNMNzNB?=
 =?utf-8?B?dnF4VENKdjF6MWl1YUhvREI3MnNIOGhTb0F5cWk4bmVmaVlvQWhIc1lXaFBU?=
 =?utf-8?B?L0xuSngwTWRGc1JSTFlZRG13elprN1QxNWc0UnNoQ09FUGRVMm83bzVGZE1k?=
 =?utf-8?B?YVozNlhabTdOL3l0MzAzRmVDVCtJSFdDaW1IbUV0Mkd3Ulh5SnozUFVlLzUx?=
 =?utf-8?B?UGczQkxSTjlyc0Z5K1J0RXJjMG03WU0wUERxaWxrT2sxdXMvT0htbGxKOXkz?=
 =?utf-8?B?MXFaUTBRTmVGZTd1TnhLVkpRaHhoRC8vU09CWDZzVC9NYm5ERW5FOXNZeEtl?=
 =?utf-8?B?QXdrWkVtQ2wyekJWdU9keDhna3B1UzFCbm1uL0FLYUQ3SGM4bjZqYTVaWnI2?=
 =?utf-8?B?bmlRQTlHSnNtUXlIbVdmMDVRMmMrcU9INXJMZU8wZW1hZGRrbjh0U3djUnAv?=
 =?utf-8?B?WDlqa3A3TmVPcTV4d0RQbC95UVhjQ0JySDN5eVNaajZobFd6ZU9tR0xlN3o5?=
 =?utf-8?B?cWNTZ3ZYQURmNTRVZTRCU0RYVjhIUk84UDE3aWdRMVB2WjRQTStTbGtFaG5j?=
 =?utf-8?B?Rmc5OGhKQ3NtVzdlWGdVNGJ1K1ZhSzkxSnhQZlFVOWNKSG96VUpXMmlvOXNz?=
 =?utf-8?B?VzltNTUweGRjbjNTcVJjZjZMT2pZWVJrWElmMGIzL2xuYXk5c2FsTFVWbTZE?=
 =?utf-8?B?ejU2R094ZTZvT3BLMm94NG1YOGJIR1N3dG1KdGFuT2lFYjNJM0x1Q0tKQ2ll?=
 =?utf-8?B?TjFZb1p4WmdzU014S0FpRW5pNmF0NndKQXJaUy9BbUgvbDRYeG9OamNBYldD?=
 =?utf-8?B?RWVxdmxkSU90NlcyRklyRy83OTVHWFozTlp2TXo2bG55clUzMWtiMmJCK2pl?=
 =?utf-8?Q?/gC5uPEV01Rus96zmz55XAVd0ONO7oidrhd8qOb8gI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc8386e-f884-4d7a-a62a-08d9e58f4182
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 14:29:29.4144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8kqsFStIhj+B8dZj4X8USeDrXP/dM7K+t7Wly2IK7kO6qKTP4Z/lmTIX7hI1A3ODRrv6oFp+6qL63CVKG/NWlW8KBZWDuuoQkGcE8HooGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6910
Received-SPF: pass client-ip=40.107.13.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Ping

03.12.2021 23:25, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> I started this as a follow-up to
> "block: Attempt on fixing 030-reported errors" by Hanna.
> 
> In Hanna's series I really like how bs->children handling moved to
> .attach/.detach handlers.
> 
> .file and .backing are kind of "shortcuts" or "links" to some elementes
> of this list, they duplicate the information. So they should be updated
> in the same place to be in sync.
> 
> On the way to this target, I do also the following cleanups:
> 
>   - establish, which restrictions we have on how much children of
>   different roles should node has, and which of the should be linked in
>   .file / .backing. Add documentation and assertions.
> 
>   - drop all the complicated logic around passing pointer to bs->backing
>   / bs->file  (BdrvChild **c), so that the field be automatically
>   updated. Now they are natively automatically updated in
>   .attach/.detach, so the rest of the code becomes simpler.
> 
>   - now .file / .backing are updated ONLY in .attach / .detach, no other
>   code modify these fields
> 
> Vladimir Sementsov-Ogievskiy (14):
>    block: BlockDriver: add .filtered_child_is_backing field
>    block: introduce bdrv_open_file_child() helper
>    block/blklogwrites: don't care to remove bs->file child on failure
>    test-bdrv-graph-mod: update test_parallel_perm_update test case
>    tests-bdrv-drain: bdrv_replace_test driver: declare supports_backing
>    test-bdrv-graph-mod: fix filters to be filters
>    block: document connection between child roles and
>      bs->backing/bs->file
>    block/snapshot: stress that we fallback to primary child
>    Revert "block: Let replace_child_noperm free children"
>    Revert "block: Let replace_child_tran keep indirect pointer"
>    Revert "block: Restructure remove_file_or_backing_child()"
>    Revert "block: Pass BdrvChild ** to replace_child_noperm"
>    block: Manipulate bs->file / bs->backing pointers in .attach/.detach
>    block/snapshot: drop indirection around bdrv_snapshot_fallback_ptr
> 
>   include/block/block.h            |  45 +++++
>   include/block/block_int.h        |  30 ++-
>   block.c                          | 335 ++++++++++---------------------
>   block/blkdebug.c                 |   9 +-
>   block/blklogwrites.c             |  11 +-
>   block/blkreplay.c                |   7 +-
>   block/blkverify.c                |   9 +-
>   block/bochs.c                    |   7 +-
>   block/cloop.c                    |   7 +-
>   block/commit.c                   |   1 +
>   block/copy-before-write.c        |   9 +-
>   block/copy-on-read.c             |   9 +-
>   block/crypto.c                   |  11 +-
>   block/dmg.c                      |   7 +-
>   block/filter-compress.c          |   6 +-
>   block/mirror.c                   |   1 +
>   block/parallels.c                |   7 +-
>   block/preallocate.c              |   9 +-
>   block/qcow.c                     |   6 +-
>   block/qcow2.c                    |   8 +-
>   block/qed.c                      |   8 +-
>   block/raw-format.c               |   4 +-
>   block/replication.c              |   8 +-
>   block/snapshot.c                 |  60 ++----
>   block/throttle.c                 |   8 +-
>   block/vdi.c                      |   7 +-
>   block/vhdx.c                     |   7 +-
>   block/vmdk.c                     |   7 +-
>   block/vpc.c                      |   7 +-
>   tests/unit/test-bdrv-drain.c     |  11 +-
>   tests/unit/test-bdrv-graph-mod.c |  94 ++++++---
>   31 files changed, 343 insertions(+), 412 deletions(-)
> 


-- 
Best regards,
Vladimir

