Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213515779B8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 05:19:32 +0200 (CEST)
Received: from localhost ([::1]:40930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDHIA-0004a7-D4
	for lists+qemu-devel@lfdr.de; Sun, 17 Jul 2022 23:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1oDHGO-0002pC-5b; Sun, 17 Jul 2022 23:17:40 -0400
Received: from mga04.intel.com ([192.55.52.120]:47103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1oDHGL-0005Vn-2c; Sun, 17 Jul 2022 23:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658114257; x=1689650257;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mGNNutzylpRd+wRYTj3dfx4N85+NOLbQRVRwa9T+Vg4=;
 b=YH0+WnwdYYaL+CB4RXJgWCAMgPcW9fzJ5oeQOK0Y6xM0B/mcvVzSAss3
 1KWWqFWjxB1dxK4mudsybI5nHzO55277uzgR3fA5CIs8i+32xq6EL0Emx
 Bdc5xXxogr6SXC7Ggvs1PXQwAJVqRcL1V7xwNHydoom5tk71czI0mDP4b
 EVYfFPxIHJSKSkoHieKqXGIkpZBIopiBPvI5/SSfwNZJ89VVQb2qrtkZA
 Tf6OFiF2/K1cZVtUdGfTYwN16pUG7thBsiM4eCE8fBB8k+aSRSILIVqB0
 ory2otH4U02o+G4DffLkHIoRVoczdMiCoCBYHOIQNRmGaGnGajvB/4/52 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="284876373"
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; d="scan'208";a="284876373"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2022 20:17:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; d="scan'208";a="547317882"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga003.jf.intel.com with ESMTP; 17 Jul 2022 20:17:27 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 17 Jul 2022 20:17:27 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 17 Jul 2022 20:17:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 17 Jul 2022 20:17:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 17 Jul 2022 20:17:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StSC0HxMOEK5R1vHdi5xeDmCItbM5ecVTCASSYOZN1poR2OAbV3v4aLOe9wpZuCov0s8/ZbuQ43Tno9GhbB4nOZKzEeDujt4fwcxM6uCYPwEdxeLDSkMOlmW4/UvmkQsQ0Jk7nyFxbZezIvYOxsNqTHHlbeXBj6jW0Idbja/fk5EwZdcTbbkqcqBKMXU0Hni1IYFNVBrj1w+RER7/fv3aTzF1OoE71+nfQrV4ypxMUvI3TYC4v/FW0fXenArETzMUtlMZ1Fvf6aJv2dEvh4a9PpyaONXCe1mPcB/aVxhKG3cbvAdJI23JL8Njpxtc3YcjJ23Zi8KehATuFAidrIT4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xzzcK3XBL+LVBX7w7nVkrE2+EyCBwb29bDTHlYX+Ao=;
 b=HDMBY+04WzFDS4o7dsWXrRH+xz9fVA4QRPJxzEYTnAu51HdPWgCnMhIDAhwrqd0hh4ZFQ+Srw9XV6TR/jRjenRq+dSrJh5jD/aTer6u34mUi6FRUwAljz7W3rmzB1xEaTsnfUOGxNlmeUBrFecx3+2rtG0OGetsuTZ1LAUTY+e7f0VEshWceUZpuwhc1PHPXd3STWPOcG0Qlch52mWLsHVoMpBOFw0fkvyLkdzqIUqToWpcip/33RE8I0qJ60ki62gLrLg4jHQTEDvxCuyOLqE3qHfivlyqcIGi6q7Hp+XKwVYjDZatx39AlWVAwrHqtK0fczIJgd8wyurHYPeKyIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by PH8PR11MB6684.namprd11.prod.outlook.com (2603:10b6:510:1c7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Mon, 18 Jul
 2022 03:17:25 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::2475:12f6:2488:263d]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::2475:12f6:2488:263d%8]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 03:17:24 +0000
Message-ID: <7781de83-9658-3002-6599-40979f93a456@intel.com>
Date: Mon, 18 Jul 2022 11:17:13 +0800
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
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0105.apcprd02.prod.outlook.com
 (2603:1096:4:92::21) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b47a0c34-4cf7-4d96-7500-08da686c0910
X-MS-TrafficTypeDiagnostic: PH8PR11MB6684:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cD3cYuzamJol7h/E23Qk4cmUf7miQjrLg9Bw9xgRa3r2Wj1rS1OitZcPAZFG9WChI5rb3oi8HOPuBIzg6j8tDTbb0+8fmbUWCLLUeun7+czrDQri0e31QzEXxalkbH7PDUNL53/RO8h2r+iUG80dTz8RC5g4eTnwGl+WYM9WQpkaFrhc6TUpF/xX18H/pSJTcMsYAcJJUItnfCe3b6C3/Y5L0AJ3liBTf7UFHWbSTul3nLmWqaqcmdhRVUSTlBd5hBsPuF8bMmrX5V5g2ttwhu3KmfM90luS+EDsH2lbv1FbTEGCLrNkEYO0LOeBEDSKgA5w+54N0ZnoZcKytKKh5d2djpaeV4GXNNAZhk3Fn/r4NQOFm4qgDrf10ztdrNp/4EM+cD0Wg8twg8FGZxxIveaKV6h5GpRDiQNQ66Xfp5PIDYtH/3hDhY/Phn8b4f+8VcO9NmDX8TUpJHcl+kftDdcyIx1HKEEmjX3OIurnbu8pb4/QhyYejRsTwLI5ZQzv8bkA5Gjgz99hA5IG59V8mSX1umyNnNuW1t5eeNvkbH1+BiSKh1xbaeukDcz/1SM9JbDGo0s0OtiCxk4kFLcT8eL+qwCKREb6EcMTu6baKkFccZOE4Hf44/hqZgaK5SxunvT6+luW+ZM8kaLGeiL0DDz9sBoIATXCgUeoUnXNniU7FdwZabKtrdyi6U8owu4VWfXH//eNbOn/DB7NOdHhA8G9PVIZ+D37emy73C06CNzz7yD8WJsaUMyJBIA+EvNXVQf160kUIfR8fknOL3KPoHe62epxR3VfCU+z0MamfI4oZ5waatFnykWgRCq9JDdrfRQ94VNrKgw+jBbTrLUAoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5469.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(396003)(39860400002)(346002)(136003)(66946007)(478600001)(6486002)(82960400001)(316002)(36756003)(6506007)(53546011)(41300700001)(2616005)(186003)(31686004)(6666004)(4326008)(5660300002)(2906002)(6512007)(66476007)(83380400001)(8676002)(66556008)(7416002)(86362001)(38100700002)(31696002)(8936002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFRETGM1a2VjM1JpNURTc1Z0Z0ZFQ1Q0aktqN3BSQk4yc1RnSUd1NTloenc0?=
 =?utf-8?B?V0pNdCt3anRCMDZncjhkcGVIK1FhSFBvRUQvZ2dPbjJPMmtGRmlqOXN2eEZn?=
 =?utf-8?B?bjNObnBXSmRLWHI2dnByTVBNSHJSVFgwNkk1S0RkNnlYQzROM2V4SHJtMTZO?=
 =?utf-8?B?S2E3NHRsd3hUWHl1Z3BKN0ZmNE80bmVZN3BMQUpsKzJ5VnhHbmwvdWxRbHhD?=
 =?utf-8?B?dHZ4L3ZERnVDa255OWVsZFdUeXEwTEcwNlJGbzFWcURDTk1sY1dLZXlWVDk2?=
 =?utf-8?B?bENhQzl3T1JJMC9GdFZSeTkzYmlIMDJVN0txMjlyZVVjQndxSE1manFKRUY4?=
 =?utf-8?B?N3ZSbGFQYkRBNlRUdVp2akpWc0FZWHJtcHRPajhNMXg0Zmxpa2pSWGFRellE?=
 =?utf-8?B?QUozWUd3TnVIbnFtNG4xMlhtblZBalBReWVzVUZqdWRMc3RlN0JYSjc5bjhG?=
 =?utf-8?B?RWpNaFRTV0V5NmsvV0ZPZGttYUs2ZkpxSDFwNEFhMTlQa1NNL0xWRXJIcjk2?=
 =?utf-8?B?d1U4MjZiVnFyTTZ6R3E5SkJqQlhjZnBFSUJzU3BDbUdHd3hFOGFSS1ZoWHV6?=
 =?utf-8?B?c3hXMFdBRGpZZGhBWTNRd2hnL1NXby9XOXpFSkZTR0U5YUl1N1JPNU4rUXVs?=
 =?utf-8?B?OWVLVmRZeUVwOXYxcXVwMy9wNGg4aTVzTU1GeFpManJvQi9Ea291MEtQMlZS?=
 =?utf-8?B?S2krV2dlOWxHSms1eFYxaUEwVGNsMkpReVZONERDY2hvdTRHZ2NSNEYzQTRQ?=
 =?utf-8?B?Z0QvRytjWjZiNFlJckYzN3FzTU02aktBdDVCM0tMOU5XZWJGMmRXTzg2R2dP?=
 =?utf-8?B?SGxHU0JiWWRHQk1UYTZZTzd1NWFLV0d5SlIxZWlnYjNLVjlTdXNsbzJPQnpu?=
 =?utf-8?B?UWdvSXQrbnNMUHh5ZXljVDc5bnZJQzVqbTEvVTlNMXM0T3h2S1NqU0s5VHhD?=
 =?utf-8?B?UjBqUCs3OG5pYVA5VHlmcm9WblRZYy9jUVkwb2dZa2RwU3lFblBxM2VqMGVN?=
 =?utf-8?B?WDNLaWUreDA1VmYxZVJCOUE5eE1oR29CRkxUR3J6Q0JrRngyV0tlcG96T3N6?=
 =?utf-8?B?OE8wd1djdkVyZWtvZGZ1RzRMUVNTbWpmY29hU3plMkhOakNMRlIzYXNxbjdh?=
 =?utf-8?B?YnZxTm9PTzlyNjNMTS8vcHlwRFpic2VGekxVTWt4RmJwOVJDTDhydHNEZGcy?=
 =?utf-8?B?Y2VHZ1hMNzcxNVlyTFZGWTZLRVRaVDBMVlFJb0p4ZkJpUDRWQ3VoSmVFQ1Fq?=
 =?utf-8?B?cGdrYnNSOStBbEI1TUVWWEQvbWFNT050a214emRTNE1aeEhDSmQzWlFZNWgw?=
 =?utf-8?B?a2FzejMyRGtzSjJkQ21Fb1JRS2lpRXUyeVlDdHo1cXcvOU5KMUVrd1M4ZEww?=
 =?utf-8?B?Ty9RWlFZeW02dTNMYTczdHAxTDE1SXFiWXduUTB1QlN6NDFIK2pnRDhsbXVM?=
 =?utf-8?B?U3JQSHoxSkxIVTFnTGxQZEZFTzVVTEpQSFFmcFhrN05KR0J5eDFhUVZTVUY1?=
 =?utf-8?B?Z0JadWlQamJpUENqQVMzL0FQRmh5QjJEYjhOME41cTh5SFd4NjlFL0VrVFhB?=
 =?utf-8?B?N2xEaVQ4Tnp4NForQUxUR01UdWZLM1J3YTR2R0QzbFVmaDBIdWw5Tms3ell2?=
 =?utf-8?B?STg3dmhZcnlqa29HUURoUUwzZUpwOUNCVmxoOCtJaEJ1Zm1XYitwbGRWT0dv?=
 =?utf-8?B?N3RjSWlGZ1A4VDlPekE2SGpkSmdONzRBK1d1VmdNTUhmaFU5Yk1Sb3Y2aDdt?=
 =?utf-8?B?RGVTbUVTbXdXT0JuL1hWN3pHSWJ5bjM3SUtTTkd0SWNWUGlVN3doZHNnS3JM?=
 =?utf-8?B?d282bm0zWDFvcVVIL0xKN2RVbllxenc2dEV3dUtxaC9BTzlDNkVqek5xT3JB?=
 =?utf-8?B?NHBiSElOS2xRd1FLMG4zWDYwM2sxSUFtMjRRbG13QkRYT2MwKzVmd203Uy95?=
 =?utf-8?B?NlNMK3lUQm05N0JjY2prUEdqeUluUDF4QXZDV1dNRmJ0ZVhCZDE5dm8vSXdm?=
 =?utf-8?B?ai9YbEN6MXB0Y1dnWjg4cU52bVNYSFBIdXl1enZ4THUwSlRad0tUT0dBUDdr?=
 =?utf-8?B?NzM2SnBwQnBhYTlzV0h0RUxhQVFKejdyT1d4YUQ0S09CQjVhazNOR01hM01q?=
 =?utf-8?Q?ZlFqEmJZX8EYzotLgnVSCVk5v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b47a0c34-4cf7-4d96-7500-08da686c0910
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 03:17:24.5426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4puJ+EefMiDIMBkOhBbuUcqXHJS6bhgiFn91B3NKlEPecPYoWfcHqR9VvJLbGmTNLCEJVzvc8uOH8mbb6ByAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6684
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=jingqi.liu@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 7/11/2022 6:44 PM, Hesham Almatary via wrote:
> From: Brice Goglin <Brice.Goglin@inria.fr>
>
> The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
> has a "Processor Proximity Domain Valid" flag that is currently
> always set because Qemu -numa requires an initiator=X value
> when hmat=on. Unsetting this flag allows to create more complex
> memory topologies by having multiple best initiators for a single
> memory target.

Do you mean the memory-only numa node requires an initiator=X value ?

It would be better if you can explicitly provide cases in the description

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
> Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
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

