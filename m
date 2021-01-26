Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E13037E0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 09:29:33 +0100 (CET)
Received: from localhost ([::1]:33412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4JjA-0000uL-MZ
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 03:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4Ji3-0000OD-Mn; Tue, 26 Jan 2021 03:28:23 -0500
Received: from mail-eopbgr60137.outbound.protection.outlook.com
 ([40.107.6.137]:42052 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4Jhv-0000HQ-Lw; Tue, 26 Jan 2021 03:28:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNuZ+N/+DjSNuhAjYCksQ+OlQJ9F/eCBW89mcoPB43yCEJpxTpQnTLyjnDwdUbEUvJkDN6liHKgkGSH95jpMrAPyacl+HEAu73VNf1CyEcm86W2qgEweS7Y69dsdt7meVzz+5CxGjNWZAuYLMVvrOGEM01Z2XBB6mYEAfuuIzo9X2jHCsVn/yt3hZrIZdoMZql58VAAtsZjQxCyAqXo9pnWR/Wc5c7X1951KCoMv+rPb+jTHyaAs3a9bWDC2HWnhh88SBfBMrBdd2wSF7amILnM4JgEkAXaOSeMNCC8ZDrdeDolHhLyQRo/qD41Euf63flk8pujunc7N7vNKMe0D7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljzH9mHfrCqIGSwcqiZtNOBkI86/6Oq59eKZQ7H6Xec=;
 b=ARrTpDM5pmo6uX318+kOBM2SF5jwD286Ew9GI1UzLFOSXnmkjU5lbhJTHwavfdz7XMA8M5dGF/cFE+tPBxPY2FBcbANz+0Y2umLkNmyox1DRgOaTD3E14CPfQ0iOwLISFRCr+FDCMDAvezLr08VqFo+/GX+BGRUxV6IVRhSq3PCS7iUW4y5XyfgJc/pTjbDvwzCVdK44nFLbxJl9oDajJ0RuaY3hAap9ByasjP5F0F8sXbOTf0n1fc6MQth9Qv37RUJ7qtFdmL1otQSFXcGd1uXziHYBmFPnIoQfIsNvqZRvFjYUlBQJyqY2k+6bLgqZUnsWnvibU2siDYEuvaxb3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljzH9mHfrCqIGSwcqiZtNOBkI86/6Oq59eKZQ7H6Xec=;
 b=mynLHKmxXHv0wxsqdnvdJB6xSHSTh/SGDCagTBrHz0jqrHu97RGHUlNzflCCsVCniZTFPHQfmfCEMMeu8vOWgWFoix5v2pv3VgIErO78FywdPo0C7dr7MrINTe5TMejbFnB9OxIZIBWsyjf3DE5KW4jckJqELr+74Wookt1UKSg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5208.eurprd08.prod.outlook.com (2603:10a6:20b:eb::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.19; Tue, 26 Jan
 2021 08:28:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 08:28:12 +0000
Subject: Re: [PATCH v8 2/5] iotests: add testenv.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210123210428.27220-1-vsementsov@virtuozzo.com>
 <20210123210428.27220-3-vsementsov@virtuozzo.com>
 <20210125220528.GA170615@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <86218b16-33cd-b9da-cb36-892c301197a3@virtuozzo.com>
Date: Tue, 26 Jan 2021 11:28:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210125220528.GA170615@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.100]
X-ClientProxiedBy: AM0PR07CA0006.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.100) by
 AM0PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:208:ac::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.6 via Frontend Transport; Tue, 26 Jan 2021 08:28:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2079707e-7b78-46aa-b056-08d8c1d451f3
X-MS-TrafficTypeDiagnostic: AM6PR08MB5208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB52086DCD616A089BCC7ED7F5C1BC0@AM6PR08MB5208.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I4THrwMFxAmuiwe+84dLUL3icMetQrqgK4zlCKmP0GGsZ3/s5GL77QmShNPNuuGFMarQjxlzSM/qzhi1RutBFhSx9F4vJPJOrQge9AU7ToKoPujd5bvcoR4pgwvb4oB/7SUzBsHqBa0LaR1wxD6R0c0hs78jzDCtYHv5PBAufbSGDwbUoyOVo6ghbckZwH8u3JusUUSRgIuwFpg4klaxE4ChlId2WPvjo0hMpvXpdX0twHYWjmJ0U5hJHmOg9pzXqqF09AQgyuSmzEMCf6nZn8ohsLdsEaT9/dxHdJ+BioNF6AjwNOYKQIEwOTimhK6PBcbFlFaftfUwUJek61RtITmRur63h4rsUl/QosoCutfEJnpLTrtiCoZPhYRxH7hpQ8B2Sch86AVynYSGSuiKwlEDG0UOfo3OEODgCYBky2k47PcNs8GBSgl03hDQ0P8ai4OqAxVNr54KoWgwkyCIioCJqMPR1xQ2k+IhsQ8ZsNdhZBDOirFRbcW6Ykj2SEzmteLcUU3UjGy0qaLOL11KZJnUyTc/QmPs7KzRWnB45K0zko+/QAapozd/rOnMIevF0OB4szfc9qPMVHy44MMpHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(396003)(376002)(136003)(346002)(8676002)(83380400001)(186003)(6916009)(52116002)(8936002)(2906002)(16576012)(31686004)(26005)(316002)(6486002)(16526019)(956004)(2616005)(5660300002)(66476007)(66946007)(86362001)(6666004)(4326008)(66556008)(478600001)(36756003)(31696002)(2004002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aDFSbzZwbXpjNWpKLzlFemlvcGJFS3luQTVoVHdqT0w4YzljSjhSQWgxKytl?=
 =?utf-8?B?Z2lJbXBOclBQWC9GVHJIQ1k0NUwzUmN4bXBibTNpMVJoOFdWaHQ1SVg4aGkz?=
 =?utf-8?B?eklsY2ZxWFdOQjI4WEkrTnFOVVh0ajNxVTY1MmtpWllSdlUySzgrb3o4Zk40?=
 =?utf-8?B?YUw4QnpqcUlzOEdOZThqMEpneE5CeVZTcU5uWjI0anR6WHozbFMxL0pHWEIr?=
 =?utf-8?B?RWE3aFlGTFF4dGkxdEc5WlJON0JLZW14TVQxQ1c5ZHVKbFl6YXZRQ2IrRFdM?=
 =?utf-8?B?dVBqR0tXWmlucHVoSXM4WmhEYWVEV3NqZWtWR1hIZy9BN3ZsQ0FpNXhzZTFv?=
 =?utf-8?B?NzZFenkxTkMxSHdGcWh2YkpDaGNCM0swTTNwa1JXOEpoZWsxbWovMEpPVmtD?=
 =?utf-8?B?TGRDSDczTEswdUVYVHdteTl6SFRaS0NhYVpDSUQ5MnRjMVFTV2gveVRERDE1?=
 =?utf-8?B?SjRxNjJnQWhIbGlFb05abU9oTy92QUlnVGVJQXJPeHAzR3BhWm1HSGxzYzkw?=
 =?utf-8?B?TGEzaWJCMDNaWms2aUwzdVN1MDB0ckdhZXJiMmNpTmxDcDVNOElMNGdhcTh1?=
 =?utf-8?B?SGtPYXYyejhsWGRoU0VIWkd1a3pLTFNQTHR2RjhPS09CcTZmbTJXcHpiYmpl?=
 =?utf-8?B?NjlDUjlnUXIrWW5iZFBMVi9pcGdZS1ZVODJQL0pnQ0MwSy96V3AvanRNT3JM?=
 =?utf-8?B?YWNUb2NRbWRtcGFZQXRKV1FMTk9qVEZiS3ZudFkyUkNrb2R1RjJGNDEvanZt?=
 =?utf-8?B?MEJROUhHTjRSTkxnRHpFM0pqamVuQnRhNGJneXVGdnMxN0VqdDY2d1ZSWHFp?=
 =?utf-8?B?cERtM3AvbFJNbHA1bFlkSi9oSGhTMlF6eFQvSHMzeU5MTjlXeWVlZEhGSG01?=
 =?utf-8?B?aTFLaTliMm85V2x0TTVWemsxNjRZUTZZbHBudm1aaTI3K25UeE9kWXNpMCsz?=
 =?utf-8?B?WkI3NmRIMzl0Mi85aGc5ZmgrQ0kzNmZlMXArZmYrWTRldnF1eVJja3c2dm9J?=
 =?utf-8?B?TTJFTU81M2Q1QmxtalN6VmRJdk0zSC9kaDB4WmlkUEt1S1ZtdWt5L0JoY3E5?=
 =?utf-8?B?enJHS1VHNFlkNjJtRHY0TVFyTzFHV29CbTB1Q3RTM2IyZy8wbU8reU9LeTNp?=
 =?utf-8?B?T0ZTR2pZWU9qV2xKSzRQTUJoekR2dWJycVVWRU1zWWhab0ZzWW9uVzBaVnpX?=
 =?utf-8?B?RUFLQ05IU1RqNjlGYldDdnF2QjNFVm5scjVDR3dIcW03Ry9CbjUzc0w2STJ6?=
 =?utf-8?B?a1U2Sm9rSlR0VmVxMjNEbDVXeXJudGpIV2wySlVXOXIwS3ZnM2NNMVh0ZzJR?=
 =?utf-8?B?ZUVtMTRtalFVM2l0bktTL3BhZGpIK3NFRlVNSzBLUnZPMVl0ejdSYjNmSXdi?=
 =?utf-8?B?dmVPRG9MODh4S2JYQThZRHhweEh2aEtnVk1aY09XWjR4QkpObGhoWllray9i?=
 =?utf-8?B?SnNtaVVqLzVOaE1EbElPcUJZaU5ibmpNeHVXZ2Z3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2079707e-7b78-46aa-b056-08d8c1d451f3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 08:28:12.6700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h62q3OCtJz3Frqyf6z7Ax4h8ZndHKvkIFhaAJTl56wxLXsjlpbW3HjwkcGw8wyfLV+POnP/MBS0jYhk4GcKqmLNQT72dHaBy0D9j4TlPdLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5208
Received-SPF: pass client-ip=40.107.6.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

26.01.2021 01:05, Kevin Wolf wrote:
> Am 23.01.2021 um 22:04 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Add TestEnv class, which will handle test environment in a new python
>> iotests running framework.
>>
>> Don't add compat=1.1 for qcow2 IMGOPTS, as v3 is default anyway.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/testenv.py | 278 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 278 insertions(+)
>>   create mode 100644 tests/qemu-iotests/testenv.py
>>
>> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
>> new file mode 100644
>> index 0000000000..348af593e9
>> --- /dev/null
>> +++ b/tests/qemu-iotests/testenv.py
>> @@ -0,0 +1,278 @@
>> +# TestEnv class to manage test environment variables.
>> +#
>> +# Copyright (c) 2020-2021 Virtuozzo International GmbH
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
>> +import random
>> +import subprocess
>> +import glob
>> +from contextlib import AbstractContextManager
>> +from typing import Dict, Any, Optional
>> +
>> +
>> +def get_default_machine(qemu_prog: str) -> str:
>> +    outp = subprocess.run([qemu_prog, '-machine', 'help'], check=True,
>> +                          universal_newlines=True,
>> +                          stdout=subprocess.PIPE).stdout
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
>> +class TestEnv(AbstractContextManager['TestEnv']):
> 
> I'm getting CI failures here:
> 
> Traceback (most recent call last):
>    File "./check", line 23, in <module>
>      from testenv import TestEnv
>    File "/builds/.../qemu/tests/qemu-iotests/testenv.py", line 49, in <module>
>      class TestEnv(AbstractContextManager['TestEnv']):
> TypeError: 'ABCMeta' object is not subscriptable
> 
> On the other hand, if I make it just AbstractContextManager without
> giving the type parameter, mypy complains:
> 
> testenv.py:49: error: Missing type parameters for generic type "ContextManager"
> 
> I guess I need to have another look into this tomorrow.

It may help to use typing.ContextManager instead of AbstractContextManager. mypy is OK with it, probably CI will be OK too..

> 
> By the way, mypy --strict still finds a few errors. I think we want to
> address at least the warnings about missing type annotatings and calling
> untyped functions.
> 

OK


-- 
Best regards,
Vladimir

