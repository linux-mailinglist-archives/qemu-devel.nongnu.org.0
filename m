Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5447B4A9ADB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 15:21:07 +0100 (CET)
Received: from localhost ([::1]:59284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFzST-0007CB-NR
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 09:21:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFzBC-00070b-Ql; Fri, 04 Feb 2022 09:03:15 -0500
Received: from [2a01:111:f400:7e1b::70b] (port=46611
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFzB9-0004o0-9n; Fri, 04 Feb 2022 09:03:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCiHKSkFhVxgH1A1YEVJ0FJZMen1pNIRHRh7UPRJmJc3puwiyWFbPwzpFfNKWBVzp8mrB7RH3f98+KEuWlLPQt5qOPzG7GN5uaIAWbVnXKF6tiXx4w7HXFBLn3qDL/Lw6bvmbnCsN2z/PGZX3U4pURbKF0fmJbYh/7JNfaQg7TfliyFEt+yyuAiId34xvuE8EWr6DGuZE/7gYN3rjWHDYSt7Dnkr5iidqjhOoIKUPwHzkMXhuIZ8DNi/HQdOZvsOvwEE7DQGTHFuqk8Gi8c4jg8TMFQWJGVtQ++WwcZd189ldcZFKClTBtDh5s2BbqjPAmvyIwv2cBTusL0A27E4HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibJ4AvWPUINWIipxa96G+clkwhph5cKCOglYiFLXPQ8=;
 b=SGm2iK8F6XlLC2Feoty+1v8f4dpPmnwbLltKi9J0TUIfGgxah8M+D/7LUzMIL16G/ck0onXUKrsb7ydH0SlB56LlLRU4hAseuzpwNbGaC9X4IzBolhlU8ggHfDwogU04s23I9XndjovNRZYmZZjaQVwNkd1MrsZ4OTnv5NJ5Q8bVUyUx1jy7nyg81hO5CcK//enWv117QRjp5ejqfoFxwobKhU2jothsKf1qlWNscO0kjObtATjyr9+Bbt9bdmzI1WrSLOimeV6azmBYK50wKPU8kpzalvHQSP06/AZkvHk9EdtiyVMfGuZOTYwxXiZVd7hhMqCyEUTQ8rBEAh6u7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibJ4AvWPUINWIipxa96G+clkwhph5cKCOglYiFLXPQ8=;
 b=bhDlSJp2tLGp2+jJ9v48z9nWaUAaTeRIjHOmas4TOZgwfDpPCyw21ohxYb/zSPeLojmb1rYGwGzsC+niEpuM/p8i/nEjVU6/WZPojug5zh6aXz7Ij5EK5p3IKe1g0RHmBsfY3u1kGVtYS6imjDdmlkbK3/JD/ZXFdRlwLXt49fA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PAXPR08MB7232.eurprd08.prod.outlook.com (2603:10a6:102:1dc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 14:03:06 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 14:03:06 +0000
Message-ID: <bb24b76a-86cd-f0f0-1345-e550e9d78e86@virtuozzo.com>
Date: Fri, 4 Feb 2022 17:03:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 10/12] block.c: add subtree_drains where needed
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-11-eesposit@redhat.com>
 <52eff922-0ca4-fc12-0edb-8eb963ac306c@virtuozzo.com>
 <a2e77f99-3138-0a24-9ced-79f441d42ca4@redhat.com>
 <13a6f342-3525-7929-e8c4-d82f6887ca49@virtuozzo.com>
 <bd6aee9e-1627-94c9-bc92-a88769ea075b@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <bd6aee9e-1627-94c9-bc92-a88769ea075b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: beb75c8c-0866-44ad-e242-08d9e7e71119
X-MS-TrafficTypeDiagnostic: PAXPR08MB7232:EE_
X-Microsoft-Antispam-PRVS: <PAXPR08MB723241533B2DB3E2C3BC695BC1299@PAXPR08MB7232.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E7rdQywRTqj0lG0t0/sPUx+4flYOS2LyzrOrMViw+jIy0Zws7pg3md5HKlnwpoVEHYWxLaT1ln1qJ9CNNR9X0iNuiQ+9RWU6PIay/DR8ZmXrK9BEzGoNRBPMWLABSEfqMHdV4npF0TMOIgCIVj924+3FtY+ecGzE4962RUINH2sjw5ojZ0CAwQsT32DesrxU0xANOZvA739N3ZO1DMQwJO0yMBqE4OiXZD459Yf+lx1jAzYO0TW+5ILMg10BJm02mb2t06a+cMRNTOIdxPTKugPWWZwyhVCw8/DIB0zLUVS5+3HPN181EU4jQQC5qACpgpsnrobZelQz2ZsxlcIA6hqa6rq+nOeG/g2KRjEZ/LOZoLYmYrYe1aVvHVKqW+RLADi3Di0/iapoxbrFOpWRsp9MM/fX1FD8e78f/P00jNUp4f6uMnYtzDdI6yRmZHUhTP6wmGF0PZrklGejkzuPrIPdhAFCdYZqhkO3WqpQiThxW0qt3KoZzJmb7bF1Tt+r7ffq01poDe4eV89OJyTWLZuwGpZcfhQ5ZxQ5lZiRq8EBSA7c3VKqwI73e6swp0hsboYMJDCIWLo44Jbb7OPLEGea/cSiC9zabEswmuHubAwgo3HHt54wZIG73BATKxfgTMzcDQQ9YBm6bSN8fCVs9TekqmaWyOkUrpZL60/ChWZb3nhNEwHmYhAL43wtu8PypONgHB2GZf0r73TqmU9pWCnvZBOJOLLTBPRGyVSG2yusIbj9d0JWY8PlKpBLezbJpXze8BfrQBbkRw05MktC3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(83380400001)(6486002)(186003)(66946007)(4326008)(52116002)(38100700002)(5660300002)(38350700002)(31696002)(66476007)(66556008)(54906003)(8676002)(8936002)(6512007)(2906002)(316002)(6506007)(6666004)(2616005)(26005)(31686004)(508600001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjNNYmpXRU1KQXJKMlpITGtaalJYNkVhd0htQ3pBOGN6V2tDVVNwQXFsTGRI?=
 =?utf-8?B?THBlSVhvellRTThzaVFrcHNlWktJYVh6YXNIZ25JRmpqMlFnbnVzQjZObmFZ?=
 =?utf-8?B?eTJmeEErMGk5M1NlcTVGUjFMeHl1Z3NqTG0yakVVZDI4RCtTUVFneXlvMVhX?=
 =?utf-8?B?QWpESTBvTnF5Zm8za2JwWXJiSTVBQVdMbkFZSE5tcWVheTczTEJaVVhiSHU4?=
 =?utf-8?B?aXJyVWx6OFh4ZTJjQzc0VWorNFdsT0VvM1E1bkpCeHJORnpJQVFqbjlYWjNM?=
 =?utf-8?B?NHZpRVdjUXN0QzJKSkg5MituQ1RoWFZ3am84dlVCQVlPNHpNWGVuMzhBSml2?=
 =?utf-8?B?eW5JUG5lUW1vVyttOENQNFpGYWpzbDl0VmpYelRJL3Fpamo2OFlXNUVOVlk1?=
 =?utf-8?B?cDZPcVpKV1VVUjM0ZHBnV2hhL0Nsa3ExVTlIeUZmM1ZWdWdqb0lFWjZlNGNQ?=
 =?utf-8?B?bGRuMXJQV0ZTalNQWi9ZYTlnMDZXKzBiUUtIemRleUZUV1AzUkRNYkYrdEdC?=
 =?utf-8?B?RkFINTZxMndyMUt1QUhxbmdXVFRkYVhjZi9JTU0xTkhjVGJMYjZSMm8vYnNQ?=
 =?utf-8?B?K1RmanJreEw2cVlwZkVlWHlEQ0t3ZU11K3h0a0lTb3h3by9KWTlKaThIa3Yx?=
 =?utf-8?B?YUZDbGg4Ri9VUXN1K2dZN3ducGwwbkg4aFRlNm9lRjZqaWFCeFJrR0FQQkNm?=
 =?utf-8?B?KzZEYzRRbjBoQ3pGZHYyZkJaYzloamMrUlpCT3JvWWVPSW9STlo5U1JkNGdJ?=
 =?utf-8?B?MXdUK1VmMVBhNlZ6aXVRbXlSTFNMcGpzUXBkdFZZR0FzalR2Wm9SZ1YxOE1n?=
 =?utf-8?B?OVl4Y3BVQjcyQkdTSERXSmRaaGVNTnBKL2NSblI0Wll6bGs3cjFlenRENHJV?=
 =?utf-8?B?Y3ZyZzlmdzFPTHJ3dXpxZlp6Q0VJVVlETDA3WnNaQ0dYay9qRVRZSW8xaUc5?=
 =?utf-8?B?ek5UL0FNZmV6UmIyR0xEbEFpWENCN2U2OVNBZ2NuWHF4eFRBOHp2RVRUSGVj?=
 =?utf-8?B?RlJsZjhSaExWRGN2MTd0OTRXc3BlZjJhSFh0YXFTbzNhOWExcjRmRGZCZ3B2?=
 =?utf-8?B?UThoc0Z6L2YzN1V2bW02blY3MU52VGNxLzJFb3Z0dS8vM2w1NHkrMDl3cUJj?=
 =?utf-8?B?T1V1UWhkTEhCKzBxWk96dnNoemRkbC9WQ2FhSHEzTmhzeWRFNWcrTjR5cklB?=
 =?utf-8?B?dEkya3JkZTNmeFpwV1RvL08xelJVeGhYMVppR2ZXVDZKN0svS3VtVFMvSnJ6?=
 =?utf-8?B?VzNIeTF4S3lUV1ZoM0hCVEJ6QVk2WVc5cCtpTFNxejF3NTlsM1J2L1JKNVRt?=
 =?utf-8?B?WXNYNXJzWUtqZlpnbkl6UzhNVVZSOXNadHpSM0hYYUx1VjBPTlBmNlJtSXpq?=
 =?utf-8?B?MmFBbnRkYi9yRjBROGJPQ01TZjFUNXErNUNIZG9XMlEzY1BuMTd1WVg2MUJY?=
 =?utf-8?B?emFpQ0p5dFFWdVBrVS9zWUtVZFAvVXFteVJyTHAvQkR1dDQ3U3FVbU1RSTMr?=
 =?utf-8?B?NWZXRWFDY3Fnbno0Y1lxYkY2Qm1sRE1GUXV6bk5zYTJXSkVnSjQ5QXRreHlx?=
 =?utf-8?B?bGgyc3MzS1hXcUoyNE8wVDBzRmxzbkNXcmhYYW9Od0FCTW10ZGtKdDM0YjFM?=
 =?utf-8?B?cmltNys4WWJ2R25xaFF4MUJhZy82aWJ5eFpIREJnbnVrQk8yRGdwaTl3N1Aw?=
 =?utf-8?B?dWRlTzYzN1VMY3ZXTllGTFRaNElzZm9XcGlmblBoS2xOVk5oZ0hxSFVZVURm?=
 =?utf-8?B?Z2tMVTdvdGRkcEJ2bWJadExYbEE4UmhpcHkyMyswL2QvdTFYQzduUjhZTlZR?=
 =?utf-8?B?OXpiaU5aUm5BWGhSVnBtcjhqMXhKSkludVYvWXYzSkJPYkpuYnQvZFhKWlFB?=
 =?utf-8?B?Tk5zVEtSRDVWZHl3bnllSURvbWMyVUVMejdITC9IM0djTHBnR0hjZXdvMDdE?=
 =?utf-8?B?aGlzbk5tZk5vODZveUZ2SEx3MG9CSGlsbSs4RnZwUlRQeU9DeEhQU1pYMGpU?=
 =?utf-8?B?allzUlJEb2s3UzFva3J4RnNtNGJ0ajZIZmpPaGxxeE9GaUhyTjhsWUtDa3M1?=
 =?utf-8?B?UitOUE5wT0laczZyaFpoa0RyZk9TR1BRWXVuQStVSW5qK3pHWEY5dHUySFhj?=
 =?utf-8?B?UG1rcFh0WHhNendiNTlabkxIUk5Za2Z5T3pGQXNTbFZ3MXh3b3ZBRXF5U3dV?=
 =?utf-8?B?QjhnWk13U3d3TWFrUWI4VUozREIyQ2lDdGl4U2VrMjFlTTNTYzdTMjEvcUJl?=
 =?utf-8?B?VVBZRWNScHJ6Q1BEd0E1ODh2UXV3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb75c8c-0866-44ad-e242-08d9e7e71119
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 14:03:06.5486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WNj8qRsPogkww+zEVwk4LtIhoxRhQjZWuUy6cXGsDbn7MrjEZV/urbJwyMv/sBKtv7ek7pTpNS5PIiC8ACSAqxl8IvSJDTKC4bQSy4DeTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7232
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::70b
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::70b;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

04.02.2022 16:30, Emanuele Giuseppe Esposito wrote:
>>>
>>>   From the other thread:
>>>> So you mean that backing_hd is modified as its parent is changed, do
>>>> I understand correctly?
>>>
>>> Yes
>>>
>>>>
>>>> As we started to discuss in a thread started with my "[PATCH] block:
>>>> bdrv_set_backing_hd(): use drained section", I think draining the whole
>>>> subtree when we modify some parent-child relation is too much. In-flight
>>>> requests in subtree don't touch these relations, so why to wait/stop
>>>> them? Imagine two disks A and B with same backing file C. If we want to
>>>> detach A from C, what is the reason to drain in-fligth read request of B
>>>> in C?
>>>
>>> If I am not mistaken, bdrv_set_backing_hd adds a new node (yes removes
>>> the old backing_hd, but let's not think about this for a moment).
>>> So we have disk B with backing file C, and new disk A that wants to have
>>> backing file C.
>>>
>>> I think I understand what you mean, so in theory the operation would be
>>> - create new child
>>> - add child to A->children list
>>> - add child to C->parents list
>>>
>>> So in theory we need to
>>> * drain A (without subtree), because it can't happen that child nodes of
>>>     A have in-flight requests that look at A status (children list),
>>> right?
>>>     In other words, if A has another node X, can a request in X inspect
>>>     A->children
>>
>> It should not happen. In my understanding, IO request never access
>> parents of the node.
>>
>>> * drain C, as parents can inspect C status (like B). Same assumption
>>>     here, C->children[x]->bs cannot have requests inspecting C->parents
>>>     list?
>>
>> No, I think we should not drain C. IO requests don't inspect parents
>> list. And if some _other_ operations do inspect it, drain will not help,
>> as drain is only about IO requests.
> 
> I am still not convinced about this, because of the draining.
> 
> While drain can only be called by either main loop or the "home
> iothread" (the one running the AioContext), it still means there are 2
> threads involved. So while the iothread runs set_backing_hd, main loop
> could easily drain one of the children of the nodes. Or the other way
> around.
> I am not saying that this happens, but it *might* happen.

I agree that it might happen. So, parallel drains are a problem. But drain is always a part of graph modification, and any graph modifications running in parallel are already a problem, we should forbid it somehow.

When you drain node, you say: please no in-flight requests now at this node. But IO requests doesn't do drain themselves, so why to restrict them?

And anyway, I don't see how this help. Ok, assume you drain additional node C or even the whole subtree. What protect us from parallel drain from another thread?

> 
> I am a little bit confused about this, it would be nice to hear opinions
> from others as well.
> 
> Once we figure this, I will know where exactly to put the assertions,
> and consequently what to drain and with which function.
> 
> Emanuele
> 


-- 
Best regards,
Vladimir

