Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D473251C9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:57:12 +0100 (CET)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFI4k-0004p8-TN
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFI39-00041r-Sp; Thu, 25 Feb 2021 09:55:32 -0500
Received: from mail-eopbgr140100.outbound.protection.outlook.com
 ([40.107.14.100]:30439 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFI35-0006rj-TE; Thu, 25 Feb 2021 09:55:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKa70Ha5NrqE+8s3ccvGclB+ENqUjbgF56p3MyS08verpFvIDQeKJtsqEETLCJW5ip/wN0QcNxMpYLXxV5ZHb5R45cNCN2K3mApVkk/Dzpb2UeS1a4KcwhGZvlYH65vHA5lca0u3vcSvYCATdmNy2OGWCM3jIR8UlsyhsEkc8I8JK/2pmQDS+C71j9Ih7cWirXl7VmhlkMfAJI1DxpB9cvx3O4Df0PQyVypzOS5Z8gWie9OkmVZzdfnYDhjZaIRCtSy8oGHFV1FsGouT6w7Uyz2FrstE5Jw8ZB8n4ueAT+QioiGPqEqOBBs06ulN6+KI/mhhbLvhMIhnayQHJCqNxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyu30PNi0//ohCaj6fyOSRfQ042m9TRfSKvj8AtM+04=;
 b=BK/QnXABqb42KXJdix0qboRzCVlnJyJZTqZtXt7ZhGWxHeFBS9beMQ1AMGyVh2vPYtYDZMfhkLXjjN+K0lAlNg5Z/cNWR6URWvdBGWPlVjMVOoySaD9AAD/TLc2Kb0omeVeRkrZOgkHwgqtnXvvdyGT8ofJy33xgBYOhpz2z1OyWHulRTWHKc8oJAsHrNqw1+4GnFS5A1uQsRxYZ36JsKDpPb9NWucfcymfPfpes2bFeGlLdadrqfuzDV4BcxSLJC0LhNj5W2pQka6Wn7iymyLGF8d1/qlX1zgRNmjSWerynlKSR68DV2hGvkXLpFU6WTtTdsKrDFmAOuRbSFkKmaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyu30PNi0//ohCaj6fyOSRfQ042m9TRfSKvj8AtM+04=;
 b=RrySYVAl3YdzggdINE4xrojdS+xoZGySLZv3eZDe6RLLxInKZhlFh4Vs19FDXid8lTmoYM6qxi1vQDlzpiis+3u3+7swvG33QbEAyCi6FqFg63GTTPsSHj/hrWUMCx9vZhF1V6aIJ3HMuUiBzcrHrQG2zb5uaJZULS6s2PfoJxc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5445.eurprd08.prod.outlook.com (2603:10a6:20b:10d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Thu, 25 Feb
 2021 14:55:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 14:55:24 +0000
Subject: Re: [PATCH 2/5] block: Fix BDRV_BLOCK_RAW status to honor alignment
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <20210218201528.127099-1-eblake@redhat.com>
 <20210218201528.127099-3-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <35c70ab7-e536-9893-9575-a471e19497ec@virtuozzo.com>
Date: Thu, 25 Feb 2021 17:55:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210218201528.127099-3-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR05CA0152.eurprd05.prod.outlook.com
 (2603:10a6:7:28::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 HE1PR05CA0152.eurprd05.prod.outlook.com (2603:10a6:7:28::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 14:55:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dce8003f-07b4-4f85-5271-08d8d99d6153
X-MS-TrafficTypeDiagnostic: AM7PR08MB5445:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5445C0EED532990545433497C19E9@AM7PR08MB5445.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xiNwspQEad5maOgGZUeDeXcPH/YSHlng9OITwkh30xh1xeP6Z0Q1owTL+QC34CpXypJjz/bWSsp51MzGm1uPTeqgznOlxV9NIDHW/1iqvV9zfy5aZvojiRX66EJecsdxONj4WORVRvhO2sJFZ1P6mIId0kCxrAsib6UyTh9xlajFRkUD1KQMKWeJayS4w7WZfCspmZjsih4DhQMV2xs4HqGylNEvyBmXiJw/wNoF9qa1Yv4+6DfBtVrKQJFcaxrzn4HuAYfpjl5KBaDA6WsIgSwkwRzSkUZ1g2rjl4kWrJa2vNQ2Hwx+NPsclQ0rhVzsVQr1mqxU9fci7sqn1I8yPpt8KSvriR3+mmTcneYCf4kJiFY5+pUq5CowMM3uAlLDkJkZXh//EhObzZJP9Lgr9Vkg5Z9jKz8Qo0V/LRBMEZl5P2VuRKeKdj/x3d6P59ddP2yVeGtj9BK/gXnr00bd+xl3ATiX30FC1DAKvEz1qRxTV9XHcmSBbo2Onfdh3nuiw6v1ECL8bi0v1qhAyG55yA05hf1y2cDsEmdWbxzPejBm9Zp01GUByoaOxpkvWcuV72gZ1X8LDMGwQ+aMpQzeXgleqUn6l8Gscd+YkY5zULs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39840400004)(366004)(956004)(54906003)(26005)(31696002)(83380400001)(66946007)(4326008)(2906002)(6486002)(478600001)(66556008)(16526019)(16576012)(31686004)(316002)(86362001)(5660300002)(2616005)(186003)(52116002)(8936002)(8676002)(36756003)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UUovVG5nMlZ1MjdRR1gvZlI2YUlaL3EvbTVNUTUxNC9SWTlRZlRnTDg2OFBs?=
 =?utf-8?B?aCtJV2J0ZmpEcFp0WTVFYUVMRHNka1AzR0t5Ylg5cjIwZEYvbGtHdEp6UGIz?=
 =?utf-8?B?bFd5MENhV3RDZmRuQUlMQTVwdnlhUG14RWlOYmhlNmFaSCsyMTBYL25XM2Ey?=
 =?utf-8?B?YjhjMEhmTWZIUzJJWUs3RDB3ZklMNmR2dFhnVHB3QXVrVlg2Z0J0NUhhWGlL?=
 =?utf-8?B?akJGcUdDRERqOXNZQWh6NmlQdWg3MHo5VEg0SWQ4MkptaDV2WXVXd3VPWUJx?=
 =?utf-8?B?MW40YmI3VDJPbUtBQyt4STFwL3lpMW41WUlDQVR2bWlFOTIyOW1YN3pVSWdG?=
 =?utf-8?B?cEQrQ1hVcmRJQlZDSkl0d0R5MjhhT0dmZVVzTXpBcDJCdEVzeDhtc1FMR2lS?=
 =?utf-8?B?TldxMW5la2pmVlJueExhUFA5UmtTOGVnU3puZlJwVkk2UFVmRi94eEtHSXNH?=
 =?utf-8?B?d0NkcXZ3dkZXMWdobDRBbUQ5V2ZZbVgvem1NMUJTaHNZVFdYak9QakZKSnpR?=
 =?utf-8?B?N3FubTlwYmhtT1VUamlJVVg5czYxWXduZGF1RmIyQmhIVXJ0L1BxUWpQUUFO?=
 =?utf-8?B?bjI1QXVEbmVBVzRrZ1h2T2xUWGNuY21MYWx4YWJ0VlRPd3NoYWlKS3VMaDJ4?=
 =?utf-8?B?N1hMWEQwSHlLSFhobUdZajc3VGJSVVRPOFZORDJrVGQrdjNVWlowVStoQ3JM?=
 =?utf-8?B?VmJEa1ZHM2VZMUJ5c2VIeG5tQlBDdTExSnl1VVk5R01NK3F2LzNPUjlia1dv?=
 =?utf-8?B?Znh5OFJpbW9uU0VSaDhoSWNIOGZrYkl0M1AxcEJYdHdaVTc0NCs4b0JhR2Fo?=
 =?utf-8?B?U2tNUTZKWW1yMm0vYWJiSFhBUTZRZk5UN3lhZ0RiOVRxZEVSNExSbnd4Zmo0?=
 =?utf-8?B?NEVCcHVya2RqVDNiRHRLNUFKQkw2ZDBXYUU1emRHRFFNSndWOFlRRy9iTGV3?=
 =?utf-8?B?TTVzeE45emxIMUYyVmEyYWJxeWlmQUJ3ZityalY0OWxFM2E2cEtUZjN0WVox?=
 =?utf-8?B?d3BzcC94ZzhZUk1zcmp3VGRJa05xUmJJSUFyN0tzUGRYUDd5amZGSTh2ZEVX?=
 =?utf-8?B?S0pzVnJtZ0svZDU1QXpMRjU4ZnR2RUhLcXdmck5ldDBtTnlYank3dkRTeUI3?=
 =?utf-8?B?NmJKVjVmUGQ3L25sRGU5c25TTUFtYlBuTDM5cml5Uys5dU9HRWRXYk5ROFZw?=
 =?utf-8?B?Y0ZZV0d5RWtXb0k2a2VZWmNOcktBVzkvWEJPN2VBSzRMVEdhQXA4ZU9iaGxy?=
 =?utf-8?B?Ynk1ZmczMS85eFZQN2t0QlFONW5wODJSMEpKRFIwZzZxUS9iVTJQMmlpNWE3?=
 =?utf-8?B?Q2JHdlhoWHpNenpCV0MwYVpZZm1CRFlyV3pra1RoTDdtRUgrVElnQUg2Nkox?=
 =?utf-8?B?UFVKaWRBWVVFZng0Y1hNUWFwM29lQjc0QWxlYUszeFhCRVIway91MnZXWW04?=
 =?utf-8?B?S3E1QWxQek9WVHloRlQ3dW9KcVQydVNlbDlRVzZ3MUtqQ1NGR1JZS0FjcWhX?=
 =?utf-8?B?Z2h0U0dva1MvMjFNTCtITlo1cmQ0R3FqTlNSbzFqWGpoNVpwTC96bHJuRXQy?=
 =?utf-8?B?Q0xydjZqWG1qYm51RmtCakVZTktjYXV0WG0xMmVocnl4NS9sUzlBUzNJUXpw?=
 =?utf-8?B?U3YrQzFYL0w5ekZzZ0hZWEt6Rzk1U2d3QjJkVjM4aklBZUpOQy9LQ0RXZnA1?=
 =?utf-8?B?NUxCRjJyRThJQmlyNW93SGFWcTBnbWRJaFRiNmpmeDRRa0I1NUp3eHB5UWRY?=
 =?utf-8?Q?bP5ui5/GYq4inubMJNKlA1eHemNK2PUrDE+28Dh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce8003f-07b4-4f85-5271-08d8d99d6153
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 14:55:24.1009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlPVvo/40JtWIP3zCxV1LJOVGcsZfDNfCDZU+mw7segRz9W5l9Kmpy54MROFbxKcL9YGH5NEyJK5/BZa6Z7Ou+cmOkxo7I7M8DjkFUijZko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5445
Received-SPF: pass client-ip=40.107.14.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7,
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

18.02.2021 23:15, Eric Blake wrote:
> Previous patches mentioned how the blkdebug filter driver demonstrates
> a bug present in our NBD server (for example, commit b0245d64); the
> bug is also present with the raw format driver when probing
> occurs. Basically, if we specify a particular alignment > 1, but defer
> the actual block status to the underlying file, and the underlying
> file has a smaller alignment, then the use of BDRV_BLOCK_RAW to defer
> to the underlying file can end up with status split at an alignment
> unacceptable to our layer.  Many callers don't care, but NBD does - it
> is a violation of the NBD protocol to send status or read results
> split on an unaligned boundary (in 737d3f5244, we taught our 4.0
> client to be tolerant of such violations because the problem was even
> more pronounced with qemu 3.1 as server; but we still need to fix our
> server for the sake of other stricter clients).
> 
> This patch lays the groundwork - it adjusts bdrv_block_status to
> ensure that any time one layer defers to another via BDRV_BLOCK_RAW,
> the deferral is either truncated down to an aligned boundary, or
> multiple sub-aligned requests are coalesced into a single
> representative answer (using an implicit hole beyond EOF as
> needed). Iotest 241 exposes the effect (when format probing occurred,
> we don't want block status to subdivide the initial sector, and thus
> not any other sector either). Similarly, iotest 221 is a good
> candidate to amend to specifically track the effects; a change to a
> hole at EOF is not visible if an upper layer does not want alignment
> smaller than 512. However, this patch alone is not a complete fix - it
> is still possible to have an active layer with large alignment
> constraints backed by another layer with smaller constraints; so the
> next patch will complete the task.
> 
> In particular, the next patch will introduce some mutual recursion
> (bdrv_co_common_block_status_above will call this new function rather
> than directly into bdrv_co_block_status), so some conditions added
> here (such as a NULL pointer for map or handling a length-0 request)
> are not reachable until that point.
> 
> There is one interesting corner case: prior to this patch, ALLOCATED
> was never returned without either DATA or ZERO also set. But now, if
> we have two subregions where the first reports status 0 (not
> allocated), and the second reports ZERO|ALLOCATED but not DATA
> (preallocated, read sees zero but underlying file has indeterminate
> contents), then we can end up with a result of just
> ALLOCATED. However, looking at callers of bdrv_is_allocated does not
> find any problem with this new return value. What's more, this
> situation doesn't really happen until the next patch adds support for
> getting aligned status from backing files (as the use of aligned
> status in this patch tends to be limited to just the protocol child of
> a format driver, yet protocol drivers tend to report fully allocated,
> and only format drivers have unallocated clusters that defer to a
> backing file in the first place).
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   block/io.c                 | 142 +++++++++++++++++++++++++++++++++++--
>   tests/qemu-iotests/221     |  13 ++++
>   tests/qemu-iotests/221.out |   9 +++
>   tests/qemu-iotests/241.out |   3 +-
>   4 files changed, 161 insertions(+), 6 deletions(-)
> 
> diff --git a/block/io.c b/block/io.c
> index ca2dca30070e..4bca775c96b4 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -2325,6 +2325,132 @@ int bdrv_flush_all(void)
>       return result;
>   }
> 
> +static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
> +                                             bool want_zero,
> +                                             int64_t offset, int64_t bytes,
> +                                             int64_t *pnum, int64_t *map,
> +                                             BlockDriverState **file);
> +
> +/*
> + * Returns an aligned allocation status of the specified disk region.
> + *
> + * Wrapper around bdrv_co_block_status() which requires the initial
> + * @offset and @count to be aligned to @align (must be power of 2),
> + * and guarantees the resulting @pnum will also be aligned; this may
> + * require piecing together multiple sub-aligned queries into an
> + * appropriate coalesced answer, as follows:
> + *
> + * - BDRV_BLOCK_DATA is set if the flag is set for at least one subregion
> + * - BDRV_BLOCK_ZERO is set only if the flag is set for all subregions
> + * - BDRV_BLOCK_OFFSET_VALID is set only if all subregions are contiguous
> + *   from the same file (@map and @file are then from the first subregion)
> + * - BDRV_BLOCK_ALLOCATED is set if the flag is set for at least one subregion

Hmm about this..

We already have mess around ALLOCATED:

  [1] for format drivers it means that "read is handled by this layer, not by backing", i.e. data (or zero) is placed exactly on that layer of backing-chain

  [2] for protocol drivers it's up to the driver, which may always report ALLOCATED (being more compatible with format drivers) or it may sometimes return UNALLOCATED to show that data is not allocated in FS..

And this way, bdrv_co_block_status_aligned() is compatible with protocol drivers but not with format drivers (as you can't combine "go-to-backing" information of several flags, as for some scenarios it's safer to consider the whole region ALLOCATED and for another it's safer to consider it UNALLOCATED.

For example for stream target it's safer to consider target block UNALLOCATED and do extra copy-on-read operation. And for stream base it's safer to consider block ALLOCATED (and again do extra copying, not missing something significant).


I think, to avoid increasing of the mess, we should first split [1] from [2] somehow..
Assume we change it to BDRV_BLOCK_PROTOCOL_ALLOCATED and BDRV_BLOCK_GO_TO_BACKING.

Then, for BDRV_BLOCK_PROTOCOL_ALLOCATED we probably can just report BDRV_BLOCK_PROTOCOL_ALLOCATED if at least one of extents reports BDRV_BLOCK_PROTOCOL_ALLOCATED. (probably we don't need BDRV_BLOCK_PROTOCOL_ALLOCATED at all and can drop this logic)

But for BDRV_BLOCK_GO_TO_BACKING we'll have to also add BDRV_BLOCK_GO_TO_BACKING_VALID and report

  * BDRV_BLOCK_GO_TO_BACKING | BDRV_BLOCK_GO_TO_BACKING_VALID if all extents report BDRV_BLOCK_GO_TO_BACKING
  
  * BDRV_BLOCK_GO_TO_BACKING if all extents report no BDRV_BLOCK_GO_TO_BACKING

  * <nothing> if some extents report BDRV_BLOCK_GO_TO_BACKING but others not.


Hmm.. And, I think that there is a problem is in NBD protocol. Actually, with allocation-depth context we started to report internal layers of backing chain. And if we have layers with different request-alignment it's not correct to report allocation-depth "aligned" to top image request-alignment.. So, for allocation-depth to work correctly we should extend NBD protocol to allow unaligned chunks in BLOCK_STATUS report.

So, finally:

1. making bitmap export extents aligned is a separate simple thing - that's OK

2. making base:allocation aligned is possible due to good NBD_STATE_HOLE definition. So for it it's correct to combine BDRV_BLOCK_ALLOCATED as you do even keeping in mind format layers. We call block_status_above for the whole chain. ALLOCATED=0 only if all format layers refer to backing and bottom protocol driver(if exists) reports "unallocated in FS" so that correspond to

"If an extent is marked with NBD_STATE_HOLE at that context, this means that the given extent is not allocated in the backend storage, and that writing to the extent MAY result in the NBD_ENOSPC error"

    And this way, I'd prefer to fix exactly base:allocation context handling in nbd-server not touching generic block_status which already has enough mess.

3. fixing qemu:allocation-depth I think is impossible without allowing unaligned chunks in NBD spec (really, why we should restrict all possible metadata contexts so hard?) Or, if we are still going to align allocation-depth results to top layer request-alignment we should change allocation-depth specification so that that's not "actual allocation depth" but something >= than actual allocation depth of all subchunks... And that becomes useless.

-- 
Best regards,
Vladimir

