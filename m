Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5AF700240
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 10:09:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxNp3-0006dP-Sh; Fri, 12 May 2023 04:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pxNoy-0006ct-R6
 for qemu-devel@nongnu.org; Fri, 12 May 2023 04:08:14 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pxNou-0004ya-Sd
 for qemu-devel@nongnu.org; Fri, 12 May 2023 04:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683878888; x=1715414888;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=szD9s7pqTT2AFSaJacBbxnjAjiLiAkWYHs9Ep0RvitE=;
 b=axwVtqS22HF5i4doSyGWdCIoKMILTQgNfy29Lj8woltXu78uLY4597NL
 AirFAdo5XBGQmTZqWnCB0CiwmpNIEIAa4TQF/0TN21nz562Pfym442k+B
 I8j9hpNdsx72yhcJEb29dYRZCoIMM3Spp49SZffDPOU7lAWXVrS/eZIDh
 M/YVixSF5mmndxTuELY/d8BW4F7rC8CZBhdcXw9AB3wHkkA2Ng61ASBMv
 ujCx6Jp5/N3ORgi3yhwUrfRLOwOzQJ8xMCQoB36WA8inDqrWnlBCymIl4
 /us6AydUDjrUht7/2DdGjrwdYcyu7zJfxgbGq9cRG5XG0m4DxjsM4fmQb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="349575635"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="349575635"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 01:08:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="1029975371"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="1029975371"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 12 May 2023 01:08:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 01:08:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 01:08:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 01:08:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXg3u43hPXoUiqxVkm6A/5hmeWmPXlx5SzXMooB+rQsFhOt1O7OBqr6RyCuR324JGA+ZKgnKZHJsryj/tTipiQMuLHJ3EdPdBnKhzGXZlNCzINciq+030knXkOTrx6SGEgwUihlphWdcBre0G2pvaqKvsGY17KGc/qqUGHq2qQfNtGac+JtnHaLAG3Bhb4T6DbPYCtJFGGRuc9sQmyQO8kIQopCRJlGQrsozhFa0RzQ6XzeqeB0nC0gtHDR7c+5LK65zQ9zjyHe9P+3uLaLEStGbbEeEiD9oJlFeg2E587gAxOH2UERxF7utnIu+LWSXKHbqhgLv0P1aMwKa5dvVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsCXlBxWx7ZUSg9T8iNmI5q31eTWYTYqeA4q1Fe7NAk=;
 b=fYBLYu6wH9vvmYsUEgk3+Oly1I/uvyxDi5g8+p+AC7l/iubbUUxJbQi448ZDsE4xXqTAZG7/BtZTC0Bi0pJF8Cxu1r8JVTrG1dgxronGvYzOFOUVK+oU+JOHb5qrrn0BvevSIBWQcEHwq+lXPaPAcZ6rP8WCCkrcAEl9iWlZc9Im70TK1wbsF9AGJeTh/4Bs4X1UQ5bs4X4/29YZkR8+ieeZSi6jlVpoYHQoMdXJ34/yZPooZgU2a8RzGFk10k7CsLO74UFSGdC+K2sIS9htLi9g4lgR8gSnmXaBJIBtuJeAux5Us0XuRs8u4Al+eQvmejuXce0LblMQ3yj8oTSg9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by DS0PR11MB7411.namprd11.prod.outlook.com (2603:10b6:8:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Fri, 12 May
 2023 08:08:02 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::6f32:84de:47b1:3bc2]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::6f32:84de:47b1:3bc2%5]) with mapi id 15.20.6363.033; Fri, 12 May 2023
 08:08:01 +0000
Message-ID: <1b2aae6d-ebce-65a9-0cda-84bf0fcc8b1e@intel.com>
Date: Fri, 12 May 2023 16:07:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 00/14] TCG code quality tracking
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20230421132421.1617479-1-fei2.wu@intel.com>
 <87wn259n4g.fsf@linaro.org>
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <87wn259n4g.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096::23) To
 BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|DS0PR11MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e47a13f-136f-42ee-7fef-08db52c00170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MUZI/gGTW3O6oOgCR2wDO3mVNI+lucTcz4d3rEZYLtnY2IjjIp0NUPMZvyIQfnuUF7BfYNF92i+T8DWMC4COW4UwPs3Pg4sX0T+RfeXgfVPy+CU9AK0t8GSOAbQX577ZeTM1fVWdQH8lknsBIkARtN77ArKHq5thtJrf6KSfg8T25dNQagBUN7TD5PRE05nsK+XKFJtpX0chpUxHjIU1RGjBiu/meTgTdMx5+RF+wMO8fYXVa+w1o36YV4KhXlaJ0UFgxV25yoku3jN8sc+XCp451mg1GpzpAjRdvbMxuCk7Mmwb4t2m+ctbns2KsEFq+3/qnpiyb5E0APBYHjwIroQ+8hHmDcm96y0rc17l3suxcaNJlT/y5ZgZg4zz4E6EeEOxyNFKzdjwsqBZgP1LJNs3jR8Iu4klAcVp8Odk6fnirLSETIxZ5mgyoJfIouy2YMCMOlZmW2Zjhz2731GP8sL7dwNoC3yitDji4VzYrvm6aS/5SFesdXMkQc62N4nt1GqA5SHtU7vMtuXwD/SOeE0gPx6VV9E+K4gePBWfU72YxVyG41K/K0iu61lR3RiL2jzBSFfLJt+kk+atqAkPCPRvK8OtbaRML4lRmd1QDguv+8tIuwH0FaCsSbHNQfZ7bTUho4N+owG45lg/eKuAlxDPa7JG2egi+jAbNUpU358xGmCpIbNo6g7+KlxxA1HR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(31686004)(6486002)(31696002)(41300700001)(316002)(6666004)(36756003)(478600001)(86362001)(66946007)(66556008)(4326008)(6916009)(66476007)(38100700002)(26005)(6512007)(83380400001)(2616005)(186003)(966005)(53546011)(82960400001)(5660300002)(8676002)(8936002)(66574015)(6506007)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1JCRVdYeDhNMzJoUnNmMXJBb1RZbnd3WEJNYzUxVURhVUl5OFVraDV0N3BQ?=
 =?utf-8?B?Lyt2V0UyMm5aWXhOMFA5WmdZUGJDNVc2RUdxcmt1REVYM21xNG1wSEdCRXJo?=
 =?utf-8?B?VWp1bE1QTUF2OHh2SHVFelMyQ1ZzNFZFc3ovVmdSOWNpREpnMHh6ODRuWSsx?=
 =?utf-8?B?aUsyTU1xSEF1OWQ2RTB3SzBpK0l5b2JEWTl5MnNFV1A0dUlINGFIWTNWbGdZ?=
 =?utf-8?B?K2xlR21zNVQxbUFORWNMZnU1MTZ2cGNObGkzRTFOUmhuSW1SRGZqNHhlWFFX?=
 =?utf-8?B?NngyU2ZPUEN2WHdZOTQrMGtPZStlSmhyZjEzcFpLZXAzSTIyT3lmaHIvZjlD?=
 =?utf-8?B?VWVIdWJWZFBDcDl0aVIraWZZZ2pOMmhXMlJ2ZXVuWWR6NWZaSFJadnBaalRN?=
 =?utf-8?B?cXJvUzJkSHBmek5vZ2pmOEpFZjRVSGJFc1RPZ3MyazIzbkdwUk9TYnB0NTBu?=
 =?utf-8?B?Z29zSTFNUXRjWXpwK1NmUjBYeHJDbVRCMFBGbUNTZWhZUFl4Qmw4Nm1WNUdK?=
 =?utf-8?B?YkpZV3VjTmVrVjdacWZJdGQ1TUROTU1zb2swM2txMDRaa2FFbDBUWVFlMHRn?=
 =?utf-8?B?dUVBOEl1Vkp0T1kzTnVqMDh0S0pJMk1hb3ZvRnhjRVhyWGhnZURQekdydDhQ?=
 =?utf-8?B?Y2E0Ni9VUjdSYUdrdXpKQm5kakhsRFFtN3QzWW5VR2w3MmZ2aUtYV3lPMmxa?=
 =?utf-8?B?a0F3L3ZMNWVCN2NpZGFRYzFzVWl4NkpKbnRPM2Y0Y2NjekJRV2dNTjBaV1ov?=
 =?utf-8?B?UitybnIrS3FKVFlLRlZYTlBVdlJrYjgyckNsL09LTXNMRmZiTlYwb05HcUVN?=
 =?utf-8?B?SHFxQTdNOEJzaWxsNjBFWUdmQ3k2bGZ1Z2ZuRnprdzIzS0lnSlBHZ2xzR3Bj?=
 =?utf-8?B?YitqSVBGT1BubWYzMGNoeEQwSFduR2FMQmFmdWNoRWNqTHpzd1hYdEkxT3lq?=
 =?utf-8?B?N1NNYloyQm5DeWVxemxNQ2M5TmdQVUlnbXNadjZKeHRubEFBaExqSDRTbWFE?=
 =?utf-8?B?YjVhcTlKczBoMk1BZTYyc1M0NXhnMDdiZHJ1cys5cUNsTHh5RityU0t3UGll?=
 =?utf-8?B?OFRvM0hoRU1LbHpkUVhHUWxocXZDK0xETkJJOEd4a2hJYXRibFMzUk5jWWFR?=
 =?utf-8?B?a0k3THhWelU4eC85OXdHREtkOHpHc3EwMzg2Rm90Rnh4amdFbk5HMWE4M2pS?=
 =?utf-8?B?WndyQkNVYVBxeUhYcENKNGZybTZVeHdENGhUdTdWdmVCU25SbmM3QUZ0NlNI?=
 =?utf-8?B?N1JBVjBsdTY2ZUpZb05RdEY0cmRFckdwb2IvTS9hSWxvc2xmazhpVStXazdq?=
 =?utf-8?B?L1N4MHZsVUU5SlZxOTFiaHl0WTFMYnRLS3NJb1djeHB1N1N6N3E4aVFpc0Uv?=
 =?utf-8?B?WDRJblVLdER3d2IwOEppWk1sVm84b1I0SDk5TFBabm1VQ1hVYURYTEJBWnd0?=
 =?utf-8?B?czlUeFZzQjg4RVUxTGRQUG9iQkxGSUkyT2FuOS8wQzQ1b2xvd1lnRkRsNitt?=
 =?utf-8?B?VUp4UitrTThrb1pBT1R1RDlmUjQyS3l4MmpmdDNVUlVObEIzWmYxTkVncFZO?=
 =?utf-8?B?RDJJdlFTSFZTcWgxT0xpMFJybGxoUEVlOW55Y0hlQ0JCMDgyM0VDcU1JOHh6?=
 =?utf-8?B?NEhONnloektkbm9FWWkvejBIWDM1ekdQeUV1Q0pXTUk0cmZtUVU5WHluVG95?=
 =?utf-8?B?eXFDd3hkcFVsYWlCcWN6ek1rN25HcHliZng1aDhVVjFwQmFiaUU4OHF6WXBE?=
 =?utf-8?B?eWgwMHE4UkV2S0xwRFpXUEtYSWk1bDBVWk02UmRzYk5BWlNHdjVoaE8xVlBH?=
 =?utf-8?B?dVZnem9BTExKQzU3OGw3Q3JzM0w0bWNkQkZnMnRyYXVVYmw5MTR3VDR3RTBD?=
 =?utf-8?B?TzEyaWgzYVhuNFlTTVAvNWl3eHRXYUpEVkRRSEN6bnh0bmJJMmlORlRuMUJG?=
 =?utf-8?B?M2FFYldIMlFoNWowV3daa2pzOW1EbllXZDM3WmdoNmFicDlGR2FhdGlnU3Iv?=
 =?utf-8?B?QWxCWWY5b3JodzFNcFR3SDdBTnU2V0wyRGpWQ0hJb2UvV0lzeVl2eDljMzZm?=
 =?utf-8?B?ejBoVGticUwxYW1yNlFFbHB6bVhHNzROM0J0OVoyTFhuZkRXeWlQNDFzUGRp?=
 =?utf-8?Q?tk8eSS2KteN2Esp7mAkWczsOc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e47a13f-136f-42ee-7fef-08db52c00170
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 08:08:01.8148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFNvhBQGesqJHyF7+uQyxgTs6jG6Y4v+SH/4UDTpTM4X79ldHLtTPCEmxzKmEXbN2o84oGYpiU0aAEkllEOFTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7411
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=fei2.wu@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.124, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/22/2023 12:42 AM, Alex Bennée wrote:
> 
> Fei Wu <fei2.wu@intel.com> writes:
> 
>> This patch series were done by Vanderson and Alex originally in 2019, I
>> (Fei Wu) rebased them on latest upstream from:
>>     https://github.com/stsquad/qemu/tree/tcg/tbstats-and-perf-v10
>> and send out this review per Alex's request, I will continue to address
>> any future review comments here. As it's been a very long time and there
>> are lots of conflicts during rebase, it's my fault if I introduce any
>> problems during the process.
> 
> Hi Fei,
> 
> Thanks for picking this up. I can confirm that this applies cleanly to
> master and I have kicked the tyres and things still seem to work. I'm
> not sure if I can provide much review on code I wrote but a few things
> to point out:
> 
Hi Alex,

There are several new files added, should I put your name as their
maintainer? Also, should I signed-off these patches or not, definitely
the original signed-offs will be kept.

Thanks,
Fei.

>   - there are a number of CI failures, mainly qatomic on 32 bit guests
>     see https://gitlab.com/stsquad/qemu/-/pipelines/844857279/failures
>     maybe we just disable time accounting for 32 bit hosts?
> 
>   - we need a proper solution to the invalidation of TBs so we can
>     exclude them from lists (or at least not do the attempt
>     translation/fail dance). Alternatively we could page out a copy of
>     the TB data to a disk file when we hit a certain hotness? How would
>     this interact with the jitperf support already?
> 
>   - we should add some documentation to the manual so users don't have
>     to figure it all out by trail and error at the HMP command line.
> 
>   - there may be some exit cases missed because I saw some weird TB's
>     with very long IR generation times.
> 
>     TB id:5 | phys:0xb5f21d00 virt:0xffffcf2f17721d00 flags:0x00000051 1 inv/2
>             | exec:1889055/0 guest inst cov:1.05%
>             | trans:2 ints: g:4 op:32 op_opt:26 spills:0
>             | h/g (host bytes / guest insts): 56.000000
>             | time to gen at 2.4GHz => code:6723.33(ns) IR:2378539.17(ns)
> 
>   - code motion in 9/14 should be folded into the first patch
> 
> Even if we can't find a solution for safely dumping TBs I think the
> series without "tb-list" is still an improvement for getting rid of the
> --enable-profiler and making info JIT useful by default.
> 
> Richard,
> 
> What do you think?
> 


