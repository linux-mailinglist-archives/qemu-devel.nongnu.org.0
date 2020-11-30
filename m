Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7002C85E3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:51:21 +0100 (CET)
Received: from localhost ([::1]:45096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjaK-0007fk-7A
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:51:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQC-0006ta-Fj; Mon, 30 Nov 2020 08:40:52 -0500
Received: from mail-eopbgr60102.outbound.protection.outlook.com
 ([40.107.6.102]:37262 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQ9-0000RG-Mb; Mon, 30 Nov 2020 08:40:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZED9kdwXsna9H0okpLv5Bj9vzKiW+9z5c+f2X+ME3o3+68SNsuOsWCTz+I7PafTHoUxD5Z+SCQldykWmuEZbkkiYVmOoBMyu1WFAQz8esIAyA0KKbseMfOFs4pzltZ+2dtWSj3CUyTRaYcyjd+uGO1tWjpPq0iGIECUqHT39iVGVJkMnYviyZd0uU4BOCmn47oFiiM5nFhfOIg2K/BMaU1ftKFeri4tZD0KvHTYuI70LDXpxB8iTnF79rBRUUGWp6fqtu6rQV/7d2RocCL1vEK4YQQxxTG6ZOPJ+iBZTxg74+/Osdz5oe6CxhD5XXXcI++Oq3TnA1XfS5kHcl01NYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSwVXLL1Aj3iX2zTtv56qUts2sp4oxAmo9M3d7X7ofc=;
 b=AVpcGgGkYHmBynR6LtDBm6FrtJs8mnfK7BE/3AylrFbkZv79aXeXiDIFJ57o9MG1WUzhIQBjpnFxtMBJRunL2NAXFgdfNCY64tIPPvhVchmUxjE1d5DPGmT4LI2RguwL9AO09uXyEdywXG/7564Gp8DHsutOf44DZZWaen1Xdni2L2XusYPMj/pHkhraeBnm7jJW8WtDMZ4aMMqMyif51iPtNxctPn12DQiuuSN/cX747vlCts+E+VlpigkUkbtI851QEn5t5T9n6baMlpfR+IS3UgidJWoOZHR3j2gykE20zzZ8Ka4RF5w57id3PClH+q2Cf5PiT8DXhsXjw+sVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSwVXLL1Aj3iX2zTtv56qUts2sp4oxAmo9M3d7X7ofc=;
 b=wGbz/LBhAe+fz6M0L04hlql9bP0Z6knAsPtuDmOgoOAgVKfwdwnx+SSuFjQCMeKjLF4FIzsHiYPDusEefNIzn81SAD4MibfnZACOUjYOIddVRrbEue9gFJP17wPEJvzat7XuSoAdvtRqkg6ZceP/WcOF6IYwDNybd/p1e1CkFdM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3447.eurprd08.prod.outlook.com (2603:10a6:20b:44::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 30 Nov
 2020 13:40:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 13:40:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v2 5/8] iotests.py: add qemu_tool_popen()
Date: Mon, 30 Nov 2020 16:40:21 +0300
Message-Id: <20201130134024.19212-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201130134024.19212-1-vsementsov@virtuozzo.com>
References: <20201130134024.19212-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0007.eurprd04.prod.outlook.com
 (2603:10a6:208:122::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:208:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23 via Frontend
 Transport; Mon, 30 Nov 2020 13:40:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11ac443c-a8d4-4524-41be-08d895358883
X-MS-TrafficTypeDiagnostic: AM6PR08MB3447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB34470E22E377C27A28D6A298C1F50@AM6PR08MB3447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zza2hNzKW5aOGUyH8/OnDcuD6PFdSteigIOOyTc0szI2heFORQo2QzRV6cXg/7tZfPDmjoNbVlQnBh4Kmbe+TdRoxt+7MSpXkukev4RyN/CusEjKQ+IlaI18TDDted9rZcx9ob/csdajWUlAJHMxCoCN6O2kbum0vBF3+r2AhpN252LlZURsy321RFVYat7Ey5AByE2QJ+LNfOFk3B/Bq/0zTazP7hMHKy3SWpndBKTE1SJpvQPiHGEUzSIJITe/up9a0SF6GTfo/2x4pGGqjFIWgGYIvzY/EORdMERyxon0Z3t/tkv14nWOrzcciMrtfgKfK/0wHKQtJ4fyWh7WQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(396003)(136003)(39840400004)(52116002)(4326008)(2906002)(1076003)(86362001)(6486002)(26005)(107886003)(8936002)(316002)(66946007)(6916009)(66476007)(478600001)(2616005)(16526019)(66556008)(186003)(6506007)(5660300002)(956004)(36756003)(8676002)(6512007)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?S7bdhvJ/w0dBtl7VGDjuVBcDDdFM6L24dZZZqu0cMSDF8j+zuNvyk7LakZQO?=
 =?us-ascii?Q?9jmPeM46I7yLriDa3myPagVqJ7AIFZVBEpxjcIHpI1vK/7xguZOW1dlRJHEj?=
 =?us-ascii?Q?jHyzSf9/Hnx0JDMQ4iPcqLWb6T41p898H6eN1C+9TI5cOVYUdD4IkfMxeMLL?=
 =?us-ascii?Q?vPUAAe3sZ4Ka8jXW4UWarsu922hLFhPdj9wOVIw81Y+lTEhORgC264pg+nqB?=
 =?us-ascii?Q?HgJ2DgEf7iPO6gP9oORogipnMJEeKlGjDiZ7oYrHV/tVjjiMUmZaXunwDlsh?=
 =?us-ascii?Q?pEOXLh7+ZWzObfUXO3nu+TOrjb197HSSy8erDIbJRSOhrPnHN5Ww/FzEDp9V?=
 =?us-ascii?Q?Qakpcz+CvEvw9YFm+kR7OvEDU240X/XUevsPM5CNtxvkOnRsHJ6Y6rvkk4Ft?=
 =?us-ascii?Q?ePcsJzpb+iiZLHcuQ41aU4kPXi7/aLHpDuTPYciyN6+cFXOCnys5jelyzBSL?=
 =?us-ascii?Q?p+ANJdeKQCJRdiPGC1PU/P/AbGwQmsVkyJOKB0tqsUHovqWvkGigPjWyFmeP?=
 =?us-ascii?Q?5oSlmCg4zmBxlzuXuaLK0dM5TZOTW2mfbsLzqXxDpuu4N3dEWPNCh00HQ1zO?=
 =?us-ascii?Q?3Lmht0h5PGIfdTPnKNIJEe4KsS//Sa0Ioe0UdfLg3GUr97I2LooOokEVh8E9?=
 =?us-ascii?Q?/hJ3v7y7dhlZWDuQXhae5fj4tdBBPbx0gCR48PU2PpPrwLf7wwMUoOwBaGXe?=
 =?us-ascii?Q?OQc5q41xFoOruHzUIqEh2LbklTKReLoTmgkiD2wUdMvpWyUbxY1bZXkeBMUc?=
 =?us-ascii?Q?ExD74n2PzxIaR6i1WA70yfRIJ+etwO+5uGLWrGznhgavcBuV1y1BaEtce/8C?=
 =?us-ascii?Q?4VMk0GX3A81CwP7xaJsGIW9aUfqmONgFBu4dx4MCx6yPMYz/yrEvPCg60UNl?=
 =?us-ascii?Q?Wu+4vNAT2wNldM8V6Dwb5ELi7ZN6G8LNReXwO6fUNiRgt0f6+g+l66jD1doK?=
 =?us-ascii?Q?54iLUIZYad6CE36zsebrIz6qAqiZe0HtD0sNPEIymeFA9r5C/ptW1MqEMKbf?=
 =?us-ascii?Q?vhdL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ac443c-a8d4-4524-41be-08d895358883
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 13:40:43.2070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7CzrhRCrMfRzr/ftNt/AAZ0swXlIZftRfDIEKy7LsKJ+kmn7n9oNwFP3GpeQfSy3nWVpMYnQX/awc0xiMKXF+stAXoELRJ7FOq+e+0/5BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3447
Received-SPF: pass client-ip=40.107.6.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split qemu_tool_popen() from qemu_tool_pipe_and_status() to be used
separately.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6c9bcf9042..df9834e43a 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -89,16 +89,21 @@ luks_default_secret_object = 'secret,id=keysec0,data=' + \
 luks_default_key_secret_opt = 'key-secret=keysec0'
 
 
+def qemu_tool_popen(tool: str, args: Sequence[str],
+                    connect_stderr: bool = True) -> subprocess.Popen:
+    stderr = subprocess.STDOUT if connect_stderr else None
+    return subprocess.Popen(args,
+                            stdout=subprocess.PIPE,
+                            stderr=stderr,
+                            universal_newlines=True)
+
+
 def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
                               connect_stderr: bool = True) -> Tuple[str, int]:
     """
     Run a tool and return both its output and its exit code
     """
-    stderr = subprocess.STDOUT if connect_stderr else None
-    subp = subprocess.Popen(args,
-                            stdout=subprocess.PIPE,
-                            stderr=stderr,
-                            universal_newlines=True)
+    subp = qemu_tool_popen(tool, args, connect_stderr)
     output = subp.communicate()[0]
     if subp.returncode < 0:
         cmd = ' '.join(args)
-- 
2.21.3


