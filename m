Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1826DA6FC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 03:32:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkaxE-0004Xb-Qx; Thu, 06 Apr 2023 21:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pkaxC-0004XF-4P
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 21:31:50 -0400
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pkax8-0006mq-LL
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 21:31:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680831106; x=1712367106;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IZmP28Qjrr3YPjS72Ev13BNHU9Tf9T7Or+8kFzHPOoU=;
 b=MW9lIhW/PChkKCx3YjU0cE6jOb+zSNDx226iKTBCLU5SdMFLwS/vVLJz
 YavX68aoPmWwqY9afdj7cEtkdMz8L99yPVmp9WO70WDHyW/PbpcBk8ZFT
 p+75ID20f09jnV4s99jr1OtsbrKpyJpZJPwWtXlrtIr6zHNHMBMVNVikM
 f6jahVSkUasTmatpl7/YP4iyx4MtV/Ye7cVMqd5/L8apHG0BJTO8fHwm8
 8V3O2ciubK1TlTHAC6n5AcPiszNS4nsJRgSCtEwav6NRdc4U47badOcZh
 vo2kpJWYkGztx0lACqNlTEFgLwkdqKdn2ykSTehHrbOMMUXQDRyrMB+b6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="345533887"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="345533887"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 18:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="717651727"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="717651727"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 06 Apr 2023 18:31:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 18:31:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 18:31:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 18:31:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 18:31:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAGS+l5sQMW1HTltTunV9XBIO/PhJcPs+odfmsYtBRHkpf7zloItd59uFf/WQEHmla7aOwElcKDA0VTJfWUeSTNhBvbDNqtpz2ik0Ks71As+LfiGq4+LMejS6kKGFiGFGwe8K7VELqWBStkeoz54uQDWOVWPhe4RmYDykHb+u5L6NWtK+Ws3azns0zt5H8ArHdr+ptlf7w0zt1odqO+PgdNTWYNpQObB7vh1U1FI+Wbcz32hp7xOERoPa2873nasdRobvAUo2Wf9Yi8kCQv2Otgr4O0ndh53r4srR6zLusfHVH6iatxOB+UXT0DG1o0Kdygjtfx8sNOEqA01Cj8Bug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rz2RgYkOwmzgyM67ail7PaYqBnVhF9rTW/cMPwwasL8=;
 b=XJ0YR3IYcrvs/iZRJZhDCmpd98MNaGCZdzcO5kGIjc9bmoc6/YY38A9gPck4OBlc/uv3YXfi+BgMeSPdo3bDoANxIbOaeNJe0mPQDLizY2/Icy5Z4+T0ShhXwJTY3Gn/IH0PcWSeuUluceTFtYX1tLfiK8tZXtaVdQOAYtGwzSgpxiGCKo8Xfy+h82La457eZNPW5us41/eqvBCuej0Vc3QlZtDe907VdtcSrrtKGcKsoYKbxF+9CJiToj279KBc/ihiRUhQDYwW1Tq7DWUAKIIUn8SZkMYi4LIWtt5ZbXZecVDIl8ipnHp+6wFLTEYzypQLKESe50NbuqnGRIVogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by BL3PR11MB6363.namprd11.prod.outlook.com (2603:10b6:208:3b6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Fri, 7 Apr
 2023 01:31:31 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f%6]) with mapi id 15.20.6254.035; Fri, 7 Apr 2023
 01:31:31 +0000
Message-ID: <b69f70de-ccd8-b534-44f9-7df794f92d04@intel.com>
Date: Fri, 7 Apr 2023 09:31:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] accel/tcg/plugin: export host insn size
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: <richard.henderson@linaro.org>, <pbonzini@redhat.com>,
 <erdnaxe@crans.org>, <ma.mandourr@gmail.com>, <qemu-devel@nongnu.org>
References: <20230406022751.757980-1-fei2.wu@intel.com>
 <20230406022751.757980-2-fei2.wu@intel.com> <87v8i9jviv.fsf@linaro.org>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <87v8i9jviv.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::18)
 To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|BL3PR11MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: b18e60ae-2fe3-468d-ce7a-08db3707d0ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sTT6VW97RkK9B4M0ldBG4LUoeNKBu6MhksPDENR83lZPPOBVFI/jcj6anQqjqHmZXsIKjA11PRHTbZyzpTnvsjleCbE0SHFU/kGaOjdzf4BIC7HUleWPC6TaDUzQqt+BlkoRXBluwlw/vfAI351O9OffwUHpSWJzgnCJtvuSeQv6/1VZWMX0kOjfByWDf53PMlBF/Jb+iDdBDA5o+DKTNMlxKNlI2eX15mMT1r548QQ5SAJTJWgGGlKlW8mFLahQsLD+iBU0mEqjPK+Z3pq+YNQCHTYmXYCJ7AeBJHnPgGgRDKsxwWOTpHcutu5/dRf3+a3h0rcmIukQEoFV0Vj/oKLYY/SUl40/0NYwuGGnj4WsX0jlskUPhl2jwX9gssfqmVp1a+4j2bqKWPqv+pyhXBYTa4szbdUJ0USfNlWJ/FyDPeE08G5VgpLsiS0FSd8vBIm1gF9lAlsxsP2DIl9914v03gs7FjT7M9/33LUJA6KD+JgbpWfemzKS2VAmBuy7a5yFdChvAhruHMpM7CvRRTlCcuKk6t/izahBm8H87oG1C3RELNTP8FM01IMhayGPVE64D98f+865kjOwSN1WasBTi1xDVmIwRW0/DekLrgYa1vfmqAtn66MJ+P2tHG8UANexE/1ml4J/IQbgqhIDvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(41300700001)(31686004)(66574015)(83380400001)(31696002)(86362001)(4326008)(8676002)(6916009)(316002)(66946007)(66556008)(478600001)(66476007)(6486002)(38100700002)(5660300002)(26005)(2616005)(186003)(36756003)(82960400001)(8936002)(53546011)(2906002)(6506007)(6666004)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzFmMktVUXhXckJpUytNRHRFbU9tb0FPWS9VWm1PdjFNUXFDUnB6aysyb214?=
 =?utf-8?B?ZkEzZ2hWYlh3bWRibFVYcmsvdk0xd0czdnhaMUdIb096akIyd3Zta1R6RGZo?=
 =?utf-8?B?U3JLZVF1elFMT3ZqektQcHEyMkxKVE9EUzMxaGhuUm4waU5DTWJhT1FFK3FT?=
 =?utf-8?B?dmZ2TWVJcVFKVGJlVDdabVRFeldIcEVUV2lFdHc5TldGeDNlN1o2ekM4cytN?=
 =?utf-8?B?K0lmRGlKMngzcTAwN0c1NHVDZjl5WmdKUEpGTjVXWVp1MkxmcXBtdStqNjZh?=
 =?utf-8?B?dnRhT29zMkM1aklZNDdLRm9oUXVra2ZqWUVPTW95WThMazJZN1RXZjhHamJ3?=
 =?utf-8?B?N2dFMkNlVEx5QTZnUC92ZUtWVEJ0di9pRUlNVEMyZVp4SHl4OVdwOEFwU1By?=
 =?utf-8?B?bHlzc0lwd1JZZkFDNXQvRFBBSmJIS0Y5bGVFaVh0bjZGTDU3RlV5YmhSSmQ1?=
 =?utf-8?B?TDdNMWROTDBWQUp1ZlVxd1g1bE91UFJEV3JyNDhkS01YNTZlMktaWit5bzYx?=
 =?utf-8?B?bHhCZDJDTThhR0xKelZrSHlyOUsxWUhEdnliazYwWHhuYW4xMzhxTDVKMUN3?=
 =?utf-8?B?dG9iSkpOVU9UR0RiNjNSMGRieVJlQXJIaGNiczdYQ3hGSUx2bStpNUlQNEw4?=
 =?utf-8?B?akZJNnh1d2FxSGR6eHdHTlYwVlBPUUQvdjBnUHdaWUZ6cmZyeUpzdHZJSWtL?=
 =?utf-8?B?N0ZubGVRdXJFQjhmWnZlSG5VWGZMekxGVHd2SjRNVFhFK2ZsSmdxTHZlbVRx?=
 =?utf-8?B?Qml0aFV4dGhwT0Z6Y2I0QW01VnN1Sk5oUG1UdnNoNHNwd2dLTnBYTVRnQXRP?=
 =?utf-8?B?Yi9idVk2VXhQek1QanhSZDBFODg1Ri9YakJBbUVYczNCODkvcTFnTFZsTzBU?=
 =?utf-8?B?ekwvSjZHQUN5eDJ3VFU0RHFSNDl2Y2E5dUR3WFBSNkVDQ3VrSmllY1ByTW53?=
 =?utf-8?B?WW5nVHhYZTZkd0p2OFdVS0o0cHpGZHJjRnNBaFc3WDdrdHFSZFhEUzJJSEwx?=
 =?utf-8?B?TkxoQi9Zc0VvWFB2UTRtMy9RWHpaYUo4Y25UOGN4YnYxRlV0a0MzeG9qM3Zy?=
 =?utf-8?B?Y1d5VTQzRFBLbkFkK1JYc0ZQWTU1b0tMV2lEaHUzNnkxSkNHSjRjdFZkRy9E?=
 =?utf-8?B?UXRWYS9MbXMwUlhXQ3pkL0xhQm5Ka3MySlhlZ3JhRVV2ajFqWmpPQzdHc0kx?=
 =?utf-8?B?MDl2blZyMEhpc0J2OUZMZ1o5U2F6ajZkSi9uRUxXZmJOSkZIWW40S0ozRFN2?=
 =?utf-8?B?dU1jN3F4djdXU0Z2L2MzOW9ObERYaUliR1BCV3NiQm9ad213S3BKbEczNnF1?=
 =?utf-8?B?QkE0bXE4cVhlOExVeTA2emlJNVZGbXYxTm1EWkJvaUFwaFoxNFJzQVFQZVd6?=
 =?utf-8?B?OFZNUDc0U1dGWUVYZjE2ZnlqcWgzYk9CRjhOMWtGaGxqcFMvb2lNT1lQNHpq?=
 =?utf-8?B?VEJ1ejJpOXRxdHpXSVE1K0ZqQ2IzL2R6VTcrY1lWQ3JFQTdINy9LejVHbkhx?=
 =?utf-8?B?VklrN05LV1M4Wk03eGhiTDUwNmpLcWVmZ1FTU0R4VWlsc0RRQ2J3ckszbkxE?=
 =?utf-8?B?WFlaVWdLa2Q2SElSV0NjaDRBcUZQV0djRU51NzFKWmRTcDlVWWo3SHgxT3lM?=
 =?utf-8?B?QlJkbFdxc0JoY2VuM1k2RUNVL0NNUXJyWk5wWE1obU0yVTg1T3dNK2VYR2xq?=
 =?utf-8?B?Mko3TFl1RERUTmlWZ2hGenRvaWx6aGIzNXBUbTF4cW1WMm1iQ2hncmpxbFlE?=
 =?utf-8?B?V0VuYmtwRlE5RkRVTUl3RXRRZnJuSGt6b1YyemUvd2ZIQzVrMTcxVTRlb3M2?=
 =?utf-8?B?bERkQUxkVGQrOUMwWXhJMFBpVXhXVmt4Q1JQUjg1ZVVzT1o0cDg3UnJ0M005?=
 =?utf-8?B?WEhWZ0dpUjIxNmtkZEhHUTdPcGp6QVZrUmRFVnpISjJWZ0hyZUNKTlhLczBH?=
 =?utf-8?B?cjFhNUxkNWV1b3B6L2VHVlNoMndqZ3pkY2ljUjVtOU1ZODEraUJBWmtQRDhy?=
 =?utf-8?B?aEtOb2RBYzNuVzBKSjNBamgrWXZ0YXlFdDFjN1k4MWxqbm9MNDh4QUNIdFlK?=
 =?utf-8?B?VW1jQS9IYmhtcTNCZWY5MXhVTkxWTy9adkI4UkFEMjJEWENYSW1nK2g0SURD?=
 =?utf-8?Q?b+KikLpuJfjQlf9tVVoZPnHJn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b18e60ae-2fe3-468d-ce7a-08db3707d0ae
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 01:31:31.1984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0y1FNNvbSDuV4o8vrKdRejwOHq7yEcmEIf2WVbfts4oSGd2xcMsNJrzqvZdzC1J5Srd9DxEZX1PZTF063XSqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6363
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=fei2.wu@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.224, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 4/6/2023 3:46 PM, Alex Bennée wrote:
> 
> Fei Wu <fei2.wu@intel.com> writes:
> 
>> The translation ratio of host to guest instruction count is one of the
>> key performance factor of binary translation. TCG doesn't collect host
>> instruction count at present, it does collect host instruction size
>> instead, although they are not the same thing as instruction size might
>> not be fixed, instruction size is still a valid estimation.
> 
> I'm not so sure about exposing this information to plugins because we
> try to avoid leaking internal implementation details to plugins. Aside
> from that the very act of instrumenting will increase the size of the
> target buffer.
> 
> If your aim is to examine JIT efficiency what is wrong with the current
> "info jit" that you can access via the HMP? Also I'm wondering if its
> time to remove the #ifdefs from CONFIG_PROFILER because I doubt the
> extra data it collects is that expensive.
> 
"info jit" collects the translation time expansion ratio, it doesn't
distinguish between hot and cold blocks:
    TB avg target size  14 max=1918 bytes
    TB avg host size    287 bytes (expansion ratio: 19.7)

My primary aim is to collect the runtime expansion ratio, so hot blocks
weigh more than cold blocks. My concern is this series might not be the
proper way to implement it, just as you mentioned in another reply.

Thanks,
Fei.

> Richard, what do you think?
> 
>>
>> Signed-off-by: Fei Wu <fei2.wu@intel.com>
>> ---
>>  accel/tcg/plugin-gen.c       | 1 +
>>  include/qemu/plugin.h        | 2 ++
>>  include/qemu/qemu-plugin.h   | 8 ++++++++
>>  plugins/api.c                | 5 +++++
>>  plugins/qemu-plugins.symbols | 1 +
>>  5 files changed, 17 insertions(+)
>>
>> diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
>> index 5efb8db258..4a3ca8fa2f 100644
>> --- a/accel/tcg/plugin-gen.c
>> +++ b/accel/tcg/plugin-gen.c
>> @@ -881,6 +881,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const DisasContextBase *db,
>>          ptb->haddr2 = NULL;
>>          ptb->mem_only = mem_only;
>>          ptb->mem_helper = false;
>> +        ptb->host_insn_size = &db->tb->tc.size;
>>  
>>          plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
>>      }
>> diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
>> index bc0781cab8..b38fd139e1 100644
>> --- a/include/qemu/plugin.h
>> +++ b/include/qemu/plugin.h
>> @@ -151,6 +151,8 @@ struct qemu_plugin_tb {
>>      /* if set, the TB calls helpers that might access guest memory */
>>      bool mem_helper;
>>  
>> +    uint64_t *host_insn_size;
>> +
>>      GArray *cbs[PLUGIN_N_CB_SUBTYPES];
>>  };
>>  
>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>> index 50a9957279..2397574a21 100644
>> --- a/include/qemu/qemu-plugin.h
>> +++ b/include/qemu/qemu-plugin.h
>> @@ -336,6 +336,14 @@ void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
>>   */
>>  size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb);
>>  
>> +/**
>> + * qemu_plugin_tb_n_insns() - query helper for host insns size in TB
>> + * @tb: opaque handle to TB passed to callback
>> + *
>> + * Returns: address of host insns size of this block
> 
> If we went ahead with this we need to be very clear when you can call
> this helper because the data will only be valid at certain points (which
> is another argument against this).
> 
>> + */
>> +void *qemu_plugin_tb_host_insn_size(const struct qemu_plugin_tb *tb);
>> +
>>  /**
>>   * qemu_plugin_tb_vaddr() - query helper for vaddr of TB start
>>   * @tb: opaque handle to TB passed to callback
>> diff --git a/plugins/api.c b/plugins/api.c
>> index 2078b16edb..0d70cb1f0f 100644
>> --- a/plugins/api.c
>> +++ b/plugins/api.c
>> @@ -188,6 +188,11 @@ size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb)
>>      return tb->n;
>>  }
>>  
>> +void *qemu_plugin_tb_host_insn_size(const struct qemu_plugin_tb *tb)
>> +{
>> +    return tb->host_insn_size;
>> +}
>> +
>>  uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb)
>>  {
>>      return tb->vaddr;
>> diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
>> index 71f6c90549..3e92c3b8ba 100644
>> --- a/plugins/qemu-plugins.symbols
>> +++ b/plugins/qemu-plugins.symbols
>> @@ -39,6 +39,7 @@
>>    qemu_plugin_start_code;
>>    qemu_plugin_tb_get_insn;
>>    qemu_plugin_tb_n_insns;
>> +  qemu_plugin_tb_host_insn_size;
>>    qemu_plugin_tb_vaddr;
>>    qemu_plugin_uninstall;
>>    qemu_plugin_vcpu_for_each;
> 
> 


