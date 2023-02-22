Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B847169FAAB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 19:01:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtPt-0007Sr-54; Wed, 22 Feb 2023 13:00:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtPo-0007SV-GC
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 13:00:28 -0500
Received: from mail-co1nam11on20625.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::625]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtPm-0008IH-DT
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 13:00:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TH4w8uvwSZHWdaX3ksZnh9w+FZHuauFsjQ/BwEXmd/T0EIL27CMCZR8jyhWkPFv/8La+a5zbwZI80zOCONo08k3P4N6sKzdW/1vggOGx3NNnRWPiDYj+TyjX5jNi14Fj0StQouTbvULdU0syoHoetjBivQReBSiIXNrd/loV3lXoqb2YL7ynyoMMhZIheoqYX0B6x3tdYhMzWM4BpaA2t9dZVArztZquUT84MkC0CmN6imb8c4Wm+VVHnTbzQXBU+ODn7vDxxc7B+PqpT7ypidddXLq0Q+4ZM2h1bV0igbgazoE3Zw/YbMahNesra85FIhV2VR9eobnznmxSWqI5FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1U+gwMPIyARNEagtjN7b2mOJmBEeFi1KnPT4+Uo7Ikw=;
 b=cgKVT5gWGVjCvYsPGlgeHi3KdYoaJq37f7sVFueKTKo6vJbVLAWsGf2W7dy9HoZ4R6Aq2HGdxrA+JPGwdfzvsCeNw4z3RT3LnAswQRAjOZBE9wxTqeRUrIt47jmFQsbhMHkDHRDiyh1/5Is/6iekQc951uFxavXFkmX+VF2zNTt9E8KHIZIWN6ab+dP7TbsdwkWY6G3cMZnSznFhaet1CSCHZhmZq664aS+uTJ1J+UmfcXsaDut8PX3+GzPC8+tXYsDGRnv0QggNg7V+KbTC5aQXvQvpmgo55XDOxZWGFWmopX3H63YQJXI/sMzEY556UZCPlIN7m8gb/BcwvNZ0CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1U+gwMPIyARNEagtjN7b2mOJmBEeFi1KnPT4+Uo7Ikw=;
 b=INg78UpH2QygMDrCNtj1vomMs7+jggI90ZzMe78DkOazlyI/kducnC/aydqXRnIzw+vgxwKrJTWPBdBwg4gDS2w58G7kBeusWcWTteyUv8CostmFiD8O9gEPAfSScFVG/c/cPlNZJWPRB3EcENxJtiNHYH9AWzV0nZDUJMGzCsznGqBqhW4kb1l2hH86CgGWsUIUp9o8JWunamnVJO7FWQXH1ewA9H4vSeeVkMUXxRXyn4in+AkPjgzBqdAg2uZveHuoWa/Os9znRH/PIl82ErjAO0SET68rYeUa94xX+fEvSEyx+S/WZ4m2HnP96nnTGGTPnZKNEOm3bJLVuO5fmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MW4PR12MB6802.namprd12.prod.outlook.com (2603:10b6:303:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Wed, 22 Feb
 2023 18:00:22 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb%3]) with mapi id 15.20.6111.021; Wed, 22 Feb 2023
 18:00:21 +0000
Message-ID: <952f3239-1a9c-81b0-d536-a0dee723a902@nvidia.com>
Date: Wed, 22 Feb 2023 20:00:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 00/20] vfio: Add migration pre-copy support and device
 dirty tracking
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
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
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
Content-Language: en-US
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0136.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::15) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|MW4PR12MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 7429e9e7-4cff-494c-5894-08db14feaa4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FH+McInSNVwFfTGnzxA03mcny/7WQ0uBHlVJoRtAgEIyx4bOzFqTnU8YjHRespvEAi4LSM2rimoMMD+49z3uRW9+Q3miYIPJeCJxdOK41CgyJZDbxHjfQi+4UvHuHX8DcrwurnN9KwK/lvbKE0enULumg/rDDxnvRV2apXj86zhnxfZ+pRq2IgvLNuN9MaNCbBRoTP3wDHYjXo5K/Pbp20Do39yBO+9lemFzl0HziMQAi4Cl8Paf89R1oWyxHkAj7ZxxSydS8gias1qx0Rmzv2U2l2cE+5LV5W+gP+HV6vIzmKrlwLEjIuGDQGSGpi7CUL3oZcM4nyqv3mz2iv2V/kkPTjR5fPyeRZPHs01MszyDBNLiRmo4qwzkw6klJ1vAoQFqeNt4ZA3ZZkMZEpeJvZJOxESYW7SfOTDprEfrurUY292xNt/tWobn7y/yRbyilD6+Dn/FUEqfcJZdXYCZHc/pRscoF/qOHRQWFruXy5ESmleGV9mKFg2RNjsrm+jRp2/0POgsuzhJR0JJRBV41asTAIKtNB8TnRlQyJIrOI8HNwG12kjqkScUW4kq4q7QCQEbbec+GmoGiRy7BK/bu0cnfbtLIFhuRTQXnTxabSAqUBAOFXJHhlXQdVEyMhNjIPrIrGMm5eyLQqYA57twQlIlzplrL+Ey+AbMzDkc8zjbuIzmnl16o12F87rTSYdSLrlnRBg9msVNPDsEJZ/0I9YULIFHQrUF/5DIx09WEz9Qltd4JjaDGexDOh/HkraWgkzDBFKbaZAFctKB2Q9MeGHwiyrKI5bzMf76kIk9IU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199018)(86362001)(36756003)(38100700002)(31696002)(478600001)(6506007)(8676002)(186003)(53546011)(966005)(316002)(6486002)(2616005)(6512007)(4326008)(26005)(66556008)(41300700001)(54906003)(66946007)(66476007)(8936002)(7416002)(2906002)(6666004)(6916009)(83380400001)(31686004)(5660300002)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzY5Sll4TWxOUkRrcGFCbHloeURNSm9GcHZXMGhUOGdLa1NTa0Z4MDdQR1Z1?=
 =?utf-8?B?SFl5aDQxYzN4U2Ewa2xVRmYxRDBRaHZFUVhDUDdRNGpSVW91M3dJQk4ybU8z?=
 =?utf-8?B?TGl4a1lLZ254VVVOSUFteXNCQTZaV0VwL3NNMkwxQk1HeGN1aTgwSk9NeXRL?=
 =?utf-8?B?OUZkazRCaHFtNXRBcWpNOGhRaUpuSW9TYkh0WkVIUWZiUVJZcytBVHJHUjkv?=
 =?utf-8?B?Y2xyOGpZMHpiejZyWlliaUczbm9oVjNuT3ZVV2IvN2R5cG8ydmlRVG9xMHVB?=
 =?utf-8?B?MklUR1BBTHM5OWZuVG5OM0pVMkxsdnpyM1ZmK1U4cUV1SEJHTE44YVpjZXl2?=
 =?utf-8?B?QlVUajJDSXcxbHNuaTVFZmJIeGtBT1FHaFNzaER6Q1V0cm9YQTBMd1UzSWZw?=
 =?utf-8?B?ZlArVU5USGtpYUNoVDFJdWx5UktXNGxuc3JiUEVhNEl4Z09vUHMxVWlHZitL?=
 =?utf-8?B?NzJxQTNZMS9QOWFuczdMamJoUVJ6N0Y1Z3RoOGxlNHFKQnB5ZGJPVWtuZ09T?=
 =?utf-8?B?bXNhRnRucFBZdVUvL0dTOVE3VEpkeXBNU2Z3R0puVGpteTh5YWJ6d2I5UTJo?=
 =?utf-8?B?QVlEb3NuRHdFb1pIZm14VWVZMHRML1djWHlFdlFvcUlnNEtqaGpxMTh0ZXZU?=
 =?utf-8?B?bWlCRTRFOEFzNjhHMWdkc29qUlM1aWE4N0ZocWYzWnZXeFNwVFE4U1VZNFBz?=
 =?utf-8?B?TXVobkxUd01EYUZtTjN4VTArbmR3eTBkT2VqclFMSEp4VllnT3lpbUNvRGJ0?=
 =?utf-8?B?N3dEb0hLWjVEdldUbVE5QU5NMll3bDBQalpzMjdNcW4wNDNLWXlGekR4TUt1?=
 =?utf-8?B?UUIxVmlaNFYyQ2pwd2VMTHpOdWtvWUdmdHZNU1Q4RFd1N21ieTYwSlh6ZlJp?=
 =?utf-8?B?djVvSk5lVFY3MjRCdDQ0SlBtb3NnRnV6L3J6RFNwdno0Q3RuWndHbzBRZjZP?=
 =?utf-8?B?VzZwdlVQb2lmYWdDQzNOSXcxNTcxM2pzU3gzalRNWG9iR1h6bUdNMkNGdWFh?=
 =?utf-8?B?MjBwd1hGMVBudXJIMkgxeWF4V3BDbEwzY2hveFAxSmQyeFZaaUxSSWo3UXpM?=
 =?utf-8?B?NDd2U2dVbUdhZHIwK3BXZHZmSDZsMnVUaVE2eGs0bUwvbzNuaVZrRFRoMndp?=
 =?utf-8?B?Q1ZrTUtCbStGVzlLTEIza3NneHZNTTdOcVZpRlZ4d1NnTHFYa0tuN2YySlEy?=
 =?utf-8?B?d3pXRGg1aUhaaGpJT3lsaUwyV0tPdjJKVTQ1WEtadG80RGUzZ1BOUEU5Z2xO?=
 =?utf-8?B?MWVMUlZ5TEFUU3ljdmtzNnlVUW1hWmVFbkx4dURqUjFmZFU4ZU9SSm5xdXVZ?=
 =?utf-8?B?ZEplbHgvQ2x0ck8vcmsxSWtOZEZzdVNLK1lEbjJ3VlNrR25oMXhQS00wR2dR?=
 =?utf-8?B?czRxd3paMWh0UzUwcThvdFVkb05zNjVEMVo2dEcvL2tWNlZHMTN1WWhobGU2?=
 =?utf-8?B?YjJSTEhXVEQ4N0NTSXVOSFN5VUQ1K1NUK2JjT2tSdkpZYXZpb25xcjNrdE9P?=
 =?utf-8?B?RGdCWjNrMjN6c2haa0FROVkvL3F6ak9rSUw2NVU1RnVzZm80NGV5aHVKZm9z?=
 =?utf-8?B?MWpCR0srazY5b2JYWmdudTVQNnJ6S0lQd3VvNXRaZVNFWXBjcnRqdWYxZEwv?=
 =?utf-8?B?b1Q4anY4NnVPZWZ2SzdCL1N5Z0NCK1ZTME03NjN4Rm9jMU1rc014TWhrZ2dM?=
 =?utf-8?B?anUyT0JReGFBbFVKRW9RNlF0RGpHRTMrQ2NWOEk4YTQydUVkdTNXUVo0THp0?=
 =?utf-8?B?aHZuRnB6elhobXZYUzgrMGV0M1JRd05CRGFCMVhBUFdCSEV1eVhBWCtqUTFD?=
 =?utf-8?B?NGpFZmFlTzUzNVhRanQ2NFE1RFlzT3RMVVZ3SVYvYjlzNW5MMFZUQ3FuVVd0?=
 =?utf-8?B?ZDJLc1daMlJOZDhxRFpkMUF0VktaMUtqaVltaHdmNUh2WTMrTWNSRXdTbEps?=
 =?utf-8?B?a256S0hGYXgvc2xGdUJ5SC9telBsRE9nbXhFMWlnUnZzaGFaZVMwSTVuaXF4?=
 =?utf-8?B?U2xmTXlSeHBsVURZS003NEQxMEN4aWwrdFc0dTJsM1pzdTdzRWZQYU5CSDJn?=
 =?utf-8?B?ZE5Tc1NCRFBwQ2t6cUMvenNnTXIwaTFhR0xqNGlLYys0ZG9HZTNwbUJ5UFZP?=
 =?utf-8?Q?/3XeLP2Taxk1Q7cgC41toYgbb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7429e9e7-4cff-494c-5894-08db14feaa4a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 18:00:21.8210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0R6UmJU9hHVNvXi/s1tKYh1azEq2ie8avzJUN1OHXK9th873RlCgkkryKOlmBTMuaIrzwrkf5Ydajed7HQMUJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6802
Received-SPF: softfail client-ip=2a01:111:f400:7eab::625;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.102, SPF_HELO_PASS=-0.001,
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


On 22/02/2023 19:48, Avihai Horon wrote:
> Changes from v1 [4]:
> - Rebased on latest master branch. As part of it, made some changes in
>    pre-copy to adjust it to Juan's new patches:
>    1. Added a new patch that passes threshold_size parameter to
>       .state_pending_{estimate,exact}() handlers.
>    2. Added a new patch that refactors vfio_save_block().
>    3. Changed the pre-copy patch to cache and report pending pre-copy
>       size in the .state_pending_estimate() handler.
> - Removed unnecessary P2P code. This should be added later on when P2P
>    support is added. (Alex)
> - Moved the dirty sync to be after the DMA unmap in vfio_dma_unmap()
>    (patch #11). (Alex)
> - Stored vfio_devices_all_device_dirty_tracking()'s value in a local
>    variable in vfio_get_dirty_bitmap() so it can be re-used (patch #11).
> - Refactored the viommu device dirty tracking ranges creation code to
>    make it clearer (patch #15).
> - Changed overflow check in vfio_iommu_range_is_device_tracked() to
>    emphasize that we specifically check for 2^64 wrap around (patch #15).
> - Added R-bs / Acks.
>
> Thanks.
>
> [1]
> https://lore.kernel.org/qemu-devel/167658846945.932837.1420176491103357684.stgit@omen/
>
> [2]
> https://lore.kernel.org/kvm/20221206083438.37807-3-yishaih@nvidia.com/
>
> [3]
> https://lore.kernel.org/netdev/20220908183448.195262-4-yishaih@nvidia.com/

and here is v1 link:
[4]
https://lore.kernel.org/qemu-devel/20230126184948.10478-1-avihaih@nvidia.com/

Thanks.


