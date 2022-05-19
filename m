Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6459752D4A4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 15:46:22 +0200 (CEST)
Received: from localhost ([::1]:45886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrgTs-0005SY-Ng
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 09:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Suravee.Suthikulpanit@amd.com>)
 id 1nrgRf-0004Xd-55
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:44:03 -0400
Received: from mail-co1nam11on20628.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::628]:19265
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Suravee.Suthikulpanit@amd.com>)
 id 1nrgRc-0007wr-S6
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:44:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjzAkgWqlk8OGRj6EZvgQJj7j2VOILdJx1Y5iqM2WQvz3x2WZrPDz22rFKfXvuF8Ynh3BK2wk/7mRLdTVlupxVU/5sWyYVF4W/x+9v84oGddk9HNJ+mQaIrLo2+Red7H+ElGN6rMHotowoJTAqfFTQMy2/GzRllENqRbgeIxVyRA0/ZlqT2VGJnsqwIF2RPXZocFrkTjnSuYgtAz6GVKvmilyOH29rjgfEvxwL9boVqdzZ3/J9NGtWBTIrp0DRZmN9xXtUZPWqUDj8Zrc1vC6zVZtXFhwSobJO28gOn4fXVp5BFnas7h5TNiy61km6Wdov771+Y9MoWCikLoWHHGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTN9IvTOfEf3ZjQYm0yLG9uAFCF6AHVquWNAftT22v8=;
 b=dL+Q9qAbFcQ/Bd+whlVodyxCK2piwIC4ku2nRmx1jGg0QpT1r0hOmTL1YwRC4DK2jDHPvGlhjPDlZYb820ZM1gRlTuCazhB2io1gFqdWBetdKGSy1pODFFZbq9znMHX/6949LLb+pVx9mXT8rlJaF/aH3/lsjDT9CavU7CKy6+jZyC5OBU4LGkNIvKjOSiGXznx92mG203Yc7eWusymbB8LborHDZ5fLu1fisWysH3MyB5xGmmDEaX+FgcNCDBsHI+FLgBoL/KKWDWJcl5mFL5curbeJgN8+uqMYD2r4xCuz4Rl1y9pspcMo7RMnS395VOZSFCeO3K3Fg9EdR8g5Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTN9IvTOfEf3ZjQYm0yLG9uAFCF6AHVquWNAftT22v8=;
 b=Vo7wyvGd+0mqcKzhnz9EsR43g2RZThCakFxUehfuN+eNYqvDyNl5iUDqW+8eK9iAoiMVIg8BkdK2muusxzgaoYleNoJDlidO8kLjJtbYobDt5B5NJPFxUvjTmj6u/I0jT5RxFUrEqAPZfkMvrmGUaaF96nZhuVXaU7d19foPjDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5445.namprd12.prod.outlook.com (2603:10b6:8:24::7) by
 BL1PR12MB5029.namprd12.prod.outlook.com (2603:10b6:208:31d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Thu, 19 May
 2022 13:43:55 +0000
Received: from DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::8c27:b470:84f9:82b8]) by DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::8c27:b470:84f9:82b8%7]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 13:43:55 +0000
Message-ID: <dd43d5df-71cc-45a9-d496-d9607770d36d@amd.com>
Date: Thu, 19 May 2022 20:43:45 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] pc: q35: Bump max_cpus to 512
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net, jon.grimm@amd.com
References: <20220504131639.13570-1-suravee.suthikulpanit@amd.com>
 <20220509091249.392fdab6@redhat.com>
 <20220513072007-mutt-send-email-mst@kernel.org>
 <2cec4bba-4400-ae74-231e-c064f03df691@amd.com>
 <20220519143754.42b200d4@redhat.com>
From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
In-Reply-To: <20220519143754.42b200d4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR0401CA0019.apcprd04.prod.outlook.com
 (2603:1096:202:2::29) To DM8PR12MB5445.namprd12.prod.outlook.com
 (2603:10b6:8:24::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36113109-bd7d-4a46-11b6-08da399d9e2a
X-MS-TrafficTypeDiagnostic: BL1PR12MB5029:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5029E1ACCAE4445A5C52A03FF3D09@BL1PR12MB5029.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dp8jgq74DiuAySSQaqxOW799d5woOpIEsv35684S1nxTrvbWSEnQU6KDU2BDuK5rUE5hEoUuGpa3ngy+rdwOzB6ufVqFshP8sS/NLzj0mkATb8MJIcrkarhBGe+PV/kPiJE4XfzYPgUkQ/0IUba0RA4ZfLgjc3M2T2d7pLp4XE5BkKXDq8vxBWTtR+PMrg4bem4PwM75vqCVAAq4ZdLRoD74cbjVtK+LN5pqrP+tWCpbR/+a2f1RnkMBUw3Xt9p0UJJTuHzEWgUHcG6hg5rsxkdtvkJ/rnNbQsPBJ/8z9h4EIIwuXVGNkfiZnx6dQm0Ora3qKYN0C+tj8McEn9Flwqhdvhyam+/if8D0vd5yFXJzTbMmENGIw8LKmYBHMi1RS5/hHGqbh6xJa5Dca4GVJkDBKz2hkaqcPT4PUSKDLSNQuOoDQhP/UxM9aEcVTMill32NwRlB6AhCEpWczWzAVhBFb+hK4mYXKACpZFUyhUF3xoaHsvtfK3jHzQ9AecCyLgotgOYeSwIjF/ZjJkKN4KMslYLrZwNmFmkLJHf47jkwvwfrJhfb5HLJ47ckC6hjco+efdYuoBL7oUR37GuSBTmorylZnQG1S2lXmCrA5nLKRQbFJKdyypqoBVdFb2/R1zlA+eSrf14pYeZmojBkr3CYsV7le2oI8H6RcwjJZ5CwSvUCgsYdfO7nJ9LtWVodc4MLY0L9hViAlyfomboJJChh+4OavXz2JY/7nE07dy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5445.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(2616005)(86362001)(6666004)(8936002)(316002)(6916009)(8676002)(66476007)(66556008)(66946007)(4326008)(508600001)(83380400001)(44832011)(186003)(38100700002)(36756003)(31686004)(6486002)(53546011)(6506007)(2906002)(26005)(5660300002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXZRcmVJMzE1TFp1MElxTDhwbzVOdE5kQ3VsWFgxL1g5Ky9jLzZua2tsRFpk?=
 =?utf-8?B?eDhjelM3RUNvdFdRV0ZNUHBVSDNMT3M3UmdaWHc2d1FSWWFqMFoxMjd6Z1Mw?=
 =?utf-8?B?NmNDcndyVHFKZ1lvQjlscy9IU3RHVjJ3Q2tCampGdkVYQTJ5aFJsZkRja2lO?=
 =?utf-8?B?Y1FwRVhCM20rZFluc0FndGZBYWlaWUs3ZjNVMUVPZkdtTzk1UEFlaVA5L25F?=
 =?utf-8?B?TEtVcElUL2dEWTM1d0hKNzFDeUJCczBTalQ1VEJEcG9jYzFTMlJXeVAyS0tI?=
 =?utf-8?B?ejhQSEZIMnZVQUNpRFVneXk4K1l1QXJBNTNuT1dBaFJPVytRS2xYOEk2S3hX?=
 =?utf-8?B?clR5MTlNYmNOaWN0NStkMjFiVnJSWUdtV2RHTkN1a3ptN0psWGRkNnQ2N3lO?=
 =?utf-8?B?Y2JUblQwdGE4Zzk3WmJxalBVem9VTGtLSS92eEFTU011dHNqNk9aUTEyVjNO?=
 =?utf-8?B?VjZQdmFEYkxZejVpL1lEZlhRSkNpWkRQdFdNZmVXZVl5V2plQ0pwRGhCQjFR?=
 =?utf-8?B?NXoxaWdjanZIRHRoMFk5TUVZeUJkYXhVL2xhdk02ckN3bXZ4eTVGNDlKNk9F?=
 =?utf-8?B?L2p3UEVYRU1Uc3p2VWIxNHNqbU0xcGYrT01rOWpHR3NtZzRXbVQxTU9NMHBi?=
 =?utf-8?B?dG5nQ2NuNmlXdjZVR2pkNDFGanpGeEw1NVJlelVDMUxvUGtrMEtGUm4rTDQv?=
 =?utf-8?B?UzJDUlhJakFleDlUOWtNRncyQThEY2dnYmxrYk9KT0FmZXgzUnBNQzFjdGlU?=
 =?utf-8?B?QlZwMkpyeDBlajUwOTJrRkhPbFRveG90dW9GbEpJQkRtQzlpY1ZyTHVoU0Y3?=
 =?utf-8?B?SW10WnVRY1BHZWRBTG9ldzlwOWJNU2JTQnJmTEZvRjVXT0NlNVhXUnE4VzFM?=
 =?utf-8?B?c2xXbE1UTVoydWlNMkpHdjhqNVF4cW84NXJPNnpUbzhPMmJuNUEySkNMZUxE?=
 =?utf-8?B?SUs5UWMrOUNlZ1BpNzE1SUprVld6SjMxRXg4ZDdzMmlPMHd3K2daYmE4Q25J?=
 =?utf-8?B?YlJUTXBTVmJjNFhmNnlzS0tqb2g5ZHB3YTNOMWlrOUhQc0wvSVJ1TlEzb2V3?=
 =?utf-8?B?Z01GV2Y2QnhPV2VYSjBBcUEydzRuQ3gyUEd5QWZLV25iUWdOY2NVaEJiVU1j?=
 =?utf-8?B?cHN5cm1FeC9FYTNIZDVRR2xPR0tkN2Z1QlpRKzQ1c2YxaXN4RjFqS2psZ0V0?=
 =?utf-8?B?K0pTNjhGN1ZlU0J4Qmd6NmZOaGxMSzJWck5lanpTR1lnZmF2bUI0SlUwSkZz?=
 =?utf-8?B?YTJiYzRQVWZKbWN0c1pBYlZUZC9qZDRtV1JEaGdUU0tyUVpqZnFoOTFlRjE1?=
 =?utf-8?B?Z3ZNR2tNTklOc000QnlQK1U5S2ZVZlgxdEVUakI5dW4wUEFWNlk1bXZpMHdp?=
 =?utf-8?B?ZnpleGNFVHo0SmpwcENIUktBYUx0VERlbVBOc2xFKytSaDRyNzcrMHBsUk5H?=
 =?utf-8?B?THZLU1pUOFVwOGcwYWJySDRmamliWjBYTURKc2k2Z0NMeXRoSkFEYzVWOHUv?=
 =?utf-8?B?NWczc2FSc2k2MWYyMnNKUkx5Zjg2UlBERjU4d2xrR3JvWnNObzhnemQyV1Ux?=
 =?utf-8?B?ME5wam9RYXFTRDJ1cFVqdWhWRU1nRDFVNTNVRGc2dGVLdDB1aUdWa1A2c01K?=
 =?utf-8?B?NDNLSlNlTlNSakcyUWxNTVRqdW5PMUl6ZkR4dUZwZUswdVJ2VGxvZ3duWDFS?=
 =?utf-8?B?U0NuUnNUNnBKRUZuRU5pZ0Z5dklsZCtRNTVUK0xMRnlWVTYrTm9qU21HMzl4?=
 =?utf-8?B?MTFPbEtjaUJSR1YrM0lxU3pidzJVbXUyMFhKNHFIanhkVVFJcERadWhZdW5t?=
 =?utf-8?B?c3F3MXc0cTh5dHZET0NVanVDV2xzZkNJSlNoNjlVSGJCblVuallCRS9Rbk1T?=
 =?utf-8?B?aEc0Q2JJNlJ6TDF5MUZDZHN0dC9MZjNwS2RMUGhZM0tjdzRWZWVBeFNKSFRE?=
 =?utf-8?B?NWI1NUtDWGtVOXZIbmlUTmlFRVBubUFvRUdOS0ZqOWhVYVA1Wlk3em1IK1J2?=
 =?utf-8?B?NG1vNzdXMnRsSzZZZTRlWkpOWGJCbjN4VmNqOVhRcVdkVHQwcGQ2N0dCSFhR?=
 =?utf-8?B?bFlJV3F0L2k5SFY0VjVLdVVBTjFwOEpGTHpIOHQxUFZqYW8yOFJVbm5TRU9U?=
 =?utf-8?B?ZzJuN2J3ekVnc1kxU1BuSzRMc2ZWWXZyUEhBS2tJeWhmbCtGVFI5R1MwYmZ4?=
 =?utf-8?B?ZmFsM3VNMHdvVDcvUGZCQzRUUEkwSFUxaUNlTkJtUERYaVFQc0s4Vk1JdTN3?=
 =?utf-8?B?Tjkvb1lyWGNLZ1l5VG5WNVIwWlZZb1RURnREZVVJa2VINTJQRExWNlZ5TytH?=
 =?utf-8?B?MnM4eHAwSFJmR2RIdG5zTDh2bUNzQ1MvYjRXOTJkSUhMT2VGYjAyQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36113109-bd7d-4a46-11b6-08da399d9e2a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5445.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 13:43:55.4114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dt2hqULu2DJErOjoCAZBraA/SXxSwsKuGmJPAaPUKVj0vLNZZggnHa2YE+iIfVC9cAjPcsrgSOZ9bRGzZ5gvEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5029
Received-SPF: softfail client-ip=2a01:111:f400:7eab::628;
 envelope-from=Suravee.Suthikulpanit@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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



On 5/19/22 7:37 PM, Igor Mammedov wrote:
> On Thu, 19 May 2022 13:53:49 +0700
> Suravee Suthikulpanit<suravee.suthikulpanit@amd.com>  wrote:
> 
>> On 5/13/22 6:23 PM, Michael S. Tsirkin wrote:
>>> On Mon, May 09, 2022 at 09:12:49AM +0200, Igor Mammedov wrote:
>>>> On Wed, 4 May 2022 08:16:39 -0500
>>>> Suravee Suthikulpanit<suravee.suthikulpanit@amd.com>   wrote:
>>>>   
>>>>> This is the maximum number of vCPU supported by
>>>>> the AMD x2APIC virtualization.
>>>>>
>>>>> Signed-off-by: Suravee Suthikulpanit<suravee.suthikulpanit@amd.com>
>>>>> ---
>>>>>    hw/i386/pc_q35.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>>>>> index 302288342a..e82b1c690d 100644
>>>>> --- a/hw/i386/pc_q35.c
>>>>> +++ b/hw/i386/pc_q35.c
>>>>> @@ -357,7 +357,7 @@ static void pc_q35_machine_options(MachineClass *m)
>>>>>        machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
>>>>>        machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
>>>>>        machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>>>>> -    m->max_cpus = 288;
>>>>> +    m->max_cpus = 512;
>>>> Maybe we should bump it to KVM VCPU maximum,
>>>> and make sure we error out if asked for combination of
>>>> hardware/irqchip is not usable.
>>> So what happens if one does 710 and then tries to use AMD x2APIC?
>>> We'd like that to error out, right?
>>>    
>> Since the AMD SVM x2AVIC can support only upto 512 vCPUs,
>> KVM would return error when QEMU tries to create more than 512 vcpus
>> in the following call-path:
>>
>>     kvm_vm_ioctl_create_vcpu
>>       kvm_arch_vcpu_create
>>         svm_vcpu_create
>>           avic_init_vcpu
> what is actual error message that end user will get from that failure?

qemu-system-x86_64: kvm_init_vcpu: kvm_get_vcpu failed (512): Invalid argument

Best Regards,
Suravee

