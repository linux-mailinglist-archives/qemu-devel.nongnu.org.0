Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEB1693829
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 16:42:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pREUY-0003PK-NX; Sun, 12 Feb 2023 10:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pREUR-0003O7-9S
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 10:42:07 -0500
Received: from mail-dm6nam10on2064.outbound.protection.outlook.com
 ([40.107.93.64] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pREUP-000431-Fi
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 10:42:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Boehin5jodfOk9XAbKRj9DQMk+c6O7Fm9LAJ5Dt8X7WH1CKbzrLZl1kXNjVkZi0+pgXqDkJpRLETtK3qaro4st0SrxTRZOu7EXCP/SUWDHLhtwdorHkaIJW6nmBzCKa08jxBdFFUxV3WB37dfVtVxRwG8F8Yvh0lLL47Y8z2pOafwGID0wkOt4kV1A3FIvon05w1CXlwi+wxTmU4iO4R1Xzwot15Msd9vu5AM+QthhyWGew091SvivDkf3BVzkbv+TuMzyqj0YOdzRfj5ODcW83n9FO10BMW8yBfdS9AL2USHBY489cwrj7KsvYcTKO3o9Y4o7pSVA6abgpMVUNxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HliOF0PkYZ+XKgzXjCgaM6pLMJT0byGHJEr2NaFMakU=;
 b=PaGh/MlTn9/mjdX4dfTEYVNj333/8rZJNbgtIpqJri4uo90Ec05KCcJJWYC36UqdFxr/rM52VTm0ZDezWjPkSZEyZ3yumbXE3CEgYiG288CpjGCuNE5lWAoDIXPXi5WjI3b8X7SX0EVsPvw1fusow0Sa5sq3JARJwqjZL3msXm7q091GLEJMVG8pyRdXHcp/ffXOXLd8oIUW4oxEoJhjlxs130Eh3K9Oom4l03ViiRWR+A0nP1d6Uwj83U3Mn3nUP9uDd9IVbCqrJr3r2KblLJk4bxXebN6PpGRojAIxMK/jL/0iaM/J+7w6OosDmsUADtw/lgWTtwoZGuGhcONeMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HliOF0PkYZ+XKgzXjCgaM6pLMJT0byGHJEr2NaFMakU=;
 b=bLbmkFojLLgFTsTVB16FBpOGxHcPKlKD72TC2cmK514GgUiE40WeoIMN8M13HFWqRLSQiSGgrguWkwOk7omJh2pSlehw1L8n6bZyjgpa/6SZD4sgrwfH5R/Oo5egVvlExUxeJrl3sXt2++X6UlCLYIw2necP8BX98UyecfXlPQ4p/9i/rHp7IbLkqAC8VhuDb46+ARb4FCzfR7YYKldshffTOJF2gOahrMZhbd8lNOms2R2go69A80S3dk7ResoMpRNXBTUGxeWcPlteOiND3lVrQxMhu1JVPi12hdoCH99XCNxhcGSVwS/aXZP+pIYaO95nZs9zHB2nEAtAf6V23w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 15:36:59 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%7]) with mapi id 15.20.6086.023; Sun, 12 Feb 2023
 15:36:59 +0000
Message-ID: <5bc7fbe1-8ee6-d839-b128-b323fb7c9b92@nvidia.com>
Date: Sun, 12 Feb 2023 17:36:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 05/18] vfio/common: Add VFIOBitmap and (de)alloc functions
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
 <20230126184948.10478-6-avihaih@nvidia.com>
 <20230127141101.7d21f937.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230127141101.7d21f937.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::10) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|DM6PR12MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: b6534cf1-79fa-443a-14f7-08db0d0efad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kwnJgyimkvDGX41TLSgwi+mT/JAn2q7pIWXlek3J7/RNdVJpzWZuJiURpLH7BDa3ITERUd6I1e75Oh5aC7/8VsVgKo3tpD6QgYALmnPXeLJ4ZMbpXFBcAImGryoelf1rs4ryzyVNPMV8D+37bX7+bi3Uisehl0RxtipoIsePlMc6S8WYAkP7GKkT3PJDZszVv4mdUf9rJ/EuC/Xx3keoWGbKpjQaNBt+KaYZA9tHDIDHTDkdnIJv3tyzpnO/IsIGGDpwoOwPnNd5i3iL6NlTcw/mG+IuGx6deS5BIaswZDrdv2opSLkn3m9LNo0x9lRfo1dS8qSGfrvkfvGvx5rpxdOOaew2f3Ppa7AxOPTb/LGOzjZF9xO97Ml7ITSJFfyaT/fAQm0UHXQ3sWPZkTqYiIm/d71b9S92kATby1YzK2Zl6R5/5Zf9pyfDJe+PkR796TG9xsbQLpZPyOC9x/GXxpzoiLKS3OjjflWLzkR7W6JRJ3uVwNIRDDj+D7JW6+HV7qMGYAcMy0aQCN78GFCPsQS04q4LmE1ZLQw1dzIoNvyJSetQOklTGHxp8xJMBgQr/Cj4bF3JcoOecf/wJMJ+PegsrnveQ4dHLWWJyh3Jotq7uOIUT47gr+q69UK/bgrzH248UC2u9p7sNrzg31x+AZVSFLQa+m5iHPyo6cJgU6LDdFAaseP8G8E60Z7RNl9eznB9ZAA67boPGmLZmt+bGm6vggc5PWSEGpHDGbcl584=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199018)(6486002)(478600001)(83380400001)(36756003)(38100700002)(86362001)(31696002)(6666004)(6512007)(26005)(6506007)(53546011)(186003)(2616005)(54906003)(66556008)(66946007)(316002)(8676002)(6916009)(66476007)(5660300002)(7416002)(41300700001)(66899018)(8936002)(31686004)(4326008)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmlkV25TVVVnWWlCTVptYndYREk3d0xhVW5WdUcrcUphZGQ5d0tkZUpzVHhQ?=
 =?utf-8?B?NVo4L0xjeGNLRmpoaXIrOVVaTGZuV25GYTNFODRiWkJ4THFLb3pWbzM3SFIz?=
 =?utf-8?B?eEV6YWtZTzE3WE5jdVVjL3dLRThQMW4zZFRHcnh2cnlqZ2xKVTg1aHVSZFpw?=
 =?utf-8?B?TXR0cEJHcHBBNlFvSFBTbnQ2R3dpbWlEaUZtajNMNlNEalJOMUw0OS84UGZx?=
 =?utf-8?B?N1Z5bHZwVCt4Qi92Umk0cU1nQjJTMmdQK1dtaldxemFwR2k5TEU4NnIzVGV0?=
 =?utf-8?B?VDdsUVVMek0wMXkzUDRZNHJPNllUNFdnQUtCcjFGVGFuK1hrbTBXc0wva3lO?=
 =?utf-8?B?Q3QzVllEN2VKSjhaWXNTNnFSV21RYmtFSjlmQW14cVZQeE1MMlRyV2p5Nysv?=
 =?utf-8?B?M3UwckpVeVprTXNQejEwZVViQzM2eUsxYVZTajBZUS9yYUdPS3hmZ3lRamp3?=
 =?utf-8?B?VHlEc1IvRUs4K2YrL3llVWozYjZMTStkaGZDZnJkOVI3UDlCMk4zaDBzTmda?=
 =?utf-8?B?RE1PdE5VNmRVWk5WRyt6Wlk3M0tFdFdGdG9Sbld1bUV2TkVpbUpDSG9BbC9G?=
 =?utf-8?B?ZUhIN05RMll6VTEyQWpCbkU5bm9Hb1NUZnk5VzZmdHlLN2p6LzE2aHFhaVd3?=
 =?utf-8?B?akJ4S1JIaUZtdVNsZVFra0pKL1lNTWZBZno5c3ZFVCtIR1MzdlowZnFGQTBp?=
 =?utf-8?B?UUxLcXJHWlhKY1VvdFFFMGhxQUh4Nk8wSXp5Um8zTUhib0VjNTFuYnpRcG9a?=
 =?utf-8?B?NjhPV0pNMFYrNWtxQXhWTU9HTmQ5NkhtQVY4MU5GcVBtSG15OExwNUFzV2hu?=
 =?utf-8?B?VG5TdUlLTmZxMFNodWtmaG5GOTFQVys2ZUVrMVdrWHZYMExwYUY1TGUzeC9v?=
 =?utf-8?B?bDVaSzAzaEQvcmRUNFBBNjdCeUc5aFEzdGkxZjJibVdER1RmcUZpQ09tWDQ1?=
 =?utf-8?B?eDAzTkJsS2d2TmN3Z3lPRUY0S1AzY3crUnhLa0drOFlsSU5Qdk8wYWZtTEhu?=
 =?utf-8?B?NXYrMTR5S2w4U2V3QVVmbUxrV0dvdTRDeDZMdDBFdVdxMjRDeEw4dHZ1WkZF?=
 =?utf-8?B?ZFEyVEg0NllXZ2xKcEFuRFRxeFU4RkMrNFVKYXdVNi8yTGxlR2lucjMyc1lj?=
 =?utf-8?B?c3diaWRmMC9uMW1ydFVsVjlnUHdSaDc3Nm01eDFleUpNdW50Qy91U1loaERs?=
 =?utf-8?B?RlRVcUxxYTQ3d1FJVFhQQ1p1eGI1NFRrakJWb2UvUXA2aGZWOCsxWk5CbmRt?=
 =?utf-8?B?VEZyYXZqUlk0TXFZSHlSZTBJYWFrUjdLaGxLdWNFZzIvNHhtV1NWNVI3RFl4?=
 =?utf-8?B?aDcvbUlZYkhFWENjTXRGM0JIYUFuT0RNeXBhM214Q1c0ejlHRkdQc040N0xx?=
 =?utf-8?B?UndicXBocEdzQXpXQ0ZwK1lzandsNjYzSVg1bHNiUXU5TkpoVUVLMVdIYUNn?=
 =?utf-8?B?SDI5U2g2WjhLWHhqOWxYSXozSkxuK3oxMkphajZ1bWhQWFFlTjZDY3VxeSto?=
 =?utf-8?B?a2R2cmpDd255ajRJRjVoVWVtWlhJRGpLdjFURXJ5dERjRWNYNnZTZ2FRNktI?=
 =?utf-8?B?ZUt2bDc0aDJDbXlQQUg1a2svN1N0UjZHVjdpR0RhclFhSnRyMzExS0NpampM?=
 =?utf-8?B?V0lMdUsvdVJGVXRJZFRNQnZGanNyalRTRnlOVGhOa1A1Vm5GRmtiTHUzcDVh?=
 =?utf-8?B?WWgzNjczd1VjSlRXRGZqdWpnTllmZ3c1VkxwS2tqblFSa09DSml4RFJ1ZHNl?=
 =?utf-8?B?N1B4bjIwbU1DYUlEWjFZZVdDNWw0SU1Da3lFb2lVeWlzcTRmc2Q2ZzF5UWVh?=
 =?utf-8?B?OXF2cGN1L1h1d3V2UlBsSVgwMmJjbzF1b3hibUtzUTdTZGFyWGYxL2VLdzVD?=
 =?utf-8?B?UmtXeWxzVVNhSWQxVkQ4bWpvdFRUNTdBZ1hURVJ1bjlTWDVDczhsRWhiMVpj?=
 =?utf-8?B?cmFtNUdGdWcxVG9zMFA1aXl5Yi9TS3RqcnJTdTVXMmpyWXpZU2piK0NFc0Q0?=
 =?utf-8?B?MzVMSE5jS1dXUTRhbkJqY1ZFaldHNW5PQ05nOERLQ2ZoM3pxVWtwWkJmZTll?=
 =?utf-8?B?K3U3SW9IWE1ua2g1SDVwZjRZUWhvbnBvVFJKODhuSnFKVTlwZk1uTDNkcUl6?=
 =?utf-8?Q?tuPvUb5jSjihryXNdoCOLWVjM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6534cf1-79fa-443a-14f7-08db0d0efad0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2023 15:36:59.6232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xoxLsHTrBru/wwKGxnZrqvMeP/mmC16sm4/H6Bwb0cgHMfzy8+3dETANp8mwMfPtG7JFiG5F+w4QKG+EzWjeOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313
Received-SPF: softfail client-ip=40.107.93.64; envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.348, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 27/01/2023 23:11, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu, 26 Jan 2023 20:49:35 +0200
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
>> index 8e8ffbc046..e554573eb5 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -319,6 +319,41 @@ const MemoryRegionOps vfio_region_ops = {
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
>> +    vbmap->size =  ROUND_UP(vbmap->pages, sizeof(__u64) * BITS_PER_BYTE) /
>> +                                          BITS_PER_BYTE;
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
>> +
>>   bool vfio_mig_active(void)
>>   {
>>       VFIOGroup *group;
>> @@ -421,9 +456,14 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>>   {
>>       struct vfio_iommu_type1_dma_unmap *unmap;
>>       struct vfio_bitmap *bitmap;
>> -    uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
>> +    VFIOBitmap *vbmap;
>>       int ret;
>>
>> +    vbmap = vfio_bitmap_alloc(size);
>> +    if (!vbmap) {
>> +        return -errno;
>> +    }
>> +
>>       unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
>>
>>       unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
>> @@ -437,35 +477,28 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>>        * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
>>        * to qemu_real_host_page_size.
>>        */
>> -
>>       bitmap->pgsize = qemu_real_host_page_size();
>> -    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
>> -                   BITS_PER_BYTE;
>> +    bitmap->size = vbmap->size;
>> +    bitmap->data = (__u64 *)vbmap->bitmap;
>>
>> -    if (bitmap->size > container->max_dirty_bitmap_size) {
>> -        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64,
>> -                     (uint64_t)bitmap->size);
>> +    if (vbmap->size > container->max_dirty_bitmap_size) {
>> +        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64, vbmap->size);
> Why not pass the container to the alloc function so we can test this
> consistently for each bitmap we allocate?

Hi, sorry for the delay.

This test is relevant only for VFIO IOMMU dirty tracking. With device 
dirty tracking it should be skipped.
Do you think we should still move it to the alloc function?

Thanks.


