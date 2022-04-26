Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637FE51000E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 16:10:00 +0200 (CEST)
Received: from localhost ([::1]:33130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njLt9-0001l7-2o
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 10:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1njLsE-00015F-TB
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:09:02 -0400
Received: from mga18.intel.com ([134.134.136.126]:45860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1njLsB-0004Ek-V5
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:09:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650982139; x=1682518139;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0dGBkCrb6x3PeNQyXwkEugNjcutM+CTalah/Xb69l+w=;
 b=kkW3nyMohq4m/zq6DswzL7QDuZ1649t18NiXZrBtb/ZpjyMQNACKJD+L
 N6sDfpLzFqbmifU3EuaoUYSBgYAAn1bil3h1yFw+X07cu+VRaEQH0KOUS
 qIkwsaaaDfLwxZmIagvRibH8gEunp5K02d10CyxICMtCeB6aOx97AYzbE
 DF+pMTU0ytIZ0+kU+Ac+jf22kWKRdyiusYpcNAv0mJdvpiIHSquq/JHcZ
 tUrhtdxlsIuzRkNBx+u5sRwx+Gfh4Gw7VLaX22l00UrkGpyswg9CqT1qR
 n0qECIkLpIMKGEI6N6aGtvvhx+7RqCtxVGtSVNieOJv8v2kQILL6L0IZ1 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="247519174"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="247519174"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 07:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="513169422"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 26 Apr 2022 07:08:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 07:08:52 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 07:08:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 07:08:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 07:08:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkRrJiX41LYyRcVUNmSl3R2c3D+zI4VJm7mpdPKNAAH+dqIn4WgT9p62iAOEE8m+NHCoyjPXvL2qntNZJVp9W5w7LVfxDuahZJvMylZsM1bmbNd2jXEQDgTLA9iDbzEFD7LQv41HzGKM0DDnvNfecJuoAjN7fj8lQxvqDnNsOhr7S9Ej+xjzMvCd9hwHT61ssouUZuXtjHpnmWXYLe51umUCiBeJkTL6/G6YZHhhaHRqNPaKpX0JOe6kk9XA6Cq5FE/nqT7hHDC1PBUbTxouUvSksagiqfvY50FnWqex497WFDL59Au2sHYxasgNFNo43x0raZnxLW1OSJilAj266w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osQ0oF3MLbWFzIQk0iGIZvyG3gWTwEYtnU04LFIrUBU=;
 b=UwLO9MfiZarqRzzkNX8A6FWKxMS+XYN1B3QykoxYTvB/Ew82jfEEu2WHn+IrMoyN/ybJPcXnWTG8kmmWA/WWi5RvqWw0ULAuOEWeXvQwTYFwE/RDaHznYqHwA25pTswbjc4TzLfChRrO8IcOfyUR+fRxuUxJ0YnhTpKiV1PXR7/SJNB7Nl7XZyc1AXp1vIgFkAEfDirXe3WQt2Ag4JymdOXoEE1pAB5JUVq67ILzPgFq8l1D/4Fh1yE4jqpIjKm43cTDqFcDG3XgL6r/HLr34fJ0w+FJAWnOWp34n4EjOlB1BcU1Vx5ytbdvDyVKxbifCuIkggUZfTcdNB5JO6sieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BYAPR11MB2629.namprd11.prod.outlook.com (2603:10b6:a02:c6::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 14:08:49 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::71d2:84f6:64e1:4024]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::71d2:84f6:64e1:4024%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 14:08:49 +0000
Message-ID: <79de081d-31dc-41a4-d38f-1e28327b1152@intel.com>
Date: Tue, 26 Apr 2022 22:08:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [RFC 15/18] vfio/iommufd: Implement iommufd backend
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <20220414104710.28534-16-yi.l.liu@intel.com>
 <20220422145815.GK2120790@nvidia.com>
 <3576770b-e4c2-cf11-da0c-821c55ab9902@intel.com>
 <BN9PR11MB5276AD0B0DAA59A44ED705618CFB9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220426134114.GM2125828@nvidia.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20220426134114.GM2125828@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR04CA0048.apcprd04.prod.outlook.com
 (2603:1096:202:14::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e70386d2-d97a-4fe6-6b00-08da278e492b
X-MS-TrafficTypeDiagnostic: BYAPR11MB2629:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB262942FA6AAF8470D764F5E7C3FB9@BYAPR11MB2629.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q8JtKt+6jYk/c3CnVSVL/YkI82FV75yngF1gZ1aapyliF/uI9OrkNppZzwsXrmN0xHgb7SVXICHkACWZ1Kk0JxkgnRdjJEfj6xn2F7kXCAKsuWmha2QNVCoCv3DdMYjmC84in+udXMGolop5tiro+8BW2HvYB2j2vMqGeU1Z0IZg0VbwD73NZL5888HhVvXYGJjJfZrw11sDyXGuTtcQ7JvFGL5V7nZLM47UGFsUWGouOncAZqSCzFRaeU7NkRsB7j96oaTb9b4sA94jl8jZnOIPzLQ2qFM6MVPiDb0FJBJwFu48GALljxb6CkvzvJG11MhcPIQQ/jmbH7oPC/vwEEjH0F+iqjaWTiqNPvDlL8H+IKYgO7R4d28qBprwXTGAr8ZBLYwrqiQBD5pMpmUq0R5G9EYR4scDP3K5YnWnN2DV/gDpvD0z6MK05kaCRnaqgP9nb8pYBZP8HTsYpU0nbM62w1Gx7o1PQIbuuoRk9rZ3mbb7WvOvCz4FR6NC8cmfYpo6/k6jpoby2wQQg2g6eMmOo0m04GossCFIMRLClm9W+MT+8PLULAnQeSGo1sF8v3edAHFef/HgBjy2A1eUpc6LZdqUjaZ0nV3ndNAFWfAApVjqqxOKu3eU7pmHm+a1oNlL8qlCEgtyPqxZqTeQCH8yHUNcc4KviN8Qn8aRrwFO5CuJa8aaSQVzj8GnV2eNtGhc3kKGZEipWM6QnaLMPhq9aRmWXDHPL+mB/MEVDp/EsimqaLgSsOSArAwZwa2p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(2616005)(31686004)(38100700002)(83380400001)(6636002)(110136005)(316002)(66946007)(6666004)(66556008)(4326008)(8676002)(66476007)(8936002)(5660300002)(186003)(26005)(86362001)(31696002)(36756003)(6512007)(54906003)(7416002)(6486002)(508600001)(53546011)(6506007)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTdSQ3ZXZHJXK1ZZL0FLSmdoYkpvdmJPcHBHeXowa0xqNk4wV0d2Z3pjRGpE?=
 =?utf-8?B?NnlRNExrelp4TW9LZXpiRUs2b1ZIT09HcFdkdGFnMm9jM3gxQXBLbUYzbDF1?=
 =?utf-8?B?bkdYbEc5ZEtQVyswRHJDaG01d1N6TWVEL1c1Um9YYThMT09vSmhYS0tTSUs0?=
 =?utf-8?B?VWRrYmtVZk1ESWI0R0Erd0FaY25nc2xmRXVmNmpyUFNSVzd5MUJKWHpHblZP?=
 =?utf-8?B?bkhVWXROS2l1alFLRTNQcEM3K2lmaEtsRWZ6SjRWeXJ6Z2s5dnlxNUhWTGdu?=
 =?utf-8?B?S3E3bnQ2R2lRaVhrVGNHUXpzeFo4RmtzWWZTUUU1UFZWR1doNzhaVFhrQkJL?=
 =?utf-8?B?Q01FbDZFOWx1THdDdHBLMncvaTdsc0RhU1dEVklLOFRKck4zS3ExcFdQcjIr?=
 =?utf-8?B?M1dXczFWRTZCT2V1MHdaQ0owN1FEY0NKTVVKVm9jQmc2UndYaFN2N3MvbG5J?=
 =?utf-8?B?clBZQ2JmL0UzM2tVbjV5cHU4RTd2WXl4WXlKNndORXNPUk5QQXRqeGFEcFZI?=
 =?utf-8?B?S09HTGFYMUpyNW1JYmRPTHFuTEw4QURySFB0RDVpN2hwKy9Sc01zSE9ub2tr?=
 =?utf-8?B?UnZsMjdnb3Y0bkFsVTc5SlBaeUdXVTloVCtpelY0V291N0VDN1Z1Y2U1YXRv?=
 =?utf-8?B?ZFZGRmFHWVhaYzcvejBpS29TUWVaa09ybktiUmhFVWE5ei91N1RIeXpLV2Yz?=
 =?utf-8?B?YllpNnVWc0oyWkxlalo2azNkaHpZaFBVTTBCejh6MDFsV3JTMXduOTU2Uldj?=
 =?utf-8?B?a0ZEbmhzcnlBUlc4S05XbmxOT280bVBHV1p1dzJjZ3VMOWloQ245VWh5NkJj?=
 =?utf-8?B?MTk2VEV5SGJaWTdNSDhLUXZiQ1Q4ZytXNVZEeVpKai9sSWUwM2gwSEhDQUZr?=
 =?utf-8?B?M2k5M2xwb3NyNVk2Y3BSVFpNSXBLOGNNNzMyeUphc0llZWFReUhjWDkybU9M?=
 =?utf-8?B?UHpzcWVGNjZCZm9DallkUHZkVGY2NzdGOVQzakJHWUlDY25JM0ZuNFJKZ2FH?=
 =?utf-8?B?a29qbWVOTENCaU5sY0FiTm5EMGxRZFUvdkthR245Qnp5cjRnWFpzMFZFWTZ2?=
 =?utf-8?B?eFNNUmtSZktKZXZTR0s3WUFHcDlmVDd4eUlXNzFLYUtYNVRyUGdNSStQSlBk?=
 =?utf-8?B?NjJ4L045SkRiaTZObEdQNDkyR2d1czhEUXQrZGxLaFROaEFWQTlzMzhGY3Y5?=
 =?utf-8?B?bmtXN0JoS2NsdzZSSjc1K3orMVU4YkI4TkhQQ2hUb254T0pZOFZsREdVa1pq?=
 =?utf-8?B?d1R2UlgwandqYlVTRFN4ZlZKRmNuZlUvYlBXZXV5TDQ2N3VyUDhYcTk2SG04?=
 =?utf-8?B?cjNLTEVMTHhxUjlzU3J6UWNuS09QOExMN2hsYVZ4TVR6NTZHMGJDVHpIWTZ1?=
 =?utf-8?B?N3paT1RNWmFoOS82ZVJOTVYwajM2M1hYdWttd0QxMHByMUVoanFIUVlzUkFk?=
 =?utf-8?B?blEzTmJyMUdpdVRaeG03L3Y4OUMrVUVZS2llWGRyM05vWjRzT24xK0R0THMx?=
 =?utf-8?B?QmJuTXRIOXkwTjNJT0RLbUVTc3pWZzNYNTNtODNsZ0FVSWZqZlNNWHVvMDd5?=
 =?utf-8?B?N2VITFBSRUo5a0Y4M0l6ZlJYMUdyOVJJQmxIWG12b2ZNNmt0cnRwNkV3T1pi?=
 =?utf-8?B?bWMvSGVmYTZuYU9GZlJVSUJmRmEvaTVycXNwdHIrWEdiQWc2Y3lva3lrWCtD?=
 =?utf-8?B?ZEEvOHZOeXhDVmhhbEkzVVROVWYwYmlIb1NJbWNyblBpbkxobWFYQTNTbWgw?=
 =?utf-8?B?V2xncWNEVTJjak5JaDhoWTZqVWxlK0I0U0d0YkVtOXQ5VnVqMjhCWVp2T1Rh?=
 =?utf-8?B?YlQ3KytsSUkrbXhMUTR0Vk1QQlM2dmt4RW1wYVhaV2VydmZZV3RWdytidnZO?=
 =?utf-8?B?NnpyNFJhamFMYmJ4bmU2T1JLRlhuVjhiN3FjeGUxODBabUIyTm91UytUVWtx?=
 =?utf-8?B?bE1uemdxcnQ3RlJoV1RhR1Nzck9iSWkvaVFqc0l2NDVZU0dhSzdZVlMrNXNS?=
 =?utf-8?B?Z1R2ZXZFOWREYzVISUJxS3lyOEpuSU1zYTBiSzNlYiswY2ZTMldTdjQrVDRZ?=
 =?utf-8?B?MzNWWXlwK1kwZGVVZWovd2FmWGVjaExPcHQ4NzQ4TFkzM3hCM2JidHNqTFBH?=
 =?utf-8?B?OFdxZlhvOG80T0pPWE93VDI5d1hiSEVlTmp2djlNYkF5Vk95eE5VUEV4WTZi?=
 =?utf-8?B?MXlQQUNDc0NPdzBsaUM2TlhRZTlZUnRzZUZhSk40L0RYdSt6TnNDOHJ6aytX?=
 =?utf-8?B?UnMyTDdPTHlicE1MY3U3aVRRTjBSeGo2YnFSZ2xZaGhKUWJ4YUowbEtXVm5B?=
 =?utf-8?B?SVlNU08zQ0JJUDU3ZTNLNVJmYVpIVjhKaURNZW5HdmlLQ2R6dE5Idz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e70386d2-d97a-4fe6-6b00-08da278e492b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 14:08:49.5579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGy1ExWsAEmKMKWCjcf1Q2WNWwdf3GzFlpGvXaMrwLw3BG0gvikZbrZb0Y5OC0CtznTB0K2jATCfCgLIwqHP4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2629
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
Cc: "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
 "Alex
 Williamson \(alex.williamson@redhat.com\)" <alex.williamson@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, "Sun,
 Yi Y" <yi.y.sun@intel.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/4/26 21:41, Jason Gunthorpe wrote:
> On Tue, Apr 26, 2022 at 10:41:01AM +0000, Tian, Kevin wrote:
> 
>> That's one case of incompatibility, but the IOMMU attach group callback
>> can fail in a variety of ways.  One that we've seen that is not
>> uncommon is that we might have an mdev container with various  mappings
>> to other devices.  None of those mappings are validated until the mdev
>> driver tries to pin something, where it's generally unlikely that
>> they'd pin those particular mappings.  Then QEMU hot-adds a regular
>> IOMMU backed device, we allocate a domain for the device and replay the
>> mappings from the container, but now they get validated and potentially
>> fail.  The kernel returns a failure for the SET_IOMMU ioctl, QEMU
>> creates a new container and fills it from the same AddressSpace, where
>> now QEMU can determine which mappings can be safely skipped.
> 
> I think it is strange that the allowed DMA a guest can do depends on
> the order how devices are plugged into the guest, and varys from
> device to device?
> 
> IMHO it would be nicer if qemu would be able to read the new reserved
> regions and unmap the conflicts before hot plugging the new device. We
> don't have a kernel API to do this, maybe we should have one?

For userspace drivers, it is fine to do it. For QEMU, it's not quite easy 
since the IOVA is GPA which is determined per the e820 table.

>> A:
>> QEMU sets up a MemoryListener for the device AddressSpace and attempts
>> to map anything that triggers that listener, which includes not only VM
>> RAM which is our primary mapping goal, but also miscellaneous devices,
>> unaligned regions, and other device regions, ex. BARs.  Some of these
>> we filter out in QEMU with broad generalizations that unaligned ranges
>> aren't anything we can deal with, but other device regions covers
>> anything that's mmap'd in QEMU, ie. it has an associated KVM memory
>> slot.  IIRC, in the case I'm thinking of, the mapping that triggered
>> the replay failure was the BAR for an mdev device.  No attempt was made
>> to use gup or PFNMAP to resolve the mapping when only the mdev device
>> was present and the mdev host driver didn't attempt to pin pages within
>> its own BAR, but neither of these methods worked for the replay (I
>> don't recall further specifics).
> 
> This feels sort of like a bug in iommufd, or perhaps qemu..
> 
> With iommufd only normal GUP'able memory should be passed to
> map. Special memory will have to go through some other API. This is
> different from vfio containers.
> 
> We could possibly check the VMAs in iommufd during map to enforce
> normal memory.. However I'm also a bit surprised that qemu can't ID
> the underlying memory source and avoid this?
> 
> eg currently I see the log messages that it is passing P2P BAR memory
> into iommufd map, this should be prevented inside qemu because it is
> not reliable right now if iommufd will correctly reject it.

yeah. qemu can filter the P2P BAR mapping and just stop it in qemu. We
haven't added it as it is something you will add in future. so didn't
add it in this RFC. :-) Please let me know if it feels better to filter
it from today.

> IMHO multi-container should be avoided because it does force creating
> multiple iommu_domains which does have a memory/performance cost.

yes. for multi-hw_pgtable, there is no choice as it is mostly due to
compatibility. But for multi-container, seems to be solvable if kernel
and qemu has some extra support like you mentioned. But I'd like to
echo below. It seems there may be other possible reasons to fail in
the attach.

 >> That's one case of incompatibility, but the IOMMU attach group callback
 >> can fail in a variety of ways."

> Though, it is not so important that it is urgent (and copy makes it
> work better anyhow), qemu can stay as it is.

yes. as a start, keep it would be simpler.

> Jason

-- 
Regards,
Yi Liu

