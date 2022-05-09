Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC2651FBB9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:52:30 +0200 (CEST)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1wD-0001NR-8c
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Suravee.Suthikulpanit@amd.com>)
 id 1no1qr-0006ZW-VH
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:47:00 -0400
Received: from mail-dm6nam10on2082.outbound.protection.outlook.com
 ([40.107.93.82]:33185 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Suravee.Suthikulpanit@amd.com>)
 id 1no1qX-0007hV-Oa
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:46:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVOLLfxyyCTJUMvf8fj5ZHolLFaSQVCueWtQ9jvmilXbOU8VQpId8aKkAhq9HxKVXreGZ/nj3WxTkgauhL6l3j6rP+pwEtPhApB3WxsgrF2e/6wFC1MYIgWTH9xg7Sl4xWkAAb1EllrrOCQA3ZonX5oUoOWzxQHelAeZCkoCMmFXhjT7a8ZJFKvDkX8x7nHZyG2Ep/Ad2LRkLUPCHnatDXxunUWa2mGzMEnXo6jdkfAlG1OSBxxKq9zxcG4SQeU/ARYsCWjowSXq2RIWtUeW4zCfjOeNbtskBgw4N7jE8vMBypRZrhDdC5wtAnIb+hq8I+J5Efkqpsr9GudWT2epyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4FI9A3GSR1L3OHbYnTRc8lMOKRbzNShQeaS+Jed+Sg=;
 b=Rafcxw0euOZsC84QT5vHV6J292VFk530FA0hRJCeQGzM83XJ9EahlKfkC5UmXUqMc+U9hks7Ifp/qD5wmWnwIs4U2vOQUNNlZHFpKMu59Zg8FizWF3WPCMiBMRggMhWLl2+BfTjrvv3jEPZI5POAnTvp204ct7FkxzQ8G0568h/mmrvJ1T5uP/mQVRIYhA3aIbAHSu9/lQmAkSJyA7MWdljC1lawgCTTYRaefv0FrL341MplHEDeO2YWLRUp0yZqOgb1bo98zZ8yUBqVZSb6plDRO7yOHJBSskfg2IhaMtoCxVl9qs1drAEg6wDaIwQN/HD3OZMSmztEnGaWgt3ZoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4FI9A3GSR1L3OHbYnTRc8lMOKRbzNShQeaS+Jed+Sg=;
 b=hSKEEwFeXaI4Yc2JzMl0f2CM1KxEWUont4tL4wCVCD50iR5818JpU8rCQaTAiGhFuRbEhRwgKf6GOyb0dusAw1cavIBIGw7PgrpGFX9meE0kG6hA0mMxWhgzfDGuRnAvzCmJk9ZqvYNHOTmTtznsDDZ+cyyW/6YoqV0ACQMB8Qo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5445.namprd12.prod.outlook.com (2603:10b6:8:24::7) by
 MWHPR1201MB0110.namprd12.prod.outlook.com (2603:10b6:301:56::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 11:41:29 +0000
Received: from DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::9894:c8:c612:ba6b]) by DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::9894:c8:c612:ba6b%4]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 11:41:29 +0000
Message-ID: <0227c1d2-21d5-24bc-026a-77022edf6f5a@amd.com>
Date: Mon, 9 May 2022 18:41:17 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] pc: q35: Bump max_cpus to 512
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, mst@redhat.com,
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 jon.grimm@amd.com
References: <20220504131639.13570-1-suravee.suthikulpanit@amd.com>
 <20220509091249.392fdab6@redhat.com>
From: "Suthikulpanit, Suravee" <suravee.suthikulpanit@amd.com>
In-Reply-To: <20220509091249.392fdab6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::13) To DM8PR12MB5445.namprd12.prod.outlook.com
 (2603:10b6:8:24::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7283d81-ff25-4bff-b086-08da31b0db21
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0110:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0110FF57012A9C672E430EE8F3C69@MWHPR1201MB0110.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jD9qVo3v4YnDwJaP/ck9Gs1OCMYut4XPL7dGpXTBxOehzHZ/I23rO7UaUgjxuDp7WR5N1CZIMwCtbLcaBcHHepKzqmtotoXsgoipZiVeSwIwIK+THvOTF+IiI+ltaS996QAu82rux5Ts7oPMcE0/4kUvmsOLIJjRm6qe0NLBs9Zr6gf3KlTeFz09CD9pqJiHR1p8I9A1fGKo/dwBUYtho4Iqmxh5mo+IDMrBY74xevP5efzCX95z3YodDbRsaemTRMGSh/t/9d8w0FAnRzy0To5+MFYgzBgfN1X6oQDbbsJD+tiR4PhfvmPtkm4qGDY4q40wGo92yYaydMnxuQIhFMieQENbyrEOs6XgxxD0onTqxGV6tgJRPmCpJToxT1s9DyE6GF0FWz/DOUm2jt70K+KNtKBvSvkLSWmGi5oZMGLfRoKvhjxrCbYK9kDall5Nij+XB/Lh4s29NhE5mxWPfv6ufq3LA9NhMCUQmPwY5d7un1zUtREIqeJEOfdreuFb/QaLt0kqeGeeK5RpV7rs6fSqY14Y4bvYPhQEUcP23oezff5cVc2mmjnBannvHfPM/wMURF2pT0ibK7MtGJxm8JbRe+/LBl7pufCDnabE7BiMHMM3M10xTd0cNEfD7b5PT/R2Negyc4PN6aqCT9045MiDGUvOGFXNVhWmx0Ypk2Py3+IAD894/ct/JOox1iR2jHgthnqQxN3zsAKLtimgvganiZlrxaz00rM4XXd4gTdXySPwPi7A/pp7r8q+zN6A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5445.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(186003)(66946007)(31686004)(8936002)(66476007)(66556008)(38100700002)(83380400001)(6512007)(2616005)(26005)(5660300002)(8676002)(4326008)(508600001)(31696002)(6916009)(6506007)(86362001)(53546011)(6486002)(2906002)(6666004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azJzSHhxUVp1TjluQ3VMdHhnRTBzMDB4WFh4YlpPa3N0YW92NlZHbXFTT0Z2?=
 =?utf-8?B?Qm1vRXovN1JVL0RPUnRFM21HQ2RiM1Bta0RsY2tyRjhlU3VoU09MbG5sOWV4?=
 =?utf-8?B?QkxRaXFvUDB3cjJNK2dCMGRWclE2Q2JNYmlneDJxQjZsbURpc1V5NnZCUDA5?=
 =?utf-8?B?Q1BFaGtJZlV3MjhrK2VOVkIvU1NGZ0g3UE5VN3lZei9rakdNcGd5a2FMRFVG?=
 =?utf-8?B?VWgyOXkyOEliU3hZeVFVamJldjVNS083ZmdYT0VBTWFGUzVURDMvZjZsRDFD?=
 =?utf-8?B?SGw4Q2VMbTdsZWRBcVQwZ3lrcnVoS0NPRVZBL2kwRDNBWkFjMG1TUnFMVHNB?=
 =?utf-8?B?d1g4a3paLzJPaXdmc2wrb3pGQzJpcU9sekY3TWpyZkxDdnIxNm40cVg3QzBF?=
 =?utf-8?B?b0NHUFFqaFFPQ2sxUlJGQjVsV1FsYXo2cU1ES0l5VlFsRFVUYURUc0diZzEr?=
 =?utf-8?B?UFFCa0NrZWJub2pyU1FRdlJKM3BwOUQ5VHY0d09yZ2VBZTJYbFNGYWlvTXhJ?=
 =?utf-8?B?MXdNN1Zkc2s3M2ZLbTc0VXU5aDNHd1c0a3p3RTFHRnFMUWdsUjViQysxQVdh?=
 =?utf-8?B?dkp1THZHWWF4aFhKaWtjZWVVS24vaThweGJXWlQyL0xRTTh0UGRqVEx0NUkz?=
 =?utf-8?B?RG9FUy94STdxWkZCUGhoQUdkYklzVEExMnJMWXRzeWZ2SHdlYThmU05GRnQ4?=
 =?utf-8?B?ZURZZm5QSW02TTZGWjdsSVAyTjdqalZDeGQ0dzNjWFZNRGt1cTlxd29vUCtm?=
 =?utf-8?B?MTMxVVgzY0lBRXk4MWRXQnF2R0ZiWnQxcStVS0ZrN0NRQVl6ZWxRTzB2QUZM?=
 =?utf-8?B?Y0ZCK2dMaktvcmJiWnlabXVRQUJFbnlyLzY5U0Zwa2RocGxyLzVoWDViTlFo?=
 =?utf-8?B?blBvR1dUMzZ3d3d0NXhZU0czK3k2cE1TOGM1MHNnZGNEdmxuaFp5WWZvUkhX?=
 =?utf-8?B?Tk9tQlVwM3NoQ0cyYjVmeE1LWXRYYmVqay9KaTN2REdMbE0weTdCcVc4c3NO?=
 =?utf-8?B?RnpuR3EwRXc1NUVrNm9LVUJCK25TbDlYT3F4alR5cjdXbkJwcW41Z3BqQUFV?=
 =?utf-8?B?eFhCZXVOOWxRR3U2R0FEN2R6RnBGaU04TUczekZMeXg5TEVnME0vT3lTL0l0?=
 =?utf-8?B?dlBjYkowYWNtRmo1NGFaRDhtUkRUM09YeVZTcTJ3bi8xQTRyQ0d0OUNVR21p?=
 =?utf-8?B?Yk5zYk82RGFhYk9VRWV6SzMzaDFITU9yN0YrbmVJTFNubFdCVklqcnRlaEtJ?=
 =?utf-8?B?MjI4eGpYd2RmaGtjTEVuQWRxNmNvWFBtOHJhRnVmdkJWRTlFLzZiUXoxWXdX?=
 =?utf-8?B?N3AzWFI5dHdpV0tKOHRGU25RYUp6UE11VnErenExOGdxcHJyS1lYSUFPQnVo?=
 =?utf-8?B?cm0xZFFQWG5YYTNkUWlaSjcwNTJSYUFIQjM3OE4wK1gyZGNiZzlHZ0ZXZnF2?=
 =?utf-8?B?dUJ5Y3F1NkwxbFJDd0Vzek5TTzdaM1puVTVhdUU1ek9JbEFGSkxQK1czczJr?=
 =?utf-8?B?cGxITmJIVTFvTU5NRlBiV1hmNkZGVWNOUnhmV3dCY2xDVjZ1SDhDOWZkN3RR?=
 =?utf-8?B?VDF0czhncGFCTlJobktDQW9nWFFYZ3RnazkrZWxiWjJsR0hMMXpRTThjYTlw?=
 =?utf-8?B?K0t0SysvTTZMb2ZWUXIzVXpTYng3bXN6WUVXcnZrME16THZzMkdGdWFveWNC?=
 =?utf-8?B?Vml2Qjl1NGdhZ2lQTDlnL0t0TklNaHY0L2draVh2bmU2SW9VSzVFSFdBUERN?=
 =?utf-8?B?Y01uR2NnWUJqdGpTN3owMDRwbDlGNnc5SGpSM3dpaHJhZDhySlpMYTc1Wmhw?=
 =?utf-8?B?VU5HbDdZQllJMm4xQ0hRdzJIQUVoaHl4bDEyc2FRbGljV2dPZmt2VDlJNTVH?=
 =?utf-8?B?R0ZXODZlRSttSXl1Y3poK0gyekdmNThndTdQMjlpV0YyOWt4bHpOOS9GY2xp?=
 =?utf-8?B?Y3hsaldkVlJWODBid2JwTGkwZWo5d2NiYmorT3BXSE9WQVhaUzNIdXJkR25M?=
 =?utf-8?B?RVFKbzE3d1lRTjJScDhyd1BlcERyWkpOY1NrVXhybnpKbjNYVUxjeEFqTGtV?=
 =?utf-8?B?b1JGQUdYSndKMXVzOEkwT1NBK1M2WWxnL3JnTzVsZUI0b0hqTlhMaEtJMjZo?=
 =?utf-8?B?c3dPRUx6YU5OSTdaQW1BRDRkdkZRczBvN05VeDkxSFVJeTJpd3NuK3VFblRz?=
 =?utf-8?B?cVdXZmdsYVA2OUp0OTZveVRabTErWHBVS1BEQzY2ckJqZGNoZ1d5T3RHRmxi?=
 =?utf-8?B?dXpPOUlQR3dEUklqVW5YWFRkVlE2NjhYQnNZMWNWQ1ZpQWFKS1NNOUtLWHpO?=
 =?utf-8?B?RVMwREt2ZGU4WlE4QisrNlc4QVZTeFZGeEVwc3pqZWVmVEJhVERKUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7283d81-ff25-4bff-b086-08da31b0db21
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5445.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 11:41:29.1925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDlEakh/KzdrJJ+FIlBC25UQoyXGwtZSZVNboaS+Gwi+VRnJ0v4IkGZxVZDCn1oSW9VzhXzRbvdVx2sRjGj7VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0110
Received-SPF: softfail client-ip=40.107.93.82;
 envelope-from=Suravee.Suthikulpanit@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

Igor,

On 5/9/2022 2:12 PM, Igor Mammedov wrote:
> On Wed, 4 May 2022 08:16:39 -0500
> Suravee Suthikulpanit<suravee.suthikulpanit@amd.com>  wrote:
> 
>> This is the maximum number of vCPU supported by
>> the AMD x2APIC virtualization.
>>
>> Signed-off-by: Suravee Suthikulpanit<suravee.suthikulpanit@amd.com>
>> ---
>>   hw/i386/pc_q35.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index 302288342a..e82b1c690d 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -357,7 +357,7 @@ static void pc_q35_machine_options(MachineClass *m)
>>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
>>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
>>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>> -    m->max_cpus = 288;
>> +    m->max_cpus = 512;
> Maybe we should bump it to KVM VCPU maximum,

Grepping through the Linux kernel source, the KVM_MAX_VCPUS macro is defined per architecture.
AFAICT, the absolute maximum is for x86, which is 1024. Does that sound about right?

> and make sure we error out if asked for combination of
> hardware/irqchip is not usable.

Could you please elaborate on this part?

Thanks,
Suravee

