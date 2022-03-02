Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B562A4CA5A2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:11:41 +0100 (CET)
Received: from localhost ([::1]:36696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOlY-0000DY-OE
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:11:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPNCk-0006rG-2o; Wed, 02 Mar 2022 06:31:39 -0500
Received: from [2a01:111:f400:fe0d::723] (port=63360
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPNCg-0000JG-Sr; Wed, 02 Mar 2022 06:31:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5bvHlItt6s99enIfMhV+MSKxXKmO1uW10STNOS4q65hGEThiwc1eYGX+drqPbX89nEUAXV9Y5XhNMSd3SpqpEuQbsG5NjE2u8qoAwfuVxp/ZNEjB/9AUUeB1fauIQBkDHyIl3iZPfN0mxw0bTdXoGfYKtr+HIE/AEdGsOYXjxQ+ZvtYu2KzWEAnx0cPIsMTZcOzUMVEkrLGAWI8ly2Oi0rNjh2qfAGBtB0FwocMs2YrcXroiqUfBrYAmTaJPKyPs4oQ5EMXAhvtcgdQO2gPNP7qMixFeo2CyypXOboO+WBu9doLNVztzMEygyKfkO/oPwsGk2CF0F2GfFKxZiyDrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhMyPqqww7eCaaExBvQCY5SctMoEYWimhcqj0Q2mm1E=;
 b=mu6FN5GvrzcAziBIGH7puYSRze9ZZy9Ks7siXZIBPK4td673d5i6vyV3s+e5YYmDJvjC3TvlgxIyNXqytr8LahIxJ6j4bN4lOUnbeTCOCrzqYm5/yRRVhyQhHMRfPzvykCWSTbeSy2RZkbe47Vm4+KZBHCWKgiuPBsXmpCQ2+kpDCQkRC4P9OdJ1pZ3FBHtYNkqDxUV4T49GRm7a7jf2GGvUF+lU/R1cZ8p2WD3qPSfK//zpcHhOcttfRF+F6bi+s72HRv42wJu3r641Y6Hm2Y33kt2Xphz1VsRqVUvuv8AlNcYFIjcv9BJCiGBCsP2DPWS5mJ1gQI7JP+4j2G8Pww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhMyPqqww7eCaaExBvQCY5SctMoEYWimhcqj0Q2mm1E=;
 b=vFq0kqT0t7tMY6CZAK71lXu17guIQ3zVUqEdXU8SUAypbWE1ABguYfJ1L22wr+OrHZOM/6SQF/cpK0Pf/7Sy9LimfUcjHKIVXvUR+jSM3Y+9BxkX823RQSLh8dXPaX+L0PzXQrJ0YDoNgXv3a0p68Xasxe1Wz0OJL9VWwicRo0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PAXPR08MB6445.eurprd08.prod.outlook.com (2603:10a6:102:159::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Wed, 2 Mar
 2022 11:31:30 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 11:31:30 +0000
Message-ID: <f2955b23-4b41-7058-afc2-b36c561096b1@virtuozzo.com>
Date: Wed, 2 Mar 2022 14:31:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] iotests/303: Check for zstd support
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220221170845.628429-1-hreitz@redhat.com>
 <20220221170845.628429-3-hreitz@redhat.com>
 <e4e63939-d4c3-795b-1270-0d3f74477ec3@virtuozzo.com>
 <17a2a9e8-b0a0-8cd0-f3e3-4e4d71437d45@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <17a2a9e8-b0a0-8cd0-f3e3-4e4d71437d45@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 811d8936-ecbb-4348-2637-08d9fc403284
X-MS-TrafficTypeDiagnostic: PAXPR08MB6445:EE_
X-Microsoft-Antispam-PRVS: <PAXPR08MB6445D1BB9FE3893B9DC2A6AEC1039@PAXPR08MB6445.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tETGuDphLEo5ZTn8NWONrYEpy8HfCZ+lvfYs6ixZHAszTyG2FpDHDe8/mJZaF+81pQX7tfvvp6IJTMsXfcSqwEIhaS37rqG6XwCB0yw8/Y/77UER50NAjTMnOo+p9krJ5yBC4R/RRLQjDPCgsK49LuZjVI9p2lVukGwGFWtNDkviNs5fG083p6lZQnPjU6WRE6jRVE8BupKPTkmKVK0eOQ307QdA1JPvnBD8EaKyg3WyDvBF8ZsVtaC6PB5klhg7YeGgto0i/VeYleTSdLSmhu4DxbU/z8f4iJELttrxZ2xBBELihjx74Y4PuR2CvyUowbseGdzwTVf0j9gc01CGHKEAuWlkvsgctuiThPMs3ZAWx6J5UzfdfmGBqk7dBLhJ9gPUAInLP+sD+wip0vTCpNJ5JBaG++JnEIYtx9Si9tCCJnbk1CrNvqz7SdIPoyC0vSBZkX2Yb5dG/9SxR++KOcX13Cg9l7G71H1lcJHxmFPUiizJ8cSZysnQDYSSBw9L9ySb8DCmLy2QoqGJk1uTk2D2XQk20Z+RfrDpm+a23PABOkokwPned5xwAvn2eJ3ulamC41GGFbwRX/tHL0yAKrV5ckBLibbjQd5y0d7SwnWCVzvg7KE0OOcOK2WjmJUALFfaDJw0z1F1Pi3Q5mUtbpmggnjzzIra7eW7JQKjOW6t7knlmKIllpMRzOqAhTXrvdEgL5ZiZ65iKD2IosAam9jCnu4beX5U/e+py7TybBJBP0eOTCQ8mEKV5mILFIREkfAQS2WTsKX28W/l5OCJJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(36756003)(8936002)(5660300002)(6486002)(508600001)(8676002)(2906002)(186003)(54906003)(316002)(26005)(38350700002)(38100700002)(2616005)(53546011)(52116002)(31696002)(6506007)(86362001)(6512007)(4326008)(66556008)(66946007)(83380400001)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1JvRDZkWWFMWUNwLyt4S282ZWEzRUprSEg5UnZzNU80Y0ZacmZHYndVQ2oz?=
 =?utf-8?B?cVFDMTJKK0s0N0ZpK2c4UzVLb3FLWSsrM1k1Z3ZjWERJaHQ0TkxFRC9zS2ow?=
 =?utf-8?B?b1FoeVBLUUx5azVTU3RaTDNQTjFzZjdTSnA5WHU4NnpBZFAxRkdsRzNKTnJL?=
 =?utf-8?B?S1JOV2tHVUhFL09rcXFoUDhyYkVlVTNrTTloTFBLeFRzV25ZTFlnWWdLeGFI?=
 =?utf-8?B?ejNiQTdnTy9QZ2JzaGlpSTh1djBOd1VNdFdrWldPL1hwUjRBRVV1eThkYjhr?=
 =?utf-8?B?T1c1eDRTdG1oTi9uTkM5RS9GUy9VU3AyeCtvY0xCWGRORmJPSG4xS1RZUnoz?=
 =?utf-8?B?L0l1OWxXUnEzVzlUbUY4ZlltRnZ3algyTGtwcm9FZTdhVEpuYzdGYkRPN0pv?=
 =?utf-8?B?TXN2Q2FYNlhMZFg3TkxIb3ZQUU1uM1JDWXhSYXlnUkR1c1R3QlEyd1QvMWRz?=
 =?utf-8?B?c0hJN3B1VUlpNEtuY3lOT2pNc1dMNjlYR1h4eXZlcmU3ZHVwVmJTeUpVWDho?=
 =?utf-8?B?cXJ3YmxGRUNTc1hRY3dYZys5QUFsMHdyTzduazlaYW9WMFp5RnB4L3RyYjJJ?=
 =?utf-8?B?SWhkTmRjY0ZoWEdnYi8yT0gydEFwN0ErV2R4dXR6K1FOQk45Zld1RW1UWm40?=
 =?utf-8?B?Y2JNMFNCcTliWlVTRkZYdzhnRUdHTkxOUVNxbGFpcGxlS1hTTjQvWVlSQ0sz?=
 =?utf-8?B?SE0xbWlZTWdtVXdPZ1I0STNJNC9YTG1pa2hXdVBoWlRINnVLZkQzRDJERmtP?=
 =?utf-8?B?eTljbS9vcXVCOGIzSUtPaW0yZ0IzK3NpZHpkdGFvbndRVnhzMlJweUpuQWFv?=
 =?utf-8?B?dE1vMnMzMWVJYlR4dVNZSWFnUlE3QTArdlk0R0VxdkNpd2JMZEcxMGl3TTU3?=
 =?utf-8?B?b1ZNR2EwcGhydnh4ZzZPNzBwQ2NFMEZqV2NYS3M1alc4ZiswMXFwUXBUamxZ?=
 =?utf-8?B?Vm1hQ3l4OUZSNXlqT2h1RGtxRGQ3WkhGYU45MmRnTmpJQ1JNMllzNkdlL0Fx?=
 =?utf-8?B?ZlR0NGNsNXVoUFFWM1ZPUzFZbkd6R2FaNnJ5aXF0VkdyWExKd0hWWjRaTG9K?=
 =?utf-8?B?Q3RGNWZ6Tkl4M1lLdTFpcStNZGJ3MVBrQ0ZsY0JpR2ZtUlZnREJiWm9Dekpv?=
 =?utf-8?B?M0VKbGZDR2gxa3dmSU1jc0JnU1pxeHd4NHlDTGJFbUlXeWtOTFBrdEppZjFn?=
 =?utf-8?B?R2s5b2N1Y1hZZ0t0dHc0YnRiZXhaOEFwSlRTNE02eU9wYlBzbUtjbnliNERQ?=
 =?utf-8?B?aUIrRHNEK3V6bUdPa1QxUWtmb3RycFhiREw3cVl6NlBHZ3Rrd2VDRTRSTEoy?=
 =?utf-8?B?TzQzS3JXdlBhbUpUNVJRR0M4dHNmdzdXelNUcWlrOUtjOG1DSkVJb3ZZL3lT?=
 =?utf-8?B?VndqS3N3Qk9lVlcyQTZqdXVkR3FQdW9QcWNFbmlUbHhsZTZuaXBCcHFTbEFk?=
 =?utf-8?B?NUV4Z05EbUJYa3owOGtURVBKVWI2aHBYcHBjaFVjU0NMVHJGaHE4U29JZnpJ?=
 =?utf-8?B?MnZ1Yi8yU2dFTDk2Y3R4RlVLOWVDQnZHNW5qdHRiU250UTArSytMcHBrL2N1?=
 =?utf-8?B?dUZtbHFBR2VYQzRsRjhRck16eGRreDBJVkhKaEh2RXBNaVFnSVc3NndWdWVO?=
 =?utf-8?B?UVdlTTI0aW14NUZ0cWNkZzd1dzVFWG1qZkZuRk5UbEZrN0R3RmdlcDc2dXZt?=
 =?utf-8?B?b0w4bnZXTlRSY0hlOWU0NFJBcmQrYzJyeTRqbXNxQjlyTFlQSnpFQjN1QzFP?=
 =?utf-8?B?a2hPTk4wZTRWMndzQ1FORU1UK1FTazI0aENET0hhR1hZZVpZVmx3ekVjT01k?=
 =?utf-8?B?anlQV2szMTMrbjdoOXY4TkNtYzdmejdOd1B5a2dRZjRUTmNtNDJpdmsrYld5?=
 =?utf-8?B?bmViQ1o4YU5zbmZFalNnaUZuYUF2Qi9uUUFpZ1JZQ3VJN0M4ZWoyVnFhVEEz?=
 =?utf-8?B?SmdYc3VPSU0yZGVyTnB4NlZ5eElKV0J6V1RDZHpKL3IvT0NHL1FTckhDdEdh?=
 =?utf-8?B?MEVZMjlLMHhqM0dRNFo5UFgrQ0VNMjQ5ZUlRY2E4RnFlMkxtSjIzZmxBV2gz?=
 =?utf-8?B?SlJiV2Z1VFF0V2U3My8xTTEwQ2F2ci9XRlBDeVo3OU9aVHZqcmRsWW5pN2tl?=
 =?utf-8?B?UWZlQW1LYVNyZGhtWXp3VExuVXhBRmJWdW1ueFFMTnBneHRMQ1J3TjE1aTlF?=
 =?utf-8?B?WUEraTAvM25adCt0R2U1LzJrWFpQRzRxcHFRNjFVQVlCcFQvVmtpb2lBbTRO?=
 =?utf-8?Q?XB9jE7972ohVMpQDrPZIipVwGK1VOz25qrP5+BBH2I=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 811d8936-ecbb-4348-2637-08d9fc403284
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 11:31:30.6513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHzAzW19n0efrUDBhM+x9D/4G2RwVxEzytAviNWCSNWOteRiClVyIACU+Uep/hnTHHxpkk5PK0dWZ4bSv/60UE0ml4KkSUAqTBmrf8tsLZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6445
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0d::723
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0d::723;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

02.03.2022 14:09, Hanna Reitz wrote:
> On 22.02.22 16:55, Vladimir Sementsov-Ogievskiy wrote:
>> 21.02.2022 20:08, Hanna Reitz wrote:
>>> 303 runs two test cases, one of which requires zstd support.
>>> Unfortunately, given that this is not a unittest-style test, we cannot
>>> easily skip that single case, and instead can only skip the whole test.
>>>
>>> (Alternatively, we could split this test into a zlib and a zstd part,
>>> but that seems excessive, given that this test is not in auto and thus
>>> likely only run by developers who have zstd support compiled in.)
>>>
>>> Fixes: 677e0bae686e7c670a71d1f ("iotest 303: explicit compression type")
>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>> ---
>>>   tests/qemu-iotests/303 | 15 +++++++++++----
>>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
>>> index 16c2e10827..5a3efb4ba3 100755
>>> --- a/tests/qemu-iotests/303
>>> +++ b/tests/qemu-iotests/303
>>> @@ -21,7 +21,8 @@
>>>     import iotests
>>>   import subprocess
>>> -from iotests import qemu_img_create, qemu_io, file_path, log, filter_qemu_io
>>> +from iotests import notrun, qemu_img_pipe_and_status, qemu_io, file_path, \
>>> +        log, filter_qemu_io
>>>     iotests.script_initialize(supported_fmts=['qcow2'],
>>> unsupported_imgopts=['refcount_bits', 'compat'])
>>> @@ -55,9 +56,15 @@ def add_bitmap(num, begin, end, disabled):
>>>       def test(compression_type: str, json_output: bool) -> None:
>>> -    qemu_img_create('-f', iotests.imgfmt,
>>> -                    '-o', f'compression_type={compression_type}',
>>> -                    disk, '10M')
>>> +    opts = f'compression_type={compression_type}'
>>> +    output, status = qemu_img_pipe_and_status('create',
>>> +                                              '-f', iotests.imgfmt,
>>> +                                              '-o', opts,
>>> +                                              disk, '10M')
>>> +    if status == 1 and \
>>> +            "'compression-type' does not accept value 'zstd'" in output:
>>> +        notrun('zstd compression not supported')
>>> +
>>
>> Could we make from it a function in iotests.py like has_working_luks() / verify_working_luks() ?
>>
>> Then in this test we'll simply have at start iotests.verify_zstd(), and in previous test we'll do something like "comp_type = 'zstd' if iotests.has_zstd() else 'zlib'" in classes that wants zstd
> 
> Well, to be honest, I deliberately didn’t do that.  We have qemu-img create calls in both of these places, where we can simply check the returned error string for free, basically.  Adding a function for this check doesn’t really reduce complexity (now), because adding such functions probably has some more LoC than just checking the returned error string in these two places (I say “now” because it’s possible that more places are added in the future, though, of course).  With zstd support compiled in, such functions would effectively also just add a superfluous qemu-img create call wherever they’re used.
> 
> I’m not saying I’m right about that judgment, because it does feel a bit like premature optimization.  Just saying why I didn’t add such functions.
> 
> So, with that said, would you still prefer such iotests.py functions? I’ll absolutely add them in v2 if you do.
> 

Yes, I think better is to have generic function for such thing:

1. These modifications makes tests more complicated to read (OK only a bit more complicated, but still). And they break common practice that, necessary features are controlled by verify_* functions, parameters to iotests.main and so on.

2. I understand your doubt that we just do an extra qemu_img call. But for sure there are solutions if we want:

  - At least, we can call verify_* function once and cache its result for the whole test run.
  - More, we can group several verify_* things into one qemu process call, to do different checks by qmp commands in context of that one qemu process test run, before running real tests.
  - And about zstd support - we can even generate a file with some environment variables as we do before (remember tests/qemu-iotests/common.env.in), and meson will set a CONFIG_ZSTD variable in it, and then in iotests.py we'll know, do we have zstd support without any extra qemu-img call. Hmm, and probably when we run tests through make check, we already have this information (I mean CONFIG_ZSTD).



-- 
Best regards,
Vladimir

