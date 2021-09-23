Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CED4161F3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:22:05 +0200 (CEST)
Received: from localhost ([::1]:49016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQY0-0003yW-N6
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTQW5-0001UM-Hh; Thu, 23 Sep 2021 11:20:06 -0400
Received: from mail-eopbgr140119.outbound.protection.outlook.com
 ([40.107.14.119]:25764 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTQW3-0001cb-Fa; Thu, 23 Sep 2021 11:20:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wt17Epn3xxvjhAMN7oA0ErQVeCwbMu52de4Yv1Yv2E2t1QD0BUEFv5Z3/Tzo11XRYIuv5cxd4tt2X4UN3Z2ZL72Ka6v7Rr0nFyC19OGfAVTIzzVbI6l2e5wdvmFakkfSdimenT01ixjSwGu1jGQQ8IQ+ZurbRfPASl3F3EfNSTDV5jcaLvF/p1klPcpRr3b0DnqRisgYMLQH7gJwSM52xpTReC0fQTpqlnKBOMoI+myNxPkR86Lfk/4NBqka77CXhYnoMcqkFX3nWf8RbWVWPBgTDf0jcLPamE/3XJmFBWSgYhVTgMrXvHhsWIAtDhhKy1iUhCgLw8bv4sQyb6/bZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=c3T4aE4PpZ1etRmBqPVe7FJSe9yWu08ntYjRm8hOjFE=;
 b=TIGFXzvcpL7R8UkvrhAh+DMFvQ3kc5CYmiQppN5arR6UKI9TiX2YKJPhllVkiYm3ynbb4jJ1aRG8Rk2dIexBoZ8QLzLPvz98FD3Zn/Wa0btVZh0sUezD2Gb5vMndS6SPrEVRUOaTA1TEzYTJDCWXtbyvis1YbhKj/660kbm5z0uAC60vMOMZ4lm8z/FNIV3wJupY9cz9Yv9e0XkbULkNp2foykni4SZYPC87MU2m8yRUIKpyuuYYJhpcm1qxyaV8fcU2Qs8SYWMucu39suGGrk6+gIH8ilkGoJq3AaaL7K//DUWLvQl4VZd0oYex6o2cydHr+i7IYIHSVe3+evB3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3T4aE4PpZ1etRmBqPVe7FJSe9yWu08ntYjRm8hOjFE=;
 b=vDkTmOsSXU5XRowzL/TjeTvwirw8DrEfg98Fpu9GvTvYWaMt83Q7UJHCQm1/Iw70SMLB5A6da6DbmswflbMxCdOfjIKS+WXgr2haG/ril92zr6qXMN1opCjSzOE9IGc3joiFz2TVJ2/z0waPSUA0cd8SnShSz0iTeYwfY6s1OGY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 15:19:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 15:19:57 +0000
Subject: Re: [PATCH 1/6] iotests: add 'qemu' package location to PYTHONPATH in
 testenv
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20210923001625.3996451-1-jsnow@redhat.com>
 <20210923001625.3996451-2-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20e02fed-5c74-022a-78bb-2122cf12374b@virtuozzo.com>
Date: Thu, 23 Sep 2021 18:19:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210923001625.3996451-2-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P192CA0015.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR3P192CA0015.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 15:19:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 505b67ad-1d1c-4e8f-0d18-08d97ea599fd
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1650:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB165091022E1065E927277DD3C1A39@AM5PR0801MB1650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GxglEiu5qQnuv5eeXj+vionXQpwUmI8xCsCWUmzGk6fQqVnF3ax0hkpdygCr0HmSUd/edYtCR01vPHR0ecjsWfNKOGItzQ3twGFLILP8yu+y/wZzaOTaslBfv8eipP+7vJyrKXdOY4ZGel5BPPPC5MOsbemd5r2d7BYT069wcWbM3IFCrkHlbI9QynQSpQcuzsracO41abHTZEeGHdaoyX4MOfOpfHCDY4G9LuEkbJuGKsWOk7Yayr88FJSYvfFVvKe0S3hcTHaxTb9rWF9kBcb9xTJwo4bbDTQRCk7K7ytizCpxGJwsjjhYE/nQwYlIsNWJ8mL/sCJr427izR9hYPSFpxZs8wyBwadxeMY0oVcbQQjz18r2TIWvU74VuJ93twkesKvJBY0GrSaRi3xPAV15Dk8H1/wNyAKAe0p/k/CzdNzTVjdVonL4M5tqLZVN8NVdB3elyZkc4JNPgRj7zgg8Oh4IE1YUg8gvnUW5vmXtDoc+8VZsX00R03RqohThxAEyoHGCIkSEh59e/KjNNCRSACHiBtgylbGhbS+TOIAoq0AEfSRFXm0Do9qHM7jBxV745mE5m3sLey4qRpvK5bnM2hho1klLDx7/2x9VXU82WVP6UZ6zRDqTYdfgVTuNYfBJnVqc56q0YIfZq9F8nTyoM35KwtDqUe/jyV01lQicn9D4cwnBgY5RxuZ9ok381bBy4urvRt0RFD5Xrpr403qChNEvYNCdivJ2QLjMHOxmgHfoz2RzHTL82byCXsQze9WqdtQjNhXWvwsJ50VSds7ULrFWkUmv903gN4ExKVw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(86362001)(52116002)(31696002)(66556008)(38350700002)(8936002)(508600001)(54906003)(956004)(31686004)(16576012)(36756003)(6486002)(26005)(186003)(66476007)(38100700002)(2906002)(83380400001)(4326008)(8676002)(5660300002)(2616005)(66946007)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXVsMEtQWm41WjhHT2JTb3IyNlc2a3Z2b3FHR0JCOG9oenVqbFRsRGJ3WDk1?=
 =?utf-8?B?ZXRFVWdUR1creng5NmdFSW8wZzF2c1pQZEZvakJBUEVRWmhTOFc2Zi9GdWZT?=
 =?utf-8?B?Sk10WGVFaU5pamlIVXMrcjVjR0dHeXZFdk40YWpja0YybytMTk5CNXdXZldq?=
 =?utf-8?B?ZjFsL0YrT1RWaTR6QWl5ZUREM2EveUNIeUdsUnFxRjJxamsvOW1vOVdTMEov?=
 =?utf-8?B?bERQZUNWMGtJSmVHai92d0NGOXRVaThHTk04bm1JNG9EM3hDaXJCR1R2RDVy?=
 =?utf-8?B?cjVDMTZxb2tsd2dTbGxKbHZ6VHYrMVN4UEV0amJKU3JZaXozMWJ5dHhTR2pi?=
 =?utf-8?B?ODUzYkpDUnJvOWR3SURKNDFvUTlva2FlSHRoMzNSeUJpc0NwVXc4OXFMSXEr?=
 =?utf-8?B?dFZVY2M4STczRllxQWRPLzliMHFDWkZiY1hMZmZIVTV3Y0w2WTlIRFhURzZO?=
 =?utf-8?B?SXpOOTVpQzcyQlNUNVpXVXhlamc2dERyejNVc0tIVjBCOTFWT2lTRnAzaWtT?=
 =?utf-8?B?eEhxeS9VQVF2aVREcU1GOGtvTHV4VWREYUhZZnBvN2VLR3o3VDIyWkpraVVp?=
 =?utf-8?B?dUNLakZ6b2xzMS9CNmcxYWVVMjBqcjRVRGNhSVA1NGFNeDVSRTNIbDRHOERv?=
 =?utf-8?B?aVhEbUJuY2JKYU12MDVrTEl1WjByWjBmQ1lIOEpWSFNja0U2eDBpZ1M1UnhU?=
 =?utf-8?B?SnN4OERJbVdNWVZsUkxCTkFFY0xKVm1DemIrSXVkeGgyYUNSbkF0citJSlBG?=
 =?utf-8?B?WU5QYVp0cC80N0ZDUm9yOWJ1L0VwOU9HRFhJTUZGbHk2QVJVYnk0TjNKeSs3?=
 =?utf-8?B?K1E5bW1HUFBrS09ycXpURkNCVEZsOGU1VXRVOTRZRDZydWJON01jTHlXRmxZ?=
 =?utf-8?B?VlVicTBBK0Y4UkZRUTJpdHVPTWVjY3lGQlFhcEEwWEVCYzhtN0dBR2o1eUQ4?=
 =?utf-8?B?MW14Y3dpZWU3d3lWQW42MnNZdWhIOXp5R3FvV0R2OVBMRmpsaGRkR1VJYURY?=
 =?utf-8?B?T25vSVZrRUVvOGtFQ3pJWjB5MWthdlowekNIemROaHQ1bU8zcFR4Rm5ZV0RT?=
 =?utf-8?B?ekJRVmdNVEkzRGw4bHpvVytNZ3p3STR0Z04rTzVXMnpSQjF6WUNONkpPRCtu?=
 =?utf-8?B?WnoramxtMXFEaHNETXdycFU4UER5N2tNczRSMU42c3JpWDIxOSs1MUxVSDhz?=
 =?utf-8?B?OGdVMXVzUVZrbGcrNFQvTVI5VG9kSTgwSUR2YmJLMENYMlpXSmh6YnhpcE5S?=
 =?utf-8?B?YVlCRXdvWGZvNE9ycE5rMVpGV0hYcUI4eDlsMDJCRmpCVWZzMk1aR1NFdjhM?=
 =?utf-8?B?cEQzekdIUis0a0trRmR5SzFiV3dKTmphYkJkNTlVZTlxT2lqdy9sNDZGbzdh?=
 =?utf-8?B?ZENjSnNXekk2azRNQ0Y1T2Y4QTJHQmJ6Q3l3dFRqQmprSit1MWFVQmozY1la?=
 =?utf-8?B?NVlFSlBQNmFDSXFnQUhOaEtNZ25NL1Bjd2dkT1dpMFBhOFhtU2sxNE5ZdG9C?=
 =?utf-8?B?RUdhQ25QRWFKNTlHWUhWTG95S3ozZHMvSGVCZjM1R1U2QlQ5bndzK3NoWHow?=
 =?utf-8?B?ckQ3M255Wnk0NkdPa3FaZXlENCtjU1N6QkRSTnlYVkpUaFhTSWhnRDRBc2la?=
 =?utf-8?B?dWdHN2FMYlJWckpPd1U2Znc4aEJTODVvcVlLck1xWGhoOW5FSmpzN0JWUjVS?=
 =?utf-8?B?cEt0QXczbWF5MHZpNVFVcklRbkYwZE52MzJPWGY3dkxrQ3hpSmppcVJKUU11?=
 =?utf-8?Q?cWc0tqz+8DAVw2e7SwIXMumxmMSyeLJQD7jIDqf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505b67ad-1d1c-4e8f-0d18-08d97ea599fd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:19:56.9380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgpZ7nJMy+kfG/+FeiTXx0wL2cBytU1N2Aeagm9enAfln69WRoTx88YN+paNvPUVI9GgwDAelGl+kc38rIFhUah66wzrSuMUSWruG1ure/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650
Received-SPF: pass client-ip=40.107.14.119;
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

23.09.2021 03:16, John Snow wrote:
> We can drop the sys.path hacking in various places by doing
> this. Additionally, by doing it in one place right up top, we can print
> interesting warnings in case the environment does not look correct.
> 
> If we ever decide to change how the environment is crafted, all of the
> "help me find my python packages" goop is all in one place, right in one
> function.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Hurrah!!

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   tests/qemu-iotests/235                    |  2 --
>   tests/qemu-iotests/297                    |  6 ------
>   tests/qemu-iotests/300                    |  7 +++----
>   tests/qemu-iotests/iotests.py             |  2 --
>   tests/qemu-iotests/testenv.py             | 14 +++++++++-----
>   tests/qemu-iotests/tests/mirror-top-perms |  7 +++----
>   6 files changed, 15 insertions(+), 23 deletions(-)
> 
> diff --git a/tests/qemu-iotests/235 b/tests/qemu-iotests/235
> index 8aed45f9a76..4de920c3801 100755
> --- a/tests/qemu-iotests/235
> +++ b/tests/qemu-iotests/235
> @@ -24,8 +24,6 @@ import os
>   import iotests
>   from iotests import qemu_img_create, qemu_io, file_path, log
>   
> -sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
> -
>   from qemu.machine import QEMUMachine
>   
>   iotests.script_initialize(supported_fmts=['qcow2'])
> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index b04cba53667..467b712280e 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -68,12 +68,6 @@ def run_linters():
>       # Todo notes are fine, but fixme's or xxx's should probably just be
>       # fixed (in tests, at least)
>       env = os.environ.copy()
> -    qemu_module_path = os.path.join(os.path.dirname(__file__),
> -                                    '..', '..', 'python')
> -    try:
> -        env['PYTHONPATH'] += os.pathsep + qemu_module_path
> -    except KeyError:
> -        env['PYTHONPATH'] = qemu_module_path
>       subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX', *files),
>                      env=env, check=False)
>   
> diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
> index fe94de84edd..10f9f2a8da6 100755
> --- a/tests/qemu-iotests/300
> +++ b/tests/qemu-iotests/300
> @@ -24,12 +24,11 @@ import random
>   import re
>   from typing import Dict, List, Optional
>   
> -import iotests
> -
> -# Import qemu after iotests.py has amended sys.path
> -# pylint: disable=wrong-import-order
>   from qemu.machine import machine
>   
> +import iotests
> +
> +
>   BlockBitmapMapping = List[Dict[str, object]]
>   
>   mig_sock = os.path.join(iotests.sock_dir, 'mig_sock')
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index ce06cf56304..b06ad76e0c5 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -36,8 +36,6 @@
>   
>   from contextlib import contextmanager
>   
> -# pylint: disable=import-error, wrong-import-position
> -sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
>   from qemu.machine import qtest
>   from qemu.qmp import QMPMessage
>   
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 70da0d60c80..88104dace90 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -108,12 +108,16 @@ def init_directories(self) -> None:
>                SAMPLE_IMG_DIR
>                OUTPUT_DIR
>           """
> +
> +        # Path where qemu goodies live in this source tree.
> +        qemu_srctree_path = Path(__file__, '../../../python').resolve()
> +
>           self.pythonpath = os.getenv('PYTHONPATH')
> -        if self.pythonpath:
> -            self.pythonpath = self.source_iotests + os.pathsep + \
> -                self.pythonpath
> -        else:
> -            self.pythonpath = self.source_iotests
> +        self.pythonpath = os.pathsep.join(filter(None, (
> +            self.source_iotests,
> +            str(qemu_srctree_path),
> +            self.pythonpath,
> +        )))

That was simple:)

Hmm, after you this you have

self.pythonpath = ...
self.pythonpath = something other


If have to resend, you may just use os.getenv('PYTHONPATH') inside filter(), it seems to be even nicer.

>   
>           self.test_dir = os.getenv('TEST_DIR',
>                                     os.path.join(os.getcwd(), 'scratch'))
> diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
> index 2fc8dd66e0a..73138a0ef91 100755
> --- a/tests/qemu-iotests/tests/mirror-top-perms
> +++ b/tests/qemu-iotests/tests/mirror-top-perms
> @@ -20,13 +20,12 @@
>   #
>   
>   import os
> +
> +import qemu
> +
>   import iotests
>   from iotests import qemu_img
>   
> -# Import qemu after iotests.py has amended sys.path
> -# pylint: disable=wrong-import-order
> -import qemu
> -
>   
>   image_size = 1 * 1024 * 1024
>   source = os.path.join(iotests.test_dir, 'source.img')
> 


-- 
Best regards,
Vladimir

