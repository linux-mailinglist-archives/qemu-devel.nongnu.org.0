Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7663467CE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:35:56 +0100 (CET)
Received: from localhost ([::1]:38758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlsh-0003GG-5o
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOkos-0006ls-S5; Tue, 23 Mar 2021 13:27:55 -0400
Received: from mail-eopbgr150094.outbound.protection.outlook.com
 ([40.107.15.94]:3969 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOkoi-0004QR-DQ; Tue, 23 Mar 2021 13:27:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTxQyMrC2rIOCfu5h6ET/7wCUIy+eeOMphbNThc9FdEDCrJaJR3r5J8ax/vszLuKPdBJhlTLYYSfYS7ePTVw036eI+7fnw/SFEAzqZULEdflNK8ROppA/WEnTM56wzgXwdbIpsqsk5CjCi/QDDz+XZzqSWcya3KJG1E3Pd6mtceI/e4dNFopHJ2eSDGX5ubP6uOGt9tryIJuSNE14ep/h5TkVpQxAECq2WClCiyOoSQ24l21q8XhCzHMWQjIsQnPXO8sEcvQTXeppp2jkYQwlznVtepD6AH2FA9a9twQiEUJ23weOcNg8wlaPfWUXutsCOVG3KFtcsKfMA9PLEbsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuGDbISLFyCzu1zc+NFoPuPqvPhrcnAuNz5bKrEq7dM=;
 b=dttNGkoPafOBrbKHfpsfu4qXPFMqLBZeyYczwH+F/U9HZVnY3m0W1B+7/ZZzF0egs+YDIqMJ5589S+bY1XZ6n37p0KwF3JMIySZILLjUcgMS50vvrS9ZlxhVwMLPXPZllvLOLw6Ax/narmXVjfJCL5fb9aCFmWSNgxY2iH4iQ5p/4ySbdeO9xv3ru6Ha0PZVVi0u9Q+e/Lm1REMT659OQoy4uMfiIHI2rgLatbCsM7j5wzB6o2rNzE8ermY9pc6XK+O4FcikP9jN1zF88+mSkU4tkclHk6SF9E7OM0MTSqmooYogvHXtCL0B/1Azdm7daW/CrQ3YpTTW7n0BM/WVWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuGDbISLFyCzu1zc+NFoPuPqvPhrcnAuNz5bKrEq7dM=;
 b=TV00dZi0zP7H6QnJe10b2x12Ah8KIviF3Bi86WehG/+tSmHBd7nDK+00ZfzHeRi8FaXytrFCewIdAucoGVEBaG5o9M2rmOJuNa7UwzuLllqethZp1NYgjTbqrNIouCq18vrRKli1C/4mSjY5jJ8BPrwVZbu0pQiQGvBLViOhcDs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1649.eurprd08.prod.outlook.com (2603:10a6:203:38::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 17:27:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 17:27:41 +0000
Subject: Re: [PATCH 1/4] qemu-iotests: allow passing unittest.main arguments
 to the test scripts
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, qemu-block@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210323130614.146399-1-pbonzini@redhat.com>
 <20210323130614.146399-2-pbonzini@redhat.com>
 <f2d648c7-1b80-bec6-f17c-78d36cf998b1@virtuozzo.com>
 <97e7aa7e-dcf0-17d0-3a4b-2d293e9c89ed@redhat.com>
 <a51c2d8d-cc9f-705f-2527-857a791e54de@virtuozzo.com>
 <04724b6a-3be2-54ff-c769-35fed34e9135@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d2982f83-5ce9-4617-3cc7-aaccec8584e4@virtuozzo.com>
Date: Tue, 23 Mar 2021 20:27:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <04724b6a-3be2-54ff-c769-35fed34e9135@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0037.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0037.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.22 via Frontend Transport; Tue, 23 Mar 2021 17:27:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1dfe37c-c7ac-4c4c-a2ca-08d8ee20f645
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1649:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1649EF143A548D62EA63859AC1649@AM5PR0801MB1649.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXd8QhkOhiqsTQj/aPPkeBb72W7UoFCNQS0mOZcyjDd7H0K0hMR3OO6srgVm0Jy5BuKZDfPOmGrCs1vWI1m1ZhgAajx58Vtx9WNg30NbHxOQgqUxkXkBOied6jbJVHd/bW+I+lNqbkhdMdBVPSrPmrP3kIiVOeut1mY1gKw5p02owWbACr243b1sQd/XMkiMPSZSAfnbUKllgx8SRu283/sCnhWDirUEzfqcyMhIXUbyxwTt4zy3Xp+wzU5O3XW6Clvej6GtJYXkd8nfkC/i+gheRLzy754/+H9wb1Nq0RZaM9gIaOnonqOFi+62UmaKUqsPsZV4+wjdy2+GVEUaIAlFc+AK10kZQOJxGwZ/JqjYmwBsrT6ykE6CcpDa2kwq+Yc3Li7tG7GyBnFtzocd3CaOaW5DLhir2tNfVbn7D8I5C5b9yvIm7t5dVCjx8A3q3eKjVUjyxR8TrYgXw2fLSpc5h88owNBfmVCXKfBZK9rDLPPG7hDPZbbfx+aemPtJ/YjVHs784SQekpQRCrovUuHqm7t2Y9ABHSl4k510n5psMK0qKeWAHH7wq2lKOBIQRip8zDrcdKWjU7/S4doGqeheqEkouMCzXFPx/0dxNMxVMjRERbF3mQKLOebTvfAW/6fZqSSb913UGS+FffLpuQPgr3rT0E2+uOiZ75xzvZwyMRG6Su2mTPfJBlVh3yV5FtDRNt5z6jiQTFi10rHCCq63AlOmnXBH4D/b2Zn+p8s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(8936002)(86362001)(498600001)(36756003)(31696002)(8676002)(66476007)(66556008)(31686004)(66946007)(16526019)(4326008)(186003)(5660300002)(6486002)(26005)(38100700001)(956004)(2906002)(2616005)(52116002)(16576012)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UVBIMTlKeTlzL2orZGlDMXlhcGdwdXFac21rOS9KTDVjQlc0MjVSQmZNRWRq?=
 =?utf-8?B?c3hYL1pzaERNNXJ1aUYyM1gwQXhnRHludlBoM1JIRktONDBvZ21mSHJJWWFz?=
 =?utf-8?B?aXZXcEhQSGRiQkJFaWVkVXpwamNFU3ZtRVBFSFdXUStEZnErb0Nsa1lSNUJL?=
 =?utf-8?B?aUI3RGx5amNTN2VLazF5UGpYMGd6NmNXVGd6VXZUTHJZcDZBQi9rL2VZeGlG?=
 =?utf-8?B?QTJQNHJCaDBiRzNyMndvNWhlSnRMRThxSTNMemdtbGJNcmRmSlVsQUZQaVJy?=
 =?utf-8?B?ZXJtY1huVjFXODhPSUs1OFJPcWpXS3lzU0EwTGlMNFdQL1QrV0ppKzlGM3Zx?=
 =?utf-8?B?NHlIWUVIdzlDeTI0dStkdnZRSUx0WHZmRG0wT1VLb3RuS0w1akJXTlNDdmNE?=
 =?utf-8?B?c1VPaGxjdm5RditIalN4RUI2cGNVakNhUkFXbk9ONWRiT2hucjFCT2s3Qjh0?=
 =?utf-8?B?K3lXeDhpaFovZFlDWEk4Vm5OR2sydlp4aUYxbE0xQ2NqdCtkQnY3ODdnYVBV?=
 =?utf-8?B?QkVDV3VMWXlRdjNJbVdrOHhKOVMvWXMyVmpvbzM2U2xKcG9ZY29QWEN6bjl5?=
 =?utf-8?B?MFZqWExhMGJ3T2t6Y2dxdTlzSzhyZHh4Vll4TnhobjZOaWxkQkwxdTgxTFBq?=
 =?utf-8?B?Z3pyb2hCaXFrNTBMTWhOdFoxaHpwdDhzVXNkTWNYc0k1dWY5SGV5Q1NTQkNo?=
 =?utf-8?B?d0xOYkVOZUhjM2ZrVU1DTEpTZGpyQ3o3WmtGa0tNWGoyVk5oM2NPWlFkZWl4?=
 =?utf-8?B?TUlUeFJ3dUtNa1V2b24zSGRmRTdKbUYwSGhhdXJFRzZhK3N4RFhtaDZDdjRm?=
 =?utf-8?B?d05PakFDQ2puejFmTXh0dnNtRTlFdnEveU5weXptcUdCS0VldFJucklQN1lD?=
 =?utf-8?B?b3NHb2VNcEVxMzZLb0ppTm1xQndURWNoTTNuM1g1NTYvcW5zcGVpNlBMczlo?=
 =?utf-8?B?T2lzQjBsbmgzU1pmc3R3NFNJc3J6WDBmOG93bWsrMlFQUFF4ZGdha1U1QjZV?=
 =?utf-8?B?U21Kek4yOGRFQlIySkwxb0FaSlJhTHlFbmRmdmh6YlJQQUhUbXE5SHp4TFVE?=
 =?utf-8?B?Q0d4TS9DOHlkTlhQWjRFZTdVSUdURy9SZUZyaFMzTHJGZGp5UEkxT0xSS2Nv?=
 =?utf-8?B?VVIrcUJlMW9xc3FXc1kzRUJ6N2x5MmZZVzNON1IwdU5TUCtKcXVOQ09SREpN?=
 =?utf-8?B?REhUV2NmRDZUckhCUGtFVDJrMVhwMmFQazQwVllQckVtN1ZhK1FiWGJ4dU9s?=
 =?utf-8?B?ckxGaDAxdGJtZmY5V29oK0JaVlZvekRtKzE5QlV6Y1N5L0VxYXdVbk9tRE0w?=
 =?utf-8?B?cisvdDVmZ05YVVJhTEZTQmtnR2d0a0lSbTRDRnh3ZjNFTU51LzRjM0NIZmY0?=
 =?utf-8?B?MERMTlVpSGVJd2hMbmtYd0x5N2NvcGpadm5UMjFFeHY5cUdkcGIrK21VNUFL?=
 =?utf-8?B?OVZtWWJKVEFiQkgwMTF4ZkRndUFGK2hKQWdLNm5HL0xweUlpTFlWUHNLamZz?=
 =?utf-8?B?Szl0dytCRk9QUisvWE9vcGNyYUtnVlJzVzk0cVJKSGFINHA0bGF5eG91Z3pw?=
 =?utf-8?B?K0VmQkxHYTRLRU9pNVhoZDExNnVqaGhOZElyTW9WRU9xWldjaDdjODJlRzR3?=
 =?utf-8?B?TlZLelZLcGZyWU90eUFWaG1XMVdlMHVZeEJwY3hqZU9EYkV6L2J4b2ZBZTQ5?=
 =?utf-8?B?SzVrYVdxWFhIVThZd3ZuSDFMU1FlUytrT0V6ZkpuM1J0KzFyZWpVSWUyMzlz?=
 =?utf-8?Q?i/6lYG182n5z7TRTdT7PiyM4+gLZxO5JC4v9vfv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1dfe37c-c7ac-4c4c-a2ca-08d8ee20f645
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 17:27:41.2193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkE8zN3nL7Y0UXJhkItEjEpsvHVQ9215mAOs381kIegZpMPc8ui8kVvwkaOQlDb8t5iPymvZVHhvUymMapwp9HZNwb8iUZ/bn/MYX9TeGE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1649
Received-SPF: pass client-ip=40.107.15.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FORGED_SPF_HELO=1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.001, PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

23.03.2021 20:04, Paolo Bonzini wrote:
> On 23/03/21 17:56, Vladimir Sementsov-Ogievskiy wrote:
>> hmm, just use a separate call of unittest.main, or honestly define a varaible as Union[] or just Any ?
> 
> All the ugliness goes away if the implementation is done properly. :)
> 
>> For me normal try-finally is a lot more clean than calling atexit() in a class method. It's just a strange interface. Prior to the patch user can call execute_unittest several times and expect that output will be printed during the call. After the patch outputs of all calls to execute_unittest() will be printed at program exit..
> 
> Yeah, I agree.  I didn't like the finally, but I really didn't like it
> because of the *behavior* of buffering the whole output.  I have changed
> it to drop the buffering altogether, that's much better code and more usable:

Me too. Never liked buffering of test output.

> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 90d0b62523..a74f4f9488 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -32,7 +32,7 @@
>   import sys
>   import time
>   from typing import (Any, Callable, Dict, Iterable,
> -                    List, Optional, Sequence, Tuple, TypeVar)
> +                    List, Optional, Sequence, Tuple, Type, TypeVar)
>   import unittest
> 
>   from contextlib import contextmanager
> @@ -1271,37 +1271,49 @@ def func_wrapper(*args, **kwargs):
>               return func(*args, **kwargs)
>       return func_wrapper
> 
> +# We need to filter out the time taken from the output so that
> +# qemu-iotest can reliably diff the results against master output,
> +# and hide skipped tests from the reference output.
> +
> +class ReproducibleTestResult(unittest.TextTestResult):
> +    def addSkip(self, test, reason):
> +        # Same as TextTestResult, but print dot instead of "s"
> +        unittest.TestResult.addSkip(self, test, reason)
> +        if self.showAll:
> +            self.stream.writeln("skipped {0!r}".format(reason))
> +        elif self.dots:
> +            self.stream.write(".")
> +            self.stream.flush()
> +
> +class ReproducibleStreamWrapper(object):
> +    def __init__(self, stream):
> +        self.stream = stream
> +
> +    def __getattr__(self, attr):
> +        if attr in ('stream', '__getstate__'):
> +            raise AttributeError(attr)
> +        return getattr(self.stream,attr)
> +
> +    def write(self, arg=None):
> +        arg = re.sub(r'Ran (\d+) tests? in [\d.]+s', r'Ran \1 tests', arg)
> +        arg = re.sub(r' \(skipped=\d+\)', r'', arg)
> +        self.stream.write(arg)
> +
> +class ReproducibleTestRunner(unittest.TextTestRunner):
> +    def __init__(self, stream: Optional[io.TextIOBase] = None,
> +                 resultclass: Type = ReproducibleTestResult, *args, **kwargs):
> +        rstream = ReproducibleStreamWrapper(stream or sys.stdout)
> +        super().__init__(stream=rstream,           # type: ignore
> +                         descriptions=True,
> +                         resultclass=resultclass,
> +                         *args, **kwargs)
> +
>   def execute_unittest(debug=False):
>       """Executes unittests within the calling module."""
> 
>       verbosity = 2 if debug else 1
> -
> -    if debug:
> -        output = sys.stdout
> -    else:
> -        # We need to filter out the time taken from the output so that
> -        # qemu-iotest can reliably diff the results against master output.
> -        output = io.StringIO()
> -
> -    runner = unittest.TextTestRunner(stream=output, descriptions=True,
> -                                     verbosity=verbosity)
> -    try:
> -        # unittest.main() will use sys.exit(); so expect a SystemExit
> -        # exception
> -        unittest.main(testRunner=runner)
> -    finally:
> -        # We need to filter out the time taken from the output so that
> -        # qemu-iotest can reliably diff the results against master output.
> -        if not debug:
> -            out = output.getvalue()
> -            out = re.sub(r'Ran (\d+) tests? in [\d.]+s', r'Ran \1 tests', out)
> -
> -            # Hide skipped tests from the reference output
> -            out = re.sub(r'OK \(skipped=\d+\)', 'OK', out)
> -            out_first_line, out_rest = out.split('\n', 1)
> -            out = out_first_line.replace('s', '.') + '\n' + out_rest
> -
> -            sys.stderr.write(out)
> +    runner = unittest.ReproducibleTestRunner(verbosity=verbosity)
> +    unittest.main(testRunner=ReproducibleTestRunner)
> 
>   def execute_setup_common(supported_fmts: Sequence[str] = (),
>                            supported_platforms: Sequence[str] = (),
> 


Sounds good :) We'll see dots appearing dynamically during test run, yes?

[anyway, I'd drop "...." test outputs for unittest-based tests at some moment... But after that patch I'll have to keep some kind of "progress bar" :]

-- 
Best regards,
Vladimir

