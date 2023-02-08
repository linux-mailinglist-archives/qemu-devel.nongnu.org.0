Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897DA68EF83
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 14:09:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPkBm-00022Y-0r; Wed, 08 Feb 2023 08:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pPkBf-00021J-Cj; Wed, 08 Feb 2023 08:08:35 -0500
Received: from mail-dm6nam10on20621.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::621]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pPkBb-0008FH-JW; Wed, 08 Feb 2023 08:08:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTUGY4ZoF9VGbcGnuM4YOLpGrD+neFHBftRNy+ay1BhfiYAzbkOEKGabEY2lycp5Df5ShOcsEmrdYFmakPrLFQkxlGQ1Up6S7LmDVadBCrTShK/WjA8ow4HENE4n2MPB4y5MceXn8mMEMrlM1cw5jQ/Q9rKsAoIZR14kjrgSz42Tp3CZTZTGljyYT/BgFJ6Rr2DwDcrchKIby10QQnfm6GhY95Bi10gLoGTEDEbwzBULAiYt64iRQ+Mp6wsqZEmI3Gs9rszgPEJypkJ6utIIxM52VY1qBDcCWvGcb3m4VNtkuiGJp8BNzU/yWfPLr+1OlCvqo+0AvCeExA25WacA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNPUIieB81x8f6YC581WjWBsZf2P9qlcg4uYJt6ohOw=;
 b=EEEK7rTgFactaMj+fSOCzNRLOkwttj/LQQI7e4IE+j1Q1SLrrqD50rWUeI6qBK+JPxu/4jcbFwEpDWB/QdiojhvFnI+wR9T0jjEHeAbrQg57elqISoxwwgRyf6P9wEduCGd9JpFUN0QZgfhHCIr8e/RlZkyiiFAOvVluO0Xv1tpsZn9J1axLS4NFM0Ck1fT0y6IEtu2LqLuxmC7f7iv7a44Wc8IjOwm1TDb3Vbp3R2GeBasS3rQotWTHz9L0nmD8oaiXZMo7i7DseXFrZiNPsG7FDAWmdHqYdtzvpu/SjtYs+eNKAIn+SFYNh31kRkzaB0l8ePQaLggn0Z+9+6wYHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNPUIieB81x8f6YC581WjWBsZf2P9qlcg4uYJt6ohOw=;
 b=DgcnJmuA546tnT5XkKv6/zVIT6uKQ5X+4Dj79V9iGMyq30T9QBGm2O0JGH9mtWdgcR736yCyoFIgc/tT0w74LcC67+t7vIYTLaqJ+iQtcOvaybF3FmOOlQbmu028T2Jr/X6ioUPtu/WzVA+wukfvOBMono5JFgKWkoMXlM0hasfbF7+uqy3SfRBf91YkD1567L5j6GzmXy2JjW1x4TLbhQdxnoa8CUEiUmJuK2tDdQS523ZfFPp2AYjARzvMbaNn+FFe1vZQPaFEA9WVpNkGPyAgcary1ZRoKQrb+h0hCq8qhCCe8ryKsZco0aF1dBA7GCt3wte+KJ3E6LISNbX5Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by CY8PR12MB7363.namprd12.prod.outlook.com (2603:10b6:930:51::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Wed, 8 Feb
 2023 13:08:25 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%5]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 13:08:25 +0000
Message-ID: <238b17d1-17a3-e5d1-2973-4bda83928d6e@nvidia.com>
Date: Wed, 8 Feb 2023 15:08:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v9 07/14] vfio/migration: Block multiple devices migration
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
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
 <20230206123137.31149-8-avihaih@nvidia.com>
 <20230207153454.4e1a0c51.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230207153454.4e1a0c51.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|CY8PR12MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a3576b-a0a0-4f31-4351-08db09d58ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F4U4V6PUzhdrCuMjwbmJyWT50yLSpcqCqYzuHh3Enp8nxfteSVvaUk+Fw+Gye1wbEGt7zw1UIRzY87raxim5Blz0sEJXH3By1aiyFxERIG2nB1ohXluzHxgXtahJ6/9MnEP8iI1gx0JZFPe/TCW3y8TLnOOFqlV7WWRvz/EWvRFZMAjxN9KUkG29TasRMvofGUUxPOPHVBvLHZUgYT3Op4B0fqARklVKhnNsItICrN0l6wa/jXd+aafd0KiRooGR/6xfghxz6QqaBzCc8+plRMf15BIzV/XS5YgT4vRiQ4ylQ+F1KCb+nFu3o9m1JCtw66y5Bh+x+IBPSgdBdUNMVq725ur2pBeWgBfQrD8lLm20A3CDRdcjTbo0JpuABkl0cqXe0+wxcFv1lZ6t9UcwSSGpfikYcPrFiTKea9dEpPGXyV2ipLGP+OYqn+BVdy+jhJm4w2CDLae0W5WHDGx2+s8QxkQ4JeLSeUg4DrS+CfREV69f6HQAh3u7gH3PIemaySyJi3xeYggtrkIO97+hn1KaKY3aBejhZm2WNf2kxf+CYHviEt6y7nQrZxxpcw6OhjtdfXD0PJjw14kTIXwH1lg5uTIXTuCrSRqr0IIY5kYqGqEYRAlnPt+Di6dxrsjs/6OpujlU0IDnmKvTE8lMR7uMZuaym8JHD+dIIaR9Usme5J2eqDrjpJt2g9ya0pmD0Y8M87NSPbs6RIW7OPwXLIt28eBhXSAWVgBPE6eGcIA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199018)(6512007)(26005)(186003)(6506007)(53546011)(2906002)(6666004)(36756003)(7416002)(5660300002)(31686004)(478600001)(6486002)(41300700001)(8936002)(2616005)(8676002)(66946007)(66476007)(4326008)(6916009)(83380400001)(66556008)(86362001)(31696002)(54906003)(316002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGR1L1VRWExOa2FoeDZrOW5LV0lBUE12aWFkK1JDVUl6YUZxeWlsWG1TeWRp?=
 =?utf-8?B?bEJBRXRMT0VSVG9lKzlta0tpdlVnaUExcEJxbzhuWDBjcnNOMmk3d3ZCcnpV?=
 =?utf-8?B?VnAzc3R6UHpKWUFuR2RTc0pPUk1USVcvSitoVjNHMVdMZkV4T3Vrem1nK1la?=
 =?utf-8?B?VWx3eFVKemE5NHZ5Rk10MTI1THp6UGVCcjlmeno0Tlg4c2dVeUp1cWVzdG9x?=
 =?utf-8?B?cjN2MUhpV3JqRUxkT0hFbnQ1cUFOdXNBN1IrTVFFLzRnT01xZExZNWJXcXJ5?=
 =?utf-8?B?SkJRbXZpWkY1U08yY25Rb3BFbm9XRURwMG52OEZuUUIxV1l4Q1E0NVRKUFVW?=
 =?utf-8?B?dElvSUtZcjNvQ1pqVnZxYmdqUjRLL1JGT0lLL3pZQUFoaUhVNy9CN0lxaTMw?=
 =?utf-8?B?SnJBS0VwaDBOQk93dXJIdTNGbkxDMkNFelNyQjlxRm5pQS94ckNLODlTd293?=
 =?utf-8?B?YlR6bU1VK0JoQ2VtZjJ3bGJMcG1sVmRCMWQrWWxDZlZRYk5jMWdGQjBHWUFk?=
 =?utf-8?B?S2J5RGNKTkZMdzJVdGFCRGFwbUdZaFhMZ3o0NzBNb200L2UxcEJMWmVtMkhD?=
 =?utf-8?B?Ymd5Z3hWTVMvZ0lIYThKR0Y0N2Joa2JEYVJuYmRzalFLZWZSbzNLRmpSSk9S?=
 =?utf-8?B?WlZ4NU8yOHRkZ0ZYSyszMlpxZmVZbWFCS1FEY1VFNE1EcXE4b2JuNUxqY1Jk?=
 =?utf-8?B?SHVsZDlXZHBRbS9FMFhjR1VEV2pFS3B2bnZtOEYrV1luQ3pUR28xaGFCb29l?=
 =?utf-8?B?dFMzaWg3WW41UHcyMmRFbmxiNFZoZTdBMmQ4SkZoUzhxRWNTWnZ0WGkvSTBh?=
 =?utf-8?B?VnNDb3NBZ0Z1UXBGQ01qbW9YMDdLR05aaERLRHNzb2RLdWRCNDhBMUJwMUNl?=
 =?utf-8?B?NXF5Zm92ckNEemhldVhzVldIWno0ZDJUcmx0TDBuMEpJU2xWMkNGTHNCWGIx?=
 =?utf-8?B?YlFPeGNJdjF1Vy9IN3VwUGcrMk95M3ZhUVpnRGNRUU12OHNBZS9WS2ZkUzFO?=
 =?utf-8?B?MDdxcWlMMXg5djliMm92TWoxeU1ubTUvSVVRSEVFTXNrWDUzVGNMRHJ0NUd4?=
 =?utf-8?B?dHNIaGJlU1V2SmdJNU16ajArVFRhZ1B0U25QcitQSlBnbE5LR2QvbUJvd3VK?=
 =?utf-8?B?NFpHdm53WjA3NlJFQ0VvYmM1VWNDOUZsWGRVWFgvT2cxMEFYQ0xTOWkrM3k5?=
 =?utf-8?B?ZlUxMjVxazR2TnMrS1VpaGY2dS9mQmVtTzdqeXFJWjV1NnFWb1Z3NmxoZllF?=
 =?utf-8?B?TitzNy9PdzhVMSs4SnAwRmMvYnh1OGJWb2x6VjFRQUs1eG0ramVFOThRckNQ?=
 =?utf-8?B?bUNQb1R3ZVo1cVBWMW4yQlNXcGhBR2VrM0p0dWYrUC8wNXBGOU95QktsZTgz?=
 =?utf-8?B?akRsSmYxVVlBK284VzFFT0U3YlkwY3VlNG03YVhBbk90SlA3aGZzZXVORFVi?=
 =?utf-8?B?WTdQODBuUytoMnoxaGk5cjAyRnNtM29IUFFsTk1kTTJ0RUdDN2dpR3o1TjhC?=
 =?utf-8?B?VUpkajFSWU1OZ0o5WitpY2M0ZDZuclc4N0xBNy9uZjRwTk5jeTZyVHNHeVZ0?=
 =?utf-8?B?RXFrZzB3emxkQ0RKalhUdEdsakxPS0xaUEEvZW9qV25WTmZ0b3FFVTlVaHNO?=
 =?utf-8?B?Q2VSVlJ4elc0d2xCZWJuQk5iV2JKVUFSOTROTU5heWhNemdyTlJEdmNLck5s?=
 =?utf-8?B?QjF1Q05nU2J2RFRBSW50NEh6WDM1ejEwK0g3VEdCd0Jwd21WMXpsWTZLUDMx?=
 =?utf-8?B?SGxtdGhHeS9sd25tT3BZc2xqK1diREowRHI4ZTM3UHBSbk1iTkRlcEtwS0RO?=
 =?utf-8?B?MjRQMFBPS2p3bGpLazhoVTMzdGtzNHFTQ2tpV1ZYSTRuV1RwQU0zTHpBdTVP?=
 =?utf-8?B?RG83U0VxMVJkTEpCODRZMTdQaGJ5cGJnUTBYWFU1cGc5a0pXYTh5bjVKeng1?=
 =?utf-8?B?VFVhSW1IN0lWaXB4ZVBsdVl4cGF5d004VFZoWURWaXYzWmhibUVEK0V2S1pt?=
 =?utf-8?B?UlVRaWlINlFacDRYOVB0Q2hVQ0hHL2lZakhvT1NNUDRpZmRPcmxsdnFxRDRJ?=
 =?utf-8?B?ZTFQeWErZFJXa0k0Rzd4d1dwb2VpTzY1Z29wVURuMGM3T3VyMFJGak1LS0wr?=
 =?utf-8?Q?s9rpnke/mL4acDmn2wIWUa0uk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a3576b-a0a0-4f31-4351-08db09d58ff1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 13:08:25.4600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lEQNCvLhauB6zoGHsjdzhkERUZM3yNSD126E4h3HRGDNTU1znhH5AX+XIk/kUAg8/OpNHvHDuSgJ++bVTewIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7363
Received-SPF: softfail client-ip=2a01:111:f400:7e88::621;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, SPF_HELO_PASS=-0.001,
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


On 08/02/2023 0:34, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Mon, 6 Feb 2023 14:31:30 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> Currently VFIO migration doesn't implement some kind of intermediate
>> quiescent state in which P2P DMAs are quiesced before stopping or
>> running the device. This can cause problems in multi-device migration
>> where the devices are doing P2P DMAs, since the devices are not stopped
>> together at the same time.
>>
>> Until such support is added, block migration of multiple devices.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   include/hw/vfio/vfio-common.h |  2 ++
>>   hw/vfio/common.c              | 51 +++++++++++++++++++++++++++++++++++
>>   hw/vfio/migration.c           |  6 +++++
>>   3 files changed, 59 insertions(+)
>>
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index e573f5a9f1..56b1683824 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -218,6 +218,8 @@ typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
>>   extern VFIOGroupList vfio_group_list;
>>
>>   bool vfio_mig_active(void);
>> +int vfio_block_multiple_devices_migration(Error **errp);
>> +void vfio_unblock_multiple_devices_migration(void);
>>   int64_t vfio_mig_bytes_transferred(void);
>>
>>   #ifdef CONFIG_LINUX
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 3a35f4afad..01db41b735 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -41,6 +41,7 @@
>>   #include "qapi/error.h"
>>   #include "migration/migration.h"
>>   #include "migration/misc.h"
>> +#include "migration/blocker.h"
>>   #include "sysemu/tpm.h"
>>
>>   VFIOGroupList vfio_group_list =
>> @@ -337,6 +338,56 @@ bool vfio_mig_active(void)
>>       return true;
>>   }
>>
>> +Error *multiple_devices_migration_blocker;
>> +
>> +static unsigned int vfio_migratable_device_num(void)
>> +{
>> +    VFIOGroup *group;
>> +    VFIODevice *vbasedev;
>> +    unsigned int device_num = 0;
>> +
>> +    QLIST_FOREACH(group, &vfio_group_list, next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            if (vbasedev->migration) {
>> +                device_num++;
>> +            }
>> +        }
>> +    }
>> +
>> +    return device_num;
>> +}
>> +
>> +int vfio_block_multiple_devices_migration(Error **errp)
>> +{
>> +    int ret;
>> +
>> +    if (vfio_migratable_device_num() != 2) {
>> +        return 0;
>> +    }
>> +
>> +    error_setg(&multiple_devices_migration_blocker,
>> +               "Migration is currently not supported with multiple "
>> +               "VFIO devices");
>> +    ret = migrate_add_blocker(multiple_devices_migration_blocker, errp);
>> +    if (ret < 0) {
>> +        error_free(multiple_devices_migration_blocker);
>> +        multiple_devices_migration_blocker = NULL;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +void vfio_unblock_multiple_devices_migration(void)
>> +{
>> +    if (vfio_migratable_device_num() != 2) {
>> +        return;
>> +    }
>> +
>> +    migrate_del_blocker(multiple_devices_migration_blocker);
>> +    error_free(multiple_devices_migration_blocker);
>> +    multiple_devices_migration_blocker = NULL;
>> +}
> A couple awkward things here.  First I wish we could do something
> cleaner or more intuitive than the != 2 test.  I get that we're trying
> to do this on the addition of the 2nd device supporting migration, or
> the removal of the next to last device independent of all other devices,
> but I wonder if it wouldn't be better to remove the multiple-device
> blocker after migration is torn down for the device so we can test
> device >1 or ==1 in combination with whether
> multiple_devices_migration_blocker is NULL.
>
> Which comes to the second awkwardness, if we fail to add the blocker we
> free and clear the blocker, but when we tear down the device due to that
> failure we'll remove the blocker that doesn't exist, free NULL, and
> clear it again.  Thanks to the glib slist the migration blocker is
> using, I think that all works, but I'd rather not be dependent on that
> implementation to avoid a segfault here.  Incorporating a test of
> multiple_devices_migration_blocker as above would avoid this too.

You mean something like this?

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3a35f4afad..f3e08eff58 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c

[...]

+int vfio_block_multiple_devices_migration(Error **errp)
+{
+    int ret;
+
+    if (vfio_migratable_device_num() <= 1 ||
+        multiple_devices_migration_blocker) {
+        return 0;
+    }
+
+    error_setg(&multiple_devices_migration_blocker,
+               "Migration is currently not supported with multiple "
+               "VFIO devices");
+    ret = migrate_add_blocker(multiple_devices_migration_blocker, errp);
+    if (ret < 0) {
+        error_free(multiple_devices_migration_blocker);
+        multiple_devices_migration_blocker = NULL;
+    }
+
+    return ret;
+}
+
+void vfio_unblock_multiple_devices_migration(void)
+{
+    if (vfio_migratable_device_num() > 1 ||
+        !multiple_devices_migration_blocker) {
+        return;
+    }
+
+    migrate_del_blocker(multiple_devices_migration_blocker);
+    error_free(multiple_devices_migration_blocker);
+    multiple_devices_migration_blocker = NULL;
+}
+
  static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
  {
      VFIOGroup *group;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 552c2313b2..15b446c0ec 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -880,6 +880,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, 
Error **errp)
          goto add_blocker;
      }

+    ret = vfio_block_multiple_devices_migration(errp);
+    if (ret) {
+        return ret;
+    }
+
      trace_vfio_migration_probe(vbasedev->name, info->index);
      g_free(info);
      return 0;
@@ -906,6 +911,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
          qemu_del_vm_change_state_handler(migration->vm_state);
          unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
          vfio_migration_exit(vbasedev);
+        vfio_unblock_multiple_devices_migration();
      }

      if (vbasedev->migration_blocker) {


Maybe also negate the if conditions and put the add/remove blocker code 
inside it? Is it more readable this way?
E.g.:

+int vfio_block_multiple_devices_migration(Error **errp)
+{
+    int ret = 0;
+
+    if (vfio_migratable_device_num() > 1 &&
+        !multiple_devices_migration_blocker) {
+        error_setg(&multiple_devices_migration_blocker,
+                   "Migration is currently not supported with multiple "
+                   "VFIO devices");
+        ret = migrate_add_blocker(multiple_devices_migration_blocker, 
errp);
+        if (ret < 0) {
+            error_free(multiple_devices_migration_blocker);
+            multiple_devices_migration_blocker = NULL;
+        }
+    }
+
+    return ret;
+}
+
+void vfio_unblock_multiple_devices_migration(void)
+{
+    if (vfio_migratable_device_num() <= 1 &&
+        multiple_devices_migration_blocker) {
+        migrate_del_blocker(multiple_devices_migration_blocker);
+        error_free(multiple_devices_migration_blocker);
+        multiple_devices_migration_blocker = NULL;
+    }
+}

Thanks.

