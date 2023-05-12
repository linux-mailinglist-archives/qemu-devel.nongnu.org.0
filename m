Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C11700328
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 10:59:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxOc8-0007Hx-35; Fri, 12 May 2023 04:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pxOc5-0007Ho-IY
 for qemu-devel@nongnu.org; Fri, 12 May 2023 04:58:57 -0400
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pxObx-0007IF-Aw
 for qemu-devel@nongnu.org; Fri, 12 May 2023 04:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683881930; x=1715417930;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1GcGjHphhV4vwoFOfYK2zVjO6iQDEIIC1vBv5WrdjGE=;
 b=lP7RoRarhL4b5bw7zIjuKo5imW/pTQNazYZrPn0BC3ZnWK/I9SNPjC/L
 uhk3AdB+ur6nMqgEzjNiJrRrhfY3WlGaj9huIri7pWM4PA/KWBt12UpL5
 UOQOugXJTSwgr/cMD4/1g70GNe7YEL/iAr5frA5anz3bzQWgM6Ooe2A/e
 0Mj6oWxkaiX83zsPAmMQOHrblk0Mj+oiSyh8B5AtzIj6+7cWvS25eyU70
 h3w8o2P7NHlvblbU4xMrBLuWq5NQqDAhu+S7x3RuVD5wdZS1EE6AatnEP
 0f4DSdMug9i2tQK0DwJ6AmyFI+dHDyRh360ITHEGbCDglhyLEI23XqRTm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="340055433"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="340055433"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 01:58:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="769725255"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="769725255"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 12 May 2023 01:58:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 01:58:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 01:58:44 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 01:58:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyyZmV4ZOB2ccvA4P6H12OyoFl0/3L0LOanVd4ubKX4u1V/FLH2V9j+TIa7fKLsiYUMM2Ww6kkTTkJy1Kf/XHzXYylmNjWwc/wYjqE/HJ4WzmRtwXgiEo8nGoIzrcXLMpRLzGl4sY40IdyFCGOUOsO5dhUjUlRT/3+QR2aHnNN0cTY0vok/9vKMJfEa5T3QYHOLEC1KDaup3WiORuQeAoTJtlN5o0i/bz+Hu3KAYh3U/XynTAi2CFehFhXTNoGU+ZVwb1+P2tUc/397gVNNDG91089f/InctfyiS4qOIluybV5td3IT2D8lm2LBF4Iws6iz6hCskGp2buOshKsJX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHzAbvgN5ivh/GETuGxx43GocCOaEFjMgzPeElVS8Vw=;
 b=im7ihNm1dvO6XHSqiCR0K87ZifPC8PqAXdb/3zTHm/tTe19ugpmrMQjBvQ/N/U8cD1TiCFCzgDTOvsj5a4H4fTyr1qDwSxyMr8yHdu0T7l9pTik2VmYfgkHcQddoiLyxp18PMiyZLaVm3xhvqCjuVQxrJ6zc6KguMJ9RWAn6a0bbmZ6gOj9ksiskDKPp7Vr75dMpRZpi1vUQOJc9xbcoiEb2UqIDf6HmDTu7sFbwwn/RsVY8Y4Tu2ZYl3TDrvp4g44qjwTZ9D1D03DDoWckOCVAOL3iNQAEbKz1KzkZk/2KhkjOUK/ZBauA+jBnNzoAjt5lFDKOeY7IN7/SBUyo5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by MN2PR11MB4678.namprd11.prod.outlook.com (2603:10b6:208:264::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 08:58:43 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::6f32:84de:47b1:3bc2]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::6f32:84de:47b1:3bc2%5]) with mapi id 15.20.6363.033; Fri, 12 May 2023
 08:58:42 +0000
Message-ID: <97cd91c9-2604-4dd6-1ef0-b33a11061621@intel.com>
Date: Fri, 12 May 2023 16:58:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v11 00/14] TCG code quality tracking
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20230421132421.1617479-1-fei2.wu@intel.com>
 <87wn259n4g.fsf@linaro.org> <1b2aae6d-ebce-65a9-0cda-84bf0fcc8b1e@intel.com>
 <87lehux7ao.fsf@linaro.org>
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <87lehux7ao.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0099.apcprd03.prod.outlook.com
 (2603:1096:4:7c::27) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|MN2PR11MB4678:EE_
X-MS-Office365-Filtering-Correlation-Id: bb0eb806-ed12-41c0-4185-08db52c715a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pvXKTkFrLl/mtodQOq5+M4YEs8TohLnFl76MXY+yStEv3dHqUt15Zx3At7q2j9N2L0Lu0fOdUmoRAjuOhTdviChFBqUoTt7F2MfE5usi7sQqbfn/p/VXwd8YQKwqxHRm6cHgisalpIKlfkmGlKcm08OPLXY8tBi7YmCxgNG4lbFdh/gS0TNCZL6+SrOnacw3UQgfVvnD5ELjMzWc27y3fSTJ2CjU0WKRJWTkvELwrmlPtAIIPJQ4iQHfSFRC8d0I0uSoUZx0gpkZ0ommlEg9M/5HB9D0uT65VbniZyx5gT3+oWc3kVWRTvQe7xc37uECy+N09g3A7fXGYoca5hG1/1panpQsxCiZAaOj2Q5rwn2XOnw9d3/lxb9+14F8aLcARtBukHD3wHyQMpqUhjzSE576etBCOU0dXpGoYGifmGp1OcNaB7z4BQ2nJBlkYwHLzAfgUwhwwlxx2j/7irgR8Pdq8rLbgp03Qsc5JV50J1VTDnQ2EqMMrmAgHfyWBIidMKfS0w/QSF+VMUOYIcFPNVRW6dinmP1VcDXyGiA8Q/4w+Y7gGww/HgwlkvX90Awa2pqfHUWZtKrQfprW3HpvnjmCc2uSJea2f4W0Ijgox5lIWiTUTqEzxDhMKxWol6irw2EaD/WozskC9dwAcmpEPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199021)(82960400001)(38100700002)(36756003)(86362001)(31696002)(5660300002)(966005)(8936002)(8676002)(2616005)(6506007)(6512007)(53546011)(26005)(2906002)(66946007)(66476007)(66556008)(478600001)(6916009)(6666004)(41300700001)(31686004)(4326008)(186003)(316002)(6486002)(83380400001)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDFwN2QvOEM5VHNENWl1T0xmZm53THdVNkJFSXlmYzVWNVVqQzBjRjdvUTRW?=
 =?utf-8?B?UngvTkJTT2czS1dtTVo0SWFqUytuOVo5SlhidE53eUlaMDdGMEZMR3VmMDNF?=
 =?utf-8?B?RGd3QmZXT3RJbUczY2xud2lkTSs4dEd6ODVaZjc3cWljK3NaWjBnelZEMllQ?=
 =?utf-8?B?eVh2SVFyY0FwVjExYkVjRytjOFFNcnQzRFdPN1JGazVwZGxHNytHRDQrTkFQ?=
 =?utf-8?B?OCt0Vy81UGtGOHo5Z1NlWlEwMGp6M0JFaVE2dDdDUkNJUEZSV202M2Rka21W?=
 =?utf-8?B?ZkljczBJQS9hREhlRW40WUw0T3pGN3g5MVJmb0kzZ0hQa2JtRXY4dE56WlIv?=
 =?utf-8?B?NmlrdWhzcEJNaUFlRnh3SWVzcFJHY3ByVGhxeUIvQ3lmLzAyK3FhcGJYWWtx?=
 =?utf-8?B?bk5EN3pGU3pZY2QxcWR3b0lnTGlJS3RvbjZuaWxRcHZyTE9nYThXbk5scDJG?=
 =?utf-8?B?cERxQjFnajJuY3RBWFY3QXVXc2o1V2VNSU1YdmNPR04wNUJtOUFrMWN6U2o0?=
 =?utf-8?B?dlRtZm1TRHl0SmlwaHhDYlFuQzF0cXVucjhzSWIrQWRwL1BiN0dnbGRTTWc2?=
 =?utf-8?B?MlV4ODBhalBpMkI4WTA2ZFA4MWxZcThrN050R2Z4U21rMk1UWldEdXg4U0JX?=
 =?utf-8?B?OTdWck5VVDJqbStOVVZsUkptWjkySFVzV1U4Mk5qM1BpSFY4d3dnZ3ZPRlFu?=
 =?utf-8?B?cGxMeVdXUWp2Snl4UUdmSytBd09MYWZnUEJxckp6aUgrcVJTcHF5dnBaeWxJ?=
 =?utf-8?B?dmJuTytJblA1aHpJTmtmWXkxckpaeEtUMnIvWDBXRmhXUHF2cEJlS3BFcEtn?=
 =?utf-8?B?dnVyQkpERjZBeWFHcjJBMGI2eFBCUXVEc0FsdVc3c0p2ZzVpNGhoSGhpRitT?=
 =?utf-8?B?UkdmQ3lYSW96K3VYeGNTNDI5SVBGa0hqVnV1eG0rNlRQS3BKS0ZKT0NjeWZq?=
 =?utf-8?B?d1hHR2gzUWlDTnFadmEwbkJSc0ZiTHlscnFVdVB5UlVKQlB2b251S090SUc1?=
 =?utf-8?B?NkdaNW5GV3lnbk1qdjNBSm4xaXZ5RHF2WnhwMEk2MjlJejNYaXNKVXBlUXRP?=
 =?utf-8?B?WDh0SXhXdU1qend5UkdIMVdoVFhFT1NYUkRFRVNRZXJPQ0ZreDlpY2lTQ203?=
 =?utf-8?B?NEEza0V5NDlabllOcTNxUkd3ajBwU3ptMzZVeS9aUEN4M3E0bkNkVTFPdlZP?=
 =?utf-8?B?aU5aSlpJcHA4M3VZSFRUNjdTNmRpQU9kSWcvcDRRWjZTVVRmN2MxbVdBYXFR?=
 =?utf-8?B?RTBqeGlGM05IZHlvakpnUGxvTzRsTjNwT2hIMWF6cUY5Q3oxYy9ueGE1dTVa?=
 =?utf-8?B?RFhmc043YjZLdGVpL1V4bkk0d2xuZGM4NGRGTnpEUEh6OE55bWl2OVpXcjVR?=
 =?utf-8?B?ZFJZd3JSZlVZOCt4QjR1TUNZWENCR1pxMzNpb1lvTytHYkdFUEZvaTZBY2hU?=
 =?utf-8?B?dHg4V2tlTlEzM2dFY09nN3l0Mi8vb0QvOEpvTm1LTEN4T0VjNTdTekNNZVFq?=
 =?utf-8?B?alpDR0Q1ZXRPdmkwMWh3L0hoK2ZKMjQ0aCsxQks2cnFGZ2pPSDZ2T2xqa0g0?=
 =?utf-8?B?WXRtS0Y2VSt3OFZxS1VOdC8zRGZNNEgveFBCOTRvZEw4MCtOQ2lnb205ek1t?=
 =?utf-8?B?dDgzcG5rU3FqejBhTTBxRlFsRUwxeDZORndtMFZxQUJTYUxyQ2c1VDhUWXdp?=
 =?utf-8?B?V0M5ZEE2ZWxCN0FnaUthczlSb3ZuSURYQmoydjIwc004UHBPK0dhbnZHMGl3?=
 =?utf-8?B?ZjJRenk3KzBKSW1kbFo4L0M3Z29BbWUzZEhHdlRvMEQ4dk9CSlBsYmlzanpi?=
 =?utf-8?B?ZXdLazlIaW9VL3FDbXBzb2JDZmg2aDFxVUtxbGVmUUFhVzkrYjl1SEVPcGlv?=
 =?utf-8?B?ak1FZS91T3JCTnlyRTMyc0dXSDcvSWNBb0J3cFpWc0RQTm05Q1BJOHIwamFK?=
 =?utf-8?B?alZUNDNwM2N5UXFMM0N3L0VGK1NVSTdVVXZWSmJxV05QMTE2cVI5WHJtOXhp?=
 =?utf-8?B?ZVgzSDFrTy9XV3dvWWdYeWdBL3ovYzk0N3RHQnhJekNSbVh6dUUyeVNCZkph?=
 =?utf-8?B?QXRyR2dITDZRSHl4QTVZMWZZWWk4V3ZIOUJkV3lxbnJ2TFhxdEhQTmEzUi9F?=
 =?utf-8?Q?NQqUUeapdAfb3oSXMe2GzhD9R?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0eb806-ed12-41c0-4185-08db52c715a6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 08:58:42.1114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSmtd/gsfKjy2dWay1s9dmI6k4pqILFkTbypx1NlqfBXaR+ssyVXE64nrf/oqJuIbWQySBkb1zyf2QuKciUYiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4678
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=fei2.wu@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.124, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
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

On 5/12/2023 4:42 PM, Alex Bennée wrote:
> 
> "Wu, Fei" <fei2.wu@intel.com> writes:
> 
>> On 4/22/2023 12:42 AM, Alex Bennée wrote:
>>>
>>> Fei Wu <fei2.wu@intel.com> writes:
>>>
>>>> This patch series were done by Vanderson and Alex originally in 2019, I
>>>> (Fei Wu) rebased them on latest upstream from:
>>>>     https://github.com/stsquad/qemu/tree/tcg/tbstats-and-perf-v10
>>>> and send out this review per Alex's request, I will continue to address
>>>> any future review comments here. As it's been a very long time and there
>>>> are lots of conflicts during rebase, it's my fault if I introduce any
>>>> problems during the process.
>>>
>>> Hi Fei,
>>>
>>> Thanks for picking this up. I can confirm that this applies cleanly to
>>> master and I have kicked the tyres and things still seem to work. I'm
>>> not sure if I can provide much review on code I wrote but a few things
>>> to point out:
>>>
>> Hi Alex,
>>
>> There are several new files added, should I put your name as their
>> maintainer? Also, should I signed-off these patches or not, definitely
>> the original signed-offs will be kept.
> 
> I assume they would just become part of the accel/tcg stuff rather than
> be maintained as a separate subsystem.
> 
ok. I see ./scripts/checkpatch.pl reports some warnings as follows:

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

> For sign-offs you should keep the original authors and add your own.
> Each s-o-b is a statement by the person working with the code that they
> are "legally okay to contribute this and happy for it to go into QEMU".
> So it is totally normal for work that goes through several trees before
> being merged to have multiple sign-offs. When the maintainer creates
> their pull request they will add theirs as well.
> 
Got it, thank you.

Fei.

