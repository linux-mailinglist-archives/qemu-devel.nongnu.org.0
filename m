Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32CF6982B8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:53:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLy2-0003Mi-S7; Wed, 15 Feb 2023 12:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSLy0-0003MG-Ny
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:53:16 -0500
Received: from mail-dm6nam10on2058.outbound.protection.outlook.com
 ([40.107.93.58] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSLxy-00069Z-JR
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:53:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGZ3jG1ycA96w0hLgJQinYU01+VEjLb0JoOVavqhLTL6bVdbSDdwJzCxsZ4bnqjlK/FJM11EJJrmimUQbJ7bW03K8G8IKI/LnA5+vnKXmXmv3zF9dwMEMIJTNH9GMTALM23fc7n1MMxObmBlHf0iNwipnX49uutjC5YA4DxcHD7ebhfiil4vSCegVzsfhbwPw+EYBEDNxCGWA6HLPaorDBnQA096NjsLTAf0vIpkckkaSPrQ9qeo5DnEC5qwuknsxmB29f4P3OXnELCzidR13Nb1/P3G+5En6ivfxgQ33L969LDeq7g05fQTEBYeab9lPj5taw0dBQInnJgReKBYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuUvLJJNo+iVd0ODvpKLT6NTUKnuZu/tQ2OylSbDZwA=;
 b=Vtq8IjMPdfx8ClQsDXpBLphXDKfWQ33UrIRbPFzueYB+e7DstBqRHERQSYwlNm40xs+izf1Rba3/L3XqeRI2GgP7JCUAhJDZ4u5kQ5S+g5Gg0Nd1i19fZXJx/9c3lqBI9hEhVHe/HqBrBp5XDXDl+nUWUW4cN8U1ayJ12tkuRrp2OYxHVQ4lRiGIF8pSDWHV58BEQTOjl7y+D0m5imd7kMDJ/gA2aLga4hCOOVw0I4pL+hm01E+AlNcYpGur8w/KMpe0gSKSjkK+lFa9ktjLnDiCuLQGD2jsaoLIQRYGv/Ljxpo4obaj2VEMc+uv0ufbrgEc3AWthwqqSbtYHAWBLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LuUvLJJNo+iVd0ODvpKLT6NTUKnuZu/tQ2OylSbDZwA=;
 b=S52Z9Sg7FMoot3Pt1J9p/s2baOTGmNIQTpodS4iXS9FNUo4bNh4qgoGaUDliOlqVdyPMtNDmrmEnt9Dmle7Ka9qn4BfgFJ26MuAPx1rKWukOQD8IhT+a+eurgXPZOtTXEsJtD5+UVqyEsu6azNTj5TAEkR4V+o5C4wgKnG8Ydd4fdV5TmtXcL8CiiPEqM6oY6KdVagRfeZkwYZhZftpB3hzC5Hmwov+oXjkspLwKQy+8sxtJxU90R3vt/EHn514YTEG+q5LBjpKduBpXqGBAi3iY7qIzykeqGIVdX4FA+hLg4JVNaOUKlPLrzINLf1EnT2+zpj26i9eqCq78JQxLSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by BY5PR12MB4129.namprd12.prod.outlook.com (2603:10b6:a03:213::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 17:48:07 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb%3]) with mapi id 15.20.6111.012; Wed, 15 Feb 2023
 17:48:07 +0000
Message-ID: <2efede77-0b06-0efa-1ea2-86300307c86f@nvidia.com>
Date: Wed, 15 Feb 2023 19:47:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 03/12] vfio/migration: Allow migration without VFIO
 IOMMU dirty tracking support
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230209192043.14885-1-avihaih@nvidia.com>
 <20230209192043.14885-4-avihaih@nvidia.com> <8735773xr7.fsf@secure.mitica>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <8735773xr7.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::15) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|BY5PR12MB4129:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c94ff0-0684-4fd9-ef71-08db0f7ccbb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8xQbD/Rxn9Xok2Xy91yvTBBUC6/Mc6NiXb1XWmlUZCuALAUbT2LixwZVOUFDXa/JMFhQ6QBYRHYzlPO4iYy8G1jLFxBdmlYwaXUFGcSDQqHR6okpBUHaS7YX37/S+lnFrittgyLD0K0eHz4uirbUnLrzyVaHcGX1mEiyLkVWhGyEpy0i07f4z4q+3CliAyaX1EZ3wLi4RvxU1WfA08EyZNq6ujuxK78qiGMrsoOXLUM1l3OYgd4zOwHr65bfdoVY27gmfvOhcfvDQzUSjR3diZkMngyZiKqVtx2x9VImrKfGeWB17W+rcOW8JdxUYNzO6NJGPElln+t7bZ3yJJ+pAL8JOvUHOxLkfZruoPpTi/4S6yZThzsD1bewmiAlinrtlrlpekRi1pFPxLkgM7d/GFQKY1WQKTy06SVFs44WZpuCaaooaFisW4Lux2VzqjsfJ9g/OSb3Nw1saMSMYiR7yuWNf5P9/g+pag2qHDwIBgtBABNgUhjahNWZxkl/BMWC7jJ34Uo2iTmaNwZD7+OGAH3SRuwY9qBSTdRBpWQaZuuo00Kh+xelyS4FnrJXGMK9qWDdtcp6VcK2G4DWiw9WdAnZ3v9Xh3+I+gSFl0Kfz9+hArghbegecieZroj8KuCnMZd9rA3pAaICiyiTSrFueRMqXrUwRSdpEWIH62ys+HKLI8szu0URzU2TdzdFNAaUVoUw5NrN54MM5f6sH1Vyhy2+bwNOu29nVA/Y2c6Ul7kG+LsuT4y/o0VXgZgQhkUh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199018)(54906003)(83380400001)(966005)(478600001)(6486002)(2616005)(53546011)(6506007)(36756003)(6666004)(66574015)(186003)(6512007)(26005)(38100700002)(41300700001)(5660300002)(8936002)(86362001)(31686004)(31696002)(7416002)(316002)(66476007)(66556008)(2906002)(66946007)(4326008)(6916009)(8676002)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmtjaDZNTHhtT0lMTUtsbUNndDRKU2U2L1pBMGdNcU1OdE1DdXZZdm5UR0RU?=
 =?utf-8?B?TW1wby9XZE5wZEVRakxKakFPcUYrbWdzT3FrYlIvRktyZk52ZWRXU01rVEhP?=
 =?utf-8?B?N1V4dEJPMC9ocXdicFRsYy9nMnZHQkRkMzk2YjF5RlJXTmlORXMzZWZrcUlD?=
 =?utf-8?B?dkxEM1Bwc3h0T2o0cjdNTGF6N2tNNnIzcG5lV3FHRW9TdXdwSkFQVVhvZzMw?=
 =?utf-8?B?ZWJhUFNmTXhBWmJCd2NZaVNYNXQ4eGZmZTIwS1lTNitBMmFYdGw2Z1B6Q0h2?=
 =?utf-8?B?T2xGOG9UTDV6RjFKTmxNN2VWTmVGYUNtUTBIOEpRaThDdWNyNUYrL3ZPM0dw?=
 =?utf-8?B?TEJMWVM5T3g1ekM4eGNOcE5SSnFxTEMwOEcreDVSRmszRkFMTzlJSzErRlV3?=
 =?utf-8?B?UHEyWmtLUDRpU3k1K2FhR0I2dC83bWluNSt3eDczdy9rZTl1VDJnblNqU1ZI?=
 =?utf-8?B?Wk5mUU02R3ZWaXpZTjdycjNsSmpzNWxEZ0JBaVZ4RVp1RWh6VE1WYVRFT25Q?=
 =?utf-8?B?RDVmNVMxYUhVc0t6ZVY0VEl3MDIyV05RY1R6Slh4Rkp5VDhHVjBHbGxFMGtJ?=
 =?utf-8?B?RXpwSzJKUEdXc1RXeWw3ekI3YnNLY1VMWUdnL0ZRWkJIdVdrQW05dHVWdkJP?=
 =?utf-8?B?Z3hOSDhydFVDNXNCMHJlaFdIZVlUNDIyd3V0YkV0YXNKNmM5eGUvaGpwUDZh?=
 =?utf-8?B?bzBrblZ5dFB3YS9nUmpJY1NNQzZYbStzZTZYajVBbkhuVFJUcC90bGtyNUdJ?=
 =?utf-8?B?YU83MVFBZ1dqQUxaUUdGOGV5Qm9KcHJLbGtiMjZvYXQ2YWZqazFKMG84MnVJ?=
 =?utf-8?B?TFFxNGt5QnBnN2NUUGVEOFZFdkFNL21kV2xoTU95dC85b1g3cmpYakFqRXg1?=
 =?utf-8?B?dTJGZDJYQmRSWExpdUtZMkhJZHdUSG80QlI2K0FaV0pYZThzY1pnem5sNm40?=
 =?utf-8?B?M2EwRTl1ZnJheEtIQlluNjhoUTlBNnpOVVN0VnU5SFJzZmU2RVh0SzhPVG4z?=
 =?utf-8?B?YTJhYStpdmwyeEV3L2NNZy96SjhzQ2s1eWV6R1hVOHBwY2s4d0NNWC9aeHgv?=
 =?utf-8?B?YlFvVjRpYXNKczlVdXNuUzdCck9MZTBBT0wwUWNaYTNKQklJcUNlazByVzlr?=
 =?utf-8?B?aFd0WU1NVDhnMXQvMVU5ZHY2WkpYWmMzanJXSm5OZFRLM0N2RnVsbTVhelVU?=
 =?utf-8?B?S3J6SkprZWRacU1qWERlTExiNnJGVXZEWGxaNWprQVc4RSs2UVdLL3FIYjc5?=
 =?utf-8?B?U3g0RkcvdE8xVzE5clZNWWFsZC9XanhxM2JraFZxQmtlOFo3SExlUytZbGI4?=
 =?utf-8?B?dHJYd1J1Z2pOREEzWHpaOWs2MFIrd1JSbEt2YlM5RXIxeUhTN0VNbkVUYzRt?=
 =?utf-8?B?WmptekVYaUdaQnJGWjJnZnJYakRYUlg1QnJTSi9GRk02cFg2QUM1b3NPU3ZF?=
 =?utf-8?B?VHBvV1JOQ1dpeHFlSDNtYTFIQlZSdkdhb2IwcW9EbGdBNENObEpTZnA5UFlM?=
 =?utf-8?B?cVR1NXFhR3FHbDVJNkpNb2Q3c0RXOHlwdHZiSEplWWNHK0h2WnZMaDhXU3pz?=
 =?utf-8?B?aGhyL2pQenB4UkpVRTl4Tmo1dlk1MmtJU2RmZlErdUpUbWpLTEN5WkNxbWdL?=
 =?utf-8?B?dzliQzZVNmRwbWZOYTBmSnZ5blp4aldLVXh3dEZEOTgya0kyOUE4YTNtTUR6?=
 =?utf-8?B?UHc0bGNsc3VUekRFNTYyN0Ridk5nRm9hbWFWdEt4NjNIZDB2V3R5emx3R0Fp?=
 =?utf-8?B?eXU3RWh2aFUvWUlwdzR3dk16MGRKT1NTdkV5dG8waisxSyt1ZEZ6cEpITXB6?=
 =?utf-8?B?dFB1SXA0Ykl6L0pJekYxYlM3eXR4d0tRYXd0V2FwVWhlV0k2RTB0S1hvKzBG?=
 =?utf-8?B?NUs4UHJkN2NaajRxSmQ3dGl5N3lNMEh2TEhJWGtGUjVFZjVFbTZJbGlxZFhM?=
 =?utf-8?B?NHRSd1VjakxISThrVTdHQ0YwY1ZhNEdDdElrUFVoVGpJN1NURm1rcFdzMXQ2?=
 =?utf-8?B?cE5LNGlYZGhoYUMwRXpMUEpyUGVacmJnaTVVdEZiRllDZE00aHNlNEJnZFI5?=
 =?utf-8?B?dU8rWTlFWWhvOE0xdlhONVloK2lrK0laWmtOVjNnVmhvVHNhRmR0aTgxeitJ?=
 =?utf-8?Q?6LXdEbI6bhWbddEGUWx7HR0vN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c94ff0-0684-4fd9-ef71-08db0f7ccbb0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 17:48:07.4538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lFMGoKbXY/9/YduKoc120d2suUt4v+90roSIq3yWmAncF6aMpzQjkz/XiFWGaCUjiCUQ3cMTyDVZcHtAapg4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4129
Received-SPF: softfail client-ip=40.107.93.58; envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


On 15/02/2023 14:43, Juan Quintela wrote:
> External email: Use caution opening links or attachments
>
>
> Avihai Horon <avihaih@nvidia.com> wrote:
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
>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> I know why you are doing this.
>
> But I think this should print a warning, error, somewhere.

IMHO, I'm not sure it's really necessary.

To enable VFIO migration the user must explicitly set x-enable-migration=on.
I guess in this case the user is well aware of the dirty tracking 
capabilities the VFIO device has or doesn't have.
So I don't think adding this error/warning will help much.

Thanks.

>
> You are just dirtying all pages each time we arrive here.
>
> Even calling the featura "experimental" is an understatement.
>
> Later, Juan.
>

