Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C522C6F53
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Nov 2020 09:49:50 +0100 (CET)
Received: from localhost ([::1]:56794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kivvR-0006S5-8T
	for lists+qemu-devel@lfdr.de; Sat, 28 Nov 2020 03:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kivu2-0005V2-Ku; Sat, 28 Nov 2020 03:48:23 -0500
Received: from mail-eopbgr150110.outbound.protection.outlook.com
 ([40.107.15.110]:58276 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kivtx-0004uQ-OP; Sat, 28 Nov 2020 03:48:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9byW8/AS634g/vlFFAIKGrih2jZqJxANpzOUu25KeG3aMptKQj/PV9KdX1/bY5ICDKU5bnXl/MPIGo73VVfK3Y0WPR1sa39t5scWxfCGU3WtSEsWyRWmCyyLxtbT3pin2VZauru3ssoWBlRZDyr46JUTlGh5/KBVADispIqTDmpLed+jtYq9GN98LvWQmm5Ehw8ANyfJDDjw/WQ/tXvnwNJjVomdTszol64JxTQ2sj+Ami6cVOMZlDsiHYWiHSR5Byg52+dM42di0rc8tmpRZpKV7s6rpUlyX6fv+Pnre7KhI27KHjhstnlzCrpaGntHPoaRod/1dOgzX7awIvjjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUmgiiGjTRvBKMeZI7eu0G4jA72KVcHfBgma0cgNKto=;
 b=fB+dWIid8sq7gNoruNYEb0ARLzSewzeuaA4EZnHTdvOXgJzL3ys7sGUH5CmJ6ElKn1CKUu8ati3+sP5M7qOlgA1X+N9bXZlFpLcbxwLLVDe0s2ARimFZY3ywT7/J5ND33AzFg9nLsId0+KBjC+ZurPFwWBv5eC4UQ4F2ZUgy447JilCGRdkEFamTtKYOpSxgM07Pq7UYDSK+FrkJyz5hV8qF9zNbkJAuWiAp6WV9Qd6hV59svtpKr2ZWFnmC7lmrfTTG1J6TD/6yYw7XJAz4hkMgvEPz0nFfisGZYmkeZIV1cDwJ+cjie14YqRudjL2f6FNjtcQ2SRYU/HJSSGEG3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUmgiiGjTRvBKMeZI7eu0G4jA72KVcHfBgma0cgNKto=;
 b=k5tOBX8441TiP/TW783CvRKEMOCeZDOluVZD1IH55fhhX+2Ij1N49aDKz2lMcbUM4EIVXyQ7i2AzUunkx0uwTQuu/vbPOtotQsThGXDASWSKKENagOd6bqenbl7hw3LJGz+rMwquuq4NE0zpVDRmK4AZ5zM8z8ZFx2++JrFXFZM=
Authentication-Results: h3c.com; dkim=none (message not signed)
 header.d=none;h3c.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6165.eurprd08.prod.outlook.com (2603:10a6:20b:29a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Sat, 28 Nov
 2020 08:48:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Sat, 28 Nov 2020
 08:48:13 +0000
Subject: Re: [PATCH] block: Don't inactivate bs if it is aleady inactive
To: Tuguoyi <tu.guoyi@h3c.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Wangyong <wang.yongD@h3c.com>
References: <b6caaaf3bfa84e3d913c81361b32ddae@h3c.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5881a9de-9fc0-63a0-2bb2-7999cf533a51@virtuozzo.com>
Date: Sat, 28 Nov 2020 11:48:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <b6caaaf3bfa84e3d913c81361b32ddae@h3c.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR01CA0080.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR01CA0080.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23 via Frontend
 Transport; Sat, 28 Nov 2020 08:48:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12098e3d-83cd-4c0c-ef27-08d8937a5714
X-MS-TrafficTypeDiagnostic: AS8PR08MB6165:
X-Microsoft-Antispam-PRVS: <AS8PR08MB61652A4308C17393E9637C55C1F70@AS8PR08MB6165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K+0JFIOJS/06cZwoubji07+hMCIWaUjcr6Av2cUTB1BfAM1fwZ28ITbvfVTGYcK1T+hVBjsLFytWl6m3Jk3KUkwo6gsQ5o6dgZ4t8kxCHJVmJtcxv5wIPlDJPMvO0tz6w2JiZoRZhyqhHHVRpQskytz00CiGypobl8XXhMJuCfPio3f87TkBgalLP1IxUJWZ6vg2tVkfZYeTwI/Fy164/YvoZIWsC7HRvS1pOZ99iLj3gKVkhH7YizM6//l1ReSrAGqhuAX5cQVYaiAebI1ZKEOJQ9u/ajaoXjBwIVT6Oe/hJhpNKR8BZ3hhwyE0fg4126PTs92YYS0ng63xa4+LIBVDCA25dtd0TZd3Lf6RNNTwyqcITcGjfh8yoA3tooaA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(376002)(346002)(136003)(396003)(478600001)(4326008)(956004)(2616005)(54906003)(2906002)(8676002)(316002)(52116002)(16576012)(6486002)(186003)(110136005)(26005)(31686004)(16526019)(8936002)(86362001)(66556008)(66946007)(66476007)(36756003)(31696002)(5660300002)(83380400001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dUE1dHQ1TzdPY3FobmtxUXh5MXRhM0pHK3BXZHZFYVFPbGJtdU9SbHVNQUdH?=
 =?utf-8?B?bkxRanp6STdyOVRpdFBXWW5Md1BiRjdLdjhtR1VDQTNTdUlmMkp1cmVXdFBm?=
 =?utf-8?B?d0liOE5JK3NRUS8yYlFzRVdkdGhoS1pqUXlVV0E1SWpVQkVOakNrc3p4WEkw?=
 =?utf-8?B?L1hNU2YzR2NEZ3h1cll2L3lxM1kxMkcwL1BVdW02MmphaFN2TWJrclVzSnVB?=
 =?utf-8?B?aHRDZzZtLzhHNWcyR2x2ZmRnUk41aWc5MTJyVUZwQXV6YmxncjFVTXgvdDl3?=
 =?utf-8?B?SkJISWFEcUVqQ2d3Z0w3ZjQ5WHlnSVQ4cm4wMjNHdFlqeUJmdmlzdjBlKzR3?=
 =?utf-8?B?UXZNd0VWM0RlTGdDSVRodjhreHpWNFVoMVowUGtpaVd6b1hTb2NTOFowRUdn?=
 =?utf-8?B?WUdCY05UQklablpsU3FveGxwNGk5N2pHa2FvNWFaWlkyZUVqWmpDQjV4Zm1S?=
 =?utf-8?B?VVVGZTBpN2VSNnl3YXZmMFhiV0tHNmZlRmV4ODFYVXViQk9QMWk0UlIwamVk?=
 =?utf-8?B?STBuRGhYWWYrTDhEV01vdHB1dDlOYUpIdW9NMFlKR3g0U1JRUVBzRzlad0ZY?=
 =?utf-8?B?SGxDbzBJWkZJcm5GQXNpQ0taQTBFa0dKTWdkZ2NlNFVnN295blhwUVJGSHdo?=
 =?utf-8?B?YW5Xb3J2MFVsMWZtQXdoMVBBcjgxV1VOSFRZdWhUTkNPanNBb2tpV0djWHRZ?=
 =?utf-8?B?T2ZqdERFSGM2VnJ4TjAxWXBOZkxmOFVza1Y4V2s2NUhGQVFlbHFEcXBVcmtn?=
 =?utf-8?B?VUo0RGllUjAwQTF6dXp0ZEEvL3c4azh0czg2dTFTeVU1NnVzTmpCVGp6andG?=
 =?utf-8?B?Ly9FbHJ2bEMzNlAyNk4zNXNnNE9iN2hWd2szYS9iQmdFdGxHa3dxQ2lnWGJ3?=
 =?utf-8?B?N1F2a0FOaGpZdGNYOFhMeXNJbTByOUtQTGdlc1JFa2lPbUJWZ1VJWWh5cVJV?=
 =?utf-8?B?V0lJN2lOVWtvbWloMHVkRmM0RUVNWkhPSzZNbENYalNHTlhwbENKOUZ2bWFG?=
 =?utf-8?B?Vi9udHJ0cFVSZzJqZW85ZlA0RDg0eldreDB2bHBaMUZPSG9mbmZsTFY0amRs?=
 =?utf-8?B?aEhKUllpK3BraDFNZnNUVXpaaUwwTFBUMmdXZ3d3SmhHWDcvQTI2NUVyZ1Q5?=
 =?utf-8?B?ZVY1L0JXNmd4b1QwdjJpYzh1L2lEZ3dma3hQTDAwaXBKcXpNOXY4ekgyei9G?=
 =?utf-8?B?eW9sWEdIQTBlSEdSY2x2bldzZHdJZW9lSTliMmhXOThScFRJSS9IaEZYaTRz?=
 =?utf-8?B?K1hTN0JiSjFQZjl5MGVNTVkrbkE2bzFmZENScUxxSzlSM3pmVnQrei8vWWxS?=
 =?utf-8?Q?ZKkp6U/NvH2NnbHRnyXEFmP9z5LMsiDlMm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12098e3d-83cd-4c0c-ef27-08d8937a5714
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2020 08:48:13.0870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1hKHkgy6gn1qxIMgJDODDpnq32DFC+p0uNNp1GEkyEOqTPEWMBg8HM84Tn0sigj5cAfyskXJD3E+1m9r3tLBuG86hxRpPCGe3GnRoQFxXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6165
Received-SPF: pass client-ip=40.107.15.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

24.11.2020 13:04, Tuguoyi wrote:
> The following steps will cause qemu assertion failure:
> - pause vm
> - save memory snapshot into local file through fd migration
> - do the above operation again will cause qemu assertion failure

Hi!

Why do you need such scenario? Isn't it more correct and safer to just error-out on savevm if disks are already inactive? Inactive disks are a sign, that vm may be migrated to other host and already running, so creating any kind of snapshots of this old state may be bad idea. I mean, you try to allow a doubtful feature to avoid an assertion. If you don't have strong reasons for the feature, it's better to turn a crash into clean error-out.

As far as I remember, bdrv_inactive_all() is the only source of inactivation, so actually, it's more like "inactive" state of the vm, not just some disks are inactive.. And you change the code in a way that it looks like that some disks may be inactive and some not, which would actually be unexpected behavior.

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
> When the first migration completes, bs->open_flags will set BDRV_O_INACTIVE flag
> by bdrv_inactivate_recurse(), and during the second migration the
> bdrv_inactivate_recurse assert that the bs->open_flags is already BDRV_O_INACTIVE
> enabled which cause crash.
> 
> This patch just make the bdrv_inactivate_all() to don't inactivate the bs if it is
> already inactive
> 
> Signed-off-by: Tuguoyi <tu.guoyi@h3c.com>
> ---
>   block.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/block.c b/block.c
> index f1cedac..02361e1 100644
> --- a/block.c
> +++ b/block.c
> @@ -5938,6 +5938,11 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
>       return 0;
>   }
>   
> +static bool bdrv_is_inactive(BlockDriverState *bs)
> +{
> +    return bs->open_flags & BDRV_O_INACTIVE;
> +}
> +
>   int bdrv_inactivate_all(void)
>   {
>       BlockDriverState *bs = NULL;
> @@ -5958,7 +5963,7 @@ int bdrv_inactivate_all(void)
>           /* Nodes with BDS parents are covered by recursion from the last
>            * parent that gets inactivated. Don't inactivate them a second
>            * time if that has already happened. */
> -        if (bdrv_has_bds_parent(bs, false)) {
> +        if (bdrv_has_bds_parent(bs, false) || bdrv_is_inactive(bs)) {
>               continue;
>           }
>           ret = bdrv_inactivate_recurse(bs);
> 



-- 
Best regards,
Vladimir

