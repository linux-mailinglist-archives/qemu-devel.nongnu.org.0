Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203E947EECC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 13:27:06 +0100 (CET)
Received: from localhost ([::1]:39012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0jf6-0003q4-Nk
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 07:27:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1n0jdX-00036Y-JL
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 07:25:27 -0500
Received: from mga07.intel.com ([134.134.136.100]:11834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1n0jdU-0005qk-Gy
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 07:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640348724; x=1671884724;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EmCuPEeAtCg5VEGzlKjHQE550UNGdoUtZqt/vkv4m/g=;
 b=Xl21K+mqTb3iwfcSCYcn34C3e7A0rhnIZ224c2KqN7wTYf6e11J+Enav
 6jwQGEDY7LrpcwRIlpcxyAawsUlCBwdls6iKjfbhRNUla75ZOYQGmkPcr
 5rQztloMt7TGXwhkWAfZk0FizBGpnU68UoVoo80DUEkZYJ5u2/qyVBrEr
 47lWoHqQEoepC7uyoGLSrBHq6r658BaTAN0t5as1Fet4jgsUghz3JXwQs
 DyUooTDGOoqA+qXlyQssNS7lnKaIXxtLNrOaCv/zPcjLvpcwN2HyBW5uk
 QZNYVA2JFwLroYdF5rNhbDopSkrpnbF12JkwQhI9k60Ex7GCsWtNGWLZ+ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="304339020"
X-IronPort-AV: E=Sophos;i="5.88,232,1635231600"; d="scan'208";a="304339020"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2021 04:25:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,232,1635231600"; d="scan'208";a="759608422"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 24 Dec 2021 04:25:21 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 24 Dec 2021 04:25:21 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 24 Dec 2021 04:25:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 24 Dec 2021 04:25:20 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 24 Dec 2021 04:25:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMv/uoO+4fVS33+PtWGxuti5oZPTBhyhmZMgFFO8T1WAay6AUBpBbkqrnw8OpIRAC2qGgqIhbK/gWA+JOd27kaZXXUUBhFfaghuGPVu5KjEeJTKOW/n11XrzyWeL7va4lk3BIqcv+K20Gh6q/o9nyOZ8sWWj8akvz9RbduHzjGy0ElpaE0feruBWIJgVthDnqq8QwRpU8dHSyedr996nx/aLzO29Lvm81RGYELPdJ6tXLvuS29mJaLH8nOS68x174Y0wmMVteZ0fJpXcdhx1GXEbQdTTHFSe9IhrXedw29138lt+L0ncCmH8EF3rYOKnH3scE6tTWx1Wv9OB1aQR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqoA2Enx0s8cK6Kg8+QZzqwH1ur8tJGGntzFhsBRPNw=;
 b=H5CumAhcBoAyCbJ29SSyO2hehktBI/GiDIqyXQtAT3Vl15QlWXNfG9ENgNztl9IkaOEXXN/IvgAEbigD6qt5Jrq/ozfSSlsaReSi2RZyiTDxWj/s9GY3gXhPiYH6cKdryfRJkw63Y+B/CMwZHH+eeZOoO9TD2c8Gk4fAvol++PjwlQlZo1x+snumWI30oEF+Rnntq4NOelj0jdGQkdw9defB33nW5+jjV45wkw5vPggJmyPyF2/6d19OFUDHVXDkpU4OIBS3Xu2+cWUwld3LC4dW3s3fND0gFwFEx4a09dTpOp4qpMHqkaWKGI3zkpK6adh4fjxBpSeBSboNcbBGNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 DM8PR11MB5607.namprd11.prod.outlook.com (2603:10b6:8:28::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.14; Fri, 24 Dec 2021 12:25:18 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::385a:cb1d:904b:f18]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::385a:cb1d:904b:f18%6]) with mapi id 15.20.4823.019; Fri, 24 Dec 2021
 12:25:18 +0000
Message-ID: <c385fe27-0721-144f-71dc-5437142c1e82@intel.com>
Date: Fri, 24 Dec 2021 20:25:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH] net/filter: Optimize filter_send to coroutine
Content-Language: en-US
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>, "chen.zhang@intel.com"
 <chen.zhang@intel.com>, "jasowang@redhat.com" <jasowang@redhat.com>
References: <20211224023755.532189-1-lei.rao@intel.com>
 <b6233b02-21f0-be63-7326-c23ec3c0fe08@fujitsu.com>
From: "Rao, Lei" <lei.rao@intel.com>
In-Reply-To: <b6233b02-21f0-be63-7326-c23ec3c0fe08@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR02CA0176.apcprd02.prod.outlook.com
 (2603:1096:201:21::12) To DM8PR11MB5640.namprd11.prod.outlook.com
 (2603:10b6:8:3f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24d10239-e1a8-4d58-6a58-08d9c6d87201
X-MS-TrafficTypeDiagnostic: DM8PR11MB5607:EE_
X-Microsoft-Antispam-PRVS: <DM8PR11MB5607A0F2F52A8B865E1B0A41FD7F9@DM8PR11MB5607.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EcluUJKHUF2P1FrbZGOQTaoEMZOKXpxioN7LCnqcqEZyu9CFRdXX/nC6AoAVXPFXDu8yIXWc8cSidT09Rc/5tRbHYGT+1j/A1Awzyy+bEBs2xkOFqJ1QqUMzSFOywZcvgkXQv7Z9GTWBuAmoJWrXFyWTy9++B2YpukjgPvCvI7lfADY9zTw8FhvtkokBS637jlAofcVAYk+bF5xig8X2EpM637bW454cUQhTrYukEb3jYz+NuEtmfWC9HI4POaUWlELX8VqmpAop+2xNNP++TtubT73JCui/h+5HzX/8E+fIF2m6V2L5XMFFTcWGSiCNF9pecJS0Uucvfer0xc78f3QzO2dPe4mgPigdKJyt6y3/5eXkbmHUc4kWhUSbHWSSN8hqNyBiOKO8zLgM//5Klhu2AkHgbZIs34/AAJ+NUenVs1N1HnqMxYg/4iSrSx4RGETEMhXEDNR+l1Z2irOfPpGecf792dntUS9pwQYHjQ6nwqYDgZMejuv9zf/BSymKBMXdPxBeOHXxaZ7+uQripWismEsgp6xGaJ8kbZVbaXqBMQ+Hyl11j2Y3epJAenq0RLwWL0cbXUNl60s3mHqKbiqIryieBH5R5rlsjVhD1+4O4l+2t5qCrhtIIGoD/5d7zU6slkftX29CoiGDUfZ9hn5c80TdaFUMIPGQrBlqaNM9wKDdtOWgeIhpLxwjz6gb/m8UtgrWKWveHZpA/AlbMhGFy/xUOa+IY1F+SHpDtaE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(36756003)(110136005)(4326008)(2906002)(38100700002)(508600001)(8936002)(6506007)(186003)(316002)(2616005)(6512007)(8676002)(31686004)(53546011)(26005)(66946007)(6666004)(66476007)(86362001)(66556008)(82960400001)(83380400001)(6486002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXdyVk43TnJJdVY0dy9jbjF3SThpKzJjbmhqeWhlYlg4YXN6NFRPbGVCdG9a?=
 =?utf-8?B?RDdIdUpmM2xGUEZxUllUcTFPZkVoRXl3RXFoR3RvODMzQXF2UE8wYmgxcEJW?=
 =?utf-8?B?S2diYWNxZG9oV29LV0xIUk5YSVhMakxrdHJXRWw1OWN5VDd6U2RQS2VXTTh3?=
 =?utf-8?B?YjMraU9EWmsvc25NLzFrTUFzNUhsUCt4T0pnTE9DSWh5RmRHditGN3RnSGhv?=
 =?utf-8?B?UFp6RXRlbUN4NE9JTTJMa1VGNkEvYldHb2gvcDNFL0JsdkNGS3pWa2s0NHIv?=
 =?utf-8?B?WXY1eXZvWUovMkFIWTUyOWJOazlTWHRJeWFjeVcyZ1oxWDg0Vk10eUFieUd5?=
 =?utf-8?B?VUltTnYyZjZUeENvRGxJaWYyWCtrRW9Bd3hGd3ZMQ0MyR0ExMnJhMVcwZzZW?=
 =?utf-8?B?UW5GVzAvM1JLT1IrVVR1RG1MZU04eSs2SlNQWlh1UWVlQXREUDFWcDFQNTMv?=
 =?utf-8?B?dytqRysrVWJVY2xYNXJ2MGozNFBaaUgxOWJwRWtQMnQ1S2JiU0NGVEFDTXF5?=
 =?utf-8?B?QldVQklKV0k3M3IyZEFzY2ZlbG9YNTRLaVBZMUh6cTQ0TXcxWkQvZnJUdDRI?=
 =?utf-8?B?S0xqTDNySHo2K0ZnSkRaUGllVlNTbWY1bEpXOUoyeUp0Ny96dDJIZEc5Nlhm?=
 =?utf-8?B?a3NjbU85VlFIb0dmRTg4QlJHWDNlYkZZbHk2S1g4K25iVHErM1Q2L0RpTXJu?=
 =?utf-8?B?WHJGdnlzc1F0ZG1wZU84a29uMWZEK3JwM0RGV05ZeFhFR1l2SEtKWEs0WGpX?=
 =?utf-8?B?REdGbTM2Z3lyRTNmRThJc3YrTCtJT1dWd0pFY2lFVTZFQ3FIeHNUZDdzM3Vv?=
 =?utf-8?B?L2EwYVk4WTdjaEttQ1BlWG8yUk4vZzBub09KU3Qrdm12UGpCY0F0aWdueGNi?=
 =?utf-8?B?SGhDMkhGZVVTTkllSHBNa1MycmJJRkRTQUZXNzI2YVBDcEhkekV0bVF5VWpz?=
 =?utf-8?B?ZUR1TUdjc2F0UDcyL3Rtb01HY28vMmhLZmZQbnBHa044TlJ5blp4TjE0Rjcr?=
 =?utf-8?B?VDN0Y3FJWWM1V2lreVV5Z3ppSy9rb2piWGtMakgyZnIxTTBEcVorSnJNVG9Z?=
 =?utf-8?B?ZWtHWnRIcnhpYkFkTGlNUjlvdVhibXdEdmtVeUh6a3BZS1pJRXpHY3AxMHFz?=
 =?utf-8?B?RGhCc1FLZWl6UVVzSWhqcDV0dzV1MUc1bjFGSGh3VGwyTUhkVEhDVUdOTWZ1?=
 =?utf-8?B?d3lsVm45T0lMdWpNaUcxMU10QUFqYmw0VUFZMWRHWmtKRm0zbWZPdTBkQ0o1?=
 =?utf-8?B?SkUrOWZNTzJTcFcxMWxCQTBlQUlJcDRHQzhrdmI3SzFXOVFROERGckZ2cEdK?=
 =?utf-8?B?VVJreGRxY0F6K2wwQ2kyTit0alI2N1oycXlabURzaFlsNzJyYjF1M0ZDemhZ?=
 =?utf-8?B?NG5KYU41SXlBVE9zVzZva0piUXBXbmJyQUorbVI5Zk4vRkwzUTVFWU5kUis3?=
 =?utf-8?B?SkN6YjNyQW8yanF2aVNWYVlsTm9XaFpIWU5HelBKY2FSYzJEUEVYRWJUS2tR?=
 =?utf-8?B?d2VyZ0hmd0VxUTc3eXJlYXp6S25rdFhtRjYyUjF6WHBUanZTMFBsRTMrblAw?=
 =?utf-8?B?aUllUVhlQ1FLWDBVMnJ4eS9uRjRUZG1BQTlrRkdVNlZFdkJRMnFZVnVWZm9h?=
 =?utf-8?B?aWpOVExMSVQyZzJYSkUzdmM0STg2em5KTzVyam5rOE1URmR3TUd2bGRjSHB4?=
 =?utf-8?B?ekpmWUUyRTYxcVFHdFFRS3N5RFJneWw4bTdKTHhEYVpCT3MxYkRQUVpzSnVR?=
 =?utf-8?B?dis0VE11WFNFeDEzWGFDcjlXMG1rZUFhVGVUTEpaQnVaTmRPOUhCTW5DbnM3?=
 =?utf-8?B?U2JNTkJKTG91UElxUlNuZE5xeVB5VERrTlBtbUYvVWIvM255N0pDZlMyN3RR?=
 =?utf-8?B?UUJ4YW5nZzdvUHlBemVFOTJld0ZFazhtS3VRaUlIZVE2VmZ1MDV1ZW1iTnB5?=
 =?utf-8?B?Wk5VT00xQlRqMzJXYlJ0Um0zWWVsbTBXSm1CVzBQQTMwVnd1akRXYzhMVE5G?=
 =?utf-8?B?UlgwQ2xBWndPMkllZHcvcnhKZFg1S05HYXRGbzNmMTArMXdHQkJqMm9keU9s?=
 =?utf-8?B?S1pjYW11T1BKeXBkdFVGVDVPdmZ2cXdSbkQ1bi9xUXVuYTRESkhRd0x2bnNN?=
 =?utf-8?B?YWgzRHZPYUljbURUcW44d1g2aThieVVZMkVzTklrdXFhSVR1bmxoY1p2bW5n?=
 =?utf-8?Q?77/2WFnSUacMfZbPsL9brAc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d10239-e1a8-4d58-6a58-08d9c6d87201
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 12:25:18.0222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnmnq54hEMOraMmQeO5zVJLGNddyVFapSH4CjJFlQ/iOvrxXZ9QEnrsv2coCVm2L6Cyqseu9YNN9CUz/TCaFcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5607
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100; envelope-from=lei.rao@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.133, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/24/2021 6:07 PM, lizhijian@fujitsu.com wrote:
> 
> 
> On 24/12/2021 10:37, Rao, Lei wrote:
>> This patch is to improve the logic of QEMU main thread sleep code in
>> qemu_chr_write_buffer() where it can be blocked and can't run other
>> coroutines during COLO IO stress test.
>>
>> Our approach is to put filter_send() in a coroutine. In this way,
>> filter_send() will call qemu_coroutine_yield() in qemu_co_sleep_ns(),
>> so that it can be scheduled out and QEMU main thread has opportunity to
>> run other tasks.
>>
>> Signed-off-by: Lei Rao <lei.rao@intel.com>
>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>> ---
>>    net/filter-mirror.c | 67 ++++++++++++++++++++++++++++++++++++---------
>>    1 file changed, 54 insertions(+), 13 deletions(-)
>>
>> diff --git a/net/filter-mirror.c b/net/filter-mirror.c
>> index f20240cc9f..1e9f8b6216 100644
>> --- a/net/filter-mirror.c
>> +++ b/net/filter-mirror.c
>> @@ -20,6 +20,7 @@
>>    #include "chardev/char-fe.h"
>>    #include "qemu/iov.h"
>>    #include "qemu/sockets.h"
>> +#include "block/aio-wait.h"
>>    
>>    #define TYPE_FILTER_MIRROR "filter-mirror"
>>    typedef struct MirrorState MirrorState;
>> @@ -42,20 +43,21 @@ struct MirrorState {
>>        bool vnet_hdr;
>>    };
>>    
>> -static int filter_send(MirrorState *s,
>> -                       const struct iovec *iov,
>> -                       int iovcnt)
>> +typedef struct FilterSendCo {
>> +    MirrorState *s;
>> +    char *buf;
>> +    ssize_t size;
>> +    bool done;
>> +    int ret;
>> +} FilterSendCo;
>> +
>> +static int _filter_send(MirrorState *s,
>> +                       char *buf,
>> +                       ssize_t size)
>>    {
>>        NetFilterState *nf = NETFILTER(s);
>>        int ret = 0;
>> -    ssize_t size = 0;
>>        uint32_t len = 0;
>> -    char *buf;
>> -
>> -    size = iov_size(iov, iovcnt);
>> -    if (!size) {
>> -        return 0;
>> -    }
>>    
>>        len = htonl(size);
>>        ret = qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)&len, sizeof(len));
>> @@ -80,10 +82,7 @@ static int filter_send(MirrorState *s,
>>            }
>>        }
>>    
>> -    buf = g_malloc(size);
>> -    iov_to_buf(iov, iovcnt, 0, buf, size);
>>        ret = qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)buf, size);
>> -    g_free(buf);
>>        if (ret != size) {
>>            goto err;
>>        }
>> @@ -94,6 +93,48 @@ err:
>>        return ret < 0 ? ret : -EIO;
>>    }
>>    
>> +static void coroutine_fn filter_send_co(void *opaque)
>> +{
>> +    FilterSendCo *data = opaque;
>> +
>> +    data->ret = _filter_send(data->s, data->buf, data->size);
>> +    data->done = true;
>> +    g_free(data->buf);
>> +    aio_wait_kick();
>> +}
>> +
>> +static int filter_send(MirrorState *s,
>> +                       const struct iovec *iov,
>> +                       int iovcnt)
>> +{
>> +    ssize_t size = iov_size(iov, iovcnt);
>> +    char *buf = NULL;
>> +
>> +    if (!size) {
>> +        return 0;
>> +    }
>> +
>> +    buf = g_malloc(size);
>> +    iov_to_buf(iov, iovcnt, 0, buf, size);
>> +
>> +    FilterSendCo data = {
>> +        .s = s,
>> +        .size = size,
>> +        .buf = buf,
>> +        .ret = 0,
>> +    };
>> +
>> +    Coroutine *co = qemu_coroutine_create(filter_send_co, &data);
> 
> BTW, does qemu/old gcc complaint such coding style ?
> 
> int a;
> a = foo()
> int b = a;

There are a lot of codes of this style in QEMU.
It is written that we need at least GCC v7.4 to compile QEMU in the configure file.
So, I think it is no problem.

> 
> 
> 
>> +    qemu_coroutine_enter(co);
>> +
>> +    while (!data.done) {
>> +        aio_poll(qemu_get_aio_context(), true);
>> +    }
>> +
>> +    return data.ret;
>> +
> redundant  newline

will be changed in V2.

Thanks,
Lei

> 
> Otherwise,
> Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
> 
> 
> 
>> +}
>> +
>>    static void redirector_to_filter(NetFilterState *nf,
>>                                     const uint8_t *buf,
>>                                     int len)

