Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1650A32E49F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:19:55 +0100 (CET)
Received: from localhost ([::1]:56586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6ck-0008Hr-5F
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lI6bF-0007KE-99; Fri, 05 Mar 2021 04:18:22 -0500
Received: from mail-db8eur05on2097.outbound.protection.outlook.com
 ([40.107.20.97]:7947 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lI6bC-0000wV-Gx; Fri, 05 Mar 2021 04:18:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMyOlEvFwXrtfYjYncOUYy1CcLiemoJSRKW8I9wuQOduujr4GnFyVjIcZT2vUK8ZDB02nxGAxrNrRKxmgcrPT3U0hS1NLq7XQnknRnTAZ3czEfBMX5iFGwJnu8ImvbDOPDqHH6Xu+mR2gUTN46kOMWF0ejcP45a6sdi/feMtIrPYvIy0hWQHWHmQEB5MMCPFVX47sprmRW9Esx7KbwAE08H93GjMG0BZXK9ZJAPGwAiL/Qa4L0ATd5TMqNx9COzQxWcKtERfFrGADN+0X8S+i2KBrjtfanip2YsS+ZHq+ilFU7smTduVyYhWJO8dTlMdLLSYFVjK0mUwQ1MRc4iwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SCUgsGpeHJ/NuDRosb1pPjfPPbLJieW0EV02YJYkgw=;
 b=AYt74WeBmjxNt/MbEnAZaxlsM1HkCeht48twLdiNMn5e1BgLpR7gSIC+Y3nLqffrcGa5LLtjq7uxfFqE5FmhEvjhnA6voy7jYKTM4BdJDDMDoC8j4IrWwYYcEIRtfprTG85ByVvs9N92yLYBogoEXFFN7aGPqNectD+f0eX2AjnrIf7muBgmmtLw7zx0p8iKfXIlZCmENOYBXPIUp5IqqRFN9a9zq0QKyuSW4Ie7dE8OnuIg3b8/3yvbtgf6tdI39MsGicIAaGnlWX0Ap11KwOGFEdSGTYWwN0lkOYdNaIR8xI+pLV/ngKLHMOscmHbYinFSRexbeS7micKGY0pGeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SCUgsGpeHJ/NuDRosb1pPjfPPbLJieW0EV02YJYkgw=;
 b=a5r97MCC45HyNVmUAlEuZ2wtntLrPHbQALhMp6yC/sHm/OGyZ2CTXd/DGHrjAxBd+dQPeegR1nuzEezOZmj/8vGSzkNkFBpBy67NUWrWmRnJLfP758CSHRBC4QK958FnvFSaFfX3on5uZqgci5EZb2clJn+iOGFECR744jH22G4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4280.eurprd08.prod.outlook.com (2603:10a6:20b:b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Fri, 5 Mar
 2021 09:03:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 09:03:10 +0000
Subject: Re: [PATCH v2 1/8] simplebench: bench_one(): add slow_limit argument
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, mreitz@redhat.com
References: <20210304101738.20248-1-vsementsov@virtuozzo.com>
 <20210304101738.20248-2-vsementsov@virtuozzo.com>
 <ec82b01e-30f5-564a-a88a-b83f9a9d9d02@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <06561d9c-0011-c698-41a8-235cc061f4a6@virtuozzo.com>
Date: Fri, 5 Mar 2021 12:03:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <ec82b01e-30f5-564a-a88a-b83f9a9d9d02@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM3PR07CA0095.eurprd07.prod.outlook.com
 (2603:10a6:207:6::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM3PR07CA0095.eurprd07.prod.outlook.com (2603:10a6:207:6::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.16 via Frontend Transport; Fri, 5 Mar 2021 09:03:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea330e97-6b8f-4855-63e3-08d8dfb57fd4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4280AC269282AC7F7E3264C3C1969@AM6PR08MB4280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rReOguTiUqnQANw+xVcm6psLjcL3S/46iGEf6jWafD+QN/949IM+NzLY7+dOrvk8U4IPk2XWaALTuH/qCsmyklzATrbp/K++KXVcwsU1/BtgLFZJSVlEsJAE4UZLhUqDHyLF4nvHJbryq68lZ/q06tzExA6vJ3i2htO56+/lupF2Z1vGaiDcE2yUEA50udpgwOT/PZwHWKQoNifFs/ZarSzZcNmVpstuLCGXf03e9W1+Z1puk/fJRr7EzU042eL1J6WRbXN6auHN4/XmmDiA6L6WgrzOtl7coPD5PAcfJJcbndvvDXFzux/uG1QdIAd+9fY5G3OSeP3TiOzlFNN3qSkOGNFcu1G6VcLJAF29tbJwSIML3RBLShmZgZB1K3cBIIHyIPCX+hPI5FRlYoIoTAZ1utDREVSSCYYG2g68zkaYX/slvOTjm5ei2id5ZSSuKnb2jXG+gnpo8sLnZLAS3ns0aRRaIHhrW/Tsriel1rwu7R/KRGoSqCtkpk7NHRoFAnCgpeSgExUfrz376Ph1b2La1N3064wdT8M+ctzkmHpBsyyv1dCA7Dwa9HsT8B/k7h0xx8c6J05ItdC1IUIvOLyKOUs581soXJi387LSqR8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(39830400003)(346002)(6486002)(6666004)(31696002)(83380400001)(31686004)(86362001)(8936002)(8676002)(53546011)(52116002)(66946007)(316002)(2906002)(478600001)(66476007)(26005)(4326008)(16576012)(66556008)(5660300002)(2616005)(956004)(186003)(36756003)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MDRpSzZYOHQ2K0pBNFg2VTB1SlVhRjFUNzQ4T1VwNFRDTTZyd2JieTR1Qkg3?=
 =?utf-8?B?TDFHT3dRM0o1KzZmOXM4TjBRa1hERXJkaGlTL1BXRkZzdDFWT3UzQWRNSTJZ?=
 =?utf-8?B?U05aWFVtejVwM1N5ZWFETk1PejFwbUJmNThOc2xkWFEvWGo2d0xuYWM3L05n?=
 =?utf-8?B?R0VuMW50U3BlZGFac3NSQXRnUnVWdHdTRGtDd1AydWVFYWtIWVlSdllJaGkw?=
 =?utf-8?B?VWtjazJrUTN4c3p0SXBpbUY4Wm55bzRJdStnR0FjMXBoMHJnTmNHdHhkMkpV?=
 =?utf-8?B?UUJTbWNaajVEajdyeWhZMW15UVF2SnRnUGZjRTdJaVdEVGhBVnJiVVJwZUpD?=
 =?utf-8?B?NlptQW1WWFV2N3dMOXo4eWJBcnBqdzZsWHNtNEpBaHgxWGFoMDQvRU44VHpI?=
 =?utf-8?B?TG5nRUx2RGxRSEdaQ01CTXAzUjlNL013NEhhdmh1Z1V2TDlxQ3JzWng1QjBX?=
 =?utf-8?B?YnY1RFlJVTZrWUxFck1OQU8yOFZZakZUMnEyMlF4c1pGcVFydWR1eG1pLzdB?=
 =?utf-8?B?WEx2TVpIQ2RKRXN2SGEwUHRYTVhlOHB2dGMydWpvZzlSOGdVQ1NtNTZ6TGdr?=
 =?utf-8?B?bklZVGFoRjdvQnhXenJOZGxpUkp6Q3g0RFhRQVVMV1RySkl1anM2YXIzQ0xB?=
 =?utf-8?B?QUhDUU5iVG5pcUpMbVVxTXlTdWdXL1BHdlZuTmswZktMOW5nYTBYQXBoRUxB?=
 =?utf-8?B?czBSUlJLRHREU1pNMGxsdlRFaHo2UGdteFdhWFJYREJWL0dzQ01jZjY2RXpC?=
 =?utf-8?B?d1pXUVd0Y0UvTmdPdGdQR0h5L0lPRFFrMjYrNGsvUVlaTEpUMEd1eXpZb0Vw?=
 =?utf-8?B?Q3hBMWhTZHVxR3VMK0Y1S3pMdVhVT21NdktVdmM5MmZwRlFIV1hXd3RnMlh1?=
 =?utf-8?B?SGh4eWthMHdYQkM0bnU0TitoZjZ6WFpYaEdydFFKdmR3ekFodjRtdnM1dHV3?=
 =?utf-8?B?TGxTa2pIZWRYU0VtQ3RkVjRRQUM3Vks2Tk1NS0FwOEVLQVR5QlJnbmRyT3RL?=
 =?utf-8?B?eTdNZzNQN2pMaXNHN2VGME1XdXQrV3dPWVQ4a3VjaG5mRlZkczRmazFVVy9h?=
 =?utf-8?B?V1BTQ205c3dvbXloTy9TTUNKM3FlRnFEQnZhVzN6YkZndTNZVmRlUGdMb09S?=
 =?utf-8?B?anl4OTYzeTdsR2NWYU5SUiswMzVCNmErMnVvbW5rOTBacGJLdHZnNFVMN3V5?=
 =?utf-8?B?eWl3K2RROC94MU56UzBTMGhhZnZHWE1SeW9UY1F3bTZVekRreXFyM1JxTTZh?=
 =?utf-8?B?VUZmT0tGS01TU1RkT1VtTjhOREpDOUljcVMwVWhha0h3RkFLc3g4RHRQaDhU?=
 =?utf-8?B?SklhbE9sVktIUk1MU2tyMnQvZk5HSFdoWFZ1bFQ1bWNMaE1UM1NMSEpnNTVn?=
 =?utf-8?B?ejZpZnpEMS96b0lYS1JwU2lrcU9vcnQ1MzJYaUhzenhxeWVUNzRSc2RVNXBV?=
 =?utf-8?B?ZjRuaTBMSTVodXZNTUx1cFBDd2c1anloOFdNdmo5bU91eFBMRUxmUEJPdW8z?=
 =?utf-8?B?bmxPQU5COUJXZEVTR3QwQW9UQVl0Z2dRUjJXV1Rtb2lyajlrSXA5VXZLNWhr?=
 =?utf-8?B?M24yTFdpbDJBUUUySS9vUTJjcEZzdkRkOUNZWFUyQzhocll2NDM3OW9oWEcr?=
 =?utf-8?B?ViszNFNDUjBsNXpSeWlmVGk4UDN4WDZtcFZDUmc1YTJBcVdwTzNhMHoyN29h?=
 =?utf-8?B?eEtIMHpBUWdLNWJiVExUSDhVUDJrVFdyZklnUjM5N1VwT2Yrd1czUjdRRUNr?=
 =?utf-8?Q?tibArYC9xY766cLo3KHe5mePJMnYkI1rtOM00Mo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea330e97-6b8f-4855-63e3-08d8dfb57fd4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 09:03:10.0879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swI5+TcttDZuw9tcK2WrJ3iefaekZtCYIGrOrXsD2X/jhSBDv9OUdGfdf4bzOksxyn4IlEHm+ItFKnh3uKImqBMD6ZzDOZQa4xA7p8l5uy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4280
Received-SPF: pass client-ip=40.107.20.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

05.03.2021 04:22, John Snow wrote:
> On 3/4/21 5:17 AM, Vladimir Sementsov-Ogievskiy wrote:
>> Sometimes one of cells in a testing table runs too slow. And we really
>> don't want to wait so long. Limit number of runs in this case.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   scripts/simplebench/simplebench.py | 29 +++++++++++++++++++++++++----
>>   1 file changed, 25 insertions(+), 4 deletions(-)
>>
>> diff --git a/scripts/simplebench/simplebench.py b/scripts/simplebench/simplebench.py
>> index f61513af90..b153cae274 100644
>> --- a/scripts/simplebench/simplebench.py
>> +++ b/scripts/simplebench/simplebench.py
>> @@ -19,9 +19,11 @@
>>   #
>>   import statistics
>> +import time
>> -def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
>> +def bench_one(test_func, test_env, test_case, count=5, initial_run=True,
>> +              slow_limit=100):
>>       """Benchmark one test-case
>>       test_func   -- benchmarking function with prototype
>> @@ -36,6 +38,8 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
>>       test_case   -- test case - opaque second argument for test_func
>>       count       -- how many times to call test_func, to calculate average
>>       initial_run -- do initial run of test_func, which don't get into result
>> +    slow_limit  -- reduce test runs to 2, if current run exceedes the limit
>> +                   (in seconds)
> 
> s/exceedes/exceeds, and you need to mention that if the initial run exceeds the limit, it will change the behavior to count that result.
> 
> It is also possible (conceivably) that the initial run exceeds the limit, but subsequent runs don't, so it might be hard to predict how many tests it'll actually run.
> 
> If you're OK with that behavior, maybe:
> 
> "Consider a test run 'slow' once it exceeds this limit, in seconds.
>   Stop early once there are two 'slow' runs, including the initial run.
>   Slow initial runs will be included in the results."
> 
> Lastly, this will change existing behavior -- do we care? Should it default to None instead? Should we be able to pass None or 0 to disable this behavior?

For sure I don't care about changing the behavior. Consider simplebench in a version 0.0.1 :). Maybe, I should make a comment somewhere, but nobody will read it anyway.

The aim of the patch is to minimize waiting for too long cells of the table, which are obviously too much longer then the others. Probably the logic should be improved a bit about ignoring or using initial-run result..
Like this:

If both initial and first run are slow, count both and stop here.
Otherwise, stop at first slow normal run and don't count initial run.

Or may be even

If both initial and first run are slow, count both and stop here.
Otherwise, behave the common way.

> 
>>       Returns dict with the following fields:
>>           'runs':     list of test_func results
>> @@ -47,17 +51,34 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
>>           'n-failed': number of failed runs (exists only if at least one run
>>                       failed)
>>       """
>> +    runs = []
>> +    i = 0
>>       if initial_run:
>> +        t = time.time()
>> +
>>           print('  #initial run:')
>> -        print('   ', test_func(test_env, test_case))
>> +        res = test_func(test_env, test_case)
>> +        print('   ', res)
>> +
>> +        if time.time() - t > slow_limit:
>> +            print('    - initial run is too slow, so it counts')
>> +            runs.append(res)
>> +            i = 1
>> +
>> +    for i in range(i, count):
>> +        t = time.time()
>> -    runs = []
>> -    for i in range(count):
>>           print('  #run {}'.format(i+1))
>>           res = test_func(test_env, test_case)
>>           print('   ', res)
>>           runs.append(res)
>> +        if time.time() - t > slow_limit and len(runs) >= 2:
>> +            print('    - run is too slow, and we have enough runs, stop here')
>> +            break
>> +
>> +    count = len(runs)
>> +
>>       result = {'runs': runs}
>>       succeeded = [r for r in runs if ('seconds' in r or 'iops' in r)]
>>
> 


-- 
Best regards,
Vladimir

