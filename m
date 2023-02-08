Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1D568F434
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:18:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPo43-0001up-Lp; Wed, 08 Feb 2023 12:16:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pPo3x-0001u0-GK; Wed, 08 Feb 2023 12:16:53 -0500
Received: from mail-mw2nam10on20621.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::621]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pPo3u-0005iB-C9; Wed, 08 Feb 2023 12:16:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ht0U5W3nkKpb1N+lYGCrLpnqi8TTPgMQsuGhWkBLvyevDETCFOwi4JiybK3KRn0i7N28m1z6fpWK1aRvdQQVOf/2jawk5CUf78zpB28Jv5X4u/S6HVJkBMLhfYuf98feqcqxheNFebfBcisoDCwrSrhX31qU9Ap4aUNsP7dZaFuNd6hUPE+7yKytLzKUJyNki98J5DGqdUqVktrOxZn8imFWKuCOHH4aa8X5ARODtbv9tmnpdCC9/O57XRDEObzjeq6VQ7UP178kgDfAbUpNUEWqpK96ewk6oC0grCXIMSj7qkODW35PfkXZM4pkpqYul1B0MkMvcjBlD7QgEUxADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVMSnPtaFhxOk8rKO2vO07JuzMBU0UC5XWWCi4p792w=;
 b=FJdeiuQ3RKVaHcyKlLSrYof9IJAq0vje15ulwYs2A9/rp7uXOm4nyo+/8Eh8vKukVuHRN3zJpd+ebQoLxqgmiXxJo0ChTzybPlSvf/Vfmfs+36rOTxOS8SIILC480njuYQeOsygXF7rPqI3Klr2QzpfgUh5DeJgTMEvtnU0J9FREj9F0BP2woidJK4+2YAXgjdoQpVMxxrUzi7/SdKRD6BAizPd5qxsur1vLW6PeW5ozT5fyYHeahrLun3eTC7Rq8X3WBFZdxnSkIjqpOmh68hxicC/rEnP+vPzqZ959NgEj6Gh0R17pSs/WGqoBfst/774MhNPEnBIrZ0stnx+oPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVMSnPtaFhxOk8rKO2vO07JuzMBU0UC5XWWCi4p792w=;
 b=Zg9g4d0EQzGRFRl3iJBIEwb1p29IEk4x/l6MJ+ukUBFXQPDW70iCmKiOLS3ZSUnwFpc1NueHMQPvPOW8isfiIdOi2c7Hw6n+KjR1lXeuMCOP/+6TlIApeoXfC+1LpLdPbiPJnlqiz/Epg78T2odKCwHA3tNEgpcoHxIaKYbTXG89kO+LLtKh9I8gWvJwxdT1A3KJfdp+T8cgedWPDhbg1ONKBwdilmTAPZ/zybJPgguzuGHpm9+5DFpMZF2+8Cexst0BtVK5uyFwnBruVvZNVyfudNkONN5kRKU+SsCBLrfVfdR4mkIVeWcRUE38/L9DYX+RBFo3BbtQy6b/IIheUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by IA0PR12MB7649.namprd12.prod.outlook.com (2603:10b6:208:437::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 17:16:44 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%5]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 17:16:44 +0000
Message-ID: <581f7d29-00f3-ee0b-c14c-42fdae308699@nvidia.com>
Date: Wed, 8 Feb 2023 19:16:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v9 07/14] vfio/migration: Block multiple devices migration
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
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
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
 <20230206123137.31149-8-avihaih@nvidia.com>
 <20230207153454.4e1a0c51.alex.williamson@redhat.com>
 <238b17d1-17a3-e5d1-2973-4bda83928d6e@nvidia.com>
 <fcb9bda8-6d95-6109-ae5b-beeb9aa63af2@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <fcb9bda8-6d95-6109-ae5b-beeb9aa63af2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::16) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|IA0PR12MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 350e6d6e-5a41-4ff8-55f5-08db09f840b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o71NO84KG2eWjEl4NGqkB/1IxTQE1HXsRsmFtgWECRusYrhSrk9WtRpsPz7FrJ6iUMlw+EuQ9f1JmUMpTptmSl6l/A8rsdpA0IajzGw7aO8I7LQ5WZkAgIUuBMCJYyrOoKPMkIUfSt9hPM/2XRy0YwRMS0yZmkz6uuM6SXPNoFlvhCZ4mlSCq5TP6Hs0awzAN8F62KqrCxgMUm+0PdhoYtJ1jXeIGPx1KWFWXwl10QCFWjWcuPaXZTi1okkjFM+FC9ndc8OP+DVo8fK1jefLelBKX7+I87udieFcMzms6BD/GTweUijE0yFjnmpW8SinIdXy2/18Zaek/CdLmIgNFNyzjqJabLmCHAzLEuQD63at9pS9rh3Zyh5AALkG9wW7JrZA6swsz5+zI3a2sNaYWMawD5bP3t9LLDNVzOXweNmChscKyjs1buUXZmqvHUPcKlQjPG6cIEofU079kxsJ3aUXVZuLv6btCRRey9p02pHbISyiVY2G3CRVOrj58P/p4T2vYGbbMp9igetINpXgM3gTazj4gZGAR3QyyVd7RXfJcs3/1ZB/QY80FD5nlN5T9xZc/kbTZ0k4n+40pxWRAWCs94WJGJQvgmBlgb+G6/4+12A+v8WObOJCqK9YBOKJV3CtfL3bLICKmG58Y4qRb9Lw2/pkwxVlpl65DC4CY30n+mNI0GE2naly+u0N9mDbkJ6iceJyVM9sr6fQcpHwS57e+fQSs+MSglbafTG9IA0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199018)(2906002)(31696002)(5660300002)(7416002)(38100700002)(6486002)(478600001)(31686004)(6506007)(53546011)(6512007)(83380400001)(66574015)(26005)(36756003)(86362001)(6666004)(186003)(2616005)(41300700001)(66476007)(66556008)(8676002)(4326008)(8936002)(316002)(66946007)(54906003)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGxPV3BNbVROa2VDU3BXM3ZQRFAyMVZNYlhtV1pqdmJXQkZEUG5iZVN4dlZr?=
 =?utf-8?B?VnN5Vi9qaW5US0sreXRNZTJLWWgrV1VYKzRtbE4wam0zUWx4M0F0aG00bXFm?=
 =?utf-8?B?aFVVcHhyUmpaeGJNMXova2drVUFSQmMxR09WQUZhb296amd1dDBvM3A0Uk9T?=
 =?utf-8?B?YzVoTWxieExlbHMrdjFQNXpmZUJrT2pqaTR2bFRCSDF0OGROb3BVaEVZcW1a?=
 =?utf-8?B?aHovaGExUE5HUVh3Skk4N3ZUVUhFaDkrMWQ2bzVjN2lTRFhmcmdDZXNyYzV2?=
 =?utf-8?B?OWc4dlpRMFUyLy9obHRqRVh4SHA4SitIK3hqV3FYSlZienVHM05VUGVFMW9i?=
 =?utf-8?B?RWtBWWR4YWhMbkFpUXFPR25mSGUyYUcrSlRETEZXbkpWSjlzam1zOHc0SmQy?=
 =?utf-8?B?cWgyODM0NEcwSzdyUEtxYUdoOHZldnhINGxVZ0xBOHJnN2dzNEh1RHQzeG5U?=
 =?utf-8?B?REUxbCtSc2k1OGN3Y1VTa1BoZFFrOFErUEdXdDBKWEtRVkpGZUEza1UvbjFE?=
 =?utf-8?B?SjJzUVJacExqSW1iTFBoSGNhSWJ0VUhYRjVXNEgrZU5ZdGZheTI1UzNwc011?=
 =?utf-8?B?YU1GWEN1ZE9CTmNMZ2ZKaXRIUTJ5K1R4Qm1zOXVTL1o4aFkySmwrenFMbWtB?=
 =?utf-8?B?NzJKUlN6ZWs5dytkVzZUNW9kN3pDaWRwMHVpRERQQWZZZk0rVDZTVlZYRDlW?=
 =?utf-8?B?T0F0czhtTE5PNDY5dFBaTThJTWZzR01kYzVqb2dBeFcwZ2JVcnNwWWdYNFBi?=
 =?utf-8?B?aUFESlk1M2h4RUFEVDJhaXNoV1JWU2RRYk1uZEU1RHgyUTJOOUkrWGFoUXZh?=
 =?utf-8?B?SHE2ZEUxMFFLdGlzbFhzcG92dG9Ib3grZFZWZmVGU081YkYzSXNKeVVzMXhC?=
 =?utf-8?B?TzRvc2hrNFRCUncxd0NjMDBJaWZmVEFOMkJxcVJmNEhFR0FBKzZoVG01Vm5x?=
 =?utf-8?B?MzR0RFRxOGplRjcrallNdTBwTXBhTXVpdEhnU2hSVWZPa0kvS2tpb2g3Y1F0?=
 =?utf-8?B?K29WU0FsUThtSzVjOTJ2cUxnVlJBZVUxMjJ2N2ZNQjBnMUVQeEkwZjhVQk1z?=
 =?utf-8?B?cGIrMWxjQ3IxWmJ5NWt2VFJveUlsV2c4L01oTVRST3VQZXE3NVlYSmhiaFR3?=
 =?utf-8?B?RFdFMzM2TFN4c0Y0LzFhVGZZOEIrSVd5Nm1KcVNJc1VOajdKN1N6S1JOZzlj?=
 =?utf-8?B?MWRIR2gwK0tDbUx5YWl2dmhtRXBYaHM5a3k5VWVLMkRoaUVvYTNMWFlrMDUx?=
 =?utf-8?B?Zis2bFFGMFBlSDFhdjg0Vm4vQUZycE1VS25oUU1lbWRBVDZFRFNPWGNRTnQ5?=
 =?utf-8?B?Vk1EclV1ZUFjd24rbWlVUzBZWk1uNnRiV2ZoZElJalNWV1F0T094cU9KV2E2?=
 =?utf-8?B?dnp6MlpLWVZ3bHlEMHozbVlubEltSi8wYWthVTE2ckE3VE1JUnErZ3hLVHg0?=
 =?utf-8?B?SUU3Qkd5b2JVai9veWV5UHhHWDJ3bmN3ak9rZlM0dTNxMS9KVUp1QmZLMUhq?=
 =?utf-8?B?bzc4OGl2a3FSU3htRkdWTU5sczNYQmE2TEprdHJGWUZOYWNRZDVOZVJ2aHBP?=
 =?utf-8?B?VVhocy9iKzlqcmRVVm9INFN1bW44dmNjalEzL0lyd2tTVDlLNTFDbXRPREQv?=
 =?utf-8?B?Y2Z6Tzl6dUhDQk5OWnNibDV1NTZXblgyV2JuNS9od09tMk93Nk4xQWhPRTEw?=
 =?utf-8?B?djN6VGNqMEJ5V29UZnVUblREVmtHWUdNVGF6YnVUVU94VEVpRnRoOEE2clhV?=
 =?utf-8?B?MlVOVEhmaDlpUklVNllQeTlwTEI3T2NsbVI4aVpUTDJnNkN4Ym5ML1JZemRZ?=
 =?utf-8?B?bjNvdlQzakd6VzgraDZrQUdLaGNodjBtdHdhaDhSVkVxRXNwVEFEQWR3bFNQ?=
 =?utf-8?B?YlhsMklHaVdPQ2ovU256Z0dhS2VLOVc5WWJDV0FyTlovcDdOR2ZNNE9rTk9o?=
 =?utf-8?B?QlBwamtGeHFFVGJVdUVQQkZVcmgvbVJHWkNsVEtSS3JWRndiOTU3bWQ1WnZX?=
 =?utf-8?B?OUJWSmRtZ0hLdk5OTkRNRmVmWGRqYURSeUJQVlhONW0rZzhFMW91VXVGK0NQ?=
 =?utf-8?B?dzJWZzdOU0RDcThWQzBOSkt6dElJay8rOEZ2T0xCeHpTeXdDMlErcnk4YW1V?=
 =?utf-8?Q?v01GDcVO8ZiJDMpuTJwKkTpQ1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 350e6d6e-5a41-4ff8-55f5-08db09f840b2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 17:16:44.7055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkcw1+Sp3wEgPYHOCtp4q2aVoiuaSA+WV2o9bp2OMNKHUpdFK1GSRtSaGsDnj+VqgEPVDLkTN0JxMsysVxKudg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7649
Received-SPF: softfail client-ip=2a01:111:f400:7e89::621;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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


On 08/02/2023 18:44, Cédric Le Goater wrote:
> External email: Use caution opening links or attachments
>
>
> On 2/8/23 14:08, Avihai Horon wrote:
>>
>> On 08/02/2023 0:34, Alex Williamson wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On Mon, 6 Feb 2023 14:31:30 +0200
>>> Avihai Horon <avihaih@nvidia.com> wrote:
>>>
>>>> Currently VFIO migration doesn't implement some kind of intermediate
>>>> quiescent state in which P2P DMAs are quiesced before stopping or
>>>> running the device. This can cause problems in multi-device migration
>>>> where the devices are doing P2P DMAs, since the devices are not 
>>>> stopped
>>>> together at the same time.
>>>>
>>>> Until such support is added, block migration of multiple devices.
>>>>
>>>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>>>> ---
>>>>   include/hw/vfio/vfio-common.h |  2 ++
>>>>   hw/vfio/common.c              | 51 
>>>> +++++++++++++++++++++++++++++++++++
>>>>   hw/vfio/migration.c           |  6 +++++
>>>>   3 files changed, 59 insertions(+)
>>>>
>>>> diff --git a/include/hw/vfio/vfio-common.h 
>>>> b/include/hw/vfio/vfio-common.h
>>>> index e573f5a9f1..56b1683824 100644
>>>> --- a/include/hw/vfio/vfio-common.h
>>>> +++ b/include/hw/vfio/vfio-common.h
>>>> @@ -218,6 +218,8 @@ typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) 
>>>> VFIOGroupList;
>>>>   extern VFIOGroupList vfio_group_list;
>>>>
>>>>   bool vfio_mig_active(void);
>>>> +int vfio_block_multiple_devices_migration(Error **errp);
>>>> +void vfio_unblock_multiple_devices_migration(void);
>>>>   int64_t vfio_mig_bytes_transferred(void);
>>>>
>>>>   #ifdef CONFIG_LINUX
>>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>>> index 3a35f4afad..01db41b735 100644
>>>> --- a/hw/vfio/common.c
>>>> +++ b/hw/vfio/common.c
>>>> @@ -41,6 +41,7 @@
>>>>   #include "qapi/error.h"
>>>>   #include "migration/migration.h"
>>>>   #include "migration/misc.h"
>>>> +#include "migration/blocker.h"
>>>>   #include "sysemu/tpm.h"
>>>>
>>>>   VFIOGroupList vfio_group_list =
>>>> @@ -337,6 +338,56 @@ bool vfio_mig_active(void)
>>>>       return true;
>>>>   }
>>>>
>>>> +Error *multiple_devices_migration_blocker;
>
> static ?
>
Yes, I will add.

> So we have two migration blockers, one per device and one global. I guess
> it is easier that way than trying to update the per device Error*.

Yes, because this blocker is not related to a specific device but rather 
to how many devices we have at a specific moment.

Thanks.


