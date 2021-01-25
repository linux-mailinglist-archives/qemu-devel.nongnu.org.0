Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3FC302AE8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:56:48 +0100 (CET)
Received: from localhost ([::1]:59762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l472d-0003fq-Fc
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l46xU-0007QP-Hw; Mon, 25 Jan 2021 13:51:28 -0500
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101]:34720 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l46xR-0005Oj-RZ; Mon, 25 Jan 2021 13:51:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wub/vODodEb2pzOouNVgp+wFl58WYqoj0oeSqoRr7o0rI4mhBhqib+rAT2eOQX9pDaTkHJA2LPXHksTgcBKE4IF2AxNddQGZ0xtY6b7TR3vkXcCQAq+pcOu/E1CKLunVGu6ao8QeQq1p1jC1vNhu7CN0oSLY8taHjpmsZCeazLrJIW06RY0Rd81C3QlZLcR3+kIAUj0sjenlGtjREql6ahBtBNg1u0bfEZyLuXG21f9oJVKBuoR5ESjjJ8BIE349VtyJgEaaVzYsjIWPHReGPblAVGqPN/I2OzCP7HFbjm7j0N941Oj8x9geUM9qrIvtCcvYdkzAwgmsm5zPuDXSgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtKODNFfzg+/Pxx/gy1g3x2BerZIwQ/QT2rGYvxskzw=;
 b=miQTUfnAVhPIVUt+G50uCxNc4EKf0M1zh2jd851UKzULLGevodGerOsafxAx95OGtHmEfOhY83pkNi3Ze31UZXo8pqtBmjuiw1MSMRn3Sr5xcCDvwbiKoTa6q6Bf6AuRVDNBWkds8opDdqy6kMQDsZmeiqgoPI0BfInoLORmlTDldqJagTIPUQY61W580AMNqR0XMAVFSICqSufaAqQsDJYDZxymiwjcU9tx8/EjTTMwriCz9hb79dlzayeUfCeg4oNWUc4JasFRgM4s6MDIV2smnVyjqbXYxBjUxP64GdCPN0c7zX1APC/c1Yrffq9KB89pANhZSs4l9qTjp5fJBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtKODNFfzg+/Pxx/gy1g3x2BerZIwQ/QT2rGYvxskzw=;
 b=Yvcs2nQHXkWrMymlI/KFd9dgXNEeTf3Tm/YwNHD1leFYu7FmL+k5X85XhbxhbtpcIhxROA2MX8X423aonOxhjRGikY/EkH2EkGEPIo+H+mHpanGVGQ+0WkrEdHMDuelM2gut1D5oU7ydRY+39N/hLyoQXyGdxbt7uga11Nm7tCU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4405.eurprd08.prod.outlook.com (2603:10a6:20b:b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Mon, 25 Jan
 2021 18:51:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 18:51:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v9 3/6] iotests: add testenv.py
Date: Mon, 25 Jan 2021 21:50:53 +0300
Message-Id: <20210125185056.129513-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125185056.129513-1-vsementsov@virtuozzo.com>
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.113]
X-ClientProxiedBy: AM0PR01CA0134.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.113) by
 AM0PR01CA0134.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Mon, 25 Jan 2021 18:51:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b84fae5-0597-4e97-8a70-08d8c1623272
X-MS-TrafficTypeDiagnostic: AM6PR08MB4405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4405FC1E05CCEFC94932CD24C1BD0@AM6PR08MB4405.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dURiPDdztlUMrXfK12cedMgEk3RNvyjBP07QUCPUzkRIjCJe5RaovAuPxDvPqFjYUq8yyWJgqy2AQ5ZqPuN1W08R4rSe9oGMr3MkdWP4Jsi4CxJm9BnB8YOQuASweXq4hxMCZFqIgEzwmOl4dTR0iwox3Awv+tD+06+inJvEJt3yw911JF/mAnhDveVMx8zsAJZupy1n8q1+ft2xf+PUlyaF8uIQt4wP6w7dN+ILYjXd52MFuGWz8Eo/HQrytrn5/SuV7Hi4jw6ZWdDIgX8OI4pBdQmb63cJ1zt/69E4EupLBl8LKhd+Z6KmJEIi9h6qozSp1IpAvA1dVfzTqadHg3/wJxFGdlAMOjd9Wu3gOJfF4o2y4yEm9zfUcT987kugXDyqCveVTMPDGwWDsyiCeQ8Wiz338hdlMvqeMJHXGqJd/fcchIksLgmMXkUDduJGiQ741wviwUYHNdbM99RThbV5gMITCcTeD5yRc86Y+8duSHvlZwklEXmOSu8WZPlvOohgftLsmo/Zw3nJ7cXyuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(366004)(396003)(376002)(346002)(478600001)(2906002)(8676002)(6512007)(83380400001)(6666004)(6506007)(86362001)(5660300002)(36756003)(26005)(186003)(2616005)(16526019)(107886003)(1076003)(66476007)(66946007)(6486002)(52116002)(66556008)(4326008)(956004)(8936002)(316002)(6916009)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QJZbtvHEr0yTmBCY+btxV0R3LKy6qokhJtMwzbJzfQ60l74y8/VzPcw8m0MA?=
 =?us-ascii?Q?3EHX6S8Mi6MjryRRpaqljo1McTbNSnPNAw+iD/i/AcwaIwu3dde4a0Hdcgb6?=
 =?us-ascii?Q?wMF+Q4t4mlcdGHas/CBPufcOAR8OaWIQAhZyYVLUETDCOjnn47WqywEXo7oz?=
 =?us-ascii?Q?Y99lF8C4zwSYry2xRFmOMAwQhsSpvxQhI7Gv5xpBAhMWjmNoM8wEMLvo+v7k?=
 =?us-ascii?Q?XSqtnvH50ia0p0yVud7zNDJYZ3rFiDCY26buNbqLyz5V338HqXkjLys/4a8Q?=
 =?us-ascii?Q?p0j6jzzQbUDM3wKHCI3uffjelrl2iWQGuh4aEAQDvFgfjzUtJdELEMOuPmKi?=
 =?us-ascii?Q?QOX6Jse7FKxTErYqbEOLEaG3kP1xpNjW8Gmo30qbEbgQjzrg4ntrSRT4k19Y?=
 =?us-ascii?Q?kETrrhTM7c1eD9JYPm+zq7fvV9hgGMvSuMJZMX8tfLz0AgNRCn1JhYAY/xzk?=
 =?us-ascii?Q?O0am6JOHkx1jUphNQvzppNMf8DSQDrLVPnrr7w4+shtekabkta1b9qnI9Oeo?=
 =?us-ascii?Q?/Rh2SBKupDGt0FKyMOuPRGYXrS2MZTonIHesVssx6su+asAR7KFEbPbqJMf1?=
 =?us-ascii?Q?TJBl32UrCjc+uF5nI7ZMQVIdF7kDcl6mZGj6s1Aaw8EJB47KMwwfE+tL7vuA?=
 =?us-ascii?Q?DBg1EeqNN24BsU8wYp6mYmshak8NF/xokZR26feKguftlYI1dPqwO5OP4+SM?=
 =?us-ascii?Q?yX2PtELuhSDU1kr116H6kr2Z07AlsbF7p/Nva36pXSq8LbcBAuPFGeSazNLi?=
 =?us-ascii?Q?DxnCTPwig8mglPtMqzS3NPp98Opm6SdnYfU3amRZwjBSmXor6o5ibIq1nD5N?=
 =?us-ascii?Q?sBNDp/VFb6zNvRJYhFcT0pg2iaLq2PZB6KafgrxpX0S5quTT83KI1t6DhvnY?=
 =?us-ascii?Q?QGV8F2a48GvC2Yqe2XDhvY3QwrAGI0Jtr7bg0p5VVkXVzlO1kNn3DesOnE9s?=
 =?us-ascii?Q?1t0XAOcSkseeJ9zVAEldOZw59stZjrrA0yqpG7KHf8teFxtMYU3dE1/l7kuf?=
 =?us-ascii?Q?UBG3BkVHWQuGW4RUWfKDewhYByvCmKZr0frxh/LNOhmsZy6UBRC1yHsLBNxj?=
 =?us-ascii?Q?5TjH1VEw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b84fae5-0597-4e97-8a70-08d8c1623272
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:51:17.1711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pg8FmAfa+yx7XyNTMLfnnTvY/bHyjSzMfoWsCPoBXePRZYQKZ+0JKsccS2lcJpr++P8JWb8MljXeU/OsSt6A6qepPBFeAXmu+cqVtwdXueM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4405
Received-SPF: pass client-ip=40.107.21.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add TestEnv class, which will handle test environment in a new python
iotests running framework.

Don't add compat=1.1 for qcow2 IMGOPTS, as v3 is default anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/testenv.py | 279 ++++++++++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)
 create mode 100644 tests/qemu-iotests/testenv.py

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
new file mode 100644
index 0000000000..ca9cab531b
--- /dev/null
+++ b/tests/qemu-iotests/testenv.py
@@ -0,0 +1,279 @@
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
+def isxfile(path: str) -> bool:
+    return os.path.isfile(path) and os.access(path, os.X_OK)
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
+            try:
+                progs = glob.iglob(pattern)
+                self.qemu_prog = next(p for p in progs if isxfile(p))
+            except StopIteration:
+                sys.exit("Not found any Qemu executable binary by pattern "
+                         f"'{pattern}'")
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
+            if not isxfile(b):
+                sys.exit('Not executable: ' + b)
+
+        helper_path = os.path.join(self.build_iotests, 'socket_scm_helper')
+        if isxfile(helper_path):
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


