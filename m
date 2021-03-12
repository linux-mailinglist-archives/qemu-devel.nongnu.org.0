Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE40338A78
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:47:00 +0100 (CET)
Received: from localhost ([::1]:53898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfJp-0005Sl-Si
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKfHQ-00041Z-RA; Fri, 12 Mar 2021 05:44:29 -0500
Received: from mail-eopbgr30102.outbound.protection.outlook.com
 ([40.107.3.102]:58791 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKfHM-0003PB-65; Fri, 12 Mar 2021 05:44:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cg85HMly5Thr9cFeh8/kip2dSLQ+lCgkVNXLpscJ+4zvIVEIYhZHCzCC7ksuNKE/z3sMBTg6qFRChY3TH/93raGv8DIJendz5uT1BoqzyRPR12fBnHYuJes5IjV0tBUBNqFYdbJRwawJdbT7Z0Hgmxw6Um2plhSMBnBNJMCSs8wWMxQbswrWFgVw/z8/3AZp+gLpEZXukcBmSv53fs8BA/YIKjo5KfH8lQDhdz0ENrSYAuTL9vw6qT+V6YVfMYpKSsfsoecnd6vFNN7MjEsVq2pM9b2w9JZxMRAFRaInXtdGVGX2RK0ZvWZ4T98YEUSJ7AJp2bkl3NPU2NxRfisOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQrcNbOn6W8oaf6YM3Jgjirv1arPb48s23B8KwXunuo=;
 b=Asei/OaMRTQcsj0TxgBksZo4BLE7QpeDkjqJ8ff3WbyEPEx+CM0y7+KGZ8YMAFSaANRyL/qpcwSx69Xclts7wIJoBK14B2HRnlgW8QRlaV+0GRmhfYX8bf3I0RKcHZWZ/RCgdS6C65Zf8r+ZvmgSZ1LBqBOa4pIorx5Cc9N1/p920Cbp+gFo6fTvzANBCwO7pkvF3JVlQGPHqm7V1D4MUdmslfmrJhaP1u2hD37yJmsuBKe2F3poweMG8f9nxjUg5z341TWnjxfXCxa22V80JaE1+ZfAa8exGrGWG8SDrgia5W+ueCQufFGo305mdEy7D2C6TUe7XQjU7aGoZuZTIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQrcNbOn6W8oaf6YM3Jgjirv1arPb48s23B8KwXunuo=;
 b=riVS0om52XpZhKRjSwPKQH6rScOGjHRVxIdql5vv8a62iM89xRO1or/SDchx9qldNqFtTUu4tEuM3xIqgDj87H6MkS5/ukUQqbLrIdd17f+vCcv/ukC6da6VIOn2ZjVaff8wE5mVHGt1MChtX7OGx3c+JTNxNV5QIpUOuwFozg4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 10:44:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 10:44:20 +0000
Subject: Re: [PATCH] stream: Don't crash when node permission is denied
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: ngu@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
References: <20210309173451.45152-1-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4c5506fc-ebf6-a086-b1ef-dd2773823ec6@virtuozzo.com>
Date: Fri, 12 Mar 2021 13:44:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210309173451.45152-1-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR01CA0121.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR01CA0121.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 10:44:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3afffa5-59e7-4708-79c7-08d8e543cad7
X-MS-TrafficTypeDiagnostic: AS8PR08MB6805:
X-Microsoft-Antispam-PRVS: <AS8PR08MB680591E7D104303BCF6D0958C16F9@AS8PR08MB6805.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KJJUCGawtbx1YJ88YMw43aAHhz5SNFYUoa5+UTEBjBr8t3FYqSzTFJ2zKsVQbxyaEz7UIu72ZyAFOrWzGOUB2l0//ScusgEHfommgP15XYBlPEu8GDl5I9aX1YLZum3H8jV9N2627u8Q6fMHlFfZw0oGt+rYxAbKha5tWBIoq+seRYxOcnZeaqHXx+2+Trv2sgJ+5OiXUZUCNb0I2CrcNfhZGMyGmUJDTa/9dmorFMt2U/hqEZdCedyLiXb3/lquXMR/mdjlhjn2m4ug3bsTw5Z8V6n0DKmvj10ZoLpvF/jSCN5QI+9TGdMIzl/cvbJkIR+6YlwXiV3aeLTTgdkcT6eQy0fKih/oTq1OrR0YcVktuNZCYm1CGWesvw2S64ztntYv321Hx87Vft+DNzT74iWv0i5Tll44hXZU+uo1jQKvKWBvahAWuX3UvGUSFhkmjl5EB4r90h83c97eDbH3iPs3HPY8U7KaqdKtB0CDqxnsMnT/zIXrKbnL83uqMa+yhwTYIveJDWQebWqr6dgbIfJPF6M1XKVnTYsngJDVrkg0E3uX1uIszzWLXbU9MLEd5sG+6yffYuLL3e7wrI9HcD5Jnr2BknT0ER/m3FbBmEND6dCvLGkgeQWxVeCNwATI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(396003)(346002)(376002)(366004)(26005)(16576012)(83380400001)(16526019)(31686004)(186003)(316002)(52116002)(8936002)(2906002)(956004)(2616005)(36756003)(86362001)(66946007)(66556008)(478600001)(8676002)(4326008)(66476007)(31696002)(5660300002)(21490400003)(6486002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bVhHVkJPeGk1WCt3bHFtTWZ6TUtNZDZGS0VVRHdxY1liQUM1c1B2NXRPa0RE?=
 =?utf-8?B?S1g3aFpCdEJOZ25iK3AvUVJwSlBMbTZRV3g2UWVyZTlZRitxeFZmeVhyaHl5?=
 =?utf-8?B?QW1LZVBIdjFnZG1DTm5yMmw5V1oxZTBoejZtSmpoWWZNc1BlYUd5bmNxNjJW?=
 =?utf-8?B?ZXpoZkE2TGhMMXkzRXlYL3hjWGQxOGR2UDFiQzc1L2xhRkl2NXRhNkdxZUR6?=
 =?utf-8?B?ME1GZHl5cVBJNWFuZExXUjNKc1YyY3pyVkV6Vks3OGhZSHJIQktoR0Q4SVpj?=
 =?utf-8?B?bGxZVFI4ck9xMjRkZnEwWC82Z29HSXNUMjR6cW41NWRiVzJoeVM4YXQxSnFP?=
 =?utf-8?B?UnAvTGFBU3B1bHJJZjRSWmRyTVJ5NnlOOS8yM1pqUXVyUDN4N2RFTUNiUTE3?=
 =?utf-8?B?S3dNbllmKzhlQVJLUXhTSzNtTWZ3RTQ3M2d6RW1NVk9aUG8zUFNLTmFSTUgz?=
 =?utf-8?B?MWtXRWtsK0pLdmJIY1V5TDlLam5qODdVTUlUZ0lzcDJ2OVpQMGtSdEpQVENO?=
 =?utf-8?B?RzQ2RHJCY0x5SktWZTJXQXdIWHRxd1diTC9ad3BQd2JldXRwV3l5ZnFReWVa?=
 =?utf-8?B?Nzdod2hJMU5xVmhUblVKenFmTFV4SDA5ZWRmOGNEZytuZ2d4ZDU5YmpzNndm?=
 =?utf-8?B?OVRIbk9VWVdLM0gxcjRtbjNiRlBXamFUazhKSTNyblVJR1UwaG8yQWlmR0hJ?=
 =?utf-8?B?ZE9pa285cnRERDRZc2dnNDJmeDVYUVNOZnd2YUNyRHorTFJRdmRySU5nd1lB?=
 =?utf-8?B?enQ2b1B1YzdnTWpuNkRheEt3RS8vK3ZGOXR1ZE9QSStFZ2I3N3h6bzZYMmI2?=
 =?utf-8?B?WFVuUWp6WElIZDhrRmE2UHJKbTl4NmxQcE1hUDB2Rk5KODVvMWlkQlNRVHRJ?=
 =?utf-8?B?ekRwcnZxV1B1QU5tV2dhSE16dU13NkZRYVBVWXhSYlBvU3FUQzlTUHNRdSs2?=
 =?utf-8?B?b0xIaWVja2JaTGhvVnd4Sm1ab3A5cE1YMkQ3eU5GQjBGQVlPQ1VRSDlTZGNu?=
 =?utf-8?B?NUw1NThQRlN3VGVhS1IySlI0OGc3bFhlRGJzc0FWV21XMHFQUXN3REVNSFFB?=
 =?utf-8?B?Z05ZTUZ4ZG5sRmtXWHFKejRQU1pMTnRDQUZ0SngyeE1aeHJIeUlvYkJrRHgv?=
 =?utf-8?B?TlVKU0tqV3Q2SmZ3N252ZDhUZW5ob2d4ajFVUkl1U3l3TXdWTDBIeGtKZ3ZV?=
 =?utf-8?B?VnZYdEV0Yk1sa0VDYkdUR2FQdnJLTnNCY0VNVHR0QU1uWnJJVHdlVjdJa1hS?=
 =?utf-8?B?WStIeURhbUV4UUpSMUxRbUFtNkZTdUZzb2lnU0kvZ3laaTcvUTRyc0pHek5i?=
 =?utf-8?B?aE4yM3QwNTBCZndhQWNOK2M2R0JvMGRJQzRaR0x4OGp2U1RyaXUvOW4vZlZt?=
 =?utf-8?B?OGZrcjlWOXJPalRQK0d3SmpMWVdoYWh0VzQwSHgzUUFHVEJqeGhYalRSSE1C?=
 =?utf-8?B?MEkwYnNGUkRxUU4xUTBPR2ViejZnQ2lhdTBwdzY0eDMvYU1YUFRTN0JnVmda?=
 =?utf-8?B?NnJRMkgrYU5OamVmc0psa1l6WU1PcWd2c1d6a2tkM2c1eWs2dmlRR1VndXJr?=
 =?utf-8?B?Z2g2dXljSk5rU0dXd2Z4eWtHT1ZuS0wxTnFyM1pmcmo0RWtNaWpVVE15NjBy?=
 =?utf-8?B?NFYvd0kzbmdCR01ONGJXVWlKRnJnSHhUcHhUbk0wUzRnbVBxaCtYbDFTS3dz?=
 =?utf-8?B?Z1I1NkJFSjdPcE5XQVBpVytJMmJVeEJDWFI3amhiUWJOUzBSMHlNbkh0UDNk?=
 =?utf-8?Q?otrcIcfraXmnir5d92hibG6NH/SSYEYt2O2mc1c?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3afffa5-59e7-4708-79c7-08d8e543cad7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 10:44:20.2450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsuwpa1wIBKvL8lDNQoyB0CHQjFRmVBSJ6rUoJWmTdWoPFmTt5Pj6Nsji5k6POFBeENgNYq6kHfBEo8XVeqd4QYXAbp4WsLKGj1gDRATmC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6805
Received-SPF: pass client-ip=40.107.3.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

09.03.2021 20:34, Kevin Wolf wrote:
> The image streaming block job restricts shared permissions of the nodes
> it accesses. This can obviously fail when other users already got these
> permissions. &error_abort is therefore wrong and can crash. Handle these
> errors gracefully and just fail starting the block job.
> 
> Reported-by: Nini Gu <ngu@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
> Based-on: 20210309121814.31078-1-kwolf@redhat.com
> ('storage-daemon: Call job_cancel_sync_all() on shutdown')
> 
>   block/stream.c                        | 15 +++++++++++----
>   tests/qemu-iotests/tests/qsd-jobs     | 20 ++++++++++++++++++++
>   tests/qemu-iotests/tests/qsd-jobs.out | 10 ++++++++++
>   3 files changed, 41 insertions(+), 4 deletions(-)
> 
> diff --git a/block/stream.c b/block/stream.c
> index 1fa742b0db..97bee482dc 100644
> --- a/block/stream.c
> +++ b/block/stream.c
> @@ -206,7 +206,7 @@ void stream_start(const char *job_id, BlockDriverState *bs,
>                     const char *filter_node_name,
>                     Error **errp)
>   {
> -    StreamBlockJob *s;
> +    StreamBlockJob *s = NULL;
>       BlockDriverState *iter;
>       bool bs_read_only;
>       int basic_flags = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
> @@ -214,6 +214,7 @@ void stream_start(const char *job_id, BlockDriverState *bs,
>       BlockDriverState *cor_filter_bs = NULL;
>       BlockDriverState *above_base;
>       QDict *opts;
> +    int ret;
>   
>       assert(!(base && bottom));
>       assert(!(backing_file_str && bottom));
> @@ -303,7 +304,7 @@ void stream_start(const char *job_id, BlockDriverState *bs,
>        * queried only at the job start and then cached.
>        */
>       if (block_job_add_bdrv(&s->common, "active node", bs, 0,
> -                           basic_flags | BLK_PERM_WRITE, &error_abort)) {
> +                           basic_flags | BLK_PERM_WRITE, errp)) {

While being here may also do ", errp) < 0) {", for more usual pattern of checking error..

>           goto fail;
>       }
>   
> @@ -320,8 +321,11 @@ void stream_start(const char *job_id, BlockDriverState *bs,
>       for (iter = bdrv_filter_or_cow_bs(bs); iter != base;
>            iter = bdrv_filter_or_cow_bs(iter))
>       {
> -        block_job_add_bdrv(&s->common, "intermediate node", iter, 0,
> -                           basic_flags, &error_abort);
> +        ret = block_job_add_bdrv(&s->common, "intermediate node", iter, 0,
> +                                 basic_flags, errp);
> +        if (ret < 0) {
> +            goto fail;
> +        }
>       }
>   
>       s->base_overlay = base_overlay;
> @@ -337,6 +341,9 @@ void stream_start(const char *job_id, BlockDriverState *bs,
>       return;
>   
>   fail:
> +    if (s) {
> +        job_early_fail(&s->common.job);
> +    }
>       if (cor_filter_bs) {
>           bdrv_cor_filter_drop(cor_filter_bs);
>       }
> diff --git a/tests/qemu-iotests/tests/qsd-jobs b/tests/qemu-iotests/tests/qsd-jobs
> index 1a1c534fac..972b6b3898 100755
> --- a/tests/qemu-iotests/tests/qsd-jobs
> +++ b/tests/qemu-iotests/tests/qsd-jobs
> @@ -30,6 +30,7 @@ status=1	# failure is the default!
>   _cleanup()
>   {
>       _cleanup_test_img
> +    rm -f "$SOCK_DIR/nbd.sock"
>   }
>   trap "_cleanup; exit \$status" 0 1 2 3 15
>   
> @@ -59,6 +60,25 @@ $QSD --chardev stdio,id=stdio --monitor chardev=stdio \
>   {"execute": "quit"}
>   EOF
>   
> +echo
> +echo "=== Streaming can't get permission on base node ==="
> +echo
> +
> +# Just make sure that this doesn't crash
> +$QSD --chardev stdio,id=stdio --monitor chardev=stdio \
> +    --blockdev node-name=file_base,driver=file,filename="$TEST_IMG.base" \
> +    --blockdev node-name=fmt_base,driver=qcow2,file=file_base \
> +    --blockdev node-name=file_overlay,driver=file,filename="$TEST_IMG" \
> +    --blockdev node-name=fmt_overlay,driver=qcow2,file=file_overlay,backing=fmt_base \
> +    --nbd-server addr.type=unix,addr.path="$SOCK_DIR/nbd.sock" \
> +    --export type=nbd,id=export1,node-name=fmt_base,writable=on,name=export1 \

Another option is to use blkdebug with take-child-perms and/or unshare-child-perms set. Just a note, nbd is good too.

> +    <<EOF | _filter_qmp
> +{"execute": "qmp_capabilities"}
> +{"execute": "block-stream",
> +  "arguments": {"device": "fmt_overlay", "job-id": "job0"}}
> +{"execute": "quit"}
> +EOF
> +
>   # success, all done
>   echo "*** done"
>   rm -f $seq.full
> diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
> index e3a684b34d..05e1165e80 100644
> --- a/tests/qemu-iotests/tests/qsd-jobs.out
> +++ b/tests/qemu-iotests/tests/qsd-jobs.out
> @@ -19,4 +19,14 @@ QMP_VERSION
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
> +
> +=== Streaming can't get permission on base node ===
> +
> +QMP_VERSION
> +{"return": {}}
> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
> +{"error": {"class": "GenericError", "desc": "Conflicts with use by a block device as 'root', which uses 'write' on fmt_base"}}
> +{"return": {}}
> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export1"}}
>   *** done
> 


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

