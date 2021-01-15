Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C2B2F7994
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:39:47 +0100 (CET)
Received: from localhost ([::1]:51980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0OOI-0000kH-EE
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0OLt-0000Co-Na; Fri, 15 Jan 2021 07:37:18 -0500
Received: from mail-eopbgr70139.outbound.protection.outlook.com
 ([40.107.7.139]:13646 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0OLq-0000o7-CR; Fri, 15 Jan 2021 07:37:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ER3hblIlJ65MxVtbowVBcV257Z+JGfEK0unz5dsb+DtBFXu5T3DRmtISgVakIdUUyuGBeQzvqbKHdQZaUsS9Aq/93rAu2J4bWrKp1GP0LW2OcAovqwJjm/aXxL/CRKWG23evHd92HZFScW00GN8FlajjKKxtb9FzDD3L+7YhgT0JDFpd7UEHAzZ4Y11BMEBhzA9tZILuSbv/Z9dHZStjNqvP+5OnqQOluQCfW7wkO8zfvBLXn3UevVlAF31c9wusV3PxXgKD1dOJvw8OMRD8j9r0Zex0fiH4qLqvujMz/sYZYRaqRcZvHkmf6hTrK5dtE2iPfy8YZ8oU9gTorihXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RkxeoUG8TLLat5EtfaTunCgJ0xVrRDldJn/OmJ7q7A=;
 b=BLb8sgVB3sxGOfFJWBB1bnnnA6owdhBOTD/mnzvVuYLOCFxrBrtrhtNMXxTEBS9RhQUu0eUXLBGLnFWfWgRIWWjpBONzwroZP5RjsVpTxVUHVbF8ga8b22hppHV1Ef9pjM/rdWiHqTxmW2w1RKkvhp2jE+bYl+oZvyKoznCosDkprDpBdTPJF+okiSLHrJKvmTNdBUM2FGH2ZbwGzbDExlTaJorlsFtSt/bZX67ItePHE1i7aiXrclV7SmGyoKfpyvk/OpvcPe5XkcfIMhfd76M3RKhl0JuEQYWPZbkGuAYDN/VE3xyPLPCHn2/SbkeCB2YHhpmWBySstzPRjw/Whw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RkxeoUG8TLLat5EtfaTunCgJ0xVrRDldJn/OmJ7q7A=;
 b=vc3wzXQmDbOOXRfY19WSSeE8BD4lhhND1EshK3J4jjcpOHOxfbfOGXn5WfHOp82XN1EYN8mXumJ2dLkWMZP80sLQcG6bUpH08HcwzLFoqmIF5li2xgAlczL9UoK6LZKqAzMy3GRsnE+9O9lKsAvGmATW+yzR1kaEobRgwOO92CM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 15 Jan
 2021 12:37:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 12:37:09 +0000
Subject: Re: [PATCH v3 02/10] iotests/297: Rewrite in Python and extend reach
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210114170304.87507-3-mreitz@redhat.com>
 <a6000188-ec04-e681-3e59-4e2e7be44574@virtuozzo.com>
 <8c975a86-516e-bdcb-7bc8-9f90dc71eba2@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d34b98bf-c9b2-5629-75ed-1e59ddb94680@virtuozzo.com>
Date: Fri, 15 Jan 2021 15:37:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <8c975a86-516e-bdcb-7bc8-9f90dc71eba2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.75]
X-ClientProxiedBy: AM0PR08CA0027.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::40) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.75) by
 AM0PR08CA0027.eurprd08.prod.outlook.com (2603:10a6:208:d2::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 12:37:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3e851a3-b030-4a6e-6105-08d8b95246ab
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-Microsoft-Antispam-PRVS: <AS8PR08MB59127D27CF259E2E2C68B5F5C1A70@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MeNNlxWqJGbonoeOeB+buByq4SPNfQZkthmESlFM4hl3h9vb4bNXk8exQRA6YPV9gCTSp/aeKZ5vL88O2WiWKZT9R1z6IzcmuWd9cX8CYpXZmP9iRv8iDY00ivNcblNfBly+oMPNf12pEFMfhvtwnteTY9ElQOD4rFJFwxVKKOWYxbHviiL4TPx8G1XLKEK8mGVHGzhuZ1PxZRc6VgxGC7s/aayB7mz2G+yCfbksYTJXGASLlfpnNp4J0f4GMwgilLZ0sAJU3JYJO7I9aruAunAr55QvbEj0XyfBbknuQqlGwnRX6LhFknVuBQeKX6hewoTuOd6Y0OAJsYqGt2U8NA0vTCOA5imppOQZbGmDOfXg+lYHWtJXHzvhLpo0hv0H57Gbtq1sjHGnq+3a/COEpzq5PRskDxlFXWtWdQ1E7O+7EpLuYiW/bgon11oSelokI8pR8Q4CSNaxqtOr2yxI4BwHrfX6W2ncXGbwIJWRTW8grsuai4lP3dAU11jmQP5SHhXR39O07b1caIa9EVRDHFcff2G9kR3j9Y6GQd83I7oSxuCW6S+JHl1N+197zsUIakN57CwAdAGF4bLGo8xiPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39840400004)(186003)(26005)(36756003)(52116002)(2616005)(66556008)(53546011)(5660300002)(478600001)(66946007)(83380400001)(4326008)(66476007)(16576012)(86362001)(6486002)(31696002)(31686004)(54906003)(2906002)(8936002)(956004)(16526019)(8676002)(316002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VTEzekZIMHBOL0tDUlFOSzRPVkh4SHJmajRpZmtLUDBiRnF6c0E4OThnQmpz?=
 =?utf-8?B?cEZyNytZdGd2RjBBMWtzWVJKbzBoak0wRStnc0lxY0tOODNXY2RRUTkweDhQ?=
 =?utf-8?B?cUhPZVdad2c0VWw0ak52aTlnSEZmS0hzeVFXeG1kSlJyM2FnendaUVMzc2RU?=
 =?utf-8?B?c2pYbkdyb0taTnFUeXQ1SzF4VmozaXBWbzdBV0NQM3RDa0ZhRE85SDIwNlNU?=
 =?utf-8?B?ZGt1M0ZudTlpRFd1cUFkbDhzMlMvblpxUXRiOFMrU2Y1U1RsY3ZCM2pYY3hn?=
 =?utf-8?B?cW95RDVFUWhCRURzNkx2cVNnTEZrMjY2SDdQTnYyN1dBeGpJWStkRzc2eWg0?=
 =?utf-8?B?cmtBNVh1MmlTUTE1aXh4M011S2IvbWlNWkw4VlYxaWhEV0RRa0RWd1FYQnRB?=
 =?utf-8?B?SXJFZy94ZmZEQ3BKclMwY2VSVC82aFQrRFNFK0hpem9NbnhpQ0NBN1dpQWRS?=
 =?utf-8?B?QjhTZitXUHlmc29vVnBibnZJdW9VOVlkWFlnUGdIczRGbVBLODIyN2xCaS83?=
 =?utf-8?B?UWpQcDBlemRmZW1kU3VqSDJoaFYyL1hKbVp1aXpXUFBTczJvdkJnSFc5K3BU?=
 =?utf-8?B?U3U2NnF3ZUtJKzJ3ZERQVnhkREdQandlZDdiNkNhTlhrQ2thOWxBei9hUEZo?=
 =?utf-8?B?R0REeUZURWNMUjNMbmMyUEd4bS93cDJGZ0ViRGhhbkFJMHdaWVAzcDMwZ2FG?=
 =?utf-8?B?MlpOTDlJdXpSa3JyNjdTendBRXNzNThVZWlsdGtRZmVKQjM5SWxtWjFxakNw?=
 =?utf-8?B?SmdtbzBsU1VoTFJUSUNhWmRlY0lPTUZJaTJaTjhwTDRCZlltMUlsVFNvT1E3?=
 =?utf-8?B?QmdsQnZEQkRzakZERUhsTVIxRXFDMTU4UXQxM1lYOXlUZU12aEczQXlZNDQ5?=
 =?utf-8?B?cEJDSGJqeUEvOHRBaHI5Yy9JWkpDTVk5Mk9zTnZiTU81eUNNZTJPV09wRU11?=
 =?utf-8?B?NEh5WGpQZzAzbzFwRHZFNmVQMVhFNlJYcE1PbVF0NUNRNmFDSGwyWGRMbStU?=
 =?utf-8?B?ZmtvTEJrWFdVb09sKy9vcFlKMkIwSzljUWtraE1aQmZXUDljMlpJMnlIeXN5?=
 =?utf-8?B?bUdESzBIZW9PRlJ0RXpvWEkzT0Q4OVRMSVZvN1FXRTRGM0JkYXoreG83cHRT?=
 =?utf-8?B?QXdtUVc3ZXBHRVcraWEzNkhJem51R0dBVlJtUEU4djFkR0d3L0dUTEY3dksz?=
 =?utf-8?B?QzBuZHplb1JqcDBNSWVMS2JieGRjQVgvckxiVFlIWk5sRHVON01MUm0zS0lD?=
 =?utf-8?B?WjRYTGNYOEYzV1dXVitES2ZZN3ljNGpPT2duT1V3a2Z2UGtPMTJmQVdqNFlH?=
 =?utf-8?Q?jHj2/RNF8+WrJV8LES9adSngEYWowK5X8h?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e851a3-b030-4a6e-6105-08d8b95246ab
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 12:37:09.8078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxzTVUo4Xb/trkEvNNC/XafD5gylhBdXmnzr+BMjcf1SE8v0H0JRVxHnUrIeBnPkMJK1eluw8pomQOf4lI//r6lKSadlAIO1cmAkET6QnD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.7.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.01.2021 14:57, Max Reitz wrote:
> On 15.01.21 12:13, Vladimir Sementsov-Ogievskiy wrote:
>> 14.01.2021 20:02, Max Reitz wrote:
>>> Instead of checking iotests.py only, check all Python files in the
>>> qemu-iotests/ directory.  Of course, most of them do not pass, so there
>>> is an extensive skip list for now.  (The only files that do pass are
>>> 209, 254, 283, and iotests.py.)
>>>
>>> (Alternatively, we could have the opposite, i.e. an explicit list of
>>> files that we do want to check, but I think it is better to check files
>>> by default.)
>>>
>>> Unless started in debug mode (./check -d), the output has no information
>>> on which files are tested, so we will not have a problem e.g. with
>>> backports, where some files may be missing when compared to upstream.
>>>
>>> Besides the technical rewrite, some more things are changed:
>>>
>>> - For the pylint invocation, PYTHONPATH is adjusted.  This mirrors
>>>    setting MYPYPATH for mypy.
>>>
>>> - Also, MYPYPATH is now derived from PYTHONPATH, so that we include
>>>    paths set by the environment.  Maybe at some point we want to let the
>>>    check script add '../../python/' to PYTHONPATH so that iotests.py does
>>>    not need to do that.
>>>
>>> - Passing --notes=FIXME,XXX to pylint suppresses warnings for TODO
>>>    comments.  TODO is fine, we do not need 297 to complain about such
>>>    comments.
>>>
>>> - The "Success" line from mypy's output is suppressed, because (A) it
>>>    does not add useful information, and (B) it would leak information
>>>    about the files having been tested to the reference output, which we
>>>    decidedly do not want.
>>>
>>> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>   tests/qemu-iotests/297     | 109 +++++++++++++++++++++++++++++--------
>>>   tests/qemu-iotests/297.out |   5 +-
>>>   2 files changed, 89 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
>>> index 5c5420712b..bfa26d280b 100755
>>> --- a/tests/qemu-iotests/297
>>> +++ b/tests/qemu-iotests/297
>>> @@ -1,4 +1,4 @@
>>> -#!/usr/bin/env bash
>>> +#!/usr/bin/env python3
>>>   #
>>>   # Copyright (C) 2020 Red Hat, Inc.
>>>   #
>>> @@ -15,30 +15,95 @@
>>>   # You should have received a copy of the GNU General Public License
>>>   # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>> -seq=$(basename $0)
>>> -echo "QA output created by $seq"
>>> +import os
>>> +import re
>>> +import shutil
>>> +import subprocess
>>> +import sys
>>> -status=1    # failure is the default!
>>> +import iotests
>>> -# get standard environment
>>> -. ./common.rc
>>> -if ! type -p "pylint-3" > /dev/null; then
>>> -    _notrun "pylint-3 not found"
>>> -fi
>>> -if ! type -p "mypy" > /dev/null; then
>>> -    _notrun "mypy not found"
>>> -fi
>>> +# TODO: Empty this list!
>>> +SKIP_FILES = (
>>> +    '030', '040', '041', '044', '045', '055', '056', '057', '065', '093',
>>> +    '096', '118', '124', '129', '132', '136', '139', '147', '148', '149',
>>> +    '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
>>> +    '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
>>> +    '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
>>> +    '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
>>> +    '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
>>> +    '299', '300', '302', '303', '304', '307',
>>> +    'nbd-fault-injector.py', 'qcow2.py', 'qcow2_format.py', 'qed.py'
>>> +)
>>> -pylint-3 --score=n iotests.py
>>> -MYPYPATH=../../python/ mypy --warn-unused-configs --disallow-subclassing-any \
>>> -    --disallow-any-generics --disallow-incomplete-defs \
>>> -    --disallow-untyped-decorators --no-implicit-optional \
>>> -    --warn-redundant-casts --warn-unused-ignores \
>>> -    --no-implicit-reexport iotests.py
>>> +def is_python_file(filename):
>>> +    if not os.path.isfile(filename):
>>> +        return False
>>> -# success, all done
>>> -echo "*** done"
>>> -rm -f $seq.full
>>> -status=0
>>> +    if filename.endswith('.py'):
>>> +        return True
>>> +
>>> +    with open(filename) as f:
>>> +        try:
>>> +            first_line = f.readline()
>>> +            return re.match('^#!.*python', first_line) is not None
>>> +        except UnicodeDecodeError: # Ignore binary files
>>
>> PEP8 asks for two spaces before inline comment
> 
> Wow.  I really hate PEP8.

Wow, it's unexpected :) I like it since first meet..

> 
>>> +            return False
>>> +
>>
>> and two empty lines here
>>
>> (good ALE vim plugin runs flake8, mypy and pylint asynchronously for me and shows these things)
> 
> I’d like to argue that that isn’t good, but I need to quench my anger. Perhaps one day I can quench it sufficiently to install ALE myself.
> 
>>> +def run_linters():
>>> +    files = [filename for filename in (set(os.listdir('.')) - set(SKIP_FILES))
>>> +             if is_python_file(filename)]
>>> +
>>> +    iotests.logger.debug('Files to be checked:')
>>> +    iotests.logger.debug(', '.join(sorted(files)))
>>
>> O, good.
>>
>>> +
>>> +    print('=== pylint ===')
>>> +    sys.stdout.flush()
>>
>> Should not hurt.. But why? Should be flushed anyway as print will put a '\n'.. And why you care about it at all?
> 
> When pylint fails, I can see its result above the '=== pylint ===' line, even though its output is on stdout.  I suspect the Python output indeed isn’t flushed on \n.
> 
> (Test it by dropping the flush(), and then also e.g. 041 from the ignore list.  Perhaps you get a different result, but for me, the errors appear above the '=== pylint ===' line.)

Checked. Hmm, you are right. Interesting. Probably it explains similar issues with failed iotests output I see sometimes..

> 
>>> +
>>> +    # Todo notes are fine, but fixme's or xxx's should probably just be
>>> +    # fixed (in tests, at least)
>>> +    env = os.environ
>>> +    try:
>>> +        env['PYTHONPATH'] += ':../../python/'
>>> +    except KeyError:
>>> +        env['PYTHONPATH'] = '../../python/'
>>> +    subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX', *files),
>>> +                   env=env, check=False)
>>
>> as I understand, you don't need env argument, as os.environ is inherited by default.
> 
> Yes, but os.environ['PYTHONPATH'] doesn’t include ../../python/, which is why I copy it.
> 
> On second though, I don’t copy it.  I think the “env = os.environ” line should be “env = os.environ.copy()”, actually, or I’ll modify 297’s own PYTHONPATH.

I think modifying os.environ won't hurt in this case.. But copying is more strict of course.

> 
>>> +
>>> +    print('=== mypy ===')
>>> +    sys.stdout.flush()
>>> +
>>> +    # We have to call mypy separately for each file.  Otherwise, it
>>> +    # will interpret all given files as belonging together (i.e., they
>>> +    # may not both define the same classes, etc.; most notably, they
>>> +    # must not both define the __main__ module).
>>> +    env['MYPYPATH'] = env['PYTHONPATH']
>>> +    for filename in files:
>>> +        p = subprocess.run(('mypy',
>>> +                            '--warn-unused-configs',
>>> +                            '--disallow-subclassing-any',
>>> +                            '--disallow-any-generics',
>>> +                            '--disallow-incomplete-defs',
>>> +                            '--disallow-untyped-decorators',
>>> +                            '--no-implicit-optional',
>>> +                            '--warn-redundant-casts',
>>> +                            '--warn-unused-ignores',
>>> +                            '--no-implicit-reexport',
>>> +                            filename),
>>> +                           env=env,
>>> +                           check=False,
>>> +                           stdout=subprocess.PIPE,
>>> +                           stderr=subprocess.STDOUT,
>>> +                           text=True)
>>
>> Can you really use "text" ? We require python 3.6 (in check), but text comes from 3.7..
> 
> Oh well.  My fault for just reading the current docs.
> 
>> It may break some test environments. I think we need old good universal_newlines=True which is the same.
> 
> Good enough for me.
> 
>> With s/text/universal_newlines/:
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Thanks!  I’ll clean up the PEP8 violations, make the “env = os.environ” line an “env = os.environ.copy()”, and use universal_newlines here.
> 

OK, thanks, keep my r-b with it.


-- 
Best regards,
Vladimir

