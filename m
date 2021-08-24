Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDFF3F5BEE
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:22:13 +0200 (CEST)
Received: from localhost ([::1]:33644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITZM-00021C-9o
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mITT5-0002jl-Ed; Tue, 24 Aug 2021 06:15:45 -0400
Received: from mail-am6eur05on2091.outbound.protection.outlook.com
 ([40.107.22.91]:59744 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mITT1-00055n-41; Tue, 24 Aug 2021 06:15:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJoojckulCsLVXNtBxrIXYj9Bz1K3KuG0bGyiPkVH8s+349Ox3w51Y0zlsP4qwj53+6Z4I4K5Ild/ywDzAg5Wd6d+3Bd8Hcawnbn79xxmUusflkby24ncDiEw92gk8oPMOWR0Nqx+QO4Qv+Mq6xPAAr78MCwlum1nMHrQrcgpJUbEFHqv7YOZRGvTjZsrSu+wIuNxYY7uGtpCzfbrVSTWOxjlzsL4F2yeDDkanJSGT1JRTh7mO9XUFWzXB5JhAvdXTcEg43UAj4W6XGxmAaTDpTAy12CCSDdRmC2ssWkkmJl4oyPR3ZdFWpo7q3xfHrc585vsbKEuVRapIB6ykCjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7Zn/9Xwrld53q2hmwMxOEqfB6plys68/XPyHTn1vIg=;
 b=oXQx+V86xiVSyxuYOZw0tQSgjsHOeqKSqC6BPvYAvYLC34yeK86sQ2K1QR//CtnH9NmJNltjqkHoX8se99NU9XjqyR/Q4pIlB8Z07HPW6IspqXztsG2UZK8F7vc6g2QMxl+j4pW/rX7kb5f1OvNK59LnzzVNGEKR/Z2YIfniU0YE/OXWWwYCTPCqmj1ctz/zif/yOEHRTOEDLs1tXwsxQKIEl+7u+W9Hw/HGhQqD1ZjIne4FfJ23ilQUqiZQ9nP3RxIzqohTzmjKqZ2p5rNXAL5s36XwbR+oUk0ciLf9VllsFXD/jm19VI2j0MT7w+ouCjp0Hb7lsK1PJpTxUFi3hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7Zn/9Xwrld53q2hmwMxOEqfB6plys68/XPyHTn1vIg=;
 b=ZEtNOjB5ZBlpr1hgiihVEyyCAnBIaJtR/s2pQWUA3sfCKRjHY5QyEaEXH6Zulsp08pgED7COm36mV3gYlZWsAN8VNsVGN8cLNuZ1tbTD2zn8K4bxuuRNg+Mk41HgVuGKRyxAfCeIwKvjF63TuofuLYc4LnbP8rRlM+oC50YHd9M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2099.eurprd08.prod.outlook.com (2603:10a6:203:4d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 10:15:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 10:15:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, eblake@redhat.com
Subject: [PATCH v2 1/3] simplebench: add img_bench_templater.py
Date: Tue, 24 Aug 2021 13:15:15 +0300
Message-Id: <20210824101517.59802-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824101517.59802-1-vsementsov@virtuozzo.com>
References: <20210824101517.59802-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR0102CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR0102CA0058.eurprd01.prod.exchangelabs.com (2603:10a6:7:7d::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 10:15:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 946c4298-1d2b-4fcb-97fe-08d966e81a90
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2099:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB209930A2BD725413070EFF7CC1C59@AM5PR0801MB2099.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fFOGJqyHZlNg47QfBH5njBQi4IWYLJxYKdTIvDJKXUltCCgWQwUBXoobCpztRqORzzrTHr6by/UH87fJqjh6VgO6kXz11DVzPmAzrFltoyKiO4DwPoWzT+hA9k4HObT3BIUlKC6iUckOQESXztdV9iBUJ6fVUOI3VHQLl1YjA2+fy2Qnsrs2Ar2I/Zyzbejg+OAkOqNKedtHeiGlaWMt0z4iQwNwektjvSmMysQ+pfkDKSpbr01ysNJ4y5r8K21h3mIvpomBfr8c7yu0i2PsDYxL8x/+hyfjpwnlD+Jq4RFYiIrg7wUVxuBGIg4LwFGVGq34Tpy/7lSr34lkKBtSjX27bvX2tXRtcg9kDOUyg/5g+1ILc55W0gv57ZvDoovMY/hyX/Gx3NbDgGztUFgKl8wQxZZ2nyD3VI0ExaPXTiG9iCZUkJM/fq7m1sfS4BMM1rjsvBOaDbrg/8L3jMPFYZs8B02JzohVjEm0/aG/2rio4Ux0liV7JRAYNGuVZM9kSIZjd/Y12mjnpzr82ilA/BEHRUnKMdCQJgr+aQ2Xvfcft+JrYeD5IXxwlXe7acxxgDdRw6qhLaTPT0gZnb03XE6B/NNIOJS5NF4di9Qe/B5d7M/mRwlPHk+Wohb/L27vjH6jo9ytGcRjKcyCCKwcvqWPW40bbfM0tdgmxcJ9/zUwVqAi1ZucEAAidd5+pZ7P1Bde8zSFMc2yIbSuLhQbdzeCFsW15HAuBFNMhgp8k25QTzkLOjLhNdbpuJ5HGjxCu1JZ24E0TBWEuNkD1bKXFD5A5rKbSnb3shPYFBZIa09DpeJDt/XXyzAYYE8ojjxa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39840400004)(366004)(956004)(26005)(5660300002)(8676002)(2906002)(186003)(4326008)(6916009)(1076003)(2616005)(478600001)(6666004)(316002)(6506007)(38350700002)(38100700002)(6512007)(86362001)(6486002)(66946007)(52116002)(66476007)(66556008)(8936002)(36756003)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWRnMC9VSjVxa3BudUpwZ0lOWjdrT2dGNENwWWRxbUNuczJ2ZUVXajFEbkc3?=
 =?utf-8?B?QVBKd09JQ2EvR0FSMTI5eklWbytQOStNc3VHcmViSCsyRVVFbEExdDJHQjNO?=
 =?utf-8?B?QnphL2xNMFU2MVNvRkVrSnE0UWNJcDRUdXVkVGNjYkxjdkc4dEtkak5CeE9H?=
 =?utf-8?B?b250eTBZYTFrQ2hTMlVJRko5d0xBb1FaTHNWREtLZm4xTmRRN1hicEcra0pO?=
 =?utf-8?B?R1FyN2doN2cxV21DU1YxQWRUNnVoaFNTSUt6aklNM3ZIUDBVQjBxNk1Ob3Rk?=
 =?utf-8?B?ZGxDNTF3TjhmYWlvbkljVk0xczVBV2F6Yk9aVjlpNzRXTWN5eks1T0Njd0xz?=
 =?utf-8?B?SU5YT0pJejFEV3Q5ZWtBY0pGU2o0a2g1OVMrU1V3ZkdabWhuRXAyR21xL1dk?=
 =?utf-8?B?eUFrQzl0d2pDbDkrM3NYQ292SHZrSDlld01Vek9pODdORnR3WGE2bm1rbk5j?=
 =?utf-8?B?WVRCUTFuSFRORTloSnRFRzJvbWtMa3E3WXlhdU5PQUhZNDlkQ3Y5a0RGZTBu?=
 =?utf-8?B?eWZ1VnZIU2dITHl6bGhhdnc2dENyN3pNYnZXMTZaMzRRUGwwMHlqa3dnbDVl?=
 =?utf-8?B?WWg2QnFiUXM2cVJHdGZmdTB5ZTdLNUw4TXVIWnRnSTFjWm1RRUUwVEhyWDNV?=
 =?utf-8?B?NU92MUNycmFzRHl6Zk1VMkFxNnYySTRtaHMwd0lWMVVib1NmNUxMaktXeFJo?=
 =?utf-8?B?TElnRmlYejMrRUJtUVpUMTlRcXdlZ08yQXQ1ZWFHemszVlZoMTJXRmMwRmZM?=
 =?utf-8?B?TTJPYnRnRXdxb2JmT2YxMzkrSXVvbnMwcXpobzQ4SGlsQXcxbk5nelFZRUx4?=
 =?utf-8?B?Wng5YXZmc3JDSHdqZ3Z6bDhNSVBZUnh5Y1NBUFBWb2krSno4Q2FJQ2F6SHFO?=
 =?utf-8?B?dVFUdUVpUVRHQ0h3Z05SaVkxQVJ4NWNWSkp0MG9oM1hEem5EZ0hrZFk5Vnhj?=
 =?utf-8?B?K01KTVIzWHoveGNweTZFT3ZPSTY3WVFlV3p5NDU0WHZKZ3plWFdRRWk2dEVn?=
 =?utf-8?B?QVFnZXVINURHY0lYcS9LeTR0ejNzYjNiMzFMSlBNZ3J6bVFMRUNyZ2FyOGlC?=
 =?utf-8?B?RGZzWmoralNHMDAzaE9VdllUbk9GUUxVMHdpL1haUHJDeHhXRS80T0llQU5a?=
 =?utf-8?B?SFZvRklSME9udGpIL3JoYjFZb2pSczRUK0JaeGx5SHVLOGhnNE9hRzFkR1VD?=
 =?utf-8?B?d0k2TUtLaXQvcWFUbGZxUE9YZ2xTKytacStuMWU5dnFXeHAyUDJVQlpvRU4r?=
 =?utf-8?B?WWtkdFRTVzBXSnV5ekl4dGdlbDFNb0RwaDM4TjAxMU1Lcm41bllhWUVFNXdz?=
 =?utf-8?B?NkhRVm5QUlZDbzFaNStxbTltTzE0Y1MvSEIrOTZwWmdTSjRwSTBtS09RN2M4?=
 =?utf-8?B?UlVLK2FiOExSdVJJaGYvbU9Ob0tObVBzLzJJNUowUHB6eGRFSnpOSDFnNytw?=
 =?utf-8?B?NWVQRFdoTVR6YkpzRkxReUlwbnU4c3hnbjNIbzhWcmc0cUdPRGtTK2tQSWxy?=
 =?utf-8?B?dEVWZHdGMnAzMElHQ2ZlWGQwY0FVSTNUY3hFbGZNblhhYis3QUZXdWFpQmk1?=
 =?utf-8?B?RTVMT0xtOWRDczlGV2Y1UUVLamZpNjJXT01DWG42UUdyVVgvYllrYTR5akpj?=
 =?utf-8?B?NC8vaXBkaDhES2hZRkQyS20zNmRsMjRwa3BzaFgwcXlnWmlYcFNhSEFYTnhq?=
 =?utf-8?B?Rm9sRkh0T3JZVld1aHprcHZYNXVYZ3JPMENKVk1QazFkaXVoWm1HTHdtcnFP?=
 =?utf-8?Q?A81qfAN28wz2aFTjeRIwOA0iQBwwPbyJdkzpRi7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 946c4298-1d2b-4fcb-97fe-08d966e81a90
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 10:15:31.5418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UyntHOmDB0j6WTfEntoB5uudxhc5BnZ5shvA6sLm4WIltXyw3aihjfdlwSb43ujHtR5RweVfAqrjSAfvDvVhlQxPW03AiZHYBov8nQe4oI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2099
Received-SPF: pass client-ip=40.107.22.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Add simple grammar-parsing template benchmark. New tool consume test
template written in bash with some special grammar injections and
produces multiple tests, run them and finally print a performance
comparison table of different tests produced from one template.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/img_bench_templater.py | 95 ++++++++++++++++++++++
 scripts/simplebench/table_templater.py     | 62 ++++++++++++++
 2 files changed, 157 insertions(+)
 create mode 100755 scripts/simplebench/img_bench_templater.py
 create mode 100644 scripts/simplebench/table_templater.py

diff --git a/scripts/simplebench/img_bench_templater.py b/scripts/simplebench/img_bench_templater.py
new file mode 100755
index 0000000000..f8e1540ada
--- /dev/null
+++ b/scripts/simplebench/img_bench_templater.py
@@ -0,0 +1,95 @@
+#!/usr/bin/env python3
+#
+# Process img-bench test templates
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
+Usage: img_bench_templater.py < path/to/test-template.sh
+
+This script generates performance tests from a test template (example below),
+runs them, and displays the results in a table. The template is read from
+stdin.  It must be written in bash and end with a `qemu-img bench` invocation
+(whose result is parsed to get the test instance’s result).
+
+Use the following syntax in the template to create the various different test
+instances:
+
+  column templating: {var1|var2|...} - test will use different values in
+  different columns. You may use several {} constructions in the test, in this
+  case product of all choice-sets will be used.
+
+  row templating: [var1|var2|...] - similar thing to define rows (test-cases)
+
+Test template example:
+
+Assume you want to compare two qemu-img binaries, called qemu-img-old and
+qemu-img-new in your build directory in two test-cases with 4K writes and 64K
+writes. The template may look like this:
+
+qemu_img=/path/to/qemu/build/qemu-img-{old|new}
+$qemu_img create -f qcow2 /ssd/x.qcow2 1G
+$qemu_img bench -c 100 -d 8 [-s 4K|-s 64K] -w -t none -n /ssd/x.qcow2
+
+When passing this to stdin of img_bench_templater.py, the resulting comparison
+table will contain two columns (for two binaries) and two rows (for two
+test-cases).
+
+In addition to displaying the results, script also stores results in JSON
+format into results.json file in current directory.
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


