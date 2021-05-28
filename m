Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF9B3945DE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 18:29:45 +0200 (CEST)
Received: from localhost ([::1]:37560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmfMk-00043t-LK
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 12:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmfKI-0002z8-6E; Fri, 28 May 2021 12:27:10 -0400
Received: from mail-db8eur05on2138.outbound.protection.outlook.com
 ([40.107.20.138]:16897 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmfKE-0007KQ-HC; Fri, 28 May 2021 12:27:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4ur8YqwfeWbJ9BsMOL7Upb1DMiqfg8m9oHC++ccjgsjZVqoINSwFdIlubA2EoEJQtWE3MtZVriHzRUIuI+SiF6hrxYtrNKSiFclQv02JNojK/mCpOMofo0FOpyT2iBXKeOrjoW4+b8HxmJTZdluKzZQQkEwOiCX/V46ROqal6trWQe0fR+abHNV+TOMj5edySxB8TW4duCnqOqclu3FUhe+U4dUvjVpqFE4FBECobAAwkQq0k6k6vCTTb76D9knEmiNpUNe7/m2St+emDoCzApTzje2GJV9AB7hrbS1B4c8sg40ugrmq0W6W3gI/6L67ypAy3s3ClEtvSaOFWITvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNT3h2nuWTQYRdk7iXyZyWHLiug9PKRhjHz+a0kcc5U=;
 b=WWAF0Cz5wlyMUpqB/z7gqGPjpXfhAkgSw6MCGsYmnTa5iWR4GL7LFeC9lWIMR9+YxPde3HUNxUR1bfewRRS/3+5W4znNg/9cSIVbnI4DI2g5GptLq5MiQj2gXIqx5WGJaPbi3lWnaGLe720qY0/iQ07N6o3aqvPDuA9R7W74W/VdXULryh557xXY0z2a2nWQElJyFJpoh3jRsT5iw/h5tQp/XVHi+QvZ25GbwFx5crRNXSlgmXIwntxCctmkTd0PpscjGd6l4vE8862RxCp9SyuREebYnQT/rT/6UZMEU6u/fXGMgwZ0VWeraxe3Gzs9DU2xh7WB4ma2O+GbAyJ0Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNT3h2nuWTQYRdk7iXyZyWHLiug9PKRhjHz+a0kcc5U=;
 b=qb+Ier+RvjSPdnrSSAlk4WuekKkbjkklsCO6zbUL0Ll8VrQYF2LQpAqgpO20qIp7GrcwylMnc8Ivmkxg7L27P90cWmUGDpjFukog/vZfvhYyzhOnMuczsAmJyByDUR7AKJ0gdxnxCSwj3GwNLmEhk64yRlkx7wau/ly2U5/kGRs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3223.eurprd08.prod.outlook.com (2603:10a6:209:4d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 16:27:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 16:27:02 +0000
Subject: Re: [PATCH v4 04/15] qemu-iotests: add option to attach gdbserver
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-5-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3d29d9e8-dd1c-a1c6-5253-027b546ee071@virtuozzo.com>
Date: Fri, 28 May 2021 19:26:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-5-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: PR0P264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 PR0P264CA0074.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 16:27:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 783cd07d-b44b-480d-8bf8-08d921f56c94
X-MS-TrafficTypeDiagnostic: AM6PR08MB3223:
X-Microsoft-Antispam-PRVS: <AM6PR08MB322344D987D6918163AC9AEAC1229@AM6PR08MB3223.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hnLbK7pbENqzKTr5mK3ibUMsuAr9691mByh565ieJ5sPaJqhPJ4PkluuEy1i0nJI+BWNAD4UI/uAJnJgAeoMOhMlQdFvGZdEDqfnZaW/L5eEzypfuQmNcnZErFeG56igO9mOraArEGLIcqAkDeeD2IS5/IySqYUo01EiHemLPntmqM89sDQhUPdD+v+0Rc0/MvSszMXTHhG6stP8/atwthTz8UCBHOnRTlwQ4MSGQlpS7byEdKi0TBwMgbesUBpcUkVdnXoByRC80FHwpkzQpC1sNLKVHaimkBZdP01K+SM71CsW1jK9VvZ6MYoAfDaofRiYYCbai1FmmAbiTIvcQeQbdaUdPiS7FJ9AAeuz2TG4biJITZTwhdHk887T2MRydnM24A20OW6o2VaFGB/qfKkumZjDPFZ5q0otMsK2KXO0O7Ftsaphu/3UlyXibrnaS87dU3n4gjC0nMR3wMvlSyQWHQ9sVMVOosvYIvEngpSuLEOF+a/REGtsEM7h84W4LIrBbXzJUP6BTIQI/RMStwsTzR36pgnPB5ytxoT+6dyHDWyi8/IdBtF/i/LB4rQHcBM5VCCm5rnzY/cDKd+lJdJTcu+rfdfr9oK+EefK04lDFQXRSYLtFSdaUN8UNKlboEMvj3YX5peCqlTGGvlL4EqvE5YcGqPChkkMKCc3eFNqsIyKuXN8NpV/9bjYYfky3W6XWwoTEwppT3wVEoO8lQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(376002)(366004)(346002)(136003)(16526019)(186003)(86362001)(38100700002)(2906002)(5660300002)(54906003)(2616005)(8936002)(36756003)(8676002)(956004)(16576012)(26005)(316002)(66476007)(4326008)(66556008)(31686004)(83380400001)(52116002)(66946007)(6486002)(38350700002)(478600001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b2plREtDVVpkZkFHN0V5cm9rcyszUnFGWFFteTlYNEJhTE8zVzdzNnJHdmhJ?=
 =?utf-8?B?U09MWS9la2tIQ1Bjc0VpUlBCcEJPbmdPcUFXZ2I5NXU5SjhySXhGYlFVVi9L?=
 =?utf-8?B?dUFIWmsyVS94ZnRRWWVLdmcveXpNQUtzWGYxNW95M1prSjZUR1VYMWFScUFr?=
 =?utf-8?B?K3R0Z21aeUJIcExhTUlWTGVXNU9mNUkrK1RFVGJpYUEvSW5lSStJT3ZiL3c4?=
 =?utf-8?B?djZ4aFRaRXNIMkw4M1lXcFRlMDlGOFZHaE5lSUZpaytRNmNlczIrdVRodlZw?=
 =?utf-8?B?OVlPdEJtbE52R25pV2tGRlFLRGhWczVkeTZLRkhWM0JLbkJpeEg5USs1Q3Zo?=
 =?utf-8?B?SlhRSVRMc09DdnE1aGpkYnY3eW8wQWZUR1Y1M1BhWXpRRU1jQWd2RWRpZS9r?=
 =?utf-8?B?a3BrNEF6RUpxMmVpbG1TSmRyQUNsQ3Q1TndkVjhaMmsvZmFHSUt5K25vNzlu?=
 =?utf-8?B?dkIraFgvZW9EdUJhbGhMaDZmQmVwVmJjQkRBNnp6bXRDZi9nMTNLaWFqMmdj?=
 =?utf-8?B?OVlDTVc0cHNWV25SQ1lzTy9EWkdweUsyVisrZlBrQ3dzT1g0TnlRaVJTeUJI?=
 =?utf-8?B?SjR6aEpxNkk4NEF2SHFiWCtsWEZQQldFay9wMjNoby9KenhUUEJOTDdvYkp3?=
 =?utf-8?B?d1VpMzdwbVRwbnJaRHZBT0h2Q2JoZ1lnN05kUXhETEtEU1dxR09oeFk5dnhk?=
 =?utf-8?B?RkY0NDRYeUxVRUJPY2hxTFpKb0JBNXF2L0RNcTMwN2M4MUluZ041enJvVnZX?=
 =?utf-8?B?OFJ3TENJL3RSVFNwY3ZTbkV5Y0xtcUhUNTVaZzg0REs5VHBiNkpRclA1ZUgy?=
 =?utf-8?B?YkR1ZDdJY0lLaGo5Z1FlR0xuRjkwZGlLNnhXVUM5c2RteEZSQVVCTStMK2N6?=
 =?utf-8?B?N3hyMEhRSG5GT0duOUFVaE1YT25kRTMrYWoxRVEvblFKNFE5blkyL3B4eGhu?=
 =?utf-8?B?M0tsZ2lUTzJwc0c2dlh4NlgrdjYyYVc0ME1yWHZ2SUxYU3Y1L2pCanJ2N1pt?=
 =?utf-8?B?dkNyNmRld1NoZlhibUFGZkVqWFJRTHlyL2hoRjJudUtLNnk5RTRMTVJ0N1hH?=
 =?utf-8?B?UXY4RUVUUTVETkN5TmNMcnZyZ0o5U0E3c0lLZkEvczdPTDF3VEJLMWM3c0M3?=
 =?utf-8?B?V2ZIYlZwNExDUE1STUJhOGhXSXc4QnZqMjZodTBSY0s5TkowK01TTmwwU3JB?=
 =?utf-8?B?a3lNV0kvWU42b05JRXFNTmhzZG8renk3WXkyVnlMRzFXZU80aGsrL3c0ZmVK?=
 =?utf-8?B?Tkgza1F5Y2J0bmJjdmlJTm9jeXVPY2ZZd3NKTzkza2tKUFJRTFVEN3FHcjI0?=
 =?utf-8?B?WW83RHVaNC9RZHY2TEYwUjNzRENiYXlwRnF4UGYreDFqZlpwT3lKU0YzTS83?=
 =?utf-8?B?SXRSMkdtb0tJYXlqRElKN2RFN3RwY1FvMFZwSWdzMi9sK3lQRFM3L05NWER6?=
 =?utf-8?B?NVUvaHRla2s3V2hXNk91NktYVWIydkdhZkhKbWVYR2cwdmxVMUpxWU0rNUJD?=
 =?utf-8?B?ZFhQdGlVbVc4RE5EMHJPUXFza1FSa1lpVzlNanJwQ3RVZi9jL0JWYUlRRncv?=
 =?utf-8?B?Yk9qL0pOeXNYUHd0Q20zMWdWSnFwRHd5aTMzaVdmamltb2pER2U3clFsR0dC?=
 =?utf-8?B?WUJBdFVXZjRWTUJJMy9wUXBVdFhDNDZ1eU8zT3VDZmZFZGRGUktia2hBeWlW?=
 =?utf-8?B?UEhFOXE2djAxSTFNd3ZKRGlrcVluak9MckJKbU03M0Y3eHpNMkdieDlFQ2s1?=
 =?utf-8?Q?MQyr7IaQZg6uznU0hhCMDfgm5Hog/K3+RMVsiI1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 783cd07d-b44b-480d-8bf8-08d921f56c94
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 16:27:02.6196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpEsxztdyYFMSQjzYSztNGVQ/Lpa5ze/6irwY30P/rxXDLJCh+L4xPuO4FenB1zzRHNO8R7Q9SMnTVWUkmcnLBnt+iogbjtoxBuGxXyK6YQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3223
Received-SPF: pass client-ip=40.107.20.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
> Define -gdb flag and GDB_OPTIONS environment variable
> to python tests to attach a gdbserver to each qemu instance.
> This patch only adds and parses this flag, it does not yet add
> the implementation for it.
> 
> if -gdb is not provided but $GDB_OPTIONS is set, ignore the
> environment variable.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/check      |  6 +++++-
>   tests/qemu-iotests/iotests.py |  5 +++++
>   tests/qemu-iotests/testenv.py | 19 ++++++++++++++++---
>   3 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index d1c87ceaf1..b9820fdaaf 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -33,6 +33,9 @@ def make_argparser() -> argparse.ArgumentParser:
>                      help='pretty print output for make check')
>   
>       p.add_argument('-d', dest='debug', action='store_true', help='debug')
> +    p.add_argument('-gdb', action='store_true',
> +                   help="start gdbserver with $GDB_OPTIONS options \
> +                        ('localhost:12345' if $GDB_OPTIONS is empty)")
>       p.add_argument('-misalign', action='store_true',
>                      help='misalign memory allocations')
>       p.add_argument('--color', choices=['on', 'off', 'auto'],
> @@ -112,7 +115,8 @@ if __name__ == '__main__':
>       env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
>                     aiomode=args.aiomode, cachemode=args.cachemode,
>                     imgopts=args.imgopts, misalign=args.misalign,
> -                  debug=args.debug, valgrind=args.valgrind)
> +                  debug=args.debug, valgrind=args.valgrind,
> +                  gdb=args.gdb)
>   
>       testfinder = TestFinder(test_dir=env.source_iotests)
>   
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 5d78de0f0b..d667fde6f8 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -75,6 +75,11 @@
>   qemu_prog = os.environ.get('QEMU_PROG', 'qemu')
>   qemu_opts = os.environ.get('QEMU_OPTIONS', '').strip().split(' ')
>   
> +gdb_qemu_env = os.environ.get('GDB_OPTIONS')
> +qemu_gdb = []
> +if gdb_qemu_env:
> +    qemu_gdb = ['gdbserver'] + gdb_qemu_env.strip().split(' ')
> +
>   imgfmt = os.environ.get('IMGFMT', 'raw')
>   imgproto = os.environ.get('IMGPROTO', 'file')
>   output_dir = os.environ.get('OUTPUT_DIR', '.')
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 6d27712617..49ddd586ef 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -27,6 +27,7 @@
>   import glob
>   from typing import Dict, Any, Optional, ContextManager
>   
> +DEF_GDB_OPTIONS = 'localhost:12345'
>   
>   def isxfile(path: str) -> bool:
>       return os.path.isfile(path) and os.access(path, os.X_OK)
> @@ -72,7 +73,8 @@ class TestEnv(ContextManager['TestEnv']):
>                        'QEMU_NBD_OPTIONS', 'IMGOPTS', 'IMGFMT', 'IMGPROTO',
>                        'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
>                        'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 'IMGOPTSSYNTAX',
> -                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_']
> +                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_',
> +                     'GDB_OPTIONS']
>   
>       def get_env(self) -> Dict[str, str]:
>           env = {}
> @@ -163,7 +165,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>                    imgopts: Optional[str] = None,
>                    misalign: bool = False,
>                    debug: bool = False,
> -                 valgrind: bool = False) -> None:
> +                 valgrind: bool = False,
> +                 gdb: bool = False) -> None:
>           self.imgfmt = imgfmt
>           self.imgproto = imgproto
>           self.aiomode = aiomode
> @@ -171,6 +174,14 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>           self.misalign = misalign
>           self.debug = debug
>   
> +        if gdb:
> +            self.gdb_options = os.environ.get('GDB_OPTIONS', DEF_GDB_OPTIONS)
> +            if not self.gdb_options:
> +                # cover the case 'export GDB_OPTIONS='
> +                self.gdb_options = DEF_GDB_OPTIONS
> +        elif 'GDB_OPTIONS' in os.environ:

please add a comment:

  # to not propagate it in prepare_subprocess()

> +            del os.environ['GDB_OPTIONS']
> +
>           if valgrind:
>               self.valgrind_qemu = 'y'
>   
> @@ -269,7 +280,9 @@ def print_env(self) -> None:
>   PLATFORM      -- {platform}
>   TEST_DIR      -- {TEST_DIR}
>   SOCK_DIR      -- {SOCK_DIR}
> -SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}"""
> +SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
> +GDB_OPTIONS   -- {GDB_OPTIONS}
> +"""
>   
>           args = collections.defaultdict(str, self.get_env())
>   
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

