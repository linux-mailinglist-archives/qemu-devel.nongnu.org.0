Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FCD62E294
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:08:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oviMR-0000J4-NY; Thu, 17 Nov 2022 12:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oviMO-0000FL-T6; Thu, 17 Nov 2022 12:07:32 -0500
Received: from mail-co1nam11on2076.outbound.protection.outlook.com
 ([40.107.220.76] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oviML-0001yD-1J; Thu, 17 Nov 2022 12:07:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrFE8//Vs+QuDwbZgkHlkg7sv8sbwtFgEBU5u4dufq9XMnmIzKjTSQHkU68DVvCgBfStp2x1aS8KdX5ifGu9qhE82+9xuv9ZVjB/L6BX7u1Dmpf8aS56L23duRehmio2kshMNn91C26eFaghQmS2th8w8dvBL5meCXlCZG8S6hrTbgRfRYorpdW1xQp5tKOHz43VkIpxPT5oCaVihsz69bDQ+U4FVxEK7G6nrOB2fpWZ1/Yh/CuGcWgsGFV+6yghkiunhYAPDJsr5F3fQrYxmwQIVFeX8x5JctnUc00uoq9DqZ1IgPZ+AwRLjNKlO5GfCcXka6eCNxjvwa4yht8jew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r521Zn/qH8unvay8K3euMGircAy+2c6xhnzM82WJPtQ=;
 b=lOSBqRyAdksHR0NXbsnDW18hHuoolw4pSGg1iUj6CsNeMVUqay4Kha3rxXVAygs5vhIGssEo9IlkpUGGAdGAV821YvRml/1yd3IGqGsTR9aLJ39nWcb+dfFq0I6XtGuJCntLARN3z/wru/83x+p1QCwh56nVQrT2r5KkHFEo7CZxZTILOHRMo2gnGcimAQhkGopWlvaD16rIszeA/msp3P1XSQOKU4w/eWnNmvTJWTQdOsQbqWDYld6JKETP7Q1M2JyPk319HMuLNBraYtkTIuIgguFLrPCemPzCl/atdYpFyb2fKuEx972DD8QcSLukG/wl+UgdIXyzUlIsXDdVSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r521Zn/qH8unvay8K3euMGircAy+2c6xhnzM82WJPtQ=;
 b=bst25n/ZcqxpuDUwtWmIC4IG1kAF1P88Dl2/+Cvikn6kqfUahQy12AqVZoRLrWXJE9yLCaQBh7qpYgt1rqob0p+a2juQBWdtrsyswT5tAVDPqQHo8qbDshb97Om1nZZ3ZiLSSmquRp7Hd23jotvbvd9X7JYzyzLz/kbcWb4qTMXKNnOgMoQ4z0pdCqmwFUjtbQ/+hebE2vmtMaguehBJ7VtNQDkFjvLRGOAHeJ049xJeB1Bp1nGwlXLRfR80lioqnMRLIfea9JmSQg0YUGWd3uBGIWPNddASziJ7uzUMdTujJJ7RSqI/ZiT9cVCpQeM3lkSDSu7koOyf3nLRF9j8dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DM8PR12MB5479.namprd12.prod.outlook.com (2603:10b6:8:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Thu, 17 Nov
 2022 17:07:23 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167%8]) with mapi id 15.20.5813.019; Thu, 17 Nov 2022
 17:07:23 +0000
Message-ID: <099b99c2-8949-c101-45eb-9a8aaed2adb7@nvidia.com>
Date: Thu, 17 Nov 2022 19:07:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 12/17] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-13-avihaih@nvidia.com>
 <20221116112935.23118a30.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20221116112935.23118a30.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0660.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::13) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|DM8PR12MB5479:EE_
X-MS-Office365-Filtering-Correlation-Id: c58dbfa2-f251-4c71-2b16-08dac8be3115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eB7l03AKIiqbRLwm0DBKFUb1TVR8OHGPo8yKJPHM0M+4bgK+aV1/Z1XayKrdjnifV2bIyrTgz0Hq7SVjbUR0II2NCLKTtxv+OVAORTMgwZTicp7UpAcl0943i2nw3N5NLmM8epCFzP4V7TkdM/w+3SG+FuGxpoHZvW2hgh03hPX/PnRZQQODZJ+M+W65YSF2a3wmhf3SPt8TUHLFl6gnNlNv+i1jZLj84WYWIXPqlryszpvOtbKyDAvOTjZu+50OlLqfyShl0Hbw70HK4AT91V0MdBciqQWP0zfRV8BCMitk6ftesOi3iT5RR6bNQaBgFQNsTEUgpB6LolLc6yAnsDtX0bpdDF6i6S1lxztE6ghkYhzqR7xfq+3rcc+IBeHr8J4ygNEiWYl4WUhjh7UyNiPHRZXsialucVS1ekQCOG7TXFQB3pnGschNWCFghuUor1qnZdn2lW9pUeGUZbUgS/1lMIddAYECQiPm+korhqEY1JkuX2ZLW12tHnXEEKw2HJDPOSw7b6E8vifKwi8B/T3Qjelv1gkwuY4qRkSzf+j2/Ey41LNP1Ex2cpG5/0bONZq/fEI4rxBzb6XJnWtVx/xTD0oTCH+p/av0XaDFQbWDFCnxBClNHvReLjx5FwJfuUm3VJSIw+3bfztpjKYRKiXz1jxnhGUkZPAM3L89QB4Ko+501Et12LTveNhV3S4Bmgma0zKxfvYy0aW8tCT2FZ6U/rhsOfK05UhmZavbN67xqm1les3x+bRJn6C0730n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199015)(36756003)(31686004)(83380400001)(86362001)(31696002)(30864003)(26005)(38100700002)(2906002)(53546011)(186003)(6512007)(2616005)(5660300002)(7416002)(966005)(478600001)(6486002)(6506007)(41300700001)(6666004)(8936002)(54906003)(66556008)(66476007)(6916009)(8676002)(4326008)(66946007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkF3VThuNEFiQU41YWUvOHNtMnFEQXBIVk1pcUllK0xrRlE5WU85cVlPYS9U?=
 =?utf-8?B?SXRWQzZpOGVwdnNQeEpTSFo2a2liQUxmckRxTzRwMHpOYTNWTEZ1ZnIrRUJW?=
 =?utf-8?B?bUJTeE05SVNEeWg4dVJiZ3hGY1g5V3k1ZmswNFg5NCtyamF1Z1lsM0drSmRT?=
 =?utf-8?B?VVRCMjQwd1B0MnBsR2k2dE15RnlCY0tDR2lkdHZ3THY1V1VpdUI1NkdFQ0Rs?=
 =?utf-8?B?SDdqYk1qL3hIWGtXMURJeDJqTWp2TGZxdGpnOTZEWTlzSjRnaWNIS0NvOWZR?=
 =?utf-8?B?SUg2NTZ4UERWQm1wMjZaL3pyaXkrTEl0R0ozZDYwQU1HbmJaZWtsWkFSdzdz?=
 =?utf-8?B?S3lYY0wwZm5DK0FNK2N3RllQb2V6RVhwRjU3T1hRd29kb3VtNEQ0TzR2V3BB?=
 =?utf-8?B?aEM0ZTQ2YzUycDRGVWppZ0w3dUZ1eGZOaUZSdi96WnJhOGpjOWZzbzRtRjlv?=
 =?utf-8?B?L2R5MG9XZ0JIcTdqaUs3Z0FuNmJpMVZkL2lzRWRPbWhaRERaZE9xOXdNL0pw?=
 =?utf-8?B?ZTlIZFppN0dIUUZWYWt5NWhJUk0venFpT20zMHFpWnFuaGgzS2V3QVJrMUpv?=
 =?utf-8?B?cjFWdjFlTHN4bUQwMW5WRnVRNlV0NUpTdHhvR2xRUGxKVHE3VDlOczRTd3pC?=
 =?utf-8?B?NGtHUUtPR0xCNTd5bVR5M0J0ZENENkpCODlEZ0c2aldzakVGM1NSQWJya1gy?=
 =?utf-8?B?cDJOUVNXOUk2d0ZwN3BpS1V5RWRnM3FtQmlWcVpLQTcrRFVYME9ENzF6VCtw?=
 =?utf-8?B?MTdlNStlaVZMRnVaN3J1clB2QkhBNkpHck04VDFrdytoWXhIVWp2bHZhR0pq?=
 =?utf-8?B?VHJJTkVuYUZkM3BUakdrbHl0aGRmYXN6UUVhRVJqeUtGT284eW1Qd1g2OWh6?=
 =?utf-8?B?WU1DbzQyV0svZlJoQUdVa2h3bkV3eWhKOTZPTXlEWDVUWXhLOUhQVVlCWDh3?=
 =?utf-8?B?dkdLZmR6dUZrTHVVVVAvM3NYSTBnL2ltNWgzeXRtdFRhSWQvcDk4YWY0RFB2?=
 =?utf-8?B?MlQvMC80WDFkWjhWSWlOUzc4SzBxY1pjUWMzRVFHV29xd3IrRTNEWFB2YjFF?=
 =?utf-8?B?dEt5czRndEhoRU1XWkR6c0dPbFk2MmxRTUErbUVSRmYvR0s4cVl1ZkxXNnJY?=
 =?utf-8?B?K2xINXZlWTB5clljajREVVJ0dTlYS0YvTVZkeDlmNnNxTjNwbEtJamtCaFVP?=
 =?utf-8?B?N3JvZ0h6RkZ1VDBuSHFlcEhMTnhQU21oZUU5UEJOUDJjU1JyZjMrK3hzRFl1?=
 =?utf-8?B?VFJvWlVoTndNQmZIajRLdGxZcTBUT0NwanZ4M2JKVk04dGROdk1HT1ZReks4?=
 =?utf-8?B?MDZ0UFoxemczNHM2SStxYUdscUpXbHl4MG9zS1NtWVpEczhFcnRVeWwzZmcw?=
 =?utf-8?B?RFB1NklLK29EL3hHMDdDT0ZqVTM5Y0dVWHl3VDJxNUFVWEVaY1VMT3NUN0d6?=
 =?utf-8?B?cnlPc3BVQlFSSDI0RFczSDNVVHNzeWY2alZDRHVBc3BYWXBid0RnMklXbDNC?=
 =?utf-8?B?Q1drSi9qZ2RTVUdKeXg4dndZRG5POTlPM1hQVXZXd3JPWFBuY1cwVFJGekNY?=
 =?utf-8?B?MlRIT255ejJraUxscmRoK3NGNnE5RXF0aGVTaUNkSGlqYWdTTEdDQVBTSzgv?=
 =?utf-8?B?TmtNZW5iZU5PRi9WOGhpVStlazM4c1VVbUczWEdIbzUxejZGVHBwQm0wc0R6?=
 =?utf-8?B?aDIrNmlTaFNjTWdkUTUxazlxaXpwN2svTUpmcEpvWkdqSFVROEswSFQyM05r?=
 =?utf-8?B?Q0o0NFFTYmo5bkh6Zjl1aEtwZ1FlN2w3d1kyckdad0UvcThpNHJvTlYxb3lG?=
 =?utf-8?B?UTNIcG0rWFlDTVc2TEVMeGthdlNJcHV1a3dXYUhzNUxJS2dSMlVsbm5VdVVQ?=
 =?utf-8?B?NWxwRURyZkdhcjRiSHdBNkJ6K2hDZFpoYzA3S1hoNUxDVC9aLzNDWDhWVFFl?=
 =?utf-8?B?THVLTm5abU5vdnlCa0t5UHdxS1dkUy8zNVRQWHZxMDFrQStrU0x5dzFjc280?=
 =?utf-8?B?czR0bkZteng3WVJ2d3NxVnl5WnNnZ0h6K25LNE1hdWF3L3V4RUtoM3Z5NVJ0?=
 =?utf-8?B?bUMrWHBzQlNvTmpOSDc3VC84L3dnUjlmeXZubTc4NXd0SnZQcllraDhpQmJa?=
 =?utf-8?Q?HFLOoT7VZmweHc1al2tFQVXj9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c58dbfa2-f251-4c71-2b16-08dac8be3115
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 17:07:23.8702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ibk5vWBq69FVroPhjdFv7VIJUKEVwkmGJm3641B3anaAs2HerWsUryEgKCmyNiFlfneQ3jzEukNSC6R7bi7e8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5479
Received-SPF: softfail client-ip=40.107.220.76;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


On 16/11/2022 20:29, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu, 3 Nov 2022 18:16:15 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> Add implementation of VFIO migration protocol v2. The two protocols, v1
>> and v2, will co-exist and in next patch v1 protocol will be removed.
>>
>> There are several main differences between v1 and v2 protocols:
>> - VFIO device state is now represented as a finite state machine instead
>>    of a bitmap.
>>
>> - Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
>>    ioctl and normal read() and write() instead of the migration region.
>>
>> - VFIO migration protocol v2 currently doesn't support the pre-copy
>>    phase of migration.
>>
>> Detailed information about VFIO migration protocol v2 and difference
>> compared to v1 can be found here [1].
>>
>> [1]
>> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   hw/vfio/common.c              |  19 +-
>>   hw/vfio/migration.c           | 386 ++++++++++++++++++++++++++++++----
>>   hw/vfio/trace-events          |   4 +
>>   include/hw/vfio/vfio-common.h |   5 +
>>   4 files changed, 375 insertions(+), 39 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 617e6cd901..0bdbd1586b 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -355,10 +355,18 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>>                   return false;
>>               }
>>
>> -            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
>> +            if (!migration->v2 &&
>> +                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
>>                   (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING)) {
>>                   return false;
>>               }
>> +
>> +            if (migration->v2 &&
>> +                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
>> +                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
>> +                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
>> +                return false;
>> +            }
>>           }
>>       }
>>       return true;
>> @@ -385,7 +393,14 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>>                   return false;
>>               }
>>
>> -            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
>> +            if (!migration->v2 &&
>> +                migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
>> +                continue;
>> +            }
>> +
>> +            if (migration->v2 &&
>> +                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
>> +                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
>>                   continue;
>>               } else {
>>                   return false;
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index e784374453..62afc23a8c 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -44,8 +44,84 @@
>>   #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
>>   #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
>>
>> +#define VFIO_MIG_DATA_BUFFER_SIZE (1024 * 1024)
> Add comment explaining heuristic of this size.

This is an arbitrary size we picked with mlx5 state size in mind.
Increasing this size to higher values (128M, 1G) didn't improve 
performance in our testing.

How about this comment:
This is an initial value that doesn't consume much memory and provides 
good performance.

Do you have other suggestion?

>
>> +
>>   static int64_t bytes_transferred;
>>
>> +static const char *mig_state_to_str(enum vfio_device_mig_state state)
>> +{
>> +    switch (state) {
>> +    case VFIO_DEVICE_STATE_ERROR:
>> +        return "ERROR";
>> +    case VFIO_DEVICE_STATE_STOP:
>> +        return "STOP";
>> +    case VFIO_DEVICE_STATE_RUNNING:
>> +        return "RUNNING";
>> +    case VFIO_DEVICE_STATE_STOP_COPY:
>> +        return "STOP_COPY";
>> +    case VFIO_DEVICE_STATE_RESUMING:
>> +        return "RESUMING";
>> +    case VFIO_DEVICE_STATE_RUNNING_P2P:
>> +        return "RUNNING_P2P";
>> +    default:
>> +        return "UNKNOWN STATE";
>> +    }
>> +}
>> +
>> +static int vfio_migration_set_state(VFIODevice *vbasedev,
>> +                                    enum vfio_device_mig_state new_state,
>> +                                    enum vfio_device_mig_state recover_state)
>> +{
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>> +                              sizeof(struct vfio_device_feature_mig_state),
>> +                              sizeof(uint64_t))] = {};
>> +    struct vfio_device_feature *feature = (void *)buf;
>> +    struct vfio_device_feature_mig_state *mig_state = (void *)feature->data;
> We can cast to the actual types rather than void* here.

Sure, will do.

>
>> +
>> +    feature->argsz = sizeof(buf);
>> +    feature->flags =
>> +        VFIO_DEVICE_FEATURE_SET | VFIO_DEVICE_FEATURE_MIG_DEVICE_STATE;
>> +    mig_state->device_state = new_state;
>> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>> +        /* Try to set the device in some good state */
>> +        error_report(
>> +            "%s: Failed setting device state to %s, err: %s. Setting device in recover state %s",
>> +                     vbasedev->name, mig_state_to_str(new_state),
>> +                     strerror(errno), mig_state_to_str(recover_state));
>> +
>> +        mig_state->device_state = recover_state;
>> +        if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>> +            hw_error("%s: Failed setting device in recover state, err: %s",
>> +                     vbasedev->name, strerror(errno));
>> +        }
>> +
>> +        migration->device_state = recover_state;
>> +
>> +        return -1;
> We could preserve -errno to return here.

Sure, will do.

>
>> +    }
>> +
>> +    if (mig_state->data_fd != -1) {
>> +        if (migration->data_fd != -1) {
>> +            /*
>> +             * This can happen if the device is asynchronously reset and
>> +             * terminates a data transfer.
>> +             */
>> +            error_report("%s: data_fd out of sync", vbasedev->name);
>> +            close(mig_state->data_fd);
>> +
>> +            return -1;
> Should we go to recover_state here?  Is migration->device_state
> invalid?  -EBADF?

Yes, we should.
Although VFIO_DEVICE_FEATURE_MIG_DEVICE_STATE ioctl above succeeded, 
setting the device state didn't *really* succeed, as the data_fd went 
out of sync.
So we should go to recover_state and return -EBADF.

I will change it.

>> +        }
>> +
>> +        migration->data_fd = mig_state->data_fd;
>> +    }
>> +    migration->device_state = new_state;
>> +
>> +    trace_vfio_migration_set_state(vbasedev->name, mig_state_to_str(new_state));
>> +
>> +    return 0;
>> +}
>> +
>>   static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
>>                                     off_t off, bool iswrite)
>>   {
>> @@ -260,6 +336,20 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
>>       return ret;
>>   }
>>
>> +static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>> +                            uint64_t data_size)
>> +{
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    int ret;
>> +
>> +    ret = qemu_file_get_to_fd(f, migration->data_fd, data_size);
>> +    if (!ret) {
>> +        trace_vfio_load_state_device_data(vbasedev->name, data_size);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>>   static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>>                                  uint64_t data_size)
>>   {
>> @@ -394,6 +484,14 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>>       return qemu_file_get_error(f);
>>   }
>>
>> +static void vfio_migration_cleanup(VFIODevice *vbasedev)
>> +{
>> +    VFIOMigration *migration = vbasedev->migration;
>> +
>> +    close(migration->data_fd);
>> +    migration->data_fd = -1;
>> +}
>> +
>>   static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
>>   {
>>       VFIOMigration *migration = vbasedev->migration;
>> @@ -405,6 +503,18 @@ static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
>>
>>   /* ---------------------------------------------------------------------- */
>>
>> +static int vfio_save_setup(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    trace_vfio_save_setup(vbasedev->name);
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>> +
>> +    return qemu_file_get_error(f);
>> +}
>> +
>>   static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -448,6 +558,14 @@ static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
>>       return 0;
>>   }
>>
>> +static void vfio_save_cleanup(void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    vfio_migration_cleanup(vbasedev);
>> +    trace_vfio_save_cleanup(vbasedev->name);
>> +}
>> +
>>   static void vfio_v1_save_cleanup(void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -456,6 +574,23 @@ static void vfio_v1_save_cleanup(void *opaque)
>>       trace_vfio_save_cleanup(vbasedev->name);
>>   }
>>
>> +#define VFIO_MIG_PENDING_SIZE (512 * 1024 * 1024)
> There's a comment below, but that gets deleted in a later patch while
> we still use this as a fallback size.

I will keep some variant of the comment in the later patch.

>    Some explanation of how this
> size is derived would be useful.  Is this an estimate for mlx5?  It
> seems muchtoo small for a GPU.  For a fallback, should we set something
> here so large that we don't risk failing any SLA, ex. 100G?

In the KVM call we talked about setting this to 1G. mlx5 state size, 
when heavily utilized, should be in the order of hundreds of MBs.
So eventually we decided to go for 500MB.

However, I think you are right, we should set it to 100G to cover the 
worst case.
Anyway, this fallback value is used only if kernel doesn't support 
VFIO_DEVICE_FEATURE_MIG_DATA_SIZE ioctl, which should not be the usual 
case AFAIU.

I will also add a comment explaining the size choice.

>> +static void vfio_save_pending(void *opaque, uint64_t threshold_size,
>> +                              uint64_t *res_precopy, uint64_t *res_postcopy)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    /*
>> +     * VFIO migration protocol v2 currently doesn't have an API to get pending
>> +     * device state size. Until such API is introduced, report some big
>> +     * arbitrary pending size so the device will be taken into account for
>> +     * downtime limit calculations.
>> +     */
>> +    *res_postcopy += VFIO_MIG_PENDING_SIZE;
>> +
>> +    trace_vfio_save_pending(vbasedev->name, *res_precopy, *res_postcopy);
>> +}
>> +
>>   static void vfio_v1_save_pending(void *opaque, uint64_t threshold_size,
>>                                    uint64_t *res_precopy, uint64_t *res_postcopy)
>>   {
>> @@ -520,6 +655,67 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
>>       return 0;
>>   }
>>
>> +/* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error */
>> +static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
>> +{
>> +    ssize_t data_size;
>> +
>> +    data_size = read(migration->data_fd, migration->data_buffer,
>> +                     migration->data_buffer_size);
>> +    if (data_size < 0) {
>> +        return -1;
> Appears this could return -errno, granted it'll get swallowed in
> qemu_savevm_state_complete_precopy_iterable(), but it seems a bit
> cleaner here.

Sure, I will change it.

>> +    }
>> +    if (data_size == 0) {
>> +        return 1;
>> +    }
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
>> +    qemu_put_be64(f, data_size);
>> +    qemu_put_buffer(f, migration->data_buffer, data_size);
>> +    bytes_transferred += data_size;
>> +
>> +    trace_vfio_save_block(migration->vbasedev->name, data_size);
>> +
>> +    return qemu_file_get_error(f);
>> +}
>> +
>> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    enum vfio_device_mig_state recover_state;
>> +    int ret;
>> +
>> +    /* We reach here with device state STOP only */
>> +    recover_state = VFIO_DEVICE_STATE_STOP;
>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
>> +                                   recover_state);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    do {
>> +        ret = vfio_save_block(f, vbasedev->migration);
>> +        if (ret < 0) {
>> +            return ret;
>> +        }
>> +    } while (!ret);
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>> +    ret = qemu_file_get_error(f);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    recover_state = VFIO_DEVICE_STATE_ERROR;
>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
>> +                                   recover_state);
>> +    if (!ret) {
>> +        trace_vfio_save_complete_precopy(vbasedev->name);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>>   static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -589,6 +785,14 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
>>       }
>>   }
>>
>> +static int vfio_load_setup(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    return vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING,
>> +                                   vbasedev->migration->device_state);
>> +}
>> +
>>   static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -616,6 +820,16 @@ static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>>       return ret;
>>   }
>>
>> +static int vfio_load_cleanup(void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    vfio_migration_cleanup(vbasedev);
>> +    trace_vfio_load_cleanup(vbasedev->name);
>> +
>> +    return 0;
>> +}
>> +
>>   static int vfio_v1_load_cleanup(void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -658,7 +872,11 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>>               uint64_t data_size = qemu_get_be64(f);
>>
>>               if (data_size) {
>> -                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
>> +                if (vbasedev->migration->v2) {
>> +                    ret = vfio_load_buffer(f, vbasedev, data_size);
>> +                } else {
>> +                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
>> +                }
>>                   if (ret < 0) {
>>                       return ret;
>>                   }
>> @@ -679,6 +897,17 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>>       return ret;
>>   }
>>
>> +static const SaveVMHandlers savevm_vfio_handlers = {
>> +    .save_setup = vfio_save_setup,
>> +    .save_cleanup = vfio_save_cleanup,
>> +    .save_live_pending = vfio_save_pending,
>> +    .save_live_complete_precopy = vfio_save_complete_precopy,
>> +    .save_state = vfio_save_state,
>> +    .load_setup = vfio_load_setup,
>> +    .load_cleanup = vfio_load_cleanup,
>> +    .load_state = vfio_load_state,
>> +};
>> +
>>   static SaveVMHandlers savevm_vfio_v1_handlers = {
>>       .save_setup = vfio_v1_save_setup,
>>       .save_cleanup = vfio_v1_save_cleanup,
>> @@ -693,6 +922,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers = {
>>
>>   /* ---------------------------------------------------------------------- */
>>
>> +static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    enum vfio_device_mig_state new_state;
>> +    int ret;
>> +
>> +    if (running) {
>> +        new_state = VFIO_DEVICE_STATE_RUNNING;
>> +    } else {
>> +        new_state = VFIO_DEVICE_STATE_STOP;
>> +    }
>> +
>> +    ret = vfio_migration_set_state(vbasedev, new_state,
>> +                                   VFIO_DEVICE_STATE_ERROR);
>> +    if (ret) {
>> +        /*
>> +         * Migration should be aborted in this case, but vm_state_notify()
>> +         * currently does not support reporting failures.
>> +         */
>> +        if (migrate_get_current()->to_dst_file) {
>> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>> +        }
>> +    }
>> +
>> +    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
>> +                              mig_state_to_str(new_state));
>> +}
>> +
>>   static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -766,12 +1023,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>>       case MIGRATION_STATUS_CANCELLED:
>>       case MIGRATION_STATUS_FAILED:
>>           bytes_transferred = 0;
>> -        ret = vfio_migration_v1_set_state(vbasedev,
>> -                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
>> -                                            VFIO_DEVICE_STATE_V1_RESUMING),
>> -                                          VFIO_DEVICE_STATE_V1_RUNNING);
>> -        if (ret) {
>> -            error_report("%s: Failed to set state RUNNING", vbasedev->name);
>> +        if (migration->v2) {
>> +            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
>> +                                     VFIO_DEVICE_STATE_ERROR);
>> +        } else {
>> +            ret = vfio_migration_v1_set_state(vbasedev,
>> +                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
>> +                                                VFIO_DEVICE_STATE_V1_RESUMING),
>> +                                              VFIO_DEVICE_STATE_V1_RUNNING);
>> +            if (ret) {
>> +                error_report("%s: Failed to set state RUNNING", vbasedev->name);
>> +            }
>>           }
>>       }
>>   }
>> @@ -780,12 +1042,35 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
>>   {
>>       VFIOMigration *migration = vbasedev->migration;
>>
>> -    vfio_region_exit(&migration->region);
>> -    vfio_region_finalize(&migration->region);
>> +    if (migration->v2) {
>> +        g_free(migration->data_buffer);
>> +    } else {
>> +        vfio_region_exit(&migration->region);
>> +        vfio_region_finalize(&migration->region);
>> +    }
>>       g_free(vbasedev->migration);
>>       vbasedev->migration = NULL;
>>   }
>>
>> +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
>> +{
>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>> +                                  sizeof(struct vfio_device_feature_migration),
>> +                              sizeof(uint64_t))] = {};
>> +    struct vfio_device_feature *feature = (void *)buf;
>> +    struct vfio_device_feature_migration *mig = (void *)feature->data;
>> +
>> +    feature->argsz = sizeof(buf);
>> +    feature->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIGRATION;
>> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    *mig_flags = mig->flags;
>> +
>> +    return 0;
>> +}
>> +
>>   static int vfio_migration_init(VFIODevice *vbasedev)
>>   {
>>       int ret;
>> @@ -794,6 +1079,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>>       char id[256] = "";
>>       g_autofree char *path = NULL, *oid = NULL;
>>       struct vfio_region_info *info = NULL;
>> +    uint64_t mig_flags;
>>
>>       if (!vbasedev->ops->vfio_get_object) {
>>           return -EINVAL;
>> @@ -804,34 +1090,51 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>>           return -EINVAL;
>>       }
>>
>> -    ret = vfio_get_dev_region_info(vbasedev,
>> -                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>> -                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
>> -                                   &info);
>> -    if (ret) {
>> -        return ret;
>> -    }
>> +    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
>> +    if (!ret) {
>> +        /* Migration v2 */
>> +        /* Basic migration functionality must be supported */
>> +        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
>> +            return -EOPNOTSUPP;
>> +        }
>> +        vbasedev->migration = g_new0(VFIOMigration, 1);
>> +        vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
>> +        vbasedev->migration->data_buffer_size = VFIO_MIG_DATA_BUFFER_SIZE;
>> +        vbasedev->migration->data_buffer =
>> +            g_malloc0(vbasedev->migration->data_buffer_size);
> So VFIO_MIG_DATA_BUFFER_SIZE is our chunk size, but why doesn't the
> later addition of estimated device data size make any changes here?
> I'd think we'd want to scale the buffer to the minimum of the reported
> data size and some well documented heuristic for an upper bound.

As I wrote above, increasing this size to higher values (128M, 1G) 
didn't improve performance in our testing.
We can always change it later on if some other heuristics are proven to 
improve performance.

Thanks!

>> +        vbasedev->migration->data_fd = -1;
>> +        vbasedev->migration->v2 = true;
>> +    } else {
>> +        /* Migration v1 */
>> +        ret = vfio_get_dev_region_info(vbasedev,
>> +                                       VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>> +                                       VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
>> +                                       &info);
>> +        if (ret) {
>> +            return ret;
>> +        }
>>
>> -    vbasedev->migration = g_new0(VFIOMigration, 1);
>> -    vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
>> -    vbasedev->migration->vm_running = runstate_is_running();
>> +        vbasedev->migration = g_new0(VFIOMigration, 1);
>> +        vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
>> +        vbasedev->migration->vm_running = runstate_is_running();
>>
>> -    ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
>> -                            info->index, "migration");
>> -    if (ret) {
>> -        error_report("%s: Failed to setup VFIO migration region %d: %s",
>> -                     vbasedev->name, info->index, strerror(-ret));
>> -        goto err;
>> -    }
>> +        ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
>> +                                info->index, "migration");
>> +        if (ret) {
>> +            error_report("%s: Failed to setup VFIO migration region %d: %s",
>> +                         vbasedev->name, info->index, strerror(-ret));
>> +            goto err;
>> +        }
>>
>> -    if (!vbasedev->migration->region.size) {
>> -        error_report("%s: Invalid zero-sized VFIO migration region %d",
>> -                     vbasedev->name, info->index);
>> -        ret = -EINVAL;
>> -        goto err;
>> -    }
>> +        if (!vbasedev->migration->region.size) {
>> +            error_report("%s: Invalid zero-sized VFIO migration region %d",
>> +                         vbasedev->name, info->index);
>> +            ret = -EINVAL;
>> +            goto err;
>> +        }
>>
>> -    g_free(info);
>> +        g_free(info);
>
> It would probably make sense to scope info within this branch, but it
> goes away in the next patch anyway, so this is fine.  Thanks,
>
> Alex
>
>> +    }
>>
>>       migration = vbasedev->migration;
>>       migration->vbasedev = vbasedev;
>> @@ -844,11 +1147,20 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>>       }
>>       strpadcpy(id, sizeof(id), path, '\0');
>>
>> -    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
>> -                         &savevm_vfio_v1_handlers, vbasedev);
>> +    if (migration->v2) {
>> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
>> +                             &savevm_vfio_handlers, vbasedev);
>> +
>> +        migration->vm_state = qdev_add_vm_change_state_handler(
>> +            vbasedev->dev, vfio_vmstate_change, vbasedev);
>> +    } else {
>> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
>> +                             &savevm_vfio_v1_handlers, vbasedev);
>> +
>> +        migration->vm_state = qdev_add_vm_change_state_handler(
>> +            vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
>> +    }
>>
>> -    migration->vm_state = qdev_add_vm_change_state_handler(
>> -        vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
>>       migration->migration_state.notify = vfio_migration_state_notifier;
>>       add_migration_state_change_notifier(&migration->migration_state);
>>       return 0;
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index d88d2b4053..9ef84e24b2 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -149,7 +149,9 @@ vfio_display_edid_write_error(void) ""
>>
>>   # migration.c
>>   vfio_migration_probe(const char *name) " (%s)"
>> +vfio_migration_set_state(const char *name, const char *state) " (%s) state %s"
>>   vfio_migration_v1_set_state(const char *name, uint32_t state) " (%s) state %d"
>> +vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
>>   vfio_v1_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
>>   vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
>>   vfio_save_setup(const char *name) " (%s)"
>> @@ -163,6 +165,8 @@ vfio_save_complete_precopy(const char *name) " (%s)"
>>   vfio_load_device_config_state(const char *name) " (%s)"
>>   vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
>>   vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
>> +vfio_load_state_device_data(const char *name, uint64_t data_size) " (%s) size 0x%"PRIx64
>>   vfio_load_cleanup(const char *name) " (%s)"
>>   vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
>>   vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
>> +vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index bbaf72ba00..2ec3346fea 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -66,6 +66,11 @@ typedef struct VFIOMigration {
>>       int vm_running;
>>       Notifier migration_state;
>>       uint64_t pending_bytes;
>> +    enum vfio_device_mig_state device_state;
>> +    int data_fd;
>> +    void *data_buffer;
>> +    size_t data_buffer_size;
>> +    bool v2;
>>   } VFIOMigration;
>>
>>   typedef struct VFIOAddressSpace {

