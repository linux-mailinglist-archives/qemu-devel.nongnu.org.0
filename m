Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE0634A69F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 12:50:34 +0100 (CET)
Received: from localhost ([::1]:33692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPkz1-00040C-CQ
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 07:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPkxQ-0003HZ-Aq; Fri, 26 Mar 2021 07:48:52 -0400
Received: from mail-eopbgr20101.outbound.protection.outlook.com
 ([40.107.2.101]:12804 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPkxM-00020e-C5; Fri, 26 Mar 2021 07:48:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Er+Zzcf1oJtHYh9E0vtjauVFz/NxgGjI2I2X9qG1HCZNjO5a0WJWd1/mmuX2FhI26aAELEYYs2KPNHX47UNHh4joYx7Ad/v6cWmFjRTbKREb1wEl7v0HgLw2qyH55WLQk6znkWBGp/ZenaM1QJ/V/e23Lj2QPhP9bXi+lL6I+2FfuXrAnRI1iNc18ny40k03M50uNHJGa2GV9rWepbtg8Pkk1TEo3i1o0lE8uOyjwv2uPLPKGcYRACW7akLM194NFM7cBSj5bssGVaGGBdc/pRKAT6bYOFUUj8teSxk4py5WWMy7vbKZkgmEXK3yNu2eBHR71ts9lw7xwE22y+vNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0BtWkxAylzkx8lJ7VWbNnWqVsU48zQ9H6P4HRlGLSs=;
 b=grgEUwdbVEXKIgoN1VbSBzSMQPuAkhWyp7b5CBSLdLAYtsfIkvFzXTPC+mSl4oOthhFqEj7fOWifQwr4cuOPI5jgPECGEOKzqQEYG2k0ngIdrEAbmHWRJCiGVBAh0Vn1PJpYA82GXjHz0IjjNVkBwTiMUIMH2Cu9BTVb+r7e1fk+o/JZUUk7sgHBA0TRrpvFooAKuBvinK97Ip0AD+46HRmM+jm8wfD+nHSz5myYHm50X7RxDeYy8deg7tArEttmeTeu2dyHkd2uFJDjCo0Yu24ySqsSv0kFcWU7XtDPdTkszhlUq7gwj3/MQ4z5BWGgjjV9KopQ+BdqJDDyrNM4XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0BtWkxAylzkx8lJ7VWbNnWqVsU48zQ9H6P4HRlGLSs=;
 b=u45bDpvDzmjOcZBdD1d5ue2KYNnbMmeFTh5Bo41Rr9+iN6N25NGyPMxTp36A+ZO4VSThpI5viW+uKjKC4zj1FXI3EgjXjM9vzgkLdS1G29jbvWCDD8s7PXvA0PECgxLmLAZseBYvQM4HUUO/7EhqqXoq533qT9PwpakDokwlD2k=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3446.eurprd08.prod.outlook.com (2603:10a6:20b:45::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Fri, 26 Mar
 2021 11:48:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 11:48:43 +0000
Subject: Re: [PATCH 1/4] qcow2: Improve refcount structure rebuilding
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210310155906.147478-1-mreitz@redhat.com>
 <20210310155906.147478-2-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <969cd321-0cc7-ddc3-8a0d-75819be3a6bf@virtuozzo.com>
Date: Fri, 26 Mar 2021 14:48:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210310155906.147478-2-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM4PR0302CA0030.eurprd03.prod.outlook.com
 (2603:10a6:205:2::43) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM4PR0302CA0030.eurprd03.prod.outlook.com (2603:10a6:205:2::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Fri, 26 Mar 2021 11:48:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edf3746c-e516-4295-ef77-08d8f04d1b1b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3446:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3446F6C7A3301614CB049EABC1619@AM6PR08MB3446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3rCgS3GrEU/N9YqwXZ5JdJZT6w+mU4S/Ns4qDy26zD4JcimzyBD0gFLf8bHTxT0n8UHrP3LRgkGgR4sJxjtO+Y99ywvZO26LKZDgOmzlhzRB1A6vUnoGPuqQw4kHZPLFD0FsSfvR4u7kD09rV4yYSE6veJ+rtk/+caLHpTwN6tpkZoKmPrhxNLcj/agQ1KkjRen4jZSQBlPGFXGFLD1z+Y4lfkuAte9kLsc/YukX2NiBrCdZpuAnM6ysjm6yTL1sBVH8JBIkLNFZUtyPNVyjqxh9OmZn5rZZMM8YoE46P7Ii2HU9FOgKOi4DhgJxH1AmpbXy1piSyXGInsSw1hL1Tcfa9Qet8zm6Y8kiFETM/KnDkTMihyd8EPwzWJVkJuWNgsCEG8XDmdKFrUAP60vd+BCyg+1Q76dZTvU3MReIL0x5dI8hnCwRi6Um6xkzlCB2BSjfrxkBt/c8ZAHRqdX8cN2zg6ea0ggvnKQHAebGzHvplWx2tBYPFnMQscMGfCl9T0SwS3NP04LedMJabHS36AYp09aWBsLFqksWOLLMPWvPFktq+kogaJ7LkZySKViVAiD/x18yxppPpOVzcWkcI+dcJymn0nCNlI94vGArvYZgyAuqYZxIBUliN9pu5PLOzSJXGrP+t1LD0+ycrtB+F7bBbxT0+ytHPFAkEPPjmwMzbDWS3iI9HJE73tyO4LpPtMFUHJ+ZicdomVbRRJMB8/G5aR/y+TFDA/cD0gOzBWHNFiS9FjH77vLkag1Jk1nuKu8KSujUdEUn5vp3mfOG832Pt5f1BZ1mJgvlylWEWhU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39840400004)(8936002)(8676002)(966005)(5660300002)(478600001)(31686004)(2906002)(2616005)(956004)(86362001)(66556008)(66476007)(16576012)(38100700001)(16526019)(31696002)(4326008)(6486002)(36756003)(66946007)(83380400001)(316002)(26005)(186003)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dmNmVVM5QlFYdFRHZUNTNnBSZUFMdjdDNytKZnFuM2gyRGswNEJZZW5JbXZl?=
 =?utf-8?B?M2VRcGJZK1d1czFlM3J4Y3k0NFpxaml6QWVPbmwyTThlcXRmQytxOEJFem4v?=
 =?utf-8?B?Z1ZWalZ6Uk42T3E5Q0U2L09ySEQxTGwzRmYrVXVLWFVJbE9IUUpKVy9PUUxz?=
 =?utf-8?B?WERSZk9WZ0lIa1BqMWJ6QmI4MW1Ga3hJVHoydUpXTy84cXFZZ0F5dDlLTll0?=
 =?utf-8?B?cVhUNjEzSWdrUVpGelNKREFoYXU3bUttbTVuM0NhNmdKSGR4cTZXa29wTzZZ?=
 =?utf-8?B?N0NyaFM0WU81b0pyM2xyUGU3elRWV2xNdkkwNFhQU2NyTVpTVjRkRk5QK294?=
 =?utf-8?B?ZlZBWmlDZXMwa0FPU0tRMlpLWDR0eWVMbkRDYXNDRXVmTHBpTStqcGpNYUVv?=
 =?utf-8?B?RFhxNGdFSFQ5V05MTkNlQkJJZkpUVUlxdEI5OWFVbEVmbTJEdnV4UFg0eGxp?=
 =?utf-8?B?QzVOTmJuc1JCYzZydm5uNFBxS0pQNEdydnNtcjcxeVlFYXcrNlN1ZEp0WFNT?=
 =?utf-8?B?Rm1tNlBpUXpTbStVajNOQU8yOFlLOWJRampyT2RYMW5BUEMxZDN0ZENTbUJJ?=
 =?utf-8?B?U1c4TU53RW5xcUFEd29RYUhXWW04Z0NhdXhUWnp1V1JzWUsvY3pYbnlXUFhV?=
 =?utf-8?B?ZU1DeWkrcEoxNkdmd1dZVk9oK2pseHlhOEFGQ1QxcklBVjFlK095eFoweFJM?=
 =?utf-8?B?K2tSbDB2RDkwb3YvKzBKYzRnb1Fhb2dZa3lyQ3ZlOTMzb2wxWHcyNVpqR213?=
 =?utf-8?B?UjRsWmZpUEMrSnRjWWFWc2tzT1p6dDlZOXdMMmo0MElxMTFBbTY5UzdSYXlG?=
 =?utf-8?B?cWUzdVlod1JIdVlkTzNCQ3hQS2J0YTArYlFxMHpMOXNWUDI1YjNHVUFDYTB4?=
 =?utf-8?B?ZldDQU8zYUszVEx5OFl2TnVDME9rM280ZTlLWDRvMjV4aXdtTFRwdTVRai9m?=
 =?utf-8?B?Nzd5UHQ2aFQ3Y011eTAwN0E2eW11TWlIblRSd3VhYzVSVkh2YUduMjhMTHZo?=
 =?utf-8?B?RFVYUGpvalRWckZUdGJqU214bU1ZUXpwNmdpcDdmQ2NsWGxIYjdLWE1KTVY4?=
 =?utf-8?B?VUJaenhyZHIrN3UyMzhNc0ZkSWkveFVRdjRsSU5xYm1PckpOd2N3eFFpUTZ0?=
 =?utf-8?B?dmRubE9LQkVXekVvMUVNb2lVSFQyOStvcndRTGxIUzZTZE4rOSszbW42Sktt?=
 =?utf-8?B?OVlqZE5pbWkxMVRnczQzUWVTd1ZGS1VKSllQUkxjUElXcTBJaHd6NHl4MGFi?=
 =?utf-8?B?VXFISTYwSEY4RnFFTFpQSWdNbnVsVHBheThpR0NIdlZXdjRKOHh5dXN2Rm5l?=
 =?utf-8?B?YmFzWmhmUkJ4LzljTzZrNkc2QmFwelFWd0FodHVCeVRLczQ1czV0azlWYnFU?=
 =?utf-8?B?aVVSWDVwdjJIM3R2KzhTM3NZVWMvcXNVN01LdE9uMGpGUDExaFRBM1hjVHc4?=
 =?utf-8?B?NVZGZVhFdldDemF0ZVlOSW9jL0R3U1M0YnNHOXNCU2Z0Y3l1cGw4TlZsd0Vv?=
 =?utf-8?B?NmFQQ0tIcXdIQ3ZIaTBML3dTVG5ucDNWQnRjSGc2NzZqWlQ3MGFNWUk2U1FO?=
 =?utf-8?B?cHRpdXR1MDNDYzdqeHlNK2E2QnpNU09WK0JTNERieUFrbGJjeUM1a0srajIr?=
 =?utf-8?B?aHQyMmpTY3VPQS9OS3ZTQlVtYUZ4YncrbE5MK0gxaWhIMUt3QWR0YURwTVNj?=
 =?utf-8?B?TWNsYTVOcDJzZzBHMmpFeVplVUJWUjFUU1YvWWNpM1djQVdtTGNzRlFYZkxG?=
 =?utf-8?Q?l+wdqRZkZzSZeAJpkiTi/Ou9oJfjs8aYvkjQ3nF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf3746c-e516-4295-ef77-08d8f04d1b1b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 11:48:43.2969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCK1D0jVUv5vDZ8VM4XYfULrdJ55d+7X9EaEo7rvxM7Ok5BWXU7OQDCC2RLWuRTYfPciRtPktaLeo3pumLr/gpwFi5m7fqJr+sf+4z3CUj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3446
Received-SPF: pass client-ip=40.107.2.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

10.03.2021 18:59, Max Reitz wrote:
> When rebuilding the refcount structures (when qemu-img check -r found
> errors with refcount = 0, but reference count > 0), the new refcount
> table defaults to being put at the image file end[1].  There is no good
> reason for that except that it means we will not have to rewrite any
> refblocks we already wrote to disk.
> 
> Changing the code to rewrite those refblocks is not too difficult,
> though, so let us do that.  That is beneficial for images on block
> devices, where we cannot really write beyond the end of the image file.
> 
> [1] Unless there is something allocated in the area pointed to by the
>      last refblock, so we have to write that refblock.  In that case, we
>      try to put the reftable in there.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1519071
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   block/qcow2-refcount.c | 126 ++++++++++++++++++++++-------------------
>   1 file changed, 67 insertions(+), 59 deletions(-)
> 
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index 8e649b008e..162caeeb8e 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -2352,8 +2352,9 @@ static int rebuild_refcount_structure(BlockDriverState *bs,
>                                         int64_t *nb_clusters)
>   {
>       BDRVQcow2State *s = bs->opaque;
> -    int64_t first_free_cluster = 0, reftable_offset = -1, cluster = 0;
> +    int64_t first_free_cluster = 0, reftable_offset = -1, cluster;
>       int64_t refblock_offset, refblock_start, refblock_index;
> +    int64_t first_cluster, end_cluster;
>       uint32_t reftable_size = 0;
>       uint64_t *on_disk_reftable = NULL;
>       void *on_disk_refblock;
> @@ -2365,8 +2366,11 @@ static int rebuild_refcount_structure(BlockDriverState *bs,
>   
>       qcow2_cache_empty(bs, s->refcount_block_cache);
>   
> +    first_cluster = 0;
> +    end_cluster = *nb_clusters;
> +
>   write_refblocks:
> -    for (; cluster < *nb_clusters; cluster++) {
> +    for (cluster = first_cluster; cluster < end_cluster; cluster++) {
>           if (!s->get_refcount(*refcount_table, cluster)) {
>               continue;
>           }
> @@ -2374,65 +2378,68 @@ write_refblocks:
>           refblock_index = cluster >> s->refcount_block_bits;
>           refblock_start = refblock_index << s->refcount_block_bits;
>   
> -        /* Don't allocate a cluster in a refblock already written to disk */
> -        if (first_free_cluster < refblock_start) {
> -            first_free_cluster = refblock_start;
> -        }
> -        refblock_offset = alloc_clusters_imrt(bs, 1, refcount_table,
> -                                              nb_clusters, &first_free_cluster);
> -        if (refblock_offset < 0) {
> -            fprintf(stderr, "ERROR allocating refblock: %s\n",
> -                    strerror(-refblock_offset));
> -            res->check_errors++;
> -            ret = refblock_offset;
> -            goto fail;
> -        }
> -
> -        if (reftable_size <= refblock_index) {
> -            uint32_t old_reftable_size = reftable_size;
> -            uint64_t *new_on_disk_reftable;
> +        if (reftable_size > refblock_index &&
> +            on_disk_reftable[refblock_index])
> +        {
> +            refblock_offset = on_disk_reftable[refblock_index];

In this branch, we assign it to ..

> +        } else {
> +            int64_t refblock_cluster_index;
>   
> -            reftable_size = ROUND_UP((refblock_index + 1) * REFTABLE_ENTRY_SIZE,
> -                                     s->cluster_size) / REFTABLE_ENTRY_SIZE;
> -            new_on_disk_reftable = g_try_realloc(on_disk_reftable,
> -                                                 reftable_size *
> -                                                 REFTABLE_ENTRY_SIZE);
> -            if (!new_on_disk_reftable) {
> +            /* Don't allocate a cluster in a refblock already written to disk */
> +            if (first_free_cluster < refblock_start) {
> +                first_free_cluster = refblock_start;
> +            }
> +            refblock_offset = alloc_clusters_imrt(bs, 1, refcount_table,
> +                                                  nb_clusters,
> +                                                  &first_free_cluster);
> +            if (refblock_offset < 0) {
> +                fprintf(stderr, "ERROR allocating refblock: %s\n",
> +                        strerror(-refblock_offset));
>                   res->check_errors++;
> -                ret = -ENOMEM;
> +                ret = refblock_offset;
>                   goto fail;
>               }
> -            on_disk_reftable = new_on_disk_reftable;
>   
> -            memset(on_disk_reftable + old_reftable_size, 0,
> -                   (reftable_size - old_reftable_size) * REFTABLE_ENTRY_SIZE);
> +            refblock_cluster_index = refblock_offset / s->cluster_size;
> +            if (refblock_cluster_index >= end_cluster) {
> +                /*
> +                 * We must write the refblock that holds this refblock's
> +                 * refcount
> +                 */
> +                end_cluster = refblock_cluster_index + 1;
> +            }
>   
> -            /* The offset we have for the reftable is now no longer valid;
> -             * this will leak that range, but we can easily fix that by running
> -             * a leak-fixing check after this rebuild operation */
> -            reftable_offset = -1;
> -        } else {
> -            assert(on_disk_reftable);
> -        }
> -        on_disk_reftable[refblock_index] = refblock_offset;
> +            if (reftable_size <= refblock_index) {
> +                uint32_t old_reftable_size = reftable_size;
> +                uint64_t *new_on_disk_reftable;
> +
> +                reftable_size =
> +                    ROUND_UP((refblock_index + 1) * REFTABLE_ENTRY_SIZE,
> +                             s->cluster_size) / REFTABLE_ENTRY_SIZE;
> +                new_on_disk_reftable =
> +                    g_try_realloc(on_disk_reftable,
> +                                  reftable_size * REFTABLE_ENTRY_SIZE);
> +                if (!new_on_disk_reftable) {
> +                    res->check_errors++;
> +                    ret = -ENOMEM;
> +                    goto fail;
> +                }
> +                on_disk_reftable = new_on_disk_reftable;
>   
> -        /* If this is apparently the last refblock (for now), try to squeeze the
> -         * reftable in */
> -        if (refblock_index == (*nb_clusters - 1) >> s->refcount_block_bits &&
> -            reftable_offset < 0)
> -        {
> -            uint64_t reftable_clusters = size_to_clusters(s, reftable_size *
> -                                                          REFTABLE_ENTRY_SIZE);
> -            reftable_offset = alloc_clusters_imrt(bs, reftable_clusters,
> -                                                  refcount_table, nb_clusters,
> -                                                  &first_free_cluster);
> -            if (reftable_offset < 0) {
> -                fprintf(stderr, "ERROR allocating reftable: %s\n",
> -                        strerror(-reftable_offset));
> -                res->check_errors++;
> -                ret = reftable_offset;
> -                goto fail;
> +                memset(on_disk_reftable + old_reftable_size, 0,
> +                       (reftable_size - old_reftable_size) *
> +                       REFTABLE_ENTRY_SIZE);
> +
> +                /*
> +                 * The offset we have for the reftable is now no longer valid;
> +                 * this will leak that range, but we can easily fix that by
> +                 * running a leak-fixing check after this rebuild operation
> +                 */
> +                reftable_offset = -1;
> +            } else {
> +                assert(on_disk_reftable);
>               }
> +            on_disk_reftable[refblock_index] = refblock_offset;

only to write back again ?

>           }
>   
>           ret = qcow2_pre_write_overlap_check(bs, 0, refblock_offset,
> @@ -2459,15 +2466,12 @@ write_refblocks:
>       }
>   
>       if (reftable_offset < 0) {

at this point reftable_offset is always -1 now..

Ah not. and now I am a bit close to understanding all of this logic. this thing with "goto write_refblocks" is not obvious

> -        uint64_t post_refblock_start, reftable_clusters;
> +        uint64_t reftable_clusters;
>   
> -        post_refblock_start = ROUND_UP(*nb_clusters, s->refcount_block_size);
>           reftable_clusters =
>               size_to_clusters(s, reftable_size * REFTABLE_ENTRY_SIZE);
> -        /* Not pretty but simple */
> -        if (first_free_cluster < post_refblock_start) {
> -            first_free_cluster = post_refblock_start;
> -        }
> +
> +        first_free_cluster = 0;
>           reftable_offset = alloc_clusters_imrt(bs, reftable_clusters,
>                                                 refcount_table, nb_clusters,
>                                                 &first_free_cluster);
> @@ -2479,6 +2483,10 @@ write_refblocks:
>               goto fail;
>           }
>   
> +        assert(offset_into_cluster(s, reftable_offset) == 0);
> +        first_cluster = reftable_offset / s->cluster_size;
> +        end_cluster = first_cluster + reftable_clusters;
> +
>           goto write_refblocks;

these three lines now looks like a function call in assembler :)

>       }
>   
> 

You didn't ping the series (more than two week old) so, I'm not sure that you are not preparing v2 now.. But I kept it "marked unred" all this time, and several times tried to look at it, and postponed, because I don't familiar with this place of qcow2 driver. And the function looks too difficult. Now finally I think I understand most of the logic that you change. Honestly, I think a bit of refactoring the rebuild_refcount_structure() prior to logic change would make it a lot easier to review..


-- 
Best regards,
Vladimir

