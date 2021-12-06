Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA5D46A6CE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 21:23:20 +0100 (CET)
Received: from localhost ([::1]:59544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muKW7-0008Gf-CX
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 15:23:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1muKTc-0005z6-On; Mon, 06 Dec 2021 15:20:46 -0500
Received: from mail-eopbgr80097.outbound.protection.outlook.com
 ([40.107.8.97]:56452 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1muKTX-0006Mp-TS; Mon, 06 Dec 2021 15:20:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXvttJHb3mm5rUEYznqGS14ZT7ZI2sqtKCFr4SZ4qQA41RIq7yPZxW+O/rtwGuAD4dkLY/Lnu2bYSYkTGDrURb96I3roLzRYV4/cn16ClZEqhvco7GasF7L7fUvBJK7FjUzeBCtXP6qd9o0kbipWhwWBFImZMvfIMU8GWZhwqwbY9tmsepfcDoIxxSGsbhooKioHvPrJoLs/XG5GQ2XPEDajhYq8qHOP0c5am9e3Z4KFYCoDlHjz9zA/f350RFAzyG2zQaRYVXSpT3eWwL4WVA0M9kWzOY1wQ9wlYKcpJ/fYkb0yEDthAFEr1dFoveU90tcQcDwTBuJ8zoQw2Z+7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xskJVnOg+Bp+cHD+cMsVWq+N6e9S2rFp+O6+MjwAWgM=;
 b=MRHP+4U8ralGA2MLFIhI7zth6ebwCSNQCRv+KBIiDGGtBqiykVwKHHDDJEki1ooCKlccFgARubun3nog8ER+ZlkfebatlLQcql1fdMdD8IL9woeeUoCza/Vy+Bj8PV5FlR3mUrwXG9vsGmXx2STqQywnRuZKXInXStoaP7FLuM2bMDq5jHNW1U8CfySvIgUrbwJkOzQrNfxGHTWWS9SVpHYQoFmV438P55NIDFKnbFNKwvYRUzdXCmgtaqD0ns6C+rBgJsSkOPwJYfiyfvq9gYOrrn+ZShPwqkHbgMoEdj2JhWQtCei5Nl2NXvrg+ECb33veXsu+AeSyviz79w5E3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xskJVnOg+Bp+cHD+cMsVWq+N6e9S2rFp+O6+MjwAWgM=;
 b=jbrr/aBr3t2BMg35XArjABdrDUQtUsAn9VsHP00ewOYnPGgjsa9Jfg1nPn6gq6YiX+H0VIIMokJTGY9cdkfI3sUbIV/JmTAKBLS/idMam5UVAkHqiQ1oTwva+g850cpcG+aMAdLZq4VDBgBV1IXxGXuyXhqEl7A7EwdHPbzlERI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4516.eurprd08.prod.outlook.com (2603:10a6:208:13b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Mon, 6 Dec
 2021 20:20:35 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Mon, 6 Dec 2021
 20:20:35 +0000
Message-ID: <4e2a9e2c-0189-1e0f-7d99-94425796b6b8@virtuozzo.com>
Date: Mon, 6 Dec 2021 23:20:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/3] iotests: check: multiprocessing support
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 den@openvz.org
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
 <20211203122223.2780098-4-vsementsov@virtuozzo.com>
 <CAFn=p-YFHGbfbwXjKYGK0ypiec+-EkdF+raQKkvPqf536gbJ2w@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <CAFn=p-YFHGbfbwXjKYGK0ypiec+-EkdF+raQKkvPqf536gbJ2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0158.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::16) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AS9PR06CA0158.eurprd06.prod.outlook.com (2603:10a6:20b:45c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 20:20:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4aa9e25-ae5d-44d2-dec0-08d9b8f5dbfc
X-MS-TrafficTypeDiagnostic: AM0PR08MB4516:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4516D1E07142E411C98FF65DC16D9@AM0PR08MB4516.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UCGr/YRADDyhULwXeVHFz74TVbXCTyJ+0CAo4mryj1+QeZ0Fff1alU7Gmi2un3E/8pOqTERRuqUXLLBbEeHzn0tUYGlmikUdMmVIlmjd/J6Z51/wNDemM9ARxy4/N0/WasDPmUR6UmLiioCtDslw7l0sVp7iS7pxuLfV6EsUVisRQ/EM3o1Kn5JLjmTAp8hbWbqKdfifI3bql3e23dSInWXx7rW2WKZUrRLOAp39qyU19oHPxL9ptZh5kPgEFdfgrW2UUudm2RBlJcmr/e0wmmKtfw1bMs/52l1GKD6nguV7jOEbG61dI0TDO3rPRkvkFnt7yz1pQrYcs6c4WrL4R1GWetE3IHZkoMO3fkd7GRdufcs6ctAN+zcD6SYuspv4XQ0N3MAccA8CupOH3JLn95FwYUCZKoHs1rMOfTCg8kyEn6CR0RJXMIIa2FrF8GHFUDPwrWbXFFTSVmXFLQxMKcChafC9sXmRXcN3OoH3jQYuf2ejKol+wLbx7+rYZbAFhv//74fPb21bx4g5TONPt7A6YTRkk3asrwXLpcPCvEn7MMsj6SbjZPTbrQOeMBsipNKwT47MPnvNtTCLBxDpQuK1LOOtmIRffc9r1BEaF4dqiIrrVcsFzV6Y9dB2pnzpaglS2v9THo9gjKTLtSjIvwMgztU7mklTretmwXZsOwrJKsNs/V/0teUF64et8oV6UOS/qxj/tYu8Z2oxEJ34I8TVaW2SCefpxMyIDEFEa7wEgJ7CXxfGBlmaVUKoTwAbt9XHNfl5wLD5LXs6RQRnKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(86362001)(30864003)(66946007)(66556008)(31696002)(66476007)(8676002)(508600001)(2906002)(186003)(83380400001)(5660300002)(6486002)(107886003)(52116002)(2616005)(31686004)(36756003)(26005)(38100700002)(956004)(54906003)(38350700002)(16576012)(316002)(6916009)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEJ0R2M1SDBYc0JFSVJTOE9kTXBjV2hERUcyUFBjckNSUyttbkkwNWxDM1RP?=
 =?utf-8?B?RFFwWkRBRWNPeFVtc0t1Rjdtc2tOeHppTjFVZEd4VDhDYnJiU1dnTEVORDho?=
 =?utf-8?B?Q1hRUnZIUTgxZ3AvR1h5Zkx2NFdCQmZhOERjT0NDMjEyLzY5RGE4VUM2WkRT?=
 =?utf-8?B?Y0FabFdySjdZeWtlZFNlMUFZRFpVSm9ra3R6S29rYjBtUmFGbDR3T1FpWFhw?=
 =?utf-8?B?ZjNYNW5NOUFzU0Y4UUxhRkxXRDRaZTc4ekdxZVhYd1dLVG00bTV4RjRFSjRB?=
 =?utf-8?B?K1orSlgzQU5TK3lncUxubFVWVWVxSGVWSngwYXZLNmphL0R2WldwajhyQUY4?=
 =?utf-8?B?bnhxMURjOGFoall2eFlhV25WZExxKzcrWVJjVWJNRkJxRTdCY3hhYXc3QkZK?=
 =?utf-8?B?VllKNWtmazVCa0VRczZqRjdyem13ZWZwRTlqRng1S0xKMFkzY2ZSb1lsTVo3?=
 =?utf-8?B?bC9zeUpuYytydkEvTEJKUFFmL1FhWFdTSitBSzVCSFlUMFNTMHpaVDgxVzFh?=
 =?utf-8?B?emlJcVJtZFFzUHRhRDUySzBWaU9WTXpZMVBOZXVESjRZcHRyV05pb0IveVAr?=
 =?utf-8?B?SEJGRm1PZGFDTEExQXdSV25DMERGZnJjN1NxNXZ1U2QrM1hleGhFUEtzTmxZ?=
 =?utf-8?B?MHROdzRYOWxhSURRaXpKS0xuanhENjJBck0xTEhNVlBqMjdXb2VVdG5uRU1Z?=
 =?utf-8?B?SkZHbVVkbXRVRURIY01aTHhPbTl4RUFTNUY5Qis5TDJ2aVhGa2EyUXBWaWtp?=
 =?utf-8?B?dEJhRWlxZ3VZOXFhV25oNThuR1VONXRma0VFbzV3QVREMmpOTEIrRE9TOFA4?=
 =?utf-8?B?Y1dSYlFuc2x2ZmpmOGh0bUIyMFRPQWFxclJHZE1xSzB5VTI1Uy9WYkVxQWt2?=
 =?utf-8?B?V1RzN0E3a2VhNjNsbnQzYU5lS252c2lWMDRhTDR3QjRYbVdrZkhZY2lQbzhS?=
 =?utf-8?B?blM4Q2UycnpMWVVpU2V1QmgySy9GY0lKcW0ySVBIU1VhN2UwdUlTTzBOM3dP?=
 =?utf-8?B?VHU5TnVKTHNwK29vcVJkTkNmclJxQlBFTnpPNzQ0ZmJGcWJBNm9MZVYyeGVj?=
 =?utf-8?B?b1FqZUJ3UmYwQWoyaG51TUhaSlY1VHVieGIzRDNHcXVGY1RJWEtlZnRlWEky?=
 =?utf-8?B?aWtlWFlhZHZ6YWFYdTNRV0hhVTFicXF4aG8vOERra1NhZWtDTU9ReW14VGEr?=
 =?utf-8?B?RHc0Qjc5emJsNHBaM1ZMSXBvSmVlMEZsYTYxT3JvSTFOSU8zcXRBa0thZW4v?=
 =?utf-8?B?K0x6bTVmVEJndW4wdjg5dmJYVUM0QTBLelIrd3lyaVdlQkRBSVU0WUgwTSsw?=
 =?utf-8?B?TW1YSnYwUlRGTy9uT0pTV3lHcFYremJxbXBqQmtCK2hxVmJSR3ZoYWkwSWJx?=
 =?utf-8?B?S0FUcHlsTzFKMHp5anc1WUVmVlQwdExRcEQ5RjRmMkNyL281Wk10cmd2WktE?=
 =?utf-8?B?TWR4c2swSmVpblpYQWVEa1R6eGplMVB1bUJ1UkVNZHJmT1JUMmRmNzVwSXpU?=
 =?utf-8?B?QnhyU1JzVHJORU83VHp0TGNtNlN0Slh0akl0RDA0TkVjZ2xERHNFREN0bUV0?=
 =?utf-8?B?ZkZZUG1VakRVN0JmcVgrWmRpN0FaNGY5SWJMb1BVVFpmcUdvQnU0Snc2YmVS?=
 =?utf-8?B?Z3Zad1FNWElWNlBCNXlpbTZSalFZazQxQXhuOW1yT1NGY2lIZXIrZ1R4b0V2?=
 =?utf-8?B?SUhUUi9aTWp3Z2RWUkdlYlY3eHdFdk9ONU9qTlgxa2N6cW91MVNDUGJESTJX?=
 =?utf-8?B?aVQzejk0dWR0R2xzK08yeGhqaVVZcDMyY0xaYkhPc0N5bjFuSGh0TjNpVHZP?=
 =?utf-8?B?TUpBcWtySWNhR2MzdzNNMTR1OGxqTzFPbnN3ZU1PTU5CMVU4YVc4eS82Q00x?=
 =?utf-8?B?aUFSMHUzSC9IV3FpYTdxUjZza0RPRFE4dU02ZDZFejJWQ1BGK0lPSVVZcUNS?=
 =?utf-8?B?bzl1S1pqZWtaVlI4ZjNsUUp1dXhBZWl0SXVKUk5nUEhWeTR2dC9HUEVSMXQ1?=
 =?utf-8?B?cHRudXFLWEdqWVBNZlp6V2pGUVFwaTRXSEVQS0ZXQUF2UzFtTFJLSnpmbVRu?=
 =?utf-8?B?alRHZFVwOHFwMTdmaUIrdFRrZFBNTnRsTDl3NFJ0dElwcFc4QVF1empVaXBF?=
 =?utf-8?B?WjJyeGMyb0hZRjNUS1lpU0REY3hEK29zTGUrekJHYWFDNnF2dWlZNVp4dTBi?=
 =?utf-8?B?SGVNTHpMbU83MHMwcjFaZTZQWTQyV2xaR2RVVEJPWkNPUGl2eHRXTGlVU3JF?=
 =?utf-8?Q?w3poXVZmrU5IS2NUg4GDE/HPPnl05wzo//ghVJ0Puw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4aa9e25-ae5d-44d2-dec0-08d9b8f5dbfc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 20:20:35.1167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1YaIcLU7bppjws58AUx/BKIskAkvhOatU/anTyIU0vPjm0eKFJXrFr9AptLGZdXdgRPcAiubN1WC/21ai1LoQxQkhGJifVb5OkVLUNZmNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4516
Received-SPF: pass client-ip=40.107.8.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.076, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

06.12.2021 21:35, John Snow wrote:
> 
> 
> On Fri, Dec 3, 2021 at 7:22 AM Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> wrote:
> 
>     Add -j <JOBS> parameter, to run tests in several jobs simultaneously.
>     For realization - simply utilize multiprocessing.Pool class.
> 
>     Notes:
> 
>     1. Of course, tests can't run simultaneously in same TEST_DIR. So,
>         use subdirectories TEST_DIR/testname/ and SOCK_DIR/testname/
>         instead of simply TEST_DIR and SOCK_DIR
> 
> 
> SOCK_DIR was introduced because TEST_DIR was getting too long, and the length of the filepath was causing problems on some platforms. I hope that we aren't pushing our luck by making the directory longer here. Using the test name is nice because a human operator can quickly correlate directories to the tests that populated them, but if test names get kind of long, I wonder if we'll cause problems again.
> 
> Just a stray thought.
> 
>     2. multiprocessing.Pool.starmap function doesn't support passing
>         context managers, so we can't simply pass "self". Happily, we need
>         self only for read-only access, and it just works if it is defined
>         in global space. So, add a temporary link TestRunner.shared_self
>         during run_tests().
> 
> 
> I'm a little confused on this point, see below
> 
>     Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>>
>     ---
>       tests/qemu-iotests/check         |  4 +-
>       tests/qemu-iotests/testrunner.py | 69 ++++++++++++++++++++++++++++----
>       2 files changed, 64 insertions(+), 9 deletions(-)
> 
>     diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
>     index 43a4b694cc..0c27721a41 100755
>     --- a/tests/qemu-iotests/check
>     +++ b/tests/qemu-iotests/check
>     @@ -34,6 +34,8 @@ def make_argparser() -> argparse.ArgumentParser:
>                          help='show me, do not run tests')
>           p.add_argument('-makecheck', action='store_true',
>                          help='pretty print output for make check')
>     +    p.add_argument('-j', dest='jobs', type=int, default=1,
>     +                   help='run tests in multiple parallel jobs')
> 
>           p.add_argument('-d', dest='debug', action='store_true', help='debug')
>           p.add_argument('-p', dest='print', action='store_true',
>     @@ -165,6 +167,6 @@ if __name__ == '__main__':
>               with TestRunner(env, makecheck=args.makecheck,
>                               color=args.color) as tr:
>                   paths = [os.path.join(env.source_iotests, t) for t in tests]
>     -            ok = tr.run_tests(paths)
>     +            ok = tr.run_tests(paths, args.jobs <http://args.jobs>)
>                   if not ok:
>                       sys.exit(1)
> 
> 
> (OK)
> 
>     diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
>     index a9f2feb58c..0feaa396d0 100644
>     --- a/tests/qemu-iotests/testrunner.py
>     +++ b/tests/qemu-iotests/testrunner.py
>     @@ -26,6 +26,7 @@
>       import json
>       import termios
>       import sys
>     +from multiprocessing import Pool
>       from contextlib import contextmanager
>       from typing import List, Optional, Iterator, Any, Sequence, Dict, \
>               ContextManager
>     @@ -126,6 +127,31 @@ def __init__(self, status: str, description: str = '',
> 
> 
>       class TestRunner(ContextManager['TestRunner']):
>     +    shared_self = None
> 
>     +
>     +    @staticmethod
>     +    def proc_run_test(test: str, test_field_width: int) -> TestResult:
>     +        # We are in a subprocess, we can't change the runner object!
> 
> 
> *can't*, or shouldn't? I thought changing anything would just result in the child process diverging, but nothing harmful overall. Am I mistaken?

Yes you are right. "Shouldn't" is OK

> 
>     +        runner = TestRunner.shared_self
>     +        assert runner is not None
>     +        return runner.run_test(test, test_field_width, mp=True)
>     +
>     +    def run_tests_pool(self, tests: List[str],
>     +                       test_field_width: int, jobs: int) -> List[TestResult]:
>     +
>     +        # passing self directly to Pool.starmap() just doesn't work, because
>     +        # it's a context manager.
> 
> 
> Why, what happens? (Or what doesn't happen?)
> 
> (I believe you that it doesn't work, but it's not immediately obvious to me why.)

Simple check:

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 0feaa396d0..49c1780697 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -130,7 +130,7 @@ class TestRunner(ContextManager['TestRunner']):
      shared_self = None
  
      @staticmethod
-    def proc_run_test(test: str, test_field_width: int) -> TestResult:
+    def proc_run_test(x, test: str, test_field_width: int) -> TestResult:
          # We are in a subprocess, we can't change the runner object!
          runner = TestRunner.shared_self
          assert runner is not None
@@ -146,7 +146,7 @@ def run_tests_pool(self, tests: List[str],
  
          with Pool(jobs) as p:
              results = p.starmap(self.proc_run_test,
-                                zip(tests, [test_field_width] * len(tests)))
+                                [(self, t, test_field_width) for t in tests])
  
          TestRunner.shared_self = None
  



Something like this happens:

   File "/work/src/qemu/up/up-iotests-multiprocessing/build/tests/qemu-iotests/./check", line 170, in <module>
     ok = tr.run_tests(paths, args.jobs)
   File "/work/src/qemu/up/up-iotests-multiprocessing/tests/qemu-iotests/testrunner.py", line 383, in run_tests
     results = self.run_tests_pool(tests, test_field_width, jobs)
   File "/work/src/qemu/up/up-iotests-multiprocessing/tests/qemu-iotests/testrunner.py", line 149, in run_tests_pool
     results = p.starmap(self.proc_run_test,
   File "/usr/lib64/python3.9/multiprocessing/pool.py", line 372, in starmap
     return self._map_async(func, iterable, starmapstar, chunksize).get()
   File "/usr/lib64/python3.9/multiprocessing/pool.py", line 771, in get
     raise self._value
   File "/usr/lib64/python3.9/multiprocessing/pool.py", line 537, in _handle_tasks
     put(task)
   File "/usr/lib64/python3.9/multiprocessing/connection.py", line 211, in send
     self._send_bytes(_ForkingPickler.dumps(obj))
   File "/usr/lib64/python3.9/multiprocessing/reduction.py", line 51, in dumps
     cls(buf, protocol).dump(obj)
TypeError: cannot pickle 'generator' object


Hmm, I remember that was cannot pickle context manager.. Probably I remember wrong :) Honestly I didn't dig into it except for detecting that not passing "self" fixes the problem.

> 
>     +        assert TestRunner.shared_self is None
>     +        TestRunner.shared_self = self
>     +
>     +        with Pool(jobs) as p:
>     +            results = p.starmap(self.proc_run_test,
>     +                                zip(tests, [test_field_width] * len(tests)))
>     +
>     +        TestRunner.shared_self = None
>     +
>     +        return results
>     +
>           def __init__(self, env: TestEnv, makecheck: bool = False,
>                        color: str = 'auto') -> None:
>               self.env = env
>     @@ -219,11 +245,16 @@ def find_reference(self, test: str) -> str:
> 
>               return f'{test}.out'
> 
>     -    def do_run_test(self, test: str) -> TestResult:
>     +    def do_run_test(self, test: str, mp: bool) -> TestResult:
>               """
>               Run one test
> 
>               :param test: test file path
>     +        :param mp: if true, we are in a multiprocessing environment, use
>     +                   personal subdirectories for test run
>     +
>     +        Note: this method may be called from subprocess, so it does not
>     +        change ``self`` object in any way!
>               """
> 
> 
> Maybe worth mentioning that it *does* change environment variables, but because this is "mp", it won't affect the parent execution environment.


Hmm. actually, it does not change it. And yes the reason is that we'll not change the original object anyway, so any logic that change the runner object in hope that it will make some effect would be wrong.


> 
> 
>               f_test = Path(test)
>     @@ -249,6 +280,12 @@ def do_run_test(self, test: str) -> TestResult:
> 
>               args = [str(f_test.resolve())]
>               env = self.env.prepare_subprocess(args)
>     +        if mp:
>     +            # Split test directories, so that tests running in parallel don't
>     +            # break each other.
>     +            for d in ['TEST_DIR', 'SOCK_DIR']:
>     +                env[d] = os.path.join(env[d], f_test.name <http://f_test.name>)
>     +                Path(env[d]).mkdir(parents=True, exist_ok=True)
> 
>               t0 = time.time()
>               with f_bad.open('w', encoding="utf-8") as f:
>     @@ -291,23 +328,32 @@ def do_run_test(self, test: str) -> TestResult:
>                                     casenotrun=casenotrun)
> 
>           def run_test(self, test: str,
>     -                 test_field_width: Optional[int] = None) -> TestResult:
>     +                 test_field_width: Optional[int] = None,
>     +                 mp: bool = False) -> TestResult:
>               """
>               Run one test and print short status
> 
>               :param test: test file path
>               :param test_field_width: width for first field of status format
>     +        :param mp: if true, we are in a multiprocessing environment, don't try
>     +                   to rewrite things in stdout
>     +
>     +        Note: this method may be called from subprocess, so it does not
>     +        change ``self`` object in any way!
>               """
> 
>               last_el = self.last_elapsed.get(test)
>               start = datetime.datetime.now().strftime('%H:%M:%S')
> 
>               if not self.makecheck:
>     -            self.test_print_one_line(test=test, starttime=start,
>     -                                     lasttime=last_el, end='\r',
>     +            self.test_print_one_line(test=test,
>     +                                     status = 'started' if mp else '...',
>     +                                     starttime=start,
>     +                                     lasttime=last_el,
>     +                                     end = '\n' if mp else '\r',
>                                            test_field_width=test_field_width)
> 
>     -        res = self.do_run_test(test)
>     +        res = self.do_run_test(test, mp)
> 
>               end = datetime.datetime.now().strftime('%H:%M:%S')
>               self.test_print_one_line(test=test, status=res.status,
> 
>     @@ -321,7 +367,7 @@ def run_test(self, test: str,
> 
>               return res
> 
>     -    def run_tests(self, tests: List[str]) -> bool:
>     +    def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
>               n_run = 0
>               failed = []
>               notrun = []
>     @@ -332,9 +378,16 @@ def run_tests(self, tests: List[str]) -> bool:
> 
>               test_field_width = max(len(os.path.basename(t)) for t in tests) + 2
> 
>     -        for t in tests:
>     +        if jobs > 1:
>     +            results = self.run_tests_pool(tests, test_field_width, jobs)
>     +
>     +        for i, t in enumerate(tests):
>                   name = os.path.basename(t)
>     -            res = self.run_test(t, test_field_width=test_field_width)
>     +
>     +            if jobs > 1:
>     +                res = results[i]
>     +            else:
>     +                res = self.run_test(t, test_field_width)
> 
>                   assert res.status in ('pass', 'fail', 'not run')
> 
> 
> Looks good and surprisingly minimal, I just have a curiosity about the nature of the workaround here.
> 
> Either way, I believe this will probably work as written, so I can give it an ACK at a minimum while I wait for answers.
> 
> Acked-by: John Snow <jsnow@redhat.com <mailto:jsnow@redhat.com>>
> 

Thanks!

Yes, the workaround is a ugly.. But it's small, so I think we could live with.

I don't think that refactoring TestRunner to move all needed things to some simple structure supported by Pool is good idea: actually, we don't want to copy these data for each subprocess, we are OK with readonly access to shared object. And we do call methods on self, and on self.env, so refactoring would not be simple.

But about shared object, I didn't find any way to pass a link to shared object to Pool.map()..   Something like Pool.map( , ... , shared_state=self) would be good. But were is such an option? Note that this is my first experience with multiprocessing.

The only thing I find is passing through global variable. I started with real global variably, but then thought that hiding it inside the class would be a bit better.

-- 
Best regards,
Vladimir

