Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C6E6ADB05
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 10:53:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZU07-0003dK-RR; Tue, 07 Mar 2023 04:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pZU05-0003d9-Lj
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:52:53 -0500
Received: from mail-bn7nam10on20603.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::603]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pZU03-00076e-AY
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:52:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7j945wr6McERFp2Ts83GMMUauNJUe8G+dtFABp0xhtXNjkObMkW9ZgkMz/oKHy88IRmzRwgYq8JJCgwp1b6nLewq2TUQx386Ycska9XLz5CSHOBP9BsIMyGJPmpEj7RPW4b4bNF4PoCV8Y4VImQrdjm9MKC5f87Wnw/NdcaHP5GFV4DejODJhAz1ugUpJhwsNay+6dzsO8POwyX6Ni272YuoksWkuVdWL2OCLYGFgArHCHtJHpOYGM2ooesC4zIm1NtgzjCjGnRkt5/HjU1DhZqRtYKekDW+rL8XYcc/mHdzvuZnecP1dUEvpQWlW4V0YtxWNzVqDND4iWgHEwQnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xcah3kwG9Zgvr7K2gO5x575SHKTGdM4kZUMZDk4OLSk=;
 b=MUVCf9MEE7xad2X72Rz4iyZnNt1LDEKgp5uf5GYeYhdalJG4M38tMS/ffuV9z90L+uVYQVzTyHxzYVci8r+j2HO40ujN/x3txxKbLjNIuw6pArwyllec6FZrlEvvFOtv47isQ3NUw8U6l3YBZNs4ctJ41KE8lm88Z0+zaAFSwVTJdm2Z9GFsLGiNlIqhV/DdtWtESjibKRCmjGXnWGy0qqnjfIx9UQl9KyN5jNq0T7CvGc3sLLbhcoGqc+ckxVW5eP5nNptNL2NtP8aj8gaigvtwr5kfnXaMyovjWr7TY3ntfCKwcC1kFTLIlf4PrERm6ls+NT1Jkm9K8swptVqSWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xcah3kwG9Zgvr7K2gO5x575SHKTGdM4kZUMZDk4OLSk=;
 b=dS0GGQhgb9CDdRtHBE+yoGuMEWnxjashrSifoXDmIWqaOPlsz5qKFu6qTXUHrZezqHR0XupXIMQnsqrHT9/9t1xr2NAhh7fhcPKonFXXkMiioMltE5PjQIFyFq8dq8qeuQKYXGuGl2pZ4fmNCZJ0gyIvA/E2pOor5TtDkTQafTBT1KYxrTUR1647NaySudfF5Iqo54AY0HTwdwRvDCgjdd6RlOx/7CIhaoHNYUj/qa9rt43nSm8LvSvK0mFYuervGioS7O47wb8cIn/MfVKWruoZH7ZuniS9vypkB0KI5PZgK2GFeKylAWZmFAPjvL0DQEWS7xw6zIjMFGJDpd41OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by BY5PR12MB4161.namprd12.prod.outlook.com (2603:10b6:a03:209::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 09:52:43 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::423c:5fb4:a0f0:e918]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::423c:5fb4:a0f0:e918%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 09:52:43 +0000
Message-ID: <4db1f662-ff56-e6e2-adec-bb59e202d59a@nvidia.com>
Date: Tue, 7 Mar 2023 11:52:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 07/14] vfio/common: Add helper to consolidate iova/end
 calculation
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-8-joao.m.martins@oracle.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230307020258.58215-8-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::9) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB5544:EE_|BY5PR12MB4161:EE_
X-MS-Office365-Filtering-Correlation-Id: a5798fdc-d665-482b-65a9-08db1ef1b211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0jq10ylXk6kQSgp1uhNTGqkMJyeU/EsIKPQ10WqPXDT9d8yc7emT6N1v3+LZPvtZizQ9jC5/YjDHFiHP+fnkk9/KeLyXlES9ZGyMr+Tc4u6+7gAsca5/TiwPq+oqY547bZvnUSmav5i2BosKvmEzs1uCzwZ040C4GSRW8rJY0uCT/K+s4PXHTUaymwCR+KPfXZg78ObXE6gfi5ZWJoBkvLxD7W+5rQvYbWFWo4rBAwGiAqAYb4Fp6Y2KiI/E4DRxRVTdE5FTC8bkN9BO9NtqmNFY9ubTSlLaO/hZ2lfjgDw+4WecBT7CUCbACxqnDYBLCp+ouGy+9gMtV+rzUGAb0ZEfkfadsRxroWcCbHII8CkLCu99LaMYiSapWXnm1ZHm26gQsv+5+ZO5d5JcXiUo7uDORct05ZVYT11L8cupBLrKCvS/Hv7S+iG8eLnooq5inwixwSLHNZSTaS26Ax3P/0JBKHzgS5pLKzrpyWnnSxwydsjcug5EF8sUnVtBzk7kpbx/atpFwGbp+xHghf9PgvFtLU8fK74IBij0UQeJaYiogTooxCC/t+t+e1wHETI+JREaIP6/jNBltK1Km5jc5Db0IOlgk0FDXAac4UQ6HQBXLa7DfMC1owa1GEnzzJsRg+Ow6PXcm88JkZ91TktBPUqZCfm5/RYxXHbxM9+0lzniV+vL7bDc7aTvvT/scD4rktvWZ3o3Pc+9clRgNeLEik8H9066FdQJcQY3S6i+qeg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199018)(31686004)(8676002)(36756003)(4326008)(8936002)(41300700001)(66556008)(66476007)(66946007)(2906002)(5660300002)(86362001)(31696002)(38100700002)(107886003)(6666004)(6512007)(6506007)(6486002)(478600001)(54906003)(316002)(83380400001)(2616005)(26005)(53546011)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWZ1ZnQvUzFmdVZ2ZHQ2V2paWTA4TCtzMFROTXJvUUduRFZuM2tDVmUzRElu?=
 =?utf-8?B?RUl3MFZxK2d5ZjNVR2ZuYTM3RUJKNDdyYk9jMGgzcmFDY2dRTVAzSyszVEJ1?=
 =?utf-8?B?Vm5LMW52VzNaSENubVdodGRyNURjQjZPeUxGSk8valMyNlBMZnlyL2dISTR0?=
 =?utf-8?B?QXNhellpYTdoZW5DNHV5dnBXNjlWQ3EyY3JoWHVONlc0K3RobExNZnl0aFFj?=
 =?utf-8?B?VTZSbXNERlRPSjJ5Q1pKYXZYRzlVNk9sbXBUOFlmdHQrZXNTNGtYTlRrMUVr?=
 =?utf-8?B?YkVIeGhOa2xuamJHVzc1U1NwK05RZWU1WXNSUDFFNWZJb0xucm04b3p6Qk8x?=
 =?utf-8?B?aDNEeGxoOVFQc0kwdXBnbzFMd3FtcWFxR0ZDVmVzL1VZNGo4cFNZLytRS3Bw?=
 =?utf-8?B?c3djQTZBdVQ2ZUI3d29CbkNiZThWNzg3SXFQanUrakR6RUIyR3Z4Rmw2N2Iw?=
 =?utf-8?B?VHRXZHlFSHRhbyswSkEzV3BxNWx5MUVkVW9JVitFMEM3NEk2OGppcGhUeHpH?=
 =?utf-8?B?NGVmOWc2Y1VjcmhkRVVPQzZjSGxnN2l4aE1UTHo4ZVQ5c1UvN1hud1VzdTNI?=
 =?utf-8?B?NXVyYkdIS3ZhRkgxNUx4OTJubjU3bFk2M3pJdUJjV2V2N3I1RnRCL0ZZUjFh?=
 =?utf-8?B?NndnTWNma0hWQjJZVEl4VTZpN3lDVEd0UE1DYkV3R0NBUXFXWjFYMFZpeEpR?=
 =?utf-8?B?NXhob2JxVHVlS3VEWFhmRVhLTzBsUldpYXBnRmZVa2ZrZldwYkkxUjJUY1dD?=
 =?utf-8?B?eGl5cHBITG1Wb0c5TUZpWnFwd0Z4U3dXSk5kNkxzd1E4QjZxTnk4N2xPSFNJ?=
 =?utf-8?B?dXJscWtYVmtGU2VQY29mU285SG9NS1VYdHZGWjVyVVJ1WGJzV01xVHlwZ0Yw?=
 =?utf-8?B?cUJPbzhCVG1oWnZVNW44ZU1QTnNzM0xzenZzZ243RVEzU3VnZFM4eXNueHJS?=
 =?utf-8?B?RGJMc0hyc0JFaDRjWm9DcmpQR1ZKUlEyNVJuL3htWVpFRzlZcE9Ya25jdHpo?=
 =?utf-8?B?MzFhcktOYVQ0QXdUL3BKTUkrdlFaUmlrZ3ZEL1JncE1IYXErQkhSSzYxM0N6?=
 =?utf-8?B?MkYyWUVqZ05lZG5Jd3BaemphWk96VU5meHBCZVdDcHlKK0NkK0F3bEZkYXAr?=
 =?utf-8?B?Yjc0U3B0UXlsQ1htYW5tZTVWQUMrRjZHYm1EWmFuSmVWVktjdkphUjFKU2pj?=
 =?utf-8?B?N2JYUDVWNE4yVXlUek9GeHRzQlNFbHpGckR0dUwxd3E0WXc3SnRaY1lucXcy?=
 =?utf-8?B?Rk5MT3E5QVBCU1ZvY3BVNy8zMWlHbHlBZlRJbFgxTXh3ZjdrRmNsNUtNOVdy?=
 =?utf-8?B?U2VRY1Rybzd1QnJnaFErMG81ejljVTdsL2FETUluRE82SmJiL3N0eGx4M0dh?=
 =?utf-8?B?M1Q5V3JhbWEweUJza0RYdTcwbnZ4ZU05TWUrVFBoL2ZjSzFMWTlZQkZBRVNu?=
 =?utf-8?B?eitVT29VMHJJTjR1bTh0cWFvNGlvSm1hWjNXeDNxZ0ZRZXhKNGZyTUo5Q2JY?=
 =?utf-8?B?ZU4wSmYzYUNaMWJFTHRnRW5ONVhpTTV1V0tQdjBuYXJBODV1YjhRekxZQ1pM?=
 =?utf-8?B?aUMrM1hXYWFIZldETWdZN1Izd3U3SVVhaERYVGZiSGVNd0pzNE9hOTVDWlIy?=
 =?utf-8?B?bUpUazBadTlLa0ZZSTRXb2lManRxdUc3Qk9vQ0VlNFlzY1JQYjZXSWJsbmFu?=
 =?utf-8?B?TFZXdERKZERMZW1HT0pUdDQ4Q2JaZTQxUnNGdkZ5ekxQdWxrZVc4Z3hJMzlu?=
 =?utf-8?B?VE9CT0c5ZzlzTEJ0L2RaNlVIRXAwSHg2NGZCOE9wVlVsVkFxZk41M2JZYWg1?=
 =?utf-8?B?NUlxa2d4Uk5QcWU4d3dhTW1KdlBmb0kzN1hBQTV6SHJoRU9MTHRGcXliS015?=
 =?utf-8?B?Y1Y1aFVjS2hEcjZyVWNpQmpkUXVZMU40RG1FbGtzSVRwc29YcVFibTdPQXR2?=
 =?utf-8?B?aUhIY09SbnR0L1pUOFRVazVUZFVJWmRLM1lLcnBQVVIvdlg1TEJSbHI5a0M1?=
 =?utf-8?B?WjlqM0ljT2ZZWlMxVUttbVVYakxUdnN4c1YvSnRiTi9kUGdmbUMrSUdUYkRt?=
 =?utf-8?B?alVJSmE4V3FHMWZJR3laRFNPK1FvWW5QSTJKT3Biek40NVllaGRQdDBXV1Rs?=
 =?utf-8?Q?la3c8dQfkh4/100DbIb0+Pj7n?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5798fdc-d665-482b-65a9-08db1ef1b211
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 09:52:42.9785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TBsbqOQ2txk+HzZ3iJjOuLArOmRn2K/fd7bhoKbhVLkxw+jFMiFCATCcKbFKRQTJWwq2TYF3D8+81rXSwaGsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4161
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::603;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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
> In preparation to be used in device dirty tracking, move the code that
> calculates a iova/end range from the container/section.  This avoids
> duplication on the common checks across listener callbacks.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>   hw/vfio/common.c | 37 ++++++++++++++++++++++++++++++-------
>   1 file changed, 30 insertions(+), 7 deletions(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 54b4a4fc7daf..3a6491dbc523 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -961,6 +961,35 @@ static bool vfio_listener_valid_section(MemoryRegionSection *section)
>       return true;
>   }
>
> +/*
> + * Called for the dirty tracking memory listener to calculate the iova/end
> + * for a given memory region section.
> + */

Should we just delete this comment? The function name is pretty clear.
Besides that, the comment is not completely accurate -- in this patch we 
are not using it yet for dirty tracking and it's also used for 
region_{add,del}.

Thanks.

> +static bool vfio_get_section_iova_range(VFIOContainer *container,
> +                                        MemoryRegionSection *section,
> +                                        hwaddr *out_iova, hwaddr *out_end,
> +                                        Int128 *out_llend)
> +{
> +    Int128 llend;
> +    hwaddr iova;
> +
> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
> +    llend = int128_make64(section->offset_within_address_space);
> +    llend = int128_add(llend, section->size);
> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
> +
> +    if (int128_ge(int128_make64(iova), llend)) {
> +        return false;
> +    }
> +
> +    *out_iova = iova;
> +    *out_end = int128_get64(int128_sub(llend, int128_one()));
> +    if (out_llend) {
> +        *out_llend = llend;
> +    }
> +    return true;
> +}
> +
>   static void vfio_listener_region_add(MemoryListener *listener,
>                                        MemoryRegionSection *section)
>   {
> @@ -976,12 +1005,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>           return;
>       }
>
> -    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
> -    llend = int128_make64(section->offset_within_address_space);
> -    llend = int128_add(llend, section->size);
> -    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
> -
> -    if (int128_ge(int128_make64(iova), llend)) {
> +    if (!vfio_get_section_iova_range(container, section, &iova, &end, &llend)) {
>           if (memory_region_is_ram_device(section->mr)) {
>               trace_vfio_listener_region_add_no_dma_map(
>                   memory_region_name(section->mr),
> @@ -991,7 +1015,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
>           }
>           return;
>       }
> -    end = int128_get64(int128_sub(llend, int128_one()));
>
>       if (container->iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
>           hwaddr pgsize = 0;
> --
> 2.17.2
>

