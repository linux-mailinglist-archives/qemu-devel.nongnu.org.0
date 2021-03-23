Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B6A3461A0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:39:56 +0100 (CET)
Received: from localhost ([::1]:37268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOiCJ-0004Qf-3q
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOi8D-0000Z4-J5; Tue, 23 Mar 2021 10:35:42 -0400
Received: from mail-eopbgr70123.outbound.protection.outlook.com
 ([40.107.7.123]:32995 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOi7z-0003Fo-F2; Tue, 23 Mar 2021 10:35:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0b9zUsGqQm5gzGweR7onJSZSB+lgFMrzMW7MfaIPVbc5/YyzA6Wt1Xw8843QWaNl5uBxLetJXn2oJ1u/7Y0V3by6A9Y5xucoF7P7s6Z3GALUybmm5e7ocfVzDV5stbVrdB8bOQZRWUnlJ3OGa3wr7IGUTtpSsVffMrP3VJGRy5KYUTNLUqo7JcHYzP+MGrYbGlrLxTiAcCsjTu2WTP90k916/T219OYzuDSdce4GKjJizwXb4SDqaazqtpt52iPcAso/OME4PKa8GFbol73F+7kaFRy+DgZTQ5B/rDaYk0t3j/ZOH6Y5M61DHf0EL3clKuOVQN13RIarZGbYLrH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpAlM/TOS/fPKDvJfYpbsLFyNiZPNoZvb8GICB3Z5oQ=;
 b=gScbBT7wr6UyEWXh/IaNEBdlfSf65HwSGzBPcrThqp8vIPx1kknDOBDwp74UuxAHnABz2HUuX/5MWWjK0X/0Wk5IYYNZ3QxnHfQLxy+ZPIWIJIcNYYhaRzEcitsilR3Cb8sHx+yASHO8k4+BDtnDMCV44dikGA0tDU2QWgSqUSCuISSdQm0M++6KUjBzOyT4WDOVQGOM4Duigl3ZEODrW8KdNx0IrD70+zWlmqcCQA8TA/8uzZZFWHnr6pdrOyZhnybNBQtdXzJpGQGs31ATFvbpxCdaBQmipWZTcreCuR/nhBa84FA0l0GLbOFNU6i9/lHgpnup+twzvvMWjnssww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpAlM/TOS/fPKDvJfYpbsLFyNiZPNoZvb8GICB3Z5oQ=;
 b=m2TdnuFw8hU2Awvf1YW2Xk1kmqGs6tF9nidkrK0/lpV7S4Es3qBdnUsSksLLSQxAobdQPnBzPnVKDM1blKfeq6ddaXg3bOH18BMIqIU0+r6h8mjs/FoHqkonVJ1s9pfDSM6SUtfMjT3yHuThPOCXgioYRk2TdQBi2rjPHEjoYhg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4069.eurprd08.prod.outlook.com (2603:10a6:20b:af::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 14:35:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 14:34:59 +0000
Subject: Re: [PATCH 1/4] qemu-iotests: allow passing unittest.main arguments
 to the test scripts
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, qemu-block@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210323130614.146399-1-pbonzini@redhat.com>
 <20210323130614.146399-2-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f2d648c7-1b80-bec6-f17c-78d36cf998b1@virtuozzo.com>
Date: Tue, 23 Mar 2021 17:34:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323130614.146399-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0011.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0011.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Tue, 23 Mar 2021 14:34:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3772038-e4aa-4acb-f896-08d8ee08d5eb
X-MS-TrafficTypeDiagnostic: AM6PR08MB4069:
X-Microsoft-Antispam-PRVS: <AM6PR08MB406947D8CE64F7F5045BB750C1649@AM6PR08MB4069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rE7IemqtvC2acDzGT/DOdhEasomO50vREYKKnUi55uSQTgQAj64fm2tleMrlwxybT+hdWzBEnOB3tR7FD+CIFILX78IgHJUvaQ8uXMXnF6cd8a5ZknzSNjhvOqkMj9nuvphjzjilAz3UaYbN8iUiPetbwMb8HTSMGuimRtFg4rgnV5pflXf+rxMuX2Xz+MPQMnvNZIcPS6DQQl9ij746+bvV9Hy/NOjqKm1yAX+vjtMdSvAfojZPQB1HR6roO4bHA2YgfQk+rFA2WhD+yi6NkYfmzfDPweMEPIwknmjXNgDr6vzakdwET/XBFrAlAJA/sm5PczlZ1Qg9vVx3Ej+1OOMZWyasH9j9paX8k8EMd9pttO92KSzhTboE87mpyPsHrf+c4rOBkKyiextHZ+YpDlfcJ/hHMuG5gKHpJ5+PFmOkxt/7av9+jcZfL9E8jwhB1tk6gMFqqxZxqTlHF9OOiI1Vij84rG/Cj47Shhk+ZROtueLlw65yAijIcTZeUsJkPkaZLlkERrBSvC3ncn57hCceBmvo2pITwFJ7s/Op1vOA8Hbp5FFRUeAoStkKzpgTMIAozehXBXF3Y8/dXHd0LlStjiwdARsRTvx/78o2CJQ7khrssj9YlLJHxIzcmQrw4YV8jOGoglyUTCUdnMSpUkUn3614HRs9CpWnha1Kf7NHBT+/6DfcNA4aXB8DQkTu7C2ncvuNDi00bqbnwR4OSrhJhbxq4OODJIzRNaqwp74=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39840400004)(396003)(136003)(316002)(16576012)(4326008)(186003)(478600001)(16526019)(26005)(956004)(2616005)(66556008)(83380400001)(31686004)(36756003)(86362001)(6486002)(5660300002)(8676002)(8936002)(2906002)(38100700001)(31696002)(66946007)(66476007)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V2tqYnVUOXRhMUVyVE9CWWp6bE9uNkF2TmVvRVhTZFFrZnFjOEtHd1RxaGtU?=
 =?utf-8?B?dElwWFc2SVQrMW5VMDc3TVJkVWh0T1NHeTBpQ2dUa0U1ZmNiWGEybVpDREZV?=
 =?utf-8?B?ZkJhTGt3ejNSOCtpTkJMNm94VGRqbFlRSEk0TEFHdDVVcFNudXZhQjM1VjZF?=
 =?utf-8?B?dWtydjZENXlYcjhaN0ZYczMxVERVczVtNHR0Y3FaZEg5K3RTUGhUUWZ2RUJM?=
 =?utf-8?B?MjN1d2toUHRIT0hmN3h5SmV1Rkp6alBCeStjekUzM1haUW1mMDdPSUVRV0Y0?=
 =?utf-8?B?c2VSa0p6NGVxOENuMkZKamFmeDFUbnVkaTFYZE5DSEFFakJTRGM2UzkyaFNh?=
 =?utf-8?B?cXYxY1dIZmJ3REJ0ejdGYkF6M0UrbjF3aTkvcFNLZmVuUkJESU1nMTB1dVZ0?=
 =?utf-8?B?QUl5MHR3emE2amQ5VFBVbWRuMzAwR0JXVjJwU2wxVXVERGVNWEpZSjd3Vnlu?=
 =?utf-8?B?alZ4VFNmbVJMLy9lSGQ0S1BsMk1JWEZCU0wyelJKeFVMb0J1cmhXUEhTK2Y2?=
 =?utf-8?B?SnJrZzE2UlRlUDJCMFNJc0hlNWJDQUE1elVNTDdta0lnc1ZWQTNkQWV6bXdy?=
 =?utf-8?B?VTFPTXk4OS9xMnA1VG1VU3pnMlN6c1pHSjBEUGR3NXdYYTVKOHpKZkgxa05M?=
 =?utf-8?B?LzNBV2pSVlhHcWxGb2g3YVRxNk9mMEpYeTB4UW9neEFqcmpXOXBKUDZ6QmxU?=
 =?utf-8?B?SzZvQjVUK201MFlFOE1pbDA5WGVPMFJXNjZJeG82VzV3WFQ0Z2VhOW53TFNa?=
 =?utf-8?B?SzhKdUE2U1pkdm4vNDVMRWtpMzBtNmtFQjNFVU5LeU5KN01EN2JrNnN6TWlY?=
 =?utf-8?B?U0lUaWd3RmdNeTBKd2hMQXI3SUZGMDRHMjFOd3NUc3ptcklON2dNTWdsUVV1?=
 =?utf-8?B?L2lGazVlVW5rVVlIWE44YVc3ZDJ1Qmo3T0ZwOE9lTFkvZFN4NDlzcDFjK0px?=
 =?utf-8?B?Mm1oRi9Vdkg3aDJqSVNZMWY3ZzVJSU5TQ21mWDBuM2RrckMrdzJ2ZEhycUFB?=
 =?utf-8?B?QXJtODZWNWZ0RU5XZ0t1M3lqdk9HYjgyUjJGaU5UaU1BVEFYZG52aVVqbUJy?=
 =?utf-8?B?WjNBY2k3akxmT1dweWlxMVhUeEw3OWhsUnJPYzdLT2Mza0xXdDl5NHIvYmpu?=
 =?utf-8?B?Tzh6Q2ZoaWVQRXVUMVBFMDhPeWcwMXloaFpHd2FVa3FIVXZnN0RIMUd2dlg2?=
 =?utf-8?B?U3IzK0dXMXNSbytKU3UzcHMzM05Tei9rMWVqTXI4bThPOFp6dUNqWFpPTkt3?=
 =?utf-8?B?Q2puaHo0NnNzazVsWEJUS2oyVGtSMFdwTW1TdUJodi8xNThMS0xlL3hkMndD?=
 =?utf-8?B?R3JhMnRxdWc3RDR0T0hwbk5HZ0pQRFJETUdCWjA0Vy8zUWZMQ1dFc0cydms0?=
 =?utf-8?B?WGVyTnZlc29iT1JxUU53RWwvUmFJOEIzSmdHcUc2L3k3cDdXNUdIbDVsa1F2?=
 =?utf-8?B?TWRwcUpaZVVpTURuRmJENWxrazhwYVhVVUlKQ1I4bDRXN3VWUUR6ZktZeEx0?=
 =?utf-8?B?THRLL0I5L0tNdGlGS0hUZCtHSFM3MlZZODIrQjJQWGZaRGtSNGx0a3hFLy82?=
 =?utf-8?B?WUpkbVJZaVpIWEh0REpGc1dwNjd0QVBoZmlVRWR6YWZVdERLQmk0STRRWkhE?=
 =?utf-8?B?elBrbzBaS0ZYM3RxWmlTclAwWnhWMmdTa2s3T1BMdUlqUFhhSDVpeFVQS2s0?=
 =?utf-8?B?U3M0TnlVMU1sYU9UUjY1eks5REFTU0t3M2paVWp2bUo1bWl2clZmV2dQbEIv?=
 =?utf-8?Q?ATY9Ocg07IkdI5FVSVfsrmEi1FEDgE2Q8rLzY9x?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3772038-e4aa-4acb-f896-08d8ee08d5eb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 14:34:59.0539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZm4FdtF+BP5wEKZV2mT4vFIrw/QHWY7Z0f8ag5KGGV/WZtJWY5Zd3L5NdlJZqdrwjaRPL5jxLLa8msJLWB4tECwqX3OAsMSseKFRgP2iXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4069
Received-SPF: pass client-ip=40.107.7.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

23.03.2021 16:06, Paolo Bonzini wrote:
> Python test scripts that use unittest consist of multiple tests.
> unittest.main allows selecting which tests to run, but currently this
> is not possible because the iotests wrapper ignores sys.argv.
> 
> unittest.main command line options also allow the user to pick the
> desired options for verbosity, failfast mode, etc.  While "-d" is
> currently translated to "-v", it also enables extra debug output,
> and also there are no other options available.  Unfortunately, these
> command line options only work if the unittest.main testRunner argument
> is a type, rather than a TestRunner instance, and right now iotests.py
> is using a TextTestRunner instance in order to pass the output stream.
> By moving the machinery to obtain reproducible unittest output into a
> TextTestRunner subclass, we can just pass the class name to unittest.main.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Great that you are working on it!

I keep in mind the necessity of supporting running test-cases in separate, but never actually start doing it.

And in my dreams I usually just drop the
"""
...
----------------------------------------------------------------------
Ran 3 tests

OK
"""

output at all, as it gives NO information.

When unittest-based test fails we have a native backtrace, and nothing more needed. (OK, information about crashed process counts too).

But actually, we don't need all these .out for unittest-based tests.

So, I'd drop it. But this is more work, and includes updating one-two unittest-based iotests that still have reasonable output, so this patch is good anyway.

> ---
>   tests/qemu-iotests/iotests.py | 60 ++++++++++++++++++++---------------
>   1 file changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 90d0b62523..b9f4edfc42 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -1271,38 +1271,49 @@ def func_wrapper(*args, **kwargs):
>               return func(*args, **kwargs)
>       return func_wrapper
>   
> -def execute_unittest(debug=False):
> -    """Executes unittests within the calling module."""
> -
> -    verbosity = 2 if debug else 1
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
> +# We need to filter out the time taken from the output so that
> +# qemu-iotest can reliably diff the results against master output.
> +class ReproducibleTextTestRunner(unittest.TextTestRunner):
> +    __output = None
> +
> +    @classmethod
> +    @property
> +    def output(cls):
> +        if cls.__output is not None:
> +            return cls.__output
> +
> +        cls.__output = io.StringIO()
> +        def print_output():
> +            out = cls.__output.getvalue()
>               out = re.sub(r'Ran (\d+) tests? in [\d.]+s', r'Ran \1 tests', out)
>   
>               # Hide skipped tests from the reference output
>               out = re.sub(r'OK \(skipped=\d+\)', 'OK', out)
>               out_first_line, out_rest = out.split('\n', 1)
>               out = out_first_line.replace('s', '.') + '\n' + out_rest
> -
>               sys.stderr.write(out)
>   
> +        atexit.register(print_output)
> +        return cls.__output
> +
> +    def __init__(self, *args, **kwargs):
> +        super().__init__(stream=ReproducibleTextTestRunner.output, *args, **kwargs)

over-79 line (PEP8)

> +
> +def execute_unittest(argv, debug=False):
> +    """Executes unittests within the calling module."""
> +
> +    # If we see non-empty argv we must not be invoked as a test script,
> +    # so do not bother making constant output; debuggability is more
> +    # important.
> +    if debug or len(argv) > 1:

It's native to rely on converting sequences to bool. Empty sequence is False and non-empty is True, just like

   if debug or argv:

> +        argv += ['-v']
> +        runner = unittest.TextTestRunner
> +    else:
> +        runner = ReproducibleTextTestRunner
> +
> +    unittest.main(argv=argv, testRunner=runner,
> +                  warnings=None if sys.warnoptions else 'ignore')

This thing about warnings seems unrelated change and not described in the commit message

> +
>   def execute_setup_common(supported_fmts: Sequence[str] = (),
>                            supported_platforms: Sequence[str] = (),
>                            supported_cache_modes: Sequence[str] = (),
> @@ -1338,7 +1348,7 @@ def execute_test(*args, test_function=None, **kwargs):
>   
>       debug = execute_setup_common(*args, **kwargs)
>       if not test_function:
> -        execute_unittest(debug)
> +        execute_unittest(sys.argv, debug)
>       else:
>           test_function()
>   
> 

Why isn't it simpler just to add argv argument to original function, and on "debug or argv" path just pass unittest.TextTestRunner instead of constructing the object? Why do we need new class and switching to atexit()?

(I think, I'm OK with it as is, just wonder)

-- 
Best regards,
Vladimir

