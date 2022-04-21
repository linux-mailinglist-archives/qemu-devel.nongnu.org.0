Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B52C50A62A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:49:56 +0200 (CEST)
Received: from localhost ([::1]:51154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nha0B-0002jl-6K
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1nhZX9-0008Bw-4F
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:19:55 -0400
Received: from mail-dm3nam07on20623.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::623]:24288
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1nhZX6-0007k7-Nv
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:19:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzkAYGOOXFNYw3ynVEELtYrJjMM7hALumANvJWVHL/BZqP0GxYBzvg0ZGLPWVeTQKdDN2cr44yIcq+Dr9g80GxyTkOlNo66HGvZbfYlJqis0b6PTymAnz/MXEKpg7+5VJETB721/Noy+gbvU3bSWPTLt0nfpyZ+vf+ViU+OwZzpRLeMjAcJ/3USC4zpro46qNKpRTLikCOnG4miwv9NFVB2tMxjFIgDqXxh1Rt+ppUlgK2fxdmaA4fgUryZEAgOojvdxeZTfwrjc9kEeSxnoi2mkl7NT6AxvJsbUr0JJzwL5M920dcdmeK35SIhXlT95xP/wgGKd1P8ElHGZUdHPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BicovxlPHJQM9UxOAxYq3O9xQVYjEhRJHFizXWDOh0=;
 b=NeuHHAECsE527SPmPKdQG24qWD4rPXC6mIYF4FX4xVT/NgF38da6gJXo31noi6mAR56/X1/N7eGKuZWdBgRthIHDhfnUI6tWs4+/9RdQD91Hv1DnvA3J2hyicNqW4L3V/BGsqkp47tXxhftWIo59GcSWfV/bmwA0MnY9n7TijpZLHcXE1p+9GBw0l8L9XrswWK2hC04QJOUkXp2X4QcXhhbmWGJanyX2g1cwKJMJUUBqjfz9c+crIoJyvoqN9KwFAq5ZaE+Z8bYfNGlgmmp2Yyg3XTF/jFOa/ea3M94/u6f78UQg/R410ZVB+BSMLUKSCxnOBKl+UWAbv/602seIOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BicovxlPHJQM9UxOAxYq3O9xQVYjEhRJHFizXWDOh0=;
 b=lf+DNm3veLaw4tLppAwh57WK2jRtApPSa2wsSh8ZqewXglsBYx3JwzILtWtFmJS9LuqfcvMxw+mD+DBlQMmFqzj1ymJAyBGH1UKaUph0Wdz8bC+P2Ou9vAEq47ZuAntbnoj/I07YliQoOpdGxuML3QIQ1zbDyjugVCxJr3STCCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0201.namprd12.prod.outlook.com (2603:10b6:4:5b::21)
 by CY4PR12MB1414.namprd12.prod.outlook.com (2603:10b6:903:3a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 16:19:49 +0000
Received: from DM5PR1201MB0201.namprd12.prod.outlook.com
 ([fe80::c879:a990:eb53:321f]) by DM5PR1201MB0201.namprd12.prod.outlook.com
 ([fe80::c879:a990:eb53:321f%9]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 16:19:49 +0000
Message-ID: <6ee010fe-bfdc-4c05-28ab-8b3faa63e05e@amd.com>
Date: Thu, 21 Apr 2022 11:19:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/1] hw/i386/amd_iommu: Fix IOMMU event log encoding errors
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, richard.henderson@linaro.org, 
 eduardo@habkost.net, mst@redhat.com, marcel.apfelbaum@gmail.com,
 jasowang@redhat.com, peterx@redhat.com, Suravee.Suthikulpanit@amd.com
References: <20220421160118.2386364-1-wei.huang2@amd.com>
 <CAFEAcA9MLba1b=ZPeWkRqp4nE3dZUJ7q73MALeSHXdsOUnrjug@mail.gmail.com>
From: Wei Huang <wei.huang2@amd.com>
In-Reply-To: <CAFEAcA9MLba1b=ZPeWkRqp4nE3dZUJ7q73MALeSHXdsOUnrjug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:ef::8) To DM5PR1201MB0201.namprd12.prod.outlook.com
 (2603:10b6:4:5b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e0d70ec-6601-4e35-31fd-08da23b2c1f1
X-MS-TrafficTypeDiagnostic: CY4PR12MB1414:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB141401C9D5C4B079414EC767CFF49@CY4PR12MB1414.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qVreZLmOlGGxUNHsbuqngg7u54cTiFk1MIAdt9HEOcYLOMdNodPnxYIgzrrhb2rR1CH8Co03W5NFR4YWG86bMTptH/mcYSVa5kaOf6afwuPvKiGNgawayVE98j4jUOXPIgFpR5ePyrtvm+dks2RlOrFqWoTHFm6RWzmPomBY1nKhMJ3xC7Dr3L+LZ8J6royDbNTHvtKk6RUd6h1nWjzD4O3X0uAa6EyCVyj5C6ytWR69iYpsgoOE/GagMtBOwmSNz1+9ab05SHaqWqwHfA7M5TFJM+mQWXhmIAK/NCNmObGKFjI6tSlHF9f+RI19fZHXi4XvImu2M0WRjLKZPAMLw8UOiZkWxfhH2MCyzD5BG4qhmjjCrjF+isBbUuUKt/Yx1JyT4L5WGmpCnEtrDW5k++J3fDi4QQZh8lcn2YnvT4K6LuWmS2wwyvUdgZbyyIRIKB/vmvCmpROP9TrkLBghx5LJTVk7pfWaZZ6xl6UO+/cbHfoityFe1GGonheonro+/5wG82qC3sGfF10Mxoa6WScWAgM0mjmkVlvEUS9H1LIJzDapNvU0Lp686Cidp+rjkdnbYkVLilLfR/l/Z0FTwvELCDDuv+Yj1WgWUDrVL5RRCe0k+bRZQR2euxYY1D94wXOdUUw/PMtRsOUaVqXorWW3ZhhD+PIABl7mm8Q91kn+hUX4qZXx0cBzFLzf1NxTSSqK4NMeATm8YwxQOAV6UpuHvOHjVd55UiEVn+8AauQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0201.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(38100700002)(4326008)(36756003)(8676002)(66476007)(6666004)(6916009)(2616005)(26005)(66946007)(6486002)(508600001)(6512007)(83380400001)(316002)(31696002)(53546011)(2906002)(6506007)(31686004)(186003)(5660300002)(86362001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVF5UHkwVk1lN0JPK21yYUNWT2N1bERRNkJYL3R3M1ExZVVnSmxPMHpVN2NE?=
 =?utf-8?B?TUh3bDFMRERqWnlPV0t2bVV5eWp6aUd6UFgvZCtYTEtFQWdiL1VDSXgrem5E?=
 =?utf-8?B?UzBaRkx5RUZjY3VZYW5sOUNlRUlvaEpHb2taNks4ZGc2RUR4MmkzM3o1S3h6?=
 =?utf-8?B?cm5PYk5OSTYzSEZDNVJnalBaZlZkZzVlUERZWGw5YlovTG5oL0hVa0taU1JN?=
 =?utf-8?B?MFpqOTNnSm53N3VWdGp0S25HemRobHhtbTY1YzFQRkdaWkpwVmJmQUswZ2Q1?=
 =?utf-8?B?TFQrZXU1dzdIR1VVdHgwSWlEcmdVYzRmYkJSWWxLS2gxaVUrWmtrV0NvT0xr?=
 =?utf-8?B?NnkyMFk0T0pEblE4Njl2QW4yc3JsZVozZjRiVy9QMVRrSENVSXl3ZVlxNkJt?=
 =?utf-8?B?N1BUMjlKTnVOU05lSzJzSEdZbzNvbk5BcXNQM1MzL0owRGZia2NqbTdlN09q?=
 =?utf-8?B?cEVyUjVzSU13QjZaTDdjU2hzb1hUakhFTUdKRk5NekR5SGh4WE0yeUc2VitP?=
 =?utf-8?B?aXZZMnJSVng2Z0tsQlpxemRqeVI4M2pxcVBUZC83eGZQSkw5ODBMWlM5R3lX?=
 =?utf-8?B?YzZPQkRDU0RQSmxYYld0dmYzdk1hbnlXRC9HMFpvRG4vRjhMcHhVQ0U0U2Zl?=
 =?utf-8?B?cHBpQVUyMjVwODRIV01WNjlVYkg5Y1FiNzFlU0U3ME8rU056QUg3bTd0MVNh?=
 =?utf-8?B?cE5ZRGEwb2gxMCtnbEFWU0JUSmpocVZPMWZZZDBTZ2RqUGpGTnRqTFA4WldP?=
 =?utf-8?B?SURFN096RDUvcmhub1VZVDhFUHhVVjVGakZsYVZiYmhnY1cxK3lqcnluT0oz?=
 =?utf-8?B?VE9oemxmaDJ2RDJwNWl0SXVNRVZLSzNrc0pWUGk4ajdYU3ZPRUI5akJDc3da?=
 =?utf-8?B?TVhNTVRSWGxyOElwN2p6ODRZR2ZXNytZa3hONEtteTBsdUlZc0JRQjUzRDRW?=
 =?utf-8?B?c3hnbnNYenU3bjdUNU5ldUNtbUVZMnVSUXBzVkk5MUpNaHpMajlwVlpRck01?=
 =?utf-8?B?amVHWmUxNzZLVDhKQUpzQzRZNGhRNDVNQzJmeUIvNUVFSEN6SnRlQUMxSmVH?=
 =?utf-8?B?WWhUaEozRWIxZDM4bkdZb1U3STdwcUxIV25TV04wTUViN3k3MUpkY2ErVEF1?=
 =?utf-8?B?QS90LzBkekh3Sm9Vc09Sbk9pbVJxYlE0bGpHK1ZGL3YxQjRaK3F4U2ZjeTRO?=
 =?utf-8?B?cEhZemhyNnJlRi9EeXJ0VlYzQ1FHcWlJK25ZbnVFYkwycGIwTnhIM0JvR0hz?=
 =?utf-8?B?VXEwZ3lqbG9LM0R0d1ZiZWxjaVFzZUZXZ1UwelFYYVcyOVhhVU1Dam9nSGdX?=
 =?utf-8?B?eXhyOHZIVWM3UCtqWlVXQklVa25GVEZDMjdsTUVuYndmQ3gzMUJTQW1vdWto?=
 =?utf-8?B?Y2s2MWlhUFNvU2hKOE5SUnRYYzhMd0FqSTM0MGQvL2dUamFwTks4b1dkd0lz?=
 =?utf-8?B?YVd0bC9iRnRQNEdCTFpkTjlXQ0I4RFdBVzJwUmo0ZFh1RzV4cXlHN1dMWjBl?=
 =?utf-8?B?dDVHanFJTFhuUE5xcWZITXV4TDRLWG9vZ21mZFVnNHhSQjZsYThLOTZRc285?=
 =?utf-8?B?SSswZ2pVT0RxSFFXdzlEVmFFR1lHcEQ3Q1V2QS82dmwyTVVoTkk4cjVjWXVn?=
 =?utf-8?B?am9sLzFUbWF1NVhNamZhaUpZbUZlSEcwR0ZON21YRklSRWM1UFlTaVZ3bkF6?=
 =?utf-8?B?ZXRkeWd5K1pBWnN4NUpiY3phLzZoTDNiNEFZWmg0V0I2Qk5PRElWeEpwUUlR?=
 =?utf-8?B?Mk14OXJoc3E0MHZUd3hNWC9wQUhHT2ZvbkZXVk1GejlyN3lJaWRzWm83MWhn?=
 =?utf-8?B?Z0svYWZvYzdCSHQ1SEQ0N2loRDdtYXpkdmovMkRVcERLejgxL012OUlPRG8w?=
 =?utf-8?B?V1B0cm43Q3hseUV6bUZtTEs2eXZ5bk1MVVhyOHhpM0tPdWlkMlZYS21FRTZS?=
 =?utf-8?B?QWpBak52eU5JZU1zNnVqSjloTGdLaEFBakFPQjFnb3NuMkJnOWZkZ2ZERU9O?=
 =?utf-8?B?QlVCclJHbHVOTTRRd29ScGxwemE3K3FySDl0ZmE5WVA4UFJFVzZIeUxPOXJE?=
 =?utf-8?B?ZlpyVWY2VmQ0bG5DWkxWTExmTEZUalU2andLMkp5YWttU29YWldsdGdlWmk2?=
 =?utf-8?B?ei9iY3phOXlhN1Rkd0Z4a0ZkN3ZkVTltQjJ6ZTNBYXdESzhETXh5V2hTUzBU?=
 =?utf-8?B?OG9zR29Db0pCWHJPeHdDWjllZTVKNU5vdUV4MlFFMjU3T25KSkt6aml5Zy9n?=
 =?utf-8?B?NDQ4bEV1MXBZa2w5SHVPdFozMklIKzFYWmVmSnpiQ2hiZ1BDTzBJUWdyRVRS?=
 =?utf-8?B?eCtCZWRjOEdudG9wRUcxb3BsQzhxM2JmcmlWazBUSUVUNmNYWW9JZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0d70ec-6601-4e35-31fd-08da23b2c1f1
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0201.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 16:19:49.3181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2joDW5eB3dssDMwk2zD2+pVY+lJ66fktyHtf2LrulOQhxP7Pe/FDoOtVoxZ8W9j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1414
Received-SPF: softfail client-ip=2a01:111:f400:7e83::623;
 envelope-from=Wei.Huang2@amd.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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



On 4/21/22 11:08, Peter Maydell wrote:
> On Thu, 21 Apr 2022 at 17:01, Wei Huang <wei.huang2@amd.com> wrote:
>>
>> Coverity issues several UNINIT warnings against AMD IOMMU device [1]. This
>> patch fixes them by initializing the variables. On top of it, this patch
>> changes the event log size to 16 bytes per IOMMU specification. Also the
>> event encoding function incorrectly defines the format of event log entry,
>> which is also fixed.
>>
>> [1] CID 1487116/1487200/1487190/1487232/1487115/1487258
>>
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Wei Huang <wei.huang2@amd.com>
>> ---
>>   hw/i386/amd_iommu.c | 17 +++++++++--------
>>   1 file changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
>> index ea8eaeb330b6..0f7f8929a687 100644
>> --- a/hw/i386/amd_iommu.c
>> +++ b/hw/i386/amd_iommu.c
>> @@ -208,8 +208,8 @@ static void amdvi_encode_event(uint64_t *evt, uint16_t devid, uint64_t addr,
>>                                  uint16_t info)
>>   {
>>       amdvi_setevent_bits(evt, devid, 0, 16);
>> -    amdvi_setevent_bits(evt, info, 55, 8);
>> -    amdvi_setevent_bits(evt, addr, 63, 64);
>> +    amdvi_setevent_bits(evt, info, 48, 16);
>> +    amdvi_setevent_bits(evt, addr, 64, 64);
> 
> There's a comment just above this function which also needs updating.

Will do.

> 
> Would it be better to have this function start with
>    evt[0] = 0;
>    evt[1] = 0;
> 
> rather than requiring every caller to zero-initialize the buffer?

Assuming that Coverity is smart enough to poke one function further for 
checking UNINIT, I will fix it in the next spin. I will send another rev 
later today.

> 
> thanks
> -- PMM

