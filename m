Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549EE6BC39C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 03:11:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcd3v-0001oN-KJ; Wed, 15 Mar 2023 22:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pcd3l-0001o7-BJ
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 22:09:42 -0400
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pcd3i-0006RE-OW
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 22:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678932578; x=1710468578;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p1hkA34Nk4RCnHfCdfFSFgQnyjkNcs7Os4i5S1sqxNk=;
 b=LoFTMM4xiFI28eBr38/N46MiabqeWNnCUJQGuG+RA0kt+2nSLW4EAMVw
 X+lFhivoPIFCGjIjJ2qGk2xjayY9hIukjl9aZKx37SEW1g44g1z8j9j0m
 pRl+YT14weqPe8ATxsaGhfISko6JCOd960XdBrzrCTdEFYI6vN6HSzoGk
 PHaLtnaxNAmmZ9xMk3mgNRSuH6eYTIWXnV3ybgKIfW6oetPt2NMFnxf4l
 n1jBVUDR7eUTZcvGd+65tFYVVz3jPogZfQfqOyPsyJk0Pjw5kPAuqGxOn
 y+7NUsuXm2OJKpH5j/xgJu0Wuu2aVEEp7Z2Mmo2/f5Cvfa2jKGfomle2M A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="402739134"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; d="scan'208";a="402739134"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 19:08:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="790077242"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; d="scan'208";a="790077242"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2023 19:08:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 19:08:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 15 Mar 2023 19:08:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 15 Mar 2023 19:08:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xw63uUBVUCf9lhH9cng/tjGrZrQjy5FwSW+jTzglYDQUvTrlI1g4Va2KJgQ8tcArTNxpqo4DMWEJ6BCUtEd1qJ+1dQ0z5NBnxqkUapbOaWGbveZuDCuLdA+iJgCKd0rgAfcXNPBx6sxlC3wUGCaRnYm3YQUhGxZ+w+EA2sRN173mReIBRRDV83BJCIlYU4mQ8zCIN1rQ1QuxYPrAK1ckCHugvJb1F7vJe0/ry2czaxmrYeHTJD5/bt74FCGkfEsUAGXY7Vo/qFzK2/s/04DA95Ng/CGcAtQ3w3HMeHIZAqGIXimT7ZI6dXMa4VHIa7OeMP2eUpYRdcHAtkRa1TxPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3xlhn3b9HtFWInJIq4cS2NngqfrWiojk6h17i1/TC4=;
 b=kgqDR4BZis2eSbLKW0FJ48HCvorjkgAJ+DPD/LmdYI36MQiRov2EfyBEnRagwI0JLcIbPFGNbegH1MsHz7euSIWj3+q5qz2fw5YBdwYgREkc1W5uTdydUN1tJ1Mhdkk3welC4z0viIC9/XhBwu4vmcNWYS9ZaCdLJCnYpNKeCmL1pLg0NC6STt32JKtu/8gfOpJC4wr7rLo093rBfOzasvq6LMowuVlK46KM8hALaN1BzllYxGBAvUWEpjKij3VGbcINmlauNgOCkhXAYUarpmDIBDK5iTu6IGZC3TT/VBZorhf4Al/1C+3hEgbAWut4cm9XJ7oWue6ERcDuQES4Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by BY1PR11MB8077.namprd11.prod.outlook.com (2603:10b6:a03:527::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Thu, 16 Mar
 2023 02:08:06 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 02:08:06 +0000
Message-ID: <c20c0885-1e95-16c8-2c44-ec33e5f3f44e@intel.com>
Date: Thu, 16 Mar 2023 10:07:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 01/28] accel/tcg: Introduce translator_use_goto_tb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>
CC: qemu-devel <qemu-devel@nongnu.org>
References: <b160a8f7-10b0-5674-a040-b11ca4aed3c9@intel.com>
 <714313d8-7828-196b-50ac-fe12d2143135@linaro.org>
 <12e54d71-e208-507c-c9d2-c313f9301fc3@intel.com>
 <db955647-d769-e9fa-b314-6a3ee16b0b95@linaro.org>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <db955647-d769-e9fa-b314-6a3ee16b0b95@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0213.apcprd04.prod.outlook.com
 (2603:1096:4:187::11) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|BY1PR11MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a212f04-4da0-43be-e201-08db25c347e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V3XxubEGGhuqAxOihxRcz5jdt353S8ACs2Mg3PZT1l/Txund8iFLBtEjm8gAfG7WX2SeYw/sm1yOcvsw6UhzYWZTC2+XmunxZ90BBSE5htX9N7rDnArcMB/Vy7bnuqjDhVhBCD59GuCB1WM95+Z6O95zAT5TiMsQarqVfj+0ESFGp2bwj36qbgD7yerFSHpkbCevsI2RhWpzPO5nO2C89SCFhiz1tN54P/RgiG8hZoio3wRMRV8w9rnpe7FOwA9nl3RWx8rj9u5DUnYoZ3p2uQZsdUxA1cKuOf9u/I49eF3erk4KRv9dEnMHis4UR+9RTGOEju6foBn/G24ODQ+ZDXIVDtaVj6q9lRELvPgxvLENSusAnsknwz5feVznQDTv3tHu55DDWV0GGyiSdvsbU6MZ+6wtMeJwfgYwfFxAPx8kNchvj6/+6QgF/7u/i5Y0eMH7ZYCV2hn77fIMcxWHax1G795WiLYDpwMEHlRt51eGqAMkXJjYB5cTBnZ6JJ9ujpGAfudM3EVSdOKYXFnD3jkcpUuIFS4nL2yiug1gA3LeFXv7ljO08Y6pz6F0FXMRvD+tEixGM9a7xftdoL0FAs0KiOxKtJGR2YMrjhyVxJYFm57Su0KnfKunXj3wh9oCshaswVqLov8CVh/gnWgWTZ+UF3dGhvvdURzbSiaZM2mKVrRgMU3dSt7FKtflpo3GtOfDa14Y3oI084RNYaZYOckzCxaX82z5/0ifcb5OjnoI2CmvMofNgv1Yl51pxDskS85Olj/jXg/pHI+7NBU1/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199018)(8936002)(5660300002)(41300700001)(6916009)(4326008)(36756003)(86362001)(31696002)(82960400001)(38100700002)(2906002)(2616005)(53546011)(6506007)(6512007)(83380400001)(478600001)(186003)(8676002)(6486002)(966005)(6666004)(26005)(66556008)(66946007)(31686004)(66476007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGFQSld3ZHNYcVhUL3BXQTRMKzIwWFFaL01IVWoxT05DSWZnL2xkU09nT0p1?=
 =?utf-8?B?MnF3cUMrNFdiVGtUbTQvVlpaOUlTY1Y0cm9pQlgvZ1l4QWNlRTJTQ2x6YzFY?=
 =?utf-8?B?R09ab2VxcWdkNFEzTFkzL2t5UXhzaXRNb1A0bUtRZkNORG1RVGtWU05NTlZE?=
 =?utf-8?B?aGMwck5hYnNvTlR6TVBsd0xiOFd2WjVETit3RXcwV01OZTZzL2dvWWk5NmZC?=
 =?utf-8?B?K1lTR3FsNmhRYzJaNU9WOXZBRjFFc21zeE1KNGJFWHVqTEhaOXBlczN2VnAr?=
 =?utf-8?B?dmZ5bTZkTENIQ0w1OW5pdmxvRXp0UUI1U25tSFRRaFpCbi9IVzVTdzNpSjBG?=
 =?utf-8?B?cGg4bUQ4Z2VDejFVbWlqdVA0a0lRVkUvZXVWZjFZZEVQa2tjNU5CRjVQYjgv?=
 =?utf-8?B?YTFJWU1yMGkycmIyb3NQK05zQURMTHIrd1d6UXlCS2hYMTljbm8zVzF0Z3Z4?=
 =?utf-8?B?TUlMTTQ0UjFrTW9YYU5nTW9rTXZkbW4xS2k3RlRqYkRSOFFseE5zQVFNSXBs?=
 =?utf-8?B?ZWhmVE9uVTBITEpqakpteXk4dU1mUU5DNTJJY2xhVEhaTTJkbW84VzBPTkFj?=
 =?utf-8?B?V21USDZXWnEvUHl1SFU3TFBPd21EbWZzeEJabzJJaW9WWGJmK3NtZXBFaTJS?=
 =?utf-8?B?TkNqY2xQcENKU0VPTVk1M3puMzJodGlNY3piVERqT1EzV2JVdmQ0Z0w5dFYz?=
 =?utf-8?B?eDBLWE1Bc0VpZlpoelJPYlFkMWVEa1M4RmVTdUdwd2JxRjRGK29zcGhYSEcr?=
 =?utf-8?B?dnVWTTRsM0FNeWgwWmhXL2hsTUd0Nkluc0NGbmhYMFFIQjR6Y2ZyYjh3UU00?=
 =?utf-8?B?OXdUTzhHL2lHdjJGOGRXT1NuZ3NiY3QyRXg4TnlueTRQVXNBMVovNWNETWdu?=
 =?utf-8?B?Q1ZLTkN1eGtxVzhFQUx5aVJZT3djTkFWQUk0TFBuZFFuZTVNZE5vRk9NT01M?=
 =?utf-8?B?SXdWa0NxK3lTT3pSQjk0VmUzMWlMczlwRWxxOHMxRDkxbEFWMFFXYUIwaFk4?=
 =?utf-8?B?YjBGdHJDM1pMS3hGUkM0c0pmTTlsaUlleDQ3WUFycS9ENWFFc1VURUV3dGZC?=
 =?utf-8?B?cVM3bk81bUJvanNIeGl0RU5leVF3K2xWSU9Ba253R0FiRHhONmpGVFpyNjlY?=
 =?utf-8?B?Wmd5MzFnVWdiUGdQekFrVlpEWnVBN1k2eVMrOHJEU1hyc3NQb212aVBRWWt2?=
 =?utf-8?B?bWxQOUExN1g2Um10YTNuMDY0R2M5Q2RHUTNnZUlieGMvSE9BOFg0RlNBMkRL?=
 =?utf-8?B?bWl6WTB2eElyQVlpZ3JHU3drUlordndXRjlhZzdNd2RaSHdpOWtKY25pQ09R?=
 =?utf-8?B?WHAybzlqL29vUHNBblo4Z2J6bG1Bcm1TWk5uK0Vyb2FGQjU3ZVh2OU90UHhI?=
 =?utf-8?B?VnRjL1dkcFZVZFJZQjdGdDJLK0V2WEVYTGg5eDIveU13ejlIVUMyLzJsbTVO?=
 =?utf-8?B?WkoyNWlKeTVJTVpyZlRocmEvaHRicjIyTEpWdlBPMzdtUFk3d2NuNGZqU1Z0?=
 =?utf-8?B?MWRRSW5QTDhTb0Jwa0pYeStPZlhvdEREZzZGTEJxbEFuY1MvbE5rMWVjUVZP?=
 =?utf-8?B?UUpxbi90UEdxb1RHZGdxKzUvU1FSYVlmVDN4SVB5alRMU1hEcjJPdURZNXk3?=
 =?utf-8?B?MzlGQUhVeVZOeDh3ZUhnQ0xpaWQyTTkrN1gyRmxScGY3aFU0Z1A1Zm9tUHV3?=
 =?utf-8?B?NDN0WG1mcDJJaEMzdC9NUktveU53MVBXbytVcTVyVFdiUU13enE0NlQzRi9o?=
 =?utf-8?B?NGpOUDRnVGxsdDRSd091cnBoRFYwVjgzNk5HeElMSjVPSVB1ckhoa1JoZmF0?=
 =?utf-8?B?T3RieWxVMEcwZHZ1ejQzcDVQNWw3SE45RFcyYTF4QzlzZzFSa0wzcW1LRkl6?=
 =?utf-8?B?WmIrdVJodEFqNU9wTVpIOFZMTkY3bmZSOEdNSWRJNy9vVnhMKzR5eUJXaklU?=
 =?utf-8?B?amZCN2VVVjlBc2RJWStUVWRWRndDRkZUY3MzY0wxbEQ5TGh1Tmh0K1hvVTRz?=
 =?utf-8?B?NmtsL3pKZ1dqZzJDcFI3T3NwZnhnczYzbkpYbFdaajZZbWxPNkxyQmxpKzFR?=
 =?utf-8?B?bklRSG43bDVielBNWW45Zld3S0RvQ0xEdGZLMVcyZnkranZjMmtnTW9BMFZy?=
 =?utf-8?Q?1gQ8gVMzeR9FYy2h0xiFda+uB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a212f04-4da0-43be-e201-08db25c347e9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 02:08:06.1854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lyrb5RN4FDSpXt/260p/90u+a83Vf3otplZIWOqhe/vYcttCOoS0z5cTURKDxs5XUFJp9vw4pk5N4JObTgLEzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8077
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100; envelope-from=fei2.wu@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/15/2023 2:15 AM, Richard Henderson wrote:
> On 3/14/23 06:47, Wu, Fei wrote:
>> On 3/13/2023 11:00 PM, Richard Henderson wrote:
>>> On 3/13/23 07:13, Wu, Fei2 wrote:
>>>> Hi Richard,
>>>>
>>>> Sorry for disturbing you. I'm doing some perf profiling on
>>>> qemu-riscv64,
>>>> I see 10%+ faster to build stress-ng without the following patch. I
>>>> know
>>>> it's incorrect to just skip this patch, I'm wondering if we can do
>>>> something on intercepting mmap/mprotect (very rare), e.g. even
>>>> invalidating all the TBs, but keep the cross-page block chaining.
>>>
>>> It also affects breakpoints.
>>>
>>> I have no good ideas for how to keep cross-page block chaining without
>>> breaking either of these use cases.  If you come up with a good idea,
>>> please post on qemu-devel for discussion.
>>>
>> Thank you for reply. I am new to qemu/tcg, lots of details and
>> backgrounds need to catch up.
>>
>> If we only want to address user-mode qemu, and assume this cross-page
>> chain, first page -> second page:
>>
>> * breakpoints. If a new bp is added to second page, the chain is hard to
>> maintain, but it looks acceptable to flush all TBs and fall back to
>> current non-cross-page implementation during debugging? I think It's
>> different from the full system situation here:
>>     https://gitlab.com/qemu-project/qemu/-/issues/404
>>
>> * mprotect. If the 2nd page remains 'X' permission after mprotect, the
>> chain is still valid, if it's changed to non-X, then the syscall
>> interceptor will change the permission of corresponding host page to
>> non-X, it will be segfault as expected?
>>
>> * mmap. I cannot figure out the situation. Is there any unit test for
>> this, or could you please shed some light?
> Also munmap, but handled via the same path through page_set_flags, see
> 
>     if (inval_tb) {
>         tb_invalidate_phys_range(start, end);
>     }
> 
> There is no unit test for mmap over an existing code page.
> I believe we do have one for mprotect.
> 
> You could plausibly add a global variable choosing between
> link-all-pages and link-one-page modes; it would be protected by
> mmap_lock.  For link-all-pages mode, the above tb_invalidate_phys_range
> becomes tb_flush.  We probably want to start in link-one-page mode if
> gdbstub is active, which is the only way to set breakpoints in user-only
> mode.
> 
> I expect mprotect/mmap over existing executable pages to be extremely
> rare.  I expect munmap of existing executable pages to be rare-ish, with
> dlclose() being the most common case.  You might wish to change from
> link-all-pages mode to link-one-page mode after one or more instances.
> 
> And as I said, this discussion should happen on qemu-devel.
> 
My fault. I didn't notice the cc list, and initialized another thread:
    https://www.mail-archive.com/qemu-devel@nongnu.org/msg949625.html

Would you prefer commenting there, or I move the content here?

Thanks,
Fei.


> 
> r~


