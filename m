Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA2A2F789D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:21:32 +0100 (CET)
Received: from localhost ([::1]:37998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0O6c-0001Ym-TK
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0O4U-0000Tk-9A; Fri, 15 Jan 2021 07:19:18 -0500
Received: from mail-eopbgr70103.outbound.protection.outlook.com
 ([40.107.7.103]:33688 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0O4N-0000hw-VQ; Fri, 15 Jan 2021 07:19:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3O5gNrfzNa/CVY2OkUtk8awSHhtwe7MnNKqAEiHmrHKjyba1+brdY1ep7lh4coXpBXUHwuG4czZJe624dgR/2pKs8GuDzsUvl1HPtCYmWI4JR+XIRhVzhsNCI0vEF5xcfZNSDzsIhnTW2y76w1ev68nPwW80Hh4l+ITY5ZGlNn7Cn0ixiVIaOgXXBhB9W4agS3cspT2XVrwg4GcI/q/dSa2fp2KE7Hdi10OvZbVfUSIT9gFBcQwKG2BwRLu3TSJof5OumSfZtW1Nt5InCYJcBjb/vpKE9MasrjJ6a+YrPjhzt/QVUte7+7KwIvV/FPS9Bx8dEgx4vUxuQhPVG30ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fl4XFTeYrmEhN1rRdBl8TdwZR+jnd90OZX1VI23W6SU=;
 b=SagMZqnrrWvOS2Fvex1PwW6KCuKDB9yvFQxMC6jI/EKYtl6P42TbSIUfEnQkZ3rIlK1g54cgmsj4MLyF8ZTmw0sPajYhxL5k0G1o8O3BWEwWzZ9Du+CB1s3or27WUly4y4uYNBo1WS9M+Y1+lp218meuTN7KyiYRa1fESSnpIe/jBzCtjYk2TnOIX3Af+wRlgxyn/4crpHN1asMQxmx6o8Yh6wPLHvYvKnF5+Tf3SMDJ5gAPtoo6QTWKGcg3jrXDasL2g4rtxWdIiPT5sJY9bUDAxOwEmb76Xm6YqHyyXshb7glJGj70hAaugu6fuEiiTNJJbX4r5n4feh2YE+QKxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fl4XFTeYrmEhN1rRdBl8TdwZR+jnd90OZX1VI23W6SU=;
 b=RnfdRvsDjH8lqzuN/3kWG2Zj1vMD8qsn0dS9kpFeCyg8L7TaxMhhG6JmFqSo0cdNIEqoapge/xmkYUERu97HypzEOvt7K45STeRnxktO7GATMdDZk5261kfcKAVMJqeQE3Jzsj34DiquYLTF4lyifYnuSlbdLkYD0VAgiOj0soY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Fri, 15 Jan
 2021 12:19:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 12:19:07 +0000
Subject: Re: [PATCH v6 08/11] iotests: add testenv.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-9-vsementsov@virtuozzo.com>
 <20210115111827.GB5429@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6fbbcc18-3f14-bcd6-05a2-a40e0352710d@virtuozzo.com>
Date: Fri, 15 Jan 2021 15:19:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210115111827.GB5429@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.75]
X-ClientProxiedBy: AM0PR10CA0001.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.75) by
 AM0PR10CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Fri, 15 Jan 2021 12:19:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ed88295-aedc-4915-3595-08d8b94fc1be
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35440A2E7ACEAAF61FD983D9C1A70@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tc4k1p9aT2vV5IBfozFXjT3qOFzFMx9hzalcBEyb9hHhNeZrcIRboObkCoOKrLGaFLgrsfEvbywZy0FaW7YAn/Sq7Q8+aBYSfvsSH9MNyktmBbHAO2CRECHHrab3z/WLwgFqeCCBWwA4k9ivq06h7xyjUnDfWDt6r7Pt/qu03+XnInU7JczyTEFKIbGTVICz/JCcYFf2TV309ULT6/8RKi9hH1rDkhPw2YoG626SSJqk0hLhKfz/8MXZMfimoSN0Dnd3fBQmKrTSmPOJKsi3NVkky0qyv6VuQUeN49pbRMAsjphXcO+hW4xxe1rzIQCbaT1v5vLx0vFQMdmrebjpcFDUWez3d4MUwuZ/Q0qHICDQ/XBMAOwGVp+UgHxChydPnWFo3EQ9DoVASWCQcYXdYIESgvLplelFIkkG5YqoXGIZrd8VHoDq0urE/3jkga+D/9+wZEVtu5FvoIZZ287n7YWJ88Yp2sG7SXM8o/vNcrRYRrWX5DkMJOwej4Je3sgx0lQEeu9hL+wTd3stU5fJiYfzS94gnhvO+BsEJlTb/+thMLMt7iEGO5ckxjCxJV08uxKRklL9IY0lWNouPkhAMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(346002)(366004)(136003)(376002)(86362001)(31696002)(8936002)(6486002)(66556008)(36756003)(66946007)(8676002)(16526019)(66476007)(5660300002)(52116002)(478600001)(4326008)(6916009)(956004)(16576012)(26005)(186003)(2906002)(316002)(83380400001)(31686004)(30864003)(2616005)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d1pWc0dHTjlvT2ZMVjZrbDlCbGdkQ0k2akVWUUw2RGhwWHUxcnQ1eHZmSHlY?=
 =?utf-8?B?RUE3ZktyY3p1cnBsbGluYnJYZGVvUFJFTjRpeWFoMjlNWFhzTU81V1dnS2cx?=
 =?utf-8?B?SldodEN6dWhLckFZZWhlb0hoSkwyT3AyV1ZxVkNuQ0RFcFJQSzFjem5EaXhC?=
 =?utf-8?B?N0FKcTBDbkJoa1U0a29BTVViaXJMR2NiZ1hhOUwxSEFybXdQVjdjeDZQc1Mx?=
 =?utf-8?B?ODZZdjNETCtVL3RrR0FkMmNlVFQzTWZUdzdKLzdIM3c2VHpnVnViQUJzYm9S?=
 =?utf-8?B?eThpbTJDVGJrM053blZGNGFXWXRpT2IydGhHNnIxL3ExcS9ETnQ2aXAxMnp3?=
 =?utf-8?B?VGZoa1hwbFNCRWVTcnRiWHNaRDdEQjRtc1hEMHZnbmlMc3lOeXlEbXNXT1RD?=
 =?utf-8?B?cjcvRzhCMEU0cmFzM3NaaFBpU0NlN01iOHQrc1ByR2x0czJ6NWJtZDZsVU1t?=
 =?utf-8?B?b3hTTG1YVVZNcFkvVStMTG1aUlJlRWdRaVprZUsyV1cxcnh4UmFZMlowenRO?=
 =?utf-8?B?cVNYL0s2SDZFdy9zOXhuNmo0cWg3RFJ5S0FweG9GSVV4KzR4ZFY2ME9DOTRl?=
 =?utf-8?B?eE9GdTVYYjYxNFBkWndrTTFYMStTbDduRndxRmZ4OXNyeWh1cTNmNDdIVXBn?=
 =?utf-8?B?T0E1aVU5NEk5NUZOR2lTOEZBQ1Q0eDYvbEdNd2w1Wjc2TXQyRHJGc09INHlO?=
 =?utf-8?B?eHRBczRsZGRiUWpDMkZpNUNGMnRUaXliZE1HRXQ5bUdPUlRHYUdwNXMzU2FG?=
 =?utf-8?B?YitlSFNxb3FLTTBzVGltWVE4L0RKTHNtTU1RT0RsdFAvejFMZnl2TUpyUTM4?=
 =?utf-8?B?Z0JwcldxVllEMkVCZzJrVytjUGoyaHd0SFB0VnEwdlgxRlFnQXFxbVQ3eXpq?=
 =?utf-8?B?Nk4xQytQbkVRekowanZqcWcxVUVyS21SbGNkOUVYK0lyRWVmdUEyem56aURx?=
 =?utf-8?B?R1RYTDFNbXNPUEQwaDYweGdLYWo1VHVHVDVMYW1LWnFWMUFvREF6REEwNmcr?=
 =?utf-8?B?VXRDZ3Y2UTVyeWI3K3E2RDVmTnJVSWptV21wU1Y0VElvQmkyeEtHR053SlVE?=
 =?utf-8?B?Y0tqM3h2bzZ0SGt4NlF0V0NrRFpnTzB4ZjZHUTJtWDdzTmw3cndKeWtvc25S?=
 =?utf-8?B?NEVGRUlrRzlGYnYvVG53dFhXMUt2MDJTYTUySVB0cmFtUXZJaXdhOGkyZVZH?=
 =?utf-8?B?bmRrSS9sbGpuS2Y3amN5ZGFVYmNGR2czWGxPazRjcFRuY2d6aFdDMVhaR1F3?=
 =?utf-8?B?a3BkTE9FcytZSHFqVjRFVFAwdG9oMjNFakx2Z3pvb0JMUzM4anVTbEFueVBW?=
 =?utf-8?Q?q+t0a/vY46AMslI/tGajY8cfBIQH/iX95T?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed88295-aedc-4915-3595-08d8b94fc1be
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 12:19:07.8272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BP4QIRQ4NVgteScoYHdgOWXXfYOYm5k2AGZn/cdbU0WbXgkbprucxRi5ZVRPsptGIGnZ+kTCUp9fpQV0r+VPW/QfsnmCeS21xkR6hI6GPd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.7.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.01.2021 14:18, Kevin Wolf wrote:
> Am 09.01.2021 um 13:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Add TestEnv class, which will handle test environment in a new python
>> iotests running framework.
>>
>> Difference with current ./check interface:
>> - -v (verbose) option dropped, as it is unused
>>
>> - -xdiff option is dropped, until somebody complains that it is needed
>> - same for -n option
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/testenv.py | 328 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 328 insertions(+)
>>   create mode 100755 tests/qemu-iotests/testenv.py
>>
>> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
>> new file mode 100755
>> index 0000000000..ecaf76fb85
>> --- /dev/null
>> +++ b/tests/qemu-iotests/testenv.py
>> @@ -0,0 +1,328 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Parse command line options to manage test environment variables.
>> +#
>> +# Copyright (c) 2020 Virtuozzo International GmbH
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License as published by
>> +# the Free Software Foundation; either version 2 of the License, or
>> +# (at your option) any later version.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License
>> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> +#
>> +
>> +import os
>> +import sys
>> +import tempfile
>> +from pathlib import Path
>> +import shutil
>> +import collections
>> +import subprocess
>> +import argparse
>> +from typing import List, Dict
>> +
>> +
>> +def get_default_machine(qemu_prog: str) -> str:
>> +    outp = subprocess.run([qemu_prog, '-machine', 'help'], check=True,
>> +                          text=True, stdout=subprocess.PIPE).stdout
>> +
>> +    machines = outp.split('\n')
>> +    default_machine = next(m for m in machines if m.endswith(' (default)'))
>> +    default_machine = default_machine.split(' ', 1)[0]
>> +
>> +    alias_suf = ' (alias of {})'.format(default_machine)
>> +    alias = next((m for m in machines if m.endswith(alias_suf)), None)
>> +    if alias is not None:
>> +        default_machine = alias.split(' ', 1)[0]
>> +
>> +    return default_machine
>> +
>> +
>> +class TestEnv:
>> +    """
>> +    Manage system environment for running tests
>> +
>> +    The following variables are supported/provided. They are represented by
>> +    lower-cased TestEnv attributes.
>> +    """
>> +    env_variables = ['PYTHONPATH', 'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
>> +                     'OUTPUT_DIR', 'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
>> +                     'QEMU_IO_PROG', 'QEMU_NBD_PROG', 'QSD_PROG',
>> +                     'SOCKET_SCM_HELPER', 'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
>> +                     'QEMU_IO_OPTIONS', 'QEMU_NBD_OPTIONS', 'IMGOPTS',
>> +                     'IMGFMT', 'IMGPROTO', 'AIOMODE', 'CACHEMODE',
>> +                     'VALGRIND_QEMU', 'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC',
>> +                     'IMGOPTSSYNTAX', 'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE']
>> +
>> +    def get_env(self) -> Dict[str, str]:
>> +        env = {}
>> +        for v in self.env_variables:
>> +            val = getattr(self, v.lower(), None)
>> +            if val is not None:
>> +                env[v] = val
>> +
>> +        return env
>> +
>> +    _argparser = None
>> +    @classmethod
>> +    def get_argparser(cls) -> argparse.ArgumentParser:
>> +        if cls._argparser is not None:
>> +            return cls._argparser
>> +
>> +        p = argparse.ArgumentParser(description="= test environment options =",
>> +                                    add_help=False, usage=argparse.SUPPRESS)
>> +
>> +        p.add_argument('-d', dest='debug', action='store_true', help='debug')
>> +        p.add_argument('-misalign', action='store_true',
>> +                       help='misalign memory allocations')
>> +
>> +        p.set_defaults(imgfmt='raw', imgproto='file')
>> +
>> +        format_list = ['raw', 'bochs', 'cloop', 'parallels', 'qcow', 'qcow2',
>> +                       'qed', 'vdi', 'vpc', 'vhdx', 'vmdk', 'luks', 'dmg']
>> +        g = p.add_argument_group(
>> +            'image format options',
>> +            'The following options sets IMGFMT environment variable. '
> 
> s/sets/set the/
> 
>> +            'At most one chose is allowed, default is "raw"')
> 
> s/chose/choice/
> 
>> +        g = g.add_mutually_exclusive_group()
>> +        for fmt in format_list:
>> +            g.add_argument('-' + fmt, dest='imgfmt', action='store_const',
>> +                           const=fmt)
>> +
>> +        protocol_list = ['file', 'rbd', 'sheepdoc', 'nbd', 'ssh', 'nfs',
>> +                         'fuse']
>> +        g = p.add_argument_group(
>> +            'image protocol options',
>> +            'The following options sets IMGPROTO environment variably. '
>> +            'At most one chose is allowed, default is "file"')
> 
> Same as above, but also s/variably/variable/.
> 
> Do we consider these environment variables user interfaces? So far I
> thought of them as implementation details, but I guess if we want to
> allow users to execute test scripts manually, they are some kind of user
> interface.
> 
> However, shouldn't the variables themselves then be documented
> somewhere? As it is, this feels like documenting thing X to be the same
> as thing Y, without ever saying what Y is.

Yes, I do think that we lack some specification on the test interface, including
environment variables.. And then, probably some unification of the interface, to
be more clear and straightforward. But don't want to improve/refactor these things
in these series.

> 
> That said...
> 
>> +        g = g.add_mutually_exclusive_group()
>> +        for prt in protocol_list:
>> +            g.add_argument('-' + prt, dest='imgproto', action='store_const',
>> +                           const=prt)
> 
> ...maybe we should just have help=f"test {fmt/prt}" here to match the
> old help text. Then this documents the option and the help above
> actually documents the environment variable.

OK

> 
>> +
>> +        g = p.add_mutually_exclusive_group()
>> +        # We don't set default for cachemode, as we need to distinguish dafult
>> +        # from user input later.
>> +        g.add_argument('-nocache', dest='cachemode', action='store_const',
>> +                       const='none', help='set cache mode "none" (O_DIRECT), '
>> +                       'sets CACHEMODE environment variable')
>> +        g.add_argument('-c', dest='cachemode',
>> +                       help='sets CACHEMODE environment variable')
>> +
>> +        p.add_argument('-i', dest='aiomode', default='threads',
>> +                       help='sets AIOMODE environment variable')
>> +
>> +        g = p.add_argument_group('bash tests options',
>> +                                 'The following options are ignored by '
>> +                                 'python tests. TODO: support them in '
>> +                                 'iotests.py')
> 
> Let's not print TODO comments to the user, but just make it a comment in
> the code. That makes it stand out better with syntax highlighting
> anyway.
> 
>> +        g.add_argument('-o', dest='imgopts',
>> +                       help='options to pass to qemu-img create/convert, sets '
>> +                       'IMGOPTS environment variable')
>> +        p.add_argument('-valgrind', dest='VALGRIND_QEMU', action='store_const',
>> +                       const='y', help='use valgrind, sets VALGRIND_QEMU '
>> +                       'environment variable')
>> +
>> +        cls._argparser = p
>> +        return p
>> +
>> +    def init_handle_argv(self, argv: List[str]) -> None:
>> +
>> +        # Hints for mypy, about arguments which will be set by argparse
> 
> I don't understand what this comment wants to tell me.

I mean, I could automatically set self. attributes from args, but do it explictly to sutisfy mypy. But..

Actually, I'll move argv interface out of the file for v7.

I recently learned from another project, that merging cmdline interface (like it done her) into logic(model) class is a bad idea. (I just had to refactor it and split ligic from the interface, to reuse logic classes with another interface) [1]

Also, trying to fix pylint and mypy complains, I had to inherit classes from AbstractContextManager (for mypy).. And then, how to fix "testenv.py:1:0: R0801: Similar lines in 2 files" ? You wandered, should we disable it.. I think not. It's a good warning, showing bad design. True way of fixing is creating a base class with common functionality.. But than.. Multiple inheritance to sutisfy linters? Haha. This brings us to [1] again.

So, I decided to keep the classes with normal python interface (__init__ with normal arguments), and move the whole cmdline interface into check script itself. It looks a lot better.. Also, TestEnv is complicated enough even without argument parsing.

> 
>> +        args, self.remaining_argv = self.get_argparser().parse_known_args(argv)
>> +        self.imgfmt = args.imgfmt
>> +        self.imgproto = args.imgproto
>> +        self.aiomode = args.aiomode
>> +        self.imgopts = args.imgopts
>> +        self.misalign = args.misalign
>> +        self.debug = args.debug
>> +
>> +        if args.cachemode is None:
>> +            self.cachemode_is_default = 'true'
>> +            self.cachemode = 'writeback'
>> +        else:
>> +            self.cachemode_is_default = 'false'
>> +            self.cachemode = args.cachemode
>> +
>> +    def init_directories(self):
>> +        """Init directory variables:
>> +             PYTHONPATH
>> +             TEST_DIR
>> +             SOCK_DIR
>> +             SAMPLE_IMG_DIR
>> +             OUTPUT_DIR
>> +        """
>> +        self.pythonpath = os.getenv('PYTHONPATH')
>> +        if self.pythonpath:
>> +            self.pythonpath = self.source_iotests + os.pathsep + \
>> +                self.pythonpath
>> +        else:
>> +            self.pythonpath = self.source_iotests
>> +
>> +        self.test_dir = os.getenv('TEST_DIR',
>> +                                  os.path.join(os.getcwd(), 'scratch'))
>> +        Path(self.test_dir).mkdir(parents=True, exist_ok=True)
>> +
>> +        self.sock_dir = os.getenv('SOCK_DIR')
>> +        self.tmp_sock_dir = False
>> +        if self.sock_dir:
>> +            Path(self.test_dir).mkdir(parents=True, exist_ok=True)
>> +        else:
>> +            self.sock_dir = tempfile.mkdtemp()
>> +            self.tmp_sock_dir = True
>> +
>> +        self.sample_img_dir = os.getenv('SAMPLE_IMG_DIR',
>> +                                        os.path.join(self.source_iotests,
>> +                                                     'sample_images'))
>> +
>> +        self.output_dir = os.getcwd()  # OUTPUT_DIR
>> +
>> +    def init_binaries(self):
>> +        """Init binary path variables:
>> +             PYTHON (for bash tests)
>> +             QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
>> +             SOCKET_SCM_HELPER
>> +        """
>> +        self.python = '/usr/bin/python3 -B'
> 
> This doesn't look right, we need to respect the Python binary set in
> configure (which I think we get from common.env)

Oh, I missed the change. Then I should just drop this self.python.

> 
>> +        def root(*names):
>> +            return os.path.join(self.build_root, *names)
>> +
>> +        arch = os.uname().machine
>> +        if 'ppc64' in arch:
>> +            arch = 'ppc64'
>> +
>> +        self.qemu_prog = os.getenv('QEMU_PROG', root(f'qemu-system-{arch}'))
>> +        self.qemu_img_prog = os.getenv('QEMU_IMG_PROG', root('qemu-img'))
>> +        self.qemu_io_prog = os.getenv('QEMU_IO_PROG', root('qemu-io'))
>> +        self.qemu_nbd_prog = os.getenv('QEMU_NBD_PROG', root('qemu-nbd'))
>> +        self.qsd_prog = os.getenv('QSD_PROG', root('storage-daemon',
>> +                                                   'qemu-storage-daemon'))
>> +
>> +        for b in [self.qemu_img_prog, self.qemu_io_prog, self.qemu_nbd_prog,
>> +                  self.qemu_prog, self.qsd_prog]:
>> +            if not os.path.exists(b):
>> +                exit('Not such file: ' + b)
>> +            if not os.access(b, os.X_OK):
>> +                exit('Not executable: ' + b)
>> +
>> +        helper_path = os.path.join(self.build_iotests, 'socket_scm_helper')
>> +        if os.access(helper_path, os.X_OK):
>> +            self.socket_scm_helper = helper_path  # SOCKET_SCM_HELPER
>> +
>> +    def __init__(self, argv: List[str]) -> None:
>> +        """Parse args and environment"""
>> +
>> +        # Initialize generic paths: build_root, build_iotests, source_iotests,
>> +        # which are needed to initialize some environment variables. They are
>> +        # used by init_*() functions as well.
>> +
>> +
>> +        if os.path.islink(sys.argv[0]):
>> +            # called from the build tree
>> +            self.source_iotests = os.path.dirname(os.readlink(sys.argv[0]))
>> +            self.build_iotests = os.path.dirname(os.path.abspath(sys.argv[0]))
>> +        else:
>> +            # called from the source tree
>> +            self.source_iotests = os.getcwd()
>> +            self.build_iotests = self.source_iotests
>> +
>> +        self.build_root = os.path.join(self.build_iotests, '..', '..')
>> +
>> +        self.init_handle_argv(argv)
>> +        self.init_directories()
>> +        self.init_binaries()
>> +
>> +        # QEMU_OPTIONS
>> +        self.qemu_options = '-nodefaults -display none -accel qtest'
>> +        machine_map = (
>> +            (('arm', 'aarch64'), 'virt'),
> 
> How does this work? Won't we check for "qemu-system-('arm', 'aarch64')"
> below, which we'll never find?

Hmm. I just took existing logic from check:

[..]
   case "$QEMU_PROG" in
       *qemu-system-arm|*qemu-system-aarch64)
           export QEMU_OPTIONS="$QEMU_OPTIONS -machine virt"
           ;;
[..]

> 
>> +            ('avr', 'mega2560'),
>> +            ('rx', 'gdbsim-r5f562n8'),
>> +            ('tricore', 'tricore_testboard')
>> +        )
>> +        for suffix, machine in machine_map:
>> +            if self.qemu_prog.endswith(f'qemu-system-{suffix}'):
>> +                self.qemu_options += f' -machine {machine}'
>> +
>> +        # QEMU_DEFAULT_MACHINE
>> +        self.qemu_default_machine = get_default_machine(self.qemu_prog)
>> +
>> +        self.qemu_img_options = os.getenv('QEMU_IMG_OPTIONS')
>> +        self.qemu_nbd_options = os.getenv('QEMU_NBD_OPTIONS')
>> +
>> +        is_generic = self.imgfmt not in ['bochs', 'cloop', 'dmg']
>> +        self.imgfmt_generic = 'true' if is_generic else 'false'
>> +
>> +        self.qemu_io_options = f'--cache {self.cachemode} --aio {self.aiomode}'
>> +        if self.misalign:
>> +            self.qemu_io_options += ' --misalign'
>> +
>> +        self.qemu_io_options_no_fmt = self.qemu_io_options
>> +
>> +        if self.imgfmt == 'luks':
>> +            self.imgoptssyntax = 'true'
>> +            self.imgkeysecret = '123456'
>> +            if not self.imgopts:
>> +                self.imgopts = 'iter-time=10'
>> +            elif 'iter-time=' not in self.imgopts:
>> +                self.imgopts += ',iter-time=10'
>> +        else:
>> +            self.imgoptssyntax = 'false'
>> +            self.qemu_io_options += ' -f ' + self.imgfmt
>> +
>> +        if self.imgfmt == 'vmkd':
>> +            if not self.imgopts:
>> +                self.imgopts = 'zeroed_grain=on'
>> +            elif 'zeroed_grain=' not in self.imgopts:
>> +                self.imgopts += ',zeroed_grain=on'
>> +
>> +    def close(self) -> None:
>> +        if self.tmp_sock_dir:
>> +            shutil.rmtree(self.sock_dir)
>> +
>> +    def __enter__(self) -> 'TestEnv':
>> +        return self
>> +
>> +    def __exit__(self, *args) -> None:
>> +        self.close()
>> +
>> +    def print_env(self) -> None:
>> +        template = """\
>> +QEMU          -- "{QEMU_PROG}" {QEMU_OPTIONS}
>> +QEMU_IMG      -- "{QEMU_IMG_PROG}" {QEMU_IMG_OPTIONS}
>> +QEMU_IO       -- "{QEMU_IO_PROG}" {QEMU_IO_OPTIONS}
>> +QEMU_NBD      -- "{QEMU_NBD_PROG}" {QEMU_NBD_OPTIONS}
>> +IMGFMT        -- {IMGFMT}{imgopts}
>> +IMGPROTO      -- {IMGPROTO}
>> +PLATFORM      -- {platform}
>> +TEST_DIR      -- {TEST_DIR}
>> +SOCK_DIR      -- {SOCK_DIR}
>> +SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}"""
>> +
>> +        args = collections.defaultdict(str, self.get_env())
>> +
>> +        if 'IMGOPTS' in args:
>> +            args['imgopts'] = f" ({args['IMGOPTS']})"
>> +
>> +        u = os.uname()
>> +        args['platform'] = f'{u.sysname}/{u.machine} {u.nodename} {u.release}'
>> +
>> +        print(template.format_map(args))
>> +
>> +
>> +if __name__ == '__main__':
>> +    if len(sys.argv) == 2 and sys.argv[1] in ['-h', '--help']:
>> +        TestEnv.get_argparser().print_help()
>> +        exit()
>> +
>> +    with TestEnv(sys.argv) as te:
>> +        te.print_env()
>> +        print('\nUnhandled options: ', te.remaining_argv)
> 
> Kevin
> 

Thanks for reviewing! I hope to post v7 today, with cmdline interface in 'check' script.

-- 
Best regards,
Vladimir

