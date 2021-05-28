Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64D03946B0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 19:53:24 +0200 (CEST)
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmgfj-0005bQ-9i
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 13:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmgem-0004sV-PS; Fri, 28 May 2021 13:52:24 -0400
Received: from mail-eopbgr00128.outbound.protection.outlook.com
 ([40.107.0.128]:51781 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmgek-0002HE-2Q; Fri, 28 May 2021 13:52:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOr735o0bCOie0Fj0dX8XIGXmgjr7AD1q0UidF0r+RSrfwCuh3vHHahsVfviaPWqrGLNsQKM/Zrtatm/ELSYSFgHkmd6pT/KEgxXmTnefwx9PQv/81v95toVUCPOuaQpdYGMLBaIHAWkpXdwYGX3LHAffNi/4fVRxw1fH1J2Hd3qCwSrb0t8CWbqzGH14uKT7RfgPZ024H1NBJ0eDSd36drVF8+Rd50ufhrPKMY+CmjcWWS63hST6Nt+03rNnhdoYx34YPJ9EUiaf1r44Ill5p9wVobi29/gJ0/s3bC4ozd7fW4eV2thvq8znUJ8GOt6abIcul8nF2DRKHj1MsDhqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33k2uWx5HDIfo41maYbDHLDzPgILkWXGlOK4Q5d488A=;
 b=fcFwPP4/2lslstM2Q3HVs62PU4rJKgbbh4whITgxNhBM1QTlxVr16Ic1Ag52GA+ifXnNzbp/SQlG9GlHYWQO6pifaifoeVIW9msqmv/ST78nnSog6v6d4s341GzX0EUERzLe6WgkokuuUFMmf5jyZq5x74dvZv8smbaZXSJ+kpVYGtkj6z5A532VK2/nVwzLAf9byH4kRBgfFvEA3G7n4IG+ELOzGHCKq95AbtC1akyecW+P8qQ2jKoNLULSjeAB8GSW1PCPxiFl42rVFKGIxMKTM39Q4I+BbkVyaHa+GiLAbiPRiJ5U6esY+vq9vS6Dym89YtPqIkRUyfO0tOUoUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33k2uWx5HDIfo41maYbDHLDzPgILkWXGlOK4Q5d488A=;
 b=JHMhL6hfXDSuDsIrDD9NiQxHuukt703imYAZqeujrwI4/5bP+k4Pgmav0dfXs0UW0wdoYMIk8O6+uSw9iffJs+Q4i8CqeyA2+BF3v7EhAtEUf1RdeeGyOvBSWWKLDb+29wCi3JMQeRyz9bvAHcCK4ciEbSgdLtTOKIMuI9rhavo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3383.eurprd08.prod.outlook.com (2603:10a6:20b:50::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Fri, 28 May
 2021 17:52:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 17:52:17 +0000
Subject: Re: [PATCH v4 14/15] qemu-iotests: add option to show qemu binary
 logs on stdout
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-15-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <21fd6fc2-0715-34dd-c070-696f5f106f87@virtuozzo.com>
Date: Fri, 28 May 2021 20:52:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-15-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: PR0P264CA0267.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 PR0P264CA0267.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 17:52:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61deff68-3d15-4ef9-730b-08d922015563
X-MS-TrafficTypeDiagnostic: AM6PR08MB3383:
X-Microsoft-Antispam-PRVS: <AM6PR08MB33831ACF450C13138FF00D80C1229@AM6PR08MB3383.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ppzR9Dn3fKo3vxvGb9vBIj2kaqtIU2I+BsezMjz1nopCr8iIU9R0QhrhhseAbt/1U4iM4DbHjVxh15spNMt32MdKaMAwxXJSObPVNPbWZwjl7j+JTRVv+VXjrKJDMFVLhdz2gXeiI/nm+XhgMgYLW661cIJ8lHcj+6yNZ63pD2vtv2BeSBx3L6xQpkcyTbuFFB+sFt59S3/i1dGYxvAH1ySqH/6oh7cbZ4A4xL/z9fE2D5glHB7110OQ9zrPXM6+iX7k42Wb1SmzwodRmGIQmCYitdRMosnulmVfCEs8bS8owD/gl0IhP7+CTZIDrTUrXAWsYQl9+2lsAoG4bUqgpnuXKwX523+l14nDWxZSaUKdvEYSVVQ/6FoVSjxF4VN00KQjrAQvslTesljbGOoszr9Pm2MfXqfDxksRCgcQ6pVkYqMfSXc56hgWN82op+cvpkostUppSyYQJVfi7AbcGrr/J6Pi55HwayAlKnat1g4c0qoa+ssTFfiDiH0mqAMIbuxSGm0ybn1fMWxpj18Uz219uddROO+C5V24L51gWC3zw9dBQhdEAmejJH+jYQmsYPpfDlqaCS5w5Hvlk1hy2eP5LtmiSFQNme8PY/+eymVXYCN5PeXoqtXnHlNF9N9kW2f0MZRy75VtL9L+qcXN2o7+1d2qT6A+4kRL04XugZsLQRKZhcLXMYiQjvvWNziIADHZXCkWWVX+UnlCQEornN5j1WdVkW9bvbwTd5LwBo0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(136003)(376002)(366004)(396003)(26005)(38350700002)(38100700002)(52116002)(8676002)(8936002)(86362001)(4326008)(66476007)(31696002)(66556008)(36756003)(66946007)(316002)(16576012)(2616005)(83380400001)(186003)(2906002)(16526019)(31686004)(478600001)(5660300002)(6486002)(956004)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N3N1MDNpdzc4NG8yRHZDbDNkbi9hTTFEQnVwcTVDZWhpdDVVYTN1d2JKdktk?=
 =?utf-8?B?U2pGSytNbzgzYW1jdjd5bUZ4TmwyTEU3R0ppcXByOWEwTFhzalJRZGpnZTVH?=
 =?utf-8?B?c1RYNmROSHh6c0NvOFFCRXZxUjB0dkIxUzVHcHJ0NXlWZjNuNk5aRmY2cnF0?=
 =?utf-8?B?MVQxdEdwaGxoWlNOZEloVkZldnJvQW5LREFhVlJVa1FGOVgvSVQreURaNzh3?=
 =?utf-8?B?aXd5emVqVUsvSEJqMTZmZmtTUzczdHVkZ3ZET0lZUEZTcU8rQmhrVmZXS0Zm?=
 =?utf-8?B?WUMyUnhCeE5kcFE4bFRxTUlxM1NjZ0NITldhdkJrSEwyZkkyeW1KTFlMR1dF?=
 =?utf-8?B?dHZMSHJXTE53bkVPdXlHeVByMFplSW5HUGZhSE5VSXd5dG13NnRBWERWU1lt?=
 =?utf-8?B?QnI0bjBwaHFxR3g4Qng0UXUwOVp2b2MzTkxoUm5FamNqd3BCYTZJVnd1YlRa?=
 =?utf-8?B?MzdIZ1llMTVpRmhacWtJb2pLTTVEc2x1Qm42emJIQ3pURkZuVEpIOXdTNXh1?=
 =?utf-8?B?L2cyNnVyaEFxM0crZkdxbkRFUlBPOTV4OGtEUGhXdjBDRmd0TUxNRVFFWGpy?=
 =?utf-8?B?WVNHTFg1WEtERkRoMTZnS04xWEZCVXk3R0FaNFdxT2VoV1o3ZGc1OURuYlE5?=
 =?utf-8?B?SmVLaVBHZkcrRWNxVEZRRHM1NTdMVWprc2pPQnVBSEIvSGM5MzVLNDh0SWhx?=
 =?utf-8?B?M2lSZjkzVVRMNmY1VWdCREtzSEVzSUd6N2lNLy9UT3ArQTNHK2c2SzltdnRu?=
 =?utf-8?B?SE5OalVMSHhIaWdkK0xtNkMvUUNaeDljZlZXdThmUXFKODc5b2ZrK3NkV0xT?=
 =?utf-8?B?UUpHQzIwOTd4aU9EdklabWVra2VGUCtITjQrcGxnT2c4Nk8rMHNFU3dhTzZD?=
 =?utf-8?B?L2VSUVlRMjM5cm1VRkRYZTRvVUY5OU9xWlh0UDQrQzVtcVRMSkJHdU5sYk8v?=
 =?utf-8?B?THFJamFIZE9DdUlsSnJDQTdHSm9nN1o1eTNtOEcvL1NYZm5MbW9XWHVIcE9j?=
 =?utf-8?B?RW5zN292aGJNYmN1bURvWHpmNDB3NW5xZFNLSGZNQktWS2R1SE92QUZpS0NS?=
 =?utf-8?B?SnF2RC9OdUhUWTBFYjZmcEFLWGNaM0huUHBicmdXYnlIeHVHdldkSXNUL2Fs?=
 =?utf-8?B?QXVoNUwwd0s4bmtmVXUrVXpFODlnc0h5dVJqb1Qrcmw1ZzJnd0s5a0NMNmZM?=
 =?utf-8?B?Z2w2ajl2V1MzYWxidCtQVE80UEFuZ2c3eGRrZXd1ak1NSFRLbjVVYVRjaTFP?=
 =?utf-8?B?Y0JOSHh2ODBDeXlWZUEzaXF6UkJhUkswdEIxVXBQa29PckJpdm5IOTczR215?=
 =?utf-8?B?Rjh3WWVuT1d1ME43dzA1OVIzMHVOMXhvaHI2ZHBmcjhWSS9YOUl3dE5SNmUz?=
 =?utf-8?B?L2hJQlVHN2VoVlYyRXhDcysrR1ltSDhUUG1NNTBVdjFmUzN6NFh4YmhHamgv?=
 =?utf-8?B?ajNvdms2d3diU3ZTeG40NmkrbE1PaTFDRDFZalNZbWdWWHVBUTJhSTdLL1lJ?=
 =?utf-8?B?TVV2TmpzVktiQWpRTzU4TUs5ak5Cc0NpaTB0S3EwaWFEM1BPRC91UFpPd1Bq?=
 =?utf-8?B?cXVRUEUwTFZDaGV2UkxQZmxtaVdZTEZxWFd4SGRpRldnOXoxQVNITmJORlZF?=
 =?utf-8?B?REpYbDgyRm5OeHJzOGkrV1hHeWp2TktqTmlyTTJFd2RGMnR6Rm1NYlo3a3oz?=
 =?utf-8?B?TU50RUhCVVBrS2lpS0x0NDNmcUdoVms1RkVNcER0TTZ4NTEyUG1HNURaR2w0?=
 =?utf-8?Q?zlJ0FAsnBTH4KBN8vQ+QiyhkNQQidt2sAXL7KhO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61deff68-3d15-4ef9-730b-08d922015563
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 17:52:17.4161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mb8jWM0MtWcu8CKPcs2LVqn9GqYn4SJHlI6gY2ll/zfqOn9x/hoDJMU+l4xE9VoMDWXTVAS8j6/2nfBsrSOj936Ce8aCEsFTJf7CV59xok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3383
Received-SPF: pass client-ip=40.107.0.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
> Using the flag -p, allow the qemu binary to print to stdout.
> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/check      | 4 +++-
>   tests/qemu-iotests/iotests.py | 9 +++++++++
>   tests/qemu-iotests/testenv.py | 9 +++++++--
>   3 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index 2101cedfe3..51b90681ab 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -33,6 +33,8 @@ def make_argparser() -> argparse.ArgumentParser:
>                      help='pretty print output for make check')
>   
>       p.add_argument('-d', dest='debug', action='store_true', help='debug')
> +    p.add_argument('-p', dest='print', action='store_true',
> +                help='redirects qemu\'s stdout and stderr to the test output')
>       p.add_argument('-gdb', action='store_true',
>                      help="start gdbserver with $GDB_OPTIONS options \
>                           ('localhost:12345' if $GDB_OPTIONS is empty)")
> @@ -117,7 +119,7 @@ if __name__ == '__main__':
>                     aiomode=args.aiomode, cachemode=args.cachemode,
>                     imgopts=args.imgopts, misalign=args.misalign,
>                     debug=args.debug, valgrind=args.valgrind,
> -                  gdb=args.gdb)
> +                  gdb=args.gdb, qprint=args.print)
>   
>       testfinder = TestFinder(test_dir=env.source_iotests)
>   
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 75f1e1711c..53a3916a91 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -80,6 +80,8 @@
>   if gdb_qemu_env:
>       qemu_gdb = ['gdbserver'] + gdb_qemu_env.strip().split(' ')
>   
> +qemu_print = os.environ.get('PRINT_QEMU', False)
> +
>   imgfmt = os.environ.get('IMGFMT', 'raw')
>   imgproto = os.environ.get('IMGPROTO', 'file')
>   output_dir = os.environ.get('OUTPUT_DIR', '.')
> @@ -614,6 +616,13 @@ def _post_shutdown(self) -> None:
>           super()._post_shutdown()
>           self.subprocess_check_valgrind(qemu_valgrind)
>   
> +    def _pre_launch(self) -> None:
> +        super()._pre_launch()
> +        if qemu_print and self._qemu_log_file is not None:
> +            # set QEMU binary output to stdout
> +            self._qemu_log_file.close()
> +            self._qemu_log_file = None
> +

So, many use of _private members actually show that proper way of doing this is adding an option to __init__ instead

Interesting will pylint complain on using _private members outside of the home class?

>       def add_object(self, opts):
>           self._args.append('-object')
>           self._args.append(opts)
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 319d29cb0c..b79ce22fe9 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -74,7 +74,7 @@ class TestEnv(ContextManager['TestEnv']):
>                        'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
>                        'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 'IMGOPTSSYNTAX',
>                        'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_',
> -                     'GDB_OPTIONS']
> +                     'GDB_OPTIONS', 'PRINT_QEMU']
>   
>       def get_env(self) -> Dict[str, str]:
>           env = {}
> @@ -166,7 +166,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>                    misalign: bool = False,
>                    debug: bool = False,
>                    valgrind: bool = False,
> -                 gdb: bool = False) -> None:
> +                 gdb: bool = False,
> +                 qprint: bool = False) -> None:
>           self.imgfmt = imgfmt
>           self.imgproto = imgproto
>           self.aiomode = aiomode
> @@ -174,6 +175,9 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>           self.misalign = misalign
>           self.debug = debug
>   
> +        if qprint:
> +            self.print_qemu = 'y'
> +
>           if gdb:
>               self.gdb_options = os.environ.get('GDB_OPTIONS', DEF_GDB_OPTIONS)
>               if not self.gdb_options:
> @@ -283,6 +287,7 @@ def print_env(self) -> None:
>   SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
>   GDB_OPTIONS   -- {GDB_OPTIONS}
>   VALGRIND_QEMU -- {VALGRIND_QEMU}
> +PRINT_QEMU_OUTPUT -- {PRINT_QEMU}
>   """
>   
>           args = collections.defaultdict(str, self.get_env())
> 

5 places we need to modify to add a new option. That's not very good :( (not about your patch).

And I still doubt, that we want to add any new variable to print_env. If we do, than it's simpler to print all variables here, than, one place less to modify by hand.


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

