Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53016A0D15
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDeC-0006M5-UU; Thu, 23 Feb 2023 10:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pVDeA-0006L6-76
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:36:38 -0500
Received: from mail-dm6nam11on2061a.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::61a]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pVDe7-0006W4-O2
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:36:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1IYB+k9jlx9+9sygXUvwoytZtx+24AmyRkInyq0nwgMta0eUesgs/t3lNJYixp9HzHrfHSxg5ixKzJAZxSxwKJ4wCJXrnSzCVXVJSU1vyfLI64jP4wyjegLOxtPFinC+v45yp2eAcIEMIJEDKb2qkOtwV0J/a/opleScqBI0MSayTCtNtzztLEhjvTAofbXdLm7xEqPQ3kVtVNWOLXpxVbPoKOwNflepTGO81+yjhq6TSR2PufBsYmBMcbchNu66AnlFQAvKy6MnTBzqKV7QXaKsiopg5naoiOFobU/e+QIJZg+MW/3QbdVvbO9zR2u3RWaZGLdL3TQWz7zYDWexw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqP4jPnF3R2K/HP7NNdEAVTF7mOXAv6rbukvqiRfDqY=;
 b=fAPOl302Ok3lIqSTezW0ERS5f9io9nDZIIm7UHuIZz0m9RCqJb4nmujz8qPnumI23iuD3apSI+y7UH7hgHrOCvqam68yWV9sEIDD9Yz6KpSVBo/I2XH44VUxBxU+DR0nt7z4ViLZJXW3CpjvubjQXivwoiJJI5AD3cYjBBcXdXUZk00vcsllHMF/N06d3pWZDNAwhYB+Q6TL38paRTBUgN3FqgsH3q4Tg4IaH/pMhipIZlD23tXodlYQyZNZIH2iS39BoKgpQYv9Wy4fGOeT5leoME1z0uARupYggAi61YCHIseGLVjM1TkgJqsKN5cdNUCSkzw6v6wZr1fIoItb/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqP4jPnF3R2K/HP7NNdEAVTF7mOXAv6rbukvqiRfDqY=;
 b=ILj4ZgWb9lxO8WKRruyNIzdy0370KzX6XFaF2x7xAmDoNdobWhXvkClyQIROLJiOnwXFJcbYa4GTri7/FxNvMG/UhBM/K9WhVgJ6ZcmeIbn09vp818bI+ztQTn/iNaCmTJyuRgvbSqxmop+gzbKDys8lB21oSFc9Tc43U2/wcUpqBHXPu9xp6TOy2aGwlUVsOEplg1ofELpNdOcZhdoelL1su0bXwDYfeS8DsLjGWGII4p8DhJWsGUeEnozAyLCw6M5PmZFN3+jb99a1zNlb2C2IggF2gw4cJdHJqRndS9RaTjifCzUSykLtXvr6193fZqy59D/+J0nOaZqXxnPLAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by PH7PR12MB6539.namprd12.prod.outlook.com (2603:10b6:510:1f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 15:36:31 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb%3]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 15:36:31 +0000
Message-ID: <612828d4-d9a3-02a9-3b45-bc07f0bf16f9@nvidia.com>
Date: Thu, 23 Feb 2023 17:36:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 11/20] vfio/common: Add device dirty page tracking
 start/stop
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
 <20230222174915.5647-12-avihaih@nvidia.com>
 <20230222154043.35644d31.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230222154043.35644d31.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0513.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::23) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|PH7PR12MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: ae264d09-9d12-4c84-544c-08db15b3bcb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t+uyOOZw3POLHrKuUyvg/ONP3T42/RsjKHwjiNRu8Q2UkYZx9EYur8q+J2LHnneB76u/skJxb9yxXJNsL9SJo7P+CuXgPpNBNZuLuXZz66QmWz9UjZmn4Oh3LQmPuDdE+LofE31zdnZ3SO2H504vH7/ihDluSneuovZ3Yvx+HFDQfcxi0MPpGVulG7KpyLakLVWKmtyIs3SJGAkxkAZZxyBkNDQT8D0w8g7xnPlTkU2Bx7RnHdFkMdYIXV+unQd6FyZhc8PJ4LWBSKD1DtJEtQwgoyDMFAJI3XhrBycBT+dl+n4k4vMGlMK6hlp3ncmMYAjDsdVG0Yrk0FXM8ct4spssTs/uXK5Gw2oBz/Mn8selrdKNt1otytlSW5SOVzObMsHCZdqorzbZ6gT4ksE7aqIxfB+30nm9SkU5LkWvD8GSjhYK8Q1PxQ1k7WWs+XZQnNzOdQVhqPoM+hEt1G1/cbkaIVeoOzgRrDzjHXey7zac2R+WlkQr9DfqzvsikGvXrgoQjnsyBte6OqY/GO9H9ycLf6Ei+dprSFB67l9WMigWDgHdAqHR04nqUuWxs67usOsbqt+04CMyZUwpaPSosyQ5cVXQ6fCM1OUuyOHusYBXXPdCPKMqc02qWuNfQNukVtjO8+PBlmcmT7mQzHp5vtbZGFAZKWD82+i/6GHsAsHnKI3i7vPyXNAw0LZ70wFU7+M0etaYf4QF292zpBPTzFc3XBZ3YF0bZL184/G48dA8HJdxTsFXsavBGVkwsD+N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199018)(7416002)(86362001)(31696002)(2906002)(38100700002)(31686004)(478600001)(6486002)(53546011)(26005)(186003)(36756003)(66946007)(66476007)(66556008)(83380400001)(54906003)(41300700001)(6916009)(4326008)(2616005)(6666004)(6506007)(6512007)(8936002)(316002)(8676002)(5660300002)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE9hakJQekZHeUtOUWNFeUt3aVF6VUs3SDlJbS94OEpHb1RuNmExSzFEcktX?=
 =?utf-8?B?Y2l3SjE4TjFjYzhNeFd1SC9sUmR0TXIxSXM2VXdJMXZHSmxMcUlzRmRlTFpY?=
 =?utf-8?B?RVpCU2RoVUlwei9xaDQ3bGlYM3N0ZkZIOGhEcjZ0dE5rdUVwR082NUFOcGNK?=
 =?utf-8?B?Z0FIb09pZzBJUDBMdnY0akdzWndHKzYwdFFUbHBveXFLSzBONUZDUzBNU2g3?=
 =?utf-8?B?aWxGVlhyS0tQdlNpN2xjdXJzWTJSL28zemcra2lzQVFSTlhxcGFUYm1rQi9C?=
 =?utf-8?B?MGJDbHY4N3NROXp2RzlNTlR0UUxUSzI4VlVXY20rMWJXM2RyWDFRUDRsM3Aw?=
 =?utf-8?B?SC83T2gxZzgrdzJqM1NnOXJ5TmYyOHlkUE4xZ1VadGRiUlp1N1A3TTRmTng2?=
 =?utf-8?B?VExYeVptMFgweWxDK2ZPc1dKSzF6RFVyMmk1ckh0R3NnbHRhQzJFL1RUcjcw?=
 =?utf-8?B?ZnlBcmY1TWpZeTJYWXU4VS8zbDVHSjIvdklzWFBveThGdldFUHo2czkxQVJ0?=
 =?utf-8?B?UnNkRTJ0NnNqejVzbGVDUXdVQ3VSOENYUU42TXdHRTJwbE9tTm8xallqdGF1?=
 =?utf-8?B?NW9NVG9PcEpDcEdYSjliaUltQWZNSEE5M3lmdkQxdG5zTWdzQ2ZPa3lIYjQv?=
 =?utf-8?B?cVVnbkRmSHpwLzlGNmJJVFVjSGFHOS91cVpqZS8rakRFd2pRUzRqS0lwaW9Z?=
 =?utf-8?B?Q0hFNm1hYWlYOXh4d2pJeDdFbkU5WnJWclViVG5QRWJWZGVYY2NJbzdsMWs0?=
 =?utf-8?B?UTJpMzBlRGZaQ0ZxUGl2ZUFQQ0x0RG1hbXRuM3RPWWtuVXlFOVQxeXVZdnU2?=
 =?utf-8?B?cmJkTnhGOUVZWVVWbDN1T0FiczVNMlpLREVRSUo1dzNVWTRZaTNRQzVMOE9Z?=
 =?utf-8?B?aWU2NEZRclhjUzMxOHlkSjVoUU9UQ1pYUkpXOUNjbkErMFBOU2YzYmFiRnUz?=
 =?utf-8?B?bjEyOTI0ZFYzbUpOY04vd05wdDFpQzZ6NDNMZWxSOEYxUnZxdG9UNW5Nc3pP?=
 =?utf-8?B?OTg3Ry9ZbzQvazZuVWx6dXBOZjhyT2k0WnM0dkcyQjZYUStyWUJsOEhzdWk0?=
 =?utf-8?B?bHhRNXpZa3pRUDJsb3NzRjZhNEc1S08wUi9lWVZZbkxqWit2d1ZRdnR0L3o0?=
 =?utf-8?B?NzFaUWtLVm1lNmpscXR4NGR2NkdjckNhU3hDRVFLK2lHYTR3SHk5QmRRUjdi?=
 =?utf-8?B?MnVoYkRkMlo1QWdiRFhoYmIzMVZPaU82ekdqeHBvZnhSR010dVhKUVltN3VQ?=
 =?utf-8?B?dFRsYURPOGVHRjVhQlA1WlBwV1dSR1BnQS9USkxvQ3ZheFZGKzJtdmRlMkdT?=
 =?utf-8?B?Mm5CN3pNMVVDM2VyY1hOeVBQanpUVVFPSVdxWDVHSHdxaUVGRm9OZEdlempL?=
 =?utf-8?B?am9GYUYrRkdjK3RZb0xFUEgxcFRSbzl1V0lSUHh5anZWM0lPQnBmS1NjQ0xj?=
 =?utf-8?B?TERwSVlzT3VVUEdZZHd3RkxSYzk3c2k4NE9CU20zMlRIOGtMQzl3amFPdnp4?=
 =?utf-8?B?RHNsV3JVMXFIbEhJSmJPY2ZyUlBXZDNlL1B4VEhyVzZ5TURsYWJSWUt2dXg4?=
 =?utf-8?B?WVQrbFhzSDYzY3ZmZXZFTVNBbTNwWDllVXlhOE5vUSsrd0pSNGhhVGw4T2ZG?=
 =?utf-8?B?UEJVeXJnYVhYeXFRdXFFS3JDRDU1QmFwMFRXNjhlSkhvK0NhVGNHUkUxNjZM?=
 =?utf-8?B?Wktkb08yeXlxdXVOT2p1Yy9OUnZabHpHQ1FCK2lRc2I4Rm53ODFHZFJJQTJz?=
 =?utf-8?B?N28rTmJmdE04K3JCdllSQnk1eEc5TjRBd2ZBYk5ZU25sUHJHdTRzMTFGaXZs?=
 =?utf-8?B?RndhNm50SUQ0RmpQOE1pRWFhSFZQSUxqcTYrazZBbVhiSVBGNTVIV2xZWm02?=
 =?utf-8?B?Z2hQK2szSVF2TVFUTlNZOTc0ZDlMYWlDYmR4VkYwRlFCczZzSXNRbGZkc3ly?=
 =?utf-8?B?OWM2RWdFbGlaRHZRcy9qYk1RNTZJWkhBM3c0QWJmNlcvVzU3MmNLM3kwTldY?=
 =?utf-8?B?Wnl3d3UzTXFvNnBISlZQNytSdjRSVkNMUWlEajBJWjcwaHV6ME16aWNmYlFx?=
 =?utf-8?B?WDc3OGxKVHN1UDdxZmpQUGxxdkhmZ3NTcytnWlNGaE4vNDkzTkdXZ2k3QmZL?=
 =?utf-8?Q?0Lf0/VuGa9LpWbqU5vU/8YGX0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae264d09-9d12-4c84-544c-08db15b3bcb1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 15:36:31.5092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWHw5U+pb/mm8AKmgOPCaA3hTU6imAG2/oST4vCnTN3dmq0LRGkfRcbkCqmIv1rvVbHDbLdBNdP6Bxu3pXO1Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6539
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::61a;
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


On 23/02/2023 0:40, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Wed, 22 Feb 2023 19:49:06 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> From: Joao Martins <joao.m.martins@oracle.com>
>>
>> Add device dirty page tracking start/stop functionality. This uses the
>> device DMA logging uAPI to start and stop dirty page tracking by device.
>>
>> Device dirty page tracking is used only if all devices within a
>> container support device dirty page tracking.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   include/hw/vfio/vfio-common.h |   2 +
>>   hw/vfio/common.c              | 211 +++++++++++++++++++++++++++++++++-
>>   2 files changed, 211 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 6f36876ce0..1f21e1fa43 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -149,6 +149,8 @@ typedef struct VFIODevice {
>>       VFIOMigration *migration;
>>       Error *migration_blocker;
>>       OnOffAuto pre_copy_dirty_page_tracking;
>> +    bool dirty_pages_supported;
>> +    bool dirty_tracking;
>>   } VFIODevice;
>>
>>   struct VFIODeviceOps {
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 6041da6c7e..740153e7d7 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -473,6 +473,22 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>>       return true;
>>   }
>>
>> +static bool vfio_devices_all_device_dirty_tracking(VFIOContainer *container)
>> +{
>> +    VFIOGroup *group;
>> +    VFIODevice *vbasedev;
>> +
>> +    QLIST_FOREACH(group, &container->group_list, container_next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            if (!vbasedev->dirty_pages_supported) {
>> +                return false;
>> +            }
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   /*
>>    * Check if all VFIO devices are running and migration is active, which is
>>    * essentially equivalent to the migration being in pre-copy phase.
>> @@ -1404,13 +1420,192 @@ static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>>       return ret;
>>   }
>>
>> +static int vfio_devices_dma_logging_set(VFIOContainer *container,
>> +                                        struct vfio_device_feature *feature)
>> +{
>> +    bool status = (feature->flags & VFIO_DEVICE_FEATURE_MASK) ==
>> +                  VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
>> +    VFIODevice *vbasedev;
>> +    VFIOGroup *group;
>> +    int ret = 0;
>> +
>> +    QLIST_FOREACH(group, &container->group_list, container_next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            if (vbasedev->dirty_tracking == status) {
>> +                continue;
>> +            }
>> +
>> +            ret = ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
>> +            if (ret) {
>> +                ret = -errno;
>> +                error_report("%s: Failed to set DMA logging %s, err %d (%s)",
>> +                             vbasedev->name, status ? "start" : "stop", ret,
>> +                             strerror(errno));
>> +                goto out;
>> +            }
>> +            vbasedev->dirty_tracking = status;
>> +        }
>> +    }
>> +
>> +out:
>> +    return ret;
>> +}
>> +
>> +static int vfio_devices_dma_logging_stop(VFIOContainer *container)
>> +{
>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature),
>> +                              sizeof(uint64_t))] = {};
>> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
>> +
>> +    feature->argsz = sizeof(buf);
>> +    feature->flags = VFIO_DEVICE_FEATURE_SET;
>> +    feature->flags |= VFIO_DEVICE_FEATURE_DMA_LOGGING_STOP;
>> +
>> +    return vfio_devices_dma_logging_set(container, feature);
>> +}
>> +
>> +static gboolean vfio_device_dma_logging_range_add(DMAMap *map, gpointer data)
>> +{
>> +    struct vfio_device_feature_dma_logging_range **out = data;
>> +    struct vfio_device_feature_dma_logging_range *range = *out;
>> +
>> +    range->iova = map->iova;
>> +    /* IOVATree is inclusive, DMA logging uAPI isn't, so add 1 to length */
>> +    range->length = map->size + 1;
>> +
>> +    *out = ++range;
>> +
>> +    return false;
>> +}
>> +
>> +static gboolean vfio_iova_tree_get_first(DMAMap *map, gpointer data)
>> +{
>> +    DMAMap *first = data;
>> +
>> +    first->iova = map->iova;
>> +    first->size = map->size;
>> +
>> +    return true;
>> +}
>> +
>> +static gboolean vfio_iova_tree_get_last(DMAMap *map, gpointer data)
>> +{
>> +    DMAMap *last = data;
>> +
>> +    last->iova = map->iova;
>> +    last->size = map->size;
>> +
>> +    return false;
>> +}
>> +
>> +static struct vfio_device_feature *
>> +vfio_device_feature_dma_logging_start_create(VFIOContainer *container)
>> +{
>> +    struct vfio_device_feature *feature;
>> +    size_t feature_size;
>> +    struct vfio_device_feature_dma_logging_control *control;
>> +    struct vfio_device_feature_dma_logging_range *ranges;
>> +    unsigned int max_ranges;
>> +    unsigned int cur_ranges;
>> +
>> +    feature_size = sizeof(struct vfio_device_feature) +
>> +                   sizeof(struct vfio_device_feature_dma_logging_control);
>> +    feature = g_malloc0(feature_size);
>> +    feature->argsz = feature_size;
>> +    feature->flags = VFIO_DEVICE_FEATURE_SET;
>> +    feature->flags |= VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
>> +
>> +    control = (struct vfio_device_feature_dma_logging_control *)feature->data;
>> +    control->page_size = qemu_real_host_page_size();
>> +
>> +    QEMU_LOCK_GUARD(&container->mappings_mutex);
>> +
>> +    /*
>> +     * DMA logging uAPI guarantees to support at least num_ranges that fits into
>> +     * a single host kernel page. To be on the safe side, use this as a limit
>> +     * from which to merge to a single range.
>> +     */
>> +    max_ranges = qemu_real_host_page_size() / sizeof(*ranges);
>> +    cur_ranges = iova_tree_nnodes(container->mappings);
>> +    control->num_ranges = (cur_ranges <= max_ranges) ? cur_ranges : 1;
> This makes me suspicious that we're implementing to the characteristics
> of a specific device rather than strictly to the vfio migration API.
> Are we just trying to avoid the error handling to support the try and
> fall back to a single range behavior?  If we want to make a
> simplification, then document it as such.  The "[t]o be on the safe
> side" phrasing above could later be interpreted as avoiding an issue
> and might discourage a more complete implementation.

Yes, it was mainly to make things simple.
I will replace the "To be on the safe side..." phrasing.

Thanks.

>> +    ranges = g_try_new0(struct vfio_device_feature_dma_logging_range,
>> +                        control->num_ranges);
>> +    if (!ranges) {
>> +        g_free(feature);
>> +        errno = ENOMEM;
>> +
>> +        return NULL;
>> +    }
>> +
>> +    control->ranges = (uint64_t)ranges;
>> +    if (cur_ranges <= max_ranges) {
>> +        iova_tree_foreach(container->mappings,
>> +                          vfio_device_dma_logging_range_add, &ranges);
>> +    } else {
>> +        DMAMap first, last;
>> +
>> +        iova_tree_foreach(container->mappings, vfio_iova_tree_get_first,
>> +                          &first);
>> +        iova_tree_foreach(container->mappings, vfio_iova_tree_get_last, &last);
>> +        ranges->iova = first.iova;
>> +        /* IOVATree is inclusive, DMA logging uAPI isn't, so add 1 to length */
>> +        ranges->length = (last.iova - first.iova) + last.size + 1;
>> +    }
>> +
>> +    return feature;
>> +}
>> +
>> +static void vfio_device_feature_dma_logging_start_destroy(
>> +    struct vfio_device_feature *feature)
>> +{
>> +    struct vfio_device_feature_dma_logging_control *control =
>> +        (struct vfio_device_feature_dma_logging_control *)feature->data;
>> +    struct vfio_device_feature_dma_logging_range *ranges =
>> +        (struct vfio_device_feature_dma_logging_range *)control->ranges;
>> +
>> +    g_free(ranges);
>> +    g_free(feature);
>> +}
>> +
>> +static int vfio_devices_dma_logging_start(VFIOContainer *container)
>> +{
>> +    struct vfio_device_feature *feature;
>> +    int ret;
>> +
>> +    feature = vfio_device_feature_dma_logging_start_create(container);
>> +    if (!feature) {
>> +        return -errno;
>> +    }
>> +
>> +    ret = vfio_devices_dma_logging_set(container, feature);
>> +    if (ret) {
>> +        vfio_devices_dma_logging_stop(container);
>> +    }
>> +
>> +    vfio_device_feature_dma_logging_start_destroy(feature);
>> +
>> +    return ret;
>> +}
>> +
>>   static void vfio_listener_log_global_start(MemoryListener *listener)
>>   {
>>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>       int ret;
>>
>> -    ret = vfio_set_dirty_page_tracking(container, true);
>> +    if (vfio_devices_all_device_dirty_tracking(container)) {
>> +        if (vfio_have_giommu(container)) {
>> +            /* Device dirty page tracking currently doesn't support vIOMMU */
>> +            return;
>> +        }
>> +
>> +        ret = vfio_devices_dma_logging_start(container);
>> +    } else {
>> +        ret = vfio_set_dirty_page_tracking(container, true);
>> +    }
>> +
>>       if (ret) {
>> +        error_report("vfio: Could not start dirty page tracking, err: %d (%s)",
>> +                     ret, strerror(-ret));
>>           vfio_set_migration_error(ret);
>>       }
>>   }
>> @@ -1420,8 +1615,20 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
>>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>       int ret;
>>
>> -    ret = vfio_set_dirty_page_tracking(container, false);
>> +    if (vfio_devices_all_device_dirty_tracking(container)) {
>> +        if (vfio_have_giommu(container)) {
>> +            /* Device dirty page tracking currently doesn't support vIOMMU */
>> +            return;
>> +        }
>> +
>> +        ret = vfio_devices_dma_logging_stop(container);
>> +    } else {
>> +        ret = vfio_set_dirty_page_tracking(container, false);
>> +    }
>> +
>>       if (ret) {
>> +        error_report("vfio: Could not stop dirty page tracking, err: %d (%s)",
>> +                     ret, strerror(-ret));
>>           vfio_set_migration_error(ret);
>>       }
>>   }

