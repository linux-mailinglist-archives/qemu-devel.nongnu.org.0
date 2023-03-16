Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298576BC382
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 02:57:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pccqV-0007xO-B9; Wed, 15 Mar 2023 21:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pccqS-0007xD-Re
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 21:55:56 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pccqQ-0008SR-Bt
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 21:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678931754; x=1710467754;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=acqgJkBoLng/n4P9KCWaSpdKG9YuSomQXAbRhcYWeKE=;
 b=jd+2x6iAUG03782rZGPnhqZE3Zlnl8ipScKd1OXdCtbPOJY0+ATYhGgZ
 yCP4FKmotsP+L7L6MS1g+g9GlmWLWPzweoCLRrI6RgDYKxygx6l9KMJmY
 XJfJnRlY+Gn0YqRmCDFWwTnYEAygMzCdtPa/YnyCQAoScyFwa7CpXXWb9
 /wK6haKzJZozzaFN6wOU1mWYXq5IJEcFMTWQZM5xCM9D7y4hjLO0DkNjj
 iLnHBOPo6k53UGW6D0RjiZoCxvwbYpHMM1gLSMXbdZa2wdwPZMVvlrUps
 M1mF3K19rJJdJdpH6bbUegn93sjpWGzO36ACRg0wrvNUiqlOt/5uHn8KR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="337881394"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; d="scan'208";a="337881394"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 18:55:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="656993286"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; d="scan'208";a="656993286"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 15 Mar 2023 18:55:38 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 18:55:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 15 Mar 2023 18:55:38 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 15 Mar 2023 18:55:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUd+O2iQUu8RMbooC3219uxbBxqkTYa8ctc4MTNjRvhkrcM6+32W2v8oNFjZox3odPq8rZjuUUjJlHvi00xb+q0Oyj6Rk8XzUq1h8c7lH7A/Nb4T2JyDu9TTAks0laSrgc129ZLnRntM/UsSulf9SXpWd7xNmLBeI3vxLvVRteZaMhnzqYCmg1aeBMuiCIkceDcWwcoBpwCtCOhnaV2s3KkwknGErUGfUA4A5gt6TojQMSLOugUc5uVBr4bMf0/Om+5dGkbtjnFzE9xyWl05HNdysA/6dLRq5V/JOkgrSlZgkbhU24iymkEmqhS5zi6NZObMlNvStwiDDl9U04jOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3L7toFpUX+H+QpYV1nAuMV2x+OSjWMFcQezp7wsGzI=;
 b=kWKEUE9uydO7DlsiYm1PWp+jz9BaMupnQcNwEmW9+/zBYtCLzfQxpgd7kLLtQ7qE9zZivN9DgyEtYS6hN/xDDVU/78pEBK6iuVFCqfhpdV1O7SkkBzoFnlkWW1FPkBO2VFFs0SkHYueH7fL9ymzWdMxbjix71TCtFNtKnCKLskyzr0BWVuRqDqY1j/itcdABbtunmS4pioiBxBK96dfRt0SI0AKSF1v1nfKTEgsMQe7B0GKOKHuFp4dcPtOwKikHUw0eQ/57q5F6iQd2/+ujnbbj6qCBSTlg/0HZty4EZ9DZMXVk0dBTQ2v29iJjKZOG50DKBohiY+tUx9xfdj+Aqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 01:55:31 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 01:55:30 +0000
Message-ID: <fb65f3e5-fa18-4b90-80f1-88a748433e5d@intel.com>
Date: Thu, 16 Mar 2023 09:55:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Enable cross-page block chaining for user mode tcg
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
To: <qemu-devel@nongnu.org>, <richard.henderson@linaro.org>
References: <60517f41-a5db-a907-03d1-545b69615a62@intel.com>
In-Reply-To: <60517f41-a5db-a907-03d1-545b69615a62@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0038.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::7)
 To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|PH0PR11MB4869:EE_
X-MS-Office365-Filtering-Correlation-Id: 131a320c-4522-4fa0-b42f-08db25c18563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+/IK/HwmFbST4xKnOEVNIgsJk8Vmz9WbYTBBEQAshT4JhWtcSfgFwU6k2fO5xNATD3Rv+wuSKFV1dwiNisfMhr6rlo0PualrRV5fIuKKP/4NqmHQnLne9MfwET2lz8u+RAu+2TLDmRdxH3ecgpW/YbF/RZo//bKJSEX2VhKkzztAdXpKFDXyFXtR3Kcvt0j2+us5CxF3EiNB4WYr1wQmI3EET9ovPD6402DUuv7XExNDB+PUWmL8KQmm6o++ubExAflFD0O7AHqZn4qs60d/iPdQSTOGPA6PRzYuXnHx3QJv+H5FJzwrkdOCOngjCUgEhwee65FB7Bf31d+q6TgRogiPn7oABaCRIFwDnHTF+EuR3YGbjDSnx2qiqQpYoen4MDFTaoE11gxo++lgpgwLqTlMnp+Pnh9KWuG2Jj9GyPVqvPl6wZktlf9memvqwKk7cFIw7UdLbMQIGjh6Fjx80qEFqGl3PTvnFIgH+YN6sBVg8NJBGGPD+XceaTGAZknx1skPk6AaJfPtFiQdmC8+l8WNAa7chtkdjZMMhpb2iZWU/1Huf6qTagFo+FP4ajL/ptXg0ayn0aIqFuSIFk3XeAVuSzRgOlagZhn/8qCP9W7vif4mHPyR7SRMhcnZEU+OSOxvpsz57rGuqMk0J5eRWG47mXanUWj4A+2AMCBklGXPlKUaCXgm77YEqlOpiOenQRezXmYC4+XV6yypVZg6K6CSmeC5u3LIvvQWIzXGCk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199018)(82960400001)(5660300002)(36756003)(83380400001)(86362001)(66946007)(478600001)(6512007)(6666004)(26005)(6486002)(6506007)(53546011)(2616005)(316002)(41300700001)(31696002)(8676002)(66556008)(38100700002)(186003)(66476007)(8936002)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REZpS25BUVhSY3J5M0ZEaUZaUUFjK2kwVnZZQ3lLeVZxRzFUbmFTcWdTVk4y?=
 =?utf-8?B?RXl2VVFoa0tlSEhDTHVvcFVpTDk0Mld4RlR1Vk9sa1FSMmU0RHlLZnY2a21w?=
 =?utf-8?B?NllYMDRyekNJSzgyODhxdUVRNTBqUzdCS1NOODdnYmplT0tkdVVOVXNDRTd6?=
 =?utf-8?B?Vm1KV1dpczdEWVNPbFo5aVFZUzk5d0dGTk9xY0s0ejYyVDVDMG93UHdNK0ho?=
 =?utf-8?B?MFpQWW51dGhROXZOQXYrU1pBWTRIR2I5LzRJeURmZGpVdzJ4WFNEMk1KY21i?=
 =?utf-8?B?QnVqcWVRNkdCcm1vWUxuU3lYTXRnbFcwVFFWdElYcFM1OEp3WG50M0d0eTRj?=
 =?utf-8?B?dVBoUjlTc1R5cXNINFlIcElLSGxXdS92eGNCRTVTQVIzeGN2MVNGMFBwbVNv?=
 =?utf-8?B?YU9aMUhvNy9TSFY1a0R1b1dLaXFhNzIycFJmSVdVNDh3ZnRJaCs1cnE4Z0I1?=
 =?utf-8?B?dW9rMU15Z3FpajU2RVEwSjI2TkVRU0piaGF1R2lzRHRTak9BU0paTzNvTVJF?=
 =?utf-8?B?YVVyeW9EOGZ2MlFMcmZKQUExN3J2blhSZ2FVaUlheFZHcEFEbHJNQzMwYVFh?=
 =?utf-8?B?TVl6TXZPc2gwNUJTZjY4eVBDVXlNSFdqcGZsbGlIeEVPQkp0MjQ2Tm9zSWRH?=
 =?utf-8?B?S2t0MUtrQ3ZydjZZeGZLVGdURnF2WS80TlRaOXlMamNhL3B0Y0dRelRyU2c3?=
 =?utf-8?B?bENzbUEwN05DZVVua3piTTBiTHg1dHRsWFI3ZzlnMHV0dXlYRVM4SFZBM0hY?=
 =?utf-8?B?bTkxOEVvalBuK3ZiQ0xMNWtncHBycmNVZkNZTytIZmZzdWZCT2VZM0dYY1Vv?=
 =?utf-8?B?R1gwSldWcEIxT25EUjk5bW5sNEdSQVRtUEQ2L0JZQkVLOFJNYkNJekRrNXpl?=
 =?utf-8?B?UnM4RTFLMWZXd0dOdm1kMnArUXFsMUpDZVQ4dlNPR1NoSFc2NVFLTHRidlRJ?=
 =?utf-8?B?RDlWK1VpdXc0T2RjaWgrYU5LZ1RBQldMaXJ3R2NrczUwRFZXL0ZPRWtqejc0?=
 =?utf-8?B?bCsrR0xhYUx5Q3ErY2QzSUpaeFg4WWh1b1JaSU1qWENvWmp0b1U4dzFKZ3Vw?=
 =?utf-8?B?WWNEVUJBNDRHcnhycWlwTHJZU2lrdndaK2pHd1VqRnFaenFvK1doSXdMNGdL?=
 =?utf-8?B?dlJOZnBKbGRCTkw3UnBBTXhwQXU4b290b3dtMlY0VDloQkFUMWRvNTRFVmZG?=
 =?utf-8?B?WFVtT09WcnNWeXFTRkM2dmsxZGVqRHdpS2txdWlDWVNvazFxUnJaSW1IQUpU?=
 =?utf-8?B?aCtFZVA5d1Z0dS94ZDcrVXkwNGVnakFoME5Zd2g4cTl6T085dWJoUTQ4aTIy?=
 =?utf-8?B?ZHJzSVd3OFNETG02dHBwWEJ2UVRiU0lxSWdJK3p6eEMrOXpJT05FaTZwWTNh?=
 =?utf-8?B?RFlRSXBac283Z1ZRVmF6R2NGa3VTYlB1bjl3OWlYcU16N2NEQ25zQVgyOURX?=
 =?utf-8?B?MDBYam80TzNBVWFQNmZZM2tZeDIrSnFqazdkOUtVYUhzN3pWNmpTM0VsaWov?=
 =?utf-8?B?R04ybUl2VG01Z0JyNWFDMlF2eHZtUGozSHRUM0N6VHM2UmtxdVZCWlA4aXRt?=
 =?utf-8?B?djBtU1RoSjg2TkdUVmc0RHVLNm1pcjV2UlIyQ3J3a2RPTGVNZ1BteUh6YlBx?=
 =?utf-8?B?SjBNZklJdUNkbGo4R0d6cGhaSDM3dWZrRDRad1BhU3lkMVUrZll5T2U3a1Zu?=
 =?utf-8?B?MmI4TFFtSzdqTE03TkFrdWx2Ky9NaDJpaElJYVdpMkV1a3hEQXhSbEpvekUx?=
 =?utf-8?B?MUVHaDlBRTZiM1lBSklxdHFqTEloTnk1SVFIU2h6UVhBZU0wMmhKVGRaUE5x?=
 =?utf-8?B?MEZ1aDluMGJ4SjRiSktDLzQ4ckNKRTljN3M3Qm8wWGlOanVvQzVCVVZ6ZGtW?=
 =?utf-8?B?cmN2MHJqT3VFWklOdTg5QWlkdnBzMUpnV0NTbzlaS2xZYzYvN1VMeUFKcTFo?=
 =?utf-8?B?c01USGMxa1IxOUZ6d0xNekZJcDEyWjgzVmN2VVRFUTlyQzdzMk9PN0Q1OWFM?=
 =?utf-8?B?WmNoY2JtWGtIcmNBeW14em1RV3FJYjRaNlk1Z1NTQTJOR2FqMkNzVFI0R2p1?=
 =?utf-8?B?bFNESGhNZW43ZC9kOEJDcE9KMnVOUHBaWGZUbFNFMkRSaGVSRy9EU2dEbFo5?=
 =?utf-8?Q?WvOFacZ6gmoS96IcvMB/uRevr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 131a320c-4522-4fa0-b42f-08db25c18563
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 01:55:30.3314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/CFilSI6SPWf239bAr1oUuM5MxcmGlqwMyubyXCkynuAALZ3c14RP39egNIRau2DS1WXPddVRG4jilDkX6+PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4869
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=fei2.wu@intel.com;
 helo=mga14.intel.com
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

On 3/15/2023 10:40 PM, Wu, Fei wrote:
> Block chaining is one of the key performance factors of tcg. Currently
> tcg doesn't allow chaining across page boundary, an example can be found
> in gen_goto_tb() in target/riscv/translate.c.
> 
> For user-mode tcg, it's possible to enable cross-page chaining with
> careful attentions, assume there are chains like this:
>     preceding page -> 1st page -> 2nd page
>                       Nth page -> 2nd page
> 
> There are 2 situations to consider:
> 1. First page should not jump to 2nd page directly anymore, if there is
> a new breakpoint added to 3rd page, otherwise the breakpoint might not
> be hit. One method to address this problem is when receiving gdb
> commands, call tb_flush() to invalidate all the TBs, and make sure each
> TB can only contain single instruction later, no matter the new JIT-ed
> TBs use chain or not, the tcg core loop always has the chance to check
> if there is any breakpoint on each instruction. There could be other
> methods, but current tcg has already done this.
> 
3rd page is a typo, it's 2nd instead.

With the patch at the bottom:
* TBs in the page where breakpoint is added always contain single
instruction, it doesn't impact instruction count of TBs in other pages.
* The single instruction TBs at the same page of breakpoint do generate
lookup_tb_ptr because of the flag CF_NO_GOTO_TB.

I tried to add breakpoint & conditional breakpoint, ignore breakpoint
using the following testcase, and checked the info '-d in_asm,op', all
works. If you have any comments or any tests for me to try, please let
me know.

--
#define A1    ++a;
#define A10   A1 A1 A1 A1 A1 A1 A1 A1 A1 A1
#define A100  A10 A10 A10 A10 A10 A10 A10 A10 A10 A10
#define A500  A100 A100 A100 A100 A100
#define A1000 A100 A100 A100 A100 A100 A100 A100 A100 A100 A100

long func0(long a) {
        A1000;
        return a;
}

long func1(long a) {
        int i;
        for (i = 0; i < 1000; ++i) {
                A1000;
        }
        return a;
}

int main() {
        long a = 0;
        long sum = 0;

        while (1) {
                sum += func1(a);
        }
        return 0;
}

Thanks,
Fei.

> 2. The protection of 2nd page has changed by mprotect/munmap, e.g. from
> executable (X) to non-executable (NX), it's an error if the 1st page
> jumps to 2nd page without checking the new protection. The point here is
> to invalidate TBs in 2nd page and unlink all the TBs which jumps to it,
> including 1st page and others(Nth in above chart). This is already done
> in page_set_flags(). A small testcase runs on user-mode guest:
> 
>         void *page = mmap(NULL, pagesize,
> 			  PROT_READ | PROT_WRITE | PROT_EXEC,
>                           MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
>         memcpy(page, func_add, pagesize);
>         f = (FUNC)page;
> 
> 	f(1, 1); // good
> 	mprotect(f, pagesize, PROT_READ | PROT_EXEC);
> 	f(1, 2); // good
> 	mprotect(f, pagesize, PROT_READ);
> 	f(1, 3); // segfault
> 
> So it looks like current tcg implementation is ready to enable
> cross-page chaining for user-mode. Correct?
> 
> diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> index 7bda43ff61..822644c7a4 100644
> --- a/accel/tcg/translator.c
> +++ b/accel/tcg/translator.c
> @@ -25,8 +25,12 @@ bool translator_use_goto_tb(DisasContextBase *db,
> target_ulong dest)
>          return false;
>      }
> 
> +#ifdef CONFIG_USER_ONLY
> +    return true;
> +#else
>      /* Check for the dest on the same page as the start of the TB.  */
>      return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) == 0;
> +#endif
>  }
> 
>  void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
> 
> 
> Thanks,
> Fei.


