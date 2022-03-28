Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D105D4E909E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 10:57:00 +0200 (CEST)
Received: from localhost ([::1]:40970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYlBE-0006bU-Sy
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 04:56:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nYl8W-00053n-Ru
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 04:54:04 -0400
Received: from mga07.intel.com ([134.134.136.100]:9246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nYl8U-00041Q-99
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 04:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648457642; x=1679993642;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cPiQF5dYwpd9Hd/z0uu8CFQ4vgH8i8QrylHfD2Wjx5o=;
 b=Kh+irjGlemkk5kdLE3USc+FDbK7ms9zW8Rg0luAMK9BoAwn3GzgWXcQo
 ggSDTiEzdCQerIlRu3CzdDuubaFHejqfz8t6y3SaokE6MGI+EQKiwUf27
 556IfzgbGvdqgSTNb4B+PEoooepW5WAHGqg2Cg6hPJQpaFo1zo+Iw9icX
 Z3h4pRhc7g5XQHaq1p+0z7Sc/3x3BGfWyUiYN7aI/ELCbdLZ0oZVJlW97
 UwCNCEZ/hF5/tuySA0hlB2WQIFHckJ8SnVN2YJdIRAs5ENzM9FpusTlVf
 pvwS1rFDP2FrGU+Y/6xz+cLtq/aW/eZ3eH3xI9yqaIFZS2sw9SOc+kcKc g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="322135667"
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; d="scan'208";a="322135667"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 01:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; d="scan'208";a="830446599"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 28 Mar 2022 01:53:58 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 28 Mar 2022 01:53:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 28 Mar 2022 01:53:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 28 Mar 2022 01:53:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTbsV2Oi9Zf67LtZPfBdcUK2XdMFhv+35EcHIAdMfS23jMAVEB4ZTdOd2sJ+sBltSuYosQcxQlIXp5/DmcmGMGFmhT7WFjQKyQXqUtPJ786AZt0MMIjGU2eiY6iSageQkKUVL9WIcvcKUQZc+vMSTIXfv1FtiYa+260B9KrE/hd/RgRaTT61coL2UgDfPhWjQ8c+gj+rC7b/CJsW0hMB7+C8gypz0US46okQHGEmf5QfKCr7FemD9Zk2EQ9JOe3UxmcTO2TOkTVuqFVDsRVhtMVFKQUbiapK1j8T+Ioh8zS1/PgrFaPqleLfaahLyjUy0T4P7EDjb04tbuyYJ+iJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnWyODnvElnBq+atvxWkqggZyxnXMaAm1/AR1HCmVEA=;
 b=NW3N+qq6RtpcPZjw6p7yUsTfFntXpX8RC1e6WoejqNgUOVhVUlU0d88czR1JpPASrqF4iiVV0RLCWjx75y0cF5xviN49xIzk1u7aPL30IzLd/Q3FRKNRWoL5RpnHFsWTujfGdSnH2sWS0/jvkgkO7IxQyhsp5zt/CYe4C4vIVkcM/IhqNYtGzvZBQKRnWJIa22Exu1An2crIqbQoEa7LLtVEwgTpA0/vhOM7pTrKtp6MWTwtut3GDl9kJixf8niSCI/ZBNHRoxmfesLJ6eGaE1lOUHARWCLR+Tau1XS2Ug8pp7EcdVHR/5caZTNC/6pMJIX1yIPpMf2CirvhzD1bgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MWHPR11MB1984.namprd11.prod.outlook.com (2603:10b6:300:110::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Mon, 28 Mar
 2022 08:53:50 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::bc9d:6f72:8bb1:ca36]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::bc9d:6f72:8bb1:ca36%7]) with mapi id 15.20.5102.023; Mon, 28 Mar 2022
 08:53:50 +0000
Message-ID: <c5a0a8e8-b000-9efa-b334-93637724f49d@intel.com>
Date: Mon, 28 Mar 2022 16:53:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, "Tian, Kevin" <kevin.tian@intel.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-2-jasowang@redhat.com>
 <BN9PR11MB52769DCA64DCF7B107FD244B8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEsKJjnBb0qPM8oZvSHt326pMF8JCN8Fu1Qqjeu5pmdfMg@mail.gmail.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <CACGkMEsKJjnBb0qPM8oZvSHt326pMF8JCN8Fu1Qqjeu5pmdfMg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR03CA0045.apcprd03.prod.outlook.com
 (2603:1096:202:17::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 613602db-3dc0-43b9-847e-08da10987a73
X-MS-TrafficTypeDiagnostic: MWHPR11MB1984:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB198475B1846364EAD588B60CC31D9@MWHPR11MB1984.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n2kXadXY4Bg0SQVa8m2c3jmRn+Cu8Y/c7GULBl8jglLB/7wtXNRVv4Oec0j1lU2VfZGXzfHFrTbofEofX0cVna56GeO0e5li0Jv7VFS0EFap6ZXHnhmfEIUuauGzbPKFhsFwnMwLwoTKqLGpXoqZ5dPalgjxU6IqDJkzOzbQI0Eg+cENOfm81mP3PCQJBc4Kn/rD3n4kmKl0J4krHx1xN01Ej4qNv6LS2oWoke+joDcff7njKfotZNpQmAIlfUihUiwQIireru5a6RhfG3bz0iOQlKynt2+Gm6tqGBHzUFZX4YRFXzq9yOweoYe/nQ/3W0iWcduYo+BCGu4Op0ZybxGYj/eNTsNPBt5VlECUNL4NAOa/DHd2F4IjQiSPaNHu90yF0wGcCurD8t31F7ffMVeVwrQwignSCl/OAjF4CaQL3PSsRgaDU0DekPccOoTsIZ2YTGHpejt8UE8EzFBpQA+80GPVXSIcAvwX9Wtt8XjvEivRIJxkmHBfS9vYPmSyZtacAZTrdRZz5mzeYZso2b7MrgrIyyP7BKm4gL3sHE1tQ3CS0RWh9H1A5TtsNx/2Nx3NXKbNYaEuw+u1oKmf/fGW3WZD8J5KFPQ69HUjovE0h5OUR7AZvFVVki58l0T9SBvYX6f7WxRrGlFLmzh0QS7bn0t3vN9zVo4ePC3geBogmwovTTgT4LLYlal5FzJYb88MrtXFXjNWT/ufXzVDm+6aCksb9DBbCPIcgCZX+KhebvLKXEg8adctYE3ak84n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(82960400001)(66946007)(53546011)(2906002)(31686004)(86362001)(316002)(6512007)(83380400001)(508600001)(110136005)(186003)(4326008)(38100700002)(8936002)(26005)(6486002)(6636002)(8676002)(31696002)(5660300002)(6666004)(54906003)(66556008)(66476007)(6506007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clQ3V3MrMzErODR1TURkaEV1L0RjanVVclppWEZmQVJObFFoUFE3QWwwbC9r?=
 =?utf-8?B?Wi8yL1M2MndKVC9uZ09LbWZBQW5MdHp3S2VteXozamxZRGRxc3ZPai83UFVn?=
 =?utf-8?B?RDM3NnZOUEFiSk9DS2Yzbkd5NTY1M3ZSU1Jwb2I0QWVuanRJNkUvdWdlMDFV?=
 =?utf-8?B?ZUUzZFNtc1ArZUJEUHBKN1RDbUFDZngwTTI5UjFHQUgrQTgrUGZXOTd5MzVL?=
 =?utf-8?B?eEpwZDQ4NGRRZDhNMDBXNXdwT0QxWi9QaXNIalFGbm81M0swTExneDlGMFd3?=
 =?utf-8?B?UVViQnBpZUNpa3VTUWhGMHQxWC9XT3RFRmk2U1NpY213czdQR3Z2MmhtZlJQ?=
 =?utf-8?B?bC8rQkFVRFh5cWhxVE42Z2F0SFhubmJhbzVNUGVyb0Uxbmh4V1FJUERucTFt?=
 =?utf-8?B?NXIyc0w1R25rWjh0TVMwcXZUVmJEYmxTeElQaHRMYlNoL1RFUlJ2NE91QVRp?=
 =?utf-8?B?Z3BUQUZ4bWdwMXVKTjE0eHk3blFDMnVGdHBJWTdRdFE2UUVsM3F2MElDNVBL?=
 =?utf-8?B?VzlHQnk0S0swNXNYU0NPNjRWNjBkRzBVVTRCWW1rb3NZaHBTbmIrWWxIamVa?=
 =?utf-8?B?S0dsTElzMlZIdUZaYWpOMnczS1pEZXQycFRFaEp6TnVnbE13RWFNYVora3Nr?=
 =?utf-8?B?SHB1c0Fua0o2N1R5SkpsejYwRWF0ZFYvRGhHTTBQbGkzSE1Ba2NWQWhaSk96?=
 =?utf-8?B?eVEwMktJOTh5ZTRsVGphYlpVTVkxMVdEcEZKWXNEZGZPMzdXUnFtazV2UjR4?=
 =?utf-8?B?SzBOQUlOdjcvOTdmSmNzSVp0K0dYZ1kyaE94UHJrYmtmNlNveTM0d0FxVlY4?=
 =?utf-8?B?TTRpYTVRZ2pHMW52cVVVN3hqdGtDQXN2VHhtUHQ1UEpvbk82UkRvQzZGNHUw?=
 =?utf-8?B?Vk1ITFQ1enorczRZYS9INnR3MFpvbVFRQlNmZnlLUDA5QVVPR1F2TGdVKzBS?=
 =?utf-8?B?cDIxUG5VTnhjcUFBMHJkcEdhcmVFbGhIMVU1S2k5bmtBbkZscTJUcUtZbDFV?=
 =?utf-8?B?cGZhbisvRTN3TUhqZWh4eXZDSE5PWGJjZVFCcjJ3T2dUUU50MC9wNUdFeTJH?=
 =?utf-8?B?eHB6ZSsrN3FQVysrV3NITjV4MWVzRm1UTU5OTndsbHAxZkhuNFkvK0VHbUNH?=
 =?utf-8?B?RHR3bXQ1SDBCMjFuTkJ3dGtoOVdpc0VRcTFTUGdJa0loZEo1T25HV28zRTVq?=
 =?utf-8?B?SFVyZFRuaG8xdWJ4djBPdGErbk41aTVFTmJjUmdHNndLYXA4emlFa29uN3kx?=
 =?utf-8?B?REtkSGtCdUt3SlBaZUdwRU9GMWlRRzNoNmtzZlpkNlI5RVh2M0w2b0JUaVN0?=
 =?utf-8?B?SXhIQmYxQkFTWFA5RmpvT1NSejZzRFQ3MlRNVkp6U2UvanoyQTlyalVwdW9I?=
 =?utf-8?B?M3NVOW1maUI4SFhQK09Rdm1aMk82TDloMHRaZ1YxdnhHM3dsMUpvZEh0b0dl?=
 =?utf-8?B?R29NRk1tTStGc2JhZ0FkQ0s4bDI2ODZjaDhTTzZTYThRMm1icGQybStRMmNr?=
 =?utf-8?B?SW5VakJpV2FYdkZTWHAzOVZZYTZWanZaMkdPYVVUeVAvRDc5SG0vNjQ5cGZZ?=
 =?utf-8?B?MmtIVk9YWEp2Sm1qUDYrendpMkF5V0t4N0dwQUlqVm52MjQxOEV5NXBKZE1O?=
 =?utf-8?B?TGgyWGFMeW5xN3laaFFDajFaTitxODdPSXlqUDZUbmR2NXlOV0daaEM0OXl3?=
 =?utf-8?B?VC9wN1FhK3B2TlM2N05Uem9LVjdOSEY5aGhRM2JMUFRKeTZFWjIwNmdtbGF5?=
 =?utf-8?B?Yks3ZVltZGZsS2Z1TXVSeWd3cFlxWGRUT2txU3hCQnRzLzdWWlBRSkRRQXpk?=
 =?utf-8?B?emxQVzh6SDVlUWlZb1ErdEJvVmJiNEFtdHVSclNnNzRmSDFjc3RidzNXNXZ2?=
 =?utf-8?B?bFhNVmVIYWc4Uk1TUGlsZ0tYeFh6aEpXUTVkeDVyQTJsalVaUW5xeWpjMC9v?=
 =?utf-8?B?d3RvU2pyMzFXRFhlcWNmK3dpclUwUWRVTzhpYUJQSzBhM3VjZm5YRXN6a1dB?=
 =?utf-8?B?QzNsWGl6RUp0SEV1U0xaU3h2QzViRzRscW4vdGpHZW1nay9uT3JyY0syWGd6?=
 =?utf-8?B?dVMvYlB3Zlp1d3RJUk1BSmppOHRpbWRTbGdVQlI0UTJGSTUzMDNSMm1ZdXUr?=
 =?utf-8?B?YUxTakZ5S01xNnNieU1ieHBtRzNaSWh6d1NHWlF3RVR1ZFJxdDlEK1hyWkFz?=
 =?utf-8?B?a0t6elRCakN2Wm4xbHVJWHRvS0JuSnY1L1Z1UWhRT1VQV2I0RmJJNmFycnJq?=
 =?utf-8?B?Tm5BQURZa1BpTmRKeVllYTdRdzJhemNrUUpSNWlsNWhUWFZUbGJJYitVb1F4?=
 =?utf-8?B?TkhxMjdLMENnU2Yxc0w0c1hyT09RV3dRQk1iSkFPVm9FUUpNU3RaUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 613602db-3dc0-43b9-847e-08da10987a73
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 08:53:50.4309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSRcCj+va4P3UCNUEWm3gfqqdDrLxFnykaSPFoRj9QyBfsdHC8QZAY1g97CbMRhRn8hGuigkuwQL+bzHjFMC9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1984
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100; envelope-from=yi.l.liu@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2022/3/28 10:27, Jason Wang wrote:
> On Thu, Mar 24, 2022 at 4:21 PM Tian, Kevin <kevin.tian@intel.com> wrote:
>>
>>> From: Jason Wang
>>> Sent: Monday, March 21, 2022 1:54 PM
>>>
>>> We use to warn on wrong rid2pasid entry. But this error could be
>>> triggered by the guest and could happens during initialization. So
>>> let's don't warn in this case.
>>>
>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>> ---
>>>   hw/i386/intel_iommu.c | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
>>> index 874d01c162..90964b201c 100644
>>> --- a/hw/i386/intel_iommu.c
>>> +++ b/hw/i386/intel_iommu.c
>>> @@ -1554,8 +1554,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState
>>> *s, VTDContextEntry *ce)
>>>       if (s->root_scalable) {
>>>           ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
>>>           if (ret) {
>>> -            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
>>> -                              __func__, ret);
>>> +            /*
>>> +             * This error is guest triggerable. We should assumt PT
>>> +             * not enabled for safety.
>>> +             */
>>
>> suppose a VT-d fault should be queued in this case besides returning false:
>>
>> SPD.1: A hardware attempt to access the scalable-mode PASID-directory
>> entry referenced through the PASIDDIRPTR field in scalable-mode
>> context-entry resulted in an error
>>
>> SPT.1: A hardware attempt to access a scalable-mode PASID-table entry
>> referenced through the SMPTBLPTR field in a scalable-mode PASID-directory
>> entry resulted in an error.
> 
> Probably, but this issue is not introduced in this patch. We can fix
> it on top if necessary.

agreed.

>>
>> Currently the implementation of vtd_ce_get_rid2pasid_entry() is also
>> problematic. According to VT-d spec, RID2PASID field is effective only
>> when ecap.rps is true otherwise PASID#0 is used for RID2PASID. I didn't
>> see ecap.rps is set, neither is it checked in that function. It works possibly
>> just because Linux currently programs 0 to RID2PASID...
> 
> This seems to be another issue since the introduction of scalable mode.

yes. this is not introduced in this series. The current scalable mode 
vIOMMU support was following 3.0 spec, while RPS is added in 3.1. Needs
to be fixed.

> Thanks
> 
>>
>>>               return false;
>>>           }
>>>           return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
>>> --
>>> 2.25.1
>>>
>>
> 

-- 
Regards,
Yi Liu

