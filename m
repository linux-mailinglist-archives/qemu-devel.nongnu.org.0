Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D6D612A2A
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 11:40:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op5in-000565-5i; Sun, 30 Oct 2022 06:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1op5il-00055y-31
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 06:39:15 -0400
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1op5ih-00071D-QE
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 06:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667126351; x=1698662351;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3b+zP/5Wf9Lndtihjme0cMP86A9W/0GT53exjBRUuXg=;
 b=l4af8odfht7+8k0Op9xvXZ67Xs3kf4dC3atITVi1ajItMvOyvbpUuVAm
 P4uqm2UnbYUAuR05Pef8DT3/EqSxBKgLUFn1jexQDlQWo5GLQ3d5P7I87
 jdhf2vLkdid5A00xpoWfzSQSKM66k8CTDMHxEjMQUjsD1216sqvSh5igm
 Ws2byNwnNBLJBcsPmZPqlpnez7hBt9HfBpVJ3Gkr3PmBaUUsNEFTvmuef
 Zzlgnhp0hTnJbgZdIpKuF8f+0Txe0kgM48eWWE32F2LYQBG2WYrzapR91
 RR7cgW+1t5vQSH/XTzLotznWiMZJjh7JhVCcO3QZ56sAC7OaRsNTNMsrS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="370805400"
X-IronPort-AV: E=Sophos;i="5.95,225,1661842800"; d="scan'208";a="370805400"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2022 03:39:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="627962408"
X-IronPort-AV: E=Sophos;i="5.95,225,1661842800"; d="scan'208";a="627962408"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 30 Oct 2022 03:39:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 30 Oct 2022 03:39:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 30 Oct 2022 03:39:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 30 Oct 2022 03:39:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=br4pyP8Ta7p5PsiEb5dCHLFI5AEOWQ+ANaLGJH5bfxVQ8HkXrjGhYVWj2oqtIS6zAldvo+ZRwbwr8ap4IsQJD7RRH10grKLqn8l5MT0+Z/DUaXbu/EeaWvxH14gp3QbamTN9TzbUr9LlnRiKxYmcGM/zhvc2/N1Su3SGUAkLYToe7IwO/sHT9F73UvXpzBh9oYE04TdGvoiANYhfKDx6EhSfMnc3oancPxQaFUZ6VvpPnOQ+AZG5lPevujxw4CLJuZ+CJBW05j21J3DczbCwWvXufeMF5bgBfvox3iIsOw5gsQjSw5WA2JBSgEv7DlPNW02hB/F3MmWdbSpLIcVB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQbEpm8rEgebkk1pTLlUOWMQeKqb/xYTB55PNLZ0HZI=;
 b=FAiiuIomybYEUjI81H1RrY2fTWfPGQGrmAJrdwy91bAbR7zECan6DOZNwjrn0IZNg6SzZrb0baKaN/ip6QIQHpx/z5RhgouAzIi/iQEtK7I7ls9qSW/kvr9lMGnz/nHs1+76YFsePLMxGBNJ+4/ItWlU88MUyxSav9IZa9ZIbUDADZb6NJBiMBO8Ob1Il9fe9kimvtlfZSWypqlVZ750XAs3Ccm1wnszpL2mXV4V2SGw4B3xdmVud9E1GuyZupKFzoOhLMUlqxjbn+sUxrqM5B6U/8gXoR5IqkXTI7RV02sBmI/LKnaf+5yjto41QWYflQAiJJqj08D/sFfO3cjniw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by BL1PR11MB5494.namprd11.prod.outlook.com (2603:10b6:208:31d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.18; Sun, 30 Oct
 2022 10:39:04 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf%5]) with mapi id 15.20.5769.016; Sun, 30 Oct 2022
 10:39:04 +0000
Message-ID: <cb30648c-48b9-0d6b-0a15-079f8864bfa6@intel.com>
Date: Sun, 30 Oct 2022 18:39:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH V5 2/4] intel-iommu: drop VTDBus
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, <mst@redhat.com>, <peterx@redhat.com>
CC: <qemu-devel@nongnu.org>, <yi.y.sun@linux.intel.com>,
 <eperezma@redhat.com>, <lulu@redhat.com>
References: <20221028061436.30093-1-jasowang@redhat.com>
 <20221028061436.30093-3-jasowang@redhat.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20221028061436.30093-3-jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::18)
 To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|BL1PR11MB5494:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7a1866-4472-4eb6-89a6-08daba62f736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BOYSw5YoHM81aIkhydWVexmmzvEXwRZrZ1NR3zlmSfH/tdx2GSCcM1XChyvQwVNmQkjWn1j5PJ76VyG0hBzfB3TngWfE60zPjADiePbWC0zUIZ8tQdHNcjr/t60iKnA+uk/3oF9Kh3OL1nBzTJCrtGm1e1qNC/jMFmeY3dt6rBjsoimfbg1/SHkP6FlDlPtdrmLFVZl8BHbkOeIcbkRgGuZKB9dqJ0fzDi+0Y2lrEh05fZ4269fUztF565VErAc7Cq5/S4Zlj6od5uSIOmtyejsWYoOJcotZpFm3Nl7AoDMb/TVUzaeX4r/ELleOPikevZRnzur5TsIqRGzUjCaRDbG0PDcZmgDWSh2vbSNnFr/TPbEp9PYTgwTD2kNTuuEOp8VqCwFysZWTVI5wzxCqy4zfedSvqNW3i6DIHMXNMxWYgNAgkGjP3F1sCAfyWbA+MtfNw6mD7GjYEo7cm7m1yMRtVwV+3dIRgjb7z7L4IFcE1ZF5xtFXMmc5S8tTIZQJ0MPZLBVmVQswJPnDpdnTQ3H5aQTeB/8w2+aX0Vj0yLw10i5xV+gUNqOIhmcXSSyXhS75SzIEj/9hiBGjUEjCUzp59T6S330g0GJbony2x+3VqFo86nNYTDFiLT02eNI8gClMtYPfP/o/SRUlaZjHsH9Xh+En+BUFq4wMqozU6mM0nEb0Uop4L3limlpkZiNqRov/3Gv+5Md3o1RifpRN2ZAiXa8ceeHaT/Z+8s0X0Pchj373MuaAWS9qINvtsG49EJ1vDk4TX5y0DtLOwkVroY/FM1l//Kz0mFt9t8Cx4As=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199015)(31696002)(66899015)(82960400001)(66556008)(66476007)(66946007)(41300700001)(8936002)(86362001)(38100700002)(186003)(36756003)(83380400001)(31686004)(53546011)(6512007)(26005)(6506007)(478600001)(6666004)(6486002)(316002)(4326008)(8676002)(2616005)(5660300002)(2906002)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkhEVzl0Mld0UmtyZEtYRWlVRElURG1wMlhydDB5WjM0VnVjUWZqNGZZdCtE?=
 =?utf-8?B?ZlBnUWoxQ0tlTGtvejhzOUtKSUtjSXFnVEEvVDc5NU9LcTk4TzBxclJXVDZG?=
 =?utf-8?B?eXFBbDBTMlI4Z0ltUWkvaFFJL2VLVTgyRjhoSEE1NlJzUDJKU1F0V0oxUG90?=
 =?utf-8?B?WVc0dE9FTHZMYVFFeTJRZm9xeHVkbS9HK3RJOVRxWXVnS1RVMU54YlZ5dmhD?=
 =?utf-8?B?blRkOHhmLzF1ditNYTlDcGVLRWYxdjQrU0J6aWxvZk80c0VxRmhVaXk1VHBZ?=
 =?utf-8?B?SUV2cGhsd0hkeGI0QStGd3JoeXhrSjhPY0w3dDFFNlFpU2xTMi82ZUhJNkVl?=
 =?utf-8?B?Z3U4a0pRa2lBL0pFSTB6U0dyS3p1KzJNcFA4VDdYY25UWjlwSzhlVXBxUjVq?=
 =?utf-8?B?UGNkOFdBQnVjdHNSdGJSNERUR1FVeEtEL25TYkxqUUVwL1psb09uUmpIUklG?=
 =?utf-8?B?ZzQ0RkEvaTNCVjdEY1F2azR6czQraWxxWUMzbERjYVV4MjFJWmlZbjF5VURL?=
 =?utf-8?B?aGFCa2w5RjFMTksxZlRiRm1wNUltTVJ4bUNyTmV3UjJEejhaMW1CTGhVdW9l?=
 =?utf-8?B?U09JTzJPQXF2SUJlZjdaSjQyTGNRQ2htZGt1bVZLMlM4dVlzQVc3U21rTC9T?=
 =?utf-8?B?YmJiMEhFSUd4VVZoS3kyWFJ1aDRFbHJOOUs0dEF2Z0R5dnZhYm01TWcrNFpt?=
 =?utf-8?B?cXdLS1pDMlN0ajRva3YyM0M5U1VaZklkYkl5RW9PVnkyeXN3MFkyOWw4VFVW?=
 =?utf-8?B?eVdmM256ZXQyWWc4MFlLVmpNeU9ENE14akptOVBPcEE0bmYvcFpMenFDdW1U?=
 =?utf-8?B?NnBhaFV3ZW5lam9YeVRxY3JFS29YWnNMdGRzZWFIUVhPMEs5TG0yQVJxQU9L?=
 =?utf-8?B?M3diL0NwOXNtR2NXeUh4WGppdEN5bkl6SWg1MzFtL1lJZW9GbTB1Wi81Q3BY?=
 =?utf-8?B?blRzZnpWeU5EbjZvZlFJOTlpUnFrVXIzaUZyanpORDJibDN2aUo1bitSZmds?=
 =?utf-8?B?bXdOS0Z3b1RLdGcycitIU1Z1TmF1dVdpSTRIRWgyWWhaVE9jTXlqSE1VRFZ5?=
 =?utf-8?B?ejJDVlJaRkZiTmtUVzZWQUR0RGVGOXYzdEsyaUdnK1ovVVJhejlIVVFpRGpB?=
 =?utf-8?B?V2NNb040cmd3UHo4NGdrdVBjTU1CakQvVWVUM3lmYkxZUm1IYXB5V3Z4SnZ1?=
 =?utf-8?B?Y25Bb3hiYTViL3Q1WGRSSk9jN1FCaWl3L3JxUi9LNUg1S1B2VElsNUJsWEVT?=
 =?utf-8?B?aXNRakN3ZTBPZnVxNlFyWlo5RFBWd2dVd3Y2UGJ2RnpXaGN6YXh1NTRMS01x?=
 =?utf-8?B?MTZKeXV0ak53MHROVXNpWWRYc21pbnhtZjdjSi9BSjFqVmY4THg5S04wL2Zi?=
 =?utf-8?B?bDQrZnNiUVhKRnEwL1owMFVDeFVGSkl5N200bGcwZmN4azNsUHFTY1ArYzcv?=
 =?utf-8?B?MlhFNGl0UzhaYWJkUURLUG5XOVUvcE9sKzdCa0xTSmNseDRaRGRaaFJWd3Ro?=
 =?utf-8?B?QU5rQ2h6d0FwTW96cUduZmduTjFldHdLK0JiSTVmUUdlMW9kaklScVZ0ZDFX?=
 =?utf-8?B?RWZzTndiTm5DRWlENGx6MlQ3Sjk4ZXdWekMzczgvekdkM052UEE5K1JjSUho?=
 =?utf-8?B?ZmlFbXFlT0NhU2ozejdDOEg2VGFnLytOMUlxSk9Ia1BaWFIwVEUzVlp5WTIw?=
 =?utf-8?B?NzIzN3U2cWJGZ2FRajBJNjYwM2l2YUZjVTV5Nmg0TnZjWk1vTTJoU3g0S0RP?=
 =?utf-8?B?YitWYi9rMHVIQktjcVhyS3dXWGNHUWtIaGprT0NMMFNqYU1xcFlTSjZEeDM1?=
 =?utf-8?B?Qyt2cXlQVGlpcklDQ3Avc0VuaENyNEJwMDk0d09uLzFiVnNUWU5RbHUxY2tn?=
 =?utf-8?B?aVhHOTZad1U1RHpJRTNBNERVd3dYTkIwQ3ZFRDR3RDNoYlBURytZSjUvbHpV?=
 =?utf-8?B?MnVJK25UOEo4b0tNa3QxUFpBdmVYSDE4QzhPUTE1eXBkN3Y1Yi9WQ0xLcjd4?=
 =?utf-8?B?SnQxM1VSazJGSnhMcGhabFZnSUQzZkd5eFJFNUlMMEFsMjdTU0ptWEZzdTJz?=
 =?utf-8?B?VjFPazhOd1BqOEJOTWVuTWV0NW05UUNRWXRBaWEvTUpNRnhpMDVDelBxZDFh?=
 =?utf-8?Q?EwFsSNqSFbmQBYz/ISTG0m0dG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7a1866-4472-4eb6-89a6-08daba62f736
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2022 10:39:04.4860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vLEUJD4Mi9M/UpAgEDYwE78o3P3XoqNcApWSvjqgQuob64M0BJDwoucKtSD0gFEaJ5dUfmWPaal3fKO9OVO+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5494
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yi.l.liu@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 2022/10/28 14:14, Jason Wang wrote:
> We introduce VTDBus structure as an intermediate step for searching
> the address space. This works well with SID based matching/lookup. But
> when we want to support SID plus PASID based address space lookup,
> this intermediate steps turns out to be a burden. So the patch simply
> drops the VTDBus structure and use the PCIBus and devfn as the key for
> the g_hash_table(). This simplifies the codes and the future PASID
> extension.

just a nit.
in this way, all vtd_as'es are in the single hash table. will it become
a bottle-neck for searching? Especially with patch 4/4 in this serial.
sid has 16 bits, pasid has 20 bits, so at most there will be 2^36 entries
in the hash table.

> To prevent being slower for past vtd_find_as_from_bus_num() callers, a
> vtd_as cache indexed by the bus number is introduced to store the last
> recent search result of a vtd_as belongs to a specific bus.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
> Changes since V2:
> - use PCI_BUILD_BDF() instead of vtd_make_source_id()
> - Tweak the comments above vtd_as_hash()
> - use PCI_BUS_NUM() instead of open coding
> - rename vtd_as to vtd_address_spaces
> ---
>   hw/i386/intel_iommu.c         | 234 +++++++++++++++++-----------------
>   include/hw/i386/intel_iommu.h |  11 +-
>   2 files changed, 118 insertions(+), 127 deletions(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 271de995be..9fe5a222eb 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -61,6 +61,16 @@
>       }                                                                         \
>   }
>   
> +/*
> + * PCI bus number (or SID) is not reliable since the device is usaully
> + * initalized before guest can configure the PCI bridge
> + * (SECONDARY_BUS_NUMBER).
> + */
> +struct vtd_as_key {
> +    PCIBus *bus;
> +    uint8_t devfn;
> +};
> +
>   static void vtd_address_space_refresh_all(IntelIOMMUState *s);
>   static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n);
>   
> @@ -210,6 +220,27 @@ static guint vtd_uint64_hash(gconstpointer v)
>       return (guint)*(const uint64_t *)v;
>   }
>   
> +static gboolean vtd_as_equal(gconstpointer v1, gconstpointer v2)
> +{
> +    const struct vtd_as_key *key1 = v1;
> +    const struct vtd_as_key *key2 = v2;
> +
> +    return (key1->bus == key2->bus) && (key1->devfn == key2->devfn);
> +}
> +
> +/*
> + * Note that we use pointer to PCIBus as the key, so hashing/shifting
> + * based on the pointer value is intended. Note that we deal with
> + * collisions through vtd_as_equal().
> + */
> +static guint vtd_as_hash(gconstpointer v)
> +{
> +    const struct vtd_as_key *key = v;
> +    guint value = (guint)(uintptr_t)key->bus;
> +
> +    return (guint)(value << 8 | key->devfn);
> +}
> +
>   static gboolean vtd_hash_remove_by_domain(gpointer key, gpointer value,
>                                             gpointer user_data)
>   {
> @@ -248,22 +279,14 @@ static gboolean vtd_hash_remove_by_page(gpointer key, gpointer value,
>   static void vtd_reset_context_cache_locked(IntelIOMMUState *s)
>   {
>       VTDAddressSpace *vtd_as;
> -    VTDBus *vtd_bus;
> -    GHashTableIter bus_it;
> -    uint32_t devfn_it;
> +    GHashTableIter as_it;
>   
>       trace_vtd_context_cache_reset();
>   
> -    g_hash_table_iter_init(&bus_it, s->vtd_as_by_busptr);
> +    g_hash_table_iter_init(&as_it, s->vtd_address_spaces);
>   
> -    while (g_hash_table_iter_next (&bus_it, NULL, (void**)&vtd_bus)) {
> -        for (devfn_it = 0; devfn_it < PCI_DEVFN_MAX; ++devfn_it) {
> -            vtd_as = vtd_bus->dev_as[devfn_it];
> -            if (!vtd_as) {
> -                continue;
> -            }
> -            vtd_as->context_cache_entry.context_cache_gen = 0;
> -        }
> +    while (g_hash_table_iter_next (&as_it, NULL, (void**)&vtd_as)) {
> +        vtd_as->context_cache_entry.context_cache_gen = 0;
>       }
>       s->context_cache_gen = 1;
>   }
> @@ -993,32 +1016,6 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
>       return slpte & rsvd_mask;
>   }
>   
> -/* Find the VTD address space associated with a given bus number */
> -static VTDBus *vtd_find_as_from_bus_num(IntelIOMMUState *s, uint8_t bus_num)
> -{
> -    VTDBus *vtd_bus = s->vtd_as_by_bus_num[bus_num];
> -    GHashTableIter iter;
> -
> -    if (vtd_bus) {
> -        return vtd_bus;
> -    }
> -
> -    /*
> -     * Iterate over the registered buses to find the one which
> -     * currently holds this bus number and update the bus_num
> -     * lookup table.
> -     */
> -    g_hash_table_iter_init(&iter, s->vtd_as_by_busptr);
> -    while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_bus)) {
> -        if (pci_bus_num(vtd_bus->bus) == bus_num) {
> -            s->vtd_as_by_bus_num[bus_num] = vtd_bus;
> -            return vtd_bus;
> -        }
> -    }
> -
> -    return NULL;
> -}
> -
>   /* Given the @iova, get relevant @slptep. @slpte_level will be the last level
>    * of the translation, can be used for deciding the size of large page.
>    */
> @@ -1632,24 +1629,13 @@ static bool vtd_switch_address_space(VTDAddressSpace *as)
>   
>   static void vtd_switch_address_space_all(IntelIOMMUState *s)
>   {
> +    VTDAddressSpace *vtd_as;
>       GHashTableIter iter;
> -    VTDBus *vtd_bus;
> -    int i;
> -
> -    g_hash_table_iter_init(&iter, s->vtd_as_by_busptr);
> -    while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_bus)) {
> -        for (i = 0; i < PCI_DEVFN_MAX; i++) {
> -            if (!vtd_bus->dev_as[i]) {
> -                continue;
> -            }
> -            vtd_switch_address_space(vtd_bus->dev_as[i]);
> -        }
> -    }
> -}
>   
> -static inline uint16_t vtd_make_source_id(uint8_t bus_num, uint8_t devfn)
> -{
> -    return ((bus_num & 0xffUL) << 8) | (devfn & 0xffUL);
> +    g_hash_table_iter_init(&iter, s->vtd_address_spaces);
> +    while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_as)) {
> +        vtd_switch_address_space(vtd_as);
> +    }
>   }
>   
>   static const bool vtd_qualified_faults[] = {
> @@ -1686,18 +1672,37 @@ static inline bool vtd_is_interrupt_addr(hwaddr addr)
>       return VTD_INTERRUPT_ADDR_FIRST <= addr && addr <= VTD_INTERRUPT_ADDR_LAST;
>   }
>   
> +static gboolean vtd_find_as_by_sid(gpointer key, gpointer value,
> +                                   gpointer user_data)
> +{
> +    struct vtd_as_key *as_key = (struct vtd_as_key *)key;
> +    uint16_t target_sid = *(uint16_t *)user_data;
> +    uint16_t sid = PCI_BUILD_BDF(pci_bus_num(as_key->bus), as_key->devfn);
> +    return sid == target_sid;

this is a check instead of find. how about vtd_as_check_sid()?

> +}
> +
> +static VTDAddressSpace *vtd_get_as_by_sid(IntelIOMMUState *s, uint16_t sid)
> +{
> +    uint8_t bus_num = PCI_BUS_NUM(sid);
> +    VTDAddressSpace *vtd_as = s->vtd_as_cache[bus_num];
> +
> +    if (vtd_as &&
> +        (sid == PCI_BUILD_BDF(pci_bus_num(vtd_as->bus), vtd_as->devfn))) {

this checks sid as well. not sure if it can share the above helper.:-)

Besides the above nits, this patch looks good to me.

Reviewed-by: Yi Liu <yi.l.liu@intel.com>

> +        return vtd_as;
> +    }
> +
> +    vtd_as = g_hash_table_find(s->vtd_address_spaces, vtd_find_as_by_sid, &sid);
> +    s->vtd_as_cache[bus_num] = vtd_as;
> +
> +    return vtd_as;
> +}
> +
>   static void vtd_pt_enable_fast_path(IntelIOMMUState *s, uint16_t source_id)
>   {
> -    VTDBus *vtd_bus;
>       VTDAddressSpace *vtd_as;
>       bool success = false;
>   
> -    vtd_bus = vtd_find_as_from_bus_num(s, VTD_SID_TO_BUS(source_id));
> -    if (!vtd_bus) {
> -        goto out;
> -    }
> -
> -    vtd_as = vtd_bus->dev_as[VTD_SID_TO_DEVFN(source_id)];
> +    vtd_as = vtd_get_as_by_sid(s, source_id);
>       if (!vtd_as) {
>           goto out;
>       }
> @@ -1733,7 +1738,7 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
>       VTDContextCacheEntry *cc_entry;
>       uint64_t slpte, page_mask;
>       uint32_t level;
> -    uint16_t source_id = vtd_make_source_id(bus_num, devfn);
> +    uint16_t source_id = PCI_BUILD_BDF(bus_num, devfn);
>       int ret_fr;
>       bool is_fpd_set = false;
>       bool reads = true;
> @@ -1905,11 +1910,10 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
>                                             uint16_t source_id,
>                                             uint16_t func_mask)
>   {
> +    GHashTableIter as_it;
>       uint16_t mask;
> -    VTDBus *vtd_bus;
>       VTDAddressSpace *vtd_as;
>       uint8_t bus_n, devfn;
> -    uint16_t devfn_it;
>   
>       trace_vtd_inv_desc_cc_devices(source_id, func_mask);
>   
> @@ -1932,32 +1936,31 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
>       mask = ~mask;
>   
>       bus_n = VTD_SID_TO_BUS(source_id);
> -    vtd_bus = vtd_find_as_from_bus_num(s, bus_n);
> -    if (vtd_bus) {
> -        devfn = VTD_SID_TO_DEVFN(source_id);
> -        for (devfn_it = 0; devfn_it < PCI_DEVFN_MAX; ++devfn_it) {
> -            vtd_as = vtd_bus->dev_as[devfn_it];
> -            if (vtd_as && ((devfn_it & mask) == (devfn & mask))) {
> -                trace_vtd_inv_desc_cc_device(bus_n, VTD_PCI_SLOT(devfn_it),
> -                                             VTD_PCI_FUNC(devfn_it));
> -                vtd_iommu_lock(s);
> -                vtd_as->context_cache_entry.context_cache_gen = 0;
> -                vtd_iommu_unlock(s);
> -                /*
> -                 * Do switch address space when needed, in case if the
> -                 * device passthrough bit is switched.
> -                 */
> -                vtd_switch_address_space(vtd_as);
> -                /*
> -                 * So a device is moving out of (or moving into) a
> -                 * domain, resync the shadow page table.
> -                 * This won't bring bad even if we have no such
> -                 * notifier registered - the IOMMU notification
> -                 * framework will skip MAP notifications if that
> -                 * happened.
> -                 */
> -                vtd_sync_shadow_page_table(vtd_as);
> -            }
> +    devfn = VTD_SID_TO_DEVFN(source_id);
> +
> +    g_hash_table_iter_init(&as_it, s->vtd_address_spaces);
> +    while (g_hash_table_iter_next(&as_it, NULL, (void**)&vtd_as)) {
> +        if ((pci_bus_num(vtd_as->bus) == bus_n) &&
> +            (vtd_as->devfn & mask) == (devfn & mask)) {
> +            trace_vtd_inv_desc_cc_device(bus_n, VTD_PCI_SLOT(vtd_as->devfn),
> +                                         VTD_PCI_FUNC(vtd_as->devfn));
> +            vtd_iommu_lock(s);
> +            vtd_as->context_cache_entry.context_cache_gen = 0;
> +            vtd_iommu_unlock(s);
> +            /*
> +             * Do switch address space when needed, in case if the
> +             * device passthrough bit is switched.
> +             */
> +            vtd_switch_address_space(vtd_as);
> +            /*
> +             * So a device is moving out of (or moving into) a
> +             * domain, resync the shadow page table.
> +             * This won't bring bad even if we have no such
> +             * notifier registered - the IOMMU notification
> +             * framework will skip MAP notifications if that
> +             * happened.
> +             */
> +            vtd_sync_shadow_page_table(vtd_as);
>           }
>       }
>   }
> @@ -2473,18 +2476,13 @@ static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
>   {
>       VTDAddressSpace *vtd_dev_as;
>       IOMMUTLBEvent event;
> -    struct VTDBus *vtd_bus;
>       hwaddr addr;
>       uint64_t sz;
>       uint16_t sid;
> -    uint8_t devfn;
>       bool size;
> -    uint8_t bus_num;
>   
>       addr = VTD_INV_DESC_DEVICE_IOTLB_ADDR(inv_desc->hi);
>       sid = VTD_INV_DESC_DEVICE_IOTLB_SID(inv_desc->lo);
> -    devfn = sid & 0xff;
> -    bus_num = sid >> 8;
>       size = VTD_INV_DESC_DEVICE_IOTLB_SIZE(inv_desc->hi);
>   
>       if ((inv_desc->lo & VTD_INV_DESC_DEVICE_IOTLB_RSVD_LO) ||
> @@ -2495,12 +2493,11 @@ static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
>           return false;
>       }
>   
> -    vtd_bus = vtd_find_as_from_bus_num(s, bus_num);
> -    if (!vtd_bus) {
> -        goto done;
> -    }
> -
> -    vtd_dev_as = vtd_bus->dev_as[devfn];
> +    /*
> +     * Using sid is OK since the guest should have finished the
> +     * initialization of both the bus and device.
> +     */
> +    vtd_dev_as = vtd_get_as_by_sid(s, sid);
>       if (!vtd_dev_as) {
>           goto done;
>       }
> @@ -3427,27 +3424,27 @@ static const MemoryRegionOps vtd_mem_ir_ops = {
>   
>   VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
>   {
> -    uintptr_t key = (uintptr_t)bus;
> -    VTDBus *vtd_bus = g_hash_table_lookup(s->vtd_as_by_busptr, &key);
> +    /*
> +     * We can't simply use sid here since the bus number might not be
> +     * initialized by the guest.
> +     */
> +    struct vtd_as_key key = {
> +        .bus = bus,
> +        .devfn = devfn,
> +    };
>       VTDAddressSpace *vtd_dev_as;
>       char name[128];
>   
> -    if (!vtd_bus) {
> -        uintptr_t *new_key = g_malloc(sizeof(*new_key));
> -        *new_key = (uintptr_t)bus;
> -        /* No corresponding free() */
> -        vtd_bus = g_malloc0(sizeof(VTDBus) + sizeof(VTDAddressSpace *) * \
> -                            PCI_DEVFN_MAX);
> -        vtd_bus->bus = bus;
> -        g_hash_table_insert(s->vtd_as_by_busptr, new_key, vtd_bus);
> -    }
> +    vtd_dev_as = g_hash_table_lookup(s->vtd_address_spaces, &key);
> +    if (!vtd_dev_as) {
> +        struct vtd_as_key *new_key = g_malloc(sizeof(*new_key));
>   
> -    vtd_dev_as = vtd_bus->dev_as[devfn];
> +        new_key->bus = bus;
> +        new_key->devfn = devfn;
>   
> -    if (!vtd_dev_as) {
>           snprintf(name, sizeof(name), "vtd-%02x.%x", PCI_SLOT(devfn),
>                    PCI_FUNC(devfn));
> -        vtd_bus->dev_as[devfn] = vtd_dev_as = g_new0(VTDAddressSpace, 1);
> +        vtd_dev_as = g_new0(VTDAddressSpace, 1);
>   
>           vtd_dev_as->bus = bus;
>           vtd_dev_as->devfn = (uint8_t)devfn;
> @@ -3503,6 +3500,8 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
>                                               &vtd_dev_as->nodmar, 0);
>   
>           vtd_switch_address_space(vtd_dev_as);
> +
> +        g_hash_table_insert(s->vtd_address_spaces, new_key, vtd_dev_as);
>       }
>       return vtd_dev_as;
>   }
> @@ -3881,7 +3880,6 @@ static void vtd_realize(DeviceState *dev, Error **errp)
>   
>       QLIST_INIT(&s->vtd_as_with_notifiers);
>       qemu_mutex_init(&s->iommu_lock);
> -    memset(s->vtd_as_by_bus_num, 0, sizeof(s->vtd_as_by_bus_num));
>       memory_region_init_io(&s->csrmem, OBJECT(s), &vtd_mem_ops, s,
>                             "intel_iommu", DMAR_REG_SIZE);
>   
> @@ -3903,8 +3901,8 @@ static void vtd_realize(DeviceState *dev, Error **errp)
>       /* No corresponding destroy */
>       s->iotlb = g_hash_table_new_full(vtd_uint64_hash, vtd_uint64_equal,
>                                        g_free, g_free);
> -    s->vtd_as_by_busptr = g_hash_table_new_full(vtd_uint64_hash, vtd_uint64_equal,
> -                                              g_free, g_free);
> +    s->vtd_address_spaces = g_hash_table_new_full(vtd_as_hash, vtd_as_equal,
> +                                      g_free, g_free);
>       vtd_init(s);
>       sysbus_mmio_map(SYS_BUS_DEVICE(s), 0, Q35_HOST_BRIDGE_IOMMU_ADDR);
>       pci_setup_iommu(bus, vtd_host_dma_iommu, dev);
> diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
> index 67653b0f9b..e49fff2a6c 100644
> --- a/include/hw/i386/intel_iommu.h
> +++ b/include/hw/i386/intel_iommu.h
> @@ -58,7 +58,6 @@ typedef struct VTDContextEntry VTDContextEntry;
>   typedef struct VTDContextCacheEntry VTDContextCacheEntry;
>   typedef struct VTDAddressSpace VTDAddressSpace;
>   typedef struct VTDIOTLBEntry VTDIOTLBEntry;
> -typedef struct VTDBus VTDBus;
>   typedef union VTD_IR_TableEntry VTD_IR_TableEntry;
>   typedef union VTD_IR_MSIAddress VTD_IR_MSIAddress;
>   typedef struct VTDPASIDDirEntry VTDPASIDDirEntry;
> @@ -111,12 +110,6 @@ struct VTDAddressSpace {
>       IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
>   };
>   
> -struct VTDBus {
> -    PCIBus* bus;		/* A reference to the bus to provide translation for */
> -    /* A table of VTDAddressSpace objects indexed by devfn */
> -    VTDAddressSpace *dev_as[];
> -};
> -
>   struct VTDIOTLBEntry {
>       uint64_t gfn;
>       uint16_t domain_id;
> @@ -253,8 +246,8 @@ struct IntelIOMMUState {
>       uint32_t context_cache_gen;     /* Should be in [1,MAX] */
>       GHashTable *iotlb;              /* IOTLB */
>   
> -    GHashTable *vtd_as_by_busptr;   /* VTDBus objects indexed by PCIBus* reference */
> -    VTDBus *vtd_as_by_bus_num[VTD_PCI_BUS_MAX]; /* VTDBus objects indexed by bus number */
> +    GHashTable *vtd_address_spaces;             /* VTD address spaces */
> +    VTDAddressSpace *vtd_as_cache[VTD_PCI_BUS_MAX]; /* VTD address space cache */
>       /* list of registered notifiers */
>       QLIST_HEAD(, VTDAddressSpace) vtd_as_with_notifiers;
>   

-- 
Regards,
Yi Liu

