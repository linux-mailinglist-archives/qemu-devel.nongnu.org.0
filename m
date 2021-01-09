Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30532EFF82
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:40:00 +0100 (CET)
Received: from localhost ([::1]:48762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDXE-0004G9-08
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDLB-0008KG-Cs; Sat, 09 Jan 2021 07:27:33 -0500
Received: from mail-am6eur05on2131.outbound.protection.outlook.com
 ([40.107.22.131]:49601 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDL8-00065E-M5; Sat, 09 Jan 2021 07:27:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYSTjD11Q7RQJ9PwciX4bkmYxq4QeTUp87oBd6flgIuFfI+hLHGlSDvlovHu9mmiwxavhXy9F0ZgYuijtXIdbpJexfO+UCMIrQ+w6cDSlZH9SZw90xOu47CLFJ7y/5UNSi3TEScELvyNhTBZI2EjEXaD5JvcqIS6HosJz0Y7kdEtXb3s3UTkrvZv9QDMkFuDVnpU86VFMBtTwQMh1uuRphYxVvv9fHTQEz6lhzONYvlP3XvQ4Gcgb5e6o2YQM/Mpzd5dNOJ9V0pSocntkiLiqtGD6aX7jOk3Kah7imyNVTIKOBcKiPBUZCOU41KaDbOB1dtDL8AyOHi4dB53Ly++Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6XVmzFNdKlaC7nOBvoRXEj0PQdX4QMGeo6ANBMpp/M=;
 b=FirHR4Gk5hmh3RwoK3uHLIEOqD8bLiZvYQii3ZtnAqEL4e3lUnp8jISgGtIrq9nhVeyW6bYVZnbiC1g1nfTcQjavMPHM2EOYHTFqUqbV0xt1N27F6I1pLjyT5rWmEIXmMcjyqHC26Y9N+eXV5Oz8qQrpDVdnsqUpi0Nfg790cI+lUQhHz+0LoEtZMts73gXHOxZ8B6SxJAXAbZ5arx9a/t9FtqLD9Sb1YGq73dZ93cbDPJQtohfFNXllnDKSKdiHJBrtjNfLRsSDrECaoeubBeJd7nDXi42FhsmKeVmiCIVOWhPdH1n/uYXXefKIkUFiv0A3oPM5OiMn/CoZWoY33g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6XVmzFNdKlaC7nOBvoRXEj0PQdX4QMGeo6ANBMpp/M=;
 b=KsqBWLtaxFR0SFEyRmOeezhsdpkHS0ZjsYaiIkCFWftolubXSEhnhmdgxwGIJqklFql6mc5epOJeVST30ofo+76fQaB+HYLDlq10ZLZrfWUn7cRc8ZSwpHMBFXDfFMvS+yK7BqDFHU52GxKd+9mt/q3B7TUvsnWzQT0yGiWhWeM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2529.eurprd08.prod.outlook.com (2603:10a6:203:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Sat, 9 Jan
 2021 12:27:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:27:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 08/11] iotests: add testenv.py
Date: Sat,  9 Jan 2021 15:26:28 +0300
Message-Id: <20210109122631.167314-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109122631.167314-1-vsementsov@virtuozzo.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR02CA0217.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR02CA0217.eurprd02.prod.outlook.com (2603:10a6:20b:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sat, 9 Jan 2021 12:27:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31205f5e-0743-4b1f-3829-08d8b499e2d0
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2529:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2529DB533289BC68046E51BDC1AD0@AM5PR0802MB2529.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vp+vaKYaGmGXWqb4hqI0wmssQqwxhex2RD8umr/fGv7YYQBWKLRpkL8l4wVu66NWw8pKCjrvv7WBpThrfkv/foWwMbcGo4L0+L1FojZqDUSUhTAf6f7FGxz8oQdMYbG2PIba6JWzV+6KOzmg/M+wJjw6DR1gAiqChXr4zZJDJtC2YmTqBifVwSZ5fWWjDrf0/Q5jKoVQYCn9I5VfVIgNZDB54hQGghFynugpVsxn7qPZGnclz8wFHGGbQZZAufzhVBN+lUn5IgnSfYx1FTf4tfa4NASJsKGw5JIIUp2l34WNTq0eKz0bf5MWQmXxatcJAHX2hqGohoXssY+/iOSx9aKfkgiqALBK8sGuS1KQ1ulmmLfdbSgqfT8Ozff0HcKNa18BRP5zRzvKAEQJPOAUvjCwVb81gb0QoANo8PRWzb5miVAVvTY3PesXgnEqwAEBFtzgevfnkOcUcS8cIophUNNXsgIuBqFuneOJe5iMY/UVu8Mdyn5nVw9/9474tscuUSmElNhQGKGL6A0fvPmScQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(366004)(396003)(376002)(8936002)(6666004)(1076003)(6506007)(52116002)(478600001)(30864003)(2906002)(8676002)(16526019)(5660300002)(186003)(26005)(36756003)(66556008)(66476007)(6916009)(66946007)(2616005)(6486002)(6512007)(4326008)(83380400001)(86362001)(956004)(316002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mgwoS57t3cQ9ZwzR7LPPnZjco9IsdPzTWXrlfcsyWiMZIwEcmRyvrNAV8IHr?=
 =?us-ascii?Q?29OCGAO+ih3Evp/zPnB+ufuHWOBmtDlXhhPwBhC4piECRiIDqFOm4IQrAxrz?=
 =?us-ascii?Q?cTYFuSO26z9uxzQalWVYRmntnw20AVC6uyXwnOtLk3Mfzzl2H68RJA6Iaoay?=
 =?us-ascii?Q?2LQuU6GdmMyVP9VxoP5DHwWvPSyDIlY9vV0RZqGvfAP8DmO4F4WpXDqSM82+?=
 =?us-ascii?Q?kPALgDJA1YfmADXyFSjX6kK4BOgTBOXW5nIBiAL6wtzBFMbkzjeYN2ynY2a5?=
 =?us-ascii?Q?aVw+GrYst1BQd7oZGJi/DXUvqoTBpgdviFM3TVNKwv7ICxJLr6xskR8/6RsL?=
 =?us-ascii?Q?xY9nKkfiKNiF9aoXQxtD1joFZ7rhuqjzhqILK3O4GDb1lS9A95zIXD5pQsf/?=
 =?us-ascii?Q?hke9TL0kksTEDo1mvcDtA9He+Y0dueo5vHUSOgyR/XThtCb6xvM3bsli51Fk?=
 =?us-ascii?Q?7QYeMEk3V6aDK1hNju6JTSGf0fGMBnmGw69NYIuVBVoWOXsfrfTWj57oYlzb?=
 =?us-ascii?Q?lxGVaw4kfFibQ/HU4Y8OjUueon0LGv4nglNcBE5SbZhaeYcVXa5+rYwasmOy?=
 =?us-ascii?Q?emkmEjwvRECb1RBqVWY0TUCKjyHGXDWUzSHT1znnd9ffJa9oA5guxq2PkyAA?=
 =?us-ascii?Q?XKAgLypMr4SsydAJh+AlQER38glBo9xOUjnVAqp8xx0TN5abVROa8Jobl57O?=
 =?us-ascii?Q?HUF+31a1X5UYdfs40tMprPrGmob0iD4aNjDoa0yexMZqZb/w7v4KLP0MYQqd?=
 =?us-ascii?Q?zDWRp2sGDQaMhYR1Y7+HZ6234dYahZUCJ+6Z4CPqQhBNazPPmVNvXmnjDpBD?=
 =?us-ascii?Q?lFxN/3ooMj2qyGOUeeNZ6n5WHIGoK7IZDbe6eweMnG8hCK8WvRELu76vlc3F?=
 =?us-ascii?Q?61fn8sWeoV0gaLN/ooKJ4tZar000qWo1nVzxO8o0Wv/rem6Q7Ld9i9HYIo6P?=
 =?us-ascii?Q?1ZYw5O2sbgjkqMSOgL1WOy35KFZmoug01CTNLshJNQ6ODoBXo4M8Z9IAfPBv?=
 =?us-ascii?Q?VzoJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:27:10.0729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 31205f5e-0743-4b1f-3829-08d8b499e2d0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJkfGW0KMSZ20TcuhHKZBZBvBlEaNC2q7N00PcmbQ5aI6UO6QgUYcGuHxgZRJGbZ81rkt11V7ntvGoh50ub2GgiZ0nM4UMbYaFG+Cy0Y5tQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2529
Received-SPF: pass client-ip=40.107.22.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add TestEnv class, which will handle test environment in a new python
iotests running framework.

Difference with current ./check interface:
- -v (verbose) option dropped, as it is unused

- -xdiff option is dropped, until somebody complains that it is needed
- same for -n option

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/testenv.py | 328 ++++++++++++++++++++++++++++++++++
 1 file changed, 328 insertions(+)
 create mode 100755 tests/qemu-iotests/testenv.py

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
new file mode 100755
index 0000000000..ecaf76fb85
--- /dev/null
+++ b/tests/qemu-iotests/testenv.py
@@ -0,0 +1,328 @@
+#!/usr/bin/env python3
+#
+# Parse command line options to manage test environment variables.
+#
+# Copyright (c) 2020 Virtuozzo International GmbH
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import os
+import sys
+import tempfile
+from pathlib import Path
+import shutil
+import collections
+import subprocess
+import argparse
+from typing import List, Dict
+
+
+def get_default_machine(qemu_prog: str) -> str:
+    outp = subprocess.run([qemu_prog, '-machine', 'help'], check=True,
+                          text=True, stdout=subprocess.PIPE).stdout
+
+    machines = outp.split('\n')
+    default_machine = next(m for m in machines if m.endswith(' (default)'))
+    default_machine = default_machine.split(' ', 1)[0]
+
+    alias_suf = ' (alias of {})'.format(default_machine)
+    alias = next((m for m in machines if m.endswith(alias_suf)), None)
+    if alias is not None:
+        default_machine = alias.split(' ', 1)[0]
+
+    return default_machine
+
+
+class TestEnv:
+    """
+    Manage system environment for running tests
+
+    The following variables are supported/provided. They are represented by
+    lower-cased TestEnv attributes.
+    """
+    env_variables = ['PYTHONPATH', 'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
+                     'OUTPUT_DIR', 'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
+                     'QEMU_IO_PROG', 'QEMU_NBD_PROG', 'QSD_PROG',
+                     'SOCKET_SCM_HELPER', 'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
+                     'QEMU_IO_OPTIONS', 'QEMU_NBD_OPTIONS', 'IMGOPTS',
+                     'IMGFMT', 'IMGPROTO', 'AIOMODE', 'CACHEMODE',
+                     'VALGRIND_QEMU', 'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC',
+                     'IMGOPTSSYNTAX', 'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE']
+
+    def get_env(self) -> Dict[str, str]:
+        env = {}
+        for v in self.env_variables:
+            val = getattr(self, v.lower(), None)
+            if val is not None:
+                env[v] = val
+
+        return env
+
+    _argparser = None
+    @classmethod
+    def get_argparser(cls) -> argparse.ArgumentParser:
+        if cls._argparser is not None:
+            return cls._argparser
+
+        p = argparse.ArgumentParser(description="= test environment options =",
+                                    add_help=False, usage=argparse.SUPPRESS)
+
+        p.add_argument('-d', dest='debug', action='store_true', help='debug')
+        p.add_argument('-misalign', action='store_true',
+                       help='misalign memory allocations')
+
+        p.set_defaults(imgfmt='raw', imgproto='file')
+
+        format_list = ['raw', 'bochs', 'cloop', 'parallels', 'qcow', 'qcow2',
+                       'qed', 'vdi', 'vpc', 'vhdx', 'vmdk', 'luks', 'dmg']
+        g = p.add_argument_group(
+            'image format options',
+            'The following options sets IMGFMT environment variable. '
+            'At most one chose is allowed, default is "raw"')
+        g = g.add_mutually_exclusive_group()
+        for fmt in format_list:
+            g.add_argument('-' + fmt, dest='imgfmt', action='store_const',
+                           const=fmt)
+
+        protocol_list = ['file', 'rbd', 'sheepdoc', 'nbd', 'ssh', 'nfs',
+                         'fuse']
+        g = p.add_argument_group(
+            'image protocol options',
+            'The following options sets IMGPROTO environment variably. '
+            'At most one chose is allowed, default is "file"')
+        g = g.add_mutually_exclusive_group()
+        for prt in protocol_list:
+            g.add_argument('-' + prt, dest='imgproto', action='store_const',
+                           const=prt)
+
+        g = p.add_mutually_exclusive_group()
+        # We don't set default for cachemode, as we need to distinguish dafult
+        # from user input later.
+        g.add_argument('-nocache', dest='cachemode', action='store_const',
+                       const='none', help='set cache mode "none" (O_DIRECT), '
+                       'sets CACHEMODE environment variable')
+        g.add_argument('-c', dest='cachemode',
+                       help='sets CACHEMODE environment variable')
+
+        p.add_argument('-i', dest='aiomode', default='threads',
+                       help='sets AIOMODE environment variable')
+
+        g = p.add_argument_group('bash tests options',
+                                 'The following options are ignored by '
+                                 'python tests. TODO: support them in '
+                                 'iotests.py')
+        g.add_argument('-o', dest='imgopts',
+                       help='options to pass to qemu-img create/convert, sets '
+                       'IMGOPTS environment variable')
+        p.add_argument('-valgrind', dest='VALGRIND_QEMU', action='store_const',
+                       const='y', help='use valgrind, sets VALGRIND_QEMU '
+                       'environment variable')
+
+        cls._argparser = p
+        return p
+
+    def init_handle_argv(self, argv: List[str]) -> None:
+
+        # Hints for mypy, about arguments which will be set by argparse
+        args, self.remaining_argv = self.get_argparser().parse_known_args(argv)
+        self.imgfmt = args.imgfmt
+        self.imgproto = args.imgproto
+        self.aiomode = args.aiomode
+        self.imgopts = args.imgopts
+        self.misalign = args.misalign
+        self.debug = args.debug
+
+        if args.cachemode is None:
+            self.cachemode_is_default = 'true'
+            self.cachemode = 'writeback'
+        else:
+            self.cachemode_is_default = 'false'
+            self.cachemode = args.cachemode
+
+    def init_directories(self):
+        """Init directory variables:
+             PYTHONPATH
+             TEST_DIR
+             SOCK_DIR
+             SAMPLE_IMG_DIR
+             OUTPUT_DIR
+        """
+        self.pythonpath = os.getenv('PYTHONPATH')
+        if self.pythonpath:
+            self.pythonpath = self.source_iotests + os.pathsep + \
+                self.pythonpath
+        else:
+            self.pythonpath = self.source_iotests
+
+        self.test_dir = os.getenv('TEST_DIR',
+                                  os.path.join(os.getcwd(), 'scratch'))
+        Path(self.test_dir).mkdir(parents=True, exist_ok=True)
+
+        self.sock_dir = os.getenv('SOCK_DIR')
+        self.tmp_sock_dir = False
+        if self.sock_dir:
+            Path(self.test_dir).mkdir(parents=True, exist_ok=True)
+        else:
+            self.sock_dir = tempfile.mkdtemp()
+            self.tmp_sock_dir = True
+
+        self.sample_img_dir = os.getenv('SAMPLE_IMG_DIR',
+                                        os.path.join(self.source_iotests,
+                                                     'sample_images'))
+
+        self.output_dir = os.getcwd()  # OUTPUT_DIR
+
+    def init_binaries(self):
+        """Init binary path variables:
+             PYTHON (for bash tests)
+             QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
+             SOCKET_SCM_HELPER
+        """
+        self.python = '/usr/bin/python3 -B'
+
+        def root(*names):
+            return os.path.join(self.build_root, *names)
+
+        arch = os.uname().machine
+        if 'ppc64' in arch:
+            arch = 'ppc64'
+
+        self.qemu_prog = os.getenv('QEMU_PROG', root(f'qemu-system-{arch}'))
+        self.qemu_img_prog = os.getenv('QEMU_IMG_PROG', root('qemu-img'))
+        self.qemu_io_prog = os.getenv('QEMU_IO_PROG', root('qemu-io'))
+        self.qemu_nbd_prog = os.getenv('QEMU_NBD_PROG', root('qemu-nbd'))
+        self.qsd_prog = os.getenv('QSD_PROG', root('storage-daemon',
+                                                   'qemu-storage-daemon'))
+
+        for b in [self.qemu_img_prog, self.qemu_io_prog, self.qemu_nbd_prog,
+                  self.qemu_prog, self.qsd_prog]:
+            if not os.path.exists(b):
+                exit('Not such file: ' + b)
+            if not os.access(b, os.X_OK):
+                exit('Not executable: ' + b)
+
+        helper_path = os.path.join(self.build_iotests, 'socket_scm_helper')
+        if os.access(helper_path, os.X_OK):
+            self.socket_scm_helper = helper_path  # SOCKET_SCM_HELPER
+
+    def __init__(self, argv: List[str]) -> None:
+        """Parse args and environment"""
+
+        # Initialize generic paths: build_root, build_iotests, source_iotests,
+        # which are needed to initialize some environment variables. They are
+        # used by init_*() functions as well.
+
+
+        if os.path.islink(sys.argv[0]):
+            # called from the build tree
+            self.source_iotests = os.path.dirname(os.readlink(sys.argv[0]))
+            self.build_iotests = os.path.dirname(os.path.abspath(sys.argv[0]))
+        else:
+            # called from the source tree
+            self.source_iotests = os.getcwd()
+            self.build_iotests = self.source_iotests
+
+        self.build_root = os.path.join(self.build_iotests, '..', '..')
+
+        self.init_handle_argv(argv)
+        self.init_directories()
+        self.init_binaries()
+
+        # QEMU_OPTIONS
+        self.qemu_options = '-nodefaults -display none -accel qtest'
+        machine_map = (
+            (('arm', 'aarch64'), 'virt'),
+            ('avr', 'mega2560'),
+            ('rx', 'gdbsim-r5f562n8'),
+            ('tricore', 'tricore_testboard')
+        )
+        for suffix, machine in machine_map:
+            if self.qemu_prog.endswith(f'qemu-system-{suffix}'):
+                self.qemu_options += f' -machine {machine}'
+
+        # QEMU_DEFAULT_MACHINE
+        self.qemu_default_machine = get_default_machine(self.qemu_prog)
+
+        self.qemu_img_options = os.getenv('QEMU_IMG_OPTIONS')
+        self.qemu_nbd_options = os.getenv('QEMU_NBD_OPTIONS')
+
+        is_generic = self.imgfmt not in ['bochs', 'cloop', 'dmg']
+        self.imgfmt_generic = 'true' if is_generic else 'false'
+
+        self.qemu_io_options = f'--cache {self.cachemode} --aio {self.aiomode}'
+        if self.misalign:
+            self.qemu_io_options += ' --misalign'
+
+        self.qemu_io_options_no_fmt = self.qemu_io_options
+
+        if self.imgfmt == 'luks':
+            self.imgoptssyntax = 'true'
+            self.imgkeysecret = '123456'
+            if not self.imgopts:
+                self.imgopts = 'iter-time=10'
+            elif 'iter-time=' not in self.imgopts:
+                self.imgopts += ',iter-time=10'
+        else:
+            self.imgoptssyntax = 'false'
+            self.qemu_io_options += ' -f ' + self.imgfmt
+
+        if self.imgfmt == 'vmkd':
+            if not self.imgopts:
+                self.imgopts = 'zeroed_grain=on'
+            elif 'zeroed_grain=' not in self.imgopts:
+                self.imgopts += ',zeroed_grain=on'
+
+    def close(self) -> None:
+        if self.tmp_sock_dir:
+            shutil.rmtree(self.sock_dir)
+
+    def __enter__(self) -> 'TestEnv':
+        return self
+
+    def __exit__(self, *args) -> None:
+        self.close()
+
+    def print_env(self) -> None:
+        template = """\
+QEMU          -- "{QEMU_PROG}" {QEMU_OPTIONS}
+QEMU_IMG      -- "{QEMU_IMG_PROG}" {QEMU_IMG_OPTIONS}
+QEMU_IO       -- "{QEMU_IO_PROG}" {QEMU_IO_OPTIONS}
+QEMU_NBD      -- "{QEMU_NBD_PROG}" {QEMU_NBD_OPTIONS}
+IMGFMT        -- {IMGFMT}{imgopts}
+IMGPROTO      -- {IMGPROTO}
+PLATFORM      -- {platform}
+TEST_DIR      -- {TEST_DIR}
+SOCK_DIR      -- {SOCK_DIR}
+SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}"""
+
+        args = collections.defaultdict(str, self.get_env())
+
+        if 'IMGOPTS' in args:
+            args['imgopts'] = f" ({args['IMGOPTS']})"
+
+        u = os.uname()
+        args['platform'] = f'{u.sysname}/{u.machine} {u.nodename} {u.release}'
+
+        print(template.format_map(args))
+
+
+if __name__ == '__main__':
+    if len(sys.argv) == 2 and sys.argv[1] in ['-h', '--help']:
+        TestEnv.get_argparser().print_help()
+        exit()
+
+    with TestEnv(sys.argv) as te:
+        te.print_env()
+        print('\nUnhandled options: ', te.remaining_argv)
-- 
2.29.2


