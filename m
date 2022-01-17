Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950F5490911
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 13:57:20 +0100 (CET)
Received: from localhost ([::1]:40172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9RZX-0007Qm-KP
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 07:57:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n9RDi-0001qy-4L; Mon, 17 Jan 2022 07:34:46 -0500
Received: from mail-db8eur05on2119.outbound.protection.outlook.com
 ([40.107.20.119]:62560 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n9RDc-0000ZO-5S; Mon, 17 Jan 2022 07:34:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yv5BsdzhRNOf8z1/biJwEgKSpXwWUeQuiy/CUQjTDUwEjnSOroaKsEWbcgyGTgfF8yqvg90QBhpJVjD94g5jGBlKnpf571TqjnxpM/6HZkSIBRYem4Gh+a7HzZ15rpM8Rc7pASUw22hfJjR3WFwXKMbs/9lP+8Ima+eTJauaPIrPzqstWR1zeC/0SUZb7kGE6MROC7Q/3GQNPyze+/cMymAExOtRGJ7Cp3O8xQx4d/xRtnaJFj25qyvY0QrQLxwHwA2Ko1lmvou5mIlHkIjTUnLS7+d4tOixjnhkCw7sOmPNf51aNkuucL4HBtpd2qNso2MwZyCaZGIK8LKEnv9oOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVwbaISIxslh89zRwVMGn5lFWjDFKrr7OTCB9msl5lI=;
 b=dgA/BHAaZ+CJtpnoZ8rfkDQxN3Se9KQXP/heuLqMxdBXseVL8jg53727K/D7cPBpfjNkQ0F7jdMzkpSp0JhAAq7qZRsrfUB+xhJK2hnrkuCAeIwdXeDKY9jgJpMZ8T0+parjsLp8rsJZOUsH5VVSTXZlnxbSwgk916nsTKqwnitTbJYZgTY+zCKOUx8cgz+le+91R4jW+S7LUXFPM8UoBX7+RLQ7PXWRrFDEneQ3wAdJcwMt2E+ktmPdlvOh9PyvY5xB+515Bz8HMwV8OZtfWmgCdY23PhEr3ncly04mSEWO42e2ZpyiqEcYeB4Z1lsgI0Zoiz1GrekiWjN+KwZEfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVwbaISIxslh89zRwVMGn5lFWjDFKrr7OTCB9msl5lI=;
 b=ewOOzWykxOo5D6S+CppP4jMINbhG74AbftXUT7e606NDmF9+w/V7xHcOl8MfY/yAx1nByCECKsrU3MR1wC9/vuxWp+EhxRzIYoQDUPIgvvcmguqNoNnLJV1NrQBRHkOOX1VOT5zNbKWMQ0mYR7orbsIhhTbLrTQTjYIuC4MLGH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25)
 by PR3PR08MB5691.eurprd08.prod.outlook.com (2603:10a6:102:82::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 12:34:37 +0000
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461]) by DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461%5]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 12:34:36 +0000
Content-Type: multipart/alternative;
 boundary="------------Zm2IDpHjJtbvMTATx5XDaeLC"
Message-ID: <f670fcc7-6956-809a-97d3-ab495d33585a@virtuozzo.com>
Date: Mon, 17 Jan 2022 15:34:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 08/19] block/reqlist: add reqlist_wait_all()
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-9-vsementsov@virtuozzo.com>
From: Nikta Lapshin <nikita.lapshin@virtuozzo.com>
In-Reply-To: <20211222174018.257550-9-vsementsov@virtuozzo.com>
X-ClientProxiedBy: AM6P195CA0063.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::40) To DB7PR08MB3484.eurprd08.prod.outlook.com
 (2603:10a6:10:45::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ee3bf59-3900-4cbc-2715-08d9d9b5b90c
X-MS-TrafficTypeDiagnostic: PR3PR08MB5691:EE_
X-Microsoft-Antispam-PRVS: <PR3PR08MB5691CAFC65906F91F2259CB886579@PR3PR08MB5691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zCbnwjmkSwzDMPvlVZIjbX+1hbqzJE3c/rok5DddgAOZKULcRwKgz2hjnAtCS8L1EI7U7IwdNbDv9vCWBhjsi9SZTcTG4M5Bu79WgY4lAIxhNvuZoP3ujddOc6zf0P7AZQhxaYEeIC4Xovc+VelN6GFaNJm0TPPebGacg/Dk5eXU591m7d82vChTUhLT1PuG+uiXxnhahfgXEOwXLvexS+jFkg8+/VZ2mOF0P31vDnGCFp8HWl+ZkN2WurdMT6Ol5alzNQHvO5MemVQY17Bo2M/2jUzQ1N25Fi2Bvhf2Zp0M0NkO3weS93uQdaGBN2FXmQRRoKr5L7nx7ayknp3gajhXneSA/rkGliALr1mwRHhzXpnWX8HNGPIqIH1EM8a+Ro5lA3zrgnMYJ22c8U77uD0JoLOVxgtIayxyAbmcRjQiEgCiFcboZxJ4dIC3roB5MDGPOWpJRdbYiAnQGlrff1YKo373ljJqR3nYqftUOpguUN+D+fgAPoRUFTRE/Np10EL4dWD671wh3S9erSM9rA/ZjmQr9VCuHJmuFIEddYZhzvglI+LKRsBLBlAxkDSDJitXH08oHuKmPTKfT3sKyak8L+HTPP6v9zA0dB5Nlm0CN7Ks+2GDRbvl8wCckGHQxRASLHyQnZ6HYi7WCAYRkI3t/jN7kylamDcwdYp4qlhOJGU+GlAjEb9zsw/ZfKssti44cBLkV2PahcSHUxXLAmAgRurSlYpDGFrCirC0/ue59fp3ElggBlVhBOI+zUhvtXxX6MkfTO326Ys8J2KCgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR08MB3484.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(316002)(186003)(31696002)(38100700002)(33964004)(38350700002)(4326008)(6506007)(508600001)(2616005)(66556008)(52116002)(26005)(86362001)(6512007)(5660300002)(53546011)(8676002)(2906002)(83380400001)(8936002)(66946007)(66476007)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWE4Nnl6b3E4bFJPeGlqOG1aWHVlanZNTTQxdTNTMGZRVnh3RUVlMVVtcE1R?=
 =?utf-8?B?QWpCZUZONnRHOW5tSUtObFVTR0t4bmFxMEwrVlJwZEFiRlQrRFdHcFVlczVj?=
 =?utf-8?B?MldPL0VZeGZPSy8yT05wREpwYm56Y2ZXRWRsckx1Q3dtQUZNT29sMnlRWGRQ?=
 =?utf-8?B?aUQxUmE1SXF6S2ZodkhxV3pRVjlrc003OWdhckk4bEFaWHVZK2tGTUt0ckpn?=
 =?utf-8?B?VmUwdC9KTkpQN0E2dkdneFN0dzN2VEpsVnJJWE0wVlM2cUZBYWVWT3pHVHVB?=
 =?utf-8?B?ODRiNG1WY2dha1A1VENwb0tTVERWa2dZUTdYdUNTRWlwWEloSW1SV1pyWDFw?=
 =?utf-8?B?bG5YaDdIeUg1R1ZtcEp0UUlheStmeDl2SlBWZ3BXRzVYbTQzaStWeFFDT1Zj?=
 =?utf-8?B?djZGUVBhYXdIZVVKVG9ZSkFqTyt0NjVhWk5ydFROajNNM0VPZWlyejdFV1FE?=
 =?utf-8?B?NDRoM1FKaEp2bS9IK0tQRGNMa2tNOUhFdFB1UWRnRXpEaE5ZdzdZZHpaTUpF?=
 =?utf-8?B?WGpQamx1clMvbTY3TWM5c29CalVXOTUraTZybGVvUkRMN1o5T0phRWpKUXl2?=
 =?utf-8?B?VW9FWW1BaFpPeHNUaXBucjRCc01Ma2oyTHo0MGRUUFR6WldGMDlsVmx3d2pj?=
 =?utf-8?B?YkZ6Y1BhNGwzeDhrSUpMd0NacVd1NFNCN2RvcG5lMUVnaEU1bkhZZGRiUzRa?=
 =?utf-8?B?UGFodDRaNlp5c0RMMVBSVUhlR1NxelZ0Y1VkYVNDOVFyRGFXTldRQ1dlbXhU?=
 =?utf-8?B?YnpvMHo4M0hnVHAvRXltYjVGdGhoMVpkT0pSUmNBU0xKRXMxU0tQbE11Mm1C?=
 =?utf-8?B?N0k5c2ZwQ0U4bjNTNHlTVVVDcW84VUJvNnN4NllVTDR4UkgrNzdnQ05XQ1BH?=
 =?utf-8?B?ZFUxbFhjNkFkMmN0U3IrNlNtemp6SkhqODBKakJMa1U4M3JMam4wRlkray9S?=
 =?utf-8?B?a1NlemNQWU1uRTEvTUN3VWU0MVlLRTFUdFNodHBybHFuYmFsazN4WXNvR09u?=
 =?utf-8?B?VS9aTEN3Skc0OERDdVNtV01yb01KMWpKVjJYTnhTM243S00zcnJTVThjOU94?=
 =?utf-8?B?SGw0OXZEVXNId3lkV20weXJRTUhPNjJNZXYxSGw4MkphaUpKcHArOXRkUHZX?=
 =?utf-8?B?dEZGaEhBNEZrRXdCTU9XZnQvOWhScGxIQ0VQN0lFVDRvN3VqY3pVbm82S1g3?=
 =?utf-8?B?Q3VqRHVKQzd3cGk0ejVkTEZtN2VJT1NnOFBzOUlaUXptNGZRQk95eEpQZlJw?=
 =?utf-8?B?UHE3M2t5dHYxblFCQWpJL3NTT2EvbjcwZ0VKaW5xR0dURmI5aHNHamdBbUI2?=
 =?utf-8?B?eUhRQ0ZtOWFrdzJqcXdZU04zVG9pL0tScXhKSS9oaGxubUNOYUFJWEFLRHoz?=
 =?utf-8?B?bmNsSjdSckNkTHUveVlsanl4VzlPcUVTcWhnT0VqZVpUenFEMG4xcyswSmw0?=
 =?utf-8?B?aW1PNDV4WmVpUjFCM3NYc0dyeG51ZDVCZjYybzJEbWpRdFBSRzNSZzl4WmVJ?=
 =?utf-8?B?dENIa2pxYzhIZW1CRFlhUnVrQnR5ejZXK1NSdjFDc3U0WENuR2JLQ1ZUdEs0?=
 =?utf-8?B?a1BsZkljazJoaDBoc2tqZDd2MEwyQ2x3MXdtZ3hvYUZSMWxXU3VWUTFDTCt1?=
 =?utf-8?B?Um1FUGtGTDBCbUQ0eFNtaUFwVEpTUit4UUQ4SkNwT2U2dFRTSW56L1cvQzBk?=
 =?utf-8?B?UjZ4Nk5YNnYrSCs3ZGlmRE1iWW4xZDJlLy9iQVhNUjNnSDdJdi96VitKZjBV?=
 =?utf-8?B?TVh4RUg2NzZuc0dyVGl3ZlRpN1p2NzlRSFlxdEJ3enN4Z3NkQ0Q0YVNoMmJQ?=
 =?utf-8?B?dndRLytFRTZ2NGp4WUM4cEhmV0NLOW9hbGpqdzdnclhEU2Yxb0d1WXpGN2Jq?=
 =?utf-8?B?UWRkN3RwUC9pMkJFN2IyZnlPekVyT3JYcWVWeGJQZEgvWDZjdDdnQ1A0ZXRu?=
 =?utf-8?B?aDVmZ202Nlh4aUQ0S293V2dxVm5CU2l0cXdUeEVUYndaWUU5emkyMjBGZkEx?=
 =?utf-8?B?ZXRYdEhydWZYOXZ1WTJaRS9OdmhGOFMvTnBZV2Z4TEJzVjBqVDVhditjT1R5?=
 =?utf-8?B?VThDWTFwNmhxTFlneUh4TmhFWDMxZWxzcDg4ajhtQVA3U1BoZzhmejFCSjFE?=
 =?utf-8?B?SlA4b1ZuYUp4c1c3VmxtSjNHSGVNRFU4dGRuZEQ2cC9KUElMd3NMR2M1d0l5?=
 =?utf-8?B?WWlIdlZFb3JwUVdrd21MRU43bStEazYycXhDcXNJMHlGMkE4U2VQMjRQNy9H?=
 =?utf-8?B?bGJQcHdqYklOaGp2dGlaak1iR0JnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee3bf59-3900-4cbc-2715-08d9d9b5b90c
X-MS-Exchange-CrossTenant-AuthSource: DB7PR08MB3484.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 12:34:36.8594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jx330PcgGuLGOyuAqhapIsw5UchsaJez5G2r6Uk4ZfMemV9EOxoW2slXjeI4cZVWL8RsGRoZL2RW0E6eZZbPFuM/eXIlruUtilMLQYp9+Xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5691
Received-SPF: pass client-ip=40.107.20.119;
 envelope-from=nikita.lapshin@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--------------Zm2IDpHjJtbvMTATx5XDaeLC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/22/21 20:40, Vladimir Sementsov-Ogievskiy wrote:

> Add function to wait for all intersecting requests.
> To be used in the further commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> ---
>   include/block/reqlist.h | 8 ++++++++
>   block/reqlist.c         | 8 ++++++++
>   2 files changed, 16 insertions(+)
>
> diff --git a/include/block/reqlist.h b/include/block/reqlist.h
> index b904d80216..4695623bb3 100644
> --- a/include/block/reqlist.h
> +++ b/include/block/reqlist.h
> @@ -53,6 +53,14 @@ BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
>   bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
>                                      int64_t bytes, CoMutex *lock);
>   
> +/*
> + * Wait for all intersecting requests. It just calls reqlist_wait_one() in a
> + * loops, caller is responsible to stop producing new requests in this region
> + * in parallel, otherwise reqlist_wait_all() may never return.
> + */
> +void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
> +                                   int64_t bytes, CoMutex *lock);
> +
>   /*
>    * Shrink request and wake all waiting coroutines (may be some of them are not
>    * intersecting with shrunk request).
> diff --git a/block/reqlist.c b/block/reqlist.c
> index 5e320ba649..52a362a1d8 100644
> --- a/block/reqlist.c
> +++ b/block/reqlist.c
> @@ -57,6 +57,14 @@ bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
>       return true;
>   }
>   
> +void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
> +                                   int64_t bytes, CoMutex *lock)
> +{
> +    while (reqlist_wait_one(reqs, offset, bytes, lock)) {
> +        /* continue */
> +    }
> +}
> +
>   void coroutine_fn reqlist_shrink_req(BlockReq *req, int64_t new_bytes)
>   {
>       if (new_bytes == req->bytes) {


Reviewed-by: Nikita Lapshin<nikita.lapshin@virtuozzo.com>

--------------Zm2IDpHjJtbvMTATx5XDaeLC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <address><br>
    </address>
    <div class="moz-cite-prefix">
      <pre>On 12/22/21 20:40, Vladimir Sementsov-Ogievskiy wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20211222174018.257550-9-vsementsov@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">Add function to wait for all intersecting requests.
To be used in the further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <a class="moz-txt-link-rfc2396E" href="mailto:vsementsov@virtuozzo.com">&lt;vsementsov@virtuozzo.com&gt;</a>
---
 include/block/reqlist.h | 8 ++++++++
 block/reqlist.c         | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/block/reqlist.h b/include/block/reqlist.h
index b904d80216..4695623bb3 100644
--- a/include/block/reqlist.h
+++ b/include/block/reqlist.h
@@ -53,6 +53,14 @@ BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
 bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
                                    int64_t bytes, CoMutex *lock);
 
+/*
+ * Wait for all intersecting requests. It just calls reqlist_wait_one() in a
+ * loops, caller is responsible to stop producing new requests in this region
+ * in parallel, otherwise reqlist_wait_all() may never return.
+ */
+void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock);
+
 /*
  * Shrink request and wake all waiting coroutines (may be some of them are not
  * intersecting with shrunk request).
diff --git a/block/reqlist.c b/block/reqlist.c
index 5e320ba649..52a362a1d8 100644
--- a/block/reqlist.c
+++ b/block/reqlist.c
@@ -57,6 +57,14 @@ bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
     return true;
 }
 
+void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock)
+{
+    while (reqlist_wait_one(reqs, offset, bytes, lock)) {
+        /* continue */
+    }
+}
+
 void coroutine_fn reqlist_shrink_req(BlockReq *req, int64_t new_bytes)
 {
     if (new_bytes == req-&gt;bytes) {
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre>Reviewed-by: Nikita Lapshin <a class="moz-txt-link-rfc2396E" href="mailto:nikita.lapshin@virtuozzo.com">&lt;nikita.lapshin@virtuozzo.com&gt;</a></pre>
  </body>
</html>
--------------Zm2IDpHjJtbvMTATx5XDaeLC--

