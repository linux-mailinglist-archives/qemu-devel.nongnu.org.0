Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 229DA6FC3E8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:32:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwKdG-0006J4-8g; Tue, 09 May 2023 06:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ayan.kumar.halder@amd.com>)
 id 1pwKdC-0006IJ-Rg; Tue, 09 May 2023 06:31:42 -0400
Received: from mail-bn8nam11on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::601]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ayan.kumar.halder@amd.com>)
 id 1pwKdA-0004wk-6u; Tue, 09 May 2023 06:31:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0CmnJ8RfR7S7v63L1ye2RrGOZWYYvMlb6hWLa8Vhgm3K9Me7rWAAmKLdRK6HEDzAAmmr0FAEFPQePDzkscuXrmhSTrzicUnsH9q1NfkMIBwO7IO7e6I14u4WqMqLHO7ChkhkR43cWF2wxfHJWDOvRrnK7OR7M9KLiUWYzjUb3lb9R7PDo6S1D8CTOxmBYod3kHGNXc3ogzE2aUsWnrOW3q/AQUGBGTC+Yj5/EKHfSQ2ba5k7a/2myygDP2l223wIykDdkeJktkJd4IdvDBzXxe0Y1N/f8NEQ9HTN3QJEQ2zHWQN03zY8cOfoWRu/Gy83Mm1TQaP7yQJJA7pcy+nSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=optCiWEqV3Q7H4m2jf8VGxOZLl1GOW5NcPrXGEWDq7Q=;
 b=ilQNcCzFZcni+HX7rNtihbeBKHKUnBow+OKUYXKm1PQeRxtCkNbs3GIIx6WPgoBM06tzi2CVp/2oueEOqIcy/Oac/U4LWbi8OrvUfJkPpWPHxKdalQ3vw0ZLa+odRE/IxnwLlYMINRveBBpngoRI0yINzGUu0oGRLueqGkV64xlnrHOnK5BrVLa9NpOeDJFHjLedufKd8rpccwCbUrEPDdazVpeu7UvVfa8DjQh8TZDnWsziaCD503rMTkWYBH8jBjVvliQ1T3PI5weVf8Cfgvql//ZSBUHP0MN53aFCnFgukhy1rXWuDZxuI1C2EKE8EFmKXlaXpnwps9wfK8K0xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=optCiWEqV3Q7H4m2jf8VGxOZLl1GOW5NcPrXGEWDq7Q=;
 b=qYFNk+cHAr3pG6cxEhA6C4oxDhP48qBEa1hPT4nEcL0F2/GfeAPDP7sB4SmNpEsN8mdOKwS9XrCmBqy0HOx3pMTt1bKiQsM/yDOegFovDLKgoGHFkjuftBSFLQNpcu+1MfdAD/fTQ+JXVdQ7CweYScUPvrKvejy9XOSDT15zme0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 10:31:34 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::ef8d:bf8a:d296:ec2c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::ef8d:bf8a:d296:ec2c%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 10:31:34 +0000
Message-ID: <1d148c52-1ac5-3694-4ffc-bac632a7bbfb@amd.com>
Date: Tue, 9 May 2023 11:31:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: Cortex-R52 support in Qemu
To: =?UTF-8?Q?Tobias_R=c3=b6hmel?= <tobias.roehmel@rwth-aachen.de>,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>
References: <a1c45644-90d9-0fd2-c87b-f43f16b7e407@amd.com>
 <28bfa9ad-f8dd-d195-ec66-fbd2d78d170c@rwth-aachen.de>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <28bfa9ad-f8dd-d195-ec66-fbd2d78d170c@rwth-aachen.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::23) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SN7PR12MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 946691fb-975f-4304-84b7-08db50788fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qP0D6OI4PwzgHpKVOYL0ZLaoFnK16Q7M9Vix5Agw52OMIQr3LPC4/DGezWk7uGnVnJleK/VI5m0FinqEYSqhklRGbnUW6MxI0zwVu6vcnb3nckHePNpqxZHBrhHjGvMtFhWzOGy9KONpmaLCl5tWVuqAiGPeg01na1waij64lWxNTWAM7G/9Ha2Ua+mt+VrWxnVaBcutyGrtuT0KJx7CiqlnIvJuBsWz0JV3CooCujeSUal5BNsWr+F3S97pj/cBEl6TTIYyJYaLrguDOhdi0E4lsbymIDpOHrwFQng3n/Hym8KqSbtPVA7+YYZVC4SmdiLSoZhlxs9eEoOCJ4e/4s+uIpq8mWywRg+aULamfQ5HhtVRHCAlj7V9hQnhnTBqhcebUnaC1f/7HjWvB/Mg5v9mikpQIaC8zMbhl7iWcb9HAq1tWQiqm+LhZZ2iFYn8j01QnYFF2sAjxYOVvJhYd+Qtbjy+J5lV0uXEa07NmjdGoVeoYnUURYw2UEBKylNQq+0a/az72jZ4BWWz9jGxOAeij7Mv9CXmBpIPKqrbe7D5J+dQXl9KveEj4iKoGrh0WPpbrSVC6TzTbCmMcYwf7zUTlJ7mlYP5iszJAuGvf9sUUKUb3rzJQZzoNMePcBTKUmfZER6IyNspl1lAXfD9Iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2621.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(31686004)(966005)(66556008)(4326008)(316002)(478600001)(66946007)(6486002)(66476007)(36756003)(31696002)(66574015)(83380400001)(26005)(2616005)(53546011)(6506007)(6512007)(6666004)(2906002)(5660300002)(41300700001)(8936002)(8676002)(38100700002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0FoUFJQR2hYUUZNZjdvRWFnSU9kOFRreHpvL20zQ2hpZ2RTbFJKd2lzd1No?=
 =?utf-8?B?SHhVcXNOOU0wUE9wcUN3YmFVSnZ3QTJtOWdkRVd5WnhpTzc1bWNTUDNvU2pr?=
 =?utf-8?B?S2V2MzZEZXpSOXRRZStuTzNLK2FUSS91YURhZVZHcm9sMjVibG1DWVBoejEx?=
 =?utf-8?B?SDQ1V25taXpsZHFUdEJGS2FpbUFKU2FUWnErSU9TN1FKV3hLakVFOU9JTENi?=
 =?utf-8?B?NXZDSHNZTTBubFJ0Sll1MDRPYzFpdkM3TjlzSlZ4c2Q4Vjdpc2EwOGRUUjZy?=
 =?utf-8?B?SXBxaG90ZWFuN0puWDMzeXdFcEZ6eHdnTG9WTjVpdkVNbFFtRityUHo1V1hh?=
 =?utf-8?B?SnpuUksydHpjZmFHN2l2dnRaTEt1Qmg3L1NVdGVmSy9kUWtVbnZJSzVrNHB3?=
 =?utf-8?B?VDhaNWtMSHYzc0k4WlpVVGRIQ0Zad3A2am5sWCtYOW4wZCt6bUl5WjBWa1Ar?=
 =?utf-8?B?Z3RQQlFWTTlWSnprY284bWl5cWNqanVVNkdBUEg1TWVNWm4vK2JkREpoem1V?=
 =?utf-8?B?OENOMUtnd2tJSGtwOHVNamJmR05GVDhra1VVVEF5aWpYYkhPUEFjWWkvTUhC?=
 =?utf-8?B?eGtydlpQVGdyRVMraWxCb2NCWFRPaVIraDdCVlNtYjJIMDRpMzFUUkVvWkd2?=
 =?utf-8?B?djBGSzYycktRQkUzRDdpTVBKdWRaV0o2MWljbFlweEk0emxhS1E5bFlraE82?=
 =?utf-8?B?cnBMUE82MFZmMkJIc2p6VHBTV28waFd0Ni9kM0FYb3lZckkwTFZEc01xTmIw?=
 =?utf-8?B?N0ZzMUJGa0xrM0pDQ3h4ZVduelhHcjB1SXNvUG93VnhVaTRKRWNnbmk1WVVs?=
 =?utf-8?B?NE9qeGlJODBXTTlkVVJwZ2VIUCtNZ1lWbkUrdlZwTmhYbjNDd1ZaaU9qVXRC?=
 =?utf-8?B?bFErTnZmQ1JTMHpOMERFWmRCd3U1REM1SWhWNHRCbUZuNnBKZ1NCRW0welZv?=
 =?utf-8?B?SkxyaFBLMDVzLzY5bGR1djc1Q0dqZThNUzBSQUQzTzNQZGxIeHlhTFlwUmVi?=
 =?utf-8?B?RHZTdmVZTUlxMWRJVDZiL2JiY1FXazBtaXpZUzA5UXU5ektZVEs4R0U3djdG?=
 =?utf-8?B?WlNVQWhOendYdzdlS2VLUFBLOHZ6V01UKys1ZWFZZ1ZlaGthQWpMWUdxVEJz?=
 =?utf-8?B?ZE1mdGttanUyOTBRejBBUldVc3hLUEZITFVyNlVOeHoxd2s0YllYYXJxMmQw?=
 =?utf-8?B?QnFxdmNkdDY0MG15QU1GR3Bncmkyc1lDd1c4cVlVTG9uc3RpT3lBem84SmRX?=
 =?utf-8?B?YXF5WXcxRUFsZHJYRnFNWEdvQVlPMm03dERwQUExYmZqc0ZoLzFTNXlwNlJn?=
 =?utf-8?B?aFZNc05hQ1J3MFppZmVSbmdsUnFwUmVYcGdGQWxBdjlEYWNaWktYdU1zZ0sw?=
 =?utf-8?B?dTNuTHNOL2liSUdnc2lIMEQrbytITkw0NlJvOGFaUndWUExWQ1crVTI5cExU?=
 =?utf-8?B?L0l4azdYYjlRL2xRZE13dDlxNGhRalpZd0lQMHVuWGpRNGlQbjM2VmlNOXZK?=
 =?utf-8?B?WWRMVW9SUkhDK2dXSGZ3S0VOT2pYUjZkMHJhdEFOZWE3anVVZS9sT1NsVHF3?=
 =?utf-8?B?L1E4eTc0Zy9BVzgxaHlpY0xxODBHbHh5enlsQ0Vhb0k2aENHK1RvdHMwcTJ4?=
 =?utf-8?B?aWlFeDJlNUhhYkY3aHR0Q2dsV2M4ZWozUmg2WVVhZDFtbTg5Y1RLOExlVTZq?=
 =?utf-8?B?RVpINExJZTZxdENqOTArRkpWR1pRdHhuNUNrZ3I5S1ZaQ0FvZTVDZGtiQ0c5?=
 =?utf-8?B?Wi9kSjFPVExvaHBqbkN1S00weDJlY3VtZ3l2SldYMm4yT0laRS9jbFBRY3Zq?=
 =?utf-8?B?SXZONmVxSUFURjdaTTZyaGcxaXQ1WDl0SWVCWEV6V0U1RHErS2xPMEt4M3Vu?=
 =?utf-8?B?S1dnYW1qSGpzSkpiUHZYc0NaZG0rSlBOQXdqbzBLQlFlekVGd0o3YjU1WG9s?=
 =?utf-8?B?bit6bGlKWWxiNENmQWJ1VmpXZGpncjZMSUhlSDY2Nm9VL3dWR3NHS05kZFUy?=
 =?utf-8?B?QUxiVnF3V3k1U2pIR3dnd2JERytndG9JMXRkUE55MGpidEVhVjZUV2pNOEYy?=
 =?utf-8?B?UjRNczZxTE5QOWF0SGV4QnVjbnhyNlBQeEdyKzltc1loanlveVJ6dHdwK08r?=
 =?utf-8?Q?9addtzkWnUK0JHpfMOj58rXzT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 946691fb-975f-4304-84b7-08db50788fd9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 10:31:34.7320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JvrULn95oJ3rUHERWMKe90duQxKJvIb5d9+xwItuN8Q6PKgtyN0TEHtvQVsfNgqMBq+wzvenOpIQM0Z9vC4QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838
Received-SPF: softfail client-ip=2a01:111:f400:7eae::601;
 envelope-from=ayan.kumar.halder@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 05/05/2023 15:15, Tobias Röhmel wrote:
> Hi Ayan,
Hi Tobias,
>
> as far as I know, there is no board/SoC that uses the Cortex-R52 in 
> Qemu right now. If you want, I can try to find the one that I used
> during development. I was able to run Zephyr in Qemu with that code.
Appreciate your pointers. If you can tell me the steps to run Zephyr in 
Qemu with R52, this will be really helpful.
>
> Best regards,
> Tobias

- Kind regards,

Ayan

>
> On 05.05.23 14:21, Ayan Kumar Halder wrote:
>> Hi Tobias/Peter,
>>
>> Greetings.
>>
>> In the following commit, I see you have added R52 support in Qemu.
>>
>> commit 5f536d01d1141a56f5057b62c82fa94826d367f0
>> Author: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
>> Date:   Tue Dec 6 11:25:04 2022 +0100
>>
>>     target/arm: Add ARM Cortex-R52 CPU
>>
>>
>> 1. Do you have quick instructions on how to build and test it ? I 
>> have ported Xen for Cortex-R52 (using Arm FVP) and would like to see 
>> if it works with Qemu as well.
>>
>> 2. Have you (or planning in near future) to add support for qemu-r52 
>> in Zephyr ? I can see an old ticket
>> https://github.com/zephyrproject-rtos/zephyr/issues/47330 , but don't 
>> know if you have integrated qemu in Zephyr.
>>
>>
>> Kind regards,
>>
>> Ayan
>>

