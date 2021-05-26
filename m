Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70CE3920BB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:18:00 +0200 (CEST)
Received: from localhost ([::1]:44680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llz2V-0007pk-WD
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llz01-0005vA-2t; Wed, 26 May 2021 15:15:25 -0400
Received: from mail-eopbgr150129.outbound.protection.outlook.com
 ([40.107.15.129]:48183 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llyzs-0007Yy-4l; Wed, 26 May 2021 15:15:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsm8htf3lldJFWoFbF+bCiNQFqRUTz1Nq+OviRdIrJkuSvwmjoONp+I7e/g2e6QzIK/3w3pFskSAhCujQ0wIJC9pDdMFSzc6l9f0T0muAUKiQreIWhYUmwWkbUNGwgtbDgFqjfQmW0fFiZpUGij+g8ECQ6KT4d8qIvPAGn/0suuXtgbf7BE1a3MaEwF3ICvRV/bWGqVfH22zVWs72KvcqWarHmuShzBLVLYs1+hXVPX1+KbwlNbwmJOmXMXZ/FMHlyDu02+2brbMOc3xGkaxqD8fvZxrB8OD5E+9YHFtddYGsYITDl9/30/Y7vkxbYBWs3IuDmjyYrkzreHtu8vihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uy6E5mfLCEQ3CuM/UV7lTm4MGc6HEUft3tySEIfxx08=;
 b=VAsv3S9ytMhy3XqJ5N0BH5BjU1jupTd2ZXXvNiIoPlzI/FpleTIPRSko+3to+jdp0vq76xlsaIycK5SlDLA5ypXXbJqNHsWsG5v61OnJEVUcIVhFR3CJrZC1eqy02GW+KQqjaI/ZDhMujaXEuLLL+tIGy/nXVBFwDHTQzr3GKK3dYiAbcTMKRpNcPbvyzM32/mIzJvrulaXGvOIZm3n54zAC0XpbIX+9H3ErmzDSpoHCSh+gMSOmLWCHcJV7v6FPtGnqNeN1mipVw35bD578yrAD4BXdDuhVKWE9uS49CCKzm+6KxkSqqkbJmIH9O5MdBlvtNvaBaj65UqyW47534w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uy6E5mfLCEQ3CuM/UV7lTm4MGc6HEUft3tySEIfxx08=;
 b=eyQ1Qy27NYG0bwSH/0tG+m0YpF2v2FX04yiVlVjtzAWRrla5ltn44pK/Fkc8c4WwuEz/BOccrHXbaxppetET8LRRgKie2ivLI1bZEHwsg5i+HrjDEGqDFbxN6clOgv70dgsbp2KzRg7lTMImFaRmqgx9WF786LWRfHps6Pf5AqQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1843.eurprd08.prod.outlook.com (2603:10a6:203:3a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 19:15:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 19:15:12 +0000
Subject: Re: [PATCH v4 04/15] qemu-iotests: add option to attach gdbserver
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-5-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <59cfe4bf-6d2a-6a4d-a93c-b02e4af6c8b1@virtuozzo.com>
Date: Wed, 26 May 2021 22:15:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-5-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.19 via Frontend Transport; Wed, 26 May 2021 19:15:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb96af2e-a667-413b-9e1e-08d9207a9602
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1843:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1843110969805D1C8E165E1FC1249@AM5PR0801MB1843.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v3P2EEgrs3CYW+xfKQC8rhFpxY5MECqDIA3MUEc87o+oQGFO1RQxIOGs3YzjVa1ewjdQg40e6ZQUQsIDxqQWspf+4VPkIH5tjSWHwpcEwQu3t1Ts9DN+9IPkV56RaOl2mLoDxEG3fKK7wPN13aWzlrAdwCVqCYQ+Dmz6cWJhTCEsMJarRSKHwUXFA3lIviyNoeEfwbtD9Zz8ZqRJZqiCG/MAD6It9vS3ejNBqeSC0Bt6MJxbWqkzVXVj7myVoGUhxFjXuCEYkjlffHEttSGFa7x2A8j1sr3oO1KtP4L8sCWamswyYHxzQERNB1gOLlEPfAjig8CvEWnSjgoNT2b4Ltn/C3xjG+6Go+3+Ieop1Tf9Kwj6kKjGkBIPwAw9IewvLWlCwHawj8R3KSMnN3QWNl4kGtw6I+ATrxeNIW9tzR0bk3hXIjzTkyeBHc4GXEDfabmy8Am5CIc8X65sZIhKRhJbAsuimuj0Bbuag2eAzNmhYzTiVRKbq99yHX/n1gZ2Jr5nAky7LlDh4/03ve6BBAsdLRrTRdlbSbFgMLhmafVFVtSNwGJAvorR5eApBSMzULxUEKEeez2izlc5bQWpNHGELm1QjEW66iH7gFlIzJ2o7UK49D+c3SGl2BKYMa+xoltifex46ucMvRWCtIqVfLdgFpEEC9sqvsrKpZV7R6s8sdz+c0DMN3fQFRgN9/UhVit5pVeWhHOhAo++rktrbD0t76vxejMKxBpgY51V6nk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(39840400004)(396003)(2616005)(66556008)(478600001)(8676002)(38100700002)(38350700002)(26005)(16526019)(956004)(36756003)(31686004)(2906002)(54906003)(31696002)(16576012)(4326008)(186003)(83380400001)(66476007)(316002)(5660300002)(86362001)(66946007)(8936002)(52116002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R2pyZmdkVXNaVXQyQXNESUNQSDJFM3N3Njg5MEtHTjl0c0xLME1YdzMrNkN3?=
 =?utf-8?B?Z3phYzhhMi9yUi9WdGN3OGErRGVMU2lhSmFZblFweDI4UVhsSmg5NU1HOGdn?=
 =?utf-8?B?a1RzQitGeVM1RnFpdmZxMnEyUytDZU00a3JyMjRRTjBrOWhGajNmTWE3NDBj?=
 =?utf-8?B?dC9iNDBLUzc2K2Z0blhaSStYYzBHRGRudmZKNmV6Nml2YnhIOS9sVmwwQ3BE?=
 =?utf-8?B?d2h4KzBtbVMyelZSczVCRVVxRCtZSzJyL3JuaXhhUElqOUEzbGhUR2E1UzND?=
 =?utf-8?B?Nm9XSlpXY1BscGtCb1BXeFRySmpLYmxrazdzRThzTTZsR1FhTUkvV2tzY1Vv?=
 =?utf-8?B?TDZmLy9wTDc1cU9sbVduZng4MGZVWk9zK2dXWjhrSXlGT3J4ZlI5ZDFPOC9a?=
 =?utf-8?B?RCszcTFodUNucnJmQ3oxSEozaTNTTk5RRHZ0UVdnZll3OWtzVkJJRzJDUDVN?=
 =?utf-8?B?bTR5MmNla3NSUG5rVkg5M1Q3ai8wS3RwYzlQUERJbmYxMjh5K0UxTFg4RFJ5?=
 =?utf-8?B?c3JqWm5zNENERTVDWXk0dE1YVnlVU1poOHFMN1BSdnA3RExsa2EydTlwYjcz?=
 =?utf-8?B?em5JQmJZSlJWTXkrdlh0QzFOMTVsS1JUM3RaRFQ5NnJib3F5ZllhYjlvWXEv?=
 =?utf-8?B?ZzJaSEloSmlrcHB1alVxa0c3SkF0Yk1ETVpndmtnWHJzYmtncVlJN21tZVgr?=
 =?utf-8?B?MERIYnR3d0xFeC93Mk5EWVNQdFVpRGJuRFJJREhkZGZUNys0WTFmSXYwMno0?=
 =?utf-8?B?bWo4aVlJcjVmY0hWQkJFcHkvMmtTYzdLUDFOM0NIeCs5M1VGYmpJTGJQaDEy?=
 =?utf-8?B?dUxtL2JqcHdOTUM0a0xxM0E2SWdFRGxZb1l5bkVQTy8zbzlZZzlMNU1FRTlZ?=
 =?utf-8?B?b2lUYWpMdW0xZ0FHTkZxdVd0QkQrdG16aWtJVm1yZ2sranhCbytDTlE4b21H?=
 =?utf-8?B?aW9hcTdITlVWdHY4ZDFrK0VnSEhwc1N6UHF3L3prQU94RkRhNS9CMytuQnRS?=
 =?utf-8?B?c2puT1dDVWFGQ0VPVUVMSkRMVjFFaEpqNmx5Z1htMjhDUXB6YkJnZjJwc2lv?=
 =?utf-8?B?TDVDU3V2NndUL24rNjI2YktHNFlaMlJoM3hhNE1OMW5XS280UFV0THhpSENz?=
 =?utf-8?B?MDVzS0FpeWlveUdENDE0TnMwMXpmZi9LbnMvN0dzbjlKd0tUUCtqZ2M5UGZE?=
 =?utf-8?B?MUFCQU1ZRVFPZWxaUnZYUmdsTXRNNWRlY0tmRUV4cjF5TWw2Q0lvY0gxYytu?=
 =?utf-8?B?WEJIQU9vVHhpTVpXZ0lDR2FJTmx5UTFQcnlkLzROdkZZNmlpa2hrOS9XMlNk?=
 =?utf-8?B?SENGZzlqaDFFVG9UVjZyRTM5M0d1ZFRuRUgybkhjcnZ4M3RTaHRZblRNbll2?=
 =?utf-8?B?S3JHdUxtRjZ0TDFZNDdCYmVuR1ZCMTlYNzRYcXFCMzdsYUdSTTg2Ujluc1A2?=
 =?utf-8?B?NnJRZWxOcUExd1NiWGJPRldub29BTTYrSE1FeUk1N3hZNTBVZjRSYVF0bzBi?=
 =?utf-8?B?V1QxQ3pDeUJMbnpQRXowSzBoZDdCeThGUHJvdkhlTXBzcldSVWM1R1RPN05D?=
 =?utf-8?B?V09RazQzWjZ0MVNtOXBoTDdFV2s0NEpuRXZ2NFEzdGFubVJ1NjBxV3piQzZZ?=
 =?utf-8?B?MTF2OVRuMWp3dzVxK1MrRzlpN2FxeGEzbnUzcE5sbXAyUU55WVJTcEZJTWxm?=
 =?utf-8?B?Mnk1MUYvNzRNMHlBclc4aVhyY1o5bUNvUk9RMld3d2N4eEZBWHlBMjRqaHZs?=
 =?utf-8?Q?eWpHBWqVrQxzslfTeHw/yswc+m1GqCyFramLzk3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb96af2e-a667-413b-9e1e-08d9207a9602
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 19:15:12.5802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXZ9F5L6Wb34oDLjCRAsYrzZ6utRmGdrNPW42Mt2K9yBkZq7EQSQBGQrrHdmVgj/JjElf0FnCWQD7NJtq+UDC0yBh2H3kzmStQnIAcp0+4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1843
Received-SPF: pass client-ip=40.107.15.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
> Define -gdb flag and GDB_OPTIONS environment variable
> to python tests to attach a gdbserver to each qemu instance.
> This patch only adds and parses this flag, it does not yet add
> the implementation for it.
> 
> if -gdb is not provided but $GDB_OPTIONS is set, ignore the
> environment variable.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/check      |  6 +++++-
>   tests/qemu-iotests/iotests.py |  5 +++++
>   tests/qemu-iotests/testenv.py | 19 ++++++++++++++++---
>   3 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index d1c87ceaf1..b9820fdaaf 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -33,6 +33,9 @@ def make_argparser() -> argparse.ArgumentParser:
>                      help='pretty print output for make check')
>   
>       p.add_argument('-d', dest='debug', action='store_true', help='debug')
> +    p.add_argument('-gdb', action='store_true',
> +                   help="start gdbserver with $GDB_OPTIONS options \
> +                        ('localhost:12345' if $GDB_OPTIONS is empty)")
>       p.add_argument('-misalign', action='store_true',
>                      help='misalign memory allocations')
>       p.add_argument('--color', choices=['on', 'off', 'auto'],
> @@ -112,7 +115,8 @@ if __name__ == '__main__':
>       env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
>                     aiomode=args.aiomode, cachemode=args.cachemode,
>                     imgopts=args.imgopts, misalign=args.misalign,
> -                  debug=args.debug, valgrind=args.valgrind)
> +                  debug=args.debug, valgrind=args.valgrind,
> +                  gdb=args.gdb)
>   
>       testfinder = TestFinder(test_dir=env.source_iotests)
>   
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 5d78de0f0b..d667fde6f8 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -75,6 +75,11 @@
>   qemu_prog = os.environ.get('QEMU_PROG', 'qemu')
>   qemu_opts = os.environ.get('QEMU_OPTIONS', '').strip().split(' ')
>   
> +gdb_qemu_env = os.environ.get('GDB_OPTIONS')

should we specify a default? otherwise get() should raise an exception when GDB_OPTIONS is not set..

or you need os.getenv, which will return None if variable is absent.

> +qemu_gdb = []
> +if gdb_qemu_env:
> +    qemu_gdb = ['gdbserver'] + gdb_qemu_env.strip().split(' ')
> +
>   imgfmt = os.environ.get('IMGFMT', 'raw')
>   imgproto = os.environ.get('IMGPROTO', 'file')
>   output_dir = os.environ.get('OUTPUT_DIR', '.')
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 6d27712617..49ddd586ef 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -27,6 +27,7 @@
>   import glob
>   from typing import Dict, Any, Optional, ContextManager
>   
> +DEF_GDB_OPTIONS = 'localhost:12345'
>   
>   def isxfile(path: str) -> bool:
>       return os.path.isfile(path) and os.access(path, os.X_OK)
> @@ -72,7 +73,8 @@ class TestEnv(ContextManager['TestEnv']):
>                        'QEMU_NBD_OPTIONS', 'IMGOPTS', 'IMGFMT', 'IMGPROTO',
>                        'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
>                        'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 'IMGOPTSSYNTAX',
> -                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_']
> +                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_',
> +                     'GDB_OPTIONS']
>   
>       def get_env(self) -> Dict[str, str]:
>           env = {}
> @@ -163,7 +165,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>                    imgopts: Optional[str] = None,
>                    misalign: bool = False,
>                    debug: bool = False,
> -                 valgrind: bool = False) -> None:
> +                 valgrind: bool = False,
> +                 gdb: bool = False) -> None:
>           self.imgfmt = imgfmt
>           self.imgproto = imgproto
>           self.aiomode = aiomode
> @@ -171,6 +174,14 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>           self.misalign = misalign
>           self.debug = debug
>   
> +        if gdb:
> +            self.gdb_options = os.environ.get('GDB_OPTIONS', DEF_GDB_OPTIONS)

everywhere in the file os.getenv is used, let's be consistent on it.

> +            if not self.gdb_options:
> +                # cover the case 'export GDB_OPTIONS='
> +                self.gdb_options = DEF_GDB_OPTIONS

Hmm, a bit strange to handle 'export X=' only for this new variable, we don't have such logic for other variables.. I'm not against still, if you need it.

> +        elif 'GDB_OPTIONS' in os.environ:
> +            del os.environ['GDB_OPTIONS']

Don't need to remove variable from envirton, it has no effect. The task of TestEnv class is to prepare environment in its attributes, listed in env_variables. Then prepared attributes are available through get_env(). So if you don't want to provide GDB_OPTIONS, it's enough to not initialize self.gdb_options. So, just drop "elif:" branch.

> +
>           if valgrind:
>               self.valgrind_qemu = 'y'
>   
> @@ -269,7 +280,9 @@ def print_env(self) -> None:
>   PLATFORM      -- {platform}
>   TEST_DIR      -- {TEST_DIR}
>   SOCK_DIR      -- {SOCK_DIR}
> -SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}"""
> +SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
> +GDB_OPTIONS   -- {GDB_OPTIONS}

Not sure we need to see this additional line every time.. Maybe, show it only when gdb is set?

> +"""
>   
>           args = collections.defaultdict(str, self.get_env())
>   
> 


-- 
Best regards,
Vladimir

