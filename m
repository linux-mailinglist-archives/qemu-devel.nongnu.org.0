Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3198355918
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 18:23:24 +0200 (CEST)
Received: from localhost ([::1]:32806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lToU7-0001le-QD
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 12:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lToSQ-0000lt-N2; Tue, 06 Apr 2021 12:21:38 -0400
Received: from mail-db8eur05on2095.outbound.protection.outlook.com
 ([40.107.20.95]:27329 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lToSO-0000oS-VS; Tue, 06 Apr 2021 12:21:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gka/OafaTmZVOMDpvVqFDghHqUZ0CUo4m/Ogv6SFIwv+G/JeRVWybpoDRgtqpK0SNwGWORlBgHll8d1/EehYpLY8InwptfJa5ug341HQ5JZ+OQ6gv8nvTP6rrou9JmzTwUMm+IltAtWPQOsw7gK5zyhJYz17gfd2SEiw+4+jdfHF64V/xJAh2Vn/cTt558KHzdR0zmWXB0fOVev6EZ4IoYVTqvqVZIQ/nUK8Rm0M5oAuYnE9cAYkihsLxmt0brd2pJQ29DZwxrw8rAWy4d3BkW+Js89uKZjIUi/9Ef9cirip5+38yQRNpJFKuHAJ6EXyFu7Y2Z0zoe7MMmURAWQ3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qm6dDB2xfl3Hz1TlK2Yp3mDv2+cRdJKusukwJx9IZsM=;
 b=DVSxiGZjimyBf2HD0Fx0FSPpEF3Wcielf2RscxGMls2gG1jMYAxWk+Ia/E9da1avTbcGuCkUGtCP9AaEQpB/4VP47ykSJjnWtlEiZHJPX+MaPonWG2m9r30n4OX8kOoyU1UyEorc9kQCAisfdOtTmC3PpA/Iq9lS+91FQ9BN0yQmzcpb60PFbpQpwrxGrfQaWX1bEjRxWIb6PTJXGqCDZ6gXnG7lvPuIpStJwBcXP1Cr4DruKXq/k0yUmrghm+nlbqGyx5I7hl0c//kRfDBGoMUP+lR82h46vP6xLWrH61btkb50zy9oxuQDnA/SRlGmbVXbNkGE0GvyA1y0vWL0eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qm6dDB2xfl3Hz1TlK2Yp3mDv2+cRdJKusukwJx9IZsM=;
 b=XgDj9Q0bdXNEiHi5t6PXvYOwBkKU8hzr+DFC0MBs9xYxxCzYeWahDhS38dI/WJLad7I7nvpvOTPUSgLiR2J8+iVtc9CkVTqnBM2OIzrbsyyLx2x1WyAGhCuP+jhUNJ/qVYsE3WnPxi3bMTNoisWmBWo6jzCnnKOQsztB5ZUW7B8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4913.eurprd08.prod.outlook.com (2603:10a6:20b:ce::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 16:21:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 16:21:32 +0000
Subject: Re: [PATCH 1/7] block/nbd: avoid touching freed connect_thread
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, Eric Blake <eblake@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <20210315060611.2989049-2-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c2cf2c9b-a42f-fc20-dbcb-a3dc148b2f49@virtuozzo.com>
Date: Tue, 6 Apr 2021 19:21:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210315060611.2989049-2-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: ZR0P278CA0100.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 ZR0P278CA0100.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26 via Frontend Transport; Tue, 6 Apr 2021 16:21:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27f20a8a-e72a-4331-617d-08d8f9180a6e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4913:
X-Microsoft-Antispam-PRVS: <AM6PR08MB49133E810854163E79D3D708C1769@AM6PR08MB4913.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fSKG8FzQLhyHGEIDAaGaf4GFT14boDM4IVj9ciLPaSMYfAc3Rq954RRAtQ4Y+c7AApRBSZk/CHntqK3Iq4KkFAbhZs2QEQsFGqUm45/6mZIfsP9TJuePlj+6PXImMaVP9tkBzqHpo0ruBc+jvIm0R+Iz2m1s9Mo+XtiFR/pc6agLKBX0BhmIcAw/QukaNqrPSJ1adFUBQtro7OnYH/EgD9NBkhywHG67A4ftX0EMdMTN7VPC+YSnvwY0ltkx7rglj3QRKgsxkK6qXPaTvnLzy2b7P/t/2s2vjN3RDJ39z5wlPn1aU9E30xoBLsKM3ogiuOGcUQI8v9jZ/+rwJzYAYpJ/MhjUrB3mhWJPloBDiJ6hNcgWx1En7MaQWIfvfk0PUWlo8Jc/VJ7rNSiy3V+mNPo78JPFp6EV6E/pbv7z4xNyi2wniv1vtJtgGIIwqKyiA/6760ibtDKjKLadhyUfDA8vw7BNKsFU/EjijIhH7KoxZBLEMzi5egT85JhkAgHw+K40KfJRDpxLdSJ4eqxA9su5ru8GbTuJt5COW5q2UQoPzxfYA0CNChCQzO490LPXFEQVReOCR5J9gEkYSwWfp274LD9MtoJEhL9Q8xUmWm67Uk8uvIQYeSsYlQRoERBb6eXmkS8014FmPnB7bOShuR5v+706ybtKvLqnQkJ2OmaURq4GMmBWGcLONoVr4/S7/CZQyuxx2jFPDgMCKJdGrHGiXv/Ev40r20oiGuVxF+GNo/0PV5gdnKtSF+oaT/k6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(376002)(346002)(396003)(366004)(16576012)(6486002)(316002)(5660300002)(8676002)(4326008)(38100700001)(86362001)(16526019)(31696002)(83380400001)(66946007)(66556008)(36756003)(52116002)(186003)(478600001)(26005)(2616005)(31686004)(956004)(2906002)(8936002)(66476007)(54906003)(38350700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SHFDUC80VFErYklKUWdtbVRhbFB6STQwcE1GdGZZa0g4M1pvVnBkUitxa3d2?=
 =?utf-8?B?bHJuRkZPRzNMaGg2N1RPbEdRK3djekdaQU9BTjJNaVBXKzNHYU5NaU1acXVr?=
 =?utf-8?B?UWlnbk5ka0RsUm9mVjF1UmpYcExubGpjZnIwK3VWOFB6OE13TjdrNjA3bXJB?=
 =?utf-8?B?VzhyTDBYa3JORnJ5WGJ5L212NjkrUElqTUc0eXFvanV4QW5HOCsyaDNtZGti?=
 =?utf-8?B?ajhRUFM4Nlp3dTl5ZE4reCsrcUl2QWJ3cno5bmU3ZDhZaU8xUkZhMmx1dm1O?=
 =?utf-8?B?Mk82RUYwSzkyYStjOUE4OWFwQUpFMUR4M0E5UXNoZVFHRU81UU9wZkJIV0Jn?=
 =?utf-8?B?QjFDNVlsSTNVckN0THhGN0p5Y3RNb2t4eDFBczdzUUY3SEhyR3BUKy9NNWJ4?=
 =?utf-8?B?SHljTEJRZ0tGYy90Q040Kzh1bVczcm5XR21zaEV6WGk4U3dKc1ZpbStPOUpN?=
 =?utf-8?B?dHg3VFlkdWh5RFpnMGhkanptcmNYWThxRWk4Wkl0OU1JTjE2LzlXZGswQm1z?=
 =?utf-8?B?aEdoQXVITGdVOUxsWEdiRDZtdnhlYXFoRzM1bHBPcE0xYlFCUEREM3RMalNM?=
 =?utf-8?B?QzdnUFlNdU5XZjdTT3B4QkNnbXplQW9TU2QvbnBmcmtId2FmdVQ5SkRwRmJw?=
 =?utf-8?B?ZVFUMzcwWW1laXZRMjE2S2ROcXFnbUxjbmVmZ1lGazd1SDFsSTUraHU1NWFz?=
 =?utf-8?B?eE93MGJGMXVxNEhrMW1BUWdVRGpKUVd4Rm95b0NydVVheFprbzV2c1NFVzJB?=
 =?utf-8?B?WnZFYzJoakNEdHcvMElOR3RSZW4yU0VUbCtXTGMya2FPbkpKOUlSQlV5dXZT?=
 =?utf-8?B?LzMzQko2WnN6OVRDYk9mSTMxN2pSeWs3ZHczRW5Ib1AzR0lJZ0ZpeG5kaEhY?=
 =?utf-8?B?c1k0d1VFRE00b1FIV3lJZW5SaG10Q0tyRXhXQUVtY1dUUjNCSXpKQVVtaFZ1?=
 =?utf-8?B?cnBxWnA3UkZWTWVqemV0NEJSeUF2NDdXWXJuUWxUalRoS1JOenFkam42dnFE?=
 =?utf-8?B?cnJYZEU3TGorRk5yd0Ruci9VcE5LTUJzczd0K0plU2pXVGgycS8rVVgrNE9x?=
 =?utf-8?B?TFFKM1lCcmlqdk0xanZhUFB6azVwcXhhQStyVE1HRTZ3bDhNT1Fpc3pZVVRE?=
 =?utf-8?B?NmxuRU5BUjh6NnFuQjJRRnE0QndVWHhPRG1yanhmOCtkZFZscHErd2luK2Fa?=
 =?utf-8?B?ams2YkFUalBPZjFxZHMybUF1bnpHY3JTQjdTSXR0S3JSamZKMXIzbWxVc3p5?=
 =?utf-8?B?YmFRTnhxOHo5OG8xYXFKMGNlek9lYVdGcU5yOGd1L2M5OWF2MkZDV1FrUlp3?=
 =?utf-8?B?UlkvNjhZZXFZWHhDaVZaU0pBN3VnMU9RdlEvbjJZbGVCOWlnTlZ0SW1RZjYr?=
 =?utf-8?B?d0UvNi9oNnlEeStLRjY2cEpLNHZzcVFTWUtvUmhxWXdpdmdhbG9Db2dPOHgw?=
 =?utf-8?B?enF5RU5VcThpMlFjbjBVZkFFcGFUOEozK0JMMW1MbGJhTjlYdnVyNmt2TDV1?=
 =?utf-8?B?dTFNZGwvWWlCTjBMNDNYakNoMXRhem0xWXVwTWgxczJSbHpobmtLblAzR2Fs?=
 =?utf-8?B?bXgvOFlEcFg1V0lmMmUrQUZLanNKTmxzcFFCZUNGMmlKK1k0N2tRKzEyTWxo?=
 =?utf-8?B?TEZZSGQ5VlAwR0xyUVZ4amQ4aDZNK0h2K3hjSlNtWjBpb1pHK0FpNFNPaTVa?=
 =?utf-8?B?eFBuQm9pN3dPdTdjVVV2OFBKS003bGVSb2x0NWVZUGtXNW9taHc0cVpKV1Nn?=
 =?utf-8?Q?/J//6iEVpHBAbnjOn+ubqhkaB75l9SSVR48o/SP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f20a8a-e72a-4331-617d-08d8f9180a6e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 16:21:32.4334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APreoaoLgef+NVkFo9PDd8ueHThhciO3lfKjbXATbIRGzqgpAlem1Ekq0FnXEAXfJVBf6MacKGpEA4txnznr3UMo4q/CVhthFPdUyJG64iA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4913
Received-SPF: pass client-ip=40.107.20.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
> When the NBD connection is being torn down, the connection thread gets
> canceled and "detached", meaning it is about to get freed.
> 
> If this happens while the connection coroutine yielded waiting for the
> connection thread to complete, when it resumes it may access the
> invalidated connection thread data.
> 
> To prevent this, revalidate the ->connect_thread pointer in
> nbd_co_establish_connection_cancel before using after the the yield.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
>   block/nbd.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index c26dc5a54f..447d176b76 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -486,6 +486,15 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>       s->wait_connect = true;
>       qemu_coroutine_yield();
>   
> +    /*
> +     * If nbd_co_establish_connection_cancel had a chance to run it may have
> +     * invalidated ->connect_thread.
> +     */
> +    thr = s->connect_thread;
> +    if (!thr) {
> +        return -ECONNABORTED;

nbd_co_establish_connection() tends to return -1 or 0, not -errno, so -1 is better here. Still it doesn't really matter.

> +    }
> +
>       qemu_mutex_lock(&thr->mutex);
>   
>       switch (thr->state) {
> 


-- 
Best regards,
Vladimir

