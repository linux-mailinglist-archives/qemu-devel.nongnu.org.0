Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867196EABFE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:46:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppr5x-0000sU-Nq; Fri, 21 Apr 2023 09:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppr5p-0000hv-7D
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:46:31 -0400
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppr5m-000899-65
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682084786; x=1713620786;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CpeY6fNuel7qsvshWwCqJo84/SlW5Dgd1oVqdrblKUs=;
 b=mUWx+McWe2Jvk0NPefKUYNCWrcBRa7pdLkHZA3JGEfKuLXAMwyMqyQsf
 Q/Oa32ucXiEXuEW5cJiPtH3r/77MeUiWJXPIo6IrT06BnKDbi3bEQhGmR
 DuxojodI4u3/2kH+DhklapaA5NlsYG/X7qWn3qBnHFKPAwI90h/E0xlt0
 XBNduCKHSDJenta6mPwRdr8Cc3Hyt4MiFjQBtB+3z2DSH5dzVTADF9qC9
 xdk94FOwM3PLwMhaLWfelBos4xK6ObWfUM+2s/n+zsCsh0R030VUC7TJp
 cjr2VHl3hrOSz4U7c246Fx/oUe5Yz5xqSxoGHq2Bf0lerdNXS+bflzWWm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="330192458"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="330192458"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 06:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="816426989"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="816426989"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 21 Apr 2023 06:46:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 06:46:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 06:46:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 06:46:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDC5IDkJfUKuE8ntC8K8OqZf6+iEICoPK8iZgCpJfcNy7diNaA0KOgiZUh4un7QCXPGHRG83Z1kzUbq0GCf9bGJQYaQJdO/Q8ruMuCykktKdlbQQPufxI2KeseW4pNuS6zTXKYG2nlJKgavExtJkxcrfWGf6fgrsXEfsNyfkFN/Q27FOPtlzQ0+B4wtpMEygdjFtk+L++6P8BSOSyUW+3f5D1JLAT+rh/VW8FXW/zRMjH4mKJ0726GrAbJEQZmycvVbcis1uQE0gmEpbE1uA9aOW4aIgV9m7jApyvoj0xFcS1FWLno7vSkzA4pCflaQqHGJL2P4sK1scVxaBMq/RVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWw9p0lqWm19UkHogu+Fm8+g/VAEM08JluyKe5Jj4Es=;
 b=M25JpyK/DDze5gSa/LONXQzFwduhXHKX/C8iBAJntBmNhiHWZvg5W8LrwgsNE3woBxglk2M55CYoaShggFC/BnzmGTiBUrKvhF3X0Pge2lXrmzOsED65LmqTOsQFpghxRyJFDTLREILvERciWGldJRYs/JTa2qpWTilTXmWbdeSWXQkQuaU5M5H6eHjqJk/+Qit9NAHTqaUoZX8HwSGj/tyLTE5t0uYlM+fffpOz9q5jrqd9iZIelCxR8+QSEZgDmE/PLTkcdiQxzmyHQQLaQsuDAnLGZlBPeGFPiW5vavYci7KwXvgxqY92vSnovfBEp26HL0+/3G5vExDBue4NJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by IA0PR11MB7211.namprd11.prod.outlook.com (2603:10b6:208:43f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Fri, 21 Apr
 2023 13:46:19 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::2748:ce38:aaca:8a84]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::2748:ce38:aaca:8a84%6]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 13:46:19 +0000
Message-ID: <33bf7e5a-98f4-5a68-3589-c101f2cdec87@intel.com>
Date: Fri, 21 Apr 2023 21:46:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] accel/tcg/plugin: export host insn size
From: "Wu, Fei" <fei2.wu@intel.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: Richard Henderson <richard.henderson@linaro.org>, <pbonzini@redhat.com>,
 <erdnaxe@crans.org>, <ma.mandourr@gmail.com>, <qemu-devel@nongnu.org>
References: <20230406022751.757980-1-fei2.wu@intel.com>
 <20230406022751.757980-2-fei2.wu@intel.com> <87v8i9jviv.fsf@linaro.org>
 <ce65c074-ff12-1f29-ee64-44fb7ff643c7@linaro.org> <87ttxoc8wq.fsf@linaro.org>
 <0f237ccb-dcbe-87c7-d9f2-653962d30520@intel.com> <87v8i2ri3w.fsf@linaro.org>
 <6ac7805f-8fc5-f598-258c-b0b55a1a35d6@intel.com> <87y1mqemd5.fsf@linaro.org>
 <7eb6366d-c91d-c769-534d-383dfb11fe32@intel.com>
Content-Language: en-US
In-Reply-To: <7eb6366d-c91d-c769-534d-383dfb11fe32@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|IA0PR11MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a22275d-fb0d-4385-8648-08db426ec8e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IkPkePkKABflmcVs/4+UZaNCqwbyKrpyvr2nii/26orQkYAMHh0E569qd8TnS2E8ZGayRUxcm/NKab3ndfrvjRp/XUbgOfdmV3qNRbp8X++3pEkiOMcy9IxGQSEzvDvBJRYBZW7jMeMV1CS3Z4QRpkvWHEjbQLhNvl3ti3g6B0GBwcTbm+TOkWXuNXEu9SDAtP6W28hkWt6m2awdfeX11dz/a9wmpG0uD7NfZ3+ejLuTMS8ctaikvIGUHTJUG3+VG+TuqAbsIlKOP0afD1RTnVOoEy45tM6uFEqQOplGuhf05iXrd7L0ZJoBYqXMA8Y4tKL41pfGP6NJSaHAUDomC9lGBLyxbbuQl/3Zb5eREu/KSRUfPGwSYSdglD6tRaU2spO4X/2lmrsAwrYDVb1qGB+2yT4Ci17O6Y5+JHrhIS3OcbjhgUei6gswediVW11t3bK67fCVjHd2oedqTPybYb2rD65Gb5d6zqL12eTMw1guIJWTN68eFHj4XzD/fH8hYc+tx4j79VcMWUIxgM5xohN0koUqOs/b4vHNrCpFy1Rxn8fpFk8+X+NIdJUtMh2pXJkCDf/6V8RY80jNxAwJ/7U1MQXjrLBel1URCGiYIAuRqFXHEUiKP59xRNXg7TazatCdm8eVgoSc+S0fuXf17zk3LSeIzCr5kxGnPXpWK5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(31696002)(86362001)(36756003)(2906002)(31686004)(2616005)(6666004)(5660300002)(66574015)(53546011)(186003)(83380400001)(966005)(26005)(6512007)(6506007)(4326008)(66946007)(478600001)(6916009)(66556008)(66476007)(6486002)(41300700001)(316002)(38100700002)(8936002)(82960400001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmlTREs2UmR4TDZJR1VuV3VMa1A5SmRXQVlOK1JISzdtZ3M2b3VJbHRHcmgz?=
 =?utf-8?B?dStMRnZFd01JRlRGVjFRV1krU1JldnZHUlEwS1ZCZXlDbVZIYkpIQ25LczF1?=
 =?utf-8?B?OUs0akt3R2JMWStVTGpmWEJJVU1KQ2tQR051ckJydWZnejZpYUtQdVE4SlBI?=
 =?utf-8?B?dnhjZHkwTnNtQTJlQ1pueDBnMlV1eGVKNFZHcVFxVmJQYmRvNTRZNHZlaTlV?=
 =?utf-8?B?TE5ydnVsSHBIc3B5cGJRN3MzejBSdHJYbzRhMDdLcU5FekEvNmRiNWp0VkJr?=
 =?utf-8?B?M093WWcyTVRwS3A1NnlPa05Ec0FMNmF2VFdlODhNVXFMcHhEZlBLRzZldXdB?=
 =?utf-8?B?dW5JaXl4VXRiKzFzQU50dzFaWnk3UGprejk5T1pjK1lYQVFMQW1LWnJ2Uytv?=
 =?utf-8?B?aDJYMG5tWGlLcVlqVlNQME5od0lrVmhjb0FVODljYlo4T0FNN0ZMZU02NzZr?=
 =?utf-8?B?cFFEZkxrUzBhdXExZnpPTVE1VExLT3VzeWladTNGT0pUSGtEQ0UwbkZIdXVa?=
 =?utf-8?B?ZVdsM0xuN0JmMlJLSGJwaFBrc2ZodmVNSy9TYnptL2RPY2EzRzg1Wmx1NXd3?=
 =?utf-8?B?bHJKaDMrc0RKWUhVTENBS0x1ZDAwSk5wZzdzVTVyYi9Kazd6TVp0bnk3bC94?=
 =?utf-8?B?NjRaamtQOHRoMm81eUtvdUdDRURUZklXTzVuVExDdEptZVFRU0NaZ2ZPdmJU?=
 =?utf-8?B?N3FiK0ZzT1I4U1U3OEVBNFozUUd4MFVRS2FmWkNCc0NkNVgyUFJzVkF3RjZD?=
 =?utf-8?B?OGJFRWdLSlBMOUdxeUZDY3d3b3ZQOFJSRmJhTVNXZGxjQjlnNUZnM1d4NjlE?=
 =?utf-8?B?eVRRaXZ2MW5zdTNIeDZsWjcxZWJOWnFjUFM3cy9YN0Z4VTNUamNCZnVXM1ly?=
 =?utf-8?B?MFQzR0Rhc1JRVEZyS2dKMjZYWHZtRXFBa01XSjQrQnFwVFZWWDB1WkJvUENq?=
 =?utf-8?B?RXNLYWJJV0QzSW55QTF3M2xhK1FoUis3RFNLdnRzeU1oM3VjS2N3THpHbWVU?=
 =?utf-8?B?QzFJUjZxU0drd25WSk00QlVudXBhSUtVdnA0aXJsNzc2b3lpbTQzSGpxWDZh?=
 =?utf-8?B?cTNUdUVGUFJWRm9MSllHSWI2MnUrZGg3Rm9rdDVFaEZ6NlJUdzBSMWY0eURw?=
 =?utf-8?B?MzAxNlZhRHRYaHhsOU45K0tzOUI3M296d0VyeTh1OE1kZFRXRmUycXZGQkN6?=
 =?utf-8?B?RngreCt4YTZCNDBJS3I2OVhxRnc4WHFTV1BPVEpkODVqT1Z4UnlwSEtBak1o?=
 =?utf-8?B?MGhxZ1N4SUI0NWdnU0JMVkk3bzJTSy9aWTBoQlFTdFdtRVRsalRKQ1BSd2Iv?=
 =?utf-8?B?L2c5b1c5TGFUNGt6elUxVmpVekZFeDRPdGZzZ3h4ZEZla1Nic0JMRG1KSjNB?=
 =?utf-8?B?bS9aODNwbG9xOGFWQm40S1ArblJ2TXlIY1V3TVlOcG95SjBpRlVyMjI2Zmx3?=
 =?utf-8?B?clhmejNITmQrUVRYeTlUZnNsdUlGN0dsZW52Z2JEaHh2cmZXbHlWQ0FKL3dj?=
 =?utf-8?B?ZWwwQ05BVGkySTU4RTR0T0FZZWlZSHk2dHV0OFFRa2F1c3AydXkxSFIzczl6?=
 =?utf-8?B?NXZrV3RHSDZhcWkzaFBQYkFRUnQ5VlVHbjFjckdscVpHSnFzMzd4Q21yUFZ4?=
 =?utf-8?B?TmtvMDc5bllXdUg5eklxa0VnQUNCSGFqKzdpdmNyYWE4WDZrWHpQYmhHNDhi?=
 =?utf-8?B?STFJSUllTENJV2VPTHNjTllNVzYybTBtSEsxbjJvc2NhaGxKVnNYcjFGUjBi?=
 =?utf-8?B?bDNObitCY3gyY3hBZzYrTTk0cktCZlVwTlQ3a1NqUCt1Yit5STRiQkY4RCth?=
 =?utf-8?B?MlhsVnFuQ2NDamJ1WmxFcC9sbWZ3S2xkZDFVV05ESE01Rk1vS0owREQ3WEFJ?=
 =?utf-8?B?ZVNZbVVWcW4rZ2llWTBwQXlvbUJVbHYwcWZoMk5sdisvQTRvQjVsVVdnT0JY?=
 =?utf-8?B?OTNpcGlrQnBGVHFNemhOemJjUVB1UUJtSGk4TERCWmtYemZVSFdqSGJJNFFi?=
 =?utf-8?B?d2htRnNDdEFTckVZM05jalEvWTNydzBIbWtHT3FNUEJqK2R1SmJuZlhhYlM1?=
 =?utf-8?B?dlBmZE9McEdvbFo3S1h4aitsTmthcTdmNHpuWWlYeE5jajZWWC9MRmtpcUdB?=
 =?utf-8?Q?Eyk1lcE7/s6YbxKuo9y6x/FRb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a22275d-fb0d-4385-8648-08db426ec8e1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 13:46:19.0847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 329MA7gCH6JAyM5jF66iEA3SXakBGpvPiy1CJc/3ZLc97YMwnEhHdyiTyDuYcsmeLyKQ3cFmqaSvfUbDQV3uZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7211
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126; envelope-from=fei2.wu@intel.com;
 helo=mga18.intel.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.297, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 4/17/2023 9:01 PM, Wu, Fei wrote:
> On 4/17/2023 8:11 PM, Alex Bennée wrote:
>>
>> "Wu, Fei" <fei2.wu@intel.com> writes:
>>
>>> On 4/11/2023 3:27 PM, Alex Bennée wrote:
>>>>
>>>> "Wu, Fei" <fei2.wu@intel.com> writes:
>>>>
>>>>> On 4/10/2023 6:36 PM, Alex Bennée wrote:
>>>>>>
>>>>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>>>>
>>>>>>> On 4/6/23 00:46, Alex Bennée wrote:
>>>>>>>> If your aim is to examine JIT efficiency what is wrong with the current
>>>>>>>> "info jit" that you can access via the HMP? Also I'm wondering if its
>>>>>>>> time to remove the #ifdefs from CONFIG_PROFILER because I doubt the
>>>>>>>> extra data it collects is that expensive.
>>>>>>>> Richard, what do you think?
>>>>>>>
>>>>>>> What is it that you want from CONFIG_PROFILER that you can't get from perf?
>>>>>>> I've been tempted to remove CONFIG_PROFILER entirely.
>>>>>>
>>>>>> I think perf is pretty good at getting the hot paths in the translator
>>>>>> and pretty much all of the timer related stuff in CONFIG_PROFILER could
>>>>>> be dropped. However some of the additional information about TCG ops
>>>>>> usage and distribution is useful. That said last time I had a tilt at
>>>>>> this on the back of a GSoC project:
>>>>>>
>>>>>>   Subject: [PATCH  v9 00/13] TCG code quality tracking and perf integration
>>>>>>   Date: Mon,  7 Oct 2019 16:28:26 +0100
>>>>>>   Message-Id: <20191007152839.30804-1-alex.bennee@linaro.org>
>>>>>>
>>>>>> The series ended up moving all the useful bits of CONFIG_PROFILER into
>>>>>> tb stats which was dynamically controlled on a per TB basis. Now that
>>>>>> the perf integration stuff was merged maybe there is a simpler series to
>>>>>> be picked out of the remains?
>>>>>>
>>>>>> Fei Wu,
>>>>>>
>>>>>> Have you looked at the above series? Is that gathering the sort of
>>>>>> things you need? Is this all in service of examining the translation
>>>>>> quality of hot code?
>>>>>>
>>>>> Yes, it does have what I want, I suppose this wiki is for the series:
>>>>>     https://wiki.qemu.org/Features/TCGCodeQuality
>>>>
>>>> Yes.
>>>>
>>>>>
>>>>> btw, the archive seems broken and cannot show the whole series:
>>>>>     https://www.mail-archive.com/qemu-devel@nongnu.org/msg650258.html
>>>>
>>>> I have a v10 branch here:
>>>>
>>>>   https://github.com/stsquad/qemu/tree/tcg/tbstats-and-perf-v10
>>>>
>>>> I think the top two patches can be dropped on a re-base as the JIT/perf
>>>> integration is already merged. It might be a tricky re-base though.
>>>> Depends on how much churn there has been in the tree since.
>>>>
>>> I have rebased the patches to upstream here:
>>>     https://github.com/atwufei/qemu/tree/tbstats
>>>
>>> I try to keep the patches as possible as they are, but there are lots of
>>> changes since then, so changes are inevitable, e.g. CF_NOCACHE has been
>>> removed from upstream, I just removed its usage in the corresponding
>>> patch, which might not be preferred.
>>
>> Yeah that fine. CF_NOCACHE was removed to avoid special cases in the
>> generation code - we simply don't link or store the TBs in the QHT
>> anymore. As long as the guest isn't executing a lot of non-RAM code we
>> won't run out of translation buffer too quickly.
>>
>>>
>>> I did some basic tests and they worked (the output of info goes to qemu
>>> console, instead of telnet terminal), including:
>>>     * tb_stats start
>>>     * info tb-list
>>>     * info tb 10
>>>
>>> Alex, would you please take a look?
>>
>> That looks pretty good, glad it wasn't too painful a re-base.
>>
>> The next question is do you want to pick up the series and put through a
>> review cycle or two to get merged? It would probably be worth checking
>> the last posting thread to see if their are any outstanding review
>> comments.
>>
> Yes, I can do it. I have something else in hand right now, so the review
> request may be sent out in a few days.
> 
I have sent the review out here, hope you have received it:
   https://www.mail-archive.com/qemu-devel@nongnu.org/msg955889.html

I just received the cover letter w/o the following patches, I do
subscribe to qemu-devel@nongnu.org, not sure why.

Thanks,
Fei.


> Thanks,
> Fei.


