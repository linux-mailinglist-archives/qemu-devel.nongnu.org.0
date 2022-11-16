Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FA762BF82
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:31:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIUA-0007lU-VO; Wed, 16 Nov 2022 08:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ovIU4-0007kd-Oe; Wed, 16 Nov 2022 08:29:44 -0500
Received: from mail-bn7nam10on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::600]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ovITu-0003Uo-UE; Wed, 16 Nov 2022 08:29:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENuM2uTilwgNpJtNqxd2UO0D/CeNgQ2rluATUT3x2A0ah8wkQykPjWY/xgEwHRMEI6EQ/q8q1S3NA4BJTS++6PGY0DLEIoottSdjVelwI7GUPm2KsO99G0TsWZE9T2QN95Txx+Okygjy3TJAR5qEIii+aLQF73jashbRaQXoWg/eWWV3/UU4hv2ET67bQkzw8Q4jF0UcrQ8T+YU3pQFUPxinjyp33wun54RJ8ZaVBic4vt+6IWP5tH0tzY6z5pTgChT1S+Oi+ouByTTdwqOfD3ybnNvW1kLITwGH0ByZaVCnNFcsADq7yncG2CyJhDXJYylKcEy3OsdmPnG30NDuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yw7PBBSUTFaeMt1rHn4c+Yyr28sBnkhw/dDhL2Jt1yE=;
 b=brikPUm6T9STse4P+0korfMp1brhWznD79y7O08TxZhtTBYyIiQcymesn9tmuchi6Fz4pi2ZF8UOIioArx7LY0S8BMETvMNrzcFPht2e/wZ8ljAEtPQml3v51s6cyyU22vtApXu1nejqbOIqaP5H0m5fUis8O/TfbW8XlNlcfaCOElOj8HWwr4ayQ5uwhjDukqLFTwA78GQsc+LvcHAAX1ZyDXM2GbMoTbygRYDjCu5dJxRY5idUl8r11w2Fk3wvSL6fQbilRDeCPUUiU4OB3PIEQMURq7Lg1iYVPJN8OTYxFRN56Dh6Ck11Pnku3ge1bxlgVQIWwaq+pl0ulmyxpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yw7PBBSUTFaeMt1rHn4c+Yyr28sBnkhw/dDhL2Jt1yE=;
 b=MUnvLYQ1/Zkg7OYIKT2l2KlQUj2IF06DHX+wbTJGE0AGVI4VapUdTWNnMvOBsBqeBD/bdYYGkLa3M9So0WsDfrtcY+YSw6e/0ldY8GiM3ROJt6hscwV356bepXemRGCQrivgkb/e6/LFA9V3xxj3X46BctuBwpkuiv1F6xPDIqe2PImlcgQZEGgdxb/fkJbYyWIvrwsl6xa2aYjO62lUnAg9oDQBzenSfll/xgo2rzsz+yZbb9wOYS7vFe3wuBdyXe+NzcmEjCoKY0y1+SigHHSXU7zA2xmsDVWHiAlgCsk7G1sQ2W0U+bKr2NyclBJoa4br8YB8axqSQwpWEQefwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by CH2PR12MB4889.namprd12.prod.outlook.com (2603:10b6:610:68::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 13:29:28 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167%8]) with mapi id 15.20.5813.019; Wed, 16 Nov 2022
 13:29:28 +0000
Message-ID: <7196aff6-f2e9-e76b-9144-d7db4e4cdcb6@nvidia.com>
Date: Wed, 16 Nov 2022 15:29:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 07/17] vfio/migration: Allow migration without VFIO
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
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-8-avihaih@nvidia.com>
 <20221115163637.710c3d70.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20221115163637.710c3d70.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0027.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::18) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|CH2PR12MB4889:EE_
X-MS-Office365-Filtering-Correlation-Id: 938980c7-bddb-4804-ab9e-08dac7d695cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sNGLjz+J4x+kZJ2rwMkoq8RhbCrZ4Hzrl5j3mw31p1LM7drf5QeVbBDnxk6cCEGHdxGVNcC3IYAjGzFKivmyKNWHe1zX2T/lZ1hURvpi+HHH4GuNbM7/mkxkmPx4W1Q2Dh+RVlnw6jIOnmpW2zTBzTeGuS3Eonsxlnobl8SJdwxJ5lvoIUPPsrXdsoJkdAY0zUAE6+HwuR4F9qIlPk7gRW/+qUqwj6z2JgVAsxl5KdDTpsYV8sT3RGg88ViTrugNEWnKlSDMNBv1iVolyiYAuUvJyllBBqSXeYg1fM7f8iIOZMxafOSBVGzPJAzHCkmkXqPDipmSixgASS84dQ3GUGFp/RIOxoLmLO/yb+JvzHClSFwxbxujR6jieIY4hlfosDofGzoPrUyLfpmurJ1EHyRXF847T+mCMBkkvlDaS9KEo8moo88l5X8OoaHmpgV05Ue0mTf2J1R8tvbzeLaVMjsp5BY2dkALeOo68qLH5S7kV9iN8C89Dyt4DmdL1ebHfkx1G50os0ANYyqDGH6PEczqm035Ons2v5nOvFY8vDW7iaBFFrKdJFzlmjDkmJdY+/ZkCuGlf7YYTWFR7aJfVLTQm1PNy3cJYKQftapeBbPFqeSe7IJ95E7YT3OpTzUG/Zecv6dO9fBOTQ216wlhPr3eKPWIp2mapghOU57qTAfHYMFUPncnZJp63m9EFffA4Evjo//DoucD35uU/PQpfttSgnntyB5/irFLCV80oOPHkm5iEaRwKjvtDVUkiBqM7ihESEohT8a0VHPpSVGnfh8vc8X9//yBYJ8gxjohIyWRw32ubmQFvZAnRNYSN+WMl2WbUjUSdoGYn2KKVdBmkOeqUO/3tBrTmSflsNQkaZg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199015)(2616005)(316002)(54906003)(53546011)(6916009)(36756003)(6666004)(6506007)(86362001)(6512007)(66476007)(4326008)(66556008)(31696002)(8676002)(26005)(41300700001)(66946007)(31686004)(2906002)(83380400001)(7416002)(966005)(186003)(5660300002)(6486002)(478600001)(38100700002)(8936002)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUFEdjVEeTYzWlp3dzUvQ3hpRGs1MzY0QVk0NlhoM0Y2RWtFQ1FDL2RIUEtr?=
 =?utf-8?B?c0l4YTlGQzBZWlV1YkpvcGlCKzVTL1AxR0pBcUpXdERHQnR5dEVIcnhPRVFx?=
 =?utf-8?B?aEhOS3VlcmQxbTVweTNyYThyeDJ5bXBGUHBiYmNwRmw2RVRvNWF5YmMyd1dv?=
 =?utf-8?B?YS9mS1BQQ3crWG5iT0I5TlczWGhoeGNDK2hLY3pQNndoSWZjWFM3eFFHUXdP?=
 =?utf-8?B?M2Evc0puejJiZGhMMis5ampiU3A3NmVUMWRZcHRaWjdyVyt6U2tGKzM2eGdm?=
 =?utf-8?B?M3hVQUpzblhSZ1hhcTFGZk5WdUQ1cWhrOFB4dkxWVHZISEhzaXJteVdGN2Rs?=
 =?utf-8?B?cDYzc3dwTWhMQTlaU2dzY0tnWG1aenlCVFU1WkhpMUttcldQNzI2YklpTmlP?=
 =?utf-8?B?SkR2M2hCa1RDY2tHZUhHUXdaMG95WGpzOVc3QWtzM24wS2dLcjdGbkF5dVN0?=
 =?utf-8?B?ZGVjYmRSWDhjRW1Qb0tndHFyZ2t2RHBuN1lETElhakI1QnJlWkduZitWTWM1?=
 =?utf-8?B?Yjc1czZzSXQrMnlwQ2JHZVZFTi95Tkk3Z282L05JNkI1VkJWRGNBN0VzaDFG?=
 =?utf-8?B?YmxXbzNFUkJiUTFHMEpoL2FsWjJLMmdhLzcvT3h2UmdnNmNqTERRd0VJeWpP?=
 =?utf-8?B?eFZxeWdZUjZLT3FCYVNOZHpXdGRJOTltVHp2NFR4TVQxVlNjdnpyUmdPZjIx?=
 =?utf-8?B?Um9iWUZGbEJBYnlROWZieTI3czRxTURiTGdabTBjdGRSNmo5aFVSUDdsdjl1?=
 =?utf-8?B?QmhmZXFrWkhRRGE4aE9xc1JKTHlOQnd6K3JhelFqOE9pd1lvd3VzYjlNa2hQ?=
 =?utf-8?B?TjhjZmhXMDlSWVAxWlNlWnpVZ2IwWlpibEhPL1RUcVZGSUZFcDkvVUltVUpR?=
 =?utf-8?B?c1dWcnJYT1JqRGpBeUUwNWg1Z0VTYUk1Z2lEd1lWNFNzWjVKMzNrTUJtWG4x?=
 =?utf-8?B?RVJDbDVDQ2M0bmtjb0hTNGVHWk8rRERya3U3bDQzQXprc0pwQWFhWlB6dGN1?=
 =?utf-8?B?S21BYWZGWnlaTE1YQ0orR09oMW04SVRJdnVWZngyc0J3MFBKMmcyU1JwSWJM?=
 =?utf-8?B?YlA4L3Bqd0VKbGNFVmtVc0FPRStHWmZwVHkyWlRLaUJ2Mmp3ek1xb2h0Mi8z?=
 =?utf-8?B?bFErRThnd00zNGdkUGZOb0g5YW93VDVXM2s3VTJNaVpPRDRhUDF5TFpMRjhF?=
 =?utf-8?B?S2RCb2JLb3NBd2s4LytIcXEwd3BrOVpVV2xkcGplTVBSRS90bERrNGNmWWFJ?=
 =?utf-8?B?NnhNMk8wZWtISzVRWitiZ3htVkd6Y0JlQS9jQ3pwampvL2tJelFaTmVrblc5?=
 =?utf-8?B?R0tRUDJSZnphNXRSVTdRcCtuY3B2Z3VPQXVwalN6ZDZpUDdSZ2NjNnAvZjBy?=
 =?utf-8?B?UEQvZGRWaUJ6OVdPMFBxaVFMY2h1TUpwSXQ0V2xjenViczN5eGhNU1pJYmYx?=
 =?utf-8?B?amtwUHNyQ3pUNTZjRWdaQTBaRFRaSVNtNWFucDVzdFJZU0tOZWpXNlpOVG5X?=
 =?utf-8?B?eUpCQTY0MzVOU3RUa0diMmZFZXpOejBENUd5WWlwQWRJbmwwak5DNzRJV3My?=
 =?utf-8?B?eGU1dTU1M0M3dW9WSTZTbC9zZHNMdVFYSDc2b0JjNE1kNTVJQms0RTFwbU16?=
 =?utf-8?B?OTdxbWl5SXNGMEhLOSs1bFNHUVRGNitrNC9HT1hLTHZjdzZ2SVhNNUVVTXNP?=
 =?utf-8?B?T0pibkJRZWZHL1QzVElUbFdrRjVKeG55Y1k0b3Z0aEdJWnNNV2tRWld1VUhE?=
 =?utf-8?B?VVdUV1FOVEJ5emJsWi8xUzhkZ1d0a3BJNlpnN2M5SnpPZGtTYWJ2MU5LUlQ5?=
 =?utf-8?B?TmhIRjg3SUZ2UG8xbUVPcDB6VmNWV1VXS1lldHo4Q3lrT0NZZ1ZOUjBrY0hr?=
 =?utf-8?B?S21QTjM3RXBCWFlyOWw5RlF2dHZUbit3d25aakoyLzIzVmFWRWdFV2lSZkRB?=
 =?utf-8?B?M1liZjdCamZBNjBqMVdSTGxEd2NpczVVVzUzcWFLM0pFZHBac2lRRE1QTnpV?=
 =?utf-8?B?UFNOQXl2bDlyb0ZIUmxYSksvWjl2Sm04ZmFmNk1HVVN6NHBRek5ST2NCQ0xR?=
 =?utf-8?B?M2pCK0w3WExycXlETk5QWnVYZS9Cb0Z3dU1xcEExYVFpNm0wTXNwT1h6bXJN?=
 =?utf-8?Q?6NyMWf4mOaVsap5Kn64BQxDui?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 938980c7-bddb-4804-ab9e-08dac7d695cc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 13:29:28.1649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxnRNMKLEoJGT5uxC4bNMf5GV2lMOf079jo4bXu8zzPXZeNOfPKzTqh5L83RU3eSK5LEMqSWS4l+Iy8VcWi/QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4889
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::600;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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


On 16/11/2022 1:36, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu, 3 Nov 2022 18:16:10 +0200
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
>> The motivation for this patch is the future introduction of iommufd [1].
>> iommufd will directly implement the /dev/vfio/vfio container IOCTLs by
>> mapping them into its internal ops, allowing the usage of these IOCTLs
>> over iommufd. However, VFIO IOMMU dirty tracking will not be supported
>> by this VFIO compatibility API.
>>
>> This patch will allow migration by hosts that use the VFIO compatibility
>> API and prevent migration regressions caused by the lack of VFIO IOMMU
>> dirty tracking support.
>>
>> [1] https://lore.kernel.org/kvm/0-v2-f9436d0bde78+4bb-iommufd_jgg@nvidia.com/
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   hw/vfio/common.c    | 84 +++++++++++++++++++++++++++++++++++++--------
>>   hw/vfio/migration.c |  3 +-
>>   2 files changed, 70 insertions(+), 17 deletions(-)
> This duplicates quite a bit of code, I think we can integrate this into
> a common flow quite a bit more.  See below, only compile tested. Thanks,

Oh, great, thanks!
I will test it and add it as part of v4.

> Alex
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 6b5d8c0bf694..4117b40fd9b0 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -397,17 +397,33 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>                                    IOMMUTLBEntry *iotlb)
>   {
>       struct vfio_iommu_type1_dma_unmap *unmap;
> -    struct vfio_bitmap *bitmap;
> +    struct vfio_bitmap *vbitmap;
> +    unsigned long *bitmap;
> +    uint64_t bitmap_size;
>       uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
>       int ret;
>
> -    unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
> +    unmap = g_malloc0(sizeof(*unmap) + sizeof(*vbitmap));
>
> -    unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
> +    unmap->argsz = sizeof(*unmap);
>       unmap->iova = iova;
>       unmap->size = size;
> -    unmap->flags |= VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP;
> -    bitmap = (struct vfio_bitmap *)&unmap->data;
> +
> +    bitmap_size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> +                  BITS_PER_BYTE;
> +    bitmap = g_try_malloc0(bitmap_size);
> +    if (!bitmap) {
> +        ret = -ENOMEM;
> +        goto unmap_exit;
> +    }
> +
> +    if (!container->dirty_pages_supported) {
> +        bitmap_set(bitmap, 0, pages);
> +        goto do_unmap;
> +    }
> +
> +    unmap->argsz += sizeof(*vbitmap);
> +    unmap->flags = VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP;
>
>       /*
>        * cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
> @@ -415,33 +431,28 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>        * to qemu_real_host_page_size.
>        */
>
> -    bitmap->pgsize = qemu_real_host_page_size();
> -    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> -                   BITS_PER_BYTE;
> +    vbitmap = (struct vfio_bitmap *)&unmap->data;
> +    vbitmap->data = (__u64 *)bitmap;
> +    vbitmap->pgsize = qemu_real_host_page_size();
> +    vbitmap->size = bitmap_size;
>
> -    if (bitmap->size > container->max_dirty_bitmap_size) {
> -        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64,
> -                     (uint64_t)bitmap->size);
> +    if (bitmap_size > container->max_dirty_bitmap_size) {
> +        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64, bitmap_size);
>           ret = -E2BIG;
>           goto unmap_exit;
>       }
>
> -    bitmap->data = g_try_malloc0(bitmap->size);
> -    if (!bitmap->data) {
> -        ret = -ENOMEM;
> -        goto unmap_exit;
> -    }
> -
> +do_unmap:
>       ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
>       if (!ret) {
> -        cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
> -                iotlb->translated_addr, pages);
> +        cpu_physical_memory_set_dirty_lebitmap(bitmap, iotlb->translated_addr,
> +                                               pages);
>       } else {
>           error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
>       }
>
> -    g_free(bitmap->data);
>   unmap_exit:
> +    g_free(bitmap);
>       g_free(unmap);
>       return ret;
>   }
> @@ -460,8 +471,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
>           .size = size,
>       };
>
> -    if (iotlb && container->dirty_pages_supported &&
> -        vfio_devices_all_running_and_saving(container)) {
> +    if (iotlb && vfio_devices_all_running_and_saving(container)) {
>           return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>       }
>
> @@ -1257,6 +1267,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>           .argsz = sizeof(dirty),
>       };
>
> +    if (!container->dirty_pages_supported) {
> +        return;
> +    }
> +
>       if (start) {
>           dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
>       } else {
> @@ -1287,11 +1301,26 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
>   static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>                                    uint64_t size, ram_addr_t ram_addr)
>   {
> -    struct vfio_iommu_type1_dirty_bitmap *dbitmap;
> +    struct vfio_iommu_type1_dirty_bitmap *dbitmap = NULL;
>       struct vfio_iommu_type1_dirty_bitmap_get *range;
> +    unsigned long *bitmap;
> +    uint64_t bitmap_size;
>       uint64_t pages;
>       int ret;
>
> +    pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
> +    bitmap_size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> +                           BITS_PER_BYTE;
> +    bitmap = g_try_malloc0(bitmap_size);
> +    if (!bitmap) {
> +        return -ENOMEM;
> +    }
> +
> +    if (!container->dirty_pages_supported) {
> +        bitmap_set(bitmap, 0, pages);
> +        goto set_dirty;
> +    }
> +
>       dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
>
>       dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
> @@ -1306,15 +1335,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>        * to qemu_real_host_page_size.
>        */
>       range->bitmap.pgsize = qemu_real_host_page_size();
> -
> -    pages = REAL_HOST_PAGE_ALIGN(range->size) / qemu_real_host_page_size();
> -    range->bitmap.size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> -                                         BITS_PER_BYTE;
> -    range->bitmap.data = g_try_malloc0(range->bitmap.size);
> -    if (!range->bitmap.data) {
> -        ret = -ENOMEM;
> -        goto err_out;
> -    }
> +    range->bitmap.size = bitmap_size;
> +    range->bitmap.data = (__u64 *)bitmap;
>
>       ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
>       if (ret) {
> @@ -1324,13 +1346,13 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>           goto err_out;
>       }
>
> -    cpu_physical_memory_set_dirty_lebitmap((unsigned long *)range->bitmap.data,
> -                                            ram_addr, pages);
> +set_dirty:
> +    cpu_physical_memory_set_dirty_lebitmap(bitmap, ram_addr, pages);
>
> -    trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
> -                                range->bitmap.size, ram_addr);
> +    trace_vfio_get_dirty_bitmap(container->fd, iova, size,
> +                                bitmap_size, ram_addr);
>   err_out:
> -    g_free(range->bitmap.data);
> +    g_free(bitmap);
>       g_free(dbitmap);
>
>       return ret;
> @@ -1465,8 +1487,7 @@ static void vfio_listener_log_sync(MemoryListener *listener,
>   {
>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>
> -    if (vfio_listener_skipped_section(section) ||
> -        !container->dirty_pages_supported) {
> +    if (vfio_listener_skipped_section(section)) {
>           return;
>       }
>
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index f5e72c7ac198..99ffb7578290 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -857,11 +857,10 @@ int64_t vfio_mig_bytes_transferred(void)
>
>   int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>   {
> -    VFIOContainer *container = vbasedev->group->container;
>       struct vfio_region_info *info = NULL;
>       int ret = -ENOTSUP;
>
> -    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
> +    if (!vbasedev->enable_migration) {
>           goto add_blocker;
>       }
>
>

