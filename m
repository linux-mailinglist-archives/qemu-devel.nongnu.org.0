Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8BB676BF8
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 11:06:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJXDp-0002KW-0p; Sun, 22 Jan 2023 05:05:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pJXDV-0002HS-O1; Sun, 22 Jan 2023 05:04:49 -0500
Received: from mail-bn8nam12on2083.outbound.protection.outlook.com
 ([40.107.237.83] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pJXDT-00070x-GG; Sun, 22 Jan 2023 05:04:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIOSJN2wGLJmnzQKTafpWyCkCZGOdohgeL6uMMMgd6DdshVi3NLvBEPfQcdr/i+rTDXqowJviIMzEHKsb7YaFmtHPf+MRvqs+ZFcC4M5aJzDDBQNVr3l22U/gOsWg7dBe6YOrwR0LWsf66fjy5e77vwUgb+g2+gbAm+OpXg55tCx22YgDyRBYGKHxer0vMJibfpXiIMP2xUA6mEBeeTT+aWEAUhtQoqces2sscpXvNeSKWoszV+rrajc0LY7dGDZT4UkIXMFM9J5mJeE4tvi9ZsmDJ7h6mWinWtRw4jmesksqlUDmX3NuAJeAiAnyc7A/CKv3d6TvE8hm94Ep0MqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X89CN0TK4NAbK8ruWvwZqt1TpCO6JvjCAgPjV+wYJ7M=;
 b=EzHMtJVtpVbuO1XFlCL29DU4kbhtA8+kOkQoBc2EgWJf5ORi01/9Wocrwc7XvN0UlpSPXfeNHgflwAqAFjIjPmr9E3pEYxH/83KMOxcN3MhA/eRflZK+8hm2V6eb+GisIS0a45P42RmdLN75ZGdfFkHs9aYbsasObSTK8WH7/24eXBTsPW0goNGZSlILJiFhBnrWORlRl+wxgLRmj9ZuWxCeQzdlVQn4G3DCIapM/ehG/2rQGKdnEqY8YE4Sk1AVkLMn9WC2w9swINlPLYxodkVNNkqIfc/WinF4agiTqxBiNbxk3MxgibeRRK790otdBCKY1x9PMnLMZ959PbFmXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X89CN0TK4NAbK8ruWvwZqt1TpCO6JvjCAgPjV+wYJ7M=;
 b=ob78h29CXniJOaQK2Z/QsOLmHGtwQR+OY3e6aUqw0CBvXr4JCg/h58ZHQBEkyChJA5OPxM80bjPs1TpRoDORejNCVpPEKIrrolSsTsZrdk8CSg6oAhNwRbUdoKzmzNr6qKedulViEQpUAcv3KCULST3Q8LVbSyZLk3DUJgZghQ+kSva/TyEmXoUarqy8doAHQbvYUxoGuXQ2B5PBVockZfvgvsEU+AknWm0vIfis/G6mP8DIxNzzOXPl3OwrjfIkesSCRkJU3p1nDY9J7XuXpkI/0TwVNpd7UGLiXcTZ2eyP1Mzmn79iHETPXxj8sewDE8xqn6efMG34FQpmff8wyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DS0PR12MB7874.namprd12.prod.outlook.com (2603:10b6:8:141::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Sun, 22 Jan
 2023 10:04:41 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%6]) with mapi id 15.20.6002.033; Sun, 22 Jan 2023
 10:04:41 +0000
Message-ID: <1eabf1c4-8e62-560c-e123-7a45b0319e0d@nvidia.com>
Date: Sun, 22 Jan 2023 12:04:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v8 04/13] vfio/migration: Allow migration without VFIO
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
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230116141135.12021-1-avihaih@nvidia.com>
 <20230116141135.12021-5-avihaih@nvidia.com>
 <20230120160624.2cf0762f.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230120160624.2cf0762f.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0056.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::23) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|DS0PR12MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: 752e20d0-b4f8-4f41-835a-08dafc6013b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jhkvKXe8XHs42G3/njm3sdIG0OktB6oUbggyq9jQCLn7ULJbCsBQpgW/LHdBViLD9ZD3dXS3sGv0ZNWP8Vrw7tDEoHSKPT3yT7wipn/fyW6yNKzlhHhGTWGka54VxUe6JaNwUde5oCk9zZfzGkKT4Uw2zwC+qUaVuHfxkIZBkHEDBDXRsG6Hr6TxHQHVV2xJJTrygrFm23cZ987kan9vzS83Jv5+GszQyAe/BU7e5KmMiPkNt25ddKSNw0E/rTx/A8MPUq6e8zL93Pd0a1Ly43XbID8P/uEKavaTbgsrYwKpQ1+CPY3GbMEYvyT9KmMfhHH1iE2+BjSGq9KWpJjMbjN3T2aq20v8cWlT1HJEw+KgwtDY/cnCxFCkwHFD8vFAqmVBclM7gQ2FlcGz0bC5jurdeZLKPZH58i0upAPIOYgaehHprkbiDVIq29Ti2pYIIrBXKRAG19+jBZQormhvmQzW4IR97eoal8ZUEa6g3nfzM6HYBYJ1rqs8XbRVNh5Bd4VKhfH8gm66tJbLGzovsYZXnX2/5tMeHDgpgX5l/WLR+0xGuAtUcFAiCiuwAdSZn3vE7BIf9IDB5G3+XLJz9c+96JkUG04nU38w24id+f2Fz7fi9Sn/QpoatHYvwnvH2AAuXsupfZvlPr0eXFSjM+u9HbP8kXzsCK+TUICywu5OPw3dcHYGSSe6DhPqrUsNI3q7kBsbPZ9bn6MelwHmOahdU3Uw5o88iQFjg7jMRCy0DPwCkDTeSzCnFw0aKwHjDG3ESzMmPdzTbiRJprxbB851i7AF/g2axis0vxEJKYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199015)(6486002)(966005)(478600001)(38100700002)(54906003)(6666004)(83380400001)(41300700001)(2616005)(316002)(6506007)(36756003)(5660300002)(8676002)(6916009)(7416002)(86362001)(31686004)(66476007)(4326008)(6512007)(2906002)(31696002)(26005)(186003)(66946007)(8936002)(66556008)(53546011)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0JkSG5zREtXNFc4SlRRWUU3MFFQYTVLelFaV3hUOW9Oa21sMyt2eXZTMzNM?=
 =?utf-8?B?M0lsY2ZPUTRuT3VYcitQbFFlK2FPekRDVmlTZ3pCMkdWUDFnZ0dYYUNZZGNG?=
 =?utf-8?B?ODdPQzhXWnZ2TVNPQzFrT2lyUkZsVGFEN2JUZldmMzVpMm15SjVFZlRsdDhu?=
 =?utf-8?B?dThHaUxsZXlqbGJaZXFGeUNTeHFyaEI2ZjdpSTloL2NqeTNhRUZQWk0zUkl2?=
 =?utf-8?B?M3VRaGJGUFpnc29na3AzcmxOUHlIMTZuZjFFODRXamdJR1ExdldEeStualVi?=
 =?utf-8?B?eWMrMU1vSVdoS3F1bWV5UTFlanhLaTVrMHI0bEhvOWY2TEdkK2pCdXkxWWxn?=
 =?utf-8?B?a01UOEJWUXBvU2pXd0doV3NyQ0FSamV5NkRjdForaFRnTFJkQXRGenY2UUFi?=
 =?utf-8?B?RnZ5TVpUTWlkN1d0T2JzR1Y2ZGxhd2FVWXlITzlDdnZEQmtZVHZPT2FDUEl0?=
 =?utf-8?B?bm14SDNuZkszRmdmQVRRcUZ0WXYza2VCalZ5M1hIaStNUkVXU2JmL2ROYkpk?=
 =?utf-8?B?czBWVGJIQjFwMnp4VjJZVFlnZEphTzV5ZkFjOGJVdThpSG5TdCt3M1ZLMkps?=
 =?utf-8?B?d1dtMDJhUld2WDNnRjJ0Y1FlV1ppVzBRM1hONWpxVkR4WEx0a2EybW8zeVox?=
 =?utf-8?B?NE1sQjlSanFZV2xnSi93aWNpUWM2Y3RUdmhGeFdsK2pGNXFhTElleGlKeDEw?=
 =?utf-8?B?SzRVUFlkSHZnWUtDK0NiSWdob1RZVWt6TmxYVGhGUTJCa2lLekFRQjludVJU?=
 =?utf-8?B?aGJ4Yzl1Z3J2RStseXFvZkxsKzZBTU9hd0Y0Z0k5YTZyczU1NVgyKzR0K2dY?=
 =?utf-8?B?MjcxNlloMmNXWjNMWmkyQ3FsZDgwK3kreXFzaUkxUnZhZkM1VVphbVFFZGlp?=
 =?utf-8?B?VndvZ1J6VTJ4WFpVSksvdzdtb3l3bEN0c2g0WVU4VWxPRXRsZFZhaGFBUWxy?=
 =?utf-8?B?Q0dMbEtLSFFKbDZxUS9QYU1yTjJYSTZtYlhDemtGNXloYWtsbXdiOTJXTkVC?=
 =?utf-8?B?RW4xdkx2N2dPNytneDIwYjB3cktCdTVTS0syanRCWXBCMEw5VUlJTUlmNDkz?=
 =?utf-8?B?ZzdtUDRUL2h6eUJPVjYyazVOMzBZL2RPNmgxWHhqZlJSVklyTldBU2xyc3g0?=
 =?utf-8?B?QjMxVDFORVFKUXlBcFVRbHd4aCthWXF6OUdmaWxFaXNhMkdla1JxZzc1alJX?=
 =?utf-8?B?MUZCRUw5R1dtVW4wZkRlaVhSMjByZmh2OE1uT2lkQkkrZG9zOW9qNVVja0Vs?=
 =?utf-8?B?TzFzcXEzR252U2NmNVNQODJyeWhvSitFT0JZYzRxRTB6QlFneWp6UVg5ZjhJ?=
 =?utf-8?B?RHZaaGhITWUvdWJLOEEyU1gvcHc3dFFkb1BTSTNMazh5NHlJc3Z0Y0NJZkVE?=
 =?utf-8?B?UndBUjJqTHBIbVlVd2pRRGRBb0lYVmdaMDNZNUhIUUVEQkhQbHp5RXNnZDhL?=
 =?utf-8?B?RUVEQTVLWTNac1VEQXF2ZE0yNFJoV2hMOFdpM2FJd2haMWpDb0RsK2Y4cDVj?=
 =?utf-8?B?T2MwSkFWVUVGSTlQdm4wVUU1MXVUZ3N3K1BseXpreHJUNHF1U1ArMWVqOFA3?=
 =?utf-8?B?U0xqeGxzbzlJSFVXV2JIU1RyMXpyb29ucjJLcHB4SzlJZE9uVEVDQ0cvTmJz?=
 =?utf-8?B?K0c1V2YvZFNsZTlyQklpNmFzMDNwMDBPeWc5QTNFUXU4NmN6Ti9qSC9LMFpp?=
 =?utf-8?B?NXZUY0tSSGJxYUtpWjZBenZZSE1vVGd4clJFYUhkQ2wyZEtzVit4K2Jpa2xT?=
 =?utf-8?B?NElZY1JrRXNqMnJWTXR3MHhqWU5qc0VCb0pHcnBJRDY5NERza0xEU0tqZFZj?=
 =?utf-8?B?b3ZYeDVTSXkrMG90TE54WVpuRE03elJKcGRoVXpUTlI5Q1FId0Q5UWFRODZJ?=
 =?utf-8?B?dEFnS0RVVEd0anI5aHk4NlEzblZGa0l3WWdISGk2MEg0ZGgxYXlMYWFFSzZR?=
 =?utf-8?B?dlM1RGdURzF0M3hkeVpWaVNyUFJPaWx3Qk9veGlUL2xyejA0amwzVDB6V3Js?=
 =?utf-8?B?Z2lMTC9lSkxtQnRKaXlRMnBLQUlleE9DcEhUajc5T3RqV0dPV3dnaXNObzVv?=
 =?utf-8?B?N05yWmdiVjZRaW84bFZORU5UNVRCNnJGc0Z1VEVSM1JMaW9xdUxwQ2J0dUY0?=
 =?utf-8?Q?hORbizNCDhBEZ/TmMY9yQ11vj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752e20d0-b4f8-4f41-835a-08dafc6013b1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 10:04:40.7255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItlD0Nsy/V7y6SahXRgVxqgXKiezpQT7zjwgirpJMETE/r0VUlqVJs2E/EfgIEsg717qFoNNsrSEb1X+Vedg2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7874
Received-SPF: softfail client-ip=40.107.237.83;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


On 21/01/2023 1:06, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Mon, 16 Jan 2023 16:11:26 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> Currently, if IOMMU of a VFIO container doesn't support dirty page
>> tracking, migration is blocked. This is because a DMA-able VFIO device
>> can dirty RAM pages without updating QEMU about it, thus breaking the
>> migration.
>>
>> However, this doesn't mean that migration can't be done at all.
>> In such case, allow migration and let QEMU VFIO code mark all pages
>> dirty.
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
>>   hw/vfio/common.c    | 20 ++++++++++++++++++--
>>   hw/vfio/migration.c |  3 +--
>>   2 files changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 130e5d1dc7..f6dd571549 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -488,6 +488,12 @@ static int vfio_dma_unmap(VFIOContainer *container,
>>           return -errno;
>>       }
>>
>> +    if (iotlb && vfio_devices_all_running_and_saving(container)) {
>> +        cpu_physical_memory_set_dirty_range(iotlb->translated_addr, size,
>> +                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
>> +                                            DIRTY_CLIENTS_NOCODE);
> I take it this is an attempt to decipher the mask arg based on its use
> in cpu_physical_memory_set_dirty_lebitmap().

Right.

> I'm attempting to do the
> same.  It seems like it must logically be the case that
> global_dirty_tracking is set to pass the running-and-saving test, but I
> can't connect the pieces.  Is this your understanding as well and the
> reason we don't also need to optionally exclude DIRTY_MEMORY_MIGRATION?

Yes, this is how I understood it.
Running-and-saving test is passed only if migration has started, and if 
migration has started, global_dirty_tracking is set.

So global_dirty_tracking should be set and we don't need to check for 
DIRTY_MEMORY_MIGRATION exclusion.

> Thanks,
>
> Alex
>
>> +    }
>> +
>>       return 0;
>>   }
>>
>> @@ -1201,6 +1207,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
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
>> @@ -1236,6 +1246,13 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>>       uint64_t pages;
>>       int ret;
>>
>> +    if (!container->dirty_pages_supported) {
>> +        cpu_physical_memory_set_dirty_range(ram_addr, size,
>> +                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
>> +                                            DIRTY_CLIENTS_NOCODE);
>> +        return 0;
>> +    }
>> +
>>       dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
>>
>>       dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
>> @@ -1409,8 +1426,7 @@ static void vfio_listener_log_sync(MemoryListener *listener,
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

