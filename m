Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E42B60F8EF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 15:23:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo2p0-0003ht-S1; Thu, 27 Oct 2022 09:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1oo2od-0003Ml-Qq
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 09:21:06 -0400
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1oo2oX-0006dT-Tm
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 09:20:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666876853; x=1698412853;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VJo4BoHF6YbKJUA10d+7n/GX+vWWsv0Fb85q+/lrfzI=;
 b=Bn3QEi9lrT/Pgw8p6Oq2CTMtLalMLC81Bk5x3L3u9dwzlxXPSe5EWNmB
 xhYr1t9dEhVwg4nEjsT6yROm13uJxpEDjl70h4shk8az7JM+/gZuXKCV3
 15HcsgUgp619yq/A4pNgC/lbVqB5G4hqZoaPmYQrcl2fyP2VQWkk0BSQB
 3PKXVhgv6EbQ50EmhgT5nj1uEetojJIoNKwHlgLsCw7VpAnu2IDDhmXwq
 ikThMT3JOIkWQLHIL7XyV7v0+HJBS61opitJojifUDfnJca2BOIoUaJgG
 E9MK2gv0nnnMNtUnqj0hPU/c8nLEfAX8CFAAayaWBJpXCUo10OJmoazic w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="291522074"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="291522074"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 06:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="737677855"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="737677855"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2022 06:20:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 06:20:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 06:20:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 27 Oct 2022 06:20:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 27 Oct 2022 06:20:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdM3zmcVPeHWHcAoUZuhUWxuYX3TjAX++wRkOZi7rzg/CdKwYuAXQ4Dm5W9Ta5AyaZ378ZCf2xl/24AGcREHrG/AvY0d4YCWOd+ZBi1Pmemp8WBPsr1fzfh4WE4s5NwYDRgAHcM2IgsuXjnUQFTBldfdwj9oij5bdkdwbxCaVODQJZ0P/1Hcc4XTLcJ36+mxrlfF1Hb0Zp+X86taIqNsh0FvTL/NjAylEUMfxZfovitTYFXChzKwie2YnyW+joLNSbEPZXKMzKopnEB72xdThPV42tHS13HObVmBzh3UCPDW0y05ftn6fkZo9icG4m5/I1DoTgRn8c7qxBPFMn6t7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XW0Z7WUKj4/9C5mw/fZmwWAPQYoleqGK/RSW6p9g7Q=;
 b=kH9QchpeWgyY/pEDPJmL6FvQKvHHzIKqkhkchWgDAvPAPj8ASzUaWMLjGwI43/s3szMpbv+j0EkspuhXM9jIl9BkpVcjKzE2DyDrUbzO6rnjD7bvBShBasKF6sqbscK1HnqIx830ePngiY6X7itYCWL4v5tKVPgsf0a/qyia4gmh9yrFJ+e2WqD4OHApO+uxnNCkQwkCmATeBX4afGXUF9g9SqUHcCebAwWkAw9JApuAOR2TEft/oid3fOS1c14Oz3QH2pBSBEi9xWQWx9maQeaMpyQGRyJKakzRz2o0ehXME3ntmoiDyOaU9fTYHu2y1zKck5wXx0XLSS7sDhFGXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by MW4PR11MB6691.namprd11.prod.outlook.com (2603:10b6:303:20f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Thu, 27 Oct
 2022 13:20:39 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf%4]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 13:20:39 +0000
Message-ID: <a1ddce4d-0f42-5ae7-e7d0-fd80cbea65ee@intel.com>
Date: Thu, 27 Oct 2022 21:20:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH V4 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, <mst@redhat.com>, <qemu-devel@nongnu.org>
CC: <peterx@redhat.com>, <yi.y.sun@linux.intel.com>, <eperezma@redhat.com>,
 <lulu@redhat.com>
References: <20221027075042.16894-1-jasowang@redhat.com>
 <20221027075042.16894-2-jasowang@redhat.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20221027075042.16894-2-jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PU1PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:803:16::29) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|MW4PR11MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: ef79260b-58f3-4dd6-8122-08dab81e0a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zQsRD0KoABDP0MoPqSEmBQMBZ9MSnEIFeeE/rJm1OOchPv2sU9cnA/OBOc9n3QUC5/V+hYyqwkGdh2UaVq2/1Iep9fpS6enytBjDxYeNdCjAezlKkvc7DptIGiMq/sHM9f7lR56XNQjbldq9n0hUwzI9vf61ZgkFuDkS8PrOjrRC/9c2UhjlQF2OiwaetmjrRyZcBLMsVGecgbXxKMAHDHmTIvc4gkl1es6xvYMpz2AzbQyjSLq2PVZg4RyebLsJcxq6OK42ZDmb8Cagf91lFmdSp85C2T6/y9IZbv+yxpVvv5IZqUtTFv77cc9bl7XUH6/tNQVMHvFt4HRBwhIG52TTE76C/RfDeGGL99+zOdKCMsXQaXJ9IoT+CcU5k3PXI1cICEZy5E9Z6C2shxYgEzB8lFP9hfFtm79JVUIqOoRA6X6vDfawXfn/8XkMCGa3bM51LxC7p7oudFcXikummEqL8DViHWVGAVxN5vc66zGKADekxoFpLoJ7Shw/2PWN0Tk651h/iHPDm3/Rl/F/0SCwz7eYgwpFmfdJlkcn410PkIUZSKbhjbLxbUnJxfWf7WFopNmqAmF1VsZ3GyzWnPtHt20Fs2EZR5txJU4dr4nX8xeTsu/lLbVktYFIw/yB/oG0BWE7bJEte8RUkdOelIdNtqEfQfi+z+FvpPjwTCz5OKYzzutXogmNbsKSGqLVSS7HrV64CzBISTZs60mpMMdcuyH4RTM5e+H1B+RcujOgRISeX1LmvLrT1SEtjGmzWkOL8n+yjrj7IFG66lXGel8cZ+7zC9mkmr/yQPI+x2s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199015)(36756003)(86362001)(31696002)(31686004)(82960400001)(38100700002)(2906002)(186003)(26005)(6512007)(6666004)(478600001)(2616005)(6506007)(83380400001)(53546011)(8676002)(6486002)(316002)(66946007)(66476007)(66556008)(41300700001)(4326008)(8936002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bndGNlBUNnZBMW5QR3p0N0lmdFVydVBLV3JlYndzSDBiNEkxZEdCK1c5VVNY?=
 =?utf-8?B?dnF0VzZRRisrWmhBREFIZEgxdVd6cFUvcURsK2xyclBqUkdQTGxMRU95Yk9m?=
 =?utf-8?B?TWl4WmFBZEhJRkw3S251T0FnakRTWUdRK3QwYnJMVGlkME95RWFwb1QwYVV6?=
 =?utf-8?B?S0QrS3ZidW0xSW84ODkvUHZtN3BSdFd6OWVkdjQzLzZxdEZMNlh0TTV2Vmts?=
 =?utf-8?B?RFVsekN5YlpMUGM1bGh3S21GRUVLdnRCWVBNeXYvYU9TaFBRN1RraFpHWk1D?=
 =?utf-8?B?R21wZklGNkhndGxrVE9oNzdmNDVHK2hRdCsvQjVUL0tRdFZRVjdIOWlBd3I2?=
 =?utf-8?B?MWl0aVpreHVselR4MkwyNWhkOWVZbWRJNmlCMTJ5LzhkNTZFRENHVk92dGZB?=
 =?utf-8?B?dGIrRml6ZnhDbnlueEZLY3haSUVjVGhuUDVZeWo5ckltVy9obldLdExZbjlZ?=
 =?utf-8?B?Z1pvdDkwV05oeGRsdXh5MWlPS3M0dmtId0pmUk9iQy94bzhPOWpZa1M5VU56?=
 =?utf-8?B?VENsNTF3Z3pyTVJrTmlNNGNNcFNUbWJmZU1YblE3OTF6bFB3aTFnMG1aSHM4?=
 =?utf-8?B?S1VmeXArclg2R2xKNitINXdzM0N5TGFncVpydDRldllteWkxbUpoZ2pFMjJv?=
 =?utf-8?B?cU9uRUdvU2Q5QVlOVmNxWTFEQ2J6MGVySUFiZElRaEN4b2psZ2pkU1VTcmZF?=
 =?utf-8?B?VUlTREVsWWhEVDVLcmloR2hBNGFWNTBCVGR1UHJaZ0NIY0orWjdmM0crNEdo?=
 =?utf-8?B?RlFKTitPRnJHRHcweWtYVFp0YkpxeVFiZHNGTDc5bWNNQmpNYkZxbXlwSFJX?=
 =?utf-8?B?ZVgyWnBUMWJBQmV6ejBPTUFzVlRkallBYTBOKzV1SHZ2Y1phMlRoL3I2K09v?=
 =?utf-8?B?TmhnMi9kTmtTRGF5cnJVVEFyQ0ZFNlhHM1pNOXZpTElnd1lTVkNyN0dVaHpW?=
 =?utf-8?B?dTB3TFNKWHE4cjZ5c1MvR0x4d0VDaUxTQ3pXd3orVzBCK2FXbDZYM1FvWjFt?=
 =?utf-8?B?ekVEdFlVOEdweEw0SDhPclNBWHFBUzV5c21jKzl6cjhQUUEzVkZMQnNuQmFO?=
 =?utf-8?B?K0tnZ2w0SzQwNk1MT1hTVUM5UU0vSnRBSnZJTXNRRFQ1MjVVZmxlRkhMODdp?=
 =?utf-8?B?QWNPUVBhNlE0WVFabnhpWEl1OE0xM0tnVVl6Uit0MEwydnM2emdQdXRnN3Vx?=
 =?utf-8?B?TlliR05FTEZzWm0rK2RQM1Z1ZFhWMTJkVVo5WXNDYVUxQm9CTzRqQVRPS04y?=
 =?utf-8?B?TEJoR0xPeGlFRXlIS2lvNVo5NzNkMVN1cE03b0pKdEdkUjM5R3RIU25CZ2dI?=
 =?utf-8?B?RjVYMEJiYkE0Y3E5Z0MvWW1QMzRmejQrVUQrWHpDdjZWalJzZ1RXVXpJVVBw?=
 =?utf-8?B?Qnp4dzRCcFcva0lBUU1xWVdKVUFLUlV1YlM3Rmx6WU9TclZIZS9HUW5BVW5a?=
 =?utf-8?B?Z2tsY2h3dkx4dkw3akVkOWQ2MVBQWXFlSEdlY3d3Wkp3NjkrbjVLeEZaQXdP?=
 =?utf-8?B?OE1lRyt5TEthb0JtbVRmd0ZqR0RpclJxRkJ4N3lzM1o0N1pHWFZ0WDROUmZX?=
 =?utf-8?B?M2xRM3h5T2U5ZzhEMDdYMFY3NVZvaUVYMnhpWENlUm5kOFNqTGd4Yys4R3Zv?=
 =?utf-8?B?a3pDM0ZYdkVCbG1oakJrSnRvN1FhVHdJRERrak1YMjdQQVNuN05yanhJYUEw?=
 =?utf-8?B?aXFlNDNkemlzOHRXMnNFcHZZMFJRQ2ZTK2JqYVRVaGJKVzJHYnVYbjBTY0hk?=
 =?utf-8?B?RUtTK1R3NldBaDZWT1ZlRkluNnVQT2EvU0ZyUHJDcVVMN2cwR2ZBd21PR0x6?=
 =?utf-8?B?aDdlVXQ5U3hjakRGdWRRRE43OUxZTmxyNUtpSXdMTkNrYVRaQjFJaEpMelZE?=
 =?utf-8?B?ekprK3hqdEd6MnhOTWpYNHBMU3dMTW9oTW9GVmZPdFR6R3FLRXBWMEY4SGRl?=
 =?utf-8?B?NzZkR0xTUkFYdHpsOWJ0Wml4aTlCK3N3U1FCeFBZMGREbWk0TGVxdkIzMlo0?=
 =?utf-8?B?Vkwra3Jlb0FVNEtmOXhOdEpSQzBvc0NmYWZ5dDlZWWNQSWoyV3VKYVhUTTdr?=
 =?utf-8?B?VER2TGVGUUluS0NtQ1drNnpYWkpMNkFyQlMyTWptQ0owQllsbGV1NXBLREdZ?=
 =?utf-8?Q?PuvqOUMVFaLb3dG4hywwgItAJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef79260b-58f3-4dd6-8122-08dab81e0a5d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 13:20:39.1119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrISahslhgdXZal6Q5HXh6/iwYh5lvY/u3goJJOMIa7TgQRTul2kWjbXvvqgEqvJa21YPVXJSAtf7blD292Z5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6691
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126; envelope-from=yi.l.liu@intel.com;
 helo=mga18.intel.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> We use to warn on wrong rid2pasid entry. But this error could be
> triggered by the guest and could happens during initialization. So
> let's don't warn in this case.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>   hw/i386/intel_iommu.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 6524c2ee32..796f924c06 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -1554,8 +1554,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState *s, VTDContextEntry *ce)
>       if (s->root_scalable) {
>           ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
>           if (ret) {

ret is no more used in this branch. It may be changed to below. right?

         if (vtd_ce_get_rid2pasid_entry(s, ce, &pe)) {
             ...
         }

> -            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
> -                              __func__, ret);
> +            /*
> +             * This error is guest triggerable. We should assumt PT

s/triggerable/trigger-able
s/assumt/assume

> +             * not enabled for safety.
> +             */
>               return false;
>           }
>           return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);

-- 
Regards,
Yi Liu

