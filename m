Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FBC346931
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:37:56 +0100 (CET)
Received: from localhost ([::1]:33540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmqh-0004LT-9o
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOmAy-0002sz-2i; Tue, 23 Mar 2021 14:54:53 -0400
Received: from mail-db8eur05on2094.outbound.protection.outlook.com
 ([40.107.20.94]:29792 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOmAs-0000ZM-7M; Tue, 23 Mar 2021 14:54:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdXQ9DS18MXmF/LfqiiBu1CjiBxiwAhElner5TJD8qGSzbJFMbMR5E+oHDxkgOXyWsE303NGpIuh5NlPcYkyyyuPlKjDQa26NmMhThITPR4NIww0EoEpnVPLOr2lD+O/ISsWgAftcGB1TKvBT1CDjfCZIjCbQIUifcTiLAql0ZJaiRFUCZV2YvLnxC2+tgmP6OUSvrEG5/v+nW9weLyLScY7hmYp38HRj4oIwcupee7AVeljp8W9y14QHTKdQJLDb7KsYxTps9ijvnjO5VLtKjjTr4eYkOLXRQUc5fw19vYhupEhUh3vZJnuZ6S8czHganI0Krchir6xokr24Yordw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtrqI5T5GohB+CP9RoB93aI3z9RLCQ+ZK9bpX1SBX5M=;
 b=GQQI88z26v3GYh2ZKS1wLQ7YXtpbD+Zrs7sWGXtEfv4mhGBYn057z/HR5diMJfIrh9y7tF6UBxOrpNnSl0hMwE154aP9A3XmcSRH27FjCN/03uYphALeCglw6isJo+tBJE1SbAZ0nQDjlbfare4jmY+JundYmF0RHHz4RwAyj5iMstDMSONgmDAANu6crm1Rq+gkDqdNABNnYbU2WnoMnoKvQz/AITy3mTo20/pR23nHxmInujI+V8Q/ODZEgQQtAmgyw0toGEyc4XNvvI0PN6ePznFXngvhUb+MawVnsNCJTd7+/9zkm29DIT7nlC2m9ShJsoF015rqfOPZ97cCiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtrqI5T5GohB+CP9RoB93aI3z9RLCQ+ZK9bpX1SBX5M=;
 b=ekrDQKBklKcAdVGcHKBJLeFeZmXFA6CArhacM/p5hNGp3qmcgD2mqyPP9LwYKsUtNJPyWRBPcrrzlYGNf78EMxMiCk+rQla/f2g5QhDW7PlsDO9cDI/04YJfiusJ+GcCiMy+8QI/pvCtrZMyRuPS7dwm5MtKGklmOEqkitF8rK4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3287.eurprd08.prod.outlook.com (2603:10a6:209:41::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 18:54:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 18:54:38 +0000
Subject: Re: [PATCH v2 1/5] qemu-iotests: do not buffer the test output
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, qemu-block@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210323181928.311862-1-pbonzini@redhat.com>
 <20210323181928.311862-2-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <192fb6f9-c913-2393-54e7-ffcc87be7467@virtuozzo.com>
Date: Tue, 23 Mar 2021 21:54:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323181928.311862-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0102.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0102.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Tue, 23 Mar 2021 18:54:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e488deb-764c-424c-774c-08d8ee2d1ba5
X-MS-TrafficTypeDiagnostic: AM6PR08MB3287:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3287F3A07DE8B2A3D7B94847C1649@AM6PR08MB3287.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jp2N276XhDMfx8wHVR0iE6CCjJ6PutRoGzGBVk6je3OOmOmOgA0FzjzwFRzuovLJJ/sIRub/S4FDFAwRVcpj49itwBqLARv6WvoS9eXnwwgYepV9z3fN8O22MJyV8dLXfZeA4Lnf096tQZ7ai5arL+0c8TnoE1evucC1EU+vEISlCbk/s7dPX0Wy7uU4tr9m+A5vkBb7/R/dYXxxF8Gsp13Pw5ES7nrdF4z3d1c2V0r80loPieuPTFviklM3OlEl3SK8S/kInRs6OXOZ+J6mEJGF9MS4ciszLtw1kUybslxawuSoEV/hla4MScbGa07sfpyoBJpV396mbcK3j2IzaiOYj9oafmGxAowhyqeiBgsmnE/Th0yJnmrtGdtl7CWyVv/Dcnj8lsCAbZaDr8zBnKcwO/kyUpqfZpXPa9IU89MJ4RagLuuTGAJG9bwAfSybjLX65NH+W1B2uVpfbCc/8xde7MlkHjfgUKDiNQ5LToe/yaraV53ynpMKET6oMMVGlqZ9KoQtp8WK1xeISrU9Y4d5fD4KOqxKZJ9uXVe5uzFeAAiWyETC1lRV3vyAAdLWazxZYOzya2Yf9EoJGGvbJCSAtGjUgjOmZpi66VIYVoRcF8/SBCPjsEEEOAvYE6ZP/+ih2YUehU7RHGuQ8OiGD87LU4s4SyuqyWhFHnjHKZXlS8Fy9xnb5VvrVzZ5zHH/1xH6zB5VjXMd4cVjT4vtQQfxcWwiEA5J/IabWnUpTIM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(396003)(136003)(39830400003)(16576012)(52116002)(31696002)(316002)(6486002)(186003)(8676002)(66946007)(956004)(4326008)(2616005)(38100700001)(86362001)(16526019)(5660300002)(26005)(36756003)(8936002)(83380400001)(66556008)(66476007)(478600001)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UFd0RFcySUV6SWhlMjF0MmVLVTdNMkRhZ0ZnS2ttTTNkaElrZW81QytucjRX?=
 =?utf-8?B?TVIwNC9ocHFES2w3OU85SWlCNWZ2NUlMS3FxTDR4RlJhQlZYaGZoVzFEUXJh?=
 =?utf-8?B?UXhkNUZBTXRTclhRTXR2clg2dzNtUmRlc29Xc29RTWRMaDA0dzBEai9pRGVk?=
 =?utf-8?B?WTdJcEovcDltQWJvMk9mTFdqa3lWdVU3Y3JOSWRObTg5cjczdURUcDMvMXgy?=
 =?utf-8?B?UWJhOGZZQlQ3elNySW5jQ1IzZmk4UXNUb2RsRitqbElGSmYwZUwySm5WNVF4?=
 =?utf-8?B?eUYveldaT0dHa1JMekNHbEl6QUFHWTNPZ0VoVENkNjFwbzNBdVkrK0hjSmxs?=
 =?utf-8?B?NmFDbWJSL3I0MFAxazJMOXdRakYwWHFlaHBiWEJhQ1BFdjNsbjJEZDFmN0dN?=
 =?utf-8?B?TW1GTSswMDQrZDQvRjlWQzVTOFJnNFBmcDAwTGttbS9JaDcyTVl5SitKRTAv?=
 =?utf-8?B?UHhhWUNKL1QyR2hRbDlLYnh5OUUvWHR0Vm5yZnp4b21WQ08yMzVBQ2FQUzE4?=
 =?utf-8?B?bW1CaUswVlYrM3EwazltWGlqb3BHOFI5MTljdWZuSnVMRUNNaEFTUy9Gdm9y?=
 =?utf-8?B?U3VZS2tONllZZFNXQkNOVVQzU1lJYXZmK1VHUDIvZFd3YWE5bTNVaHdpY3JE?=
 =?utf-8?B?cTlwU3J5QmM5YUZxNGU1Zm9oVWxIaTNJT1JDa1JibmM3ZzBuaVdhRzFjSmNC?=
 =?utf-8?B?b1hKTTFxVE1zZVdWQTdoajU0MzlGWFdzRFVMeGZWOE1La1JyVk8zeS9lZEJQ?=
 =?utf-8?B?Y3RIblhPTnJIS1A5T0Q1cEdWSUJjdGllL242a0R2bFprMHZCYytVdG4zK2Qz?=
 =?utf-8?B?a09Id3k2cFpKOHIwbE9aQk01WHc2NzhYTnhRL0RrdS9JbjFmYVRBcDhmU1lv?=
 =?utf-8?B?eS9tbHBhRDRoWXB2WXRiNnlSSGM2YWdHRmF0Y3Y2bnlCNUY1SlFWM1lXVUtX?=
 =?utf-8?B?RFU0ODlsTmxIS0VKZDRtK2d0aFFSbzVoRWFkV3BGM3pWeHNBZkRkM3FIUTVQ?=
 =?utf-8?B?blZuVm5SNVVQdTkyMkJZT0R6MEdTMmJtUDhFcjh0RmFQaEhsZGJ5KzRvN2dC?=
 =?utf-8?B?SnB1R0pHSXRINDczVlVEY21qWTlHM0F4Zmt5Q29qQk54REszTDRFdGVoNjY4?=
 =?utf-8?B?YVp2QTBrc2N5bUlERjNMQ3Q5SDQ3dnJITXVZNnY2eGhjQ1VNVllIZGNCbHFQ?=
 =?utf-8?B?R3N4T3VZY3RiZVZWRkthcVlZTXdmL2h3R0FFYktoanpxVU4rdmd4YWZjU21h?=
 =?utf-8?B?K1llMzU5SDJkekhPZXpreFZPUUhOWGtjaHg1WThBZVBxU2Fxa256dS82RE0w?=
 =?utf-8?B?ai9QcWNnQVJXZ3NjNVZZVXFCU2Jpc2kyb3dVVFNVVndoaGRBaTIvVGRJWitz?=
 =?utf-8?B?V1Z0R29sd1lHaHJQb3N4R1lRQTFFUGNadkYyaExna0ptQ3ZldDZCT2hzY00v?=
 =?utf-8?B?ZmFvUWVhUWxJVGlDU0Z1alExa0NPYTNIQi8xcCs0VzAyV3hKY2FHek1KUzdy?=
 =?utf-8?B?VnVwMWpVa0NReHpXd2Q2WEYzTkZyZHhndHRuTWU1SmVsblExSXd2czBpZkRo?=
 =?utf-8?B?b0hqRjY0QTZiMnRoWkV2UXh0UlNNNk5zTVZUdDNDVU5IVnhYNURXZlhSYkRs?=
 =?utf-8?B?M1hhSTdZOG5ZQWQwT2JLcExXUzFJdG44RU9TVE1oMktOL200TTkvUkFxOTYv?=
 =?utf-8?B?cFRsaDB5cTNhZVlRc2dJTllGRWZKblgvbHIvT3NyUFBoV05kUUVpSXNtWVRL?=
 =?utf-8?Q?FAW9HK+uuuobgrIWVhWlaE/NBoMQFTKtu5gmWXI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e488deb-764c-424c-774c-08d8ee2d1ba5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 18:54:37.9982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UK1my8p6Re+xGnauCoJhaZMSO5/w68K7u8k3jdpY1mCD5PA69fWK4rwJOkciDzzoEQWB2JxUsHEqZQUYUwQqSZb9LyOZVjshM96YqOoSWKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3287
Received-SPF: pass client-ip=40.107.20.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, PDS_OTHER_BAD_TLD=1.999,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

23.03.2021 21:19, Paolo Bonzini wrote:
> Instead of buffering the test output into a StringIO, patch it on
> the fly by wrapping sys.stdout's write method.  This can be
> done unconditionally, even if using -d, which makes execute_unittest
> a bit simpler.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

some non-critical notes below

> ---
>   tests/qemu-iotests/iotests.py | 68 ++++++++++++++++++++---------------
>   1 file changed, 40 insertions(+), 28 deletions(-)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 90d0b62523..0521235030 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -32,7 +32,7 @@
>   import sys
>   import time
>   from typing import (Any, Callable, Dict, Iterable,
> -                    List, Optional, Sequence, Tuple, TypeVar)
> +                    List, Optional, Sequence, Tuple, Type, TypeVar)
>   import unittest
>   
>   from contextlib import contextmanager
> @@ -1271,37 +1271,49 @@ def func_wrapper(*args, **kwargs):
>               return func(*args, **kwargs)
>       return func_wrapper
>   

You don't use typing everywhere.. But iotests.py doesn't use it everywhere as well

> +# We need to filter out the time taken from the output so that
> +# qemu-iotest can reliably diff the results against master output,
> +# and hide skipped tests from the reference output.
> +
> +class ReproducibleTestResult(unittest.TextTestResult):
> +    def addSkip(self, test, reason):
> +        # Same as TextTestResult, but print dot instead of "s"
> +        unittest.TestResult.addSkip(self, test, reason)
> +        if self.showAll:
> +            self.stream.writeln("skipped {0!r}".format(reason))
> +        elif self.dots:
> +            self.stream.write(".")
> +            self.stream.flush()
> +
> +class ReproducibleStreamWrapper(object):
> +    def __init__(self, stream):
> +        self.stream = stream
> +
> +    def __getattr__(self, attr):
> +        if attr in ('stream', '__getstate__'):

why __getstate__ is here? It's something about pickle..

> +            raise AttributeError(attr)
> +        return getattr(self.stream,attr)

s/,/, /

> +
> +    def write(self, arg=None):
> +        arg = re.sub(r'Ran (\d+) tests? in [\d.]+s', r'Ran \1 tests', arg)
> +        arg = re.sub(r' \(skipped=\d+\)', r'', arg)
> +        self.stream.write(arg)
> +
> +class ReproducibleTestRunner(unittest.TextTestRunner):
> +    def __init__(self, stream: Optional[io.TextIOBase] = None,
> +                 resultclass: Type = ReproducibleTestResult, *args, **kwargs):

actually, neither stream nor resultclass arguments are used in the code, so it seems we don't need them?

> +        rstream = ReproducibleStreamWrapper(stream or sys.stdout)
> +        super().__init__(stream=rstream,           # type: ignore
> +                         descriptions=True,
> +                         resultclass=resultclass,
> +                         *args, **kwargs)
> +
>   def execute_unittest(debug=False):
>       """Executes unittests within the calling module."""
>   
>       verbosity = 2 if debug else 1
> -
> -    if debug:
> -        output = sys.stdout
> -    else:
> -        # We need to filter out the time taken from the output so that
> -        # qemu-iotest can reliably diff the results against master output.
> -        output = io.StringIO()
> -
> -    runner = unittest.TextTestRunner(stream=output, descriptions=True,
> -                                     verbosity=verbosity)
> -    try:
> -        # unittest.main() will use sys.exit(); so expect a SystemExit
> -        # exception
> -        unittest.main(testRunner=runner)
> -    finally:
> -        # We need to filter out the time taken from the output so that
> -        # qemu-iotest can reliably diff the results against master output.
> -        if not debug:
> -            out = output.getvalue()
> -            out = re.sub(r'Ran (\d+) tests? in [\d.]+s', r'Ran \1 tests', out)
> -
> -            # Hide skipped tests from the reference output
> -            out = re.sub(r'OK \(skipped=\d+\)', 'OK', out)
> -            out_first_line, out_rest = out.split('\n', 1)
> -            out = out_first_line.replace('s', '.') + '\n' + out_rest
> -
> -            sys.stderr.write(out)
> +    runner = unittest.ReproducibleTestRunner(verbosity=verbosity)
> +    unittest.main(testRunner=runner)
>   
>   def execute_setup_common(supported_fmts: Sequence[str] = (),
>                            supported_platforms: Sequence[str] = (),
> 


-- 
Best regards,
Vladimir

