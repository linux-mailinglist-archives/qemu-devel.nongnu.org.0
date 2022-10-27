Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C544F60ED0C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 02:36:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onqlU-0006TV-9n; Wed, 26 Oct 2022 20:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1onqlS-0006TO-5Y
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 20:28:54 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1onqlP-0006xq-43
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 20:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666830531; x=1698366531;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D1AAhRV0g7qThLkOEb+6esqRjYxrM9gUCN6Jo0SSVTQ=;
 b=nZ9+4fgz9zUzCfYR48TEmIR1elTKLZ2eNFefqjgE/Q1IDaB4fEiD3VXu
 K9G2JHRvxL6xwe1z+0/koRkkzaXWQp0ImE6DIWPiBEwiUoRebpcPo/qqU
 h0s/+yGpDD8F2P5kcY2BCwcb0XcqpNa+n65I82D2e3yXBL3oAWK/gbF0o
 /GoBfSMhn+g+2FjXCm+WCFX72papuxKo8pbky9NKh3wr/lWdv7lh4G5OJ
 xI8o286AMY5cMGTyMGHpiBEDJ/VX65o1uvIHuY1ysx+VrfGFr7K0Lgdlb
 8PGNaAJThifVcYoIvEaTZ4j1CyEGAFsPi4OZME9SjYWxUeXAzKISwZufb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="306825518"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="306825518"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 17:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="634706059"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="634706059"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 26 Oct 2022 17:28:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 26 Oct 2022 17:28:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 26 Oct 2022 17:28:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 26 Oct 2022 17:28:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 26 Oct 2022 17:28:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fACWRpS+JSW2HT+YHbvMcbAUehjBoZbwZ0wrU8htsWG69NbQD+BjkBaYIQad8ye+FvIhfYkRRm0lUaPUPy7uWCpfceozOicEY2J1nkf2FF5qEkoxpjnu7jJRf4/osAt7EyzNHa0nBG/5Eh3Xvih/QclBXSUehU83N0TjsQwdhehNjx/3nHQv3UC3q7JtlXsHV0OsaKd1r7ShTQznC7sPWTnfFI4Ht7zZqzu5vgTUf3rCBVmy24AbTrjjNZ/vdNn2pb830mIE1/L2na1bn6avvo66HU7ol9QwTyFassOcJd/zRXKA6Uo+I7hMTwjcMdG55kIfDHUyDQjz8479MWry0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gZhaAyl+xaDf8Mr2kFq4lNsBMJwfrt3mWmAyZuw8Zk=;
 b=OuB0UkKXZ1N26bbjo8DbmlGqwh4UGp/8605EDWogpWVWTzv3p4s72goZo7ALGg0d1pQ6Iyd4I4o9HnWyL//CLCbRDF1gw6H0Kk+x9crzwzwqBngLpu4gePv/RQ5TfxFTiX1QfSzB/1U4WTsF9ggNrKgP3PCh3yGeBdzRNJX9Bef64tUsMLJR5KqDKKZ+Y1ZP5xGaKdlgCgtZgS9r7mb0ZxLPiQ+ewikNeM5wEUULkS9eebG7WKYPkyI1zT/av2XTO7kLb5trWYn5tGh66q7MZVrPI3CMbMCXJp1n5SH5h5a3l10p2LQcuZYKtI+GkZYX5cLu9246oWyxOu+ggYOLHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4965.namprd11.prod.outlook.com (2603:10b6:510:34::7)
 by IA1PR11MB6443.namprd11.prod.outlook.com (2603:10b6:208:3a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Thu, 27 Oct
 2022 00:28:29 +0000
Received: from PH0PR11MB4965.namprd11.prod.outlook.com
 ([fe80::9587:2d8:ace4:8725]) by PH0PR11MB4965.namprd11.prod.outlook.com
 ([fe80::9587:2d8:ace4:8725%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 00:28:29 +0000
Message-ID: <253335ef-5e63-0182-f92b-a576b2459cff@intel.com>
Date: Thu, 27 Oct 2022 08:28:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RESEND PATCH v2] target/i386: Switch back XFRM value
Content-Language: en-US
To: "Zhong, Yang" <yang.zhong@intel.com>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "yang.zhong@linux.intel.com"
 <yang.zhong@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20221026115745.528314-1-yang.zhong@intel.com>
From: "Yang, Weijiang" <weijiang.yang@intel.com>
In-Reply-To: <20221026115745.528314-1-yang.zhong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:194::14) To PH0PR11MB4965.namprd11.prod.outlook.com
 (2603:10b6:510:34::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4965:EE_|IA1PR11MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: 502af830-07b4-4965-104b-08dab7b22b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 73TZ8RkB9ikOelkh5dFVfcQWo1Ay4sGgx80x8PBUoqCiA1IuLsvz0/pkeFGeoqiJ6YscGYXw381srktTq2wevdY7fOoxnPl9uXuEqpU4VnYnKd302ncZ1C44IE5trCK4BKZPn7XR/WvBkJL2XfuGF+X42xHTaPgnKBtHM8n9mJksKVkY+kGXwVZJDyRMFGrufOdrnWCHcR7NZ8dul1OYta4fmFnYhjaGyC2gjGw4M7SHbVZsVa+VHq0yqwaNaxndrkkRvuwQVZbEKJa3oiL92Oq6JH+lZxY9LAt0Wwn6sv8kFmAcECEyXaGdo/Tl7U7GRwcFET/2IbYr+LdLl2Mlmk+jRMTFwnpp7D1kggIIMERti4vCW/gHm9qc14/ztGS+tu3j1lkJ05tIAkbGwAwXorXvcSYLFObnCg7UyZOsUo8Lc+3ZhTAVXzoZ1O7BawRvOr3hH3x3TTXpiW9Ck/NpouqdFBXxva6h9MaX7zHSGk4S3eeO69hRRpxQhv0QQCpLBr+3CAi/68rQkE3tKRXZQRpDzBUlgnToX0/QApw1pKaCOBZkXOQbmeIRItLootkm/0tlK9e58moEHypMGCG2kuA8+trV/s6c7upX453UXPWcNCmcBQy9hc0W8CHGNO8rQSgCMhDMGBoVweX52TP16ZYDKNzQYwzoox3b/R1uWKdY2HreXAwkk8ODg8SmnPEX7NntESw9bGofeSq/Hpjs8miVGfVELu9JyfS6TrTooGhTt9v5H2B+KyMQme0uqzes3vKIItvHofImQfIr8JYls//BF/cEqpmcS8yCtA1gntg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4965.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(6636002)(66946007)(66476007)(5660300002)(31686004)(37006003)(6666004)(54906003)(66556008)(316002)(53546011)(6486002)(4326008)(6862004)(8676002)(26005)(6512007)(6506007)(41300700001)(2906002)(8936002)(186003)(478600001)(2616005)(82960400001)(36756003)(83380400001)(38100700002)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0MzdTZVengwYzUyZ0hESWpONDRrYlpJZjRYcGtRaG0rQU0yZVd0dWwxTi9V?=
 =?utf-8?B?VnhPYzkvVU1TVTR6MkF1VmthRklGMG52dkhGVjM1TnNnRmJBbGNtWnM2RFhU?=
 =?utf-8?B?TjlGNFpEYmYrMDhJSzhIQXZ5bEhTcFBlZVFQc04yU1pvOHp4dnh5c25VaEF0?=
 =?utf-8?B?bXh4UWt2eEJ3Y0thNk1pRXBBWnV2MlZoN244YWkrUnFDTEkzTEErWEFmZy83?=
 =?utf-8?B?RE9adkNoZUZNOUdRZDA1SlhWSEx0WkF1VUxmaHh3N3VVaXZGTHZaVFE4TS9N?=
 =?utf-8?B?OGpmQnVwUjR0T3h1U1BWK2ErZGo5T3p4dWZYc2NNQnJSNUhCVjhjYmhySTBG?=
 =?utf-8?B?MDdvbnlPdkVJcWVjallsQk1UYytFWW9wcG9LSTZwclVTbW1DaHNQeTBkN05p?=
 =?utf-8?B?SlBkS09rQ0ZSTEtxZDNwbVBKWW96S0FZSWJMeHF1RXBLN1JxL1VlcUFtOUZ5?=
 =?utf-8?B?UjgyZmZ3WDhoL2dPeGlHMXM2THpjZjd5TEllUkxncCtaTTdBRUZYaFNQV2hD?=
 =?utf-8?B?SEM4VER3UHc4SVc2cGFzVkVMVXY4bE1FQ2s1bTZGdzlQdWRXNmdTQVFWZkpM?=
 =?utf-8?B?alYwUlR6TXdtZkhGUnhScnJZWVNKT0o5bFNKbWpFS2ZrWWtoZXFzVjE3R3cy?=
 =?utf-8?B?WHVWTTE0eXNNVDl6WHhSd1h4ci9wS3EzSWFxWHBaQ0VpOEhBSlNqcmRJQTZZ?=
 =?utf-8?B?QzhMQytlaTJvWG9GT3VuQzJmVXE2QW53RzNZVDA4UjlEYmlaRmZNaGhmNlUw?=
 =?utf-8?B?NEEvZDM3Q1Bnc3o4amFPODZpeGsvV2UvTDcrTkFnYUZUVTZYaTV4VDg3YWZn?=
 =?utf-8?B?VVNpNzRGTGhkcDdTSGt4dlY2Z2wzdmVzcHhMWFIvSFZOdU5zZHhzcVNDK3Ru?=
 =?utf-8?B?Wm02dXZzQ1g5NExkbURqcTZXYzdtVkZPNGhlZW5NMnZpeVQ4aDZMVk12UnMz?=
 =?utf-8?B?R0lyMW9YNDJiT3I1eFp2UGU3TnhnblpweGpJTFYwNmsycnNlK3N6VnBxZWto?=
 =?utf-8?B?RFJOZkFGK1gzRW05bzJPMmRtWXdpY0dHQ1BENDMyRFN6cXIxNGZRSUNYRENJ?=
 =?utf-8?B?NDh2NXVZbk9qL3Y3ek5jdzM5WjZWSW5ZZlVkMTI1WDd6eGR5SHY4VjBwNElo?=
 =?utf-8?B?UDBvRjdpWHl0ZGMxZ3FKdTBON3dhNVlLU1NPd1dMeEFCVjNCSGlMN1VKbXQ4?=
 =?utf-8?B?VjBWZUoyQ2NZR1pYVDVoTkZaampVU0hpQjMxRTFVRDZiVzVVcXJZdXRpZGlH?=
 =?utf-8?B?anowdmpOVzVadmVvTmNEbkVoT2s1bEVSVVhqUm0weWc5WXBBSkMyelltWVJl?=
 =?utf-8?B?dGtNeUV5VnFXdmhIczRFNGxaYnJud1lKU2JsOEl3dElPbllhTElNSFA5R1JV?=
 =?utf-8?B?czhqUlAxVXRJRUY5QU9FS216SHB4MTIvMmNNN0FPSGZ2NnVBSGVEQWhlclBs?=
 =?utf-8?B?Q1NucURMUTM0RzJocmtOMmMzWlBGbkdjeUZUVmFoVkpSTFY0MGhqRmFTYnRy?=
 =?utf-8?B?RlMvdzlZWVZ6aW0xTFU3cnRDVEh2a2dsMWI2OUI0bzdia3ZqVzBEQlZTRm9p?=
 =?utf-8?B?dUJSM2gwTnNwcFdoR1hmRE9RNXVaZnU0SzA0NGRxOGwxMGE0K3dvLzdUdjVX?=
 =?utf-8?B?NDlsY1pJK3ZhQi9HZVAzYjYwVC9QSytlRUFSR1RHTkZUOVpkdlpveHYwQVp2?=
 =?utf-8?B?UXBSZ1IwZXhScjc2dzlwT2FPMHdDdlZqMDJHVTNzY1dGRTFpMXZvOG53RlU1?=
 =?utf-8?B?MEFlOW1DeWIzdDUxNmYrd3IzQUM2TE53eTRDa0JlUGpHdm80RXU5NzJOZ0o5?=
 =?utf-8?B?bjdLY21VQjBmYlIwbnlQeHNtT0Z5RzVrV3JBNDdrNGJOeDZORUJxZENRakJH?=
 =?utf-8?B?Q21xTFBYV252UWpSNHdmUlIzTWZaMWhueFh4eitnSzZzVEVpOVVLRXVzRncy?=
 =?utf-8?B?MHVXMHpIblZ6U3RyK00vbnZ5OFhRNFo0SFZWNGp5QlZiS3ZWbnVPMHYxdVlR?=
 =?utf-8?B?VjR6RW81eHBzUWh5MThqZE5pUjZhQlMrQXFNMWNjOFYvK21qM09UVEZKU0J1?=
 =?utf-8?B?SDBta3hYNnVwT0FFTlM2VVk1SDY4Y0ZZNGwyZjdMSnJ4SUF1UUlEMGxSdFlB?=
 =?utf-8?B?RDhjb0toSHUxMEVXSURndjMxWnBnQ213c0xkNFUxcmh5OXhQVS9mVkxDSXY5?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 502af830-07b4-4965-104b-08dab7b22b96
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4965.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 00:28:29.2474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uu9huhYdlqqObtbIW6ZzXpIJv0vC2nmETIq8MCHfdEZl0zVcIzerrHkvo+cx2pB9DrCND5ZMeS7XQ9gla9FAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6443
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=weijiang.yang@intel.com; helo=mga04.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 10/26/2022 7:57 PM, Zhong, Yang wrote:
> The previous patch wrongly replaced FEAT_XSAVE_XCR0_{LO|HI} with
> FEAT_XSAVE_XSS_{LO|HI} in CPUID(EAX=12,ECX=1):{ECX,EDX}, which made
> SGX enclave only supported SSE and x87 feature(xfrm=0x3).
>
> Fixes: 301e90675c3f ("target/i386: Enable support for XSAVES based features")
>
> Signed-off-by: Yang Zhong <yang.zhong@linux.intel.com>
> ---
>   target/i386/cpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ad623d91e4..19aaed877b 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5584,8 +5584,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           } else {
>               *eax &= env->features[FEAT_SGX_12_1_EAX];
>               *ebx &= 0; /* ebx reserve */
> -            *ecx &= env->features[FEAT_XSAVE_XSS_LO];
> -            *edx &= env->features[FEAT_XSAVE_XSS_HI];
> +            *ecx &= env->features[FEAT_XSAVE_XCR0_LO];
> +            *edx &= env->features[FEAT_XSAVE_XCR0_HI];

Oops, that's my fault to replace with wrong definitions, thanks for the fix!

Reviewed-by:  Yang Weijiang <weijiang.yang@intel.com>

>   
>               /* FP and SSE are always allowed regardless of XSAVE/XCR0. */
>               *ecx |= XSTATE_FP_MASK | XSTATE_SSE_MASK;

