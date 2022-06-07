Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96A2540820
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 19:56:08 +0200 (CEST)
Received: from localhost ([::1]:35520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nydR1-0001nc-IN
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 13:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nydOk-0000cP-UU
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 13:53:46 -0400
Received: from mail-dm3nam02on20630.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::630]:20492
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nydOi-0005Lk-CI
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 13:53:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPCO7yIVyUtBdoLjcKD/oaSSRTHUbPPshbnQMThQzDvGsp9PMvI83RyWFeWjDCiZEGV/oC3T0enaFHN4my65GyrVEF0k6zV7KlMF4/odcyvpPuAMMyoI5uZoE3foSpc+rd5db3tlioV3D+duvh70wLjHTx2ucMW1QEv9vThTcX+pCXsyLpKItadzwjrXrYooqYtXzoHhw4FNGpQJxYCCNdk3KjbuJVnF4UqUFw7GyVlxOKsxiE3qixPBNw2s3cFq6YXgVV+rj3nad8YBK4oY1QLTJyzN8aGpWHlzdej+4jn/a29F3gNX07joUfohUWuQCG9X6oAaR2Zxkyo8V5GZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tODv9m1ej0rfDUmWz6Ny8MDpLvrEkumGZ9pneyvwhhI=;
 b=Rle0buEJTsoENUv/1BB0h+WOL0A8u7O0Z8w+65g8+Wb8cQzF2bOM6DstUVJpyYWMfzKW0zM3hhmuBSa+X5VaNU88/AyaAyRaYl7aKbHrIHecISDIwN03Y5sFYRtG/kW6kU4n913/rZRB4fpisIv8vbqlYrZg17Q/tAxwnwak8BjNA7QE1e0n04Wc6ui3RGrt7IjF8iLMmVOOAihvIE0NcDOmDWRUQrToH+Y9BNpXbD9EV7mfIW0dOmSCeQ+lTONnWdZfMsk7iCAy2wOGgOxZibS6y7hz+rlmyytxLcw+VToePvbaRlfRnirvVht2ho8Sm89Fb15y+TbF9AgEsSSVGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tODv9m1ej0rfDUmWz6Ny8MDpLvrEkumGZ9pneyvwhhI=;
 b=skJZvwByIkWcvaQDe1rktpNp3DuPz/W44Hq348mrMRRRuj9rzwpcIPmJfmYAiI4bDS7UQF+mnxb50sGd4Xlin4g0NoZbvWiPSeYaTbJQyrmK2pQUmNbOQAge2ZfKOpYn8IRNRuyp262sqFnejhw//nhGZNwo6f3RupFiK8SFwt/nO+p2vX/hsiwLRkRM2bjSCMEQU5/NEgWjvrPvumalMGRkkpzm1tUK54wguwuEEbVDcfP1vnXdEk+NvEbEeC2oQ0UajMqV0YHmW18pCAUPQkNPswXlPViE6EcgIAIKuF4Ng6OvfOIp4LsK/hrQZAuP32mmDdfFbNNeMdEVduLeFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by BN6PR1201MB0082.namprd12.prod.outlook.com (2603:10b6:405:53::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Tue, 7 Jun
 2022 17:53:40 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::bc8f:cb9f:6062:34ec]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::bc8f:cb9f:6062:34ec%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 17:53:40 +0000
Message-ID: <38eaae24-a293-119b-4037-7f253272f646@nvidia.com>
Date: Tue, 7 Jun 2022 20:53:32 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 02/11] vfio/migration: Skip pre-copy if dirty page
 tracking is not supported
Content-Language: en-US
From: Avihai Horon <avihaih@nvidia.com>
To: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Cc: Joao Martins <joao.m.martins@oracle.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <20220530170739.19072-3-avihaih@nvidia.com>
 <4c9fc435-1ebd-2bc1-823c-9b20f423ab44@nvidia.com>
In-Reply-To: <4c9fc435-1ebd-2bc1-823c-9b20f423ab44@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0411.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::20) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a18bf421-b2b1-44ac-b666-08da48aea76d
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0082:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB00820D4D2F5709903D15DF8BDEA59@BN6PR1201MB0082.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZleRw9BL1qnTimSwvLv1OirGBlcUh1dQiZoRdPw4TLFxIm8WZ15yIXE8SKNr+BFRz5bTy9iy1g1YC2soZUHxzW2mRJICuGln11OqjHoOCd5Ht/jJCKP2C+JNz9t5sDpuUZdozXNBcGNf4jySZx58k97UU+2WdJ9Y/Axj0r5+ecIrSBZ6C57pvIEuAHU+BoLxC1onm7LgVGdKmGQMkB2j/8Oc2kLJ3y1MnqcOMXMtcefjVqL57OQLvdDcbUiRMjjcNolJkIug9VPFDw2EvzdrDkwfZFPyIvy4gJaC1Bfyqz2nQwGiWOtL3CVqN6euN9JLOoShuN6mVZL3DgaW+/xDbcjt3Gg1cYRBynynehcTb6doU0Qyv2ztkICPcejpQW2OxlsYXmA48pdlm4XaV3neqnqtfI18E79bZk4Zx1vU1zf2fV9XPI17MzwunrA+ewHqE22KTcrlBwkGwDf2NpYsjBfusSa1X/aTkh8ImgaZeD3XLH/yaPgxazSyooD7mcP4WEYqpgDtDE3USXSFiuRuc4GY4ZNb2P/wt5j25nl026tIF427uo9YicIA4I25/RgTmYONqvb7NkKhF2yjS/XwOI1nKQ3OIlupgeP48sqo+Sl4UAZylzx8OEj69VkB70c4+7FHzKQVdWaLV6aOSTFzxLO1aJyrGp0f58ZZ1mpGYx+K6r1zMWUiJX90ycXhgBaXPAhLM79lerwpw+/UWZDMmUOqYArAmnEULovNLsCnohKPxNVjt6QZ1l9D1wEw3Bkj90o3/GMe7Wof+J3Mnkm9aQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(31696002)(2906002)(186003)(31686004)(38100700002)(4326008)(6506007)(6666004)(316002)(107886003)(8676002)(66556008)(66946007)(26005)(54906003)(86362001)(66476007)(36756003)(110136005)(6486002)(6512007)(53546011)(83380400001)(508600001)(5660300002)(8936002)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTZrb3FCa0w1UVNIMXNraFU2dzlTWHFQK3Q2emFmeEFucHZIdFdselRQcWQr?=
 =?utf-8?B?YnpMU3lHS0NHT01DbzV6K0tNcy9BSlBQL0pVbXozWWwwWTIvRlNqWm9udVNV?=
 =?utf-8?B?YnhiZ3BZUkxOVjVyejFLT0J1WnlwU0szMnIyVFE1ZmJQRm1EQVNqNjFQaDY5?=
 =?utf-8?B?WjNzdnZ6Y0JqeVFWT3RHcVdmYjVRSTZFUlF2S0FlL1VkUFpsRDhHaHQwemhE?=
 =?utf-8?B?eFg0c0ZwRTdZOTZoU29uWE1GWmxJRCszN2YrN2h1OEk3RTZaNHBpV0F3OCtD?=
 =?utf-8?B?WERQcEd0VVkvc3RVc2tNckNVcmpWV1JTZTRsY1BHSDZ4T0JkT1NPbGEwcHVj?=
 =?utf-8?B?NUU1MHNyMmthZVdzTFh0QTgrRENHdUM1QUxMbnRpZkNodWFCVFR2WEVOTmcx?=
 =?utf-8?B?ZjBnYURqdzlXVlE4UHZlQlpodWRmWE1kNnNEQm13NFFGZ05ibTZkcm8vUGZB?=
 =?utf-8?B?NXNZbFZuTnhpMjBsc2tBOFFBUXViaHE2S29ZT0d2VGpwOGwydGxlS0V2WWxF?=
 =?utf-8?B?amg4Um1NMkZPMTRVMllTMC9DcG1EVFowZXBZdVlMTWttRjdqSjhmckVkYndV?=
 =?utf-8?B?TlZsMUZZOGw4Sy9oNHVYSjFqQzdJZWNiNll5QkJ0b0V5cTdJZlg4TFpNTndL?=
 =?utf-8?B?ekZuMkJIaEZCZU5mWkVsYlJUcDVQRmdUQlg1TUxKei9NVHJuQXJPL3BNK3px?=
 =?utf-8?B?OWkyQS9wb1VKMThpR0RBeUUrS3BMaVJTN0tMbk5NOVNPT1MwMmRxU2ovZXoz?=
 =?utf-8?B?S1J6M3VMemN1b2YvcDh4UjZGbGNGVW1zTnBwTTAwY3BHUi9GSE5KVWlDWFRX?=
 =?utf-8?B?dGZtdC9lcUxhRUJnQ2lYb3FpNTUrSkFTZFJlbTlJa0tsMlh6VWc5cnZrR202?=
 =?utf-8?B?M21LRzdhRmVsdGVDaDhDSUtVbWFJYmNOcjh2bEF1UFp0YUFFMUtYWXpIdkVB?=
 =?utf-8?B?VjJvMG1NUFAzTXhlN2ZuaWhqK1NCaGl1STY1aWtJeVBuV0ZzU1Q1WHFpQWV1?=
 =?utf-8?B?Y2lzUmdRcWtsZ2ZhWDFESk5mbnVJZERNdzNKdUxxOStBL0VrWTFQd3JQc2Rp?=
 =?utf-8?B?OXdDOTZNcUZ4OU84bWtvMGZGc0RhcGs2b3FCNzdFTEgrY2lIUWxLRGRQa0RG?=
 =?utf-8?B?Tm5FQ3gvZ21VTXJEb25YeXdVNVVuMHZRRFM5Q0R1OFRCbnlSUENKcnRDMlY1?=
 =?utf-8?B?djVqVEw1UXJ5NkN5ZDBFRzZEdVY5aWtkUmhYendHMm9FNGpBL25CQktIcCtq?=
 =?utf-8?B?SHMwOWJRZytYRFRxU3R4UWZ3TzhMUmhqQ2JTOWQ0a1pEWkRHazlFYWRJaFp6?=
 =?utf-8?B?eU5ENmlaM2d6NWhuQnIzdU1iZVBaaExxdHFna3B3Wmk5SmhFY2pxbXlpY3BJ?=
 =?utf-8?B?Y1NxN0pSMDZNODN1YWU2OXc3M1hVUzBiTHJWRHN0OWRFaGJ6UkdLVDNINndV?=
 =?utf-8?B?UWJOYkxMMTlYTzJnV3ZXQmllWVc4UVRuakJHTUFIZVdGKzkwUlYxT3lha0Q2?=
 =?utf-8?B?TEl3d3NMemlrQVdrc2lGS3ZiNi9yd0txREQ1TzcrMFZ1TGlaLzdydnpMTURQ?=
 =?utf-8?B?UU93SS9iT05oSGljalphT3c4WlptSWh4YVprMHhJTVJxWUdkMDIvTTBVYVZR?=
 =?utf-8?B?S003U1VOY2xYWVlyRUZxbkRRTXdnaHh6RmlxNjA1QWprUW40aHAwYmQzNk9S?=
 =?utf-8?B?anQvNzF4b0w5NXNDQXV3dXVxOHJEWVF2ZjY2VDNUTHhPMitVMjk1TC9jWVRQ?=
 =?utf-8?B?cU9kZ2RwK3RBWlZ1UEx0QWgvU3JaclJBcEYzVkIwSHhZenJsVUpYR1BaS3Vv?=
 =?utf-8?B?YXgyaTF1NUxTYjR0MDllV0ZGYUUvRTZpUVBDbG56MmRVRHpub3R2M1NVYkda?=
 =?utf-8?B?QUpiWW54eGVGYTgwQ1htSEMyZDIxMi9XampXa0pGSzc0N0F3QVVRaEgvZVhV?=
 =?utf-8?B?cnVaWVlxSjAwVkJ2YzZCWE9WaUc3dkpCamNaZTJXbVE2ZFVxcHh2UWN0VEY2?=
 =?utf-8?B?WmlST1BkTmx3UGtKRm10aWRsRWVHTGxnSk5hL1orUkVDY1JaNk5MMDFEYk4r?=
 =?utf-8?B?R1JXMFZ4ajhyZ3c0MDFBUnN0eFQ2T3UzVGhFMmlHeGRMbkIrSmZKeVRiNWNZ?=
 =?utf-8?B?dEFzQnBmRGszVUpGcTJRZDRybmRGcllmdXRsaXVKTm50NU9XYTIxMkZJQjRP?=
 =?utf-8?B?Si9BMytyNDJVY1V2N0FmMTM5dkZCNksyUDIzbzFVQ0RQekhoM2E3dUE4ci9Z?=
 =?utf-8?B?anV3ci9iaXFiWkZ3NWZnSW1yYkJ6Si9WT2xwWEpGQVNjZTRnRi9qZTJDMCt6?=
 =?utf-8?B?YmU4bTI3SkwrSGI1dkkvMlkyVjkwSHFwZGtQMDRlNjlTZnMyenpFUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a18bf421-b2b1-44ac-b666-08da48aea76d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 17:53:39.9040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spVG37wJtKW0SWyJ50ooZ9DTLsn1wGVVGuIhIkX5iQcFbudyYRVD2WD3tXkKAB9602TUAV7FdeXE67wqsdGPHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0082
Received-SPF: softfail client-ip=2a01:111:f400:7e83::630;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 5/30/2022 8:12 PM, Avihai Horon wrote:
>
> On 5/30/2022 8:07 PM, Avihai Horon wrote:
>> Currently, if IOMMU of a VFIO container doesn't support dirty page
>> tracking, migration is blocked completely. This is because a DMA-able
>> VFIO device can dirty RAM pages without updating QEMU about it, thus
>> breaking the migration.
>>
>> However, this doesn't mean that migration can't be done at all. If
>> migration pre-copy phase is skipped, the VFIO device doesn't have a
>> chance to dirty RAM pages that have been migrated already, thus
>> eliminating the problem previously mentioned.
>>
>> Hence, in such case allow migration but skip pre-copy phase.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   hw/vfio/migration.c   | 9 ++++++++-
>>   migration/migration.c | 5 +++++
>>   migration/migration.h | 3 +++
>>   3 files changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index 34f9f894ed..d8f9b086c2 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -863,10 +863,17 @@ int vfio_migration_probe(VFIODevice *vbasedev, 
>> Error **errp)
>>       struct vfio_region_info *info = NULL;
>>       int ret = -ENOTSUP;
>>   -    if (!vbasedev->enable_migration || 
>> !container->dirty_pages_supported) {
>> +    if (!vbasedev->enable_migration) {
>>           goto add_blocker;
>>       }
>>   +    if (!container->dirty_pages_supported) {
>> +        warn_report_once(
>> +            "%s: IOMMU of the device's VFIO container doesn't 
>> support dirty page tracking, migration pre-copy phase will be skipped",
>> +            vbasedev->name);
>> +        migrate_get_current()->skip_precopy = true;
>> +    }
>> +
>>       ret = vfio_get_dev_region_info(vbasedev,
>> VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>> VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 31739b2af9..217f0e3e94 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -3636,6 +3636,11 @@ static MigIterateState 
>> migration_iteration_run(MigrationState *s)
>>       uint64_t pending_size, pend_pre, pend_compat, pend_post;
>>       bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
>>   +    if (s->skip_precopy) {
>> +        migration_completion(s);
>> +        return MIG_ITERATE_BREAK;
>> +    }
>> +
>>       qemu_savevm_state_pending(s->to_dst_file, s->threshold_size, 
>> &pend_pre,
>>                                 &pend_compat, &pend_post);
>>       pending_size = pend_pre + pend_compat + pend_post;
>> diff --git a/migration/migration.h b/migration/migration.h
>> index 485d58b95f..0920a0950e 100644
>> --- a/migration/migration.h
>> +++ b/migration/migration.h
>> @@ -332,6 +332,9 @@ struct MigrationState {
>>        * This save hostname when out-going migration starts
>>        */
>>       char *hostname;
>> +
>> +    /* Whether to skip pre-copy phase of migration or not */
>> +    bool skip_precopy;
>>   };
>>     void migrate_set_state(int *state, int old_state, int new_state);
>
> This patch still has the problem that it doesn't respect configured 
> downtime limit.
>
> Maybe adding an option to set "no downtime limit" will solve it?
> Then we can allow migration with VFIO device that doesn't support 
> dirty tracking only if this option is set.
> Can we use migration param downtime_limit with value 0 to mark "no 
> downtime limit"? Does it make sense?
>
> Do you have other ideas how to solve this issue?
>
What about letting QEMU mark all RAM dirty instead of kernel? Same 
effect but no need for kernel support.
Is this a reasonable approach?

Thanks.


