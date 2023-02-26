Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2287B6A330A
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 18:03:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWKOu-000557-15; Sun, 26 Feb 2023 12:01:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pWKOe-0004vV-7R
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 12:01:21 -0500
Received: from mail-bn8nam11on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::601]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pWKOa-0000zY-3c
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 12:01:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSMDety20FYsDo1HexWHC8XnHriHcwrtlNw0p2lyRAFTo1DqooTQupdeYnXqES1cMSjf994M+BYLRx6MPRUZcdbuf6J5Yc46eZofd+ODZwFrAkclKcQL5LiLQoUjRTwCig6IVOm8IDj5FgV1/Owz1lE7Kh/UStgA06yon/yWpTF/VF4rdx9LT1U6oizrB0eJ2dMbv6MrbIbkbF7g96ksycvHPUorpcbmBa6ZBRApsbIt+aWje/BvIM44P++R4EXhMi8NrZcdMjcuYtRW8o1UJm9bA388AieD22fwHSph35L2IMCV9Nb0Xq0Y4XYk2OPRa1pHIOZcvjvkXPcOBfjXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rR7lOgp43gnqMG7DfgUY4+OLHCM9BPrNb0NvI/gl2eA=;
 b=d5gmMnV4b6a8wtbahdurDLBaSZiEVcL0+JtlZmMPwCGEUtIRd+iNCVuR4meUA8apwb8hDPw5hitSQjfOQabVDaM6IgpLGwZtBx7VHDOpWMlErJcQMfq65k/nyvCNknVIxgbePmWLTYMeGIYKi2tzRXFE4Em8mCVgjDxoM3ZQBGENZ0nJkU/Swrn6fAz+KZNWkL0qNLQdiH/NybPhMZExDM2H4uBa8Lh9J4sH+G9t2d/rFFAuKxr5FKCRJUfNvfgDT3/BH+2kzRolPBt6bTRiEJoWbBE5NelFX7vE6BHIc5qSLjSicQ5dP8cuMNsrNltKTZmU+eKnH80Mi/9yDW+dfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rR7lOgp43gnqMG7DfgUY4+OLHCM9BPrNb0NvI/gl2eA=;
 b=Fn3PklOSxIAjZSK606IAOyOUHsi1k6h07N3siPnO2WlYmn0KXkDOgTLATKnDoSqn0Wo4wCrbFry58M0ZD+tYavGMP9qYoe7CNreRBGX/rG66lWUNS4wz8B6wJK0sHs5YybvyE9IYvp4ip+Yr6Mr0BbgGqQ80yjQ1L3HRE3qNED9rR5Fp2j6DhDkiuZvu+xB4vPq4DvLrdTnFdz2vCl8hBmbB+hWSecgkfB0Wevcxg8IN8BUxwvLZ7i7jH+Yc5WnSUKJobTpw0C2Fh0ibR7uzdbIw5bbnTLQPjeOIKt+EohmlrbCl8IbRdpb2akbVTZYRa3hLkH2fpapI8zcNAahkGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by PH8PR12MB6889.namprd12.prod.outlook.com (2603:10b6:510:1c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Sun, 26 Feb
 2023 17:01:03 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb%3]) with mapi id 15.20.6134.025; Sun, 26 Feb 2023
 17:01:03 +0000
Message-ID: <6a42ff0d-5400-f3ef-8316-3a1233c096d3@nvidia.com>
Date: Sun, 26 Feb 2023 19:00:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/20] vfio: Add migration pre-copy support and device
 dirty tracking
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222135512.51b62650.alex.williamson@redhat.com>
 <79b05864-3feb-8e3c-ab03-7c656027741c@nvidia.com>
 <7db50fd1-014e-6ee1-b224-5677a98093ce@oracle.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <7db50fd1-014e-6ee1-b224-5677a98093ce@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0515.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::7) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|PH8PR12MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4a3c20-9ff6-45f3-f1e6-08db181b0ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2QtDEfpbX+JGyKTs8nW032WA6OyOJYpjRHOmFAWTJLsr0ggpsZzwijmiFcbRvVi1/vPwOnQjaXSPjg5f0xaBKRYt//nCnWvtwVG0f+aaHU55189/sW+qUqLo2eCwKdJfK+a11l2JjCFHNwbYcND1HlpTyzo4VmoSqw85d+6VgFeWl+vkFi5LZ8iTplPKXJY7P8tMueENsNUSqUSknKAFsmw9AtmSNISjuhXeIzsnK92AUFM47t2T5KTamEMhzEGoxpsi3Cc00LxUdYF7X6k7TRkRj3qRYgQfswBWNtSadRIN0rioyP4LQ30uoGjeQL/FLpESIQTS2h048Ib/ksb6kCmG/UWVLRB92779orAEaF2xHESJaeGG7Vbbe1WzezfMT02mQUK5zBuci8xO6pHxTKdJ1ZQEWPLCd6zgKWPrru0rlC7XVT2UegXmVZJXoZtJso3i1oMScfNMGU8Tuf1CTLO++AaQmNsoXLIFSCvivm1FjI0WEKov9EmItyTNpcVsjUSZ+mLjMepf/aJShJqwjnerPOH734Hc+jnKIYzgQNsFtQdiF+JhXUfiazMh2RByYCURvSgWI3FaovO6MThgcYCNH2VuJ2HRNx1dSOFEYMm/6MbEEFCMIKwSWURcsXf4Lh8Fq0vC0f24zugVFuI79xcPguEZT8qWs/pgz/Dcd9hcLi98l1FvzCXseBy6FjkITlyKZWOpLymer7I3HA1FG4nGaDuML6oB+YmuTsWK4PTLSLt3DSeeefFB3sb0g0DmNi2nk5XXnt9fe0aLiNsLvsktHI1wGriF3zU5UsEIJ8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(451199018)(54906003)(110136005)(8936002)(316002)(8676002)(6512007)(36756003)(26005)(186003)(53546011)(478600001)(31696002)(86362001)(966005)(6486002)(107886003)(6666004)(6506007)(2906002)(2616005)(38100700002)(5660300002)(7416002)(4326008)(66556008)(66946007)(66476007)(83380400001)(31686004)(41300700001)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHZCYmF3NC9YekQwaUhMVUF1dXdKdDVqTFlIWXZKUjMwMEFiNUdCYjdPUzU1?=
 =?utf-8?B?dWtTeHZIUmlLWW9ITnpuOFk3NHlJOGRuKzZMSFFHOHlUOWJLZ1krZ2pzSWJO?=
 =?utf-8?B?Qnppd2lYdFpjKytGSVdGazlKNTdyL0VhWFdKaHhqY1FaVEc4SGxRN0JzWnRx?=
 =?utf-8?B?Q0VyMzF0RERKUW9mS2JYTjVna0NIRVlkenYyWmxtekVsS3RqNGNjblVwaytP?=
 =?utf-8?B?NXV6RHVCWkpPMzg1TTB0Mm9lUzVuNS8zOHg3Ukh0eVBDNzZUbDVvT3lFVlRQ?=
 =?utf-8?B?Y1NpV29xZXV2eGhNWFZ5MzdreElTcFQ1aWdyS0MxdjFNYVJjM0hYOEJNL05P?=
 =?utf-8?B?NVpTQ0tidjRuR3FaMHVlT05GSjNsUDVOcndPWmJCcmdXTUhOUlB0NWFxWFQ4?=
 =?utf-8?B?cStoVVF6WjVZdWthajBXZE5xeDR5dTBoSGtiR2srRkJoWGQ5RjRVNVo4S1l5?=
 =?utf-8?B?d25mNFd0YTJWVG1jMGlKQkx2TUpOWHhGVVVRTjdjVFV2NHZBR0M4UHVpNDZj?=
 =?utf-8?B?SUJRb2VkbS9vM0tlazhHMU9SZGx5N1BsZmRQckdIUXF2UGk5Q0pLS1JvUkox?=
 =?utf-8?B?cDhWaWZTQlFBZDdndXd6bXlGaityWlEwRVRaYVBwUm5sOXpwb0kxT2xnRTNL?=
 =?utf-8?B?cHpNY0FXcVpOK2ZlM0ZBVG9HaUpGRHcwdTNDMmZjbE55d3did1pkOGJPVHFz?=
 =?utf-8?B?TVU4YVJtOHJHdFpMZG12UEpLUGZYUlk1REhidzVjWUJPTVVHVHV0UmlUTWVt?=
 =?utf-8?B?YkoxTW9IZktpY1oveFdkLzBacktxOHNTeHZNU3QvbVFXLytxQ0F2cjl3bUhz?=
 =?utf-8?B?ZjBBWklML2prUmxLUzFISkZuVk1wMmpMK1FZSWh0SVdVV2lMSG5nbGVCdFlx?=
 =?utf-8?B?RUZ2OC9uRGtCU1NDOXVvODNnQWI1d2NRaDVUaE16YTl6RDMybW1Ea3YwdW9N?=
 =?utf-8?B?V3RodkNXRGNRblMrYzM2TEhIZURxY3AvaTRqbmorOGRpaE5uTWFIMzZZSW93?=
 =?utf-8?B?bURESXZJWGZmbVNNekxhRExNSGFHcjNLYU02M3IvTU1QYU12azdldW1HSU1R?=
 =?utf-8?B?a0tuQ0VMbTlack1XNnEzRk1EUnRza2hkNXlnYnZSdmpES3E3SHRHSmo5WWxT?=
 =?utf-8?B?Umw2RWUvLzdpRFV5dmlvKzlEOU1YVGJhSHJ2b0I4d0pldmNXYmhGYksyZ0Fy?=
 =?utf-8?B?YnpxOE1zY3UwVmp6TUV6NUc4a2pBUHRoT3IzWm04ZkRHSExNR2piRGtSRnUv?=
 =?utf-8?B?M0M0SnFRMVdpbk5rOE4xZ2ltTm4rTVdOTGthaUN4RFZmRXNVVlJGZ1lVU010?=
 =?utf-8?B?NnZ0dmxZcEFIZGpJVlVpQ3J5akJwWTdJalRnZ0hNWGUrUTkwdzRiQkEwa01r?=
 =?utf-8?B?OWhvMm90UGYyUHhreFBhd2F5UmRZT2tKdTQ2aERSd2xRejd5bzY0WUlRQVdp?=
 =?utf-8?B?NmRsczdOSEpueUZMREZ2Y09zdFd2bXFGaVNoMjIwcWdQQnFaZzJVM0JUb1ZL?=
 =?utf-8?B?N0dsNVowNS83cVpEOVFTVGFNUnlnc1FiTlQyTW9NREVYd3NSYWY4cDJwQll3?=
 =?utf-8?B?d0NaRUNmaUZYcm8vMW5zazBBZU85cXEwbWJ2YTZMVkhaeUM2MXlyRjJVcjAy?=
 =?utf-8?B?WDhtQU1WQkJ4aVdsRTZpazZiZzBjZCtOaDl3QjFwR1p0bk83WnpxSmtMY1RR?=
 =?utf-8?B?elkzN21rNS93anByd0xyL0tPRU1rK01xU3hHOGNsQ1Q3MFVacVM0cFdzd0hE?=
 =?utf-8?B?czBxY0l2MFAyYyswTy9vU1psOHV2d3JhaHUzMEZiWW9RcHJIUER2emhCb0lP?=
 =?utf-8?B?T0tBUnhEZURsc25yMm1vWnltWDBIL2lCL1h3QlRYZElrY0ZiRGdQUDFkL0dX?=
 =?utf-8?B?b2djelY1S25XSGtUWk1wUVIwOExyMis5MEw4dHRFTDRQa3l2N0Qzd2NBeHpz?=
 =?utf-8?B?VXVaODBjL0dnV1d1N2ZxSjB2dWFnVUx5alRNOHU4SFBGOGxOZVR5STRYWmx3?=
 =?utf-8?B?cE1mWlArandtZnVaWjg2UUtUbVR6Wk9wMCtxWVRXYWpoeW4rODI5R1dmdkVo?=
 =?utf-8?B?ZUlQRldZOWtQdDNHZVFRaGJrcWo3QU11SEJyOTM4WUhJTElrL3hsRVlUVnNH?=
 =?utf-8?Q?smhsSq6ndJ/Sp+p2Lu/U7uahW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4a3c20-9ff6-45f3-f1e6-08db181b0ab8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2023 17:01:02.8320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfm3NdXo1YoaXGwq4clN+qIlv+zV43zG6zUlaW9MR5IolhfUO2PaHkxBvfZol31jKKAOl0i4lYn7UCTRIYcJ4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6889
Received-SPF: softfail client-ip=2a01:111:f400:7eae::601;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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


On 24/02/2023 21:26, Joao Martins wrote:
> External email: Use caution opening links or attachments
>
>
> On 23/02/2023 14:56, Avihai Horon wrote:
>> On 22/02/2023 22:55, Alex Williamson wrote:
>>> There are various errors running this through the CI on gitlab.
>>>
>>> This one seems bogus but needs to be resolved regardless:
>>>
>>> https://gitlab.com/alex.williamson/qemu/-/jobs/3817940731
>>> FAILED: libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o
>>> 2786s390x-linux-gnu-gcc -m64 -Ilibqemu-aarch64-softmmu.fa.p -I. -I..
>>> -Itarget/arm -I../target/arm -Iqapi -Itrace -Iui -Iui/shader
>>> -I/usr/include/pixman-1 -I/usr/include/capstone -I/usr/include/glib-2.0
>>> -I/usr/lib/s390x-linux-gnu/glib-2.0/include -fdiagnostics-color=auto -Wall
>>> -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem
>>> /builds/alex.williamson/qemu/linux-headers -isystem linux-headers -iquote .
>>> -iquote /builds/alex.williamson/qemu -iquote
>>> /builds/alex.williamson/qemu/include -iquote
>>> /builds/alex.williamson/qemu/tcg/s390x -pthread -U_FORTIFY_SOURCE
>>> -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
>>> -fno-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings
>>> -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls
>>> -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security
>>> -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
>>> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
>>> -Wmissing-format-attribute -Wno-missing-include-dirs -Wno-shift-negative-value
>>> -Wno-psabi -fstack-protector-strong -fPIE -isystem../linux-headers
>>> -isystemlinux-headers -DNEED_CPU_H
>>> '-DCONFIG_TARGET="aarch64-softmmu-config-target.h"'
>>> '-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ
>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -MF
>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o.d -o
>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -c ../hw/vfio/common.c
>>> 2787../hw/vfio/common.c: In function ‘vfio_listener_log_global_start’:
>>> 2788../hw/vfio/common.c:1772:8: error: ‘ret’ may be used uninitialized in this
>>> function [-Werror=maybe-uninitialized]
>>> 2789 1772 |     if (ret) {
>>> 2790      |        ^
>>>
>>> 32-bit builds have some actual errors though:
>>>
>>> https://gitlab.com/alex.williamson/qemu/-/jobs/3817940719
>>> FAILED: libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o
>>> 2601cc -m32 -Ilibqemu-aarch64-softmmu.fa.p -I. -I.. -Itarget/arm
>>> -I../target/arm -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/pixman-1
>>> -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/sysprof-4
>>> -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
>>> -isystem /builds/alex.williamson/qemu/linux-headers -isystem linux-headers
>>> -iquote . -iquote /builds/alex.williamson/qemu -iquote
>>> /builds/alex.williamson/qemu/include -iquote
>>> /builds/alex.williamson/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE
>>> -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
>>> -fno-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings
>>> -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls
>>> -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security
>>> -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
>>> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
>>> -Wmissing-format-attribute -Wno-missing-include-dirs -Wno-shift-negative-value
>>> -Wno-psabi -fstack-protector-strong -fPIE -isystem../linux-headers
>>> -isystemlinux-headers -DNEED_CPU_H
>>> '-DCONFIG_TARGET="aarch64-softmmu-config-target.h"'
>>> '-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ
>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -MF
>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o.d -o
>>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -c ../hw/vfio/common.c
>>> 2602../hw/vfio/common.c: In function
>>> 'vfio_device_feature_dma_logging_start_create':
>>> 2603../hw/vfio/common.c:1572:27: error: cast from pointer to integer of
>>> different size [-Werror=pointer-to-int-cast]
>>> 2604 1572 |         control->ranges = (uint64_t)ranges;
>>> 2605      |                           ^
>>> 2606../hw/vfio/common.c:1596:23: error: cast from pointer to integer of
>>> different size [-Werror=pointer-to-int-cast]
>>> 2607 1596 |     control->ranges = (uint64_t)ranges;
>>> 2608      |                       ^
>>> 2609../hw/vfio/common.c: In function
>>> 'vfio_device_feature_dma_logging_start_destroy':
>>> 2610../hw/vfio/common.c:1620:9: error: cast to pointer from integer of
>>> different size [-Werror=int-to-pointer-cast]
>>> 2611 1620 |         (struct vfio_device_feature_dma_logging_range
>>> *)control->ranges;
>>> 2612      |         ^
>>> 2613../hw/vfio/common.c: In function 'vfio_device_dma_logging_report':
>>> 2614../hw/vfio/common.c:1810:22: error: cast from pointer to integer of
>>> different size [-Werror=pointer-to-int-cast]
>>> 2615 1810 |     report->bitmap = (uint64_t)bitmap;
>>> 2616      |                      ^
>> Sure, I will fix these errors.
> Just a thought: should the pre-copy series be moved towards the end of this
> series, given that it's more of an improvement of downtime than a must-have like
> dirty tracking?

Given recent discussion, maybe it would be better to split this series 
and go one step at a time:
Start with basic support for device dirty tracking (without vIOMMU 
support), then add pre-copy and then add vIOMMU support to device dirty 
tracking.

Thanks.


