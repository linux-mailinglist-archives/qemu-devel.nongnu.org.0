Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510CF346611
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:14:22 +0100 (CET)
Received: from localhost ([::1]:44128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkbk-0008I2-W5
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOjna-00070l-Ct; Tue, 23 Mar 2021 12:22:30 -0400
Received: from mail-eopbgr150134.outbound.protection.outlook.com
 ([40.107.15.134]:9909 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOjnU-0003C6-RD; Tue, 23 Mar 2021 12:22:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nysbnWQo4nERDKDZauXGGRhrtKxoqszrMLIbgIN4gERGI+KgmBvh427yGUERR/HlCOBo6TXmtDAPpXX829u2sWt9t1h4i4GNkEWJ+NxlVAXLnVTXy0goHzAbFSW4tmrknXkfZxw8KA9JzIMlD54hEAxyfgzb/W+WX1vnGltoOJUxdXQVXBsAce2qON3nqUspyV46dLuVVCMhCHqYRFOV2qsfQwvHM4FzEIapadr9NDRJleidMhR9PHZiLR699MUjwL6si3Hm7zWiPhWanCZCfimSME/TLBUYVyiTb9dvXMYk+V8f02AuMV70KJF87dGtrPwDmJ1qNOfegVtTQsBK4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cp+QjTIPK+F8zJ39ZpS7GSpZ0ktx33DAqEOzmNUGTBI=;
 b=M9u6UhYXyxuBrh5NdC4z3pw8oh89feZ+w3Rxocx2sN5tq8LL9FU4m7DXQCYyUuFSmeiXYglDzFUKCtW9Mlrr+4WcbVzGpeQtm5Pf8tXpSx8nzqvFTi5pz7Z/R6WnJN+zn8aeibMqzywyzjwJEbI4cEn+gKFkTvvTTlXDK5yEmbickl4uNX988Fb+4/Bm3YQXWbW0Fy0BdwxoJmb3fXWyX4N5zl7iEaIbgF8/ySjXnhPL/iZK28MlQMsIZCG9bqARNRHwJHRvznPsS5mpVvlVpEf1sESMtCT4s1qliM0SqHbAV0lTA6g12R1+L5ZKsDrkDabAyiapQkJFcLGPdPwd3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cp+QjTIPK+F8zJ39ZpS7GSpZ0ktx33DAqEOzmNUGTBI=;
 b=TXuL9gvSsp8Y/ITqtyCCM2yZLQoRVjQ7H/MVVgfO8FC2QFog0fSMHlw2qeFUTYXsiiJVcTJTGB8JtySnI7k15/1vKbPiFs8TLjWaVat4qhMY8XKI/hx6B/M+8HRXTNk25EBGfgHbEBTixYpK/4KDXP0Eg5XBQQAcZGSLH80xAbE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6534.eurprd08.prod.outlook.com (2603:10a6:20b:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 23 Mar
 2021 16:22:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 16:22:19 +0000
Subject: Re: [PATCH 2/4] qemu-iotests: move command line and environment
 handling from TestRunner to TestEnv
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, qemu-block@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210323130614.146399-1-pbonzini@redhat.com>
 <20210323130614.146399-3-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <deb42e3c-0459-2372-9974-6359268dd661@virtuozzo.com>
Date: Tue, 23 Mar 2021 19:22:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323130614.146399-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0110.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::7) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0110.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 16:22:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c8d7e72-892e-4105-560c-08d8ee17d464
X-MS-TrafficTypeDiagnostic: AS8PR08MB6534:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6534E978DFC07F59954AD96DC1649@AS8PR08MB6534.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8+UEAPDF4+sR6uvgyiN/jnnpPShcK1SlAxKzSiA8oLXiSzYEMR6j8D9IGqhoxHK/kGl75lS4Kyb6c922milcgMTMjFrJpFAKcd+7AVr1z0lNpA8MGzdEBL9JpgFm0iRDFDEG6goRTegqbWpH+GKos+LjZnkdCRTsFMpUEaOVviv4Bi85H6mIIHTuCm7YHAjwmjJXZYgyMlEylfbwdoVgjTosw4Ks0CisRFldrvQl39qSKsIOU3oEPyunhby3Rae/9a48O1u/59izqiBzf6TZ22jbc9C8btNf/GRrushcxbcBU6ciCBs1ALZ3t4vhjLN334RFsgvtCBgrzUi9F8sm/Yv79hOg6gu6fg61IYxx4TjsXQyw4OmbTfvGuPy5jBN80oviqHdJafpfAACdGgmihZvKcWcbSy8b+Y282eljg251DmnVdPyxxqMRGWHTbENS0uZnFcNL5P8qUBIDy1kHZZg9dpba7ETQFbLdSkrwQg2l2RnU3Qr52DORQrah4wQ36cUZ1bP/PhaTT5VSisDvgWnSnUciuFrvQQnkQtA3v1ORaR11b6ziMZERxP9hRUryKuLDcvCXldVY5C1YudOvQDFLJ3/y79xU9UyOMCXhZtojFVjeimzpGtc38YEYc8de/KOsHDarGEhP8l4dnHnGuzlzmhvj3CZ5kyh3pIY3iJubyAtHC9rWuo4wXqzolgWTIQBKsaRgNNSYqSzZMnFLbfEJlOOV33oWBaUM4y2Aknw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(346002)(136003)(376002)(366004)(2906002)(66556008)(66476007)(66946007)(31686004)(31696002)(83380400001)(86362001)(8936002)(16576012)(316002)(36756003)(8676002)(52116002)(186003)(16526019)(38100700001)(478600001)(26005)(4326008)(956004)(2616005)(6486002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aFZQMWNPZEZ1NWFBclFvSGlmdHBKdG5PS3RHZUdrV3AybXBkTnNPSEdMRHNO?=
 =?utf-8?B?bktzZVJBQXlJbDg0WXpKK3ZyQ3VVWE1iU05qNmtHZ1pPdVo2d00wZitxSlpp?=
 =?utf-8?B?c0h5RWNhZU1lZGNhYWRORTVLSWoyVG9DNnh4Y0t1MjVNOXZUcFFMSDIzMkF0?=
 =?utf-8?B?eUpZdm5zZDBFUGNJOFVZb29BRVpMdHRJVURveHkxQTFSWmlWUWRWcnp2ekh1?=
 =?utf-8?B?TG54ZVVKcFc2TzArYnltTnZpMXBSNlJoZUtwUzl6ajdNUkVVcXU2RUVwWkZ1?=
 =?utf-8?B?R1Z6YUhEejJOVmM5SUgrdW1XZHJvbHhwakZlTy9EN3pXNC9SSEg2Q1JsREVm?=
 =?utf-8?B?SDA5MnJvbytORThGZWZudGJWOEpYcGkwNHFHZXlTS3UyaVQ4YU5XVmNPNS96?=
 =?utf-8?B?SnR1WGpYVFBRNFdaNVpkTlp2RThDZldCNHJvSnZtWVFlWG5FMWxTdEZJdXlJ?=
 =?utf-8?B?ZHQ4M25MaFd6Mm9GdSs1Mk5RRWU4L2IrLzVFWGlWSE8xR0d1c1c3bkd2bit6?=
 =?utf-8?B?OEJyS0h1cWFnNjM4d0QyRUFvZWRoY1Ywbjc0WjExRlBNOXRwTEZCVXJYeXpB?=
 =?utf-8?B?S2txeHkrRHpabmkxem4wOFRZMVk2aFlCMlhuR0lqOWl1QnB3SkFBZXB2Zk9F?=
 =?utf-8?B?K3VqSDlSTFpCVER6cFFlRVlpMU1aSkl4Sm55MUxRS0d6V0xubHlOQWsvbkFh?=
 =?utf-8?B?M1pVMk9Oc2pSTDhqenR0RlQxWXpGQzhtWTFJU1hVMG5Eck10bnRSKzVic2lj?=
 =?utf-8?B?bEprWlVqM2Zhc0tEZUV6YWVXTEpESmxNK0hqYzFNM2FQS0h5UEdTcDNiL2R6?=
 =?utf-8?B?U2tpdTBjRHpRMzZMYldBWkQvSlBGRjJPanZVUjdsdEpwTnlPd0NMVC9iZkZD?=
 =?utf-8?B?N200MjduZDRCVVVkNUxzTllOVnFBalZoUXhTODVVbjBoRlovbHBVTDh2eHBx?=
 =?utf-8?B?b0hwNjhEUE1TQmdjRkFQU2N4NU5mR0k2SHJwYXBtY0VyZHNEeXlTTUNyU2Ew?=
 =?utf-8?B?Um8vSFczRlFhMWQ5SFVOUVF6NjY1SGRtK2E1OWJzakY2VWtnUWtnV2dnL0Zh?=
 =?utf-8?B?eFNoKzZibXA4Ny9Rcmw0V1FxZmtTL2Z3WWprSDlFcGZVejRZaFp4VENWdC80?=
 =?utf-8?B?TEpPR1NZdjJPSkhuV0hRZnlPZE1HTGZycWV0QWdFZEhDeUZ5dHluZlM0Tzdw?=
 =?utf-8?B?aWZQdzdQaWx2djBtam5sMFRpbEZkcVhJY1JXUXVHT3FtcWwvZjFsdm5rNnhp?=
 =?utf-8?B?V1VPY0ZTMmUvS3luNEJMdjdrVTltb041aXFkWW85ampnVjZCTGttVVQ2Qzkr?=
 =?utf-8?B?aXFiS0g4ZTVJS0pUN2JQRUU3NzlRTXB4Snk4akswT3hNMnpaYmtJNlZ5eEYv?=
 =?utf-8?B?YVR0d0U2ZUVWenlFNHQwc3ZqNS9ydHlYUXU5c1pON3RuUXVleGZySjhzcnBl?=
 =?utf-8?B?M3VSbkpRK0c1S0U4WDY1U1JJMHBIbmtSckxJbjFpY256NWlEaFYyZy9FaDNG?=
 =?utf-8?B?Y3pMaTJBY0xwQlFSaVlRQ2JGQ3lxSjhpRWhYejFNSmlkMTBIbWh0Nk1EbHVl?=
 =?utf-8?B?K0p2OTROVXBmNytmS3Jjc1QxK3BDSTI4bWdLczA0U2MyZVhnaVc5Q3ptdi82?=
 =?utf-8?B?a0poblpyS3l5QnF4cUNmR243blhlSzZjelNJdWdES2ZJcURwMEkwUTdtZmRh?=
 =?utf-8?B?WW9ySXBqUGwvQ00yaWJKWTYvSE00dTExY1hoK1orSmxsZDJTbjRVdWNYRHVE?=
 =?utf-8?Q?y4ZTUTkqXgkIYI4rPUQvg7crs7jFcVukr0cXyh7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8d7e72-892e-4105-560c-08d8ee17d464
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 16:22:18.8974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNFHE/eGJZZ2ajDPIR/owkujOwJrAHpyTRjrB6xMpuxgJBJZSvTkcdC2PdTS8jCU0qiv04WJXknAf3oDRat/ePc8tTlFbuYlSIgDyjRAfxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6534
Received-SPF: pass client-ip=40.107.15.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

23.03.2021 16:06, Paolo Bonzini wrote:
> In the next patch, "check" will learn how to execute a test script without
> going through TestRunner.  To enable this, keep only the text output
> and subprocess handling in the TestRunner; move into TestEnv the logic
> to prepare for running a subprocess.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/qemu-iotests/testenv.py    | 20 ++++++++++++++++++--
>   tests/qemu-iotests/testrunner.py | 15 +--------------
>   2 files changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 1fbec854c1..6767eeeb25 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -25,7 +25,7 @@
>   import random
>   import subprocess
>   import glob
> -from typing import Dict, Any, Optional, ContextManager
> +from typing import List, Dict, Any, Optional, ContextManager
>   
>   
>   def isxfile(path: str) -> bool:
> @@ -74,6 +74,21 @@ class TestEnv(ContextManager['TestEnv']):
>                        'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 'IMGOPTSSYNTAX',
>                        'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_']
>   
> +    def prepare_subprocess(self, args: List[str]) -> Dict[str, str]:
> +        if self.debug:
> +            args.append('-d')
> +
> +        with open(args[0], encoding="utf-8") as f:
> +            try:
> +                if f.readline().rstrip() == '#!/usr/bin/env python3':
> +                    args.insert(0, self.python)
> +            except UnicodeDecodeError:  # binary test? for future.
> +                pass
> +
> +        os_env = os.environ.copy()
> +        os_env.update(self.get_env())
> +        return os_env
> +
>       def get_env(self) -> Dict[str, str]:
>           env = {}
>           for v in self.env_variables:
> @@ -268,7 +283,8 @@ def print_env(self) -> None:
>   PLATFORM      -- {platform}
>   TEST_DIR      -- {TEST_DIR}
>   SOCK_DIR      -- {SOCK_DIR}
> -SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}"""
> +SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
> +"""

Unrelated change.. Better be in another commit or at least noted in commit msg.

You also updated only one of two callers, so output will change after this patch. Seems it should become better..

>   
>           args = collections.defaultdict(str, self.get_env())
>   
> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
> index 1fc61fcaa3..2f56ac545d 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -129,7 +129,6 @@ class TestRunner(ContextManager['TestRunner']):
>       def __init__(self, env: TestEnv, makecheck: bool = False,
>                    color: str = 'auto') -> None:
>           self.env = env
> -        self.test_run_env = self.env.get_env()
>           self.makecheck = makecheck
>           self.last_elapsed = LastElapsedTime('.last-elapsed-cache', env)
>   
> @@ -243,18 +242,7 @@ def do_run_test(self, test: str) -> TestResult:
>               silent_unlink(p)
>   
>           args = [str(f_test.resolve())]
> -        if self.env.debug:
> -            args.append('-d')
> -
> -        with f_test.open(encoding="utf-8") as f:
> -            try:
> -                if f.readline().rstrip() == '#!/usr/bin/env python3':
> -                    args.insert(0, self.env.python)
> -            except UnicodeDecodeError:  # binary test? for future.
> -                pass
> -
> -        env = os.environ.copy()
> -        env.update(self.test_run_env)
> +        env = self.env.prepare_subprocess(args)
>   
>           t0 = time.time()
>           with f_bad.open('w', encoding="utf-8") as f:
> @@ -328,7 +316,6 @@ def run_tests(self, tests: List[str]) -> bool:
>   
>           if not self.makecheck:
>               self.env.print_env()
> -            print()
>   
>           test_field_width = max(len(os.path.basename(t)) for t in tests) + 2
>   
> 

Better without changing empty line, but still I'm OK with the patch as is:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

