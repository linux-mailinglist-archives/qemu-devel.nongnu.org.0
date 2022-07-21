Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFE857C1D0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 03:06:38 +0200 (CEST)
Received: from localhost ([::1]:41304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEKeD-0002jM-F1
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 21:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tina.zhang@intel.com>)
 id 1oEKcD-0001HV-AQ
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 21:04:33 -0400
Received: from mga01.intel.com ([192.55.52.88]:33772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tina.zhang@intel.com>)
 id 1oEKcA-0008OZ-Ab
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 21:04:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658365470; x=1689901470;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+5d7mxyZ/YIKIKKsbCdEm/JoR2C37hrPE1o1tB6CIig=;
 b=OB7hrdL2z+xZQi/hhDBlPvJannotXh/Mv822WKOLTfL8MsSCFDrGLYqR
 nwKO7mAut2HvAmhYOprCCsXccgbFVcTMwTymFrzqvhl5gd+QQOHVj+nCF
 6ObBjR/pJoWODBprQhHOXvhmSZNv1Hm7LWgdJvE1RoXKZRggE+gKCxzef
 uaTCK+P9fT0MgWDMLgOUWu85X+LpgDZWCC7U+V5QAKUFnfSz9FDxw3Wu/
 wdqmd3YGenDF9VCYMy0SeEb+ik1Bts5a/pki90O60UNcKDgPioWgA4aLU
 g103qiiB4VvmLeiOA3WPErenLKHbPOj6v16T89LNFkF71naNbtdQYwrg4 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="312628853"
X-IronPort-AV: E=Sophos;i="5.92,287,1650956400"; d="scan'208";a="312628853"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 18:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,287,1650956400"; d="scan'208";a="844238265"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2022 18:04:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 20 Jul 2022 18:04:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 20 Jul 2022 18:04:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 20 Jul 2022 18:04:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/Cw9yXijwNZk/GxaQiMhbq5C1TKrDVHMPoZVLk13XZJZWn8MB+a889oiZxtlkggY6NeAjZS7A85OJmX8UUnMROMiNsBwgAA9XqIP3Ntw6Tynz4pIIgU/88gyesDuozcuAEQbdKHMhXPJEDr/e5+YyftNOhSzKd2BeuYsqCAysEjGb7RjFsSmRfNjPE1jrzvvLHmySaMBNJ7AKFyQRNxOJqrNvRBUojUNweRDLwbwBr/mO933lBfzBuFJa6IC+J4GBTVUnjFp26B0muYqm1/VeCyaBjLAgW/Ga3PKrvfj6SvJsAWO+3udS/6SvAxjjKzHwW74wd+QpEyFb70HpvHpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5XZ9P1ediFFUIQi9xIc9bI1bPSIGhEb2MqY0ucMbBc=;
 b=EzNlwdxsZhZVi+YXHoLQom2JQSFSvLWuOaOgVn9xZmxGVM+vveHWtYEwOAw184pue49/rmc8+Wt08HggBmDqBE2MC+sXi3qYBdOpxcfko1wukGQjfado60zA2exAIKOegWeK6OqaHFEdqqViURXK9LZYqwH8nuYTVhl1XC4tyIx9T69iIh9KdMNTBnAIQI9ARUSXXg77w1WallohvItrKPpnc+oe6sgBkzHLlSan+7CZykH8i1evsWt0Y3h9AVlYHgZDvgYC/00Vg6UXqq5u6zHOJCrgJNraPsitWb6yIgDJUuDEi8pOwIV5ZFSYrKDRNvJfW+fsUXZ1a+jEUxT65g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW5PR11MB5881.namprd11.prod.outlook.com (2603:10b6:303:19d::14)
 by BN9PR11MB5468.namprd11.prod.outlook.com (2603:10b6:408:101::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 01:04:05 +0000
Received: from MW5PR11MB5881.namprd11.prod.outlook.com
 ([fe80::d0ee:e2f8:e7b0:e24a]) by MW5PR11MB5881.namprd11.prod.outlook.com
 ([fe80::d0ee:e2f8:e7b0:e24a%4]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 01:04:05 +0000
Message-ID: <081d6f0c-0499-c6f0-f546-e5425c7ee336@intel.com>
Date: Thu, 21 Jul 2022 09:03:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2] hw/virtio/virtio-iommu: Enforce power-of-two notify
 for both MAP and UNMAP
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, <eric.auger@redhat.com>
CC: <mst@redhat.com>, <qemu-devel@nongnu.org>
References: <20220718135636.338264-1-jean-philippe@linaro.org>
From: tina.zhang <tina.zhang@intel.com>
In-Reply-To: <20220718135636.338264-1-jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0122.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::26) To MW5PR11MB5881.namprd11.prod.outlook.com
 (2603:10b6:303:19d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c0655d0-6a1a-49a9-4cb9-08da6ab4e817
X-MS-TrafficTypeDiagnostic: BN9PR11MB5468:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ++LYlYwp/h1oYqBld8Ta1Jj9oMj1XnMiof84uy5J9bTZEhl4TfHM+hMmRY5kMLWRluXc/Zce5Fe5+Pbw1EyrPeuTFkbtd/45xOkXa1ixE1F3CQFYLfXs+zwENPcjE8jJrs8IPKfxLsywRNPfzwoBCiBiSWkcdZTZV4fRfbME+f1QjBUTaB4oiIdy2UkYbbFC3vbtME79zrBzCiSSENooQHt2Yyjo06Yx55QBXgzBXmHM+q0YbKpjQvFJLm7xvdM0d3WXCLslckBXHoSYDA/LtTDjRAFTSsdikCJCSjD26MfRV5mGrAYL8u2dcZpVZOGa5NuHc9HOOHweBqglEhQ8sS30zlZIvcYozfCZ3NNoCEJwMHK+EH7+V24+gtgGYF3Cp0DZZsgyJ/guGwibS5yZcUTudP3B5edsdpshmTLi+13PJqboKJH7roNljv2VP0VLbObbMyEvGsZrIHS2QsUgHZCklFrUaIycdRaqMPqA8Rvy3XsSL6ng+zFrOr3dNse4H2pj6FB6kHzXii/AHu9k4c6dz5jugO2f1PHrVQ+kg83wt53G8if43/JSH/M9DOtVmDIOwlAbopAXM0osmBmeRddDcC/86Jx67WQv86sGqn4EozPjgsMFWnoUePmJwapOFEd8gRcN1WnFk0TgO1vjW5fwwrzkhp0h3qT3kA3Bz3nmkkCAczDc/ptMKXXbAsEEc6VJ5Zd6+b3lgAj/HWQG0paxlgXRsi1rY175fiZyBQODYJrRhj1QtTRWzSC3dL4+PGR6F92jxwvMxuar29WW8zZ4YCNaIO7rFEoIJ3qiDNj3TVW2pc2hNWNeiRaPeKi2xrGFpM9CJj64n5UsoXm2KdqWod22YOP8aSE29emlrdQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5881.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(346002)(366004)(376002)(136003)(316002)(83380400001)(66476007)(2616005)(4326008)(66556008)(8676002)(186003)(31686004)(31696002)(6512007)(36756003)(66946007)(5660300002)(53546011)(8936002)(6506007)(6666004)(41300700001)(86362001)(26005)(82960400001)(966005)(2906002)(478600001)(38100700002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGJZTjNmSzJnOHYvL1RJSnc3UWxab2poRUI5SVN3M0krYW1vR3JzbnJrUnU0?=
 =?utf-8?B?YzQwU0U1VytpelpGK2lOUmpFQksxTTRROWFKOUUyZUhpaHJSRFdvTk5EMzhs?=
 =?utf-8?B?RHBOdDdBZ1JWSURxcVZIWU9mMG1sWEplTlZ6QmRhMTNBVE8xcmdjK1BSU2NX?=
 =?utf-8?B?K25SQnhxd2RhMzZ5ak1lY0Y2cXU5SFRQWGtrWWdOSURDQmp1ektDLzh6NmZF?=
 =?utf-8?B?Q0NwMURNeTkwczl5L2VUM1lKYk1CYmpjUm1qRjBHbCsyNEdsMFBCcUlvMG5O?=
 =?utf-8?B?QlhnZnpseDhGL0gxR085anlkQ1VieUZjZE5WeHBjYm54QUhWeFIvKzJ0Wjdp?=
 =?utf-8?B?ZjdycVVnTkVGOG13bFltK2ppMmRiTVpKcytaeXJkTjN3M1ZNS0IxQisva29J?=
 =?utf-8?B?azFXTjVnam9YWlUxQnRNZloreHZZa2lBYnV1eGpHSEJnbzdjcnFZK1pBRVJF?=
 =?utf-8?B?UzlsVnl2SVF5SUlTYU5GUitJM05nbC9OMk1EaGlIdnJGeHc2cXJycUJTRGxK?=
 =?utf-8?B?SXhtcmQydDZLVkozNTQyOVNVaDJDeloxeG1rMkVEQ3VJM3pETm1haElRWjk4?=
 =?utf-8?B?UFZTL09oTFBhL09oaldpTXE1VlN6cXZwU2RGeFJGR09aUU5IaTE4ckdOSHVs?=
 =?utf-8?B?MUFuaEsyTXBsMEhtY0c0SjBjdjBDZ3NYRUVCWGdMYWpMem5NcGw1SFArMmpH?=
 =?utf-8?B?UnVNMXNpbXpFT0NKTE5MR0NyOGtVUGNaUE5OWEduNnpQMDJyYndkMllkWWV6?=
 =?utf-8?B?WCtNR2FTNHdlQ3pGTG4rM3NGSDk1a3ZobjVRa3VzWkI0eXM4SmdBckF6MXVt?=
 =?utf-8?B?SHIxUjh2OElsQ1hMNHJGdFFQT2VVYWV6MVJlcUlaeURYUFZHckRJRjJCNzdq?=
 =?utf-8?B?d1NzOElOYUtoa1lRSGpjR1pOa2lBWnNzT05pNkdjUlpMeUtlWVI1SVZEL1Ay?=
 =?utf-8?B?SHVUTjJlRkoxemRFUEkzZGk1bTFUYlo4bEVPRU5jRnJWSXVYQXFiaEhUWFJG?=
 =?utf-8?B?Znl0cjhTdDV3bWczcUx3MHZyUVprVCtVUHpEUW0wcGgxWTMwcUpYQ3Y0aXRE?=
 =?utf-8?B?YVJ6Y1czS2twb1ltaWdhWmdSS1FwL01SdDVPZmZXMVI3cHJ4azVGMUo4VEhh?=
 =?utf-8?B?Wm90MWtQYjI0SVhsQnI2blJjOC9xQ0t1OHBlRGMrcUlJbWNaVUxsMENJSWZE?=
 =?utf-8?B?WHhrS0V3OHdjbjQyY3BJcFhTd1ErSVR1S0hQcGZmdFkzSVBVQS95Lzk5Rk5Q?=
 =?utf-8?B?Rml6YXB2VVlPYXNDemJZUjNxQzN3dGprb3NwcnI5Zlh2bXF5WjBoRk5kd2VK?=
 =?utf-8?B?RUIwdVB1TENTMmxNSnJaNDhSQVhTU2FZN25kRC9xSElia0NlMGp0MVJJU2Ur?=
 =?utf-8?B?T0N6Wk1nVk1RdUo0OGVTaWkrdEg1d2YySWxmMUpjZGNCZ2ZZd1BCcUJ6K1Jl?=
 =?utf-8?B?UkxpbmZHVjNBMEpxeXhYUzlweHozWGtSclQ0ZGlVY0JlV2F2Rkl4eXdLcytD?=
 =?utf-8?B?Z0ZVZ0ZycG1FRTlKTHV2MWJ0T002d1VPNkp5a0pRc0JENTFtWlV2TXNnQy9o?=
 =?utf-8?B?QWtJa0N0VzZiZ2xvYm0ySXgvREZEQityY0NER3dHMWtNeUFua0JIYnVQZG1y?=
 =?utf-8?B?YjJTelJzOE80NW0xcFpVNDFJMEhvbWg2dlZINkVaVkF6M3BjQ2xuRkRzZHJS?=
 =?utf-8?B?bytQRjMvRC91MVlEcUpTcG44QmVucm0wUGVwNEpkd0NSemo0bCs0QUZsWTBz?=
 =?utf-8?B?ejAyMDQxT3FDVVNuaEtiRXRIcGFINXMwR1lTREIwZzhzRG9PaEJSYmRlWTl5?=
 =?utf-8?B?N3JYVnEyZ3B6UGcxZVU3ckhxcFd0ZFd2L09MUm5JR3g1alIvLzJvcUJoK3M0?=
 =?utf-8?B?dUpLM1FXNWpnWWJHL050QzJwR2xSdDJzU0txR1lmMDY5czFtUkVVdW1qclNu?=
 =?utf-8?B?V0FTaEJ0WjVzdW04M053OGJuWTd3TEdCa3BTeDlwdXRwYk5IS1k0VHk5K1Jj?=
 =?utf-8?B?bENOKzJLd3QwSk5rK2RTNjR4T2IyKzlxNGh4M2d3YVZEN3RJVWllOXJnUXpm?=
 =?utf-8?B?cXIydjVLNXI3Yk9IZTMrQ0s0TW9pciswN1hSNTVHc2VZZkVQd2JTUFI4eUM1?=
 =?utf-8?Q?D+uP46ziGgBNBfKaDUyRYzEVw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0655d0-6a1a-49a9-4cb9-08da6ab4e817
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5881.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 01:04:04.9514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6obx1lUJ7cbwkGI6iDjaBBEruf0ujONvK8O9md1DRCOO1D7Pmh2prMa4+SXt688fVomn2FzcJ13dD6kmcbb5pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5468
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=tina.zhang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/18/22 21:56, Jean-Philippe Brucker wrote:
> Currently we only enforce power-of-two mappings (required by the QEMU
> notifier) for UNMAP requests. A MAP request not aligned on a
> power-of-two may be successfully handled by VFIO, and then the
> corresponding UNMAP notify will fail because it will attempt to split
> that mapping. Ensure MAP and UNMAP notifications are consistent.
> 
> Fixes: dde3f08b5cab ("virtio-iommu: Handle non power of 2 range invalidations")
> Reported-by: Tina Zhang <tina.zhang@intel.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Tested-by: Tina Zhang <tina.zhang@intel.com>

Regards,
-Tina

> ---
> v2: correct translated_addr increment
> v1: https://lore.kernel.org/all/20220714095418.261387-1-jean-philippe@linaro.org/
> 
> ---
>   hw/virtio/virtio-iommu.c | 47 ++++++++++++++++++++++++----------------
>   1 file changed, 28 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 281152d338..62e07ec2e4 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -197,6 +197,32 @@ static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
>       }
>   }
>   
> +static void virtio_iommu_notify_map_unmap(IOMMUMemoryRegion *mr,
> +                                          IOMMUTLBEvent *event,
> +                                          hwaddr virt_start, hwaddr virt_end)
> +{
> +    uint64_t delta = virt_end - virt_start;
> +
> +    event->entry.iova = virt_start;
> +    event->entry.addr_mask = delta;
> +
> +    if (delta == UINT64_MAX) {
> +        memory_region_notify_iommu(mr, 0, *event);
> +    }
> +
> +    while (virt_start != virt_end + 1) {
> +        uint64_t mask = dma_aligned_pow2_mask(virt_start, virt_end, 64);
> +
> +        event->entry.addr_mask = mask;
> +        event->entry.iova = virt_start;
> +        memory_region_notify_iommu(mr, 0, *event);
> +        virt_start += mask + 1;
> +        if (event->entry.perm != IOMMU_NONE) {
> +            event->entry.translated_addr += mask + 1;
> +        }
> +    }
> +}
> +
>   static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr virt_start,
>                                       hwaddr virt_end, hwaddr paddr,
>                                       uint32_t flags)
> @@ -215,19 +241,16 @@ static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr virt_start,
>   
>       event.type = IOMMU_NOTIFIER_MAP;
>       event.entry.target_as = &address_space_memory;
> -    event.entry.addr_mask = virt_end - virt_start;
> -    event.entry.iova = virt_start;
>       event.entry.perm = perm;
>       event.entry.translated_addr = paddr;
>   
> -    memory_region_notify_iommu(mr, 0, event);
> +    virtio_iommu_notify_map_unmap(mr, &event, virt_start, virt_end);
>   }
>   
>   static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
>                                         hwaddr virt_end)
>   {
>       IOMMUTLBEvent event;
> -    uint64_t delta = virt_end - virt_start;
>   
>       if (!(mr->iommu_notify_flags & IOMMU_NOTIFIER_UNMAP)) {
>           return;
> @@ -239,22 +262,8 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
>       event.entry.target_as = &address_space_memory;
>       event.entry.perm = IOMMU_NONE;
>       event.entry.translated_addr = 0;
> -    event.entry.addr_mask = delta;
> -    event.entry.iova = virt_start;
> -
> -    if (delta == UINT64_MAX) {
> -        memory_region_notify_iommu(mr, 0, event);
> -    }
>   
> -
> -    while (virt_start != virt_end + 1) {
> -        uint64_t mask = dma_aligned_pow2_mask(virt_start, virt_end, 64);
> -
> -        event.entry.addr_mask = mask;
> -        event.entry.iova = virt_start;
> -        memory_region_notify_iommu(mr, 0, event);
> -        virt_start += mask + 1;
> -    }
> +    virtio_iommu_notify_map_unmap(mr, &event, virt_start, virt_end);
>   }
>   
>   static gboolean virtio_iommu_notify_unmap_cb(gpointer key, gpointer value,

