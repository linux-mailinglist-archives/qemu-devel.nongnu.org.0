Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1CB6C9D1C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 10:04:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pghpw-0005AQ-4q; Mon, 27 Mar 2023 04:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1pghps-0005A8-Vw
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 04:04:13 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1pghpq-0001VQ-NQ
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 04:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679904250; x=1711440250;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5ti00PTzGi/RRWpEO3gW4C9hsJHC5bYzyckqIasmvWs=;
 b=eUZCc0d8N7YaYcOCqVNYwsC3nTtLqPahVk+uLYqGSLu1/S9P5zGG+8ul
 DXaSW2bpijGo4vluAPJG1Yk48rKEYEGmgEvUeC4hLZAp21e1hXkjjWnaX
 dymcOEEDBPKjlbiayORL8VQxhrGbkYbFFFAtjonAUWR9urHcU9cxLbKWv
 oRIOUWnlqJ6G3q/rFQ8hG+zzx8ieoP6/YX14oTsOg0ZDJSTb/9gLIyLTk
 B6pRpQccp2SIvmopssUXZ3ZcXmDaD90DHALPz12VQGd+FNu8evI2qCkrM
 f0p1Piru2Bw0dbgLYQr/xe3JualbQq5oSYB2v8GkmRO7WDTKFWPfIEYwq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="338925926"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="338925926"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 01:04:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="752601840"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="752601840"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 27 Mar 2023 01:04:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 01:04:05 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 01:04:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 01:04:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 01:04:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvPBrRtDZmf8oV/XnSWQo9kCDt0ioptuzThzkVmP2iLBl5xCjK7rG7hrqNsf3iLASXe3HiW+h88M0EavvrL6U+xiWI/I483v8WMojeZN9vmCQmKL7knw4yUSvlzN1TJFOtUl/5xXYiy+uaE5eIUJce65iHcX66Rg/pnxjCjibmjzMxl4uevmWw7kwv1N+jVvGi6wWqPAH4nS9YUT8KWB0sQtrFFc73ZBtD93DHqbv5Vu+IUCxvDv5YzQpCPaj11zzIN3FfKe3/iZKFB8XbXpv08J8itC176DJcwa+BrCrkxJJMwD7GnXNGyZ8IejndEsUsVroPavxmg2zn/zVS6F5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZ6Hgl7/aCd13ipJJJezrEhO19GLzu8TBgVgLndRuQI=;
 b=LPj0BJ2mVrQOZW6p07vUTxQ1W5xCz1QClVgieI4El7Pwuf8bKa+Sm73CCXlLoQSBZQvu5tTOVNjXhHZA37sm+fipR0hAFaXAruRf1U8Q9+48lgUTZkMVOk3T8JiWGReVkFLSLacTxyA4G0WWw0GFSOcY1xADMYwhJ6dHnI9cqH5CMWAvrgCCCLWIPlLc/tIHzXBMFQnY4d2JXFmj5E1lb8KQVFZGMUJMHAyYeRvTzBVkteL0iml1zA5ROdLvdZd+Fw+urGZ+HETDUWgNUejk+aVzAyZWU43+xj9PrHcW4K1hTmyz2pP4B1hqVVATYAoEa/MUAV7PqoovhJR2PMTsTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4965.namprd11.prod.outlook.com (2603:10b6:510:34::7)
 by PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 08:04:03 +0000
Received: from PH0PR11MB4965.namprd11.prod.outlook.com
 ([fe80::47e1:d7b9:aab:dada]) by PH0PR11MB4965.namprd11.prod.outlook.com
 ([fe80::47e1:d7b9:aab:dada%5]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 08:04:03 +0000
Message-ID: <3df48e2b-f417-21dc-d386-95399c3e694e@intel.com>
Date: Mon, 27 Mar 2023 16:03:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RESEND PATCH v2] target/i386: Switch back XFRM value
Content-Language: en-US
To: Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
CC: "Zhong, Yang" <yang.zhong@intel.com>, "yang.zhong@linux.intel.com"
 <yang.zhong@linux.intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20221026115745.528314-1-yang.zhong@intel.com>
 <253335ef-5e63-0182-f92b-a576b2459cff@intel.com>
 <CAATJJ0JLFA3b=KYP-OKXzritJGY1GuuRh+E4D6XZ3RLa6zKn_g@mail.gmail.com>
From: "Yang, Weijiang" <weijiang.yang@intel.com>
In-Reply-To: <CAATJJ0JLFA3b=KYP-OKXzritJGY1GuuRh+E4D6XZ3RLa6zKn_g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0049.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::18)
 To PH0PR11MB4965.namprd11.prod.outlook.com
 (2603:10b6:510:34::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4965:EE_|PH0PR11MB5014:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a39513e-5c69-469a-b145-08db2e99d469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ts3FTQGhiu8ikielLqJimgjMDI2o628owo2vlBXB+4yYdQGE4zzAV6/i+dThOuz2WA4RyCR8cj4uWZUQfk5VrDTxjmCet+QVqVRr1hRmk/uMj1DMaMDnhGzRXKqNFGVNXC3/MISh/jFeukZcF/+niecCYYX4YpE8zUFiRLXAJylTIdl3DMpnRG7w8lytrW+i4VN/3RTjy14pccyVBeHNfhtVYfS/3HduYUY0lzUhTuW3znOeMI7zcD4Ayw8CD8Fseel+UXFNVHtovWmvddQzZNnBB2UCK2R8d7ttyfmwBEVEO3SMibJHEHXVIEv6E4u60A+NRsNctXIFiBUAgp8c96kdlr5swAdKWw3uKisWPTBx6pEG3AXtZVvog3EY3ak+SZj1hygouHc57etXsWspt72ri6x6KHVGGCO6q4JZD2i7/cesIMuAr/Vht3bd+yrEQ5/x5Blgd5fMimD0/zggIkBwgc5dTl2K6QOEVAb+f3wGMNMip/1J9RE90qEYUIeFYvoQCWuK5MTKZdsTtCmWGI0HnSD8OeiErjz7fogXiphuR4k4BKeRVRBx/9CIWlaCpRpDghFhC/d5sXzkY19OtDIMDNTTMrv2U80bQ8tYnjXNrW/IqFYzgmFKFFxuTfYFGWaU4JRcPB9p5JZdn2sW4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4965.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(110136005)(316002)(54906003)(478600001)(5660300002)(8936002)(82960400001)(36756003)(31696002)(86362001)(38100700002)(2906002)(4326008)(66556008)(66476007)(8676002)(66946007)(41300700001)(6666004)(186003)(6512007)(6506007)(26005)(53546011)(2616005)(83380400001)(31686004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEVuVXQ2NlJjdTI5cmFlMll6Z0ovWVh1VlZoVEN3VW1sUU9vRVFTMW1ZZnAr?=
 =?utf-8?B?M0RVa1I5Nk4rS2k1R0Q1VDcrakMydUhXSWNGZHNZL0lVTmdTdkRxQWw5Uy9Q?=
 =?utf-8?B?SG1zZnNGMXdtQXZYNy9mWXY5WEM5eDFwcUpYQnlJS1hCbEdBVG5ya1A5N1h6?=
 =?utf-8?B?Y1pkOWpxaXp4LzBSTFRWbm5DdWlwN0l1WjlLKzJ6ZGJaaTcwVU9DdktRcVZW?=
 =?utf-8?B?QmNaVS91SktqMVpsdjhkbHZMZS9GNXpUYlNJaG1wZ3hVQnhpcVltbm0rUnNX?=
 =?utf-8?B?ZzNwMHJ0a3ZZYUtJaDZkMHJ4cXJOU25YQ0ErNzZLV2JKb2RoQzdSTXVlalNj?=
 =?utf-8?B?UC9tcTJWSU1sTTIwKzc1Mzkrcll1OWgzZmFVUXhJaG5henYzKytQTzhuZEhz?=
 =?utf-8?B?NEcwSUtacU5xRmdnZUEzSWpLNC83dG1XVCtmNTlyV1lPZjlCYTNWVWFKb3RW?=
 =?utf-8?B?ZGx3emRaTHIzS252d21vdlc4WDlSMnBVWXNrMXpzSGIyenRxUWM4WXdEODlH?=
 =?utf-8?B?TFdETXJtLzhyeDlncU5TY1NlamRBQ2RBb0k2b3ZHTkFreEpWYUFpWHRCVVU2?=
 =?utf-8?B?anBGY1o3ZU1kOGp5bWNkZ0JCMUZXTVI0dTNqTnI2SzVGSThDeEFiamU3blpk?=
 =?utf-8?B?cWJ2c3haNjQzT2xud052ZDZxcDdxSUN4QzBCd2c5UUJFU2xab0o3bnhmWDdk?=
 =?utf-8?B?cU05c3dIRStoa0VWcUVIaStKWmlHcUpoeUpwajVMRTMwb2h1d0d5SVNTOFpV?=
 =?utf-8?B?TU5TRHgxTDFDQ0libTZRTUJrZjdRdzBjTkZNZUplZVRid2NIRTFJKzFFYVli?=
 =?utf-8?B?cmpWbzFCNGwwNVl2RjFFQmw5aGtkMStxT21VL2VnNjhObm1GR05ncndkQXF3?=
 =?utf-8?B?UGF0Vk9vTHhqYmlFcVM1NVZzc1JrV0xZNmRBY1B1Ukl0WlpCTEVUYjQySlBI?=
 =?utf-8?B?WExZOFAxREo3bGszaGpvbDdJTG1RSDNEclg0VnNQNWIvcTJybjhURzQvVjJx?=
 =?utf-8?B?N1lqbVZyK2VGcTIwS3NzcEhrTHBZK0RjRDk5UDR2czdmbzh6NHY2WEszaEpJ?=
 =?utf-8?B?WHNGOHhZMFlCeEp2NEpuY3QzSTVORHVFQTA4eEgzMWFFOWpiL3h5Wm1lSjBy?=
 =?utf-8?B?R3RVMEZUVEZhYWNTdEc5SlVOY1ZpZ0dBcDBXQ0xjb1NBV2JFenpIeUM4aVFX?=
 =?utf-8?B?NEM4d1Y4RElHeUpXYU55b3dJT3psZWd2VVVNWjRCQ09aWVc4S3lxeFpwQ3l1?=
 =?utf-8?B?ak5SeFh1QmJCNy9PNHN5U2RZck9jeHU5aGMrSCtNTm4rS0ZOWU4zb2M2ZU1R?=
 =?utf-8?B?TTJ5UGt3WWNsK1JmMGdpUDFvcGxrRHJMWk9OV09WZ3RIYVowQjhyVmc4K2Vp?=
 =?utf-8?B?RlNyOWlGcm0wUFVhTEt2WHQ3VmMyVDFBV1QwQnlYcm05Wm1aNjRZaHk2alkr?=
 =?utf-8?B?eFA3SlppRFJ0c3FVbEtyMDV1bTdTUFhYSGdQTml2WjNkUlFNZDRnTjVVbytZ?=
 =?utf-8?B?WWxhMjFMOGIySmpqTURIZlJWT0RLdVZEeWlsSS9acVYySTlKNzFLMnZOU3dy?=
 =?utf-8?B?WWhSbk9ZTDJwWmptUWdHWGFEZlltdTdONUZTM0tVU2gwcW9uY3RGaEVSUXBK?=
 =?utf-8?B?THJ3NXYrN296YlB3TGtOcWVYZi85UmJ0M0ZIdS9WUXdkUHIrdlppKzc3cXNY?=
 =?utf-8?B?RWRBS0Ric0lZS09ZcldUL2syZkhRU3JWVDF3QWY1V0NWeHcvVFZkTWtyN2RH?=
 =?utf-8?B?UnU5MzNaaDRnMlRwSkZlN0VOWGNpbnlaSFpZYWlPNnVCK1lFdDU2ZTZyQm1w?=
 =?utf-8?B?U3RwbGR1M05HdmRSdVZjRS93SFA3cHVOZGlxeEVTNTl2blBCRUl2dHF5Vlgr?=
 =?utf-8?B?Mk03ajhETUNCRGpEbk5ieThyR2pBWmFtaG94dWIvTy9BQ2MybWpCTlFweEVB?=
 =?utf-8?B?cmF5eXBrZDlaL3BwdlR6SFpQVm9tUDN2VnYyVm51YjVuYjgxeHNYdnExc3Nv?=
 =?utf-8?B?dFkzYlFFSXhKbWwwb1FZaEN5SDFiT0xZS2NkVjhIWmVEd0kyNEJYTUtMZXdE?=
 =?utf-8?B?WmkxQ0hRUjJQMDZTS3kwTnZZMUxzaHZzRVk1SWRhNGp3MkR0K0N1REM4QnJv?=
 =?utf-8?B?WVdDOU8yc0VMSGJWSjBYVmpFanRpSHFJMVFlQ3JzRHdNeXd4S3NiRVJNZkxR?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a39513e-5c69-469a-b145-08db2e99d469
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4965.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 08:04:03.4453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5odegDgxxRDEOESbOr1unmF4IWTfdP0Tv11B0yzaOxGFHwpFDpvJbA9iQFmkpInp3KIMTd2yMhfokdrWqL45sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5014
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=weijiang.yang@intel.com; helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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


On 3/27/2023 3:33 PM, Christian Ehrhardt wrote:
> On Thu, Oct 27, 2022 at 2:36 AM Yang, Weijiang <weijiang.yang@intel.com> wrote:
>>
>> On 10/26/2022 7:57 PM, Zhong, Yang wrote:
>>> The previous patch wrongly replaced FEAT_XSAVE_XCR0_{LO|HI} with
>>> FEAT_XSAVE_XSS_{LO|HI} in CPUID(EAX=12,ECX=1):{ECX,EDX}, which made
>>> SGX enclave only supported SSE and x87 feature(xfrm=0x3).
>>>
>>> Fixes: 301e90675c3f ("target/i386: Enable support for XSAVES based features")
>>>
>>> Signed-off-by: Yang Zhong <yang.zhong@linux.intel.com>
>>> ---
>>>    target/i386/cpu.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>>> index ad623d91e4..19aaed877b 100644
>>> --- a/target/i386/cpu.c
>>> +++ b/target/i386/cpu.c
>>> @@ -5584,8 +5584,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>>>            } else {
>>>                *eax &= env->features[FEAT_SGX_12_1_EAX];
>>>                *ebx &= 0; /* ebx reserve */
>>> -            *ecx &= env->features[FEAT_XSAVE_XSS_LO];
>>> -            *edx &= env->features[FEAT_XSAVE_XSS_HI];
>>> +            *ecx &= env->features[FEAT_XSAVE_XCR0_LO];
>>> +            *edx &= env->features[FEAT_XSAVE_XCR0_HI];
>> Oops, that's my fault to replace with wrong definitions, thanks for the fix!
>>
>> Reviewed-by:  Yang Weijiang <weijiang.yang@intel.com>
> Hi,
> I do not have any background on this but stumbled over this and wondered,
> is there any particular reason why this wasn't applied yet?
>
> It seemed to fix a former mistake, was acked and then ... silence

Chris, thanks for the catch!

I double checked this patch isn't in the latest 8.0.0-rc1 tree.


Hi, Paolo,

Could you help merge this fixup patch? Thanks!

>
>>>                /* FP and SSE are always allowed regardless of XSAVE/XCR0. */
>>>                *ecx |= XSTATE_FP_MASK | XSTATE_SSE_MASK;
>

