Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AE96E461F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 13:13:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poMmG-0008Kp-MF; Mon, 17 Apr 2023 07:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1poMmB-0008KU-2s
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 07:12:03 -0400
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1poMm3-0000zT-B7
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 07:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681729915; x=1713265915;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vnUIhBReMN4PydYDHpon/UQKr6ya3ceDHm2GkZrvHoY=;
 b=MXPlEL8b9fVTnHzytWrKRdN+vxR7TgiVFQHhtP7kgfnZo6vvUtSWQaxb
 8syUsGXjka9JyaZaENL6HV94g626iuGETvauvWbychX4g747rvFIioekX
 xiw7ohi34CnaLYlv8Ut1s3k47ZVc45Dehcd4On8XSpDKj0I5je4nSKWT6
 Dqj4A0rw++/uJg8E8ozrg4ilBJkv1q/pKB1nL9GsZvTtFxRkGT2ltt8XE
 eU4jMEo3R8HPtHidY/zFc3aZZ6EZwtVo5KYt9wGRrIsc5FJc5bx6pSta0
 0PA3DCqE8mLhHiI9QJcYHhTBc8D2W/HSGL5/LZy4l6cCPi98177twb889 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="346710224"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="346710224"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 04:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="936786517"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="936786517"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 17 Apr 2023 04:11:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 04:11:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 04:11:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 04:11:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEhZaZeZ2zgPSkTa1ch9gTc8qYlp9i9GAL7hQU1Y/uIUWQbNnJ18m/JAW8mqfJ5U2o0E5m2KZxXC9uGs8QvptGcqgBaQC4vVGejbIrkcPv/RX4HJWhIKXg5C0Su7lCVpk7yuOLeaciylBlpO/3y6GtW/tL/b+kX49eZPk5+Vbo1SVQkYgmGMwvxkJgSQmP4K7qfcw/h8DjZ4StYillUtZPgGrmwsDiCSKDvEJo3CJfhkXUhl2NUoXgqtxkT5dAUIyxXZ2XhQIqIXPCFkJ9Quyn1lFefg/yBv9qRRDwLDv2sEj7+Yx2QvV4Gw/GBMvH0R2mmeg+srfvLsG2yVGlrdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lh2P/B1jm5EWFEzQBwbRoAYLAv9ezDItZY/2AF8asmA=;
 b=Ze6Sf/1eZyja4BtDQmHNmGq2KPA23x8oqUASsCQ8wztjwzrsBS4RsG+JmORnea2DLJDzXCuYRPQ6RZR7M72WYIj6DONtnfYj/9O+tn8irlZW95J8SwOqU9N8K6ADnasnCb/AmVpG0pQcvgr3uMDmOfPFMDMLbPIKc+sVEuGHVRNZyBe7GB+VY/yC49xfJaWj1S4GduWChOx414gZHLqaGthGkuIgHgyfb/6+DWeLw4QdzEdpi3zJyF2G321H/jOS7zcTnGi4CR4vwVuhweRBrcVAMgAcFVHzcUykO1BZohovO4O+CY/WrLeMIzdfwfG+/Exx0bwgdhRha17y8d4Q2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 17 Apr
 2023 11:11:44 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f%6]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 11:11:44 +0000
Message-ID: <6ac7805f-8fc5-f598-258c-b0b55a1a35d6@intel.com>
Date: Mon, 17 Apr 2023 19:11:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] accel/tcg/plugin: export host insn size
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: Richard Henderson <richard.henderson@linaro.org>, <pbonzini@redhat.com>,
 <erdnaxe@crans.org>, <ma.mandourr@gmail.com>, <qemu-devel@nongnu.org>
References: <20230406022751.757980-1-fei2.wu@intel.com>
 <20230406022751.757980-2-fei2.wu@intel.com> <87v8i9jviv.fsf@linaro.org>
 <ce65c074-ff12-1f29-ee64-44fb7ff643c7@linaro.org> <87ttxoc8wq.fsf@linaro.org>
 <0f237ccb-dcbe-87c7-d9f2-653962d30520@intel.com> <87v8i2ri3w.fsf@linaro.org>
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <87v8i2ri3w.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:3:18::22) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|SJ2PR11MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e23cfdb-2390-4b2d-74d2-08db3f348687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +/TOug7fioRrtyMHo8AC+JonNb45+AbYDGkE2cPOlF2VDQSyOA22H5698GSGPz6MYYsBZETJaJQNGldM6LdcEsM3mXUQHPbZjkOCh3tdK1t6RdiXREi2L0qRYxG86RQCsKg+dD4ahn11nizawB3iRfD1MU4S5Q6SwEQHvVWghkMjVVl7WE1ctO8xfm5LMLumhGxdcQUwBRRWXiOgAMhTSZH9V1lKOAcwh+QlG4rt96S8ch559sF1v46z0+t9fsD0PsggKAQtLZtWlJZyFTXGuXnu+CdL26ACZtQocJ8t6Ef8NOq2OXtonwCVrXmeEIemZRqKxvhGVYrHZxbZdNkqzelH1hRHDQ4zOpZvak/J9zjKfGUsuz0HfcMphEZ3wjhpEOYc9oxFNQG/rclrN0tlvqAE1o+nEG5EKX1foF7CPV1/GQp+DcKJjnXaGHsCszkg8TzYFAOqkHbtPr5LZM/pkxmKKb7S+fEM9ieLNn0UeydlPBs7A6fxSOc4lqniyRvyJk5Do6RfQy2nAHFCXPaAhJjyL4lbkrkHYZVsII85/nNF1Slcz6qv0YJ46tjJyhoRbomV0nuOfCWFpDAHWli2LB98fZlCNR0f4pQlbi8yORVujw4z4u5LxSbSYziRfrlo+7SoIy5wU1/dvoXzKrJjW4wqv1TuURU7atw7p8cBLdpQgX/u9XVAH8dw/3rvvUmb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199021)(8936002)(31696002)(6666004)(5660300002)(41300700001)(966005)(86362001)(478600001)(316002)(6486002)(36756003)(4326008)(66556008)(66476007)(8676002)(66946007)(6916009)(83380400001)(66574015)(186003)(2906002)(82960400001)(2616005)(6512007)(31686004)(6506007)(26005)(53546011)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm1pMTlvZUxwaER0RGROaXE2eVlxckJYcHJ6cUhQc1hGbUREUlNmUUxPRzRy?=
 =?utf-8?B?QUxoUFNrVzJid3dNdGJBbmt2V21WejJOd1JleVk2Rjg2TGxPUG5PcGcrRDhy?=
 =?utf-8?B?ckV3RVpxRENIbEJRU296Z3ZleHU4NkpEdUhuZW9CTjdxL2NlSFQ2Vmxvbnh0?=
 =?utf-8?B?QjN6ZC91eldrUHZIb04vWUIzZ0hFeFlzelZYSFBKVU41SlNnejZqTDM4ZmRw?=
 =?utf-8?B?REZNY0ZYRlErUy92ZElYelZVQzRFR1o0QmJkNUl3QzFaTEVZbFg3YjRZanI1?=
 =?utf-8?B?Szhva3o2d1NrRVdvakhqcWRhUng3Rnlxa3RQVHZYS090anBUSmx5RkVmWU4w?=
 =?utf-8?B?cnpITTRMcW83ZWFENHVTVVJBTGk2eC9yV0lJWjBPNVFFNnAwM0RHWFdNZ1U3?=
 =?utf-8?B?T3J4ZHNuSWNGVXFYeUc1N3dlZlh3K0lDQnNwQ2RMRkgxMEh3bzdlZWNyU0hr?=
 =?utf-8?B?OEdVN0wxQlp0ZmtBRTRZZ1I5T3dxR2J0RzByV0RlSTFYZERtbkNLU3FBTTZ5?=
 =?utf-8?B?MGM0eHArTDdxd1M3WmpYaGZiU1QwcU5VdCtyMFIzdDRPSmNYQklKUmVnbEsv?=
 =?utf-8?B?d2lySXJTcllCR2xvbDVFWnppSWRFM1lZV3dWcG5JUyswTDFxaWVWc0RSV1dw?=
 =?utf-8?B?UWlyTWU3MmptbkxKaU53ZUpOVCtmMlpqb09TOVIxMkNrZ010L3RPN2E0bG0z?=
 =?utf-8?B?enZjUGVYZ01oaVVDc0N3WEJiZHhjMEVHdVFCOFdwSHBTQ0FuSmpTeVFFM2NS?=
 =?utf-8?B?cEVrcmNTUGpDaGxuVUQ2SDNuR1ZiYkpoSlM0T0t3UzJvbEo2SWlCZnQwMHdW?=
 =?utf-8?B?UkpHbmZzaWszUVRoYUxhUkIvaXhMU3RIVWdlU2ZDRzI0U3dUekJ2d0pwMURQ?=
 =?utf-8?B?ZUZJeDZjUFJxV0JOUFA3TnNrWVZsejByMFVyK3VBTndDOUphTUpzYWtoVnRk?=
 =?utf-8?B?ZGVpSGphdTBXTEJGRXdmbXNMRkVweVlHaDdvVHdVaUEwTVRnSGo2SXQ4RHVt?=
 =?utf-8?B?Vzd6dzBTN1dzaEQ5YzBiTE9IMmlucGxJK2ZJOE0yNS8rTUpTL2djd2pjRjdr?=
 =?utf-8?B?aUxlZHd3QXZWZVpLOUE5c3l1eXJhRWRjczl0djRJdWlGRFRzNVJHMi9MZUJG?=
 =?utf-8?B?dGR5b2F4WHBOQTBJNjd0OUNoTFpZUHhTY2Fwc3pvM1RIazYzUFZzUVdjL2kz?=
 =?utf-8?B?bmp1WnVTd2pBQ0FJT0ZJbVV3V2Z3dWxldHYwYWt3akFFTU9TakJKdnQxdnBI?=
 =?utf-8?B?SlJPSTRoUG84d3Y3TWVWUjhMbjFObEU0Z3Z5aEx5SmdmMXY5aGtLTGozNEd5?=
 =?utf-8?B?cmE5MkFCNFhxZ3ZOYnJZN1BFWlpWb1JKeUwyLzdFTWJ4dm1kd3UraE5sem53?=
 =?utf-8?B?cXpCTExUaWdNdDZMNEYrM2dsa01lV1N0RTRnZzE2L2N3SFpGOVZxYzFlU2ti?=
 =?utf-8?B?TTVtZW5FdVluZmJVbVRqNU5xb0JYR2I2VkVtUVNMWnBpNnl3eG1IbUpoeHJD?=
 =?utf-8?B?dVdDMjlzMTNWckl4TUJscTQvZUZpbkU2VlpFWnR1TXArMkd4a29MWVpNNjZQ?=
 =?utf-8?B?ZU03TVlONEptekxBdHhqbkw3YTNRQVNPbGE4ejBaOWtTUVFUSlBha1pYRVBD?=
 =?utf-8?B?VTBhVld5ZWp0MVBSL3dQdjRsaDNZN3RCODhtSHJSVy8veDZqUnQyMFF1ODRK?=
 =?utf-8?B?ZXg4VVpERHVCMndXVGpqaGJlRUs5WnFxNGgzdDY4YlZ0QmpDcGpKc2NYWjJ2?=
 =?utf-8?B?SDBBelgwZHJxK0tWeVFlQUFZUjZTWFpsNVc3WjBYV0lVSmpSR2VDU24vTlgx?=
 =?utf-8?B?UUszdjRXVndpNStaQUlTcFYxRzU2R3JBemg5Z3VjZCsxZkZjRFBnN05KR0dw?=
 =?utf-8?B?YWFReDNSdVpnOWJ4ejJmVDFnb1B4TE9QUTdjMXIxMHdWLzZGSitrMURHWUt6?=
 =?utf-8?B?bWw5bzVIa2tIbjEzYld3b1hrOGVyM0FQTXg5eDVCZU9EdXVrTVhvVnFhaTdz?=
 =?utf-8?B?ZFZGS2lOekdyZWQvV2VkUXpIc21EVXhMMHFzU1lQc3N5R3ZoQkhFQVlqcHRs?=
 =?utf-8?B?T0VIdVFyVE5RREFzSDJmSGxMQmJQVXZBbm1KeWxuelZ0Y2xiS1RTTkNDSWpy?=
 =?utf-8?Q?CXFftyxJ8jAAby/nZs9ErMCCd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e23cfdb-2390-4b2d-74d2-08db3f348687
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 11:11:43.4764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pxU5/aEdIC8tGvsxCOo+/GHpm0REUFtVZoBbDoiXIObixSO34zm6JpHBAeeaASaAhcI0aU3dXzvevThI5ZSiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=fei2.wu@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 4/11/2023 3:27 PM, Alex Bennée wrote:
> 
> "Wu, Fei" <fei2.wu@intel.com> writes:
> 
>> On 4/10/2023 6:36 PM, Alex Bennée wrote:
>>>
>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>
>>>> On 4/6/23 00:46, Alex Bennée wrote:
>>>>> If your aim is to examine JIT efficiency what is wrong with the current
>>>>> "info jit" that you can access via the HMP? Also I'm wondering if its
>>>>> time to remove the #ifdefs from CONFIG_PROFILER because I doubt the
>>>>> extra data it collects is that expensive.
>>>>> Richard, what do you think?
>>>>
>>>> What is it that you want from CONFIG_PROFILER that you can't get from perf?
>>>> I've been tempted to remove CONFIG_PROFILER entirely.
>>>
>>> I think perf is pretty good at getting the hot paths in the translator
>>> and pretty much all of the timer related stuff in CONFIG_PROFILER could
>>> be dropped. However some of the additional information about TCG ops
>>> usage and distribution is useful. That said last time I had a tilt at
>>> this on the back of a GSoC project:
>>>
>>>   Subject: [PATCH  v9 00/13] TCG code quality tracking and perf integration
>>>   Date: Mon,  7 Oct 2019 16:28:26 +0100
>>>   Message-Id: <20191007152839.30804-1-alex.bennee@linaro.org>
>>>
>>> The series ended up moving all the useful bits of CONFIG_PROFILER into
>>> tb stats which was dynamically controlled on a per TB basis. Now that
>>> the perf integration stuff was merged maybe there is a simpler series to
>>> be picked out of the remains?
>>>
>>> Fei Wu,
>>>
>>> Have you looked at the above series? Is that gathering the sort of
>>> things you need? Is this all in service of examining the translation
>>> quality of hot code?
>>>
>> Yes, it does have what I want, I suppose this wiki is for the series:
>>     https://wiki.qemu.org/Features/TCGCodeQuality
> 
> Yes.
> 
>>
>> btw, the archive seems broken and cannot show the whole series:
>>     https://www.mail-archive.com/qemu-devel@nongnu.org/msg650258.html
> 
> I have a v10 branch here:
> 
>   https://github.com/stsquad/qemu/tree/tcg/tbstats-and-perf-v10
> 
> I think the top two patches can be dropped on a re-base as the JIT/perf
> integration is already merged. It might be a tricky re-base though.
> Depends on how much churn there has been in the tree since.
> 
I have rebased the patches to upstream here:
    https://github.com/atwufei/qemu/tree/tbstats

I try to keep the patches as possible as they are, but there are lots of
changes since then, so changes are inevitable, e.g. CF_NOCACHE has been
removed from upstream, I just removed its usage in the corresponding
patch, which might not be preferred.

I did some basic tests and they worked (the output of info goes to qemu
console, instead of telnet terminal), including:
    * tb_stats start
    * info tb-list
    * info tb 10

Alex, would you please take a look?

Thanks,
Fei.


