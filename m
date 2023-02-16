Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90E9698E75
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:17:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZQy-0003PN-8J; Thu, 16 Feb 2023 03:16:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSZQv-0003Oy-3W
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:16:01 -0500
Received: from mail-bn8nam04on2061a.outbound.protection.outlook.com
 ([2a01:111:f400:7e8d::61a]
 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSZQs-0005Ad-GV
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:16:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeIUjBVMQMYEz4IGw69ZxT0cGXFGUAD33TvatJrzyrNQ3JI9Ypdn0BIPOdZU1eLUf58prd9hGvxpoyDH0Tj+ca0jRF5QI88LjqgpldvhtqCqqgAURMKut8Y9FaltHl2rcLlk4fn3Ws/hnJ8144j7No5sF0uGNa2oSvBzOBAMxrIpZmvUKXD//PW2Rn3dmVjhKExd2YCpU2gC6U4jBuCkLykst0FYCKEbzdOYtXjPbrxG0u0SF3xDrWCwiUXy+BYG3hJNIQcvf4xiGAGrrbLIHpih50G6Lk2Kk9BTl4bFStXUmZivd7IprRTrteTB8WgzNdMSyiEInLLBJj0YvPDsdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xV6UvkNeykT+lSqAo8d4mFEZ8YcLsZ7kmKxlIH3C7o=;
 b=S1neWAjULDAAetIDzQ7PB+J2mV27Xb9MDziKsOGH+AKFDKcu2VDiYNmCOu8LTjn6TED5bHlxiZBYJgMgSxGAksb5Yl2K0QB5jqmtuFA90eqc+mOIMoP3trR5PImKrVVS0n0tEWys8lIRvcdUgJ0vbi58MeUEXHAdpOQNvUo7eRdkDA01rWyoujBlreoNreEOwsBHhdlsb/OAHnRYvjbF9dqjDHKX+ypaAngfUSg4vw9IcIHjiOkHa4VEJGYow5fGf3+zYL0dXNSeNKF4cutoiNgwEjIlh58yj9xNk3vZ/73ECHmHaVg9vUgI3IQHwI9VETjwZF3pQo9rpP+fespCjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xV6UvkNeykT+lSqAo8d4mFEZ8YcLsZ7kmKxlIH3C7o=;
 b=HG4ekUTEw+LA/aEoRkoy9OvxjkZEzvSJjBS5+gi3KCwtZDM+rm2I6jayYhkdjesuVhw7/RLesqyMrwCE/qL1+F0c2FXg73LEAnQJ0J1CkfojIszBWkRkmOLZH2Y7/TFLShjH70ee+5jBMSz24afXcGLU424zBTQX8UR/b6tJ/EOBdTTFyG5q/KJ8PWSBJYtEDKbyIVRdeqtCHLw+cpT/AKB7LFyNseCq/dzF9sS5ilPu/ql3HR1wAeiSXkPuAfu20+pQ2u0F0ycpp4MEx9x1KnS6T0MiKkqXqqQbWKLxnY50rB00y8ZfF5ND+XtYYoEVV/nWKcz2FiK3AHF4v1Lfng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DM4PR12MB5295.namprd12.prod.outlook.com (2603:10b6:5:39f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 08:15:53 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb%3]) with mapi id 15.20.6111.012; Thu, 16 Feb 2023
 08:15:53 +0000
Message-ID: <935ec6e2-291c-419e-80da-01a3216bef84@nvidia.com>
Date: Thu, 16 Feb 2023 10:15:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 09/12] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: quintela@redhat.com, qemu-devel@nongnu.org,
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
 <0b423cd8-229a-c303-b61a-d84ae5423398@nvidia.com>
 <20230215135356.585781c2.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230215135356.585781c2.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::20) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|DM4PR12MB5295:EE_
X-MS-Office365-Filtering-Correlation-Id: 528b5417-4490-49c5-1cbd-08db0ff60578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9KlWAgC43vlYdd85AAC7IJq56IIRER0fP7+HSaoDKL8kipzJv3PcNmaSRQKP6SdKNEorLxUStdBHoonvon7kH/qigHZLwAjOSjyX0rOkQsxU/d74UcQRg+Qm7XspqTVPSGVZB+4no0oNZyKN7hTEThsR6IKk5iM2Ha4q4lBGs+QhwRLrFMCsyH56b1EFiyzC82ymHhtw2z7djEpearUSngNpXZDqmnp+1J3gNlO0HY40fIzq8OWSVjs7KmXCWOvxA4eiBO4KAJhsQy54WqjKcbqBMtv9bDcsoTKpKuLWWB054OHmFn0YNk+xQqROISAfk3InT3F6WrHRIGjy9UBXNdVtf6zTCTHLVGWycwHKgwqd9M/xuHVcUnMD31IYT/jaUjX771pMIBd+7LsFdT8eNVLTSGxoz57A/WNibJo+iWx55FQOPuUNyA5e264MFy4q6scfskhGpuucyC7LDWuB6KPCMHGLd+q09W6nq89sMinauTegFqn9XVWpawB5UIg3JcxHnEXBnJHz6rDN3dStRcUcSbHYmKCWv1eWiFkWyn3zWkVrWBP73faYueht5H+4iNCgGwuo9Zy9T3Fl4H2hcA2hkJ9OycIYJI6zz9VSaP9LzhPLZ7biWt5DDpPjfot2Vgihkrwlcbp7ZL3fSRy2XlFqoX47iYzOEeOzlrgnXqXRQph30MKmWkWKLqyXJVtw1l0HS2haM05z9tOVHOMdOGbAUhUprfFzJl+x1L5oAfi5RCxt6hkROjWq2mZmNmqQn6LJ9Ca6d/5k77wSZjmugQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199018)(5660300002)(8936002)(7416002)(31686004)(41300700001)(66476007)(66946007)(66556008)(6916009)(4326008)(8676002)(316002)(54906003)(2906002)(478600001)(6486002)(966005)(36756003)(53546011)(26005)(6506007)(6666004)(6512007)(186003)(2616005)(86362001)(31696002)(83380400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkZKeGQ4Yjhab3JpUnBTazlGaHNVdDIyOFpSdFpMQUZGODU0Rk51UGZnQm8y?=
 =?utf-8?B?M1E3OEFYVGJKMXZvRG1DclpTY2luNzR4UThTaGZkSzVYdklEQnVDUzZuVS9y?=
 =?utf-8?B?RjJxTWV6N3RFUXE0SSt5ZzhQNm9pbUc4ak5FYWR3Q09maEE5dTNyM1R5N3F3?=
 =?utf-8?B?b0orSEh2RjlWZEdPUXdLRjB0OENPdUlkcDFVRDFNQ3NIWlBTZ2VpZk5DeTVv?=
 =?utf-8?B?VEJKbjdQdVBkNWdTdUU3M0pTamhyRnZtTG4xSkFXUitKOVVsOG51aVVWVDBx?=
 =?utf-8?B?Z0lxbFY3bCtYTGQ0bWgwYWFXUDVvRllycUNqOVpBR09sZ09DVHFSL0ZqdEdP?=
 =?utf-8?B?WjdPWXRtWWtKSDV3TTY3WTcvV0owc3BMQzdYMTJGNmYrSDNQVTZ3LzZleTZv?=
 =?utf-8?B?aXlOeUh0TVRwTFRuSmdQSjJPU2kybm1XTUhaU0lQTTYvWTFOc1E0aGJWL1k0?=
 =?utf-8?B?OEhQMm1aU0NzWjZzaVkvUFJXSzFMSVA4YWkza0hGcnNKY0FtQTdydUVyVjJG?=
 =?utf-8?B?SW51eXdPTHBQUXNMK2dXVSs3blRMZzg4eGE3aWdMSDlqYlNGQVNLdVRXVnJv?=
 =?utf-8?B?WDgzY3JtMzJlNjNpdUxrRU1RVjU3dHp1bk94L0REL2pSejE0OEV4bVBQRk1J?=
 =?utf-8?B?UUFJRGVKSWNabFNEYmt5VVF1bHJ3Q2NFSkZxdDNaaVpYZExYZ3VHczZuYnZN?=
 =?utf-8?B?eVVyVm5pVVZBSGdKUjVnVXBJT3RxU3htNllpVEFTbWxFOFFIVUxKOTJGdFh5?=
 =?utf-8?B?Q1pRbkZ6UGwzSkY4VkdCeUdEWUtYSWRIRWkrTVFNQXBXUENHMVR4U0FZQjlF?=
 =?utf-8?B?ek5oVWFWbUdZUDBaV1I5K2xJOFE5RFdIZUhzQjFOaTROalRhMzE3SUpOMmVm?=
 =?utf-8?B?YldjbnN1ZmQ3RXR3MlBTMTN2Ni9uQ3hSYXJWMHN6K1JNSXJQR3RUd1NBdHhn?=
 =?utf-8?B?dThnak5IODVKcDdYZVNvaVVFUjhRSGw1NyszWGZzN2k3Q1J5Nk5FWVM5U2gx?=
 =?utf-8?B?YUNkby91Q0xTRk9VREZWNTR5MzVmTVJzV1ZBOFoxVWQvT1k2TExyblowa0Vr?=
 =?utf-8?B?TW1WazkvZFFWRU1FVzNvTDZKZ0JXRlFzRGxhVVhtb21hKzNMSnl0d25OczJU?=
 =?utf-8?B?RDN2RzMvU0taSlpWdWZNeS9jaFBRMWcxNlJiNXpSSnhJZ2xkd1QwdWZOcWxm?=
 =?utf-8?B?Y1hZZnM4R3V5UjRqVThyaXRmYk03ZW1SZHFZaC9SMGppTTBOSE5CMjltUTdx?=
 =?utf-8?B?Umc0VFgxcFVJU2wzVlhYeWo3eDZqUUdLdWttV3Erd1djaStuMzQ0eXZ3Zk1s?=
 =?utf-8?B?ak9NaGxSOGpvZTNlVmZCT01pdG1WSmhpcUNzZ1V0OUgxVThLUXpCVE9PcHVH?=
 =?utf-8?B?NFcxM3VIa1kyL2VrNU16M2VaTzlNS1p2RExxUDVlTXNjVjQvZkRYNkhBM1Zr?=
 =?utf-8?B?NmZVbUZRUjBweC96OGJhNGNGc1hQbEhjdE9jU1p4TzdEZDAySzdDQ2ZGQVpZ?=
 =?utf-8?B?UTF1dE1zOUNmRVF5MkVldHlRNDgxODhCT1pFbUNqUTdTTlFWZGtFRGp1aWlC?=
 =?utf-8?B?NnFYb1BrZ0FxSDdKVGVWTkNLbW1SdCtTZUF0bzYzK2tvOExHQ1NHQTRZRUdZ?=
 =?utf-8?B?UGZNZXpiRHowTUtFK1BHSVdJNXBQVU1MY2hRRE43UXNVYlNGNXdVZE1YRDJr?=
 =?utf-8?B?RTc0RHY2UWFvR1ExMnQyam9vWituMXJadldlbzJkNlVPM3RWaUU4U0FiR2ZJ?=
 =?utf-8?B?RDd3Ky9IcVV0VEQzUjM0S2pXZXlGYXJHU01FTkppWUZpMUVQa2VsRGdVaUdj?=
 =?utf-8?B?RGhubEJ3bFV6TFd6aWF6M3V4dFprSmZqd3VJd3FMelN6VnFKMzJnN3laZ2lK?=
 =?utf-8?B?cXlwbEI2c2dmSGJHb0FFVGROTXNQa04ycmVvWnNVeTFkTHppbS8rSFU1SHN1?=
 =?utf-8?B?MCtEcVZxc3dvcW83WSsrcGhHWnJGQWE3U1pKN3lqM2Q0RWVqZzZTS0pZd0dF?=
 =?utf-8?B?Q2RYeVlxaFcwejBLcFJwc0hVSno4RC9pUzBUV1htKzNQVWFLUVdpMit1WXIr?=
 =?utf-8?B?RUtoT3k0YXlmU2lrdFRwWjhKVXNSK2orSitFQW9zWjdJLzFQTnVEc3I2TDZp?=
 =?utf-8?Q?cNXYA2FJYHmwdlpCkfuSbRNgl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528b5417-4490-49c5-1cbd-08db0ff60578
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 08:15:53.4634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzHl2TSNan0b0mLl90xDZXYYI18Ct3tnQTCW/NMpyU9C3jUStj9HzixVzYhgGPCaHgSM5aGRuWFfxmekcyGm8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5295
Received-SPF: softfail client-ip=2a01:111:f400:7e8d::61a;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
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


On 15/02/2023 22:53, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Wed, 15 Feb 2023 20:23:12 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> On 15/02/2023 15:01, Juan Quintela wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> Avihai Horon <avihaih@nvidia.com> wrote:
>>>> Implement the basic mandatory part of VFIO migration protocol v2.
>>>> This includes all functionality that is necessary to support
>>>> VFIO_MIGRATION_STOP_COPY part of the v2 protocol.
>>>>
>>>> The two protocols, v1 and v2, will co-exist and in the following patches
>>>> v1 protocol code will be removed.
>>>>
>>>> There are several main differences between v1 and v2 protocols:
>>>> - VFIO device state is now represented as a finite state machine instead
>>>>     of a bitmap.
>>>>
>>>> - Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
>>>>     ioctl and normal read() and write() instead of the migration region.
>>>>
>>>> - Pre-copy is made optional in v2 protocol. Support for pre-copy will be
>>>>     added later on.
>>>>
>>>> Detailed information about VFIO migration protocol v2 and its difference
>>>> compared to v1 protocol can be found here [1].
>>>>
>>>> [1]
>>>> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
>>>>
>>>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>>>> +/*
>>>> + * Migration size of VFIO devices can be as little as a few KBs or as big as
>>>> + * many GBs. This value should be big enough to cover the worst case.
>>>> + */
>>>> +#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
>>> Wow O:-)
>>>
>>>> +
>>>> +/*
>>>> + * Only exact function is implemented and not estimate function. The reason is
>>>> + * that during pre-copy phase of migration the estimate function is called
>>>> + * repeatedly while pending RAM size is over the threshold, thus migration
>>>> + * can't converge and querying the VFIO device pending data size is useless.
>>>> + */
>>> You can do it after this is merge, but I think you can do better than
>>> this.  Something in the lines of:
>>>
>>>
>>> // I put it in a global variable, but it really needs to be in
>>> VFIODevice to be // able to support several devices.  You get the idea
>>> O:-)
>>>
>>> static uint64_t cached_size = -1;
>>>
>>> static void vfio_state_pending_exact(void *opaque, uint64_t *res_precopy_only,
>>>                                        uint64_t *res_compatible,
>>>                                        uint64_t *res_postcopy_only)
>>> {
>>>       VFIODevice *vbasedev = opaque;
>>>       uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
>>>
>>>       /*
>>>        * If getting pending migration size fails, VFIO_MIG_STOP_COPY_SIZE is
>>>        * reported so downtime limit won't be violated.
>>>        */
>>>       vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
>>>       *res_precopy_only += stop_copy_size;
>>>       cached_size = stop_copy_size;
>>>
>>>       trace_vfio_state_pending_exact(vbasedev->name, *res_precopy_only,
>>>                                      *res_postcopy_only, *res_compatible,
>>>                                      stop_copy_size);
>>> }
>>>
>>>
>>> static void vfio_state_pending_estimate(void *opaque, uint64_t *res_precopy_only,
>>>                                           uint64_t *res_compatible,
>>>                                           uint64_t *res_postcopy_only)
>>> {
>>>       VFIODevice *vbasedev = opaque;
>>>       uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
>>>
>>>       if (cached_size == -1) {
>>>           uint64_t res_precopy;
>>>           uint64_t res_compatible;
>>>           uint64_t res_postcopy;
>>>           vfio_state_pending_exact(opaque, &res_precopy, &res_compatible, &res_postcopy);
>>>       }
>>>       *res_precopy_only += cached_size;
>>> }
>> In the next series, which will add pre-copy support to VFIO migration
>> (v1 was sent [1] but isn't rebased on your pull reqs yet), I am going to
>> do something similar to what you suggested.
>> It will be like you did here but with pre-copy data size (data which can
>> be transferred during pre-copy phase) instead of the stop_copy_size.
>>
>> Plus, I don't think caching the stop_copy_size and reporting the cached
>> value in the estimate handler fits the best here,
>> because stop_copy_size doesn't decrease by pre-copy iterations as
>> opposed to RAM pre-copy data, for example.
>>
>> So I would rather keep things as they are and add something similar to
>> your suggestion in the pre-copy series.
> Assuming Juan is on board with this, please re-base your series on
> Juan's latest pull request.  At the time of writing, this is:
>
> https://lore.kernel.org/all/20230215200554.1365-1-quintela@redhat.com/
>
> The kernel headers need an update (you might as well pick up v6.2-rc8
> at this point to be as close as possible to what lands in v6.2), Juan's
> pull request includes qemu_file_get_to_fd(), so we can drop it here, and
> there are some conflicts that need to be ironed out relative to
> 24beea4efe6e ("migration: Rename res_{postcopy,precopy}_only").

Sure, I will do it and post v11.

Thanks.


