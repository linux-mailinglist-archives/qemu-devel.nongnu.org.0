Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F2E4EEE64
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:44:35 +0200 (CEST)
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHZq-0006lF-ON
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:44:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1naHYh-0004ag-Ip
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:43:23 -0400
Received: from mga18.intel.com ([134.134.136.126]:39141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1naHYe-0001xr-QP
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648820600; x=1680356600;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6UNPvboM0ZAmw7aKbzi1BpaE9HO3ZVuirGuqzrs9t2I=;
 b=kxXhX9MwTLlELJdUNzjigbYx3n3/5bmJUFzLlc5n2oVZvwIZ+opZgNHt
 UVtmlQI00KUq+AY4XYhHJjM4GPn4FARnLK/N9Dxf8ypssxdm1KR8gNooN
 U5lO7XpKubk2tb3JSCVEXA7+uDZJch0qzbVQNn7j3C+14/KzVDzoJgvzL
 RZsCeZIMwwENthkrL6e2VsSal5rSZ8ncBBuCZYOz4/t/FOz8lSBHPBDqW
 fZiiJWBZaocaPYExmjpcMspYAc5BK68+w9lNiv1CUyyuCyo2NuIXSDEGC
 efF29V9c69qlvNJOKn1p0DaKzOOFaF0ejv7mOMvhErpjrIbnvF+FL9/QC g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="242284190"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="242284190"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 06:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="521404918"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga002.jf.intel.com with ESMTP; 01 Apr 2022 06:43:16 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Apr 2022 06:43:16 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Apr 2022 06:43:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 1 Apr 2022 06:43:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 1 Apr 2022 06:43:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6dmoxetguIocKdfmpjdbchEGsOx+hS3D3nIGP1wDjaTfzex/XflysNVL6tz5fXb0BjHq7EB8UcuvzqoHyPhK+NDNPaPyXYPZF0gzC+/W9Bje/4XSV6gxwvIxEZOU6qrExuGF5tcOofsnX+x1UJJoiY2ACO5KrCUCrR/V+1LMntkxnmU3H0Nj7rs12xT9Z4o/M4A2rDXFhBVssJ1k3wFKDOZgePYPQ/XUtU0FTLUQ2mtDhZqA1X0lWn75geHeZv9Qwbt6Q+i52zy8ARr6kvqras80lpsLkg4bOV7oOfI/JWD+qdmZpUVWRbvtSaa4+UNuLTmwMGr2pBLQr3wm/2AtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tdIaPwH4X5TtAVji9Qy/oInR19rAf7NqDgOGmDcnc4=;
 b=HROC6yUu+G5+Qv5mPTNTbzECgz7wr/02fGKVVwdbdC33SM7sWezs743nEnxxxlWyceWX+o4FpCsq6YK0Z3FKJPUBcTB9F5bq0OFaOHX2vviTK5U+pmfDj85luOkEM1/pry5bF02K1BzhKBoghtAMKqIw35me8S4czA85Mq+w+kHFzeZFUj/jKZZr2TOXTFL1roA2p+OZvLtY8aPDIryTDKdBZBerHGiQBv7ib6EWJFrka0MvQFT6cIV0CH2IHbsxcYZfcbZVwi0UdF40xNu1y8nXVc1bywskWZ6Jlkl5MtYhqsb0Gkyb6LbEIygtfcZxVvboLaqZKwFRaj84R790Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM5PR11MB1292.namprd11.prod.outlook.com (2603:10b6:3:7::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.29; Fri, 1 Apr 2022 13:43:14 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::bc9d:6f72:8bb1:ca36]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::bc9d:6f72:8bb1:ca36%8]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 13:43:14 +0000
Message-ID: <622b7452-aa9c-fae4-e5c9-218ff995ef5d@intel.com>
Date: Fri, 1 Apr 2022 21:42:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH V2 4/4] intel-iommu: PASID support
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, <mst@redhat.com>, <peterx@redhat.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <32a3546f-d058-07ac-46d7-7d1becd305d2@intel.com>
 <e3feb385-b623-ac41-b721-3dd03bbb49e1@redhat.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <e3feb385-b623-ac41-b721-3dd03bbb49e1@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR0302CA0023.apcprd03.prod.outlook.com
 (2603:1096:202::33) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 244630e0-13b0-4d83-12f7-08da13e591a8
X-MS-TrafficTypeDiagnostic: DM5PR11MB1292:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB12927D254E6A7AF2038E50E5C3E09@DM5PR11MB1292.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zZipoqITX3Pilp72xF+lcqX1mdZL2iAuazBTgzzgS+dVRB4m3JIkrSjnrYDqTG4b2ajPGXPb1CGis4LQxe5QfnJG7ETrot8MhX8g9+wwKWW7Zq8d/gYlqH2D6DEMhnI1yuOEfsJ4QKIIU5GqADN/e4WOV6abB9rKzzlBkdGdNAexFmG0+qmzCjK35AILoXvnKqRld+7ZBjDNa/ziPjtaqiSOUh3nVeZoS+YwVI50EIPhIY4Y72O7NppCMaXGyA065aq82G1CDNz5qJCQJbbBVOdvY/VdhRTCJgUQWJ1IXr1lckfObJ+FklFaEhxVt0BQhEmV5fyDMLqxPvHz8P8JlrtmtngESE6Fxo52Boj2Vd4MwwIgc8u/nH8+I7+Sozxj9303uJRv47WvmGZv/D01D3bOKwWDpQK11zbM/tR6F61w9f7ZY+tKA6hqRVLmA+Y0uEmoS1f5Qe5lZXrz2LAJ6v6oq1Jj+FxBBTKAmh1SWfYVKwrq12W2AOb3GJUmXccyrAZoYm5lx+zmGzsrRco40sSwl2g/LQA6E8+jyPQnRfV0lsFpbk6un2FNI9kNKRyELT81p1D7LUmWFBr6PF6y9QsMsEhNU8ANrlmhs3AItv0r1DLpq1FLbp3htbBPh3tyxcU2bN5bc34xgaluM4UauMnsFoy8QPLvmpuevN9Jw+s4BGi8AhryphsJmCSwJqzKts0TmOb8qoi9ZDQJrwm5NlILMtS5WZxMqEAiXcGK2NhEd/IRZ5FLHp/fRiPnl1xU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(6486002)(508600001)(8936002)(6666004)(4744005)(66476007)(66556008)(36756003)(66946007)(5660300002)(8676002)(4326008)(31696002)(38100700002)(2906002)(86362001)(186003)(6512007)(6506007)(2616005)(53546011)(316002)(26005)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmVZQW1uMXVKYU5IV3ZLR0hBVFhsTVZhNU1kSzBXSXdJL1dMYXhyZkYzSFg4?=
 =?utf-8?B?TG1oTTFGSFV2UWs0Rk5qNXNxT2ZVaEYxVTNEUWlybERGRFFYSWhZYXRHMjJn?=
 =?utf-8?B?MEJQRWlydU1lUTNBRnVZQUc4L2FOa3daUnV4OW1WOXdyV3R4SjJ1eGJ3amVw?=
 =?utf-8?B?dVJycWN5TVoyTzhsWU1yNU0weldIeEJNUVA3VCtWRGRIaTdpTVlKK3psdUs2?=
 =?utf-8?B?dGFHaW5FRmRJNkdqM0lSdDY3Ky81UlFVN1RZa0ltcHdmTVluQi9RaTR0Nmlu?=
 =?utf-8?B?SW02L0dSTXFYOWJzLytpQ0lHYXZIdkVvRkU1SW9FZmVZL1ZNb3ZERmh2RHNh?=
 =?utf-8?B?cFN6Tm9PTnJKYWxPUFc5TUlkb0tFclpLaFVaMjJYT3liUFNNRFExUVFDOW5z?=
 =?utf-8?B?N3d2Nk5iSk9aSkRDdUhwcFlBck9lMmRPc3hDVGo3OTQza2REZmkyMitySnRv?=
 =?utf-8?B?SUg5M3Z1dnFUZzdxOHM5d3ZFckJiQ3lkalZiQXBsdGFhcFhKRmxWNUZOKzRX?=
 =?utf-8?B?K21TdGhhNXE4dTFHQS9zcjJFOEs2R1h6c3g1VXdYU3k0NTQwTU1rWUk1a2hB?=
 =?utf-8?B?T2dwNThwUVZNRWF3ODJFZUJndFU4TFhZL1FnZE5mcHdIL3BGY2VoRTVqL3FP?=
 =?utf-8?B?OWF2SCt0L2hVY05iNVlGdW1jaDlhU2RDVk1WWW05aDRyVGIrZTBmYTlzam5u?=
 =?utf-8?B?dU1XY1F6QkpQaUZ4bDVaNlNjZzZSOWdWWFE4b0xkQ2Q0UjBGQmdaaTdlM2x5?=
 =?utf-8?B?ZlN5ZFRwTEd0SDJOVzZPeWVVNWF2Y0RSZWh2bk5LQkNQbUgxQnZ0QzlUeFlP?=
 =?utf-8?B?MkhZcVpHWTJNb1BzWWJ4dE9obW5sZkFHR0lCYWNKcEJSdG5NRzY5eDJXaGdm?=
 =?utf-8?B?M004SHB6R0ZmTWJLaWtOenl5RmsrR3ZhYTNUclI2VjgyWGRybG9ScDh3SzRP?=
 =?utf-8?B?bklxRVpJdFNwYTdpdFBjU0QrOGw4MVpmU0hjZDhtb3d1RlQ2QWorYWtXR3Yr?=
 =?utf-8?B?SnhDOGQ3WUgzanYzWnBMbEpqT29KdDh6dVhKa3ZWaytub2NJR2laSm5rdjJI?=
 =?utf-8?B?UitQVzFETHUvaDlZeWQ1V0JJQ3RURjNITWQzSWgrVFJUNVZOdlJZWWEzUzNX?=
 =?utf-8?B?ZEUzWnoycHpYcFBZbnRMcjJNOVh4eTNBaEIzQkRKbzVkR1ZaMWN6M1Zkek9z?=
 =?utf-8?B?bzI1ejFtWEdrbUFOQmVLcmtrdk9UR3JzMCtoRm5tcmp1OVhyVVJhbmhUV05I?=
 =?utf-8?B?RmtmdGlFdlBxUjFJdytiSVNDN2NqVzdYTkt5b3lSSjloTzZiRzdycmswTEYr?=
 =?utf-8?B?UldRb3BVMVBvQ0RMQkpZVFlVT01kaTV4V1dFQUJ1UlNkaHpTOHJ5TmlBQzRn?=
 =?utf-8?B?K29iVXFmVkRSRTczYkVsZHB0aElpNjF0a01BaFBRc2Q4ZnhDVFNPSzZpMjhz?=
 =?utf-8?B?R3ZYbVB5cVM3dzRxTS9kRVRadHlwQ0NwQkZhcTlZRklYWkJBc25mWFNXQWdn?=
 =?utf-8?B?SXhBRGxNZ2NTbmVkc1B6bVowdFpaZ0JtdWN3S3VQUW56aHRnaWQwenpUeGoy?=
 =?utf-8?B?WUJ0aUVFdmFSM2hqOEpYd20xbU1qdHMvdkxET3RMYzBodjFjNzdycGRHN25k?=
 =?utf-8?B?WVdEWndIc1NsdmNadFpWcXAreDVqeWZKMkpQTmlOWEtxYXFROFoveWtKY1FP?=
 =?utf-8?B?K0ZwNENuR3A5S21XNllJT3NrdGJPY0Y1SXErbDRLaGZQdXpsWjgzNC9iSkNR?=
 =?utf-8?B?eFhwL2p1OUtpcERwWkNOL0oxdXEyczJBM1JaUzVXaXZyMWhtSnpKNzVHMzFn?=
 =?utf-8?B?bEt6NHpmVXgrZ1l2UEVWV1BzenhwaVUrU2hZdFgwOGtMMVNzMVFmM2tQK0FF?=
 =?utf-8?B?dUQ3eGtwMGFyd004YnFqQkVwNW5xNjRwVms2bloyb3RUeU5VbExGbmtKMmVr?=
 =?utf-8?B?aFpQV0lSMFl2bC9OdjRCZ1NySFpHRmhHby9rcmI1ajN4RVdjRlFpWFJDQ3A0?=
 =?utf-8?B?VzdZOTlBMzgwWG9WYjBEWXNqNGpBMkpqbnk4VmJ3YnA4Ung0cmR5LzdGY3N2?=
 =?utf-8?B?UlovS3VkejhmMVpOT1ViaWJaY1RReFJwYTROUHhkY242Wk51a2RoNkxXWk1Q?=
 =?utf-8?B?S1NpL3dnYzRibjMrOFFRcnd6anFQeEhJbGtYOEh5eXg2OFhjT3NsVW1tYlUx?=
 =?utf-8?B?RmhiWEVCZHM1bUZnMGZ0UkE4bXErUGNEak5xY0ZENTBqamcwMytoS3g5U0hJ?=
 =?utf-8?B?dEJzU0F6dlppcWFNOWZjak5ZdGJDVE15enVvV28vSGN6LzZjYi9hTWgyT0c0?=
 =?utf-8?B?dExGT2RkaUN6STFxRVltUW1ZQURhTmxHL0pHTThLREZsc1pra25LUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 244630e0-13b0-4d83-12f7-08da13e591a8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 13:43:14.1463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDpDgCoMz+7ZVr5PC1xLdXNViLZziVdQD+BtvCTrc0yuGztgcKnG0uAm0ou2+DVOL4vXhC4WtwMMuEWnyrPckQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1292
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126; envelope-from=yi.l.liu@intel.com;
 helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: yi.y.sun@linux.intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2022/3/29 12:54, Jason Wang wrote:
> 
> 在 2022/3/28 下午4:45, Yi Liu 写道:
>>
>>
>> On 2022/3/21 13:54, Jason Wang wrote:
>>> This patch introduce ECAP_PASID via "x-pasid-mode". Based on the
>>> existing support for scalable mode, we need to implement the following
>>> missing parts:
>>>
>>> 1) tag VTDAddressSpace with PASID and support IOMMU/DMA translation
>>>     with PASID
>>
>> should it be tagging with bdf+pasid?
> 
> 
> The problem is BDF is programmable by the guest. So we may end up 
> duplicated BDFs. That's why the code uses struct PCIBus.

how about the devfn? will it also change? taggiing addressspace with
BDF+PASID mostly suits the spec since the PASID table is per-bdf. If
bus number may change, using PCIBus is fine.

Regards,
Yi Liu

