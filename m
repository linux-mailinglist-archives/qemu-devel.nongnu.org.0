Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294AC60F8DA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 15:17:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo2kb-0001I8-Ep; Thu, 27 Oct 2022 09:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1oo2kE-0000qm-4W
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 09:16:35 -0400
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1oo2kA-0005nk-W9
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 09:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666876582; x=1698412582;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nExck5KnvAttRBJqv7DSmqLpePq1rDbWQ5jnn/EwMws=;
 b=N47mFXONcGFf57Ks4NgRanBF11HY2kX53jDuy06z6jA+eOxFlVaAQ2ZN
 4Sq5ltzVtNSfAaDqKJLWXuPJru28PCpjusDHc7QtMbqkgZt9gKHVsia/k
 QbRlF3/4ORy0T6ESo8CeUc1t5rEu9qCc0PPFUP/+hZ9lzc6j0MJkF7LS2
 Aaufn+ZwRbVlVTPetjuu3ftB/MtyG0EsZ/zVEwBcHfxlCaMklaTeTpvZ1
 I5H1vWJ0tHDz4Nmbk8hWMxgE4s4Ub3KCdC3aMbImayKOxr6cCr5tG+4oC
 kLzlZIPjz6XxmoNkY1U25DXxp9n5i3U2RhZFBPwOjhOoHZZaswynZ3/YX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="287934626"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="287934626"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 06:16:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="757695049"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="757695049"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 27 Oct 2022 06:16:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 06:16:16 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 06:16:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 27 Oct 2022 06:16:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 27 Oct 2022 06:16:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2Y+I4k6CYvM3/xzv3dA3Ldyn60eU1+bJC0NDpIGaUi8Agd+x74txXP/c7WXl5uqkR3kECxE9RFri4cVSju5Ew+moEfQkK+ZjfGyJC3l34D74aKdygeoMqKSeojjgDtxMtbYqoDd3tuFoVWQm2AsgTKexL217Kfuy1+6q1ngcu1w35GGozN7gaGBALFMzdjg73zcmADAFpHP1ELcyfYUSIdWM395XwwKBgxkXZWw/B4ZZpZya2Dldq1YZ78OmzT78nQWDZTUPP19+VsFL+oudrHDaCvmzpGTRMqPs5SbQFahagb1292CQQA74/nPHSFEYg5jm0LH0uimtWYrHUZI+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJDRiAkGz+hXdTDbajRKpMDv2JAy4A0i4Fw24XNmmKw=;
 b=kotSx3jts4lf42w6yKO4NkAEz5jUD2Nh1zqbCviUxRv1NE8/5YkUIg6y+Xhm/apM4GNJFijm/ITfwGqdx6GVDzCvWWjhb0N8IRFPXJ7UNrXiVf/aqUWu1zyxBeW7EDIyOd6MYdmc9D1ILGs8VdDT7uy86gtlu+Szj4YCa0iLPoDJcnnuq58EXwMHrUMDmv96wSYMI23MUTmVGoSByn1XkGyjJh4XSJNOYs9tbHCPOD3OMma/26xI7OtCmThsjREDHpHoX7hGfHmNCD4g0oBwv7Fs/zu2bXewJOEFAjfouY0ezx57x1VaaGLluagbyCbldrK9oYoee2Y2R3B1oTBa7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by MW4PR11MB6691.namprd11.prod.outlook.com (2603:10b6:303:20f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Thu, 27 Oct
 2022 13:16:14 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf%4]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 13:16:13 +0000
Message-ID: <7b0c2ff0-f516-aec7-40db-86b2dfb2c653@intel.com>
Date: Thu, 27 Oct 2022 21:16:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH V4 3/4] intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a
 function
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, <mst@redhat.com>, <qemu-devel@nongnu.org>
CC: <peterx@redhat.com>, <yi.y.sun@linux.intel.com>, <eperezma@redhat.com>,
 <lulu@redhat.com>
References: <20221027075042.16894-1-jasowang@redhat.com>
 <20221027075042.16894-4-jasowang@redhat.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20221027075042.16894-4-jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0186.apcprd04.prod.outlook.com
 (2603:1096:4:14::24) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|MW4PR11MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b4f2df-39da-456c-a2d2-08dab81d6c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ga/t1BIFh9XOYLHwowPHsNsUqRA1F7rCZfTV5nLP3V5/RdgerIq+fBwONYFGDwlnqegBEH4BpNbQ3OjucYquLMS+KOmUuJ41vt0Xl52psq2wdJoN/Ba9yp9grgL5Aos7HaKkwaocB51M8i+/Q2dp5ac8M8jFcjwEfI1BEpsZhM9vsM3fu77Qahjz4cG05OA1Cjp7ksdG2v14x94GIySYdmeCrs0ARZJZMWl1Bg7+IIL2O4EW6JD0EbG8MqcssJ45gCj4TZbcSFjj+Y2tOVJt7gVJ4tbK02S322N3WAtz745YLjB7w2hDA6VIbxG8l7gfb4c7k3rGo8dhR96BHOKUhuhWXjjvpSnvrdyiN2uZQTm+xb6qEsZhqbKCrtlPrpMaYeHZ3CGzXLiBvhy3ctX/yB5oPG3GSbrTb561TvUwfb080+YvYxg4idfC+Vr2YeKVrqDluzUqE12r7uoN55roMtEQtn6t2GIx/HnIiWstQoJ/ywfydJNL8cDA0d3klNDO8S3DglD/DADXwP+pWaeWFs4V4gWzaSd74bWcHOzL0DVnHPVNgDxtPwQSf1q7l5Z7L2FEsrn9E4KfATbVjTqYLLHG2fM8LvsdC/nGHLTOKDwn53Lhi73cCjQCNe0xJut/BJVH4eNFgCUpwLTkLOdmNQjLmKka8Nx+tnyzgYc2UJJVHyWgcr9IE3hRA8gcjumhUiMUzfaz8Xd4yrQKGg3u7+5HdxVe8KhOHzhD7BB8blzooGLU/dRq19I/qvxXOwatWJj8lJzF0CxZuhdIhIgSgRHrtQFBlSja0SO0lt621og=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199015)(36756003)(86362001)(31696002)(31686004)(82960400001)(38100700002)(2906002)(186003)(26005)(6512007)(6666004)(478600001)(2616005)(6506007)(83380400001)(53546011)(8676002)(6486002)(316002)(66946007)(66476007)(66556008)(41300700001)(4326008)(8936002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzRRMERXcHNYLzc2Y0xMNk4rb3VEWkxWSHVNeHNsdlJ2L2ZXWDZHbUtWRVd6?=
 =?utf-8?B?RWswRXBhRVFqM0lROVM1ZzZLUFc1d1g3VEFIVmlpcG5YRTE5U2twcGN4OTRW?=
 =?utf-8?B?U3E1NzdxWmhua0JYNnhWNDNZZEJMQU9QM2RoVUlFMkRxRmY3N1E4RHZhUm05?=
 =?utf-8?B?RGlrdjR6MXB5NjQ0MFBTbGdPN1EzM3VMd2dHYTZKeDAvUkFNWXpsK1hyK0U3?=
 =?utf-8?B?Tm14L0NNMklwbUNGWW9PSUNjRktMTWZoSG9pUWVzaVlZTUhhZnBBeWdFR2lM?=
 =?utf-8?B?YjBRd2tYdVE5K3lqN2R5YWIrQmxDL3BLTnFBLzgxR29sQjlnS3VYY1NPeEk0?=
 =?utf-8?B?Y0Z3Nnoyb3pEV1Y2MTlXbDhKSnZONkh5SEIzbmloS1MvZERSWFpIYkFxSk0r?=
 =?utf-8?B?NElDbE9hL2VTUlRVZWM1ak1iNEQ5ZU9pY2U1bkM0RG5ob0ZoOGc1Y3R2eTI4?=
 =?utf-8?B?VHRTbkF6R2k2QW9IV3I5M0lyWUJEaG9KRE5GQjRQc01UMGg2OWs5a0VMTERj?=
 =?utf-8?B?eUZmdTVyYW9jWGJSeld4T2VqR2FHZmpmNEtURGVXbFZsYVlUTS9sV0VrVlVs?=
 =?utf-8?B?WkY1cXdaYnA1Ky9YUEhoWGllS0kzZkRnWUhUc0QxakIzdU5SaTljd1dVVmdz?=
 =?utf-8?B?cUlQakpJcGkzaDN0dFk2bkxtTk1nVHNZMER6ejVCRTRGMTZVcjZFQ2todTVk?=
 =?utf-8?B?dHI0Q2cydlFtRWhEUUw4dW9ib2JqczRtSVF1bWFSVEdYbkVJaDlLOWp0cjVw?=
 =?utf-8?B?R2JKTlYyN0ZpeU92TDdpbHFaSEtRWTdFRGxzd2lWQWRWaU5TVlFKT1RNd21D?=
 =?utf-8?B?Z0YyMzZVT1IrYXlaLzYra2FoQjloVmFra0NyZnR0cHhzeWw4emJ5N2dBN3Zs?=
 =?utf-8?B?WFQzMGpXeFYzRXFaNXFhM29iMkttMlcybTJVY0d6WHUrNnF3a1JvWjZUMXoz?=
 =?utf-8?B?M1FkU0pLMTEvV3pFVW9HbG5TZllNZGVjREZ5V0ZHdUl3OUVRbzN4STVLejFQ?=
 =?utf-8?B?U25FRzh5ZndXUFNRYVBFTEJiR0pGQmJVYTVxTXVrUmRPWERYMzJxWjFkc0FL?=
 =?utf-8?B?bzBQd3phL3VoMlg5SC91NkpYaFNpNFRnM2hzMldPRnBwNi9EWXZWZXA1QW1J?=
 =?utf-8?B?RGEyNzJwUkllKzYyT3FLL3JoUG5hU2VUdmhkcEkrRUpUNEdvOGFySTcyOXcx?=
 =?utf-8?B?NmdUajB3bGZlcTI2eWM3WDlFTDZEOHhTVm9MazNBV09iY08wa2RBV0ZkZ1hO?=
 =?utf-8?B?VzRLdTJleWVXT2dJTVY3Y0o2TkpKdmd0cWlWS3k5cUpHNlhlMXRkYUgrTjFi?=
 =?utf-8?B?dHpMWlYzR1NaN2gyQnBvSEY3NDhXSWlPN3lJQ3luYmlNNnFWYldyMTVaazdp?=
 =?utf-8?B?cFFpWG44T0dqWk1lNEJNK0tkOTgreUNwR2RTNjd4ZTB4alVPdWVlcHVMU1Y3?=
 =?utf-8?B?N1pnNWdMazZZOXRaejk0b25PWUZIbHdCVmF3cVg2T2dFRDE0S0NxRzRnNDJ5?=
 =?utf-8?B?YjBMYzl6V3pyTlhxclI5RWhyRjN3M0NlTzJFcTM4T2RMbkI4cmc2UEtXYjJC?=
 =?utf-8?B?ZWszMG4xMEhuZmxsaVp1S21rNVRZaEhqVjNtbEUwbkZ6RzJoOEpXSDVOTERx?=
 =?utf-8?B?Qnh3S2xGaHBzL0krOGRqcUJtRlBkaEd5UEIxYit6TCtKT1IrRmo2aW1HL1F1?=
 =?utf-8?B?dTgzMnhzUEx3T2lRYURlaXlYbTkyb3BBTms5VW5FT1pQZXRJbVNOQVAzQUhP?=
 =?utf-8?B?U3dLdkJHUWV6RTV3a2lLVmNyWGlKaExmd0NGSUpDVmk4Sm1UbGs4YjEwWlQr?=
 =?utf-8?B?QTRrU1l2a1RjRnA1MlRPMFowQmp0ZS9JZzZVN2J0L3RURWJZcWxrTjZUcWh3?=
 =?utf-8?B?aW5KTWMxaUdjUGpaamdkMWFXS1BnVC9pTTgvOVJDLzFsV014dDB3L2hyZFFO?=
 =?utf-8?B?LytRd3drODExNnFDOUQvd29ydEFuV1EwTU9nNzd3b0NPVG51d29WWjAzVnlS?=
 =?utf-8?B?YSswdlZjOC9YZnhXUkEzTm5TcjI4QTJKQVhsQURveDZUR2dOVUkwbUs5VHE2?=
 =?utf-8?B?cENyQmlnZ0ZyQ3BXNW1Tdkp6NUZlcGdyUnFNeUxaeWh3M0VLdmw4NnBVdGEr?=
 =?utf-8?Q?80qHgTNYaLX63fKMbUfIVyS+C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b4f2df-39da-456c-a2d2-08dab81d6c3a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 13:16:13.6785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKCYBp3lKur2+9XkX5Qrky5JTrrY8GTfFT9qX/q7fKjZED3H050UOce3H4VZqnxNTHgs3iCvj5z5kU79073nCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6691
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yi.l.liu@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

On 2022/10/27 15:50, Jason Wang wrote:
> We used to have a macro for VTD_PE_GET_FPD_ERR() but it has an
> internal goto which prevents it from being reused. This patch convert
> that macro to a dedicated function and let the caller to decide what
> to do (e.g using goto or not). This makes sure it can be re-used for
> other function that requires fault reporting.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
> Changes since V2:
> - rename vtd_qualify_report_fault() to vtd_report_qualify_fault()
> ---
>   hw/i386/intel_iommu.c | 42 ++++++++++++++++++++++++++++--------------
>   1 file changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 6abe12a8c5..6c03ecf3cb 100644
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
> @@ -1718,6 +1707,19 @@ out:
>       trace_vtd_pt_enable_fast_path(source_id, success);
>   }
>   
> +static void vtd_report_qualify_fault(IntelIOMMUState *s,
> +                                     int err, bool is_fpd_set,
> +                                     uint16_t source_id,
> +                                     hwaddr addr,
> +                                     bool is_write)
> +{
> +    if (is_fpd_set && vtd_is_qualified_fault(err)) {
> +        trace_vtd_fault_disabled();
> +    } else {
> +        vtd_report_dmar_fault(s, source_id, addr, err, is_write);

seems like this will report non-qualified fault. so the naming is not
most suit. :-) Otherwise, I'm ok with the change.

> +    }
> +}
> +
>   /* Map dev to context-entry then do a paging-structures walk to do a iommu
>    * translation.
>    *
> @@ -1778,7 +1780,11 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
>           is_fpd_set = ce.lo & VTD_CONTEXT_ENTRY_FPD;
>           if (!is_fpd_set && s->root_scalable) {
>               ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set);
> -            VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
> +            if (ret_fr) {
> +                vtd_report_qualify_fault(s, -ret_fr, is_fpd_set,
> +                                         source_id, addr, is_write);
> +                goto error;
> +            }
>           }
>       } else {
>           ret_fr = vtd_dev_to_context_entry(s, bus_num, devfn, &ce);
> @@ -1786,7 +1792,11 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
>           if (!ret_fr && !is_fpd_set && s->root_scalable) {
>               ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set);
>           }
> -        VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
> +        if (ret_fr) {
> +            vtd_report_qualify_fault(s, -ret_fr, is_fpd_set,
> +                                     source_id, addr, is_write);
> +            goto error;
> +        }
>           /* Update context-cache */
>           trace_vtd_iotlb_cc_update(bus_num, devfn, ce.hi, ce.lo,
>                                     cc_entry->context_cache_gen,
> @@ -1822,7 +1832,11 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
>   
>       ret_fr = vtd_iova_to_slpte(s, &ce, addr, is_write, &slpte, &level,
>                                  &reads, &writes, s->aw_bits);
> -    VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
> +    if (ret_fr) {
> +        vtd_report_qualify_fault(s, -ret_fr, is_fpd_set, source_id,
> +                                 addr, is_write);
> +        goto error;
> +    }
>   
>       page_mask = vtd_slpt_level_page_mask(level);
>       access_flags = IOMMU_ACCESS_FLAG(reads, writes);

-- 
Regards,
Yi Liu

