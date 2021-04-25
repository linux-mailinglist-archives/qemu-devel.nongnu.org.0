Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1192A36A4F3
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 07:35:55 +0200 (CEST)
Received: from localhost ([::1]:59932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laXQv-0002hc-NX
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 01:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1laXPR-0002Ik-NS
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 01:34:21 -0400
Received: from mail-eopbgr770051.outbound.protection.outlook.com
 ([40.107.77.51]:56398 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1laXPP-000070-5E
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 01:34:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4lsj5WSl6DhqHofZrc2Xl4BKiVWX1uxOPFoQbVj+3I1QZmNy7t38wC0EPQpipBnufXZDkIR91NPZVjvnk+WewCnh1XP7FAE50mDC+p9eg4ODb3Z+aVZ4uunTkL/VmyG5SGgf0Lvg3P+y4DjlGvUpTaBncTsOv5mHQn3z/ZFK23CDs+oYimHMQmTsvhqlUxAoOC+7C4mEQhTVX6UkVApUMjyp3eMewbkG0dTIH+cp3nPZzZK12lXOI3xkbRVMQFPsU/4wFIwNeqeRipYaGEM553/9faz6/WqqVT+cHueuHCUiilad7ouCAlDGndq/dTKmyBAMwCmgihhuDAuVNV2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4+P5kbNULEHnlT5LthVxrr0n393f3fsSv3XLNQdtt4=;
 b=UfGKKdlUee3qxbyHnGpD2gpc/GnMFbVP99S+ZoR4t7JhwniWNhIELTlIUKy0dgUTzKiM68jXnDjpvFtoKZ95iMiJa4nQK3/tncDdEh5bPNUJ3Khq828dM0cwXTkfxsLfRNVRqqJR1M2SJ42CO2wSzzR73cBbYt63haqcKG6qzZ1aCas1XO62mF5H870x1nAJXFJ1GC04nmsfMmTsM75l3dkCAmjMaAVufCkkx7k0TFM4GuxtJ0uTX1JOLArFgMzrdz9GVHvcRY5XjFQSS9SBio65x9bD6UNjf9NQsSt5P+N+R16H2K87nScW/qFu0eLNoGb+QXEr53khzafUSPFIcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4+P5kbNULEHnlT5LthVxrr0n393f3fsSv3XLNQdtt4=;
 b=V9k5f+pjeTNiMcV14gIhb7bmtjgGuPoS/f7oQpn6UQ+2hPbJG8BJHogToU1vmTlR1/vK4LBgVsScdkoTTEqgwRGfebsfw0O6L8cpObvSt5/D7med/z3ufxKqOHrlJciGNC47afHxefOPmgBYC0lAP/dOh+t82bOUk6wWnZV1W1U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0201.namprd12.prod.outlook.com (2603:10b6:4:5b::21)
 by DM6PR12MB4267.namprd12.prod.outlook.com (2603:10b6:5:21e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Sun, 25 Apr
 2021 05:19:14 +0000
Received: from DM5PR1201MB0201.namprd12.prod.outlook.com
 ([fe80::2833:2120:ed9f:c3e4]) by DM5PR1201MB0201.namprd12.prod.outlook.com
 ([fe80::2833:2120:ed9f:c3e4%4]) with mapi id 15.20.4065.026; Sun, 25 Apr 2021
 05:19:14 +0000
Subject: Re: constant_tsc support for SVM guest
To: Eduardo Habkost <ehabkost@redhat.com>
References: <a6662944-18ac-5075-1427-f92ae8e20163@amd.com>
 <20210423212744.4urvjdirnqdvqcq5@habkost.net>
From: Wei Huang <wei.huang2@amd.com>
Message-ID: <63dc9910-67be-eee4-b3dc-cf60009ebc20@amd.com>
Date: Sun, 25 Apr 2021 00:19:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210423212744.4urvjdirnqdvqcq5@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [70.113.46.183]
X-ClientProxiedBy: SN6PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:805:de::48) To DM5PR1201MB0201.namprd12.prod.outlook.com
 (2603:10b6:4:5b::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.38] (70.113.46.183) by
 SN6PR05CA0035.namprd05.prod.outlook.com (2603:10b6:805:de::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.15 via Frontend Transport; Sun, 25 Apr 2021 05:19:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cc03097-487b-4fbb-eb67-08d907a9aa30
X-MS-TrafficTypeDiagnostic: DM6PR12MB4267:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB426732E0C32FD6E876D00E4ACF439@DM6PR12MB4267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9SZ4bjNGIQeBRyOg39HY8Vn1nE4A6S4fV7YdM+xL4cOA0SSE+x1GlbjFCiNgDEQbL48YnpfvDHRoaLxEueb8iUyjmQDd5681IWZD/TcNrdlDNKacRwQXFpcKyGtqPEAzBE5jejD+WV2XDbRUylzwSd0RrwhFuvzI1MZL/x5lFiwJw1ZVlkeRHzquD/JdL5UMf9tSP6Mu2wAlt5zKcy2C/8sCt6gCyuRDu/FeFABDqTeZ0h+jpkLih+rdyiw7xpMFkoeqHI0ILtVN8DHen6yMHmCDnXwPZVxA5mOhUhg9X0AHGvW3uE/1rzve3LAH6qsbn88WyUsoizw/0gok+CSoq2TOLMBtOxDa+5tFOhBh+/tbTeM2DvxvBTIRp0Yon7QsHRxAZcYJpcL9Ci/hccADdBqIAR4ngWJ2h1Zv6tn977G1OQdDBdZ8dnk/0+UtwLsAuHIVYv5aWECsrq6/KQV7zOo7d0t5OnCwrqrZTI87dT+miNIrHZV4gp5j/8Xp+gQ7eW6XTvC6V9c5RqaymTDVZ5SHaCanFrYR0c01JbKe00dtSs84MFDDueMkn7taUmv+iV2Bb87gue25y7XRVycx75vDU9Pr/mDO1fIyyefS1/a/UpRjMOvzoDG/0O8c//V41/XMyrE72faMRCbnmWuEcsmD5Q03TC3F27C0nZ6pDDD6Q8YuaWSEEVGvnoML2DoLRUBtXz2JQh6Wg4DSVsopvdRimKTClLHXKwOl9Hck+rw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0201.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(83380400001)(52116002)(26005)(16576012)(316002)(8936002)(53546011)(4326008)(16526019)(66946007)(478600001)(2616005)(8676002)(6916009)(956004)(54906003)(36756003)(38100700002)(38350700002)(31696002)(86362001)(31686004)(66476007)(6486002)(66556008)(186003)(2906002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TGJ6N3RQdzR6dk93eWVUTlo2ZEp4TktHMnlCVTQ0bFZMYkJEUkNqNkdqYjF5?=
 =?utf-8?B?VG92Mm5YbDFZTi9rYUdaWkhNMjh1d0hiMllRV0IzeTFObFhGRUUvdzc3RXAx?=
 =?utf-8?B?ZUVKV2FBejY0T1NEZ3diTGRyeDVIbVcxNjZpQlVKd2I4UW1MeDRhVkRrYmFw?=
 =?utf-8?B?bEhDN0poN3Y0RkpldW1oOG94L0pHcVdBUzlYZTY1ZUUreURWUjVmNzFLTVI1?=
 =?utf-8?B?WElFcHpNaytjNmhPMkJHNmhRUU5vMlJER05kQVNDcWpZcXFOZ3U0WnR4Qkd5?=
 =?utf-8?B?L0FzbjladHNqN25vR0lOM21MUEI5cWxLQ0UrbzI0S09zYi9IQkJnOGJNeHdN?=
 =?utf-8?B?NXdDaC9hUXJUcU15VnJrRXlyekY5NUxSajBucUNIczcxWTZjdWZ5QmVqUzlZ?=
 =?utf-8?B?ZEdSN2lYNjY4SHpkbmFENGJteFlaM1ZObytKR3RGYngrUmE1ZElsK1QyRzVn?=
 =?utf-8?B?R041b2JkSEZTTXlBU1lBcHd3eFdlajMyRGVtaVA3RE5kOG1IYkpSZ1pjMVRs?=
 =?utf-8?B?Y3NnekRzckQrZm13c0V2R2ZwSEE0bjBVNzZ2VWY1OVV6Qjd0RnlZMHR3QmJy?=
 =?utf-8?B?MG83bzhhZlVKOHozQm9jcTVlYnB4TWtCTHlkUDNXM0xBQ2NocUhSemYwQytV?=
 =?utf-8?B?OHRBV2o0MmIwRWk0dW9zSlQyRjBjVXM1YjcxWTZ5Q29KeWRGdFdPVFdRMXNi?=
 =?utf-8?B?MFo2czRSbUFkdnRsSlA2aUNvM25lR21QQS9sYzN5T200c1l5eW5PS3V1TjV4?=
 =?utf-8?B?Wnp5ODJJVFRKS2pTK2RCZGdqakg1ekovR3JjbmhtNi9vZzloQmpOM1FxR254?=
 =?utf-8?B?OUVnZ2xOdHZmT2tNL0JvL2h6b2pFQUx4dFh5WUFYbmE1WlZSV1lReXZkMTJw?=
 =?utf-8?B?U1ZFaFM3MS81Q1RsR2JBSEJtaXR3d2VWenZaRDN6YmZ0ajg1M29INTlRUmti?=
 =?utf-8?B?Tm9VWFFCWWNsdENMNGJ3SFdaU09LQVpBVGFrcElHeWJjUXBJTmFHNHQ2M0hs?=
 =?utf-8?B?bmFCVDhyNzFWaEhaRjdTbHBmaVFRNGlXM1ZoT1pzbFR4czBlT0lrbEpJV3ZU?=
 =?utf-8?B?NXZyNkF6TERQSHBmMzIxT0paZmdRRFdYWjczc1lwb0lsbWlPNVBJaXlIVFlM?=
 =?utf-8?B?YVJKVlpwaXJQdysva2lrTVVrZlAxeUcvcExHZE1JUy91akVEMDkwa2UxMkV1?=
 =?utf-8?B?M2NHRkRoSlJscldEbG1aUzdSN0dZWTZPSkdvamNubkRneXE1V3pLMVBlVWJj?=
 =?utf-8?B?QVlXNDJUZk9oeHlSZXA0U1BkMDZjMS9qaEZ1YnZHK29tU093L3JITUdNcWlB?=
 =?utf-8?B?RzRNcFg3VmFuY1E2TFU5K3hwc2g0b2lmSEt5eVJvdDI5ZjR2Z1NjazVlaktU?=
 =?utf-8?B?RElCYzNGTDFXd2NrVnJMNG9uUDdVQW5RL2tyRUEreWt0RWdoSHdOc0NPWUFW?=
 =?utf-8?B?OVRYUkgwb1RqQlZMbWF6ZExUWE4wR3hCYVczNjN6WmtQd3Ezd2RIdjFRc0Ru?=
 =?utf-8?B?VzBhNnlTUXdJWndjQjRheDdvZXFaWFh2a3Y4NzVseENlb2RpajhDZk4xNjdW?=
 =?utf-8?B?SmFUR0hrcGxUL0dtMloxTENpQ1kzREV1R0dlQTBXdjZlelFNSERSTDF1Zkts?=
 =?utf-8?B?Z04wcG9xUDl4OElCWnkxWjVtUm13UWJKQzlOYk01MytmSWlENkZQME9peXdZ?=
 =?utf-8?B?L1Y1ZW1TSTRVaVJMbktaMlNCbXg5Q3RkbDQ5RTJocUtVcnhlb0VmcHA5WGRQ?=
 =?utf-8?Q?X26sGkp69EmEXENlm5uZitCDByXi7QJsWBc1wbx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc03097-487b-4fbb-eb67-08d907a9aa30
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0201.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2021 05:19:13.8314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewLEeBkHU7mZPe37xHyKQoTcW3MAP0Z0xoI1F1uNXz72lwM5HBjGRBjXjh7nnPfH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4267
Received-SPF: softfail client-ip=40.107.77.51; envelope-from=Wei.Huang2@amd.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, "Moger, Babu" <babu.moger@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/23/21 4:27 PM, Eduardo Habkost wrote:
> On Fri, Apr 23, 2021 at 12:32:00AM -0500, Wei Huang wrote:
>> There was a customer request for const_tsc support on AMD guests. Right now
>> this feature is turned off by default for QEMU x86 CPU types (in
>> CPUID_Fn80000007_EDX[8]). However we are seeing a discrepancy in guest VM
>> behavior between Intel and AMD.
>>
>> In Linux kernel, Intel x86 code enables X86_FEATURE_CONSTANT_TSC based on
>> vCPU's family & model. So it ignores CPUID_Fn80000007_EDX[8] and guest VMs
>> have const_tsc enabled. On AMD, however, the kernel checks
>> CPUID_Fn80000007_EDX[8]. So const_tsc is disabled on AMD by default.
> 
> Oh.  This seems to defeat the purpose of the invtsc migration
> blocker we have.
> 
> Do we know when this behavior was introduced in Linux?

This code has existed in the kernel for a long time:

   commit 2b16a2353814a513cdb5c5c739b76a19d7ea39ce
   Author: Andi Kleen <ak@linux.intel.com>
   Date:   Wed Jan 30 13:32:40 2008 +0100

      x86: move X86_FEATURE_CONSTANT_TSC into early cpu feature detection

There was another related commit which might explain the reasoning of 
turning on CONSTANT_TSC based on CPU family on Intel:

   commit 40fb17152c50a69dc304dd632131c2f41281ce44
   Author: Venki Pallipadi <venkatesh.pallipadi@intel.com>
   Date:   Mon Nov 17 16:11:37 2008 -0800

      x86: support always running TSC on Intel CPUs

According to the commit above, there are two kernel features: 
CONSTANT_TSC and NONSTOP_TSC:

   * CONSTANT_TSC: TSC runs at constant rate
   * NONSTOP_TSC: TSC not stop in deep C-states

If CPUID_Fn80000007_EDX[8] == 1, both CONSTANT_TSC and NONSTOP_TSC are 
turned on. This applies to all x86 vendors. For Intel CPU with certain 
CPU families (i.e. c->x86 == 0x6 && c->x86_model >= 0x0e), it will turn 
on CONSTANT_TSC (but no NONSTOP_TSC) with CPUID_Fn80000007_EDX[8]=0.

I believe the migration blocker was created for the CONSTANT_TSC case: 
if vCPU claims to have a constant TSC rate, we have to make sure 
src/dest are matched with each other (having the same CPU frequency or 
have tsc_ratio). NONSTOP_TSC doesn't matter in this scope.

> 
>>
>> I am thinking turning on invtsc for EPYC CPU types (see example below). Most
>> AMD server CPUs have supported invariant TSC for a long time. So this change
>> is compatible with the hardware behavior. The only problem is live migration
>> support, which will be blocked because of invtsc. However this problem
>> should be considered very minor because most server CPUs support TscRateMsr
>> (see CPUID_Fn8000000A_EDX[4]), allowing VMs to migrate among CPUs with
>> different TSC rates. This live migration restriction can be lifted as long
>> as the destination supports TscRateMsr or has the same frequency as the
>> source (QEMU/libvirt do it).
>>
>> [BTW I believe this migration limitation might be unnecessary because it is
>> apparently OK for Intel guests to ignore invtsc while claiming const_tsc.
>> Have anyone reported issues?]
> 
> CCing Marcelo, who originally added the migration blocker in QEMU.
> 
>>
>> Do I miss anything here? Any comments about the proposal?
>>
>> Thanks,
>> -Wei
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index ad99cad0e7..3c48266884 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -4077,6 +4076,21 @@ static X86CPUDefinition builtin_x86_defs[] = {
>>                       { /* end of list */ }
>>                   }
>>               },
>> +            {
>> +                .version = 4,
>> +                .alias = "EPYC-IBPB",
>> +                .props = (PropValue[]) {
>> +                    { "ibpb", "on" },
>> +                    { "perfctr-core", "on" },
>> +                    { "clzero", "on" },
>> +                    { "xsaveerptr", "on" },
>> +                    { "xsaves", "on" },
> 
> You don't need to copy the properties from the previous version.
> The properties of version N are applied on top of the properties
> of version (N-1).

Will fix

> 
>> +                    { "invtsc", "on" },
>> +                    { "model-id",
>> +                      "AMD EPYC Processor" },
>> +                    { /* end of list */ }
>> +                }
>> +            },
>>               { /* end of list */ }
>>           }
>>       },
>> @@ -4189,6 +4203,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
>>                       { /* end of list */ }
>>                   }
>>               },
>> +            {
>> +                .version = 3,
>> +                .props = (PropValue[]) {
>> +                    { "ibrs", "on" },
>> +                    { "amd-ssbd", "on" },
>> +                    { "invtsc", "on" },
>> +                    { /* end of list */ }
>> +                }
>> +            },
>>               { /* end of list */ }
>>           }
>>       },
>> @@ -4246,6 +4269,17 @@ static X86CPUDefinition builtin_x86_defs[] = {
>>           .xlevel = 0x8000001E,
>>           .model_id = "AMD EPYC-Milan Processor",
>>           .cache_info = &epyc_milan_cache_info,
>> +        .versions = (X86CPUVersionDefinition[]) {
>> +            { .version = 1 },
>> +            {
>> +                .version = 2,
>> +                .props = (PropValue[]) {
>> +                    { "invtsc", "on" },
>> +                    { /* end of list */ }
>> +                }
>> +            },
>> +            { /* end of list */ }
>> +        }
>>
> 

