Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C673466E5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:56:20 +0100 (CET)
Received: from localhost ([::1]:53600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlGN-00041g-29
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOkL9-0004N5-4W; Tue, 23 Mar 2021 12:57:11 -0400
Received: from mail-db8eur05on2131.outbound.protection.outlook.com
 ([40.107.20.131]:57473 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOkL3-0004vr-R9; Tue, 23 Mar 2021 12:57:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yxg+jnsaxQX/IeQS0vB8YYjm1tZNPvAbRo2ak189nHl4LZVAnmw22+UdWWbhXb/jvN1EF1sLcGUyVepEJBc6ii9M05tXjQ+iX+ob8eIOeTQ3B66KGhwX9SJAZCxWsmY8AR+rv4pv4aXNvXP+dqYDSCJVLZIXJcNL3Q0LF2ofAMzvnV3qL6NQMbJbufajrsUJilAVFRgR2FEBTxKmxte4PLKmbCdkckEte/rg9tHualAfa5X8l+6ZW8uaIm9V9umhutai7nrjv/Y+FfY4tatvoZRKHUSg86PVW7u5VGZyCsrptEejD72ZmjRuXFSrme5x5+lKc3O9bGpp+TAsLmrHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZ8vpIuolILMq+gCYOeoB4XrQ2S8djxUktHnw3Nwzb0=;
 b=CkklNswQnHzkhBKB6IFu7rpsY91l/Jix1LRZf/Ia4z/xJXr9L/pZDuHXVcOiJUUNnp6U2ZAzXqeGWPPbvCPw3kw5TQq8rKkyOqMQ23WRUG5QTb6dYKxXF9ML6GtxFCF9N6n8O5EIw7GkWSLTUAHARd2RRKtuI8/VWWN/WQ+/0fti7RrRnH2k0nW6qEvsOi5qyahYJj2n8JXuNz25C94CrOgtsn9JzSzN4/tLujducYEgajGebP8babsjNdGP3vVE986LiWaRKhgDxcxJ2V7Avqx81FmIDjHNDtid7kq4wvXtFvviiOGuRa69ANpEaUETbRBfViINFcJpOU0AnizgRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZ8vpIuolILMq+gCYOeoB4XrQ2S8djxUktHnw3Nwzb0=;
 b=GHKpLA8klKH/Ei+wvmueyF3F/nxJDj4lnP4Oa/tDi13Md0X3KhLWN8EFIZDAaeKtR2XYEx+2QXaQIUl3NVwoZL8aBOVvYrUB9yZLDwy/GcfTykKqIwiyZL5Sn7IDJ64Yzaf3ic+OG5ivJZlLBYSCBmIOOZM/Jq9hqHlKbkXvm4c=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1651.eurprd08.prod.outlook.com (2603:10a6:203:39::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 23 Mar
 2021 16:57:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 16:57:01 +0000
Subject: Re: [PATCH 1/4] qemu-iotests: allow passing unittest.main arguments
 to the test scripts
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, qemu-block@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210323130614.146399-1-pbonzini@redhat.com>
 <20210323130614.146399-2-pbonzini@redhat.com>
 <f2d648c7-1b80-bec6-f17c-78d36cf998b1@virtuozzo.com>
 <97e7aa7e-dcf0-17d0-3a4b-2d293e9c89ed@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a51c2d8d-cc9f-705f-2527-857a791e54de@virtuozzo.com>
Date: Tue, 23 Mar 2021 19:56:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <97e7aa7e-dcf0-17d0-3a4b-2d293e9c89ed@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0048.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0048.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Tue, 23 Mar 2021 16:57:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2ab65ed-1e12-4499-2de1-08d8ee1cadcb
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1651:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1651486B8CAA99F0FF5E8936C1649@AM5PR0801MB1651.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x7AtvudIdhHtD/GfUlFbdmHTogSBTrt+UoFb+yD2H6kqq2GJttlqB8mywk9/IYbiJX4ahplv9Bo/MpFDYSL+VTN1RTw1KoFmZ9witttXIGgj5YvnScYu4niuarMfa+aEgskSiUDnp2RZqrQSZa9vOnngUIoHIyFaYWpklRcoZu0Qm7LNqHOKF0dfT9GyOEavAERkhips/7QPFlbT1TY0aObSEIyXU8Q/KdOQ8sF1MtwKMINHaHJa1Rp6mP+Ey/x1xc1fKpodm6j+9aucLSr0rK3ZnGhAJ/6ZQpEPFvEJ29RZcJ0Y3WNhGf0zpa58CDYNgzH7iOw05Ao83mf0ATGT45p3hyBG58A5yvNPQoCFtF6HgGXKGIqTJDGV4+Spq2SEXV/cgeS9pjjprsqA/nRAwgK0Oqm4x9WLsgfhvevP9ryKqOrpeyzF8i0KpWvtw1z9nbkNN0iavXWFwOUQ5cfl4SBleE/IIIMVDiic+DrdVRsEv5h1sMGL2K3anpjOi3LctA8/uqQchfwgOXLW19QC/O2iCbn0O0CUhYDMARWcI4tkBs1L+lNEz6Zm17e/baE7D2bUDHL9uQZUzoDReezoXL+uYuNXW1lZ5ppiRaVWQ1yCPaTenAALVU+24IMzr1IUxj001uJk/YRDkcdtSj3gEVc5udkXj9ZYWu52snWXu0MwRcSmLRy+hAz0iUpGGilBfrYwo1OT7yS3N0T/sZEGFNzt08kf0Oz4vtVO5JAX8lw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(39840400004)(136003)(83380400001)(5660300002)(86362001)(186003)(2906002)(4326008)(38100700001)(26005)(31686004)(8676002)(36756003)(316002)(16526019)(16576012)(2616005)(956004)(8936002)(66946007)(31696002)(66476007)(66556008)(53546011)(52116002)(6486002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?djYrbFFlOHp1cURTWGRibG1QaTFha3JYN0tpL21TSjRQWEpOVjdILzM5UlFW?=
 =?utf-8?B?WW1NWG9XYTI2K1VadFRUdFBqcWhvUUNsZkE2STNzSlg3MVoxM0hjL3AydGNz?=
 =?utf-8?B?RWdwL0d6YmJYWWZGTzNUQ0l1aG5qUGEzWTlvUkdpSFB4NzZPVTlyNGwwZVdv?=
 =?utf-8?B?cjFNc0M1NFliQlcrL3hJbUo4R2lFN0tRWloyZGtDSFJrYkUyQnA2WTVtQ2Ey?=
 =?utf-8?B?RU9oZkJxNmlMRDczb3lqNXBtMkNobStVcWJTNk5PMzd2dURaWHg2TFJpUWIw?=
 =?utf-8?B?NlFHYTBPUUFqdnMyaGQva2RkREJ5d200SlZ4T1pQbmJCakpZNGR1M1I2ZEx5?=
 =?utf-8?B?MEVzUERkSE9BZ0ZTaFM5c2pEa1E5RnB2TFpmOHc3NFZuaVlUNnBRQ2pFY0lG?=
 =?utf-8?B?S3k3ZjlQK08zajA0Mkkza3o3dFp2QTR3enFFVkZMY2pPd2EvdlRoYUwxYU9O?=
 =?utf-8?B?T3U2eDU0YWZqV3BPajFmYmo4R1lLcU85YmpnNWhmTDNienpwcFZNa1JqcWpP?=
 =?utf-8?B?RFpQOU9OZEVhZmcxek5wQXB0enN2SjNIYlpZclBla2tXZTFGbnJzVkdqMkpZ?=
 =?utf-8?B?eGdzWHcyWVNTcmRtb2xLd0NaRVJOSzlFd2Rvem5ObEw2dUJjOXp0MlZkM3VI?=
 =?utf-8?B?bmRyYlFYMm9mRVh2WkZraVA5WjUrVis2L05ZYk9wb3YrVmJqcUp6aDNrTkdh?=
 =?utf-8?B?L3hkWklnYTRraXZRN1RmN05SdGxrTXYxaDZXZjdITU9wWTJ1OC81SWMzZkFt?=
 =?utf-8?B?dzVQVWJydVJaYlJvMko5N1BjVjEzV1pYNXYwSHN3MWJ0cEpOWFNYdTlxL0xY?=
 =?utf-8?B?dy9MTW9QRGNzNjVYeU52UVpvMkhtUXhvcmRJWlVybkVENnVwN0RTT2h3YW90?=
 =?utf-8?B?NW9wczBSbFZzQ0dCa0I2WEtWY2tISERlRnR5Y1hQTGZvR2p5eDh0N1MzaHpD?=
 =?utf-8?B?Wk5YMUQyZ1ZTNXM2enJjQXlxaVNjL3ZjSk1MVW5WUE9Ka1dWMkpMMnFmTEs4?=
 =?utf-8?B?cCt4b1NrUUo1WC92S0hJOTNaUmUyMWc1MkgyV0pCRG5kbHI3MlU1c3NaVGMr?=
 =?utf-8?B?QWNxUlVvNVZlU25uOGtzT3czQWtsekhtb3ZyYVNPK1NvVlpEM25LYWhHNExz?=
 =?utf-8?B?VDFTK1Q3RGZMcjcxcGNtUEFBcGk3MWN5VU5RVTBQcDlxNDR0QVQyRUlhQmNz?=
 =?utf-8?B?dmhleFNDbWpnYnNyV2drbnlxR2dpNm03S0Y5aS9YUXd5L25BQ09lZHlrQ3Bv?=
 =?utf-8?B?MzFaaW4wUWNUQzRhVDByYW92Mmw2ZDZnWlJpYndyb2xieUV6eVBSVkhhT0tE?=
 =?utf-8?B?ekgxNkVvMHVNaFVnSGk4aVdwTGwvaXJPZVMxY3Q4UDArZ0pPN3ZWM3BlL1h3?=
 =?utf-8?B?MkEwSVlDd0ovOFMzRlk2Ny8zazI0UUFDcmFNQm5vazVLU2FrMGZYeHdGMklq?=
 =?utf-8?B?MElZUGxaYkYrRlY5Q2Q2dXBpNi9md1RiUkxoaVpDWVdhYVYvNGg0bDlhWmp4?=
 =?utf-8?B?dE1RZXFSNTMrVHRDMTVMV3I0eXlXRzVYL2FZbGJINUFjbE1WL3VBLzlrTG9r?=
 =?utf-8?B?dlVHQTk3a0dMOGw2ZENnN2Z0UjNBTGhOUlRtYWNTVkZhOE5oZjA1ejdtaXNp?=
 =?utf-8?B?M1crcFJWUjkyL3J6QStZZ1o3MmJIZUNqRkpKa2xzOGFpSGI2Zm54RHFvN0JZ?=
 =?utf-8?B?dVp1YTVhYjU1RFFvUTU0UGVyMFkzNVBSNG15VUJNK0s4OHJZYzlKNmVSL0dZ?=
 =?utf-8?Q?lNrp3zY+ZV7c44e/ZrNe9y+QbJtaKDAflTdiyMI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ab65ed-1e12-4499-2de1-08d8ee1cadcb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 16:57:01.7026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1jGb7ahVuwTlkt8Pl8NZ8boGTkaXBdl4xX4wQV4x3t0PXCqZmfpOe+ojM7tiDPAMB5oPsB2QLwbus7AI+/ziCQuOS2jXFgq+QwOUYT+Ass=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1651
Received-SPF: pass client-ip=40.107.20.131;
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

23.03.2021 18:29, Paolo Bonzini wrote:
> On 23/03/21 15:34, Vladimir Sementsov-Ogievskiy wrote:
>>> +    def __init__(self, *args, **kwargs):
>>> +        super().__init__(stream=ReproducibleTextTestRunner.output, *args, **kwargs)
>>
>> over-79 line (PEP8)
> 
> Ok, thanks.
> 
>>> +
>>> +def execute_unittest(argv, debug=False):
>>> +    """Executes unittests within the calling module."""
>>> +
>>> +    # If we see non-empty argv we must not be invoked as a test script,
>>> +    # so do not bother making constant output; debuggability is more
>>> +    # important.
>>> +    if debug or len(argv) > 1:
>>
>> It's native to rely on converting sequences to bool. Empty sequence is False and non-empty is True, just like
>>
>>    if debug or argv:
> 
> No, this is checking if there is *more than one* element in argv, because argv contains the program name as argv[0].  It's trying to catch the case of "./run testclass.TestMethod" or "./run -v" and not buffer the output, but it sucks.  Really this patchset should have been marked as RFC.
> 
> A better implementation is to create a class that wraps sys.stdout and overrides write() to ensure reproducibility.  There is no need to buffer the output in the StringIO at all.
> 
>>> +        argv += ['-v']
>>> +        runner = unittest.TextTestRunner
>>> +    else:
>>> +        runner = ReproducibleTextTestRunner
>>> +
>>> +    unittest.main(argv=argv, testRunner=runner,
>>> +                  warnings=None if sys.warnoptions else 'ignore')
>>
>> This thing about warnings seems unrelated change and not described in the commit message
> 
> The default settings for warnings is different when you instantiate TextTestRunner and when you use unittest.main.  Currently the tests have some warnings, they need to be disabled otherwise the tests fail. Honestly, I don't have time to debug the warnings and they are pre-existing anyway.  But you're right, at least I should have a comment describing the purpose of the warnings keyword argument.
> 
>>> +
>>>   def execute_setup_common(supported_fmts: Sequence[str] = (),
>>>                            supported_platforms: Sequence[str] = (),
>>>                            supported_cache_modes: Sequence[str] = (),
>>> @@ -1338,7 +1348,7 @@ def execute_test(*args, test_function=None, **kwargs):
>>>       debug = execute_setup_common(*args, **kwargs)
>>>       if not test_function:
>>> -        execute_unittest(debug)
>>> +        execute_unittest(sys.argv, debug)
>>>       else:
>>>           test_function()
>>>
>>
>> Why isn't it simpler just to add argv argument to original function, and on "debug or argv" path just pass unittest.TextTestRunner instead of constructing the object? Why do we need new class and switching to atexit()?
> 
> mypy complains because you set the variable to two different types on the two branches. 

hmm, just use a separate call of unittest.main, or honestly define a varaible as Union[] or just Any ?

> So I decided it was cleaner to write a new runner class.  I think this is the only remaining part of the patch that I like. :)
> 

For me normal try-finally is a lot more clean than calling atexit() in a class method. It's just a strange interface. Prior to the patch user can call execute_unittest several times and expect that output will be printed during the call. After the patch outputs of all calls to execute_unittest() will be printed at program exit..


-- 
Best regards,
Vladimir

