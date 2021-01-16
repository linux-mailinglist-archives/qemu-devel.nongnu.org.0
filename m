Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F322F8D79
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 14:51:40 +0100 (CET)
Received: from localhost ([::1]:46418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0lzP-00013x-9n
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 08:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0ltH-0003OX-68; Sat, 16 Jan 2021 08:45:19 -0500
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:62560 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0ltE-0007XP-Iz; Sat, 16 Jan 2021 08:45:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k27/CqK2X7ulQ/Iy/rxuMbeDGuKDZn67PY6uCKsY73xqFIpwA4B2jGWC/2BMfDeZs/ByDpGRNzYFzFKT27mi7ih2jhsw37yovIZtjENsHGMIP6KNuaGoSq14r8Nn8ZqPDXt02o91NQq0rdu4VzNZohYyxYisALMaJIIoc6lotuwsCYzj2rQgeubEFcgh3BhSquWAONZRq7yxkT4dpFECA/wOHNTI5UMZTdTHshwojMLfUfP2qnkBI2001ZviIkeaTSEvHIAnx/sIe8pX9uOiVu/hFmudIWKANquMa2x8jyRySkozHpAwVcS1mptY77r9ghdnomQ9Xq1NOVEc4OKS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JObIUl9NczEQZDbdmDooA/RBDAj+ThhLsNDPHU4wjwk=;
 b=GGCSo/4jDuu0cRWtKYPAuHRv1gqH7TiV0A2YlaOfYLPaIKztKaNmT/6aUl3yNnYkdKLof0jh8Q8qDP2P3f8LNsIGI5IGHmB8X+UR+T+LQCxBGUIkwUHvxSy+ZK/zI4Lj0z37e+sXcZaDY1dZbwcmffdllaZhq6apqDEJyRXxIf53xFihaHQIPFs286ivLN2j5egwKCWS6/M2yeZa+pzi4bSOS8sal9P5F9nv/JLwDhHKkbGu0ddeFFgiKBiqdVoi5cbh+F4Gs7i0RAhIYrFJp47pB2oWtSf9J9/xwJcRqsoX1JMIyGeopVImZLnNVMxake2HQfA1uDNeXkoS7KcNJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JObIUl9NczEQZDbdmDooA/RBDAj+ThhLsNDPHU4wjwk=;
 b=M69UWqV0oZhBgt7Rd/Pa8/ijZZYBeNc9ahEAEz8FLXD/wCa/6vvoonVsoNPtmUridb69FKp2y/JCC97ot6ftmBMIHdqcYstOzA89635FiYR0uMvkMVKItw2vnQFRKNc02cy1MH09VRuA1I4k92LPh6tkp+etflCjIwNOm0vePv8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2098.eurprd08.prod.outlook.com (2603:10a6:203:4a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sat, 16 Jan
 2021 13:45:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 13:45:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 08/11] iotests: add testenv.py
Date: Sat, 16 Jan 2021 16:44:21 +0300
Message-Id: <20210116134424.82867-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116134424.82867-1-vsementsov@virtuozzo.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0019.eurprd07.prod.outlook.com
 (2603:10a6:200:42::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0019.eurprd07.prod.outlook.com (2603:10a6:200:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.4 via Frontend
 Transport; Sat, 16 Jan 2021 13:45:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73d0b759-0338-4716-772d-08d8ba24f09f
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2098:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB209824F53D924BB0CAF6AD61C1A60@AM5PR0801MB2098.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YTbjqP7j25WfwBwl6krGYEa+rsCsVz/ObW2V0lPL3zXDgVbsOhxUTZaBEAt2CMceZH4eLWZKtr1SvGOdtMP6Ij6X9NaZQ8m2foB785w1aLrie4LKH1F7bF2IsNjoSsVLFJT45KrJqRJUvCQ4WGiEI/yjwgdWbxJDvhLpC7A7IDLOq+wiI8UaVdy4bEONbQcYjvLMOX9/6qoBIaFRT3gbL7aeEocKFRzNJkarYDEJNr9wreZvYEnaLEm9kjtVXnzseKupLurltQXI50caaLhtpIZpb22Tnx7n4bEHtu9yESYQT47KuSDHBkNcSXb3yxsNPc+zKjhF73+ziYUo4ntwvYqeLwDQrAoYgZmmBEyYnBubaRVhU765ITiZc+E3d+lAwrgKSTsWhJXhHr0SYMtda191BDxDMy8td+/nFNOkBVhpP9UzGFHpi7RhvHPv2PxwFeeKsTA5RJQ8veIm9WnaFQ/g4FKqvZSfK1UJaNAK10YCdabI3kEUP2ohq/VxEPwTWoFbsF4yZytSu04AsO1r59p4Vrf2H239ECPri2HM6GNBoiWD5iTN9OFO767CKvWfe2ZFux2rGgeIxphZDK3JzVs+x5D8KWamnqbLJTv5Ou6lkBjUPZscP7DeT17AB1gtNRSY6kUoEoP7FJXlYpq5dQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39830400003)(6916009)(36756003)(83380400001)(66946007)(6666004)(6512007)(86362001)(1076003)(66556008)(5660300002)(6486002)(66476007)(6506007)(478600001)(4326008)(8676002)(8936002)(956004)(2906002)(52116002)(186003)(16526019)(316002)(26005)(2616005)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?D5SAS8FC+lY+fsI+FHOmTGKXFZyQvQzisJ1+BhkxiXum/egM1i07dPTNof9I?=
 =?us-ascii?Q?/umzzOmrL/tItCQ3I6naJKx256Fubn+8MEjP/6zj58TjsjgZzActONOAdPmB?=
 =?us-ascii?Q?4xrjY0v1GW9d5G8KcqoJHIl/UTTcBsMXwNNzbHJDd7w0MHnpvTHdPfm4d2bq?=
 =?us-ascii?Q?FHN3oYwADBqnPOX3j8ifWQ44l/o4HabRb1YXUeJT+Ee0EOjLeuBAkrAYXY2o?=
 =?us-ascii?Q?LS5K1DKjJo3F1/Vj15GKzMbe3BrLi9OmGI7oNR6dZK+C+HvH4eZpJjWda7ag?=
 =?us-ascii?Q?cWzSYoWDHmLCZUHRjp5HJ6tjt2+teswbjCbflvgO3+A4x3D0uLsHxNApVK2U?=
 =?us-ascii?Q?DHOTgT7RaxrP/gEbnYYKLIAWmZajPLGzkzU5Kc+xjY3tkZqObWJmbIpp80Cu?=
 =?us-ascii?Q?013Hy6/wNG3/h4Z3CC6/Yw9a1K+tLmDbeeGxYwSascDiW2sYjrGRLLSEk+3d?=
 =?us-ascii?Q?c7DnIwCCXKXHsdBpKqe5AC15sYU9WWOmjR1raPb7pkq5Hta+/bq4z6rRjXit?=
 =?us-ascii?Q?GRU3ieYAtS5IKt3rhVU6gdWFn4yY/TknW7fM3ybOWJOsfC1javeH5KbeglP1?=
 =?us-ascii?Q?R40GXpQPhXTYrBPRxJDeEi9wCs8Q4Xam8M4q+WWL/FFKS8poSVdF5c3AmN3Z?=
 =?us-ascii?Q?MbcO2WEoA0c1q/ZrVKQdKR7H2X6BEs/A2gIZ5acLW7JiDgN60ZL+A2CmpMxo?=
 =?us-ascii?Q?ug7Ukrgg4p/HckjHigFvDB0kWVIIVTuRjF8kSPQBrMmmaqI3HmZph2nYXQjL?=
 =?us-ascii?Q?w0UN448jw1SRr0hk5eaoAmQETbJVTTgJNfybXxYMBx37bDjxkiw5LILNiVQQ?=
 =?us-ascii?Q?jQMVPbStb7BxBaVXgNZLc/pPt4pOKzYHJ7Ozu1h1ODSeH4efI3cGPxuzaGO4?=
 =?us-ascii?Q?BZHFRYh+IrQ9ucz2r/Uf1aV6G3R1XlqejldBNxmk0MU4lsAa/spKlvQ+XSMl?=
 =?us-ascii?Q?K8utl7s8E+mzjMFUiQWB7VxE1B8auwild6DN5gUoDCF1XzHoyweh9Ha6ak+6?=
 =?us-ascii?Q?/Ocw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d0b759-0338-4716-772d-08d8ba24f09f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 13:45:09.2880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CeUvRo4TKoW7EiblQy5WSqbcew6K27lBLJQSvCO9VTUK4ZJCZ9ARNZzI4AsfO0abZk50jFc/K8s+YJewkorBbW7UN2AzF/gTKbLDIkwcQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2098
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
- same for looking for binaries in $build_iotests directory.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/testenv.py | 255 ++++++++++++++++++++++++++++++++++
 1 file changed, 255 insertions(+)
 create mode 100644 tests/qemu-iotests/testenv.py

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
new file mode 100644
index 0000000000..0fe5076088
--- /dev/null
+++ b/tests/qemu-iotests/testenv.py
@@ -0,0 +1,255 @@
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
+import subprocess
+from contextlib import AbstractContextManager
+from typing import Dict, Any, Optional
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
+        self.qemu_img_prog = os.getenv('QEMU_IMG_PROG', root('qemu-img'))
+        self.qemu_io_prog = os.getenv('QEMU_IO_PROG', root('qemu-io'))
+        self.qemu_nbd_prog = os.getenv('QEMU_NBD_PROG', root('qemu-nbd'))
+        self.qsd_prog = os.getenv('QSD_PROG', root('storage-daemon',
+                                                   'qemu-storage-daemon'))
+
+        for b in [self.qemu_img_prog, self.qemu_io_prog, self.qemu_nbd_prog,
+                  self.qemu_prog, self.qsd_prog]:
+            if not os.path.exists(b):
+                sys.exit('Not such file: ' + b)
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
+                 debug: bool = False) -> None:
+        self.imgfmt = imgfmt
+        self.imgproto = imgproto
+        self.aiomode = aiomode
+        self.imgopts = imgopts
+        self.misalign = misalign
+        self.debug = debug
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


