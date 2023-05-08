Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E39E6FA3E1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 11:52:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvxXh-0007Lc-Do; Mon, 08 May 2023 05:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pvxXe-0007Jd-Ro
 for qemu-devel@nongnu.org; Mon, 08 May 2023 05:52:26 -0400
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pvxXc-0001T7-Hu
 for qemu-devel@nongnu.org; Mon, 08 May 2023 05:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683539544; x=1715075544;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lYGhVg6LlqOxqyzdQgnfBBrYYIalRdG+1NOHNsyYgOw=;
 b=jtDkM/hXSwKamzlvOoQoigVJTCEg1BSa3zx3HroxdygKbE6HlQa7pU6T
 pqYIiPkMcudBEUmWY0fN4ejuLUu7q9W8cgQ1SOTgeq1Y+NG1mZL9LXu35
 bIGFU/fUfD8lf/73CV5JmqcjDWiugddMRbYipm5+NXLfGgPxn2qfzaIWl
 qlyBGno0/Ew0K5N9O+PenIXpWK+OY+4oEYBinUbo1Lh1yFG6SBwPRAPdB
 VaX3uxxrL3ECSVeTmKCrylCeM5aYQNxG/SiD3DpnDvsicmfkkLiMbEhyV
 ORRN56eXROPPc6EVsvuLOlPaDDim8Vt3AnrhZJvAC4WO1sKxY6VLRRUT9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="415164050"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="415164050"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 02:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="788035722"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="788035722"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 08 May 2023 02:52:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 02:52:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 02:52:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 02:52:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 02:52:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPDxIPa1Z4vEkMCNDaoZ9xycZm3tog1/TwRRhskH1d4CEzCbhSjKBc7g43quMlir59aj1erqFwY655YWMyeo/BzGqs0RzSc3T4B62NRhPMlB+X+WoenwVtMANE9EDDYxuoLa48UQL0eEhury/B9ORD1E728UCkGxcYeDe6NwsbZE4/1pvhRcs+L6i5uhQ0TTN2W9sn9trVw+ym4AHUd9y025/hdEipwfkvW7aTz00ONG1ypsRMTQtngSEnhgrJCtV6D4mqUQhM7WuFAAzddLLPRn2fjmKOllB4K0Te0Qbx2ijskmbZiFc94xpG4ihwWJMOMWS8nnDu/fhMDMJ94Vtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awJQvemh71OZTlfjpbrYVp87c2MQG87XVb/KxiEfAiI=;
 b=eQNePYemlpjExEAdJTt4HmDQGdJgvWb/ft1zL+uyNTR9Q3H5V2QkFG0qN9DaghBkZfQVKqugR9fbXxtypH2whmM6Cwz1URbtortcHDHEncMLlVU2FrLFYSZpPifMbKhFwfJhsIuBDePat/wsGQQpf4GaXs1DyIcVLP0v+MOj56ncMB8mTa3+pxBuhlGVjm3482FXbJd5iA8Vpf76oNW3PAJmCUAlfEvs1jIuBGPIbAKpNMe+R3GMVZ67PQW0SQcH/VgrOKn9I1Ochj7rZmlTRizsbUdgHmndAj4iIlo0IQDMtf5oyQOgJ+wmWkvyT49E2iImX0J3DbQ42GAQVcUJrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by MN0PR11MB6303.namprd11.prod.outlook.com (2603:10b6:208:3c1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 09:52:11 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::6f32:84de:47b1:3bc2]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::6f32:84de:47b1:3bc2%5]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 09:52:11 +0000
Message-ID: <5b95440c-0bf3-bf5a-bfc7-4fb297cbb611@intel.com>
Date: Mon, 8 May 2023 17:52:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 01/14] accel/tcg: introduce TBStatistics structure
To: Richard Henderson <richard.henderson@linaro.org>,
 <alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>
References: <20230421132421.1617479-1-fei2.wu@intel.com>
 <20230421132421.1617479-2-fei2.wu@intel.com>
 <483b6a5d-ab8a-c30f-5232-6b575a4c7bed@linaro.org>
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <483b6a5d-ab8a-c30f-5232-6b575a4c7bed@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0194.apcprd04.prod.outlook.com
 (2603:1096:4:14::32) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|MN0PR11MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: 64646ce3-ff1c-4f23-542e-08db4fa9e4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e+7Q3b+v61wL10zKMzxQoNL/XrKPW1EXfVcakYx6uEbWXt2pw0eN7lAkEgp2Rz4jWwStKL0hdKMoZiVGnv0acWDlZ3vHslrY9Kko83bjCCHzgZL6Xc3YhqYwdscPQCpdrMfLMjzN3E0bdpdnePcorm5ON5QObW24ofvjDtlp/A1IKDlblrtNCyfZY8ej0+HdOTexSlSZYsylEgiF/ibjStNKTq4NICvA0X10+BKTIK1lDlJEEVl69OmVwGdMEjX16ljYfhHGjjF1rbetNNrMF2ca6OzcxKlI++b7YibRHwA1ytNqr/p5KbsANiLXaRXtvgYACjmpJaQLVPnOFvqMESNV/7qhPcV/hRDSQJdmkLhQE3rVPIcKLK3T3H8YVcl7n/nSQTmu8KUc2Xwf7gWunapJ8ZDUM2mplWmvmjmzrBgY7xW2xHM1gd7Omhjtk5Y8aXW0LiaKfQJxIAUki5/69koXbFtcSTEZIHD5tJdk4gStDXuBOP6F2+8fEiwNHVEJ9WXjDpDUC07bK4SriTku1t/HKv8Lhyx5TRYAEBAohDO18e7VUGfKpa5g2RPIVPdk3OLAC1FrZZggBIvM5WQA1E98Mx0biy+8B/fu1+VRfILqYZibYpabYKik4G9uzNcyyCQFI1haMx8t6nLMZ2DEpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(86362001)(36756003)(31696002)(6666004)(54906003)(316002)(66946007)(66556008)(66476007)(4326008)(6486002)(478600001)(8936002)(5660300002)(8676002)(2906002)(41300700001)(82960400001)(38100700002)(186003)(53546011)(6506007)(6512007)(26005)(66574015)(83380400001)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1BZZk9yTDZjMDJhUElnUUR1d3pmanUrVkNiRzBxYkl6LzN2MnpFWW9HSE1S?=
 =?utf-8?B?RlRmcGowR2ttS1NVbXI1WEFzK0RsU080am43Nm10Y3I4emRjQ0VVSVprTzli?=
 =?utf-8?B?YmJzM1I5akg1aW9EWW8vSnE5SmZKMUNCcmN1d0dQZkFGYUR2TjlEdFB1azJl?=
 =?utf-8?B?U2dDaGRrVUM5dW5rRGFGNXhDblEyNTI0MDlJZUpUNHorcVhZaWt6UlA0K0Vs?=
 =?utf-8?B?ckpHS01QdjlYcjlWM2oxUDBLaVRtRGRmTUdjYThoOElZNnBXRUVIVkdXSHRW?=
 =?utf-8?B?L2RpU1Q5YUdHMnFqMXBqMTNwWEZDNFMxZTFWZEdYUFo0MVQ1K1J4dHRxUWVD?=
 =?utf-8?B?SlJoSDlTV3NiNFNHQWgyZHVLdVIvS2tsN2Y4TXpMOU0yMUJ3aHNkYThHM2th?=
 =?utf-8?B?Y3JOVTJiZHRTQmZPRzFjQXpYemF3ajEyQlcyUFk2bUJSTTNhMkxKN0crWUdv?=
 =?utf-8?B?eFB0dG9hcTlBQUlVb2tZNHczMVZ1YTN1dDh0KzVKMHZTekQrN2FFTzBUN1U5?=
 =?utf-8?B?YmJSdUZQaEFYNVF2NkhzeisrZU4xckZvaFhnZnpSdDYxaURmWjk3bE04aC9q?=
 =?utf-8?B?SFgzWkR2WGE5Q0lkNEpYdDlRbkR6TlFoRXBwb0RmeVFXTDZPb3FSeGZiZG8z?=
 =?utf-8?B?bFRMeXJaNnNENGw0RjBMQ2FQbUJjS3hTNTZZMnVkVXFFZnJPTStPN1VobVNK?=
 =?utf-8?B?b2ZRV3lnc3E2U2JSaloxT0ZnL1BrcjBveHBiU1hnRDM4Z0dGUmY3ano3V1RZ?=
 =?utf-8?B?aURWK3J3QmlpUEZYa3JYeVlkbFIrTkNObGpKbkYrbXIzMVhkUm5uOFJWWjlu?=
 =?utf-8?B?eUM1b0VrTmNFUyt0d091YXlBcS9UNkluT2lXRlBpMUZDZVE5aE4zNzZDc09z?=
 =?utf-8?B?N0I4Q2lmRkcxVGxoQlpnNVFpQXBnWW1QdXZUUFV0VW8yOFZVNVM2T1lNOGpP?=
 =?utf-8?B?TmNTZWhYbDBvSHNkUWxFak00YmFXWGY1K09SbnpORE94QzZtUlYraGh4Y1lF?=
 =?utf-8?B?eWw4S3poR29WTWhrNTBrK0xMOTBkWk83OTB1SzZCdjZpUllJbHBIU3hQRERV?=
 =?utf-8?B?ZlQzRGYzcmFaNURldnhsVDZ0ejZjOXJsaTF0K3NoSVAzTnBwbmNBMUUzWms1?=
 =?utf-8?B?bFUwemxYdVNuNW5rSDNCN1paRVRNNDdpU2NHRjlXdFNiZkJJNm9OeCtNc2U3?=
 =?utf-8?B?K2NjSmJrS3c3aGhoTnoyZmt5Q0VCTDhsMW1NRGZrRndKZ29yNDZHWmdaQVBr?=
 =?utf-8?B?bEdaakdsZVY5cXFVUEhaQWcrQVdLdVVuallSTEw0OWthYzI4RnZwWWtkMFVP?=
 =?utf-8?B?aSs3aWUycmhGUmh3YzlpaGZITWloNDloZVZQUzNwU0dYTUc0ODZPQ0NjNWk0?=
 =?utf-8?B?RFVCUUhkL2NOMXJDZEVpNjlvZldVYVhyZWFQc005SitSL2JsOFJtVUVidVFJ?=
 =?utf-8?B?dHJrMGl1eUdnVExaUy91cGxPd0gycW1YWk1YMGlnbldyVGlMSXRPT3UrT09B?=
 =?utf-8?B?T1lxRFhOOU5USVJSU2xaWStrYy9VQWJJOXJBMG9xNHo5SzI3ZXlpNEpuTWph?=
 =?utf-8?B?SWlWOWtaTHhDZEN6cEpNcHNBM3VXczRwRkdOY2hpdzkrUDhPa09nSFJBN0xo?=
 =?utf-8?B?M203eTFhdXFKSTRuZDJvNXcxRGhEdXk3RjBFa3ZocE9DUjJKWGg0czJXSFF4?=
 =?utf-8?B?MGUrblFLcXJxQlQyT2RJNHUwcUNndXFBdmxhRTBRZ2h2aWMwUnJaSmZFeFVk?=
 =?utf-8?B?ZnpZbkFwM0x5K1FKVVVsTlFCdmVTSU02L0x5djdJMVE2QkNHdlBpS2hBRXIz?=
 =?utf-8?B?VVZmdVNWMmdSNlpaSFJTWmlhMUpWL2NpUmpFZm0wQlA0Uk5YTDJKTWJPdE4y?=
 =?utf-8?B?L25TeXRzWEZweHUxdFQrUENQUXBEbkZvUDdXLzYzSlNXeUFWZUJ4cExnV1JD?=
 =?utf-8?B?cmRCSVhFUlRHZVNVMThUN0Zzd3c4RWh4ZFB4V0tzNWgrcG9Vb0I5ajRtRWhl?=
 =?utf-8?B?YVkvRzgvenNJbWhiT3U0MnlHdDBGTy9LMmIwYTRuNVRGdVkwcG5RYm9wOVIz?=
 =?utf-8?B?Nk1Na0VJMm50Uk9qYytPVmtlZ0thcis4NUdNOU5iMkFUc3hYRFNvZGtUNlhB?=
 =?utf-8?Q?Z5IMsR0BPV34ij0pV86yM4Zbe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64646ce3-ff1c-4f23-542e-08db4fa9e4de
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 09:52:11.4257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jm+g6YiJwbdbObszlWtGEzSUtgSLlIknUSybD73dgzNUCdFz8eHAurmn60DwcZe06TMN2dOgGrsmDdC9qqc26Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6303
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100; envelope-from=fei2.wu@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.964, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/3/2023 4:12 PM, Richard Henderson wrote:
> On 4/21/23 14:24, Fei Wu wrote:
>> From: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>
>>
>> To store statistics for each TB, we created a TBStatistics structure
>> which is linked with the TBs. TBStatistics can stay alive after
>> tb_flush and be relinked to a regenerated TB. So the statistics can
>> be accumulated even through flushes.
>>
>> The goal is to have all present and future qemu/tcg statistics and
>> meta-data stored in this new structure.
>>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
>> Message-Id: <20190829173437.5926-2-vandersonmr2@gmail.com>
>> [AJB: fix git author, review comments]
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   accel/tcg/meson.build     |  1 +
>>   accel/tcg/tb-context.h    |  1 +
>>   accel/tcg/tb-hash.h       |  7 +++++
>>   accel/tcg/tb-maint.c      | 19 ++++++++++++
>>   accel/tcg/tb-stats.c      | 58 +++++++++++++++++++++++++++++++++++++
>>   accel/tcg/translate-all.c | 43 +++++++++++++++++++++++++++
>>   include/exec/exec-all.h   |  3 ++
>>   include/exec/tb-stats.h   | 61 +++++++++++++++++++++++++++++++++++++++
>>   8 files changed, 193 insertions(+)
>>   create mode 100644 accel/tcg/tb-stats.c
>>   create mode 100644 include/exec/tb-stats.h
>>
>> diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
>> index aeb20a6ef0..9263bdde11 100644
>> --- a/accel/tcg/meson.build
>> +++ b/accel/tcg/meson.build
>> @@ -4,6 +4,7 @@ tcg_ss.add(files(
>>     'cpu-exec-common.c',
>>     'cpu-exec.c',
>>     'tb-maint.c',
>> +  'tb-stats.c',
>>     'tcg-runtime-gvec.c',
>>     'tcg-runtime.c',
>>     'translate-all.c',
>> diff --git a/accel/tcg/tb-context.h b/accel/tcg/tb-context.h
>> index cac62d9749..d7910d586b 100644
>> --- a/accel/tcg/tb-context.h
>> +++ b/accel/tcg/tb-context.h
>> @@ -35,6 +35,7 @@ struct TBContext {
>>       /* statistics */
>>       unsigned tb_flush_count;
>>       unsigned tb_phys_invalidate_count;
>> +    struct qht tb_stats;
>>   };
>>     extern TBContext tb_ctx;
>> diff --git a/accel/tcg/tb-hash.h b/accel/tcg/tb-hash.h
>> index 83dc610e4c..87d657a1c6 100644
>> --- a/accel/tcg/tb-hash.h
>> +++ b/accel/tcg/tb-hash.h
>> @@ -67,4 +67,11 @@ uint32_t tb_hash_func(tb_page_addr_t phys_pc,
>> target_ulong pc, uint32_t flags,
>>       return qemu_xxhash7(phys_pc, pc, flags, cf_mask,
>> trace_vcpu_dstate);
>>   }
>>   +static inline
>> +uint32_t tb_stats_hash_func(tb_page_addr_t phys_pc, target_ulong pc,
>> +                            uint32_t flags)
>> +{
>> +    return qemu_xxhash5(phys_pc, pc, flags);
>> +}
>> +
> 
> Why are you avoiding the hash of cs_base?
> It certainly changes the comparison for a number of guests.
> 
Just as you mentioned below, it's checked during compare. There is a
comment in TBStatistics definition.

>> +/*
>> + * This is the more or less the same compare as tb_cmp(), but the
>> + * data persists over tb_flush. We also aggregate the various
>> + * variations of cflags under one record and ignore the details of
>> + * page overlap (although we can count it).
>> + */
>> +bool tb_stats_cmp(const void *ap, const void *bp)
>> +{
>> +    const TBStatistics *a = ap;
>> +    const TBStatistics *b = bp;
>> +
>> +    return a->phys_pc == b->phys_pc &&
>> +        a->pc == b->pc &&
>> +        a->cs_base == b->cs_base &&
>> +        a->flags == b->flags;
>> +}
> 
> So, comparing cs_base, but not hashing it?
> 
Yes.

>> +void disable_collect_tb_stats(void)
>> +{
>> +    tcg_collect_tb_stats = TB_STATS_PAUSED;
>> +}
>> +
>> +void pause_collect_tb_stats(void)
>> +{
>> +    tcg_collect_tb_stats = TB_STATS_STOPPED;
>> +}
> 
> These two seem swapped.
> 
Yes, it seems so, I will update it.

Thanks,
Fei.

> 
> r~


