Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834036BC437
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 04:09:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcdy0-0002jW-Tx; Wed, 15 Mar 2023 23:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pcdxy-0002ic-D2
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 23:07:46 -0400
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pcdxv-0007mt-0u
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 23:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678936063; x=1710472063;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NJ/AO685BLI5uFMwblajc+Y0aiBGWoqylST70+fvS3Y=;
 b=I5a1RPX3I9GEtUgpJ0qXBwpdmyOfF7CAymNppQPh0UIK4J2B3qYsLM6W
 yyyFKQGgUU4b5pP3deI10p96Txcx0wkjy+wyoiUC1wYVKBL55Jal2KSpy
 vwZAUWPV9V5lyQZ76tq/2lhJmwTH/Tr8ED3ACd+OgRSBCflLaQ8ytZ2uy
 FeXCdKiDQisSq/lroDZJEngGfAI+IoE1vHi07EJyiInO2QnEQAQ5vxzKY
 DoQSj5h41f58yzZgP75LPz/CIGIFDQI0ORonzB+xI51/rdpyOIbFUQuTN
 dro8qoS5ObGww4G0hb1aQlcVNQQp3wt42gaDZTxxb9Bfg+D5zZRn0vPio w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="402746309"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; d="scan'208";a="402746309"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 20:07:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="823040713"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; d="scan'208";a="823040713"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2023 20:07:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 20:07:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 20:07:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 15 Mar 2023 20:07:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 15 Mar 2023 20:07:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8WH1AkOIUcsrlVBHCZvbCVhiCNDg7L4xWceMiBSJquxtWFYcaemsrDGKjnMJ5dP3u2zO7eLDHiO7/edWgspWMV86VfMojCDgwRzGauPKlDwQnIzd13yJR2LgqFGs1BZenOibk92y7ALO0dFBClujVauRmT7IX5Nf3KAwxmsfd4Bxd2zZIFhw1+zo80hyEFC/MI7Gam8sghIWLZx5ceHzOrI8Pn2QzLY3qg8PIg9Ol510BryRSWyquwBgQN8mFatYKuXIw/xUWr31xCCYUZS+pjZfYOG8GdLKmGdPnAMqrjtrXx5Yp3nZvTJvkzvHhXQ7+HMzVnPO63WjJh4NGJQGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVqzWNDFAvAS5QCzcpFSirfrOdX4D+qgdpJ7iILl4AY=;
 b=eQdPl0AGfDM8VlmNH0DTlluXNDx/pFgKSUaSfTr6/mMO/nzYWeYuAFWAZ1z1hh2SKvbfwT+SpNB0IxoyES1Uie7Ch+wqPTfuXeamccLFmiI4LTsP5bPdIhgtygeL53/v9yW1+Dege1jS2UWUILXUKKEDWwgJiaNuk48Sffi6CIDAVsTECjGA35ZGc26bhhsk9wkM/RGE22ghuQ/TJb9yX1Zgsdn1ZNnaQicuv6aWEJCPeloavhPhUwSrBCHKJSWQO84Y97VytqugyiPwNnzPzC1dnunD2dfFLVAKwwJ3STNbDGo3R5xtVD6yy/NhJJ12+TBuwm+8aRLIs3BOn8CLFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by DM4PR11MB6093.namprd11.prod.outlook.com (2603:10b6:8:b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 03:07:33 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 03:07:33 +0000
Message-ID: <f1359849-e039-85e7-444d-aa72277df247@intel.com>
Date: Thu, 16 Mar 2023 11:07:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 01/28] accel/tcg: Introduce translator_use_goto_tb
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
To: Richard Henderson <richard.henderson@linaro.org>
CC: qemu-devel <qemu-devel@nongnu.org>
References: <b160a8f7-10b0-5674-a040-b11ca4aed3c9@intel.com>
 <714313d8-7828-196b-50ac-fe12d2143135@linaro.org>
 <12e54d71-e208-507c-c9d2-c313f9301fc3@intel.com>
 <db955647-d769-e9fa-b314-6a3ee16b0b95@linaro.org>
 <c20c0885-1e95-16c8-2c44-ec33e5f3f44e@intel.com>
In-Reply-To: <c20c0885-1e95-16c8-2c44-ec33e5f3f44e@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|DM4PR11MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: 8abfeacf-1759-48b6-5275-08db25cb95ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z1OnL3Qx1u80lJJ7KBLCp9WwnDg/mLM4q93+K2XSSonmovwlMcXbD2E7Z+68Ag96YuGqEWgpR3kKecCF7huqJwce9OyuYf6l0LKyBhuev97/kTPre9j/G/mrpmAKz73hVPb3ug6JlJAwobTnzhUvUN+wWxmvbFDCu2OvcGQCYpxjVCgyJaJ9lPj8TEn+xDjCerxtAuJ9QIe82GG3V1rfKVozDuBb4Q2usdeXYYONFb43F9bNPR3LDJS3Aq2XMvbE340c8rK/SxJPzTI3Nh77OmGnMVJkQVeLvRlI45KZc9lwxs5EIKUjRSqMYMsVIZ7jErBTnYuD9LFyjVcQB2BeVerA+ARsWG61x9H1Kg90nh7bitQQIrIK9dCNcI1rkHFFY3Xc0gDYqK22YQTW2KmOiOQi0jjQr1qddN/rWcppTy2pqTsIn1m8fyyIJMZRpnyBZBesvyuYSwuUbDaggpDJMQ5o+deiTGfyhTjRhElis6naGC3V3fLKlWV/W7r1xiMarFSBPgZlneMYmCRroFnDUQOHWlFI3/UP+ZHA8peKLNTOGQPRNUu0/4IZQESBsfl8hzManHYctAmlUvr0RARmo5Il7Adx21QNmn2IbVvbw4ZHSC6S6q6pslVAYs+03+PQeD+PteXp32lELEDShC75p+wZ3aQ5cBHRQtO7jdg8a4fOB9FMLNFEK1XrvQmEq7H83P5Q0k4IxuWqUk2dWLwmBQ/gOOENJpUWQU9i9viZ7VaLTwa4HWYiSFLXDAZBuxmreiYNL9hgELs5OvUYgIt9Wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199018)(6486002)(6666004)(2906002)(82960400001)(966005)(478600001)(83380400001)(316002)(6512007)(6506007)(2616005)(53546011)(31686004)(26005)(186003)(4326008)(6916009)(8676002)(66476007)(66556008)(66946007)(41300700001)(8936002)(5660300002)(38100700002)(86362001)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVdkOTY4TFFZVHZvMk1zNGdGbFlYeUtFMmxSeG9mdnd4MVQrN21aREtzR1Vj?=
 =?utf-8?B?V3B4SEs0V01NREpTY3JDSENWWHlVeGNEeFgwNHpKYW8yWjBkSXlHeENvVDZa?=
 =?utf-8?B?L3lpeTZ6MFNidWNIZjhmRjRlaG0vejRKWjVnWVl6VU43TFBmaGF3YmxYZ0RM?=
 =?utf-8?B?ejRmaEpRdE5xZWViUTRPZWNhYWhtVUEzdnJ4S0d3L3JucEpEVURoR2thVkFx?=
 =?utf-8?B?bTFrVVBFUjk4aytaUXczdlkxSzdSOWtrNjRoeUlpc0NzY1E1NGQ4bytLWWxH?=
 =?utf-8?B?UFA5ZnRDQWZQRUQrajBmdGNMTXV2M0w2OSt2OW44L05mTm5kdzByYi9ERlQw?=
 =?utf-8?B?MnNQOThSTzM1YytIYVd5eWIxak5rNUE0ZUNVOUFONGVnMjErVkU3WmY1dVV6?=
 =?utf-8?B?enpzWHJra2dGVmlzcW8ySFBCdGVHaS9nZm56eE1waTZjL0VuWnNnQUcwWjRF?=
 =?utf-8?B?Qk9sL3UvSkxGVVQ5NHM2TUF6cEltaXE0aVNvQ1VxSjdhbDRjamtwc3RPeTQ5?=
 =?utf-8?B?MXJLeVNsWUYvMVRWZHJKd1lZWTJlVHlKdE1GSHpGWG93bnNPbjlJQlBOak1B?=
 =?utf-8?B?RU1FenJpb1BZazFZMFdoSzhkYms5YXc5RFhrY1JTSjBuSlM5OFVFR0UwdzlC?=
 =?utf-8?B?N3VYWnRNZUc0SUgxd0tPMHlVWEkrU2ZXbWg3UG9UZUVwLzF0Q3l0M1lTaXE2?=
 =?utf-8?B?SjJEMFR6WHZPbytjNTdKQXhuUkh4QjAwczdrdk5KZzRMRTEvTWxveUhmNWIz?=
 =?utf-8?B?QmdKUFZvR1V4R0Z0eThUNThPYnIwMm53ZFVQNmMwT05pN1VydkJzclNIYmVM?=
 =?utf-8?B?RkVNd3ZDOHFwZTFLdmpudHl4Wm12RjJTdG1CWGZVQjB6cG1HU0xQZlRISzQz?=
 =?utf-8?B?b3ZWY2ZoOWVqWnhvOFl6VU1xdnBqa1FZc3h4YUp5LzgvQlRxd3VBeWNEY0JL?=
 =?utf-8?B?ekt3U3hsUDA0SjFERGJHZndCa0oycGk4K1QxZkZRZ2NFT052bjZNblhnOGJ2?=
 =?utf-8?B?TStTdGFKV0dTTFlBUTFVODBDRy9KY3RHdWdXVXBKZ2NrcmZLTlNtZWdLdWha?=
 =?utf-8?B?b0FlZ29YN3FPSUhCbVVQU2l4UXYxbzRlbDRScnd4MkVXeWRNalFjdi9aNzJC?=
 =?utf-8?B?UU1ZaWNWdXZPR2N6UUI3dDZ4RTNZRkZkVkVidHArYjVkL1JmR2JnUWwwd1lZ?=
 =?utf-8?B?SmNrckRhcDJRWVNrd3R3ODdpZ3RxeFo5ZjFuMVhpbHR2MXEwaXQxdVBIbkd4?=
 =?utf-8?B?Q2d5ZWwzL080K3ZOdVdHNG9VZjNtV28vSllVSU9Wa3pFdG9wVGdlSkhlTHVa?=
 =?utf-8?B?SUxDSjJ3Y0pSNDdNYjJJazlJNXZ5VllTdzhGTnpjS1BKWVB6V1ZJdVZoMDFk?=
 =?utf-8?B?WjhkZGIrUTdVd0VGRzgxYjZoR05EaTlSUHg2Q1NDN0h5YkwxMHdjUVovcmdE?=
 =?utf-8?B?YUhoZGl6K2dKaUJRRDNidmVjRTBSNGtCTGIrbDlKczRkREJlam1Oek5NaWs4?=
 =?utf-8?B?OVhxeHMwQmVLSCtVSHFlOTBnT290K0tNckdGUDh3NXJaZlJjbGFaVHFSOHI2?=
 =?utf-8?B?TlhKZW9oL25mUnRud3BCaHlnU0w5bE9kWjFrYXJKeHRtV0RXUFh0TmVBUkhW?=
 =?utf-8?B?M0F3YW53QjJxQmR3bnMxd2tpdFJNN1hzZWFDTm5KNGV2dEo1N2hvQklvSGhD?=
 =?utf-8?B?K09RMHJrdUdmbVBFeFhaY1VkUEQ5RHRoWGFNZGJPTHF3eUlDMjd0UTNsM01u?=
 =?utf-8?B?ZGdUaTB1Z2xxd21FSUJtUzVzbWxKL1c4UEJQL0x2YkJaTDArTTBTa1gyOGxu?=
 =?utf-8?B?ZWxLWDNMek1WODlhd1NTeUVJd250cWhBd0lvZ0hiNmZTampmVFNTcGJCYTZk?=
 =?utf-8?B?ei9od2I2Y1c4b1p6ZCtlZTd4QjFYZnJ5UFdJUlc1V1FzUkx2TVd0VThaRVpK?=
 =?utf-8?B?dmUveDNQSVY3RUJZOUt4eG9MMjg2d2UxTElQdnFmNDRZeEg0RHdYS2IrZHd3?=
 =?utf-8?B?L1hjTzM5MXBqbjJRT2x4K1dWZklxWENCWG1YVHZkMVVIQzl6QW0zRncwOVZk?=
 =?utf-8?B?V2d5bVJEelR6WERDcitGNW1SQ3ovb1hVc2VZSTh3eXRJaWF3RVVaQ0QyaEVG?=
 =?utf-8?Q?1HDeI5kbQdihefQRh6tsLhoDA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abfeacf-1759-48b6-5275-08db25cb95ca
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 03:07:32.8147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55QW+HeFrrhxSe5s3sExeNQYExMJym6nc7wLCX+zo0VaGFteN/xYJ0nx52W9q8gKhIDKLMwq4PIz5HFu+nvgGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6093
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

On 3/16/2023 10:07 AM, Wu, Fei wrote:
> On 3/15/2023 2:15 AM, Richard Henderson wrote:
>> On 3/14/23 06:47, Wu, Fei wrote:
>>> On 3/13/2023 11:00 PM, Richard Henderson wrote:
>>>> On 3/13/23 07:13, Wu, Fei2 wrote:
>>>>> Hi Richard,
>>>>>
>>>>> Sorry for disturbing you. I'm doing some perf profiling on
>>>>> qemu-riscv64,
>>>>> I see 10%+ faster to build stress-ng without the following patch. I
>>>>> know
>>>>> it's incorrect to just skip this patch, I'm wondering if we can do
>>>>> something on intercepting mmap/mprotect (very rare), e.g. even
>>>>> invalidating all the TBs, but keep the cross-page block chaining.
>>>>
>>>> It also affects breakpoints.
>>>>
>>>> I have no good ideas for how to keep cross-page block chaining without
>>>> breaking either of these use cases.  If you come up with a good idea,
>>>> please post on qemu-devel for discussion.
>>>>
>>> Thank you for reply. I am new to qemu/tcg, lots of details and
>>> backgrounds need to catch up.
>>>
>>> If we only want to address user-mode qemu, and assume this cross-page
>>> chain, first page -> second page:
>>>
>>> * breakpoints. If a new bp is added to second page, the chain is hard to
>>> maintain, but it looks acceptable to flush all TBs and fall back to
>>> current non-cross-page implementation during debugging? I think It's
>>> different from the full system situation here:
>>>     https://gitlab.com/qemu-project/qemu/-/issues/404
>>>
>>> * mprotect. If the 2nd page remains 'X' permission after mprotect, the
>>> chain is still valid, if it's changed to non-X, then the syscall
>>> interceptor will change the permission of corresponding host page to
>>> non-X, it will be segfault as expected?
>>>
>>> * mmap. I cannot figure out the situation. Is there any unit test for
>>> this, or could you please shed some light?
>> Also munmap, but handled via the same path through page_set_flags, see
>>
>>     if (inval_tb) {
>>         tb_invalidate_phys_range(start, end);
>>     }
>>
>> There is no unit test for mmap over an existing code page.
>> I believe we do have one for mprotect.
>>
>> You could plausibly add a global variable choosing between
>> link-all-pages and link-one-page modes; it would be protected by
>> mmap_lock.  For link-all-pages mode, the above tb_invalidate_phys_range
>> becomes tb_flush.  We probably want to start in link-one-page mode if
>> gdbstub is active, which is the only way to set breakpoints in user-only
>> mode.
>>
This is a good solution for gdbstub case, clean and simple. Current code
leverages tb_flush() during gdb, it looks ready to support
link-all-pages mode, I tried to test gdb with link-all-pages mode, and
didn't find any counter example yet.

>> I expect mprotect/mmap over existing executable pages to be extremely
>> rare.  I expect munmap of existing executable pages to be rare-ish, with
>> dlclose() being the most common case.  You might wish to change from
>> link-all-pages mode to link-one-page mode after one or more instances.
>>
Yes, I agree these calls are rare, so performance of this path is not
crucial. If I understand correctly, we need to avoid the situation when
the latter page is munmap-ed or changed to non executable protection,
then the jump from preceding TB to this one shouldn't happen. In
tb_invalidate_phys_range() -> do_tb_phys_invalidate(), it removes all
relative TBs from cache, and also unlinks/unchains these TBs from
preceding TBs, so next time guest attempts to run code in this munmap-ed
page, the chain doesn't exist anymore, the protection will be checked
and enforced.

Thanks,
Fei.

>> And as I said, this discussion should happen on qemu-devel.
>>
> My fault. I didn't notice the cc list, and initialized another thread:
>     https://www.mail-archive.com/qemu-devel@nongnu.org/msg949625.html
> 
> Would you prefer commenting there, or I move the content here?
> 
> Thanks,
> Fei.
> 
> 
>>
>> r~
> 


