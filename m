Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136AA6EAD55
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 16:45:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pprz8-0001rG-Rm; Fri, 21 Apr 2023 10:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pprz1-0001r5-Py
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:43:31 -0400
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppryy-00037A-En
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682088208; x=1713624208;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m4RhRdGGUYplYe+x8Ro7olbPhqNwBqBcpRiHzftz8ek=;
 b=nOh/InCUQ/er3I3luDh5AcxacdPhsb/7Q8vlD41eaHmITEfCR9eaqYmL
 lE0mkj1Vcidoqk2Dc14iV1QEf4sz503dYsJ/4Wd98DWjNRUDsnZMRDAdz
 Og0EDTHKcmxU166/5Z97xj7TFVI343niyJR0SadLsJigqS/WUvB3Gb4yc
 REYQlVdzLQoDzogQBx+5zZMtqnP0gJzoUQ1hh4zhuvHcKmXE6ewv9JaQk
 02ndGfKKz97OE9hqSua31Z185xaegMzHIIuAYqiGXYbqTw7q4PeSkuWfS
 vEkg41SKAHpKw38EZMABjP4yNNWXPDPDAGRcOww7Dk1js7Rr3nV694M7e g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="408945821"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="408945821"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 07:43:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="756924039"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="756924039"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2023 07:43:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 07:43:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 07:43:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 07:43:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 07:43:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LT6bLHf8p6Opjjn0+6Gx8G6WRe27/2BX1+DgO0a7QQiiQFLWXW9n9FXx2TR1bDNQcOhD/AZxXC0akkNTP9lM1Fl7UiUJh/kYA2x1VoECzU2C6jgW51jAvxSOpzVQL3PVmhppTYQHDBh98saOb6DVNjZfM2LNcwjtBFj2mmWNitTFJGeiS9gHBkd9EPd+OlZCdPOw/Agz/4zNYXNzjjqy7N4BS/q6shSAM+9g23uH/1FnXUVfb17ZVP0l4cLsIfVWGGal2eJy6+GUpJkUtkSbUlA8Wfxuo3RDbw49u7D37zJiGraSrz3dqaocctROjm4QIzCHPibDDGRPipXyT/r52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMyOy7xjXA4G/ptmm2eaVDC4E6i/lBX6/VN4JLP6quQ=;
 b=evcp9DUcKNtEEvgUpUTGH/cvleKlKAW6uBMysg9dKbeYEBCRqmuNCDhLAib/NBsMaR0L+DxFJ3NARZzGTLgxYYftdy79pedl2QrmyMOhbDkzAtfabRlBH3oLD8iAMnNcHOPTvHBQTx4ZYZZLo6mepPqmid77ABnusQXSc89gbpa9dvr3blRZdrRj6zWyUysxw8c1S8FtpTbdQ9fmCYHjzDnNMbLpUDbXs3lDywDMVZ8I2sWq4XGMoarYh1xUPM0mEa7dDNol9wjQdom5WFlgeA/euz/jQhgYXDF2zwLrT0Fd61TWkcjuPGeQQ6covuGorOdFEF6/LvEHwWHdXb8OZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by DM4PR11MB6240.namprd11.prod.outlook.com (2603:10b6:8:a6::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Fri, 21 Apr 2023 14:43:22 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::2748:ce38:aaca:8a84]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::2748:ce38:aaca:8a84%6]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 14:43:22 +0000
Message-ID: <42479287-8005-2282-726f-2e479cd8c0b1@intel.com>
Date: Fri, 21 Apr 2023 22:43:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 12/14] Adding info [tb-list|tb] commands to HMP (WIP)
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
To: <alex.bennee@linaro.org>, <richard.henderson@linaro.org>,
 <qemu-devel@nongnu.org>
CC: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230421132421.1617479-1-fei2.wu@intel.com>
 <20230421132421.1617479-13-fei2.wu@intel.com>
In-Reply-To: <20230421132421.1617479-13-fei2.wu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0128.apcprd03.prod.outlook.com
 (2603:1096:4:91::32) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|DM4PR11MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b84a1ce-8ee2-419a-4709-08db4276c103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hyuGBMXyCmBUR9wSZ88XIAjxqLeHvs5a08ybrGE9LjkgsX9Fdb/kW7GAdXh3nLRdnTWWNaC4KcYQhy8oYaIm6LB9uj/ZKfNYUqJtPmXImUbFwW2Bf/Snzf3QnGHgZzjBxV4WBy8yf/o/6l4o75qK15dCI/INtaOrStmZR3ijtx34+LYUFVkHszuwyHrVq964Z/b59MncA+8S1jBqoQOvGTUriZQODyOZbYueaHzHFOX6gnO46RDLEBMNextAybbQh/gBoDPz1vKBTKru/4e8nuVVXny1+rCn9n77/tW0FEMqJApGePMBWgX8+03imzU3VNZOmQ5MPmbFdCcxrBqUanwQTFYx7ZX0nrv7SF3yOraXb24hrPT+c9spkYc4eaZUOUZi6Oi+e0f3Mg5GDQvKE7zFX+B+mFu06s933zMd7EZf4hcKVEmmyjIqtjXRxqDZvz/8zNEy7BHIabeg6i1VV3R+tJUk5DA69OLw6YUvskw/oZiuW+nvRbaIjdOxu1ghSUw3xlnEzCXczVDwCHd+Q8SyRDyTPpkAFvd7jnPSm6lHtC1LcQQ/xfTHgWp2EfYCljLUro7X2zyonnoi6NrOtqks+8d+bMUD1G6NcMzSW+UyI0J9FgZdWmBZivKkOeQDL15uM/gfUK1BlzN9g8T/3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199021)(54906003)(31686004)(53546011)(83380400001)(66574015)(478600001)(2616005)(6486002)(6512007)(6506007)(26005)(6666004)(316002)(82960400001)(4326008)(186003)(66946007)(66556008)(66476007)(5660300002)(8936002)(2906002)(30864003)(8676002)(38100700002)(41300700001)(31696002)(86362001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2tSRSsvMXpuZS9oRzBlR2x1YzY1RjFKcEZWSjh0Z1pSaHBzNzNXTlhkbGNh?=
 =?utf-8?B?SFpWdGdiVTFtUUNKUnljMUVLZG5uUjl2UkNNOFR1Wi93TVdpUmlQcUI3dWlM?=
 =?utf-8?B?eXl4WWNhU21ENk5LeWlGbUNKZzdnQ0tzTU00eklQRW1VY2ZXbVdYVlEzZVBl?=
 =?utf-8?B?YUhmRG0xNGtoeHh0QnNoa0JmVWVkeHNpOUlqcjJaVE1HdzloSkZXOWc2R1RJ?=
 =?utf-8?B?VENGWFlrQmpzaWhnRUhOcHB3ZVRUdWZUVEY4UDV1M3pxUTgzeVl4RWVYN0FK?=
 =?utf-8?B?U1JUV3BINUdMRjdsZFI4ZzE1dGtQcUROKy85eDBDN3VPVGdxUVVEaTE5Q1Vw?=
 =?utf-8?B?MC9LNnFsYm1UU1dpeGxVQ0dmLzBaQWQvcG9EdUNXZVA5RzZtcXZpZ0F0SVNi?=
 =?utf-8?B?V0RKdi9zRlBFWUw1TjlYYTlwT0d0L2dwaHRaUXorSG82d0REWWZUOElmVjBq?=
 =?utf-8?B?Zk94RE85Ukp0Q045VTFwYWpPMUM2eGZnTTIrVkRGTFdGOVhJVWpZRFB3S3V5?=
 =?utf-8?B?Y2RqNWhWZG0wc05KRGNwKytYaTFJdlpqdzN3NEQza1JWa2d3VHFLcUlPLzJq?=
 =?utf-8?B?OFBXa2NlcXd2RmxMTnJXM3NIeU82dWVNRzhQbmhOUm9GUjVud2tHMjdLN0Rx?=
 =?utf-8?B?d3JjU0wycG1wbE1kakdlRCtvdDNjSG03ZjZIQy9BNUhMZVZ5NWdNaVlQd1E0?=
 =?utf-8?B?Qm5vMjdrUFhsL0ZreC9Vb2s3ZXZ1Z2Z4clFlbjhrWkpDYkxyRW1yOVRKZ3l6?=
 =?utf-8?B?QjBIYW5IbTVNOWczQ2FaNzFUWG82S2VjcXIxY3NnSU82U1M1OHFHMFFFYzBt?=
 =?utf-8?B?WDFPUXAwYXIvOVYzVDU4dFczYVFUZkZ4MEh0WGRiYVloNU5EQ3NlRmpySkk3?=
 =?utf-8?B?Tk9FOXh5K1JBS1NEYmJXcGxCenI1aXlZa1BTeWlMYzBkL2loL1BVV3ZwUXlC?=
 =?utf-8?B?RE5IaG9CZ3dXTVlBcy9kQ3Q3WTEvRXJmSDA0bmw2VmFERkkxdWlPMDNRTkFN?=
 =?utf-8?B?MW56Q0FyRVdMcm0yaUtYQnlpQ0s0aXVHQW0vOW1IdVQwT2V1VWVaejR5OW9q?=
 =?utf-8?B?b0R6OFFxZ2ZSVGdMME16Q3BKKzYyeU5QVTJoc2lIWUYrdlV2a1hsaWNKbG9X?=
 =?utf-8?B?KzJ3V3JDMGVKNTdDTDkrUUkrUXBBV243TTR1cXlwc1VnNU13RmhlR3BMYVFL?=
 =?utf-8?B?c3RBM1dzaG40QzlMS0QvMFF4NC90VFVicVliSWhQVUc5bzdDQSs2Z1ZhOHJp?=
 =?utf-8?B?V1piOXkxMytqY0l1bDdyMGxNaktucFpVMWpydFpIRWpHc3NjZGZteWtoOHlo?=
 =?utf-8?B?SjM2akZtY1UxYmhkMU5iV2FDSzBsKy9QVlJaNHVia1B4c3Q2NGtYdG1PckFU?=
 =?utf-8?B?dFlVM3l1SGs0SVRLbkIvcEtTUWdrcU9nZ0FNL0F5YTJ3WVh0VUNtNGt4REVH?=
 =?utf-8?B?K0RmSXdacUNtaTIrSTE0dXRYMTg0ck5reXFKVWF5T251aTZlZVI0S3hqQTBB?=
 =?utf-8?B?RmNLQ3JNU2pxbFVWY2FUaXM4SUJrUWh6RzZxUjM3WHJFelYxRSsyYUxXVCtz?=
 =?utf-8?B?WXZ5S214b1huanQ3SnNhcmRmY2hvMEdyT2RxLzBkVHJkYlpVb2ZiOXdRZHF4?=
 =?utf-8?B?SElWSUN5QjM2aHFtR0JiMWg0dTBEdnM1UEo1RFEra0ZEb2ZnRXFVQUtNS1Fz?=
 =?utf-8?B?cytPeXlYMlFnY3ozeXpsMkxpMmkzc1YyMit4U2JGZXd5aDg4Yzc1R1hHZm1T?=
 =?utf-8?B?NXB1M0VlTWRJK0p4MFhVaVp6NlJnWjA0Zm1mYnM4K2VISG1wNWUxa3JWV1hj?=
 =?utf-8?B?Vm9KS3NJcUxReFBVU2FjRTdOZHdTVmJyV2kzUXAxdkdHdWMrNFR3dzdLS1Yx?=
 =?utf-8?B?eDUxNkR0a1paRkdtSXJ6eXJ2RzN1ZXhBMW9aZW1aZjJEY2xDKzFNUlFsRU05?=
 =?utf-8?B?eWZqYnNnVXJDd0F4b2owUGg5aklmbWJXb3dva2ZlS3RzMkp5aE9YdzE3S2pr?=
 =?utf-8?B?UG4wRjd5MmNYQ0VDd2M1S0JXTXhzOGJWaEhIRjlReWhFUnhKRGN3RzZnYm5a?=
 =?utf-8?B?RlVXUGYyT1V3VURGRnN6OE81S3ZJUVdjdHRhZ2ErMnRnRVNwNElhT2xNdytj?=
 =?utf-8?Q?bnjpFwh8VcR1WLuvp60Q5LdV2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b84a1ce-8ee2-419a-4709-08db4276c103
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 14:43:22.0335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFTn23OT5hyqG5oza2ZeSjz/EaJ1K6SAcfdtAFWT8xFeaqgSRwcrpKyN+nlBBF8FWjHK6hT6RReB9Xq8E2HWbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6240
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=fei2.wu@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.297, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/21/2023 9:24 PM, Fei Wu wrote:
> From: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>
> 
> These commands allow the exploration of TBs generated by the TCG.
> Understand which one hotter, with more guest/host instructions... and
> examine their guest, host and IR code.
> 
> The goal of this command is to allow the dynamic exploration of TCG
> behavior and code quality. Therefore, for now, a corresponding QMP
> command is not worthwhile.
> 
> [AJB: WIP - we still can't be safely sure a translation will succeed]
> 
> Example of output:
> 
> TB id:1 | phys:0x34d54 virt:0x0000000000034d54 flags:0x0000f0
> 	| exec:4828932/0 guest inst cov:16.38%
> 	| trans:1 ints: g:3 op:82 op_opt:34 spills:3
> 	| h/g (host bytes / guest insts): 90.666664
> 	| time to gen at 2.4GHz => code:3150.83(ns) IR:712.08(ns)
> 	| targets: 0x0000000000034d5e (id:11), 0x0000000000034d0d (id:2)
> 
> TB id:2 | phys:0x34d0d virt:0x0000000000034d0d flags:0x0000f0
> 	| exec:4825842/0 guest inst cov:21.82%
> 	| trans:1 ints: g:4 op:80 op_opt:38 spills:2
> 	| h/g (host bytes / guest insts): 84.000000
> 	| time to gen at 2.4GHz => code:3362.92(ns) IR:793.75(ns)
> 	| targets: 0x0000000000034d19 (id:12), 0x0000000000034d54 (id:1)
> 
> TB id:2 | phys:0x34d0d virt:0x0000000000034d0d flags:0x0000f0
> 	| exec:6956495/0  guest inst cov:21.82%
> 	| trans:2 ints: g:2 op:40 op_opt:19 spills:1
> 	| h/g (host bytes / guest insts): 84.000000
> 	| time to gen at 2.4GHz => code:3130.83(ns) IR:722.50(ns)
> 	| targets: 0x0000000000034d19 (id:12), 0x0000000000034d54 (id:1)
> 
> ----------------
> IN:
> 0x00034d0d:  89 de                    movl     %ebx, %esi
> 0x00034d0f:  26 8b 0e                 movl     %es:(%esi), %ecx
> 0x00034d12:  26 f6 46 08 80           testb    $0x80, %es:8(%esi)
> 0x00034d17:  75 3b                    jne      0x34d54
> 
> ------------------------------
> 
> TB id:1 | phys:0x34d54 virt:0x0000000000034d54 flags:0x0000f0
> 	| exec:5202686/0 guest inst cov:11.28%
> 	| trans:1 ints: g:3 op:82 op_opt:34 spills:3
> 	| h/g (host bytes / guest insts): 90.666664
> 	| time to gen at 2.4GHz => code:2793.75(ns) IR:614.58(ns)
> 	| targets: 0x0000000000034d5e (id:3), 0x0000000000034d0d (id:2)
> 
> TB id:2 | phys:0x34d0d virt:0x0000000000034d0d flags:0x0000f0
> 	| exec:5199468/0 guest inst cov:15.03%
> 	| trans:1 ints: g:4 op:80 op_opt:38 spills:2
> 	| h/g (host bytes / guest insts): 84.000000
> 	| time to gen at 2.4GHz => code:2958.75(ns) IR:719.58(ns)
> 	| targets: 0x0000000000034d19 (id:4), 0x0000000000034d54 (id:1)
> 
> ------------------------------
> 2 TBs to reach 25% of guest inst exec coverage
> Total of guest insts exec: 138346727
> 
> ------------------------------
> 
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
> Message-Id: <20190829173437.5926-10-vandersonmr2@gmail.com>
> [AJB: fix authorship, dropped coverset]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  accel/tcg/monitor.c          |  55 ++++++
>  accel/tcg/tb-stats.c         | 322 +++++++++++++++++++++++++++++++++++
>  disas.c                      |  31 +++-
>  hmp-commands-info.hx         |  16 ++
>  include/exec/tb-stats.h      |  33 +++-
>  include/monitor/hmp.h        |   2 +
>  include/qemu/log-for-trace.h |   6 +-
>  include/qemu/log.h           |   2 +
>  util/log.c                   |  66 +++++--
>  9 files changed, 512 insertions(+), 21 deletions(-)
> 
> diff --git a/accel/tcg/monitor.c b/accel/tcg/monitor.c
> index b342727262..6bfefd24f6 100644
> --- a/accel/tcg/monitor.c
> +++ b/accel/tcg/monitor.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "qapi/error.h"
>  #include "qapi/type-helpers.h"
>  #include "qapi/qapi-commands-machine.h"
> @@ -17,6 +18,7 @@
>  #include "sysemu/cpu-timers.h"
>  #include "sysemu/tcg.h"
>  #include "exec/tb-stats.h"
> +#include "tb-context.h"
>  #include "internal.h"
>  
>  
> @@ -117,6 +119,59 @@ void hmp_tbstats(Monitor *mon, const QDict *qdict)
>                            RUN_ON_CPU_HOST_PTR(tbscommand));
>  
>  }
> +
> +void hmp_info_tblist(Monitor *mon, const QDict *qdict)
> +{
> +    int number_int;
> +    const char *sortedby_str = NULL;
> +    if (!tcg_enabled()) {
> +        error_report("TB information is only available with accel=tcg");
> +        return;
> +    }
> +    if (!tb_ctx.tb_stats.map) {
> +        error_report("no TB information recorded");
> +        return;
> +    }
> +
> +    number_int = qdict_get_try_int(qdict, "number", 10);
> +    sortedby_str = qdict_get_try_str(qdict, "sortedby");
> +
> +    int sortedby = SORT_BY_HOTNESS;
> +    if (sortedby_str == NULL || strcmp(sortedby_str, "hotness") == 0) {
> +        sortedby = SORT_BY_HOTNESS;
> +    } else if (strcmp(sortedby_str, "hg") == 0) {
> +        sortedby = SORT_BY_HG;
> +    } else if (strcmp(sortedby_str, "spills") == 0) {
> +        sortedby = SORT_BY_SPILLS;
> +    } else {
> +        error_report("valid sort options are: hotness hg spills");
> +        return;
> +    }
> +
> +    dump_tbs_info(number_int, sortedby, true);
> +}
> +
> +void hmp_info_tb(Monitor *mon, const QDict *qdict)
> +{
> +    const int id = qdict_get_int(qdict, "id");
> +    const char *flags = qdict_get_try_str(qdict, "flags");
> +    int mask;
> +
> +    if (!tcg_enabled()) {
> +        error_report("TB information is only available with accel=tcg");
> +        return;
> +    }
> +
> +    mask = flags ? qemu_str_to_log_mask(flags) : CPU_LOG_TB_IN_ASM;
> +
> +    if (!mask) {
> +        error_report("Unable to parse log flags, see 'help log'");
> +        return;
> +    }
> +
> +    dump_tb_info(id, mask, true);
> +}
> +
>  #endif
>  
>  HumanReadableText *qmp_x_query_profile(Error **errp)
> diff --git a/accel/tcg/tb-stats.c b/accel/tcg/tb-stats.c
> index 56e944b225..69ac3d25cf 100644
> --- a/accel/tcg/tb-stats.c
> +++ b/accel/tcg/tb-stats.c
> @@ -11,14 +11,18 @@
>  #include "disas/disas.h"
>  #include "exec/exec-all.h"
>  #include "tcg/tcg.h"
> +#include "qapi/error.h"
>  
>  #include "qemu/qemu-print.h"
>  #include "qemu/timer.h"
> +#include "qemu/log.h"
>  
>  #include "exec/tb-stats.h"
>  #include "exec/tb-flush.h"
>  #include "tb-context.h"
>  
> +#include "internal.h"
> +
>  /* TBStatistic collection controls */
>  enum TBStatsStatus {
>      TB_STATS_DISABLED = 0,
> @@ -32,8 +36,23 @@ static uint32_t default_tbstats_flag;
>  /* only accessed in safe work */
>  static GList *last_search;
>  
> +static int id = 1; /* display_id increment counter */
>  uint64_t dev_time;
>  
> +static TBStatistics *get_tbstats_by_id(int id)
> +{
> +    GList *iter;
> +
> +    for (iter = last_search; iter; iter = g_list_next(iter)) {
> +        TBStatistics *tbs = iter->data;
> +        if (tbs && tbs->display_id == id) {
> +            return tbs;
> +            break;
> +        }
> +    }
> +    return NULL;
> +}
> +
>  struct jit_profile_info {
>      uint64_t translations;
>      uint64_t aborted;
> @@ -296,6 +315,309 @@ void init_tb_stats_htable(void)
>      }
>  }
>  
> +static void collect_tb_stats(void *p, uint32_t hash, void *userp)
> +{
> +    last_search = g_list_prepend(last_search, p);
> +}
> +
> +static void count_invalid_tbs(gpointer data, gpointer user_data)
> +{
> +    TranslationBlock *tb = (TranslationBlock *) data;
> +    unsigned *counter = (unsigned *) user_data;
> +    if (tb->cflags & CF_INVALID) {
> +        *counter = *counter + 1;
> +    }
> +}
> +
> +static int dump_tb_header(TBStatistics *tbs)
> +{
> +    unsigned g = stat_per_translation(tbs, code.num_guest_inst);
> +    unsigned ops = stat_per_translation(tbs, code.num_tcg_ops);
> +    unsigned ops_opt = stat_per_translation(tbs, code.num_tcg_ops_opt);
> +    unsigned spills = stat_per_translation(tbs, code.spills);
> +    unsigned h = stat_per_translation(tbs, code.out_len);
> +    unsigned act = tbs->tbs->len;
> +    unsigned invalid = 0;
> +
> +    float guest_host_prop = g ? ((float) h / g) : 0;
> +
> +    g_ptr_array_foreach(tbs->tbs, &count_invalid_tbs, &invalid);
> +
> +    qemu_log("TB id:%d | phys:0x"TB_PAGE_ADDR_FMT" virt:0x"TARGET_FMT_lx
> +             " flags:0x%08x %d inv/%d\n",
> +             tbs->display_id, tbs->phys_pc, tbs->pc, tbs->flags,
> +             invalid, act);
> +
> +    if (tbs_stats_enabled(tbs, TB_EXEC_STATS)) {
> +        qemu_log("\t| exec:%lu/%lu guest inst cov:%.2f%%\n",
> +                tbs->executions.normal,
> +                tbs->executions.atomic, tbs->executions.coverage / 100.0f);
> +    }
> +
> +    if (tbs_stats_enabled(tbs, TB_JIT_STATS)) {
> +        qemu_log("\t| trans:%lu ints: g:%u op:%u op_opt:%u spills:%d"
> +             "\n\t| h/g (host bytes / guest insts): %f\n",
> +             tbs->translations.total, g, ops, ops_opt, spills, guest_host_prop);
> +    }
> +
> +    if (tbs_stats_enabled(tbs, TB_JIT_TIME)) {
> +        qemu_log("\t| time to gen at 2.4GHz => code:%0.2lf(ns) IR:%0.2lf(ns)\n",
> +             tbs->gen_times.code / 2.4, tbs->gen_times.ir / 2.4);
> +    }
> +
> +    qemu_log("\n");
> +
> +    return act - invalid;
> +}
> +
> +static gint
> +inverse_sort_tbs(gconstpointer p1, gconstpointer p2, gpointer psort_by)
> +{
> +    const TBStatistics *tbs1 = (TBStatistics *) p1;
> +    const TBStatistics *tbs2 = (TBStatistics *) p2;
> +    int sort_by = *((enum SortBy *) psort_by);
> +    unsigned long c1 = 0;
> +    unsigned long c2 = 0;
> +
> +    if (sort_by == SORT_BY_SPILLS) {
> +        c1 = stat_per_translation(tbs1, code.spills);
> +        c2 = stat_per_translation(tbs2, code.spills);
> +    } else if (sort_by == SORT_BY_HOTNESS) {
> +        c1 = stat_per_translation(tbs1, executions.normal);
> +        c2 = stat_per_translation(tbs2, executions.normal);
> +    } else if (sort_by == SORT_BY_HG) {
> +        if (tbs1->code.num_guest_inst == 0) {
> +            return -1;
> +        }
> +        if (tbs2->code.num_guest_inst == 0) {
> +            return 1;
> +        }
> +
> +        c1 = tbs1->code.out_len / tbs1->code.num_guest_inst;
> +        c2 = tbs2->code.out_len / tbs2->code.num_guest_inst;
> +    }
> +    return c2 - c1;

I take the type as int for granted, will fix it.

Thanks,
Fei.
> +}
> +
> +static void dump_last_search_headers(int count)
> +{
> +    if (!last_search) {
> +        qemu_log("No data collected yet\n");
> +        return;
> +    }
> +
> +    GList *l = last_search;
> +    while (l != NULL && count--) {
> +        TBStatistics *tbs = (TBStatistics *) l->data;
> +        GList *next = l->next;
> +        dump_tb_header(tbs);
> +        l = next;
> +    }
> +}
> +
> +static uint64_t calculate_last_search_coverages(void)
> +{
> +    uint64_t total_exec_count = 0;
> +    GList *i;
> +
> +    /* Compute total execution count for all tbs */
> +    for (i = last_search; i; i = i->next) {
> +        TBStatistics *tbs = (TBStatistics *) i->data;
> +        total_exec_count +=
> +            (tbs->executions.atomic + tbs->executions.normal)
> +                * tbs->code.num_guest_inst;
> +    }
> +
> +    for (i = last_search; i; i = i->next) {
> +        TBStatistics *tbs = (TBStatistics *) i->data;
> +        uint64_t tb_total_execs =
> +            (tbs->executions.atomic + tbs->executions.normal)
> +                * tbs->code.num_guest_inst;
> +        tbs->executions.coverage =
> +            (10000 * tb_total_execs) / (total_exec_count + 1);
> +    }
> +
> +    return total_exec_count;
> +}
> +
> +static void do_dump_tbs_info(int total, int sort_by)
> +{
> +    id = 1;
> +    GList *i;
> +    int count = total;
> +
> +    g_list_free(last_search);
> +    last_search = NULL;
> +
> +    qht_iter(&tb_ctx.tb_stats, collect_tb_stats, NULL);
> +
> +    last_search = g_list_sort_with_data(last_search, inverse_sort_tbs,
> +                                        &sort_by);
> +
> +    if (!last_search) {
> +        qemu_printf("No data collected yet!\n");
> +        return;
> +    }
> +
> +    calculate_last_search_coverages();
> +
> +    for (i = last_search; i && count--; i = i->next) {
> +        TBStatistics *tbs = (TBStatistics *) i->data;
> +        tbs->display_id = id++;
> +    }
> +
> +    /* free the unused bits */
> +    if (i) {
> +        if (i->next) {
> +            i->next->prev = NULL;
> +        }
> +        g_list_free(i->next);
> +        i->next = NULL;
> +    }
> +
> +    dump_last_search_headers(total);
> +}
> +
> +struct tbs_dump_info {
> +    int count;
> +    int sort_by;
> +};
> +
> +static void do_dump_tbs_info_safe(CPUState *cpu, run_on_cpu_data tbdi)
> +{
> +    struct tbs_dump_info *info = tbdi.host_ptr;
> +    qemu_log_to_monitor(true);
> +    do_dump_tbs_info(info->count, info->sort_by);
> +    qemu_log_to_monitor(false);
> +    g_free(info);
> +}
> +
> +/*
> + * When we dump_tbs_info on a live system via the HMP we want to
> + * ensure the system is quiessent before we start outputting stuff.
> + * Otherwise we could pollute the output with other logging output.
> + */
> +
> +void dump_tbs_info(int count, int sort_by, bool use_monitor)
> +{
> +    if (use_monitor) {
> +        struct tbs_dump_info *tbdi = g_new(struct tbs_dump_info, 1);
> +        tbdi->count = count;
> +        tbdi->sort_by = sort_by;
> +        async_safe_run_on_cpu(first_cpu, do_dump_tbs_info_safe,
> +                              RUN_ON_CPU_HOST_PTR(tbdi));
> +    } else {
> +        do_dump_tbs_info(count, sort_by);
> +    }
> +}
> +
> +/*
> + * We cannot always re-generate the code even if we know there are
> + * valid translations still in the cache. The reason being the guest
> + * may have un-mapped the page code. In real life this would be
> + * un-reachable as the jump cache is cleared and the following QHT
> + * lookup will do a get_page_addr_code() and fault.
> + *
> + * TODO: can we do this safely? We need to
> + *  a) somehow recover the mmu_idx for this translation
> + *  b) probe MMU_INST_FETCH to know it will succeed
> + */
> +static GString *get_code_string(TBStatistics *tbs, int log_flags)
> +{
> +    int old_log_flags = qemu_loglevel;
> +
> +    CPUState *cpu = first_cpu;
> +    uint32_t cflags = curr_cflags(cpu);
> +    TranslationBlock *tb = NULL;
> +
> +    GString *code_s = g_string_new(NULL);
> +    qemu_log_to_string(true, code_s);
> +
> +    Error *err = NULL;
> +    if (!qemu_set_log(log_flags, &err)) {
> +        g_string_append_printf(code_s, "%s", error_get_pretty(err));
> +        error_free(err);
> +    }
> +
> +    if (sigsetjmp(cpu->jmp_env, 0) == 0) {
> +        mmap_lock();
> +        tb = tb_gen_code(cpu, tbs->pc, tbs->cs_base, tbs->flags, cflags);
> +        tb_phys_invalidate(tb, -1);
> +        mmap_unlock();
> +    } else {
> +        /*
> +         * The mmap_lock is dropped by tb_gen_code if it runs out of
> +         * memory.
> +         */
> +        qemu_log("\ncould not gen code for this TB (no longer mapped?)\n");
> +        assert_no_pages_locked();
> +    }
> +
> +    qemu_set_log(old_log_flags, &err);
> +    qemu_log_to_string(false, NULL);
> +
> +    return code_s;
> +}
> +
> +static void do_tb_dump_with_statistics(TBStatistics *tbs, int log_flags)
> +{
> +    g_autoptr(GString) code_s = NULL;
> +
> +    qemu_log("\n------------------------------\n\n");
> +
> +    if (dump_tb_header(tbs) > 0) {
> +        code_s = get_code_string(tbs, log_flags);
> +    } else {
> +        code_s = g_string_new("cannot re-translate non-active translation");
> +    }
> +    qemu_log("%s", code_s->str);
> +    qemu_log("------------------------------\n");
> +}
> +
> +struct tb_dump_info {
> +    int id;
> +    int log_flags;
> +    bool use_monitor;
> +};
> +
> +static void do_dump_tb_info_safe(CPUState *cpu, run_on_cpu_data info)
> +{
> +    struct tb_dump_info *tbdi = (struct tb_dump_info *) info.host_ptr;
> +
> +    if (!last_search) {
> +        qemu_log("no search on record\n");
> +        return;
> +    }
> +
> +    qemu_log_to_monitor(tbdi->use_monitor);
> +
> +    TBStatistics *tbs = get_tbstats_by_id(tbdi->id);
> +    if (tbs) {
> +        do_tb_dump_with_statistics(tbs, tbdi->log_flags);
> +    } else {
> +        qemu_log("no TB statitics found with id %d\n", tbdi->id);
> +    }
> +
> +    qemu_log_to_monitor(false);
> +
> +    g_free(tbdi);
> +}
> +
> +void dump_tb_info(int id, int log_mask, bool use_monitor)
> +{
> +    struct tb_dump_info *tbdi = g_new(struct tb_dump_info, 1);
> +
> +    tbdi->id = id;
> +    tbdi->log_flags = log_mask;
> +    tbdi->use_monitor = use_monitor;
> +
> +    async_safe_run_on_cpu(first_cpu, do_dump_tb_info_safe,
> +                          RUN_ON_CPU_HOST_PTR(tbdi));
> +
> +    /* tbdi free'd by do_dump_tb_info_safe */
> +}
> +
> +
>  void enable_collect_tb_stats(void)
>  {
>      tcg_collect_tb_stats = TB_STATS_RUNNING;
> diff --git a/disas.c b/disas.c
> index b087c12c47..326d1a5208 100644
> --- a/disas.c
> +++ b/disas.c
> @@ -7,6 +7,8 @@
>  #include "disas/disas.h"
>  #include "disas/capstone.h"
>  
> +#include "qemu/log-for-trace.h"
> +
>  typedef struct CPUDebug {
>      struct disassemble_info info;
>      CPUState *cpu;
> @@ -203,6 +205,24 @@ static void initialize_debug_host(CPUDebug *s)
>  #endif
>  }
>  
> +static int
> +__attribute__((format(printf, 2, 3)))
> +fprintf_log(struct _IO_FILE *a, const char *b, ...)
> +{
> +    va_list ap;
> +    va_start(ap, b);
> +
> +    if (!to_string) {
> +        vfprintf(a, b, ap);
> +    } else {
> +        qemu_vlog(b, ap);
> +    }
> +
> +    va_end(ap);
> +
> +    return 1;
> +}
> +
>  /* Disassemble this for me please... (debugging).  */
>  void target_disas(FILE *out, CPUState *cpu, target_ulong code,
>                    target_ulong size)
> @@ -226,11 +246,12 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
>      }
>  
>      for (pc = code; size > 0; pc += count, size -= count) {
> -	fprintf(out, "0x" TARGET_FMT_lx ":  ", pc);
> -	count = s.info.print_insn(pc, &s.info);
> -	fprintf(out, "\n");
> -	if (count < 0)
> -	    break;
> +        fprintf_log(out, "0x" TARGET_FMT_lx ":  ", pc);
> +        count = s.info.print_insn(pc, &s.info);
> +        fprintf_log(out, "\n");
> +        if (count < 0) {
> +            break;
> +        }
>          if (size < count) {
>              fprintf(out,
>                      "Disassembler disagrees with translator over instruction "
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 47d63d26db..01d9658aea 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -262,6 +262,22 @@ ERST
>          .params     = "",
>          .help       = "show dynamic compiler info",
>      },
> +    {
> +        .name       = "tb-list",
> +        .args_type  = "number:i?,sortedby:s?",
> +        .params     = "[number sortedby]",
> +        .help       = "show a [number] translated blocks sorted by [sortedby]"
> +                      "sortedby opts: hotness hg spills",
> +        .cmd        = hmp_info_tblist,
> +    },
> +    {
> +        .name       = "tb",
> +        .args_type  = "id:i,flags:s?",
> +        .params     = "id [flag1,flag2,...]",
> +        .help       = "show information about one translated block by id."
> +                      "dump flags can be used to set dump code level: out_asm in_asm op",
> +        .cmd        = hmp_info_tb,
> +    },
>  #endif
>  
>  SRST
> diff --git a/include/exec/tb-stats.h b/include/exec/tb-stats.h
> index ec47cbecc2..3d2b167b0e 100644
> --- a/include/exec/tb-stats.h
> +++ b/include/exec/tb-stats.h
> @@ -35,8 +35,11 @@
>  enum SortBy { SORT_BY_HOTNESS, SORT_BY_HG /* Host/Guest */, SORT_BY_SPILLS };
>  enum TbstatsCmd { START, PAUSE, STOP, FILTER };
>  
> +#define tbs_stats_enabled(tbs, JIT_STATS) \
> +    (tbs && (tbs->stats_enabled & JIT_STATS))
> +
>  #define tb_stats_enabled(tb, JIT_STATS) \
> -    (tb && tb->tb_stats && (tb->tb_stats->stats_enabled & JIT_STATS))
> +    (tb && tb->tb_stats && tbs_stats_enabled(tb->tb_stats, JIT_STATS))
>  
>  #define stat_per_translation(stat, name) \
>      (stat->translations.total ? stat->name / stat->translations.total : 0)
> @@ -65,6 +68,8 @@ struct TBStatistics {
>      struct {
>          unsigned long normal;
>          unsigned long atomic;
> +        /* filled only when dumping x% cover set */
> +        uint16_t coverage;
>      } executions;
>  
>      /* JIT Stats - protected by lock */
> @@ -87,7 +92,6 @@ struct TBStatistics {
>  
>      struct {
>          unsigned long total;
> -        unsigned long uncached;
>          unsigned long spanning;
>      } translations;
>  
> @@ -107,6 +111,9 @@ struct TBStatistics {
>          uint64_t la;
>          uint64_t code;
>      } gen_times;
> +
> +    /* HMP information - used for referring to previous search */
> +    int display_id;
>  };
>  
>  bool tb_stats_cmp(const void *ap, const void *bp);
> @@ -133,4 +140,26 @@ void do_hmp_tbstats_safe(CPUState *cpu, run_on_cpu_data icmd);
>   */
>  void tbstats_reset_tbs(void);
>  
> +/**
> + * dump_tbs_info: report the hottest blocks
> + *
> + * @count: the limit of hotblocks
> + * @sort_by: property in which the dump will be sorted
> + * @use_monitor: redirect output to monitor
> + *
> + * Report the hottest blocks to either the log or monitor
> + */
> +void dump_tbs_info(int count, int sort_by, bool use_monitor);
> +
> +/**
> + * dump_tb_info: dump information about one TB
> + *
> + * @id: the display id of the block (from previous search)
> + * @mask: the temporary logging mask
> + * @Use_monitor: redirect output to monitor
> + *
> + * Re-run a translation of a block at addr for the purposes of debug output
> + */
> +void dump_tb_info(int id, int log_mask, bool use_monitor);
> +
>  #endif
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 207ec19b34..69f3a75fef 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -182,5 +182,7 @@ void hmp_boot_set(Monitor *mon, const QDict *qdict);
>  void hmp_info_mtree(Monitor *mon, const QDict *qdict);
>  void hmp_info_cryptodev(Monitor *mon, const QDict *qdict);
>  void hmp_tbstats(Monitor *mon, const QDict *qdict);
> +void hmp_info_tblist(Monitor *mon, const QDict *qdict);
> +void hmp_info_tb(Monitor *mon, const QDict *qdict);
>  
>  #endif
> diff --git a/include/qemu/log-for-trace.h b/include/qemu/log-for-trace.h
> index d47c9cd446..5d0afc56c7 100644
> --- a/include/qemu/log-for-trace.h
> +++ b/include/qemu/log-for-trace.h
> @@ -20,6 +20,9 @@
>  
>  /* Private global variable, don't use */
>  extern int qemu_loglevel;
> +extern bool to_string;
> +
> +extern int32_t max_num_hot_tbs_to_dump;
>  
>  #define LOG_TRACE          (1 << 15)
>  
> @@ -30,6 +33,7 @@ static inline bool qemu_loglevel_mask(int mask)
>  }
>  
>  /* main logging function */
> -void G_GNUC_PRINTF(1, 2) qemu_log(const char *fmt, ...);
> +int G_GNUC_PRINTF(1, 2) qemu_log(const char *fmt, ...);
> +int G_GNUC_PRINTF(1, 0) qemu_vlog(const char *fmt, va_list va);
>  
>  #endif
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index 6f3b8091cd..26b33151f3 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -85,6 +85,8 @@ extern const QEMULogItem qemu_log_items[];
>  bool qemu_set_log(int log_flags, Error **errp);
>  bool qemu_set_log_filename(const char *filename, Error **errp);
>  bool qemu_set_log_filename_flags(const char *name, int flags, Error **errp);
> +void qemu_log_to_monitor(bool enable);
> +void qemu_log_to_string(bool enable, GString *s);
>  void qemu_set_dfilter_ranges(const char *ranges, Error **errp);
>  bool qemu_log_in_addr_range(uint64_t addr);
>  int qemu_str_to_log_mask(const char *str);
> diff --git a/util/log.c b/util/log.c
> index 7ae471d97c..6477eb5a5f 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -50,6 +50,8 @@ int qemu_loglevel;
>  static bool log_per_thread;
>  static GArray *debug_regions;
>  int32_t max_num_hot_tbs_to_dump;
> +static bool to_monitor;
> +bool to_string;
>  
>  /* Returns true if qemu_log() will really write somewhere. */
>  bool qemu_log_enabled(void)
> @@ -146,19 +148,6 @@ void qemu_log_unlock(FILE *logfile)
>      }
>  }
>  
> -void qemu_log(const char *fmt, ...)
> -{
> -    FILE *f = qemu_log_trylock();
> -    if (f) {
> -        va_list ap;
> -
> -        va_start(ap, fmt);
> -        vfprintf(f, fmt, ap);
> -        va_end(ap);
> -        qemu_log_unlock(f);
> -    }
> -}
> -
>  static void __attribute__((__constructor__)) startup(void)
>  {
>      qemu_mutex_init(&global_mutex);
> @@ -206,6 +195,55 @@ valid_filename_template(const char *filename, bool per_thread, Error **errp)
>      return filename ? vft_strdup : vft_stderr;
>  }
>  
> +GString *string;
> +
> +int qemu_vlog(const char *fmt, va_list va)
> +{
> +    int ret = 0;
> +
> +    if (to_string && string) {
> +        g_string_append_vprintf(string, fmt, va);
> +    } else if (to_monitor) {
> +        ret = qemu_vprintf(fmt, va);
> +    } else {
> +        FILE *f = qemu_log_trylock();
> +        if (f) {
> +            ret = vfprintf(f, fmt, va);
> +        }
> +        qemu_log_unlock(f);
> +    }
> +
> +    /* Don't pass back error results.  */
> +    if (ret < 0) {
> +        ret = 0;
> +    }
> +    return ret;
> +}
> +
> +/* Return the number of characters emitted.  */
> +int qemu_log(const char *fmt, ...)
> +{
> +    int ret = 0;
> +    va_list ap;
> +
> +    va_start(ap, fmt);
> +    ret = qemu_vlog(fmt, ap);
> +    va_end(ap);
> +
> +    return ret;
> +}
> +
> +void qemu_log_to_monitor(bool enable)
> +{
> +    to_monitor = enable;
> +}
> +
> +void qemu_log_to_string(bool enable, GString *s)
> +{
> +    to_string = enable;
> +    string = s;
> +}
> +
>  /* enable or disable low levels log */
>  static bool qemu_set_log_internal(const char *filename, bool changed_name,
>                                    int log_flags, Error **errp)
> @@ -523,6 +561,7 @@ int qemu_str_to_log_mask(const char *str)
>              trace_enable_events((*tmp) + 6);
>              mask |= LOG_TRACE;
>  #endif
> +#ifdef CONFIG_TCG
>          } else if (g_str_has_prefix(*tmp, "tb_stats")) {
>              mask |= CPU_LOG_TB_STATS;
>              set_default_tbstats_flag(TB_ALL_STATS);
> @@ -553,6 +592,7 @@ int qemu_str_to_log_mask(const char *str)
>                  }
>                  set_default_tbstats_flag(flags);
>              }
> +#endif
>          } else {
>              for (item = qemu_log_items; item->mask != 0; item++) {
>                  if (g_str_equal(*tmp, item->name)) {


