Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313CC52CC5C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 09:03:46 +0200 (CEST)
Received: from localhost ([::1]:46766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nraCE-0008Av-8i
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 03:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Suravee.Suthikulpanit@amd.com>)
 id 1nra7q-00070k-W4
 for qemu-devel@nongnu.org; Thu, 19 May 2022 02:59:12 -0400
Received: from mail-bn7nam10on2070.outbound.protection.outlook.com
 ([40.107.92.70]:9600 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Suravee.Suthikulpanit@amd.com>)
 id 1nra7o-0002WH-FF
 for qemu-devel@nongnu.org; Thu, 19 May 2022 02:59:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8KOcGUVToL5s0d059cykVC4d5c8kslADKQBXWq57tyByva4bS9JZ5+c41dQJf6z46KKy8e7Dyuh0w3saVBZ8cm+xaGHAaX3wnkUoqw80J73prfkW5dPWV+q5WozMGHHeaVCTs3obdrR83YTE5hTXlsY31RdDjxqC2iR7A58f9CsyyJYHnX7Gi5Q8tQX6RidtbAMjyY4wvg495bFtKz5TA3+XbPAEYdKDWw/k2G9xvXhLTuFGEfuQmKpxDhESKts8ZPgH/nb0v5iBlC7KeM3A2+Hm7eAox0ui2NDUBXBJvVDgjWECUr9hlhsD50OscMOGHjUQNK0arDffJ0rcPPpeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHQY3neeAuEewzrqqjk5Mo7qXpLbnPrNxanRgcqu02E=;
 b=GBo6JjplvisZSPJ1cQwLpN51wvsPsSDNxA48Egt/nD9saVdXqpeZgNLYb5y9FF73P0TwYjPJDnOR95TvdxEOvmVZsiFPHENT0P2C1oKoII6rkk23TleIc1u1TpbZL4+qR36vIDBMm4JcWphNfoAjOMP7hOZECdZ4iuidEMILf4GnV1vCKURKuMOC92Ve+0Ih1RNiTmhTk0Cn9SgT3DLmZQTZIPiej8J3AB3p2wJ2XdS1b5K1mIUjg2HErywFUCoheqYh6Hbz9L6SgkbcCOB5Mbr1E6d/V76Cl1gxIg3XPmL/Pl3TuCv556aXZNPzDETLvf4Rwd19anXrgd3gbiueOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHQY3neeAuEewzrqqjk5Mo7qXpLbnPrNxanRgcqu02E=;
 b=uuMz4cGSdUSX1WI84OBnTK33LFdCqn1czhE28mKIZASkFBFxtczX59Uq0BbiLhAhMqwqSU/y+TrW2FJwClvraxVUtJ2FaVR7jG6KTjTucwvwjtX4kaT3525wPX9ye0swFr9p9NkrY+0KEezmu/EDCXVDkEwmlrxg3fxKygt8zlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5445.namprd12.prod.outlook.com (2603:10b6:8:24::7) by
 DM4PR12MB6278.namprd12.prod.outlook.com (2603:10b6:8:a4::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Thu, 19 May 2022 06:54:00 +0000
Received: from DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::8c27:b470:84f9:82b8]) by DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::8c27:b470:84f9:82b8%7]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 06:54:00 +0000
Message-ID: <2cec4bba-4400-ae74-231e-c064f03df691@amd.com>
Date: Thu, 19 May 2022 13:53:49 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] pc: q35: Bump max_cpus to 512
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net, jon.grimm@amd.com
References: <20220504131639.13570-1-suravee.suthikulpanit@amd.com>
 <20220509091249.392fdab6@redhat.com>
 <20220513072007-mutt-send-email-mst@kernel.org>
From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
In-Reply-To: <20220513072007-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0025.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::12)
 To DM8PR12MB5445.namprd12.prod.outlook.com
 (2603:10b6:8:24::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd724339-1c1d-4cef-ce05-08da39645a4f
X-MS-TrafficTypeDiagnostic: DM4PR12MB6278:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB62782779F0DA0C73E9605CD6F3D09@DM4PR12MB6278.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ow8aI9K86ETcqF00mGlqvcfUAs1rG2EQDOf/ojGNVE8ae9Crd9x7DyFDeX2Z5dAU4zsMnu4VKD3Arbk/TbkpIj5J41wYR/yI8Ow3Ya1jgNOUGcb+ISLXHIg7pSSGzc8/H3cVjNferZw7EjRNSOstsfW2trnvQPj3rGWs20jEZrnXHWjmGl0uLMvv1ChaRrTW3mukWLkXNHRgESGsrPtLH3k0znzCWOm3l2HOy9gGC1SjsZi8YNZ3uH1JdtdGW0W4eLpomrNKZSKx7olLYKobatNKck09OcWzdbNgUu+PLLKjLmMWzWoXNLk8MWdKdCZN1swtsFdfBpdt8DsukRHuVP5l87ssWVEWOTj3AfJp0HyleN2zuYK01hfg/49y6ys5y8f//pl2ehH4Wqv3tvdVAJ3sr1orBrAgkkGel/AXsSz8lSqkpFwg5Q2AwnSpeEeFXp5fVwVnFdL0xyd1TnjCOjT8OBuut/h+e5rptjSmRDan9VO98osNbg6H50MD99E/28oONbCgvS1qaMC92ivWmZPS2xf6nq2UsHMq5y7fHCpOcMd5demWHMZaWrAAJPYBl1+mRVFNpBX8iWC1kLXSCnurB2oqmbajjNOMDUfWLilY8UMxZKeV62dcnta8tNJ9EEoh5ibM1CFuVeI6ZcQyRvs+YJN7X0R0xOqdFk8k3nHedpV7B8V523puRta+g1CXwXQhc4TBWvKq6X9YAeXUgwCDYGZJCZcQbQXAOJiyP78=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5445.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(53546011)(44832011)(186003)(2906002)(2616005)(6486002)(6666004)(83380400001)(6512007)(6506007)(26005)(508600001)(66556008)(38100700002)(8676002)(66946007)(4326008)(86362001)(66476007)(31696002)(5660300002)(316002)(8936002)(31686004)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RCtiZ2xjQWtSb2V5ZEIxTXQraVVJUnV2dXVna0Z0M0lObGdlRGltT2ZwaHcv?=
 =?utf-8?B?UFgxY0dldzVRTXlWMWxrZ1Y2ZFJjTFI2SVJyUmdPd1F1c2pDWlpWQS9FTXNZ?=
 =?utf-8?B?M1lIZi8zUFdkdTlRMXI0MGNzMVFobDNtZVc1aVJ6cWpZeHpod1d0TVREV28v?=
 =?utf-8?B?cGxCRmJMKzIvNzVmWUtaS0pKWUFxOGhkQ1U3UEtwaklYSms0dStWRXBoQnNV?=
 =?utf-8?B?Q1F4NDRteU93bnhZNWIwWTBJZXJPWWlyQURHK0RvcWx4YVRRWmZyZnRvcmFL?=
 =?utf-8?B?RlRNL0xDOTk2NlZTUUhsSGtEc2FCWVpsV1RKcURzcUZnanlKdEgrYU56SWdN?=
 =?utf-8?B?elM1V3pCK0tvTEc4NGtBOFZsd1hzQWJhVjY2alRNVTFKN2ZFMU1taXEybzhp?=
 =?utf-8?B?K3Y4bkFTR1ExTjgyYzJtLzNnSi9RSnRxdnlVZFBLK3JSTUhSMit4NnF2QWJ3?=
 =?utf-8?B?MmNNMExaY1hUeGoxTW9xSnEwUlNRU296aWI0eWEwTDlIcHIzMTJZUmR1K3ps?=
 =?utf-8?B?d2llTi9vZGhQWkM0ZGhhYVRKeWtCb1V5NDN1NjZtaEVjcEtrR2cvcWNUdnI5?=
 =?utf-8?B?ZU1OUC9lc0ZZT0hVN1JrcC9oQ0ZWbW44ZFdiSE9Nek1GaldyMVp5V1l0SWZx?=
 =?utf-8?B?SHVsREJZL2psZmFRVDVXZFVVWDkrakNMZyt3UlNBL1JSTlRaWW83eGora1cz?=
 =?utf-8?B?VVFwcXh4Qjc1R0JtcDFBZGhQcW43emxwTGNYQi9NQzY2UlRiSzNNcjh4d1c5?=
 =?utf-8?B?VkVjQ1hxRUpGUWRUWWYrNHNaWS9mQVJjWUEzSE52eXdjM3lNNGxDYjI5OUhC?=
 =?utf-8?B?WFJGbDJTU0hHU1lHbGxEUlVuZkNqMmJoY0w3YkhjWUVtdVNUWlpiRjJOazFm?=
 =?utf-8?B?alFGQncrZHQ1Qy8yelgvRjQrYStodk9Ka2hkbkhCY0FvOEFLcEdLK3hxd3h6?=
 =?utf-8?B?dk9zT0gwL3lQRlRnQWtTcHBIbC9mUlg0RWswaGMyNk5ka1RJeW15RDNYUzJF?=
 =?utf-8?B?K0hPNndFbGNjQTJRempvcE1Gek0ybERsTXJHWHhuQ3dsVjBhdit1eTNiL1E3?=
 =?utf-8?B?Si9VMU1aNnVid1IxTEFWVVE5RDh0KzcvbTJXMFU1SnJiY3d4aXh0RHI2S0Np?=
 =?utf-8?B?ZDY1eWxaVlQvOWxONC9GS2EwR3dyR0YvSUkvR3dOSGcyeW0rL0JwRG1yVlAz?=
 =?utf-8?B?ZDlqUGF3bFhoSlBVNEdCa1g0Mkw3WloyUzVMZWZjazRRaGxHcXZSYk9BT2lX?=
 =?utf-8?B?K1VZbkNueUk5bStkZ1ZJWVFDY1M5UlRjdlU1RGxCbjBQa1FuenZ6Tllhb05C?=
 =?utf-8?B?TStVVGYwNTV6Wi8yOEM5eEg1ejExM1I5dEdWVDNwb0JKaXZLVHdRZEdGWG13?=
 =?utf-8?B?TVBGRjJMNEtoNWppanBTdTkxMHIyWTBQeHpaRDhUakFla3huYWdHaERmSzBS?=
 =?utf-8?B?cGhBNVpBS3A4R2ZXTlhlVWlKSEtTejdTUTBqNFpkL1J3OUwraHlJdlkvbkFY?=
 =?utf-8?B?cXAwNWlERzdBbXgwYTduV014cFNRNXczS0RiR2FSb2k5VlMvUzFsTVE2ellP?=
 =?utf-8?B?WEwwVXB4RkVPdXRCbkc0VW9OTVY3TGxkVHp4aExUMXlKN2p1dVRrS2lrVjFi?=
 =?utf-8?B?VlFiaG5aOStCQjNUSnY4ZnpZRVJGZzF4TEx2T3FNbzBVaVZLcERwc2xzL0RE?=
 =?utf-8?B?MHBQeVpzczR5bmVtM0xUaTZGSTZ2UjFrQU9pVGxRb2F5eVIyL09MT1Y0cGZq?=
 =?utf-8?B?T2Fqb1hMSXR6OXcwV1RDRzlHc0VlcmdGbDMzR3ZmVDc4MERxS0NGNWZjVWdh?=
 =?utf-8?B?UGFCQ2RXdnFRaVJWdXZkenZNazIzbVpjcVhNMDdydGx6Q2IveGhDdXVMUURt?=
 =?utf-8?B?VktMb2dFcklvMTk3TXFZa0FlWmpsajRjd2ExQmIyWHFMR0t0djUxaXpOUktw?=
 =?utf-8?B?bzhOV0d0L0Y1MUJzV2VYSEM3T0Q0T1BtQTZ1SC9yOVlER0Rxbzg4K0p6NjN6?=
 =?utf-8?B?NGdSMk9veStoY01aZndCd1lIRlBBZHNhUkQwZWNvc3lYaFkxTzZuc0tNWmRz?=
 =?utf-8?B?bHZWYVE1U2kzRmRNVjJQOUR4YzlzSlVaNWJGeVlxbDFyWTd1VkJNdWVhV2hG?=
 =?utf-8?B?bjZwZ0xsbGxEUmphNnVxZDJjNUc2SjJJT2RUanFMdnZ2NDVYU0pZby80ckl4?=
 =?utf-8?B?QlpCZWJxaXUzUlMreFEyS3BSQmdubVh2YkFiOUgwdlFOUkgrdGROYzZnYko4?=
 =?utf-8?B?U3lQRnAyaWQ0Y0RadDkxZnQ1emNYS29ZRzhmRTc5YjdHZXdia1pVS0p3bTRR?=
 =?utf-8?B?aTU5dk9nZDF1ZE1ZOHY3MFpzZHBVL1NUcG1VWTduaGNtSGI2bXc0dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd724339-1c1d-4cef-ce05-08da39645a4f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5445.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 06:54:00.4788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFuv7jd0RPkxT92pKg+rKBlpHGyvZw8t5xH0RHqBjkpLFlv9gj3WK0UM5c9c/tlOcMz3yaUyWOU62emq7f3BzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6278
Received-SPF: softfail client-ip=40.107.92.70;
 envelope-from=Suravee.Suthikulpanit@amd.com;
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



On 5/13/22 6:23 PM, Michael S. Tsirkin wrote:
> On Mon, May 09, 2022 at 09:12:49AM +0200, Igor Mammedov wrote:
>> On Wed, 4 May 2022 08:16:39 -0500
>> Suravee Suthikulpanit<suravee.suthikulpanit@amd.com>  wrote:
>>
>>> This is the maximum number of vCPU supported by
>>> the AMD x2APIC virtualization.
>>>
>>> Signed-off-by: Suravee Suthikulpanit<suravee.suthikulpanit@amd.com>
>>> ---
>>>   hw/i386/pc_q35.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>>> index 302288342a..e82b1c690d 100644
>>> --- a/hw/i386/pc_q35.c
>>> +++ b/hw/i386/pc_q35.c
>>> @@ -357,7 +357,7 @@ static void pc_q35_machine_options(MachineClass *m)
>>>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
>>>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
>>>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>>> -    m->max_cpus = 288;
>>> +    m->max_cpus = 512;
>> Maybe we should bump it to KVM VCPU maximum,
>> and make sure we error out if asked for combination of
>> hardware/irqchip is not usable.
>
> So what happens if one does 710 and then tries to use AMD x2APIC?
> We'd like that to error out, right?
> 

Since the AMD SVM x2AVIC can support only upto 512 vCPUs,
KVM would return error when QEMU tries to create more than 512 vcpus
in the following call-path:

   kvm_vm_ioctl_create_vcpu
     kvm_arch_vcpu_create
       svm_vcpu_create
         avic_init_vcpu

Also, I tried to find a way to get the KVM VCPU max value via KVM_CAP_MAX_VCPUS ioctl,
but the accel/kvm/kvm-all.c:kvm_init() is called later than hw/core/machine-smp.c:
machine_parse_smp_config(), where it checks the specified QEMU -smp option.

So, if there is no objection, I will send out a patch to change m->max_cpus = 1024
to match current KVM limit.

Best Regards,
Suravee

