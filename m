Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFD93039E3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 11:11:53 +0100 (CET)
Received: from localhost ([::1]:57084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4LKB-0003w1-FE
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 05:11:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4LHX-0003F0-Fu; Tue, 26 Jan 2021 05:09:09 -0500
Received: from mail-eopbgr20136.outbound.protection.outlook.com
 ([40.107.2.136]:42307 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4LHU-0001RF-7G; Tue, 26 Jan 2021 05:09:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXBAkyNPBHpIBC7cPQ/ItXeZGq7JPRyHwPQw9fpcXQschbzY/LfQjJBvKDjxNb8kL93QI9wvqXyR4wYPvDYyjeREm9PwV6gzUvQZshYZiOgu/MuOYKKkGKtzECqVvrS381MXgspHhDrC30N0nLDxvEpcieB6tXnPCODi7P29B/wjjREyp2oV51NoE9xrH91CXIva2PJLSH/YHC4qi7SvbfJwUOodtFgyiR0CHOEJ6iO10dNx2miWi7hQ8Kmq2QSX7aj8mW/ddhklGZ7wdX1NtcU9FMKDNASw/xJpO4mmEtllfgsZU+KYsspaufqAUJxNpcWX0JoLxYrYp8bknv33rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRK+mLor33EL7kZuSyDx2BftJ8Bl8YJsgx9pTN4we2U=;
 b=StEYK8/+ugmHyucG6Gyx/ieggulOROoHAo2fxZE5Jelk9M1fIG7t1wOzaa2EMuEdAzyIvnTKoT0DWjoLRfEH492hAuXxJaVi5eXr+siRgrwDaAEOIxPXChBjKTQbpDR8JOhHZjuYOjF69wbk72/+BRxPpKfb3H9iHXLlgDxt5VO9PYhFUWqrn0LMN3f744G6mvIDR50wFOqoAmTaLZO0+fBTMAzHKXsgffFTV5oHsUBQYvhqmn3mliArP/OAqYomvF3dimAdgAOQvh7g3wHKNYGAAcdYltsjX/Rmh9tCLDUgxIT7nXz+zx3ex5ZB3fo5gcnRJYlIEAcEPzSNPBVTjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRK+mLor33EL7kZuSyDx2BftJ8Bl8YJsgx9pTN4we2U=;
 b=LFUNOGoS2bhTYvtxdH+TZy7QCEKxGGDPY6q9RZNj/jvw0tlcosju3cyyWJPlGy79vueA1/Y05u3lmO1XuTRhlQyBUhPLm4fT3LHgL1/5gvVXR61Xizxj4QrkkU0x0dJ+7ZS6TuHodMp2IRY8PuMPCn6JTvz8SxAfH9GJH6k559A=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4787.eurprd08.prod.outlook.com (2603:10a6:20b:c9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Tue, 26 Jan
 2021 10:09:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 10:09:00 +0000
Subject: Re: [PATCH v8 2/5] iotests: add testenv.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210123210428.27220-1-vsementsov@virtuozzo.com>
 <20210123210428.27220-3-vsementsov@virtuozzo.com>
 <20210125220528.GA170615@merkur.fritz.box>
 <86218b16-33cd-b9da-cb36-892c301197a3@virtuozzo.com>
 <20210126094539.GA4385@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1d2e022a-68d7-9fcb-cbcd-837b3089d4b2@virtuozzo.com>
Date: Tue, 26 Jan 2021 13:08:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210126094539.GA4385@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.100]
X-ClientProxiedBy: FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.100) by
 FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.6 via Frontend Transport; Tue, 26 Jan 2021 10:08:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec95bb04-b523-496c-4232-08d8c1e26678
X-MS-TrafficTypeDiagnostic: AM6PR08MB4787:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB478720A4B85BB8F5F148F997C1BC0@AM6PR08MB4787.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u17Li5SIcIwTJCL6IeP5zerXa/K6oY6Ix+yiprd1Ff+Hvul6Xz8jM975ityyBrCQxPRcXkGTNE8bBaQUYI2FlQMZoH8udmfvLP7qTCjFTtveeGrl1GZXLlhdHlp40BaYqC+i8RV/mysXnlww/PYhO5c96VPG2XUPXPpXLOIoZmxKlmNjje1ky4Jks7EbA2PzjuHIgHGxc6a/93za0BuxcSO4hlmQNGFbaOpSchOMUI0nFB2FnnII0Mzq9OPeQAx/WN2/NhClLRqy86ZxV3hPPzjv5sdrpZDwrNwxjGRoI2bkwr98CkyqMLIuAsIso6buG/NpyrVPpU+x3nmFaFhLGxaarcQ5iTtnYAiMgvjp45k9IJ+39qEVB8Gn+FawCVJa6wobtDaUhNtBgBhr0xr8hMgq2rpX8kRYndGBZJe6BmfMt8oacC22YMVZ/iaevB5eslTPLwhQI3LlgpGmf8sLsjFTDP58hu5hI750p3SdoJBjr/Y0UqRlaDvnNRS4546VG/eFmsQzlsp4rhrpNPCjdwcS1IBka/I2dM66MQ9adNWhEnDtA28YgsrQ8LExUnL3f8c9cB3EzbC6/dm1JBip0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39830400003)(316002)(86362001)(36756003)(8936002)(66476007)(2616005)(66946007)(6486002)(6916009)(956004)(31686004)(66556008)(31696002)(16576012)(4326008)(52116002)(478600001)(186003)(5660300002)(16526019)(8676002)(2906002)(26005)(83380400001)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eWEwdlF6aXFwbld6aktWUlU2RSs1b2FoMGsrblRLTzcvMDZkUGdvN0wxMnQr?=
 =?utf-8?B?VmRqeU1PUHNDNDJ3SVpmZUp2SGJwNDhGR3FRL3h1bEU4QXF3Y2psK0RzdWF3?=
 =?utf-8?B?RGRLRUs0TEZIQm1MWDQyL2JuenI1SFIrOUJmR29ZZ1k5aFJuanhPRm10aFBz?=
 =?utf-8?B?R1kzMThybDJQTG0xZkZacDBEVjFSMmE2bm9GMFJnanlINTRrTVlHQlRDTFN3?=
 =?utf-8?B?cGhhaDBSTlZTc01vaFU5b0JFdFVtNW9LV1BDUjUxRUZCMFJHTlpMdzlwWFdV?=
 =?utf-8?B?MittTk9FVUtKeENDVW4wTGtCeWdUSHV1ZzVMOTVjcVdma1padENIS0NoSXdl?=
 =?utf-8?B?SmJKajVOWnNOV0NiYisyVWxIQ3diY1NMVkR2MHhqazExMS9nWnJWbjRBemRZ?=
 =?utf-8?B?aDVnaUFvVTI0ZnRKVXczZFpneGcwaDlodStlcTVHdXZFNVdiWUovWkJSQWpS?=
 =?utf-8?B?NDJHZWcwMkpybEVSWS9pUFJHTzlSVEpyMXR2ekdCbStEaFE3STZyZ292aUdK?=
 =?utf-8?B?dFF4L3lzdnhjenF4aUR6RXJpNmpWVGp6TUtBcnQreTFKNkp3RVJaUmdoTVFm?=
 =?utf-8?B?RlIzSW9EL0tlMW8wT1RJNG9lbFpZT1BSUlc3OFM1bDRTdXBoclRyNTlDTklq?=
 =?utf-8?B?Qk5MTkF2dnRUVEp3TGEvcHJpMmFmRW9NcnVKeDRXbDlwUzBtLzVXL0oxcWxG?=
 =?utf-8?B?bkpFTW9xVE55d1BaZkNiZkRjdlU4ZUgrMW1yY2JUK1lJUHk5SFBNTTVYZytC?=
 =?utf-8?B?UDZhNldpZytUSkd2RUFyRlE4SmJCMWdzYnNBc2VlUXlWa3RlVFRHa3laQzZT?=
 =?utf-8?B?SC9NOEFrWU1ENnB4YTZzNlZ2aEpxSzNDd3pZRGZtYVU0NTJEWGxyMVZBOVoy?=
 =?utf-8?B?R0hZRmNmUHJQb3pnd2thYURZOVFtZDFWekszbFdwQnArWkhYMUF6aHRzcWJT?=
 =?utf-8?B?MXpZRzNvak40VnRkZDJPc0Zsamplb09VSWw2Z0w5UFZXaGtKd2pwODZ5Z3JD?=
 =?utf-8?B?MHRPNHpsRnZBUUxKdExSKzZPTDBwazF3dkNkWW91MzNMczh6c05SM1Q0T25Q?=
 =?utf-8?B?UTZBSjZpRC9TR0V2NW5URk03RzZjVlZTQlNJenpFTmRrTkxXMi9wU2lNdHBm?=
 =?utf-8?B?UUFJUGdWdmU4bTJ5U2xDL0d3OUoxbjFJNWtDWHZ2cy96dWNQS2tWTkowZzVC?=
 =?utf-8?B?d1Z1ZHlNWUptK0I0cmY1V2ZhU0RrSVNyM0xCRHN6WFVRd2g4VlBlR3RpVTFF?=
 =?utf-8?B?Z1FIbkxEc3pDSHBhRFM0NUV5dTVqQkNnN0VEZFZQMGxPNFJvUlFOdGZsL3p6?=
 =?utf-8?B?c005Y1ZOS21wSklSeTlpQ2FVWkMvNTAxN1VRYldFOFcrMmNtWDJHUjM0NDQy?=
 =?utf-8?B?bEp5SURxQUxCWHA3V1pWZC9vektqdkZTanZJK2Ivbk5XRzZpTlJ6TVdWZndC?=
 =?utf-8?B?SUcxRXFITjhaNWFQQmRjWFd6S0xCSHBTWVBhcFlBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec95bb04-b523-496c-4232-08d8c1e26678
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 10:09:00.0704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51LPwpfhrWqe9+akYlXaxfM7G0i4rqcufwy/aIfBeIoFF77FNize9YYRUVgV9VxCoYe8U9PNjZVSNb18FaYEBJTGkG6bumd5KH/Pn9VV6zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4787
Received-SPF: pass client-ip=40.107.2.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

26.01.2021 12:45, Kevin Wolf wrote:
> Am 26.01.2021 um 09:28 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 26.01.2021 01:05, Kevin Wolf wrote:
>>> Am 23.01.2021 um 22:04 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> Add TestEnv class, which will handle test environment in a new python
>>>> iotests running framework.
>>>>
>>>> Don't add compat=1.1 for qcow2 IMGOPTS, as v3 is default anyway.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>    tests/qemu-iotests/testenv.py | 278 ++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 278 insertions(+)
>>>>    create mode 100644 tests/qemu-iotests/testenv.py
>>>>
>>>> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
>>>> new file mode 100644
>>>> index 0000000000..348af593e9
>>>> --- /dev/null
>>>> +++ b/tests/qemu-iotests/testenv.py
>>>> @@ -0,0 +1,278 @@
>>>> +# TestEnv class to manage test environment variables.
>>>> +#
>>>> +# Copyright (c) 2020-2021 Virtuozzo International GmbH
>>>> +#
>>>> +# This program is free software; you can redistribute it and/or modify
>>>> +# it under the terms of the GNU General Public License as published by
>>>> +# the Free Software Foundation; either version 2 of the License, or
>>>> +# (at your option) any later version.
>>>> +#
>>>> +# This program is distributed in the hope that it will be useful,
>>>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> +# GNU General Public License for more details.
>>>> +#
>>>> +# You should have received a copy of the GNU General Public License
>>>> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>>> +#
>>>> +
>>>> +import os
>>>> +import sys
>>>> +import tempfile
>>>> +from pathlib import Path
>>>> +import shutil
>>>> +import collections
>>>> +import random
>>>> +import subprocess
>>>> +import glob
>>>> +from contextlib import AbstractContextManager
>>>> +from typing import Dict, Any, Optional
>>>> +
>>>> +
>>>> +def get_default_machine(qemu_prog: str) -> str:
>>>> +    outp = subprocess.run([qemu_prog, '-machine', 'help'], check=True,
>>>> +                          universal_newlines=True,
>>>> +                          stdout=subprocess.PIPE).stdout
>>>> +
>>>> +    machines = outp.split('\n')
>>>> +    default_machine = next(m for m in machines if m.endswith(' (default)'))
>>>> +    default_machine = default_machine.split(' ', 1)[0]
>>>> +
>>>> +    alias_suf = ' (alias of {})'.format(default_machine)
>>>> +    alias = next((m for m in machines if m.endswith(alias_suf)), None)
>>>> +    if alias is not None:
>>>> +        default_machine = alias.split(' ', 1)[0]
>>>> +
>>>> +    return default_machine
>>>> +
>>>> +
>>>> +class TestEnv(AbstractContextManager['TestEnv']):
>>>
>>> I'm getting CI failures here:
>>>
>>> Traceback (most recent call last):
>>>     File "./check", line 23, in <module>
>>>       from testenv import TestEnv
>>>     File "/builds/.../qemu/tests/qemu-iotests/testenv.py", line 49, in <module>
>>>       class TestEnv(AbstractContextManager['TestEnv']):
>>> TypeError: 'ABCMeta' object is not subscriptable
>>>
>>> On the other hand, if I make it just AbstractContextManager without
>>> giving the type parameter, mypy complains:
>>>
>>> testenv.py:49: error: Missing type parameters for generic type "ContextManager"
>>>
>>> I guess I need to have another look into this tomorrow.
>>
>> It may help to use typing.ContextManager instead of
>> AbstractContextManager. mypy is OK with it, probably CI will be OK
>> too..
> 
> Okay, I'm trying now if this change works (on top of v9, of course). If
> it does, I'll just squash it in. I also silenced some of the mypy
> warnings, so that I'm not testing with the following patch squashed in.
> 
> Kevin
> 
> 
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index ca9cab531b..becea1bb7d 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -25,8 +25,7 @@ import collections
>   import random
>   import subprocess
>   import glob
> -from contextlib import AbstractContextManager
> -from typing import Dict, Any, Optional
> +from typing import ContextManager, Dict, Any, Optional
> 
> 
>   def isxfile(path: str) -> bool:
> @@ -50,7 +49,7 @@ def get_default_machine(qemu_prog: str) -> str:
>       return default_machine
> 
> 
> -class TestEnv(AbstractContextManager['TestEnv']):
> +class TestEnv(ContextManager['TestEnv']):
>       """
>       Manage system environment for running tests
> 
> @@ -81,7 +80,7 @@ class TestEnv(AbstractContextManager['TestEnv']):
> 
>           return env
> 
> -    def init_directories(self):
> +    def init_directories(self) -> None:
>           """Init directory variables:
>                PYTHONPATH
>                TEST_DIR
> @@ -114,7 +113,7 @@ class TestEnv(AbstractContextManager['TestEnv']):
> 
>           self.output_dir = os.getcwd()  # OUTPUT_DIR
> 
> -    def init_binaries(self):
> +    def init_binaries(self) -> None:
>           """Init binary path variables:
>                PYTHON (for bash tests)
>                QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
> @@ -122,7 +121,7 @@ class TestEnv(AbstractContextManager['TestEnv']):
>           """
>           self.python = sys.executable
> 
> -        def root(*names):
> +        def root(*names: str) -> str:
>               return os.path.join(self.build_root, *names)
> 
>           arch = os.uname().machine
> 


Strange, that CI doesn't complain AbstractContextManager['...'] in testrunner.py.. Anyway, I think we should consistently use typing.ContextManager, if it works.

I've fixed a bit more mypy complains, I'll post squash-ins in v9 thread


-- 
Best regards,
Vladimir

