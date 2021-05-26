Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D803391E6A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:52:16 +0200 (CEST)
Received: from localhost ([::1]:44566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxhX-0000jZ-9y
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llxB1-0006PK-HK; Wed, 26 May 2021 13:18:39 -0400
Received: from mail-eopbgr70121.outbound.protection.outlook.com
 ([40.107.7.121]:34894 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llxAw-00026s-DX; Wed, 26 May 2021 13:18:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ia0HvsLToL39HqOgkALNpZ4/3N6M8QYgR9HG7jtzikMqZ3+//ESVtiBOohaifYNRciYxCNwXWKNXztvQXuM0nTUxccohqMKXdQp/y6+1qkBAKgPANmY6u9PvAoHuABclkv3NGHVJB5EvU57a3LtmwLS2Mrq2jEcv7UW74nDge5Mk8zYhPYVciK2hGYloadgW7XlWBx6fB2xBnaDoVaOA3UIJMItkCi6qX3sLelWcGv9Fb1+n02hn0a9qCGAwP5tgplSaElL0Zj5i9/8itIutObWFoIobUrtCgNVINcVuuGvYef5GSTo2QxC3oZ3UQLvZBx8PAonqerYww7vPNqZQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56Gq9WODye2LHFzriB1uThB9U9qNvbd5ggFWt3Y9LvA=;
 b=UEHwXIIuVYsPn4YO9+TEsqIxw5BnkWi0tvvseCAoefyyG3Nsf29A98E8QO2TX1JW8xGT7ppY0NAnX/6su0Xc8Eqw83gTnl4t8+JyKqVTICBEbm2wTobGKe3xpz0XTUjzDO8gSlZrOKmXDBwl0O0gFxPlp8Q/Ar7GpnEuC99yd7e/LhNfkxajYbvs5kSUydndw+F3oWcIkLAUpAgQiqTSx8+HAvys93k3O0cXRWk7Qy8kCuNtZ27aSHmIePeRX0gkA7xRaHnRWxYvIHqojKe0fQbZ/BqfNs6ZMedFdxWD3ib/CjmxiMwKUCmXRTQrc4cRqtvk3rzWpN9FVnlfzA7DsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56Gq9WODye2LHFzriB1uThB9U9qNvbd5ggFWt3Y9LvA=;
 b=Z2L22JlnWvAFT0qWd3ehl9NYcukFFt+Ckxc8CcaGZ/I7HtDMcwMnvz0/pqJJIu41Uupg3E5as4RvR5JTma4nnqH0LYURhVvmAeTK1Rgd+0cHFJtjOcyUatJi9ysq0wdpOMDxsRYpKULf6n1IuUUBlcmXDd6iKCc2mwnyBzp5h3k=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 17:18:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 17:18:27 +0000
Subject: Re: [PATCH v2 7/7] block-copy: protect BlockCopyState .method fields
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-8-eesposit@redhat.com>
 <404e2891-9c03-bc7d-2c69-a572422d7804@virtuozzo.com>
 <4403ee17-0c12-c545-7f64-683bb9057b91@redhat.com>
 <c4ba5232-79cf-6534-d76a-ac5eaebe098f@virtuozzo.com>
 <db0d5d2c-2e7c-ec33-b9df-52977fc3179c@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <47ae4243-5a4b-e3a5-44fb-48c689f8bc77@virtuozzo.com>
Date: Wed, 26 May 2021 20:18:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <db0d5d2c-2e7c-ec33-b9df-52977fc3179c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: PR0P264CA0095.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 PR0P264CA0095.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 17:18:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f14a0c6a-6274-4e84-6787-08d9206a46d2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-Microsoft-Antispam-PRVS: <AS8PR08MB690477FF0106106258BC6789C1249@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ux57LEDLAVSCNG6ikRppOsu55bYLh+lriji6B2J5iKIvCz2e0+hgiv3tPRKwioU+orP6JEYoI9aAEXpFdq7l0BS1Di+gC/OWbAfNZ+s51MpT+srDj9Hcb3hMX+5FVaEPYhQ5bHGe60veNPvCxZmentw8XSkqoboPtv59vfFNOnL7nppNeN2xhG+fT1U7+d4iFwApwVpiwKLQKVLW6ozdtHVagObuxe/nV42U42nRf1kO5glSbOZdgV4gM9S5ZTIw1wpsOndgzUUI8fKSwjWZkOHGr/dHkxmGILBvt45ZrLH+huwljv/QBzArjeGYloe82AnEZvdwFYKDjmqyw/Zr1eKHr4xtFI0EIuXCiNU9SXWas+BdEHxjvzv3jM1rcL4eaMm3UfXEy0eJpvR8c7/u0/1IT1fNdGIZH5rM9gUkWI61VAOBYAVIqXZh9hdK7JFWSisCxxKoj7tZdNmfezVX/3IGObTeeyMcpLyZLhpmp1Ua5GHG4lqYDgpcmq3E23vGpu7Lmcdn6ldyxOqpa34DGJ2Sq8NglQht+z03v9QQvANS9FeylK/8GW+KKCYY2GTIt9ztDGVv1v7CDgY4by8YuG1ZmjG8BptMdx5viFW4GWEJkvwTkFfDA/qkd/BZ24i//7RP7KuNtf62o5WGS8WHxr/w0vVydhJLIs6kgIS9onPIZNNW1oxLNeHgHrQ/xCUyYPdzJGp1zsA5Khh0Ms6UiR7DejAzrPjBaH3j+QevoGNRzBlYH5uktVuvWe33NFsb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(346002)(396003)(66946007)(31696002)(38100700002)(38350700002)(478600001)(110136005)(53546011)(5660300002)(66476007)(4326008)(316002)(86362001)(54906003)(2616005)(6486002)(16526019)(16576012)(66556008)(26005)(186003)(36756003)(956004)(8936002)(31686004)(52116002)(2906002)(83380400001)(8676002)(142923001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OHkyNS9YQm14c0Q3eHc0Rkc5SEk2Y0lOM25jbE1zYktuVEdkVlVUMVZTSldH?=
 =?utf-8?B?eU9xMXRab0Y1Y2VYWEdRZk1kQzJHSDcxSFkyYWpyc056eVJEemhVcWhLdW5N?=
 =?utf-8?B?bWVxVWZsWjVwZUE4dlZxUkJKWGlaclRSWExZbTVGaWpnV1pUSC84RWlLTGE1?=
 =?utf-8?B?c3FRZzlKY0Rpejcxd1A4dVlvekkycUpPRkRWbUlRU0d1TlpxbnFraE9RN2RT?=
 =?utf-8?B?RHFseElta2YvRHNQc2xNMGpvQUo0b21DekdodS9Rc013RWV2eGRaamNoMEdH?=
 =?utf-8?B?Njc3ZjZJMFBzdkk5dzNkUE84b3dFSXpjeE9OQWdYN2g2M0lTS0Q4OVNuQkhn?=
 =?utf-8?B?anFDRjVoR3hKSk1sZ2dENDhmWGJmUDJ5RTk2VnZtWm5ZNjdjemFRbklpcGlM?=
 =?utf-8?B?WWlIUmN3bEY5RHpLSlA1SVpqN3Z2bk9NZlpHMy9vVFRyNlJsK25MVkdBRE9p?=
 =?utf-8?B?VjBJYU9HTHdBUjNNS2lPT1BYemNyWmE4SklhWHVabzBtWHVHRG5ndDBhR1JE?=
 =?utf-8?B?RVh1ZHBreHJqazY0SHFDTWZIZGRlbzRoKzRSVkY4Z1ovcnB5UDg2TFFJZm9J?=
 =?utf-8?B?K1pXQlNxZkIrZjlYb29oUjF3aytXTGtHNG1rRXErekhTZUwxeWxuY2FEZkc1?=
 =?utf-8?B?Q012U3hqOURFTDRoRE0rQ3V4Y1N1M3hGclQzeEIrMkRoTVQreXZ4QXkyQjZB?=
 =?utf-8?B?ZHJ6aEFGeVh6TFI3TG9ESklqdmw5SDRNTksyK0FBdFlkTzNlZExDQWNWU29W?=
 =?utf-8?B?K0p6Sjh0NFdXSE5xWjYwMTZIclNZOTBGbTA3NnR0SE1KQ2RkVG1zcVpBN0pI?=
 =?utf-8?B?R0hKVE10ZCs4QWJPMVlya1kycVBWMldkZGVFNU9EbWR4bVdXVUZCNEh1TGtL?=
 =?utf-8?B?OHJYUEtYS0lJRWh6Q01nZmo2djNLZEd3YjNGa3d6RGVZcENMNlQ3YzhuSGxn?=
 =?utf-8?B?d2NBUlpxVUoyZ3VJMVlhdWJ2d0VGR01MbEh1SDF6QnVVb2dnUngwTWZjdkxT?=
 =?utf-8?B?bmZXdkJBVkxoYnVWMTl6WmQ2YUVwVVpQcUxVUUd0bmZHSE5Vb2prY2NIUndO?=
 =?utf-8?B?VlNGa1BreXREZzhDdHJxK3IrRlpveFNOaEszbkpoQVNVVlFNSi82UG5UQy9N?=
 =?utf-8?B?TzQrYTlsbUp6RDU0N3RydU9WY3pRd2ZnVGtMMlc5aFBvQ0YwVzl1WUlBZG92?=
 =?utf-8?B?aElOZmZqSndteGNrNm00NUI4SjhydkVDMllIOHNKbW1vbmsyY1FMUXdCS0lM?=
 =?utf-8?B?d2o3TFBaRE5nWHcwU1VpSk9YdExmRFk0bW0xL2VYakUyeThCNmt3dGR1K2xu?=
 =?utf-8?B?Q0FOSmQvYkpVTUc2SFdTMFVSd09lSnp2WlZnNnFEaSswd2VHNzVpdnpTL01t?=
 =?utf-8?B?VmhOeHBNMnFFVUJ3SFVnMGJSR28ycGFrNnJVMlhrbXh4a0JBMzFoTVZUbFN4?=
 =?utf-8?B?ZEhWVC9LYUVFYTU0MkxUMTNjazNMSU05VWJnV085dlBJZG1KUlByWVR3TUpz?=
 =?utf-8?B?NzcrZFBla3kraTRQOTdOc3NpQ3ZYYWdESHc0WWZiOFF3Q1ROM3RxNnJyVWg3?=
 =?utf-8?B?Zm1rWWlkNHFVSko1MlZ1OXNtcVhwSVBDbzFMQ053ZDE3S2NZM09KaEhBVDcz?=
 =?utf-8?B?cmRzR255ZHora2dzakRCTkNnL0tkY3cxazhGVlJ5MnJnZG9vZUpKalRCY0Vn?=
 =?utf-8?B?a1BVUE9JQzBFdmtaVFdnZUc1dThXNFV6N3p0dVQ1SDI0UjVKUHBocDlXd0pF?=
 =?utf-8?Q?mR1WXQbtdxHuOa6T/0wykpkPP6KfOaQv5/eueov?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14a0c6a-6274-4e84-6787-08d9206a46d2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 17:18:27.7248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBGCx1vI2gvFlbB1621h3q/YHcjt52Czf4X0yk2hWjQEsLf9t4jCebFpDOGo5bSP6T4wWXHuDWSir1D5IJcO6eaBcmW69G/C1kOCPugDei4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.7.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

26.05.2021 17:48, Paolo Bonzini wrote:
> On 25/05/21 13:00, Vladimir Sementsov-Ogievskiy wrote:
>>
>> Hmm. OK, let me think:
>>
>> First look at block_copy_do_copy(). It's called only from block_copy_task_entry. block_copy_task_entry() has mutex-critical-section anyway around handling return value. That means that we can simply move s->method modification logic to this already existing critical section.
>>
>> Next, block_copy_chunk_size() is called only from block_copy_task_create(), where we should have critical section too.
> 
> block_copy_do_copy would have to release the mutex around the reads/writes (including the bdrv_co_pwrite_zeroes that has nothing to do with s->method).
> 
> There's also the "goto out" if the copy-range operation succeeds, which makes things a bit more complicated.  The goto suggests using QEMU_WITH_LOCK_GUARD, but that doesn't work too well either, because there are two accesses (one before the bdrv_co_copy_range and one after).

Hmm, this "goto out" makes no sense actually, and should be removed.. It's a mistake or a kind of forgotten thing to refactor after some changes.

> 
> So I understand why you want to avoid atomics and I agree that they are more complicated than the other solutions, on the other hand I think this patch is the simplest code.
> 

I think it's better to pass s->method as parameter to block_copy_do_copy. Then block_copy_do_copy() doesn't need any kind of synchronization.

In block_copy_task_entry() we'll have the whole logic of handling result of block_copy_do_copy (including changing of s->method). And then, only one question is:

before calling block_copy_do_copy() we should get s->method. Either by atomic operation or under separate critical section.. I'd be OK either way.


It's actually the original idea of block_copy_do_copy() function: do only simple copy, don't interact with the state. It's a kind of wrapper on top of bdrv_co<io functions>.

So, actually updating s->use_copy_range here was a bad idea.

Note also the comment above block_copy_do_copy():

  " No sync here: nor bitmap neighter intersecting requests handling, only copy."

Somehow, the comment conflicts with introducing synchronization primitives inside the function, although it was about another things :))

-- 
Best regards,
Vladimir

