Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18BF6A73EA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 19:57:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXRd9-0002DB-Bg; Wed, 01 Mar 2023 13:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pXRd7-0002Cv-84
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:56:45 -0500
Received: from mail-dm6nam11on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::600]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pXRd4-0004b7-W9
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:56:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dA27M+oeTvpk8gr4gBQ12gJiqV+uIi56OmnLHVAiu0dOHW1MpocjGpfbGrDNRSvsg2kRABL1INzpjHz/LKFcXODHz+JODXWxXvgyGekPqDZQOLqBQSNYvPg+/7tC70zSOPVFem20jSZk7heAQ2Sqe4BuJXmK/RaXvfO0ZU6Y096f7KyXEdy6Md/N/vySqqbnHrP3EjT+rnhJr62OU/ef0sxvm0XjoKliw12Mf6kHEgv+09SSc4WXQkT8QpXL7+gSWiDGi1KVib2lm31N5ZTWbQyhzUsYpvPL7kH/U1wne/GRDUJZa0emaicNZ6zPEsIWvF5oti4yKCHip9P9qCt93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkrIWNLf05GuvSJiGHi+kRjtciBhpqAbLc2rdliO27s=;
 b=dkuU1rEoeuLjTz86r3KcvO20T/d7UIv03zVGrBVgOHLIZQmzfvNGr9gM7+9EBiJFHZ0culo7XOvgT/gJOJiObAVTSwRKCJNlu5Ozi72yhwDFdv2W0xnpyivpkpEqAI+YgqXebURSQh+jqGFffOexoL18unOn1xoay9UwAf56R2WnQ0mqBfWvLpTovaWrA4tp3TPRcGobaNatrfszyx/VRulQ06iFu1y2Bm002zTR0Y/IVHs5hx3MnL3FSn0TWIi+Z6IvtwLFRVsNITa4JdvfZugn3zlyDs0zCRLJ7qX1Fx4DgUBfIEs054Kf9YryoTFkA0TeFWgqTelWLmYnuhmdVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkrIWNLf05GuvSJiGHi+kRjtciBhpqAbLc2rdliO27s=;
 b=qb/80zsj99TU2V02KIL6DmI1S8Kh2Cmf1nTpAr6tPR9O+MtSYhZ8tPyfttLOEjmWFEK0/IhkkQOLDNfc2BJAWoCKo4fbpijCGPVJ2XnisO1Ej3Jo9m+1TeRjFWr1MJUJKHssCbc6hnXEidTm6uQP3Cxf17clOw33RcFmpsQOJKMiaDA0pt2JzuLspIiO3XvfJGGnDJY6FG5p+7wmz/wtKZuFfQjpUWMDuO02iN8lPo3b53ARmrhPUMBv8847/OXoJEOjlV1ZSlyd5+USIoVZpKiFG767Ssey3Swp6G6331f4O+QaOdlZBiYmO42GUow3QQMgo1RF6Xxrgct3t8qv3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by SA3PR12MB8440.namprd12.prod.outlook.com (2603:10b6:806:2f8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 18:56:39 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::3287:efd8:14bb:c5f6]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::3287:efd8:14bb:c5f6%4]) with mapi id 15.20.6134.029; Wed, 1 Mar 2023
 18:56:39 +0000
Message-ID: <0394d823-2694-9f7e-7324-f0e6deb887d4@nvidia.com>
Date: Wed, 1 Mar 2023 20:56:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/20] vfio/common: Add VFIOBitmap and (de)alloc
 functions
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
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
 <55b623e9-3f5a-1353-280c-e6012b5924e6@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <55b623e9-3f5a-1353-280c-e6012b5924e6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::10) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB5544:EE_|SA3PR12MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: eee355cd-389d-4b55-5998-08db1a86af82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YpasgqkiRrPazbChctJpIMluqV/gWVGhjygAuE7huuBJqbd1GCK2Clk1ZTJ07Tv4HEz5a1nY2lc6djYMGCPX1UvXJfa+2x0thxEWPW4XeVu5vmVLUj/Wxf4JxBGXXXrRCiHgE8e9lFvm/RlPO/I82HmP3zr66seJBaLWfKwdDAaQPpV35kq1jvUKF57NLwpO/qd3g+KQYE7VRu8pF5h8fbzNhREOfqndK8aeDwBZnrwLyQsOs7RJVHhySBakGTp5LeysYms4q9bH5YLmXqXYrHz9FWzP//krZxNQgHpvLq7ava1iluagcBVDn2BPFlvF4uoDelzVb7uNx7xY78739sccw4BWzktdd9AHTqvGe8EY54HQ+oN3OYQ7mNlkGc5QW11UnXTlnP4zq4xn8qpuDbpN+TtYMNDgNPX+bKJxHMdRyFBmFLdd+LT3m6l0TtYvA/3+zHJ602zbMNVX8JS+OX7US4TyvwrJDiTJ2bzQB8aDE+qXaIvxnVJJL+hDUxRiSCeopfb++XzZrQ4LgDoj+o5coR1whiDcTM9P43JkkClduTeMQC2K07mx7//TgAaGj1dSIegNSgFuod9aiOH+ffPWYnZGZsDC6f4Dz2BiTFujU8B7Y4zUOaqf8naN8sj/+UqU1bB3TDcfopFI4IUSFXMhXFrHTNadwV8xvuK5iPDMPk6jy2ozhlqu9FPzcPI+O9vxKBfuZ+ZNz97DIR+u/72cM/VbYg5vxFQfOMLmRGE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199018)(8676002)(36756003)(66946007)(86362001)(41300700001)(2906002)(38100700002)(5660300002)(31696002)(4326008)(66476007)(7416002)(8936002)(66556008)(66574015)(2616005)(6512007)(53546011)(6506007)(186003)(83380400001)(26005)(316002)(478600001)(54906003)(6486002)(6666004)(66899018)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z21KYi9vbnlJNXoySkdDeW4zZHlZc1BUcWpJV0JyYXN1Mk03SDg0VlZJaUg4?=
 =?utf-8?B?SDlkT3RzRVNNT3NOZVZ4QTV1OG9kQXpja3VQcnN6TkpVTnJEdC9RUGkwbFZ3?=
 =?utf-8?B?V3hrS1hiMnNxZnJiY3dseE40TWdPSGE4bmtGZVdMWDZMTlVONzdtWlpaQ0Ur?=
 =?utf-8?B?dnFhNkExTklGY3pzenNHc3hLNzlKakFXemVzdm1UOS91Ry9aZjl3ejl5STZS?=
 =?utf-8?B?UmRra0F5K0hCMzZYQk5ubXdzdlNadGIwaGd5NHNwNmRVb1YrS29NZW5rQTZT?=
 =?utf-8?B?R1RvampMQWFOd2N2djhhR2hsZzlZcUJBMVlmQ3U4ZG5uM2N4OVVBSGVpRGxl?=
 =?utf-8?B?SFdOSzJnVDFudzZmdENMMlBDN1VxcjJSU0dObmxwUTUzK050Z3lrSHBtd1Rm?=
 =?utf-8?B?RjYrQWRCaVVRQ3pZcXFLdi9YYUZnZXl0ZXB2NFBDb0oxSFliNGFvRklucm1t?=
 =?utf-8?B?SmtHZFN4S2dueFZVR1Q3a3BQeVFwekx4UUhEQmJMSktzOGd3Vkd6TnpxbXZy?=
 =?utf-8?B?VjVpVXdrdXRlYXVxVzQvVnVpS1FZQ1RBQ09PVHkrTGIySDY1NDlhUGNFazVz?=
 =?utf-8?B?WS9IRng3TzVISkRUMjRTQnJJSTZLR1RSTG95Ny9kWmJYZlRDUzBUdUNHZ1hj?=
 =?utf-8?B?K3ZreFpZYlFxNGx0T0FiZnZXTzZ6d1k2Wm1ZVVprMGdQOFFEeG1adjVUU2RW?=
 =?utf-8?B?Rm5UbG9GT2JDVUNKcjZIS0NxU01iS20vYnhJMmdraUQ2eEZreXhXUWw0NFhD?=
 =?utf-8?B?a0NnMkRaK1ZTdllGRGZEMmswcW81VEo3ZmVpMHpDVGJOMEw5SUh1dVg1dytQ?=
 =?utf-8?B?NmQvbXFKYkZOSVBuWms2S1B6Tm5DYVR3VEpkUjhxdjVnOWttb3U3eTEySDlv?=
 =?utf-8?B?ZGl2NmZ3Wm4zSk0vNVY3ak1SZkpVSGRHcmdqY2dMMkpuazBoYlFZVWtSSjc0?=
 =?utf-8?B?Y3VVc3BNb21tMi9XaDBnUGZxdVBIUEJ6S1RkWGh3R3dlZVVrT1h3aHFZMFJX?=
 =?utf-8?B?NXlQclFsYm5PdFBWQzNOdWVvM2RIZ25lRlBkbFR6M3p5NGMxazVaUEl0UWZs?=
 =?utf-8?B?UXdpK25oUmMwOTJ4aVQ3TmRvM0JISFhzY1hJMVQzcEx0aFhjUVNPNVBoMEw5?=
 =?utf-8?B?U0NyMCtRZG8rVUp6M0oyNmRpWWxDWm42em1UTFIvUVkvcWx4dWZ4TFN5R093?=
 =?utf-8?B?VVVURVkvdEUxLzN3Wk1BODk1b1ZJcDU5SDNiUk16YURxNWw3N2xudWprUHV2?=
 =?utf-8?B?bHN0a3diM1Z1dm1PL0VZZmhOeUFoRUd6VlFhSkdkM3oyd0VHM2dqZG1mQXVH?=
 =?utf-8?B?dVZHZGpVeUl2dUZ1aGdkanBNYnRMWlVCbmhseWpPSXdIL2R1TXQyanNqalVn?=
 =?utf-8?B?WU9IRERwajhkOGs3VHhGUDFrT0czMEgyVlg0b2wwUVdoem0yejBubFkwcmdv?=
 =?utf-8?B?N2JNUDI1VE16bDNSY3lvS2h0dThnZ2FNaE10R2o0dEhBZXFTTDlkblRxT2Zm?=
 =?utf-8?B?ZWIvUDNUOHBSUjJjU1pCdkd0RHFpRFh4aEsyQ2UzK0FDeWtsSUpsMGpFY25J?=
 =?utf-8?B?U3BxSW9UUHFjdXdkR3ZJQTN5Ny9Zb2Z5MXRCeVkwQ0xZNUNDYjkzNW11TmVM?=
 =?utf-8?B?UzZzVUM3d2VkYkRZTnpDV0trMGpwZWhJT2NkWWwrUmNKZnN1a09tN2pkOHVE?=
 =?utf-8?B?cXZqcGMrakkxSHVEanhzaUdEMHVLS3ZVVVQ0dzEyV242bkp0M0NoOTRMbG93?=
 =?utf-8?B?MW11VFhxTHJmRVJLZ29xUmtEWVdNOHludWIvMjEyakIxczM3eGJyUHh1L0Rh?=
 =?utf-8?B?bEFENHpoVUIxTnBCdmdmb2szV1ZLN1VaZ2pNM29RR1NONjVQZEJoOStRbS9C?=
 =?utf-8?B?ZmR6SXRMTTNTZkNENE93c1RiUTI4OGErS20rSGlqclREOFlZU1BIaTAzV2Zv?=
 =?utf-8?B?eVR5U1BLY1RxNXk0NFVUT2xYSG4wakJ5QTBuQTQ1M3dyejJLQU10MUJnRGFN?=
 =?utf-8?B?b1RTMnpqRDArclV5VG5oODlYTU1BMkQ4VlNtbjJOdjUzdUwrQXNNRU1HMmF0?=
 =?utf-8?B?VzN0Wlo4MWVhcGIxb3pwV21jalpsRU9HOE0vU25QTTJkd0ExakFRbmh0SDR5?=
 =?utf-8?Q?GhZDiyRe5UbBVEJ3p58hWhLRc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee355cd-389d-4b55-5998-08db1a86af82
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 18:56:39.4780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iqh/qcgJtEDYczYgEZT6/HKFKD30VEI84jwMBo6B7Coj5Vl59LalwVNu3XcUPAlWDEzO8Z9x+Ixkdmd74Iv7UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8440
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::600;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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


On 27/02/2023 16:09, Cédric Le Goater wrote:
> External email: Use caution opening links or attachments
>
>
> On 2/22/23 18:49, Avihai Horon wrote:
>> There are already two places where dirty page bitmap allocation and
>> calculations are done in open code. With device dirty page tracking
>> being added in next patches, there are going to be even more places.
>>
>> To avoid code duplication, introduce VFIOBitmap struct and corresponding
>> alloc and dealloc functions and use them where applicable.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   hw/vfio/common.c | 89 ++++++++++++++++++++++++++++++++----------------
>>   1 file changed, 60 insertions(+), 29 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index ac93b85632..84f08bdbbb 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -320,6 +320,41 @@ const MemoryRegionOps vfio_region_ops = {
>>    * Device state interfaces
>>    */
>>
>> +typedef struct {
>> +    unsigned long *bitmap;
>> +    hwaddr size;
>> +    hwaddr pages;
>> +} VFIOBitmap;
>> +
>> +static VFIOBitmap *vfio_bitmap_alloc(hwaddr size)
>> +{
>> +    VFIOBitmap *vbmap = g_try_new0(VFIOBitmap, 1);
>
> I think using g_malloc0() for the VFIOBitmap should be fine. If QEMU can
> not allocate a couple of bytes, we are in trouble anyway.
>
Sure, this will simplify the code a bit. I will change it.

Thanks.

>
>
>> +    if (!vbmap) {
>> +        errno = ENOMEM;
>> +
>> +        return NULL;
>> +    }
>> +
>> +    vbmap->pages = REAL_HOST_PAGE_ALIGN(size) / 
>> qemu_real_host_page_size();
>> +    vbmap->size = ROUND_UP(vbmap->pages, sizeof(__u64) * 
>> BITS_PER_BYTE) /
>> +                                         BITS_PER_BYTE;
>> +    vbmap->bitmap = g_try_malloc0(vbmap->size);
>> +    if (!vbmap->bitmap) {
>> +        g_free(vbmap);
>> +        errno = ENOMEM;
>> +
>> +        return NULL;
>> +    }
>> +
>> +    return vbmap;
>> +}
>> +
>> +static void vfio_bitmap_dealloc(VFIOBitmap *vbmap)
>> +{
>> +    g_free(vbmap->bitmap);
>> +    g_free(vbmap);
>> +}
>> +
>>   bool vfio_mig_active(void)
>>   {
>>       VFIOGroup *group;
>> @@ -470,9 +505,14 @@ static int vfio_dma_unmap_bitmap(VFIOContainer 
>> *container,
>>   {
>>       struct vfio_iommu_type1_dma_unmap *unmap;
>>       struct vfio_bitmap *bitmap;
>> -    uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / 
>> qemu_real_host_page_size();
>> +    VFIOBitmap *vbmap;
>>       int ret;
>>
>> +    vbmap = vfio_bitmap_alloc(size);
>> +    if (!vbmap) {
>> +        return -errno;
>> +    }
>> +
>>       unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
>>
>>       unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
>> @@ -486,35 +526,28 @@ static int vfio_dma_unmap_bitmap(VFIOContainer 
>> *container,
>>        * qemu_real_host_page_size to mark those dirty. Hence set 
>> bitmap_pgsize
>>        * to qemu_real_host_page_size.
>>        */
>> -
>>       bitmap->pgsize = qemu_real_host_page_size();
>> -    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
>> -                   BITS_PER_BYTE;
>> +    bitmap->size = vbmap->size;
>> +    bitmap->data = (__u64 *)vbmap->bitmap;
>>
>> -    if (bitmap->size > container->max_dirty_bitmap_size) {
>> -        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64,
>> -                     (uint64_t)bitmap->size);
>> +    if (vbmap->size > container->max_dirty_bitmap_size) {
>> +        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64, 
>> vbmap->size);
>>           ret = -E2BIG;
>>           goto unmap_exit;
>>       }
>>
>> -    bitmap->data = g_try_malloc0(bitmap->size);
>> -    if (!bitmap->data) {
>> -        ret = -ENOMEM;
>> -        goto unmap_exit;
>> -    }
>> -
>>       ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
>>       if (!ret) {
>> -        cpu_physical_memory_set_dirty_lebitmap((unsigned long 
>> *)bitmap->data,
>> -                iotlb->translated_addr, pages);
>> + cpu_physical_memory_set_dirty_lebitmap(vbmap->bitmap,
>> +                iotlb->translated_addr, vbmap->pages);
>>       } else {
>>           error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
>>       }
>>
>> -    g_free(bitmap->data);
>>   unmap_exit:
>>       g_free(unmap);
>> +    vfio_bitmap_dealloc(vbmap);
>> +
>>       return ret;
>>   }
>>
>> @@ -1331,7 +1364,7 @@ static int vfio_get_dirty_bitmap(VFIOContainer 
>> *container, uint64_t iova,
>>   {
>>       struct vfio_iommu_type1_dirty_bitmap *dbitmap;
>>       struct vfio_iommu_type1_dirty_bitmap_get *range;
>> -    uint64_t pages;
>> +    VFIOBitmap *vbmap;
>>       int ret;
>>
>>       if (!container->dirty_pages_supported) {
>> @@ -1341,6 +1374,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer 
>> *container, uint64_t iova,
>>           return 0;
>>       }
>>
>> +    vbmap = vfio_bitmap_alloc(size);
>> +    if (!vbmap) {
>> +        return -errno;
>> +    }
>> +
>>       dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
>>
>>       dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
>> @@ -1355,15 +1393,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer 
>> *container, uint64_t iova,
>>        * to qemu_real_host_page_size.
>>        */
>>       range->bitmap.pgsize = qemu_real_host_page_size();
>> -
>> -    pages = REAL_HOST_PAGE_ALIGN(range->size) / 
>> qemu_real_host_page_size();
>> -    range->bitmap.size = ROUND_UP(pages, sizeof(__u64) * 
>> BITS_PER_BYTE) /
>> -                                         BITS_PER_BYTE;
>> -    range->bitmap.data = g_try_malloc0(range->bitmap.size);
>> -    if (!range->bitmap.data) {
>> -        ret = -ENOMEM;
>> -        goto err_out;
>> -    }
>> +    range->bitmap.size = vbmap->size;
>> +    range->bitmap.data = (__u64 *)vbmap->bitmap;
>>
>>       ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
>>       if (ret) {
>> @@ -1374,14 +1405,14 @@ static int 
>> vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>>           goto err_out;
>>       }
>>
>> -    cpu_physical_memory_set_dirty_lebitmap((unsigned long 
>> *)range->bitmap.data,
>> -                                            ram_addr, pages);
>> +    cpu_physical_memory_set_dirty_lebitmap(vbmap->bitmap, ram_addr,
>> +                                           vbmap->pages);
>>
>>       trace_vfio_get_dirty_bitmap(container->fd, range->iova, 
>> range->size,
>>                                   range->bitmap.size, ram_addr);
>>   err_out:
>> -    g_free(range->bitmap.data);
>>       g_free(dbitmap);
>> +    vfio_bitmap_dealloc(vbmap);
>>
>>       return ret;
>>   }
>

