Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B430C532ECA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:18:27 +0200 (CEST)
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntXEo-0007C4-R4
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ntWZv-0006fh-F0
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:36:14 -0400
Received: from mail-dm6nam11on20620.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::620]:32875
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ntWZs-0004KC-8Y
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:36:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtQEsFSBn1A8sTMdlI+CkThd6qPXzYUJ83BuS01w92icjI26eO/qci4WpWGQ9Hrm2Y4+dkwUStT3v7Nld0db5jjwMgMchJzMKw2jhwcyz1MCCv7UktA3xwLzJUxiPhCnX0yRRoijoBlPsvap2CPXedr3uQhAMYlkd8aubhIy1c9O3t2O73+1f+7gLitj+H64e4gjzy2BjZdvpZQIrB5uTgNVWG1/qfLsIDvoNFAHQVtNGItarzA5dE2gB8edt682fb5oDcJE+q9X+Z4cLsufyDsrQMzYbmSt2FRNbvEnvagI9V2YX0kujaXR65WHoIJ5QKDWoSLRR0RKnMsuiKj//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGgGTJQBZA3vBhzergTiqoLXQCF3eYCAyeCDsiaJ42Y=;
 b=hRvW7achIh22E0dv2xV1nE/D/MHqTKjm1lF36mzbG+dQqX79EJVygUWZ5KbNMfPMo32M+4qOyhJV7/sqB/2jtvCtyfgoPgiJxb9AdcOed4KFgMNrUPo4ntZxJj9AoQ9sOOj9dpUWdqJWEvzQeuqhHkmMmr/oXfobiQutxfrHp1cbgmDszi7t/jNSCGwUOWmcD1yRgkpQzQisKAE5X+Tkqtl0wKe0zx7CiDmSSrzm0Osxv7P5IsM4mV/OUqpO1f7MLsX1Yjxg3CaX0o3GytbIZqCUFz2vqioxCjdR3+S5dU5PeGT4tagU2IXzRvwpAm9AAI/Own5qtDEf4h1Cq23OiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGgGTJQBZA3vBhzergTiqoLXQCF3eYCAyeCDsiaJ42Y=;
 b=gF8QNHXxpkOh0n1P+6WdKfFNHmLLW87U+Xr8wt2gMHhCAGuLEmpRayac4fBVqIl9rF3EnDVVCwzng+GidR1NP5FPLoSaNJsEMF50UPygzR8KOD6poiuRmupskPHLDfQA4vMyAOY2W8riXnVqMBXPOGfY7ahUwLccpZVrqG03EpK5LCfrwRzWXGTYKxjgYDj3HIUIt9KLiMP4cF0o0IguNJn5j1vOF2aJyBW0FNe/cXH58hsPgGv49CJzAdMcd6FGaGtnoW+E68GQW3cl8nURKztuoE7b89UTw0KVSNC9Uy6PRFaPt3EcPipEzJNzI8joy0z+lqtfmwyGYZKsPFiIBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MWHPR1201MB0111.namprd12.prod.outlook.com (2603:10b6:301:55::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Tue, 24 May
 2022 15:36:04 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::d4a3:9322:f9f4:391d]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::d4a3:9322:f9f4:391d%6]) with mapi id 15.20.5293.013; Tue, 24 May 2022
 15:36:03 +0000
Message-ID: <206999e2-b6f5-32b2-ef73-8dd0c8be7d6a@nvidia.com>
Date: Tue, 24 May 2022 18:35:56 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 6/9] vfio/migration: Implement VFIO migration protocol v2
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-7-avihaih@nvidia.com>
 <c76e2332-60e0-57b6-98ea-eeb924d568b9@oracle.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <c76e2332-60e0-57b6-98ea-eeb924d568b9@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::14) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4674b84-5565-4f0a-7dea-08da3d9b1c98
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0111:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB011106FA79112FCE48603BB1DED79@MWHPR1201MB0111.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: izQkUPMt8N4Als2fBrYCgqk1PHZq8G2Fd0JC6llMkBadscFD5JYQ8vU809KMkx9gLrDK0DrF+buAcJTjQrNLBjI3Myz0A5B5aFOYDlEucmOw4YGfQPJVlOnAiQmdbnMhPBu2oQmGt8SrqcpjpFJwTBiIaOcYBho3ha1YsonqQ2Q6Mvp7aUJQONnevdAUfrJByPCgtXRYDDv6Kr5Thcli9BREdok5y+ZKYbCwedjkRh09VeAAXLUZRLUWdHEQ1PLfspHdzioLX0fPeqhx3xWGRYjxftiGwD3Fqt81OBdyR5GmCk0BDICMtmxGV/9ibGDWEJYYhov3Q/FBTPud6vIByvrJhjH5iBmOvvZOCvjJZgmOMRXqHuE5gpJFCkcdEpJtL2OBVmhIdxPxRsAraUaB+nKwt2LpjW4Z+CLrAo6MbtSN+aiuOuU1V7fbGp5lTM3fKmR+Hk6AqFHl5yVi6Dhvv2oPzyp2j75LRSNZYxdBHj3PCPnVFNuppp/8qe9JtsypbbF/D8DX5yccJVqxhNTKc1QGIur2K4aQUV0dC3qjr+KnIVlBX2kyd74HkCsxeI8aQwNpXJw1CsrQS4usINxMBqnJ9ug2TYgnRTl23vZVu3iKZ07iSDtBeuE6FF/klWEb54Ji2Dmb8XRzY/nrFD/kQq5dmEv6oOs48mXqKSyEsmOXNS5EV8AE+caMaJVcNWxQ0o/owUCzmVAbL4JfSUeIrpwyuV0d0sLcKBQjY1JEznQmv9WOXuPs1AI7PYhpbqp6cpLJMfoBXUbVZ1wFBuqxi6OBQ3oE98AZWSFmPYaYdXDGpruWD3skZMoqMeuOMo+SSOYoMjMvISBQabUwrxLkhG0ZaY3mSB+qGkwYIG2x4sA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(4326008)(8676002)(66476007)(66946007)(316002)(26005)(66556008)(83380400001)(6486002)(966005)(186003)(508600001)(2616005)(86362001)(5660300002)(2906002)(6512007)(36756003)(38100700002)(31686004)(6666004)(53546011)(6506007)(31696002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elhONWxnZGJYc3R4UjIxeTg1eXFVcURpQlUyVi84QXViVklndm5vVytydXpR?=
 =?utf-8?B?ZHc2RFg5Z0hlRjNJcjgrQkxCRHFLUklKd3BTVUU4cjQyVUFzOHNlTHBFMnhj?=
 =?utf-8?B?cTVzbi9aL0V4Qmh5amVGbUlhUDVmMDlwaHFSYUxzWCtLc1Y4TEJrWWlTVGk4?=
 =?utf-8?B?MjgwdXRMcU9DRFVUTGgzYzN1b0pPaDJ1TS9VWUFzZFlYckhGV1JTUVQrTHBF?=
 =?utf-8?B?aU9CNHc3MCtyRFlJbGtzcnloZW1iS3ZNelMya3pwWm1WMVE5RzY4K3EyVjZE?=
 =?utf-8?B?eHdKVkoyZmpDRWNGS1g2UGs1OEUrOFIxK05xaUk5TjF0ckNVQjF3MkR2QXJQ?=
 =?utf-8?B?S2FMUU12aXJnKzlDYnBRbVZORmVhRnFvZWlkTit5eFF1cHZ6SXBvbllTNHNk?=
 =?utf-8?B?RGo4Qi9TOWxQdEViUWE0UjBiRkJlNVhUMytGNTM0NDlNelhGWDVJalRWbTUv?=
 =?utf-8?B?R2FMTyt5WHhucmxHcGZVMUhQZlpLa29EY1RMYjUxTCtseVhaNE1ZRUZrZUtW?=
 =?utf-8?B?ZG9HMlJtNzJyTVFkWWpXZTdjNlBkaERUd2hLTk9zQVFrbDErZ2d2Z2hxMmZl?=
 =?utf-8?B?MVJ3aDBvajk0ZCtyb0Fscm0yT1IvSlRnTS8xc2Q5ZGlDRGVlN0FSaTVjcW1C?=
 =?utf-8?B?V0RkRXRjWStXYVlnVkFwMGJCdlpKSFBUdi9ieUtaNEVBdWdlaENyMFVzNUpi?=
 =?utf-8?B?eXVOeDBVREdTZWRlLzZ5VndDdE1nTXdBYUFFQmN6SFR1NXlPSlRhdFVRMVVi?=
 =?utf-8?B?eWhNZVExT3duNy9ZL0ZmNkQ0V0NxeDFreUdUQmRvNXJYQzBUT1AwNmw0SGsw?=
 =?utf-8?B?eWorSWdhcFRWWERyRmFzVkh1QWhOR25BQUFGUGNidW9SRUt4S1d0a3lJS0lZ?=
 =?utf-8?B?YU1JREcvR3V6TnBvV01rbFpOY2RJWEFvWEFBWVJ5ODRpUUZtYXhBanljR1VQ?=
 =?utf-8?B?Y2w5WnA4eWN6a1E4dXhDSXk5OTZBR2tyZCtCY213K2l2Q0FuOUhOTW5zTmt6?=
 =?utf-8?B?aXluaDNHU1A1cHBnalFGT1pOZjJMdXpPak1FVG5rYkFkNm1nTTkvTGRhMkJr?=
 =?utf-8?B?TDllYU9LWFNUemthM2NnNVR0LzN2TW1NckgyQytvVTFiQzJjVUhHSmcyNDNE?=
 =?utf-8?B?YVhoMWZmTXA1bU44eFhzbEcycHh3SXJwaVRBNzFXTjErRkxuMCs3MUwxSWJT?=
 =?utf-8?B?bTJCSXYvUlR6aWZYd1krRlJkTGN3SmZjTk9US1lxVXRlTlg1QTUrM2NKSEkz?=
 =?utf-8?B?TXVWbzAvTkhuaEZhRndlaVoyZ2I4MFRWb0FMQVM4cEtUMkNNcHF1YmRDbDE0?=
 =?utf-8?B?cFVJTG14NXRGNzZ4bWdxcHV6MCtMSXBqYlE2bitxd2FtYWhqdFZXMkFTeGFl?=
 =?utf-8?B?VVlXcjhzS205SlgzZkFtWVgwTTdJaG5vOGtJYVRLQmtlZGY3TEhXM0pWbUE0?=
 =?utf-8?B?eHphUkhyMnRWZ05tdUZ5dUQ2a2RzbW15TlRGME1NcmpCS0szRU05UTNCaWJq?=
 =?utf-8?B?RG4rL2YxM09oTGRpLzhYOSsxN2xHOVlwRjNoRk9taTdQaUxid1hSK01uakYw?=
 =?utf-8?B?OWpacCtmTnlpMHlmZDVnenFOUVIxdXE1WGVjdmdKdFB6UWQyZ3h5U1JYamcw?=
 =?utf-8?B?ZWJqM0tKWXJoaGNFaEJkKzdxcVp0WUtqcU1ERU5sbnE2UGJEMy9zQUZPZ3RK?=
 =?utf-8?B?TjBzQm81cHFlWFlWN3F6RENvM1E5OWV1ZjZjS0VwUkNWU0lIQTJJYUdCVCtB?=
 =?utf-8?B?Q09iUXJvb3dWVERLWU1DZEFMOE5NM2g2S1BTczhHK0xzYU9SRXY5M2pLZytv?=
 =?utf-8?B?eUtKZzlDREFIZTRyK1ZLeitkNDgvbXF1Z0NSZFhPYVJBbDdnZktSY3lqY05s?=
 =?utf-8?B?eXZKSVpmQmFLRjR6a2U3TEYvaEROQWhQUEhKUU5maGF3eEpaUDRQR214VGt0?=
 =?utf-8?B?M0g0VlRENU0zOUt1S3VzSmdYWm9ITEZvaC9ia2FKb0t6bndmNnE4bEZvblN4?=
 =?utf-8?B?S2FodGRiRGdGL0hPQzRPV0dKMnZMc3p6NXUraHlCNzJTbDYwOFozZEdTeDVt?=
 =?utf-8?B?ZnlJS1RHL0ZmM3VVQWlKWGtFa0pNVnpTTC9LS3I4cDBiRDVrK2loWXlabzZC?=
 =?utf-8?B?MHBNMVpjUENVSlFBaThTV0gxZisyVm9BcGZpY25Pd1NCclBva3Y1L1BLS2lt?=
 =?utf-8?B?a1dDRGRtNzd1WjZUR0ZaK3RiQ2NFVjNHK3RXM2U4NE00cklpQ2lxT3o0a0hG?=
 =?utf-8?B?c0lHMXdva3NjNkFvUjBWYlo5Sm5FamJXQkxLVHV1NndoTGF1VWs4QTVab2FQ?=
 =?utf-8?B?WDVKcUxDWGFmN3lZUEJWam5FVU5lVk1YUVoxL1VDL3ZKN3N5eDNmUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4674b84-5565-4f0a-7dea-08da3d9b1c98
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:36:03.8139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7qkNtlY46gS6XuIw9yeTlmD4GIbLNVufJeScyMtg/S0K+A6j5qSckdaSeyCA4BpHF6N08WC1KdToCBET72/TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0111
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::620;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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


On 5/23/2022 9:14 PM, Joao Martins wrote:
> External email: Use caution opening links or attachments
>
>
> On 5/12/22 16:43, Avihai Horon wrote:
>> Replace the current VFIO migration protocol v1 implementation with a new
>> implementation corresponding to VFIO migration protocol v2.
>>
>> The main changes are:
>> - VFIO device state is now represented as a finite state machine instead
>>    of a bitmap.
>>
>> - Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
>>    ioctl and normal read() and write() instead of the migration region.
>>
>> - As VFIO migration protocol v2 currently doesn't support the pre-copy
>>    phase of migration, .save_live_pending and .save_live_iterate handlers
>>    plus pre-copy relevant code are removed.
>>
>> Detailed information about VFIO migration protocol v2 and difference
>> compared to v1 can be found here [1].
>>
>> [1]
>> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   hw/vfio/common.c              |  21 +-
>>   hw/vfio/migration.c           | 628 +++++++---------------------------
>>   hw/vfio/trace-events          |   9 +-
>>   include/hw/vfio/vfio-common.h |   8 +-
>>   4 files changed, 153 insertions(+), 513 deletions(-)
>>
> This looks like a fairly big patch, though more than 70% of it is removing
> code. Perhaps you could split it into adding v2 and removing v1 afterwards, rather
> than a single replacement patch? It's just a suggestion anyhow, to hopefully ease
> analysis of the new additions. The removal looks to muddle a tiny bit.
>
> I don't wanna throw you into potentially unnecessary work should maintainers disagree,
> so here's an attempt:
>
>          https://github.com/jpemartins/qemu/commits/for-avihai
>
Ah, nice idea, thanks! I was afraid this patch would be too cluttered.

Alex, do you want me to split this patch in a similar manner as Joao 
suggested? and maybe add v1 prefixes to existing functions instead of v2 
to new functions?

> If you apply your series on top of the same base commit (78ac2eebbab9) you should be able
> to compare both branches.
>
> I haven't found yet any particular flaws in your new logic (but will reply back if I find
> any).

Sure, thanks!


