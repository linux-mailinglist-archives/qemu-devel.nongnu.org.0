Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1332F77A5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 12:29:44 +0100 (CET)
Received: from localhost ([::1]:37520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0NIV-0000Ze-8h
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 06:29:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0NHM-0008Oz-OV; Fri, 15 Jan 2021 06:28:32 -0500
Received: from mail-eopbgr60118.outbound.protection.outlook.com
 ([40.107.6.118]:31682 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0NHJ-0003TV-GI; Fri, 15 Jan 2021 06:28:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1h3t3tDiOI0G5TE3vQzp+glO3dQWKWFs/GQmT7Gb1Qo0LjEBnsmJyN4XtYSjmYOz/MX0vYMc/os0DkUcsrIZcPdjq6sjQb7gk4ZRQUfecZdJ6RQH5nK2b6n+kApomRRaVj9+oel4K9JSknSvViZD4lz8eJm9glYlFDuD6vYefazhwxMQliMSQ/tIoiuOZi66cQca48PpN5hJWPZY4F9fcHIpgATb0S7EzP2avE6hZaQN+kECtdrhDGbF6s1rYWJAgyaIzFmfrf93SJVlxDM1DAwrQBhQ0svFGnkp5vWm7gSpMjezhBrx97hJHIHaLqxRO+FKc/pOXgKwA8zPuc7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jRlHZJsPPbtWxcYQxXt62zYvW4NR9NsZ96zCvJ8JOQ=;
 b=AsJ1s18Oa3iPpeD2D+PrPBWkkeT/4fTn4HdqZeO6vRTpxGVLEsSvuT24n4rvnVuENOrZqN326Jb2tt1OuUdQrh/L9mXyRMt6QcP0dQ2ciSWYuWS/7FZDHXJGqKyak3u0kwxG3W0UaZY3/hDgEJ9C3z54SgvGOF7C6fbWshTnKZMkcR65i5k8EL2IAKZ4LWXVpcup+ubTT2v8h/DEnxdoe+M0hIEhVa+IsB65WPLXjcKkpMifNfijAgQOwKGPf5l0UYq8Yn2bOKA769raIEthod8G6MVVGyiOwrglCCV05atxl2+zhDNSG04qZqL6EATRR+6d2Q1ruTP5UIzv3asMbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jRlHZJsPPbtWxcYQxXt62zYvW4NR9NsZ96zCvJ8JOQ=;
 b=hPB3nOmHNy2FG1LXnHO69B+M5NtlZE7y2KiNAB2cixIrQwZsiNMRr+Mgw0Sm8vHKY9QU9rdVw/370QN6fdTcX0wVcl3VvlXO5fXabZT8+iaLWqphWIeSoOkAgAyOFR49jWLYghde5ZVsl9RaiCAv0VH8cAfcpBC1yWtmakrIxW8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4949.eurprd08.prod.outlook.com (2603:10a6:20b:ee::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 11:13:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 11:13:21 +0000
Subject: Re: [PATCH v3 02/10] iotests/297: Rewrite in Python and extend reach
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210114170304.87507-3-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a6000188-ec04-e681-3e59-4e2e7be44574@virtuozzo.com>
Date: Fri, 15 Jan 2021 14:13:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210114170304.87507-3-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.75]
X-ClientProxiedBy: FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.75) by
 FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.6 via Frontend Transport; Fri, 15 Jan 2021 11:13:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fab31d8-460c-4edd-a8bb-08d8b9469145
X-MS-TrafficTypeDiagnostic: AM6PR08MB4949:
X-Microsoft-Antispam-PRVS: <AM6PR08MB49493C1B0810CD312092BE8AC1A70@AM6PR08MB4949.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FPw//DMXuggimTfbiSuV7PtkZQrgecT75fsmXT27o1aVuRpadUl3jJSAFapmksNkmqjl146O+yWGRXql+LQFjb/sRT1hBjaYE4YFghvrOPFkqYrsuwQ7Qh2VfCcueKLaW07HJMo8KtdT2iD/eM14QSnVOQnATQ+byz56SAg0KX1LlQDNpuaIglmg/ULWAd+sJH9Hd4fNK7MombTPbu2Ay8oBGopqaLAnGZQQla+rPRqNRdjJFjdYYqF7PJtvLKMwNvoeYov2AxTBCe7YrZrrU0Ix6NnStyhF1uunqKUrn8XgUGD3+SCQzh2985tZW6V4iX99qFNOHBJTn36bY02oyxNHc/1+dKliragT1R40Sk4kYIouMxYNv8hPOw6B2ENrFxLn1BFDHq/qHmQhoXU6+GP4v8ogESTiFDuC7D0EFpt53nCqD1o71/JpcZLv+chzOvmo/ntQOyYXPeECIRYUee+kPP5jdmY8Z+7soeX41/+QgXteuZXIRwqDXfVRxKkM7CBsVzjCqCmZOwkJdRrsX0CT/BS7Aug/bKxIo2acaKktH3TyGujAXAAaP4VCXmydwsGTNWpvm6pKwNCW3Skpeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39830400003)(346002)(366004)(5660300002)(6666004)(86362001)(36756003)(31696002)(478600001)(16526019)(2906002)(8936002)(186003)(26005)(4326008)(8676002)(6486002)(31686004)(956004)(2616005)(16576012)(83380400001)(66556008)(66476007)(66946007)(316002)(54906003)(52116002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NVZMTmJhcFk2VDYxUjE0UmNJZnNjdmFDdTJ0cE9ucVhBRHoxWUJGZm1OQU1M?=
 =?utf-8?B?VmxTRkdRVCtvejF3U0JkTU11UmVnb3ZQVVkzQlhCNzV0TkpBSERqcjRIdDIx?=
 =?utf-8?B?T1dRN0FqbFRIdVJocGpLOEc1YjBWZ1lNQ0FReVVTQ25qb0FZMTJ6bVJRaDBB?=
 =?utf-8?B?cjVIUzU2dkl2QmdmYjlxbThYU1JsVDlISCtXNVhLRUVKSGNxbWJRSHhlcGpQ?=
 =?utf-8?B?ODdnUENOaEVQaDB1aFNpamp6TVY5bkFwYUEvTDg4eitXSnpUcWQ5SGVXVlE2?=
 =?utf-8?B?b1paWmxFT21vaU0xV2toUXc2cFEwd2hKWDFpa2krYVdNYnQ4NFZuU0syNmYy?=
 =?utf-8?B?OFdTZk50clNndHUyd1FzNXZ3a1VyYXp6clNPZVFZbmJLQVdzSjl4aXhxWTl4?=
 =?utf-8?B?eE1PeHlCdGdVTGpTcFZNN3kwWjRFSXdIR1l4ZjRjYWljSTVib2htTmphQ1hw?=
 =?utf-8?B?aUFsM0hZNUxjdE5hSjM1bDYvTzJGeEdEZUhHckd1UU1NUEdWcXQ3bDRlYWoy?=
 =?utf-8?B?REN1WjFweTBqbkhvbUs1S2YwQ1Q3eERTRmJNRFdSc0JkMDlnUHhhUHorWTBI?=
 =?utf-8?B?L0NPN0FtMWdWYllLODlLTTJaYUhVZkY5cHV0OXkwbEpPOFRDOHZMLzJ5YURu?=
 =?utf-8?B?WjNnVHNHL0xjcjJ1Z0Z6T0FCeGtBU01TdEluaGZTMkt4dVNOMis5L2d5L3dz?=
 =?utf-8?B?YlFPSmRSMFlyVGZHaFFrNENIc2JlNlBubkw2djVFWS9NNWpXNWRXRHN4R0hp?=
 =?utf-8?B?SlZ1QmVDcisxSU0zSTk0cGtpV3d3RDUwRGYxYlBuRFB3enJiem1UckZnbDd6?=
 =?utf-8?B?U0ZrQWprbS9JY0MvUDMzM0Uwa1JiUmttUnJ0alU4M3pDd21lV0U5K3BQMTFH?=
 =?utf-8?B?bXBCVUs2OC9pUzZVNHQxZHR5RFljYlBvejJ6elZmclY4NUZUTldxS2F0OTIr?=
 =?utf-8?B?SUNFd2dNNys0N21SWVJRZzZtQ1pJakZHOHZqbVJOU3ZVbUZvRWdOQzF5WGxy?=
 =?utf-8?B?ZklQcncrdWFCeTdpOC9oNEFDS2RFNGRhWVZpdGVVUEExZ1AxZXNBTmM3ZFB4?=
 =?utf-8?B?eWZvTXd4bzkrWlpCYUdoM09qWnAxdVdSYmhpZHhFYWhNdWxmR3JKTGVzSFlN?=
 =?utf-8?B?REVGV0RIVDVqNGliM3V0WDVQMElCVEIwaXc2bnRkT0Y0dC91aTNzNUNFSnB4?=
 =?utf-8?B?bWZlWmFhaWpUTXhTMVhWakgxMitiSUc2ZW5MVWdlUUtFdVZ1WmRZVHdycG0y?=
 =?utf-8?B?TnVOQ3JVbllsRTJhdS9pNGxZcURHeTNQeGZrbm0wT3FNYS8zUyswcWF1b1hQ?=
 =?utf-8?Q?1BoD0vMGRcVDgKFWKIcsbaxiTolezb7ZWr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fab31d8-460c-4edd-a8bb-08d8b9469145
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 11:13:21.3849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFmXnWpzQ3mGHbiWpfKxRYGl/0F0JfzG1aM/g1fmZqRxSCyGEL+AEUhFSEs4Yj2pcvv0rvwWEl0p9V+ESJYpj4O5EV9o2PnSfZ8O/CPeMQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4949
Received-SPF: pass client-ip=40.107.6.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_NONE=-0.0001,
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

14.01.2021 20:02, Max Reitz wrote:
> Instead of checking iotests.py only, check all Python files in the
> qemu-iotests/ directory.  Of course, most of them do not pass, so there
> is an extensive skip list for now.  (The only files that do pass are
> 209, 254, 283, and iotests.py.)
> 
> (Alternatively, we could have the opposite, i.e. an explicit list of
> files that we do want to check, but I think it is better to check files
> by default.)
> 
> Unless started in debug mode (./check -d), the output has no information
> on which files are tested, so we will not have a problem e.g. with
> backports, where some files may be missing when compared to upstream.
> 
> Besides the technical rewrite, some more things are changed:
> 
> - For the pylint invocation, PYTHONPATH is adjusted.  This mirrors
>    setting MYPYPATH for mypy.
> 
> - Also, MYPYPATH is now derived from PYTHONPATH, so that we include
>    paths set by the environment.  Maybe at some point we want to let the
>    check script add '../../python/' to PYTHONPATH so that iotests.py does
>    not need to do that.
> 
> - Passing --notes=FIXME,XXX to pylint suppresses warnings for TODO
>    comments.  TODO is fine, we do not need 297 to complain about such
>    comments.
> 
> - The "Success" line from mypy's output is suppressed, because (A) it
>    does not add useful information, and (B) it would leak information
>    about the files having been tested to the reference output, which we
>    decidedly do not want.
> 
> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/297     | 109 +++++++++++++++++++++++++++++--------
>   tests/qemu-iotests/297.out |   5 +-
>   2 files changed, 89 insertions(+), 25 deletions(-)
> 
> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index 5c5420712b..bfa26d280b 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env bash
> +#!/usr/bin/env python3
>   #
>   # Copyright (C) 2020 Red Hat, Inc.
>   #
> @@ -15,30 +15,95 @@
>   # You should have received a copy of the GNU General Public License
>   # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   
> -seq=$(basename $0)
> -echo "QA output created by $seq"
> +import os
> +import re
> +import shutil
> +import subprocess
> +import sys
>   
> -status=1	# failure is the default!
> +import iotests
>   
> -# get standard environment
> -. ./common.rc
>   
> -if ! type -p "pylint-3" > /dev/null; then
> -    _notrun "pylint-3 not found"
> -fi
> -if ! type -p "mypy" > /dev/null; then
> -    _notrun "mypy not found"
> -fi
> +# TODO: Empty this list!
> +SKIP_FILES = (
> +    '030', '040', '041', '044', '045', '055', '056', '057', '065', '093',
> +    '096', '118', '124', '129', '132', '136', '139', '147', '148', '149',
> +    '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
> +    '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
> +    '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
> +    '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
> +    '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
> +    '299', '300', '302', '303', '304', '307',
> +    'nbd-fault-injector.py', 'qcow2.py', 'qcow2_format.py', 'qed.py'
> +)
>   
> -pylint-3 --score=n iotests.py
>   
> -MYPYPATH=../../python/ mypy --warn-unused-configs --disallow-subclassing-any \
> -    --disallow-any-generics --disallow-incomplete-defs \
> -    --disallow-untyped-decorators --no-implicit-optional \
> -    --warn-redundant-casts --warn-unused-ignores \
> -    --no-implicit-reexport iotests.py
> +def is_python_file(filename):
> +    if not os.path.isfile(filename):
> +        return False
>   
> -# success, all done
> -echo "*** done"
> -rm -f $seq.full
> -status=0
> +    if filename.endswith('.py'):
> +        return True
> +
> +    with open(filename) as f:
> +        try:
> +            first_line = f.readline()
> +            return re.match('^#!.*python', first_line) is not None
> +        except UnicodeDecodeError: # Ignore binary files

PEP8 asks for two spaces before inline comment

> +            return False
> +

and two empty lines here

(good ALE vim plugin runs flake8, mypy and pylint asynchronously for me and shows these things)

> +def run_linters():
> +    files = [filename for filename in (set(os.listdir('.')) - set(SKIP_FILES))
> +             if is_python_file(filename)]
> +
> +    iotests.logger.debug('Files to be checked:')
> +    iotests.logger.debug(', '.join(sorted(files)))

O, good.

> +
> +    print('=== pylint ===')
> +    sys.stdout.flush()

Should not hurt.. But why? Should be flushed anyway as print will put a '\n'.. And why you care about it at all?

> +
> +    # Todo notes are fine, but fixme's or xxx's should probably just be
> +    # fixed (in tests, at least)
> +    env = os.environ
> +    try:
> +        env['PYTHONPATH'] += ':../../python/'
> +    except KeyError:
> +        env['PYTHONPATH'] = '../../python/'
> +    subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX', *files),
> +                   env=env, check=False)

as I understand, you don't need env argument, as os.environ is inherited by default.

> +
> +    print('=== mypy ===')
> +    sys.stdout.flush()
> +
> +    # We have to call mypy separately for each file.  Otherwise, it
> +    # will interpret all given files as belonging together (i.e., they
> +    # may not both define the same classes, etc.; most notably, they
> +    # must not both define the __main__ module).
> +    env['MYPYPATH'] = env['PYTHONPATH']
> +    for filename in files:
> +        p = subprocess.run(('mypy',
> +                            '--warn-unused-configs',
> +                            '--disallow-subclassing-any',
> +                            '--disallow-any-generics',
> +                            '--disallow-incomplete-defs',
> +                            '--disallow-untyped-decorators',
> +                            '--no-implicit-optional',
> +                            '--warn-redundant-casts',
> +                            '--warn-unused-ignores',
> +                            '--no-implicit-reexport',
> +                            filename),
> +                           env=env,
> +                           check=False,
> +                           stdout=subprocess.PIPE,
> +                           stderr=subprocess.STDOUT,
> +                           text=True)

Can you really use "text" ? We require python 3.6 (in check), but text comes from 3.7..
It may break some test environments. I think we need old good universal_newlines=True which is the same.

With s/text/universal_newlines/:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> +
> +        if p.returncode != 0:
> +            print(p.stdout)
> +
> +
> +for linter in ('pylint-3', 'mypy'):
> +    if shutil.which(linter) is None:
> +        iotests.notrun(f'{linter} not found')
> +
> +iotests.script_main(run_linters)
> diff --git a/tests/qemu-iotests/297.out b/tests/qemu-iotests/297.out
> index 6acc843649..f2e1314d10 100644
> --- a/tests/qemu-iotests/297.out
> +++ b/tests/qemu-iotests/297.out
> @@ -1,3 +1,2 @@
> -QA output created by 297
> -Success: no issues found in 1 source file
> -*** done
> +=== pylint ===
> +=== mypy ===
> 


-- 
Best regards,
Vladimir

