Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196EE33EB9C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 09:37:01 +0100 (CET)
Received: from localhost ([::1]:42426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMRfo-0002wI-5m
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 04:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMRea-0002RO-Is; Wed, 17 Mar 2021 04:35:45 -0400
Received: from mail-eopbgr00121.outbound.protection.outlook.com
 ([40.107.0.121]:64941 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMReW-0002Px-32; Wed, 17 Mar 2021 04:35:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/W0W8sfuSVZZJFglQCvy2xLpIKPeJGnYwBL255Pj8gqh4f5MTS2AuhVBqlntHrjgh7RcCN7xCVLamyoniU+qTEZyMSque2EZJmoU9GypkhOmryLO84SeRy9R0tR02C/9W+MQXbEhLE9xLC/buuSRl2YL00qXBHd86/mpNTh4nj4lisvWaLA38rtArICoUrDkpOq5qAZhBopJx7emv4Caj9EiospjPsUMYUvwajt3Y8dIWo4eVYSkVCF0Cm6mDk8mXVkMkkn5dpU3nrNoxEuAK/69MenoiU++XVFzuK0yAILzh8+twPiC1UJIv2s4NjZI4mtc/YX24xRbcy7pbNcig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RMKOXoNebNjTmhkwKpaMLowC1PaoQaxr4AqBRCAK64=;
 b=Cgz1FS/6GKULQ2Lh5h7T5LTY9npbvVKlc3W+1APAepG3M6EGqFgYGi5WCN6sshTVtDTsUNtDTOgfB28LqhCah4EUvXjoo8/i5P4z8wYrwo3SGuXwvFRU8VJsmVh0K9jBYI1CMIwIwtHZycofftkHCtGg1huBZ+jCXnwrDI6PFJYA+RUUlNv0p7761D1Jlr3A9bdwmYXOhqH6rU1RxxS1CpRFluivEys8H6WrRwiY/D5eXAeskHX7lHBe5KWjT+URFZQJW09lPuHm3WOUkwPiMG+Jk+/fafFmdjPDHgH6ERY7ZD9cHEM4olm3MSvF7vVtdY/mroRRSfhxJvz9OKeOww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RMKOXoNebNjTmhkwKpaMLowC1PaoQaxr4AqBRCAK64=;
 b=d4amS44YJ/vtRPOqG3rfV7KHA9thn3VwSMCAlUhgC2hYZjnnFJDjSWRqmO/GBxIVHBFIjtJ8fkBMI+nJEt8LypFSYXGQICFGSykyW0EgSqJSTfg+3smylQLVKcAsguAlHkfsOLEULiL/pXfdnubrNMPTQIpuwTToNDh8/Z/MUW4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4343.eurprd08.prod.outlook.com (2603:10a6:20b:ba::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 08:35:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 08:35:34 +0000
Subject: Re: [PATCH 0/7] block/nbd: decouple reconnect from drain
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, Eric Blake <eblake@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2066b4a5-7a6b-1810-2522-9118540ae4a9@virtuozzo.com>
Date: Wed, 17 Mar 2021 11:35:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0P190CA0020.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 08:35:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60dbb6a2-fcd8-4134-54ab-08d8e91fa1c6
X-MS-TrafficTypeDiagnostic: AM6PR08MB4343:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4343C1663FAF308213A3C3F5C16A9@AM6PR08MB4343.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ut7BClYwCOLqdim2QWet/I5VCYvywmg/CD1HWyBcq6sC2AeGOOfCt5IPeT7Ck/+xUNAVvM3+7qNQlUDFdtBFg1+Iy0sEH/XUkp4ckGX5OkiNMKU0ep6+E4JBtf00gS+POUgtMVM21pnzPJOalbRI96LGy+NmDjgHsVG6HbKcXqjArh9c29hJST7Wzk1m91ZFuqY7uQWRroLAXFnDBIOhhdrTrjiXMPTYrh/j8t9F1UNRrcfrV9iiM8rybE/6pNYQSgLTr2O7fDg3RomZLkAXw58JZRdvF3Eox4KnuM7aK1+REs/J8rhTicwi5U0U+Pdmm6XGYZKPC7G4QR3Q0D88QER/EnpRJlHsuwnTgRcevZYozFaR8lsOVDqDkJxzzILWL+rrThgn/0wHqgjpDJbYnI7kkt+eCjJHDXzOrf9RUwLajXkkYG4TCVZCqaczBaOwGLnVhzZ8wwyuoY56ULHusepR2nTdF8K0OtaMQ3CSAJ4ON9lp8CBgHEC29f0ehLAjXPAHuFKtm/hjcLrraFfFidudUk3mvUR0c9qfejUwVitP7tJjA0sU20NNT5INU0ZBQRu0wCdWXGe4t3AhiBtjMDhPiPhd4Im3I/JD6x3ttXhl3hNfjfrAWlk5fcGCcuIMfK0tTujg3GL/CBk/D1JNlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(136003)(396003)(8676002)(26005)(8936002)(2906002)(478600001)(83380400001)(186003)(16526019)(86362001)(4326008)(6486002)(36756003)(52116002)(316002)(16576012)(5660300002)(31686004)(31696002)(66946007)(66476007)(66556008)(54906003)(2616005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z0VGVXZuaS93d3VHNjVmTlZicmlSNG5ZNG9QMSt1MFhsQ3kzQW5qZS9qdStH?=
 =?utf-8?B?YmJUbkI0UU0vam5seVlMNE53TDdXNFZlcVlSdDQ5QjRDejkxaVZlV2xDelI4?=
 =?utf-8?B?Qk5jZ2kzYnk3aWdpQmlld2k4T1RRL2NiQzk1K2creTlaMS84MjVaUVlOdnpj?=
 =?utf-8?B?Y2tIelhYWHlZUFhKQTRvSFFiM3RWakJjMTFiaFRYSUwzQXE0M0R2WjQvOWNx?=
 =?utf-8?B?M0xlM2N4Z0N2UVJXZU1FQ1Z6RENjaVNZUysrM0puL0p5SDNFT3pQVlBTclJO?=
 =?utf-8?B?aGV2aTNkV0xRaXV2c1pZUTB3QjM3aVNkaGp0WkVYTmlKMXBTOFNGNVNZc2pr?=
 =?utf-8?B?QUNhMmtwS1liWTNBR2IxbGtweGlGNVY1bmhBSXUzVTRhaHd5VUxOTThpN0NV?=
 =?utf-8?B?YTJVMG1QQ3JZT0R3R0FZNTZGUEk5YXk3MEZrQzhUKzQ0eHVvclJJZ2xtQkpI?=
 =?utf-8?B?c2FKVUZ6NmFDQVEwNTZ1TmtWVm5EengycU4xRzdwaGNIK0Z5RnVTTlNlazh5?=
 =?utf-8?B?dEsxWCt6MzZyM0tNalRhcmlvbWFsYVNmWWtKckhoWFBtWG45NVk4V0VPWlYz?=
 =?utf-8?B?TmVyS1J4S3BKRXpYTkdZN3FDZVBNZ2ZVQk1kYklEdkVxQ21NVkEwSjM3dkFY?=
 =?utf-8?B?clRYMXRtVDNWdXE4b0k5RFRiM3FFZzNlTEpTaHZOR1V4SVNiTVl0V2E5NUFI?=
 =?utf-8?B?WjM3OUdNUS90aE12a09uQXI0UWtDdUhid1hnWUxqaVc0YUlEWGExNGpLSjh4?=
 =?utf-8?B?ckswektvSEpzb1dCcThPa3l2WHo4VnFNcmRaQkVpU0N4K0ZnMmdYUzN6UENN?=
 =?utf-8?B?Tmt3cElvMUxjSERwWUJPbExqZUhyYU0yUHZlZnJSa3NxdEQ4NWp0NHRJRGpC?=
 =?utf-8?B?N1g5ZlR5RzRtN1JGOHpLNmpzYnpaNnVmSTdnOE83YUpZVnY0VlFleTRZUWFD?=
 =?utf-8?B?YUhnSkJUNldPbHBQeHhrQ1hVc0p6cDJYd2NWV2RqMWhxSFE2aGRSVkxDTlds?=
 =?utf-8?B?UlRwc3U0OG52VEtHV3BiT1Q2NVpsbjZtNnJ0SlJRdEoxV1pwcGROWTVSb29W?=
 =?utf-8?B?cWJpUEg0MG83d1F0cFdJdHo3V3c5SWhkbDQyOHdRc0trUFpkZU9vUStXRlV0?=
 =?utf-8?B?cmhoYit4RnM3K1piaU42djVLVlI3NkZzaUZkbHJac0xrSVRiYUR3bVB5Wndo?=
 =?utf-8?B?QW03MW1YODhlS21DelBUREJWK0lxYUJiV015b1pMQTRGOE1HQ1FnemZ3Ym9u?=
 =?utf-8?B?UDdvSmxnQ3JkRFJhdFlybW5ZUUFoV1NyZFN0SDdFRitjN2YxRm1YQ21zWXAz?=
 =?utf-8?B?Umxrc1J0bUdUOUYvclhZb0ZFN3dCWGQyQTc3TURaTjg1by9wdG1OcEIyQXlG?=
 =?utf-8?B?dnQ2d1hrUWZJQjFMdlVMSnozYjNKOTAvdEFMQW1XOWVDL2pxRWRoUzJFVjhi?=
 =?utf-8?B?Umw4bXJYL3NSR1NyZFNLV2hmTzc4bkt2RUJtMmNLeTI4dnpzbGk0TlJvbTFF?=
 =?utf-8?B?Sk5SNy9JMTUvS0V2M054QzA5cGVQdTJjT0FtM0RCRTIvS1I0cm1iMWk0R2hw?=
 =?utf-8?B?YUk3Z1Byc2lxWlMxZnVMMVBtbG1ldzJMRjd3ckRQOU9WdXg3K3NPVjNHd3NU?=
 =?utf-8?B?N3V3SUxuTFB6aEhDK3IwVjhuY2wwTlh3SnlaNFIwWTZjUkpSUURmUTNmSWl0?=
 =?utf-8?B?VFRleDZJQlp2Wk12Q1g2RnJZL2R1cEdjSHF3c01YaThxUHhRcGFkU0xidXpI?=
 =?utf-8?Q?F5RvQSRZPMbsdkcgx+T9eUyH7DS6H39nT00LZUs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60dbb6a2-fcd8-4134-54ab-08d8e91fa1c6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 08:35:34.1308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyH1Gn2H+KEhZ6cZAe1RDhLoaJ+e4TfWzFsRU9tnv1szMV8My/iywAM8ut73yies2OBou2ZVYwVtKtPIDEgylai6YpCHfkpHru0RKKr+97s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4343
Received-SPF: pass client-ip=40.107.0.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

15.03.2021 09:06, Roman Kagan wrote:
> The reconnection logic doesn't need to stop while in a drained section.
> Moreover it has to be active during the drained section, as the requests
> that were caught in-flight with the connection to the server broken can
> only usefully get drained if the connection is restored.  Otherwise such
> requests can only either stall resulting in a deadlock (before
> 8c517de24a), or be aborted defeating the purpose of the reconnection
> machinery (after 8c517de24a).
> 
> This series aims to just stop messing with the drained section in the
> reconnection code.
> 
> While doing so it undoes the effect of 5ad81b4946 ("nbd: Restrict
> connection_co reentrance"); as I've missed the point of that commit I'd
> appreciate more scrutiny in this area.
> 
> Roman Kagan (7):
>    block/nbd: avoid touching freed connect_thread
>    block/nbd: use uniformly nbd_client_connecting_wait
>    block/nbd: assert attach/detach runs in the proper context
>    block/nbd: transfer reconnection stuff across aio_context switch
>    block/nbd: better document a case in nbd_co_establish_connection
>    block/nbd: decouple reconnect from drain
>    block/nbd: stop manipulating in_flight counter
> 
>   block/nbd.c  | 191 +++++++++++++++++++++++----------------------------
>   nbd/client.c |   2 -
>   2 files changed, 86 insertions(+), 107 deletions(-)
> 


Hmm. The huge source of problems for this series is weird logic around drain and aio context switch in NBD driver.

Why do we have all these too complicated logic with abuse of in_flight counter in NBD? The answer is connection_co. NBD differs from other drivers, it has a coroutine independent of request coroutines. And we have to move this coroutine carefully to new aio context. We can't just enter it from the new context, we want to be sure that connection_co is in one of yield points that supports reentering.

I have an idea of how to avoid this thing: drop connection_co at all.

1. nbd negotiation goes to connection thread and becomes independent of any aio context.

2. waiting for server reply goes to request code. So, instead of reading the replay from socket always in connection_co, we read in the request coroutine, after sending the request. We'll need a CoMutex for it (as only one request coroutine should read from socket), and be prepared to coming reply is not for _this_ request (in this case we should wake another request and continue read from socket).

but this may be too much for soft freeze.


Another idea:

You want all the requests be completed on drain_begin(), not cancelled. Actually, you don't need reconnect runnning during drained section for it. It should be enough just wait for all currenct requests before disabling the reconnect in drain_begin handler.

-- 
Best regards,
Vladimir

