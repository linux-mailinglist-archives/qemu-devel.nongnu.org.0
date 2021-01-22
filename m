Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB74D300540
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:24:40 +0100 (CET)
Received: from localhost ([::1]:42392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xMd-0000nJ-Ri
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2xL6-0008Dk-Qc; Fri, 22 Jan 2021 09:23:05 -0500
Received: from mail-eopbgr80103.outbound.protection.outlook.com
 ([40.107.8.103]:47233 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2xL4-0003Dq-5c; Fri, 22 Jan 2021 09:23:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wp+f5aD2REx1ERGFZFr7EtOt+1PZMUYLb/LIqXrkXWAztF0I0ysgNUqO/L5ngaGFkkQt7uqjvMyPkG/aA2Om6C2iO4Fs3SS+2+ybxR/RJZBAHUltKXWN0Cu1fWGoVS0Tq/Phfco3cWFqvwr9xYx2FwBVJIUSFEOkmCSnAEgHmof5dfSefBs5t2zsaXD4azKja8/M+PPwzio2rCxJhWbJ8Yt8yxmscdEpT/t9AIWgu1jGEYkTZxNkBzbLjz+b6AXGb9rLUDJPFDkqIsZXSLG1RspSRR8Hbnu8AqDdUQOzkmLxaZ4F9TfrQ6INm1BpNw0oh4A/pMrOsid2MSlsL0QpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46pAI7BIejBrZhSLKnV+y8Q5vLbuzuDhE1Ruj5H9DlA=;
 b=OjrJutQU8k0LWah4qYzy/bPZGkCRUSyJqoZnkeLyJK0CjDh27PRNuapz/4X70HBfPB7/MosnV8q2FhptiIdpX6IqBWq37iRy1dZytj1eR5V0uGuJHc9D6X0L3cvsZWApZoN6FrWs6KvnYQYpd4XoEt1IbCiMENHr82Den0aB7ZKBu5hHpnYf1xc0MmRmFNxbU25ieqvHjhiWtb0BgsA555R1WB7Pyy/IuwXFL/kbyxRnlp81qxSaJtFF7He1/D9Oiia0BHPZ1ZiO8K9kQzQA80yNTn2aC/affYkoj9HI6A1H3qfgmDoPL6bM3JuFe/JC5bdV6bzJ6ICAgP5BSV7rwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46pAI7BIejBrZhSLKnV+y8Q5vLbuzuDhE1Ruj5H9DlA=;
 b=We8j6Jgsr3zSLtA9NsRDROzlFW2M07W8XYg6YYU/9y7Y4jGfB4iw16hcSxx4GOPGrd8A6ecWUz1GhBe3lzx8iy5BoNHFpH32NrTYusvvJFV5qn8oO89z2Oa+noJlLLpniWRrWXZ4fhrbOH288ljd3WAXR/yA1c2xLomEvS47IRY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB3791.eurprd08.prod.outlook.com (2603:10a6:803:c0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Fri, 22 Jan
 2021 14:22:57 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%5]) with mapi id 15.20.3784.013; Fri, 22 Jan 2021
 14:22:57 +0000
Subject: Re: [PATCH v7 09/11] iotests: add testrunner.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-10-vsementsov@virtuozzo.com>
 <20210122141132.GG15866@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0084a070-e68e-0efc-b979-7b044ae31787@virtuozzo.com>
Date: Fri, 22 Jan 2021 17:22:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210122141132.GG15866@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM9P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::16) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM9P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Fri, 22 Jan 2021 14:22:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 874b6b10-d3db-4392-e23e-08d8bee136d2
X-MS-TrafficTypeDiagnostic: VI1PR08MB3791:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3791B15A01344C68B137FE97C1A00@VI1PR08MB3791.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 33B7o7bZLb+jlM/HxDdRGQtYvBdmEvsQcL4biOXFSgVbb2rM2pHlvCl5E+lW1tMqWY1mzXT6lWfHJ1E9Z9Pzk2gcZoXAFT7O9A+RNnXoF5Sa3RFT1iMHOY8a/wqUUtHCYb2bLJGizSHydpGbL0fcZc0w7PXJhWW3Zaih/JsqreKXrLyPWr1PnNVSjopSVrgi3QuTVApfp1tRxwQvJYxKQ69ewGwiiHhXmLxhppP/vBa/qK0unecbQqZcIcXAtihGGYVoAxf+NB+YK8yNzYAKMYXqik57oJS4NUSq5OZ3zb/jV/OT6Tv3BWTIQBR3AyTRuY3vlI1c+DE55H18ta+YL8Yxi+gGvtAA2KYfhkt+DvspeO7jnnmXxtZYDgAAcZi+q8+WAnXmecjDPvGHUT3KC0e7TRtcVXOXAZTkGnDcB2c/tb5nEW0KnU/ViZ1HDyMD6iDhSJlo49LstAxliBy6cq2aCi4tyjCFSSLAy5mPM90=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16526019)(36756003)(31696002)(2616005)(4326008)(8676002)(16576012)(52116002)(498600001)(66556008)(6486002)(6916009)(5660300002)(31686004)(66946007)(186003)(86362001)(66476007)(8936002)(956004)(26005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cENLK3k2YlNzSzgxd1I0S2VlcUpFYXBlNU9TV3Qwc05UdkdVa2FrMm5UenFN?=
 =?utf-8?B?Mk5PcVM0dWRrWlJRY1dvakEvYXVjdkdJVE5wdUpEU2NidEJTVnNYN3ZaanpK?=
 =?utf-8?B?UjMveC9pTEF6NUNqNDhjR1FOWU05blA4TG5VUW5yTkdXSHhkdU1FZkt2MzVa?=
 =?utf-8?B?Ykc4cUpQdU90bG01cWxSSU56Tk1MSk1vVFdwZ2ZXeDNhU0c4TFVXWGh1cGho?=
 =?utf-8?B?bVo5bXJhOGU3d1MybHkySHA2NXlnRTdlMFd6WTJ4QURnTUpnYXRlaHl0YWhj?=
 =?utf-8?B?ZThWVjRER01kb25kVjZYWjEzZHdEV3Y5WTh1VWI1bDhEbWgxK0dVTHVCWXlh?=
 =?utf-8?B?amQxM1RGcXdYV3ozRklWdVNZVDBOalZweFg3Mno5QmxzSFVLZkhzcnplS2Js?=
 =?utf-8?B?ZG1GY0ZKL1l6czV6aFErVitFMEFqYWJnd0xIcG5yUVdjK1BvWjcvOE0xaG9k?=
 =?utf-8?B?ZTVJd3VZMDVkb0I0NWhWTmhvTkRaVEpocThPVjBkclpudDF3UEVub0c1Y2cr?=
 =?utf-8?B?UnZJdkR6emcrd2xLMFQ1YndxQjRVOEo5RUF2dzU3YVhjVC9RL0FkOWI3eXBL?=
 =?utf-8?B?bkdpUzNPNC9NcGk5YWxiV3UyTWhRZGEzVHBuZW1TWTlrNG5HVmFpbWNCNk1m?=
 =?utf-8?B?VVd6S1Ivem41WTNmZG94S2pucHVlSW52Mk1SMFpNMDZTd3ZuVkp1ZXgvTkUv?=
 =?utf-8?B?SWc3RU1aaHFqY2RnenNyMmhxN2ExbWhxUnhyYlBXbE1YM1NJeUVjMWp2NEVZ?=
 =?utf-8?B?MWhCOStmNjhHSFFzQ0hrTGZUUjZhVVNIZnBLN204Wk9JS2RqUkNsSzFhaHhH?=
 =?utf-8?B?QmZYQW1wa09BNW1MUmFseERnMDVvSjlHckZxK3BrYXVmU2VxU1RBcTFKa0Fn?=
 =?utf-8?B?em96Rzd4KzhNVFhCR0VEakFGM01PaW5ZZFRRcS9JbEY5UXpEZWxuZnN4cW5y?=
 =?utf-8?B?dEkwckhrK08xUFhqNUJ1MmxhamRycDBtcTlpcG8rWU9sSEpEQk94NnNETElt?=
 =?utf-8?B?c0tLQUVuWnYyOExYYUF3N3NQT0VaTEd6UUFKUTZLOWQwNm4ybThRenNrdk9T?=
 =?utf-8?B?Z2FPWURUQzV0aXRMTzZQYXFDcjRNeUFaNWdWT2t4TDZ3M296NDlyMGpYUXNF?=
 =?utf-8?B?YTZIK3JmZC9hUlU2N2FLcEhYYVRWcVpKVXM1ZFBpdmszSEFEK2hRQVNJSlQz?=
 =?utf-8?B?SlFFK25leW9mRzVWaklKelNUNGVHcUZUM0kwZlJmeVl3REdCN0RkQ1luS2tS?=
 =?utf-8?B?ajdxeEE4YW1keitCYkVjaS9UNklZM2JBaGNJSm44c2pPTGh0cVRva1BjR3RW?=
 =?utf-8?B?d0RWT0Q1bnBQRUNQMTduVkpDN0FMSWtTQUNyMkNqejd4OXE0bCtZUUZ3QkVX?=
 =?utf-8?B?bGx1UmdtbVBMTjlRSEJlSTNXZG4wakE2dXNBcE02VVcwSVpLU3FTMVlxNWN2?=
 =?utf-8?B?RnJCMTZxQkNiSnNnS05NTlJnaGJWajVjTThNZkxRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 874b6b10-d3db-4392-e23e-08d8bee136d2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 14:22:57.1267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAylzEs23oICDGqkNq8j46geYv6XQ5H8GIT/cs6Sp08noe/9FL0TbuSTLwOVBfL9KRrDQA0DNQilUFteE5ag4PpggbGsemFr/wxL+Ek+sUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3791
Received-SPF: pass client-ip=40.107.8.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

22.01.2021 17:11, Kevin Wolf wrote:
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
>> ---
>>   tests/qemu-iotests/testrunner.py | 344 +++++++++++++++++++++++++++++++
>>   1 file changed, 344 insertions(+)
>>   create mode 100644 tests/qemu-iotests/testrunner.py
> 
>> +TestResult = collections.namedtuple(
>> +    'TestResult',
>> +    ['status', 'description', 'elapsed', 'diff', 'casenotrun'],
>> +    defaults=('', '', '', ''))
> 
> defaults was only introduced in Python 3.7, it seems.

hmm, yes

> 
> Why not use a normal class
OK

> 
>> +
>> +class TestRunner(AbstractContextManager['TestRunner']):
>> +    def __init__(self, env: TestEnv, makecheck: bool = False) -> None:
>> +        self.env = env
>> +        self.test_run_env = self.env.get_env()
>> +        if 'MALLOC_PERTURB_' not in os.environ and \
>> +                'MALLOC_PERTURB_' not in self.test_run_env:
> 
> 'MALLOC_PERTURB_' is not in TestEnv.env_variables, so it will never be
> in self.test_run_env here.

Hmm, right..

> 
>> +            x = random.randrange(1, 255)
>> +            self.test_run_env['MALLOC_PERTURB_'] = str(x)

I don't remember why this is in TestRunner and not in TestEnv. May be better to move this logic to TestEnv.

>> +
>> +        self.makecheck = makecheck
>> +
>> +        self.last_elapsed = LastElapsedTime('.last-elapsed-cache', env)
>> +
>> +    def __enter__(self) -> 'TestRunner':
>> +        # pylint: disable=attribute-defined-outside-init
> 
> You can avoid this by declaring the attribute in __init__ without
> initialising it yet:
> 
>      self._stack: contextlib.ExitStack

OK

> 
>> +        self._stack = contextlib.ExitStack()
>> +        self._stack.enter_context(self.env)
>> +        self._stack.enter_context(self.last_elapsed)
>> +        self._stack.enter_context(savetty())
>> +        return self
> 
> Kevin
> 


-- 
Best regards,
Vladimir

