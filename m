Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1D669EDFB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 05:37:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUgs4-0004LI-LM; Tue, 21 Feb 2023 23:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Alexey.Kardashevskiy@amd.com>)
 id 1pUed1-0002jI-Fg
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:13:07 -0500
Received: from mail-bn7nam10on2042.outbound.protection.outlook.com
 ([40.107.92.42] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Alexey.Kardashevskiy@amd.com>)
 id 1pUecy-0003Qi-Fs
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:13:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoOTc3KMxQVlENV7zaJBhWAIX1AMOslRoI5MYE9pqqnIx1CCAFConY5yBYFvATRmuRq3eyqwx/WDIq01QA/Po2b3O74oP9aU916t7UNaGEsMkSbFPKiGbN0hk0FKz2xE+jrmvlQXDaD0MMyyE0sHFNK2HjmDU7opdi2deBV/L798yR/rLkMO+JT1z3Z5fq6r1er0Kd04ghVFoh991s4vXzhxD9kClB1XbZF09gR4ThdwIyR1l/X1pPnWt2qKEb7CIgebFldfMk4rqHOa3aA5PNtYRtp61r8ZLD9KIUbchM3dlgjEyVDpsuaMdnIxIjgiDed1pv4p6jO3LHcGzCetnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Clk3EGFeCSxahOgqqj7xKu60s0z/724EYJ1PzNyyo6k=;
 b=JCDZx/5J9YDwznepQej6IqrQpsecXyV7yYHovTgMkKGDQJYVC11GoFuYAUqWnO6LvSUHoa6O4S2HnSiMXn9vqogruGFIqrZGQbhQNcikVmHDusyMEChV75zOjkTaY+ZgHy41eboVw3fZDTWabSk36rEKUn/H8YTQLoZd2/mjMTA4hhANJplCGC/ldXNPKl5OrL4Xa5nk0qoC1EgdwzopDfGBkWFSlTwCkWwW19He1gST/L1vL098okWDSO+BMcuerteex6VJhXTWYiHk8EqaE7usVPsiNffblnmkhHMXNYf5gow4523iDBBsg3bD0viOhwJt1hOukvleCdrmu9m5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Clk3EGFeCSxahOgqqj7xKu60s0z/724EYJ1PzNyyo6k=;
 b=3wnhSjUMNSadGPR74g6ZdxdsgU6nF8xROCMHHgKnSCtJgiBsal8f9WHPVpkPq4+d6aeotKU6h5BKx7Ex55Ca31CVVdoU9/G4M5IlGRirNuXOZplL01bzIO12L+Yv5R7C43/9oZ61DK9kFnBsc8MJ1Ngne828aSef9dn1qcxVACM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2843.namprd12.prod.outlook.com (2603:10b6:5:48::24) by
 IA1PR12MB6185.namprd12.prod.outlook.com (2603:10b6:208:3e7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 02:07:56 +0000
Received: from DM6PR12MB2843.namprd12.prod.outlook.com
 ([fe80::1185:1d60:8b6e:89d3]) by DM6PR12MB2843.namprd12.prod.outlook.com
 ([fe80::1185:1d60:8b6e:89d3%7]) with mapi id 15.20.6111.019; Wed, 22 Feb 2023
 02:07:55 +0000
Message-ID: <7555a235-76be-abf5-075a-80dbe6f1ea8e@amd.com>
Date: Wed, 22 Feb 2023 13:07:31 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 1/9] mm: Introduce memfd_restricted system call to
 create restricted user memory
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Arnd Bergmann <arnd@arndb.de>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>, Miaohe Lin
 <linmiaohe@huawei.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-2-chao.p.peng@linux.intel.com>
 <Y8HTITl1+Oe0H7Gd@google.com>
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <Y8HTITl1+Oe0H7Gd@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0096.apcprd02.prod.outlook.com
 (2603:1096:4:90::36) To DM6PR12MB2843.namprd12.prod.outlook.com
 (2603:10b6:5:48::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2843:EE_|IA1PR12MB6185:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f037670-97b4-4398-8da3-08db14799c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UrSehtznjxMV3EX4kernI+nJLu8ybw2rRF7wXQ36HLb7+t7Mt4potHIVpgdZroWm4JUFVYoW2Dxdv4RoTogO3DXd7jxZxAuUrci/6P1P/caP2fy/mWk95guK3wWmpa8iq6tkdi+H6av/CoWw3NPQ32gy70Q89v2B1FW7ciWfwKOwvBwmfclf49L4cLgBpTqLf1+KuqMvOoGYLs1yzJrkWGbwDZnlMX/oXQtAgew6gnXUhfmB4HiPXeJMvDkK5mO6FWlRZbmKD4/AU+Kb8c7A1rWVfqhurb0dQTuaqq8whndcZj/SD1hCNpMqilGhWVGdZYygveD5R7plSUyBdaWfmBjwGO7PXBNaFRTy8q5grUn1GEuJEjeNG6wU6prqDQPoxegK2sN7Fu6AEukQoGtnCXghWGCks91ha/p5ypLhYiPI9ehabUESZG6era7o+oMH76+N+4eiOXXR0Wq+cINcJstqj8s6ucUUTfFf+H4JnY7lM82VRTBll9dUZIJ7A0rUhjY8gTfdbC9mlo2dameExppzxyYtZNbCR458Vf0sFF2R3OIHLzP2rEeCVXCTCIfqjnNy+ZWAXutjfJg9j3cq57Ssb+4xIiPF9ALzM4AJ2rihJBZcoEJIJXKi+PTclJmCG2MotIdllIfZJyI39YkP/JtBkeG6ySpSAthFIc675982lNrBqRRUkSpVLOoPrMZpE3FU122Edzkt05zIXSnV4h/C1a1gaygtUOlRxutxMr4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2843.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199018)(316002)(54906003)(110136005)(66476007)(66946007)(478600001)(66556008)(8676002)(4326008)(6486002)(36756003)(5660300002)(41300700001)(2906002)(8936002)(7416002)(7406005)(38100700002)(31696002)(31686004)(2616005)(186003)(6506007)(26005)(53546011)(6512007)(6666004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mjc2dFl4aFFFL3o0VHNBcXlOYVRXWXdpc0JYTlkzdER0OUJIWVZ6K3pmQzZn?=
 =?utf-8?B?NHlJRWdCS3RzazlqOEVQVks5WUt3ak92cEIwQWxxVDlLc3E2UmllWVovQzBE?=
 =?utf-8?B?eFd0aVRMZjNDSXlwekY3d3FkZ2NEMUQ0TjRYZmFtU0NBcDJWTW1XTVBKREw1?=
 =?utf-8?B?by94TGxXbDR0VmNuTFppenQrdkZnSXBuZkxNWDU0ZWptMCtneVBGWGR0TS9z?=
 =?utf-8?B?NXZtbCtrcUFQR3I5Umk3em5SeUFoZVlOcjVHR2REaUlNSE5tVis5V0pUM2lu?=
 =?utf-8?B?cUNhVDZYSTE5M3pmZW5rNDRBWk1yUzRsYXhMWEw4TWpvVlZOeVI0NS9GWktw?=
 =?utf-8?B?QkE1VHRnRlJWYUpYT2x1MVFKYlBwYythMmR6Zi81UEF1MFZHMHcwVU03T2JJ?=
 =?utf-8?B?VXZkVXdEVkdWbUppY0hUc0VRNDNWWTZPOHBpSHFrTkJBMjdKSFRqaXRkb3hZ?=
 =?utf-8?B?T2VGWVI1WTNVVUo4Z2pVVkRscnhRWkoyV2ZyMmxRejhKYW5HNjdrQTlMeGY1?=
 =?utf-8?B?SnluemNaUFYyTmkzbEVFdDVYT0kzZW1WZHp5d3A2SW5qM3A2M1NEWlEyRDk3?=
 =?utf-8?B?eDFtRnRIWFQxQ2ladVp0clhYTzVwSHZtNUE4NHUwZXBBNnRyc0VRc0NOR3hQ?=
 =?utf-8?B?dHo2MW1hbWtSbGpkbVpMT25CVnpwbUY1amZMcDVnTXhvVHJTMkxjTXpWcWdw?=
 =?utf-8?B?aGtBTWtISkZrUnAvWWZJK0l1MDVFSmRoc09ZSkRhZDN4eVl4QXBCNkRGaXFX?=
 =?utf-8?B?MHJlWlJSeGpySlVKbTU5KzZiTlNHcVNrckNLYlZ4NUdCaHlONXdUMnIxRjFz?=
 =?utf-8?B?UVRUdy9vS00vWTNVeW1TOHdzVzFkMzhoN05ESU14TnBQY2NJR3NBZTIzbndG?=
 =?utf-8?B?WnhFZmNMclp5VWJydGp3RVRsR0w1V3hzWjRZSlF0RGRzaTRVOUZGa2FlZEM4?=
 =?utf-8?B?SDlGM1B4M0ZsZkQvSE9tcldpNWkzR3dDUUgzbGNtd1BwWWw0a2xzUkRGZnkx?=
 =?utf-8?B?dW15YlFqWjVBZ0hWSFlDbjl4bjdiOTQzVnlkWHE0MzVBMGRqQkJjbk5kdUo4?=
 =?utf-8?B?RjM1cnpXQXlOc0NDSnQrN1JHTFpDOXpuZ2grd3dJVVVYaFJLRTllZ1h5VWtj?=
 =?utf-8?B?SFVNZTdFWGxpZXBuY2sybDlveTljSkFvUGg0NlNxUHJIMFRjOTdJWEJ2TlBI?=
 =?utf-8?B?eGtvSk9xVmtFZlRtQ0MvQSthYVd6WlBxaXZkZmNwSnhZb1IveVhCRWhsRjV0?=
 =?utf-8?B?aFBxZzE4SVNiMk9STllmT2JtNlZMOFM3ZnRZV0h0RVhlZjNoYkkxbGdVaVFh?=
 =?utf-8?B?cG9jc0dMNHVtQ0IrZlk0ZkJLY2tFU2NkN2pJTGwweXh1N2d6TDRHZ21iVHlT?=
 =?utf-8?B?TEVQdmNDSU9CbjZaM1p5ZXE4djMyZHduRUZHcG83MXRHN3l6Kzdhd0h1SG1j?=
 =?utf-8?B?YkUrZVdkdDdUcHNWQUZzZUFWSUJ4dElwSjlkZVlac2Y4RXViUWU0clhpemVD?=
 =?utf-8?B?eVJTNmM4QlNnaGhMSkdTQUJvWHIzS0oyYyttU0lhVHRZVUtRSnh0aW5xcFlm?=
 =?utf-8?B?ejFRVFRhQjlUVmJFVG9NZWovRjBwOVBUYkJvRHVDamc5QWFFT3JGVmV0T2Ey?=
 =?utf-8?B?VUk1S01TSHNxakN1MHRSRXNTS21BTDlvaXA4ZVpvYTJtbytjbHZGRHJmeVBw?=
 =?utf-8?B?MkZISFJ1em5SdlQyOTJoRGdKbWo4VU9NcldkeThJaFZKVHZJNDZYaUFpelh1?=
 =?utf-8?B?azhicFRpQWZwQzMzOWFkeU1MWlJabEZlVCtlRlkrTVVlWnZDUlMxa1JTMTBS?=
 =?utf-8?B?ekZ2QkUwN3BhcnQvK05zM2o2ZVMwSy9vQkVZcmd1MjRUWGhsMFFMVmdkNEI5?=
 =?utf-8?B?ZEJjY3daSUZ0cmwzSGdCMk5UeHVKRklsMmF0QndHT0xaVzY1VDR0d0gwWkdr?=
 =?utf-8?B?NkhWS3QrTGtCVm5hL0dpUmtONHlXcXduMHJrQ3pZWUFPU2F5WFZmWFRNa2Jo?=
 =?utf-8?B?Y294UWo0N204TnlyeFlub1pNdXhpcTRodFJiTFZiNTR0L3RqSzJPOXFPZlRK?=
 =?utf-8?B?WEcrWEsvMndjejdhU1JJeXJ5YitzTHJvMEhmNGpadEJUc3NBM21KT0RPWko4?=
 =?utf-8?Q?npsisC8AQ6GrIiKG1ivloq/3P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f037670-97b4-4398-8da3-08db14799c4c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2843.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 02:07:55.1574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1eUreHXlDCSV7a9COB9CFi+JvFQvruBp8r44/r1nFazBybH2GKAejEfhXBpu/8LefcfpWjgraxeepiM3/IV9Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6185
Received-SPF: softfail client-ip=40.107.92.42;
 envelope-from=Alexey.Kardashevskiy@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Feb 2023 23:36:45 -0500
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

On 14/1/23 08:54, Sean Christopherson wrote:
> On Fri, Dec 02, 2022, Chao Peng wrote:
>> The system call is currently wired up for x86 arch.
> 
> Building on other architectures (except for arm64 for some reason) yields:
> 
>    CALL    /.../scripts/checksyscalls.sh
>    <stdin>:1565:2: warning: #warning syscall memfd_restricted not implemented [-Wcpp]
> 
> Do we care?  It's the only such warning, which makes me think we either need to
> wire this up for all architectures, or explicitly document that it's unsupported.
> 
>> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
>> ---
> 
> ...
> 
>> diff --git a/include/linux/restrictedmem.h b/include/linux/restrictedmem.h
>> new file mode 100644
>> index 000000000000..c2700c5daa43
>> --- /dev/null
>> +++ b/include/linux/restrictedmem.h
>> @@ -0,0 +1,71 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +#ifndef _LINUX_RESTRICTEDMEM_H
> 
> Missing
> 
>   #define _LINUX_RESTRICTEDMEM_H
> 
> which causes fireworks if restrictedmem.h is included more than once.
> 
>> +#include <linux/file.h>
>> +#include <linux/magic.h>
>> +#include <linux/pfn_t.h>
> 
> ...
> 
>> +static inline int restrictedmem_get_page(struct file *file, pgoff_t offset,
>> +					 struct page **pagep, int *order)
>> +{
>> +	return -1;
> 
> This should be a proper -errno, though in the current incarnation of things it's
> a moot point because no stub is needed.  KVM can (and should) easily provide its
> own stub for this one.
> 
>> +}
>> +
>> +static inline bool file_is_restrictedmem(struct file *file)
>> +{
>> +	return false;
>> +}
>> +
>> +static inline void restrictedmem_error_page(struct page *page,
>> +					    struct address_space *mapping)
>> +{
>> +}
>> +
>> +#endif /* CONFIG_RESTRICTEDMEM */
>> +
>> +#endif /* _LINUX_RESTRICTEDMEM_H */
> 
> ...
> 
>> diff --git a/mm/restrictedmem.c b/mm/restrictedmem.c
>> new file mode 100644
>> index 000000000000..56953c204e5c
>> --- /dev/null
>> +++ b/mm/restrictedmem.c
>> @@ -0,0 +1,318 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +#include "linux/sbitmap.h"
>> +#include <linux/pagemap.h>
>> +#include <linux/pseudo_fs.h>
>> +#include <linux/shmem_fs.h>
>> +#include <linux/syscalls.h>
>> +#include <uapi/linux/falloc.h>
>> +#include <uapi/linux/magic.h>
>> +#include <linux/restrictedmem.h>
>> +
>> +struct restrictedmem_data {
> 
> Any objection to simply calling this "restrictedmem"?  And then using either "rm"
> or "rmem" for local variable names?  I kept reading "data" as the underyling data
> being written to the page, as opposed to the metadata describing the restrictedmem
> instance.
> 
>> +	struct mutex lock;
>> +	struct file *memfd;
>> +	struct list_head notifiers;
>> +};
>> +
>> +static void restrictedmem_invalidate_start(struct restrictedmem_data *data,
>> +					   pgoff_t start, pgoff_t end)
>> +{
>> +	struct restrictedmem_notifier *notifier;
>> +
>> +	mutex_lock(&data->lock);
> 
> This can be a r/w semaphore instead of a mutex, that way punching holes at multiple
> points in the file can at least run the notifiers in parallel.  The actual allocation
> by shmem will still be serialized, but I think it's worth the simple optimization
> since zapping and flushing in KVM may be somewhat slow.
> 
>> +	list_for_each_entry(notifier, &data->notifiers, list) {
>> +		notifier->ops->invalidate_start(notifier, start, end);
> 
> Two major design issues that we overlooked long ago:
> 
>    1. Blindly invoking notifiers will not scale.  E.g. if userspace configures a
>       VM with a large number of convertible memslots that are all backed by a
>       single large restrictedmem instance, then converting a single page will
>       result in a linear walk through all memslots.  I don't expect anyone to
>       actually do something silly like that, but I also never expected there to be
>       a legitimate usecase for thousands of memslots.
> 
>    2. This approach fails to provide the ability for KVM to ensure a guest has
>       exclusive access to a page.  As discussed in the past, the kernel can rely
>       on hardware (and maybe ARM's pKVM implementation?) for those guarantees, but
>       only for SNP and TDX VMs.  For VMs where userspace is trusted to some extent,
>       e.g. SEV, there is value in ensuring a 1:1 association.
> 
>       And probably more importantly, relying on hardware for SNP and TDX yields a
>       poor ABI and complicates KVM's internals.  If the kernel doesn't guarantee a
>       page is exclusive to a guest, i.e. if userspace can hand out the same page
>       from a restrictedmem instance to multiple VMs, then failure will occur only
>       when KVM tries to assign the page to the second VM.  That will happen deep
>       in KVM, which means KVM needs to gracefully handle such errors, and it means
>       that KVM's ABI effectively allows plumbing garbage into its memslots.
> 
> Rather than use a simple list of notifiers, this appears to be yet another
> opportunity to use an xarray.  Supporting sharing of restrictedmem will be
> non-trivial, but IMO we should punt that to the future since it's still unclear
> exactly how sharing will work.
> 
> An xarray will solve #1 by notifying only the consumers (memslots) that are bound
> to the affected range.
> 
> And for #2, it's relatively straightforward (knock wood) to detect existing
> entries, i.e. if the user wants exclusive access to memory, then the bind operation
> can be reject if there's an existing entry.
> 
> VERY lightly tested code snippet at the bottom (will provide link to fully worked
> code in cover letter).
> 
> 
>> +static long restrictedmem_punch_hole(struct restrictedmem_data *data, int mode,
>> +				     loff_t offset, loff_t len)
>> +{
>> +	int ret;
>> +	pgoff_t start, end;
>> +	struct file *memfd = data->memfd;
>> +
>> +	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
>> +		return -EINVAL;
>> +
>> +	start = offset >> PAGE_SHIFT;
>> +	end = (offset + len) >> PAGE_SHIFT;
>> +
>> +	restrictedmem_invalidate_start(data, start, end);
>> +	ret = memfd->f_op->fallocate(memfd, mode, offset, len);
>> +	restrictedmem_invalidate_end(data, start, end);
> 
> The lock needs to be end for the entire duration of the hole punch, i.e. needs to
> be taken before invalidate_start() and released after invalidate_end().  If a user
> (un)binds/(un)registers after invalidate_state(), it will see an unpaired notification,
> e.g. could leave KVM with incorrect notifier counts.
> 
>> +
>> +	return ret;
>> +}
> 
> What I ended up with for an xarray-based implementation.  I'm very flexible on
> names and whatnot, these are just what made sense to me.
> 
> static long restrictedmem_punch_hole(struct restrictedmem *rm, int mode,
> 				     loff_t offset, loff_t len)
> {
> 	struct restrictedmem_notifier *notifier;
> 	struct file *memfd = rm->memfd;
> 	unsigned long index;
> 	pgoff_t start, end;
> 	int ret;
> 
> 	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> 		return -EINVAL;
> 
> 	start = offset >> PAGE_SHIFT;
> 	end = (offset + len) >> PAGE_SHIFT;
> 
> 	/*
> 	 * Bindings must stable across invalidation to ensure the start+end
> 	 * are balanced.
> 	 */
> 	down_read(&rm->lock);
> 
> 	xa_for_each_range(&rm->bindings, index, notifier, start, end)
> 		notifier->ops->invalidate_start(notifier, start, end);
> 
> 	ret = memfd->f_op->fallocate(memfd, mode, offset, len);
> 
> 	xa_for_each_range(&rm->bindings, index, notifier, start, end)
> 		notifier->ops->invalidate_end(notifier, start, end);
> 
> 	up_read(&rm->lock);
> 
> 	return ret;
> }
> 
> int restrictedmem_bind(struct file *file, pgoff_t start, pgoff_t end,
> 		       struct restrictedmem_notifier *notifier, bool exclusive)
> {
> 	struct restrictedmem *rm = file->f_mapping->private_data;
> 	int ret = -EINVAL;
> 
> 	down_write(&rm->lock);
> 
> 	/* Non-exclusive mappings are not yet implemented. */
> 	if (!exclusive)
> 		goto out_unlock;
> 
> 	if (!xa_empty(&rm->bindings)) {
> 		if (exclusive != rm->exclusive)
> 			goto out_unlock;
> 
> 		if (exclusive && xa_find(&rm->bindings, &start, end, XA_PRESENT))
> 			goto out_unlock;
> 	}
> 
> 	xa_store_range(&rm->bindings, start, end, notifier, GFP_KERNEL);


|| ld: mm/restrictedmem.o: in function `restrictedmem_bind':
mm/restrictedmem.c|295| undefined reference to `xa_store_range'


This is missing:
===
diff --git a/mm/Kconfig b/mm/Kconfig
index f952d0172080..03aca542c0da 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1087,6 +1087,7 @@ config SECRETMEM
  config RESTRICTEDMEM
         bool
         depends on TMPFS
+       select XARRAY_MULTI
===

Thanks,



> 	rm->exclusive = exclusive;
> 	ret = 0;
> out_unlock:
> 	up_write(&rm->lock);
> 	return ret;
> }
> EXPORT_SYMBOL_GPL(restrictedmem_bind);
> 
> void restrictedmem_unbind(struct file *file, pgoff_t start, pgoff_t end,
> 			  struct restrictedmem_notifier *notifier)
> {
> 	struct restrictedmem *rm = file->f_mapping->private_data;
> 
> 	down_write(&rm->lock);
> 	xa_store_range(&rm->bindings, start, end, NULL, GFP_KERNEL);
> 	synchronize_rcu();
> 	up_write(&rm->lock);
> }
> EXPORT_SYMBOL_GPL(restrictedmem_unbind);

-- 
Alexey


