Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A95300675
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 16:03:37 +0100 (CET)
Received: from localhost ([::1]:39344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xyK-0000ED-9q
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 10:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2xwP-0007OE-Rz; Fri, 22 Jan 2021 10:01:37 -0500
Received: from mail-eopbgr70093.outbound.protection.outlook.com
 ([40.107.7.93]:30494 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2xwM-0004Hu-4a; Fri, 22 Jan 2021 10:01:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBW0Si7r17Kpk+98zi4+r+d5U1z+4iLJwCbBIQ4tL/T3VEJeTj6hx0mll5wongme8dk8b7NxCkCarAx2bIObBsTVlmkvecEQK94ih8E5QA6Zr/MDyIdDd+m6W2+CGBJXYWXqCo2B0zg+RUo4jkeSOt/BA6cLxmLXpEugq8HLuPH4bFxjhXN2Drq6XGdXP6tWT1r7ZFUAH07zxD1g/GDFPrF54vx3gapZ5Z2oYzCWs/1fcKP9yrXq0lseolx+E2GttsRXhAUd5XvMQcMXaSGBCepBjsAS583DHCYqzp/bgUROxbPy1Ase+HuKh66wCzrOVY8W1FCGaPay4AKmT5lHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gQV17EhGz9GsJpM0vLvqtKNR9JqsgS2bFB4sqd9MIg=;
 b=FfaXrz7zTYf6xcE+FO1pMke70TuNGnZa5OPhSkyLnTOZZvlh+QP7sli+U24IBdbtY+6JlyHlXoDWf9WCSIBoTZPMCmT33IlcqauiuX98RiWiSTRRrc99hsB6LL+51HbACggFnvcgTUOrnuCXuX+zej5DeAZ3msGTVf6sPnR7k0FGahse6Al3RKoEMSYjA0BW0b0djcMo+mVr87cHUCA9Pa9T3WjRzYuWM5Y2BwqR11YDJzWDfG74ky+pbuEQVdSJiSWoFYy+omPzigXgRsici5oc1MN8xTY55Dzb/fl7tA+iqpUKaUqGtsQvHPFqkunoVuZ+G/w43xrNLnKbsCeZ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gQV17EhGz9GsJpM0vLvqtKNR9JqsgS2bFB4sqd9MIg=;
 b=ox24a+Vuh6lmLtB7fGQi9xasZEfoDBkdxpPWAzKL7KIa5PY7MpQ6lhKAIibYmEETlArViWanHulodQWdBivI6OyHEJMi2bg7nyzgIDhBXf+IytyGNG18rqoyNG7V5iUQV4gzw7O497nHAMxwWFPSU3oCm0kxK0LDQ8hjDUX0Pmo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB2925.eurprd08.prod.outlook.com (2603:10a6:802:19::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Fri, 22 Jan
 2021 15:01:26 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%5]) with mapi id 15.20.3784.013; Fri, 22 Jan 2021
 15:01:26 +0000
Subject: Re: [PATCH v7 09/11] iotests: add testrunner.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-10-vsementsov@virtuozzo.com>
 <20210122145126.GI15866@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <98304654-d63d-b5b3-8f25-c954c600b095@virtuozzo.com>
Date: Fri, 22 Jan 2021 18:01:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210122145126.GI15866@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM0PR10CA0024.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::34) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM0PR10CA0024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Fri, 22 Jan 2021 15:01:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbfeb642-78b2-4ae2-ea2b-08d8bee69728
X-MS-TrafficTypeDiagnostic: VI1PR08MB2925:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB2925891E6D8CDCED691558D9C1A00@VI1PR08MB2925.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VdwuIQN+goffB9rrAfZiuWpBic9dYzGf+gfQviCpOcm/QY6DcyE/gcqFZu+GOwrD0FEramx7qmxVLrnVZ4TS1xC6I34E8AqFZUa0+VLf0KfGsrIjPDJTwrzs80fndECa04WfrMXf/vkQuHMkpGOwOpyQDWXTcNdx/fIjtf4lZ+AGER5QdqFiz1E4kxYn7vd+RJDQosijjF+qfnqFskPydoyVVmRKYHtAyXVDKQwEL08Fy1VxZ62F/GJkhUfQ3hJ0m8lk1hA+GVhvKaKbJF2+2sDOcDH3qRSDlMJf9M49lDeI6S5ie+cIeq8qfTmybyn4R5Gpr6kRj6RMiQx7yK0pxYTzR5ZPPEma/keukLJRnb+r7O3cxld9d+E0n0iDBthI++4MFOr/zTfNCokWDWtF0ZJM16vzPSjp2VBSJ3CswNavFO150WS1VwAiEFZcxqqPipOVTS+QawtG8GApg60ma9yDd5TMKGVk8J/d0Ct46uQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(39850400004)(396003)(956004)(2616005)(86362001)(8936002)(186003)(8676002)(4326008)(16526019)(16576012)(2906002)(5660300002)(26005)(31686004)(6486002)(478600001)(83380400001)(316002)(36756003)(52116002)(66476007)(31696002)(6916009)(66946007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MGNKZXRGSmxuR3dPdFJ4TXJFMnlLTS9Ra3lraHgzV20yeXFzek9hQ3RWWWpP?=
 =?utf-8?B?aEVkNEFYZWY0bjV1Z2lZRkRjZWpJRlVsT0U2ekNJTTdyN09qTU82L3luZHUx?=
 =?utf-8?B?c0xlaHBzOUpGd0JqWm9UaXJNTnl3UGVRbWtWMHJIbzBhcmtWS0xmdkQ1NzFW?=
 =?utf-8?B?dTdiRXNTSVVDT3g5QUt4RFBCWktKTzZ5dVhJRTU4UzV3L3lXQ1Q4ZjRhemE1?=
 =?utf-8?B?QU9tS3FwZWthVm10eS9NRnozYTMyV2Ruc0JLbnkyMW5QbXNpZmZqcHFvSkZV?=
 =?utf-8?B?NXFqdDNOTlZjdkNOSisxN1Juai9QVTU5SEhJZnFiNkQwR1N1Nll3SjBjajRo?=
 =?utf-8?B?OS9zanFVR0lUaDNrdmVPU052QmpvN3FZY1c2alk3cm01ZGdPam11ZmJ4dnha?=
 =?utf-8?B?cWxQcW5IM3RXWGxMNnZSbEFTY04rZ3N5OGxvM1BHMzV6UkFVU1crTzRKb1pX?=
 =?utf-8?B?ZyttSXUzWXlJdXpNSG9sR0c5NC9wYUhtajBWY1Z4REJsaHBaekx3cEh2VFc1?=
 =?utf-8?B?NWdUVjQ5QjZMWWQrckV1NkU3VWhaeWFDQ04xN2lrRmFydmVqNGt3VnBqNG9H?=
 =?utf-8?B?RGhUNWJKYWlIR1p0eGxQZ3grU0dTN1cvSVF1VlUxZW5uTFRaT2ZxN2VacjhW?=
 =?utf-8?B?OXN2citNaEVZMS9KQ3FhREZGeWExcVdjc2x3T2dQbm8yalVJdlhhTWdBNWRY?=
 =?utf-8?B?UE95UGhTWnlPSmxpYXBOZFlrWUg0aDlybTJDVWRMaTBLdUdYOE04S1ZpOE1V?=
 =?utf-8?B?Q0d6Zlg4QlhscE53ZnZ2TWFGV096WnJaYXN1WGJqMStuNFRvblA1S2dUT2FE?=
 =?utf-8?B?QmlQRWxoKzZJSlYvZkMyc1FpZzROaUJreVhUbldjTnhQUzVIcnVBNm1Dd1F1?=
 =?utf-8?B?dnhLVi92TjBHRWlFYzN3dWFBNkt4ZFcyeWl4bE1IbVQyb3orZDR3Mlcwa2ZG?=
 =?utf-8?B?by9ZamNhQ1R3Q3I5S0VhMWRUYjdxdnFuQXdwdkFMSGNkZ0w3Zm1QTkdBNnZu?=
 =?utf-8?B?UWRqQ1hDRVhlSURQSUhvM3I1WjdVSXBWOXZ0Y256TythRW1EaHN6NjR3LzdP?=
 =?utf-8?B?SDV6SkpHVGVCVVFMS05tbG53eHJjZjBmaUZSNEhtUEpHK1pTK1V5bENPSHpj?=
 =?utf-8?B?Q2tJWmZrQnBxT04yMnlvUWVMbXgzNDE3blpPOGtpSXJtclg0cUZUeDYwaG53?=
 =?utf-8?B?NFdMekZkZXZHeSswL3VlMmNISm93K3c0T3VZRzJZSUhXczVKd1ZVSG81Mnpl?=
 =?utf-8?B?UnVnZWVHVmUxNXRLOWJ4SXFjT3BXMW9aTnRMWm5wTFhydElkY0pReGFCS1lG?=
 =?utf-8?B?NVU3MmhuRFZnNGxISHRHNlNWT0V3Qmt2MllXUmJ3Z0MreEQvSkVxaHlyR2NY?=
 =?utf-8?B?MnlENEtaM2lra2JzbVVDQlE2dnRFN01OQllWWE1HN1FoeFhNSTdNQ1kxMUtS?=
 =?utf-8?B?K2kvQUVxTUtKazFlaDNyQ1lPbnZaVWExMFFTUjl3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbfeb642-78b2-4ae2-ea2b-08d8bee69728
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 15:01:26.2812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbEs5ib8Fk4Yk3AAfmnPcRM0T/YiClvCWDiOTRvsFxdUmQabHhKiKnLpZ5qFq0PJzud3rLW/cgUsn+U/jhINIQzu+5lJbpXRdQhfViE5VjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2925
Received-SPF: pass client-ip=40.107.7.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.01.2021 17:51, Kevin Wolf wrote:
> Am 16.01.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Add TestRunner class, which will run tests in a new python iotests
>> running framework.
>>
>> There are some differences with current ./check behavior, most
>> significant are:
>> - Consider all tests self-executable, just run them, don't run python
>>    by hand.
>> - Elapsed time is cached in json file
>> - Elapsed time precision increased a bit
>> - use python difflib instead of "diff -w", to ignore spaces at line
>>    ends strip lines by hand. Do not ignore other spaces.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Sorry for sending so many individual mails,

Not a problem

> but I'm running into things
> as I actually run the code during the review of the final 'check'
> rewrite.
> 
> I get this output for a failing test case:
> 
>      001   fail       [15:44:41] [15:44:42]   0.5s   (last: 13.2s) output mismatch (see {f_bad})
>      --- /home/kwolf/source/qemu/tests/qemu-iotests/001.out
> 
>      +++ 001.out.bad
> 
>      @@ -1,4 +1,4 @@
> 
>      -QA output created by 001
>      +Broken QA output created by 001
>       Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
> 
>       == reading whole image ==
>      Failures: 001
> 
> Somehow we get additional empty lines in the diff header that shouldn't
> be there. Not sure where it comes from. Especially the empty line after
> @@ even corrupts the patch if you try to apply it.

Looking at it.

Seems the problem is that difflib adds '\n' for lines that it generates, but not for lines passed to it as lines list. And then I work with final lines list like there no embedded '\n' at all.

this helps:

--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -50,7 +50,9 @@ def file_diff(file1: str, file2: str) -> List[str]:
          # and use strict diff here!
          seq1 = [line.rstrip() for line in f1]
          seq2 = [line.rstrip() for line in f2]
-        return list(difflib.unified_diff(seq1, seq2, file1, file2))
+        res = [line.rstrip()
+               for line in difflib.unified_diff(seq1, seq2, file1, file2)]
+        return res
  



> 
> The other problem is obvious enough:
> 
>> +        diff = file_diff(str(f_reference), str(f_bad))
>> +        if diff:
>> +            return TestResult(status='fail', elapsed=elapsed,
>> +                              description='output mismatch (see {f_bad})',
> 
> This needs to be an f-string.
> 
> Kevin
> 


-- 
Best regards,
Vladimir

