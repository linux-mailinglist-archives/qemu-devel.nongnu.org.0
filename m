Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A944047C0DF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 14:40:04 +0100 (CET)
Received: from localhost ([::1]:33342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzfN5-0005fV-BF
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 08:40:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzfLQ-0004Lq-FS
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 08:38:24 -0500
Received: from mail-db8eur05on2111.outbound.protection.outlook.com
 ([40.107.20.111]:37729 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzfLJ-0001SQ-Bo
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 08:38:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSMyfJgw56PWNlYgf7kRtGowdNV6rcQknsAx4RYZuMNGVs9N28Giitj9UZAgv13dFU4ILMJFaMI4Kak+80NHtp6CeW9Nn/2HT/XpqznSaXH7NUgejClCuTVybezkMGILQAtCev9PisONybLWFlFHnWu4WL80Gylk+ZL1XgFJgb6Ed0lzMoDugiKX3eDxI1++2of7zGizLjZ3LQ/Yp8sChkF1LlwYOz0lxZyrQ4KMTwbb7lUYU/8vKTwobRo8/GYGGRsPoOn9LLvsDciMvPkvBPfyW9ofAYNV4wsEFxn+LkroV6OVrZlSLtDoLrQjUPjIyXV3Bj1Xc6I5fV3/fOyP7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQuXhDnS0os3JLzBsaW06j4cyyEpyj5oHFcXaPRBqGA=;
 b=AXkq1OJiQiJBinwwxobntGEa+OcDEvNrOqSbV09WRPs0c1QraP2bkm79LCHhqULrB0UKmNydg62Mu2nGTiE76ZmOph8SGm3629gQ2Mk6FXGvNAj/BojXVeYKRpXyG9lQxlolgredwcwQlt5D0R7LCfCmGKY7JUpdUvQKHsarfX4ALauLVy1DJ/7WsYyVpVG9ssFcup7czW2r7rdF4iARvV8ILZ5/131vvk3h8ZvEH9MeZ/bro+EpHIQtnLz+3qmhRXOCFeuduH/PAewv+48deW9G8jH8Ig+MtKtzV+HSFrdBy+UrUzBiYQcNAgvd2oxBWrkwvbKgYqreP4aULCnQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQuXhDnS0os3JLzBsaW06j4cyyEpyj5oHFcXaPRBqGA=;
 b=E6xraK40O7KHj7dzoVKQmskHbbS8PZFPcsxEtlQNC6AImOd7KGw7ercGFOpZvGC3TqjbiVSNRSjqGycCOObda/BiNeKsZmXPgYn8CRbHRdZg7fCK6rXiBq/Bgw0W7Twm9P5KCSfjGrkDADgQ3Be6WRfgvFPHoBn/TK6f8kb8+mw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB6PR0802MB2408.eurprd08.prod.outlook.com (2603:10a6:4:9d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 13:38:11 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550%4]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 13:38:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, armbru@redhat.com, eblake@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, vsementsov@virtuozzo.com,
 bleal@redhat.com, wainersm@redhat.com, philmd@redhat.com, crosa@redhat.com
Subject: [PATCH 3/2] avocado/vnc: add test_change_listen
Date: Tue, 21 Dec 2021 14:37:59 +0100
Message-Id: <20211221133759.6579-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220154418.1554279-1-vsementsov@virtuozzo.com>
References: <20211220154418.1554279-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P195CA0043.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::20) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04c71b41-27c0-4ee2-d36b-08d9c487213e
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2408:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0802MB2408E026722DB493BE4509CFC17C9@DB6PR0802MB2408.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A7zxiBEhw4YoqMOkwVUNLqlTpXV2aw2DKcjI+7L3WHcheyHGSdSv+5ZNTLUY+ALqyOoQCRIAeuvYS7Wa6FOE6/plvwW2hUrjTV/pagpzujroMptpfmbBMLOp+efxLGADmhVIP26owdI9tVTvH0c1BnBLWgBS3AGuew0G3o9P0g6AomLWUTg22uK5eK5QxU5Jw1CHqZCqcXT+3acjlu5sDN3NFJNFg41RD73ICs9RcE8UizmStr5+N52M7hdPU3H8ibRglp4QHG4dn8aaGISIUd5vMC8l96Y7nbT70ikvRfy6uozn+849milG13l9M1tLfiUlIDTBJZFbsE4kD1phE3LYnKA7fo57lKlsLUAwGUbg9s+Edn9p07HcpKBdgCUD2ks/C40YB90wFyUZOwHtSOF7J9axwAeyUgOTIxDPWPzdlti2vLruJdQwmemo36gA8ZCUPLjeGJpohuR4f10g9ySs+Bi/I/I+R4qu6gUAgp6RVPFXvZ7bf7LF1pafW8PKIzk1xUFm1CQQMRtp7vHyVQ3bKXfcokbtE1FhYFIcA5KPZ0g1xfrZykXckX82Qbwq1Q7lu+hXfOuOr5NqP502Y378TI+B5Fbl6USELq3MiWzg+LcIbevBTHxYE3VG6CmRwwFQUMMBDUBfXvi5U3mr5Aj6En/Yl5pEt/QSEb/KDbisA6BzFEWWgFcFJS0FCFFwyjDd1T8fgh2wxak2BX1ZmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(4326008)(66946007)(26005)(6666004)(6486002)(86362001)(186003)(316002)(66476007)(2616005)(83380400001)(8936002)(8676002)(2906002)(5660300002)(38350700002)(38100700002)(6512007)(6506007)(508600001)(4744005)(6916009)(36756003)(1076003)(52116002)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5PVTQdK0kEzqw20vhRvGMaZrCryn87ppsXy7mldGqJGa6rxztOquC//h6ESq?=
 =?us-ascii?Q?XtVIITAo2GF4HLwjvCDbyffE2NwQRijPpvoHdGAgne1apOuPoYzIDVRzTt2j?=
 =?us-ascii?Q?tVLhmpjCdhHQwTRHKpUeefdfR3S5rRn739oah7QpYMQeiVefiXcN0Ysh1AQP?=
 =?us-ascii?Q?xNupz4YcicuPgFOhEleQh8K3i/H7gqVvnSHmiDK0zijpsjro5yOOTvnbb86h?=
 =?us-ascii?Q?hmgmV1thLvQaoPwpG6xXDTuMsvANO6SwjABYVWE9GxPZ/0YrTHD2MYB3I/z/?=
 =?us-ascii?Q?wyrqmBapfo4uZ/QXy0RuGeGVXTxb19ydvaCoyYrH2CUhGwGJV7wG64HwdcFM?=
 =?us-ascii?Q?OyQDgQvYAyayTsyD1oYiTHzN4IeLf9stOPMHVN8j16H0n7rp/8YyqKRutsSC?=
 =?us-ascii?Q?PR9fQ3frPhnDw0UyUuHTTu11QfGWYuJxxla2mhJAVQJhaVpPLYDsByeHxDAr?=
 =?us-ascii?Q?3uDu5vl8mn9PLMfC3UBmc0abRdxdXHD0UTHzc9InwuLudxdbfs+/ssOVshFs?=
 =?us-ascii?Q?LTIHJt4QeZbDB0xcwcV7wWM3SBdSkX580G+y/f4uyMO4ZQJImixdkc33mOL4?=
 =?us-ascii?Q?NCyFUMenBCdLWhMER2PbQcdzzJ0oBuKDOe40yxM+E3/BU1n1EsvyQedld7Bv?=
 =?us-ascii?Q?nMxowLAIwgaiMO0Y7Nm/4Ep09NGyyakB5K+J4u23zIWOcx+Lt9NJxd1wvm0E?=
 =?us-ascii?Q?nQRhPd7ATDHKnCGNRoqZ+Gi5xJqW7skttf0CoTGFv6rhGetCaCZ+zENvSpbL?=
 =?us-ascii?Q?Z3b4+30fSsGrV7f7fEqmO/g/IwYa2u/DCtWLhYJL3tNOOMvPZe6re/7gw0Sl?=
 =?us-ascii?Q?EcEiw3m5yGCjONCq6S8DVl1S9YXbFv64E1iMDDCkvI3nwzJx8hqQG0pcyTUz?=
 =?us-ascii?Q?O6TDvRP8u6ZEy37/ldVuz0M2o3DlPhkTd5isXPWZ7mvsok0MYQu31b+Sc9nb?=
 =?us-ascii?Q?pufslcL0OwlveLz4iJjspSlx/C5smu27XjoD8ZX/4w9fvrieuQ6dze9Y67fN?=
 =?us-ascii?Q?VMbBWkc6dkyqar++g+o03zbBWw11A+3lws6ERnlbC28MfiYsq09FzIK3Y9NV?=
 =?us-ascii?Q?5K4CmT48GPipdwTcfLgX1ox11b3hnIhCSE8Z4Zgkzuv0UO6NN41sjuZ9eD6c?=
 =?us-ascii?Q?9fbE07hzS6hjPXNch3EIPL9wG9mEwrPFLdrI09hR/SEza8W0FgD3XcQXHCwp?=
 =?us-ascii?Q?rd3ecKqkyeyYuuPg9V5mW+vD4DsRhN9cnd3lHvtFCpg+qsY6BKvinkwob8p2?=
 =?us-ascii?Q?LplqjSpLclw4PMrqG3HOVoi0baUNMUkszmbJn+4KmJdwEQJd5Ihcgzclnhii?=
 =?us-ascii?Q?3cHlxMUtRqU8Ha89Yy7sZWq+mklaeQurLZ0ZC1b+augT58Dk4ApDbjbjbA2c?=
 =?us-ascii?Q?muhdwUuKyfBDUBoqWdMmmWBehiIOO0DhMaT7/1VqCJZUGZsRr/5mLsYluo/M?=
 =?us-ascii?Q?C8xZjEg9jcc+sCHmmR8vxtwn9qyoxZ1wHiq5LVEu5cKaqMf/0O0Wvl6KcnKU?=
 =?us-ascii?Q?2sEGzshNZlGp0ywXiCHAW5ingswYgY1QwSiaVHcnP2uf/9wIT99+iI9Kg+4q?=
 =?us-ascii?Q?ORzLHqI9R/DNXm38pmRKa270QpxLRKdUk8XKPD7dlAT5UhSQRiExDRhor2tk?=
 =?us-ascii?Q?XLElYbgy9RH1gZqv2kfRWWeqIaKjbHH0jEpD2GjNAaXSIlK51XnH7OCYZnY4?=
 =?us-ascii?Q?Lx6betNOb07C89Xd4vjPdDsOfis=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c71b41-27c0-4ee2-d36b-08d9c487213e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 13:38:10.9842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: doFADI4Ezd/OIStiU905pPJpyTh1Rmr5I4Y3noIG+/7L+OgvrN3QCqzTAuZs7SRds3Qp8zD/veQDNL3VJEj7Zqi0DRfwbjEk/OtSdlm/mGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2408
Received-SPF: pass client-ip=40.107.20.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL=1.31, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Add simple test-case for new change-vnc-listen qmp command.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/avocado/vnc.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/avocado/vnc.py b/tests/avocado/vnc.py
index 096432988f..f05ee1e00a 100644
--- a/tests/avocado/vnc.py
+++ b/tests/avocado/vnc.py
@@ -51,3 +51,13 @@ def test_change_password(self):
         set_password_response = self.vm.qmp('change-vnc-password',
                                             password='new_password')
         self.assertEqual(set_password_response['return'], {})
+
+    def test_change_listen(self):
+        self.vm.add_args('-nodefaults', '-S', '-vnc', ':0')
+        self.vm.launch()
+        self.assertEqual(self.vm.qmp('query-vnc')['return']['service'], '5900')
+        res = self.vm.qmp('change-vnc-listen', id='default',
+                          addresses=[{'type': 'inet', 'host': '0.0.0.0',
+                                      'port': '5901'}])
+        self.assertEqual(res['return'], {})
+        self.assertEqual(self.vm.qmp('query-vnc')['return']['service'], '5901')
-- 
2.31.1


