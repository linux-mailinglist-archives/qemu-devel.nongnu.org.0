Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBE23465E4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:06:21 +0100 (CET)
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkU0-0005O5-0z
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOjW1-0000Gd-1C; Tue, 23 Mar 2021 12:04:22 -0400
Received: from mail-vi1eur05on2106.outbound.protection.outlook.com
 ([40.107.21.106]:29920 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOjVt-0001dY-IE; Tue, 23 Mar 2021 12:04:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5voD2TakQn/R5fhW9qIlEjgArcAEL4ajXObcZppEgH7rCZIrNAy0l5+wow9ce9IStavyr1hsvYwtcgejbELUpwZksA0RDwRXjAIm0KmDoKQUPsjiVWknmu+1yxM7TVL9JMGXDUbiSURM4CdNcgaBi4MUA+Y33Mi64ueJ4JtqeQieulMBj08vlSZMfoJ23yXg3sEWhwbZOvbWuGDDIgU/w5kia81Zhf3Z1+rqe9bPOi0TfgxpWxVaSsP/4KxI6XwWoR9vy4gnTDXMRkr0n2OD8NiTfVt4laS9mVl/t0mKBUPdUVwkzj1tHLVeICJs0MsLVsjhd27AUZma8koWamMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CydJbAC+BjaknKh3zz8MFGNBUZ/KS6o732zYK00WNeM=;
 b=kWLnsmKNNjfehRxI73HtSiYYa0ES3l3qnVVL9rgKc/Go1BRU4fckVzn8uAXLmjUX7LkIINP9kMafx9ocWoIhc5zOEYHLB3NUKIOYwj1k92TGGDlmA5+QZMLn1VHKGgs0kKyL6Wpx9Lfm4/eiXEjJQNAc+EpoZIUJDXhnlWItVxi1CaDxK+Q397X2ne34wxlwMCCxTCZOJwcqe6i0vCEudeSLEWHVManUeCq8M7/OO8eHSE2vJQGkLSuuTthVG1tYkKOs+EklGmtsPm1rsllM7dhhSqRx4MWfvMhEoMLZS2a8s8dRSokVhEiagtBQPgWWFvfWw2G2phdQuukw3eqgAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CydJbAC+BjaknKh3zz8MFGNBUZ/KS6o732zYK00WNeM=;
 b=lsEnHV2A2mu4wn7FFqqWKZRrpidz37VM/IxRWXPfgsxUbWT3Ebff2wG+K1pkCkVQ3xqRsuNONRhWNRTi2A1CEzhOVH7aXXPfmMol7+TdI8qmHbIYRMTBDbJwAknJye+ZPPvjUtmg1eFsFdl00xzjpjeIgzWh1MBsOJiZET2StkA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2529.eurprd08.prod.outlook.com (2603:10a6:203:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 16:04:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 16:04:07 +0000
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
Message-ID: <4a14e0b0-830f-932b-4475-50682cbbda4e@virtuozzo.com>
Date: Tue, 23 Mar 2021 19:04:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <97e7aa7e-dcf0-17d0-3a4b-2d293e9c89ed@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0086.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0086.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Tue, 23 Mar 2021 16:04:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50b37616-a075-4a7f-9040-08d8ee1549b6
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2529:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB25290FF1D97AE85E52442F34C1649@AM5PR0802MB2529.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6eAYC5DR451c9WQwTaXiyF7dawJRcQ8XTQ2jnyhnpg/I6eveRozUtfWh2rQmv6+N0nbxNpmVzTKZcRQva56zQmnHwge2/9LJHDPUMZyrJhqBrvAlFdQtFkmGgm0qbAl3Sh9j4xRdHCLOE7DL+nH43+GeQ1UhvgyUq744PUZCxrFHm8znissqR6MN8CAt/aZATKE/HT1iWzEc4neh8TUth34tNfGQOZ7XH5HEAw8mPG5t8gx8o7F1oiVUc+9igdkH4K41mvzD3Mz/YgEEOvUDQln7cNoF0YTBAM67SUZK1mPaqgqTOu2sGw1V6u0dbkp6EL/AfW/s4R3sJsHbSHdokQTPF1831ck6DfCoyd7ELhmep0/NBwcCqOjRPh3MK/ns90L1Qr9aVY5pctgYAvfFRDmTElFGvtfPM390i6uY/mQmGKxotscRS5JZ2MnaGY3zhaw4TdchpAypjV7EtXlCvIlmclcKqXi3eElmmJGM9Jn/t2BJ8SGGw1xtVDhhDcTaJA17Yhda7XsWy1qFd2EC8uu45fV4so4veVt9RNlAcNbdmoBqsulBi/sDjsBGn/grwVPQatj+ShMixoa+MsD5XbtwBPXT6f/xyrWTzJQ78Ij36h291tFpUUXzNzPKEoQtnGqwGbS9hkrS6xUeSb0xIUEruc6YXgjNEI+NsckBZKCCLUZ33hnOJxP0FdADh6Ii1NxnsdtqV4yQAMKKRydwQoezI/lQREOgTl8gJVJWx5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(136003)(346002)(376002)(396003)(66556008)(53546011)(66476007)(4326008)(2906002)(83380400001)(52116002)(66946007)(16576012)(316002)(5660300002)(26005)(16526019)(8936002)(6486002)(36756003)(956004)(31686004)(38100700001)(186003)(8676002)(86362001)(31696002)(478600001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SnN5SVZaQXdmVUNxaEd4SjNhakI0emgrMGRTM0pOSnlqSUVvQ2FkZk1SVSsv?=
 =?utf-8?B?TlorSmZvTENQWWZCYzNXb3c0WmhSRkJnNzhaanIyR0lKaG9jdDFWelVtMCtN?=
 =?utf-8?B?bFMzOExHLzB3QTM3QUlhOFdnVkhsVUpjVVMxOWYzUkRabFlKZm5CdnQxRDRI?=
 =?utf-8?B?VHpHZzBPa3I4enpROWo4UkVzVVB6MnlRY3JqTllaY0xvOE5VYnVLQWx5K3FS?=
 =?utf-8?B?blRtL3FhaXJKbTRyVG40L1ZHcXVOckxzOWQzVHdGdVk5UExhNEduZ0p2eUww?=
 =?utf-8?B?UFh0WUNZbytTcVIrWUdCRzBzK3Uyd28xQXpIQnhhUjI5aDB1N2RaTmFvQ1kw?=
 =?utf-8?B?U2JSQXhNUkEwYUpiNnZlbWxmTnhyc2dRNXBubTdVMnVYcHM4OGY1UDFsby85?=
 =?utf-8?B?V2JFZjZIb3p6dFNFN1BqWjdWMjFZNHcyanBaS3B1cHRIbHZzeGx6YVZIUmJW?=
 =?utf-8?B?NzZ2Nkc0ZUFrS3FCaW1oVnk1SklSVDV4Mko3ZjJmaVYzdmlrcHZtVVJtTUNr?=
 =?utf-8?B?NUJmMGVMdGozamhOZXN2VWVhOUI2YnVtZklMUmNidThTVkxubU5KODRheDNF?=
 =?utf-8?B?RjJhaUpuL1NRVDZlbS8zTkloZUxLdTRrbHZIanZQNXFCaGhpa0kyeldVK2Jo?=
 =?utf-8?B?d1hvUk1Yb1hId2l5ZGZRYUNIRXlXWVFpRThra08wQ21CNno3b3RZR2lMbUdX?=
 =?utf-8?B?VURSaWRtemNqaWF3N1gzODBSSzZUbE9hUno4Y05UQW51aEVXeStaWGVGZ25R?=
 =?utf-8?B?OUZLaGVPcWVMSlRQUERVcEpsbU9WMjRJanNhenF1ajNpODJIa1EvdHE2Vkky?=
 =?utf-8?B?akR0b0FCWEp3QW1GK3FKaXBvZER6MSs5cnpqYjM1TENRRUFyTFlMbUI3OVhR?=
 =?utf-8?B?S2YwS3dHdTBRSDc0ZWFQOG9WVE85d0JKdVRlVVk5M0JIWEFGaWdXSHFDOWxU?=
 =?utf-8?B?K0h0aWdqQVgrNzJUQURpYTBNYzZnNUJGMDZ0aGtGNzljSTV4QS9jR0xQSmw0?=
 =?utf-8?B?SmhmbVI5K2pZODY0cG1rVUlVWVphT0wvemEyQ0RHc09nOFdqcUpCYmdyZllB?=
 =?utf-8?B?Zkg0dFJiNHI0NzdJUlFIOCtCak9xQ3BVN1NucE1hWFBqMHZQb0hHbytxRVpZ?=
 =?utf-8?B?eVdyUmdJSzI0cHZpQmFNOVduSUIrditoVlNRYlAwUWFjMjlpbVRkdXJSdmNx?=
 =?utf-8?B?TFQ2c3JVeEVKZmxURC9MenMwVW5ac2cxQTFsZFJNRllrZTZvTGNWbFU0N3ky?=
 =?utf-8?B?NTBzOWNHY3FLNU9Wd2NObTZ2QnpaNUF5SmlXdUZvNTU2L2hPOVV4WUpQRlRj?=
 =?utf-8?B?ZUYveHZpU1h6UlhhbkJJZnhnQmxhVjltbHljZEREWU9QN0o3RlVEQ1NPN2NS?=
 =?utf-8?B?bUxzbTRYK3RoUndYcFpPTkYyUmdndjE3cWV3NDNiOWs2azREcVdBaGNNMWw4?=
 =?utf-8?B?MTJUNjRmVVBLbm5ETVF5UFE0V3ltdWNiaTRQRmFpVEpHTlBnRlRha1MxWWMr?=
 =?utf-8?B?b1U3dEVXcC9MZis3SnN4eW5OcURpSDBReFA2b1dWZGgyY1pLendhN2FHYjkw?=
 =?utf-8?B?ZS9Xc3BCL3U4a3BjeFovQ2sycUhSckQ5MFlURlRQQ1c1VmcwTG5PempTZ2hw?=
 =?utf-8?B?ZGdaQzNWbU1iMS9SM2o0dHlYdTNjdEY1YkF2SDgzRW9DQTk5OXlvUDRaTk9P?=
 =?utf-8?B?YXM5WmRhcGd3RTByUE1KTU5xbUI1TnlqU0ZUemVXbEdaUU9hc0VwTkZPdk5a?=
 =?utf-8?Q?OCuQVf1odbxs3mPKXcCMmwyKdW+Rs2fK4CF3sEi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b37616-a075-4a7f-9040-08d8ee1549b6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 16:04:07.3490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFzTyzDzK2mJcOi8aLojEUQdQPQNjnEYlA88HCpnKNd320jGaTRiKsQNwCdhpdjbWW/I7KipH9U/zBSX8QUibmcvGhaOYPc2GLm0fqBewVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2529
Received-SPF: pass client-ip=40.107.21.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
> No, this is checking if there is *more than one*

Ah, oops, yes, right :\

element in argv, because argv contains the program name as argv[0].  It's trying to catch the case of "./run testclass.TestMethod" or "./run -v" and not buffer the output, but it sucks.  Really this patchset should have been marked as RFC.
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
> mypy complains because you set the variable to two different types on the two branches.  So I decided it was cleaner to write a new runner class.  I think this is the only remaining part of the patch that I like. :)
> 
> Thanks,
> 
> Paolo
> 


-- 
Best regards,
Vladimir

