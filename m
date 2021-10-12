Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CD542AF65
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:56:09 +0200 (CEST)
Received: from localhost ([::1]:48424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maPkm-0006UE-Vr
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1maPbx-0002SQ-Kw; Tue, 12 Oct 2021 17:47:01 -0400
Received: from mail-eopbgr140108.outbound.protection.outlook.com
 ([40.107.14.108]:14725 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1maPbu-000679-Sl; Tue, 12 Oct 2021 17:47:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4SvcoaNuWFMUJyIl3KpL76fKz388d1j1bM7MQ7AbGF5bvlBFv8pTdtsj+ZwME5qyP9o4UzMAmO9pyufab6mrdwkR44DXRof6HRUNHHPsqToZzlwmMSwM5oBtZTAPNqMQmXiQcUm5L0E945h6DT4RMRfzQYCUXorJzo7mvLAy8fd2WiioZwGl7xW7Eil+q4mV/iWtLaNr9yQdnlzr0PUsAjsmf81c4Xi+bteUtZmwWsIpCYfs7gKvWYlAbg4CKg+F/2WOBFHpa90x/1y2vcLWr9TMG2A+s1I16Jos6uBBGedh9a9zc2HtUgJeFQEe4OEeCc83q2bIKjGPMp2FODp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8wT1oQAHsHIAIekDqiLNQDgvR+qufhMERDcdqRcy2s=;
 b=F/ARD3tLdxEmmdJV9ei3DWCKDJfUnVXmg6oLXPUiSHKxYu7/itd0zdm92hQqyXjn6Hne53EwN1DLJRvkXesQx+P2iSSI6GH/ZdHiyaWDKzvRfP/c466fJwDkW8MDyR+qWjcu6xwi8Pevd0emvbXEpi9pbUQmpLkL1GOYcGoPPWVAZ+YDmjqE7qCXoZhmZjExHTQ+71dTNrMLhgVkoSViEJ6ZANFkMHXBqc8eP1fVVxAMiro/zbh9oIspZTmyeifjJWQGB3pqEtPGdFLB9T1zvUJpryBbUEWQi/R0JrtQZa/8YGIMPRblIyPY3G+XmuAemcF3EPb03YeZhP8yvlKjzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8wT1oQAHsHIAIekDqiLNQDgvR+qufhMERDcdqRcy2s=;
 b=tMAi+XTPHRqFdn1HwVDwlwCgAc51KUaABI9YLryhtfI3c9hMQ/DJOF+I9cB61Q53qfpbVA1L1t2+78WpL46wh2CBAHpkqaGbqLtBTHyUxq6fsbRZx5+fhENIK5zo5JKgzbR299OfBRrr/Ye+Y+SS8VdgxGcwhcMnMqJlr/Qgejw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 21:46:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 21:46:54 +0000
Message-ID: <4d24c91a-4ba7-0f1d-9776-e04daf2abe16@virtuozzo.com>
Date: Wed, 13 Oct 2021 00:46:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 10/12] block-backend: convert blk_aio_ functions to
 int64_t bytes paramter
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, crosa@redhat.com,
 ehabkost@redhat.com, hreitz@redhat.com, kwolf@redhat.com, stefanha@redhat.com
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
 <20211006131718.214235-11-vsementsov@virtuozzo.com>
 <20211006202925.x56o344sxsgbkrvh@redhat.com>
 <b251f39d-d727-311e-e6e4-f84c360cb3af@virtuozzo.com>
 <20211012213703.5knzppc4rzgymp5v@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211012213703.5knzppc4rzgymp5v@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0045.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.43) by
 AM6P191CA0045.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 21:46:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99936444-c8b5-4a93-e17e-08d98dc9ce93
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4690022F02EAAA2BB791F56EC1B69@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L2y3Kmv6upL6bc+VY6lLIGm63v/XhnRCjZGhlfSezBkEHPS2/8zeQjvjx7LrZU0AypEzyiLHByp7Ke6Kdm+yMT1EQwGOWwQDY9qPwTjDa8EKCaJaOsUWkqRosUNRH8g6ciDRD8hTUi518Wbt0Z1p1qY4QvEnE+al/6Amdjk+eHRvIKpR61NAIRCJtQ3tWKi3X7n6yOw/Z4neNJsFMA/bNPX8o2ViIFC3iwrW7bLnFDYFvuwXE1y+/s45VhBj4sKReCXkPDSrDARf+IYe9zbguxJF26iBJx25tiFxCbkStRQ4kl6bF5A6oz3AbjEaoeFNqRuC44fh0JQvA2GPIBmb011Ij26e2fzxXW72zkvUDqeRAgvMw28XkxSsWYAYXB1vtyyr7uxxg/p6n04tUXrV5Ouz/5yL0SEMMhPg7LpsIgCe1kpLirBWQkdaUOv2rru3PndYsKdYxZmjYa6zDwSGnZTqR4ST4OnfmN4p8IlgEtXo/F5EBdQDhPwkBrSWrZOilGsmiLWhfHO4TARn9a3vyEH7XS1jkPuVmm4WgQAQf1C7wCtLOnjzI3NZH9DVQ4ioTMF5VkpYOUbgQJVPSq5uVxR9O8RGdEFH4vRU0GJsRhJPM9aCqzAvDmjVUuoYs0dkW+RB6sb4xYS/PeXxr4xmh9vPWRwvEa0B+Wx1QaJxLCuojXRVX4PgVSpDcrp7X15cJl7kKHH7h4h7R4VdenR0R8NQZs5wJ4UAWfmIopxKjHvhhoqQyRpC+zEhKdbhCXfNSrfQpLMGs2Ah7Tw8/BFC5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(66476007)(956004)(316002)(31686004)(2616005)(508600001)(8936002)(66946007)(26005)(6486002)(86362001)(66556008)(52116002)(2906002)(5660300002)(16576012)(38350700002)(6916009)(38100700002)(8676002)(4326008)(36756003)(31696002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWtWTEsrc0lHUDAydmF5Q1RqTUlJcUdwS0JuMEF1N3JiRTNwNWhEZ2hmOUx4?=
 =?utf-8?B?c2g2VWFoUGY4cjIvL1N6TUhpV0FYM29EUWIrVXdiRVdMeExRNXZsbXBGOTdG?=
 =?utf-8?B?R0ZGb1pXVEdSVnRZWmRpMzRZWXRTbitHQVZSR2wwRU1ncXFrblliK0NxVVBX?=
 =?utf-8?B?NHZsZXFpWmxMTFNRQ1UxbUFiK2FlemdTNTVWa1BtK3JJQm5zQUFVNGh0c0Vj?=
 =?utf-8?B?UlF1OFlWMHZ0bnNxVW90NVN3QXo3cEVwM2I5c1dKS2RwK0lqZUpUK0JEcm13?=
 =?utf-8?B?eTIzQlAvVHZBbStmR1VzNnJNY2hZYkhaNENGeENrQTVaRFRiTjQyL1p0QTBj?=
 =?utf-8?B?V2p0VVB2U0Y5ck4xWFUxQkFPcGNkY1RSWEFIUVR6QzdDdEhuVUVOV0pDRDhw?=
 =?utf-8?B?L1BuTWJCZkdBYXR1Smh0Nyt2eGp6ZzBnd3B6THJINmtwcktEUlZVRVRCdGRB?=
 =?utf-8?B?emt1b3JZSll5NExmQnRUM0tTeDRYcjdTSCtlSmFCV2pSTGlMNzVWOFQvNE96?=
 =?utf-8?B?RmxzaWdISkZ2QnFsRTg1RjhNSDN1WDE0L1ovbzltZDZyM0hQYm8zRUZnU0du?=
 =?utf-8?B?LzV2NUFYcUtKTWJYQUt0dWdWWXVvaWwrblliZUZ2c0daTWN4TFJSVGhKS1Ft?=
 =?utf-8?B?ZHpMWENxOWRLMEZkdW1FM2xhd0hFZjZGRTBJdUh3WUdBYm9qOVlEZGZwMWdl?=
 =?utf-8?B?bkh6bC8zcUl0eHQrVlZKZkFNaG9MYzgyMGFKQ1Y4eWxPN1I5WStPWmQyVjB2?=
 =?utf-8?B?Zk5QL2ttS1ZSUEg4TXBocXdMbHBwS1ZhMlQ2cU0zd2F4b2MrbDB1clM4NUsv?=
 =?utf-8?B?OUJZYjYzK2dIWGhiT0xzMVUvL0ZaRGVuZHg0b29FWVJwRnNGNmx1MW5kSTZm?=
 =?utf-8?B?S0RDWUJwdFRFd1UyZCt2d1B4eVpwOTF0VlVYTVNBcjFralZnejlOejVkN2Zo?=
 =?utf-8?B?dzJMWHg0WUJ5S3dTQmxFdmJZRVFrZFJmNVRHUXlMaCtQR3R1MC9UT1lxc1dz?=
 =?utf-8?B?UFF1U1Y5ZzB3YXFQM2dvWjhjZU9ocGpaNGphRFMrNmFPaVJzR0RVdmY1Mmlx?=
 =?utf-8?B?bEpjcXlJZVlFVmRaNW1GZDZXOGRYZmphcUtwMTlXOUlsV0hQZ3hNNm0xc2FB?=
 =?utf-8?B?Nkx0WmFNWVJaekpFcTAzbGhOZWt2RzRPems5aHc1ZGE1T3p3bjRRUlczNGVi?=
 =?utf-8?B?Wk96N3JrVXBtOHQxbnlvTjh1eWN3TXJydUhydlpPV05vMFNTOE9GZ2ZsSXY5?=
 =?utf-8?B?T0laWXMyYkQ3cDhzaGZ4ak4yNFRrelRORGlqSC9nT0tqSnlwbUVsOGswb09x?=
 =?utf-8?B?cnpNWFNyQkxPWXZiUHREQlBLOWpjeDZoZXdpam51ZDhQbWROWG41d3hmTnZq?=
 =?utf-8?B?S3ZKaExpanBKOHdFN283eUV2a2ZKblVuazV6WHhmekg0alR1bGEvcHBnQVg0?=
 =?utf-8?B?TjlWT0tRT3hMaWJyRERyN3Vtb1JNM0FKMjdNejU4T0FLcFJON1FVcmw0Wks3?=
 =?utf-8?B?aGtHKzdSVmtFNHhzdjZIZ2dBT1ZkTTVmK0RpbEZYL0IwK1dER0h3cHhJcmh3?=
 =?utf-8?B?NzFnL01FRWEwUzFtWFYvTTcyeVhaSXRNT1gxNy9TL2NsdmorMnpqSHVCS2tw?=
 =?utf-8?B?cXUrMVRDS1Jzd3lyUTNwdlNsSS82SVFrcDN3bHVpOGErZ2V2bTVTMVFsWnZk?=
 =?utf-8?B?anpTUVgzdDZaQXBCblVCTnlGUVk5SEFtNC9TUFhxd2pyS3hNYk8zb3dsd1FM?=
 =?utf-8?Q?P48Inci+i6BGK0wbMfga6qHM5XmukMZrU6cuNUu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99936444-c8b5-4a93-e17e-08d98dc9ce93
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 21:46:54.4880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E36NNJBXTmSIYVtlnGr7KXJss3m20DJllzxaj9AbdfT4u/ENmSdMNgUFhr6YPeQsSVmXrIMCWD3nJlsg7SXUrTavW5OgUa/c9+j6acrQaIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.14.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

13.10.2021 00:37, Eric Blake wrote:
> On Tue, Oct 12, 2021 at 07:13:23PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> @@ -1530,6 +1531,7 @@ BlockAIOCB *blk_aio_preadv(BlockBackend *blk, int64_t offset,
>>>>                               QEMUIOVector *qiov, BdrvRequestFlags flags,
>>>>                               BlockCompletionFunc *cb, void *opaque)
>>>>    {
>>>> +    assert(qiov->size <= INT64_MAX);
>>>
>>> I hope this doesn't cause 32-bit compilers to warn about an
>>> always-true expression; but if it does, we'll figure something out.
>>> That's not enough for me to ask for you to respin this, though, so:
>>>
>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>>
>>
>> So, here we need
>>
>> assert((uint64_t)qiov->size <= INT64_MAX);
>>
>> as in recent fix by Hanna.
>>
> 
> Indeed.
> 
>> Eric, will you stage this as continuation of 64bit series, or do we wait for Kevin or Hanna, or for me resending it with this small fix and your wording fixes?
> 
> At this point, I think I'm fine touching up the series and staging it
> through my tree.
> 

Great, thanks!

-- 
Best regards,
Vladimir

