Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3DA6616C0
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 17:39:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEYgy-0008WS-6v; Sun, 08 Jan 2023 11:38:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pEYgv-0008Uv-Rn; Sun, 08 Jan 2023 11:38:37 -0500
Received: from mail-co1nam11on2064.outbound.protection.outlook.com
 ([40.107.220.64] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pEYgt-0002RX-5A; Sun, 08 Jan 2023 11:38:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZqM5VSuh0mclQV6miefdlyycYVehwL/PeE8PNhiTbG3rDeIBLu7Ej2QCvXEsFpOfzXVab/27sC/CzrprwhticisEJvieRWJ4Waic11/b75jV6MaYLOkWrRP61aTTzOOek8MGif1SzmGsVv5XLtYgeWMrRSC3MjbKteKyPNI6rLl04pY10XhKP8H5vTtm6NgWOJrI6lcDaD3MvYYQUvbHKdQ8a1jVdKhN/1M/GUumkqgv737gjEFQyfCADAvhDGgRdHpX+6aj1kds6+Zhnap67CUI+5GBm8TgfcjDg/4q1OdSMj8N9pgSTRzd9TdE+56tCvtQIIccqI89fLxyqY12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPYu+d0hS2dWk1uyC1s65OisnMfrj2++dwtJVa+aCE8=;
 b=T0OU/lWwhDCp0Px9HTHGKA62kU6C9QoRsaHJJW6wQJoYFqqHE3g0ZTIrDcr5SRAhzCyO1bjGvY3GdUb+b6O639Ls9EjQWt5LES1wEAcT+3NnMMlNGnFnh9jzoQpW/pk44h6h4i2Y288UzfDrOBx1Y4Rgz2DOIYUYMlOFY66/aoTHgYmtyYou/DMovlHLOvJjhj1WVC93Sbk4ZAeCwVp5T98c9dHIPc6coYcyDVWCZNhXVh8Yz99ImerRZdjQhmknEgdpJoOcbNfJTSefBGTEoGznF9aenFTD/cTcSsijO3yYVjfPZbAgO/hMlIhxL6BaTaE1AC/9Ms1AYQbf5nUDQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPYu+d0hS2dWk1uyC1s65OisnMfrj2++dwtJVa+aCE8=;
 b=cVLonwur65GENK3uX1pXuKu1ellRhZ6e7boPZ6YLltjaAIPRErpr4/dJcpQu9tiOH7314uJyLH3RFV16y8FMb5fC5ISUU0tgN0By9/kqqmYaSndTHBoJRW+RQfyx4KC8qIPE9PRfw9WInDi++i5cXDVIjEeVtAcqGT1+rNSzMB2jZrjcZtIHAvQhZ+JG5CtDoHg00cNS7LSjOmRq06DSFT9vyCNFVWwkidOGyGiHzs3GmfWuohKmku2IvLQhLTA3U0gh009NyfUoKCU4bXGUWdDsBKDjkDIzI0NEv9sHNvtYRsDNvG/rzCjiBHSRxDG+oa9iviszwOKHDQgVBUwCMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by SN7PR12MB6863.namprd12.prod.outlook.com (2603:10b6:806:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Sun, 8 Jan
 2023 16:38:28 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%6]) with mapi id 15.20.5986.018; Sun, 8 Jan 2023
 16:38:28 +0000
Message-ID: <167fafe4-42d2-0990-94ce-c114f51307d8@nvidia.com>
Date: Sun, 8 Jan 2023 18:38:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 05/14] vfio/migration: Allow migration without VFIO
 IOMMU dirty tracking support
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
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-6-avihaih@nvidia.com>
 <20230106145658.51c8f071.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230106145658.51c8f071.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::23) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|SN7PR12MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: eff9d67e-23de-406f-f31e-08daf196c4da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7aju8rseUJXuKkupSqqqsxLQYpeuec8yNVo9mfNwjxdQNujN5icqsiyz8A0BmqDL8NXgmZPZBqtooHOC8D2MRuY/bM5Te3qpHlbH/YAEWbknR9VPFf1jAMAwHUmnv9ZlhS8Zu8eNMNOZl9QImmu1jV0CV/VuxHZyQju+KhAIhoPZZguE5ESxP0WYEZv83iBM2C1qtbGsAj6jIYPtsm/DeG7QGMm3G7KZqflXCu1DHCD6PfKqn9DnqmUTfmDfylcqKn5v6f8MYSF83nlmxsR66FwGZA4YMF2smZk2gQvv81TqSoQ/HcoLeo27ip99ZfGnqj/CFVvnMyyMDTphZi8rQMLMDf/yrj7cBkVhH8zG+WHS+YSI0caEqFFMpLxlXTDfeJ8J1yNhdrf5UOCgRufEiEMN+djSYwe72MrVPMYC5HaQ9gCv8gSkRD2wol+PobaBPZXUJW3aX8n7mlySBHX6EeGk/ZIdpmwX6qmHvakzwXNft1snX8pGC6HL0X8anHooCDrj0P8EF7R6tjjXGtCitwzsHbSGs1aYYHMie8PzUJGo8Uf+QuDWStdEWcsxI/IfwYJ2biRBkhoAChoFGwH8tcxJWlfXq4KiSOO/+smUPDU2dspYvn8wVtx6gL0hC435PI+1ZjXDhRVb1z4q5T5WKn6tj4ewqktiNYcadPDsa0+zK5nVlfos4uZ5cyaNE2/VJsioesip3LH68WKZUlVn7IWy2k5dg1p+58sJmtCswxBOLAWFQjbIjXdc2OBmWUzB4UlFu4msArpq3f5nWKNxRSDJRY4mMPraU3oLNYyfsgo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199015)(316002)(5660300002)(7416002)(6512007)(26005)(186003)(6486002)(966005)(478600001)(2616005)(31696002)(41300700001)(66476007)(54906003)(4326008)(66946007)(66556008)(6916009)(8676002)(83380400001)(8936002)(86362001)(36756003)(6666004)(53546011)(31686004)(6506007)(38100700002)(2906002)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzJkalhwNWdKcXRVVEtHSWFrd1NRTWgrTHNmbUJNWXAyc0JhK1BJZmFqWnJh?=
 =?utf-8?B?Z1VBR2pwVzFVMWEzK3lJMXY1ZGZTaGNzSlFNc0hjekxnL1lkTk5sR2hLbzVs?=
 =?utf-8?B?SWt0cDlHZlRUQzF6K1hkcmE0TEZEc3ZBUE5jeTRrUmJUYmpaV3ZOVGNDbjJl?=
 =?utf-8?B?Y3pBQ2J0cU1xTXNkeHh1cEU1ck1ZcElPb1ZrSDJzdFlDeW1WY2E1eGppQXpm?=
 =?utf-8?B?bVYrY3ZLN1NBWURtZ3MrRWJ5YzlQSmxWYWt1VkhvTUM3cUlZYUJWR2Q3dkJj?=
 =?utf-8?B?akUzVWJVSTF4eS9DN25lMk9MS2xOUEEwNGVUeUtvODE3L3lWNWtZa0NMS1dy?=
 =?utf-8?B?eXdxbW5QV0lKLzl3U0RKN1hHeTljdHRrOXlzdE9vMThLZldMMlRRZnRYWEo1?=
 =?utf-8?B?cy96YnZyazVQY0pxVmE5TmVuR2kyTDg5WWU1Z3doT3k4RUUvdXNiWWJlVFZi?=
 =?utf-8?B?QmkzS3NqZTllekJCQjFXNjlqbWFxN3ZzYnFsOThIbzl5RFl6NjAzVC9PQkhL?=
 =?utf-8?B?R0NzZW1nRk5QTS81Q1ZTTUZhYU1UWC96MS9TWkxDc3VNdC9sR3pJUVZmNUJM?=
 =?utf-8?B?MHNoSytXaVY0cUlrNGVjSFRad2N0MUQ2S2ZFenB1WnFTWEdXQ21oNHJvcG1W?=
 =?utf-8?B?UmhaUnVtRTA0bUFnOUhxNzdZTXI1NDljYmh6aW14YlpSaUo0dVpMeGhrdTM5?=
 =?utf-8?B?bU8xalRaTFU0MVV4MDF3emdqR0V5UVRsNXQrdzZvUFB0Tmo5aUFWZ0NFdThT?=
 =?utf-8?B?MzkrQ2tPY1hmaytCRDhhNzk3em45T1R6aVNwOFB6aWsxVFgyeHRtVzVGL2tw?=
 =?utf-8?B?b3N2cHVjZnQrWmEycW8rU0JSbUdTM1I0RHhzTTJvdFFDcVY1aGV3UTFQRlNW?=
 =?utf-8?B?UGF6ZVllQ1FwMXQ2MjhCbVRXSng4cG1qa1JSc3Nmc3EzT3pXdWsvVE14Qm92?=
 =?utf-8?B?NDlLZWJFeXJXZEY1R3RCcmFRNTlCWnovWWpERTZySkRZRTA3LzhOZXNXTkpp?=
 =?utf-8?B?Y0pkT1oxYW1yY1hqd0JCZTFPM2gwMWtXRVFONW9FZUV4SEF0b3lyUG55R2ZV?=
 =?utf-8?B?NDZtTzZjQkp0ckpKRjhMWkxmUkZYbllxZS9Xck1kQTV3Qk8ycGlFTTNhNm9a?=
 =?utf-8?B?SDFNVUFCYW9BNEQxeFFXTlc2ZWFXM1hUNGhxZnN6Y0RtcGdTYTQ1cWcvNUU3?=
 =?utf-8?B?ZHFwOGRsVElTTFdyOFM1ak9zWnViQVdQbW9IcXJMMk1JdGgwdm1kMndhem5Y?=
 =?utf-8?B?V0pjOElkL0FKaVhrTTJyaEJ0NWExczZSM0MyZGh2cElqbTI2R05YUWxlSjhu?=
 =?utf-8?B?eFJHY1JUQjFlbklQdjVrR1NDVmowbFRCbDlueXJJUUNpR1JBYVdubHl3ZG4x?=
 =?utf-8?B?VVhidFR0ZG5MNVZhRGV1eVJZcGRvMDl0dXFBMGFDTHl0WlRWOGdKd1ZrRUpw?=
 =?utf-8?B?YnVEcUZQMGdYbHV1NGpBaTg2ZXU5V2lHVjU5MFhCR2pyVkRIQlY4dWtKVks1?=
 =?utf-8?B?dUdNeUxVUCs0bGh1MXZpcVZmSG5lOWFoNVJ3ZWVzZ2FNdHFyOGU4U0hFR1Vy?=
 =?utf-8?B?Z0F4V0xLVlllQnVwampEUlpGK211V2IybjR5ZkVCdURjZ2RueGhocXM5U3lN?=
 =?utf-8?B?S2R5VWNhWll0bmN0QmFwbk0vem1KTGFCN296RTUwM1BHTVpHenIyN0Ryc05X?=
 =?utf-8?B?R2xWZjB3WkNvWG1wQUVQNzBHbUM0MC8yWjVUbWgrRkFnQ3ZITTgyUzNzbXd2?=
 =?utf-8?B?Z2h5Q2g1cmc3Nm93dGg4ZngxR1RBdEE4UVI0TnNMNjhCUkY4YkYraTdudUtm?=
 =?utf-8?B?Y0lqbitsMnpDRGs2Z1lQQWFVdW41WWlnVXNCMmF3U0Y4Y3dKd1I1YmN3cXp3?=
 =?utf-8?B?NnZZMkV0OFlmMTd1RkNoSmdTS09abXEya2xhemVxTGdxTnphRHRJWThXaHU4?=
 =?utf-8?B?MXB1M3RtZU9tWXJ5akhSMnVFQTRpUUNJYmRObGVPMDFTUVFSVzNvQTY0Rmgv?=
 =?utf-8?B?UHhrdXpCbFdZcit1VjAzemp4MFdVSDVjUyt5dlplSHM2ZE8wT1BhRlJLQUQv?=
 =?utf-8?B?cFFHcGRLdTlXR1ljeGlHNEJEcmFBWmdxNlBaYUNZSFJONXRuRG9EM2xqLzBr?=
 =?utf-8?Q?UTnjbYqBBXDWPMcZiM5uydP6U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff9d67e-23de-406f-f31e-08daf196c4da
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2023 16:38:27.9074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5sXPIabx4Pq4vU8Oj4g0dt9Cy3vv3bcNNjF0agAaS/Ze12NDSYrGAWd3TX8j+NmYJ32fYRIVcuATKaYcUhiyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6863
Received-SPF: permerror client-ip=40.107.220.64;
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


On 06/01/2023 23:56, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu, 29 Dec 2022 13:03:36 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> Currently, if IOMMU of a VFIO container doesn't support dirty page
>> tracking, migration is blocked. This is because a DMA-able VFIO device
>> can dirty RAM pages without updating QEMU about it, thus breaking the
>> migration.
>>
>> However, this doesn't mean that migration can't be done at all.
>> In such case, allow migration and let QEMU VFIO code mark the entire
>> bitmap dirty.
>>
>> This guarantees that all pages that might have gotten dirty are reported
>> back, and thus guarantees a valid migration even without VFIO IOMMU
>> dirty tracking support.
>>
>> The motivation for this patch is the introduction of iommufd [1].
>> iommufd can directly implement the /dev/vfio/vfio container IOCTLs by
>> mapping them into its internal ops, allowing the usage of these IOCTLs
>> over iommufd. However, VFIO IOMMU dirty tracking is not supported by
>> this VFIO compatibility API.
>>
>> This patch will allow migration by hosts that use the VFIO compatibility
>> API and prevent migration regressions caused by the lack of VFIO IOMMU
>> dirty tracking support.
>>
>> [1]
>> https://lore.kernel.org/kvm/0-v6-a196d26f289e+11787-iommufd_jgg@nvidia.com/
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   hw/vfio/common.c    | 100 ++++++++++++++++++++++++++------------------
>>   hw/vfio/migration.c |   3 +-
>>   2 files changed, 61 insertions(+), 42 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 130e5d1dc7..67104e2fc2 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -397,51 +397,61 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>>                                    IOMMUTLBEntry *iotlb)
>>   {
>>       struct vfio_iommu_type1_dma_unmap *unmap;
>> -    struct vfio_bitmap *bitmap;
>> +    struct vfio_bitmap *vbitmap;
>> +    unsigned long *bitmap;
>> +    uint64_t bitmap_size;
>>       uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
>>       int ret;
>>
>> -    unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
>> +    unmap = g_malloc0(sizeof(*unmap) + sizeof(*vbitmap));
>>
>> -    unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
>> +    unmap->argsz = sizeof(*unmap);
>>       unmap->iova = iova;
>>       unmap->size = size;
>> -    unmap->flags |= VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP;
>> -    bitmap = (struct vfio_bitmap *)&unmap->data;
>>
>> +    bitmap_size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
>> +                  BITS_PER_BYTE;
>> +    bitmap = g_try_malloc0(bitmap_size);
>> +    if (!bitmap) {
>> +        ret = -ENOMEM;
>> +        goto unmap_exit;
>> +    }
>> +
>> +    if (!container->dirty_pages_supported) {
>> +        bitmap_set(bitmap, 0, pages);
>> +        goto do_unmap;
>> +    }
>> +
>> +    unmap->argsz += sizeof(*vbitmap);
>> +    unmap->flags = VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP;
>> +
>> +    vbitmap = (struct vfio_bitmap *)&unmap->data;
>> +    vbitmap->data = (__u64 *)bitmap;
>>       /*
>>        * cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
>>        * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
>>        * to qemu_real_host_page_size.
>>        */
>> +    vbitmap->pgsize = qemu_real_host_page_size();
>> +    vbitmap->size = bitmap_size;
>>
>> -    bitmap->pgsize = qemu_real_host_page_size();
>> -    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
>> -                   BITS_PER_BYTE;
>> -
>> -    if (bitmap->size > container->max_dirty_bitmap_size) {
>> -        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64,
>> -                     (uint64_t)bitmap->size);
>> +    if (bitmap_size > container->max_dirty_bitmap_size) {
>> +        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64, bitmap_size);
>>           ret = -E2BIG;
>>           goto unmap_exit;
>>       }
>>
>> -    bitmap->data = g_try_malloc0(bitmap->size);
>> -    if (!bitmap->data) {
>> -        ret = -ENOMEM;
>> -        goto unmap_exit;
>> -    }
>> -
>> +do_unmap:
>>       ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
>>       if (!ret) {
>> -        cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
>> -                iotlb->translated_addr, pages);
>> +        cpu_physical_memory_set_dirty_lebitmap(bitmap, iotlb->translated_addr,
>> +                                               pages);
>>       } else {
>>           error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
>>       }
>>
>> -    g_free(bitmap->data);
>>   unmap_exit:
>> +    g_free(bitmap);
>>       g_free(unmap);
>>       return ret;
>>   }
>> @@ -460,8 +470,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
>>           .size = size,
>>       };
>>
>> -    if (iotlb && container->dirty_pages_supported &&
>> -        vfio_devices_all_running_and_saving(container)) {
>> +    if (iotlb && vfio_devices_all_running_and_saving(container)) {
>>           return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>>       }
> Seems like it would be simpler to follow the non-dirty_pages_supported
> path here and follow-up with a condition to call
> cpu_physical_memory_set_dirty_range() rather than try to make the
> bitmap path serve double-duty.

Nice, I wasn't aware of cpu_physical_memory_set_dirty_range().
It really simplifies things. I will change it.

>> @@ -1201,6 +1210,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>>           .argsz = sizeof(dirty),
>>       };
>>
>> +    if (!container->dirty_pages_supported) {
>> +        return;
>> +    }
>> +
>>       if (start) {
>>           dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
>>       } else {
>> @@ -1231,11 +1244,26 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
>>   static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>>                                    uint64_t size, ram_addr_t ram_addr)
>>   {
>> -    struct vfio_iommu_type1_dirty_bitmap *dbitmap;
>> +    struct vfio_iommu_type1_dirty_bitmap *dbitmap = NULL;
>>       struct vfio_iommu_type1_dirty_bitmap_get *range;
>> +    unsigned long *bitmap;
>> +    uint64_t bitmap_size;
>>       uint64_t pages;
>>       int ret;
>>
>> +    pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
>> +    bitmap_size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
>> +                                  BITS_PER_BYTE;
>> +    bitmap = g_try_malloc0(bitmap_size);
>> +    if (!bitmap) {
>> +        return -ENOMEM;
>> +    }
>> +
>> +    if (!container->dirty_pages_supported) {
>> +        bitmap_set(bitmap, 0, pages);
>> +        goto set_dirty;
>> +    }
> Same here, why are we bothering to allocate and mark a bitmap dirty
> just to appease code we don't need instead of:
>
>          if (!container->dirty_pages_supported) {
>                  cpu_physical_memory_set_dirty_range(...)
>                  return 0;
>          }

I will change here as well.

Thanks!

> Thanks,
> Alex
>
>> +
>>       dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
>>
>>       dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
>> @@ -1250,15 +1278,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>>        * to qemu_real_host_page_size.
>>        */
>>       range->bitmap.pgsize = qemu_real_host_page_size();
>> -
>> -    pages = REAL_HOST_PAGE_ALIGN(range->size) / qemu_real_host_page_size();
>> -    range->bitmap.size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
>> -                                         BITS_PER_BYTE;
>> -    range->bitmap.data = g_try_malloc0(range->bitmap.size);
>> -    if (!range->bitmap.data) {
>> -        ret = -ENOMEM;
>> -        goto err_out;
>> -    }
>> +    range->bitmap.size = bitmap_size;
>> +    range->bitmap.data = (__u64 *)bitmap;
>>
>>       ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
>>       if (ret) {
>> @@ -1268,13 +1289,13 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>>           goto err_out;
>>       }
>>
>> -    cpu_physical_memory_set_dirty_lebitmap((unsigned long *)range->bitmap.data,
>> -                                            ram_addr, pages);
>> +set_dirty:
>> +    cpu_physical_memory_set_dirty_lebitmap(bitmap, ram_addr, pages);
>>
>> -    trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
>> -                                range->bitmap.size, ram_addr);
>> +    trace_vfio_get_dirty_bitmap(container->fd, iova, size, bitmap_size,
>> +                                ram_addr);
>>   err_out:
>> -    g_free(range->bitmap.data);
>> +    g_free(bitmap);
>>       g_free(dbitmap);
>>
>>       return ret;
>> @@ -1409,8 +1430,7 @@ static void vfio_listener_log_sync(MemoryListener *listener,
>>   {
>>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>
>> -    if (vfio_listener_skipped_section(section) ||
>> -        !container->dirty_pages_supported) {
>> +    if (vfio_listener_skipped_section(section)) {
>>           return;
>>       }
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index 09fe7c1de2..552c2313b2 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -860,11 +860,10 @@ int64_t vfio_mig_bytes_transferred(void)
>>
>>   int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>>   {
>> -    VFIOContainer *container = vbasedev->group->container;
>>       struct vfio_region_info *info = NULL;
>>       int ret = -ENOTSUP;
>>
>> -    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
>> +    if (!vbasedev->enable_migration) {
>>           goto add_blocker;
>>       }
>>

