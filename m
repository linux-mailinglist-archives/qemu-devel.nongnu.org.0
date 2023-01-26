Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0404E67CC7C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 14:44:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL2Vp-0000dl-Sa; Thu, 26 Jan 2023 08:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL2Vm-0000cp-Be; Thu, 26 Jan 2023 08:41:54 -0500
Received: from mail-dm6nam11on2063.outbound.protection.outlook.com
 ([40.107.223.63] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL2Vi-00079v-Vd; Thu, 26 Jan 2023 08:41:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dw62Z1NpfM/cDLQYdUovV6s20JLm52gMeAIGpwtm9VmfZ5rdC6u/EnxEDJ0+8M5EOWqZlA+Xg4hk3IiY3DO/xvY18VArlAXdfXcJ5mvmplG8oaXa7z0usH2VMCdiCWP93w4d7oBu1uDYeAnEil+qXF1MxcHfOjaovp6u2Od/YZ+7SnwiFCcBeMLL2ICCkKYpPMTUpH9MmIEdq8ClksiPh238d/kw0MJ8CU0eYSbZvo4cnTbjMYxy8F1/NzI6ADZg7r0Gc/ylhwzRodOBX4mVWNR8nOUbC513BrUY85LFbNrzlWh+QQ2Yo3EgMGzF1mv4yiEf4KC2fVOT2P2zMiyl7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTI1ORw+HDTb79oCYxn4v5lp6lFBeh7n5ULalkGnEKE=;
 b=fjiq7vzufPHZOBZD5gt+x2rqkjQrbeAQvgDN1VKgVqmO5j90mGe1fLQ4pk/UqfKptjK7Ukc71mUdp/aWWdF/dmNsjigU01/l+f4uR8aJ5OLDV1ZFH77J25pgvLWwXO5SpVkRK5fTLpKe4xtCAmKFxyrJc/Kof/AsLXY6F5aOikXRBI63QS7Ox/AaC4nEPsUwLR9OgvL4RMoAKvMCqYL/Kuy5bi8grLxU2YcezyoF1sFrNTD5UOwIME091pLuULh8gAPuYdFoVMXimYh3VL7ZKnVYN77E/ffZYWEchmWQ8FhWCcJRnGWfpsws7V8cg6yQkul9lhcI2w5RHBFtKXTR3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTI1ORw+HDTb79oCYxn4v5lp6lFBeh7n5ULalkGnEKE=;
 b=dPaOXzEExEF+dYCNHiA8d3CBBhD6x1ePHHDeuUDZum9aJJkPUbZ3uKozqqZNAHOSZuVSufCXPoZLkQppw67VGZTXFv14fX+mVkHFL+b5KW2OHR0e/PVdP8MdWWQER86WyYGhIwSL7nfFSR3SyF5/veUcBGUw3nFaGH0tO4R6XYbKkDpH2VCmK+oUkYKUop9EJ5r7JyYMj9jQ9pfoUqcqARbbKCiXw/HXkefhONw6/chQL89KvA8IXs8JHXQlj/y0AR8OUtI5TVvhcSpnwRC5DHNKO1XVuYk7BfloEP9VMtdseuAdjZEKJW8apg862zeIgpUl3nUMqMgtPG6MjvVDVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 13:41:45 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%5]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 13:41:45 +0000
Message-ID: <0ab75d44-a765-e71a-e9a3-38356b8dfcc9@nvidia.com>
Date: Thu, 26 Jan 2023 15:41:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v8 09/13] vfio/migration: Implement VFIO migration
 protocol v2
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
 <20230116141135.12021-10-avihaih@nvidia.com>
 <20230120160704.0b1ee01c.alex.williamson@redhat.com>
 <927e3f87-95e0-f996-475b-15f506e8f346@nvidia.com>
 <20230125170013.7563c434.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230125170013.7563c434.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: be50277a-1ac5-4d7c-c9c6-08daffa31066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CpNC4ErnFuFMjjB609d4qoD6vrLnAmRTJRCHGDYiWfgiaehKPcalu3MDgQZyGoalt0ruCikQ16WHqiW07sSNI2tu1bzuiqAtNl6DYfpTcc7lqXMNn76dwQ0Y8EXaN1SSPKGXDWt32a8RYpGKnHeRAz3Enk+OMJS8fQdh9iXcsFkDPtIDTQCCSU0s7hCqsQ6stNAuyJxJ7iLFnxVv/EE813E/CHRbQp7qqq2gYd+zm+wGXgnkjcHkD5NQAteXbJmnXYCANW6dm930mpP8A4iFaMKI8YYjCZw+FWtfDdUcT7fPM16kIGU1kOH4JiwynNs06cXx5MUSJB47H0f3FI9t+g/GyBXsFSbRm04zXn/rCgAPSwMbTRWOdDKm8QQiMR0ji2nfTXx2UiVvERxM1X5KSNwSTucGYJJDGqC+9fpcjDwX4V2DGuPZlIT7sY1EQqaws+6uzM31TsX9Ex870ufQtHivt7LvF6R4KLZj3I/MvWEyPMb+17fpdqdYaX8IfzjWRwa+Sroa5kErq5SMTQN/G/D67iG8lBMrqbJlQPoJQpBPHYimwVOoLjaaeoN75cVK8pNtK7l/kvwgM5koFjTvBhnEusDnIT0rkUG0DE++bCn7z1U/OUuMvT4tccALzuk3M/lIzj4Lks1/bfp2g1S/X/FzpZlTHgutEuB/fbxkl6cz5Eft+gq8dmEXXEsVY0L9z4sYHr/h47LuVO94MZ3+aeiHCZfpyK9VZe+9Blewqrrai3DW1mNxY+8BRpe0oaAkzVPqrV1nfZTRaPFhUZ/2Iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199018)(86362001)(38100700002)(31696002)(36756003)(66476007)(41300700001)(5660300002)(4326008)(7416002)(8936002)(8676002)(54906003)(6916009)(316002)(66946007)(30864003)(2906002)(66574015)(2616005)(83380400001)(6486002)(478600001)(966005)(66556008)(53546011)(6666004)(26005)(6512007)(186003)(6506007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S29CekRRSVpFazZ4ZThCQ2h2bEJuWGhqdVJENW5BYUFWNGUwQ0JXM3FIYVpi?=
 =?utf-8?B?K2cwQXBJd0dSVUVGRlBxN1BMZGY5SWFKeXJoTExKbnJ6Y2VjQUw4TWtPRlRT?=
 =?utf-8?B?U0I1SnovSkNFQ2s1WWJzMk9pTFJYSmQra290NHpWWGNMR2VLSi83TXVEZ3pI?=
 =?utf-8?B?SnRHalU3S0gzblVBZnB2U083S2NkNCtFL1FSN2twVGZnT3VzaTBCNVRtOEY5?=
 =?utf-8?B?VlpPZlJJMEttbjBiVzZIWC9rRFMzV2FQOUUva2NsVEVicHp0K3NoWnpJSmpG?=
 =?utf-8?B?Y3hqb1lWa3FtVi9PdlJUVCt2L0hIbDdQUVMxTy9wQVo0Z3BOaGROeGpIR3p2?=
 =?utf-8?B?NkljKzdTVHphejNlZFZZKzJQQkM3NmhRN0VmQmZaS0N4cGJRYjM5enRjQURa?=
 =?utf-8?B?eENIcHRSYzlpUEMwaHZGaks2WmxJQVVnTE13ekZBT0hTSm0yaGRaekx1Ykdr?=
 =?utf-8?B?Smc1Z2I5bTRJZUhKVFdDKzFaL015MU1jWE1RV25HSlZZSk53N3R2Y3FJWTBB?=
 =?utf-8?B?Wmw1bndQYjNraTdrR0xJelN2VG0zeW52UFBkZXNnSEZtajkvUHZic2E5Rmh6?=
 =?utf-8?B?OHJMUThweFlVTllVV2Z6MVA4N3RqZzliUnJqeW9oYVNoR2MybUpVdnQrdTJS?=
 =?utf-8?B?ZkZzK1l6V25ZYTVJL2VkVEI0a2toY1JoNWp0L05hR0kwdERIeG0zaVVyWFVh?=
 =?utf-8?B?ZS82VFZDL0lHN0tUZEM5cjFzdEZOOFJTZmJhd3g2VkNuWGJ6ZkJpbXVjcUNv?=
 =?utf-8?B?OG52KzhqbDJrRzdOTkFJK3c0bS9hZnQ0aHEreGREYUlRd1VyUWJZTDFLR3Y3?=
 =?utf-8?B?bmY5UWJQRUk1VlQxbERZK2VPMmdXclBVTDdsV2wxRnVvR3VHb3BYVU1pUGFa?=
 =?utf-8?B?T25zTFN1ZDFOYWdBYi9vUmowOFFCakJPa3Z4YWtvcjNsN3VnVUQ2RjV5TXpr?=
 =?utf-8?B?Q0xlU3Jzdk1iWGZWVnFJL2puWXQzRUxXOFhTY3pkTlRQMHdSRWdEWEQ3ZDZ5?=
 =?utf-8?B?Ly9OSjk3S2hUMDVGWWVJbnJrSDdBQ0pUYVBmR2R0dmswWmNhKy9FKzdCcHNq?=
 =?utf-8?B?ZEZHMnRIWUVNZTNPb2F0L3JiQnVGck1yWTZleXJVSjV2SU5GajhUYlA0SjVZ?=
 =?utf-8?B?cEVsR0JGS1dENkgwbXFUdkorcitBSlYxQ1djQm1PMkRXaUNXZmFIM2dueEd4?=
 =?utf-8?B?eTFlTE9mY3VJbTdaYkpDdCtVRmNtbGVxZHJxMUpHSVNONVlVd3dsSmRmRUtR?=
 =?utf-8?B?WXRDb2oxMlFUQ1ZacjYyaEtTdGtLSFFtaVRPcHJYT3ZSdVFNTDdjbm5pSnVa?=
 =?utf-8?B?L0xTZU1qdndmMXE5L2tLUnVRUzMyS3BTdFpYNjBSSVZPRDY1WHBNQkl2Z0Nj?=
 =?utf-8?B?Y09xSXJvYXM2VU8xWk9RN2c3U2R0aXFGWDA4L2lmeWhSTjM4Z3M5bWllZ1Ez?=
 =?utf-8?B?NHFoekhWRDlTdVZQVU9RWDVBeS9TbEdlS09NYjM0Zy9CY1lFTlJxZUppRlhS?=
 =?utf-8?B?ZWRmRjZTRmhIL0NBcUxQRWUzbXcyeWNiZ3FTbHFNOXhQUFdhODRYa2ZOeE5S?=
 =?utf-8?B?ajFIVGlxaHpxNDV0SXdsb0l1UnU1SXkvcUx0Tnlsb1ZZTURHanVrVVg5N0xs?=
 =?utf-8?B?TVNsMlVZVW12UE1ZZCtlOE1PN3NtR0tmWnhjSzZVNjVqV3BUSncxa2hDTFlK?=
 =?utf-8?B?MFIyS1hISDlraUdKOENZNlVtTDhhMUh0TGZSVmt1NkxnZjd3Qk83RHQwN3B4?=
 =?utf-8?B?VHM0NlNvMGlFNlhkM0ZObUN3b0x6MzNoY2N0dmFmTW1lYWdyVVJLVXZpVkNZ?=
 =?utf-8?B?WGQ0VDZlOFB1VTdtTVhiOHZEdHNmTVprcUQ4THRBU3l0U0Y3K25ReFJhYVNC?=
 =?utf-8?B?aVhIVndoa1Z6eG0wbWdqZHFsd3dnajNXcHZrUXVyRU52KzdETXFyU09BZ0Qy?=
 =?utf-8?B?RmRRNXFZNEJ5NVJlOG9KVyt5N3dWMG50NUZzQmV3Z0hlRVVWRjRFaCtJbEc4?=
 =?utf-8?B?ZFFDUVp3dmdkUDNRT0tjWDZFS1hJUjdiWE5pd1FSdUNkZTh5VnJIMzlVM0hk?=
 =?utf-8?B?VVgzL2IyeU9pa3Z0TDhtNGN1NnF2VVdZT3U0cHg3c3RNY0NkQ1lNcFkrUFBB?=
 =?utf-8?Q?9yf8fOP+jv73AhqLTYZ6DNCZw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be50277a-1ac5-4d7c-c9c6-08daffa31066
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 13:41:45.0968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqCmhT2im+LquLyLhMpPll4NJ1IMz1Ve3gOIuhhzVy05yjfO9mJmkhNHtsC1DmRpXom6yMOuME7qAQ7lhZVExw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189
Received-SPF: softfail client-ip=40.107.223.63;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


On 26/01/2023 2:00, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Sun, 22 Jan 2023 12:31:33 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> On 21/01/2023 1:07, Alex Williamson wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On Mon, 16 Jan 2023 16:11:31 +0200
>>> Avihai Horon <avihaih@nvidia.com> wrote:
>>>
>>>> Implement the basic mandatory part of VFIO migration protocol v2.
>>>> This includes all functionality that is necessary to support
>>>> VFIO_MIGRATION_STOP_COPY part of the v2 protocol.
>>>>
>>>> The two protocols, v1 and v2, will co-exist and in the following patches
>>>> v1 protocol code will be removed.
>>>>
>>>> There are several main differences between v1 and v2 protocols:
>>>> - VFIO device state is now represented as a finite state machine instead
>>>>     of a bitmap.
>>>>
>>>> - Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
>>>>     ioctl and normal read() and write() instead of the migration region.
>>>>
>>>> - Pre-copy is made optional in v2 protocol. Support for pre-copy will be
>>>>     added later on.
>>>>
>>>> Detailed information about VFIO migration protocol v2 and its difference
>>>> compared to v1 protocol can be found here [1].
>>>>
>>>> [1]
>>>> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
>>>>
>>>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>>>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>>>> ---
>>>>    include/hw/vfio/vfio-common.h |   5 +
>>>>    hw/vfio/common.c              |  19 +-
>>>>    hw/vfio/migration.c           | 455 +++++++++++++++++++++++++++++++---
>>>>    hw/vfio/trace-events          |   7 +
>>>>    4 files changed, 447 insertions(+), 39 deletions(-)
>>>>
>>>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>>>> index bbaf72ba00..6d7d850bfe 100644
>>>> --- a/include/hw/vfio/vfio-common.h
>>>> +++ b/include/hw/vfio/vfio-common.h
>>>> @@ -66,6 +66,11 @@ typedef struct VFIOMigration {
>>>>        int vm_running;
>>>>        Notifier migration_state;
>>>>        uint64_t pending_bytes;
>>>> +    uint32_t device_state;
>>>> +    int data_fd;
>>>> +    void *data_buffer;
>>>> +    size_t data_buffer_size;
>>>> +    bool v2;
>>>>    } VFIOMigration;
>>>>
>>>>    typedef struct VFIOAddressSpace {
>>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>>> index 550b2d7ded..dcaa77d2a8 100644
>>>> --- a/hw/vfio/common.c
>>>> +++ b/hw/vfio/common.c
>>>> @@ -355,10 +355,18 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>>>>                    return false;
>>>>                }
>>>>
>>>> -            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
>>>> +            if (!migration->v2 &&
>>>> +                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
>>>>                    (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING)) {
>>>>                    return false;
>>>>                }
>>>> +
>>>> +            if (migration->v2 &&
>>>> +                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
>>>> +                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
>>>> +                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
>>>> +                return false;
>>>> +            }
>>>>            }
>>>>        }
>>>>        return true;
>>>> @@ -385,7 +393,14 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>>>>                    return false;
>>>>                }
>>>>
>>>> -            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
>>>> +            if (!migration->v2 &&
>>>> +                migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
>>>> +                continue;
>>>> +            }
>>>> +
>>>> +            if (migration->v2 &&
>>>> +                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
>>>> +                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
>>>>                    continue;
>>>>                } else {
>>>>                    return false;
>>>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>>>> index 9df859f4d3..f19ada0f4f 100644
>>>> --- a/hw/vfio/migration.c
>>>> +++ b/hw/vfio/migration.c
>>>> @@ -10,6 +10,7 @@
>>>>    #include "qemu/osdep.h"
>>>>    #include "qemu/main-loop.h"
>>>>    #include "qemu/cutils.h"
>>>> +#include "qemu/units.h"
>>>>    #include <linux/vfio.h>
>>>>    #include <sys/ioctl.h>
>>>>
>>>> @@ -44,8 +45,103 @@
>>>>    #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
>>>>    #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
>>>>
>>>> +/*
>>>> + * This is an arbitrary size based on migration of mlx5 devices, where typically
>>>> + * total device migration size is on the order of 100s of MB. Testing with
>>>> + * larger values, e.g. 128MB and 1GB, did not show a performance improvement.
>>>> + */
>>>> +#define VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE (1 * MiB)
>>>> +
>>>>    static int64_t bytes_transferred;
>>>>
>>>> +static const char *mig_state_to_str(enum vfio_device_mig_state state)
>>>> +{
>>>> +    switch (state) {
>>>> +    case VFIO_DEVICE_STATE_ERROR:
>>>> +        return "ERROR";
>>>> +    case VFIO_DEVICE_STATE_STOP:
>>>> +        return "STOP";
>>>> +    case VFIO_DEVICE_STATE_RUNNING:
>>>> +        return "RUNNING";
>>>> +    case VFIO_DEVICE_STATE_STOP_COPY:
>>>> +        return "STOP_COPY";
>>>> +    case VFIO_DEVICE_STATE_RESUMING:
>>>> +        return "RESUMING";
>>>> +    case VFIO_DEVICE_STATE_RUNNING_P2P:
>>>> +        return "RUNNING_P2P";
>>>> +    default:
>>>> +        return "UNKNOWN STATE";
>>>> +    }
>>>> +}
>>>> +
>>>> +static int vfio_migration_set_state(VFIODevice *vbasedev,
>>>> +                                    enum vfio_device_mig_state new_state,
>>>> +                                    enum vfio_device_mig_state recover_state)
>>>> +{
>>>> +    VFIOMigration *migration = vbasedev->migration;
>>>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>>>> +                              sizeof(struct vfio_device_feature_mig_state),
>>>> +                              sizeof(uint64_t))] = {};
>>>> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
>>>> +    struct vfio_device_feature_mig_state *mig_state =
>>>> +        (struct vfio_device_feature_mig_state *)feature->data;
>>>> +
>>>> +    feature->argsz = sizeof(buf);
>>>> +    feature->flags =
>>>> +        VFIO_DEVICE_FEATURE_SET | VFIO_DEVICE_FEATURE_MIG_DEVICE_STATE;
>>>> +    mig_state->device_state = new_state;
>>>> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>>>> +        /* Try to set the device in some good state */
>>>> +        int err = -errno;
>>>> +
>>>> +        error_report(
>>>> +            "%s: Failed setting device state to %s, err: %s. Setting device in recover state %s",
>>>> +                     vbasedev->name, mig_state_to_str(new_state),
>>>> +                     strerror(errno), mig_state_to_str(recover_state));
>>>> +
>>>> +        mig_state->device_state = recover_state;
>>>> +        if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>>>> +            err = -errno;
>>>> +            error_report(
>>>> +                "%s: Failed setting device in recover state, err: %s. Resetting device",
>>>> +                         vbasedev->name, strerror(errno));
>>>> +
>>>> +            if (ioctl(vbasedev->fd, VFIO_DEVICE_RESET)) {
>>>> +                hw_error("%s: Failed resetting device, err: %s", vbasedev->name,
>>>> +                         strerror(errno));
>>>> +            }
>>>> +
>>>> +            migration->device_state = VFIO_DEVICE_STATE_RUNNING;
>>>> +
>>>> +            return err;
>>>> +        }
>>>> +
>>>> +        migration->device_state = recover_state;
>>>> +
>>>> +        return err;
>>>> +    }
>>>> +
>>>> +    migration->device_state = new_state;
>>>> +    if (mig_state->data_fd != -1) {
>>>> +        if (migration->data_fd != -1) {
>>>> +            /*
>>>> +             * This can happen if the device is asynchronously reset and
>>>> +             * terminates a data transfer.
>>>> +             */
>>>> +            error_report("%s: data_fd out of sync", vbasedev->name);
>>>> +            close(mig_state->data_fd);
>>>> +
>>>> +            return -EBADF;
>>>> +        }
>>>> +
>>>> +        migration->data_fd = mig_state->data_fd;
>>>> +    }
>>>> +
>>>> +    trace_vfio_migration_set_state(vbasedev->name, mig_state_to_str(new_state));
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
>>>>                                      off_t off, bool iswrite)
>>>>    {
>>>> @@ -260,6 +356,18 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
>>>>        return ret;
>>>>    }
>>>>
>>>> +static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>>>> +                            uint64_t data_size)
>>>> +{
>>>> +    VFIOMigration *migration = vbasedev->migration;
>>>> +    int ret;
>>>> +
>>>> +    ret = qemu_file_get_to_fd(f, migration->data_fd, data_size);
>>>> +    trace_vfio_load_state_device_data(vbasedev->name, data_size, ret);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>>    static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>>>>                                   uint64_t data_size)
>>>>    {
>>>> @@ -394,6 +502,14 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>>>>        return qemu_file_get_error(f);
>>>>    }
>>>>
>>>> +static void vfio_migration_cleanup(VFIODevice *vbasedev)
>>>> +{
>>>> +    VFIOMigration *migration = vbasedev->migration;
>>>> +
>>>> +    close(migration->data_fd);
>>>> +    migration->data_fd = -1;
>>>> +}
>>>> +
>>>>    static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
>>>>    {
>>>>        VFIOMigration *migration = vbasedev->migration;
>>>> @@ -403,8 +519,80 @@ static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
>>>>        }
>>>>    }
>>>>
>>>> +static int vfio_query_stop_copy_size(VFIODevice *vbasedev,
>>>> +                                     uint64_t *stop_copy_size)
>>>> +{
>>>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>>>> +                              sizeof(struct vfio_device_feature_mig_data_size),
>>>> +                              sizeof(uint64_t))] = {};
>>>> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
>>>> +    struct vfio_device_feature_mig_data_size *mig_data_size =
>>>> +        (struct vfio_device_feature_mig_data_size *)feature->data;
>>>> +
>>>> +    feature->argsz = sizeof(buf);
>>>> +    feature->flags =
>>>> +        VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIG_DATA_SIZE;
>>>> +
>>>> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>>>> +        return -errno;
>>>> +    }
>>>> +
>>>> +    *stop_copy_size = mig_data_size->stop_copy_length;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error */
>>> Nit, actually returns -errno on error.
>> Oh, right. Will change.
>>
>>>> +static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
>>>> +{
>>>> +    ssize_t data_size;
>>>> +
>>>> +    data_size = read(migration->data_fd, migration->data_buffer,
>>>> +                     migration->data_buffer_size);
>>>> +    if (data_size < 0) {
>>>> +        return -errno;
>>>> +    }
>>>> +    if (data_size == 0) {
>>>> +        return 1;
>>>> +    }
>>>> +
>>>> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
>>>> +    qemu_put_be64(f, data_size);
>>>> +    qemu_put_buffer(f, migration->data_buffer, data_size);
>>>> +    bytes_transferred += data_size;
>>>> +
>>>> +    trace_vfio_save_block(migration->vbasedev->name, data_size);
>>>> +
>>>> +    return qemu_file_get_error(f);
>>>> +}
>>>> +
>>>>    /* ---------------------------------------------------------------------- */
>>>>
>>>> +static int vfio_save_setup(QEMUFile *f, void *opaque)
>>>> +{
>>>> +    VFIODevice *vbasedev = opaque;
>>>> +    VFIOMigration *migration = vbasedev->migration;
>>>> +    uint64_t stop_copy_size = VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE;
>>>> +
>>>> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
>>>> +
>>>> +    vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
>>>> +    migration->data_buffer_size = MIN(VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE,
>>>> +                                      stop_copy_size);
>>>> +    migration->data_buffer = g_try_malloc0(migration->data_buffer_size);
>>>> +    if (!migration->data_buffer) {
>>>> +        error_report("%s: Failed to allocate migration data buffer",
>>>> +                     vbasedev->name);
>>>> +        return -ENOMEM;
>>>> +    }
>>>> +
>>>> +    trace_vfio_save_setup(vbasedev->name, migration->data_buffer_size);
>>>> +
>>>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>>> What's the purpose of including this empty
>>> VFIO_MIG_FLAG_DEV_SETUP_STATE delimiter?  Is this just an opportunity
>>> to insert a fault in the migration data stream?  But if so, isn't it
>>> sufficient that the caller does qemu_file_set_error() on an error
>>> return?
>> Upper migration layer wraps the vfio_save_setup() call with
>> QEMU_VM_SECTION_START and QEMU_VM_SECTION_FOOTER tags.
>> These tags are sent to target and target consumes them and calls
>> vfio_load_state().
>> Therefore, at the very least source must send VFIO_MIG_FLAG_END_OF_STATE
>> in vfio_save_setup() so target vfio_load_state() can consume it and move on.
>>
>> Sending only VFIO_MIG_FLAG_END_OF_STATE in vfio_save_setup() seems kind
>> of odd and incomplete to me, so I tend to leave it as is.
>> What do you think?
> No, I don't think we should send an end-of-state without a start, a
> spurious end could get us out of sync.  The question was more whether
> we need to send the pair at all since the loading side does nothing
> with it.  I think you're suggesting that would trigger errors elsewhere
> or maybe reduce our error handling capabilities if our load function
> got an empty buffer?

Yes.
If we don't send VFIO_MIG_FLAG_DEV_SETUP_STATE and 
VFIO_MIG_FLAG_END_OF_STATE from vfio_save_setup() migration will fail.

>
> Also, should it be concerning that we're implementing the load_setup
> callback, which is called from a code block noted as "Old style".

I don't think so.
Migration documentation [1] says:

"Some devices, such as RAM, Block storage or certain platform devices, 
have large amounts of data that would mean that the CPUs would be paused 
for too long if they were sent in one section. For these devices an 
/iterative/ approach is taken.
The iterative devices generally don’t use VMState macros (although it 
may be possible in some cases) and instead use qemu_put_*/qemu_get_* 
macros to read/write data to the stream. Specialist versions exist for 
high bandwidth IO."

Where "VMState macros" is the "new style".
Documentation also says that an iterative device must provide "A 
|load_state| function used to load sections generated by any of the save 
functions that generate sections.".

So it looks like iterative device such as VFIO can use the "old style", 
just like RAM and block storage do.

[1] 
https://www.qemu.org/docs/master/devel/migration.html#iterative-device-migration

> I'd certainly prefer if this received an API review from the QEMU migration
> experts.
>
>>>> +
>>>> +    return qemu_file_get_error(f);
>>>> +}
>>>> +
>>>>    static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
>>>>    {
>>>>        VFIODevice *vbasedev = opaque;
>>>> @@ -448,6 +636,17 @@ static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
>>>>        return 0;
>>>>    }
>>>>
>>>> +static void vfio_save_cleanup(void *opaque)
>>>> +{
>>>> +    VFIODevice *vbasedev = opaque;
>>>> +    VFIOMigration *migration = vbasedev->migration;
>>>> +
>>>> +    g_free(migration->data_buffer);
>>>> +    migration->data_buffer = NULL;
>>>> +    vfio_migration_cleanup(vbasedev);
>>>> +    trace_vfio_save_cleanup(vbasedev->name);
>>>> +}
>>>> +
>>>>    static void vfio_v1_save_cleanup(void *opaque)
>>>>    {
>>>>        VFIODevice *vbasedev = opaque;
>>>> @@ -456,6 +655,31 @@ static void vfio_v1_save_cleanup(void *opaque)
>>>>        trace_vfio_save_cleanup(vbasedev->name);
>>>>    }
>>>>
>>>> +/*
>>>> + * Migration size of VFIO devices can be as little as a few KBs or as big as
>>>> + * many GBs. This value should be big enough to cover the worst case.
>>>> + */
>>>> +#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
>>>> +static void vfio_save_pending(void *opaque, uint64_t threshold_size,
>>>> +                              uint64_t *res_precopy_only,
>>>> +                              uint64_t *res_compatible,
>>>> +                              uint64_t *res_postcopy_only)
>>>> +{
>>>> +    VFIODevice *vbasedev = opaque;
>>>> +    uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
>>>> +
>>>> +    /*
>>>> +     * If getting pending migration size fails, VFIO_MIG_STOP_COPY_SIZE is
>>>> +     * reported so downtime limit won't be violated.
>>>> +     */
>>>> +    vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
>>>> +    *res_precopy_only += stop_copy_size;
>>>> +
>>>> +    trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
>>>> +                            *res_postcopy_only, *res_compatible,
>>>> +                            stop_copy_size);
>>>> +}
>>>> +
>>>>    static void vfio_v1_save_pending(void *opaque, uint64_t threshold_size,
>>>>                                     uint64_t *res_precopy_only,
>>>>                                     uint64_t *res_compatible,
>>>> @@ -523,6 +747,41 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
>>>>        return 0;
>>>>    }
>>>>
>>>> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>>>> +{
>>>> +    VFIODevice *vbasedev = opaque;
>>>> +    enum vfio_device_mig_state recover_state;
>>>> +    int ret;
>>>> +
>>>> +    /* We reach here with device state STOP only */
>>>> +    recover_state = VFIO_DEVICE_STATE_STOP;
>>>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
>>>> +                                   recover_state);
>>>> +    if (ret) {
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    do {
>>>> +        ret = vfio_save_block(f, vbasedev->migration);
>>>> +        if (ret < 0) {
>>>> +            return ret;
>>>> +        }
>>>> +    } while (!ret);
>>>> +
>>>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>>>> +    ret = qemu_file_get_error(f);
>>>> +    if (ret) {
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    recover_state = VFIO_DEVICE_STATE_ERROR;
>>>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
>>>> +                                   recover_state);
>>>> +    trace_vfio_save_complete_precopy(vbasedev->name, ret);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>>    static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
>>>>    {
>>>>        VFIODevice *vbasedev = opaque;
>>>> @@ -592,6 +851,14 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
>>>>        }
>>>>    }
>>>>
>>>> +static int vfio_load_setup(QEMUFile *f, void *opaque)
>>>> +{
>>>> +    VFIODevice *vbasedev = opaque;
>>>> +
>>>> +    return vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING,
>>>> +                                   vbasedev->migration->device_state);
>>>> +}
>>>> +
>>>>    static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>>>>    {
>>>>        VFIODevice *vbasedev = opaque;
>>>> @@ -619,6 +886,16 @@ static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>>>>        return ret;
>>>>    }
>>>>
>>>> +static int vfio_load_cleanup(void *opaque)
>>>> +{
>>>> +    VFIODevice *vbasedev = opaque;
>>>> +
>>>> +    vfio_migration_cleanup(vbasedev);
>>>> +    trace_vfio_load_cleanup(vbasedev->name);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static int vfio_v1_load_cleanup(void *opaque)
>>>>    {
>>>>        VFIODevice *vbasedev = opaque;
>>>> @@ -661,7 +938,11 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>>>>                uint64_t data_size = qemu_get_be64(f);
>>>>
>>>>                if (data_size) {
>>>> -                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
>>>> +                if (vbasedev->migration->v2) {
>>>> +                    ret = vfio_load_buffer(f, vbasedev, data_size);
>>>> +                } else {
>>>> +                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
>>>> +                }
>>>>                    if (ret < 0) {
>>>>                        return ret;
>>>>                    }
>>>> @@ -682,6 +963,17 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>>>>        return ret;
>>>>    }
>>>>
>>>> +static const SaveVMHandlers savevm_vfio_handlers = {
>>>> +    .save_setup = vfio_save_setup,
>>>> +    .save_cleanup = vfio_save_cleanup,
>>>> +    .save_live_pending = vfio_save_pending,
>>>> +    .save_live_complete_precopy = vfio_save_complete_precopy,
>>>> +    .save_state = vfio_save_state,
>>>> +    .load_setup = vfio_load_setup,
>>>> +    .load_cleanup = vfio_load_cleanup,
>>>> +    .load_state = vfio_load_state,
>>>> +};
>>>> +
>>>>    static SaveVMHandlers savevm_vfio_v1_handlers = {
>>>>        .save_setup = vfio_v1_save_setup,
>>>>        .save_cleanup = vfio_v1_save_cleanup,
>>>> @@ -696,6 +988,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers = {
>>>>
>>>>    /* ---------------------------------------------------------------------- */
>>>>
>>>> +static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>>>> +{
>>>> +    VFIODevice *vbasedev = opaque;
>>>> +    enum vfio_device_mig_state new_state;
>>>> +    int ret;
>>>> +
>>>> +    if (running) {
>>>> +        new_state = VFIO_DEVICE_STATE_RUNNING;
>>>> +    } else {
>>>> +        new_state = VFIO_DEVICE_STATE_STOP;
>>>> +    }
>>>> +
>>>> +    ret = vfio_migration_set_state(vbasedev, new_state,
>>>> +                                   VFIO_DEVICE_STATE_ERROR);
>>>> +    if (ret) {
>>>> +        /*
>>>> +         * Migration should be aborted in this case, but vm_state_notify()
>>>> +         * currently does not support reporting failures.
>>>> +         */
>>>> +        if (migrate_get_current()->to_dst_file) {
>>>> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>>>> +        }
>>>> +    }
>>>> +
>>>> +    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
>>>> +                              mig_state_to_str(new_state));
>>>> +}
>>>> +
>>>>    static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
>>>>    {
>>>>        VFIODevice *vbasedev = opaque;
>>>> @@ -769,12 +1089,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>>>>        case MIGRATION_STATUS_CANCELLED:
>>>>        case MIGRATION_STATUS_FAILED:
>>>>            bytes_transferred = 0;
>>>> -        ret = vfio_migration_v1_set_state(vbasedev,
>>>> -                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
>>>> -                                            VFIO_DEVICE_STATE_V1_RESUMING),
>>>> -                                          VFIO_DEVICE_STATE_V1_RUNNING);
>>>> -        if (ret) {
>>>> -            error_report("%s: Failed to set state RUNNING", vbasedev->name);
>>>> +        if (migration->v2) {
>>>> +            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
>>>> +                                     VFIO_DEVICE_STATE_ERROR);
>>>> +        } else {
>>>> +            ret = vfio_migration_v1_set_state(vbasedev,
>>>> +                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
>>>> +                                                VFIO_DEVICE_STATE_V1_RESUMING),
>>>> +                                              VFIO_DEVICE_STATE_V1_RUNNING);
>>>> +            if (ret) {
>>>> +                error_report("%s: Failed to set state RUNNING", vbasedev->name);
>>>> +            }
>>>>            }
>>>>        }
>>>>    }
>>>> @@ -783,12 +1108,42 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
>>>>    {
>>>>        VFIOMigration *migration = vbasedev->migration;
>>>>
>>>> -    vfio_region_exit(&migration->region);
>>>> -    vfio_region_finalize(&migration->region);
>>>> +    if (!migration->v2) {
>>>> +        vfio_region_exit(&migration->region);
>>>> +        vfio_region_finalize(&migration->region);
>>>> +    }
>>>>        g_free(vbasedev->migration);
>>>>        vbasedev->migration = NULL;
>>>>    }
>>>>
>>>> +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
>>>> +{
>>>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>>>> +                                  sizeof(struct vfio_device_feature_migration),
>>>> +                              sizeof(uint64_t))] = {};
>>>> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
>>>> +    struct vfio_device_feature_migration *mig =
>>>> +        (struct vfio_device_feature_migration *)feature->data;
>>>> +
>>>> +    feature->argsz = sizeof(buf);
>>>> +    feature->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIGRATION;
>>>> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>>>> +        if (errno == ENOTTY) {
>>>> +            error_report("%s: VFIO migration is not supported in kernel",
>>>> +                         vbasedev->name);
>>>> +        } else {
>>>> +            error_report("%s: Failed to query VFIO migration support, err: %s",
>>>> +                         vbasedev->name, strerror(errno));
>>>> +        }
>>> This looks like a future TODO, at some point we'll want migration
>>> enabled by default _as_available_ and it would cause problems to
>>> generate error logs when it's not available.
>> Do you mean we should add a TODO comment? E.g.:
>> /*
>>    * TODO: Currently VFIO migration is disabled by default. In the future, if
>>    * it's changed to be enabled by default as available, generating
>> errors when
>>    * it's not available might cause problems. So, error_report()s should be
>>    * removed.
>>    */
>>
>> Or should we change it now to warn_report(), or to a
>> trace_vfio_migration_query_flags(vbasedev, err) for debugging?
>> So the user will be notified that migration is not supported even before
>> he tries to do migration and fails?
> I don't think we need to do anything now since migration is marked
> experimental and I think we only go down this path when the bool arg is
> turned on.  It's arguably correct that we should generate error
> messages and even fail the device initialization if we're asked to
> enable migration and we can't.
>
> But if we're looking at supportable migration, we had a previous
> discussion that there wouldn't be a device option to enable it.  It
> should automatically be enabled when supported by the device and device
> initialization should only fail if the device lacks migration support
> if the -only-migratable flag is set.  Along with that, lack of support
> for migration by a device is not a condition that should generate any
> errors messages unless via the -only-migratable option.  Therefore
> eventually we can't have that error_report on -ENOTTY for the migration
> feature.

OK, so let's leave the error_report as is and when VFIO migration is 
changed to be non-experimental we can also remove the ENOTTY error_report.

>
> A trace is unlikely to help a user that wants to check migration
> support before they attempt it.  AIUI, there's a mechanism to query
> whether the VM is migratable, ie. whether there are any registered
> migration blockers, and libvirt will check this before attempting a
> migration.

I understand.

Thanks.


