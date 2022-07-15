Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BF4575A0E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 05:43:13 +0200 (CEST)
Received: from localhost ([::1]:48508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCCER-0008Qe-Q4
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 23:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1oCCCq-00074E-14; Thu, 14 Jul 2022 23:41:32 -0400
Received: from mga18.intel.com ([134.134.136.126]:65480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1oCCCm-0005aG-Fl; Thu, 14 Jul 2022 23:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657856488; x=1689392488;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Pq0Y7izCXgie0H6V2I7M4cD3/EV0cHVmEEtfqr0CGXU=;
 b=ZNopy+P3OYPBRG4oPMBGjsaj6x7x6aBPnre+UBrRGXxRaOZKmnZiztOs
 w3ZtBvsPSFv9TjWLFky0WW0lnyiBYoI8hbGXd5wQ8rlmBP/Zxz9T65HuH
 qAlJ1zXodM0Jh7Y9ffdBEtZGLYobOm3EDrmWrj6w3l9/8XzRXqzQ3AVdK
 hEK8/H9TIiDHeUclOfhl611GwB1UGcr9N+MfR6w03iLtD7JDknEupAyIs
 G9zF8mpQ+jtSj9Pi48bNdf6HPwwZ2PwJYoSprFLQQdxeyhW49tlOyh8dz
 il9YKJv4/gkPMjSmxh6DCqIEmv51FRuOsaHWLuFA6dkvuTaG/9CFFsp/G Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="268717885"
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
 d="scan'208,217";a="268717885"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 20:41:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
 d="scan'208,217";a="571357751"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga006.jf.intel.com with ESMTP; 14 Jul 2022 20:41:22 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 14 Jul 2022 20:41:22 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 14 Jul 2022 20:41:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 14 Jul 2022 20:41:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 14 Jul 2022 20:41:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UweP3BLYU66QVoAq18NJGzRfw1RGV5z3DJu5R4tc/LfLJspdAnc6ge4WHwGYMBwe7JTOI1TFwvQTbLiASJYNsAaY8y1kKdNHvczrUOgFxp+Ytx45dA89vweynMax04pTsrJj7X6sqbyaTCDYOZN5sTx9kQdRsUMQ/pdHk/zhQ+r6ypGbU796SSvyU52YM/xQ0XnwDfshm0Ssioca4Obm5Y+quKCdszM0kDKpAemdQ/57zP7iB7StJgOnNHQjm2lB7jfneWuHgnbqlr//BtlbZSMQ39NpscCXDTO2IY4I8u7O5rPqBLNGJQN9wwZ5cIiM1zJgXgPlDu3oP7dpWpk2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQ+C2xgUuu50NT9bbiyi9+/hTbkHx4I4y3jVK/JlMvI=;
 b=eayFjek1pC4aaXmz2oNkIbVKTMvrSeS/MwPmEAMqbWHtkXDWE4Zvk4LREAAY8fBGhhjkzJx38I9n+c/oDpHtaIYsOABV6mUwvzV8DlFeFG+tgXJobyYeU/KKVe59kpjHl/WIat+LLKk2G+ZPwHqoV+Q30igO1gXVluIBfU3s74gZQZTgfHJLK5U5kTMKRV8uVZ6A5wD9Trjd2nSR8nPxjyt9EUdkVKlLJNruKQI9qpfORKtG04evzOA2w9JwlzDFEVn5/YxgQdVtLtm2axsV9qYq++ZQ4fZOx4mAl+nR77824frik7XFVZMuLF9cUn60nj2/Xt2DPbS8fANju4Ui2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by MWHPR11MB1392.namprd11.prod.outlook.com (2603:10b6:300:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 03:41:14 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::2475:12f6:2488:263d]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::2475:12f6:2488:263d%8]) with mapi id 15.20.5438.014; Fri, 15 Jul 2022
 03:41:14 +0000
Content-Type: multipart/alternative;
 boundary="------------BAn2weZOu8056aK7yH3NzW1K"
Message-ID: <1daac384-4a16-8244-c94d-afe77446cfdb@intel.com>
Date: Fri, 15 Jul 2022 11:41:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH 1/8] hmat acpi: Don't require initiator value in -numa
Content-Language: en-US
To: Hesham Almatary <hesham.almatary@huawei.com>,
 <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>
CC: <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <imammedo@redhat.com>, <wangyanan55@huawei.com>,
 <marcel.apfelbaum@gmail.com>, <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, 
 <mst@redhat.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
 <20220711104436.8363-2-hesham.almatary@huawei.com>
From: "Liu, Jingqi" <jingqi.liu@intel.com>
In-Reply-To: <20220711104436.8363-2-hesham.almatary@huawei.com>
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ce0e185-86da-44e9-38f0-08da6613de06
X-MS-TrafficTypeDiagnostic: MWHPR11MB1392:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7byA7l7PK8mIP40fJ1XLHtELEQSHirPumQl5VYX5phi/Gu3BQ3qxq3Mi2FOOkr+zgADmOJNVzRkC0I6ilNNHlNWFkGL5Bx9h+1CTCMoOLhp2BSNOL5gGhXC9LuSn3818QYDg0WMKyziaC25MgOP9kLeWe98UzwlbTaBokPRTNKV7thumbCLgslUfeJi5v4ppSSevkCXm+P4JwNhgjM2P2DtXN9yQH8D7t/Ws7bTaUG0M8Hu7TR7ef5V6knf96a20PWYyVzpoINxqM8kSJJ3SEuJj7qRUMLFtWwRWNPjX3+gC0j7TPpOIH956dmsylPDOa+pfCwqsvcG/3o16BJvLdblFXY4v4iovf+ZmQR4vn2JKptZYIledGf3JH8XSUv5sQBOi6jlFwhKkfOHqkatMzL9YzhQ003+x1gQkYwUSc3BTgbf1aZpGa/5A5U8WUzhG8qJp+xafCHF2Xh73aGy9677XkZYBog0HWdtKKTW0ApOh+RFdjquKgaAjb3kI5zD4kDgP0l7NgrH7TYT0sBEYEFP0Mh3INxiMFfjrlZ3JKPutBU9DBrwBo+RKc2ljCdnsbD+0T573Bw539CWxBsU1WikyK4aQhjLI7RFULyTgxA1gWVDxXSCJSXgdgrF7GOS7+muaN0A0GpIRl8EhhT3oabQCHrYYEFL2GuHI9T76o6IC5exTgCULpDIXpW++aW+vYew39OLIk7rxbZ98D/YbF3y4VjIPc+Km4QVV8LBndrg6folgLSymvsFYtqEveKaLDck+DRCwDkz3Rs33Ltx69vMwUGt0gKno/eqbIip2ysUSLe9SZAJ9bCY2WugR1JZNpWk6FdY8Wa3GP6yK1XM1da2wxEFPQ4hFv2pZdv6JqSY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5469.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(39860400002)(136003)(376002)(396003)(33964004)(26005)(6512007)(82960400001)(6486002)(6666004)(2616005)(86362001)(31696002)(2906002)(41300700001)(53546011)(478600001)(186003)(8936002)(6506007)(30864003)(7416002)(316002)(5660300002)(66556008)(8676002)(38100700002)(4326008)(66946007)(66476007)(36756003)(31686004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU02dDdFeG5vckQxYXZuWmhlK0l6ZEJSM3FhSXUxVHEvQWlDbE9BU2FmeWxm?=
 =?utf-8?B?UmFMVU9nT3Z2eGZ1TDdpb1RPTGRGU0ZYd2haQ3d5N3NCbUlheVlFRi9YaVRS?=
 =?utf-8?B?NWxLc1V4WW4zcmhDUFN0ZmpSZnFlT2MvWW5QeEtQcm1UWDNlb1piSlBhclZG?=
 =?utf-8?B?U20vR2laUVBHYWVzRGlCYnBKVkpoaEpMb1liZTlYMVpNYzBCOXl6d2M1eTNo?=
 =?utf-8?B?YUI3RmVVRnpPVllYOWpyTjl5TkVuUngzZWNLSFA3VUdLSlVrRm1pZ1NyTndl?=
 =?utf-8?B?b2w0b21wdTNrMmszK1ZkanhiT2dOeTVpNVNkblh4bzhUWUZoaGJKR0JHSEVX?=
 =?utf-8?B?VkhSbmxGaldWek9nUDEzZ0htN1NOeGNlaFgzWUhrdEQxUElKa2VOMEJtb2Yr?=
 =?utf-8?B?SGFsWDdMQ2RwS3lDN1VlSnF1OHd6endaOENJSGJ5ZkhkRjAvUEg0dVc2d3FK?=
 =?utf-8?B?UEhRaVhxUkpGZ1A5Mms2eVJ1UXVHYWU4azdlWkpBYS9GZjFxSlRuS01ja2hw?=
 =?utf-8?B?aDFzelJiQ0Z3WmNRMXBTcGpRdWdBY2t6MktSNXFuYzRQcGxCekRaZjVFay8x?=
 =?utf-8?B?aU1JZXNwY2w4SlY0YWNZd3FwdWs5bWlxTEFwK2srSndFUHQyaEhkRGQ0RDNQ?=
 =?utf-8?B?T1B1NHhZM2N3MjhLS0FUZ0xUK0JzSnc0NG92dGZqOHJmTERCSGd4TW1NK09k?=
 =?utf-8?B?RVQrUGd5UHoxUGFHQ0w3R0xkL2hVcWgyRXB4bkRjNFdiTExqZW0raWMxRnJ6?=
 =?utf-8?B?czRlNGdLeGwrR0pDRjg5bFdrMGRBYlBqQ3VXUDhkU1pBOUI2SzJobHp6TVUr?=
 =?utf-8?B?c2VyZ2ZnWldSSCtiSXNDWG1nZ1VtSFgxODA3OWVQaGw5azFzQ0hWL0lNU3Ay?=
 =?utf-8?B?aDRrODZTM3JiY3J3eWJaS0JXd1FZRjlCeWlKKzI5b294MlpxZm5BTjd0aDdU?=
 =?utf-8?B?RGtPMUFpWUk3SUFPYkF5T2pHM1l0VXloRVFHWDZwK0tzZ1ZZbzhqT1FMTG1n?=
 =?utf-8?B?b2tiWjR4bFBWWUo2OHd3SlJ5NGNDKzFLYWl1ZjE3cmNicmd3eEYyd2d5cUI4?=
 =?utf-8?B?WmhiRm4rNUJlT3REemRuclNPa05qQ2pnRmlBRGUvbUlETUZkM1NvNTJrUW1k?=
 =?utf-8?B?U2dXWnZxYXFwK3hTZklEaGFRZGI2QzlrT0Y1OStzTkh2NkorbDRGZENoSzYw?=
 =?utf-8?B?VzExbjlCRlNxWEFJRVppWGNhTElHSUp2dDAwVnlXMlpMV0crRHNqck9aL0p2?=
 =?utf-8?B?OXR3VVZveXBGM0xqRnFXREZWZTd0dGluYkVKU2xWQm5QbjJwYmRaK2ZBQ2Iz?=
 =?utf-8?B?d2pEK2VuVUV6amFsYUsweG9SbitpQ3NheitZcGhnRWE5d1NVR1ZUUFRBWTZO?=
 =?utf-8?B?L1c4eFg1WnNXOEJSdENwOXN5aFlWcVBtaHhBMjJkV1Y2czF2cFk2dUhkaVR6?=
 =?utf-8?B?c1drMCs0aTZReDVxOGhRR0g1eHlubXc1dFpLTGFxTEpCM2hDVm1IdkxYVzFa?=
 =?utf-8?B?S3Iya2p6NWEwSE4zSG1uVmFRRG1pM0Rzd0JTY1N0TTVVVzFxRWxGT2t1MS9Q?=
 =?utf-8?B?L1V4VE5ORTZVUzNlQnNBYmJlbk82RGpkYlBBOFk0V3VWMjQ3SnJFTzdoeDdY?=
 =?utf-8?B?UThENnMrbnJtUTVLRjNXdTZ1VHJPMVB4enY4WmFiMjRvQlFjR3ZURDM1UjBM?=
 =?utf-8?B?aXZCQ0Q1bzBIdEVkbjJyK25WWG1LbDA4a2dlUTZkcWFNdWZXa0ZCVnFLaFdF?=
 =?utf-8?B?RWowMEtSSlpkNVM4K0owWndsazY2enBJVitpbHNFT05OcXhLUWwyWVFnTXU5?=
 =?utf-8?B?NCsybnFjUVl6eTJlRThHTmZnQUZ5T2ZIR0UweU5sNEtLUzl5WkhzMklKSHJz?=
 =?utf-8?B?b1hmTllTL2l5eWpVdHJpdHhPbGhVWHhiTjJpYmwrMUhxWnFoOVNMWTBBc1p3?=
 =?utf-8?B?WTVlcDIxRU84Rkhza0d6TUF2M0NKNmpZRSt6bTNoRVNFK2dVVi9SN0RRU044?=
 =?utf-8?B?Nkd4WVJscmFMb0Z0QUJVSXpQM2RFa1NnR1VnWUxxaFBqQmdwNU5VTUZvT292?=
 =?utf-8?B?eGpxK1F6L2VjUnhvQXdaN2kvN29uOGVxUzNleE55aFR6d0w0WHhUYXQvVlBh?=
 =?utf-8?Q?Ia+p46W2LTr1ZGKbyUYQXB08Y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce0e185-86da-44e9-38f0-08da6613de06
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 03:41:14.4676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: malgXiLfmlvX61tN2ZFcYC2WOPFaA++YwHjX05AlbEsmBHj31FUyKK31ruG6/hKlh32fu2VL+D3t+ur040vKHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1392
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=jingqi.liu@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--------------BAn2weZOu8056aK7yH3NzW1K
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 7/11/2022 6:44 PM, Hesham Almatary via wrote:
> From: Brice Goglin<Brice.Goglin@inria.fr>
>
> The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
> has a "Processor Proximity Domain Valid" flag that is currently
> always set because Qemu -numa requires an initiator=X value
> when hmat=on. Unsetting this flag allows to create more complex
> memory topologies by having multiple best initiators for a single
> memory target.

It would be better if you can explicitly provide cases in this description
for creating more complex memory topologies without initiator=X.

Thanks,
Jingqi

> This patch allows -numa without initiator=X when hmat=on by keeping
> the default value MAX_NODES in numa_state->nodes[i].initiator.
> All places reading numa_state->nodes[i].initiator already check
> whether it's different from MAX_NODES before using it.
>
> Tested with
> qemu-system-x86_64 -accel kvm \
>   -machine pc,hmat=on \
>   -drive if=pflash,format=raw,file=./OVMF.fd \
>   -drive media=disk,format=qcow2,file=efi.qcow2 \
>   -smp 4 \
>   -m 3G \
>   -object memory-backend-ram,size=1G,id=ram0 \
>   -object memory-backend-ram,size=1G,id=ram1 \
>   -object memory-backend-ram,size=1G,id=ram2 \
>   -numa node,nodeid=0,memdev=ram0,cpus=0-1 \
>   -numa node,nodeid=1,memdev=ram1,cpus=2-3 \
>   -numa node,nodeid=2,memdev=ram2 \
>   -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \
>   -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
>   -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=20 \
>   -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
>   -numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
>   -numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576 \
>   -numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=20 \
>   -numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
>   -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \
>   -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
>   -numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
>   -numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576
> which reports NUMA node2 at same distance from both node0 and node1 as seen in lstopo:
> Machine (2966MB total) + Package P#0
>    NUMANode P#2 (979MB)
>    Group0
>      NUMANode P#0 (980MB)
>      Core P#0 + PU P#0
>      Core P#1 + PU P#1
>    Group0
>      NUMANode P#1 (1007MB)
>      Core P#2 + PU P#2
>      Core P#3 + PU P#3
>
> Before this patch, we had to add ",initiator=X" to "-numa node,nodeid=2,memdev=ram2".
> The lstopo output difference between initiator=1 and no initiator is:
> @@ -1,10 +1,10 @@
>   Machine (2966MB total) + Package P#0
> +  NUMANode P#2 (979MB)
>     Group0
>       NUMANode P#0 (980MB)
>       Core P#0 + PU P#0
>       Core P#1 + PU P#1
>     Group0
>       NUMANode P#1 (1007MB)
> -    NUMANode P#2 (979MB)
>       Core P#2 + PU P#2
>       Core P#3 + PU P#3
>
> Corresponding changes in the HMAT MPDA structure:
> @@ -49,10 +49,10 @@
>   [078h 0120   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
>   [07Ah 0122   2]                     Reserved : 0000
>   [07Ch 0124   4]                       Length : 00000028
> -[080h 0128   2]        Flags (decoded below) : 0001
> -            Processor Proximity Domain Valid : 1
> +[080h 0128   2]        Flags (decoded below) : 0000
> +            Processor Proximity Domain Valid : 0
>   [082h 0130   2]                    Reserved1 : 0000
> -[084h 0132   4] Attached Initiator Proximity Domain : 00000001
> +[084h 0132   4] Attached Initiator Proximity Domain : 00000080
>   [088h 0136   4]      Memory Proximity Domain : 00000002
>   [08Ch 0140   4]                    Reserved2 : 00000000
>   [090h 0144   8]                    Reserved3 : 0000000000000000
>
> Final HMAT SLLB structures:
> [0A0h 0160   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
> [0A2h 0162   2]                     Reserved : 0000
> [0A4h 0164   4]                       Length : 00000040
> [0A8h 0168   1]        Flags (decoded below) : 00
>                              Memory Hierarchy : 0
> [0A9h 0169   1]                    Data Type : 00
> [0AAh 0170   2]                    Reserved1 : 0000
> [0ACh 0172   4] Initiator Proximity Domains # : 00000002
> [0B0h 0176   4]   Target Proximity Domains # : 00000003
> [0B4h 0180   4]                    Reserved2 : 00000000
> [0B8h 0184   8]              Entry Base Unit : 0000000000002710
> [0C0h 0192   4] Initiator Proximity Domain List : 00000000
> [0C4h 0196   4] Initiator Proximity Domain List : 00000001
> [0C8h 0200   4] Target Proximity Domain List : 00000000
> [0CCh 0204   4] Target Proximity Domain List : 00000001
> [0D0h 0208   4] Target Proximity Domain List : 00000002
> [0D4h 0212   2]                        Entry : 0001
> [0D6h 0214   2]                        Entry : 0002
> [0D8h 0216   2]                        Entry : 0003
> [0DAh 0218   2]                        Entry : 0002
> [0DCh 0220   2]                        Entry : 0001
> [0DEh 0222   2]                        Entry : 0003
>
> [0E0h 0224   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
> [0E2h 0226   2]                     Reserved : 0000
> [0E4h 0228   4]                       Length : 00000040
> [0E8h 0232   1]        Flags (decoded below) : 00
>                              Memory Hierarchy : 0
> [0E9h 0233   1]                    Data Type : 03
> [0EAh 0234   2]                    Reserved1 : 0000
> [0ECh 0236   4] Initiator Proximity Domains # : 00000002
> [0F0h 0240   4]   Target Proximity Domains # : 00000003
> [0F4h 0244   4]                    Reserved2 : 00000000
> [0F8h 0248   8]              Entry Base Unit : 0000000000000001
> [100h 0256   4] Initiator Proximity Domain List : 00000000
> [104h 0260   4] Initiator Proximity Domain List : 00000001
> [108h 0264   4] Target Proximity Domain List : 00000000
> [10Ch 0268   4] Target Proximity Domain List : 00000001
> [110h 0272   4] Target Proximity Domain List : 00000002
> [114h 0276   2]                        Entry : 000A
> [116h 0278   2]                        Entry : 0005
> [118h 0280   2]                        Entry : 0001
> [11Ah 0282   2]                        Entry : 0005
> [11Ch 0284   2]                        Entry : 000A
> [11Eh 0286   2]                        Entry : 0001
>
> Signed-off-by: Brice Goglin<Brice.Goglin@inria.fr>
> ---
>   hw/core/machine.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a673302cce..d4d7e77401 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1173,9 +1173,7 @@ static void numa_validate_initiator(NumaState *numa_state)
>   
>       for (i = 0; i < numa_state->num_nodes; i++) {
>           if (numa_info[i].initiator == MAX_NODES) {
> -            error_report("The initiator of NUMA node %d is missing, use "
> -                         "'-numa node,initiator' option to declare it", i);
> -            exit(1);
> +            continue;
>           }
>   
>           if (!numa_info[numa_info[i].initiator].present) {
--------------BAn2weZOu8056aK7yH3NzW1K
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hello,<br>
    </p>
    <div class="moz-cite-prefix">On 7/11/2022 6:44 PM, Hesham Almatary
      via wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220711104436.8363-2-hesham.almatary@huawei.com">
      <pre class="moz-quote-pre" wrap="">From: Brice Goglin <a class="moz-txt-link-rfc2396E" href="mailto:Brice.Goglin@inria.fr">&lt;Brice.Goglin@inria.fr&gt;</a>

The &quot;Memory Proximity Domain Attributes&quot; structure of the ACPI HMAT
has a &quot;Processor Proximity Domain Valid&quot; flag that is currently
always set because Qemu -numa requires an initiator=X value
when hmat=on. Unsetting this flag allows to create more complex
memory topologies by having multiple best initiators for a single
memory target.
</pre>
    </blockquote>
    <pre>It would be better if you can explicitly provide cases in this description
for creating more complex memory topologies without initiator=X.

Thanks,
Jingqi
</pre>
    <blockquote type="cite" cite="mid:20220711104436.8363-2-hesham.almatary@huawei.com">
      <pre class="moz-quote-pre" wrap="">
This patch allows -numa without initiator=X when hmat=on by keeping
the default value MAX_NODES in numa_state-&gt;nodes[i].initiator.
All places reading numa_state-&gt;nodes[i].initiator already check
whether it's different from MAX_NODES before using it.

Tested with
qemu-system-x86_64 -accel kvm \
 -machine pc,hmat=on \
 -drive if=pflash,format=raw,file=./OVMF.fd \
 -drive media=disk,format=qcow2,file=efi.qcow2 \
 -smp 4 \
 -m 3G \
 -object memory-backend-ram,size=1G,id=ram0 \
 -object memory-backend-ram,size=1G,id=ram1 \
 -object memory-backend-ram,size=1G,id=ram2 \
 -numa node,nodeid=0,memdev=ram0,cpus=0-1 \
 -numa node,nodeid=1,memdev=ram1,cpus=2-3 \
 -numa node,nodeid=2,memdev=ram2 \
 -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \
 -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
 -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=20 \
 -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
 -numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
 -numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576 \
 -numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=20 \
 -numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
 -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \
 -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
 -numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
 -numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576
which reports NUMA node2 at same distance from both node0 and node1 as seen in lstopo:
Machine (2966MB total) + Package P#0
  NUMANode P#2 (979MB)
  Group0
    NUMANode P#0 (980MB)
    Core P#0 + PU P#0
    Core P#1 + PU P#1
  Group0
    NUMANode P#1 (1007MB)
    Core P#2 + PU P#2
    Core P#3 + PU P#3

Before this patch, we had to add &quot;,initiator=X&quot; to &quot;-numa node,nodeid=2,memdev=ram2&quot;.
The lstopo output difference between initiator=1 and no initiator is:
@@ -1,10 +1,10 @@
 Machine (2966MB total) + Package P#0
+  NUMANode P#2 (979MB)
   Group0
     NUMANode P#0 (980MB)
     Core P#0 + PU P#0
     Core P#1 + PU P#1
   Group0
     NUMANode P#1 (1007MB)
-    NUMANode P#2 (979MB)
     Core P#2 + PU P#2
     Core P#3 + PU P#3

Corresponding changes in the HMAT MPDA structure:
@@ -49,10 +49,10 @@
 [078h 0120   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
 [07Ah 0122   2]                     Reserved : 0000
 [07Ch 0124   4]                       Length : 00000028
-[080h 0128   2]        Flags (decoded below) : 0001
-            Processor Proximity Domain Valid : 1
+[080h 0128   2]        Flags (decoded below) : 0000
+            Processor Proximity Domain Valid : 0
 [082h 0130   2]                    Reserved1 : 0000
-[084h 0132   4] Attached Initiator Proximity Domain : 00000001
+[084h 0132   4] Attached Initiator Proximity Domain : 00000080
 [088h 0136   4]      Memory Proximity Domain : 00000002
 [08Ch 0140   4]                    Reserved2 : 00000000
 [090h 0144   8]                    Reserved3 : 0000000000000000

Final HMAT SLLB structures:
[0A0h 0160   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
[0A2h 0162   2]                     Reserved : 0000
[0A4h 0164   4]                       Length : 00000040
[0A8h 0168   1]        Flags (decoded below) : 00
                            Memory Hierarchy : 0
[0A9h 0169   1]                    Data Type : 00
[0AAh 0170   2]                    Reserved1 : 0000
[0ACh 0172   4] Initiator Proximity Domains # : 00000002
[0B0h 0176   4]   Target Proximity Domains # : 00000003
[0B4h 0180   4]                    Reserved2 : 00000000
[0B8h 0184   8]              Entry Base Unit : 0000000000002710
[0C0h 0192   4] Initiator Proximity Domain List : 00000000
[0C4h 0196   4] Initiator Proximity Domain List : 00000001
[0C8h 0200   4] Target Proximity Domain List : 00000000
[0CCh 0204   4] Target Proximity Domain List : 00000001
[0D0h 0208   4] Target Proximity Domain List : 00000002
[0D4h 0212   2]                        Entry : 0001
[0D6h 0214   2]                        Entry : 0002
[0D8h 0216   2]                        Entry : 0003
[0DAh 0218   2]                        Entry : 0002
[0DCh 0220   2]                        Entry : 0001
[0DEh 0222   2]                        Entry : 0003

[0E0h 0224   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
[0E2h 0226   2]                     Reserved : 0000
[0E4h 0228   4]                       Length : 00000040
[0E8h 0232   1]        Flags (decoded below) : 00
                            Memory Hierarchy : 0
[0E9h 0233   1]                    Data Type : 03
[0EAh 0234   2]                    Reserved1 : 0000
[0ECh 0236   4] Initiator Proximity Domains # : 00000002
[0F0h 0240   4]   Target Proximity Domains # : 00000003
[0F4h 0244   4]                    Reserved2 : 00000000
[0F8h 0248   8]              Entry Base Unit : 0000000000000001
[100h 0256   4] Initiator Proximity Domain List : 00000000
[104h 0260   4] Initiator Proximity Domain List : 00000001
[108h 0264   4] Target Proximity Domain List : 00000000
[10Ch 0268   4] Target Proximity Domain List : 00000001
[110h 0272   4] Target Proximity Domain List : 00000002
[114h 0276   2]                        Entry : 000A
[116h 0278   2]                        Entry : 0005
[118h 0280   2]                        Entry : 0001
[11Ah 0282   2]                        Entry : 0005
[11Ch 0284   2]                        Entry : 000A
[11Eh 0286   2]                        Entry : 0001

Signed-off-by: Brice Goglin <a class="moz-txt-link-rfc2396E" href="mailto:Brice.Goglin@inria.fr">&lt;Brice.Goglin@inria.fr&gt;</a>
---
 hw/core/machine.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index a673302cce..d4d7e77401 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1173,9 +1173,7 @@ static void numa_validate_initiator(NumaState *numa_state)
 
     for (i = 0; i &lt; numa_state-&gt;num_nodes; i++) {
         if (numa_info[i].initiator == MAX_NODES) {
-            error_report(&quot;The initiator of NUMA node %d is missing, use &quot;
-                         &quot;'-numa node,initiator' option to declare it&quot;, i);
-            exit(1);
+            continue;
         }
 
         if (!numa_info[numa_info[i].initiator].present) {
</pre>
    </blockquote>
  </body>
</html>

--------------BAn2weZOu8056aK7yH3NzW1K--

