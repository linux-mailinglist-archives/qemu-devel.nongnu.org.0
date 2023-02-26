Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A6F6A32EF
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 17:54:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWKI4-00037T-Cw; Sun, 26 Feb 2023 11:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pWKI2-000376-Fe
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 11:54:22 -0500
Received: from mail-co1nam11on20619.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::619]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pWKI0-0007f8-GR
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 11:54:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrLmo6zIB4daChAeMBBlcCG2zmGHCpamUBJe7NVre+XrJxttIzNSP4GXLykRtm88gw1SS2Z6tA0cvvvctrBcgoQZ9j3LpD1lA8pudUJDaGHstvg/Ogdxpn+g+uzlGAAKfIKN/rlXCak+qSZwY9pmf7uMuQ5pi03Ti1LhTfCs6zOv7jYdqSUL1xuIe+tZKAURw+yrTWMFcMkh0PxsBFHWOpHNKh6Jzopp6wdyAUzbXENpFDLS31Enyqcq8Xrb7a+OBuvDmxs7NdAwgDCTw3fg3qBThM12sEghQFXeJIa9NYzuIPyNYR/KouekhJWS/JtygzDoBe6f6O5Mp5LJ/ZvKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/qBrzyq9V4ehM+2zS2mReU0DIJEXm0lJ1RsSjvef1c=;
 b=cielfXSiZ5p7MkUx4qZobKl8P/jS/yePdM0kS+D20N5TfwMDLDm+OIRNhcASsYt1g1zlI0JnPkSa+YtPQ5SlBA6VOpWmdAlIAtJfxjRApL9L9UoTcW9NsX0DsFwcxhoEcuEEN847x64m63VrOKL8h3jAGrJ8a6T4EYoXEEX7akKeWU0Ki8hvp6W9RKqxGjT6UFg9iVGQOyem0FmGeTIsrnjlwVg+6boidPJuP0Ck6UOYjMqj7EYDdsJubw0VXb0HqrJyGBilz+xMNdJbtQBNa+yRT1s6n7xa00z/9UUmV7ZMg4IdeEapYpC36Yl49FoYR/03SJ1jhfsdi0QOpChYig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/qBrzyq9V4ehM+2zS2mReU0DIJEXm0lJ1RsSjvef1c=;
 b=JW0n0qjGm+ODO8nbNyFHIPer0PU8euItSzhWxMpyU+MqYTfcUm7R7R/ac2Q14fmNUhcVnv97Xa+IcnCbulTPW4jB7t7c5MQpPNKcaWowPGeElVI0DNVDW+INhE0NAyHZnnNf39ZYllNl5MBK/RNzyqgrIUDcSu50S1nTXXySr3Sp58lMtGFJTqZ35YDWu3v3BcuoiwcuVBCjuoeYW07RUgvZ2vRGRfZGKvLx/NCL4raWojiN27MTRtArrd2xo+DPyLIeRxMza696Eyjt3cGoyxndZiddYnmT0CDhJUV7d8vJdJ7z4egZegg9QEs5r8H9vPBjUPNQIctm50pjXWpWog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by PH0PR12MB7815.namprd12.prod.outlook.com (2603:10b6:510:28a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.26; Sun, 26 Feb
 2023 16:54:13 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb%3]) with mapi id 15.20.6134.025; Sun, 26 Feb 2023
 16:54:13 +0000
Message-ID: <6de808b2-4e55-d37e-6d3c-97815bcdb8d9@nvidia.com>
Date: Sun, 26 Feb 2023 18:54:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 11/20] vfio/common: Add device dirty page tracking
 start/stop
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>,
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
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-12-avihaih@nvidia.com>
 <20230222154043.35644d31.alex.williamson@redhat.com>
 <Y/bJMIR8stBcJpW7@nvidia.com>
 <20230223122723.6a204e1b.alex.williamson@redhat.com>
 <Y/e+1GmGBtKKhWK/@nvidia.com>
 <20230223131640.515451b2.alex.williamson@redhat.com>
 <Y/fSlIUcsODBp8Ck@nvidia.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <Y/fSlIUcsODBp8Ck@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0180.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::23) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|PH0PR12MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a3cb7f-c508-4614-41e2-08db181a16b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +bLHHQ5NxKgy4lp/OgKNQhwTHtsWJkNsI9slmvAVQ9zr1vFJcFF1iqC9Is18+RLPlRHh6cPpoS3N1wp2f09gCuXqFOY1tFHs9XBEG0AbVKqqRgX7Nbmy8Hhhvu3FknP+ir4gVGK30B3AIVYKzUElBVyItMrOJl+xZi9zuUF4y9wErlOIz5N8rEEOOREjLQNbmkmRpcw/5frZ0aZZFBjrZGVDpvkZkyIMt+RPRvzqGY4ndBZ8MhbNvwDT1FPbPL6Ohcxp1DXfmVQ8VHiU9Ls2G4BEl9GE/36PfQT7EtPdl5Uj/Ov+/gKVsSTHZER4fLnERZxxMQ4Yqe8DPF9pVreI9PScBp+fN8JWS3EH9rwC6yC3eWf3g224gbJskUU6nw3/ihEk8TQ89kV88ZJP6TficR4rNrCGpwPbQs192grrBhGaO0BQWoXXZkoEN1Dunp8sxSCzZZF+LGV+/RgEuLWwNy+xGV0BMN6/BfEzI7RbfQQmlJCE3XbFIGNkcgQR+lV8TpQWYTDx29J96NzeZ0x/NOczmmGbA0UxBxMOmnCd1lMXCXASxIZ/vsuGuScb+t+uatHl9g91UHE9xXX/sSWmEXLhnMlr+/pKN5VY3EVdQXZjmo8/CZ0FI61btzz9sbkQcO88RUvMAFcy3D2aNv0T7MMrae1P/YADeR8Fq3IWR9XNPdh+eFPvmw9uoJLNtjV80mVVC6eBjPSnddkqVabzc7+h7S8eKmI/Hl7XWg0HRY2yqzjLiCXmQ4ETweV/lVr1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199018)(36756003)(6666004)(6512007)(6506007)(6486002)(53546011)(2616005)(186003)(26005)(316002)(41300700001)(54906003)(110136005)(4326008)(66476007)(66946007)(4744005)(66556008)(2906002)(8936002)(7416002)(38100700002)(31696002)(86362001)(478600001)(5660300002)(83380400001)(8676002)(31686004)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aERBYzVvL3YrWGp3MlVFdlU4RU4xMnRHTStDampadDhTdythT0dJalJrSWtq?=
 =?utf-8?B?WnpsUi9WdjBpdUtXL2ZoSXZPWGJzeDBiSGJuak5wL1BMeDNSM0c1UDY0Zkta?=
 =?utf-8?B?cE1saUUvWWcrekxqSDhqNWdsVWpnOUNrVlRMRlgrcS81N1NseWRBeVZ4UUxy?=
 =?utf-8?B?TUJJNmVob3pBRHRRY1FpN0NteDRyTEVGREFqRExWZVFTU2lOL1JUS3E2NC93?=
 =?utf-8?B?MHM2UnAvNUdSbkd0NlhWbENmaGtLa0tlV3Fwa29jNkdjcmFsVTBEQXp2Z3NL?=
 =?utf-8?B?ZlJDVE04eG9JTHRBb2RJdlViOGFHN0Z5a1lDdTRkUlB2VkFRMVFKWHdQdGxs?=
 =?utf-8?B?N0RRa2IydmlFMUhSNFNSUVh3QUFDblBSUnlHNGRWZWxxazlqZjlRRkY4ODRI?=
 =?utf-8?B?ZEtQd0JwR3VkWnNpeENoK1U2d3NBWjNuRVR4OXlOMnM4MGtsUG03azJZaW04?=
 =?utf-8?B?ZW9KT3NpbFBxU0c1R2tSdDVKR2JFaFMrYmhaRmFDWVRSVGVnVXBxUUJIdzZs?=
 =?utf-8?B?a3ZqdDBsS2U2YzFtZDA1RHNZbTNqM1dCbTFLOFBmR285eG9jOUZ5T2RDaFc1?=
 =?utf-8?B?Z2ZEREZ1aEJqWUhyZEY3OFpiOFJDTHhHMERaYnE5Vkh6WGhtZ3dEV09GUlgz?=
 =?utf-8?B?QmpEYlJ6aktMNzB0OFlJOVYyclV4KzZSVDlJcUNCbWVYeWU1WE8rSXNjb3Ra?=
 =?utf-8?B?elBSWExxMXdkeTYwb1dLZTJIdmhGWmVVZ1V4MW9ETHl6YlJDaWZ4U2JHU3FB?=
 =?utf-8?B?Tmkvdkh0QlFqVmFodTZRaXl6eXdmaE5uSjFLSXFzc3ZDV0FNRTAwVWxsTEhS?=
 =?utf-8?B?TE5xQ3BIcGtjSW9WMnhwWXpNWlQ0L3lsakEzeUZnWU5CZjJ5NEI1MFcxcGY5?=
 =?utf-8?B?bFhoUWYyZFN5anQ5b1VLaHpUaGhVc25tdFN4OW95dkZMWlo3bDMrb2cxQ0pN?=
 =?utf-8?B?V2lBUFlCVHpZMnI0NEVsemcwcTBiQ0xRZi8wNHZCODV3QU1BM3dVZ2xmOHNl?=
 =?utf-8?B?UDFBMVl4NUpzT2lUYyszV2RTNUJDc1llK2JkenRsUEFBZlJibW1wY0hSaFRK?=
 =?utf-8?B?MXhhVlVlN0FSYnNuNEpzc2dpOUJpOXVmMy9PYXRHaVBwM0ZmbWc0eEJvYmhM?=
 =?utf-8?B?WjVkOGc1TFVvL3FGN0JlaXRnUnYxMTZpSTJiZDYyY3dscEFLVjhwWTBXdzVI?=
 =?utf-8?B?ckc5STVoZ2UrMEx1L1FiMU8vem5vSC90NE9SMkVrekl3WDd4R3RDSmhsa1ND?=
 =?utf-8?B?UWV3b1hsL2pFdEVOMWhMdVgvdTNvcmFoeWZFZzB3QTVnRXd0UER3WWl0NFhq?=
 =?utf-8?B?aXNqaVd0SzdBWjhBMXRDTXdlcXJIcy9oMGdwMEYzMDVGWmw4Skgrdk9yMjZO?=
 =?utf-8?B?eUdINDBrWDVYeWR2a1B3QUZlNlNVeDVMTDNRYnd6V0ZHcklnTm1GcWdmTEZp?=
 =?utf-8?B?dzVwdEpEK3dHQ2ZqZDZnZmticUhVNlc4UlByMzR3Ny96aGdnRXdNem1OdlZs?=
 =?utf-8?B?WUxvWm16MnBqSm8xMUhkN0ZCMVd4K3dOblFuMnBTUi9QUjhHM25IdDBEL1NK?=
 =?utf-8?B?bzAyQ0tUdFZSRDdoUGRNOTlIYUtuYzI0SjdyWEhFcy82UUsrbkVBRjBjVEVr?=
 =?utf-8?B?cGF4em81ZWkzNnRjM2lrTjBqMXM2OGlMWmlVTjBORGY1UlZVZjE0NnlPaVg2?=
 =?utf-8?B?V3VTbUQ3V2NJMlNOZ1RTenJEd2JIRFVtdDF0V083UGwrWHcraHdRdU1FWXBu?=
 =?utf-8?B?bGsrY2swZXEvaVNWWi83YzFLM1M5VDkyeXZVY2Y1RldKVkZKbU04eWN4SFNx?=
 =?utf-8?B?N3VVSS9PYlFmTkdVNDlnYnBPTk5LRjNxakdVT2lSZVU0MG8yd2s0RUtqZGRX?=
 =?utf-8?B?TGZBckswd29oRUNuNktqYnN1SXYwWmwyR2FVRVgxMFIycE96VTR1dlQ5aVdF?=
 =?utf-8?B?dFhWdml6K1R5aTdWNXB5YTF1Uk81RWY1dEtuSTVSL2dxNFd3M2plQzdJTzIy?=
 =?utf-8?B?V3dJZGdoTDRXVzhPbzJ2UDRzaHVOaUUrTUNaMUF5QlEzUXdLRXp0dlozKzJG?=
 =?utf-8?B?dHFiSDZqN0JKZkdxZ1NZRDJ2d202dWsxQzAxaGNaOG1DbW45c0o1ZkVXemF4?=
 =?utf-8?Q?gF4peLzC34X6HNHSuEGRk/GPz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a3cb7f-c508-4614-41e2-08db181a16b1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2023 16:54:13.4019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWwBjrB3aetEKLtKXiPF53eRyGthgOhTaipscH8B4hevNpBsO4s64V0NoK36xjDula0Y1rnoff32ks2mqX3z1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7815
Received-SPF: softfail client-ip=2a01:111:f400:7eab::619;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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


On 23/02/2023 22:54, Jason Gunthorpe wrote:
> On Thu, Feb 23, 2023 at 01:16:40PM -0700, Alex Williamson wrote:
>> On Thu, 23 Feb 2023 15:30:28 -0400
>> Jason Gunthorpe <jgg@nvidia.com> wrote:
>>
>>> On Thu, Feb 23, 2023 at 12:27:23PM -0700, Alex Williamson wrote:
>>>> So again, I think I'm just looking for a better comment that doesn't
>>>> add FUD to the reasoning behind switching to a single range,
>>> It isn't a single range, it is a single page of ranges, right?
>> Exceeding a single page of ranges is the inflection point at which we
>> switch to a single range.
> Oh, that isn't what it should do - it should cut it back to fit in a
> page..

Sure, I will change it accordingly (and rephrase the comment).

Thanks.


