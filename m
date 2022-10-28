Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E161611375
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:46:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPg8-0006A2-Ru; Fri, 28 Oct 2022 09:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1ooPfP-0005oU-7A
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:45:03 -0400
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1ooPfN-0008Uf-7h
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666964697; x=1698500697;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K82IIF/dervXi1eIGgesUifJQZc9wKi6t1anduWDWAs=;
 b=i9vemG+Ez1Qz2DM21WE7Kzc4+Xvmf5epTfMv1w4vWM+6fJnruOw2fYFe
 ETDpxQwgfYh7FTvS6P3GGgNft0WnEOb/OIjR2D155ManQjPqJTNqt0lcc
 67rCujVcUiqRJ8Kidsf1nBfS8+55xlwnUJY+5njSJdaYV9RSadXETclAa
 cGdWMcjyTI4TO8437zWAQpzczxBS/AW84Kdsn/lG6J0zs6QL4TYVC2umI
 lfT22GVpCUR3wQWR+Ri8QfCi66vxa7ZQQAvAzunzT8R3gZwrYxdL/GA16
 F4MUkLxhTpE+4bp7jIot+CmqtbAW68r1lp19ifBOOO6undEa1Hxjt+Pqj Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="306098990"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="306098990"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 06:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="664017111"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="664017111"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 28 Oct 2022 06:44:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 06:44:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 28 Oct 2022 06:44:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 28 Oct 2022 06:44:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAni9Tk0bhsHaTtNulMwQP54jpqKaFxNBWcNGm+DdEH/GnwBG80uYC1ib7JbPQ9rIA2MKcQ7hLXlPtbbyfl+8gMvZ9MeXj0ngTbBRL6+ZacLLCWGNossrYXQ43HEeLirXdE9JL0YB/6V+SZxNhxsBCcwyJb6re/+J278AOV8VOKjpNx0ga4fRrq9/57j0C4VHBHnkGCg1zv0a76VGIBM/OZLNEq6O0FS1KO3Ap/Qak+wrB7pAGwfDI5NXl7tpM+5e5uLWfLaLeG7do8ND2O+lAWaZjxieQiKAJzvMOdDtQKV7yPeWOduDVyrY+RLTHiq7tb4VUwZHXAtCv9ialG7LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6tWc9xwwvu7yOsCOeiqi1+yXSvIrxTFHtbCrxiFlds=;
 b=XNAlN4vsbHtThe4Za31oUeWyYEKuCttkwsONJW1bwr8c33PtjWeDpx2Poa5AAvexZd7652svMfpWvyR1jJTq8fDYFIeiHPz0imElZGYoUYEsz1vTsXneDND+/0DCuZf2Gl0N9KgDD4aKTHbL8c6CQ9SbdK7aTi6XQJaGboXa83AH7ULWTglFkcQWoeGvwsHeoC8Ey+WuVLWns2Z/lEVMl21cGi9A+wxyBStG6DP5uPqadxizQIPL3A0Z02KmsFOoxgr8aG1aH7qRfmJAMs7bQ8r+4Y2CwBfoCWd5fX5SeMvfy9aPCu9haQ5M2DjtahyuXPTNkfzmJBaYV8NuGJN/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by CY8PR11MB7291.namprd11.prod.outlook.com (2603:10b6:930:9b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Fri, 28 Oct
 2022 13:44:52 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf%4]) with mapi id 15.20.5746.028; Fri, 28 Oct 2022
 13:44:52 +0000
Message-ID: <0afbea0f-fff8-715d-8484-87248de99bac@intel.com>
Date: Fri, 28 Oct 2022 21:45:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH V5 3/4] intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a
 function
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, <mst@redhat.com>, <peterx@redhat.com>
CC: <qemu-devel@nongnu.org>, <yi.y.sun@linux.intel.com>,
 <eperezma@redhat.com>, <lulu@redhat.com>
References: <20221028061436.30093-1-jasowang@redhat.com>
 <20221028061436.30093-4-jasowang@redhat.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20221028061436.30093-4-jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|CY8PR11MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d796d74-6337-431c-78c9-08dab8ea96fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tQDuvkcF0Om3cYUy/KZb0HHcC0KKcoDbbaMUmyZMdDfCM1retoVwIWYcTtaDdy8FQPQGkHwJJgWWH84pidEMTUXUfckJcAmw2GFFT5Nf3jpuwSTqOv8+adt1FR3KJaa2ej+bCuifE/tdQDIp+DmmF8Nk9DuaEn/aHgRi5Rj+Cdi0bplTaOeDBHgKXVU93Hxty2iXFZMrukgcvmGCfbvE1WykeGssGf2l88pxI9eZgERd/H7Dv2vUmevMVi1a+O9HR1JD9LXobjsmJRtyDupJs61FrvVxs2n63tSs9SLR8RKkKlRu30PosJ/I26fLWYsVaaNdyqhQDZeGnvL6AzMAVCPmxvBYzROP5lnCgCmQNY2KEgqkk/B0birzrmnAMlaqj1haefD8jMDUMCKlkaw7JQzVMM2zn0WemTm6h3agamrUOJA/6Z6gliuleXCqx5KlKpyRHaEMrNTgDb6iSmFpD6efiG1oeGzdMxgYE9Z6oQxyOLrxcqyirlc4RqXkXcVz5zexM8TcLTRtOBY3y9F8FDjD17Bn3ll5AYXR30hT86eC763bn6FcZB1eWdUCc+aQdO3Am7gPmQFX5pxXSk6XLa6h09tjJ4ZVo9k17g5OKLPlLzzyhpDsO88VAQDQ78i4F72Bc0bBNWeWaRlyZaRF2EAQfT5GH/l+xnL/Yi1yMQr1/p2GlVhfVlA4ZUBrFK3l1mhZ26DMIB9L2kXWO9UT9edqfjdKSJjuLFsrvpBXzZVYrsFDQE3fCACmob5eSGygXNyv3pR2zUlDGyzjaXYBTmLneucJyzYezD/R+v8RmSs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199015)(6512007)(31686004)(66946007)(36756003)(31696002)(2616005)(83380400001)(2906002)(82960400001)(38100700002)(6666004)(4326008)(186003)(66556008)(66476007)(6486002)(26005)(53546011)(86362001)(316002)(6506007)(478600001)(8936002)(5660300002)(8676002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXBVTlhGb2EzeUNOMFB4R2FaV2YycEJIYVVoVy9OVm9USzY2U29PYnRrYllZ?=
 =?utf-8?B?OXNhU2xCZnBuVHh2ZGdLZjBmMjhOMFRXOUhRanhrZnhSMnVIUUQ3L0tQdEhz?=
 =?utf-8?B?dUZDd0JHdFhDSjlmYkhzMTJrSjFvenZKWWFuYWhWdlBycys5dU9acjUwUmlw?=
 =?utf-8?B?WFo3TzFMQWtBSTJVT3VhY05PQ01rN0l3ZFVyRDZ3WkdxSW04N2FPV1NmczdK?=
 =?utf-8?B?S0pFbVM3UWp2YlN5YkpRZUdLQkVIZFpSMFF6TFhxVFlWM0ZzSVJBSmZGZ1kv?=
 =?utf-8?B?S0toUDBSdTcvSmZsRStQNjB4ZUh2aGhEMlhMd1NkWkpBR24wRG01MjNRMC9q?=
 =?utf-8?B?Wlp6TU1uQWNhS2tjbEFsbE9GaXJtNGpNalBhZ1pJV1JqSlZvM2dTenFaV3pa?=
 =?utf-8?B?RHZkQXJoa2c4OWFmSDFPSGtTaG02VFVoeC8zTGppZk5ocXBtRmxzVURnR2pC?=
 =?utf-8?B?UkRwcGhtMVhseTZ4TUdiMGZwNS9YUXdBb1lqWlRCY1dOZnB0TkFUbUcyQ2ZD?=
 =?utf-8?B?Z1JPWTRaSkpkcVdCVjQ1a25SS1phaUxoMjkwRzdOY292TDBYNkdrNUNXZFN5?=
 =?utf-8?B?MHlCQjNyaHRiaXJBdjlvbVl5MjFkUnNoVDZIN01ySXRVU2pBeUdzZXBCNzF3?=
 =?utf-8?B?NmRMVjgxdW5VWVZJOXB0NmdoMm8xNFB1QllBc3ZVOWE3V25hY3RzUkpDNkl6?=
 =?utf-8?B?WnowR2xYNU1wMWhBUG8xeHJyMTRGSy9pa24yY0gvNjJGOWxhQVhPRTg5T2ty?=
 =?utf-8?B?OEdQOUZjM0JJbnQ2VlExR243TFpZSTB3Qkt6amFwQ2o3emJpaHNiaWxTWEZp?=
 =?utf-8?B?TDZXSnZMU1FDdVc3cTE0ZXA3OGhTcTBTQ0VGWXBUek4yMjhkbEU2c0cwbC9a?=
 =?utf-8?B?bmdYWHdjNHBYb1lodVN4NEVzT2hvTHhMV2ZxSlMyeGNUUzlQbkNhK1Vjc3d4?=
 =?utf-8?B?YTZ6Y0RKbG9YcTQ3eVlBRXBUSDRBcmJuZXowa2lWK0lpWkErOS9xQllzU0h6?=
 =?utf-8?B?K1kvcnQ3S202RndGbHhlWDI4b3RtT1NROUNPOGVpd3V6dVdXZktLNkQ0V2JH?=
 =?utf-8?B?YTBxdWxQa2RFc1BXVVVjL29YNUhOZ01QWEExMFU3UzM5OW94bDBRVXVBZkdt?=
 =?utf-8?B?NVRBR0paeXVEdmlFRU4yRkhZMDRCOERDaWxXSmwyM2wrTHM0eWp4b0I1cm01?=
 =?utf-8?B?YWRucmdRaUUwY1ExeGZkcDFBMlNGYm9neU4yY1RVREMzN1JTT1pjSE5MNUVN?=
 =?utf-8?B?bEN4d1ZvQ3NuS2NBTUszS09BVHRndkdCeG1LY05mZ1NKdVVZMDBJbmI1K2JG?=
 =?utf-8?B?RjdDYWFUT09LWUoxZGZGSFJXN0RxMnVjbVpUSU1qNUZlQXFUWlJWd2JoVkF2?=
 =?utf-8?B?RkZ3WjhXL1dKTHR0dmtvTzJtMDVGaWdrOW40dnN4MFY3SXc5MDZqNEhNQ1h4?=
 =?utf-8?B?R1UwemVOVmRKWWs3TVdNWlArQ3BxSExLR3IrdWJrMkREZ1FkaFptMENsbHJu?=
 =?utf-8?B?VHd5WFkxR0Z6b3JtSzZRL2c5cThMWWhZdklnS3dqVmdQTFBSNTVUNWhWQy9m?=
 =?utf-8?B?Nml5NXprNG5VTk9aV0hGS1RVRWNyMVV6a2NEdldlcFBHbzFaNE1HRGhUMndx?=
 =?utf-8?B?MUVSNEdjMkdNMlV1aWNNYldKSGJmRldXSU1CMDNLNy9wL3FSSmtBVm1OL2t1?=
 =?utf-8?B?OGVHUnNuUlpnRTg1TTY0K01nR2JmNFJIYUp2OTNMVzZOV1BFanBSeXVuMDll?=
 =?utf-8?B?U2hvTVVDVTkwb1RrSjZxeVJLUG5tdi9rSW95SStTN2g5WnlLNHE5VlRFeEZF?=
 =?utf-8?B?OUliaUJEdEpIeWhzY3ZKSjR6MWdyakMzd2IxelJmZXY4d2F5Wnh3bnMrR3h1?=
 =?utf-8?B?Z09JZ011enhUS21idGRmcXZxR2N1ZFlsSnhHc1c5L1ZoNTFNRmw3Tm1Qc29R?=
 =?utf-8?B?VTk5bEtzM2lPakdpVGw0K2tXdkYxZjlpbXFhOHFKdmJlRHM2eThKb2Z5Skww?=
 =?utf-8?B?WWtUVzNZcGtnT3NqS0ZrcFhaUlFhMEdvV3Ywd3V6Yzg5c3VSOVhZQ05neURD?=
 =?utf-8?B?NEhpbjNzTzNVVkdDTlo5YzZxNTBQQzBOcmdyR2VaSVRGT0xtaTRYSFV5UEp0?=
 =?utf-8?Q?gVkkdtJ65u41QwUKkfW2WkQ2S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d796d74-6337-431c-78c9-08dab8ea96fb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 13:44:52.2361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e54rbV86xqx+qfLqWRlAz1j9/c3FtNq0EVzB6ijwgNu2XkaqnFclqy1WCGsG1noC7PU1ZUnLs3mdnNJbkBbdog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7291
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=yi.l.liu@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On 2022/10/28 14:14, Jason Wang wrote:
> We used to have a macro for VTD_PE_GET_FPD_ERR() but it has an
> internal goto which prevents it from being reused. This patch convert
> that macro to a dedicated function and let the caller to decide what
> to do (e.g using goto or not). This makes sure it can be re-used for
> other function that requires fault reporting.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
> Changes since V4:
> - rename vtd_report_qualify_fault() to vtd_report_fault()
> Changes since V2:
> - rename vtd_qualify_report_fault() to vtd_report_qualify_fault()
> ---
>   hw/i386/intel_iommu.c | 42 ++++++++++++++++++++++++++++--------------
>   1 file changed, 28 insertions(+), 14 deletions(-)

Reviewed-by: Yi Liu <yi.l.liu@intel.com>

> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 9fe5a222eb..9029ee98f4 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -49,17 +49,6 @@
>   /* pe operations */
>   #define VTD_PE_GET_TYPE(pe) ((pe)->val[0] & VTD_SM_PASID_ENTRY_PGTT)
>   #define VTD_PE_GET_LEVEL(pe) (2 + (((pe)->val[0] >> 2) & VTD_SM_PASID_ENTRY_AW))
> -#define VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write) {\
> -    if (ret_fr) {                                                             \
> -        ret_fr = -ret_fr;                                                     \
> -        if (is_fpd_set && vtd_is_qualified_fault(ret_fr)) {                   \
> -            trace_vtd_fault_disabled();                                       \
> -        } else {                                                              \
> -            vtd_report_dmar_fault(s, source_id, addr, ret_fr, is_write);      \
> -        }                                                                     \
> -        goto error;                                                           \
> -    }                                                                         \
> -}
>   
>   /*
>    * PCI bus number (or SID) is not reliable since the device is usaully
> @@ -1716,6 +1705,19 @@ out:
>       trace_vtd_pt_enable_fast_path(source_id, success);
>   }
>   
> +static void vtd_report_fault(IntelIOMMUState *s,
> +                             int err, bool is_fpd_set,
> +                             uint16_t source_id,
> +                             hwaddr addr,
> +                             bool is_write)
> +{
> +    if (is_fpd_set && vtd_is_qualified_fault(err)) {
> +        trace_vtd_fault_disabled();
> +    } else {
> +        vtd_report_dmar_fault(s, source_id, addr, err, is_write);
> +    }
> +}
> +
>   /* Map dev to context-entry then do a paging-structures walk to do a iommu
>    * translation.
>    *
> @@ -1776,7 +1778,11 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
>           is_fpd_set = ce.lo & VTD_CONTEXT_ENTRY_FPD;
>           if (!is_fpd_set && s->root_scalable) {
>               ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set);
> -            VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
> +            if (ret_fr) {
> +                vtd_report_fault(s, -ret_fr, is_fpd_set,
> +                                 source_id, addr, is_write);
> +                goto error;
> +            }
>           }
>       } else {
>           ret_fr = vtd_dev_to_context_entry(s, bus_num, devfn, &ce);
> @@ -1784,7 +1790,11 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
>           if (!ret_fr && !is_fpd_set && s->root_scalable) {
>               ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set);
>           }
> -        VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
> +        if (ret_fr) {
> +            vtd_report_fault(s, -ret_fr, is_fpd_set,
> +                             source_id, addr, is_write);
> +            goto error;
> +        }
>           /* Update context-cache */
>           trace_vtd_iotlb_cc_update(bus_num, devfn, ce.hi, ce.lo,
>                                     cc_entry->context_cache_gen,
> @@ -1820,7 +1830,11 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
>   
>       ret_fr = vtd_iova_to_slpte(s, &ce, addr, is_write, &slpte, &level,
>                                  &reads, &writes, s->aw_bits);
> -    VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
> +    if (ret_fr) {
> +        vtd_report_fault(s, -ret_fr, is_fpd_set, source_id,
> +                         addr, is_write);
> +        goto error;
> +    }
>   
>       page_mask = vtd_slpt_level_page_mask(level);
>       access_flags = IOMMU_ACCESS_FLAG(reads, writes);

-- 
Regards,
Yi Liu

