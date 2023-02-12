Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526C2693839
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 16:50:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pREbi-0005lF-5g; Sun, 12 Feb 2023 10:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pREbg-0005l1-20
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 10:49:36 -0500
Received: from mail-bn7nam10on20619.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::619]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pREbe-0005QU-1w
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 10:49:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1U22PXIYAtdcLVjWX+fFXRbgjQdektdWg+F/g+upQEHAzQfkTbbziWVJRCJdPC1ruPNaVIABxKrquiM8WQ3pWgMstEJLlT9cYKp/U8k1CHXGp+v7aKdkbRoP0/9s0DW4tiQEh425CvGeaOrhQpGVQEIcTEAk7/p/TneDjf/w5dyCPRNgHYW+xRnLB4DGaDDx0z/lLFGKK/j0AupfpbYJQAAEbYBffpi7taLmZKNfS6MkPuuJH4IvhK8kjJ+XJkWF9mrDHu6z+KDwpMZiULphctiiU06PONufJBCB9V5ZEk7bIbfI37rOVQZVsm7R0yNIhqGXXFJr3ArV683T+IFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJGRQPyo4sR8G52yh30/5wvQiuic7IgVvipEIXTwaIk=;
 b=AIp98PX+SHrpRyk40g0aoqdU6QZ0k/mA80kYNFarSqG662GTyM+GmbnaWztOAXlM7FFv8i//ZSw7p+uI3T3uM7rMW4URvYbFbqQCyO/v/8DCGVayakHqpfD+kZXSUTDUpEu5iRBz1tDQuXA1x/frY6bVsKTn45OfCiuSaS1lGN2dZrhVfijiUXJvi6CeP+we0W+AA3C+T7CZsNgBQtKNcEwvEamOECl5gsfKAQG8ibbse12L6ifmrElggjy/F9Au6MrEcf5msl+icMG56W16mQ3MLyzJHGZSeXV/QEPbE0CChimxXf6ksRr9OLjdQJVIOdSuD2Zz2sZzPgBZV+2fBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJGRQPyo4sR8G52yh30/5wvQiuic7IgVvipEIXTwaIk=;
 b=YmkSJPg8KUuc2wM+Efx4z/iX1pKjSjcaIN/EIFPMYEQBebcLU3ws+13vZtK1U1JyR78SREAsuBa/pTRc9QhKg15UueIVbrm5N9N7EauuBfpZF2q987lDm7jKFnK4HOU2LArix9zPCMu3tdSa5wU4TIZiepH/qtHttjRFgYgdfP8c64qGKhmVbyY8XmF1K00T0Ik7au9CHIb23zG4p4FW4794H0YEr1V7xKgHfm9XHlH9Km1bSs1sU8LUgCf0pI6/N14m/lvljeJXPjkEMXaX4fpE/LugYhCbnbqY2BZBhhDOmwl60ZB1fhfNvVlV1JW7UGHBKv+AgOTPe+tRdIyhSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by SN7PR12MB6713.namprd12.prod.outlook.com (2603:10b6:806:273::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 15:49:30 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%7]) with mapi id 15.20.6086.023; Sun, 12 Feb 2023
 15:49:30 +0000
Message-ID: <4745af4b-0c32-62ac-6820-debed76ecace@nvidia.com>
Date: Sun, 12 Feb 2023 17:49:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 11/18] vfio/common: Add device dirty page bitmap sync
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-12-avihaih@nvidia.com>
 <20230127163719.43e8729c.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230127163719.43e8729c.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::7) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|SN7PR12MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: a73a69c4-32cb-40b5-6819-08db0d10ba48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gZ+VMGzGbz0LxVP1cS/9C9wYXol+Ay1Kw6GO7cqRRrQG5zK7E0TmdLeHdShKFlrF13M2t3phOTiia5MhYNltBgcClkRtUVtIZ8ZqBp6l/sHa1NEIid1ft26PsbpyDW76livebIO4H/F8C2XeLoSXpye4zh2unxN8DFlGenoj5CjGS+8frt32eYd4WO5ZL1OQBn15mWHq1BJDBa7Z3CWCFp6t1WCS8MnEUyybsF5TDr4ts0mw7hd2woxwCovVy6LvP3Iu3ON4VbxIFwHq6Cja859hEOGZKfeE/FgFYlrppX+wnaB5KnnGdriR/3uswawysF8QH4KjtAj3Hz+oAEJtfO4quz+HUD48HkFtOIvJDPCvddSAYRjDdMbcXlGaklsTSCdb448ej51aQMyOiOcL6JsOjQd6jfJ7D10ihMPTQrhTMXRiBLXnIul+XVli9AQXO+SDTLjOk5Ml5FilO2OSeFDdJ2vlhlS3whF8wZaFkIm7TfbQR5RJpP4enowFFT/OG+Wj1pJARqSxZ3P2ZkDAu/RCGj6+mx7nOewd8+yB8w5Xt2YVB4HX/+jS2xDbHJ8nkB44ejknOaovGghi9feXOrzxOHGpdfeHRUgJQoxAytERTxlDJxMZUSqqgtbjcetarx8k6Y2+ycMoHbBJDfJ/GmGx1rRn5mCRsOmyKR4VvA9hcqf0bGJTuhPhrfHzgQApQvqu+fGFHGjhPWny9alxSirGmbcHurTzTM82OOVKqiwHmNIZ8IQckjMauLiScJaD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(38100700002)(86362001)(31696002)(316002)(7416002)(54906003)(66946007)(66556008)(66476007)(41300700001)(36756003)(8676002)(6916009)(4326008)(5660300002)(8936002)(2906002)(83380400001)(53546011)(6506007)(6666004)(2616005)(6512007)(186003)(26005)(31686004)(6486002)(478600001)(66899018)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEdkVy9Mdkh0dXFVL1hzdW1LVjZ4TDUxaWRhbmg1MTU0VThoN2pPVThVbTMr?=
 =?utf-8?B?c0tGaUgyWGdReURLWHNCTnllRis0TDZSYTYyMlRvT1JycUhzK1hMa3NNeFNC?=
 =?utf-8?B?bWsrV0NqU3FFMXY2T25jdlNvU3d5L2tCcmRNdGI0bHFQM0xxejU3NzFwUUE5?=
 =?utf-8?B?VndwN3psNDNha3NiVVltNWZRbHZnK1NjQmxsdWNRclVoWVRsc2NBbHJ4VTlz?=
 =?utf-8?B?M1JieUVpemlGY2lEUE85VGNPMTBGdVpmSFZzOEwxcHBLcXRWY09zbk1BUjdS?=
 =?utf-8?B?Wnk3VjdOR0dONWdhTllrS1IyMXF1TmRodUFzdkdnQmpPQ2pvRHNvWHp2UEJY?=
 =?utf-8?B?dys5QkFqelkwM2svckpPQzFsSlBDVXkvaHIrRlRwd3AraHdoanlNanducmZl?=
 =?utf-8?B?NEdaMjFLSEtST2FtRFJvaDJTRHFUZnp3c1ZQUWxxeXpVMkpieVZENU9HbnI4?=
 =?utf-8?B?cnNqOWlCQ1RVa05hVFd0VDlIMzZGbGhDQW1xNG9LU245V25TaS93V1dXVnBu?=
 =?utf-8?B?azl1eEIwaDlSTEw3SFVGUW9BWkpxY0lmQTFzdGU1WjdxaW95UGRudDlUcm9F?=
 =?utf-8?B?L283ZXloeWh6QnN0a0tPbTFnbXBpY0FjUk5KaGFKYXY0Q2JKeG44SVp5c3Vi?=
 =?utf-8?B?R0FTSnlJZXVIUXdIR3BuM3VJN2hvbmgzMDUzK1VPV2UrVUgxbkIvKzFHOW8w?=
 =?utf-8?B?VUlMQ3JjODZIQ3RySVlvUVdseHNBZ3VIWXQxOTZDbjhVQWM3RVJORGwwZnJN?=
 =?utf-8?B?UXVPVCthNktMT0JQczhnU21WTHBHcFVnUnU0eTBTaklHS25yNVdzWU15MllX?=
 =?utf-8?B?T3U1cEpmMzEzQkUwTEM5bVl1by9RSUNjcThiWDhuYzNIcGNURnVkUmsrNmZt?=
 =?utf-8?B?ZWtUTThPaTVsMG0rd0w1aVYxaVdHcHlxQnorUjhOQkQ3Rit2RWJScnUvV1BS?=
 =?utf-8?B?THVCWkQ0ajV6bkh6RFVPMEN1WUo3SDJiVXRleS9NSmwrTmFOaFZ1RGUwTjZh?=
 =?utf-8?B?OTQ4NG5oMnBoblFSMytZQ0g2MktSTHBhS1ZtaG5kbG1hMXRnQzhUQU54NVdo?=
 =?utf-8?B?M3NWQi90WFppZEpaK1R6NDBkOWZVVlA5Z2g2VElkQS9hVkFKQy91NWFKSWw1?=
 =?utf-8?B?dVpUSFh3WWNJTThWSnVrSFFpelU0UVE5Q2hSaFJqOGw5cmNvZG5oS3RXSTNa?=
 =?utf-8?B?b3pkYXZVcytJcnBCYjd3SktDM0d6UFY0S0lMbmgxUzNKU3ZEaTk5OGV1SlhK?=
 =?utf-8?B?bHVtcXIzVitPVUJSbU1qbGdjZlN4K2ZoNXhiclZsSFJtM3EvaFdJKzMwRzFW?=
 =?utf-8?B?QWplSFpLajVtaGxPd0NzWlF2R21UU3VzRWxmWCs4WkpSbldTaVl4ZFlyV0FV?=
 =?utf-8?B?ZTdOcXZsZjJRa0NicGhYeG8vS3RwOXRVNnlvSFNZcjExN0xINVJjNDVaQ3hY?=
 =?utf-8?B?UStpdkdsQ0ljU04vS1VzT09kSmhzemt6dWF1Ky9QUWdLeEJFYTZWMFZlbEk1?=
 =?utf-8?B?V3hVUnI0eEUrYXRJcmhMU3FieU4rY1FTZG5uNkFYbnFKRTFkOG9RYXdVcVJR?=
 =?utf-8?B?bnExTEZpNllSekFIaWQyVG92NzR4ZjBGYS9HdkpXZWVhUHgyamxZcTFIU0k4?=
 =?utf-8?B?LytsSnJ1a3hncTRvTHRTd2lENGllY2VRM2lzTnUxSTZyVDdrYTFOT05SVEhz?=
 =?utf-8?B?QzZIYmlpaGRSNWdkb25Iam5ucXlWczVIRHRtUlMyM0cxUVpKN0NXNyszOGh4?=
 =?utf-8?B?dVo4YUdLK25LYllsVzZJR0dUbDhsNGRvdE9MZnRKUlFKaGdaeFVDYXdZVGJm?=
 =?utf-8?B?Z0dzcW5jTk93Sm1Xa05JN2ZqR29xRWhIWkhRVHRBZ3Z4NklhVitCREpDbVZh?=
 =?utf-8?B?MlJlLzZOYXJlRFVpYlZQcDViVXdoTDlkVzkyZFlpeDFDdEZxWjJUdThoaWU3?=
 =?utf-8?B?UGNyMytabG94cXJkOWRhU0p3TDNIWE45Nk1TR2xXQzQrTTd2YldpcldqVVZE?=
 =?utf-8?B?UlFVNGVmUENxY3dWQndiQzRiMlNNWkdpMXVBSXE1UEhCUEtLMGdtUXB2NEpQ?=
 =?utf-8?B?UGNYaXU0OWRxc2hINWRpMFdYZTRuaFU2VFpDMDlLSjZLUktBRllUY1V4MTR4?=
 =?utf-8?Q?gNq7/vlRpSJb1qjUu2U23kabR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a73a69c4-32cb-40b5-6819-08db0d10ba48
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2023 15:49:30.1515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udf0p0+0ihwdPDd4RqR4riRrnR+xq+Dl65HH59JW5L6Mo/2RloBY6fS61VaoTa6NIn/eySx6toaxscu1Ft/k/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6713
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::619;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.348, SPF_HELO_PASS=-0.001,
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


On 28/01/2023 1:37, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu, 26 Jan 2023 20:49:41 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> From: Joao Martins <joao.m.martins@oracle.com>
>>
>> Add device dirty page bitmap sync functionality. This uses the device
>> DMA logging uAPI to sync dirty page bitmap from the device.
>>
>> Device dirty page bitmap sync is used only if all devices within a
>> container support device dirty page tracking.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   hw/vfio/common.c | 93 ++++++++++++++++++++++++++++++++++++++++++------
>>   1 file changed, 82 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 3caa73d6f7..0003f2421d 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -355,6 +355,9 @@ static void vfio_bitmap_dealloc(VFIOBitmap *vbmap)
>>       g_free(vbmap);
>>   }
>>
>> +static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>> +                                 uint64_t size, ram_addr_t ram_addr);
>> +
>>   bool vfio_mig_active(void)
>>   {
>>       VFIOGroup *group;
>> @@ -582,10 +585,19 @@ static int vfio_dma_unmap(VFIOContainer *container,
>>           .iova = iova,
>>           .size = size,
>>       };
>> +    int ret;
>>
>> -    if (iotlb && container->dirty_pages_supported &&
>> -        vfio_devices_all_running_and_mig_active(container)) {
>> -        return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>> +    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
>> +        if (!vfio_devices_all_device_dirty_tracking(container) &&
>> +            container->dirty_pages_supported) {
>> +            return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>> +        }
>> +
>> +        ret = vfio_get_dirty_bitmap(container, iova, size,
>> +                                    iotlb->translated_addr);
>> +        if (ret) {
>> +            return ret;
>> +        }
> Isn't the ordering backwards here?  Only after the range is unmapped
> can we know that this container can no longer dirty pages within the
> range.

Oops, I thought that it's OK to query the dirty bitmap when we get the 
vIOMMU unmap notification.
I will reverse the order.

Thanks.


