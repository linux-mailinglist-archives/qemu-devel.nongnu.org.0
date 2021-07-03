Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F273BA7A9
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 09:26:32 +0200 (CEST)
Received: from localhost ([::1]:43882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lza2p-0004Xc-6B
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 03:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lza1y-0003fA-Nv; Sat, 03 Jul 2021 03:25:38 -0400
Received: from mail-am6eur05on2099.outbound.protection.outlook.com
 ([40.107.22.99]:26620 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lza1u-0003Z4-Qi; Sat, 03 Jul 2021 03:25:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfA3S0YPYo9I5v+vCco4GqlOmT7pT5Qu4C8Ljko1EDOj3CoE299P37PR0wNx33WkI33fShD0n0kuo6lwQ9FUwMi0pR0O7WDN/lVOVtUkcpt99Fzj6H6ZcUnYmJkve6/urPi+YVzemwa9P2sBYjW9Ybr4sJjDQLvXI2H7SwMt88S+z+kd5QwpkryTtmYjTVU357e9ACiQ8X/Bt0qK6brH+f8heBUOU+4+v6s0pzkkxNQ6nWETFd7D9TK1mObdCYbmBHZq4a9mWjcluWQBSefz2CZyIGBf6hhMBIvC7W2+cLOgRUfVhwjEnFDjsa8DoP8FhmWD3M13co6MOI7ZTi8Tjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/C0WRFszTwhrPdW/saNV3mLraYgXU0bux5L9sDPvv4o=;
 b=K2tzZs+vSJBQgORrjLHwNO2qYj2c8N3ho8qcog9iY/s0Z5ElZ++DVps/WgrLgCc/XwfjaWTRlcPeaEmufCOPL7SWoMsOHiAyaToFYdOaNe/2zda/81W8fVoB9LBVtSSaZegO6u3jTes2rdlH9BFOt60Sw6VLdzsXJ4ec/ZtT0oFT1n+Adp8jD/fACehUh1AB36Ts8rcZydBvlcR6zdptmGoq8pgEUgx7qsTzGW/GWvsFSsuAeG6s02UKmhDwmy0RkBKeDeiIY2/W0MfJ/65/xVMa33M20m/rsNgMoCHtgDPlybyodmLNTnX7Cs38specGtCyyqfRO47BSJ8Brd1qWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/C0WRFszTwhrPdW/saNV3mLraYgXU0bux5L9sDPvv4o=;
 b=VjhjCKblyGE/2ZDCbMlLqX+Z5+AX1hqQCw98p6MJtkDkytjBqcBspUPYA+ikgC1V+tO1H2cx5zPXJpkCptMeeeOzzr3JODgO+AvDJGwjrFrceRmm8owpxflFlGvza+Fn8N1neO6krCIy6ikzqLZjDZuUzXdUyheU2le2bbqDcjo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4950.eurprd08.prod.outlook.com (2603:10a6:20b:ea::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Sat, 3 Jul
 2021 07:25:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Sat, 3 Jul 2021
 07:25:30 +0000
Subject: Re: [PATCH v3 2/2] qemu-img: Make unallocated part of backing chain
 obvious in map
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, nsoffer@redhat.com, mreitz@redhat.com,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20210701190655.2131223-1-eblake@redhat.com>
 <20210701190655.2131223-3-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <481dc6cf-a353-b4a0-732c-b758f8750ff6@virtuozzo.com>
Date: Sat, 3 Jul 2021 10:25:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701190655.2131223-3-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM4PR0701CA0008.eurprd07.prod.outlook.com
 (2603:10a6:200:42::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM4PR0701CA0008.eurprd07.prod.outlook.com (2603:10a6:200:42::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend
 Transport; Sat, 3 Jul 2021 07:25:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6477bad6-499f-444c-4959-08d93df3bc9c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4950:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4950F07F852355E6D98E180EC11E9@AM6PR08MB4950.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oZm/0FsQ9dJvjUpx43vVPYoPzkwhTynO/PoISUdMlks3+zup8YF7oHvMg033vx+Cbg/K6oNgWF3Nb+PYQjvASTaKugeTO8EtwgEqED7PUS11ehzqV3p5/jqGio4XZLzTcAGygaR0QN6H5O9tybVVN2eCSZQFiZyiCUzLOeoim8F7oBxoUO1ZoNEqnXqXx2bAeZ/OWeAnZZMqLEUl7YaU2hZsRIc9Knod3Ji9xxJrhHcBvrCo3jIzmwCEinHdAiBfyCCt3ODOxf6wOFunNr5cjqL59PJ38MxNW82Ze5p4noN+a5LauRQoRqhkfuV1AXTkrPF5gve8GeSwl9OEXiR5rxy3idZXfqvjJUQ2ML7thJ3XQFAdSegPfFN6SPMJ2x+31P7I1Nmro8VyKD3ewHlwvOG77znlKx5ZuSHJgvzHstIt8cjrATzcfj4GomYXLrCxA48pD6rgwelNvSHyeeryxF/Magr+wTz9GeFPmclX9tCseIKzuBNfNjp2U40/EVgCv4xy+1UgOsbaKZhtQsIbZrAXGzpQWfye5A8IKcRhEcY4Nv9P9Q2sIiaWmKwKC/XS++7UE2CfblzyA+4pPoMvHgMRD4K4BSr1CczIiq25OQLweyWifpA7Zf69I72Ngc/IQT0p7rGfWDtcbHoh23m1BGpoJCag7Q8YdgVrk3Rg2jA+so5AsZZn8saitDlwwR8r1tk7HRnOt3dMgK1twbt0GVoq2qm+GYKhNvjFSFOz48gNQzwVsfyeyfDVJKuiwTthNFlT7saKSfOaTFTiMkfYwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(39830400003)(376002)(52116002)(8676002)(26005)(16526019)(186003)(36756003)(8936002)(31686004)(86362001)(38100700002)(38350700002)(83380400001)(31696002)(5660300002)(956004)(2906002)(66556008)(2616005)(478600001)(4326008)(16576012)(316002)(66946007)(66476007)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Snp1RHdGYldzTndtZkFKaVFMNFhobk03Ylh5V2xjYUdYQjJmMnVJeGZId0xl?=
 =?utf-8?B?S242N3FTYWRPNkwyZUJza2VYdklxd3pqWTZhMXNkNG5Ga05MaWJMYVBhRHZx?=
 =?utf-8?B?dysra2M4ZVRzUFFGRWpaa2FTRWIxNlEzR1VOdGc5UE9ZV1FDMEtlWncvQy9M?=
 =?utf-8?B?dHBGWEdVc0NyYWRxViswajYwcEdNNVhzZnViM3hmQ1ZDRmJzT0dObVUzMGRi?=
 =?utf-8?B?dUtEbURiVWhud3E0VjF3TG81QUNVU1Z5RGRtYm4ydnI1eTNMbTFGY01UUGE2?=
 =?utf-8?B?aXNuM2VLU29nbTRFcS9qblZyMlQ0UHNvRCtuczFmNXVkWnJGLzJtcjBWUnJL?=
 =?utf-8?B?UTlITmZGaXNWWktnRDFCNTk3T0FKalNMQThRWG1iM1ZvODlPSjdpNEdld092?=
 =?utf-8?B?R3hYQUtOS2Y2dlpUSnI3UksrSTFvZFVnaUpjUU91NUVTSHVOb0g1a0FKRkI1?=
 =?utf-8?B?UVdpT09lVW9zN1FEQ3dJUVdFUmZmWHZDVjN6K2pRZVlDdktNQVJ5MUJ6bXN6?=
 =?utf-8?B?RGRaVEliSVBKVEU3bzJIK1hLcmVEVW9kY0dHdkw1cTdrR0ptNTlNM0VmUmgy?=
 =?utf-8?B?ZDV0SDVsQjVWRkYzdld4bEc1eXBrWnFhcEgyRitmbUNlZnlwUDNpVG9yL0ln?=
 =?utf-8?B?SXd4RkVSUTVZZ1IxOXhPQkNIeUVKQkcydjNJYlg5eW1wSit1RUJseWE1RitF?=
 =?utf-8?B?M2JaUVYwTmh0QXpuaHpXNzh4UzVjSWFHV2JDR1NGRy80cTJYcnUyczE4VE4w?=
 =?utf-8?B?ZjFra2phbWt2WDdHSGVsWHpPblFwejBCQ2lnbi9OVm9teHg3V1BzWGw1NlY0?=
 =?utf-8?B?RUVKazBCNFFqdkxKOHFIWFR2eit5NUliakZiUGFWMVBmOFlhdVpqVFo5ODh2?=
 =?utf-8?B?VTJJTklVcUtHRmRtbWRZVFlzb3RIQTZ5UXlRS3hwQkp0TlF0YUU0M3VMSktj?=
 =?utf-8?B?RUdYNG94UFVDMjFTU1Nrd1JWUnZMSytxWmVEUUFrbnBoMXJ6dTdxTW1TYVg2?=
 =?utf-8?B?SGlMUzN6RUhPY09vQTVkMEVnQVdDVUYrNGNKTTJwQVE0OC9xb2tvMERsdWFn?=
 =?utf-8?B?SHFFR1BPM2hSazVYa2UvVVF3TlNDNDdYbTJKU3FLS1ptY0tkRnZsNm1HdmVi?=
 =?utf-8?B?WGxZUTA0MHNQNWdudGRzREt5NjZPT3pnc2RYVTQvdldBOGVFWkJiOFk4cnc1?=
 =?utf-8?B?elZiY2dwdXBqSXJYMGhERlNWdTh1eEsyQUJVSVZ1TFZaeisrbkhNV1QwQ1d3?=
 =?utf-8?B?bHQ5cTlDN25zWk1SaCtiRmFNQUtRVDlsOXdXenF5ek15UWFOQ0xWcGs5TnpL?=
 =?utf-8?B?SG9XejIrVUZKcVpIT3lxcGt3U1p1eUE1c1pld1VRSHFRQW8yU0tYRWZjSndF?=
 =?utf-8?B?enpKMFVSTjhseVlKeTNmUkpIZG82WkFWVGxOVjFvVk5yaWRaSEh4VS9BeW1E?=
 =?utf-8?B?ZXpmNngzV0Y1UGcxaWRmUUVyQ0JHa1lxQWVGQStBb0dXNmxNL082SjNSUkFr?=
 =?utf-8?B?MTJOK1kyMk5vU0wxdjNZc211aFIzNGRaN1VMdjlIZ1RwMmx2ME9sajY2cWVL?=
 =?utf-8?B?RUxvVGp2Sm4wdWg4U1o1dTdDMVBScGF4ekFOdm90TnpJcjh2V09WT2xxUHA2?=
 =?utf-8?B?QkpJdmZ0aTRjRi9hYldBblhRZ0cyUkZiVkZrUWM3RDgxTVZHcTNpdW5lcVZZ?=
 =?utf-8?B?TjlEYWVHM1RCZGNnaUp6VVpURWVaaDhPTjRrYWV2Vk0wMVJ2UkpPN04xWkFP?=
 =?utf-8?Q?rLfrcJ12GGiXeRoawG51eu3qrFMQGs5I7gE2Odl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6477bad6-499f-444c-4959-08d93df3bc9c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2021 07:25:30.1646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dcd9WpT0VYF889jcngXuDshGDrb1rHgCpqOhOgxJXAJnBj/2+N+8EZt3PjcRo71Ya82wx61+XZdprpHG2XOfxrpv1JDFJh31rHQa9QhuKis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4950
Received-SPF: pass client-ip=40.107.22.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

01.07.2021 22:06, Eric Blake wrote:
> The recently-added NBD context qemu:allocation-depth is able to
> distinguish between locally-present data (even when that data is
> sparse) [shown as depth 1 over NBD], and data that could not be found
> anywhere in the backing chain [shown as depth 0]; and the libnbd
> project was recently patched to give the human-readable name "absent"
> to an allocation-depth of 0.  But qemu-img map --output=json predates
> that addition, and has the unfortunate behavior that all portions of
> the backing chain that resolve without finding a hit in any backing
> layer report the same depth as the final backing layer.  This makes it
> harder to reconstruct a qcow2 backing chain using just 'qemu-img map'
> output, especially when using "backing":null to artificially limit a
> backing chain, because it is impossible to distinguish between a
> QCOW2_CLUSTER_UNALLOCATED (which defers to a [missing] backing file)
> and a QCOW2_CLUSTER_ZERO_PLAIN cluster (which would override any
> backing file), since both types of clusters otherwise show as
> "data":false,"zero":true" (but note that we can distinguish a
> QCOW2_CLUSTER_ZERO_ALLOCATED, which would also have an "offset":
> listing).
> 
> The task of reconstructing a qcow2 chain was made harder in commit
> 0da9856851 (nbd: server: Report holes for raw images), because prior
> to that point, it was possible to abuse NBD's block status command to
> see which portions of a qcow2 file resulted in BDRV_BLOCK_ALLOCATED
> (showing up as NBD_STATE_ZERO in isolation) vs. missing from the chain
> (showing up as NBD_STATE_ZERO|NBD_STATE_HOLE); but now qemu reports
> more accurate sparseness information over NBD.
> 
> An obvious solution is to make 'qemu-img map --output=json' add an
> additional "present":false designation to any cluster lacking an
> allocation anywhere in the chain, without any change to the "depth"
> parameter to avoid breaking existing clients.  The iotests have
> several examples where this distinction demonstrates the additional
> accuracy.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   docs/tools/qemu-img.rst                       |   3 +
>   qapi/block-core.json                          |   7 +-
>   qemu-img.c                                    |   7 +-
>   tests/qemu-iotests/122.out                    |  84 ++++----
>   tests/qemu-iotests/154.out                    | 190 +++++++++---------
>   tests/qemu-iotests/179.out                    | 133 ++++++++----
>   tests/qemu-iotests/223.out                    |  56 +++---
>   tests/qemu-iotests/244.out                    |  23 ++-
>   tests/qemu-iotests/252.out                    |  10 +-
>   tests/qemu-iotests/274.out                    |  48 ++---
>   tests/qemu-iotests/291.out                    |  24 +--
>   .../tests/nbd-qemu-allocation.out             |  16 +-
>   12 files changed, 330 insertions(+), 271 deletions(-)
> 
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index cfe11478791f..d6300f7ee03d 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -597,6 +597,9 @@ Command description:
>       if false, the sectors are either unallocated or stored as optimized
>       all-zero clusters);
>     - whether the data is known to read as zero (boolean field ``zero``);
> +  - whether the data is actually present (boolean field ``present``);
> +    if false, rebasing the backing chain onto a deeper file would pick
> +    up data from the deeper file;

Preexisting, but rather strange style of documentation, when described option doesn't go first in the paragraph..

>     - in order to make the output shorter, the target file is expressed as
>       a ``depth``; for example, a depth of 2 refers to the backing file
>       of the backing file of *FILENAME*.
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index a54f37dbef06..912a7d9265e5 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -261,6 +261,9 @@
>   #         images in the chain)) before reaching one for which the
>   #         range is allocated
>   #
> +# @present: true if this layer provides the data, false if adding a backing
> +#           layer could impact this region (since 6.1)
> +#
>   # @offset: if present, the image file stores the data for this range
>   #          in raw format at the given (host) offset
>   #
> @@ -271,8 +274,8 @@
>   ##
>   { 'struct': 'MapEntry',
>     'data': {'start': 'int', 'length': 'int', 'data': 'bool',
> -           'zero': 'bool', 'depth': 'int', '*offset': 'int',
> -           '*filename': 'str' } }
> +           'zero': 'bool', 'depth': 'int', 'present': 'bool',
> +           '*offset': 'int', '*filename': 'str' } }
> 
>   ##
>   # @BlockdevCacheInfo:
> diff --git a/qemu-img.c b/qemu-img.c
> index 7956a8996512..8090facc5087 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -2980,8 +2980,9 @@ static int dump_map_entry(OutputFormat output_format, MapEntry *e,
>           break;
>       case OFORMAT_JSON:
>           printf("{ \"start\": %"PRId64", \"length\": %"PRId64","
> -               " \"depth\": %"PRId64", \"zero\": %s, \"data\": %s",
> -               e->start, e->length, e->depth,
> +               " \"depth\": %"PRId64", \"present\": %s, \"zero\": %s,"
> +               "\"data\": %s", e->start, e->length, e->depth,
> +               e->present ? "true" : "false",

Didn't you want to put present at the end? Still, this shouldn't be significant. And it make sense to keep present, zero and data together.

You missied a whitespace after '"zero": %s,', which is obvious from further test diff hunks.

With it fixed:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

>                  e->zero ? "true" : "false",
>                  e->data ? "true" : "false");
>           if (e->has_offset) {
> @@ -3047,6 +3048,7 @@ static int get_block_status(BlockDriverState *bs, int64_t offset,
>           .offset = map,
>           .has_offset = has_offset,
>           .depth = depth,
> +        .present = !!(ret & BDRV_BLOCK_ALLOCATED),
>           .has_filename = filename,
>           .filename = filename,
>       };
> @@ -3062,6 +3064,7 @@ static inline bool entry_mergeable(const MapEntry *curr, const MapEntry *next)
>       if (curr->zero != next->zero ||
>           curr->data != next->data ||
>           curr->depth != next->depth ||
> +        curr->present != next->present ||
>           curr->has_filename != next->has_filename ||
>           curr->has_offset != next->has_offset) {
>           return false;
> diff --git a/tests/qemu-iotests/122.out b/tests/qemu-iotests/122.out
> index 3a3e121d579d..83dfcf75281f 100644
> --- a/tests/qemu-iotests/122.out
> +++ b/tests/qemu-iotests/122.out
> @@ -67,12 +67,12 @@ read 65536/65536 bytes at offset 4194304

[..]

-- 
Best regards,
Vladimir

