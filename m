Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3344A53D2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 01:10:44 +0100 (CET)
Received: from localhost ([::1]:51464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEgkt-0008Iw-3k
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 19:10:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1nEgOQ-0004K1-Rh
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:47:31 -0500
Received: from mail-bn7nam10on2068.outbound.protection.outlook.com
 ([40.107.92.68]:25470 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1nEgO9-00026K-Lx
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:47:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAOEYU6sGnH2fdED87ssFbOwCtPNnVoiU5I0oZvGpsSo1pvPxK5eASbdVbWHiM/nmC1oxuwVC93Y0OwkvpPuNatE/t+Nyum7RRtN3/MjGB6EyM5cVBIsswePb9jd1CxfRwNoCqaX+hTHt+uvTWAmV1lV6emEk4L02SeXHF72nN4B0CAw8hujRMG2Tj4TLXDqJURivQ0ZoHPg90IqSkFDKpe8cwDIrpsVy47VucQpOgmsVvi0azjgpP/EXNmXa82jrF+aBFJSDygkr+dJ9eH4ZihrVvecVOggBmGFo4KQfQ2M7Z/G69/oS2jD/hXq+tnSiTRtTRvZoTL87M0XJgqqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGyZUvgRbLxayQnM44MID0MTf5K0g7ece1KUwuUvKu4=;
 b=aahGBLUlS+ZO38rNmbTgS5BwfUw2G72NmFaBMCc2wF9lm4s99pEIXIIlSMCcVcungaspwDMrZWxB47CArk+/HmSf1aUXM5gDeOIDNre9pF3vNAf+n5iTgmUFet3ugMzcVASmISCzhnBuoRVZO37XwEzAbrjp5IvcIHp3Qwtihuare0k/Dn2yMJKqv1qr0SDfsHaJOEBWHTdkmjttfZmGIRI423REqM9Bwsb2NfrsKy8RqowMOoOGXaMXn7tAmXsrWe3zhwUKGUpx6eWMcFAEmDaGRtKAavd5RdnxV5fUw+2nUERYhLMGmyz1Ec2vcf7bUXWazpxFB1rDyohuNuyqjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGyZUvgRbLxayQnM44MID0MTf5K0g7ece1KUwuUvKu4=;
 b=JlIEh72ZaHD1K8KZ/zzpsS5c6HJqrWraydsMkS5lvWZnDiLF3CS5xBOzr+MrtiU4KtdTlHkTA7uGc5PPxy3jIklwiAteqHaKRYHy2xznLeyv+xBrnuNHOMxig8Nzjg6iVxEzu0owVZE5c1TEkaW+N+LmEPrVXbdPns09hay0zKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Mon, 31 Jan
 2022 23:27:02 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::d860:777:cebb:882c]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::d860:777:cebb:882c%7]) with mapi id 15.20.4930.022; Mon, 31 Jan 2022
 23:27:02 +0000
Message-ID: <720a5ec2-a954-fbe8-a5f2-0eabce7158c4@amd.com>
Date: Mon, 31 Jan 2022 17:26:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/1] i386: Remove features from Epyc-Milan cpu
Content-Language: en-US
To: Leonardo Bras Soares Passos <leobras@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yang Zhong <yang.zhong@intel.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <20220129102336.387460-1-leobras@redhat.com>
 <Yfem3s94EwIxqO1a@redhat.com>
 <CAJ6HWG7RvW6ofKRf7RAK2d8Kw0sOTX7UoYKBBJOy9Yw3yJhZaA@mail.gmail.com>
 <Yfgkdij1x2gSTdXt@redhat.com>
 <CAJ6HWG5uHnG50DPaDEZw1hbpnB3ygXzNA6PaPDT5PiKBYv6b9w@mail.gmail.com>
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <CAJ6HWG5uHnG50DPaDEZw1hbpnB3ygXzNA6PaPDT5PiKBYv6b9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR17CA0016.namprd17.prod.outlook.com
 (2603:10b6:208:15e::29) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: beb67a5b-1a50-462a-ae3b-08d9e5112f3d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4424:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4424E71CC291EECE98E8E26295259@MN2PR12MB4424.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U7wYuim1ugBh/R77Y4NzMHzSkZqKsroZDmiPqqhn2deGG0aOmaXl1dGgcicckxICSAWj6Fyjnlvp/1D1djdGxSnLDH1seqhPRninoqCNGyuX+/iW2itdR2C3xGEzjIGPmuom4zMrkgg/42cVxr97rl7TId0BVNuc/u04UlXwHSP6TuooNU9BfvhmWpDipY0m5OkPeDpATHApoqYQEkRlEzSFBUsiQ7qm7MhE7qQqO85TNt9d34eYQQn8V/ULgt3HpRsFlc2NZiezJW18hDrivo0TawnL6WWj+Za8itzLzawqONYfnNchDnX9lNjPmlfHtagTYzjxXIB4dklE8Luw/A/0nF+zF5Qrew94cfxAccec4DSUc0ssSV8dYI7imESWSJ0R8i/nXuWRLfZpGXcY0wIvxw/UopFAF/Ad9Z977r3GdISHsOUr4dUGAGWE94ofOq57AwLH3xiKHIE8BJ2OfqiOgD6Q9a9dSvEbQF4BFhnl7YHS/rpbXoP4enQ0KJxQzeofLAGNSB0LuylqoVc3s57N/av8M3obHaW9fc9WzFhmoasjvkVzhUtI0+cuu/fLQYCJDBuVaEf0T8DQlvouc2iMTVO1pAdJPqxSvyXA6yIcZJRG+i8daHDOvtFfMo5JWWOha0YEBVfMQC9qgAGBx86LDGAoWQWQuzb89nOQkcwOrfPpQjW66MWklaw2UhoJI8KXmO7s49qE54hQcrmAQ3XzTCrP+66qgD7NsdoUwVSDe/ePayLzosZLURLHQvKWSU8Mwtue6A5E4LDFep+HKYZEL/fI0cGY7c+CuShh6r/TqtqepG9LerHOwQyCXGfx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4553.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(7416002)(44832011)(110136005)(31686004)(54906003)(2616005)(5660300002)(6666004)(966005)(6486002)(316002)(8936002)(45080400002)(36756003)(38100700002)(66476007)(86362001)(26005)(186003)(4326008)(6512007)(53546011)(6506007)(508600001)(31696002)(66556008)(66946007)(83380400001)(8676002)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFJoVXVFVUxpNXM2dWxOTWwyY3R3Z1h2U1FLY3I0YmFlenduTHNUSHY0OU8z?=
 =?utf-8?B?Mi9CRkVWOXMyT3gyMTgvN1lyZ3E5SGFFMDA0VXpRRGhET2tZMEdFdUlhd3pp?=
 =?utf-8?B?NEhyYk1EN09wWjd2NngzSDV0dUI2ZzM3a2lxRmpHOUZuSlQxeHlXd1BHNnVM?=
 =?utf-8?B?MklVVVZUY0p2emtJNmxIaUNmb0ZiaURIcks4NjgvdVUvL01CaXVxRnpwZTdC?=
 =?utf-8?B?bkhzaXZ3TmdNMEhONi92Qkt2bDYrcHhxaDRHSDNDTzFTck5lLzNlWE1DOEt4?=
 =?utf-8?B?a0Yvb29lZTkrSnUxS1c1ZXFPcWxOcnVsdzJHSkQ4K2NZckNkMjdvTlVoQ2pH?=
 =?utf-8?B?cjFpRW15K2pMSTBtL1lqU3JySnRWTW5odDV2TlpKWHZScnkvTkt5UitkYnpS?=
 =?utf-8?B?aStSYThIQ1J0aEkreTAyRDdwajBORTAwNWFqQU1wWTg3TmZpVEJrV1ZIdlJn?=
 =?utf-8?B?QUlaUjg0SUltdmM1QXRENWk4YmRKYXFOVzVEcVE3Y2VmeXFBRzlRY0xVNUtH?=
 =?utf-8?B?bk9QQVRZNnpFTFB1Wi9DL2tKY3U0M3VaN3N2UWs2VHZKQ2tSUU12bi8rRlpm?=
 =?utf-8?B?Zk1BY1NGY0JtMGNSS3VDZlNVZWUwRXI1NjVsUFhrT2Y0UFdBUUdWVHVLb2Y0?=
 =?utf-8?B?VVFSQzBES25ER0toYzdReFdMVnZNRm03RGN5SnRTWTB0SzdGSHNtUFJWTys2?=
 =?utf-8?B?bWVFZGQzOUs0Y2xrbUxaK0JQL0tqc0V6T1QrVFdhWXBpbXBvaEh0bE84K3k4?=
 =?utf-8?B?VXFMNUphOXhvaktuSDhjaEJycWZsY09xbmp6LzZNeGY5NldDOU01aTdCa1l4?=
 =?utf-8?B?U21sN2tsZ0NRbldUb0sxenA2VWhraTIzQ09zWWJ3aGJIMWdmS00rWTZUQ2hu?=
 =?utf-8?B?WVdLYzFvbnhOcDJCcXJnc2FjNUJrZ242WWJ6MXkvUUg5eVhGMG1IUnROSDh3?=
 =?utf-8?B?Vk5PKzVWM1c3MTIxRUVHRGF4WE1NLzJvUW50a3J0Y1RyZEhYTUE4OUVjOHRK?=
 =?utf-8?B?cndvWDVXZGxNeHNXUGJyRGJOQ3dTVXJPSnRrMFlzNTF5MXlmdW1LY2N2ZFAr?=
 =?utf-8?B?bjlBdzBTbUZOa2NRcW5sOHlVREtQSW5LSCt3U1ljTkNkR1pFTFdxZ25UQjdo?=
 =?utf-8?B?RytqVE8vekVDNk5ZWFh5YTEzRnEyaERiNDVxRVVrMXZhWUR1Y29KWEc4VWhZ?=
 =?utf-8?B?enI4QzJoMUd2TTM1TkN0MXU0S01BbkxHV0NuVUJYem1IZnlDYnQ0ZmhiOW5Z?=
 =?utf-8?B?Z251OTdyejR3aFVJQUszZ0VGRDl5dnBUc0VsZ3Z0UWNYU0crb2tLa1ZsdnNO?=
 =?utf-8?B?K3h3c2I5TElZTHVCWi9ReXhyS00yR3Q0akdlV1lybUsvWWZFTkNMdWRNMXFY?=
 =?utf-8?B?MkpFQkZleHF5eEdxSmEzMFBVc3ZQOVhJeHVhYkNYZE84M0hMTkhiNlhWMzlM?=
 =?utf-8?B?WmpGaUdTVnA0YTJIcW14UGVmNy9maTloWTFLc2NVamt5UW9kVXB5Y21UUlBP?=
 =?utf-8?B?T2EzYzlJanQrSDYrV01WUC91S3QxTlJTamZ6QVJoN2NyUFZQNlNqeGx3eVJP?=
 =?utf-8?B?UFhST3dwWmxBdlQ2MTE3eHlTazNXVDd3eWRXMGtETmFab2srQUlPa3RyOUNu?=
 =?utf-8?B?V3BVTHJyYmhqb0xzVjJpVmxZQXBDOUJxM1NITjBFVHNXQmF4OUpaOXRIVkpG?=
 =?utf-8?B?VTlLTm8wcStlaUEzekZJQWZqOThjdFFpa3pTVXNhbFQrSFpPUTI3RklrQTBT?=
 =?utf-8?B?dnppdkJYM01INUhNY2VZeVRoOFBEVlNrcFJzOGJ6ejVsK1ZhYWQzNzB5RWF5?=
 =?utf-8?B?WFo1eXhsa2k5OUZSRExUbHY0WjdBcVFjTnc3RXhOTFpJekhmbTRpVE1sc1BM?=
 =?utf-8?B?bW1rd3FWNDd6b0E5cmliRlBGUXRhdWFiT0s1UDhBS1ZqZ3gyU0xhN1hPUW9u?=
 =?utf-8?B?YlUxbWRPd1ZzYnJQeG4zYUV0TklSbDc0em1SVkovRGpZcFgwRFg0QmNXV3dF?=
 =?utf-8?B?RUJhczFKUExmeHhuWk5wRkUyajdNdkNIVkZXODRZTkhaTFRRZ0NJWnAxMWtI?=
 =?utf-8?B?M3BvejcwamhrZkh2dmJaQnUzc2dINGVraVpJN09DZzRKVnlXMU90ZHkyVGVI?=
 =?utf-8?Q?cV8I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb67a5b-1a50-462a-ae3b-08d9e5112f3d
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 23:27:02.3174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8GFZh6JYIj+SMwVNL7wIN2T+1IoVQMixuHa1pyIg+fmfANbBGmXD+bS3eKUkM3n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424
Received-SPF: softfail client-ip=40.107.92.68; envelope-from=Babu.Moger@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 1/31/22 14:18, Leonardo Bras Soares Passos wrote:
> On Mon, Jan 31, 2022 at 3:04 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
>> On Mon, Jan 31, 2022 at 02:56:38PM -0300, Leonardo Bras Soares Passos wrote:
>>> Hello Daniel,
>>>
>>> On Mon, Jan 31, 2022 at 6:08 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>> CC'ing  Babu Moger who aded the Milan CPU model.
>>>>
>>>> On Sat, Jan 29, 2022 at 07:23:37AM -0300, Leonardo Bras wrote:
>>>>> While trying to bring a VM with EPYC-Milan cpu on a host with
>>>>> EPYC-Milan cpu (EPYC 7313), the following warning can be seen:
>>>>>
>>>>> qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.07H:EBX.erms [bit 9]
>>>>> qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.07H:EDX.fsrm [bit 4]
>>>>>
>>>>> Even with this warning, the host goes up.
>>>>>
>>>>> Then, grep'ing cpuid output on both guest and host, outputs:
>>>>>
>>>>> extended feature flags (7):
>>>>>       enhanced REP MOVSB/STOSB                 = false
>>>>>       fast short REP MOV                       = false
>>>>>       (simple synth)  = AMD EPYC (3rd Gen) (Milan B1) [Zen 3], 7nm
>>>>>    brand = "AMD EPYC 7313 16-Core Processor               "
>>>>>
>>>>> This means that for the same -cpu model (EPYC-Milan), the vcpu may or may
>>>>> not have the above feature bits set, which is usually not a good idea for
>>>>> live migration:
>>>>> Migrating from a host with these features to a host without them can
>>>>> be troublesome for the guest.
>>>>>
>>>>> Remove the "optional" features (erms, fsrm) from Epyc-Milan, in order to
>>>>> avoid possible after-migration guest issues.
>>>> Babu,  can you give some insight into availability of erms / fsrm
>>>> features across the EPYC 3rd gen CPU line. Is this example missing
>>>> erms/fsrm an exception, or common place ?

AMD supports fsrm and erms in EPYC 3rd gen CPUs. But there is some
inconsistency in enabling these features in the BIOS. Some BIOSes enable
it automatically and some BIOSes don't. But there a BIOS option
(in ADVANCED -> AMD CBS) to enable/disable manually. We are working
internally to find out the going forward strategy for these features. We
will update the code when we find out about it.

We know it is causing little bit of annoyance to the users. But as far as
we know it should not cause migration issues as already discussed.
thanks


>>>>
>>>>> Signed-off-by: Leonardo Bras <leobras@redhat.com>
>>>>> ---
>>>>>
>>>>> Does this make sense? Or maybe I am missing something here.
>>>>>
>>>>> Having a kvm guest running with a feature bit, while the host
>>>>> does not support it seems to cause a possible break the guest.
>>>> The guest won't see the feature bit - that warning message from QEMU
>>>> is telling you that it did't honour the request to expose
>>>> erms / fsrm - it has dropped them from the CPUO exposed to the guest.
>>> Exactly.
>>> What I meant here is:
>>> 1 - Host with these feature bits start a VM with EPYC-Milan cpu (and
>>> thus have those bits enabled)
>>> 2 - Guest is migrated to a host such as the above, which does not
>>> support those features (bits disabled), but does support EPYC-Milan
>>> cpus (without those features).
>>> 3 - The migration should be allowed, given the same cpu types. Then
>>> either we have:
>>> 3a : The guest vcpu stays with the flag enabled (case I tried to
>>> explain above), possibly crashing if the new feature is used, or
>>> 3b: The guest vcpu disables the flag due to incompatibility,  which
>>> may make the guest confuse due to cpu change, and even end up trying
>>> to use the new feature on the guest, even if it's disabled.
>> Neither should happen with a correctly written mgmt app in charge.
>>
>> When launching a QEMU process for an incoming migration, it is expected
>> that the mgmt app has first queried QEMU on the source to get the precise
>> CPU model + flags that were added/removed on the source. The QEMU on
>> the target is then launched with this exact set of flags, and the
>> 'check' flag is also set for -cpu. That will cause QEMU on the target
>> to refuse to start unless it can give the guest the 100% identical
>> CPUID to what has been requested on the CLI, and thus matching the
>> source.
>>
>> Libvirt will ensure all this is done correctly. If not using libvirt
>> then you've got a bunch of work to do to achieve this. It certainly
>> isn't sufficient to merely use the same plain '-cpu' arg that the
>> soruce was original booted with, unless you have 100% identical
>> hardware, microcode, and software on both hosts, or the target host
>> offers a superset of features.
> Oh, that is very interesting! Thanks for sharing!
>
> Well, then at least one unexpected scenario should happen:
> - VM with EPYC-Milan cpu, created in source host
> - Source host with EPYC-Milan cpu. Support for 'extra features'
> enabled ( erms / fsrm in this ex.)
> - Target host with EPYC-Milan cpu. No support for 'extra features'.
> Since the VM will be created with support for 'extra features', trying
> to migrate from source host to target host should fail, right?
>
> Which is, IMHO, odd. I imagine questions like:
> - "How does a host with EPYC-Milan cpu does not offer support to
> receive a live migration of some VMs with EPYC-Milan cpu?", or even
> - "If I can create a VM with EPYC-Milan cpu on that host, why can't I
> receive (via migration) some VMs with EPYC-Milan CPU ?"
>
> But I am new to live migration, so maybe I am getting something wrong
> regarding the cpu-model idea.
>
> Best regards,
> Leo
>
>
>
>>
>> Regards,
>> Daniel
>> --
>> |: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fberrange.com%2F&amp;data=04%7C01%7Cbabu.moger%40amd.com%7C4b27f5f24f91458f4c1408d9e4f6d80a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637792571249191260%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=t9LpUFrscExWZXhVkFWYLAuFDn%2FxEdmyFPEFAeSwwn8%3D&amp;reserved=0      -o-    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.flickr.com%2Fphotos%2Fdberrange&amp;data=04%7C01%7Cbabu.moger%40amd.com%7C4b27f5f24f91458f4c1408d9e4f6d80a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637792571249191260%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=TOhfcLvsf%2BOinXAsEH2pqL%2BUdhR6izv3Y1t5dv6n5Tw%3D&amp;reserved=0 :|
>> |: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flibvirt.org%2F&amp;data=04%7C01%7Cbabu.moger%40amd.com%7C4b27f5f24f91458f4c1408d9e4f6d80a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637792571249191260%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=V57dTTtEccVO7eUYrjB1CvHrY543bKMyt4R8Z5psgik%3D&amp;reserved=0         -o-            https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Ffstop138.berrange.com%2F&amp;data=04%7C01%7Cbabu.moger%40amd.com%7C4b27f5f24f91458f4c1408d9e4f6d80a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637792571249191260%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=GAkAOUbc0e5yDC92pUkZ50IywidWbZQHaZGUfgO28nI%3D&amp;reserved=0 :|
>> |: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fentangle-photo.org%2F&amp;data=04%7C01%7Cbabu.moger%40amd.com%7C4b27f5f24f91458f4c1408d9e4f6d80a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637792571249191260%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=x%2FCSGj5ru80b%2B6Gut17epf%2BGh9skGUdiQR6CUuxSdRA%3D&amp;reserved=0    -o-    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.instagram.com%2Fdberrange&amp;data=04%7C01%7Cbabu.moger%40amd.com%7C4b27f5f24f91458f4c1408d9e4f6d80a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637792571249191260%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=MOmJdAwgSNSz9%2B%2FKo4RD00k0GFdFmldUEeCrKHBFv2c%3D&amp;reserved=0 :|
>>
-- 
Thanks
Babu Moger


