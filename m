Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767103D2BCF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:18:34 +0200 (CEST)
Received: from localhost ([::1]:35316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6dHF-0008AL-IE
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6dFT-0006iP-Gv; Thu, 22 Jul 2021 14:16:45 -0400
Received: from mail-he1eur02on0715.outbound.protection.outlook.com
 ([2a01:111:f400:fe05::715]:37894
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6dFQ-0001Cd-Ax; Thu, 22 Jul 2021 14:16:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/Who5rHb/5O2VUDf4NasqwR61Y+Bq36IbItteJYG7/YZjg11wIw9wPM4kIdR36z8WdJdBu3GRkiHMTEOipgOwDHVhPHX/x4jC9IZ/EKuy6ZFeHdUnabWZLreVMJehSLfgBWCjnLpbeJ3NVQelH1YbXydYHN2Iq/nxPwBClGd4ywpTgrbiOCQ6HNI3rKGyfBVHqqRrFsM6kAZPUbctAlpZb4qAQGZf59qd+hn2F8NiVZHa4lcE+wPz/Z8HDmTERTY0JknU6ZoOCSlv0Z310dc9lWJEqsTj9IGsSyyPaXCwUpKnjYB/uNP8c1KHg/CcmeaA4BG1556X/cEzFvNQcoQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80PZITyIx/uc86XfAga9PL+L2vqXOymI38RImO3388A=;
 b=D3GZsKIjHu015oGdUGjpwpDt+lSQ1Dw30Kh4LRQru+HUPwzpPy7WDQbGpmF8fwjxPzg4es0gsUVaDw5OiRm64GMxYUDQXLoEdoPLNHk4MrF3AiLL1DteQ7GO1xCXI0iszWJ3gQwDfSVrdjqlAWzzb9OxZlu7QN8FFbvXsyuR6AwBrxHD9XA2ZZxnzwlhJ4a/bxQkCYsI93lN1ieYNz9KtbMDxY5jFpbWHZBfZB69dOsbD/Mvq3PUoXCcKYdtVSNhLepXwc4aZBJU5QJoyRvHmbiGSxjO6kDAjbM2exjBGqJOW6pcDJeb/pY/CrO4Mj1i5yxfSSHqYqR33nVvHVtmjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80PZITyIx/uc86XfAga9PL+L2vqXOymI38RImO3388A=;
 b=ncGJh2CC20pFxQm0TAAJEl9yXtKnCClxdKiKRkaB205E9TWkubLlZ0CCS0LeFdjpXHwV7+Aa8g3vteA/A6IrY7+oWne5TwGGfU/TJw0MA/GwvtOy4U6iDAoI7xHhc/XikL/EV8Qh5sV5u3f1cucbdYdcbG5p0Tm6C0DK2+bMn44=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6102.eurprd08.prod.outlook.com (2603:10a6:20b:23d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 22 Jul
 2021 18:16:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 18:16:36 +0000
Subject: Re: [PATCH for-6.1? 3/6] jobs: Give Job.force_cancel more meaning
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210722122627.29605-1-mreitz@redhat.com>
 <20210722122627.29605-4-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6abdef90-c8b7-f70a-5c0f-04ddec8c45ca@virtuozzo.com>
Date: Thu, 22 Jul 2021 21:16:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210722122627.29605-4-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0051.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 PR3P193CA0051.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 22 Jul 2021 18:16:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3e71f09-85ec-4ef4-a7ee-08d94d3cd795
X-MS-TrafficTypeDiagnostic: AS8PR08MB6102:
X-Microsoft-Antispam-PRVS: <AS8PR08MB610289201F9AF804254BB0C4C1E49@AS8PR08MB6102.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DUpw+is4YP2AIKdn/KhpXozl7ERRm64vhk0WtXb06R13dwP5mPP8rPDypJNS5C6J/JQiHVEvgFXu3db4AyGP4NiYPYYwEUR6Lkt/d/sRAuuSWLAzkgty1HEMv+5kdeWVA0jJ0Pr6PZXHO1iDriVnj44WHk55Egy/2hziPFn/2VPkOQrFtXoA7xWmzzkahwAXZ1Qc65cjnQ9Wjh0Q3COVPWTkPONb0Go9qPLQO0RnNc1apmfHV+vZ+ZWru5PCLvm2v7slWVJ1Wn3l5dvJr0bS/cI7gWebWTkEjJv/yvdmldAWBUHL10mWvnVtNet0TAiAjuO8n3gmg3/lgM06nON3Wc9eqyLBpMF8S7TLqTmVSkGe6TTPTSBtpaM9bw6eZfvhas1snzDbXc+ox9aGM3YZFWrfcrHPXbXJaqOobN6C3ZZcwY6AgUKBeg5ERbsuExrx5L78XdGFs1E70Ts5s/Sn/MLwXWmHRRuN81XXTVzkj/Bol3VMx5eERsoH0sfW/an81KclleESo16ILd29vBpBmDCUqscFCUg7afdAp4jE4Oh74AR28uiX3DcW4AaVhenvvPHq1qCtdbthjJ4tqFs4pN638XALKaHRiQ3P1A4YFWrjnP4RXVlB4Bdkl7fg8d7NDQxD9TdHPH/t7GaoMU5dSfAFPp6BHvRffe4sePqJjUZ+zaeHEUEQ1bkc2Z76Ap4TIe5ninipl5jEpkCeSMuaamN+JDFQZ/GAoW4SRBupspkQpqTZwRF/x0HaVV4iLVEAfu7DyAzH0WdPk8XWDOEWuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(136003)(346002)(396003)(366004)(478600001)(66476007)(66556008)(83380400001)(6666004)(66946007)(316002)(54906003)(16576012)(86362001)(2616005)(956004)(8936002)(36756003)(31686004)(8676002)(31696002)(186003)(5660300002)(2906002)(6486002)(26005)(52116002)(4326008)(38350700002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3VrY1ordm92NWszbDRjRzRqaEVBbnhoL0V5UVdqZ0VQYkFLUlNvRzJSR2Fn?=
 =?utf-8?B?MVVnZi9JNjhIL0hGTXhDek9qOEJuTjZtVlVhVGdwdnZOazhMaUFLd3ZPeldP?=
 =?utf-8?B?azRuSDFpSkJnazd1RDRlZWNwZ09DTXpUNlhNSm5ZcDJQdEQxU3NwRnJuVUNi?=
 =?utf-8?B?S1hhUFNuck5rZHF5am53WVVmOEZrektSOEx0RzNvQmU0NUE0a3cyN1gzSU1Q?=
 =?utf-8?B?bngwcmUvTjZCOUp4THN3NFhQUzJCbWNuc25DeHdGM3o0TnIvVkJ6blA3ejVm?=
 =?utf-8?B?T0pFY04zOGdzVDdIcWlBR0N1QjFvbktKbnR5aUNwekIzNG5RTWhnQ3RTa1NC?=
 =?utf-8?B?L3IxTXZhVXM3clg5bWJqd1dvZWs4WEtuMWFVNjZ6WVFoOEJuc2pOeFBNeUlI?=
 =?utf-8?B?c01QQUROSWM2cGkwdVcrUDF5TzdkYUVGaTROTFVva29LSmpuSG9rd0RZQ1hs?=
 =?utf-8?B?YW1QRzAwYnFUaWw1b0tGcE1KanhpSGxlZitwQ0xYdXZrVG5EcTJvaitVeHFt?=
 =?utf-8?B?MWYzZXZwaHZ3WmVjRTBseE42ZjJKQjRWSDU5KzVFV01tQnZtaTdJVW8zTTR5?=
 =?utf-8?B?VnJ0aHJxcUxKaDVEZjg0N01SbUdFQSsvVVA2VXFJME1zeDNkZUsyQkRsWUVu?=
 =?utf-8?B?NkFEWU5sb3VIUEYxWTNsaC83TjFmaGdNMkFtYkJ0aEVBWngrb2QwMTBXY1V4?=
 =?utf-8?B?Rm5xWU1GbHdIYjZ2UG5yM3o0dmF0YmVQQ3lWaitjMWNpb09kZTBQdy9JaUpr?=
 =?utf-8?B?SVlHY3BNWG0yK2I4ZmJ0WHJmYzh4ZTEyZzJ4YjVGa2NJR2RWM0J1VXhvS0RX?=
 =?utf-8?B?SU53b3daWU1qK1JvWHphWGFwUVVyaUlpc1FHcnQwbmZLcCtmZjR5bWJjcWdP?=
 =?utf-8?B?TXRLTzFNZlovZFNONnFxbmxOOERaNCtEZm15NXlBOTdCZ1RrQnRlS2NsRTZN?=
 =?utf-8?B?Zk82T3UwalpOS1AvcStsQWFxNjA4azVNYVFneklSMW53VWV3S0lYUkI4Z1RS?=
 =?utf-8?B?SUI5Z1JXdDhEemEzVEgyM0dLODN4RVZYcTNjZEU1b2p5Z3pCclI4Z0x4SFJk?=
 =?utf-8?B?T3c4Q3pLZm45Z0JWdXc2OVZOOWdzZ0oranlLRTM1K1A2RStIandMRE5rQmhU?=
 =?utf-8?B?emZ1MkloUC9GamZyNDRVWHNDNUMrQzZpVGJNdEx6TldJQm1uLzhUK3FGU1l4?=
 =?utf-8?B?cGdsdXc2WEtWcElaazlPYXRkSXovbVhzN0loRXdFdG9YaWFlOXlOMDdWTlIr?=
 =?utf-8?B?RVVoLzBTNG9zc1hOQlNyWncrK3I2dGUvbC9RK2hlZ0RPR29yRWdUcHV2ZjdW?=
 =?utf-8?B?TWoraE9xVXg0Nmk3eVdhVTRmK3J6a3FhbUNwVTZRL3NaN1ZneHRORTdaZm5q?=
 =?utf-8?B?TERXNGpKaEtsUUpYckJ1Mm5zNmovTXNXV3lLSEJtTXliMnZFT1Z3SXNPaGJQ?=
 =?utf-8?B?djR3L3dvemQrY0lzV25La1NaVXpoM0F1TlJjdG5pMEpwZTFrM3BNV0tGVnRm?=
 =?utf-8?B?Y1c5MWZkNlBHa1M5K2lFeUtLWVFZRjk4eVZvekVRc044SllNWXpRVHNnVFI4?=
 =?utf-8?B?WUg5UnZEcTFodE5ZK2ZIRTZmdDc5V2oyQnl1c2VLZStCQnBIV3VhOFc0N3U3?=
 =?utf-8?B?TGRNQXIwUjUzSWJjWmZKVGhRRFRpV2VFV3VDM09sVDJzaXZVdjVsZ1p4djM4?=
 =?utf-8?B?TDBqQlV5d21NUVpKZ0FyWGYrWC9LZXhtZkk3enRDQnIzWGo3czRSZm80NnF4?=
 =?utf-8?Q?nL5bEJz+AsYkhE4QORLCvBUacVsz4D6mULbO8BH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e71f09-85ec-4ef4-a7ee-08d94d3cd795
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 18:16:36.0857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLcyTZz58P6fq/OoMmWETgZJKZJlCBseABskOTgwb8fryrnF9iooYwfMAu4IDOxhWoJnC+jndNUKS7NY2Ri/msy6prjItV2TRCqhJjYtjx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6102
Received-SPF: pass client-ip=2a01:111:f400:fe05::715;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.203, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

22.07.2021 15:26, Max Reitz wrote:
> We largely have two cancel modes for jobs:
> 
> First, there is actual cancelling.  The job is terminated as soon as
> possible, without trying to reach a consistent result.
> 
> Second, we have mirror in the READY state.  Technically, the job is not
> really cancelled, but it just is a different completion mode.  The job
> can still run for an indefinite amount of time while it tries to reach a
> consistent result.
> 
> We want to be able to clearly distinguish which cancel mode a job is in
> (when it has been cancelled).  We can use Job.force_cancel for this, but
> right now it only reflects cancel requests from the user with
> force=true, but clearly, jobs that do not even distinguish between
> force=false and force=true are effectively always force-cancelled.
> 
> So this patch has Job.force_cancel signify whether the job will
> terminate as soon as possible (force_cancel=true) or whether it will
> effectively remain running despite being "cancelled"
> (force_cancel=false).
> 
> To this end, we let jobs that provide JobDriver.cancel() tell the
> generic job code whether they will terminate as soon as possible or not,
> and for jobs that do not provide that method we assume they will.
> 
> Signed-off-by: Max Reitz<mreitz@redhat.com>


In isolation this patch is rather strange: force_cancel is used only by mirror. But we keep in generic job layer. And make a handler to set a value to this variable. So in generic layer we ask mirror which value it want to set to generic variable, which is used only by mirror.. This probably shows that this feature of mirror should be mirror only and generic layer shouldn't take care of it (see also my answer to next commit).

But at the end of the series the variable is not more used by mirror directly. So, technically the commit is not wrong, and it is a preparation for the following ones.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

