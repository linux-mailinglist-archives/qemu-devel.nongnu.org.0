Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E3030187A
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 22:08:35 +0100 (CET)
Received: from localhost ([::1]:55990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3Q94-0002lm-Fq
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 16:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3Q5c-0000iI-JT; Sat, 23 Jan 2021 16:05:00 -0500
Received: from mail-eopbgr150139.outbound.protection.outlook.com
 ([40.107.15.139]:30663 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3Q5a-0001gI-4D; Sat, 23 Jan 2021 16:05:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kaw6DguAA2sjrrlShoPU1PAkp60EdCBfMxQnHeV0kL9ITd05kwc+I0yUH0ssZjmx9GIAmGK8y5hu0E3s7Epwzmoo7cPAm/aT9YEiC+q4bZbByJ7JM8GNuUFDJfcwn8BQw44rgP5zzPQpr/wX97bK1Pf8rVZbHlOfFW8J2DPp15c2OK7R+4+l6EddgjvM1Jp0v5faTYOGgBER3pvCRcTmbehCxZXlDA1Qs6KYyNi4d8PKigzCqtkjU2C/IyrIHR2G3GKiCPk321ABrzx4v0YNF/nTnFI4NHNxKuvV/fPHUS2Sz2IfA0d+9ek/XrVCbEJjtsFHJCAKB0yQaKAHG7Hmdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpkeDTjsfwNIZoU1gSXkziKZAw82/8MIp5IkoP5d49E=;
 b=GM4rswCkRaqX80a9WMO579IvKbasXOk3v3D9hFSSWToqYJNb2Cf/o7bl4gHh2ZtJ5A4Ng/+/ZI4Ah4E4IV3NtR/H4vaeX/UWxIpsyOipS/e7fBWLTxZ/e0zyOFrqcZPace+CkKmLgivySz8ihjdsPFPT+JjOAoFXbaJte8KXrLNFiUTqUjNjbx680jglyRnfAkbTfPdVzFOuESlN6P/109NTxqdEp1SGAzfKwN01rAL6h91Klhc4wS/22z5/+MUzkxMsmUpE4g4EAbeN5bcON5PGgmSbz5UWJTHxKfdwh3lcsdndlWluT+1PzWYQsgcxK6BzN/UJf8vkpJ45Rexb8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpkeDTjsfwNIZoU1gSXkziKZAw82/8MIp5IkoP5d49E=;
 b=pqPCOrMZGBD+y7CfDdkRHeps+cxaHMGLwo0MPVIbh2JT4QvbFiybFDNTYKeCqWU+189i/5NrfF2wO4tAV7991w2mcCrK5WbDJI9tRugu8Akj89pPdSNLvghKrmOCbBdLhjD318ojJwntwlSwhr4sdgO2WDo0uBSo3SV3628jXpg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6053.eurprd08.prod.outlook.com (2603:10a6:20b:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Sat, 23 Jan
 2021 21:04:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.015; Sat, 23 Jan 2021
 21:04:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 2/5] iotests: add testenv.py
Date: Sun, 24 Jan 2021 00:04:25 +0300
Message-Id: <20210123210428.27220-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210123210428.27220-1-vsementsov@virtuozzo.com>
References: <20210123210428.27220-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [178.176.79.161]
X-ClientProxiedBy: HE1PR05CA0196.eurprd05.prod.outlook.com
 (2603:10a6:3:f9::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (178.176.79.161) by
 HE1PR05CA0196.eurprd05.prod.outlook.com (2603:10a6:3:f9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Sat, 23 Jan 2021 21:04:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71aa19c0-00b3-4d51-f1bf-08d8bfe284c7
X-MS-TrafficTypeDiagnostic: AS8PR08MB6053:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6053F648A3C3BBEED9A34ABCC1BF0@AS8PR08MB6053.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FaXA4mVBCoM3QHqb2dxy+cownKRirmlEPC93oELFsLviUFg34XfJ16FOXNnn86h0c12Q5PpTVWCFGYF2/aI1sE4+CAwwpT8yBv/XHwKxcNt6sU07GWQ/7jGEfqzvjBNYUGn3htBgBTV0PBk4Yp3jhq33cmMut1N8ZKuNHwk/ufirqz7b1dUYauYJ17MjQOqF5c2gQVbALHhZdwel5vWA50qvwsKHRq6yR8rzoqOFzQLBtTCl9d/RlutqJnYJeWpikBLpA0Gyofnw2Y/lxQvl595K9RCn13Ionc1ZbWhElZPjaE1hGxch62ko1c2iNWLaFKcgEPjRJy3L5PFO6FXfwlVZef2BfmogcsuTtewC0iCUDr52Jjb24N8ihTbtrHORrbjMx3Kyk0vjq476yIb2k0+khXngskKOdSnwttNLmQGyLyZqLfokjR4zlWgaxuC1Xmex/2y+BS98W4pj2Ut9drg616UQjHhA1kD6190o/CptrjbraO/sY3T66/RgN0BhR1I6khe50NtoWSmVSpkc4SW2EVm6CevsmYUb1rLdmyAOqznWH5Ii/yNAqTwrxUWbYGeW7/VN2B21xJT9FHXLsEZESjj/7i8xx2caKUDe5dBlDrtAhX5RYBkgbfRmFBPO5Bo9moJKmemdliFNh8ZOzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(956004)(107886003)(6486002)(186003)(66946007)(66476007)(4326008)(52116002)(5660300002)(1076003)(8936002)(26005)(2906002)(6916009)(6512007)(6666004)(36756003)(8676002)(6506007)(2616005)(498600001)(66556008)(16526019)(86362001)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aGbl89VVf6vVz7Jomp5jJyQEzYeKgLDkVySmJH87YaCBOF3d9FzUtQSMHs0l?=
 =?us-ascii?Q?pNn8f0WL7CPHuFsFzcD84m+5lO44IMUIRcfzR+SaarqCUYwBFlHwcNlTSn/O?=
 =?us-ascii?Q?TaeRbXjMGKOlWrgdqlMhBaZutaX/gOj4llzBNZ4rluH3SIZ1DGWmDV/i3dAR?=
 =?us-ascii?Q?s8BC/Y6ELK0d4Rpm/jzhWjMvU/kCM47Hv96FfCkF2418Mw35g0TAGPm95mf5?=
 =?us-ascii?Q?3cV6SrYuKITNCo+p69QrY001goyBc8nAOaEQIIY4myZf4JKLeaEe5vDsMSAz?=
 =?us-ascii?Q?QUnyEX6SgV7Mt0VXu7YeqBaR/d5hqY3E2pytAFr3Q2DmU8nY8Gj++cauFD65?=
 =?us-ascii?Q?0qd3YS55orSVtDVxQa+5El4RqPQGd8AhXJF1vcfjrms0V1GLsWzlX4+OrekY?=
 =?us-ascii?Q?opSViVbrErwk5qoDjj0OinkNs9dxbWdbNkIWn8L1mduKu9CNa3xV62UTfA9P?=
 =?us-ascii?Q?7WxrVVEjGCjnWlFhW5pRgz3PxgCiify5rpNiZH8vurnF2mzGo7SyZ2upAnfJ?=
 =?us-ascii?Q?w8YwoNX3qoscofff5XU8XrH3lyjzZUejAj3XRe88hBmCyJ1LHgzi0HWH5B78?=
 =?us-ascii?Q?O0VziVD+uf7QfrufGrzf+BzN2X5wl/NONMPsapUv1SsmqXygok3/YXVAv5S2?=
 =?us-ascii?Q?JGr2ILq+/qGRcY4MMYSu4Q1tm2w+sO8GSGFAVNfIu2PyTlpS3MpcxHAnEd3T?=
 =?us-ascii?Q?7v7LdPphN4DEaCx5Via/aaNNMUmzbSa9+y+UbXQYttFulbkYe+SyXChIgML6?=
 =?us-ascii?Q?1W9OKIp/f5K6AvN2TS03x7rhxjBhs/T5i06jtid0Wsyhkj3+g532MXP+6YZf?=
 =?us-ascii?Q?wSZlz2DApiHXuqzFXZijzIqzJyo4+JvKI43gfkQGfqLQjWf08KsB+7IxtYP7?=
 =?us-ascii?Q?6GgLIafrGN18BBKd5qGMefXSTNXBo4LkIhSTz+GbG4l4UaLmtjUO6iHGN2QN?=
 =?us-ascii?Q?GNF+aFn/cxrWjjcAbtFVkJsgfq3hOBVMSV3CLHWf+mb0O9irOhVbyYTFatcd?=
 =?us-ascii?Q?dd9v?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71aa19c0-00b3-4d51-f1bf-08d8bfe284c7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2021 21:04:49.1134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzsnFa+biZIoT2p+bYSpaRaDAII/3FTYV8PkMlfpoaR+7BsitfPJWk/kKY/naEWShq24vMHWopmkPSflTZYMZl1h62ALogphUb9srdcDlTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6053
Received-SPF: pass client-ip=40.107.15.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add TestEnv class, which will handle test environment in a new python
iotests running framework.

Don't add compat=1.1 for qcow2 IMGOPTS, as v3 is default anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/testenv.py | 278 ++++++++++++++++++++++++++++++++++
 1 file changed, 278 insertions(+)
 create mode 100644 tests/qemu-iotests/testenv.py

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
new file mode 100644
index 0000000000..348af593e9
--- /dev/null
+++ b/tests/qemu-iotests/testenv.py
@@ -0,0 +1,278 @@
+# TestEnv class to manage test environment variables.
+#
+# Copyright (c) 2020-2021 Virtuozzo International GmbH
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
+import random
+import subprocess
+import glob
+from contextlib import AbstractContextManager
+from typing import Dict, Any, Optional
+
+
+def get_default_machine(qemu_prog: str) -> str:
+    outp = subprocess.run([qemu_prog, '-machine', 'help'], check=True,
+                          universal_newlines=True,
+                          stdout=subprocess.PIPE).stdout
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
+class TestEnv(AbstractContextManager['TestEnv']):
+    """
+    Manage system environment for running tests
+
+    The following variables are supported/provided. They are represented by
+    lower-cased TestEnv attributes.
+    """
+
+    # We store environment variables as instance attributes, and there are a
+    # lot of them. Silence pylint:
+    # pylint: disable=too-many-instance-attributes
+
+    env_variables = ['PYTHONPATH', 'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
+                     'OUTPUT_DIR', 'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
+                     'QEMU_IO_PROG', 'QEMU_NBD_PROG', 'QSD_PROG',
+                     'SOCKET_SCM_HELPER', 'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
+                     'QEMU_IO_OPTIONS', 'QEMU_IO_OPTIONS_NO_FMT',
+                     'QEMU_NBD_OPTIONS', 'IMGOPTS', 'IMGFMT', 'IMGPROTO',
+                     'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
+                     'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 'IMGOPTSSYNTAX',
+                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_']
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
+        self.python = sys.executable
+
+        def root(*names):
+            return os.path.join(self.build_root, *names)
+
+        arch = os.uname().machine
+        if 'ppc64' in arch:
+            arch = 'ppc64'
+
+        self.qemu_prog = os.getenv('QEMU_PROG', root(f'qemu-system-{arch}'))
+        if not os.path.exists(self.qemu_prog):
+            pattern = root('qemu-system-*')
+            progs = glob.glob(pattern)
+            if not progs:
+                sys.exit(f"Not found any Qemu binary by pattern '{pattern}'")
+            if len(progs) > 1:
+                progs_list = ', '.join(progs)
+                sys.exit(f"Several non '{arch}' qemu binaries found: "
+                         f"{progs_list}, please set QEMU_PROG environment "
+                         "variable")
+            self.qemu_prog = progs[0]
+
+        self.qemu_img_prog = os.getenv('QEMU_IMG_PROG', root('qemu-img'))
+        self.qemu_io_prog = os.getenv('QEMU_IO_PROG', root('qemu-io'))
+        self.qemu_nbd_prog = os.getenv('QEMU_NBD_PROG', root('qemu-nbd'))
+        self.qsd_prog = os.getenv('QSD_PROG', root('storage-daemon',
+                                                   'qemu-storage-daemon'))
+
+        for b in [self.qemu_img_prog, self.qemu_io_prog, self.qemu_nbd_prog,
+                  self.qemu_prog, self.qsd_prog]:
+            if not os.path.exists(b):
+                sys.exit('No such file: ' + b)
+            if not os.access(b, os.X_OK):
+                sys.exit('Not executable: ' + b)
+
+        helper_path = os.path.join(self.build_iotests, 'socket_scm_helper')
+        if os.access(helper_path, os.X_OK):
+            self.socket_scm_helper = helper_path  # SOCKET_SCM_HELPER
+
+    def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
+                 cachemode: Optional[str] = None,
+                 imgopts: Optional[str] = None,
+                 misalign: bool = False,
+                 debug: bool = False,
+                 valgrind: bool = False) -> None:
+        self.imgfmt = imgfmt
+        self.imgproto = imgproto
+        self.aiomode = aiomode
+        self.imgopts = imgopts
+        self.misalign = misalign
+        self.debug = debug
+
+        if valgrind:
+            self.valgrind_qemu = 'y'
+
+        if cachemode is None:
+            self.cachemode_is_default = 'true'
+            self.cachemode = 'writeback'
+        else:
+            self.cachemode_is_default = 'false'
+            self.cachemode = cachemode
+
+        # Initialize generic paths: build_root, build_iotests, source_iotests,
+        # which are needed to initialize some environment variables. They are
+        # used by init_*() functions as well.
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
+        self.init_directories()
+        self.init_binaries()
+
+        self.malloc_perturb_ = os.getenv('MALLOC_PERTURB_',
+                                         str(random.randrange(1, 255)))
+
+        # QEMU_OPTIONS
+        self.qemu_options = '-nodefaults -display none -accel qtest'
+        machine_map = (
+            ('arm', 'virt'),
+            ('aarch64', 'virt'),
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
+        if self.imgfmt == 'vmdk':
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
+    def __exit__(self, exc_type: Any, exc_value: Any, traceback: Any) -> None:
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
-- 
2.29.2


