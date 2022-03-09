Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134264D2995
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 08:37:28 +0100 (CET)
Received: from localhost ([::1]:51250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRqsx-0000nE-52
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 02:37:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1nRqqW-0008Fi-9G; Wed, 09 Mar 2022 02:34:56 -0500
Received: from mga12.intel.com ([192.55.52.136]:62014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1nRqqS-0001uL-5B; Wed, 09 Mar 2022 02:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646811292; x=1678347292;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q62NbihSrCl8BRmVkDPIpnWRIp8WNejr9rqC+VSRjDs=;
 b=TmJYNozlSMO98PJj8jJIcVfPX7iaPnqfPOsGZocTb4tu+qsbpWW652IL
 Yh6bE1Uda6rhkkOGXM7vWqGdDVha837hhMKHb5SQaehzeBTBiwDp76kQd
 nILDi4X6/L240WBOB3dnCjV7Txb9I79QUErTcGT3NlpXfnjOYZJmiLWrl
 jTpGVXOL/KtErF1Y/s3V5dvgOyoLrQTaoCsBOlEirmuoPcS3WC36yCUoM
 uBF+2VAaN77VC5paIpYDktvmNmgFxJ9WBO7Xp85S8dQrFemfS5X+5bGEc
 ey/nNZ4w4Era0e3wMESSJxXhhc1YYIU0vasC2ya/mkZO4LYXoVw5/4JGw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="234862527"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="234862527"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 23:34:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="537898599"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 08 Mar 2022 23:34:47 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 23:34:46 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 23:34:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 8 Mar 2022 23:34:46 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 8 Mar 2022 23:34:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnkF0/IxOiSdqj/WljF45b95aU/zUTPhrgYtZlbys1tpfZU9Ajvf0Ur8qzMzrVHe9+hLfOJdgjyeqfOeby9fGpXFzyvalPR+Ds8/9EctUxPtRhiMoo5AV3ZlkmN0Almd2hWT5z5y2W2oHEUpyxSiMGJpEjJf85KBv2ElDgUeQq8UpCQe6bC4yBiK1Rg6TBhWQLaXWw0JbJIFriCAHD+vG8Se49NRHiUCCfqtEq9JdJp7fNLaFsLAqsVQzElPLeAuEqvXNIvwsGHSgY7A98jiywARSSMeRtPiqCAa9cIdOlztAZShvNsZsVZxbgu/Z8D7kJ4695p+71yrKym+Jg02cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gARStXjHZTFeT1/0WAXa9JRFK0y319xf7qnQrgZJx4=;
 b=nE4THF/1ID+OYFdF8DlodKP7qBQHZAZGO37GbevZXWWVcuxaIa0HwxZKoIup00Sn67doD3njCNL07nv8r/kVlYQVJ/9OiOaQ0KUXQJHSz3UJaVDqRs/CjoZbtfc86ZN6rPRjUU+WPJHTBKSEPiR7E09oOADPyTw5EmPMKYw3pi4UGuUCCLKl/H3iwdbUhpM4UAFg62hb35Qln+zcLj/zc6PUScFTqO8N1VzZOw9Uh9CnsEX31byijZYXYSAlmFAR9qA4SESlL+cTXPuAZUxptPDizBLtand8CoQ87xD6//budU79xNCjAVTsmPCRW0Nk6deifj4XYhGQnJWCvlXxEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 BYAPR11MB3413.namprd11.prod.outlook.com (2603:10b6:a03:8c::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.17; Wed, 9 Mar 2022 07:34:44 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::58e9:8769:8603:980b]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::58e9:8769:8603:980b%7]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 07:34:43 +0000
Message-ID: <f348c6f5-3e3a-2910-6b43-a099598d99d7@intel.com>
Date: Wed, 9 Mar 2022 15:34:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH] block/nbd.c: Fixed IO request coroutine not being wakeup
 when kill NBD server.
Content-Language: en-US
From: "Rao, Lei" <lei.rao@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 <eblake@redhat.com>, <kwolf@redhat.com>, <hreitz@redhat.com>,
 <chen.zhang@intel.com>
References: <20220303022145.328112-1-lei.rao@intel.com>
 <e9b5e0ec-a2fc-5f7b-6773-062979cee2a8@virtuozzo.com>
 <e5a5e7c9-ab84-6e58-29f5-045ff71cf3f7@intel.com>
In-Reply-To: <e5a5e7c9-ab84-6e58-29f5-045ff71cf3f7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HKAPR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:203:d0::12) To DM8PR11MB5640.namprd11.prod.outlook.com
 (2603:10b6:8:3f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df52f255-b98e-4276-ac85-08da019f473b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3413:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB3413F003B9A125A958BE0020FD0A9@BYAPR11MB3413.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O40vPpMrTP1pFFG5nOPSVsRqHozDpsT1WMVb5+hn4xxC7KTe1/Ie8i0amUnSMoaoXq/XlSun8kswaoUgpHV2oLFxCPCwC7Hz0Oogj/cPDGekiU0qXRBj4YKEdGr6qkj0j2dY0Pi01wH6JAoKNpXp0hp1pgc7CtqG9LdGethmSm1jJXxvbmrO7VlDr6pgFiu76b28D+klUh5LJTfS+QjH/nx0l+VJvdE+UdFdlw0vciEFb9HYJY9VItsDzdungLO9XV4Alj94tQu7/oYq4vVFyLOdyXqOMKAgFC0uM9JUGLR44PK+/AjENAcg4oNWQKUb7/5YUEAqMp6FMMu4FQOkURJ5qHBV/mRWZ3XuEboicxi9zwQHAJ7Rc5QkUwNOcTPwnCBPKRIn8CWW3cjRVVK/ihRXvM6OUnOBX0PBdNIBmkAOGTyPRwppzpWK3REh9/smDZKr/uuuCJ4Txp8eB9hUl6c6dgDrsBkV1Ej13V+BN/p/eGVXcez66De43x9exbziqlDiHYTAgV8xlpxPTqccktw8WD36Z/2tJvdkzWhuEwdfH389sJ+bGYcwO9ZP1XrgTe14o5sOCni0HSTwXB1+//37bycGxG1DpNs2UHJhLyfHQhfMzEimOP+VIuhGY9iMrmTFz1r9udaR/bW+Fr60iMJQaT6Y9G8wxahFwA4bJ3n/V8p1jYoe70iAVAr/g9hL8UsnTVhswe95qsn51Q5R8cJEz+iPNzgQz+8F6/SXrl+xpx6/v7VDsomraKfR6/mp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(6666004)(53546011)(8936002)(82960400001)(31686004)(83380400001)(36756003)(2906002)(6506007)(66476007)(6486002)(86362001)(66556008)(8676002)(66946007)(5660300002)(4326008)(6636002)(316002)(6512007)(31696002)(508600001)(2616005)(26005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajlrTWU1THVDelZaR01DdHhaT2YwWTE0bEw1V2lyYnJnUkNFbmMvMTNuNTNF?=
 =?utf-8?B?VWJGZmk2bkU3ay9lQWMrREt1N0RTRE5GZnlEbmxqUlp6TitCbzFWSytjS1di?=
 =?utf-8?B?Y0NMNUhySHIzVTdYZ3VsdlFZM1BTem4vMU94S1ZjMjVqOXJPV0hGSHN3dm81?=
 =?utf-8?B?VEN6Tzd3N1Z2akJiNEx6TjhyaExKYXJveGQwWnZTeUN4QlNCZVlYc28xbkZ0?=
 =?utf-8?B?V2E3VVJLdXJuS0JiUENkdUNzcmNJZkltZ2hlaTIvUktUSW5TdHZYQlByWVoz?=
 =?utf-8?B?QmZuTTc4VkhHaUEyZnBQY1diOEw4M3ZIV1pMeUpORHlEQjM0emRhY3NyaUFV?=
 =?utf-8?B?WXpRSjhQMVJpbFdyNXFVTzZjRUp4NEoxeXRtQ3lsZy9MT3hiRFJpTXV4dHVH?=
 =?utf-8?B?dTFTSVBhOTVzeXVFeEVLbUp5bnd6RUpUVmNJWUxKV2hLd2g0aWpHVkRHdENC?=
 =?utf-8?B?Sms4TTdKZUYxWDFJVHdRTDBwclhhalFFT3dkVEkzSEE2QkRiWWxjMWFFZGVD?=
 =?utf-8?B?Z3hRYWNTbDV2Ui9pR3lqemN6YzVGN01RYnBSOEF2QjcwSVpNV0RNc0VUSDJL?=
 =?utf-8?B?SDhtVHNqK2ZnMzQzdFRjU3FCdGxyUTkrb2tsSGZUV2hLQXVpajYwUnpHcEpK?=
 =?utf-8?B?KzNqdFJzK3NkSE5YRkk0c2JleE52UnROdThBZkJKejVPNDdFTXVsamM5SjND?=
 =?utf-8?B?ZWhVcU85VS82QXA2a1d3Yi9hQzdLVDU3L3VveG41bjBXU3pxR3NlVy9mOGRv?=
 =?utf-8?B?dGdWSnc3eWdSNXhEVUdIMnhSRS9rQldVQ05zVHZnVDMybTlBUzRJOWNIdkR1?=
 =?utf-8?B?V2c5VWFzdTI3WnU1MmhyaTRyUllMZU9yaVRqN21SZE83U1BSTVN3NGNZZFRU?=
 =?utf-8?B?LzdzWTg1RUFoRUhTeUlsNkVORDBUSWZVQmVXQTJmekJOWm1hZHNWbmFQYVdY?=
 =?utf-8?B?SlJTR3JyZFRGWFptK3dvM2NENUxCVGJNVTRsK2VaT0dIdkFQMEFoWkM3TVVr?=
 =?utf-8?B?OTBZWG56SDQrb0lPQ2UvSnhVYUoraXZPL1BtOXcrYm02WTIzUXFQRlZwVTdV?=
 =?utf-8?B?d2hEYWNSMWxjdFZiSGVNUWVXVmhsNC9VaWlxL1duTUlVQWkyV0hwRFZuYVpC?=
 =?utf-8?B?NXlPM1FjYk1lV2lQM1ZnZWl5UU1kQ3Fzd0tyK21RVElFK2wzeFhkY1hZTWp6?=
 =?utf-8?B?UUJCVnI0WnlnQUJXZGZBbXo2a2M2bHhuWENxMFJhMmhQQm4wQ05od1BRUDJT?=
 =?utf-8?B?WlRnN01ReTdxWnBaYlNleTlLM0tpVTdMN20wL0g3SVlXcVR6SGRpVkZ1bU9w?=
 =?utf-8?B?c3R5aDVTcTFTMUU3UUZoYjVhMi9rdUczNVUyaVhNY1FGK0k2UmV0WWkrTWJS?=
 =?utf-8?B?UEFORFRWYXY3YmxYVEV5dkNRZWZwSWR3dzZFcWhma1JxS0VmRzQzYjJnUWZw?=
 =?utf-8?B?bzJGS0UvSGVHb1NnUFE5TVdOTWZFcWlDeTFGVXRKb2lUYXc5UmNEQlhSc0dn?=
 =?utf-8?B?K3dYc0ZZeG4zMVhxZzQxQmtvK21FcEYzNXk3K1NWV0p3c2EzSm9kK3ZicHhL?=
 =?utf-8?B?TkMyc2xCaktKbllFUUdTWXRkaDdLY1p3bHAxckN5VW9hTWlCbWJnUjY0d3JK?=
 =?utf-8?B?Zk00Wnh5WEpoOTZmMGw5STR2aWJmNE9Wd3FJaHduOG1XQU9NdDVKNE10QXlp?=
 =?utf-8?B?eHlmVm03QVI0N0RjM0pNUzRGM2loaEVaQk92MVZRbU9GQ25qQlloUnNNSnNv?=
 =?utf-8?B?Q3FMWHFNT2FiRlJLWWd0ejN6MmhFRXNQUlpZbktML1pFUW5LTll2bWdhdnNj?=
 =?utf-8?B?QjYxMUM2bW1lNWphN3B2WFJZU1BYbWdWWVdwTE9ER2RDcVFsdlZpSU1SUGZ5?=
 =?utf-8?B?N242WWw1SGZWc09PbWwyMmdqNVJMclNLZEs0b20zdjJNQm5ma1Yxb0crb1hu?=
 =?utf-8?B?ZzRlUytBSktSekhkZkRjVVFZNEUxNVBueHFiZ3RCZUluaW5UYTVmM01Ec1Aw?=
 =?utf-8?B?dTNsbTBIRm96Q0krMkNCVzY5WWlqQ2tKMkhtcEZ5WFpFSk53OG5hd3E2cGR1?=
 =?utf-8?B?SWpMckhhOXVTZWdHZmhXZENNL1dnR3NNc0NNQTdxbzBsbk1EUjRSb1pSV2kv?=
 =?utf-8?B?ZGtWMGhkbHhzZVdQa29uTEkvakVKOUVsa2twbjYzYk1xRkFrdlF2a2pXNjNB?=
 =?utf-8?Q?h8YXK5nl3b0w6V+69yyStGQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df52f255-b98e-4276-ac85-08da019f473b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 07:34:43.6315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYdOggcKMOF5ztb6wvBI60fR8xMR5e+MginYUTt3BMt1Y3DJGfY39h/uThr6xf6ybtKNsE5VJx9Q98Qq0l/C4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3413
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=lei.rao@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/3/2022 10:05 PM, Rao, Lei wrote:
> 
> 
> On 3/3/2022 5:25 PM, Vladimir Sementsov-Ogievskiy wrote:
>> 03.03.2022 05:21, Rao Lei wrote:
>>> During the stress test, the IO request coroutine has a probability that it
>>> can't be awakened when the NBD server is killed.
>>>
>>> The GDB statck is as follows:
>>> (gdb) bt
>>> 0  0x00007f2ff990cbf6 in __ppoll (fds=0x55575de85000, nfds=1, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
>>> 1  0x000055575c302e7c in qemu_poll_ns (fds=0x55575de85000, nfds=1, timeout=599999603140) at ../util/qemu-timer.c:348
>>> 2  0x000055575c2d3c34 in fdmon_poll_wait (ctx=0x55575dc480f0, ready_list=0x7ffd9dd1dae0, timeout=599999603140) at ../util/fdmon-poll.c:80
>>> 3  0x000055575c2d350d in aio_poll (ctx=0x55575dc480f0, blocking=true) at ../util/aio-posix.c:655
>>> 4  0x000055575c16eabd in bdrv_do_drained_begin (bs=0x55575dee7fe0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true) at ../block/io.c:474
>>> 5  0x000055575c16eba6 in bdrv_drained_begin (bs=0x55575dee7fe0) at ../block/io.c:480
>>> 6  0x000055575c1aff33 in quorum_del_child (bs=0x55575dee7fe0, child=0x55575dcea690, errp=0x7ffd9dd1dd08) at ../block/quorum.c:1130
>>> 7  0x000055575c14239b in bdrv_del_child (parent_bs=0x55575dee7fe0, child=0x55575dcea690, errp=0x7ffd9dd1dd08) at ../block.c:7705
>>> 8  0x000055575c12da28 in qmp_x_blockdev_change
>>>      (parent=0x55575df404c0 "colo-disk0", has_child=true, child=0x55575de867f0 "children.1", has_node=false, node=0x0, errp=0x7ffd9dd1dd08)
>>>      at ../blockdev.c:3676
>>> 9  0x000055575c258435 in qmp_marshal_x_blockdev_change (args=0x7f2fec008190, ret=0x7f2ff7b0bd98, errp=0x7f2ff7b0bd90) at qapi/qapi-commands-block-core.c:1675
>>> 10 0x000055575c2c6201 in do_qmp_dispatch_bh (opaque=0x7f2ff7b0be30) at ../qapi/qmp-dispatch.c:129
>>> 11 0x000055575c2ebb1c in aio_bh_call (bh=0x55575dc429c0) at ../util/async.c:141
>>> 12 0x000055575c2ebc2a in aio_bh_poll (ctx=0x55575dc480f0) at ../util/async.c:169
>>> 13 0x000055575c2d2d96 in aio_dispatch (ctx=0x55575dc480f0) at ../util/aio-posix.c:415
>>> 14 0x000055575c2ec07f in aio_ctx_dispatch (source=0x55575dc480f0, callback=0x0, user_data=0x0) at ../util/async.c:311
>>> 15 0x00007f2ff9e7cfbd in g_main_context_dispatch () at /lib/x86_64-linux-gnu/libglib-2.0.so.0
>>> 16 0x000055575c2fd581 in glib_pollfds_poll () at ../util/main-loop.c:232
>>> 17 0x000055575c2fd5ff in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:255
>>> 18 0x000055575c2fd710 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
>>> 19 0x000055575bfa7588 in qemu_main_loop () at ../softmmu/runstate.c:726
>>> 20 0x000055575bbee57a in main (argc=60, argv=0x7ffd9dd1e0e8, envp=0x7ffd9dd1e2d0) at ../softmmu/main.c:50
>>>
>>> (gdb) qemu coroutine 0x55575e16aac0
>>> 0  0x000055575c2ee7dc in qemu_coroutine_switch (from_=0x55575e16aac0, to_=0x7f2ff830fba0, action=COROUTINE_YIELD) at ../util/coroutine-ucontext.c:302
>>> 1  0x000055575c2fe2a9 in qemu_coroutine_yield () at ../util/qemu-coroutine.c:195
>>> 2  0x000055575c2fe93c in qemu_co_queue_wait_impl (queue=0x55575dc46170, lock=0x7f2b32ad9850) at ../util/qemu-coroutine-lock.c:56
>>> 3  0x000055575c17ddfb in nbd_co_send_request (bs=0x55575ebfaf20, request=0x7f2b32ad9920, qiov=0x55575dfc15d8) at ../block/nbd.c:478
>>> 4  0x000055575c17f931 in nbd_co_request (bs=0x55575ebfaf20, request=0x7f2b32ad9920, write_qiov=0x55575dfc15d8) at ../block/nbd.c:1182
>>> 5  0x000055575c17fe14 in nbd_client_co_pwritev (bs=0x55575ebfaf20, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, flags=0) at ../block/nbd.c:1284
>>> 6  0x000055575c170d25 in bdrv_driver_pwritev (bs=0x55575ebfaf20, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>>>      at ../block/io.c:1264
>>> 7  0x000055575c1733b4 in bdrv_aligned_pwritev
>>>      (child=0x55575dff6890, req=0x7f2b32ad9ad0, offset=403487858688, bytes=4538368, align=1, qiov=0x55575dfc15d8, qiov_offset=0, flags=0) at ../block/io.c:2126
>>> 8  0x000055575c173c67 in bdrv_co_pwritev_part (child=0x55575dff6890, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>>>      at ../block/io.c:2314
>>> 9  0x000055575c17391b in bdrv_co_pwritev (child=0x55575dff6890, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, flags=0) at ../block/io.c:2233
>>> 10 0x000055575c1ee506 in replication_co_writev (bs=0x55575e9824f0, sector_num=788062224, remaining_sectors=8864, qiov=0x55575dfc15d8, flags=0)
>>>      at ../block/replication.c:270
>>> 11 0x000055575c170eed in bdrv_driver_pwritev (bs=0x55575e9824f0, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>>>      at ../block/io.c:1297
>>> 12 0x000055575c1733b4 in bdrv_aligned_pwritev
>>>      (child=0x55575dcea690, req=0x7f2b32ad9e00, offset=403487858688, bytes=4538368, align=512, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>>>      at ../block/io.c:2126
>>> 13 0x000055575c173c67 in bdrv_co_pwritev_part (child=0x55575dcea690, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>>>      at ../block/io.c:2314
>>> 14 0x000055575c17391b in bdrv_co_pwritev (child=0x55575dcea690, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, flags=0) at ../block/io.c:2233
>>> 15 0x000055575c1aeffa in write_quorum_entry (opaque=0x7f2fddaf8c50) at ../block/quorum.c:699
>>> 16 0x000055575c2ee4db in coroutine_trampoline (i0=1578543808, i1=21847) at ../util/coroutine-ucontext.c:173
>>> 17 0x00007f2ff9855660 in __start_context () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91
>>>
>>> When we do failover in COLO mode, QEMU will hang while it is waiting for the in flight IO.
>>>  From the call trace, we can see the IO request coroutine which is waiting for send_mutex
>>
>> Hmm, in call-trace above, it's not waiting for send_mutex, but sitting in yield() inside qemu_co_queue_wait()..
>>
>>> has yield in nbd_co_send_request(). When we kill nbd server, it will never be wake up.
>>> So, it is necessary to wake up the coroutine in nbd_channel_error().
>>>
>>> Signed-off-by: Rao Lei <lei.rao@intel.com>
>>> ---
>>>   block/nbd.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/block/nbd.c b/block/nbd.c
>>> index 5853d85d60..cf9dda537c 100644
>>> --- a/block/nbd.c
>>> +++ b/block/nbd.c
>>> @@ -167,6 +167,7 @@ static void nbd_channel_error(BDRVNBDState *s, int ret)
>>>           s->state = NBD_CLIENT_QUIT;
>>>       }
>>> +    qemu_co_queue_restart_all(&s->free_sema);
>>>       nbd_recv_coroutines_wake(s, true);
>>>   }
>>
>> Hmm. I think, I understand the problem.
>>
>> Actually, when request finishes, it calls qemu_co_queue_next(&s->free_sema). But I assume the problem is that we have a lot of requests in free_sema queue. So, when error occured, current MAX_NBD_REQUESTS finishes with error and they wake up at most MAX_NBD_REQUESTS from the queue.. But what if we still have a lot more requests in free_sema queue? Seems right, nobody will wake them.
>>
>> I think better is simply move one line:
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 5853d85d60..33adfddc41 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -529,8 +529,8 @@ err:
>>           if (i != -1) {
>>               s->requests[i].coroutine = NULL;
>>               s->in_flight--;
>> -            qemu_co_queue_next(&s->free_sema);
>>           }
>> +        qemu_co_queue_next(&s->free_sema);
>>       }
>>       qemu_co_mutex_unlock(&s->send_mutex);
>>       return rc;
>>

In our 50 rounds IO stress test, it worked well and QEMU didn't hang.
I will send the V2.

Lei

>>
>>
>> Could you check, does it help you?
>>
>> This way, every coroutine, that goes out from
>>      while (s->in_flight == MAX_NBD_REQUESTS ||
>>             (!nbd_client_connected(s) && s->in_flight > 0))
>>      {
>>          qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
>>      }
>>
>> will wake next coroutine, and thus we will not hang.
>>
>>
>> In other words, I think, that the real problem is that in
>>
>> case
>>
>>      if (!nbd_client_connected(s)) {
>>          rc = -EIO;
>>          goto err;
>>      }
>>
>> of nbd_co_send_request(), we don't wake next coroutine in free_sema. So, let's fix it.
> 
> I think you are right and will rerun the stress test >
> Thanks
> Lei
> 
>>
> 

