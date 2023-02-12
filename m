Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C6F693826
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 16:42:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRETG-0002d3-U7; Sun, 12 Feb 2023 10:40:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pRETF-0002ch-3B
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 10:40:53 -0500
Received: from mail-dm6nam10on20627.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::627]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pRETC-0003w6-Om
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 10:40:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8KIa29U1MAIHBgerf8EKS3onUQ0acoiipJw89THM1y/hbnLXXNojIDVWNaf55JSAxVFpm0g8oTASaUBigaUiFNyoLnoe5xcLTnysFeMcB90/goWl8GbxJKTZXJkPb+Tj/Ah8CmHKk6XqjTd15G2CJKq0iycRo7byFziESuB5c1VKn8ylZVfMU27Nf70LI+JIV7u2/f0evXhjNBNF5hPjkPcWfR3LEbbDLpEk4uNUT/NAxGRohmVNIs3zAEz1YaQsehFepZHNcC2a0MDV11awLO5AFvRltJvKrbW31XbhUKTzozuvJ5u0a2A9Up7/mGPk+mrYiXGReIUxAiPna8cqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+QuX2ahzjmFZoFy/rj2b5qdm5qA1yTagLeESMhV1Es=;
 b=neqEue+XV50glU1kJaKbmF/DeBapEoPFv697vbpCYBdJl1v7NGLdM1VuAqtWcvi25Zcyu79plAFlPLNAspGdCU4iIyZINPNHbzUEc2cWZmeYItq5SCMxvArzvqPrOQ0yv9IdlkLlG0zPpIocDed59opa9uUqkQU1/18+1iFEz5/dc+1UBs2LhA4BVWFYmg3CeYt3vmSKIPpoIcVfFBNDO27rgFhPYCkQ0Vtliq3s/tTOeVir27l1OijD7EgLz8T7pFbLEKMkGx6mcgPCyWVEGSHmP6YYRM/TzFbTJ16iGb1YDmTIp6S/U67hJQocbiLB9lz2YjGN9deqXxes8gr30A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+QuX2ahzjmFZoFy/rj2b5qdm5qA1yTagLeESMhV1Es=;
 b=Mz0rXheLYFY7WAV+jNDrsUpzsD1pb1ba8KgE0QtYxiMqAnEpl7tYZaxlgX0ofLGgV3dZ2+Zeo/Hr56peTlbyoaUutv3ksZwBaYfUqS/OKYaz6lwZ5EHU9Itp28VdfIO5209fanMCfI9zTog78Aq6dtlNQN/C1euHVP0nNLZBwbXCJLjPo970y2cdmJ++ZVqEt3keYLOS936qRk6C3EoTLoU2JBnklq/odekYCqrePEK3D9rxP8d6invraYYv+P/7BA+2tih4/LN8tNx9aexjeGSrdmeW96JyNCNAxFejof2iudUNvDB/hcM25P9Zd8LwHm1NihD8Dbua6eWNhVZVFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 15:40:15 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%7]) with mapi id 15.20.6086.023; Sun, 12 Feb 2023
 15:40:15 +0000
Message-ID: <091fb072-57cd-5f7f-b323-082b761a01f3@nvidia.com>
Date: Sun, 12 Feb 2023 17:40:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 08/18] vfio/common: Record DMA mapped IOVA ranges
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
 <20230126184948.10478-9-avihaih@nvidia.com>
 <20230127144203.4ecf8c19.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230127144203.4ecf8c19.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::12) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|DM6PR12MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: 36bcac00-697b-43d3-3ac4-08db0d0f6f5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2gd+cCK6k1+o7rTH4zzaktYNZiVgcfFC9hRtGgr5Lqt0aK/87dOIDihecERLGKJSHqelQZEt06K2sR8xM5pwH1p2Y7xo3EVD9T3du5HnffK+lksh0fNQB+Scvydb/Fpj2ZAaiAbWuZiRTogIjzMoumjLu/UpGB4+VqwN9KwBeBOUZykzevHwp6rY2Ua7sxwp+g/gNzSPjRDUFJYtRqVQPYonbqrgTCN81N4Rdbc8UvyYxBHuBSJm56psYbxBh71K6E85bH4QIYpr+WM60mxgfWXIZ5zpy3QwppHdjAkEPMkIcJ/VdXtzoPOIgCBE7ceExFzryVSJQglXW/6IC5C7dQ445iwrLNOiBuYwSOWIGr97Lk+Az7wIFi44LnXXQtLGsO63YbZ/eqO+H97ogRLLPM7+/3iKEf571uXL+Z7XWHcCHprfM278ZgLBnsUu3d2gQRX6FpMxUgeCnob6XgsX2LOh7ASvGywIhe0pXOCxXuQlwkV1BbPt5iHv5t/Q+4lNZETcXjQOs0mmlIX4Ib2ZJhoBKp5Zgzy1Fvmj0HfUf9iNhBJCK6hr7l73gKYCLExlK+wlYUK9czUVkMFuC56CgAF/8fCONnpWeTaqSk9r7Qm1fB4nzTRWWpYoHyMt6ekEdr2DMO0jwOuCDG/lc/rbvWCjcbbAEmkmr/vhJWDxdWYr55Gi6+5fx7rYp88d+cb/FFX/zZm6eyUSOSDCh9fDlot6VqSMisHLzJ93BFcvHm0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199018)(6486002)(478600001)(83380400001)(36756003)(38100700002)(86362001)(31696002)(6666004)(6512007)(26005)(6506007)(53546011)(186003)(2616005)(54906003)(66556008)(66946007)(316002)(8676002)(6916009)(66476007)(5660300002)(7416002)(41300700001)(8936002)(31686004)(4326008)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MllNazNhVmRndnZRdVhjMHFIMkhGOStMYlZsODlIOUxqNU4yWGZhcTZ4bnZX?=
 =?utf-8?B?UkdRVUx1YWRlQUQzcDhPeS9ld0JyajhsWENwcnk2aWREbzZPZmxiRlV5L0tD?=
 =?utf-8?B?QWpzWlRHdzh1U0U0SmxIQ0h0N2p5VXJEQ0NOU3FvODdYTGF1K0VDdjNRNG1h?=
 =?utf-8?B?Y3lkVFRDS212M1p6Unh1NWtjZHMzK1hNOFFLN20vSnhXMHcxNFVwaHJ2SUJL?=
 =?utf-8?B?Sk1VdzZUYUJoMkJsZTM4cW1UNVpVTzR4NlI0aCtnTEgzTWo5bjNhTHBMSHJN?=
 =?utf-8?B?MzVKc2s0ZzZjUFdYcTI5Z1Y3VkE0Z3RwV2pybExJY3RjME12RWFyYmMzN2U4?=
 =?utf-8?B?QlRxQ2psMDNEaC9WNHJvVlBjbk0rUElGRytQQVUzK2l2bExWOXlEdjdobW5R?=
 =?utf-8?B?WXVneXlRR0M1Qk1QbWdxY2s4bUpUOWlIWHRHVnZ1V05WNjczTHJHM1Q4N2Fz?=
 =?utf-8?B?WUJXRFljdWJOZ3lvWHpUc1VzeGdFWEFuWEpGWmxLQitRWjlCZEFLSkVLWm43?=
 =?utf-8?B?RVZLclZ0UkFpU0o5L2F1WTJ6UE0yUmRiWU1xbUVkOTRJUG1mZmNEUnhoK0l6?=
 =?utf-8?B?eW1uOW1Yb3N6aFR5QytpeDVKSE80Uyt2dklBK0RTaFJhbFVpWkhqTkU1YnYz?=
 =?utf-8?B?TFNicTNBRDJ1ajVMRkVkekxNeEk1NDM1dFVTYng4Q3QxS3AzWU8rNi9SMHRN?=
 =?utf-8?B?dEpVVnBaSjR2a0hnbDFZeGVaQjZhd2lCYmRUS2RUZzBEK1lPcnJ0UGY1M3VL?=
 =?utf-8?B?T200YnpObGg1blVyZ09UVno4MTJsQ1dkOFRzUFlXZ1k4NlY3Wm1saXdCY0lX?=
 =?utf-8?B?LzhqdUgwTy8wOVhEcHdmNTc1OVpqdExpUE9LdUViS2RCWEl6R2NyckhlMXNa?=
 =?utf-8?B?S01LNVF0eTczMjZZL1h1OWZLaFRwVE9RTkF0a1FJRXpWdi9UdVNIK0NLc3Uz?=
 =?utf-8?B?RG5YZkdKcmFIWGtFb1Q1SUxCL2JEK1ByNERlN2o0YjNaNHRreUg1czlWM01M?=
 =?utf-8?B?cUZpbzVoWUQvak00bnh2ck80S28va0lmdU9rdkk1RHhVTmRUYlJCdmE1UERo?=
 =?utf-8?B?Y0RNM0ljVStYUjZlc25LaW83TjV1TitienZIYk1VS2d1UWFXcnNSVld1OTFt?=
 =?utf-8?B?OGM4S0VUekhlOFA1cGN1NGcrRjJvZHBsNUQ0OGhXbCt1a3F4bVdKOUJ5NXVX?=
 =?utf-8?B?ajNwRGc1ZldSSS95cy9PWWNUa0I4MnF4M2xOZzhBVkJSOXlPYWdJemJvRzgr?=
 =?utf-8?B?TVhpLzFtalREckhyMSs0TUpES0V1aTJzWDRrSXQyd3hyYUpRS2E5TTJnY21L?=
 =?utf-8?B?bFNWRjJESWxVd0xvMEF2SmMrSk80cDk4dUVrVzBvdG15SW5PL0Vwcy9nakph?=
 =?utf-8?B?RzR6cDRkNnZTNFE4clVlbzF2WThvdHVMSVlqRU54eGFvRTZvRzA0dU11Z3Jx?=
 =?utf-8?B?RG0yek9KQVZhN0RMY0xWaVo0Uk1Za1hPUEMrdHFRNWE2WjlRRlhUbE9BQldQ?=
 =?utf-8?B?a3BXbklGV29wUlkxUDdpMUpueWgrSzIvaE1RWE1UZXlSWVJZZGROZ0pscmF1?=
 =?utf-8?B?S0Q5M1RKbmpHaDJSY29JSFRSTWRJY2RwYUpRSWRiMDRzR2pCT2tpQnQ4N1Yw?=
 =?utf-8?B?bER3Vk05Nk9JN3FTYUd6czN5dG9iR0JPQ2dWcGtVMkRwb1JaWEdXMFl1N2FO?=
 =?utf-8?B?Wkc3bEtQY21BMHVuUWFwUzFKNG1WREQwOWFiaHVHSjJWZ012Wlg4ZUtWbU5S?=
 =?utf-8?B?cEhDcWJVcklTbUJSUGlGZlF0Y1V1WXluUnBjRUo5Wkt6R2V5ckttNG9PZDJO?=
 =?utf-8?B?clNIdVlGQ2h3L2k1eU4zakF1V3RHYXd1NTBJc3hNeG43ZHJ1Uy93WEtTYkUv?=
 =?utf-8?B?cEpPWk8wMVZkNVVlSUQ3VWRkMXVPaUx4TzdqbmlMY0hRTDhYM25CY2NMdzNp?=
 =?utf-8?B?VmJVZktlbVQxMU9OVFdpTlEzQ2p4WWJqYy8zQXpYQXhPOHFqUURPanhQUEN2?=
 =?utf-8?B?MmwrbS80SnhxMzRSbVNGaXcyN095anI5OXAwd3RKQWJyK2lvUzM4QTQrZXB2?=
 =?utf-8?B?RW14WUpoZXJvZHdSZC9OamZYR1JqN0t6NXltejdiR21XMmRLb0dXaGpUWGdH?=
 =?utf-8?Q?Q9NgIgFkTiuRS/v2NEYjnkaXR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bcac00-697b-43d3-3ac4-08db0d0f6f5d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2023 15:40:14.9920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7xttrMmsSnltjg3DE3VEgJk75Bl+cPR45vWczasNR76JWYAsEaO/J6LWOTY0GFAcP/uf1bbavb8nyfuYJKAGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313
Received-SPF: softfail client-ip=2a01:111:f400:7e88::627;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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


On 27/01/2023 23:42, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu, 26 Jan 2023 20:49:38 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> From: Joao Martins <joao.m.martins@oracle.com>
>>
>> According to the device DMA logging uAPI, IOVA ranges to be logged by
>> the device must be provided all at once upon DMA logging start.
>>
>> As preparation for the following patches which will add device dirty
>> page tracking, keep a record of all DMA mapped IOVA ranges so later they
>> can be used for DMA logging start.
>>
>> Note that when vIOMMU is enabled DMA mapped IOVA ranges are not tracked.
>> This is due to the dynamic nature of vIOMMU DMA mapping/unmapping.
>> Following patches will address the vIOMMU case specifically.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   include/hw/vfio/vfio-common.h |  3 ++
>>   hw/vfio/common.c              | 86 +++++++++++++++++++++++++++++++++--
>>   2 files changed, 86 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 88c2194fb9..d54000d7ae 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -23,6 +23,7 @@
>>
>>   #include "exec/memory.h"
>>   #include "qemu/queue.h"
>> +#include "qemu/iova-tree.h"
>>   #include "qemu/notify.h"
>>   #include "ui/console.h"
>>   #include "hw/display/ramfb.h"
>> @@ -94,6 +95,8 @@ typedef struct VFIOContainer {
>>       uint64_t max_dirty_bitmap_size;
>>       unsigned long pgsizes;
>>       unsigned int dma_max_mappings;
>> +    IOVATree *mappings;
>> +    QemuMutex mappings_mutex;
>>       QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>>       QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
>>       QLIST_HEAD(, VFIOGroup) group_list;
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index e554573eb5..fafc361cea 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -43,6 +43,7 @@
>>   #include "migration/misc.h"
>>   #include "migration/qemu-file.h"
>>   #include "sysemu/tpm.h"
>> +#include "qemu/iova-tree.h"
>>
>>   VFIOGroupList vfio_group_list =
>>       QLIST_HEAD_INITIALIZER(vfio_group_list);
>> @@ -373,6 +374,11 @@ bool vfio_mig_active(void)
>>       return true;
>>   }
>>
>> +static bool vfio_have_giommu(VFIOContainer *container)
>> +{
>> +    return !QLIST_EMPTY(&container->giommu_list);
>> +}
>> +
>>   static void vfio_set_migration_error(int err)
>>   {
>>       MigrationState *ms = migrate_get_current();
>> @@ -450,6 +456,51 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>>       return true;
>>   }
>>
>> +static int vfio_record_mapping(VFIOContainer *container, hwaddr iova,
>> +                               hwaddr size, bool readonly)
>> +{
>> +    DMAMap map = {
>> +        .iova = iova,
>> +        .size = size - 1, /* IOVATree is inclusive, so subtract 1 from size */
> <facepalm>

I am not sure what's the error you are referring here.
Is it because DMAMap.size is not actually the size?
Something else?

Thanks.


