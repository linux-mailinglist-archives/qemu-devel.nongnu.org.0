Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EBD6DC706
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 15:05:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plrBa-0003zi-PW; Mon, 10 Apr 2023 09:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1plrB0-0003zR-JK
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 09:03:18 -0400
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1plrAx-0000hq-W6
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 09:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681131795; x=1712667795;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cBrJ/lq5PgmEY9eT3PAcrp200Bz19Pu13ullpY5zSrM=;
 b=Wr4S7DIsRJ168S4+dlhaPFinh3mUXKdSw+Z2k7tRorf3XQW4cXcqC3R4
 9kJTipoukvMnc5qT7GwV2k63XgN2xbBZneLZR1UIBzZm47GC83FtzxIhe
 btrsMo5t97ESs9PpfLzYVrUc1hAZfVX7LnzBXXwP8TPlTuyC4ovCn1u3E
 +zqUakMXn9XOATf74SV64X3NEoWAOnFc9funAEHNf281EUx97Yt+LufMq
 sBQ/KG4FHilqriMAM/thuqU6mu+cqodgzR1HRM94SF3VQteEvpdNjXUks
 cIStFrggW8Z8kTbR0j9fgHFkiGiKuwmbLUVrrwT8TrVNFdj4jF33zXT8S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="322980677"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="322980677"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 06:03:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="688264978"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="688264978"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 10 Apr 2023 06:03:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 06:03:07 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 06:03:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 06:03:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 06:03:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fmk9afaMK5j50Y4LgXbSmyiYA/CcT4DWkO78ZU2uZgjFN2h/TH+q0nwNqR3MLF0nTTL3lx2ICljMt3Nr5x4DIArZPRO/84Xss4QbMFZWVQ+CpJj8OtxVCwRylc3DxKKEbQzkcbGuBY1OJ+OjUUiNCddPcvnx5yk31l+ZpJLvlqFSIQb4gpe2UnmVAjEcfFfcuicm26sYKidXmvOdE53kml38FpuLQR5CL19acj1yCHT9DnrFpF4yJnmh0H8OiJcFKlpiMxEb31TGVySYsQYo4Vgarzn8NKlri3MDN/ylTWWw5pNKy2RvyA36MBj0tGfLo9mTBaZqgBhtIu7KqnIXCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mfu9ayGu9v1pI/kcZoMUMdhczJztDBYxSRlVuUnnNSM=;
 b=B4qBnoBEygJMA1MQDbZ/UHYR/FPYqqwEODTRzHPoDcJGcAJ77oXwg2x6rYm2FpSvSvap6XO5DhEKAYuhgcwpHBlvLUGQxTasqIENFA7r0W9HxE1JoiS/TO7XT5uaB3AUQ0/l7ZNgvzlUjrH0bj9kTqfxdXPD+s6vSsR+1tuD36vp2nXzgCH89gSi/NTdXfdGC9gjdsce33K514KX88GQpFE37PWjTe3CA4jf+qWD2YjWOYqE1CvFFLSjnampSu085HCesbA5gkQcZPS/ouqwDO9VRkpbL43SGYgh5NSEdPTR0YPMT6b2UWJiGDA06czlraC6XA9KXaR7FTtTizpQfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by MN0PR11MB6009.namprd11.prod.outlook.com (2603:10b6:208:370::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Mon, 10 Apr
 2023 13:03:02 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f%6]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 13:03:02 +0000
Message-ID: <0f237ccb-dcbe-87c7-d9f2-653962d30520@intel.com>
Date: Mon, 10 Apr 2023 21:02:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] accel/tcg/plugin: export host insn size
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
CC: <pbonzini@redhat.com>, <erdnaxe@crans.org>, <ma.mandourr@gmail.com>,
 <qemu-devel@nongnu.org>
References: <20230406022751.757980-1-fei2.wu@intel.com>
 <20230406022751.757980-2-fei2.wu@intel.com> <87v8i9jviv.fsf@linaro.org>
 <ce65c074-ff12-1f29-ee64-44fb7ff643c7@linaro.org> <87ttxoc8wq.fsf@linaro.org>
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <87ttxoc8wq.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:54::19) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|MN0PR11MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5a25b1-44af-4e85-991d-08db39c3eabf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D1E7HUvy00HpyQfUtgk9Ptlz+CQuR3qxwUrfpzvr2pA4lPUYQM+HdGPhGH6a7EmOrOHNfn+F/5z/nyTI9cjyjBL/vziQteJ7jPUpaOna+pcvUxeO2zYJZZzVMIh89QYRJJScy4j16HsM9UtpYIydfarjDQDfU+SiYq4x9xuX6xYY6FHr6CNpPwNuzOqK2X3OGleaCosdELjFgB0jQDJVKugW+r+piAFVUsbBbwfK9KkvnF/S3ZH6LU/0VVIawRYKEMevE03cZsTvNEnDHX6aJ9jJ+o3ltimABQ31vlTqM7tTQGACoM+HuuAZRCZmRdyXQtwU78NkUWTHp4SpmxukGdGwoJfM3AjAjsfJ8JJwvnVKq3G5+cg5g6/Bi8V/hxguzTm+sFFc8oyihdLEgklv2mq29oIBFnILhTv4kZFKSMMoIoRlmXn4ock4gBjVm5Dk5fFQ3x3j6kI+aBlRZXZ6I26IGu3TVPLVSQfywp4908QlNEAtenZKnKgHMO3M1C3uA1aQ80NZ2tyuImfgfCa4eCmuiVP4ycPUMIXKgEFuvy+SqTAewmk16t0Hk/ZoTjglPkLIO8PvNxVVji+nmqqalde/j8g1aDcHJZ6FO0hR+gR1Nz7ieDdv3HRWRgSQ6A8fjQrL7/lN9hYvmsWbNMlO5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(66476007)(66946007)(66556008)(4326008)(478600001)(110136005)(316002)(5660300002)(41300700001)(82960400001)(8936002)(38100700002)(8676002)(53546011)(66574015)(186003)(83380400001)(2616005)(6486002)(6666004)(6512007)(6506007)(26005)(966005)(31696002)(86362001)(36756003)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0M4bHNxVHc1V3pxMVpwdXBqQ1hSbFZlY2pMa1lUODd1V3pEM0MwL09HclRU?=
 =?utf-8?B?NU5XWFc5cXFuaEQxWkFwMEIreWl5YlYxQTZnK2hjYVlJZGNBSkFtbjV1aE1I?=
 =?utf-8?B?ZVRGMkhkcy8vZTMzNHlKSE8rb0s3YVFBV1ZidWZWekZha24xZmxZVGNTMVpO?=
 =?utf-8?B?dWhDQTRVS3JzMllLMVJIUkIzc2NmME1OZGlTSG9sWjBtSW1YTVhtdkNqMGxI?=
 =?utf-8?B?djhhK25KVUh1ZHlrN0tZSEdMTEZoaTg0MVF1TmpQQUdmUEw5T2ZLOXZVb0hS?=
 =?utf-8?B?NGpNYiszcEdIT2p4U2ZTQ1NmZ0pURmNja1FuWDl3VG1ZZGVLdTdIMDI0MHY5?=
 =?utf-8?B?bU9WSE1kakFrNzV4UzhaU2NuMi9FaFFRVWpKTjYxUkw2R1RBU01OYUxUWW4v?=
 =?utf-8?B?RDljaGd0V2JFNlFXTkRpalRDeWFrVUVWZEh6UG5uTDZwMm4yL0ZMVEl0YUw0?=
 =?utf-8?B?MGJKYStqNVAxL0dZS1AwZkNmS2l1WXhJalVnYmVKZXFSOU12TU9hNFArWWlW?=
 =?utf-8?B?K0NuTXZmRHRNQnkzU2drWnVqbEtDWm52V0tSbklRajhDRVJORmRKQ2E4K0V0?=
 =?utf-8?B?ejN6TlFncnlHK3orM3JBWDdGRkdFejlRb1ZacWdBWUNNWlMvNmQ3bFR6UE1H?=
 =?utf-8?B?WDg4TUVxbytoR3VKbGxQK1Z4U2RYdTU4WUFKUjk0cUVyQzlZN1dOZTlXUnNJ?=
 =?utf-8?B?WG9obm9wV0ErZE5oUUtLNHJPRXFKOWRJY0F0Z2R4K2I4aVhudHN2N0lTTjFO?=
 =?utf-8?B?SWRhR2xiR2Jvenlkb1lCWXlTSXZabTNzd3hxa1pySnh2T3A4c3VUaGZPekxo?=
 =?utf-8?B?d1hTelZaWkZxWW5DNkJFdlMyTXFEbjZjS0NJQ21RVGNxcVN1RG9zZVluWDJv?=
 =?utf-8?B?bHdZYWI4ZEpFWW1KNFZpQ0FXVjc4YnhGejhGOHkyVDZ2cG9uVWxCQkRXS1NG?=
 =?utf-8?B?NEx2Q2JSQUUranpjSkZpVno2bi82T0RNUVB0NFFJVk1hWlVFTngyU01waWEy?=
 =?utf-8?B?c3hyV1oyVEVya2RjRUFDSUVzQ3lsNE5KNkVPbkkxcDVCV05BdVd4UTg1OHdR?=
 =?utf-8?B?THdiVHhGem9CbjA4OG0vZTk5Ly9XLzZSQnlONEI3bHhRYXRlaHMzSjVsSE5Z?=
 =?utf-8?B?eEpwd2ZnWGx1bkZFTkx2bzlQcGI1NnpJY3hkTzB1a1VQc3ZQMDlMMzZtVnY1?=
 =?utf-8?B?clJiZTNJSldzSnJPRTVYWTVYYVNlV0RydmZMUVg3MHdwQ0szVDhUblovdVVs?=
 =?utf-8?B?SjdxRStIWU54c1pxTjJoL0tHUUpmMHhaS0FvRnRsTk52RUpwa3B6V0FjK3pz?=
 =?utf-8?B?Q3EwYU92bVdlckRKMGthT3hSOXRkUDUzZWtLNUpRWElWZ1lVcWlLN2pzY1FX?=
 =?utf-8?B?L1U3U0FockF6OFlUK2JPdUo4Y3F5d0UrbFVxYy83OG0wVzMzZWpHT21SUjdW?=
 =?utf-8?B?Y2ttV1FYRXEzaFBUaVZJQW5PekRydXd0MjhnYi9VMjlrQUo0bTcyQjFveDVa?=
 =?utf-8?B?QlVLcDVqbUVoNG9xeWpITTN6UnYwYVBoajlTMEdOeDhZZDFqNGFjbzBhMHBU?=
 =?utf-8?B?YUVOOFNMQ0MwTXJ2bUo4bk5HWWRrYXEvbHF0TTFNb3NDZnp2NTNGUmt3RElo?=
 =?utf-8?B?V0FCdFlrN0U0RnN6TEZrVHVQcEFYOE1jMnZvNk8ydjNwa3RuOFhxbXBpV29h?=
 =?utf-8?B?dG4ycFZNSUJrbXpLcUdCUFhOa3V6T1F5cmRqa2JHMVBhTWw3MDBubDdCT3Qr?=
 =?utf-8?B?djF0TnpsQzM2RjZraTVld1JqSUw4bEtFbk1rRVNPNlBMc0FqT1pMbWYvTDFF?=
 =?utf-8?B?c2tFeWVtdjVHdm16bWJxNmVVY0V3SVBmUEpZaWxYakpjdVRzL3o5b2Qvam16?=
 =?utf-8?B?RnpoOUltcCs4aHkwLytaajVFczc1YXViNVFlZHJjdFdnVzRwclpzRWs4ODFv?=
 =?utf-8?B?RTV5YVNjYWgwcEVqOGdGbnVrN05uSmMvdUtNWmlRY0RYcXZHRmlyY1cwTGNN?=
 =?utf-8?B?K1lhbDJQTVJ3bkhxMlV6Y2dCRG5TdnQyS0RRbkpmU214anlmOEo0M3JlT25i?=
 =?utf-8?B?TnBxYVViWUlPMkFaalIrSnBsL0VWNUVlUjE3ZE9kaFV6YkpMRUxOYlZLSlBs?=
 =?utf-8?Q?/hYlbnYs7MbTJM8OAnfGqCCZM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5a25b1-44af-4e85-991d-08db39c3eabf
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 13:03:02.6376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kei6KinyAvQS4xv5uh6a52SG4aBzbLL67TTpSO2C++Cd3DVCxY6ad7j/rJrOIJEku4vJ4/sG/G/EVkGoa4+hWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6009
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=fei2.wu@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.246, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

On 4/10/2023 6:36 PM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 4/6/23 00:46, Alex Bennée wrote:
>>> If your aim is to examine JIT efficiency what is wrong with the current
>>> "info jit" that you can access via the HMP? Also I'm wondering if its
>>> time to remove the #ifdefs from CONFIG_PROFILER because I doubt the
>>> extra data it collects is that expensive.
>>> Richard, what do you think?
>>
>> What is it that you want from CONFIG_PROFILER that you can't get from perf?
>> I've been tempted to remove CONFIG_PROFILER entirely.
> 
> I think perf is pretty good at getting the hot paths in the translator
> and pretty much all of the timer related stuff in CONFIG_PROFILER could
> be dropped. However some of the additional information about TCG ops
> usage and distribution is useful. That said last time I had a tilt at
> this on the back of a GSoC project:
> 
>   Subject: [PATCH  v9 00/13] TCG code quality tracking and perf integration
>   Date: Mon,  7 Oct 2019 16:28:26 +0100
>   Message-Id: <20191007152839.30804-1-alex.bennee@linaro.org>
> 
> The series ended up moving all the useful bits of CONFIG_PROFILER into
> tb stats which was dynamically controlled on a per TB basis. Now that
> the perf integration stuff was merged maybe there is a simpler series to
> be picked out of the remains?
> 
> Fei Wu,
> 
> Have you looked at the above series? Is that gathering the sort of
> things you need? Is this all in service of examining the translation
> quality of hot code?
> 
Yes, it does have what I want, I suppose this wiki is for the series:
    https://wiki.qemu.org/Features/TCGCodeQuality

btw, the archive seems broken and cannot show the whole series:
    https://www.mail-archive.com/qemu-devel@nongnu.org/msg650258.html

Thanks,
Fei.

>>
>>
>> r~
> 
> 


