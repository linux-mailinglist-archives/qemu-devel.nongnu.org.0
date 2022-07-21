Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C8A57D4A9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 22:12:01 +0200 (CEST)
Received: from localhost ([::1]:47654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEcWe-0003pP-M7
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 16:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pankaj.Gupta@amd.com>)
 id 1oEcVI-0002GK-ND
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 16:10:36 -0400
Received: from mail-dm6nam10on2062e.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::62e]:56929
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pankaj.Gupta@amd.com>)
 id 1oEcVG-0000XB-2t
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 16:10:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxKeOO8Xldb8mabyt5XZe7M7C8pMHlA+VM1wVDTp80dw7gOobAPv2WSDDq006WGfNL/d2g7seD0E4IURrNF15YYVyUyPhY5gcHl8LzmyZ+ggpCfNahZNnUphvhpHpwYdw7VMFO6jtgAV7U1BXO4Lum4xbpgvwoSsYXEpTkZba7Eub2laWLuiYYotkCvLG6jLx8fMjicYRRFTa3vdlr1fEVR4/cN2JMKCuB6pG4h7rCYkfRFVo5im/NSBfeHiKj8ihNO5JDKsCukqoPQr4hG+DnVm7dNu1NdxqJRLpzEmuI/prna78nE4xhwMCPPDasw6mv6UhdbHTYjXsqPTWMcpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0wrLQDsRwCeAK/7G1Y8Ow4GYDD/kKswoJxAetGIvDs=;
 b=H1fPBLCZZlqykEZhpcbLwv0WeVw4uBvBrWGSTN4PfX3pXMKzjiL5U9K6LnE0JifqXLNHwYWkhu+JV7Oyo/bo8ZpQ6yOq96ryp/Jt+oJbtqJ7nzxmIfqnrRFlNKjSC1nKrfHhl207/m1u2R9+gVc6it+GKjwskCOfF6YdxV2Arvi2HyOpKYw8Fr6T63T8q4QyIVqTGmLtZQVZNBvOSflAcj/kj8vRqHFmTsP02YfklwSBrnEUjfJ7RnfxuSWQ9LhOBuakxdeph98c79X7YbDrVk/WQmY+pvoOhMCJEFBNplBUL/b4kB+WRMoqWUr3f20twrPtd0uUTGwOT2/J9I5kSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0wrLQDsRwCeAK/7G1Y8Ow4GYDD/kKswoJxAetGIvDs=;
 b=ouPbVeYaClMeMcXWa0917SvecklTT7NZRqPKQYVdPzNOJNuWV0ZZmeGvY2ygkchyKAOnGq6iPEIU9mo8v0qT3SwfmAe0ZbefrbQj7xqOemEUDERQlXa8p60RA5L1rcOiQZ7SazZZPKotEFjPuvE4oFx+I4YFAny+Q5gcZ7fy7yI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY4PR1201MB0181.namprd12.prod.outlook.com
 (2603:10b6:910:1f::11) by DM6PR12MB4107.namprd12.prod.outlook.com
 (2603:10b6:5:218::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 20:05:30 +0000
Received: from CY4PR1201MB0181.namprd12.prod.outlook.com
 ([fe80::1001:3c79:9504:8d6a]) by CY4PR1201MB0181.namprd12.prod.outlook.com
 ([fe80::1001:3c79:9504:8d6a%10]) with mapi id 15.20.5438.023; Thu, 21 Jul
 2022 20:05:29 +0000
Message-ID: <c3ca63d6-db27-d783-40ca-486b3fbbced7@amd.com>
Date: Thu, 21 Jul 2022 22:05:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Chao Peng <chao.p.peng@linux.intel.com>
Cc: Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, 
 Andy Lutomirski <luto@kernel.org>, Steven Price <steven.price@arm.com>,
 kvm list <kvm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Linux API <linux-api@vger.kernel.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, the arch/x86 maintainers <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>, Dave Hansen
 <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, nikunj@amd.com, ashish.kalra@amd.com
References: <80aad2f9-9612-4e87-a27a-755d3fa97c92@www.fastmail.com>
 <YkcTTY4YjQs5BRhE@google.com>
 <83fd55f8-cd42-4588-9bf6-199cbce70f33@www.fastmail.com>
 <YksIQYdG41v3KWkr@google.com> <Ykslo2eo2eRXrpFR@google.com>
 <eefc3c74-acca-419c-8947-726ce2458446@www.fastmail.com>
 <Ykwbqv90C7+8K+Ao@google.com> <YkyEaYiL0BrDYcZv@google.com>
 <20220422105612.GB61987@chaop.bj.intel.com>
 <20220509223056.pyazfxjwjvipmytb@amd.com> <YnmjvX9ow4elYsY8@google.com>
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <YnmjvX9ow4elYsY8@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P251CA0012.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::14) To CY4PR1201MB0181.namprd12.prod.outlook.com
 (2603:10b6:910:1f::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c8b255a-0889-4432-cb74-08da6b545c21
X-MS-TrafficTypeDiagnostic: DM6PR12MB4107:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sEmKdjZAD9qshBW3nT+21kJBKQZsCqLDCjFqZQYFgyyfceVoecn4W30daLjcPmZt9iMwEDK6ZHm+Ws43qc8eaYJrQCBIYxhextSC1UP4QCX5Hwcwh6IPxgxL8L6okDH9Pi6F8bT3zUn5GoZrQU0JwbqQlwU+jNwRo2Zbryk/Bqys82Rw8AHENVzkoscwZrGqwwT5Sbp4FPLQV5AtproqpPalpw66N6FI1ybskVty5DrUtvRMz5mwePbrGMW4MyRK6pjRv71UK1ldE/6f7aRQq7u0uiZcKG0CNpXtngrJ0TbHXEyK0wt0+jq/QtPWc5bIC1/OdexNvVFuhTgUtITdt26J+EpCVJKrs0rD/qOO4oZIDkmRGl13RB32YqCUyFqwe++5RStrCQp6DYHLfT+boep2fYVBmdWXXjUV7NZqnfG6Js1/0HmLWKUWUmRZex5PCyhq5aYECutnndjYvl1cc7MmKAjyVtrFOlpsFYnXnoa/tddnsu7skl3CqBX7HsJa5jiCu6dtEEUNOkG5C2/MOg0HeGG1ZSN6jxkgXQoqeYABqUhmT6wNjLpyPM5WQi5a5LbtL2HNfg6/bFvMW16hadzrBD0dg+IE4JAnJUHowxomuOdmvdYStRPPa34qj7bToCflcPa+O0y9kRe9y4t5FaTj/sNxWtCqUKgdoCBGPL/mWEpAYX4zlsd729CRJ0IIOceyibsZtF+AVmEAZx2pqSGkfgjUb+A+fzBMrGlPs9N6OKelfEER5O73BEdMf2my3KSnUGVABEUiPr2o8radV099NlUAOYH6PccU4+RPROV8DjwVz7vAxlOavre0Cm+hXXA8qSRfjzc5Z60HSTIPcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(186003)(38100700002)(2616005)(31686004)(110136005)(6512007)(6506007)(86362001)(6666004)(31696002)(2906002)(66556008)(4326008)(66476007)(8936002)(66946007)(8676002)(41300700001)(7416002)(316002)(5660300002)(478600001)(36756003)(7406005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkFqT3Jxb3FCUmhyNDRnbXJHeStUWGRvSTVTM1kzeFJEbjNNMXNNYVV1SVA0?=
 =?utf-8?B?TUw5ekdZbFV4VE5VRUJoRDFTcFR1aUJzUGg1RUl4MzRIT3RlVGR3alpjWjR4?=
 =?utf-8?B?NFpzZ1FVRng1ZGFlYk1CanRscFQxZ0hoNWJoRDFQZmJUY3hJSGZ1R0JDK0JP?=
 =?utf-8?B?OFBkaldvVUhqbXdTUzZOS2FJUi9oUGVVRXl5bGpZc0JQaHNPL25aTnZta25n?=
 =?utf-8?B?K2l2aFNYbFZRQXNPQ3JXcWc2V3dBYzE4VXJCS2tPNjNRRFpldTZMZnVRQzQ3?=
 =?utf-8?B?dHNxL3NtUE5zMG9PSlR1OEpPeU14T3BDT0h4WUNJZkVqRnh6WjhmWmsvck9m?=
 =?utf-8?B?S0hWODB4Y3dQZS9ZOWhuUkZrZ3p4TFJFUG9VQ0kvdjA3WVF6TjBmY3NiemFE?=
 =?utf-8?B?enBkV1FwQWRpSkJoMnZxMm90NWNOb1B3aU95R3k2eHZMb091Y1d5UjZ0WDdF?=
 =?utf-8?B?R2VQeXJMVFlpeERnb3o0YTJkTVp3aVJKZ0M2ZjJ1TCtteEdtNnBxeHpkejBt?=
 =?utf-8?B?aEROdEJhRWFVdFpIeXBPeW9ITi9JZ1R2YWdGcjV0ZUFDai9uSmhyMHFoeVZB?=
 =?utf-8?B?SlZtdG13ZWNjelRyWlQ2SWtRM0hrNmtEOTZCbUY2VVVKZFNDQVhRRW1lVlAr?=
 =?utf-8?B?alU0MCtGRDhlWHVCN2NJem44b0RsRUQ3L0hqS3IrYlFFOGJlWXZDMWVGM3Jo?=
 =?utf-8?B?a3c4cEc0SWZuajNYQWNvNnBHeWtNL1E5cjBlT0Jkd3lBcTg4VVJ5N25kZ1VK?=
 =?utf-8?B?dTVFbDZmUXdvcjU3VldWeXNRMkIxVk5CQ1QwcFVDcWJMMEhIT1p3eVFKdFlL?=
 =?utf-8?B?UGljTnhka0c4V0dmU0VUU1pUckZrK1RQdlpVZDJuRGlocW1iaE5uaml1ZzRy?=
 =?utf-8?B?NnpMaFVVRmpSYXZhNnlzaEFjR28veVhsbVZMSG1OUkt0OXh4S2s5T3hRWDdh?=
 =?utf-8?B?WjJIZndOQjltYXB5dGJXdjdwRDc3S29nUHBLM2plT0xrT3FkcXRCZFF1TGFt?=
 =?utf-8?B?UFdYeE84cnROOVRKQzNvYjd2ckptMFNuZ25Ha1dZbEZoNWFITW11aG1EaDZT?=
 =?utf-8?B?bkVSazhoU2tpR2w3R1YrVDBUOElWT1B6M0hMa3MydnhQMWR3U3YzTzRXd0tU?=
 =?utf-8?B?VFAzbjZSYlJ6QUFZUG80UHhWWlgrTDFVVVptMVR3SEtTVzEwTi9TWWNpaCsr?=
 =?utf-8?B?NVZ5Mlk3d0dod2IxSVovcHlhOTdaNTdpQ1RpOG5qUnNGN1pPWEFtZ29vSmVN?=
 =?utf-8?B?Q3RVZ29yc0Jjd29lOCtmTllnRmtsS253c1ROQ1lmRktUOUdzSFgyZjlCbHdS?=
 =?utf-8?B?MUFYVGU0bXd3SHJMR3dxYk0remRkanlBTmR1QS8yYzFnbVhrUmJjdmtQTmlj?=
 =?utf-8?B?VDkwWlFVc205NHFzTS9DbktOQXJnbllGdWhLRDhwb0ltdEViL2x3dVNjcXRV?=
 =?utf-8?B?TXZGeU9kRE9xREYzaHhwcWNEc2pBTkJvbXBQenMyNzlGMlU3SjNUbElkUm5p?=
 =?utf-8?B?Wkh2WEp6czdRY3ZqQ2VFaG5rL2RLdEppOFVlUS9tRnFWVmdsMjlQeGJOK1hR?=
 =?utf-8?B?M0EyOWtlR3dWLzR1K25hYXFoNHpjVi9VaXljU2VIelZKZmhVVUpXQnBIUGNO?=
 =?utf-8?B?ZkR3TGZKUm1tV08xdU1EWjBVNk0rOWI4aHhGTFJ0NE9Ic2w4OXRCV00yREMx?=
 =?utf-8?B?NGtEQU9tTDZudG9kY3pIOHRuWVhoZmsweVl4aCt2UGU3MldyOUdHbGIzL3Nt?=
 =?utf-8?B?NE43RmpSYWt0eUQxR1E0VlI5dWlhMHhUV2RySE5XbW5KNkNZdEhUVi91LzdM?=
 =?utf-8?B?SnBXRW5yZmRHK1p1ekNZQitDSS9FRnNFWXFoWUVGNEhNaXR5cW9JZnhEM3dp?=
 =?utf-8?B?ajVRbXZJZVpyeGd0UjdNL2FmQm1QaXg1T1ZHWUtUazZjUC9COTVneTVVaWxs?=
 =?utf-8?B?dkZFYUpYNFMyZEFHS1F0OElKcjZBT1lkWGFibEpqeHpySUdtTXBhalhhVk85?=
 =?utf-8?B?dEtHd1VGYWV0d1N2S3FFZzNMWGtHUUxhY1h2NzZPL09ZN2F6QWk2cEhjQUky?=
 =?utf-8?B?MVdPTVJUczdLcGt4RWpuM1QybUtMVzZEZTZPSXpsU1lTRXZyVThGU2RONDVy?=
 =?utf-8?B?MHg2VjBWVnFnK2NtNy9HeFJJS0VmempxUTVxc3VkeUpuUUQ5RmNyS0RHaHY2?=
 =?utf-8?Q?K2UW8UG8m0GWRA/hfax7Qtg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8b255a-0889-4432-cb74-08da6b545c21
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1201MB0181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 20:05:29.6614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7eilK/5Wb08s2QGqXppuTWkQbhyIFRvpkWzzVXHRv3KIoTpZtx+SQ6/9Gd0ZzoFMQAAuUzDnGKBi6Z4cY/9nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4107
Received-SPF: softfail client-ip=2a01:111:f400:7e88::62e;
 envelope-from=Pankaj.Gupta@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


Hi Sean, Chao,

While attempting to solve the pre-boot guest payload/firmware population
into private memory for SEV SNP, retrieved this thread. Have question below:

>>> Requirements & Gaps
>>> -------------------------------------
>>>    - Confidential computing(CC): TDX/SEV/CCA
>>>      * Need support both explicit/implicit conversions.
>>>      * Need support only destructive conversion at runtime.
>>>      * The current patch should just work, but prefer to have pre-boot guest
>>>        payload/firmware population into private memory for performance.
>>
>> Not just performance in the case of SEV, it's needed there because firmware
>> only supports in-place encryption of guest memory, there's no mechanism to
>> provide a separate buffer to load into guest memory at pre-boot time. I
>> think you're aware of this but wanted to point that out just in case.
> 
> I view it as a performance problem because nothing stops KVM from copying from
> userspace into the private fd during the SEV ioctl().  What's missing is the
> ability for userspace to directly initialze the private fd, which may or may not
> avoid an extra memcpy() depending on how clever userspace is.
Can you please elaborate more what you see as a performance problem? And 
possible ways to solve it?

Thanks,
Pankaj

