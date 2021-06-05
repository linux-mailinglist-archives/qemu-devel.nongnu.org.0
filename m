Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA9D39C90B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 16:28:48 +0200 (CEST)
Received: from localhost ([::1]:60036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpXI7-000368-G5
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 10:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpXHK-0002JY-77; Sat, 05 Jun 2021 10:27:58 -0400
Received: from mail-vi1eur05on2110.outbound.protection.outlook.com
 ([40.107.21.110]:13793 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpXHD-0004A3-M9; Sat, 05 Jun 2021 10:27:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elFQ6sKCyT3JNZsaiePNjvBvDFpZMRz9micKUmUwjkRpzLD989YIs4TLSz2sVN+iVE0oEZTmu5AObCLaNeR/+os3xwmGEcJMMx4/obNUAPmGcZssoH/0jPJM0EmFFd0M1dGvmHWMBU5/+2aDMbJ1RH4wxC92q0b4Pio0/ANTgI2jncIBapjq5odNMM2p0PVP1upTL4+K95/yc7hI5NOeAMWkElSgR2dAagWrGHQRqzE5szy6XoglQ+gB9TCNdqG4C6n3Ye9zZsqH3UGpp1omnbHr2Tf2K/kI2OClyHzsUc6D5wHucFQH0ALczRrAGpDvMAwXjPxgNGdfhwUjfWS3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9oBCqTLy4dsUlU25hb5/y/rlE4ARaB7JVZFeQft9+Y=;
 b=N1LXaBshPYVu6QOQVhgl1D2918suAEZmOyoDc7yxzWr56UaG67vR0loFh2fFbVWc34H5e3uTKfIqGCD3Djb0iy9n9MsqWXIvVqpwVHzf8/KGL2cy6/i0D+o643GVa+5oSqgN8mEUQf0ee9n47lSOgJwrX5ZLqq4UOl777BeJIRclcNwMm4JRDpv7eObVLEaEfixJh/uWrb4rM1Ptjk7jq7fL4G4JfPWmuErt7QJRWwc0J3ZDm8PJ20attuF1TERGkye+bmX5YPv8CepsZCgDGbrd7E4PtqNfNdXObvyfQ/0Yi5QKXafUbs1sh5CbRXOOjs5aJ5baEl7nG4R/6dnptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9oBCqTLy4dsUlU25hb5/y/rlE4ARaB7JVZFeQft9+Y=;
 b=p92w/SaeT5TQNE3dM1d3kgxk9cAzYwz4ZI/PUF+e313YY5DLDdoV4ip1cw5ORHOpN9RFv0HcbCYmDI5Qsh1nFdNWv/cTkiIMgerPcJ8bAK306eLBX7l6xHWbKW9Mi8cRf+kc1LHyueN6+EWXhCkJrxY93teKSbEw5z7YOQ3NlKU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1777.eurprd08.prod.outlook.com (2603:10a6:203:3a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.26; Sat, 5 Jun
 2021 14:27:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.029; Sat, 5 Jun 2021
 14:27:46 +0000
Subject: Re: [PATCH RFC 2/3] iotests: split 'linters.py' off from 297
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20210604163907.1511224-1-jsnow@redhat.com>
 <20210604163907.1511224-3-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ba007a36-6e8f-29da-16a3-92f1599602c2@virtuozzo.com>
Date: Sat, 5 Jun 2021 17:27:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210604163907.1511224-3-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.208]
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.208) by
 FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.9 via Frontend Transport; Sat, 5 Jun 2021 14:27:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 220eaf82-a7fb-4c42-c712-08d9282e16b0
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1777:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17774DA83DAA435052447360C13A9@AM5PR0801MB1777.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9rXxgusLGppoTB6UsL7Jkd1OVxv1BAdYAG5fym9SrcbMEdbndFrPYS0IShTZh5bsHZugutrGSEItUeq2HpPQYNzbEWF3xA38pCAcQlx360HIs+s/VFu19KC+PkYVt5KdjyDr+FSg5gYhYLUhloQmJEO1ZdT4VESRC4l9uwK0wEKPXGeU+7GJBNhTDjh34svwYPsbcypmr5rgMCoTpKlREQNtytxjkZ6yCoaYnh2oPYSBtALI0IwyvEBXz7qT1v/HFeBQPVXUGIJ1Rw7Pdv2a9S9ZgOq9rbuwy8pe+DvnOJnDgrt6BBXD4PGXSS1EmhvXBlDe5E19hpuX67QuacmiXPNT2GWJQocD+SKQVGIm0Ogg4KuMVWacryhrLY9X01bv/6YxzeK6gmzQbN0vj64gNy5BdjlHcPnfX92/vmvhVW1cDS8E+59WYsZTt+4QqZb9YV4PwBhgYNEPDU3P5ybB3TD5r6XKuyxHYfn2j1nOAA5Am7G28GQFTfX333DZdzlsH3HDIV2RtTgnLBM8zSmP7fdSQOLRuWbVmDqX0/HQwQcnVD85UJUoCdWG7xbDYIbb7QOuuX3eMSkb9I7nR7H4t2h+knCDRFi4ByCn8KuQXHGdPOWx0rR8nVWBei3FNVuIk+Vlv42iLBIjl5e13/YCnBUHuoGnaMTdQaJJAxFWtzDBhFDQur/CYYLjKLDelAJWFpMUHpByiDuekUubNVPjJM5bU48GnVFGktQRZhRZAx+vFSW5j1quhD7UHBE9dKI01Vr41Az2L3vlGz0/TDW4tEpADS+4p9/dTKrR/6rGzkBkqvE888BmrS6sydoRozc7I2no20KQrKwSOeMRAHkoaHLg0rMk4GE+XT1R85zRcvk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(39840400004)(346002)(396003)(38350700002)(38100700002)(26005)(8936002)(54906003)(478600001)(956004)(2616005)(5660300002)(36756003)(31686004)(86362001)(66946007)(66476007)(4326008)(2906002)(52116002)(66556008)(16526019)(186003)(83380400001)(8676002)(31696002)(316002)(6486002)(16576012)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TEhZM1ZGbDAycDM5V1Q1TUNmbFJOM2hBUUJWS0ovVmY1YTV4THl0MEs5VHdD?=
 =?utf-8?B?L2VkTHBTNmtXWEl3bEhsT2NoYzBxYVloSXp0VEtKOWdBeUo3ZjQ1eU5vWmNS?=
 =?utf-8?B?MmhOU3h6RERBZmJrRlJOS2doTk0rRGVwanZQMyt6YXYwdExMR2s0bnFlNEl4?=
 =?utf-8?B?MGpvNW55NVl4U1ptdUV3cVFQV3B1VDRXSVFLU2lwUU9JTlJnRDNabldZalN4?=
 =?utf-8?B?L0NsNVYwNThMOGhWQ3phY0xJZzBINmphL1Z6SnZzdUxmdlI3bzVnTExYWU1l?=
 =?utf-8?B?bjJKZXF1RjBpbXA0TzVDOHFZOTdPaTJ3NzJIZ3F0aHU5MnRyakREaU5FUjZm?=
 =?utf-8?B?bHEvTmR5U2YxU25KcmhjT200UEhSMUNWQk1jZlBwdW1rNFZSSEl0MGRMQ3Mw?=
 =?utf-8?B?QjQ3SzVydnZmUVFleE5JWElwdUxyN0NTVXFzRVhSakdSUTcyNFFUVlRlNzQ4?=
 =?utf-8?B?clZVd0pzcnBTWGYyempOZEFlUVVpUW15Wm1OeXJadnExQlJFdHpYYkk4bWUr?=
 =?utf-8?B?Z29hdS83TEs0dHVPR3ZiQ1BTaDNJNzFtNjBtOHZIZ0xHNCtyRE1NUSsrd1hU?=
 =?utf-8?B?dWUxdW44L242bHFra3FzdC9VOHR2cEI2VEVOZS8xMnNaUWl2SzNheDJsbGJD?=
 =?utf-8?B?dGJjd0JCUis4U3hLMmJ4dWxVQjVQUE1GcFo0OGMxRU1jQUc5SWJuMjhQNXhk?=
 =?utf-8?B?Tkgwb0Fvd0pWUDd5RUFoV0QwRFdoRnMxSWhpU2NTOUxiWWRxUjZyUWNIdXJ4?=
 =?utf-8?B?K2U3TlM0Mkw1MUhlTjl6Q1FFeGs0bDNwTFZtaGtSTzNUTTYvcmYyT1N4SG5O?=
 =?utf-8?B?bWlRTkpwdG0xSlBQK21sVDJLM1pxeUVKQk54Y3I0SE5ob3VhUVZydGplWEpH?=
 =?utf-8?B?MnN0MWxOQStVNnhwM0p3aDZlYUVZR0s5YzhNTEs4MnZQV1IwTzJ4NWlRVVU2?=
 =?utf-8?B?cmRGOU5LQzZWRFZMWEVvVWlYRE9zVHh5ZXdaMUdRajJ5cjg5QjMySFJzOFdB?=
 =?utf-8?B?b3pGdk9sbTdjR29TaDBmMmlKSzBFR0JPZjNCT3dzMmx2Z2xsUlQySXpScGlB?=
 =?utf-8?B?dDM5WGFpeThOZlgwSnB3bThYUmRvVG9UNFU2U3hoamdmdE16emlCbkNMTi94?=
 =?utf-8?B?aFhidWZzVlpMSlJIa0ZoY3VHRmlWWU80L1F2aU9qdzNCRDg3TkdmTCtjQWRt?=
 =?utf-8?B?WFZXbjY0N2YrTWEzVEZDUk5wYkdKczhsbExKVUNHZjZqSnlveEtmdW5sWTdS?=
 =?utf-8?B?cmo0THdxNDRuY3FYTGJHMFJ2M0xYVlZpQjEvYnNKRUE3NmZKNXJCUVBuUm41?=
 =?utf-8?B?SHM0UTdvSy9pdjRjaEJ6ditYbHE3K0lRbFFlY3Y2b20zaVhKb3dtN2tQU0tB?=
 =?utf-8?B?Sk1GanZ6SGV0ZGlGVXFLN0FwQVlVMU1UWThrQUVXT2Jwd0lKelk2QmJHOUNN?=
 =?utf-8?B?dUlVWGl2SitxWngrWGQxTWcyUHFWRVQyai9QZEFaQmo3NHVHVHJPdEc5Y085?=
 =?utf-8?B?WldzTEVwcU4zamowNXRoVTNqNUllalFJdm44TWM3ZDRmYkJOcjk0OU51anVW?=
 =?utf-8?B?ckhrVjVnMVFXcm5XS1Y4MnFvaUZkdkYrbTFQUzVGcjBTckhEK0pmQVhjdU96?=
 =?utf-8?B?MkRIdW9sYnRvWjhEQVhTRUlTcXdOaDlRK01YY2FqS2llZ0dZMHNQZ09Md3Aw?=
 =?utf-8?B?V0Y5NmtGdHphWGsvWXJBMWNFc1pxclgvVXRkc25zcnNZZE9VakxCUEFIOG9W?=
 =?utf-8?Q?/VKh8rJ9Bx4bKmEu6sMRR1IBAxDRMI8636IFRfh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 220eaf82-a7fb-4c42-c712-08d9282e16b0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 14:27:46.5459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BN1mv3iLyHFBCWeB0NJtayxBmqHuyIBwdfFHHvEDCKobP9xc4krcDtPxoI9ahQ5rgNiZvVBp4gMJN8HgCarXEfbQX7ZvgjLjDGBafTyM5gA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1777
Received-SPF: pass client-ip=40.107.21.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_LOW=-0.7,
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

04.06.2021 19:39, John Snow wrote:
> Refactor the core function of the linting configuration out of 297 and
> into a new file called linters.py.
> 
> Now, linters.py represents an invocation of the linting scripts that
> more resembles a "normal" execution of pylint/mypy, like you'd expect to
> use if 'qemu' was a bona-fide package you obtained from PyPI.
> 
> 297, by contrast, now represents the iotests-specific configuration bits
> you need to get it to function correctly as a part of iotests, and with
> 'qemu' as a namespace package that isn't "installed" to the current
> environment, but just lives elsewhere in our source tree.
> 
> By doing this, we will able to run the same linting configuration from
> the Python CI tests without calling iotest logging functions or messing
> around with PYTHONPATH / MYPYPATH.
> 
> iotest 297 continues to operate in a standalone fashion for now --
> presumably, it's convenient for block maintainers and contributors to
> run in this manner.
> 
> See the following commit for how this is used from the Python packaging side.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> ---
> 
> - It's a big glob of a patch. Sorry. I can work it into smaller pieces
>    if the idea is well received.

If at least split movement from other refactoring, would be good

> 
> - I change the invocations of mypy/pylint to "python3 -m pylint" and
>    "python3 -m mypy" respectively, which causes these linters to use the
>    virtual environment's preferred version. This forces the test to use the
>    test environments curated by the CI jobs.
> 
> - If you have installed Fedora's pylint package that provides
>    "pylint-3", the above trick will still work correctly.
> 
> - Checking for "pylint-3" specifically in 297 was left
>    alone. Theoretically, this check could be broadened to simply look for
>    the presence of a 'pylint' module to allow it to be more permissive.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297        |  88 ++++-------------------
>   tests/qemu-iotests/linters.py | 130 ++++++++++++++++++++++++++++++++++
>   2 files changed, 143 insertions(+), 75 deletions(-)
>   create mode 100644 tests/qemu-iotests/linters.py
> 
> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index 433b732336..5c753279fc 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -17,98 +17,36 @@
>   # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   
>   import os
> -import re
>   import shutil

[..]

> -    # fixed (in tests, at least)
>       env = os.environ.copy()
> -    qemu_module_path = os.path.join(os.path.dirname(__file__),
> -                                    '..', '..', 'python')
> +    qemu_module_path = os.path.join(
> +        os.path.dirname(__file__),
> +        '..', '..', 'python'
> +    )

Hmm, you made 3 lines from 2 :) ... If rename to python_path it will fit into one line. I'm not sure that it's better.

> +
>       try:
>           env['PYTHONPATH'] += os.pathsep + qemu_module_path
>       except KeyError:
>           env['PYTHONPATH'] = qemu_module_path
> -    subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX', *files),
> -                   env=env, check=False)
>   
> -    print('=== mypy ===')
> -    sys.stdout.flush()
> -
> -    # We have to call mypy separately for each file.  Otherwise, it
> -    # will interpret all given files as belonging together (i.e., they
> -    # may not both define the same classes, etc.; most notably, they
> -    # must not both define the __main__ module).
>       env['MYPYPATH'] = env['PYTHONPATH']
> -    for filename in files:
> -        p = subprocess.run(('mypy',
> -                            '--warn-unused-configs',
> -                            '--disallow-subclassing-any',
> -                            '--disallow-any-generics',
> -                            '--disallow-incomplete-defs',
> -                            '--disallow-untyped-decorators',
> -                            '--no-implicit-optional',
> -                            '--warn-redundant-casts',
> -                            '--warn-unused-ignores',
> -                            '--no-implicit-reexport',
> -                            '--namespace-packages',
> -                            filename),
> -                           env=env,
> -                           check=False,
> -                           stdout=subprocess.PIPE,
> -                           stderr=subprocess.STDOUT,
> -                           universal_newlines=True)
>   
> -        if p.returncode != 0:
> -            print(p.stdout)
> +    for linter in ('pylint-3', 'mypy'):
> +        if shutil.which(linter) is None:
> +            iotests.notrun(f'{linter} not found')
>   
> +    iotests.script_main(lambda: linters.run_linters(files, env=env))

Why to use lambda, and not just pass main to script_main?

Or, may be, use iotests.script_initialize() at top, and keep the whole script at top indentation level?


-- 
Best regards,
Vladimir

