Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3376A0CE4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:28:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDW6-0000Ry-E0; Thu, 23 Feb 2023 10:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pVDW5-0000Ra-0s
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:28:17 -0500
Received: from mail-mw2nam12on2060b.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::60b]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pVDW3-0002pm-C1
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:28:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdcrrSGhz8SMckwFSOQj7TuKi69u3ZNCUQ64BWSik7SwQIF6KuIseu117Tv5bP2d4ULIyZIY1eads2QhzjD6c+SgZLJwzfLuTesjyoXzCa9cEOOsbaNzFnsKoK06y0/kVtK5x1i6nH/A89KXSwIOlFc5Tt+nslwc8626iG/NzxA23gz8ksjXE3UlXwq8nEjP9hs3lmMkLyMstHso0OoSmDRHRaUQrQTYTomh8xm05wmWjvs1atkqNsYhDtM0UOHU57l2iQaNqwF1kzwt4YNVMoDGIq1y4e0XVb7Ns0Hrw1mE+/RlIM77NSu+6Jn/4Z37evwKhcXanyKnRhOtPHfcfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7c9R6rpFNvCCooZYYrBQIYMKtgUIU1PkaO4kVNivphk=;
 b=iqjitpQ7FfMOeEaPT+Q+fKX4W5RyIKgg3mXs6ygFBO6U/l2UV0BrgVFi4FYfsuq5LJsJuFrBHoV08bLQBdXxj9gowTh4FTdPyUwon3RuYcvFLrWCV78u0FNJFMDVnNRrwnrHAwdzv/oQs51MpZ0A4rMQRL1SYkMevsvqYILbiCSI/wUX+w9K8efFmAIMqiGiZiCExiI+PVl0olBwAnoyUSKGEllKPVzJmMydUnNnjGakOQS+SLsTYmOPlOUAmrOG7j0iseqdVWZhosivjILE0Xgajae4O4SqMkcjwDE0tWHAQh1YHEQ0HgAJcCb8Fns9aodbB0wa1l6RdLhU0h5jrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7c9R6rpFNvCCooZYYrBQIYMKtgUIU1PkaO4kVNivphk=;
 b=J0bsjLxyYETVg8gf1HVRc6xAf/YYgc54Mlfedw44wNRZvj/++zLDGf/zFVNmknxVCaZmxCCnVubD4hYm+BVyCDbY/EGErwfnhXNk34cL+aGEs9xlP7Jc3PPGEVLZguSB6RvLsDwzFpeV+Ls4egMU7ubPgOE0u+Ed2bK28KU7x5oFiWMgui0PcVu3i93HFYPYFfUsAPXjmAZjxY5A98YVilRQIRi40FHUq44q2ODxa1CmhcuDdr08zeIVLMmvmKgwKGTr6xpa/tNOBLdcbgF4vmbD0lOTXzR89lX2At5bfq1enseGSR7oA0pB+V6YqlyetX2/W5AYxMFQsv5DDRlngw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MW3PR12MB4364.namprd12.prod.outlook.com (2603:10b6:303:5c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 15:28:08 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb%3]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 15:28:08 +0000
Message-ID: <94aafabf-5b5b-be8f-4634-567533119e3a@nvidia.com>
Date: Thu, 23 Feb 2023 17:27:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/20] vfio/common: Add VFIOBitmap and (de)alloc
 functions
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-8-avihaih@nvidia.com>
 <20230222144009.2a59f1d0.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230222144009.2a59f1d0.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::11) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|MW3PR12MB4364:EE_
X-MS-Office365-Filtering-Correlation-Id: d7491134-e821-4f81-c5d5-08db15b29075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cGvrftF5pBdgW9XpTTSZLiAHig4/+Kcv0V9sKvpTs2mvGHeqOrpYdufG1elnWE/iqD9bZdpj7pPp76fZDUDpF0/CEzN0gxk2qYdWJhm5Go9Rs7ttw31nB1tnz0mVYztHiA7hH+2u1k3oiShqBcZqIVk/7fZ5YN3CF/L1s40Y33Lc4eZCdY8xZHvakgrKHdpU4AIDmdajvAd3wrCoK57LT7OWmYqPTJwNf/pm78OQAfdiJt/5CSRThUvCePIoQatNsGaqFpRr5N6N66Op809DWboLNw5I5IKCJBDvq9Xe7q6NAlIdw3XhWc7tn2nHdcU1aHyjyI1GhSorNFWYVEfWp5gTdnzmfbh6FR0QBYO5h2+cw8kVL8/lX4dpZmfqKZzjIKT8RGyRRyEV5vjP+mL3qDIYR0wSEgk0AiLI4zX08CJROLPZHqcv6XnepunwyjDX0p6IhQzjKvUqDeWHKDk3ru9cv9O+cAPUwiMHURmhPny9JhS059xcpdpD1Tl62/46lNoe3zHNJnanngKwozz8QEn7z3RoAgJANmmjK02G+qWEwioe77dEOkj/9YwWR48lBOC/leCs4Bvj1kQ5O8hSRwdWP+MUZVaA6eOleyDdrrfcjtpx5xcT+ekbhEck4J5ogjpqPppboSxvEEgR47kyNr25Q1IjbtfrA6VrkwErn6V5G4XRIWv8NwkHCPRWzmYSCbKvx0J0pYh84T4/h2v/037YCAiTfuDuI9sPvteQXd4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199018)(31696002)(86362001)(36756003)(54906003)(316002)(83380400001)(6512007)(6666004)(26005)(186003)(6506007)(31686004)(2616005)(6486002)(53546011)(8936002)(5660300002)(7416002)(478600001)(66899018)(2906002)(66476007)(4326008)(66946007)(8676002)(6916009)(38100700002)(66556008)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlloQUtJZU9nRWdsaXEvOHk5emJ3Y1hzdGFwNmRkZklkMVJtWHg0ZGVLT3Va?=
 =?utf-8?B?empCY3dHckMralBDSTJmT2lzZ294ckMraUlFVmxpam5uMWVuOUl2YmVLcjl2?=
 =?utf-8?B?eTRWMC9aamI3WUpIK2RuUXJLSXhaZG1UMmRaTGxxVXlYaUFQZmNnQmtuRkxG?=
 =?utf-8?B?aVRYNmlNZU9kWHhPcENReTA1TmdJMS95aWNyRVlZaUFmTk1VNFdMZEJNZXlZ?=
 =?utf-8?B?NzdESUZjM1hsTC80b0ovNG1ReXNLdzBuVG1SUnNIcXE4TGRTeTM2b2tGYnJ3?=
 =?utf-8?B?dldNZUlhbEZGcURhanRxQkZWOHQyN0NlRzZjeGFtaHI2bGRrNVY2amtEOXo2?=
 =?utf-8?B?NzU0bzZDZjUzaHFuY3Q4RlVFV09MMFRIaHU5WHY1eHptYi9jcnVCMGJDYTI3?=
 =?utf-8?B?K3VzdWVkMEdwcTNOZ28rMjF2d3VhYzIyUnliUVY2UDl4KzNXblZXN2FGeG5D?=
 =?utf-8?B?MnBuUTY1NFl4SUhSSmpGY0pENWZnd21ydmRINGQrbHl2dFUyQVJsRTE3aVlw?=
 =?utf-8?B?RHVzL3ZKYUtEME9peU9OZ0JLZW91WUtFZ3JvTDRnczJKMUZCZ2M0WFREOWVl?=
 =?utf-8?B?UEZMNHk0d1JuTFBsWURZVVNKd1FkOStILzVKcXBVSDFQVElrdXYva2RvdXZS?=
 =?utf-8?B?djk1R1JpSnlCajFBSFdvWEJIZTNSRGJJTDlIQjREOEIrMG1Kcm1CSFJsSUxa?=
 =?utf-8?B?Z0lrRHJVWnc1V25VZzhHZDhnUmt0MG1LQUV3d1JrbWJaVXdZZ1RNL0lhWExq?=
 =?utf-8?B?NjRzWHkwMHUrcFpZSm9xeGFBaU1uSXgwM1RRL2tqazRoWW1VTDZ4RGQ4OHdw?=
 =?utf-8?B?aFI2NDZIdVp2OTlLQ04ydnB1NzlCNVNUWG90akxjVDBJaUdzcEpiS095Tit3?=
 =?utf-8?B?VStWMXVmS2FFK0xjUXZFUktjNjZvd045VTFEZitUOVczLzNEaXRGbDBPeDEr?=
 =?utf-8?B?T3YvV1FyTGwwY0VJV1JJeTRwOEJaN0tkeCtHTU1ySFVkd0xOVmN5QnNlVk9i?=
 =?utf-8?B?NFpwbUM0dlpETGQ1UkRZQmRkV1RQU0h1Vy95QVA1K1M1NUVvUzFxV0IvNjdk?=
 =?utf-8?B?NVdIcUVCOStKamVHQXR5OXFOVmk0TlY4WTNaaE9vNU9qZGkwNXIveFltOEZq?=
 =?utf-8?B?ZWNHeURZOEhqKzJPSEVWaVpPUlZTYUZjTlkwTVNENjBsTXoreGtJejBISk9C?=
 =?utf-8?B?YXZQQVQvYTZNSG9NMjdTOTZ2N240aERUcHQ3R21JLzZTcysxWEVMNXJtOFJI?=
 =?utf-8?B?b2dMYkJ1WUZpdmZZK3c1MUswRUxXRUhSMHFNeHphZE43YUoxdG5Nb0VDSllp?=
 =?utf-8?B?cjhOTVFtdTRXSFlGZ2s2WVBuUHZ3U2YvdG1yWGlpQURxL2dMQk9yWjhIQjN4?=
 =?utf-8?B?bERVcTQvQzQ1anQwYXJsZzdSeFhab082L1ZBMjJyWXZiZzFLYVRDWjYrbjd5?=
 =?utf-8?B?MVZQeTNLT1J1bnJaRlZDMTlEeGpEQXhlUUxCVXp0WHNvMWpsTk9xMVBhWTlP?=
 =?utf-8?B?dUFQaU9RWGVnV282eldoUFhCWHE0RnhDS3B5RDF0ZndGS0lTcVY5KytEN0Fv?=
 =?utf-8?B?UWd3SnZ4OElDa2kyV3dMd1pqZW9sd3c0MHVUVFpSV0RUTjdoeS90bm5Hc1hG?=
 =?utf-8?B?cjh3ejFDL2RWYXhaRnVINDdLUWN6U2thZUhoQ1cveTJGNkNjeDlvRDNGc2w4?=
 =?utf-8?B?Vk9wN2RvVTl6R1BTUm11bm5KV2RpRzRkYTh3ekpSZ3JrelpuWnRGam4zdVFU?=
 =?utf-8?B?endqMjVYK1VzS1RmNktmY0Z4K21kUmNwNzV3K0lrUHRtQjRFRXluL3Z0Z2lV?=
 =?utf-8?B?RG8vU0hreG1JMVVoVUV6RXlrOFlEUGtFTFpub3pYc056RDU3TUkrSGhnMHd3?=
 =?utf-8?B?cFZzV2VJdmo3eWNZaEYzRTRubHBqeGlKM1F0UWZOYVFjd0kzNmhsSDdHYWp2?=
 =?utf-8?B?aGNMdHhYNnlTZ0wvZ0FKMkx2RVpQUjdzWkttUkxZWlFRcGtxZ1hReS9WQ1Y2?=
 =?utf-8?B?MWkzREZpa0l3WHh4MXFGajgwL01xRzQvTSt0ZldZZVIrOFFrYlBSYllJNTRq?=
 =?utf-8?B?Z3M1MFhIQTN1NVpsTjN4QktEYWU2Tm5rOVZKTzNPVEN3OU1zWEY1OUhiMm1k?=
 =?utf-8?Q?H+23CCE/Xg/n8DD4WyeIwQzS4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7491134-e821-4f81-c5d5-08db15b29075
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 15:28:08.0034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zK9Tn54Om54lOaQC1gnL6MQK2GGd0e5tign/XEq6h3YqYbV7VXfZwVAbymbly0KztH4jQWwUR76XpxavzfQiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4364
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::60b;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, SPF_HELO_PASS=-0.001,
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


On 22/02/2023 23:40, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Wed, 22 Feb 2023 19:49:02 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> There are already two places where dirty page bitmap allocation and
>> calculations are done in open code. With device dirty page tracking
>> being added in next patches, there are going to be even more places.
>>
>> To avoid code duplication, introduce VFIOBitmap struct and corresponding
>> alloc and dealloc functions and use them where applicable.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   hw/vfio/common.c | 89 ++++++++++++++++++++++++++++++++----------------
>>   1 file changed, 60 insertions(+), 29 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index ac93b85632..84f08bdbbb 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -320,6 +320,41 @@ const MemoryRegionOps vfio_region_ops = {
>>    * Device state interfaces
>>    */
>>
>> +typedef struct {
>> +    unsigned long *bitmap;
>> +    hwaddr size;
>> +    hwaddr pages;
>> +} VFIOBitmap;
>> +
>> +static VFIOBitmap *vfio_bitmap_alloc(hwaddr size)
>> +{
>> +    VFIOBitmap *vbmap = g_try_new0(VFIOBitmap, 1);
>> +    if (!vbmap) {
>> +        errno = ENOMEM;
>> +
>> +        return NULL;
>> +    }
>> +
>> +    vbmap->pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
>> +    vbmap->size = ROUND_UP(vbmap->pages, sizeof(__u64) * BITS_PER_BYTE) /
>> +                                         BITS_PER_BYTE;
>> +    vbmap->bitmap = g_try_malloc0(vbmap->size);
>> +    if (!vbmap->bitmap) {
>> +        g_free(vbmap);
>> +        errno = ENOMEM;
>> +
>> +        return NULL;
>> +    }
>> +
>> +    return vbmap;
>> +}
>> +
>> +static void vfio_bitmap_dealloc(VFIOBitmap *vbmap)
>> +{
>> +    g_free(vbmap->bitmap);
>> +    g_free(vbmap);
>> +}
> Nit, '_alloc' and '_free' seems like a more standard convention.

Sure, will change.

Thanks.


