Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C4C698339
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:24:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMRJ-0008V0-4q; Wed, 15 Feb 2023 13:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSMRG-0008Uh-9A
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:23:30 -0500
Received: from mail-bn7nam10on2061f.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::61f]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSMRD-0000kM-0a
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:23:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKkHzLslwn5zEGQ7AED2kTlPtjtsKQRU3YvnaUKlI4Bokq8xzif0dcWselW/ISPDD+P2lAU6giLemAHFJ0H4GTdOH73pHYNUpzw+bir2JoJQMP1NcqW9HrxEPWV9CGOxW4a8nIbIXjxfqWVG5zVxcaGaTnpOWqpZznIhqyqNZTgh1+EX0MU2zWx1ZUAZEQ2PcXK3PtQEdQWhvSJFUpBdhGm9wl/B/yqjrHW+UsFjshnpd7EMjWO09BI/lfaCK8pvAGihQ6BF7H7KinGZa8e+DkiAvtwDz28nxD7GT1aug8gVhT7iGofzPcQmve4m7AmOyWtksArLeCpoD0Ht2ABvig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gj0QEMFnFCa3ERDkTibQMHWMwJ2prbH9GSQlW0RzxTk=;
 b=NygHDQiVSMGket/R7NRwoWOJMa6NaUiM8KdQE2/g+b+mVquLr0YX1tPIxiAj5fu7MgIPkjY0PHPVSB1rtkqQ4BPpHoT5zO5Y0bVdAypIpf05bfLeoENQ/ck8bqqDxb/exl2V9MG4omGyIHZfV00ks9S8Zv1zH3sKPDuUmg9G8uOMcdwE6POdUgq3s+ZDWkYf/NM8BbJErmxzNkJ55ZplgZemVi4VC8DjQvXEfUjzUJgK+hPtZvjNaRClEJAAMUB3NGWlVyzZN8SiFvFsDE1YMo4OT9W0+MjptUADrgkA4bkHLP5dE+hFsQe04BaEOYMxnEPYxJCs7Ru+qIqBH44HAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gj0QEMFnFCa3ERDkTibQMHWMwJ2prbH9GSQlW0RzxTk=;
 b=nLjg+O7sm/5fzC3IVj2QA7w1FRlSSUMIQSc+dx9P3Czd+PHrXW4v+WFQzvZIOdB2GFEkQg9Mm2lWScAH69HA4JrOmgkybLJBlR7ZU8i+PulrsIBBLPQP4gsW3HhPDy9e433163SwJgGloyFZjWpr9K/1Opxjicq3VoBmraRs9QZXI2CdVx1VDHwDir8jHUmeP3BnEg3140HZjkK/vOeO5HflGedt1VXVqEfz9faBvLgNp2Vq47vHxOmwNDvGTyYTI2GzUjMxSlNIyTNK3//3YT3MakEkbY5PrDn9vsLKIGnsggm54q/ZGrGnqdZO9Dvc+4FYYc2PQrDGrBscDvmt5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 18:23:22 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb%3]) with mapi id 15.20.6111.012; Wed, 15 Feb 2023
 18:23:22 +0000
Message-ID: <0b423cd8-229a-c303-b61a-d84ae5423398@nvidia.com>
Date: Wed, 15 Feb 2023 20:23:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 09/12] vfio/migration: Implement VFIO migration
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
References: <20230209192043.14885-1-avihaih@nvidia.com>
 <20230209192043.14885-10-avihaih@nvidia.com> <87pmab2ic4.fsf@secure.mitica>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <87pmab2ic4.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0224.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::8) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|LV2PR12MB5776:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cd055f7-8d33-49af-5930-08db0f81b85a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uoPOJJY+cQUlmBHIw/CwLh0jEs5Y6xvaO/E3o7aVoTTXW/vwVAHw+9NK+lKCe8lSVt2RQ27T3T08EMomC0283q2dwwANso8hpg3bVW/899MxRxPQRmwG6RucZEF0pPM8ZCDhVoCSW0VDLjb/Mfth799yUgNpJ3AVbtlSzrakKNMhr7RPMxLyL3BSvnNv60oMx3OEr7s14TTVZ0Izrm8glLROgbN3ztUEQ6ruuvkH++m3+bqIXgP/0QkAXkaDKmRnkt9Kd27XRxhWdyxIS9Djp5z/aVq03Sh2WF5gqMyIzAcX/3PB3QAXW27Cr8nlOUtjsovDfr62a99qZGXEMJvmXekW9WGndccDOLfIYDPLoazE/P8N64BztgwesqOweARvH7Yfr1Lx6kQcaS4DMA74sKWloEDcNr2hZQoCILXE8mICLAhAEzOIdDh/9y8Ig2qK7J6FMeK68ePQNecr8ityDktmCnT9oYEqRqq3nDtgBTnqjSAEHW4l6gTg/OVjRPfKP9wOK77ccR8TqukNJguJl6+yx4dzm8sC303B7y90B+DhUZI+/giRvmFT01MwGwa0MUbuQlMkDeteTZ8aUVC8LGedZDssXJ7iu5XUN+N9n0TlUHh8PwllJtFDzaOHkxFjYGk8jYfcCGLzIXDON+pfIZNy8EncqKgBaR55qdvn0e0grEk6xztkDdCUfakFOLcHHu/7SlpthoJ6gwgHISsQy+pnq5Ny3RV31KYCM1VdHriTX0zgn2nXlGe6dG7kwQ0kpZjsvgIsCImFEHxgSW9GWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199018)(83380400001)(2906002)(8936002)(7416002)(36756003)(5660300002)(41300700001)(8676002)(66946007)(6916009)(4326008)(66556008)(66476007)(54906003)(316002)(478600001)(6486002)(966005)(6506007)(53546011)(2616005)(31696002)(6666004)(186003)(6512007)(26005)(86362001)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2VuZml3bXdVNmdJV3lpeEVSUnV1bmlJeDl5Qk5ZU1RVQjlrZ1ZNZGF1Ui8x?=
 =?utf-8?B?eFhKZlJYdzAwTWZTWGNzNE9QbDZYRStHRWZOd0pLSUVSRk5neTFNMlpKeW9Q?=
 =?utf-8?B?NXJYVk5OeDc5UGpNQXdVNDlVM3dXQ2oxZXVMZjZNQkd3ZmtvbUFGOVY5SFRu?=
 =?utf-8?B?OUFGZ3hFbEdTSUdmckZ3WmNibXUwcWlzOHRiUnlrWER5MHhlamMyU2RhSDRr?=
 =?utf-8?B?bUJGb0NPZUhqaEhabkN4NndleG5EbmZicTNsdDVYNFdNWU9FYVZKZmlTbFR0?=
 =?utf-8?B?ZUxxTTdySmgwYVFrbTQrVytvcUlEMGcxQjE0NkdvZGdHV0lTc3RvVzdhU05Y?=
 =?utf-8?B?VzhTUnV6L2JlTUpVYWc5bkFUNERJLzRHMHlIQS9Gc0NkQnBENlYweFZycmxl?=
 =?utf-8?B?U3h0S3dydU05RmlmRndCUVVBVmpTQVdaaG9MN0VRZU9uRndIZDB5cHZvVFFt?=
 =?utf-8?B?ZEJnam5MbTZjaTNnUHZvNUxzVkZKbVd3NDMxUXVHaHUxNUk2NDMyQkVaNW1j?=
 =?utf-8?B?UklmblQ2SXYwMjhHc1NuazUxWmdKWkRRY0VmaGxPd1dXczFWZS9oSmNwN054?=
 =?utf-8?B?cUQwbllMVEZhc3VXOTBiY2pYcXkvYVlIZWplM1JzbnZSallya0VZWXpaY3h4?=
 =?utf-8?B?dWtEZmZTbnRWUmkrU3A0K2JSNGExWjBLMEZRazN2YmlKMm1URk51L3pnWjJH?=
 =?utf-8?B?OXNBNWx0VDJUYlgvcTVNc0NWWmpwcWR1VkZhMFUzR2FaV0NUSnJnN0p5c3Iy?=
 =?utf-8?B?TzZNTVZoZjF6RENSclZhR3k5SVJlTE84Mmc3M3l1MTYrdmVVUjFCRzhZYmVq?=
 =?utf-8?B?dXZzUXBIZGs2cjhzbFJMUnRsUmNtc2N1bkRLQ2pwVVJIWXExR1RrMm9CMHpB?=
 =?utf-8?B?N0lvaFZkRGtNQ2Qyck5tUVBubWJiWFlwUFJPTWhtWGdtaFUvbEdhY1hGNU9J?=
 =?utf-8?B?ejZqZmdBZHoxNG54NEFlUDBOMk1KTEVkQVh0WGliNEFaeHAyT296WEluT0dP?=
 =?utf-8?B?ZEgxZVJqZUpieVZzMDhKMVRxTStLeDVuSWFuUXE0TzAwSkRmbHU3NWRUV3Iv?=
 =?utf-8?B?SVV1bStlZFZlRVgyZU93c01jdFJnckk5OUhDY3VvSllWZHIvU3M2UXBTN21k?=
 =?utf-8?B?RWVWcHVYV2praTVoOC9hYUcyU1FVdmNQQ2VIZjdNZWFxM05ydWs1WFRIZHNU?=
 =?utf-8?B?SUxlUkx3U0NjeTlPQVYraGM2bWJtSW5iY3Nwbkp5K0twYS9nVzNOalNxcGZG?=
 =?utf-8?B?dk1mazkvUDhyUDZka09tYVRGNVBwcm9xK0pyMmxTM3dlS040U00zSGdkeitN?=
 =?utf-8?B?ejdwZGtlYUhhalF2OFVwZnFyYWg3ZFY4Wkc3R0lZckxWMnVXM2d0cWhNbWEx?=
 =?utf-8?B?WFp0VDBnQVdVRVFxOFlnSEZjRWs1T0kzT0YweHhxa1dVRXBZYThNM3FlOXh6?=
 =?utf-8?B?UmJJZEhWZkJpUjhYLzYxZ01JRW1RajZaMFBlVU1DYXByYnNhaEFtTUZYQ1JG?=
 =?utf-8?B?OW9VSjBlaXJBd1BsZW40bmFFYTB4dUhKRWUrU1F1WUl6VTEwVUIrZmZWMnJV?=
 =?utf-8?B?K0UxUTBkdUZhN1VWdDhtMWJXaUNyU1BmNytjcUFoL1h4SWxvenV5UG5ZRHhW?=
 =?utf-8?B?V1ZwTjhKcG10Q3Btb2hYMHBrZTVKZS9QQzN4QlpxRHRTTkFJM2E3WWxRTlYr?=
 =?utf-8?B?aHVyL1dURUhmcUp2dCtxMDhnOVJKVWNydWg4YXM2UmxnYnhTWXA1RmVVRElh?=
 =?utf-8?B?UkF3RWo4Z3RzU0lSb1FKK0JVZHVESE1PR2xXMjYzQTJObTRXUk1XYTZkWnlo?=
 =?utf-8?B?cDBYUjBsYm9mSlBnV1B3STl4T0NyVmRsRUpIR2Vjb05NZXFSWWhUdEdOWWRS?=
 =?utf-8?B?cWxzK1FXVEJIMFk4WSt1QlpjWUZIVURrUHRkQ1VERS9RMzhRM3Z0c0tTOEZq?=
 =?utf-8?B?OUYveHlucmJ5M3diMGdtV0EvUVdFeXllYjNNS05YSW5yK284NVg2ckhwWGxq?=
 =?utf-8?B?YVhJWFU1MEsrMUhjalVYYVBJTFBlMXNsc05OeGRub0M5KzcyZjV4YjJQSGFW?=
 =?utf-8?B?ZGNvRlNha0E1Ny91UnJDb0NnbEpTaCs2bnVscTFweVA5UENMNlF4WVFqZE9n?=
 =?utf-8?Q?JF6+d2gnsUK/kvLocplDAFUzg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd055f7-8d33-49af-5930-08db0f81b85a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 18:23:22.3839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wW/BLj2jrIL1MlvJrjCwaaC+nQsQliJtkTa+tn8cFL+LgyCY6MSQWorQ1BBk/8vIQ6wK/NtUr+jO4C37S4QTXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5776
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::61f;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, SPF_HELO_PASS=-0.001,
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


On 15/02/2023 15:01, Juan Quintela wrote:
> External email: Use caution opening links or attachments
>
>
> Avihai Horon <avihaih@nvidia.com> wrote:
>> Implement the basic mandatory part of VFIO migration protocol v2.
>> This includes all functionality that is necessary to support
>> VFIO_MIGRATION_STOP_COPY part of the v2 protocol.
>>
>> The two protocols, v1 and v2, will co-exist and in the following patches
>> v1 protocol code will be removed.
>>
>> There are several main differences between v1 and v2 protocols:
>> - VFIO device state is now represented as a finite state machine instead
>>    of a bitmap.
>>
>> - Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
>>    ioctl and normal read() and write() instead of the migration region.
>>
>> - Pre-copy is made optional in v2 protocol. Support for pre-copy will be
>>    added later on.
>>
>> Detailed information about VFIO migration protocol v2 and its difference
>> compared to v1 protocol can be found here [1].
>>
>> [1]
>> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> +/*
>> + * Migration size of VFIO devices can be as little as a few KBs or as big as
>> + * many GBs. This value should be big enough to cover the worst case.
>> + */
>> +#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
> Wow O:-)
>
>> +
>> +/*
>> + * Only exact function is implemented and not estimate function. The reason is
>> + * that during pre-copy phase of migration the estimate function is called
>> + * repeatedly while pending RAM size is over the threshold, thus migration
>> + * can't converge and querying the VFIO device pending data size is useless.
>> + */
> You can do it after this is merge, but I think you can do better than
> this.  Something in the lines of:
>
>
> // I put it in a global variable, but it really needs to be in
> VFIODevice to be // able to support several devices.  You get the idea
> O:-)
>
> static uint64_t cached_size = -1;
>
> static void vfio_state_pending_exact(void *opaque, uint64_t *res_precopy_only,
>                                       uint64_t *res_compatible,
>                                       uint64_t *res_postcopy_only)
> {
>      VFIODevice *vbasedev = opaque;
>      uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
>
>      /*
>       * If getting pending migration size fails, VFIO_MIG_STOP_COPY_SIZE is
>       * reported so downtime limit won't be violated.
>       */
>      vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
>      *res_precopy_only += stop_copy_size;
>      cached_size = stop_copy_size;
>
>      trace_vfio_state_pending_exact(vbasedev->name, *res_precopy_only,
>                                     *res_postcopy_only, *res_compatible,
>                                     stop_copy_size);
> }
>
>
> static void vfio_state_pending_estimate(void *opaque, uint64_t *res_precopy_only,
>                                          uint64_t *res_compatible,
>                                          uint64_t *res_postcopy_only)
> {
>      VFIODevice *vbasedev = opaque;
>      uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
>
>      if (cached_size == -1) {
>          uint64_t res_precopy;
>          uint64_t res_compatible;
>          uint64_t res_postcopy;
>          vfio_state_pending_exact(opaque, &res_precopy, &res_compatible, &res_postcopy);
>      }
>      *res_precopy_only += cached_size;
> }

In the next series, which will add pre-copy support to VFIO migration 
(v1 was sent [1] but isn't rebased on your pull reqs yet), I am going to 
do something similar to what you suggested.
It will be like you did here but with pre-copy data size (data which can 
be transferred during pre-copy phase) instead of the stop_copy_size.

Plus, I don't think caching the stop_copy_size and reporting the cached 
value in the estimate handler fits the best here,
because stop_copy_size doesn't decrease by pre-copy iterations as 
opposed to RAM pre-copy data, for example.

So I would rather keep things as they are and add something similar to 
your suggestion in the pre-copy series.

Thanks!

[1] 
https://lore.kernel.org/qemu-devel/20230126184948.10478-2-avihaih@nvidia.com/


