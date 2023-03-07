Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C136AD98F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 09:50:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZT0z-0007ic-EA; Tue, 07 Mar 2023 03:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pZT0x-0007fL-M7
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 03:49:43 -0500
Received: from mail-dm6nam12on20600.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::600]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pZT0v-0004FE-8E
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 03:49:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Il0t/ytLTHWyMF6A21haQ7SBY8exJ3rhGzki75rGDos9dP5hypLn8CQkX5sD1k/BC5zXeQDvU9fZp4dfU2qqnGAilPIGNNn1edQE8Cg26LSKLgBNWzai+H+sT+AMRefoheeoaeAxQsVaiibpesqQ7uj5PBcE41STt3YNLLP9kg9ED/JwOyIgoXh+FJloi6ht+tcZA+RV9SKPgXQIDUvWCom5pdAe8THlDq3ZLoHQ2H6515Wz8NG4nG94NHQpRosTdALeNVQwfr6kkBV6EF8STZiRE0Zci9JlYDk+KkUf8OtyL3T2NUwvbdPxlqUwdTQBRY1W0vf3SlOwcUf5p5VHeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxyVf6d1YOnwecLavc4QYZgpAKYcalVCm19HeYHHyV4=;
 b=Fehvu8wieeVaf893zeZjXNzXqAC5D5zJU2EFs3QPPPbIlBToSgKgoV8JDjXaATHwnRIVaZ5DaoMJtEmG4cKuYSjLaRxMODz4D1JeczG/7vaKQs4XbSAi7KTq+qiUYNvvcwqjhld5WU8k8pNcDOjfvuIvpMPj1/5C1m+pzatWJHmSBGYVbRoC66xGQrjr8OgcmthMz6fI0/WTkPART+Rtr8Dj/0mlKZzp15YWux2+CTy6jxj7KRur4NSCqu81y+cEvk7gN2x6mlENa+X10FAR39sq+dQlbTmmvG63kGfX3HBd4bpdWeunGIOXCeSrfh6ZA0mtl0Aqtj0cZk6b8oUEGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxyVf6d1YOnwecLavc4QYZgpAKYcalVCm19HeYHHyV4=;
 b=tX/WEaVCMN2BFGL2SAvT/DB93A88qZIYdXVb5ffzaI1WbZfkG+3BguIbrQ8NFi5gsELfvbjVmMLluetLsv2pXNqRARlVoAQw8eo4xSaqIQN3yuBWD+14qgGRGkJSVTvUc9MxUEe/zn3DS5woYTxX0Y8Pd85RX5ALf4sYqBK8nSz31MLD07QZD9p6Lo7KoU7nK6SP8pOpa+O6EEWn+g2BH4kOAr3hNHnAXirD0isEg7ZyLwuZIcbKXGee9L0ZGJ90XhBA3F9HaINwwDzOw3f4TBKiw+wf9KunEuf2vgukES8lJ3ER4aPgoHJTOjmJyngK2WOq34NOq7NM/kVmTGraZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by PH7PR12MB7305.namprd12.prod.outlook.com (2603:10b6:510:209::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 08:49:35 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::423c:5fb4:a0f0:e918]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::423c:5fb4:a0f0:e918%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 08:49:35 +0000
Message-ID: <e8c79254-2c28-4311-9c75-559c2d6e33d7@nvidia.com>
Date: Tue, 7 Mar 2023 10:49:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 04/14] vfio/common: Add VFIOBitmap and alloc function
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-5-joao.m.martins@oracle.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230307020258.58215-5-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0428.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::32) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB5544:EE_|PH7PR12MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: d2af6609-0499-48f0-a730-08db1ee8e07f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cyj4RnHTkoG8Uc9UvetoKpvWIOQRdSLS5o1xCDChs8NVaxsEDFpAeCQAn0dxURgcr0a8B9RoldzaoFtHjpI1y8wbBcaa+YCa+cq2jKh3JU4yA83+z/sYPcEPK8Gp4EkYRy0dYyl2TraF62EW/0JG5XrbqUpaaWRlEJjdyjLnlM/yzL7aGGsHqV+2qECCYSLczdcXU7AzvUvzp3VSbDduPaecPJCvfWEDi+y9WJ4K8AwdtQ5fwxKkCXiuQcltwaTBo00/GoOpAge42U2IofK3qV4U0TYGqoOwMCznavfWqxxrMoVsx0IeAi1eRWoCufgLbf1lZf2JwgVQKQI5IbQZnUsuyTnkKy/FoYxgjLDh8xBmAboJx3cUJ4eVbufVEj7NiYrUXpb8fiYhyE7Sfy316QTiOOEpq0qJ6Lf1aSiMi86D9eAil8L1sWI9WknOn+6h8uMCWe2lsy5vraT2ndzN7NmIsdPpNGSJIEsN+678+dtpuBp3fWAWIbj+nhrTnlrWAvTRdn4IUYfmUbnHwAcTnSbz+FVOqwD4QCvHPCqh84Kh772KmCien7xgBVFb27vY3Soe98/wVegFr8seKwifkQefdbqw/9mDUlzkAxEkaY7EGO2De/c1tUM0B7MHL+jC2RGsWQLmKmOEk/zedrjvIthQGXHBW3vVWq0h4g798li2YqtPrApozvteOP6WhlOnS4JwaIG1h12uNhsU6hm0Qo8jQN4GlfFTrQNkRizRhjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199018)(31686004)(107886003)(36756003)(4326008)(41300700001)(66946007)(66556008)(8676002)(8936002)(6506007)(5660300002)(2906002)(6666004)(86362001)(31696002)(38100700002)(66476007)(26005)(6486002)(54906003)(316002)(478600001)(6512007)(83380400001)(2616005)(186003)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emQrcUhTbUExTG5lSnVGcFRHREk3TDNJbzNpVTdyWlNYWE9ZVzFLNS92T0VW?=
 =?utf-8?B?Mk9Xc1FobHFlck9ZbEdHeSt5OHFBdVJBb0RRMDNBb1dOUEFxNVlNQjdUcllC?=
 =?utf-8?B?cWQ0NEpjWE1mNHpYZEF0MWVHTVJsNFdxRkJSMEczZFhtU2orNUhCamNGeFk2?=
 =?utf-8?B?VzdtVzZScXNnOWRJeXF0MlFKUHM2eUdBTUtiSkR6dzBnU1NmVTdUejhXWlpw?=
 =?utf-8?B?ZWFhYzRBS3U1eGVoWmd3RURrZVBCSGt0OEdRL2YvdkQ0WWZvaHFQRGFrSVgv?=
 =?utf-8?B?Q29nZDhiUk0vWmY3S0x6MTk0Zm1uZHBjblZVc0tEaWxiNFRuY0RzQk1FdE94?=
 =?utf-8?B?UVc2amFzOXNZMHdIT3ZtNW1rRm5rbnNtVUFRZ0ljb1FtUDN2VWx2Q1hTM0ds?=
 =?utf-8?B?QUZYN250Z2ZKMzk4VmdOQnNydGlIN0lybUM3bkRUaFhhWld4cjJIZzgzZHJ2?=
 =?utf-8?B?anJ0bWdCSlVhdy9YazFuWmZmZGJMMUFjdzNQMXQxamU1MWhqcUN6enhGc0x5?=
 =?utf-8?B?bFFFbzljUG5DQ2NqTHBvM2QybitNaXpTbDJXRmJiOVlPL0lNOHNLUi9FalRW?=
 =?utf-8?B?K0VRTTkxbkpLeUdiaXRUQWdJZitrdUowQ0lkdUZ3VnZvNVVBUVhNY1J6UERT?=
 =?utf-8?B?SjZvN0JNM0NFTnNlaGN0Vjh5dzU4ek05Nlp6Ri9jMGRNdFp1cGFuemNBazNq?=
 =?utf-8?B?dVFCQ1l4d0twUWNVZjl3dGlvNG81UVlwc2QycHpTZm9uQWcxdmNmOVRVWGNl?=
 =?utf-8?B?TFd6d1ErT3FlenpSZnFKNytCaFVkSUZ5QUh5aHpoTUpXTmYxOFV1dGpZMVN5?=
 =?utf-8?B?VUhqM1lDTDVwOGVHNnVaL21uK0VBZkczZWtoSnlNTkgrbXpQbVk2TjhzWUhq?=
 =?utf-8?B?M0d3R1NHZTZGMnhMRlV2dXJkN0Y4dmhxSXBYYmltRWlwRUhRRHI2MFVXdmJD?=
 =?utf-8?B?cTNORW9TZEo0djc4MjJEaXNLb2FMcVBkY3phM1N0TEN4ME9FeWFxUzh3eXov?=
 =?utf-8?B?NzNHQ2NlVW4rczBqOVB5V0FnblYwQlVMMXNkUFpNc3JNVGp1RTVFL3BLbGd6?=
 =?utf-8?B?QUYyQUNaZ05qcjNvVDBDVmdRWFY2enV5R204Z3BFR0svZFpLRlgyK25pK0U0?=
 =?utf-8?B?NXlFUWRONmE0YitWRHJYWVRvelczWGkrdU9BclNvc1h6ZnZoNHNNMDIxbjA4?=
 =?utf-8?B?ZE1yQU9FZzRqNnRkZHI1MEdKelRlUUcyY29OMVFmRVJScjNqVVVIOUR1aUhC?=
 =?utf-8?B?a2x4cHQ0ckJPcmMzbnFDc2tDSmI1bVQ1eEwwWEhsOGVLaTZDc0lEZzVxd1Av?=
 =?utf-8?B?SzdaaHE2aEdMSVhSRDZNTTZ1Z3VVNHU3aUhIekVid3IzUlJmNm5vb2NNVWpF?=
 =?utf-8?B?YVpTbnhueGRmdjEyelNWL3JidmJNQVpxQ1Y0YlRRdGhNNVFvODJjMDgzWlRi?=
 =?utf-8?B?bGVlWDY5OXllUmY3cXQ1Q2QvNVJOM1dXWWxkdGRsRDErMVNaUUdBd1BSUzhi?=
 =?utf-8?B?bTk0eUlwYjFhS2lqS0NtTDlHSDRLdEkxeGFJLzluTkkrRlIwVWUxL3lUWWVE?=
 =?utf-8?B?Zmh6czFkeGpVbjAvM2I1Y2RVNjhhekgyYy93RE5QTlp2RkRCc1dZZ001NkFP?=
 =?utf-8?B?eHlXZGw4RTJZQWZBd3QraWF2WGtTUGM2bFBXa29uM0o0aWFEYlVoY0NmVng4?=
 =?utf-8?B?ek1hdW1EVkYwdDMvYjJMMGVRclk3QS9SeW9BWnZBdlNnSktFWDJOOUdyQTM5?=
 =?utf-8?B?aVEwc01CQ1ltakswMmFVcUZxK2lmcVZtK1FrMWJwVEhhK1NSREZQNUJEVmxD?=
 =?utf-8?B?SkZoM0Z5UERCQy9WY3FwMVJNb3kyZHBiRS9QcUFyVlFja1NJN1ZNUk04dkpL?=
 =?utf-8?B?dmU4YkIrZG1FQ2NscEZQa1diMUpXRUl6b2FsU1FzY21PWlVZSzFMaFBFODhG?=
 =?utf-8?B?Ui9PYkhZK0g1eFd3OGZ4bi9oZk1NSFpVcHRadmtENWw1K1k5MExaSlk0TFNV?=
 =?utf-8?B?V05UNHZ0OU83MXprOFpmNG5lTm9UMlRTRW5XdVl4dS9hMW9zRUpscHFQNTdz?=
 =?utf-8?B?TnBQeEREdkNYQlVUemhrUlkxaER4eTdIN0htVG91M29TM3RpNU42dldJSFhE?=
 =?utf-8?Q?XH+jq8sSPI/5dMC9cy2YVFgR/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2af6609-0499-48f0-a730-08db1ee8e07f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 08:49:35.3746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixsEndt38/p0S6xm0V+ZNtGJWAcC8XXfWYa7Hdhw5bAZ6ea73RYvlWenwdYIhib1j6JfCKKZ0m7rOZwN2BkARQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7305
Received-SPF: softfail client-ip=2a01:111:f400:fe59::600;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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


On 07/03/2023 4:02, Joao Martins wrote:
> External email: Use caution opening links or attachments
>
>
> From: Avihai Horon <avihaih@nvidia.com>
>
> There are already two places where dirty page bitmap allocation and
> calculations are done in open code. With device dirty page tracking
> being added in next patches, there are going to be even more places.
>
> To avoid code duplication, introduce VFIOBitmap struct and corresponding
> alloc function and use them where applicable.

Nit, after splitting the series we still have only two places where we 
alloc dirty page bitmap.

So we can drop the second sentence:

There are two places where dirty page bitmap allocation and calculations
are done in open code.

To avoid code duplication, introduce VFIOBitmap struct and corresponding
alloc function and use them where applicable.

Thanks.

> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/vfio/common.c | 73 +++++++++++++++++++++++++++++-------------------
>   1 file changed, 44 insertions(+), 29 deletions(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 4c801513136a..cec3de08d2b4 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -320,6 +320,25 @@ const MemoryRegionOps vfio_region_ops = {
>    * Device state interfaces
>    */
>
> +typedef struct {
> +    unsigned long *bitmap;
> +    hwaddr size;
> +    hwaddr pages;
> +} VFIOBitmap;
> +
> +static int vfio_bitmap_alloc(VFIOBitmap *vbmap, hwaddr size)
> +{
> +    vbmap->pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
> +    vbmap->size = ROUND_UP(vbmap->pages, sizeof(__u64) * BITS_PER_BYTE) /
> +                                         BITS_PER_BYTE;
> +    vbmap->bitmap = g_try_malloc0(vbmap->size);
> +    if (!vbmap->bitmap) {
> +        return -ENOMEM;
> +    }
> +
> +    return 0;
> +}
> +
>   bool vfio_mig_active(void)
>   {
>       VFIOGroup *group;
> @@ -468,9 +487,14 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>   {
>       struct vfio_iommu_type1_dma_unmap *unmap;
>       struct vfio_bitmap *bitmap;
> -    uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
> +    VFIOBitmap vbmap;
>       int ret;
>
> +    ret = vfio_bitmap_alloc(&vbmap, size);
> +    if (ret) {
> +        return ret;
> +    }
> +
>       unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
>
>       unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
> @@ -484,35 +508,28 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>        * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
>        * to qemu_real_host_page_size.
>        */
> -
>       bitmap->pgsize = qemu_real_host_page_size();
> -    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> -                   BITS_PER_BYTE;
> +    bitmap->size = vbmap.size;
> +    bitmap->data = (__u64 *)vbmap.bitmap;
>
> -    if (bitmap->size > container->max_dirty_bitmap_size) {
> -        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64,
> -                     (uint64_t)bitmap->size);
> +    if (vbmap.size > container->max_dirty_bitmap_size) {
> +        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64, vbmap.size);
>           ret = -E2BIG;
>           goto unmap_exit;
>       }
>
> -    bitmap->data = g_try_malloc0(bitmap->size);
> -    if (!bitmap->data) {
> -        ret = -ENOMEM;
> -        goto unmap_exit;
> -    }
> -
>       ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
>       if (!ret) {
> -        cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
> -                iotlb->translated_addr, pages);
> +        cpu_physical_memory_set_dirty_lebitmap(vbmap.bitmap,
> +                iotlb->translated_addr, vbmap.pages);
>       } else {
>           error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
>       }
>
> -    g_free(bitmap->data);
>   unmap_exit:
>       g_free(unmap);
> +    g_free(vbmap.bitmap);
> +
>       return ret;
>   }
>
> @@ -1329,7 +1346,7 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>   {
>       struct vfio_iommu_type1_dirty_bitmap *dbitmap;
>       struct vfio_iommu_type1_dirty_bitmap_get *range;
> -    uint64_t pages;
> +    VFIOBitmap vbmap;
>       int ret;
>
>       if (!container->dirty_pages_supported) {
> @@ -1339,6 +1356,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>           return 0;
>       }
>
> +    ret = vfio_bitmap_alloc(&vbmap, size);
> +    if (ret) {
> +        return ret;
> +    }
> +
>       dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
>
>       dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
> @@ -1353,15 +1375,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>        * to qemu_real_host_page_size.
>        */
>       range->bitmap.pgsize = qemu_real_host_page_size();
> -
> -    pages = REAL_HOST_PAGE_ALIGN(range->size) / qemu_real_host_page_size();
> -    range->bitmap.size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> -                                         BITS_PER_BYTE;
> -    range->bitmap.data = g_try_malloc0(range->bitmap.size);
> -    if (!range->bitmap.data) {
> -        ret = -ENOMEM;
> -        goto err_out;
> -    }
> +    range->bitmap.size = vbmap.size;
> +    range->bitmap.data = (__u64 *)vbmap.bitmap;
>
>       ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
>       if (ret) {
> @@ -1372,14 +1387,14 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>           goto err_out;
>       }
>
> -    cpu_physical_memory_set_dirty_lebitmap((unsigned long *)range->bitmap.data,
> -                                            ram_addr, pages);
> +    cpu_physical_memory_set_dirty_lebitmap(vbmap.bitmap, ram_addr,
> +                                           vbmap.pages);
>
>       trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
>                                   range->bitmap.size, ram_addr);
>   err_out:
> -    g_free(range->bitmap.data);
>       g_free(dbitmap);
> +    g_free(vbmap.bitmap);
>
>       return ret;
>   }
> --
> 2.17.2
>

