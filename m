Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF352FF208
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:34:42 +0100 (CET)
Received: from localhost ([::1]:51542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dqz-0001zu-4k
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2dat-0004Jr-F2; Thu, 21 Jan 2021 12:18:03 -0500
Received: from mail-eopbgr40100.outbound.protection.outlook.com
 ([40.107.4.100]:63809 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2dao-0007I4-70; Thu, 21 Jan 2021 12:18:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIGsq78eC1e3NVj0q6volW9ipOBnYawSdEriQqXYDUJ3TXCtvg+p2BZKoFdjInsh41pFFn0dJMofyRlEiRWSI+kpEzOhhLlsmwgrjKEOMrpPLT9gTFvvKpTiiajfXtVxwGTlI9rc9+boasA9Pvh9o9yccwoHENUZVMnGsj0WnDyufx3cWOr088cfPIT0JWoY8ZotP0NSGKtcjRcLNhDnb6puYO1FpcAOJoiyPXfiURM6uuUl/VsOxheTY7Rbw1ZYF6I7opH6hYaeCes17ZnGHlBgRznEu2iKUI+wNYRzUDCrXPVbR2BGfNiFrkCgG1v0adYyaAMgD34hh71x/7Wd0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DTlx7BTvI3yFxlKip/Uxspv+CFnSRVrsDJOlBuWW2w=;
 b=JhqMVIwP9D2U6s8VCtxOSXp87hAI67htzKv89MJXpyaTbRyQpwLCfaB/qyraZmXUCjrybHYxMPZppP3/SF3FgRXUoNll6m3MTHlvrMjnS5f/iIceJGurZIoJGPv/w5NY3F4uVV5CHMjkiNtSkA3xhkujm0cilJMdL36c983fZz7yi59LWeYNhqczWZbhFdcszQVAhjuDm8wcDI4c0lclTcxdUXdUCuQQjhN9qxdLVgzs10N4W2CeBtg66bNsKsdFSHJ1ormdagR28S7s5LagJUIbv8oLElt2iaF9G00xJzksJyURibRkjz7/ki1fqP/xQThbteiXTBjULjiQq7eqow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DTlx7BTvI3yFxlKip/Uxspv+CFnSRVrsDJOlBuWW2w=;
 b=EcMWP+Y38+kr4D+4PCRhsbKglZDmzosGHmnof9IWb2bCnI4WWgaavrjNZ2V1nR/PBV3uPYEVt4EMdZDhCZ3Hek//7BM7HZoGvBjtuQ3Jbk3/i3tWer3Q5BaBawfQTd3njfzwkiP87gRIGWdAa7/WBnuORGaY7xzgzRyddVs+k+o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4469.eurprd08.prod.outlook.com (2603:10a6:20b:70::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 21 Jan
 2021 17:17:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 17:17:49 +0000
Subject: Re: [PATCH v7 09/11] iotests: add testrunner.py
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-10-vsementsov@virtuozzo.com>
 <ee9c73e1-2c33-2df0-0af7-ad19a29c8139@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <abb3036d-b451-8b7b-d732-b6586c43ca3d@virtuozzo.com>
Date: Thu, 21 Jan 2021 20:17:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <ee9c73e1-2c33-2df0-0af7-ad19a29c8139@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM8P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM8P189CA0025.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 17:17:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfcdc22a-7f1b-4e64-4f28-08d8be307a44
X-MS-TrafficTypeDiagnostic: AM6PR08MB4469:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4469B03442FA55A3773AD1F9C1A10@AM6PR08MB4469.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6uWuYqx7jr5s+Ku8XTr0yJPlMTGujEGdUh4HfKJ0ISLALndVXutesI3d1a/7t+q69RjK3/7aXkugFArziGFxdmBJNjLmG5b9wntyI+/3sBG5wxMRvIZUu3UTTlxIyTDAByblw/gNjSzbBL8o8YgjIfXnT/QYVsI2yjq7wfWYPb09+G7hauqaHOqR/mklzuMHI7LESzmGLBHufKK6wC/qIIrX/5zLtN13vbiWn/ptZfXs0HdTa/yv7fa9i/MzGfbGYySdULBMGNONSMmLx3aAy+RDa4lvwoJr3E2oueoz/vcZMjCAMyDC9suLx1yk4H541Dk6kQqn+3vpX9mNq+wEouOJEk4wCv1gGyzLTdFdFyvYovSpcmfdo4DY7+WcJGqTRiTajiRAxweIz/KcWSvUvt6nT+N868B/cCFCEDGsO17b4XOMQeXD67ythzPKAF4G1W/vjYuJzIgfmIpoDGyLLLKQRcVQdNQkxQMcmUAFwvQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(376002)(346002)(39840400004)(16576012)(66556008)(316002)(2616005)(4326008)(186003)(956004)(31696002)(31686004)(83380400001)(86362001)(36756003)(16526019)(26005)(8676002)(5660300002)(6486002)(478600001)(53546011)(52116002)(66946007)(2906002)(8936002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RFdhUkpuNkcySWlEWUFkZHhacDZyVXJ0VUpNTmtjWkFzUlN0T2ZoZHR0TW1H?=
 =?utf-8?B?TUJ1L1RTQTFPMEk1N2lZVmM4U0JHRmZ5R2tSMHpoQ3B4eUcyTmpPb05nSWdn?=
 =?utf-8?B?SkdrZGxIRGpDM016SDR1bmF1RWdMM294TklGSFpKWTUzaVJ0aVprOXJXandR?=
 =?utf-8?B?TU1Ha05KM2IvMkE0K1FiSWFYUGZ0TGEvSDk0RTBMeFQ0TjNEVVphWVZnSXM5?=
 =?utf-8?B?cVp3OVFkUi8xOWZsREtnSnN6TXgyRVloZ2Rna3ZjQlZUZW8wOGR4amMwSnpx?=
 =?utf-8?B?QnFFcDBiWDV5aGRlNE9LMXFHMjY5b1UvV0EvUWI5a1ljckN5b0NtUkV6eVQw?=
 =?utf-8?B?Y0xCSFFhUGJTZS91ZGVkRk1oMndCV21vUmxBa1c5UjdPbmhMRWJDcXR3VE4v?=
 =?utf-8?B?a0VDdmVUR1hXa282KzMyQ2tsdTJnWU84bmgyN3dsZ1FzSWlZOHVqWlRKeld3?=
 =?utf-8?B?ZUJ1M2cySmxYcUVkTnlqYU1NbElaU05jcDlvSzJjSGR3QmRUaFpsVGtTYXVH?=
 =?utf-8?B?ODU1SjNjNjVtdkcrME9mdTd5SlJqUmpINnVsTVNFZjVEaDhleGcvWnRUS0tx?=
 =?utf-8?B?Q3NEMityMVJTZHdvdFltYnZwNlRyNHBuTzZ6MVJYZHFEaEc1aHYveUV2YUpV?=
 =?utf-8?B?OGRrZXI2RVJSVlU4UkttV1dMUHZiMk5zTlZjQVQvTUpTOU5xOWlNMjIyZUd1?=
 =?utf-8?B?aVNpVGtYMUJWcmFJMEw3cG0vZndxSEpVMVNROWN1b2dNR1UrZHp5bFhjRnZm?=
 =?utf-8?B?eC95cEhZSjM5Y1FubVI0dUpHcGZZaStKT1VySXBvbTNpSWFGMjkyd1lRamFn?=
 =?utf-8?B?QW5CdHZ1bG9Ub2ZBa053bTcwTG1BRlhISTNjNVNBWFpkcE5DcW00VGNTamI2?=
 =?utf-8?B?TjNBMkhWeVNWU1NNMUEvVTZRcnlOODBvd1luQmJkV0RjOFdhdXBJbThKRG9Q?=
 =?utf-8?B?MmNZaUdXVkxjeWxxTng2bk9OQkw2TjZDUm9hMTFsUjdEb2x5Mks5dkxhamVm?=
 =?utf-8?B?Vzdia05lREU4L0pVa05tcjJUL2I1aUpnY0FuVnhOcUZkYTIvd09qKzdmWnBB?=
 =?utf-8?B?Qm9aa0x0N0RUd3E5bUxYZFhPQUY1Qm5mS3RvMjkwbjg5Z1FxTmZxUlB2Umpl?=
 =?utf-8?B?RStZc2x2cTBHanoyL2ZIbXFPak5Kek9MWlpLaFgwYURJSkVMdjhrWHg3TnMy?=
 =?utf-8?B?UXJDREVLUnEwdVNYQWU5c3lMOGdmMDVoNVdzWnhzdDVWckNqTWFKMy9BbGxV?=
 =?utf-8?B?SHFkUVpraktWRUtQVStTd2pBRXFObFFaamJKUWFpNlpVUTB2L0lIUkFJV0Nt?=
 =?utf-8?Q?+LID7yCeD0xI0fvxvg9bulEdYIh7VS4EBP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcdc22a-7f1b-4e64-4f28-08d8be307a44
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 17:17:49.2766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFkfmr1ZFoaHU62oqjNSn4OH/xmverDUhOwoV2dar34kvcKXOIPhq6si4jlNUyUKNJiupXw3lWl9QwMSJZqEzn5ZzaikghzBpUS2r1xnvJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4469
Received-SPF: pass client-ip=40.107.4.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.01.2021 20:02, Eric Blake wrote:
> On 1/16/21 7:44 AM, Vladimir Sementsov-Ogievskiy wrote:
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
> 
> Awkward wording.  Maybe:
> 
> Instead of using "diff -w" which ignores all whitespace differences,
> manually strip whitespace at line end then use python difflib, which no
> longer ignores spacing mid-line
> 
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/testrunner.py | 344 +++++++++++++++++++++++++++++++
>>   1 file changed, 344 insertions(+)
>>   create mode 100644 tests/qemu-iotests/testrunner.py
>>
>> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
>> new file mode 100644
>> index 0000000000..92722cc68b
>> --- /dev/null
>> +++ b/tests/qemu-iotests/testrunner.py
>> @@ -0,0 +1,344 @@
>> +# Class for actual tests running.
> 
> for actually running tests
> 
> again, should this file be 755 with #! python?

In my latest considerations - no it shouldn't.. We still make implement __main__ things later if needed.

> 
>> +
>> +def file_diff(file1: str, file2: str) -> List[str]:
>> +    with open(file1) as f1, open(file2) as f2:
>> +        # We want to ignore spaces at line ends. There are a lot of mess about
>> +        # it in iotests.
>> +        # TODO: fix all tests to not produce extra spaces, fix all .out files
>> +        # and use strict diff here!
>> +        seq1 = [line.rstrip() for line in f1]
>> +        seq2 = [line.rstrip() for line in f2]
>> +        return list(difflib.unified_diff(seq1, seq2, file1, file2))
> 
> Offhand, do you have the list of tests where (actual/expected) output
> has trailing whitespace and would fail without the .rstrip()?

No.. But it's simple to make it

> 
>> +
>> +
>> +# We want to save current tty settings during test run,
>> +# since an aborting qemu call may leave things screwed up.
>> +@contextmanager
>> +def savetty() -> Iterator[None]:
>> +    isterm = sys.stdin.isatty()
>> +    if isterm:
>> +        fd = sys.stdin.fileno()
>> +        attr = termios.tcgetattr(0)
> 
> Isn't fd always going to be 0?  It looks odd to hard-code zero in the
> very next line; either we should s/0/fd/ here, or...

agree that's strange.

> 
>> +
>> +    try:
>> +        yield
>> +    finally:
>> +        if isterm:
>> +            termios.tcsetattr(fd, termios.TCSADRAIN, attr)
> 
> ... s/fd/0/ here and drop fd altogether.

Either way is OK for me, I think, I'll do s/0/fd/

> 
>> +
>> +
>> +class LastElapsedTime(AbstractContextManager['LastElapsedTime']):
>> +    """ Cache for elapsed time for tests, to show it during new test run
>> +
>> +    Use get() in any time. But, if use update you should then call save(),
>> +    or use update() inside with-block.
> 
> Grammar is hard, maybe:
> 
> It is safe to use get() at any time.  To use update(), you must either
> use a with-block or first use save().

OK, thanks

> 
> 
>> +    def test_print_one_line(self, test: str, starttime: str,
> 
>> +
>> +        if status == 'pass':
>> +            col = '\033[32m'
>> +        elif status == 'fail':
>> +            col = '\033[1m\033[31m'
>> +        elif status == 'not run':
>> +            col = '\033[33m'
> 
> This hard-codes the use of ANSI escape sequences without first checking
> that we are writing to a terminal.  Is that wise?  Should we have this
> be tunable by a tri-state command-line option, similar to ls --color?
> (--color=auto is default, and bases decision on istty(), --color=off
> turns color off even for a terminal, --color=on uses color even when
> outputting to a pipe, which can be useful depending on the other end of
> the pipeline...)

Hmm, yes. It's preexisting in old bash check script I think. I can add a separate patch for it

> 
> 
>> +        with f_test.open() as f:
>> +            try:
>> +                if f.readline() == '#!/usr/bin/env python3':
>> +                    args.insert(0, self.env.python)
>> +            except UnicodeDecodeError:  # binary test? for future.
>> +                pass
> 
> Is pass the right action here?  Or will it silently skip a test file
> with encoding errors?

No, we'll not skip it. Here we just failed to recognize python test, so, it will be executed as self-executable. So, if there are real problems, we'll see them when try to execute the file.

> 
> Again, I'm not comfortable enough to give a full review of the python,
> but it looks fairly similar to the existing shell code, and with the
> series applied, things still work.  So I can offer
> 
> Tested-by: Eric Blake <eblake@redhat.com>
> 


Thanks a lot for testing and reviewing so many my patches!!

-- 
Best regards,
Vladimir

