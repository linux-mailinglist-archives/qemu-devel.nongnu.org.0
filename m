Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674E527043A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 20:41:03 +0200 (CEST)
Received: from localhost ([::1]:33908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJLJe-0000jc-5k
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 14:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kJL0K-0007ei-CD; Fri, 18 Sep 2020 14:21:06 -0400
Received: from mail-eopbgr40094.outbound.protection.outlook.com
 ([40.107.4.94]:32391 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kJL0G-0004dZ-8y; Fri, 18 Sep 2020 14:21:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EK5eR27YHOnXGlAvBcG1fMueiI0Ge0kMoNd+GNPHkRMpXOykI0LE0+DvyL/XPIkxvha6ImBBQgoFrCO594qulQ/yLG2jrnreAbPObKArlQyL4Dgf4efq1IcIKlKvsF2ruFP+RiNamh0OmunAxEAvVeAVIjMaBUjUXSo1nPTe7aCIZVNW71nuwmyJgyFj92GqLmOw4gE37u2shCnyuxveCK/2zXvep49SM5gHbEZqkJ5ng6QhVJwiu1/4jx7gSyhEip3N4DPqFCbanlH83KYLNNJhOiWx6/xa6VG5OsaKF+qjKhOJ+NWoZn1F2LNhziZWp+tVDZWUHuMvxrMugmpX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaA6RrRANpRcdov7Gw6qp3pWulzXEsVWc/PNy6xwrbg=;
 b=aFaYU18MSRfCQ8eQSSoZXJHZF0toODHMFDXtTceHRw7wqN4VdJk+ZrLuFYBU8Ahyn+5UuKQgftX3W4Bg6e9sQkCmiBatufBtillOid0g4CiVLEnMzWJ2cwu6Yj36MdbjT5/Udw+Oxt7xPR/+A8vBeAkChSBjJo+4cNIbx8L1j1Yxcgtw3k28SRYgQL5KOyx9McTPGVleSyJgkVAg+yrGRu0nJxjYVSqY7EEHi+PbvjqAkUTGmZqr4OywnssWBmWPGR3HUGXmOVQAhFM8Sgc6jj0kaJhm6hM5MqKEkvNgzSL7LRj46SL+enqBEBHkAAvxdZoGjLxmVNlwQFhbK9vJYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaA6RrRANpRcdov7Gw6qp3pWulzXEsVWc/PNy6xwrbg=;
 b=CsC+P/wRNw7bgHjUvpvv+7ASzZZfJAmZ+RCPfpnj7IwkDAaXC+gD3yQoyMevkp0dcpH3KGNSrhFdch3nzk5auY8ACQ64n2KTquw5T0phLP7f436+UKLVNstRvlIEKzDkiNkTmaJCE4aPeqTHDZ3M1M/1nMQ2fvkGBVXp16+8kEU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1905.eurprd08.prod.outlook.com (2603:10a6:203:43::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Fri, 18 Sep
 2020 18:20:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b179:9641:7589:d692]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b179:9641:7589:d692%8]) with mapi id 15.20.3370.019; Fri, 18 Sep 2020
 18:20:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, armbru@redhat.com,
 eblake@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH v6 14/15] scripts/simplebench: improve ascii table: add
 difference line
Date: Fri, 18 Sep 2020 21:19:50 +0300
Message-Id: <20200918181951.21752-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200918181951.21752-1-vsementsov@virtuozzo.com>
References: <20200918181951.21752-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR05CA0019.eurprd05.prod.outlook.com (2603:10a6:205::32)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.106) by
 AM4PR05CA0019.eurprd05.prod.outlook.com (2603:10a6:205::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.13 via Frontend Transport; Fri, 18 Sep 2020 18:20:18 +0000
X-Mailer: git-send-email 2.21.3
X-Originating-IP: [185.215.60.106]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 806d1ce3-8609-4895-6060-08d85bff7f78
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1905:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1905348C1E5B757305DF9BDAC13F0@AM5PR0801MB1905.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eaWir+/zNKHHVettEO9Pa+yTpQAH7nJRb5pCYcVPBChrlZBdbIaqrtiKc1iGoDOILd4R3/qi/rhmIBWb903G0pLD+u0oRsc7A3gy2cq5Bfl0HN2p0KWCGd3JyctUTqYWvz3CYGy8Be6QyQ/fLdwyUidLWVQXJEPSKRpPr//pSHFgxEz+vIX1CvQEcQUlrI/ULg5Btq4QFO7bdGXo2TewzntaHx6YjgeiolHDJ/+EaeKpU0+SqQXB/ZReKTMP36DSttAVhh+5X60YiKXJb3WRBHSmn+YIxF244hF53BOHPp54xt+Wr4ujNrpIspN6WNqKPIWv4yeOG0CvE1ML9QcoqQbUpB6IzKFWwvvfFyWouoyeNs7mBHA+AU80rJWqAVsK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(366004)(136003)(346002)(66556008)(8936002)(66946007)(66476007)(107886003)(6506007)(2616005)(5660300002)(2906002)(83380400001)(6486002)(956004)(6666004)(1076003)(186003)(8676002)(52116002)(4326008)(316002)(86362001)(6916009)(478600001)(26005)(36756003)(16526019)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: jLCKStDn2IsgR2I4AILRzfZoWZNEZl3j83CbuAxr1VhATm20CKXM/t9Gvx2PtQEak8zRJ1k43snXk4sS8Il1NVu7Xoi7rUTKbQxk2Im+GzYUYcj84XuZHvZuUFQewFtXHGLzqr09kGVjmPgN/lQ6PCN+TrVGXZ0qV1AgZsUkP8ME2HD4uhgwLXDMyBw7tamonKAHvw9Kt4Zjecuc6qq5fDkZZhyWLeWcJBYLZCk2kN5xzfRP/3dcBlan3dZ8ZO4s2wVZSHTJEzl3AunOTzjlRDRVuaooOqPbB87F/UKlNOjPysW+vvZkqBNo63y1neqejTxLwqm9amxt0bn0ghdgd11N3K4R6in+GYFVkRY0D4w9LecS+PAlHM+wIqBtn4ANGw6qmUFIzXy5wPliUctr83kBSQc3YNdUNjORqJytmEZly867/vcTn/oAk72Ywf7APmhf88ayMOyDXPYaef9xTrC5a2NcRaairNCX+ybqRhkMaDOjz7Ld2t3JeCEiPZ7HmLK0+hFKp2t6SsvC6H6OAP+tVXgilhuEwym8jDul+hLvRdsePJUj0fAHZskR0ssF4LeRime5hYnJFaLSQo5q4+NyvAW8TZJ7OYJYOzP/UFzq7xcgJ6iWTSnjXRXm+NQvb88MQ8WN9svinWkJOPNAJw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806d1ce3-8609-4895-6060-08d85bff7f78
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 18:20:18.8389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTryrD1aM50JFt3i+mcxNquZD44oO0JDwfikQo02grhUaVWF1/4SuREAEFgVyQw3lYjA/sP63nEPp/Qsxbn3BEosoL1BJWz5TbaMsWoLFno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1905
Received-SPF: pass client-ip=40.107.4.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 14:20:14
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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

Performance improvements / degradations are usually discussed in
percentage. Let's make the script calculate it for us.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/simplebench.py | 46 +++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/scripts/simplebench/simplebench.py b/scripts/simplebench/simplebench.py
index 56d3a91ea2..0ff05a38b8 100644
--- a/scripts/simplebench/simplebench.py
+++ b/scripts/simplebench/simplebench.py
@@ -153,14 +153,22 @@ def bench(test_func, test_envs, test_cases, *args, **vargs):
 
 def ascii(results):
     """Return ASCII representation of bench() returned dict."""
-    from tabulate import tabulate
+    import tabulate
+
+    # We want leading whitespace for difference row cells (see below)
+    tabulate.PRESERVE_WHITESPACE = True
 
     dim = None
-    tab = [[""] + [c['id'] for c in results['envs']]]
+    tab = [
+        # Environment columns are named A, B, ...
+        [""] + [chr(ord('A') + i) for i in range(len(results['envs']))],
+        [""] + [c['id'] for c in results['envs']]
+    ]
     for case in results['cases']:
         row = [case['id']]
+        case_results = results['tab'][case['id']]
         for env in results['envs']:
-            res = results['tab'][case['id']][env['id']]
+            res = case_results[env['id']]
             if dim is None:
                 dim = res['dimension']
             else:
@@ -168,4 +176,34 @@ def ascii(results):
             row.append(ascii_one(res))
         tab.append(row)
 
-    return f'All results are in {dim}\n\n' + tabulate(tab)
+        # Add row of difference between column. For each column starting from
+        # B we calculate difference with all previous columns.
+        row = ['', '']  # case name and first column
+        for i in range(1, len(results['envs'])):
+            cell = ''
+            env = results['envs'][i]
+            res = case_results[env['id']]
+
+            if 'average' not in res:
+                # Failed result
+                row.append(cell)
+                continue
+
+            for j in range(0, i):
+                env_j = results['envs'][j]
+                res_j = case_results[env_j['id']]
+
+                if 'average' not in res_j:
+                    # Failed result
+                    cell += ' --'
+                    continue
+
+                col_j = chr(ord('A') + j)
+                avg_j = res_j['average']
+                delta = (res['average'] - avg_j) / avg_j * 100
+                delta_delta = (res['delta'] + res_j['delta']) / avg_j * 100
+                cell += f' {col_j}{round(delta):+}±{round(delta_delta)}%'
+            row.append(cell)
+        tab.append(row)
+
+    return f'All results are in {dim}\n\n' + tabulate.tabulate(tab)
-- 
2.21.3


