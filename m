Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBC43A3DBF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 10:10:24 +0200 (CEST)
Received: from localhost ([::1]:41714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrcFC-0000Ap-Ql
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 04:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrcDt-0006M0-91; Fri, 11 Jun 2021 04:09:01 -0400
Received: from mail-am6eur05on2127.outbound.protection.outlook.com
 ([40.107.22.127]:18912 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrcDp-0001XL-4Y; Fri, 11 Jun 2021 04:09:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdGlUNqzPg+TpdY55BPT8lcefukbXLN3jIWqyHBW1Q5SHVK8WOl4O1m6MVquYMKuTulKmAOFgZwWVeOiRoMV/W700FfE+7MXCUcuzrDsQX2LNfHhnQfrSU0HCWRfhEipkevDmqiNlqklzGaPKcqVgAy2/GzXtxVKLnzWxRba1BX2si3jg9uXvVo/kNSrZoHdD9ckiRfgPpBSGUwTuNGnoViZ0S90OEW7yfl1nV4g4GCi+oncsqtb3ijjqVhTMrNGrlxSqnvgRL7cFzUY4/jgJZRx4BMs8MAtwZS0yr3KXwIbvu9sU+JEK72GGq319a7dcEjE9RRVC2DNqiKDlrd/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxWNzPtCWOyt47oBeRlxGPrVIgrI3Li50A8Ke1XeK3c=;
 b=eQjagkLGovPRLCoJt/YZnwqfEyTfgG/5nCV4XMxWtlyN2CvVeyG/aIi6JDtsHXnSYhnacLHTc3pu5GAWVwyvQL+6hLbwM9r4wKWGMDTHj2nsr8ZslOHQ/wZP/73JAfaGrUv3+XeU6LxOT1zE3pMuiw6aN/kaCj5le2sRf+nZmzM1Nj242ZKiKFUDqLvlQiX3qzmeKYHoB2FjBAjbt2pod+DESB6PogZ1EoT+3QtWn59l4tw+pFCzxdE63tth/U5y3nX9mco4aa4MyCVcD65qNPYaM2c7N/g22cC8T7FFyoIi8JCpeLwvUsLLdKXsxnwqQD9G0Ucxb0Sb58IW3yrG4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxWNzPtCWOyt47oBeRlxGPrVIgrI3Li50A8Ke1XeK3c=;
 b=m80E8octjdY0ukakrdfn935ClOrGS2PItpX//3G8AOI4nxgNMY93sHCUNTDGhCavt3cSf3ecR7grwRSPdfxZOok64m0defObAsgo756h0JIhh8YQiONyI/uLJjUSFaFapQXke3C9C4mlgkeqVehOAdbMt/MEjf40h3eMiE/RtdI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5127.eurprd08.prod.outlook.com (2603:10a6:20b:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 11 Jun
 2021 08:08:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4219.023; Fri, 11 Jun 2021
 08:08:52 +0000
Subject: Re: [PATCH] qemu-img: Use "depth":-1 to make backing probes obvious
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, nsoffer@redhat.com, Kevin Wolf <kwolf@redhat.com>, 
 Max Reitz <mreitz@redhat.com>
References: <20210610213906.1313440-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0a92c583-68b4-c072-68cf-1c6a17a7517e@virtuozzo.com>
Date: Fri, 11 Jun 2021 11:08:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210610213906.1313440-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: FR0P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 FR0P281CA0073.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Fri, 11 Jun 2021 08:08:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 103790c8-3567-45c0-3231-08d92cb02661
X-MS-TrafficTypeDiagnostic: AM6PR08MB5127:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5127BA453F877BF96DF041A7C1349@AM6PR08MB5127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ricDCeQF7B0sfI1JKZeFzf2Hl77Vn35oCNaDtGg7q/kAU6XTmwCoYctIt5MlLCgJB2RhIAAzhxm0BED3vKDtlR0MHCGYT5X0T/H3hAlkE50FvHdnF2uY7IaA1O266GlbZSNT1lFgx/Q20xVxzUbeihMIGfAryp22omFuq9sGQWuKgTcK7y4IbSVG+uldmVDWQWi5IkIjX1S3Ee0BpmTKdVhUhinrS3Af1VW/L/W+oijnfojuMh6H4VfYMvTzr7qNvsp4OQUD3Nwzf9abLULJ5BQGsefloR+PDYuVpQY/62qAMqJwFulkb4ztqSG2UPfPRZiltQ1MNNNjT6rdLgGaULEH2P9MZTMbbylOEf9GfcGNN6p6QH3/4r3rQJ622JptJvLhKdqLQGnWJcTpaUeDgAujuLiENbh4QFhsHYmV9XbB8Fl0dR9p+zwAWFEL0cHwgDN1qkHwdBgBjRpb/7FYegXtO6nQzpa0yAellexug+je2Z1+8Pmc0MbLhS+C14imSv3AKGb8arLgh7o2PNIXWCiFLBZ26K2Y4aUBMjRnUE+JOXPpy6heyvZVhT0vmwk5LVZ2LA32slCWglhQSkiaMwg0hP4AATfqJhNQA/bZIGi2CpxUCtPhDrq5AkdAIKS8lbDroYxIGLZcN0SFDbnwPNplQt49NBdgwuCNpmteIaGPoThidNiI7NRdRs0mqrbwPryyz3oZayHIxojpWk7k/EQCKPMIXw4pnG7UdqRSb4tVcE0iw15Hn5lxhLguqHh7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(396003)(346002)(376002)(366004)(83380400001)(6666004)(2906002)(186003)(66476007)(8676002)(16526019)(54906003)(316002)(31686004)(16576012)(66556008)(4326008)(31696002)(8936002)(478600001)(6486002)(52116002)(36756003)(5660300002)(86362001)(956004)(26005)(66946007)(38100700002)(2616005)(38350700002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXpBbGlCbEtPNEtyOEJZOEhOTmZxWURHdFI5V200MmRYdWxNMEJDeFJTUG9F?=
 =?utf-8?B?VU85c3ErNnZiWE44ZGtBQXNxeVFWd0lTNmR2b1R3bHZzc3VVUGpKUVJwNktL?=
 =?utf-8?B?d3ZuN2NUYkJyaFFFSWJQWnhsV0tMeXAzUnk3ZllybEFSeVZaK0pwSStMelNw?=
 =?utf-8?B?QjZlclF3aFN4NzVObjNWVnVoLzllWDNzRkp4TWM2dEJjZERGSW9xZzEyZTEv?=
 =?utf-8?B?alFiVHVxZzF4T2lVSGtidFdleWJJbW1sa0FUYW43R1dCUW5yMVpvOVdGUU84?=
 =?utf-8?B?VVA5WXpZTExEZVNYVXQrNzJGcWhhbzNYdkVZOHJxR255d290WHJVTmFYRU83?=
 =?utf-8?B?NnpzN0ZnNU5ZczkzcGh1VWdFS0o2bFF0cVJCTUdtM2pLZk5VOVpNdllqOUhu?=
 =?utf-8?B?Y0x0R24zOGQ2YWhUT1pqQUhIVms1eFFuTmlnNjBrM0lGQm9meEpIR3VnTjRE?=
 =?utf-8?B?VG9Ia1NWSlN3Rk91YnByamFpcm1qeE5UMDFIL1huTlA2TVQ3Mk42c3JPZ2Nl?=
 =?utf-8?B?YnFoeVY3MmxxYm40cU5pNTlhcU0zS2VqbTBYcEpqaTlHMlExSGpBTFZQRHo5?=
 =?utf-8?B?RDdiamVtTEtrQjBkYzBFWk9QdGQ5NVFxMGhTdWIvTVVuWDgybExjWVJmZXdq?=
 =?utf-8?B?OWdvRlVvMzhEVEpNVXpIenBJaUx1RndKNVdaWEV0NGF6RFFpN21ENnlFTHd1?=
 =?utf-8?B?TGFFdGtiTXpyRzdSeUhnV0FFZnY3dWJLRVdtYnkybnkwRHJnRkozUUV1MHA3?=
 =?utf-8?B?MGQvakplY0xrdWlybFpWUkN1ZlM5M2k0dXdHRkZLQUY1WjJKMlNsbEVqU1kx?=
 =?utf-8?B?YjZGbzJ1enUxTnd1SUlxTHY1OWpMS0dlQ2Zlajh4Zk4vUmFCRGREOGY4SThZ?=
 =?utf-8?B?N3cyc0VaenowNS9BSjUySlZYbFZTTjVBUkk5UngzeGQ0THhRYVJtTTEvT2Rv?=
 =?utf-8?B?akFyNHVQckNjVi9qcldWL2F4RTM2ci9FRzBVYXl4eFJqcXhETWYvOHAvNXlm?=
 =?utf-8?B?S3lkRUIxeVhnbW5JV1p4U3ZQL1JMcEhxV0RJYkx4c0JWdE40T1BrYk0zdlBD?=
 =?utf-8?B?Q2hrMDFuWjQ1MDByem5yakJUaVluSzZTd3RUd2hTVHJ3cnFCUHpsdHBYRElt?=
 =?utf-8?B?Q3RhcGY5THlTTXJlb1FIeG0raWRJK1p0NkpMWDg2WXFPT3dUREw1bjNGdTVE?=
 =?utf-8?B?Qll3SXRuZldkY2t0Ri9scnlLc1pkQjAxZzZQNTh0bkFrQUcvQXBPS0xVd2tN?=
 =?utf-8?B?OWVUcU9SWkdLbmVDdm8vSnNYL1lMVHRRb2dod05sN2t1TXIwZk91MTQ3OHI1?=
 =?utf-8?B?dVBVdkY5YWVPSnpIdkdkSEZiMmgzMDJTcEJMdy9DVi9yUTB1WHJ6dlYvTk44?=
 =?utf-8?B?S2hMaDJiR0tGcnMyL1gvR0UwRHNlN3hHdjZvT0toT01uRXgxUzVRcFJYT0VG?=
 =?utf-8?B?M0ZNT3ZwSSsxNm1uNHBZbWFXTEZJNWcrd2haaWFQWDVHL3prUUwwQXl2N3Rz?=
 =?utf-8?B?RmJyT24yR0J6RVFOWURhaUlzcFVwaGs5THBJd1hxeHNXZ0VqOHA2bllPaUxa?=
 =?utf-8?B?R21DajFQTTAwTHF0dXZRM0w3Q2g2MEhGckxJdVJnWWgzR2JGb0tWcjhrNXNY?=
 =?utf-8?B?M0k1TnRjc2w3WXg5UjVLamtkMG5ZYlhZcm01MFg2L3VEdUZlNU1BcVVMK25v?=
 =?utf-8?B?WkljN3pST3R0cHRDWW5qYThqdGxtT25iN3l6cmNwTHA1NmRzRkplM3VOczU1?=
 =?utf-8?Q?gqrermg8TQwOvFofvGUUSpL5GDIRTqbV0ep12On?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103790c8-3567-45c0-3231-08d92cb02661
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 08:08:52.0819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dh5P8QxAoelOvoKl+MQHtPWhllfBSxw5+ZpSpkyM7pRhI7OX2M5wJ9xjUNB/L25DnYTzavKRg4+323XpFMvsCAW28D+kTh8x9vgVu0PXISg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5127
Received-SPF: pass client-ip=40.107.22.127;
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

11.06.2021 00:39, Eric Blake wrote:
> The recently-added NBD context qemu:allocation-depth makes an obvious
> case for why it is important to distinguish between locally-present
> data (even with that data is sparse) [shown as depth 1 over NBD], and
> data that could not be found anywhere in the backing chain [shown as
> depth 0].  But qemu-img map --output=json predates that addition, and
> has the unfortunate behavior that all portions of the backing chain
> that resolve without finding a hit in any backing layer report the
> same depth as the final backing layer.  This makes it harder to
> reconstruct a qcow2 backing chain using just 'qemu-img map' output
> when using "backing":null to artificially limit a backing chain,
> because it is impossible to distinguish between a
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
> An obvious solution is to make 'qemu-img map --output=json' visually
> distinguish between clusters that have a local allocation from those
> that are found nowhere in the chain, by adding "depth":-1 as the new
> witness of data that could not be tied to a specific backing image.
> Several iotests are impacted, but glancing through the changes shows
> that it is an improvement in that it shows more accurate details.
> 
> Note that the documentation is specifically worded to allow qemu-img
> to report "depth":-1 both in the scenario where the last file in the
> backing chain still defers the cluster (corresponding to
> BDRV_BLOCK_ALLOCATED not being set anywhere in the chain), and in the
> scenario where qemu is unable to determine which backing chain element
> (if any) provides the data.  The latter case does not exist now, but
> I'm considering an upcoming patch to add a BDRV_BLOCK_BACKING that
> would let a specific driver (such as NBD) inform the block layer that
> it is known that a cluster comes from a backing layer, but where there
> is insufficient data to determine which layer.
> 
> As a quick demonstration:
> 
>      # Create a qcow2 image with a raw backing file:
>      $ qemu-img create base.raw $((4*64*1024))
>      $ qemu-img create -f qcow2 -b base.raw -F raw top.qcow2
> 
>      # Write to first 3 clusters of base:
>      $ qemu-io -f raw -c "w -P 65 0 64k" -c "w -P 66 64k 64k" \
>        -c "w -P 67 128k 64k" base.raw
> 
>      # Write to second and third clusters of top, hiding base:
>      $ qemu-io -f qcow2 -c "w -P 69 64k 64k" -c "w -z 128k 64k" top.qcow2
> 
>      # Examine the full backing chain
>      $ qemu-img map --output=json -f qcow2 top.qcow2
>      [{ "start": 0, "length": 65536, "depth": 1, "zero": false, "data": true, "offset": 0},
>      { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
>      { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": false},
>      { "start": 196608, "length": 65536, "depth": 1, "zero": true, "data": false, "offset": 196608}]
> 
>      # Repeat, but with the backing chain clamped. Pre-patch:
>      $ qemu-img map --output=json -f qcow2 json:'{"driver":"qcow2", \
>        "backing":null, "file":{"driver":"file", "filename":"top.qcow2"}}'
>      [{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": false},
>      { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
>      { "start": 131072, "length": 131072, "depth": 0, "zero": true, "data": false}]
> 
>      # Repeat, but post-patch:
>      $ qemu-img map --output=json -f qcow2 json:'{"driver":"qcow2", \
>        "backing":null, "file":{"driver":"file", "filename":"top.qcow2"}}'
>      [{ "start": 0, "length": 65536, "depth": -1, "zero": true, "data": false},
>      { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
>      { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": false},
>      { "start": 196608, "length": 65536, "depth": -1, "zero": true, "data": false}]
> 
> Note that pre-patch, it was impossible to determine which portions of
> the qcow2 file override the backing file because the "depth":0 regions
> were combined, so even though qemu internally can tell the difference
> between sclusters 2 and 3, the command line user could not.  But
> post-patch, the "depth":-1 markings match the "depth":1 markings when
> the backing chain is intact, and it becomes obvious which clusters are
> important.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

I'm not sure do we need a kind of new option or deprecation period for such incompatible change..

Personally I'm OK with it and like the idea:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
> 
> If desired, I can send a followup patch that omits "depth":-1 output
> from qemu-img output instead (that's another couple lines tweak to the
> sources, plus re-touching all of the same affected tests).

[..]

> +    backing file (if any) provides the data.
> 
>     In JSON format, the ``offset`` field is optional; it is absent in
>     cases where ``human`` format would omit the entry or exit with an error.
> diff --git a/qemu-img.c b/qemu-img.c
> index a5993682aad4..a6f0c5565865 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -3035,6 +3035,9 @@ static int get_block_status(BlockDriverState *bs, int64_t offset,
>           bdrv_refresh_filename(file);
>           filename = file->filename;
>       }
> +    if (!(ret & BDRV_BLOCK_ALLOCATED)) {
> +        depth = -1;
> +    }

may be more obvious would be set depth = -1 in "if (bs == NULL) {" where ret becomes 0 for this case.

> 
>       *e = (MapEntry) {
>           .start = offset,
> diff --git a/tests/qemu-iotests/122.out b/tests/qemu-iotests/122.out
> index 3a3e121d579d..2aca0f066fa8 100644
> --- a/tests/qemu-iotests/122.out
> +++ b/tests/qemu-iotests/122.out
> @@ -68,11 +68,11 @@ read 65536/65536 bytes at offset 4194304
>   read 65536/65536 bytes at offset 8388608
>   64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>   [{ "start": 0, "length": 65536, "depth": 0, "zero": false, "data": true},
> -{ "start": 65536, "length": 4128768, "depth": 0, "zero": true, "data": false},
> +{ "start": 65536, "length": 4128768, "depth": -1, "zero": true, "data": false},
>   { "start": 4194304, "length": 65536, "depth": 0, "zero": false, "data": true},
> -{ "start": 4259840, "length": 4128768, "depth": 0, "zero": true, "data": false},
> +{ "start": 4259840, "length": 4128768, "depth": -1, "zero": true, "data": false},
>   { "start": 8388608, "length": 65536, "depth": 0, "zero": false, "data": true},
> -{ "start": 8454144, "length": 4128768, "depth": 0, "zero": true, "data": false}]
> +{ "start": 8454144, "length": 4128768, "depth": -1, "zero": true, "data": false}]

[..]


-- 
Best regards,
Vladimir

