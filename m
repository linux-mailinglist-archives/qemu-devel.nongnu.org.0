Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E501431F79
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 16:26:21 +0200 (CEST)
Received: from localhost ([::1]:51424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcTam-00085M-4H
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 10:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mcTX3-0002jS-14; Mon, 18 Oct 2021 10:22:29 -0400
Received: from mail-eopbgr80121.outbound.protection.outlook.com
 ([40.107.8.121]:25986 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mcTWy-0004BL-FD; Mon, 18 Oct 2021 10:22:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mq21WYx4PZBdq+NR/PN8x9zQKt1/2rwdAnNhzCJlqen7no3x91ZwNrFb9EPlvMIL1QzxGXAMS1Keo4cpZmeHPR90Ma2mrKdy7YS9ALd6Nik6PpmZZDPM+KxgrZHMbxbd056rnVBWGj36C9q6Sc4spBUcN9ulyZcaZAiOODJkWwtL1+1SCHFKH1BrH/HhBkks8AkBBhizgkI1Su5F4az/XonWv2f6YI+VyYalHKE1FY627BvMfg21TC01iaa+9EpwevGf68Cbqo6VQXCloCon4Q26IszIZblF65BwRKy82xgQ6yd7oOhzCeFaqGvYpTw0j2pX1TxBgau+oZWu25R3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAo5/A8QFH9hCMx6CngTm0QJC3xKvee8ljoV5mEDQ9o=;
 b=PKV+QSp9pOUzP72w3ArXpTY7LVM9EIRN5K2SRzNtXifGbV4pMTMr41D+mGkGncSSarMChTTONDSsLHRdXZePqkGk/f4lRg2eAfiYCCpy1jfYsuuVdDPfi0ZO2OYTD90ZiAoah0O+jIfVnO04eOeZyBZo1WIw4M8Bhn/6DEFg/FEIVWecMAi7UxcxbcVAAI3DQu23o2vEPctyxecaWk2LaH45LOEmxNwKCpD07xTFwYDzKdWqATqoGpYE+MtKVDsUTcb74DQ7B9SPuZEzO6zGcTwSPAQSFcWYLBD0thGnGIFfduqSjn0iOUH8q9mrozkPYOsX1ewSDKGUiBoHwnypmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAo5/A8QFH9hCMx6CngTm0QJC3xKvee8ljoV5mEDQ9o=;
 b=KrYgvypafu+FSRapV/QrlyWRfvlwO9u40fr4EBo/XF6g7MR8wfjSItlb8zfzYI5blkBxTaUO728cVQJCZ5jurQX+8Bk+gWxDeGuuqHqDasuytNOL0/YafzM6EQt0/HvpteTG4sQ7FakmRLk3e6QoT9gfkh/4sNk0V3RvDzyOyK4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3383.eurprd08.prod.outlook.com (2603:10a6:20b:50::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 14:22:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 14:22:17 +0000
Message-ID: <e4c03aee-fd0f-0b8a-3b86-35776d2d3ad3@virtuozzo.com>
Date: Mon, 18 Oct 2021 17:22:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] block: Fail gracefully when blockdev-snapshot creates
 loops
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, qemu-devel@nongnu.org
References: <20211018134714.48438-1-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211018134714.48438-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.43) by
 FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.9 via Frontend Transport; Mon, 18 Oct 2021 14:22:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbca9c0b-f9de-4ec3-5128-08d99242b055
X-MS-TrafficTypeDiagnostic: AM6PR08MB3383:
X-Microsoft-Antispam-PRVS: <AM6PR08MB33831817A7E527D55D655FE2C1BC9@AM6PR08MB3383.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:327;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 06XpJd1wXAbJQehy5q45QOn71CKF+Vz8OZU/6m7obTBmDVr7O5I/zdgJMF0rcutm9SzrBjFk26HXVNSX7CPDPibYpn1ow91xBoQHUg2/i/rmRDPyWx98eZmLd6MIk2s7580mosLI/7CPaVULYDyUzODz25UQJJxkLmLtDCp9LIdSgS2YWqxmdHM5BPPxxGh7iKdqYSHSeZWbPvMD1WoLRe1vS3q/HdNEZFUmj30/iEQ3kELTbboVcfsY5WFJYPPJN0w+lQGTHjLdjMjmnZk33USxRiKWazo51/xHKPIOipdaPAsroVvFLb88Izh8jqGIY1PrOS+pXEQu4mtPmIacsMfGQ7bFNxozOGGe94jWgxhbwiaaIab1RdrbxmJryVeRp9wcIz4uK7Pt1QDPCfTjsIRqemo/NURpCANMvJbWUf7HWy+yXdmgwGT8VMnkwIRLGzuARwwt9xP5BAg+bEynWA3GM7My9OqvEsmADPmXE9/gYXGdIgeHloPJdSDAnpUE9G5KQLHEnouskzZIowKCAbbYBNoPhQEoR1Wg6/aJdUSe0+iBUVUlFWDUScTSvRBkqA8J6a3qhJGtQUburZXilLEvcaVOMxe04WwBPZNNfMR+KNA0a8dXLJmfYwrCxDdI7g4cZDvKxI2MZSiC815+CHvP8IRSd/a0p2heFSl6XaQaMekz+AMVLrihzs9ZoroSH51bwbg/dSwN8XH+36bhjccJmgdHVM4t/fw5D0LNs9N+1/epg+ptiQW94J4HoCI3TMCqq7OaJ+vadLxTUy0vEfoi9dO579I3sMlpt422bgHuGUCFixwt8pg7HpDFNfzoLAl6ndileJPlvxEB36patCdTL25l4ZnHly27snzeiYk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(316002)(16576012)(8676002)(2616005)(66556008)(66476007)(86362001)(66946007)(36756003)(26005)(186003)(6486002)(956004)(38100700002)(38350700002)(5660300002)(508600001)(83380400001)(19627235002)(31696002)(8936002)(52116002)(966005)(4326008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STY5WkJhc2F3cEZnejgrYk4zckI4dUdleDBRN1NZQm14RUxVanhEbDU5U2N3?=
 =?utf-8?B?TVpwRG9uV1ZwOHJOeFZUSzc5S09vWWNkM1VaTHo0N1pZZE5tQXFVaUNYakJh?=
 =?utf-8?B?VnkzUVcyWE0xRnQra3FvMXRYZUZoci9Dd1lWZEF1dEV4bXYzMS9lb084dDBz?=
 =?utf-8?B?dm52cEJWNmJuRjVsNHNnak1zV2JzenYzOE5lVWhxWW5FYnNydkJhVWtYWmU3?=
 =?utf-8?B?d0t5ZVNRK00rbW9ML1pSYlhxVnA2TWFXSHBNL0k1bmJGQ043U2NucUpCbEdJ?=
 =?utf-8?B?cFZycURURDVmYVl5S3c0REN1UTVZQ2szeGduMVEzSXpvd21uRFNwa1BoRDBJ?=
 =?utf-8?B?d1cyQmRwY3VMeVdYQXZGSnh3c0dRR3NqQ3F5dDh2T1cvVVBtZHA0T2FWSE9m?=
 =?utf-8?B?Ry94eEtJV2tLeXRxVi9pek9MZVJNK0JvWUtDc01ZeUdiQzdGbnNQSkVvQmtK?=
 =?utf-8?B?aGRNYi96b29Hby9jeStNa3J6VVJGU1VIOFhWdmdESGo0TTBNMzRmdUdQRm96?=
 =?utf-8?B?MXgwY1BIcGd4REc1L0pqd0U2TEhEYlhCVjBvQjRCZEJCVlQxcVFDOGdYRHh0?=
 =?utf-8?B?Zm9VcVp2TkJ1WGQvcnBVcDV2a0MzV1BuWjJXSWxtaFVzN045Q1AvVi9CR05m?=
 =?utf-8?B?S3NoNWZJWXlzWVRyQ29hUG5lTE1NaEpxR1RyUmdOWDh2ZzBjRE8yYlg5elBa?=
 =?utf-8?B?M29jTG5CRkNybExXdm41dE9FT003cFVzZnpPZVdEN1lYR3hla055M3dDN3J6?=
 =?utf-8?B?NzEremxKNG1yaGExajE5aXkvNnpweG5RMEl4NEJGOVdoV1cyOEVVRitmMnp6?=
 =?utf-8?B?OGxsTXR0ZVlVQ0s2Ti95dG5TUVpSREJNdkhvWUJyNW9Wa2YxaTVWWnQyV1VD?=
 =?utf-8?B?MVpEY29rU3JQWEZFcUdiOUhqaWFKM29xb2NBVFd0TU9BUW1ucUx4YUVuOHhl?=
 =?utf-8?B?NFh5QnFUOGM3R3dSUS91SUNnSzdGVXpDN24wMjRxTkdsMGJobE10aW4zVmRo?=
 =?utf-8?B?aDF0c0cwbExseWE5SG1mMWg0emh1VUtDYm9QbzlFSTBRV1IvUndyWFRES3lB?=
 =?utf-8?B?TDNDUzZuakpESE9XWExPQWdVa2V0QWtncittOEJrNlFWNzVOSzdld3dzRXlm?=
 =?utf-8?B?TUlYTk8vSEVyMkcxcG9jd0ZEd0xqaWRWSFU5RlBubEFubFlBdFgyNFpOVFN5?=
 =?utf-8?B?aFluRytjSXpZVDlzaDQ5TlY1dDIzeWkwU3hiaHQrUnZCenNFaktOSXhaNi9v?=
 =?utf-8?B?aHJFMkx6Y0NEMUtGdnllZVJtYWRabmh4MGw5bzhLZWZOSXY1V0ppTXJrNHQ4?=
 =?utf-8?B?WmQ4MjN6NGF1UVRtWnNXZndZaGx2Yk9tK0VpbC9pYjdFVFlsc296MWRMRlhQ?=
 =?utf-8?B?MHJvWi9VWHNSbzdOUXpNUXZzL2hnSFhvRXh2TkcyMTRmUHFYLzBiNGxDT2RW?=
 =?utf-8?B?aFBaTlRNdm5NMFpzUHRRek40VnQzQytubjdHb0pMQWFIZzBWckJ3UERZaGdw?=
 =?utf-8?B?L3E1bFVRaEhkQVVBQmdOVlRHa3Jzc0IwWWxwWXIvSEJDUzlUVW5Zb0FXcDUx?=
 =?utf-8?B?ZVdSbnJ2ZkltVmc4WUh1V216aElzQTV6L3dMSmdsOGJ6QUN5aG90WGh3M05r?=
 =?utf-8?B?VWRLb1duYVl4REo4d01TT21HVHNLUWRRcGtkYmU2bUgrOWFIL3oyeU0yZS9z?=
 =?utf-8?B?Y2kwT1Zxa1VBQnJqVTBTOXovM0Ewb0F3c1FlVCtHYlhMQkRKcnB6Q3VhOFVm?=
 =?utf-8?Q?kkrCG6U+pbuhBQWPJKwB5/+sVb3yYRwAjrCUDCI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbca9c0b-f9de-4ec3-5128-08d99242b055
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 14:22:17.4858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aas/OrtO2tJjjpL1P0d43yqnwsNTQTB/HaEIp34s4p6KAzNajkcQdS8TA1iVcWKd1IspBVZBmLHJ5VCNP+B+Vz4BJd2Xpr32V3Xi3xs6iWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3383
Received-SPF: pass client-ip=40.107.8.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

18.10.2021 16:47, Kevin Wolf wrote:
> Using blockdev-snapshot to append a node as an overlay to itself, or to
> any of its parents, causes crashes. Catch the condition and return an
> error for these cases instead.
> 
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1824363
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block.c                    | 10 ++++++++++
>   tests/qemu-iotests/085     | 31 ++++++++++++++++++++++++++++++-
>   tests/qemu-iotests/085.out | 33 ++++++++++++++++++++++++++++++---
>   3 files changed, 70 insertions(+), 4 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 45f653a88b..231dddf655 100644
> --- a/block.c
> +++ b/block.c
> @@ -84,6 +84,9 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
>                                              BdrvChildRole child_role,
>                                              Error **errp);
>   
> +static bool bdrv_recurse_has_child(BlockDriverState *bs,
> +                                   BlockDriverState *child);
> +
>   static void bdrv_replace_child_noperm(BdrvChild *child,
>                                         BlockDriverState *new_bs);
>   static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
> @@ -2673,6 +2676,7 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
>       int drain_saldo;
>   
>       assert(!child->frozen);
> +    assert(old_bs != new_bs);
>   
>       if (old_bs && new_bs) {
>           assert(bdrv_get_aio_context(old_bs) == bdrv_get_aio_context(new_bs));
> @@ -2892,6 +2896,12 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
>   
>       assert(parent_bs->drv);
>   
> +    if (bdrv_recurse_has_child(child_bs, parent_bs)) {
> +        error_setg(errp, "Making '%s' a %s child of '%s' would create a cycle",
> +                   parent_bs->node_name, child_name, child_bs->node_name);

Seems, child_bs and parent_bs should be swapped.

with that fixed:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


> +        return -EINVAL;
> +    }
> +
>       bdrv_get_cumulative_perm(parent_bs, &perm, &shared_perm);
>       bdrv_child_perm(parent_bs, child_bs, NULL, child_role, NULL,
>                       perm, shared_perm, &perm, &shared_perm);
> diff --git a/tests/qemu-iotests/085 b/tests/qemu-iotests/085
> index d557522943..de74262a26 100755
> --- a/tests/qemu-iotests/085
> +++ b/tests/qemu-iotests/085
> @@ -103,11 +103,18 @@ do_blockdev_add()
>   }
>   
>   # ${1}: unique identifier for the snapshot filename
> -add_snapshot_image()
> +create_snapshot_image()
>   {
>       base_image="${TEST_DIR}/$((${1}-1))-${snapshot_virt0}"
>       snapshot_file="${TEST_DIR}/${1}-${snapshot_virt0}"
>       TEST_IMG=$snapshot_file _make_test_img -u -b "${base_image}" -F $IMGFMT "$size"
> +}
> +
> +# ${1}: unique identifier for the snapshot filename
> +add_snapshot_image()
> +{
> +    snapshot_file="${TEST_DIR}/${1}-${snapshot_virt0}"
> +    create_snapshot_image "$1"
>       do_blockdev_add "$1" "'backing': null, " "${snapshot_file}"
>   }
>   
> @@ -230,6 +237,28 @@ _make_test_img -b "${TEST_IMG}.base" -F $IMGFMT "$size"
>   do_blockdev_add ${SNAPSHOTS} "" "${TEST_IMG}"
>   blockdev_snapshot ${SNAPSHOTS} error
>   
> +echo
> +echo === Invalid command - creating loops ===
> +echo
> +
> +SNAPSHOTS=$((${SNAPSHOTS}+1))
> +add_snapshot_image ${SNAPSHOTS}
> +
> +_send_qemu_cmd $h "{ 'execute': 'blockdev-snapshot',
> +                     'arguments': { 'node':'snap_${SNAPSHOTS}',
> +                                    'overlay':'snap_${SNAPSHOTS}' }
> +                   }" "error"
> +
> +SNAPSHOTS=$((${SNAPSHOTS}+1))
> +create_snapshot_image ${SNAPSHOTS}
> +do_blockdev_add ${SNAPSHOTS} "'backing': 'snap_$((${SNAPSHOTS}-1))', " \
> +    "${TEST_DIR}/${SNAPSHOTS}-${snapshot_virt0}"
> +
> +_send_qemu_cmd $h "{ 'execute': 'blockdev-snapshot',
> +                     'arguments': { 'node':'snap_${SNAPSHOTS}',
> +                                    'overlay':'snap_$((${SNAPSHOTS}-1))' }
> +                   }" "error"
> +
>   echo
>   echo === Invalid command - The node does not exist ===
>   echo
> diff --git a/tests/qemu-iotests/085.out b/tests/qemu-iotests/085.out
> index 1d4c565b6d..7750b3df5f 100644
> --- a/tests/qemu-iotests/085.out
> +++ b/tests/qemu-iotests/085.out
> @@ -217,15 +217,42 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/
>                                        'overlay':'snap_13' } }
>   {"error": {"class": "GenericError", "desc": "The overlay already has a backing image"}}
>   
> +=== Invalid command - creating loops ===
> +
> +Formatting 'TEST_DIR/14-snapshot-v0.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/13-snapshot-v0.IMGFMT backing_fmt=IMGFMT
> +{ 'execute': 'blockdev-add', 'arguments':
> +           { 'driver': 'IMGFMT', 'node-name': 'snap_14', 'backing': null,
> +             'file':
> +             { 'driver': 'file', 'filename': 'TEST_DIR/14-snapshot-v0.IMGFMT',
> +               'node-name': 'file_14' } } }
> +{"return": {}}
> +{ 'execute': 'blockdev-snapshot',
> +                     'arguments': { 'node':'snap_14',
> +                                    'overlay':'snap_14' }
> +                   }
> +{"error": {"class": "GenericError", "desc": "Making 'snap_14' a backing child of 'snap_14' would create a cycle"}}
> +Formatting 'TEST_DIR/15-snapshot-v0.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/14-snapshot-v0.IMGFMT backing_fmt=IMGFMT
> +{ 'execute': 'blockdev-add', 'arguments':
> +           { 'driver': 'IMGFMT', 'node-name': 'snap_15', 'backing': 'snap_14',
> +             'file':
> +             { 'driver': 'file', 'filename': 'TEST_DIR/15-snapshot-v0.IMGFMT',
> +               'node-name': 'file_15' } } }
> +{"return": {}}
> +{ 'execute': 'blockdev-snapshot',
> +                     'arguments': { 'node':'snap_15',
> +                                    'overlay':'snap_14' }
> +                   }
> +{"error": {"class": "GenericError", "desc": "Making 'snap_14' a backing child of 'snap_15' would create a cycle"}}
> +
>   === Invalid command - The node does not exist ===
>   
>   { 'execute': 'blockdev-snapshot',
>                         'arguments': { 'node': 'virtio0',
> -                                     'overlay':'snap_14' } }
> -{"error": {"class": "GenericError", "desc": "Cannot find device='snap_14' nor node-name='snap_14'"}}
> +                                     'overlay':'snap_16' } }
> +{"error": {"class": "GenericError", "desc": "Cannot find device='snap_16' nor node-name='snap_16'"}}
>   { 'execute': 'blockdev-snapshot',
>                        'arguments': { 'node':'nodevice',
> -                                    'overlay':'snap_13' }
> +                                    'overlay':'snap_15' }
>                      }
>   {"error": {"class": "GenericError", "desc": "Cannot find device='nodevice' nor node-name='nodevice'"}}
>   *** done
> 


-- 
Best regards,
Vladimir

