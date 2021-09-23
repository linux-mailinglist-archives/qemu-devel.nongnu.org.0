Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30942416640
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 21:58:16 +0200 (CEST)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTUrC-0005vV-4x
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 15:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTUoR-0003pL-KB
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 15:55:19 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:59503 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTUoN-0002vM-MR
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 15:55:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epG/CbgQSUbD8FRIY4MOmKb6r5DA1X21P634urAYsT93xPQ0sHnBzckDyPqvxA2vhqVcCA+Sz2Mu3r6LUOCdB7Z+CQIB35j7jZ8Q5zKYUq2cs4hcRVJvrd+QHN+cDqtBuYtQahn/nmFjdx0d382YGW2FBDRyI/D6fdfxq+MQ6QN2xk8BIJWjA2jx6+KeMVK5hRs9z636JxrjdFk2n/ccORk9vm4+AyhZmnYUl72n23Fs02mYcPcXiN/7jWapgrolJSRm16gfH2SdkCSBWZ4LRYa1x4q7TectELq3CkY8MLOjViNIDZwIuuRGiPvwROXF0dm9h0ZWG9Aa4ivc6j41/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Zn4Rj6hJhXUTdMBpQN1TmWTZh+eTAAs8HnPBLKENpZ4=;
 b=VCRcdTPiuXCPxubCQ+jx3JmL4Nul2acYmbZYLWmQ9P+NVLw9Yl6gsZACeSAQbUWMbRauUwb4X7WpCLAGU0o2amPxcctLuKqQ4vD4ncuQouBtlZ8VIN3nzJNxTMKuxRDyAslS9WKLL1dquCwILcHQPZimSEyHZQqzzIyElGtsp0Fc/diUUbNcHa38veC5uE8Gl51I57KExzB2DyXuNxCTgaQez31WvqlvMc4jwwQXjnR8OLeJocBPYF9NCMCQ7EbyDPcoxScI3hDIfc/Is+OEPAhJ+UzoJE3h9CEPyoZd5fAwpWfVOcsxQ+KaLnY3OafSqJhZO9upHrcusjmYAKSC2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zn4Rj6hJhXUTdMBpQN1TmWTZh+eTAAs8HnPBLKENpZ4=;
 b=TsJ1b0ZEpW2lZsCuIrNG1x3pMFjVsxZy64iTfTcuvhYiSvEefYFOcd1g16cvWFli7/N+nHVuXmYMbYQAfdt2kYR87nxAZ/TSOUNQbHqCy6PZLLEtkTKA45cHzr1D+ExBkfoYPY/7OcMk1vz0WB94OVlH/U8k8n36ngqEkUaP+CM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3224.eurprd08.prod.outlook.com (2603:10a6:209:47::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 19:55:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 19:55:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, pbonzini@redhat.com, michael.roth@amd.com,
 armbru@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 1/5] trace/control: introduce trace_opt_parse_opts()
Date: Thu, 23 Sep 2021 22:54:47 +0300
Message-Id: <20210923195451.714796-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210923195451.714796-1-vsementsov@virtuozzo.com>
References: <20210923195451.714796-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P18901CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.205) by
 HE1P18901CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14 via Frontend Transport; Thu, 23 Sep 2021 19:55:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a19c213e-53ef-427f-076e-08d97ecc0adf
X-MS-TrafficTypeDiagnostic: AM6PR08MB3224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB32246D45B24B4A0C045A4A4BC1A39@AM6PR08MB3224.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LWZaC5ibspJFBbl3sBV/qVou9AK6KPuZg7rSm5uOjRQqasT5dEJPRgDMdS1gRhnRtCROI/7dgzMKLlmiWRzoDX5uSc/0NIO83vyOX5lMViMYyLMzc183HLrDMQXFOJ1e3TwPsYq5IL5oaaD7G2JgnpXud5xQo5O3RSdSptezCkeOdGDMC8fLjl9rWQXaoASuSv5KAVsMOAU2i6al0Aelj95D0hNEEsObW5qLuD7g5V/GyhiOnJkqmgu5nZ3he4go+xRHh3o3qMqoZV9dkLfrbrJ9VEOTCEcNWgCNJ4QK8lAhNfOBZOqkvVd2E973ylLfdSV1TXJa1nqkSwW6iUQgzT5EqkIA+ln3qrd6Cg/ES/2aXQZMYdhOh2Ao8pztfsxBasPpAA/71AVqpWixSC47x4SIIenSQvAyFPoDXVaQb5QvNzARWnVZcRyynPKcxUORdcf3+41B4Oamf70E25t4qaLI7OPBK5olgDJk91h9DjXqkA5JZNiga/EpizR8JC3P1LLdg0bFmiArka7C1Qui81zs+99D1oHLbnJw5TkQw2eYExhMzYh+/dDrSTsNcnVYkYBlUC72D9VzS7197sEHCmqSEC6l3cV2LKs8kTBObxt2jF0tUxnXKxelxIRw+yMe8SstK/r9IQPFmgkSXFyzFpy3Q1PM31XVbRkiSIrX/XEX6a3YdhPzKfGsMr+rNeOq9o83QbJMND4/QlDKshIY7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(508600001)(6486002)(5660300002)(38350700002)(38100700002)(86362001)(52116002)(36756003)(6666004)(66476007)(186003)(66946007)(66556008)(316002)(8676002)(8936002)(107886003)(956004)(2616005)(26005)(83380400001)(1076003)(6512007)(2906002)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gmN6HnlQ1hdpje3h8Cxi7/1dnw6ZRGb5bARXTFkt6gbIIRGmahtChFIeo2n/?=
 =?us-ascii?Q?JyQqzNZr0CY+PZOOTrg2M9Dh/kt2P5la8t9g6oc+W5EhjydlLdQHT1CaYBB2?=
 =?us-ascii?Q?kXLqmqsOGyNUkbVggF0G0Kft2jaL81IulfQLxSO4Z/fVXxlqc5WgNIk+/vXP?=
 =?us-ascii?Q?dbomJELVOgmisNEJlbZ54xPNFzUO7mJt1m5tHy00zTrJe9lOdMnNgJnpQiDO?=
 =?us-ascii?Q?TL+fXVs/Wy/8p85ial5hjUbs0rgAHuXff51iLsZ2gA/A29zr+x0Q1tMiCU3E?=
 =?us-ascii?Q?iT1kt7MV3c1EAmA8oGBJDi/b5kpjW0qvytJe2lJlfxg4NNyhTf1JrGCIJlmR?=
 =?us-ascii?Q?X8YduK8QSsHC+MLPFYZb4DSod+iMGZS0QsPkdx2jB4c6gidrkhPEmgWKxMRk?=
 =?us-ascii?Q?PFAxQHXHkD53DkhgbKQmKe0yZpcc2GUH1dchSMsTcqmS0PerkVdaW8yF9Cbn?=
 =?us-ascii?Q?lg6Oy2SQizQokQ8Tex27ml3Xh0lnNmYWIs2PdNmEXnr2aR7fz/a2RNU+skw9?=
 =?us-ascii?Q?3WO5R6R/QJ/4cICpF3+2bDfJhnEK7tuAaoF4daUmL28mjykWtHslOAcqY+uH?=
 =?us-ascii?Q?UrVnE0oi6d+Pz8XDViB0VxCxtpPdeFfDkoGw+dsYoOnpllBsAt4CCGQgmbr9?=
 =?us-ascii?Q?bqVVGq3mgXFkDcO2VfOo3Juwf2gIJoLtU1qTWV7pRdZkuzquNwB58w+548wq?=
 =?us-ascii?Q?Jp1TLJ0ZvgFmYxH/SvbHCXFhoRxFqPLkz8A364ZRt0HDGTePC8QzDQM/9gwh?=
 =?us-ascii?Q?t4OMHWdK2a7JFe8fH0uiJeAD7tHNw66KVzBPAyUpq10oZwt7LqL81Rx6T8zH?=
 =?us-ascii?Q?0nU+A9k1AB5Aiq+KO5dCL/1/PC9rDOn9dHes899/f7b6m8DcLwYrM0AT2aGW?=
 =?us-ascii?Q?4sNsqohRNo5rtG4qtqZiWnmMTCJN8HQv+w933tdvk8W2ujnB+Q+L1y/D7U3y?=
 =?us-ascii?Q?H1lssYizoFAldV8zxNeqvlwAhdCQMYLY3EUAkuTkCx5IU0usG5vaeHt7R2Ye?=
 =?us-ascii?Q?biI0XldqLbhbJaHrHcCNtIobw0rMkRtXISPFr0LDI5HHIVXyseKdarV6KFv9?=
 =?us-ascii?Q?Qi8EyGzTUxWRcNewCtTLnfi+tkTh/OD4gZbijJg1/8cg9V1Z/dXaTQAVNewo?=
 =?us-ascii?Q?Qekml7QkRwx2es6gfI3YO7Ij29XTSiJvgrg2c7qyhPQHsoYZ2uwmISCFuCHJ?=
 =?us-ascii?Q?kWNDOcUBADmIYigQYJ/15r6aGPl3WVeJ/HkwyArpRdLVx/8eoQLJie5XzVBI?=
 =?us-ascii?Q?3dGEXqcWIwwxYCx0ZVKOgpRnhcixe9Exc8h76lndM7JcXOTqW6KtkE9Upy8T?=
 =?us-ascii?Q?kWJVksTnzLZfOsxtPajkEdhM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a19c213e-53ef-427f-076e-08d97ecc0adf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 19:55:07.4883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5q6NZaclTCpEP3KgZVa+9zkoArhsmrPkOapPHBUrbCB2i/MpCkJMsnv8MRju9Ku7d/6ofuNjm7vNeBHL4+YZ8/FbYdOjDe75+qvffOi9N8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3224
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Add a function same as trace_opt_parse, but parameter is QemuOpts.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 trace/control.h |  7 +++++++
 trace/control.c | 18 ++++++++++++------
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/trace/control.h b/trace/control.h
index 23b8393b29..fb898e2c4a 100644
--- a/trace/control.h
+++ b/trace/control.h
@@ -251,6 +251,13 @@ extern QemuOptsList qemu_trace_opts;
  */
 void trace_opt_parse(const char *optarg);
 
+/**
+ * Same as trace_opt_parse, but accept QemuOpts instead of options string.
+ *
+ * Releases @opts at the end.
+ */
+void trace_opt_parse_opts(QemuOpts *opts);
+
 /**
  * trace_get_vcpu_event_count:
  *
diff --git a/trace/control.c b/trace/control.c
index d5b68e846e..4bcbd96511 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -313,13 +313,8 @@ bool trace_init_backends(void)
     return true;
 }
 
-void trace_opt_parse(const char *optarg)
+void trace_opt_parse_opts(QemuOpts *opts)
 {
-    QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("trace"),
-                                             optarg, true);
-    if (!opts) {
-        exit(1);
-    }
     if (qemu_opt_get(opts, "enable")) {
         trace_enable_events(qemu_opt_get(opts, "enable"));
     }
@@ -330,6 +325,17 @@ void trace_opt_parse(const char *optarg)
     qemu_opts_del(opts);
 }
 
+void trace_opt_parse(const char *optarg)
+{
+    QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("trace"),
+                                             optarg, true);
+    if (!opts) {
+        exit(1);
+    }
+
+    trace_opt_parse_opts(opts);
+}
+
 uint32_t trace_get_vcpu_event_count(void)
 {
     return next_vcpu_id;
-- 
2.29.2


