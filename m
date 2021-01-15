Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69B82F7C50
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:17:56 +0100 (CET)
Received: from localhost ([::1]:35254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0OzD-0003Fu-QI
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0OsY-0007wH-53; Fri, 15 Jan 2021 08:11:03 -0500
Received: from mail-eopbgr20136.outbound.protection.outlook.com
 ([40.107.2.136]:52992 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0OsR-0007SA-UC; Fri, 15 Jan 2021 08:11:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/zuv+fzZQCHsNVLnUNyJIEpqdjdbUtLT6q6VQ+GCkcQFyfMtrnbvh4kwuehaU7rnaSiVTAzu4gmUgLnqh0QVOMYvRNlDrQ57Sbf9J0cChFCTh/uWCaF2OlDEfRJldYMdpNGGzeSdnFDL0ZQp7I9evZGWKHQbbQbyonvJMOhciP4a2w8ityGGdU9G/ys0QjjUr7JbDDoZYg7+wqlY/O9e1b8foUCMX/03Fn2lazni2ql79RfHJSetP426V+swEBisdr8eOgU5PxnAerkuZDwTaztN4KW79sH1S9JaKiclL0+zokPx741CRTxaISV2oRP0apqNCNI4shNT/MRsssi6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNNboC+Yn5RGrxFWwNw8biCi9frLq2kekPoM1oqYYsE=;
 b=E4knplYku7kq9EyFYaGd8tbhl3nP3p9LkJEwSp1jUA69IvRHoCAQmW7WePsbNIa6etQ6CRps+tuTurDLF/9w0AJfQWzJMZd/e8WYuLXiKlrV/isyVhMLe6xdW4WYgRfcmBPHQnazH56zaddfGe68Q3PKfhQEzRSAZqmjbwEwKnajY4pat1ICT6B1qVsfqvyaEwvCVAj7iCLH7t/IzfRjZ7aQUveoyaR6sPGDt23Nj+fInxxs5K5CJ03F8DKGeptRbYWBesuBmbXCBcAMI2nbO9JEJr3K2n0n/gq6ZyTrIFeZAhz6na8SvlEEyGeZf/ScVp9cvMAOKMDkxU2iCZYplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNNboC+Yn5RGrxFWwNw8biCi9frLq2kekPoM1oqYYsE=;
 b=dyrHEGbaULxp0biMYoW+/rxGZHFUCG2DmF3hxAKakpejQJDSJECB91U76VuOi6yvbfB768Sk4AqKMHxFCBTAdX1rqFCzP++5HmDMN/PnQCDAM/OPQ/pG6c8ZWeOHgbTix5tAxDFedY6H8EEp/L5yHrMDKbW8IFry1oxM1j8Q6Y4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6117.eurprd08.prod.outlook.com (2603:10a6:20b:292::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 13:10:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 13:10:52 +0000
Subject: Re: [PATCH v6 08/11] iotests: add testenv.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-9-vsementsov@virtuozzo.com>
 <20210115111827.GB5429@merkur.fritz.box>
 <6fbbcc18-3f14-bcd6-05a2-a40e0352710d@virtuozzo.com>
 <20210115124555.GC5429@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <41e62d69-30f1-eb86-6cc3-cdd052aadb26@virtuozzo.com>
Date: Fri, 15 Jan 2021 16:10:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210115124555.GC5429@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.75]
X-ClientProxiedBy: AM3PR07CA0086.eurprd07.prod.outlook.com
 (2603:10a6:207:6::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.75) by
 AM3PR07CA0086.eurprd07.prod.outlook.com (2603:10a6:207:6::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.8 via Frontend Transport; Fri, 15 Jan 2021 13:10:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37e00a01-6e89-4eac-5463-08d8b956fc49
X-MS-TrafficTypeDiagnostic: AS8PR08MB6117:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61179119FAA486F5C8A1FF67C1A70@AS8PR08MB6117.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bwGZynkulcrFbN8jo/CuLtrBYMFRvvzdFZr3L6b026xhiuC/YMVjmFWdkEF8M1cYHUYZw0croV37GFofbc264gn2YB/uBx5G9UwRspuuczjGwQrGTe8IS7m39CGw84gYKicABq18raR9eHb6XQ6IfftblKJlHfrrkpYV9G/bFdVO9XGsmlmg/FsNV9suv/XUE15vdM67z6/zZ4nAAEB1dnZYudROp9j5cp74uWEEky8DsdlH0OCT5oS7XTBB71/eqcqQ/EcyuXU3BwdvF5EqqllACHl04DXZQulS0oZKFLnhLaLccViOMW+iBSU1cvY5ir8l3s3U18ixieG6SUjCeF6Y/fX9vshcM7DarpXavoxWBsiSxviIlHW5Tg2tb1/2OWf19TdMIn4/H6aym9kpBlVj5wcvgCUacuy4iuia+/IYLcnaA2NnvH8ErLCzEvLWRHetg0UVw/yvwt2zr6AtxMXdNph58G9PvdG1FIgIDMc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(366004)(136003)(376002)(8936002)(66476007)(36756003)(66556008)(6916009)(66946007)(4326008)(2906002)(86362001)(52116002)(478600001)(31696002)(8676002)(5660300002)(16576012)(316002)(83380400001)(6486002)(186003)(26005)(16526019)(31686004)(2616005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eUIzbmliRkxrR21wNzcxdzhkc0hNUUxLRFFpellSUDhmc2ZKN1czejJ6WnVR?=
 =?utf-8?B?eWZaRDhROVpadmtXSHU0ZUNmblRENk1odEpkdk1xRGVQVyt1RGM5LzQ0Vk1w?=
 =?utf-8?B?anUyMHBHUWl5dk5KTUJEZDFub3R4SDY4cWNNM3hkb25ZVjZNV3dvdDRidDJl?=
 =?utf-8?B?MjlySllxc1h4Zk93SWZYcis3YVJpb0FsRjNpTmVadmU3d3J6eWpSVTNYVGJx?=
 =?utf-8?B?RDhHOENPMmxEaDY2ZzlwY25KZkNoWjhyUHNnWElUaHQ0UTNiZDVXTlk3ZmpD?=
 =?utf-8?B?Mm12MHEyMXN0eXFCa3BReGNieDZzdzVkUDRCSmNnZ3FndE50aG1XekJsYmdV?=
 =?utf-8?B?SlZxWEtWdkQvZVFLR1pSOVN2WDdOczZhNEJ3V3BPbWN1ajg5VllvRDRCeUFI?=
 =?utf-8?B?ZFhPRkU1S1BNdVNtSm1jUzdYRytKUWFCNzJyQWI1VEd2UzZLcHFjRGd4SEhq?=
 =?utf-8?B?SVgxbmFKMkE4TXhMaU4wczlxY0t6cTQ0eVkybVZOMHhUaG4rUXRiTkJaT0JN?=
 =?utf-8?B?b3FIMVV2ZytCNDRoOTlpa2x4VlArK2cwRG91ci8vMjYrdVJCbFA4TEw0Nkln?=
 =?utf-8?B?VE9XYU15cFF0bFE3Ty95alhTdnZtaFRBMFRUL3VuZ1dyZnpKem9pQjhxVFFY?=
 =?utf-8?B?NmUvaUdtWmpuaWVwWE5JUFJmRldrRGg5dTNoOWRMekZvd1BnMWphMVQ5Ympw?=
 =?utf-8?B?UU1wWWdwL1BxRFJEblhyWW05N3diR2lYUDNnZHM2ZzkrT2QrbXZMSVNPUjlE?=
 =?utf-8?B?Z3ZxMjMwbFd5VDZtRFp2TGhTbk8xQlAyTS81NDBpNkJIaG9qTzBkeFhYcktP?=
 =?utf-8?B?NE4ySE5CQWtqMXB2V2lBODZwTGpZcnZSa3J5TVJaa3liZktXVmtMd1dYMzVU?=
 =?utf-8?B?d3l3bDV3SVc0TlNKNW53eWFXMUxMWEZldjU1b1VnQUo4bUE3SlVrVVRRRFp5?=
 =?utf-8?B?OTZWVndJM01ydnhiclVKSmRybXo4MXh3N2ZtUGM5UjM3YWlWQUJPQzJsSFM0?=
 =?utf-8?B?YnliSk8yOVpYN0V6MnNEWm14QjdMTTBvWkxNN2xlYld2TUdxb0VTa2V6ZDVV?=
 =?utf-8?B?aXFoUDJtUDljUGxLMzZzWVlQdSthSlVSOTBBUnpSV0xGN09Yd3Q4SVovd0pX?=
 =?utf-8?B?UG5DMTdpSklIRFcxMVpoc3Y5b2lyckFyRHoybkd2TlpiZ0ZXai9peThMRHJt?=
 =?utf-8?B?THVvZDlFZE4vV2hxZ1MwZHNRK1ZBLytHQVdNbjNuRlNuT3lidit0VUMwWlZE?=
 =?utf-8?B?b1VCbHVvUlFJL0FhS0t6ckV3WmdENHA1T1RRTVd6VHY0VXJOTzZ1Tk1rSVVW?=
 =?utf-8?Q?0cqvJlj4EI8e1UDloypGfJMt0REvWJUb3k?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e00a01-6e89-4eac-5463-08d8b956fc49
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 13:10:52.4896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmqrO9EfTeSwK0yPDSGW/zFCGQVaFX8EavCxcnPs7TpD6EEew8opCZZvZ9H/Kwxy2p61F3B4mW9GJ8L4A0wJlnYYOD0ljm4LvmGCYpiHWkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6117
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.01.2021 15:45, Kevin Wolf wrote:
> Am 15.01.2021 um 13:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 15.01.2021 14:18, Kevin Wolf wrote:
>>> Am 09.01.2021 um 13:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> Add TestEnv class, which will handle test environment in a new python
>>>> iotests running framework.
>>>>
>>>> Difference with current ./check interface:
>>>> - -v (verbose) option dropped, as it is unused
>>>>
>>>> - -xdiff option is dropped, until somebody complains that it is needed
>>>> - same for -n option
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>    tests/qemu-iotests/testenv.py | 328 ++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 328 insertions(+)
>>>>    create mode 100755 tests/qemu-iotests/testenv.py
>>>>

[..]

>>>> +    def init_binaries(self):
>>>> +        """Init binary path variables:
>>>> +             PYTHON (for bash tests)
>>>> +             QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
>>>> +             SOCKET_SCM_HELPER
>>>> +        """
>>>> +        self.python = '/usr/bin/python3 -B'
>>>
>>> This doesn't look right, we need to respect the Python binary set in
>>> configure (which I think we get from common.env)
>>
>> Oh, I missed the change. Then I should just drop this self.python.
> 
> Do we still get the value from elsewhere or do we need to manually parse
> common.env?

Hmm.. Good question. We have either parse common.env, and still create self.python variable.

Or drop it, and include common.env directly to bash tests. For this we'll need to export

BUILD_IOTESTS, and do
  . $BUILD_IOTESTS/common.env

in common.rc..


> 
>>>
>>>> +        def root(*names):
>>>> +            return os.path.join(self.build_root, *names)
>>>> +
>>>> +        arch = os.uname().machine
>>>> +        if 'ppc64' in arch:
>>>> +            arch = 'ppc64'
>>>> +
>>>> +        self.qemu_prog = os.getenv('QEMU_PROG', root(f'qemu-system-{arch}'))
>>>> +        self.qemu_img_prog = os.getenv('QEMU_IMG_PROG', root('qemu-img'))
>>>> +        self.qemu_io_prog = os.getenv('QEMU_IO_PROG', root('qemu-io'))
>>>> +        self.qemu_nbd_prog = os.getenv('QEMU_NBD_PROG', root('qemu-nbd'))
>>>> +        self.qsd_prog = os.getenv('QSD_PROG', root('storage-daemon',
>>>> +                                                   'qemu-storage-daemon'))
>>>> +
>>>> +        for b in [self.qemu_img_prog, self.qemu_io_prog, self.qemu_nbd_prog,
>>>> +                  self.qemu_prog, self.qsd_prog]:
>>>> +            if not os.path.exists(b):
>>>> +                exit('Not such file: ' + b)
>>>> +            if not os.access(b, os.X_OK):
>>>> +                exit('Not executable: ' + b)
>>>> +
>>>> +        helper_path = os.path.join(self.build_iotests, 'socket_scm_helper')
>>>> +        if os.access(helper_path, os.X_OK):
>>>> +            self.socket_scm_helper = helper_path  # SOCKET_SCM_HELPER
>>>> +
>>>> +    def __init__(self, argv: List[str]) -> None:
>>>> +        """Parse args and environment"""
>>>> +
>>>> +        # Initialize generic paths: build_root, build_iotests, source_iotests,
>>>> +        # which are needed to initialize some environment variables. They are
>>>> +        # used by init_*() functions as well.
>>>> +
>>>> +
>>>> +        if os.path.islink(sys.argv[0]):
>>>> +            # called from the build tree
>>>> +            self.source_iotests = os.path.dirname(os.readlink(sys.argv[0]))
>>>> +            self.build_iotests = os.path.dirname(os.path.abspath(sys.argv[0]))
>>>> +        else:
>>>> +            # called from the source tree
>>>> +            self.source_iotests = os.getcwd()
>>>> +            self.build_iotests = self.source_iotests
>>>> +
>>>> +        self.build_root = os.path.join(self.build_iotests, '..', '..')
>>>> +
>>>> +        self.init_handle_argv(argv)
>>>> +        self.init_directories()
>>>> +        self.init_binaries()
>>>> +
>>>> +        # QEMU_OPTIONS
>>>> +        self.qemu_options = '-nodefaults -display none -accel qtest'
>>>> +        machine_map = (
>>>> +            (('arm', 'aarch64'), 'virt'),
>>>
>>> How does this work? Won't we check for "qemu-system-('arm', 'aarch64')"
>>> below, which we'll never find?
>>
>> Hmm. I just took existing logic from check:
>>
>> [..]
>>    case "$QEMU_PROG" in
>>        *qemu-system-arm|*qemu-system-aarch64)
>>            export QEMU_OPTIONS="$QEMU_OPTIONS -machine virt"
>>            ;;
>> [..]
> 
> What I mean is that the code below doesn't look like it's prepared to
> interpret a tuple like ('arm', 'aarch64'), it expects a single string:
> 
>>>
>>>> +            ('avr', 'mega2560'),
>>>> +            ('rx', 'gdbsim-r5f562n8'),
>>>> +            ('tricore', 'tricore_testboard')
>>>> +        )
>>>> +        for suffix, machine in machine_map:
>>>> +            if self.qemu_prog.endswith(f'qemu-system-{suffix}'):
> 
> Here we get effectively:
> 
>      suffix: Tuple[str, str] = ('arm', 'aarch64')
> 
> The formatted string uses str(suffix), which makes the result
> "qemu-system-('arm', 'aarch64')".
> 
> Or am I misunderstanding something here?

Ah, you are right:) Will fix. I interpreted your

   Won't we check for "qemu-system-('arm', 'aarch64')"

as
   
   Won't we check for "qemu-system-arm" or "qemu-system-aarch64"



-- 
Best regards,
Vladimir

