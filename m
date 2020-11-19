Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EBA2B9399
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 14:24:26 +0100 (CET)
Received: from localhost ([::1]:59410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfjvF-0003af-6D
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 08:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfjoI-0006SD-OK; Thu, 19 Nov 2020 08:17:14 -0500
Received: from mail-eopbgr80122.outbound.protection.outlook.com
 ([40.107.8.122]:25503 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfjoG-00062k-QL; Thu, 19 Nov 2020 08:17:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNttD82PfMwUN04OPiFokKef7+4iJOa4Tmjqy+0V1HZqjHSK6VP2ky0ozomaZTwb08nBQj15OCf9j43DK896jVD+7qHg4FtiSZKZW6GnkmL59+OquuoTNup5BIdLyPLFPPqcJ2XvFbt6Yl7eciGyYT0IEnjKQcT7el7l8RM8mieR8FWnRr7DiyFk2XVrYWc+V+M3USJo5lQkPbNPcpNM4oL7mk/S3fBRpBtOOM2x3i7VnIA3pXSZUIwrAPl2U2PQa0LPuiDeDVYRhCaZWN+9aD/TNav/L5536eCkh2iD5Bzmlp/IzpZfFG5SURdyua0u+cNUkmi7ZvL1n2k/TAiKpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDBSk0zzAhLEGOuA9Nb0dy+XkbysAbmnwC1Jc5KNz9s=;
 b=bTO9U33gWjgovlHJOkfAejo0SPjeaIbLrPO8a7EPnfP3H8HChJsDytUJG/hnnZP0JxXGCf5M1Dfz80ihjlV/r501k9PVLVmqJm1e4EO76itNdeSx0NO1RltR9zd2CRkBtJQ8A1nRDKl/x0o7WrwM2Y5ywkVAyZEmF0JSXvwO8oCG/zduv/bLGvBuzLCWhytVFXKY0OPBZjNzndLBozxL0NJfDvVe975ClMMNwlMvZDFwBzcXkFjvIADdt9ZvvsLhoiQ6UcPsfqpa2ubsS3R30uDUcpMsg2BRCAmSVrhjR0fH4RacEKq646keq2tre2SY8IPhjk1xXcD5pjkiWJ/0pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDBSk0zzAhLEGOuA9Nb0dy+XkbysAbmnwC1Jc5KNz9s=;
 b=inbf7pgUDXpvNZPt0RIHv006LSjRn0zwBOBCH5QtfrmJJ2roblK5sB8Qk7wHUeb4wH3cvsmP8sZbxZ44JlPVfeKTqrrf89ZUcrf8VzPJLpmm9Y+jlfJ/rB3GTUS7P5iQ2uBJHEqkMX3VDLmwr6mVb0TBjiyPvIR99ZdBQkCHIis=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1844.eurprd08.prod.outlook.com (2603:10a6:203:39::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 13:16:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 13:16:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH 4/4] scripts/render_block_graph.py: add ability to parse json
 files
Date: Thu, 19 Nov 2020 16:16:34 +0300
Message-Id: <20201119131634.14009-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201119131634.14009-1-vsementsov@virtuozzo.com>
References: <20201119131634.14009-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.89]
X-ClientProxiedBy: AM0PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::44) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.89) by
 AM0PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:208:ac::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.15 via Frontend Transport; Thu, 19 Nov 2020 13:16:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03fc241a-7a3e-43fb-2869-08d88c8d62d1
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1844BCE5150430FCB0EC4D44C1E00@AM5PR0801MB1844.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c9NRts/MrfZSQH5W0RJrcUFoTeDiZQPSnMfFxLNX+pPaNqBJlGtldFDRZfufQQFjTq7OkvhF/Gx314lmsVtfAevw5Q6LrWu5E2YCSQSUmf8f5GnjBdf+JMB0Jz7BGztsR7zqWJHwpVvpoVnileGu9xU7FuoXokRSWVZP/ZuBgS3jS4lsCcKHKjJJidCe6FsIswuF0nrB+FPw2tzyUlhtiiXojDtsxl06b1BtlEwG/PX6eVzsWbOwgLw7KL/l67HXTaJdzEC2k7AnPg0WgoMbWpHRwAmfA8eUkEwom9Tgu0fiJVCkTS58DnndRraZ652tunXWg2gqphLXktlM2qZPf3RdYa01G6bhUlvgcCr2qXch/aRKsDCiGR3Dv7iLQsFy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(366004)(376002)(346002)(6486002)(36756003)(186003)(16526019)(316002)(2616005)(26005)(4326008)(107886003)(478600001)(6512007)(83380400001)(6916009)(8676002)(6506007)(52116002)(6666004)(2906002)(8936002)(956004)(66946007)(1076003)(66476007)(86362001)(66556008)(5660300002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 4irGq2/jtR6yCCXcYXDsH79aUuzmzIADsHn3PDu0LlPRWb8epZO+/A/A1h5SA2IUWVMK6v40wLf2fGdw5vhazmyufSSliE9MJ/BgouK3lxGfWpiJUwcnoeJRyyBFeae2MDZBx02z6jGRW1p2sKNfsqYZ/hbb/KlCoyHOJnkC4qG/Z1ZkPvWwq/RPIKw7JRn+nwc2R1Zt2HipKW7ZjxLxLzKizBxudc9Ria5ZmcU0yEL4/vlAlpBSe9RiIA2E/zaVhpFzss79ovhNfARaF/rPCJ/uGdj/PxVz8oSyEP50S6qMIPzKXXr+NpWxr07JkqPuWhqkJ7g0gwQqcSdfYihxJKG0/Dkltt2idnwBbCFVDLVbFkvrsxIbaJWno+sz5Tm7ySBzAcIkI+NibMMqqKLpRYu8KHVQUxCzAK+4EyFreEGzn+ywpZzAVXTgIfZ4aSt9BrQKniUOkKxxLOw48w/5BmnsERokBVDp7P6/fg7Z7PLEYnB5o3+rRCmvg+DkIvNI+d0pLkDL2YQ42UBPNKvmESZvGM8tsBwyh+mp0SN8C8BiEHpLdI0AjDKAQ2m/7eBpc7XaOgOjM4+ke486yhuSvDpHwlKwkVrmlBatPzhSQHV2YmqTfrmBXdNk57RUrtDTnFLJ7kDIazCVt8uDtFUdWA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fc241a-7a3e-43fb-2869-08d88c8d62d1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 13:16:55.0829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwisXLKN0O3gQYatwGBV88WOCbeEIAZValiEgU+EuhI8r8OUwlQnsl7EmjWS20+HhUpFtIAqooZ73pBORFmVoehqayYW6+BwoDn9XqbKlaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1844
Received-SPF: pass client-ip=40.107.8.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 08:17:00
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

Add an option to use json file (generated by dbg_dump_block_layer())
as input.

Also, add myself as maintainer of the script.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 MAINTAINERS                   |  5 ++++
 scripts/render_block_graph.py | 53 ++++++++++++++++++++++-------------
 2 files changed, 39 insertions(+), 19 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e018a0c1d..e780c89e0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2408,6 +2408,11 @@ M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 S: Maintained
 F: scripts/simplebench/
 
+Block graph visualization
+M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+S: Maintained
+F: scripts/render_block_graph.py
+
 QAPI
 M: Markus Armbruster <armbru@redhat.com>
 M: Michael Roth <mdroth@linux.vnet.ibm.com>
diff --git a/scripts/render_block_graph.py b/scripts/render_block_graph.py
index da6acf050d..4a11aba697 100755
--- a/scripts/render_block_graph.py
+++ b/scripts/render_block_graph.py
@@ -2,7 +2,7 @@
 #
 # Render Qemu Block Graph
 #
-# Copyright (c) 2018 Virtuozzo International GmbH. All rights reserved.
+# Copyright (c) 2018-2020 Virtuozzo International GmbH.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -40,19 +40,14 @@ def perm(arr):
     return s
 
 
-def render_block_graph(qmp, filename, format='png'):
+def do_render_block_graph(nodes, jobs, block_graph, filename, format='png'):
     '''
     Render graph in text (dot) representation into "@filename" and
     representation in @format into "@filename.@format"
     '''
+    bds_nodes = {n['node-name']: n for n in nodes}
 
-    bds_nodes = qmp.command('query-named-block-nodes')
-    bds_nodes = {n['node-name']: n for n in bds_nodes}
-
-    job_nodes = qmp.command('query-block-jobs')
-    job_nodes = {n['device']: n for n in job_nodes}
-
-    block_graph = qmp.command('x-debug-query-block-graph')
+    job_nodes = {n['device']: n for n in jobs}
 
     graph = Digraph(comment='Block Nodes Graph')
     graph.format = format
@@ -93,6 +88,19 @@ def render_block_graph(qmp, filename, format='png'):
     graph.render(filename)
 
 
+def render_block_graph(qmp, filename, format='png'):
+    '''
+    Render graph in text (dot) representation into "@filename" and
+    representation in @format into "@filename.@format"
+    '''
+
+    nodes = qmp.command('query-named-block-nodes')
+    jobs = qmp.command('query-block-jobs')
+    graph = qmp.command('x-debug-query-block-graph')
+
+    do_render_block_graph(nodes, jobs, graph, filename, format)
+
+
 class LibvirtGuest():
     def __init__(self, name):
         self.name = name
@@ -111,15 +119,22 @@ class LibvirtGuest():
 
 
 if __name__ == '__main__':
-    obj = sys.argv[1]
-    out = sys.argv[2]
-
-    if os.path.exists(obj):
-        # assume unix socket
-        qmp = QEMUMonitorProtocol(obj)
-        qmp.connect()
+    if sys.argv[1] == '--json':
+        json_file = sys.argv[2]
+        out = sys.argv[3]
+        with open(json_file) as f:
+            dump = json.load(f)
+        do_render_block_graph(dump['nodes'], dump['jobs'], dump['graph'], out)
     else:
-        # assume libvirt guest name
-        qmp = LibvirtGuest(obj)
+        obj = sys.argv[1]
+        out = sys.argv[2]
+
+        if os.path.exists(obj):
+            # assume unix socket
+            qmp = QEMUMonitorProtocol(obj)
+            qmp.connect()
+        else:
+            # assume libvirt guest name
+            qmp = LibvirtGuest(obj)
 
-    render_block_graph(qmp, out)
+        render_block_graph(qmp, out)
-- 
2.21.3


