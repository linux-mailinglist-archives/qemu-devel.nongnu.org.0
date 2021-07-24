Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0043D47EB
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 15:40:59 +0200 (CEST)
Received: from localhost ([::1]:49802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7Hti-0005HV-CJ
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 09:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m7Hs7-0002kg-8J; Sat, 24 Jul 2021 09:39:19 -0400
Received: from mail-vi1eur05on2132.outbound.protection.outlook.com
 ([40.107.21.132]:24064 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m7Hs5-0004Sk-CW; Sat, 24 Jul 2021 09:39:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5nJbXtI2G/YkdH6XcDSDk3HqMXRjcuFMlbWI3qRzLEbx0PVreLeAgI/k2O5WJpPd2VYJWwsdHmOPpkFjZ/S8okTy7A2eRgit89B0SY07gqv42SL788UXEQ3xJp2LEfd+tS0Q68nnPaT5vQF/vX5niY8FXc/irujCaBhVjy9LXBZxfpc11wCPq+tkLyRjjMgdjZBZlRZxU4ikbUcWyDRkuVIjoN+Ldrr0JoLsFYoHwX/qYyyvTso+J4ZnRiUwoKrQJ+7EndprDp6+O6YDDvkfpFvCvDjsCsrJv4yutyLXY7jPjvkYPt3v4nfsYc6u5VeoDalCqdxURqR+rfK5p8Bfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ClUjHS+sHx6XTswdLnAwhSmeHdWPK17RmhjgXgtOu0=;
 b=nVMCap5xeuXsxaE1GNgAguN2BnX47LFL1sAVGaUBi1+TrieBg/3O2m26VcqWYEQLuDusvtodz0+Ga4kxLvjL2Euhz+9dVGdfKOCfx7wJHEuC2RmrxFSQnIFEYInyckKGNmSWnYXdj9QwbWm3HAn7arupMLRw4OT2NSxwe/7SJc6VZz1CN2NwvpRcXQXzLheFVlzH1QdAG3aM4FfWNXTd3LQBDBrtMtLTZBqGWQpeq0TRrNfpgjwlrMrr0hQSyWne2BolFwj4x9/lEk0sWvKrhZj0O6D++UcVNb631RH4py/gnXKFKhsZXT5DYzH20fhQvPu1dQ3YN8Tsd3ltPfw61w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ClUjHS+sHx6XTswdLnAwhSmeHdWPK17RmhjgXgtOu0=;
 b=Kc1yB8crU6rDZMUlbu+l4uH/svmeTjvB5M8ljPbG0LOkY+HHa9Du26LCcytdU7yeD98KSvyUImHBQOqdV/s3Ffho3XxqcwnTGjaJ/Aeh2Rct/lsCFq4NQAlpTHnL4sp5Gtrf71gU/6TRk4v8MjRcuz3TtB4A6gJeN7tUyq0lXrc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Sat, 24 Jul
 2021 13:39:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.029; Sat, 24 Jul 2021
 13:39:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 1/3] simplebench: add img_bench_templater.py
Date: Sat, 24 Jul 2021 16:38:44 +0300
Message-Id: <20210724133846.64614-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210724133846.64614-1-vsementsov@virtuozzo.com>
References: <20210724133846.64614-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0200.eurprd05.prod.outlook.com
 (2603:10a6:3:f9::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR05CA0200.eurprd05.prod.outlook.com (2603:10a6:3:f9::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Sat, 24 Jul 2021 13:39:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3994ab50-db10-4296-b9cd-08d94ea86a46
X-MS-TrafficTypeDiagnostic: AS8PR08MB6805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6805334CD49E8BDD200931A6C1E69@AS8PR08MB6805.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vn59ZPWzLFNcq+CLgOldSlj6rnzRQLkWeNHYaDiyN0lhF7YNFHg6g7FLMjRuC7dueGYc4kyL3sc6IA4NuI32V6SV36p8PDPMPTacptPqlQiWLvS59+wj2x5E4nhJKxfY/preFgwq2fzL/Jo7gjx0GVV+Pgs57D5fjDahUUULh3zsu9YOzzKi5vyYEhXmmK+Guej0q8Ec6/Osf3MVwFly65GQZYdmGL7MLLaBC0emqX2/EkyjNU8cUcfFxegyZJVAuqFGj2xs7SDsp86q5DgS5y5LC/sk5buQAVTAd/Sue2TTmAIYwpMIt/wiFA/UD8v6HzbwHuwDAXRimXJ95XjKY5pG6/V+3tt/77nwcgToAOn21uu/Wjl8LDCI1P4cyvLFZWxQ+1Hpk/nsZHiRjwsA3byMKio8dekMSrC97bL4BkAExcsJnvvbR8JBkFgauftjlGMDHCslfDmbKRCqVL7Y1W7XMPDcsC9Hj8CLASfbil7fcLV7TUK1eBQR9dxkpMpbjJqf8OtVgejC8nKZrqaTb0J9z3j4kQF5v1bPC1mzzeXMSQNT1VzYn5iRWonyrhSeH0DxDIIkzAj9rQfAUkb0Lmqq0Kh+s+8WSyuf3TCRhzjiIvH8u/TmkkI7VG1mR6rLggjX5joWs5c79FGLdL1X12oUchFABxcM+rxiHjqSEKbAgjBd2LGE5HSRo6tuw1ZyLyTYuHtPQKFym8BimJbx22IbSaCWlQfZ80xwidztgfzLwy6Ic9h765v5xfNcmHLx5e1YTxhZQhSqB8QWMhK2KMW3B0QcNLOxEwcJskgu1eWQpkkSylTqFBeS4doVJzxR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(136003)(39830400003)(376002)(478600001)(186003)(6486002)(66946007)(8676002)(6506007)(5660300002)(956004)(2616005)(66556008)(8936002)(66476007)(6666004)(36756003)(2906002)(6512007)(6916009)(26005)(86362001)(4326008)(1076003)(316002)(52116002)(107886003)(38100700002)(38350700002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jA50yCw54OEuz++YXAYaWXS1WlZeVplHR+9ue9nHK7j+855gxWleaEydBgoJ?=
 =?us-ascii?Q?uK9g9G8XKnM5UEkCfGTmR2MekbPPfpB1GOdi4nxVRyDo05W1BhOhEkwTWZEr?=
 =?us-ascii?Q?0fL9/CA+PVPVHvIiCh17g11SzObZ03nwkTaLX5iKk0of1fkoidjQmx4CMiXY?=
 =?us-ascii?Q?/mqqM5yVtX2Zcw+E0z6PZJxBce9o3L+pPL1DcIPxMQi9Eua4/RWc++/1CVbH?=
 =?us-ascii?Q?zn2BoAV+c4sHm+14/zoFie4Pp7v6zm4yYxPInnag9d0jQ89su9aPVyQfM3We?=
 =?us-ascii?Q?DAihOKSPSAkMUna10avTYB+y5QH2u7woKL6d41JigOvMqkdfaGisEJI+v+kN?=
 =?us-ascii?Q?His6FVYaXX9CJhvkRghHugnFixgmLss4NNcUKdWpzd1u8Qk65zGGr5Vl35BT?=
 =?us-ascii?Q?wIv86TyMcLeLUr2rQofCT3zWXEF3+pfgGhzkzVJGKuhC73RG/CO4xgSJPsT9?=
 =?us-ascii?Q?P4GLUgfKlAROyxP0dg9XIJVp6kwPGaLoLNfQywPTwL3kv+JVRNJIVyC0teYd?=
 =?us-ascii?Q?lp6j1UJlM86jktTGdCli2dx97OnXmJn7dwEjmVZK78XP0HBNNSlhPmsgFEO9?=
 =?us-ascii?Q?88FpsUWOa6wkQeDmDw0qbwphZ+mdwKZ3ppjDpXDGwGdXyY6YFVuFfSbvyAms?=
 =?us-ascii?Q?6XDRq1AqJr97+6TbTb6KAlohCf0/lag6ivMs4PzmkFF9z3iayR8bLV+72Qyc?=
 =?us-ascii?Q?44WNa1GXXT5cB+QR5iLtpjEn89If3TGzlPRaFOvKgRVDPiFhLS5i15FiVMgV?=
 =?us-ascii?Q?codGIxo4QSBwIkyh2L+IvtfZT75MxgA1Fv8ZFCXLneL6Zp8ZbLAUl0teWmlG?=
 =?us-ascii?Q?EBMU+YqFBjz/FMnfXR0cRNVZZ6tBe6amGubr1wFOc37AzB6j3SANafZa6AmZ?=
 =?us-ascii?Q?++7D0NRF8XEIyzA8YVuS302Gn2vYaiUJF9D+S+aBaO0CAMmtVubl4ZKo+Rk1?=
 =?us-ascii?Q?fS4OPbZElsxuC9GZli9ZUZhChehhiCRG6NRap2p8kR6DhNwz7PZp/QoS0/hW?=
 =?us-ascii?Q?ubT5VFS1tjZZ/QyViG8vGuXjISGQaFC6Nt3inkvnNKA+MAWSUI5ltXdmFHxs?=
 =?us-ascii?Q?YFrT6TTMsHDuFnYk9RrQcAB8ou/lZoAhdKVBXjApwgIkLIhzrHdcmeLGIkbN?=
 =?us-ascii?Q?e1UCc4apG812sBdoo110oCv5vS1OPh9jks1lcUJAJOGXPfQ3UUZ3i49TRuCr?=
 =?us-ascii?Q?Mp8UCVXBhOQFPVD45Et5jwd0MzTC5k2j/IS9C5f1lJ7HoKR3prspuL7ajjqR?=
 =?us-ascii?Q?uWMHxdwI25as7XWDQT5/CaTcXd9ZFsDX/M2FjX7q2XiYDE/VzroPEbPWjJ26?=
 =?us-ascii?Q?856/AyWZ9+oCl8yJyxPiIRgj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3994ab50-db10-4296-b9cd-08d94ea86a46
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2021 13:39:09.5960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUaHj8QO39BB6C8Aqd/7SEpzTnGyRtQd5Q4Z69Gsdkp5tWQdwV5mERUrhLuR1E5vhcRYJ6TDPk8jGboJMAg601BZFfc/YDeVMp1IEEYhWfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6805
Received-SPF: pass client-ip=40.107.21.132;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add simple grammar-parsing template benchmark.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/img_bench_templater.py | 85 ++++++++++++++++++++++
 scripts/simplebench/table_templater.py     | 62 ++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100755 scripts/simplebench/img_bench_templater.py
 create mode 100644 scripts/simplebench/table_templater.py

diff --git a/scripts/simplebench/img_bench_templater.py b/scripts/simplebench/img_bench_templater.py
new file mode 100755
index 0000000000..d18a243d35
--- /dev/null
+++ b/scripts/simplebench/img_bench_templater.py
@@ -0,0 +1,85 @@
+#!/usr/bin/env python3
+#
+# Run img-bench template tests
+#
+# Copyright (c) 2021 Virtuozzo International GmbH.
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
+
+import sys
+import subprocess
+import re
+import json
+
+import simplebench
+from results_to_text import results_to_text
+from table_templater import Templater
+
+
+def bench_func(env, case):
+    test = templater.gen(env['data'], case['data'])
+
+    p = subprocess.run(test, shell=True, stdout=subprocess.PIPE,
+                       stderr=subprocess.STDOUT, universal_newlines=True)
+
+    if p.returncode == 0:
+        try:
+            m = re.search(r'Run completed in (\d+.\d+) seconds.', p.stdout)
+            return {'seconds': float(m.group(1))}
+        except Exception:
+            return {'error': f'failed to parse qemu-img output: {p.stdout}'}
+    else:
+        return {'error': f'qemu-img failed: {p.returncode}: {p.stdout}'}
+
+
+if __name__ == '__main__':
+    if len(sys.argv) > 1:
+        print("""
+Usage: no arguments. Just pass template test to stdin. Template test is
+a bash script, last command should be qemu-img bench (it's output is parsed
+to get a result). For templating use the following synax:
+
+  column templating: {var1|var2|...} - test will use different values in
+  different columns. You may use several {} constructions in the test, in this
+  case product of all choice-sets will be used.
+
+  row templating: [var1|var2|...] - similar thing to define rows (test-cases)
+
+Test tempalate example:
+
+Assume you want to compare two qemu-img binaries, called qemu-img-old and
+qemu-img-new in your build directory in two test-cases with 4K writes and 64K
+writes. Test may look like this:
+
+qemu_img=/path/to/qemu/build/qemu-img-{old|new}
+$qemu_img create -f qcow2 /ssd/x.qcow2 1G
+$qemu_img bench -c 100 -d 8 [-s 4K|-s 64K] -w -t none -n /ssd/x.qcow2
+
+If pass it to stdin of img_bench_templater.py, the resulting comparison table
+will contain two columns (for two binaries) and two rows (for two test-cases).
+""")
+        sys.exit()
+
+    templater = Templater(sys.stdin.read())
+
+    envs = [{'id': ' / '.join(x), 'data': x} for x in templater.columns]
+    cases = [{'id': ' / '.join(x), 'data': x} for x in templater.rows]
+
+    result = simplebench.bench(bench_func, envs, cases, count=5,
+                               initial_run=False)
+    print(results_to_text(result))
+    with open('results.json', 'w') as f:
+        json.dump(result, f, indent=4)
diff --git a/scripts/simplebench/table_templater.py b/scripts/simplebench/table_templater.py
new file mode 100644
index 0000000000..950f3b3024
--- /dev/null
+++ b/scripts/simplebench/table_templater.py
@@ -0,0 +1,62 @@
+# Parser for test templates
+#
+# Copyright (c) 2021 Virtuozzo International GmbH.
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
+import itertools
+from lark import Lark
+
+grammar = """
+start: ( text | column_switch | row_switch )+
+
+column_switch: "{" text ["|" text]+ "}"
+row_switch: "[" text ["|" text]+ "]"
+text: /[^|{}\[\]]+/
+"""
+
+parser = Lark(grammar)
+
+class Templater:
+    def __init__(self, template):
+        self.tree = parser.parse(template)
+
+        c_switches = []
+        r_switches = []
+        for x in self.tree.children:
+            if x.data == 'column_switch':
+                c_switches.append([el.children[0].value for el in x.children])
+            elif x.data == 'row_switch':
+                r_switches.append([el.children[0].value for el in x.children])
+
+        self.columns = list(itertools.product(*c_switches))
+        self.rows = list(itertools.product(*r_switches))
+
+    def gen(self, column, row):
+        i = 0
+        j = 0
+        result = []
+
+        for x in self.tree.children:
+            if x.data == 'text':
+                result.append(x.children[0].value)
+            elif x.data == 'column_switch':
+                result.append(column[i])
+                i += 1
+            elif x.data == 'row_switch':
+                result.append(row[j])
+                j += 1
+
+        return ''.join(result)
-- 
2.29.2


