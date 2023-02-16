Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A9699A4E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:41:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShJv-0003HK-LT; Thu, 16 Feb 2023 11:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pShJo-0003Gd-8e
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:41:12 -0500
Received: from mail-bn8nam11on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::600]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pShJl-0000RR-Eu
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:41:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkSePAFgd1VVbU9wbj2Q7aStTEqr1G+cgVv9AbKbG+mg+LbTJzM9CdmsBi8wnKH3t5pkhFGNsLkpYYyi6v21vZR3wWdGUbJ0aWzQQCiUdpgnZiW+b10Bufec/HqStrJ16zNSWSBMSdWqsQdV4hdfTjAHeR7p7+O5qCN6wBuRYxtFTqP8+sop4vjl4UPRE6/UIm0z6c7fdeF3RseOMaYjr0Mmf9LnN2CVdBE1KY6BI1GlPCJK8hr4yOb5XaPrpOOfs9/s/0f/XbPUXFV6HGKmayec5WULxrR5+2NJS1U16afTf3/y5feelQYGd5Da6uSRtHSFKoJYYN1wAqgr6LznNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6wqaLChf5e+cbLYgpNq/UlceTjfyMHsmbdOUPvtIt8=;
 b=QFrOoB58X4/P2x2l3LWtqDesW8Kuj23P7DUG1yr2UVTkbLXId9dpwcu+x0mwlbK9eXfJCA6JDyBsltKk4I7biQC3y8MtTv8hBnBq9p/AXsPn3rsDueQ1FrbwpWs1gsW+wMQqFkyE9VorPA3r28nRPxQ3gOOfOXvDNbY1oSMRAPIRPAYltpxChJGinbM0hgeAR9gBuYjo/EOksDLyZjKdrgSCbSSdw2LIipuoMmf3RqE/Zt+D8C3T8xjvY1cotgAEcY0/vRbYZ/ULb+6JqHrQWKrHbF+OisWqRDDWHNsLcgzdlsQFYgY1E7C1T5gnFiM5d3Wfq4P0FkYQR5cdmxLaxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6wqaLChf5e+cbLYgpNq/UlceTjfyMHsmbdOUPvtIt8=;
 b=fvjf+9VWhaYUjGj2vNqSgEDljTdRKVemJqCQLb/0oYxQu/giv8BW5XNIkBgqWrZv6u8eMCgfzesfA2Do3nhguhJgpqP03xMHYnpoDcVkUtOPEkRbnam+IqR0Vk1GbGI+h5mNqynIBOVZAGzOfCC8eCPFlLdoxOmrCjagw5YTWf+bntEa8b4pN8vCkbBT1Gjp6QGwwUHSe+QgHbaNuUNju9HC6wE8gwkl3hkQ3kZMn52x09sYPdMxeVxe+KimNqZ7xMiU3vK1qHTmoXgzlJUPf4+4cW1F0vHQtH98UgmFguUoN4W8bWIJIwYrLfp4KhrihwC5QMfGXKDiC7oJg5zzWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by SA1PR12MB7222.namprd12.prod.outlook.com (2603:10b6:806:2bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 16:41:06 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb%3]) with mapi id 15.20.6111.012; Thu, 16 Feb 2023
 16:41:06 +0000
Message-ID: <93eb428e-543c-8af1-44a7-2b1124a080c0@nvidia.com>
Date: Thu, 16 Feb 2023 18:40:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v11 08/11] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230216143630.25610-1-avihaih@nvidia.com>
 <20230216143630.25610-9-avihaih@nvidia.com> <87pma9hazm.fsf@secure.mitica>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <87pma9hazm.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::14) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|SA1PR12MB7222:EE_
X-MS-Office365-Filtering-Correlation-Id: 02d38454-5391-4ad1-6ed1-08db103c9935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wwt0ljmGVnmBrDT+jxYaHig0CRVwIL6kSBJOV+6rtLlIbJOKCb8W3F6qFwil6iHA5tzc1lIQzJotxK5XyDBhvKQ98QPJyHrMWs45m3fugmLKQiI1XMZS1DzK2lcsbr2RksL7x1Cj9C28LI57NMNE+GRan41uz7LmhANR72FoFgYtGzkIxDY1FHlCSXwRQD4OB714YQ1PR/ubm7lQRm+ycobjIQ3+pIKSaXITC9hvHSUeZFzYSpD9Ke3EdjM/yFdYaC2EXPxqcudA0oNrqT3P1DB4H7Jy1nR+r2siWH06HvU4HtUjWXD6NUzAhOFTSgFakYX+fKUfrYa6ArmbVwF4AUPgjlHMvIh24Pp27a5OYnDj1bXiA1Tzx+8FQGLdtLNBXMd/cE1n7Mfzdbnzm3F03BAR2yc5gU7bN4GGlTLUkHSlQD7MiX8Iu3CboK7ArzRrHZb1c7ST3O/qzjVZdQ16rjNDFuf1HukwAzZaImVS38XcgyTqvDr4Dnegy/Zcnswkkk7By6TSh/MWdsUO+irl4crYcgXq1mlZkS5cN86APa9GCwLDt4BAdx6eRS99GyIs27AsI6bnQMJRzjGptl4kR/MBroBc8UEnOdazH56rNOAwWjTk2sEenc9CK7CkS/RIhKKmzvwhZp/GvbuvVMP69pe3wPCd8Ny8dmaINzYF7e/CDaosmJPDDKssvJXtykKqpIUEWw8RFeuCTKXKVIcuIzKMFCL6+VRbIpffaprcZS4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199018)(31686004)(66476007)(66556008)(83380400001)(8676002)(6916009)(4326008)(41300700001)(38100700002)(66946007)(8936002)(316002)(54906003)(7416002)(6486002)(5660300002)(2616005)(6666004)(36756003)(31696002)(2906002)(86362001)(6512007)(26005)(186003)(478600001)(6506007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnV4QVgwbkFqK0twN3gzcnZUSnBMQzUxYUNUVi9wYnQ5RTE1VTFxQzAyYnFL?=
 =?utf-8?B?OE5uOXJhczZNMGY2eVR2OS9rUmt4RU1sOXlTVzhGT1M4aEJjcUFrMUo4alZX?=
 =?utf-8?B?ekNZM0l2Qjd4QSsvYWZBWDZFbm5OM1pRN1o0U3ZQWkg2bzRwMU1Na0xhM2NV?=
 =?utf-8?B?RS9lUjBPY1NEeTJNbkxiWGM5VXVzK2VUQjM3SjR4ODBoUys0MHgrTVI2dHBT?=
 =?utf-8?B?Zk84TmgvV2o1MnBqSHBqTzVucjhHUkZwK3dUV3hFNTJzeXhFbC9HWU5uV25i?=
 =?utf-8?B?cnlCcWUzeFJqS2NxNHA5SW50ME9mSnBkRmhvc3Ivb0hxZW9lQnNYTG9xK044?=
 =?utf-8?B?RXZnZUh6RldDWnF1dFEzQmoxWXU5OWE0YlNQa21sMjd2YUt0VkNGUGdVd3dV?=
 =?utf-8?B?c0ljcDFqQjFUc0w2Y2MvRUhZUEhjZ1BBa3J2bTNpcDkwRDA5YWFhNW14N3F5?=
 =?utf-8?B?RzU1M2F2TFZKTnpURjAvUDJ2cE96ak5pbWNoZXkwdFJWL0J3WEdhbGJrWGNF?=
 =?utf-8?B?OTM3VTZCanFNVjhsWWJhMXUyTjlxdlJYYnB5bE1kcG9udU14K3ZrQkNnZlNt?=
 =?utf-8?B?U1Q4c0tuSHdjN2pYaTZZa0E2K1hFN0U5M2NyQlp3dmJ2cTVZckM2TW5ldXlq?=
 =?utf-8?B?V3lCdWJuN3lYWmxTVUFGOHBickdHRjg4aEhadUZ3bUpuN0pIN0FucW9odmVR?=
 =?utf-8?B?KzhjYU1OMVNnZmh4NXdIQWlVYVhxT1BnSi9aL3VRVDRwMHVLTUFYQ0FVWmFl?=
 =?utf-8?B?Tk9lZ1lPc0VCTml0d25CeGpOMGxySDhQRnBXRUl2WGRtNElpU1dHSngzZU9T?=
 =?utf-8?B?VDZFM05tRy9QSThKUjk0dkdBSDhNMFZEV25Cb3FpOEVkV3Y2NjVlYTdRb05z?=
 =?utf-8?B?RnFFQkdzM2xPOE5GWVAxZ0FLNy90a3pibkVueDZIYS8yMnQ4dlBRTGt1OUJH?=
 =?utf-8?B?T25YcFgyVyswaWhNSCtWenhKZ0g1RFZoYjRlYjFzWFRJTjVPZnF2WmhFUzhG?=
 =?utf-8?B?bk1oVWIvVnpoTjhjdVd5S0dicHpRVFI2UVJUL0JnNEpYZWpHS3RjQ212VmZZ?=
 =?utf-8?B?WW1va2l4ZnpxUWRqcWI5QXdHM3NpVjZ3aFNnelFlUHh5dTBSR1BDK0RVV25r?=
 =?utf-8?B?TFczaXRVVWxRZ3FTN1lmVUVLb2VURGxETUhkVFZxdnJOdEhPWUx3WWhwSHk3?=
 =?utf-8?B?UjhxNU9ONjhtR2VwTDNYdk4wS3BJcVhMZWhTWlZRVFdZN2IyRVFHRU1NaExD?=
 =?utf-8?B?OE1LWUNhWVdrNVpvQjltNEFtbndxdkFLYjVjeGl0eVhpVTEzSWNxenFEUG1G?=
 =?utf-8?B?KzNRT25GOUpmSUczVnhENXYycERvaG5TSWFyKzdMRHB5S1QxQkxyaWFmNWxk?=
 =?utf-8?B?cVk2cUNjNEJpdlRpQWN2WEsyOG90MHZWYVU3SHRCbUVxdWluTkJFM2hBdjIv?=
 =?utf-8?B?UEwzVExzdWlRbXNySk12Yk9oellUUWUyK0tsblZzVDBDdGRxUmdDS1ZkSHdr?=
 =?utf-8?B?aFlFdEdta1Y5am53VmxSeFBDdEtrZWRGSzJZOXRvRXVkUmkxSmVLM2FiUkJO?=
 =?utf-8?B?cEx0TjBVVHlHUkcvSFRSbTFucFE5dlZKUTdpSm9aeTlVWmtUdmh2VHBXOStX?=
 =?utf-8?B?Z0RoamtFYitrSWxiem41M2x1c3lVbklNVXU2NFViQ3VRVlhrVmRGWGh4MjVF?=
 =?utf-8?B?ZXlDSFdnR0VJY0lpRUkzSUJRaXdFM2xFTWVIKzVYRk5kTFlPcFBqRlNEcXRw?=
 =?utf-8?B?ZFc4Wk9QekRzMm1rWXowK3hXRURDSnJRUnNWcTdwTlpwK1Q4bC9MdCtQZGVJ?=
 =?utf-8?B?VHk5eFBqMExhaGp3ZldTVU1RWlNPUW9XbmpMTnpUMXJMbSs4VmZpSzhyN20y?=
 =?utf-8?B?Ty9tY1M4bzhKcUZVRVQxYlFpbWprajZBM1lXRDJvbTVBTSs0MUFVeVMxWUV0?=
 =?utf-8?B?enowbDdXMTNlZTFIaUd0eHBad0dMcEkveklDMU9MOGkwU3lFcWoxUE9VK2g1?=
 =?utf-8?B?TWk1eUdTZWpRSmg4clJVZGtpTDVGVjFUS25ScXBTMlRJM0YwUkpkSFAxRGdp?=
 =?utf-8?B?RUwwNXdyQmlRNkJST09RM25VZGY0UUJzM20zRUdXdXRlb2tVb2oxR21JSHF1?=
 =?utf-8?Q?7W9NHrrYsmshmE8H/tcUwqyu5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d38454-5391-4ad1-6ed1-08db103c9935
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 16:41:06.0679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DdIK4R54OeuK0PLrBssLsrhB1wGW2qFIkMi3jCxV66qEyxNi7s8VEsbJD/RwXtnNRjSM4dfyZQhl3H28ipP8wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7222
Received-SPF: softfail client-ip=2a01:111:f400:7eae::600;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, SPF_HELO_PASS=-0.001,
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


On 16/02/2023 17:43, Juan Quintela wrote:
> External email: Use caution opening links or attachments
>
>
> Avihai Horon <avihaih@nvidia.com> wrote:
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>.
>
>
> 1st comment is a bug, but as you just remove it.
>
>
> Not that it matters a lot in the end (you are removing v1 on the
> following patch).
>
>> @@ -438,7 +445,13 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>>                   return false;
>>               }
>>
>> -            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
>> +            if (!migration->v2 &&
>> +                migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
>> +                continue;
>> +            }
> Are you missing here:
>
>
>                 } else {
>                     return false;
>                 }
>
> Or I am missunderstanding the code.

I think the code is OK:

If the device uses v1 migration and is running, the first if is true and 
we continue.
If the device uses v1 migration and is not running, the first if is 
false and the second if is false (since the device doesn't use v2 
migration) and we return false.

If the device uses v2 migration and is running, the first if is false 
and the second if is true, so we continue.
If the device uses v2 migration and is not running, first if is false 
and the second if is false, so we return false.

>
>> +            if (migration->v2 &&
>> +                migration->device_state == VFIO_DEVICE_STATE_RUNNING) {
>>                   continue;
>>               } else {
>>                   return false;
>
> [...]
>
>
>
>> +/*
>> + * This is an arbitrary size based on migration of mlx5 devices, where typically
>> + * total device migration size is on the order of 100s of MB. Testing with
>> + * larger values, e.g. 128MB and 1GB, did not show a performance improvement.
>> + */
>> +#define VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE (1 * MiB)
> Just in case that it makes a difference.  You are using here a 1MB
> buffer.
> But qemu_file_get_to_fd() uses a 32KB buffer.

Yes, I'm aware of that.
Down the road we will address the performance subject more thoroughly.
In the meantime, it seems like a reasonable size according to the tests 
we did.

>
>
>>       }
>>   }
>>
>> +static int vfio_query_stop_copy_size(VFIODevice *vbasedev,
>> +                                     uint64_t *stop_copy_size)
>> +{
>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>> +                              sizeof(struct vfio_device_feature_mig_data_size),
>> +                              sizeof(uint64_t))] = {};
>> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
> suggestion:
>
>         size_t size = DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>                                   sizeof(struct vfio_device_feature_mig_data_size),
>                                   sizeof(uint64_t));
>         g_autofree struct vfio_device_feature *feature = g_malloc0(size * sizeof(uint64_t));
>
> I have to reread several times to see what was going on there.
>
>
> And call it a day?

I don't have a strong opinion here.
We can do whatever you/Alex like more.

Thanks for reviewing!


