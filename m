Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98CF47031F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:50:43 +0100 (CET)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvhEP-0002ZK-I1
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:50:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvhBu-0008VW-AG; Fri, 10 Dec 2021 09:48:06 -0500
Received: from mail-am6eur05on2129.outbound.protection.outlook.com
 ([40.107.22.129]:16995 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvhBs-0007dy-5D; Fri, 10 Dec 2021 09:48:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBzs2PKU3V5CJIoOKxlKvk8WSNFOhztZkvAUZJ0xUj2ln3wcgJCKwBSNwTa2a8NoqZkkzIwtwVQaKwq1qlx0lPFSelLfgbpDRmtZjpd62TCrgxeKt+yvU6eCsnGPqNUVE4TPwBvrJ+FgIcpdMqybCO/AcvRUor/d6GGwZTHSEdJQpXi6WwH4YRSISjAijEbUQLAtB+mBNiBarz8xcjqJTxLleMSCnGNPjML0Iu8LQlK1b7X5HQjYZjxUpLffYrR3XbfEVWjShz08vktDpFgmvd1h2ojawM1TejleNf/DdAFrDPfFunC832JPsDFs3QqgEf09i4dlsrJ0L7UI5vBm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aorScD1JOx96pDSKC8g1rbhQ3xmlegnNfziDPCXrebo=;
 b=Sx700KTl/m2dsxEPREZ5NivmWmDHc3rZfEOS/oVS1dwb4SbuWi/epA9osVg4yhoxCAqtGnN95irpwQPN9sRXKnlNRKnLdRDkPTmy33NZ5LrXBrWIjHfLa6aZ2uX++ymkcRVAlu/JX86VMG6yMJ81gJQqYN/ZkCBrW9pvD1jEA76P8iFYXBRMAitmAarYN6AItq1BhY0rSi13b+OuivNrzze3TA3HEndCH6NT4w16K7tJu3wbVrKi4he76+UN8DXsW7a7PTYGvtIeUgvCv0pCPk9LyuN3rfUpUZao4GtHhtlAA+7zDPbtFPLCHuxnedrh+ZWDV5EiFTs0agbKKZI1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aorScD1JOx96pDSKC8g1rbhQ3xmlegnNfziDPCXrebo=;
 b=XssidpW6x+CEvt6x01XFMLI9tXGM4Qkug2LHJ1K/rm3cLsv/1WJEG7NjZz7btWE9i+kcDgTOJDyCo9dSgOvkEl7+/RCzOFz47R9/6H0vOrED0vxNvIcXPejFFf8M4efPjQUAiL/Uyh5LijSnk8uubsFzzPSyxYOgwwjubJJSZT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Fri, 10 Dec
 2021 14:48:00 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 10 Dec 2021
 14:48:00 +0000
Message-ID: <b18f421c-fb4f-9305-2113-12a5e829048d@virtuozzo.com>
Date: Fri, 10 Dec 2021 17:47:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/3] iotests/testrunner.py: move updating last_elapsed to
 run_tests
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, den@openvz.org
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
 <20211203122223.2780098-3-vsementsov@virtuozzo.com>
 <CAFn=p-aAB9TXcJkm_cNtAowz_AjWeTvFgyL8kZ7E4zyDqMxF_Q@mail.gmail.com>
 <YbNjcA3GVWbN1SHI@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <YbNjcA3GVWbN1SHI@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 14:48:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c514da3f-b0ee-4d88-410c-08d9bbec1017
X-MS-TrafficTypeDiagnostic: AM0PR08MB3956:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3956907D1E59512F4B98D223C1719@AM0PR08MB3956.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k70zjR/0FxsVaZ8AtTKWJp+Ty3BJsh6ROeLuMxkHc4zVOn9mtFWIVt5JxFtcvsKqqAr455MxYx5m7atgimAvtAtbK34lQcYyCbd68FnNohcj7zpF0UikZK4334DOHM8+yryJL73rFiTGdTFqK0qnst0omp4eQkTUnzoc5zSjm+0s7vG604QSkyEZXoW3FYM03b3tR813ze17oeDO0cOrPEaCk+nTjecVlalJTEqP2EdrNQKPBVT/0vZstgfc0LVzv/u4hTgYuWXxm5BAVppRuF56PXiNQRpaNpUYoKqMQgmoqsVV2HKSROz9MXTJcUD7BNSjReFirtKRG9mfPdidleK0sKcha0/xyGjlD02mDZBr5Jd5CoSgcJ5XjtXUrzn4xleRPrkYGgzz6YHvNjV+eDkhPVAcGBmJGQorve0yz1J9WKcokLDHAKbI7K2HP1QqT/8oGuutHQ6irdBx8mG697tKo36tdFPfxWjlatfNVqnZdlj/x1FegchKn9kfriELbJJB24YMRUKmt9ay/C/i+8j0kk1wl7HnRb21NnFzRGQ0c5eZe9qyGjGr8XGMBeZfgohqQWxJTJMm0gWwDLSOMp3Mx22il2T9+D8ebOB8EXfr8IPdwzevRC6S81ZQwQ0gS5AcGG4ym8z/N+UN7Lp2fG6WJKlNXXBFxYg/KOSFxtgOsDBR3Wdq1ASJzrtVQI6Fu3+IZWSf11qwv0n9ee1uGw01XJaB/CYhhyP0VYHXNojoHi4kQ6UCqfut9A7JNhZoLJ5O6JVn32si1Cvpz4lRbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(36756003)(2616005)(956004)(8676002)(316002)(16576012)(107886003)(186003)(8936002)(2906002)(66946007)(5660300002)(54906003)(31686004)(508600001)(4326008)(31696002)(52116002)(83380400001)(38100700002)(38350700002)(66556008)(53546011)(6486002)(110136005)(66476007)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ai8rYlkrSWlMeUkvVm1qNjYxeFRjV21TMUNBbVlVSkVRbzZ3cWlmTHd0YnBi?=
 =?utf-8?B?UW52aUdaMklkd2VZNDNtcGxFY0NyZ2tSK1BPYWVFNmlSZGZINURSd2wyUHVP?=
 =?utf-8?B?eXJRQkphUGJ0ZmZrejJsN04wTU9zZzVybHVOYnEwa0dyR3FONEswMlZVbDh6?=
 =?utf-8?B?QUVVSzVIK09LYnArMmx6S2M5dW5lM1IxMFQwd2M3QkNvQVc2dWNNbEJKbnY5?=
 =?utf-8?B?akUwczNtRUlFblVDVkNLS2ZocFc3WUUrRERWUHZnQUdKZXRMM3FHbEcyN1Ev?=
 =?utf-8?B?MFBaNDNnRlVubFRobUtFeVlYNE9YTE52b0V0Y1pETGRsR2NUTXZkM3VFYXhn?=
 =?utf-8?B?SzJsaVF1UVJiTS9udmZMakw0cmxwa3MrV0RjQTJXZG1VcWRyR3dBUHo1QkRJ?=
 =?utf-8?B?WE84SHdWanhUdi9FM1V6NDlKeTZyeEFaWjRURnNGd2wxQXBrRi9URTJmL2xJ?=
 =?utf-8?B?K3p1Tm5RRHJDVTV3dDY3TS9vRWxSWFFiMmJRQVhEd05meVNwakVBMmJQQmR3?=
 =?utf-8?B?Y054bmZiRTFCaHVLR1Y2cEIySktTQ1BVdDFPa3hRU2lFZUxLenFvU2dRYjJx?=
 =?utf-8?B?NFB0Q2hiVzNIeXV5cFRwbWpPWE1Wd2wrYUFsWEg1aVQxRnVid3RFQ09UbTZs?=
 =?utf-8?B?emFMSjdaR3Y5b3VOeEFSbDJmVEVPM1lUVnRKcWRlSHNIVFlGdmJKWk05eFM1?=
 =?utf-8?B?bDQrL3MxUXgxdkZBcS9xZ2tXWmJUdm1CdDNDQlphQlJRaDJkK3NtN0JwK3Jh?=
 =?utf-8?B?dmxmeUdUUkV0eUM0SzdkWFJlejZjTTNQMWcva1ozeXArOVIvNndPdnJTV25q?=
 =?utf-8?B?aDViSEhpS2MyZUdLKytnUDc0Tk9aRzFUZlZSYWp5SjAyM3d5VitYTm01NERO?=
 =?utf-8?B?Y09KRVZDc0N0Z2djSHQrK2o3YXJVTm9qSnNuRW93OXJweU0zZmVWRGVSWllZ?=
 =?utf-8?B?aDdwQ0hjc05DdWhEdEVyZUlqVDlwNFU2bFhDbDlMZ1RVNzluSi9yVXBMb0gr?=
 =?utf-8?B?ZHEyaUk2SkUzaFg2ZVNuOXBWMmgxdHpJMjZhcTZXN2Nnem9MRURQb1RTZFN5?=
 =?utf-8?B?T0JnZmlnRjc2OFpGUjEyWEgzVXBkRE1HdGcreE5BcXdRNytVQkdicHNONlBq?=
 =?utf-8?B?Y2gwQURlaDlvaVBnMWQ2dGFTM0JMVmx1czh3clhGc0J6RU5CY2Z2Mnl3cmdK?=
 =?utf-8?B?UnJUL2ZhaGhSMDd4a3p2bm5pdzJkZ2RVZ0d4amRLUUJWcERra2RjK2QwVnl5?=
 =?utf-8?B?NUp2ZHN2aUh0eHZVTS9qM0syTmx6NXpuWTlXbU9HUTduMEIzdFA2Z0ZMSThi?=
 =?utf-8?B?TG5PeTJ4TWNma3VlWXdUemt1RTlzaXQvNUxVdjZXUkZZVFdnQjlpd25YbDJj?=
 =?utf-8?B?dXUyMkE5NnZLOUdBZFNrc0gxMjhONy9EWFpWNkhjUnFsNEZ0M1JURzg2UTFv?=
 =?utf-8?B?WWliUWJjZVVIa0VkdityNG9uSUpzNktoc3lpcFJmdnZucUU0T292bTBQLzRV?=
 =?utf-8?B?SEdYY2krM09IZXdTOHRQam5BejRWNzQ5UFZwem0rSldybjFaWExPc3pZVTdj?=
 =?utf-8?B?R21aRmpVaU1JYkV2UTVTb2Z2RVgvdEdtZVV2OEUrK0tmb2REbHZ3andaSDZL?=
 =?utf-8?B?c2ljalppbmlXTmsyZVFZbkszODRsMUE2VWlUT0lQSmRqNVEzRzlnNnBFOEtK?=
 =?utf-8?B?NkpWVkd2Mm1SWUVRTzNiT09zZWUyWVpxTXhHbzl3OXdRRllaK2V0NDU0Z0RI?=
 =?utf-8?B?N01IUXFXdjVpb1docnU2dkRaZThuQkc2Qi9wZzJjSkt1dG9BendQQnkwcE53?=
 =?utf-8?B?bUhYckFxMXJXUWVJNmJPMW9YUURiTkJNODZyczhYZFlKNFk5NG8zVHNRanRR?=
 =?utf-8?B?ajNiYUJmSEdxaEU2dmpVa3ovdENuM3BmeE1SbVdENnJXM2lJZTF1ZytEYzRO?=
 =?utf-8?B?dW5pWHBuTFl6dWhjUDhhZXoyUm1oc0poaWtpaUNWTkg3MnUwWmU2UjNxVmxS?=
 =?utf-8?B?OENpcHAvU2VZbFJFL0N5d2xuQ2tnU2lUcXlRVDlkUjBDT3FlOHRReVp6SGl2?=
 =?utf-8?B?eFl4SnRMZlUvVnVQWWlLRWYxdndKQlpHTG44NTViS0ltaTNuUTBZSkkrbEJB?=
 =?utf-8?B?SGh0SzRvcDgzV3h1amt0azFMZ0pkUEZZQ29QUEp5YS9WaG5KVmMrT3pBc0Rq?=
 =?utf-8?B?N08yZ1FJbHpObWE4YllYN1c2Sm9NNnFuSXluLzhSOUMzckVrTENic3pmM2V1?=
 =?utf-8?Q?M1b7LvN+8pH/tU92wZsf2L1bHIgWPJAU7t94JoGU5s=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c514da3f-b0ee-4d88-410c-08d9bbec1017
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 14:48:00.6968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApGFxUrA/WQpoDhyGJYV08TfN5ZvVvgn2jTXJHGYmBI5QQc5Ri7HMHOq0x+/WdyZBUSGri3i0sEAucJuoQA96D4BuPortty9g8nhzFJA9g4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3956
Received-SPF: pass client-ip=40.107.22.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.317, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

10.12.2021 17:25, Kevin Wolf wrote:
> Am 06.12.2021 um 18:59 hat John Snow geschrieben:
>> On Fri, Dec 3, 2021 at 7:22 AM Vladimir Sementsov-Ogievskiy <
>> vsementsov@virtuozzo.com> wrote:
>>
>>> We are going to use do_run_test() in multiprocessing environment, where
>>> we'll not be able to change original runner object.
>>>
>>> Happily, the only thing we change is that last_elapsed and it's simple
>>> to do it in run_tests() instead. All other accesses to self in
>>> do_runt_test() and in run_test() are read-only.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   tests/qemu-iotests/testrunner.py | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/qemu-iotests/testrunner.py
>>> b/tests/qemu-iotests/testrunner.py
>>> index fa842252d3..a9f2feb58c 100644
>>> --- a/tests/qemu-iotests/testrunner.py
>>> +++ b/tests/qemu-iotests/testrunner.py
>>> @@ -287,7 +287,6 @@ def do_run_test(self, test: str) -> TestResult:
>>>                                 diff=diff, casenotrun=casenotrun)
>>>           else:
>>>               f_bad.unlink()
>>> -            self.last_elapsed.update(test, elapsed)
>>>               return TestResult(status='pass', elapsed=elapsed,
>>>                                 casenotrun=casenotrun)
>>>
>>> @@ -353,6 +352,9 @@ def run_tests(self, tests: List[str]) -> bool:
>>>                       print('\n'.join(res.diff))
>>>               elif res.status == 'not run':
>>>                   notrun.append(name)
>>> +            elif res.status == 'pass':
>>> +                assert res.elapsed is not None
>>> +                self.last_elapsed.update(t, res.elapsed)
>>>
>>>               sys.stdout.flush()
>>>               if res.interrupted:
>>> --
>>> 2.31.1
>>>
>>>
>> (I continue to be annoyed by the "None" problem in mypy, but I suppose it
>> really can't be helped. Nothing for you to change with this patch or
>> series. I just wish we didn't need so many assertions ...)
> 
> I'm inclined to say it's a None problem in our code, not in mypy.
> Essentially it comes from the fact that we're abusing a string
> (res.status) and None values to distinguish different types of results
> that have a different set of valid attributes.
> 
> Of course, Python already provides a language feature to distinguish
> different types of results that have a different set of attributes and
> that wouldn't run into this problem: subclasses.
> 

Agree, you are right. I'll look if it is simple to refactor.

-- 
Best regards,
Vladimir

