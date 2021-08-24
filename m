Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DBD3F5A85
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:11:51 +0200 (CEST)
Received: from localhost ([::1]:42888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISTG-0007uJ-FP
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mISQo-0003Bd-0D; Tue, 24 Aug 2021 05:09:18 -0400
Received: from mail-vi1eur05on2128.outbound.protection.outlook.com
 ([40.107.21.128]:6625 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mISQi-0001Fg-Cm; Tue, 24 Aug 2021 05:09:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LW5Z68raDaoC3bokFAbYxpeSEy5U3HcMv+uFI+VF585ohOCxaIp3I+t9/hKJZsyye3YeBe7cLq8TpisQqVvjp6PrjVoqF1dNObXMz20srDJNz+TsHMUz4448sFpAb1NLcMBxvYRL/EEr7kuqzKqAX0uBFz5VKRavv1um4XP0tCOZAwh2Q6ptk+SB8nzU/hbhTCqMbesxbalZWX/9SCI7RIc3aTa7kAJ4VnhZXFZ+9eTN/nLJ23uv9raWGbFI6S9oqn9CruP98NEgtwPtjcaN3fS+Nir7yDoKg2ziyLS+CWXyxQvpQ9JvEEwa5XJhBqVwVGPeu7MrXKQEHqAgCKKBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhYRRjHXrISJlR272HtKNdBM1Q5YZ7vrDjT2277kbb0=;
 b=BfCF+Isxi+xIlWb1uing5ILbdZUyHcrjhS0L/msjcy99i3dtQ3PMKp2itW6nohVXbOIZU1kULh4HJUfq8ylwdaBj1vxpm6AcZtUzyBSCYv8yItnOJv82ILreX+f43jWIUWFdriWT5nSFVgDlmPTR7o74w+6VKik1lSqx+4cpLzGNLsZ1A6V+dmNMQVmSddx25z6PEYlNsx9MvKiYcmdITGhBwb3++JQhJV8ouJK4yci+GQ4/H0jbdJi56uJ4hp9XEcd/vbtPXmddkrAYkyTLN4F/Ar8m8YMdOgbzFcEE123ZFmKUqmfavbo3O8whBZFelU/8w+RxsXqKacu7dwTSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhYRRjHXrISJlR272HtKNdBM1Q5YZ7vrDjT2277kbb0=;
 b=i9QpBCvwG45py/E5uzYDcwtwIByLKy50ozZJ2hYMoK4bgBq8Zhw+bbatGzv6q/iCkXmdPR0uQCxCh62cysXPzgvzttbPC5/AmNgIicnjkzoPRYTqSJ9lRLsC43e4zQjP8tkVV7H4TTx+VlZxTDg0FADlBZ5o9g1OwGxSEz7FaFI=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6069.eurprd08.prod.outlook.com (2603:10a6:20b:29c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Tue, 24 Aug
 2021 08:53:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:53:55 +0000
Subject: Re: [PATCH 1/3] simplebench: add img_bench_templater.py
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210724133846.64614-1-vsementsov@virtuozzo.com>
 <20210724133846.64614-2-vsementsov@virtuozzo.com>
 <784f21b4-f990-f0af-1f24-caa2c66144bf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <86ef6f7a-a9de-e422-be66-99a1edf27cae@virtuozzo.com>
Date: Tue, 24 Aug 2021 11:53:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <784f21b4-f990-f0af-1f24-caa2c66144bf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.249) by
 FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.6 via Frontend Transport; Tue, 24 Aug 2021 08:53:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1da5d0c2-8363-4926-59f2-08d966dcb3ff
X-MS-TrafficTypeDiagnostic: AS8PR08MB6069:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB606937B32B928EC1B16F5F23C1C59@AS8PR08MB6069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qWXy3mnouAGkFX+n0rjUqgQ7+vXuWeyswYmzGAoihXxgIsZlD7Z/xCO94Ws1rC+bGowwcWvUiYWzn3cq5hj9xmVAfj9xCdyraF4GqdDXwQKq4IH0H7UVVBBV/juLQOQ813bv6EnaqcMNnCpmwxe/u1ksxRPMhAl+Sbyel2QNpUdIwuL8P4bnaFXo1g1dh+qV0sWJuOBUT1Io3M2xdm0Q6BvizN5URuuzgkT3JeMDyRhFJ+3sqrCFZnSNJuYjci4QBVl36+iGLbZvKBLJhqvERdB6LtpsTrjkpy8xijNSzFtDxQUwI8sJT5Wr30O0Guew7wqD/ZcjuL80l7+7I/Vg4PQyhCkJu982nHzRS6YV9v4QaRvraWUx9L6+z4F/xH9DbOU9AN1+T54YYpucI3GzFDO9pUhHGvrdVkCTEi6pF8mYscY4lzO871GN54w68kXBdrpqo4E4O5pwJHdsYvVUkaFD03MgUxl7sS/TdXokFfyFTcCNEJvMWvyPTcBRl+5UF68n1TUbwPIBKrWwudOtUOBAUq6SvPtc44ssYRX5OgLKG4QdLpT60aJnzm+CkaFWs8rRl3UEQ//9DHQrQy5ieqgUxbaTYd215a87YucIRNqCacqKtoz21lUao/EgDIbCjhD2BtdTBPsgEkIW9oEwkcG666e6Kvt74nUa/vw37lKvipuVMLiBbeMe6CdlFpVqxPQbQQ04AjR+QOnBO992SxjQ09J3jUglytnXdp/8U83rlO+/slv8ioBqZWWK9cZvJkXAMRy0T0HLD+pw44HupMh+lbgNpI+nqlzULoJ7INLI1E+fsOcvp17mWxa7ZrrtoSLFqOgTBjtRdmOURwKu67WRXxLjDJ7czPeqvEcnukg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(31696002)(66556008)(107886003)(66476007)(8936002)(53546011)(26005)(86362001)(8676002)(38100700002)(52116002)(38350700002)(66946007)(316002)(2906002)(186003)(5660300002)(6486002)(16576012)(36756003)(4326008)(478600001)(31686004)(956004)(2616005)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em5CaC9BMjFLS25aaVlaV2I5cE4vaGw4OVEwVHVKWVFGMUVreSsvbTUrN09y?=
 =?utf-8?B?WnJ1MHl4SFhSbVFDeFBtc1hiZnVscERyY0cvWk80aEZKMzFBeXJ3OWxCOFpJ?=
 =?utf-8?B?NlhVNzRPSFRPc0ZFcW11T1hzM3lzdWpnRlNQL20zQmF3Y3JkVW1MTkdhNEl3?=
 =?utf-8?B?OUVrdDRzc21RNHpka2xHMlI5eXhvK1NwRVluN0lIcHcwK1NEOU9Ca3BBNmcv?=
 =?utf-8?B?UUZWS0htVHhZYm5TYURWd09PelZPVGdLSHlPNEhSWGkrU0cyMHZJaXR5TTI1?=
 =?utf-8?B?RkQ3YlRrb3hWM0JDN2N4NTZxcU1tcmxFUE8rbjltWVhxb1VONDFHQnZHWlFs?=
 =?utf-8?B?amIySURROHEvUjBuVnNTdThQL1VpUVd4Y1BXTWRuOG5YWXlCM0duVU9BdWNj?=
 =?utf-8?B?TlR6bzh6N1VYRFdjRGhGcDR5QnN6dXZHQlg4WWNoRGxUdlp5SWJyc0Ezd3hm?=
 =?utf-8?B?SjZnSnJrR2wyTjVvb0NhZlZYSFRaN0dXK0FBUElMR2p1RG9PYXQ5blNtZ3RT?=
 =?utf-8?B?M0VRaFEwWVdqNVpVQzFtWkpBdzdjeG16YVVueUdJcEV1SDJKbllHU0d4c2ta?=
 =?utf-8?B?MlBxSWdIVHo2NU5DbGtGU2JuY01RMkMxU3RsOTdNZzRBZVlhNFQrNFY3SHZo?=
 =?utf-8?B?anI0aVlKS2lodmJDcWNGM0VyVjZHSEYwZ0JoSndtZXdDMmhycDNOSHA2UmVV?=
 =?utf-8?B?Q0FPdldyOWxQYWVESzBlQlFKRVRINGlNLzRpOGNXTUQvakNzQm1Vc21XdVg3?=
 =?utf-8?B?RDNuZ0YrM2x0b2o4QjhlWlFuSUtGZTVyZXNEMnMzRW1QcDBHeHNYTUMraGhi?=
 =?utf-8?B?d0hqc2dabWd1emFOZWZIMEdaYWNBVGhVV0hpWWhqelduZW16OFdUNU1vRGcv?=
 =?utf-8?B?bmJLMmcrSVI2b0VUbkU5R0h3Q2Ftc1lVNkZoLzFSM2NMenMxNU40b1hWMVQ0?=
 =?utf-8?B?L2owWjlrWURPamk5aWZxNU1LUStzZjgwZzQzTEFVK3VhYldFRXZVS3RSRUtp?=
 =?utf-8?B?R2lUdElGbXhCa2hJTnR5aTdXS1RCdWZKbnZnbGtmclVwVEphTEFlcThDZjhO?=
 =?utf-8?B?V01WOTk1c3lOaklGY2Vyb3FocWV1RGMyTzJIQTBkeU5GNmZZQ0xUVDRLaFJ6?=
 =?utf-8?B?K0lycFh4dVp5M2pLZXJaYTRDTmxITWc4YTVFVEU5VzNrZ20rUjhOSXdoVzB0?=
 =?utf-8?B?MmFFUnhEcW9paUJmcm1tQ0Y1b0NneDlaYUF4a2QzWkF0SFFMMmZ4ckZwK2cy?=
 =?utf-8?B?R2NSOEtabUdIQ0EyRFlzdWZrRWw2TlFyREprOHc5WStoSWdiN2RrbW95aFV1?=
 =?utf-8?B?SmJES1NYWENqTFVENCtySS96N0VwZFNpOEt6NWRDNHJ2QlNOSWZGMmhuWWk4?=
 =?utf-8?B?WnZZTldyN2FSSHN5SnNnZkp5YzgyQnNKUHo0RDJDRyt4aU8wMW9RK3B3KzBi?=
 =?utf-8?B?NUhqWTMvS2lYSUpiNkQxVVdsV09ZK0hUMmRxWmlhUnhOTlhIbmNvOWExa05M?=
 =?utf-8?B?RjNhMUh4eHBLa244aGhGY1YyZ3ZIU1l3VDNya05kbHZuUEIxVFdNek5nRU9l?=
 =?utf-8?B?bzhFcXRXOFZVK1M4bVV3bm1VcVVLYWhMNWlJSXpBRkVmcmdpRGRDOGNyMVU3?=
 =?utf-8?B?Y0lyRmZ0ZDdpSU95NytTcCtEeVV2cVY4MlhHajFNR1RNc2pLOUxHcDA3eGNy?=
 =?utf-8?B?SW40MGQ4b0w2eWxBQ2ZZT2lQR2t1VnVuZmtsSGN4bU5KdmtkWmlzS25oUFkz?=
 =?utf-8?Q?LKYtYcobMIymOqNTDyfEL7SwK48g5Ths9GLq5gz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da5d0c2-8363-4926-59f2-08d966dcb3ff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:53:54.9575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lK78MICl8A9VouAAIO6a0X1sV3imNE88INI62zEbvKkdX25ENPNoBK9V0GjD3FYvUUdN7QNj6gt1YfXDi4+Mod+1ABWeBlCZh1kSxq9YDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6069
Received-SPF: pass client-ip=40.107.21.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_NONE=-0.0001,
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

19.08.2021 19:37, Hanna Reitz wrote:
> On 24.07.21 15:38, Vladimir Sementsov-Ogievskiy wrote:
>> Add simple grammar-parsing template benchmark.
> 
> This doesn’t really say much, and FWIW, for like ten minutes I thought this would do something completely different than it did (while I was trying to parse the help text).
> 
> (I thought this was about formatting an existing test’s output, and that “template” were kind of the wrong word, but then it turned out it’s exactly the right word, only that this is not about using a test’s output as a template, but actually using a template of a test (i.e. a test template, not a template test) to generate test instances to run...  Which of course is much cooler.)
> 
> Functionality-wise, as far as I understand (of course I have no knowledge of lark), this looks good to me.  And it’s really quite cool.
> 
> I just found the documentation confusing, so I have some suggestions for it below.
> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   scripts/simplebench/img_bench_templater.py | 85 ++++++++++++++++++++++
>>   scripts/simplebench/table_templater.py     | 62 ++++++++++++++++
>>   2 files changed, 147 insertions(+)
>>   create mode 100755 scripts/simplebench/img_bench_templater.py
>>   create mode 100644 scripts/simplebench/table_templater.py
>>
>> diff --git a/scripts/simplebench/img_bench_templater.py b/scripts/simplebench/img_bench_templater.py
>> new file mode 100755
>> index 0000000000..d18a243d35
>> --- /dev/null
>> +++ b/scripts/simplebench/img_bench_templater.py
>> @@ -0,0 +1,85 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Run img-bench template tests
>> +#
>> +# Copyright (c) 2021 Virtuozzo International GmbH.
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License as published by
>> +# the Free Software Foundation; either version 2 of the License, or
>> +# (at your option) any later version.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License
>> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> +#
>> +
>> +
>> +import sys
>> +import subprocess
>> +import re
>> +import json
>> +
>> +import simplebench
>> +from results_to_text import results_to_text
>> +from table_templater import Templater
>> +
>> +
>> +def bench_func(env, case):
>> +    test = templater.gen(env['data'], case['data'])
>> +
>> +    p = subprocess.run(test, shell=True, stdout=subprocess.PIPE,
>> +                       stderr=subprocess.STDOUT, universal_newlines=True)
>> +
>> +    if p.returncode == 0:
>> +        try:
>> +            m = re.search(r'Run completed in (\d+.\d+) seconds.', p.stdout)
>> +            return {'seconds': float(m.group(1))}
>> +        except Exception:
>> +            return {'error': f'failed to parse qemu-img output: {p.stdout}'}
>> +    else:
>> +        return {'error': f'qemu-img failed: {p.returncode}: {p.stdout}'}
>> +
>> +
>> +if __name__ == '__main__':
>> +    if len(sys.argv) > 1:
>> +        print("""
>> +Usage: no arguments. Just pass template test to stdin. Template test is
> 
> FWIW, I completely misunderstood this.
> 
> At first, this sounded really ambiguous to me; then I thought that clearly this must mean that one should pipe the test’s output to this script, i.e.
> 
> $ path/to/test.sh | scripts/simplebench/img_bench_templater.py
> 
> But now after reading more, I finally understand that this is not what is meant, but actually literally passing some template of a test script to this script, i.e.
> 
> $ scripts/simplebench/img_bench_templater.py < path/to/test-template.sh
> 
> So, two things; first, I believe it should be a “test template”, not a “template test”, because this is about templates for a test, not about a test that has something to do with templates.
> 
> Second, perhaps we should start with what this does.
> 
> Perhaps:
> 
> “This script generates performance tests from a test template (example below), runs them, and displays the results in a table. The template is read from stdin.  It must be written in bash and end with a `qemu-img bench` invocation (whose result is parsed to get the test instance’s result).”?

Yes, that's correct, thanks for wording

> 
>> +a bash script, last command should be qemu-img bench (it's output is parsed
>> +to get a result). For templating use the following synax:
> 
> “Use the following syntax in the template to create the various different test instances:”?
> 
>> +
>> +  column templating: {var1|var2|...} - test will use different values in
>> +  different columns. You may use several {} constructions in the test, in this
>> +  case product of all choice-sets will be used.
>> +
>> +  row templating: [var1|var2|...] - similar thing to define rows (test-cases)
>> +
>> +Test tempalate example:
> 
> *template
> 
>> +
>> +Assume you want to compare two qemu-img binaries, called qemu-img-old and
>> +qemu-img-new in your build directory in two test-cases with 4K writes and 64K
>> +writes. Test may look like this:
> 
> I’d prefer s/Test/The template/.
> 
>> +
>> +qemu_img=/path/to/qemu/build/qemu-img-{old|new}
>> +$qemu_img create -f qcow2 /ssd/x.qcow2 1G
>> +$qemu_img bench -c 100 -d 8 [-s 4K|-s 64K] -w -t none -n /ssd/x.qcow2
>> +
>> +If pass it to stdin of img_bench_templater.py, the resulting comparison table
> 
> s/If pass it/When passing this/
> 
>> +will contain two columns (for two binaries) and two rows (for two test-cases).
>> +""")
>> +        sys.exit()
>> +
>> +    templater = Templater(sys.stdin.read())
>> +
>> +    envs = [{'id': ' / '.join(x), 'data': x} for x in templater.columns]
>> +    cases = [{'id': ' / '.join(x), 'data': x} for x in templater.rows]
>> +
>> +    result = simplebench.bench(bench_func, envs, cases, count=5,
>> +                               initial_run=False)
>> +    print(results_to_text(result))
>> +    with open('results.json', 'w') as f:
>> +        json.dump(result, f, indent=4)
> 
> Is this worth documenting?
> 
>> diff --git a/scripts/simplebench/table_templater.py b/scripts/simplebench/table_templater.py
>> new file mode 100644
>> index 0000000000..950f3b3024
>> --- /dev/null
>> +++ b/scripts/simplebench/table_templater.py
>> @@ -0,0 +1,62 @@
>> +# Parser for test templates
>> +#
>> +# Copyright (c) 2021 Virtuozzo International GmbH.
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License as published by
>> +# the Free Software Foundation; either version 2 of the License, or
>> +# (at your option) any later version.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License
>> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> +#
>> +
>> +import itertools
>> +from lark import Lark
>> +
>> +grammar = """
>> +start: ( text | column_switch | row_switch )+
>> +
>> +column_switch: "{" text ["|" text]+ "}"
>> +row_switch: "[" text ["|" text]+ "]"
>> +text: /[^|{}\[\]]+/
> 
> So I have no idea how this really works, of course, but does this mean that the `text` pattern cannot contain pipe symbols?  I.e. that you cannot use pipes in the test template?
> 

Hmm. I didn't try. I hope lark is smart enough to keep pipes that are out of {} [] as is.. But of course, you can't hope that pipe inside {} or [] will work as bash-pipe.

Same thing with other special symbols ("{}" and "[]"). I don't want to care about this too much now. This simple grammar works good for test template in patch 03. If we need something more, we can add a kind of special symbols escaping later.

> 
>> +"""
>> +
>> +parser = Lark(grammar)
>> +
>> +class Templater:
>> +    def __init__(self, template):
>> +        self.tree = parser.parse(template)
>> +
>> +        c_switches = []
>> +        r_switches = []
>> +        for x in self.tree.children:
>> +            if x.data == 'column_switch':
>> +                c_switches.append([el.children[0].value for el in x.children])
>> +            elif x.data == 'row_switch':
>> +                r_switches.append([el.children[0].value for el in x.children])
>> +
>> +        self.columns = list(itertools.product(*c_switches))
>> +        self.rows = list(itertools.product(*r_switches))
>> +
>> +    def gen(self, column, row):
>> +        i = 0
>> +        j = 0
>> +        result = []
>> +
>> +        for x in self.tree.children:
>> +            if x.data == 'text':
>> +                result.append(x.children[0].value)
>> +            elif x.data == 'column_switch':
>> +                result.append(column[i])
>> +                i += 1
>> +            elif x.data == 'row_switch':
>> +                result.append(row[j])
>> +                j += 1
>> +
>> +        return ''.join(result)
> 


-- 
Best regards,
Vladimir

