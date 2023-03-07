Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30326AD95E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 09:40:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZSqW-0002Xh-ET; Tue, 07 Mar 2023 03:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pZSqT-0002W2-LZ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 03:38:53 -0500
Received: from mail-mw2nam10on2048.outbound.protection.outlook.com
 ([40.107.94.48] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pZSqR-0002jy-FL
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 03:38:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5r1AXja/Skz2NKmoDgvRMrd9+b0ofJdVWztNZPvKhiuhEdUJSwb0AC2GYv7QChxrOKYTGSOYjGys+FTcO6UV4az+ZORtR/n88bAwl+nirVzQXdmNRmDDl5WXag1AlDnCvSl8e80QK4EFl8wzVYt+Zb9bImrwFbWpnNdXYTZ7GeQLPCfN9vD34FzmbhGD7JdeL4tMNL4bXnCEfrWkrhQBZUszi0fporeLcrSg+jHpLOh5QIWhTCLnPACQE0xRg5PK7iLYbORmmK2gVoCaFmhuCgs9SC+iFV9oTqe6luTVhC0ivdsCiN4QEPoyhr8w0JG0jAUsSQdKrDe34odtvJsIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FtaECWOpgZhRI5dbq7/IzdsV/S5DT8tTr+1TyjqTro=;
 b=f7ycwOHprkwhjIxi/l3UC7B2SvroHj7r4btu4Es1nJjF4q9SeydAm8Q+P6JA6VfXlZh16uRC8/MznmiKN0FTjt+yv/o8aQaMKzi93mR0wo5ipt6QWh0IOG844Ol6i5j6GMOVSMywRgUElV9HUpECa1qMpZtSFh9iSafOlBhC7jXb4iVWC30aYIEML+drHAS9D/n4DgzFXxhXJ8yw5qPz7zb7CIe1kbc/X+PotRxQFW/xMtEal31GdchXbuOO/ZrOelYZJIaf86ZZNVmEsNU2rR4zlqt5owdlsPfIM3vzCbQKquy54gd9y9XvuLvZUBMPk7EipNLdNkrTpNwhmuBYrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FtaECWOpgZhRI5dbq7/IzdsV/S5DT8tTr+1TyjqTro=;
 b=o9tlMxLUhP2krzx5okGwE5LrWMJ+A4DGrsaOyzPrEVrxUzdH9av/stlK3hFlKwHgJMHozxO7vPOsFSUC/Cks0Xb6zC6ScYITWsomZJxGu2qeFCNTaAGm0pdmBUstuJalDIisp20B6hxB5/P2GjTcuF9XvvOmEPXdtA1le4cuMrQxJ+cR7F/fGNCl744yX3I4Ai2rWTAxzT2adD2tfYMdXNqOAxh/cQZdNB8Xypnac+UCNviBZEUH0tkFzEfAfFxdYCpoI1d0a3uEA5jlcY0Z41NXel9gBjLvMAfpnf+Qtyv6/e4erwCJRcA6KLyf/ghE7DHLl5ocW2X3xv21xk4Iuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by SJ1PR12MB6123.namprd12.prod.outlook.com (2603:10b6:a03:45a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 08:33:43 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::423c:5fb4:a0f0:e918]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::423c:5fb4:a0f0:e918%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 08:33:42 +0000
Message-ID: <7a529cc8-3fac-5ce1-deb2-4248e636907a@nvidia.com>
Date: Tue, 7 Mar 2023 10:33:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/13] vfio/migration: Device dirty page tracking
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <b3c061f5-662f-8303-c8f8-2788979d70e8@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <b3c061f5-662f-8303-c8f8-2788979d70e8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::27) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB5544:EE_|SJ1PR12MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 358409b9-c65a-4499-d485-08db1ee6a89c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: idS1XSTk+o0OIXol/i74VqPozarSE8M3K57DtLOlF1nFkCGeJNlTn82Ub8XdRz/sKhtJbpmRbg9cBmoK6q5dUIlEsRyC0SlbfUAW4BwRSXwHouocdlDX6AZWDcvirr0CDkD2p+YkpW0aFICcF0qJ4IefSJ/pDwTANVzD5bW8N52g4Bq9YHkwpNLsoBlw25NwW/+ZTVAODNm016fyd3eqkGYrJ5RS9w83kn3uyS27VIATiyFm1Hp8cQa5/AAMDcLrGE+apdJPjOT4hFTcUK+Z9AEO8gVyB7Op4aidgsQpejMJepv4DBO92D8zkNRwnXLHJA2qd97+OKca//nwgq6T8VlV6+1lZ6Bq0T53uqdRxnBppad6ppjHTbbIeD/tcjP7ElY7lbNKQHlIF6qTpsdCQGI/PwudmE6iJsEJXjv7phQ2IEZoN8O0xCuWJuWh+b40Snbfxad4tglZxnXWcZ13+8R4kmv/Q343Uibiw3KtM5y4lBQOLfupen4SussTrM8FOFRVdHC99J/0kfq628fYslThdfOIhz12HtAbIGUERgg40MV2DZRWg/ac1oY/sCf2HGS1VRakgsmEehkgQD8+QXWOT3rs8DzEg1NVIfGGdDdqEE+S/yutg5FDPXONiOzG6fKmX3oH3EkZC5rlKBjGZ8MPT4x1C4GTZXGum5mT0r91Kh/25h5thuzB7cAAET8CT8gL5BA9NV/8LAtGc7ICjnIOFAY4dbmc9MbUbxhiOx2YKiOicQD104H67Zly13dS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199018)(2906002)(38100700002)(186003)(26005)(6506007)(6512007)(53546011)(2616005)(31686004)(6666004)(107886003)(66556008)(66476007)(478600001)(66946007)(8936002)(5660300002)(6486002)(41300700001)(31696002)(66574015)(110136005)(54906003)(316002)(36756003)(4326008)(8676002)(86362001)(83380400001)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGRGc0NlU1lyWnZUbHltdHNkbVh4YzYyUzJZWG5HdHZJRjZsN2FWYjBmaW5D?=
 =?utf-8?B?NnZZYU5ZMkI4alI4Y0FyZElpbVdLS2JxR3c4S3F0VDhXSzEweFBDV2cvSzhH?=
 =?utf-8?B?OVVVWWxnV2Jna2hTd1BubEVrRmptbFU1ajBEemlhT3h0TmhsY2dZWVJYVnJw?=
 =?utf-8?B?bUVUa0hoODc5TVE1ZHJ4cllleTBjNnN5SlNYSGdPcFdPYWNDMDFTKzU2NTVH?=
 =?utf-8?B?dC9kYmVVc1NldFFDd0Vvd0VWNEcwcXNILzAzYzE4enRHR25PZ2Z5amY5ZGdy?=
 =?utf-8?B?VW9zK3NjR1VzQ2hVUzdhbSs5WmdXSjhNZjB6bXNwT0VyZmx4SllER1NZaGpY?=
 =?utf-8?B?QkNqWjJ1Z2s3K3IvOXhINzliRVN5cGRMK2F6Z3lJc2UyMkpGU05BdGxYZlBr?=
 =?utf-8?B?QnpJVmxFdWxWY2lWWDB0WjFNbHEzbVdjb0wrUHBVZW5KcStmUWpVMk1yUnhL?=
 =?utf-8?B?cHlLbDhzSzA4NGduUWFSMUtRTU1CaDlJVXRRYlNEQVAxcHJ4MGY2dTBFK0ty?=
 =?utf-8?B?azRFZUo0U3piSHdSVmFGMHpHdXBzc3hSUmNuYWpRc080c1RmVlY4OS9NOG5Q?=
 =?utf-8?B?TjhxV283Q05EcVE1TUlJZGtldVAyVWsyRzE1VjByTG94SzFLc3ZQeDFOMERD?=
 =?utf-8?B?ckkyNnhoaUFMNmJOZzkvUWMvcEduOW1MTG1hZUJwVDd5RWtCdE1JYjgyN0Ey?=
 =?utf-8?B?MnZWU2QwNmdrUUErNkFsa013QXdHMGdXZVAxRWt6V2JUYTliTVFWZ1BMRkFO?=
 =?utf-8?B?WldidzRqMFRtOGNsTmJ2bEx2WnJzeHVaa3VlbEFRVXg5ZVBRU2pIc2VydFRy?=
 =?utf-8?B?UnJwOURMZlM0d3lVRzlRaFUrWDZSenB6R3hXUS9xREQ3SXdadmFIeVN4L3h1?=
 =?utf-8?B?TE13WldmSTNzRXBlcWw1WVg0SGxCdFViV3lNSGlWNVEyaHFqZnhqYjdHbTg2?=
 =?utf-8?B?U1pUVGMrbmdnR2FCZ3BqVFE4MFZiMmU1UkRvbUdmUkJ0SHV1UlVRSGZHNEZO?=
 =?utf-8?B?Q0tUaWI0cE5zYzBZeVppbzE3Y3B2RWJ2NVFGYmFLRlJSY2xLeXFaQVpiTHU1?=
 =?utf-8?B?VXZ4RjFOOXZsbnNobUg0dkNOcDgzOHlCZXJLbXo4Z0RuaDRhMHZkQ2YxcEJZ?=
 =?utf-8?B?QmdaU0hJdXY3NnJzZDNqVEtOcGp2Yityd0ptRDRORFp1K2VGaGNlUnVNeU5p?=
 =?utf-8?B?ZVVYU3hvNFZjNlp1clhLaHZoMG80bm05NFhlczN1Yk9tUFpwNHJjeXRWN0lR?=
 =?utf-8?B?Rm0xeUk0bGFYV3pHSkZDakJ6dDJ3dUw2YjNVUDZLcnFOTG55ZlY1K2F6S1Jn?=
 =?utf-8?B?Y1NzMVgxYkpzdks3YVp4QjNnbUhxZElaZVVkZDdDdHJJU21KK2xFR3gzQ0l5?=
 =?utf-8?B?Q2xabFJxKzNqRTNVTkFGSTZUa05ZRjkrdmRTY1FMK3k2MVRzTUx6NXEwZHJ6?=
 =?utf-8?B?S2J2R1dSaktIQXVFc1RwK09qNEY1MXlQMjFBYkNZUnh1TG55NTBVamtlVkR5?=
 =?utf-8?B?VzBsN3VFTXhhejBLTTFLNTBrdGNmY2VRODk0OEpkYWhYRjBHeWIrZEoydWJ0?=
 =?utf-8?B?NzBWWWUzdXFmZmw0Y2tpMy9rUUMySWV1dzRFdU5sVGpOcjQ4L1NOMGFpZ3BT?=
 =?utf-8?B?cWpCcjNKRnN5UFhEY1lkTWxMbFduM1RBY3YrdVhmQnZOMTBZem9Ga1orZ0JU?=
 =?utf-8?B?MFNXTUp5SnV6aEhjV2UyQW5Bcm9WUHJDMTdsdE1tMTF2NWNiTjliRTNtNFBo?=
 =?utf-8?B?UWk2bGZYRXZmUzluakRZZElqWG1RbUdncEJzU3BsNGRaajJ0bjBLeHJjVXZz?=
 =?utf-8?B?aEJ4VFFxeWFCT2dnODQ1T0N1U1ZiQURSMU1kdytEWGNkdGdFQkpGYmZxL29F?=
 =?utf-8?B?Z0diK21RRE9Kb1pmVWJUREtuVVdGaG5pa1hwdjEyMVU5YURhWUdrMnZSU0Uy?=
 =?utf-8?B?SjYxcnNIamg4dmMxSW5IQmZBZDM1dWZwbUhZYlNSVVJuL3BESnQzZnRsZDI2?=
 =?utf-8?B?dXdzMnl4bG1PNkw2WmorbTBMTlRiYzNJQzVoNDVVd3JIZDVWbXhmZVJBRERq?=
 =?utf-8?B?dnFzaUNRcWhIbDdKZHlTbzdoLzBMcGlaSytQY2piMGIyUC9YYTJxWkNMN3gy?=
 =?utf-8?Q?W4MvIHZHGY2qYQvvzjgOf8kod?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 358409b9-c65a-4499-d485-08db1ee6a89c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 08:33:42.6656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3yAD5KF1CsicuZSDtD4CBvXv3roq5ZssmJaXIJzOxiO/CgWn2+631shH9xSOgmEmHZWjQP+tvu8vYHNpvINsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6123
Received-SPF: softfail client-ip=40.107.94.48; envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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


On 06/03/2023 19:23, Cédric Le Goater wrote:
> External email: Use caution opening links or attachments
>
>
> On 3/4/23 02:43, Joao Martins wrote:
>> Hey,
>>
>> Presented herewith a series based on the basic VFIO migration 
>> protocol v2
>> implementation [1].
>>
>> It is split from its parent series[5] to solely focus on device dirty
>> page tracking. Device dirty page tracking allows the VFIO device to
>> record its DMAs and report them back when needed. This is part of VFIO
>> migration and is used during pre-copy phase of migration to track the
>> RAM pages that the device has written to and mark those pages dirty, so
>> they can later be re-sent to target.
>>
>> Device dirty page tracking uses the DMA logging uAPI to discover device
>> capabilities, to start and stop tracking, and to get dirty page bitmap
>> report. Extra details and uAPI definition can be found here [3].
>>
>> Device dirty page tracking operates in VFIOContainer scope. I.e., When
>> dirty tracking is started, stopped or dirty page report is queried, all
>> devices within a VFIOContainer are iterated and for each of them device
>> dirty page tracking is started, stopped or dirty page report is queried,
>> respectively.
>>
>> Device dirty page tracking is used only if all devices within a
>> VFIOContainer support it. Otherwise, VFIO IOMMU dirty page tracking is
>> used, and if that is not supported as well, memory is perpetually marked
>> dirty by QEMU. Note that since VFIO IOMMU dirty page tracking has no HW
>> support, the last two usually have the same effect of perpetually
>> marking all pages dirty.
>>
>> Normally, when asked to start dirty tracking, all the currently DMA
>> mapped ranges are tracked by device dirty page tracking. If using a
>> vIOMMU we block live migration. It's temporary and a separate series is
>> going to add support for it. Thus this series focus on getting the
>> ground work first.
>>
>> The series is organized as follows:
>>
>> - Patches 1-7: Fix bugs and do some preparatory work required prior to
>>    adding device dirty page tracking.
>> - Patches 8-10: Implement device dirty page tracking.
>> - Patch 11: Blocks live migration with vIOMMU.
>> - Patches 12-13 enable device dirty page tracking and document it.
>>
>> Comments, improvements as usual appreciated.
>
> It would be helpful to have some feed back from Avihai on the new patches
> introduced in v3 or v4 before merging.

Sure, will send it shortly.

Thanks.


