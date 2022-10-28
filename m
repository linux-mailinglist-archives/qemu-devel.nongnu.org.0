Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A35611355
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:45:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPfG-0004jc-P1; Fri, 28 Oct 2022 09:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1ooPen-00043U-Ln
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:44:24 -0400
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1ooPei-0008Nm-2B
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666964656; x=1698500656;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DhKPG/yMQwY9TTRkrleN3RWPQbBpNGBuispzpG3tmcE=;
 b=bmczPciv9nmDz4KvVNfUHSCMeL67ctf2iGvA3t22EVlwaXf7kT8n4imN
 NFBTzTSM2qkVr//RFbat2BhKigKde0wtKKDPxn0RvEACVWMt63K7mdOzr
 JU/DXLKfQ/1E6YznwjujVH0/PgE0L8kDy5vCfqiaDhNWdOcx3mCvcBlGh
 olrvHXzi2wmNLJ8ifpmlqs56ZrIqg009tgDI+xPdoYgndL1E42Yrbtr7Y
 fpZK1I+O6k+GPdSNoPvJClzZt2FcZqhuHto+o8Mcr0lpkoyJ6p9ywv3RP
 D2Ma4TUBxKe3TsMEE/8Qg2TgaHFlIjMTOox/Lken1DRWEJpt+7H/Hafy4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="306098852"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="306098852"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 06:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="738106525"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="738106525"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 28 Oct 2022 06:43:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 06:43:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 06:43:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 28 Oct 2022 06:43:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 28 Oct 2022 06:43:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkmgE8fASw1RAb5005EiLOpIFffcpXB0yhOhMWGWYTwWRGqkiJVxOABvRJ6Ll2RlSNv/e08bZel1Qmja7KqIo5pr4r44f9Yi6IeQK/pCdKGt0dqmW6NptkqeXAYNu/Kuyjus0IJQvdNvtHR+9j93ltQGYcpEv0z3pLAFi1L5zkjI0aXodVRlxRlIkqHubmFgX9sq5Wmh49rv47ciHCwHKgwLn6YsigNB6C/oA4xCiAnDVsqD6m9FFRmhVyJNctpPCASIHlehvku7nJ5LX/F7VEH2EehWzMbzxrnu/qjOXVSsB1Qi6r3xAGKMEqTOY6tihm55cFbfU9AhXXfyVM/kBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDuEosONPerX+PIlN12nKiFD01e3T6LBCA9NdSBW3hc=;
 b=ewccc92vH/peX1Ew263jxO90lfmC2v2Ji8YX7G3cCp58QPkhEsBQz7+9/0b+mcN2lH6ririt2owW7XjEYkj4oh2g3gQ9frzRXWubM+j8f2Y9LVXeNpnn5GvmY2IFLyTm8CG9S7vQ2hY+qylc8bpciiBMOoygCz87snHgE8c3YivscT9Pgrcvbvr8XX26PNaQ1hz5ILpTW9ibhGZZW3S5Zc507pZmYJwsailUengYcnDV1hXar+9VwCuMbEfpg18Dj4ygc3t3Z0amQ0ZPc0NXGhGgeBqmPPVizMp0b6Bv1mT8N1UAgdNzML1UB+sDairL6YXGa3BDKWqBhUdn4KFMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by CY8PR11MB7291.namprd11.prod.outlook.com (2603:10b6:930:9b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Fri, 28 Oct
 2022 13:43:33 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf%4]) with mapi id 15.20.5746.028; Fri, 28 Oct 2022
 13:43:33 +0000
Message-ID: <5c7178df-5187-938a-b55c-a2a472d991de@intel.com>
Date: Fri, 28 Oct 2022 21:43:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH V5 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, <mst@redhat.com>, <peterx@redhat.com>
CC: <qemu-devel@nongnu.org>, <yi.y.sun@linux.intel.com>,
 <eperezma@redhat.com>, <lulu@redhat.com>
References: <20221028061436.30093-1-jasowang@redhat.com>
 <20221028061436.30093-2-jasowang@redhat.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20221028061436.30093-2-jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|CY8PR11MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: 72b24d07-3fed-4548-8c62-08dab8ea67b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tkFB5SD5uZOHIuU1lilIJJgC07SXxak3ubzn1ijdBCv/hMtBBa/dnMcvqfQ/24MA1a0j/ocWtiQwnqUnxA3RoKCVPUpFZstX5ySDbF4RqvV511sLjeOiHvGYj+ryqiuDK1CNyp2E6FEOS0KwxpJTdFTNVY99zXeHY6gScgaodnbGnyYspPaLvmGC8Tf3o34y6P384QOZGUbEpCdB/a9dXMfC6U2uE4IGjZ3SFGHG++C3MHeSIHuPkL0fyqcK9jZZM5tTp9Wh7gac6QChzbKhvwGXuXrPDyFXwslI3bL+TclFRy3TnWBaB7j7NtT+spAEZN43ytOXj6g2F3Mx6byxXA8lqKSFEUVC08EIQeNI4C6s0OSatBjez++6X2nSpdXiz8McMIiU5BBoCI3/SDwxo2kIgh+PklvjCZG0+fW6R/XSglhcf2Y/zTelVR+3EjdYiXUO7AsydMG1LqcJzv8C+qtOoNgV/ggJVcGhETQH1JsAo7HE8zKntqX0CEvcCQAxwBjFtBfoFc9uNvCxX4Uss2PNpGRmVBWdz7umMmjiGx48HZ0g6jfFKal/xbDnApLCYAAL+dU8xusTGYZDC3UGdSY5OdB7etmM8L3LhoCEZGzFXBrcwmhREiuJLSijAwC9/3pOg/5a5Gp5KREMwhAqNA+jU6tFtc5g2aOyfRNZUMFBzSFsmE+APyAcidtcWWZcytsoLAojCzsrhteEEgyQzs+YlJAVsMXJTEwrIDTXUrPXWTlBE9pZsltd2YDawvbCbnor7jtwJTnD+TMZxZzRWngFZcR8ti6YKfkGdwqTnVk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199015)(6512007)(31686004)(66946007)(36756003)(31696002)(2616005)(83380400001)(2906002)(82960400001)(38100700002)(6666004)(4326008)(186003)(66556008)(66476007)(6486002)(26005)(53546011)(86362001)(316002)(6506007)(478600001)(8936002)(5660300002)(8676002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU1kSDlobjlud3BPRFk4Z2EwdFd2ME9mN1pQckNrejM1NWRvSFFZVWpFMDBV?=
 =?utf-8?B?eWZtQTdiNTNxbGU5ZHQ0YTdORHpBZkNMTHZuQWE5bHg5VXFkaXJTaUMySkp0?=
 =?utf-8?B?cXlySThvZmhmOG9VUi9XM24vakFrZTdsMTN3QTdXUmtmZ0Q3MzRlK2toYTd6?=
 =?utf-8?B?dVdnZWZrcWNmbXpKanVkaGdNdXMrdStGaS9BTTE4eUk5OE9kMjArTFVzeHhN?=
 =?utf-8?B?dTl2WEJPZENmZkRTNDd5QVhVVXJpTXdsWTZzUnFuVVV6Tng0cjhDaU9rclVu?=
 =?utf-8?B?dzRYb3ZCNTdZRnp1emhCSmFyTng1a3p3S0lJQUFYQyszVnAxWFo1NVcxc3du?=
 =?utf-8?B?dHgwc202MHlid1dFOW5DNjFmSkdhSFIrZHh1Q3M5MmhnSUxKdmJ6NjhFZ1Zi?=
 =?utf-8?B?RkF1cnRpcVFWcHlxS01tMGdReVl0Zzc2L1pKYnZHc1RzTEIrVGdkZTVHejIr?=
 =?utf-8?B?YWdYdFNMN0dwc0wvQjYxQ3BXbmZLc2FabkpHaytZellRamxWK2JyL0JaRjRx?=
 =?utf-8?B?VUw1a054OXFmVTNsYlBDOUdSeE56VE5BQ1BvVFdIZU42TWF4aHpaNERmZ1dP?=
 =?utf-8?B?SnA1REp2OWVnYXBtSjJVZXJXdVlBMFNuNVdMOHpXMDNtODR6bkFNUG9SWW1R?=
 =?utf-8?B?RWJlR0NWVHExd0V3RE9YdUJmZkkwVFE0ZnA2bWZ3UXF4WDcrSEd4Rk1QeWI2?=
 =?utf-8?B?TVlqUS80VDNGNEtGb2c1RHoway9La2JnOFFvSG5IeGFNYU5XR1VOOTdMbGtz?=
 =?utf-8?B?SUEyYXVhY3k4M1ZzdEgyNGZ5NFUwVFBpdzR2bjU2K01lOFZnUlZ1Qi9rVUJL?=
 =?utf-8?B?cjE2L3I1bW8rdS9aZG1GYld2UmNENlk4NVIwZ3RWWFBXTVA0MERqdytnaWVV?=
 =?utf-8?B?ejlObUNIOGlwbmtLSzduekVmRXhjYUh3V1IrYmZKMzVFdnliS1JvUFNYMjRI?=
 =?utf-8?B?SEFZckl6cGFiRVZWaG0wTEppUi8vdUVzMFAwQVRuV1YvRkoxaFZoL0VZRi9U?=
 =?utf-8?B?bWgyNGx4dlFlVGtETE5sU2QzSUlWd2VYTlNDSXNwYTZkTHI3ejFFbHhSbVU5?=
 =?utf-8?B?VlhGQ3dKaEZRc3JJdjZFZUZkWkI0NDBiMFVVYUxIRHBSbFk5NzNNMDVwMlg3?=
 =?utf-8?B?VGdsTWhSeHYybjlPK2tPT3dEajk1MDhnNXV4K3UvK2FENExZR21JK1NMdW1B?=
 =?utf-8?B?Z0VSZndJckhrYlBLVkdJL1JveWRheGtsZ2RWcEhvL3V6OHZkbDFqdWZHRDYr?=
 =?utf-8?B?TXRWRi8wc3JpU1lmSDlNZno4Z05pM3cySHdBRndjYy9FRCs1M1F4ajBpMVQw?=
 =?utf-8?B?Mi9QU29wNFgwSzR0cU0yV1M5ZkFnQ0dObnpZYTVIak4zV2hVVTYwTGJXT2pF?=
 =?utf-8?B?Y1FLTW00ZmdxUzVpK1FMZlNuVEhoMGFJUWs5ckJvOEtZSk1PTUZQRkpvSjBC?=
 =?utf-8?B?NlRXQnBocW1tOVVkdkdXbGEwZTU1QkZhQWpHNi9EN2tOQVdSWWZwRFpRa3JC?=
 =?utf-8?B?RU5iRTl4UWxGNHcvNzNpNDRvZ1E4cmExUlY4czg4RkRmaEFyS25FdjZ2aWtr?=
 =?utf-8?B?ako1VHlDUHFrQWxJTno1eHJCdldkZ1IyL3B0TFBmbjkwMXVXdUhIWFZLVGNZ?=
 =?utf-8?B?VVEzTWorOWhxQVlaTklmQWZNNm9MUXVXTFBZWTFyYUhzb3lTMk0rYTB2M0JR?=
 =?utf-8?B?NVNldlorbkpzT1d6Nm9CL0JLY0R2amtGb2d3SlU3ZkU5b1VDbzVoYWdJTkti?=
 =?utf-8?B?alpQUDMvZzJDVzdxVEVxQkJqL0hNOWMxeGlPMUcwWlloa0FVcmM0K1E2TG5Q?=
 =?utf-8?B?UlFNV0cvUFFNeE0wc1B3elRCTmkzSVlWQUNQUXhqTnhqMEVnMWRSMmZIUERs?=
 =?utf-8?B?QTlka2FvazNwbHFveXVHc24yUkZOVU1pQlZ2V3ZGME5RNDNqL25uZ3FaSGRr?=
 =?utf-8?B?ejR0dVJJVDVrMTUzSWN1TGgwSnh2cUN2VDl2bWJITW9IeTJGS2hXa3dPb2pa?=
 =?utf-8?B?TlNpU01NNGprSmpLQjRuemdCUFJEblZoSDlYZVk1Skhla2pLZmszUk9CYlBK?=
 =?utf-8?B?RXZKci95K3JvTEhWeTB6VGhMLzBUeU9aNnA3eXBha3NzZ3duYld4WFk4RFpN?=
 =?utf-8?Q?BIF38/hQCDDkW0En36X/kXhhV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b24d07-3fed-4548-8c62-08dab8ea67b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 13:43:33.1291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoqk+vji16/Ruz5uXvr8y3+XJj4y+hUa0udrj5NlIUI9JOJJXDN6lRfAJxNm4K5o7mZ8mQha+92tIttGu2JOcw==
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
> We use to warn on wrong rid2pasid entry. But this error could be
> triggered by the guest and could happens during initialization. So
> let's don't warn in this case.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
> Changes since v4:
> - Tweak the code to avoid using ret variable
> ---
>   hw/i386/intel_iommu.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Yi Liu <yi.l.liu@intel.com>

> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 6524c2ee32..271de995be 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -1554,8 +1554,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState *s, VTDContextEntry *ce)
>       if (s->root_scalable) {
>           ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
>           if (ret) {
> -            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
> -                              __func__, ret);
> +            /*
> +             * This error is guest triggerable. We should assumt PT
> +             * not enabled for safety.
> +             */
>               return false;
>           }
>           return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
> @@ -1569,14 +1571,12 @@ static bool vtd_as_pt_enabled(VTDAddressSpace *as)
>   {
>       IntelIOMMUState *s;
>       VTDContextEntry ce;
> -    int ret;
>   
>       assert(as);
>   
>       s = as->iommu_state;
> -    ret = vtd_dev_to_context_entry(s, pci_bus_num(as->bus),
> -                                   as->devfn, &ce);
> -    if (ret) {
> +    if (vtd_dev_to_context_entry(s, pci_bus_num(as->bus), as->devfn,
> +                                 &ce)) {
>           /*
>            * Possibly failed to parse the context entry for some reason
>            * (e.g., during init, or any guest configuration errors on

-- 
Regards,
Yi Liu

