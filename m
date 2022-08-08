Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4552958C8D5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:58:18 +0200 (CEST)
Received: from localhost ([::1]:58104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2Kn-0001N0-Ac
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oL26e-0000Tq-3o; Mon, 08 Aug 2022 08:43:40 -0400
Received: from mail-eopbgr80105.outbound.protection.outlook.com
 ([40.107.8.105]:61412 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oL26Z-0007Cq-QK; Mon, 08 Aug 2022 08:43:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiwxmgrKkwe5zls70EF2jkH/OqW8igpIkFaC5WywVfXrSKzR+f+wJzONcUicn1az5DINzU3Bt0UPx7D+ZX4Dkpi33M84tuN1kQV9nXXm/pO0V7/fsM4n34rsq7HCApEEmoO/P6/D2T1FJWpT4jv8sKSMlxq+VzzDxu13QjHn+0xncwcHOrFVQpQ/zeL7neH89kQJn09AMpiXEeJTHpU8PtASqlAa+yM47QxNeQTQnPdsl1j/N7NB7+bnX5sKVudR/Cd5ovYkzVd2jVcIkAu4Q11890MXqUl9vXPnDTsnyCNXPh0DwJflaRVZwRw7AjwXjJTMbYoRBKTL7UB8aEBfgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soWTqdYp/tQA5DC7k2AQH3CwTgbFuAsjV+3Zlwv5TRY=;
 b=d/cKYhbGRw0pf5L2rhstLPL3QvKO+//kAJCZM67eeg7kLWGMbNg7Tdxk4J5mZkNOxaPPSHRaWjmdLUAewGqf3BLDKmN0a7pHsSLKmDnpEcymRLHWIa4QQj8ap7+lywbgat+AOUfFqrEhxwOi2P62HC6y6VIyX81Vm3FU04AmqWZMGLvVT+VNcuGgCzmj/NiKw/bKGynwhNWUwwu/gBRoNqrMCfgRLXtr/+0tbgCPxw/6Nyg+ZtgW80e/XhwCSQtPTJAUhnGg9o/9M+ggVC4hyT0bhdFwxyj5HVryuHff+EsR0tBhLAEBlq6SyvNyavsqVZWGkPC5sqOt4KZguuIftg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soWTqdYp/tQA5DC7k2AQH3CwTgbFuAsjV+3Zlwv5TRY=;
 b=KWe7GnnmCO0xLtKFaafQK+1H924wnyV9UbXLdbfqkdHPvpACvezLKIouYvc1UBY0U6ZsXVikxVbIKoDQpn0PbKaVjMcFBynN5ZnfktHXNE4dmBPzmbnN487mb8Gz4acyMstLUk76WtZMbCPq9e5nnceBgb8dn3lWfm0n18GdiQapKfWKLJo2eAI2io4WSgdrO5biW65VOBvTL5JKBTJWDBhOKtuJSR84t1s9EcnRrm/Bq1ed2ckAhP0AOLa6wdd7LxqCKvfa04sjgaQB8FBS80l5NlkSWnOHK7QDpWQ0/XG+5+W0hOVIh6v9iHoG8YinrwJiIEAuYkzmzAPX0eC/BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VI1PR08MB3309.eurprd08.prod.outlook.com (2603:10a6:803:41::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 12:43:30 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:43:30 +0000
Message-ID: <fada26ab-76ad-4b0a-5d6d-bddfdfcdb241@virtuozzo.com>
Date: Mon, 8 Aug 2022 14:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 7/9] parallels: Out of image offset in BAT leads to image
 inflation
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
 <20220808120734.1168314-8-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220808120734.1168314-8-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0114.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::16) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e2c8e30-6136-4b71-e4c3-08da793b992f
X-MS-TrafficTypeDiagnostic: VI1PR08MB3309:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A8TTUU4hLwuS2dzcdRB8g30THN+4VAS7gpmAZShAuOrwxVW1++caMulZ3HhlwHJwrbKmEQsVVbcYl5hihwFZKvWidlhcRtOyJ7oWzVd3Sm+IQzxQXnwqRd3y72mE+IQN9aRa7IwqC/swnprjPmvY+y10jBExpnc4Z3on42Z7FsL1ZWCLGjgP0ybYD83AgCfbca4DPhHggSXfdKPlWNDODxxB4F3NuSIcWDEZF0CEkVVZJgEP2dRtevSHPaNfC7r84TTtHShIUirX0/8bfi7fVk3gkIGrB4bEufgBnAnlsyb4l3I7NNmRuPOoAMVlYo+X0b2huV3PradckmvfHvKIJOCS0rKThaJNBNp42qAhFxEMoEgiN0zwAxq/79fWKAkFix8bXeyAwvFLm1TF/XtHp8PjyYcYn7YvJOyO5g3Rx4xdwa0sPuEwS5+sjnC4yi74dh+FAylabBHRh2L0spzL0qtSE7VZXAfxwsqJIzTMlt5tDgOweY79RN+c1YO69InB/Aveic5mcNn3P3iOPHjiZ/GJTcXS6A2D71M2b3vTkRNkQEUOAmd3b3DM3S69uLQjwtlcp2zfF7ElFVpVMTXU09qW4qRVyuW+8eQ1QrWWRnyMHlfUGnivGsVG6wLfDhmmkgDsi61BB48X21jJK0jkQedjRyJWYh33GGwyjmZrQ03i+5VU5DVJQWNazuBnjA0G2xFgcYLEmZm1wG/89//SZYiqHCYI6T+8StT/t/nkN+uq+W/kF6jJ4o+klpT/+5n0moYDAW0QK/8xLOel72s28EOkLgO2E5kY6kM3knwWD3e8ks1A7m2xiMowwiwz8lk4Aq75jkIxJ1j+RjdM13Rt/PMS1iYkx8DrUpsFYNd89Wo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(366004)(396003)(136003)(39840400004)(41300700001)(31696002)(86362001)(52116002)(6512007)(53546011)(6506007)(26005)(38100700002)(38350700002)(83380400001)(2616005)(186003)(4326008)(66476007)(66556008)(8676002)(66946007)(36756003)(5660300002)(2906002)(8936002)(31686004)(6486002)(478600001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE1SVU9JZisraUlZSzZEaTliTFlmUDNjUWE5MWVKVVRYUWpqR1hQbHNXVzVZ?=
 =?utf-8?B?cVFlQUpVQkxiSnVLZ0lKOGRIMWtYMThvM1FRRnR4dzlleGViMVQ5YVB0QzFB?=
 =?utf-8?B?a29vak9mL0IvRnBEanBjenM1OWtGclUydmZDbnhNRjVHQ2Y4TG5SaFFJMEFD?=
 =?utf-8?B?OVRQcHpvNTlSeE5pcFpDNWVPL3NDNDBEMk9TWlI5alVNTEMxWjNUbmtJUDc1?=
 =?utf-8?B?UmFqT0E3UUUwZ3hZQVNNTTA0Y3RwVDUvSGJZTVZJY0ltQ2I2UHpoZStETE9I?=
 =?utf-8?B?VzFnODVwOU9IR2k1bDRVYnlGYmFpTmlOWlYvTHBuL2pINENEbWtsOU9UM1Yw?=
 =?utf-8?B?NWN2YVNhMk1sQks1LzRzbWpvaFhKKzRWMzk5clQrbmFDRlR6dExKa0xZZFQz?=
 =?utf-8?B?bEhoUzRzb2s1VXlTcTNQaE9IcUNKdXhHOExlMXUzQmN0TXk2ajE5K1dXVjVM?=
 =?utf-8?B?bmRBanZySzJwcW5rVlZ3YUxOS2xHdUVzMjhiMHdSUHB6RVBwYUhpVFNQSEZw?=
 =?utf-8?B?UGpuWmxDTFRmbk5IT2k5VWRicVpRdHR0NGZxby94ZkRtUGpYVXU5WEpNU1lu?=
 =?utf-8?B?a1BmaEJDeVJJMGNnNlZkM3dxdGQzVTZSS1drZEd0MHVMOXFYU2ZUUjcxZDh0?=
 =?utf-8?B?MnltdldpWkRlR3hQRkJDejk5ejRsZEk5VzhuSmhCR1hPRWhia1p4YUZNVDhn?=
 =?utf-8?B?QmdpUmpUTWo5a0YzRWFBQ1FUUWVoL05yZjQ1UXlzZVN2cnFOV1B1U3poeS9M?=
 =?utf-8?B?ZVBIUEtxalNFYmF6c0lkU1RpVExIbTh0QkVUU1pzL29mNFNCTVUvcjBXNUMx?=
 =?utf-8?B?SDVlSGR6VTF1THJhU2l3U3BpdmFHcFFseXVMSzZUM2lLdFl4WG16dlVkMFNF?=
 =?utf-8?B?WWlRbzkrZ0w5M3hGWVkwaDFRWVZCbDBZV3krRHVnUUphVld1L3daREtaa20r?=
 =?utf-8?B?Um9UYWZ6YlBvVDZiQ2E1V3IyZUdqWVAyaEIyblFyTFpBOHczUUFTK0lqZ0lC?=
 =?utf-8?B?b0pNZU9aOURYWjlHZXZMSlFVTTNHMlRZbXJQRlU0Y1RGcG9ScmpMa3BDTHVW?=
 =?utf-8?B?NnAwbVJqNkRRNWMxbjMyTUVFcTRDSW85RnZrZk01UzY1cGxGYzd5Y25SZUtM?=
 =?utf-8?B?ZE5ub25yS3ZkWStxNU50azlVY1BVZDlRZjFjaWdwOHpGQnBaUnFjOFQwYkN0?=
 =?utf-8?B?dWg3alZwZG1BMk5pejZJSnp6M1V2dDB6Vks2aysrRm9yOFVUUVVUWTJsSXUx?=
 =?utf-8?B?UGUxTWk1UDltcXV0bkxpY0l5RHFMVGdvcnN1L2xaV3JXQVZxUGp6NjZtdmE2?=
 =?utf-8?B?SWk4WXhaUHVXQXNxZzV3TlNLOEVrUTY3R0FXMjE5T2p1c2xSZVNjTUgvUlEx?=
 =?utf-8?B?cDMxWjZ6YVVhOEUzeFprQWo3VWxoOHo3QWoyNC9YRTBoQXNBOStmK3dUZ1NK?=
 =?utf-8?B?K3BxSjQyV1ZSRGJUdHFXblduREI5UWJybnJQdXkzQjNRRmlCK0txOXloQ05F?=
 =?utf-8?B?QzZGM3BSbEVqSTZ1anRNSzhMM0VPVGhDMmNNeEx1T2JmektDbnBsL2UvR3dP?=
 =?utf-8?B?Tm9sY1NWNzg1NXc4MndzbXZsa2hCdnFrRUxKTk1iQXBTWXpJejJFc0M2WGJr?=
 =?utf-8?B?bERyVTJGT1Q3VzJQNFdKUjlyMHFtYUM1UGtMb29NTVFUWGZLU1BoWk1OVExF?=
 =?utf-8?B?SzFEREgwZm5sV3pCK2pNWlBRMjUreUllM2RSK0xhTDZTZTkzMkx6cEpkT2l3?=
 =?utf-8?B?S2pVMEtFa0dTd1NLZEQvVlN3OWZnS0xZdXFuVlZma2Zkcy9ISmdDbjVPSWxS?=
 =?utf-8?B?b3lacVJDWnBSWEFkRkcxSnBzTmhjVW94S09EWHgrcFJzOEZsR2xUaExieXcy?=
 =?utf-8?B?NytVSTgxY05IemdqdHdJVmdaRVlMT2lpSUlraG1ER0JONHlYa2FpOGlLbkU2?=
 =?utf-8?B?ZEJGU2VpWVZ5WkJFdU5UV1M5QUorN0xOUks2Z2VlSlltdSt4cXJzRWxGVjNs?=
 =?utf-8?B?bjEwU3Z6RlRsRDJFV2c0SzdlbElUY3N3bmtVQmhOaFpiMGZibVBZVk9jUk85?=
 =?utf-8?B?Wm9oOHlmSEdDOFJrZXdXelRMZDFvUzJqZE5KS2o0WWlNZldwNFY5REl6VlUv?=
 =?utf-8?Q?hYgZ4L88/vIhjg0BjLywl5dWZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2c8e30-6136-4b71-e4c3-08da793b992f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:43:30.7524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2BSuQd0IL06YaSFxLLFOpKgrqaNqqkUf8r/Qfzq4zpJzsz8vUDVN9ifJ+tDg65r95HQOVmO5tPfUebyEzYVlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3309
Received-SPF: pass client-ip=40.107.8.105; envelope-from=den@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

On 08.08.2022 14:07, Alexander Ivanov wrote:
> When an image is opened, data_end field in BDRVParallelsState
> is setted as the biggest offset in the BAT plus cluster size.
> If there is a corrupted offset pointing outside the image,
> the image size increase accordingly. It potentially leads
> to attempts to create a file size of petabytes.
>
> Set the data_end field with the original file size if the image
> was opened for checking and repairing purposes or raise an error.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 3cb5452613..72cf7499c1 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -811,6 +811,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>       BDRVParallelsState *s = bs->opaque;
>       ParallelsHeader ph;
>       int ret, size, i;
> +    int64_t file_size;
>       QemuOpts *opts = NULL;
>       Error *local_err = NULL;
>       char *buf;
> @@ -890,6 +891,22 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>           }
>       }
>   
> +    file_size = bdrv_getlength(bs->file->bs);
> +    if (file_size < 0) {
> +        goto fail;
> +    }
> +
> +    file_size >>= BDRV_SECTOR_BITS;
> +    if (s->data_end > file_size) {
> +        if (flags & BDRV_O_CHECK) {
> +            s->data_end = file_size;
> +        } else {
> +            error_setg(errp, "parallels: Offset in BAT is out of image");
> +            ret = -EINVAL;
> +            goto fail;
> +        }
> +    }
> +
>       if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
>           /* Image was not closed correctly. The check is mandatory */
>           s->header_unclean = true;

for me it would be more logical to have this check inside the loop,
calculating data_offset. Though this is personal.

