Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48C3682E28
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 14:40:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMqip-0002CF-Oh; Tue, 31 Jan 2023 08:30:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pMqik-0002Bp-EL
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:30:46 -0500
Received: from mail-dm6nam10on20627.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::627]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pMqg8-0002y5-Il
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:30:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qor7mxg+PowS9RLkmiVWjOYgQJOxyP4uhMSLBEXKs/BaDB2xVgp0reGT6vUvQqxtiWWU23yCYSoFRD8kJI5CkOSapTxGGx/64dQLEHW+bYUbXVgW3ctl2CuiSgwisDmUAUtaNw4bitM+oKdX5Hh/BqaIj3TbgR5UydEqt4UNGWxafXLZnIzQLUteRlHDsZII55iKvcw9Gl2bWmMxRK5UAYX8c6d2QeUx+OytfqAkkNla8PaGELQ5jn22kgaED8r40lcaRusvq1Dg/zjOS90RyjTTq0tBpjUSlUKJ3ZMEl4Rw85U/8DWRbncg1Ref1ScP82pOeUTPe7IIx2i4e0CTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aeer49V4wkoxmcYhVguySCd/AkoXlOsqpl1Fcd8ApU=;
 b=Rg+N7hNBYXLo32hjTK1VW4Na/bbEULISLoJRzTC6oQd8sMb4vH5j8UTzU8i0upCosIZq13Zq6BBpGGqfhuv1HcEoEuzf+tjRU3FLc6/ZyAfH7An3JuFDiqOIr86DowpG8UO+Lj7EG83AtV6ZIhVMdWiVXLrF2a11e+3bXiXfRS+u9671NTS5nut/p4bRgU/W8Jt2IQD1e/AKCzRqOfGJ4eujZhIwnQAHfKgUzDl+gAVTcljmbkqFcPgnZtRCZYmbs4OAoiLDhN13SPMJDLCtQr9SHcdffbZpMUYwpEpqnUvtVPfEScxcyP0b3dSMU/IRQKObtpePfiOP7iebOD0RYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aeer49V4wkoxmcYhVguySCd/AkoXlOsqpl1Fcd8ApU=;
 b=V7uf3Jxjk9ngc6gSe0FXQlXghb9kFF3dW6BIby6YnZe9xY4MEJ+mKRUQneGNW/wvS4ed3PP+NuQHTbj36EN/G9/OTKlw6/475IkdlpvcdJzwRlZm3PSwjsZkdO2Kl8RRzHKZLulmlPkS32ZIsoODaH8D5NvhZxIrluv1qByVjOqSyzaDECtiaf+brOAgJsiFiLSK0BA2QxVIGKrVpnjIMx8oP2JHGUCHzCOr3JuuN0T9UQ24HYccBdu3+AaBwbX7ro57Mo5ajvgcpm1aqwKJtKP6WZajothMdCdrpD/6aVBsRJLZwUwwVCSmSXW3ZQPLucnx56Vk7A4ojoNlDMzkkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by LV2PR12MB5775.namprd12.prod.outlook.com (2603:10b6:408:179::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 12:45:03 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%7]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 12:45:03 +0000
Message-ID: <0c6856e7-ab92-7276-256c-6226aa692698@nvidia.com>
Date: Tue, 31 Jan 2023 14:44:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/18] vfio/migration: Add VFIO migration pre-copy support
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
 <20230126184948.10478-2-avihaih@nvidia.com>
 <20230126165232.0e7a2316.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230126165232.0e7a2316.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|LV2PR12MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: bc337196-02b2-42c6-d221-08db0388f8b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YsjHQ3pjUt3WezkF9uTXCFMbpAVlrP+8R+YNRfDdYav6y7J3iIva7GwBMu88KQReKZQ58eNc6CsN5HKsu6vKHHa54evcXCN1T0+6u/qKHU+hWKq9RlLddZURQyOX9J0BbJpvWUtR1M2ugE6W9QB8o5vbRbWeELP6TX43gbOMiM2WSysWcvn+NBctUUDBBiQFETR24/jQqhF3W+KRLANLs7nC63SdhcF4b0u4A6Ps6jwkLFnXWrY7B5Oo80nhNsu80dlFoFVL+7bfvh1rykpHWqsggJr/tOkTuBoSRSCcaSqmVRjqi5pSw4OGX4YNsnVVeG6GV7YqWrowrMy5N1/gOKttPnp+42Iq25kw5rmUWExK6SuXJ+hZfnXI9RpB42bbks+URgldfJjUGF5nsbLblEZZb6WjJP9y4nCCRTy/+Gnzx4s5c9LHh+h/+y9hlcpPjLTDSvGbKKz1SWSJ+UMvKnEwhiqtA8YDtJvw/6hdY02uaY1iO1lQjTLcJM+YFzG09teP3U9oOaWBt+zW/pOEX6H9NB7v8uAClu6+gWrMXi2PssTieNVWSFerbCRqh9KY11uc9k1Xqh8UlQhR0eIlAgb4TRtpkvwiLosSYwE1zreg5UMG05nJkgecHFFaaxCSuxz2W0wm2Ps63vjwyFadAmZ9v0LPOcurD/n4Z+ltHIRZs2s4L58of2kAbuhquXCR82Ti6jHk+emeN0l5MzNi1dBX7Rtxy4VyiEUfQxjdzuJd9EiLvsk2flitBE5iFyVjHV094Q1me/vgXkNBJE7wRgxXewB107m1EhFuOVMhW3xHZXoxp1GOiVPZTpjK/AlC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199018)(86362001)(31696002)(38100700002)(478600001)(54906003)(2906002)(41300700001)(7416002)(6486002)(6666004)(966005)(26005)(8936002)(5660300002)(2616005)(4326008)(6916009)(66946007)(83380400001)(66556008)(66476007)(6512007)(53546011)(8676002)(6506007)(186003)(316002)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M25sRHlnVENSU1h1SjRZc3hsQ0JlZVZmZUJicTlUTU1FSFV5cTFiNVJVMVA1?=
 =?utf-8?B?MTYzUlZzelhjVmNjQ0l2djVOanJxdmtyeUY5N09oQ3QyeXB5eFZNczc5bERP?=
 =?utf-8?B?SEdZWitQeE9hYTBEc1JuNjQ1VkV4dGRDSXc3VXZiRjlBZTdRa2kxQUV5MHIz?=
 =?utf-8?B?RXQyamNua3Y0bFV0TTJDMXBCV0ZFMVBaYVZOOWhBczVWcVVYdkcrTzVySE1R?=
 =?utf-8?B?ZjRLUHdmeEdCam83RXdaZ1dsT1Y0KzlMT2tRb2J6NjVrQ28wZmhIclQvTURR?=
 =?utf-8?B?VDJCOFdtNkhMYXdBTjI2MERudCttS2RXSzdkdTNMUXBrQ3VmcjRRUEV1YXdr?=
 =?utf-8?B?YVVnWXo1dmhCeWNaRm1VR0NCb21mVEZPaDJyU1FnWUpFUDFwSmRZRGJpVWRa?=
 =?utf-8?B?UzAyMUtIdkk5TXo5SGZId0FlMGVjUzdmQmlQTlMwc1p0ckU3bTdVc3NCcW5R?=
 =?utf-8?B?bzFuT0hmVFlObkt3dkx3dmZRWGlTcGthTlZqci9Ra3FEdVdGV0NZa0tjMytS?=
 =?utf-8?B?RmR2Ly8wRjFQc01JK0NhdEE4RkVWZ0VKSHpCSS8wVG56cERZdWwyR0ljMWly?=
 =?utf-8?B?dVoyeStWdWhaTHFvQVIxTHJjZzl5ZS9ZM0RReXFrQWVRVUNpUlcwdURYTmQ1?=
 =?utf-8?B?R1hVWWlJaFlFMTU3UmMyS3lXcndhRWQwZnYxQjY1cnUwRzZVMVQ1L00yaGxp?=
 =?utf-8?B?ZHoyQmZDb3ZOSW9Ocmx1cnV4di91VUNhU1FxRDR3Y2MxRm1wSFJ2dGdHZGEz?=
 =?utf-8?B?anA2eHN1dktpZXBSWFNWcXhtbUpEYTBDUmhXNEVkcTIwdTZOMStzNnZTaDV4?=
 =?utf-8?B?b0FjNUx1WTNhcThNY0IyckhvRGhhVVREWDFJWmdscTRQdjk0dDkvelNPVFFm?=
 =?utf-8?B?Y1Nkb2czenhiRVp2SjhFL1k4OHgvMzlOM3F5ZkhubHF2QjVzelM5Zi9wdEMw?=
 =?utf-8?B?aVVXYjI2RHIvMlFERkIzVXVLNm5zSHA5SGpmaGQwbzJ4YUhOekhKZll3UEVn?=
 =?utf-8?B?UUtzbmMvdnZSMkNGZWJaZnJxL1VCcnpBeUpheXlhbVhuY2NEeWVQeFVXMkF0?=
 =?utf-8?B?alFKVEh1N2w3Si82eDh6QlNKLzd3WTFtWHY0WThnVDFRbWxBRmpIbmxLWVB6?=
 =?utf-8?B?cUNNM2Y5RGlrZEdTRTI4clA4bDdyUVFteWh1dzRGR2o1SjdWYlB2dU9BOHVj?=
 =?utf-8?B?dmRxT2NJOW16OVdVQjR1cGpCTUV1Q0tTTnpXVnVKUVNKdUxVbXNiNzhNUE1w?=
 =?utf-8?B?MEhkZ1RXalVPdU5WSThoT3FVTERQSFB2aE5PZitYWFIyQUZJNmxieVNVdHRE?=
 =?utf-8?B?UGdKalVGOVFnUUdNcnVwcmtpb2VQRUNETzA3bkdJUklBN0JLVHAvQjJpMlhi?=
 =?utf-8?B?QnZoWTR3a2c5OGdQV3k1VFNxak90aHlueWtYY3g3aHMzREpXeVEvaVhnMXRk?=
 =?utf-8?B?dHZ5dVpMWGhMNXNDVjg1WmV4YUtkaWVPYjVPOWJhLzd0aG1FMEEzMHYyNlNT?=
 =?utf-8?B?ejhUOWJNaHBLd1QwTlV6SWc5UFVJMFNvWW5OeHBUTnNsdmhpcW41UmM5NXZE?=
 =?utf-8?B?TGhPOURKMlBsQURlVk4yM0gxbzdCV09qeXpXbGtBam5XbXp2TjV1c2N3TXJa?=
 =?utf-8?B?dm5UQWJzUU0wMU5tVmdkUnd4Vnl1OWxXUS96RzZLOTRhS1BWZys4dmY5UEp4?=
 =?utf-8?B?RmRRdWpXUWxrWkUxOE9xUEFid3FCNlRrZktHak16NW1rdGU0cks5SzZpSVZw?=
 =?utf-8?B?bGY0T0pXelplWC9kU3Z1V0hscFVwbTV5SXdvbTF6cXhmbUtBM0tYamp4cTdu?=
 =?utf-8?B?VkJEQWZuVjVDRTBUQ0RtOG9jVGdlOERFWlN6TFNVaC8zS2FZQVhncTBkUXUr?=
 =?utf-8?B?V0JjSll5d3VoZGhqQ1AvWVM3SlhMSjdIUHRWMnVoVEhtaHBFTEJRRU1pU1lD?=
 =?utf-8?B?Ky9YYXNVNVdmWlFybEJ0RHYzQTQ0QkUrUTJlQ1RGR3lqcFFhWFA1UVRwT2FO?=
 =?utf-8?B?M0Q2T09vSkJlTkhFTXVZb3A3WjAvL0VKa2sxOVFGN3N0SFVrL3RmYXVIOGxK?=
 =?utf-8?B?dzNWNUFBZGRheC9SWnZmZzhsR3ovQnpWbSsrRkVyYlZmcjdocGNUeUVRWFYr?=
 =?utf-8?Q?kL2dbRHKPlGdfbsbYfDf73lzJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc337196-02b2-42c6-d221-08db0388f8b4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 12:45:03.2186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7tAWAJ0A6Cyv4+HP2XU/hxcXuD78SGub6Z2Bilw3PUPqJxeoaYuE0D4qR8UBtCWTsot77kPWRlVH4JzPEjK6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5775
Received-SPF: softfail client-ip=2a01:111:f400:7e88::627;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 NICE_REPLY_A=-0.09, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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


On 27/01/2023 1:52, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu, 26 Jan 2023 20:49:31 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> Pre-copy support allows the VFIO device data to be transferred while the
>> VM is running. This helps to accommodate VFIO devices that have a large
>> amount of data that needs to be transferred, and it can reduce migration
>> downtime.
>>
>> Pre-copy support is optional in VFIO migration protocol v2.
>> Implement pre-copy of VFIO migration protocol v2 and use it for devices
>> that support it. Full description of it can be found here [1].
>>
>> [1]
>> https://lore.kernel.org/kvm/20221206083438.37807-3-yishaih@nvidia.com/
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   docs/devel/vfio-migration.rst |  29 ++++++---
>>   include/hw/vfio/vfio-common.h |   3 +
>>   hw/vfio/common.c              |   8 ++-
>>   hw/vfio/migration.c           | 112 ++++++++++++++++++++++++++++++++--
>>   hw/vfio/trace-events          |   5 +-
>>   5 files changed, 140 insertions(+), 17 deletions(-)
>>
>> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
>> index 1d50c2fe5f..51f5e1a537 100644
>> --- a/docs/devel/vfio-migration.rst
>> +++ b/docs/devel/vfio-migration.rst
>> @@ -7,12 +7,14 @@ the guest is running on source host and restoring this saved state on the
>>   destination host. This document details how saving and restoring of VFIO
>>   devices is done in QEMU.
>>
>> -Migration of VFIO devices currently consists of a single stop-and-copy phase.
>> -During the stop-and-copy phase the guest is stopped and the entire VFIO device
>> -data is transferred to the destination.
>> -
>> -The pre-copy phase of migration is currently not supported for VFIO devices.
>> -Support for VFIO pre-copy will be added later on.
>> +Migration of VFIO devices consists of two phases: the optional pre-copy phase,
>> +and the stop-and-copy phase. The pre-copy phase is iterative and allows to
>> +accommodate VFIO devices that have a large amount of data that needs to be
>> +transferred. The iterative pre-copy phase of migration allows for the guest to
>> +continue whilst the VFIO device state is transferred to the destination, this
>> +helps to reduce the total downtime of the VM. VFIO devices can choose to skip
>> +the pre-copy phase of migration by not reporting the VFIO_MIGRATION_PRE_COPY
>> +flag in VFIO_DEVICE_FEATURE_MIGRATION ioctl.
>>
>>   A detailed description of the UAPI for VFIO device migration can be found in
>>   the comment for the ``vfio_device_mig_state`` structure in the header file
>> @@ -29,6 +31,12 @@ VFIO implements the device hooks for the iterative approach as follows:
>>     driver, which indicates the amount of data that the vendor driver has yet to
>>     save for the VFIO device.
>>
>> +* An ``is_active_iterate`` function that indicates ``save_live_iterate`` is
>> +  active only if the VFIO device is in pre-copy states.
>> +
>> +* A ``save_live_iterate`` function that reads the VFIO device's data from the
>> +  vendor driver during iterative phase.
>> +
>>   * A ``save_state`` function to save the device config space if it is present.
>>
>>   * A ``save_live_complete_precopy`` function that sets the VFIO device in
>> @@ -91,8 +99,10 @@ Flow of state changes during Live migration
>>   ===========================================
>>
>>   Below is the flow of state change during live migration.
>> -The values in the brackets represent the VM state, the migration state, and
>> +The values in the parentheses represent the VM state, the migration state, and
>>   the VFIO device state, respectively.
>> +The text in the square brackets represents the flow if the VFIO device supports
>> +pre-copy.
>>
>>   Live migration save path
>>   ------------------------
>> @@ -104,11 +114,12 @@ Live migration save path
>>                                     |
>>                        migrate_init spawns migration_thread
>>                   Migration thread then calls each device's .save_setup()
>> -                       (RUNNING, _SETUP, _RUNNING)
>> +                  (RUNNING, _SETUP, _RUNNING [_PRE_COPY])
>>                                     |
>> -                      (RUNNING, _ACTIVE, _RUNNING)
>> +                  (RUNNING, _ACTIVE, _RUNNING [_PRE_COPY])
>>                If device is active, get pending_bytes by .save_live_pending()
>>             If total pending_bytes >= threshold_size, call .save_live_iterate()
>> +                  [Data of VFIO device for pre-copy phase is copied]
>>           Iterate till total pending bytes converge and are less than threshold
>>                                     |
>>     On migration completion, vCPU stops and calls .save_live_complete_precopy for
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 5f8e7a02fe..88c2194fb9 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -67,7 +67,10 @@ typedef struct VFIOMigration {
>>       int data_fd;
>>       void *data_buffer;
>>       size_t data_buffer_size;
>> +    uint64_t mig_flags;
>>       uint64_t stop_copy_size;
>> +    uint64_t precopy_init_size;
>> +    uint64_t precopy_dirty_size;
>>   } VFIOMigration;
>>
>>   typedef struct VFIOAddressSpace {
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 9a0dbee6b4..93b18c5e3d 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -357,7 +357,9 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>>
>>               if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
>>                   (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
>> -                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
>> +                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P ||
>> +                 migration->device_state == VFIO_DEVICE_STATE_PRE_COPY ||
>> +                 migration->device_state == VFIO_DEVICE_STATE_PRE_COPY_P2P)) {
> Should this just turn into a test that we're not in STOP_COPY?

Then we would need to check we are not in STOP_COPY and not in STOP.
The STOP check is for the case where PRE_COPY is not supported, since 
RAM will ask for dirty page sync when the device is in STOP state.
Without the STOP check, the device will skip the final dirty page sync.

>
>>                   return false;
>>               }
>>           }
>> @@ -387,7 +389,9 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>>               }
>>
>>               if (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
>> -                migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P) {
>> +                migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P ||
>> +                migration->device_state == VFIO_DEVICE_STATE_PRE_COPY ||
>> +                migration->device_state == VFIO_DEVICE_STATE_PRE_COPY_P2P) {
>>                   continue;
>>               } else {
>>                   return false;
> Hmm, this only seems to highlight that between this series and the
> previous, we're adding tests for states that we never actually use, ie.
> these _P2P states.
>
> IIRC, the reason we have these _P2P states is so that we can transition
> a set of devices, which may have active P2P DMA between them, to STOP,
> STOP_COPY, and even RUNNING states safely without lost data given that
> we cannot simultaneously transition all devices.  That suggest that
> missing from both these series is support for bringing all devices to
> these _P2P states before we move any device to one of STOP, STOP_COPY,
> or RUNNING states (in the case of RESUMING).
>
> Also, I recall discussions that we need to enforce configuration
> restrictions when not all devices support the _P2P states?  For example
> adding a migration blocker when there are multiple vfio devices and at
> least one of them does not support _P2P migration states.  Or perhaps
> initially, requiring support for _P2P states.
>
> I think what's implemented here, where we don't make use of the _P2P
> states would require adding a migration blocker whenever there are
> multiple vfio devices, regardless of the device support for _P2P.

Yes, I think you are right.

I will add a migration blocker if there are multiple devices as part of 
v9 of the basic series.
When P2P support is added, I will block migration of multiple devices if 
one or more of them doesn't support P2P.

Thanks.


