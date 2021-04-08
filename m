Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA02358043
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:06:05 +0200 (CEST)
Received: from localhost ([::1]:41282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURY4-00029b-FA
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lURW9-0001B5-H8; Thu, 08 Apr 2021 06:04:05 -0400
Received: from mail-he1eur04on071f.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::71f]:42471
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lURW5-0002RL-RG; Thu, 08 Apr 2021 06:04:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gw3hlfm7Xgn/VkBEXnPpPxM6zVKuy4njDczLnYgJ9WH/zSey7oZbXFzdGxezAoORQiJYSJ0X4h6udwXwHATNpumfk5CMhJwjbBSH9TZp93Ytqs9ZQrklYtAoTSfYnAuC7sNlVivU+qT16njXU3VWXXbx4rcd5QIibUj6UZowozKz1ZRqslRtiarIFDj7/90kCDHg74M3p/eUGpbku3ItTiM+j/lst4Q1DJi7FhIxffosac+VKg/IfJXojVQ6cZOwFzsOInfwVs9Zk+r4MKtXAX1BIc5swq9k2iY8UNC1mSdA1GLoAkIC1bhMB8mETBwExjer+NE43Qw1bDUgOX0v7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4iFK+URcc0feD4+6rO0UQrMSN8p43wrOWcSmF5nquU=;
 b=emhaKh9DnuWVKm3zbFDq8gFqokFWJHGGfeYPAqsxZXOjVSMzNQJHw+oVoIFttlFf3DUIpaRCSTiqxdDsNcy2Giw2EexyWz18Zt9lHg3MWBChBcTrga+g3zwpsKFRNqgeHbWTa5WPq+JzQ/UElzLwTTqd3/FoH6lTa4ydvONnlWwwAvewBE5cFIjIvdv/lKCOkIf0SWL2ev7IWyTfrTls4CFGTXy803esxjiYV4rhIeBWsyStNLPCWoKPzKquBDrhehVWWCWQnYP6HDb+87d7XWkDLxp3Q05YbBtcRDtzDSHa/N8YuYBPFygPTglVpWYL7oFKW/uDfaWCigTLpacPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4iFK+URcc0feD4+6rO0UQrMSN8p43wrOWcSmF5nquU=;
 b=iq03Hm5vochNRiVeth73WXj4TaueRn3bkvlqUk10D9vsaUUx7RGAux/68wMfwEtDo/z9uobmPAOKZ9PrTY+5hsU/IgevxEgSx+IhAay8GaiLbD5iTaTHIc95orPJ76OwLvID5C0e34GGDdnQ58T1msiU1WJGejMPfTmlh58fNqE=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 10:03:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 10:03:58 +0000
Subject: DROP THIS Re: [PATCH 00/14] nbd: move reconnect-thread to separate
 file
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210407104637.36033-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <13074b0f-3b83-8db5-2ef4-a5e0060d15cc@virtuozzo.com>
Date: Thu, 8 Apr 2021 13:03:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210407104637.36033-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: ZR0P278CA0032.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 ZR0P278CA0032.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.18 via Frontend Transport; Thu, 8 Apr 2021 10:03:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68b2d162-f0e8-4641-c268-08d8fa75a052
X-MS-TrafficTypeDiagnostic: AS8PR08MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6870C38C1EF222D36DE11603C1749@AS8PR08MB6870.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Adhu2+PC+GQO13IGfRYKwFA6KXoMbcjhJl8ZErtNmCClec0yvqIhlU2IOeaPoVlX1mr1MbeVDucExvL+haor0YZR9oVHC3+QcbI9mVidhv4wym0DVMNhwWo7Ozs1rXdljnE64OGyjzbQWZ3jurdNIAtxEV2owKoxUHfE1Q2q3eTuqAzDwZvIonYxVi7qfEsqXewcyA96/Gth66TH96DGjK7uyKkZhFCd0Ahp17VkA2/Vy8poIauIY2zXp54zxKiRa9TmCnGySrxeiWghStoW50xFvZQdyaB50lH/A3Lg3cG+jFJUyqqMq0OoxPqYddwWSRXXbOCELP8x9QaFyJr9cp7HvF+UaAezRjuREkcRAOAILAYqMFFO+lnZy0bVUxpW5BCDHJQlqgYLkL25NrwAkKhWGQ3vx5BNxX/chrXZwoFfVA+R9/r187pIjBMI0eVnFnyA7kjCw3Z9SW8gv1PcV1DbUq+QGT8f6GNU35UTwxp3b8hjTysjpgWtGv5elk+q2mLKlrtRk/yIO8Ho22rfsOLQx2atQO1tyMkWU5Ygog5bcDiwfuar9gLYGGsZYLdS85hY3RiMkmhru2QN5sAFk+14ltML0prPln8hoRqlEewtpqh4E1kuNdmEgY2Hpj94tNsu4vfeQLGbseADTuN4YvtVfqYuF5xlWaNIVpZO38i0X90BFtDGn18kJmXXKg4L7bqupX2BWU5gDkVNiMgIfjKMQiYmORdXYTDTNEZWgFJdgIol5HB8gdGuohRaCDs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39840400004)(396003)(366004)(136003)(52116002)(186003)(31696002)(38100700001)(478600001)(316002)(86362001)(16576012)(16526019)(26005)(2906002)(38350700001)(956004)(66946007)(2616005)(8676002)(8936002)(36756003)(5660300002)(66476007)(66556008)(6916009)(4326008)(107886003)(6486002)(31686004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T1drcjN4OVlZS1lEdXFleGtRWWxlZDJHTUFJOXg5dERPRjlSQ0ZYK3hZNGpL?=
 =?utf-8?B?RWVEQXdxQm1PVVJkZUF6dmdXYjhNMjFLby9nZG9mT1dXUmVBYStqc3pBbUZH?=
 =?utf-8?B?c2lqYkZCT01TOEpHaXFOL3Y2UmN1NkFDOG5rYkJBVk5NZ2lpdzF4aFJZVG5L?=
 =?utf-8?B?YzBHc3YvMWVLYk5SeWtSNXkvR1pDVklNQWFOVWtNOTVpMFkvNVNuTUJ1bTRn?=
 =?utf-8?B?ZGhnV29XYnJKcUFnSW4rSGwzNGFrbmZLRFZRd0lTeTZ3aHFQZ3N3cWVoaGRI?=
 =?utf-8?B?bG5qaTNFUktIdkQ3WnRZNnVxd1MwYUZCRGpuYWxxS0RkZDZLQ2dNb0VxM0sw?=
 =?utf-8?B?VnZ0QmgwMXpjZFVudmNOd0Rwc1laZGxwdXVLWHcya2JqRmdXVld6YUJUTEcw?=
 =?utf-8?B?TERkQTIxS0tHQnpHZlNkS0lKYmZRYThmSjc0ZXRQRlJmSHBMMjhJTW9xWWRs?=
 =?utf-8?B?NkhnWHdwRnhGZHFIVStIWitNV3EzVDFJNEtUVDJURytGUUowZkdsS3R1V0NM?=
 =?utf-8?B?aFpvS1UrVXM2ZHBqRTdEQ20yZXVrN3BOakRBelVBZzJUbzZtNkMwRjBEU1Nz?=
 =?utf-8?B?L3pMcEpGRG9VYTZnNmw1SUlZZGM2dHhZNVl0MTgydEVsVTFWcGYvT29kWnZq?=
 =?utf-8?B?akN0aUlmZEhldy85aVVyOEJVWWtYak9tak9CV0ZJbjEybjdiQUJpYXE4cUVX?=
 =?utf-8?B?Mks0REQxcnNrRnd0UVYranRPck9PenFVa2pCM0xVT3FJMDN5aDdtem52YTBR?=
 =?utf-8?B?Y3FXNkEyVjMxYlRrb3RrV0l2bjJFK1QvY2hBditnUExmU3pwb0J3MGRUYzZX?=
 =?utf-8?B?UGQ4dnJGWVZHWTMvNVp3NE92RzVTL0NaMTZwSUI0dktCdVNNTnpyYlNvNTMw?=
 =?utf-8?B?ZGlKakFCK2I4TWtZeFNqZGtWMnpQeTNrdEh6clVabXVnei9BTVBhWDhjS0c2?=
 =?utf-8?B?TTRiZzZBM0t3azRPUE81RFN3amt5M2xjRTdtWlB2S0FBNkhzWmNCT0dyUm1T?=
 =?utf-8?B?NG50L2xzeUQ0dTJzcXV4U2FBazFoQmxrQkJJbnRteUI3RnR2SGMvTjFDNkVR?=
 =?utf-8?B?ZnhPakdtdkcyYk4yWjJhK0ZDMm9iTGphUFdWUlpSUTRHM3pHcXdZaDJkTnh5?=
 =?utf-8?B?QUMybFk5eWFma1V3M1hhb1VJVnY2SUg3ZG1SWVBQSmdlSHFWU0VIQkVwMjg3?=
 =?utf-8?B?Y1RVMUM5M0ZzUWZwSFlyR1VhR0ZPM2p2bXd0OW5UbEpzMDRXK1RScmhEMitI?=
 =?utf-8?B?Q1BBZnZScTFxQTlqVjlmYnUrZFVTYlhjRTBFR29kREZSZ2pRV3ppKzVkYWsw?=
 =?utf-8?B?S21PS1NVSWhkOCs5d080MU9wQm5acFIzUUk1Zk5JTFpZb0VrVG1YYTJFbTFJ?=
 =?utf-8?B?aGVYbE52NnA4blIzQkIxMDNVNnRIaS9IVzN3bzBxT3V5dG9wNTNsSHlTTFpY?=
 =?utf-8?B?RjlhU0FHUi9LQkpocmNsTnIvOUw1QTFIa3hpR2FqQ0xnWlZOWHBhejhFanJr?=
 =?utf-8?B?TlVDd2xGbFJTZm91MWw5TEo1Sk9aRW5BWXRoL1JwT0Zva2lGOGVPNXNiakQ5?=
 =?utf-8?B?MncrNFdUK2dDRG4xT0lIaXd5bHdWVEh6ZnhzMXNjeFBjRXRTWHNBbTFuZVdk?=
 =?utf-8?B?aVNIdU4rRGowTnNrMGFjTkN6ZkVhOXV1dUtoRzJ4QWIzOTBRTVR2QWZVS3hn?=
 =?utf-8?B?ZlZwYmlGaVVBL0NhVjFvcjRieEs4RHFJRW5HOG90MHFRUms1Z3VoNVI4VE42?=
 =?utf-8?Q?VWkxLGb9xNRU2NKa0M45Q5+u2pCvw0NaluDNL6l?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b2d162-f0e8-4641-c268-08d8fa75a052
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 10:03:58.2692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYCDqYMUX/0nOrDp2mLWXEiqdFAS+jAAdq3htBsIONBYRMsXd8IHWRzHLWBHXncv7DxpDCvCRmBa2txpzX+ebmFOmm/qQJqcfhfnN30pc2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6870
Received-SPF: pass client-ip=2a01:111:f400:fe0d::71f;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

07.04.2021 13:46, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> There are problems with nbd driver:
> 
>   - nbd reconnect is cancelled on drain, which is bad as Roman describes
>     in his "[PATCH 0/7] block/nbd: decouple reconnect from drain"
>   - nbd driver is too complicated around drained sections and aio context
>     switch. It's nearly impossible to follow all the logic, including
>     abuse of bs->in_flight, which is temporary decreased in some places
>     (like nbd_read_eof()). Additional reconnect thread and two different
>     state machines (we have BDRVNBDState::state and
>     BDRVNBDState::connect_thread->state) doesn't make things simpler :)
> 
> So, I have a plan:
> 
> 1. Move nbd negotiation to connect_thread
> 
> 2. Do receive NBD replies in request coroutines, not in connection_co
>    
>     At this point we can drop connection_co, and when we don't have
>     endless running coroutine, NBD driver becomes a usual block driver,
>     and we can drop abuse of bs->in_flight, and probably drop most of
>     complicated logic around drained section and aio context switch in
>     nbd driver.
> 
> 3. Still, as Roman describes, with [2] we loose a possibility to
>     reconnect immediately when connection breaks (with current code we
>     have endless read in reconnect_co, but actually for this to work
>     keep-alive should be setup correctly). So, we'll need to reinvent it,
>     checking connection periodically by timeout, with help of getsockopt
>     or just sending a kind of PING request (zero-length READ or something
>     like this).
> 
> And this series a kind of preparation. The main point of it is moving
> connect-thread to a separate file.
> 


Finally I don't like it. I'm in progress of creating new series to substitute this one, so don't waste your time on review.


-- 
Best regards,
Vladimir

