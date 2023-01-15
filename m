Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F1E66B267
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 17:04:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5UI-0002SG-Ts; Sun, 15 Jan 2023 11:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5UG-0002Pl-DY; Sun, 15 Jan 2023 11:04:00 -0500
Received: from mail-db3eur04on2108.outbound.protection.outlook.com
 ([40.107.6.108] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5U7-0002Bm-U4; Sun, 15 Jan 2023 11:04:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVBI4orsAgRW2OtyIHit4JHu8ofUvOohtABc4641tKf8J+s2JbpaAoKF9XaIqcYQUqEb/wAhdM5vZ0TbfdHzlDl6WmxkYbgxQWp3eJOZtmgo35hb4qD6yEAmjt0SX4B4wHqJxOiqg6KRt8p/EEwKh+Zm7FOkgwuUtu9XuUmV2lIg5v6G4fWMHEilL2Beegpi7ifrTb0BSl87wA9PRJqpfie8JA9s0mdwA7CvSrOsICIf/HMSh22Q28H4Fdsn3X/YMns/5Z4bntsFeHU9eEB+Tyo4yZsFmqPG10s++RtqPSLoF1YMCSgAAEXFPwpYaPtgCyUWDTCcZ12i7qeAE0reQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZ2ocT9vvfnQPjziRZMPaP9XMMEjgOazgO0H7iuGjCY=;
 b=HxZ7O7e5ZNgBCLDC+d0oZ8oLsqofz/1CxIEnAcv0zBYATYGVrKj5eStYXDimabvfhjSySZmHupyFJDjPvbKQK0XTtwBZE/2nXWN+2DbiXvE97eNioQMLkHAa8gBrEHmPViz19y4Luw00LzyzafVE1gtdZigTXpl+LASspt1oQhay7UULrHuqqvgMyWeaSLDG4T4NErIzBdkaPS0FqRCZeacULKMHNQFRWLkvIgg7OoNqAAPz6hkRjqWaowDfVyhMMtCHUMwDDxw0/0H/bDeQaVKTmiHlT0sizX96q4n9IziGmyux6WRj3YpAOPiL5wMe97IwWODuEieooW6GAXO2+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZ2ocT9vvfnQPjziRZMPaP9XMMEjgOazgO0H7iuGjCY=;
 b=ivbe0GCvu0+U0TOoHcv3C8743nPt2tYdxvEnsm/GvGT82VXxB6S/+4c1iL248JAerSf0E1jYOvb0eRYoq4KV3MeiT6f6pRV9sw86mu+GYZHRa7khUkEIH/UT4+H6L1xEWU+X3dtfHU/HGRZkdtF/Co23b8wOA8XkecRUZvrAJ7cXVZBMD/sgJQTDsEiOpXIxCIumP9cuREqiFznW05JEV6GsOuaKopTGQPiJi0mhI8SkUQ6w1pVR2muRVf8nFUAUODnE0pWIU4xY2mS/81EBd7R6k0lLJjFQIrbzHVn7O2LivJGlkt1psHVgBhQid8t1nC2QOtN9ME67TnLdBblNvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB8PR08MB5467.eurprd08.prod.outlook.com (2603:10a6:10:11b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Sun, 15 Jan
 2023 16:03:46 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.5986.023; Sun, 15 Jan 2023
 16:03:46 +0000
Message-ID: <a78ec510-e1c2-44cb-cf03-9547c178f3ed@virtuozzo.com>
Date: Sun, 15 Jan 2023 17:03:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 0/5] parallels: Add duplication check, repair at open, 
 fix bugs
Content-Language: en-US
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
References: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0088.eurprd09.prod.outlook.com
 (2603:10a6:802:29::32) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB8PR08MB5467:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e5c84b-7c3c-4307-e907-08daf712151e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SebTVsPwM+kJzPZiWO6ipNSHr4XoRjqS3DCAQpdww+lBZJ/E+kSZ0y5LM6dRsZc/mIhNE2BBVEG49QOKgC7Vnf+9Oi/+EVVpXoiFNvAJ4ppQA1zP+vf0y32Jv9aYldj4R/E2/HQF9StFKJFnRTnEmOybtcLJ4507rKVumvY0PurCRYfP/NGFwAd1yBRjz6z3osI6V77LcDzJbs58KgZ3RVmMSQSwQLyUpDDTTdq7Yr5WGmN2W5/of0+HBwzAhA84E7UwUft7auIKGNlPHuCldcsdg1PD6x+ny7JBttVM9JvufDNzNRV4k8p/qlp8LwO6iCz9KhOusskt1ht0RNL/egf7kZe7hSDWtqWuSpRoaX2NAR1urrWIfhLUV9jZ/7kXVYwRsDjwSZ1pL7XW9IYH/wLRN1f9yfpvqXZGUkpZzk8zUrLsmEXGu0Fj/ZysHfODhCWYbbEWjkzixFXer5XNrWhZ57AsUOowLpNF0uvff7Msh+rbU4iw1R/36M6L0ooku5Y6yoaNYY0y/LK8EZkB0YbDqlMqHELOfo08d5WbxxvEvaGqrvOUThsa+XD5qaD/1eCvfNkVVoA5z+TlsklQfnNGHai/RZOnPdvi/81oUrAWkOqRpprNhKM0O5Xugy/7AsBYlp9Cc59guxBbtD/eIuepN2jBZSlVywX+RdnvDmdK7gFLFH19i+w+yWPhSvckaa1b7ymsdM+bPBtWE4YANRtPms1d/sT7aKYGfk0L7XMGfRfuP7134u/uVYzqsr9JYKXYaaLned3yd3FVruNknA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(346002)(39850400004)(451199015)(2906002)(31696002)(86362001)(38350700002)(38100700002)(31686004)(36756003)(2616005)(6916009)(52116002)(316002)(5660300002)(66476007)(44832011)(41300700001)(4326008)(8676002)(66556008)(66946007)(83380400001)(6506007)(6486002)(6666004)(53546011)(8936002)(186003)(26005)(478600001)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1J2amZ0SSsza1F4YW9xSDIxb0pEbmRRYk5IQ0Z1Y25wK2xjQmFmWlE4L0NY?=
 =?utf-8?B?ZkliNm9BMWxBYll5c1U1eVlubE9FZ3dWWHVDamZFTmhVdHduZU5DdjF0SmFI?=
 =?utf-8?B?b3ZwanByeFFuS0V6TVg2QlhDSkhCU2YzNEFnSC9BZkk2cndaSjI2a1FvZHc1?=
 =?utf-8?B?ZVEyVjcyZXVERXAwMXBFeHB5WlFQMlJOQ2R5bkxONjZieU9vaVcycTI1UmNo?=
 =?utf-8?B?SHplbGdNSmRrU1dSY1FOK05tQkpyNWMvSnBTTzREK1NGWXEydUFNT2FjS3hn?=
 =?utf-8?B?bUJoZHBvOVlKdjg2ZjJvQ3c5U3VZdUxUYi9USk5TazgrdDY2Rkcyekg3eDZk?=
 =?utf-8?B?ZzdXcXI3UTFxb0VNaE04Y2ttK1hWUVJVSk9oSURqTDROWG14MWZ0MElBUTh4?=
 =?utf-8?B?SXhlTVI5QlRRd0VSTUpRUUhqbjJMT3hBUWVpZE9zcHlBYkU3elQrZ3hvbXNQ?=
 =?utf-8?B?TEFUclZPbU9KUGtnSlNRZkFnRENZUVRFWVBacFg4UWxVNHBiZEhWOGpTVW5w?=
 =?utf-8?B?VzRid1d4ZUJRb0lGT0N4SnZxZW5GUnp0b3RxVUdURFJBMzNpT29LczJsTGxE?=
 =?utf-8?B?TktwZDlITHc2MEYxa2pXWWYzMm5DcFBhcmh1TGg2amZnRW1qbjU1TGw0TGU0?=
 =?utf-8?B?Yk10Q282TkFmaFZrVmlKa212TEdIWXlkL0syZHNaTEFaWnhyaWhkSlA5M3FJ?=
 =?utf-8?B?OC9zK3M4bG45dE55emZuQVdOUGsybzRNNDFvT2JxNTd2bFFYVGd0Smt4Nms2?=
 =?utf-8?B?ZTN4cTBUeUlMWk5VR1FtV3kzY1dWMGxFbXd1elB1VVp5d1BFQlp4TGtkQ1Fn?=
 =?utf-8?B?NHFiblRwR2FqM0tVcStWQW5OQmJkTmFhYnhvZDVhZ0lhRkVPNjFhNWF2cXk5?=
 =?utf-8?B?dXpqWEJmZjEzbE5ReHNNWi96Rng2L0pCY2pxTndKNUx6K2pRemsyRW04U20v?=
 =?utf-8?B?MHVHZWdOc0VGblRPakVPOTJSZ014SlpiazM4d3QwRWt4OVJNbjQ0SHcvcWJV?=
 =?utf-8?B?ak04YVAvd3drc09yd2pUVEJPSXJzVTBjMVRzZGF3T3Y5R0ZsQ3RhdnM2NVh5?=
 =?utf-8?B?aFBzaHYwaVlaMGhlb1J2RWxteE5QOW03VlVOa3NMb3luRUtsV2FzU1BlWVRz?=
 =?utf-8?B?eGd0ekc5NGw0UzloMFhHZlROckpWc0tCNVVrSjFzVDVORGUvVGkxekh2Y2xM?=
 =?utf-8?B?Q01jNXVNR1VnMTVycHd4U3BmMnlZWWZtZjcrQUFSNGRiNFlLOENHVFVBV28y?=
 =?utf-8?B?R0VXUS8yZEltaVlqaTFDWmtXa0htalhmOUhmSTRMNEZ0ZUtKRGNVV0xZQTJM?=
 =?utf-8?B?RkhMT29BL2FXd0tFUDRQaTQyYjY5Zi9hMVNUc1hGa01VZEs2d1lBUTByM2V4?=
 =?utf-8?B?bFROb0NqK29ibkFLWDRud2liSVJUcEsyWmZpVjVTUlZxdGJWVlNnaU9aS0l6?=
 =?utf-8?B?VG1ISXFJVWN0akozMjRVUEpWQVVxNXVldCtqaW4yUm96WXZSbFA5TGhXWHNK?=
 =?utf-8?B?RTRoc08wT0Mxc2ZFTFMrNWRudDRPM3N4SFBST0VPbkVwaFZhWlpMeGU2WWNm?=
 =?utf-8?B?djNiRm5yTjViYWdTczJkLzlzQ3JNc2NnMXdrcTQ1a0lTUFYzYXVFa3hGVjM0?=
 =?utf-8?B?R1EvdFRQbWNOcjg0YmtvaWZxVmVrV1NEK0l2dWwxeUloU2kwK3F5bnd0d1Ni?=
 =?utf-8?B?NjRsc2ZvR3VBRGFOa3NuQStBL2N0a25saXNwNnNjRHo5VFNteDNFKzhPb3pE?=
 =?utf-8?B?WktXUFgvY2ZSMS9MUEdLMUNnVWpzVHJoQWxGdzhOVmMrVW1sZ1IvYSs2MDZh?=
 =?utf-8?B?YjNtMTg5ZHB1YXo3TWl6R3FUS1VFSlhlcmRRUjR5bmJxbE9pZEgreVFVK01h?=
 =?utf-8?B?b0JNVDRsaEpVdUYzeWdLMGZnNTQ1RXRhOWpzR0w2UTErQjV3UE5iMDdqYVBq?=
 =?utf-8?B?Tnowa1JaTUNEMW1lVzhnNG9QcTdWbzVyaEd0dlJFeDVweGkvOGNtL0hEbkEr?=
 =?utf-8?B?bmJtYTFxeXFXc3pNUnk3MUIrM1pkU1hyMnUreHJoYXQwTmZqQmc0ZE9FSHRJ?=
 =?utf-8?B?Sy83TW5mZWtobnlBcVhNVTlqSndGNE5WWFdJNk9YbnN2UW1zSERLTi93eFRS?=
 =?utf-8?B?YjBvRG92RGQ5RTAybGhnR09RSExPRWFua1RGeVpvdUdkVzEwNnpJS0RHSk1M?=
 =?utf-8?Q?C1e7iNyJDOYi5qMrnZAZz9A=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e5c84b-7c3c-4307-e907-08daf712151e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 16:03:46.3571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABiMQlbwvB4nzHPAXVVi+oHPtYR+GsFUNKDFIQgvlErEtzV7UQVu7pO3pRSRqnWispL37LOY8NAKl1bBwKoHSMHMcqDYX4U2oUGrTqIPkbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5467
Received-SPF: pass client-ip=40.107.6.108;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patchset should be applied on the top of *[PATCH v8 00/11] 
parallels: Refactor the code of images checks and fix a bug*

On 12.01.2023 16:01, Alexander Ivanov wrote:
> Fix incorrect data end calculation in parallels_open().
>
> Split image leak handling to separate check and fix helpers.
>
> Add checking and repairing duplicate offsets in BAT
>
> Replace fprintf() by qemu_log().
>
> Image repairing in parallels_open().
>
> v2:
> 2: Moved outsude parallels_check_leak() 2 helpers:
>     parallels_get_leak_size() and parallels_fix_leak().
>     
> 3: Used highest_offset() helper in parallels_check_leak(). Fixed a typo.
>     Added comments. Replaced g_malloc() call by qemu_memalign(). Replaced
>     bdrv_pread() call by bdrv_co_pread(). Got rid of keeping bytes and
>     sectors in the same variable. Added setting the bitmap of the used
>     clusters for a new allocated cluster if it isn't out of the bitmap.
>     Moved the leak fix to the end of all the checks. Removed a dependence
>     on image format for the duplicate check.
>     
> 4 (old): Merged this patch to the previous.
> 4 (former 5): Fixed formatting.
> 5 (former 6): Fixed comments. Added O_INACTIVE check in the condition.
>                Replaced inuse detection by header_unclean checking.
>                Replaced playing with corutines by bdrv_check() usage.
>
> Alexander Ivanov (5):
>    parallels: Incorrect data end calculation in parallels_open()
>    parallels: Split image leak handling to separate check and fix helpers
>    parallels: Add checking and repairing duplicate offsets in BAT
>    parallels: Replace fprintf by qemu_log in check
>    parallels: Image repairing in parallels_open()
>
>   block/parallels.c | 321 +++++++++++++++++++++++++++++++++++-----------
>   1 file changed, 247 insertions(+), 74 deletions(-)
>


