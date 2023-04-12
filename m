Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BAE6DF7A5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 15:49:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmapO-00078Q-MB; Wed, 12 Apr 2023 09:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pmapG-00078H-Df
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:47:55 -0400
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pmap9-0006jn-VY
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681307268; x=1712843268;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t9HBp0uMLGsbhXTDSXM+fp+LmdXryIvDZ/W4/yUetwg=;
 b=FsQ6NsxWqXisR4u0KFCgY5vP7wQi4ClUHed/gQ8S/Ik5u8VGxsvB6DUw
 tNBQRpNio6KGv0mrvgzXomgcii3An3qljyuvGxYT2GRwnzkR0yiF17spV
 EbWprifpRGsQBv+lnGkdTD7AnNJ4SL26VJtYguBsAwII57Z6ZGoc/R7cR
 bX6O4nZJk1Q4ziPw3lI9h+d2m7rAaL5ngwutA+b5K1W6U4r1dDeQpuBWg
 kykmHnx+YIESIPvhp+3O/Pe6jG9HFQDzp+NOYsRAMjbvvzs7+fKBKY6ly
 3FOT4qVnsXMwdvs7qG63wJdW4ebHUzSEC/yjW0Kiw6fjbPfiVslSaVkEE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="341393039"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="341393039"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 06:47:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="812991345"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="812991345"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 12 Apr 2023 06:47:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 06:47:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 06:47:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 12 Apr 2023 06:47:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 12 Apr 2023 06:47:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAhOFNzwZkV1V9bdP09rDu1jbvXamfF+est5wNQfUBsu9a1a+GZky7fm38kkH9CtvdJsbDztp23RtKxSjzVrch6+n170UPzvPP7Z12j1sMBY6Sp6Zb139UayptxTvlOxiSXyTn8rKJ2dadXpGkpeIbntpk1CU8Vk0h2t5rahRLJ2pzNYQpd6cLJWtX4NGuWyVFIQAllwyluqYlakQkmL819hpAld+OnrsBqNg7tJN5w12QwHgsc/0p6pQ7nxHeoqPTP8TagUhZruV2l0TDhoeZGueSaLrsvuFsS9a/saqEW821QjTKA9fSPu7fDxBxU9+Gh7S2tqbGs0W+xBn5KlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNxV0rOTof/e6wI5bgnmHUFTXgNeodO0aed6qZ0JYE4=;
 b=e4v4G3jIJWWQdpg3RxMdqCQAEeUeIy6R2gQKMRmzPezb8AyZG72RhGRENuCQwwx3DVlqIva3/qEVt62kwIkMuigI0cqb7MK4WOsyz/wwaXx8/KeExPOvXdl61Qz1/V9+9b2ED3323J+KV0n51+R3lbOcJvHSU98gdNn+O1t9DOqv13mvsEjH4+rcgPWShV35b6VZ2w4tjLyc4JHUiSlc05ll8SQVO5tioVp+nU//UYbuYCrScCqvyZIn5oS6C5t3Ka4A736sizwPOSYqa4cU+ZjnaQ4qCCAn77hStXjhiIG0WA5pghazU50w2sKdF0eoMN3g1XR0bZo91w8K7b84Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by DS0PR11MB7903.namprd11.prod.outlook.com (2603:10b6:8:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 13:47:39 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f%6]) with mapi id 15.20.6277.038; Wed, 12 Apr 2023
 13:47:39 +0000
Message-ID: <543d8c4d-8544-6a30-2a80-b1ef5fa4c248@intel.com>
Date: Wed, 12 Apr 2023 21:47:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] accel/tcg/plugin: export host insn size
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: Richard Henderson <richard.henderson@linaro.org>, <pbonzini@redhat.com>,
 <erdnaxe@crans.org>, <ma.mandourr@gmail.com>, <qemu-devel@nongnu.org>
References: <20230406022751.757980-1-fei2.wu@intel.com>
 <20230406022751.757980-2-fei2.wu@intel.com> <87v8i9jviv.fsf@linaro.org>
 <ce65c074-ff12-1f29-ee64-44fb7ff643c7@linaro.org> <87ttxoc8wq.fsf@linaro.org>
 <0f237ccb-dcbe-87c7-d9f2-653962d30520@intel.com> <87v8i2ri3w.fsf@linaro.org>
 <204c0ffc-4798-38f4-41ac-5340a12a8b49@intel.com> <87ttxlns6f.fsf@linaro.org>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <87ttxlns6f.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0213.apcprd04.prod.outlook.com
 (2603:1096:4:187::11) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|DS0PR11MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: 7adbea37-e254-4ada-648c-08db3b5c7af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /dbDy8mS5BwlgYDtbfFFTQNpOZIVBbXPYqDDft3bqyj5l3RiuvCsGSLtr6eTkkRZWAowRPDDh9rnz6ghVd7o5PCxFzJZZA769n06VxHGenUM+/PztXTx2R3IuUNlrxD0SmTWx4oyYiRDdMIcQZhfz1y1XQgQTCZcFgVzjHatBmxEuFr64wLzeEhfhuqYC1lu3tUiBkBJOYtppW+rpp8XM4oyuiXldLul0tXt3tHkrs3bmLPrcuAJfCVRk914vdG1pmPe1CgFVIgSENOexpcBfCY6zgkDbUeGLa+gfiA41mAaU02WbZ8xA9/grue52aX2VmKl6aLwlQuS2AZ9ql5MKCYvjVEhTBwwJHAXpJ6bytXBplxQoXzLVYhO6H8pAXf8PRpQ87Y5sQIVpirGsKOsNJP3SeWitud4qqyKFe8U/1jESQzkzYcfjU7c/hyobGOW0MTw6oq5WGdtLcrUOfCVufHfpgcSSrPbk9XJgoPRrhPzZnEV6uGCG/XuGxgaH0KusqqCQxOUu5jX+e5ESYSEWH9l+UblSYosmDm6y5q7a257mVO+hNtIqYU4hOkQHlb/XZMPaMRJE7PLX5Z8haBBDu6g5kMl32l3ehddJ6jJhFzJH2LFdQonYDn/uXUkALxu/P6JP2JELLIlut6oNqzYX9cgMnd8zzt/GYft4Mm1LAc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199021)(6666004)(82960400001)(2616005)(83380400001)(66574015)(966005)(478600001)(186003)(6486002)(26005)(6506007)(6512007)(316002)(53546011)(2906002)(36756003)(5660300002)(38100700002)(4326008)(41300700001)(66476007)(66556008)(66946007)(8936002)(6916009)(86362001)(8676002)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkpGVlJtRzMzblhjZVd1eFdjbUx4M3ZYQld3K1owcmNvVitLVFpQV29CS3BY?=
 =?utf-8?B?R09PdTN6dWR0QWlPUDRXRkx0VVRQUk92bDFSN0ZETk5kSnNkS05KRTh6NU1E?=
 =?utf-8?B?UWVNR1JoekdMaFZaQ3dic3pwRVMxK282dUQyM2llcmpRQjRpckViYXlJNXFX?=
 =?utf-8?B?OThoOWdoblV2Z3J6UWl0Ry94K0Y5TGVIallVWU1yaFBDRCs0aGRyWmNMVHUx?=
 =?utf-8?B?M25PUm0wNDlxb2dnOVAydnhEbHI4ZnMxNGdQUW00NFdsQi82N0dlS0FMUGt1?=
 =?utf-8?B?L0dGYmt6L0wyYVdCSlU1a1JqUmczYlYyMzlpc3RnSEhSM0I3ZUx4MHozYXlU?=
 =?utf-8?B?eEpWd2ltaEhPNkw2SUI1djVHbWRJMjhqbDZneFNmTVRDS0htVXJGWUd3dUZu?=
 =?utf-8?B?MHA1akFlT2VOWENjSXk0bmQ2UnIxaVpRVzJyUzhhRkkwZXAwZTA3ZEx5S202?=
 =?utf-8?B?QVV3UXNZaDlBaXFTU0lYRWdwUDRrSUFGaldhT3UrTjVlNkowbWJUQU5qa1ky?=
 =?utf-8?B?UmhGc1ZkSzZUVm5kUDJacmlOZnNadUhhUGtRZ2I4b0N4RmRqZW1HYXA0aFVY?=
 =?utf-8?B?TERJS28vWUo1ZExRV3dtTk9Pa1NMendCUHRTZUtycWxvMm1zeHBSOG8yUWhZ?=
 =?utf-8?B?djMydk9rSEpKY0E3UWZQSFQySmY3K2x0ekIxRzR2R05vUTRtVWFhdFFId3B2?=
 =?utf-8?B?eitYdmY4cE5kS2Zra1Zob1YvMVJpWWtUa0hMMEZEUXhiU0pCZGhrNk5QRHNC?=
 =?utf-8?B?ZFdtb1ZneUYveUlsK1pEWjdzMnVOVGlaZWFPcG1vY1JqVHJMdWExTlFncWdv?=
 =?utf-8?B?L3dDR1lYanhBbUtBZHY2dyt5WnhLTFY0eldiL01qTXEvVVRXUEtWVFBYTkha?=
 =?utf-8?B?TFpJS1hoUmwvWDFndlgvaTNWQ2NHRUZlZXZuallyWXRBRlRlaisxL3hkY3du?=
 =?utf-8?B?QjNWVmJTcXlwUmx4QzlKOHZoWXVuM1dwbUtEUU84dXhTc0IvL2xqQTA1cm5G?=
 =?utf-8?B?Ni81d1pLdTRYaEM1SnlWNlpibXAwaGhVWUdCdVZtNDhRQzgvaGsvYS9BanRK?=
 =?utf-8?B?RVBEdzhDeE9haUVaUkJFQTltZWRCL0lOZmRSdXl3dFF4c0VIaHNTc2RScWNj?=
 =?utf-8?B?NitGclF2VU5nU0pjVjlyQ2plRG9QeFY4VHRLbERMeUFKTllNMkU1WXdoMitQ?=
 =?utf-8?B?aWxZZWtQVEtzZ0NSMFVqbnpYTnZYcXNDZlpOandjUWw1cjdnOWtvRmx1ckdr?=
 =?utf-8?B?Rm9XNGpGR00vUGZ6VzVneGVqRk1OcnVDbTVHc2RKalpsaW5zdnVCemxtdEhH?=
 =?utf-8?B?Vm1RRm5maHdjVHdPcXdVVW51QXgxcXpTejFjRVZwVFdjdG9scEkyamtwcml2?=
 =?utf-8?B?UGhjckhNbFhJYnFhWTlHVVgxUW5jNEVSUnprZHlESk9IUGZhUWthMG1oZFhk?=
 =?utf-8?B?dXJCRThmVmJyQkRhWXhGNm1JRmQvL3dJMUlCVVVPb0pSUE5aVmpZd1gyK0tq?=
 =?utf-8?B?elVmZFZ5NGtqRkFIc1liMW03U1MyRk96QnF2Vk9VZUdRbDVzcXlEVllJVWNR?=
 =?utf-8?B?MW5aaWFBc3EzTmFRcllvb1VRZFRyZkZZWi9Bb2ZzOVhvN29yaitmWFZDQXE2?=
 =?utf-8?B?Ti81a3F4M3lYdmJxa0dpSXRXYldZUS9DL3Q4UlA2Y2pTbis1SXI2ME1FUTUy?=
 =?utf-8?B?TC8ycWZWU2FJNS9EcHFGTytCcG1HcmM5cXFnSGhxc25sckVUQm9jY0l3MzAz?=
 =?utf-8?B?UENacDkwYS9iL01VbXhDb2JRVlpYdnhnVGJ0d0lRV05XM2xNY3RlYlF6dCsr?=
 =?utf-8?B?cXZEcFVnY0RZblV5V1FIcGVRWnpzVW5FcWl6WWI4U0xFOEFJR2lBQnh5TGl0?=
 =?utf-8?B?VUdkM3IxTnVxSUxRQk9jbmZ3LzE3T3l1RGFISjhwcURRWGlqTm53MUMrZUMx?=
 =?utf-8?B?ZTBISlhYRThIbmpVbU42Y09QdHlnUWVTbm5aK2EwWGFDYTFjSHY3TW1DbitR?=
 =?utf-8?B?N2VXcElaakZiaFZML3VMOGtmVnhYY09lNUFGYXhISG9tam1wRmVDeWVPT3RD?=
 =?utf-8?B?ZFlmL1dCdTFUMndSWmx5bjVjWGRQYlNLdXZNNEQvdzZ3SmJWaXdYVkFkOGdw?=
 =?utf-8?Q?h6KA4BWbTV8D0yVteIFYg/mkD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7adbea37-e254-4ada-648c-08db3b5c7af4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 13:47:39.2008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JImOkkopfOzu0wCBX7A6/HJzwEyp9RyojIj8jVlUiJJt07LSo+oSg44UerweOBW7IwAmlLC4/iUyL+wqJxWN+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7903
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=fei2.wu@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 4/12/2023 9:28 PM, Alex Bennée wrote:
> 
> "Wu, Fei" <fei2.wu@intel.com> writes:
> 
>> On 4/11/2023 3:27 PM, Alex Bennée wrote:
>>>
>>> "Wu, Fei" <fei2.wu@intel.com> writes:
>>>
>>>> On 4/10/2023 6:36 PM, Alex Bennée wrote:
>>>>>
>>>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>>>
>>>>>> On 4/6/23 00:46, Alex Bennée wrote:
>>>>>>> If your aim is to examine JIT efficiency what is wrong with the current
>>>>>>> "info jit" that you can access via the HMP? Also I'm wondering if its
>>>>>>> time to remove the #ifdefs from CONFIG_PROFILER because I doubt the
>>>>>>> extra data it collects is that expensive.
>>>>>>> Richard, what do you think?
>>>>>>
>>>>>> What is it that you want from CONFIG_PROFILER that you can't get from perf?
>>>>>> I've been tempted to remove CONFIG_PROFILER entirely.
>>>>>
>>>>> I think perf is pretty good at getting the hot paths in the translator
>>>>> and pretty much all of the timer related stuff in CONFIG_PROFILER could
>>>>> be dropped. However some of the additional information about TCG ops
>>>>> usage and distribution is useful. That said last time I had a tilt at
>>>>> this on the back of a GSoC project:
>>>>>
>>>>>   Subject: [PATCH  v9 00/13] TCG code quality tracking and perf integration
>>>>>   Date: Mon,  7 Oct 2019 16:28:26 +0100
>>>>>   Message-Id: <20191007152839.30804-1-alex.bennee@linaro.org>
>>>>>
>>>>> The series ended up moving all the useful bits of CONFIG_PROFILER into
>>>>> tb stats which was dynamically controlled on a per TB basis. Now that
>>>>> the perf integration stuff was merged maybe there is a simpler series to
>>>>> be picked out of the remains?
>>>>>
>>>>> Fei Wu,
>>>>>
>>>>> Have you looked at the above series? Is that gathering the sort of
>>>>> things you need? Is this all in service of examining the translation
>>>>> quality of hot code?
>>>>>
>>>> Yes, it does have what I want, I suppose this wiki is for the series:
>>>>     https://wiki.qemu.org/Features/TCGCodeQuality
>>>
>>> Yes.
>>>
>>>>
>>>> btw, the archive seems broken and cannot show the whole series:
>>>>     https://www.mail-archive.com/qemu-devel@nongnu.org/msg650258.html
>>>
>>> I have a v10 branch here:
>>>
>>>   https://github.com/stsquad/qemu/tree/tcg/tbstats-and-perf-v10
>>>
>>> I think the top two patches can be dropped on a re-base as the JIT/perf
>>> integration is already merged. It might be a tricky re-base though.
>>> Depends on how much churn there has been in the tree since.
>>>
>> I'd like to try it. Why has it not been merged upstream?
> 
> Bits have been merged (the perf jit support) but the original GSoC
> student moved on and I ran out of time to work on it. It became yet another
> back burner series that awaits some spare hacking time.
> 
Got it, let's see if I can help.

Thanks,
Fei.

