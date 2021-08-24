Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95B63F5A15
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:47:31 +0200 (CEST)
Received: from localhost ([::1]:46052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS5i-0002py-Fc
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyU-0003Iz-P5; Tue, 24 Aug 2021 04:40:02 -0400
Received: from mail-db8eur05on2134.outbound.protection.outlook.com
 ([40.107.20.134]:13121 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyS-0007US-OM; Tue, 24 Aug 2021 04:40:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZAfzH9rE61wd1lJSwRGgzzqmYb1r+bTocPPflDM+64hKovNXWeaEQK5X7ZJgHjmSyOkb3CaA+bSWs4+3mbQ8+aLOldyanVRajvCUhy9oLW6h1QwMsd6F435yrglyIrX68bM8nRCV6cjWqw8YdE9u2SzrhdbiW9BjBvmVtEz66qaY5q9tKsm8SWxRT3ZJWjSAduqt6x+r4nTlbxYmZuWF6OZIg6pahAT3IVEGA/oXZm9JSVwFf+bX2K5MGdTT5+sbH9KNz1Ncd7h2M7zmN2w2BOX5mCiLU/BVIpS3vM+5w4F+jWFi8DwpR9Mldxk0M9BUwiE2EpdRqm63q/BRYGk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJuVZ1kuk0Wl5cOGUuwIXKMMuQ9XY9UDNeImIl4AjmM=;
 b=hOuQiIt3+bJxbriKNpuuNR14U6uaeIGK2iMam5PhiTHRR0CjwtPuuKdf5zBwUrmhAwu0GqTfFKocyIV2Cet9+26BSY9GV2nFGO9IOgT/amAi0sWtuX7+jMusOElrE3EIdDIuLMRsDXUmRueqMlwbMxBxjuLZLzKOsiMN4P7nSqTuV2ywCvUkyKtk6GyD7glafBinnfsEmBhv6x9RFw9qU30EIk3wCq4AKJ+fcROs+SsDKhMwnhYV/ylMuNsR2zKE6qRmX9Vymo5jVSU9aMzfeGioMZoQldywjFoJ64fnZ96hPrUdjRqstj8q7bJOPAHCtPC1U7x7kAOLkYOCKU17ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJuVZ1kuk0Wl5cOGUuwIXKMMuQ9XY9UDNeImIl4AjmM=;
 b=dAuv8AN5Y8wQ1boqkeyYhNS4knc9YnrDMJ68n54ijyLdnO/y2X4ZXLZl5dhDtvgd5iAjIREH5nH4RRRhV0NUePU0YGbN2H+7mWHFGVh+jJcpKV9OFop/OVUHtxOLN1qrduycG64zj/F1J3JIgDLsJirOzeU96OyOLtcTedwVNZM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 24/34] python/qemu/machine: QEMUMachine: improve qmp()
 method
Date: Tue, 24 Aug 2021 11:38:46 +0300
Message-Id: <20210824083856.17408-25-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fed0eaee-a1e0-4892-fbb6-08d966dabcff
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5333A2FD0218CC46033BC9DEC1C59@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Dhv+RgylPKQSdKblwNPmLcoIEd+rGHWdUDCyQFAxAsx4BjNJOyUzou4JKxC8HbIsIJFlXk/TPAipCzt9/OJdwRbqWZwQiEZZNrH7rNE3JLTN9MOh7NIJD8oLf0QbxpNhm9l/YwNjZoacD384pwXMRAFXXVnMswq1EKdODFX7Gk658do4U3PnoNAyH+zCOfNqPBBwP2QzpoO42NP7NFwdfDNzxTlmJ/0oIJaSdNSS7bh3mZ3+8YDN8Mu3OC4MV89ftruI/peKwOFVgljSbq3etJ/Z1YfU3IDHc/jCxRLjxoYYReuNDEnE2yHQI9aOpu6k7lrRycomGLVZC37E9tnCuSZBcKTkZgucgpUGa19aWqP7pwjH7/AMuVTVgHa0LY8F0XoMmmPyOnfOw7tMXAll4gTbX11dvOi66cXi9mSGBBpNMKvmSlUj3PMEihmS+QpMgZr0RF1dnbqSxj2Z4mGtXxPYA3wDGAKdcPIX/ngHuVLUhAZ9RNdzCDn+WlcGiA0B7ViBXm+I5cEwrqzxAoW56Dawi3DHTdDs8Fj0MrnqEr0OvsBn3t6q7pD+62Uj0HPlATQEtRi6W3oP40aJzcXKPbZ1P6X4ANyFaHSccBRwarw9wk6Ix16KARzr7N8awlDWOicsQ+58CHPKL4woy3H1Rob1srxt2o3tPmY0nRxREb/oDktuycQVHXodH3280Q48XVizhDbfUIwCPVF+f+3/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(38100700002)(8676002)(4326008)(6666004)(86362001)(52116002)(38350700002)(83380400001)(7416002)(8936002)(6916009)(5660300002)(478600001)(26005)(1076003)(6506007)(6512007)(186003)(2616005)(66556008)(36756003)(66476007)(66946007)(956004)(316002)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6iQBjEPlHIz/uzsP/HKbUv5ilRxWOeBwqWA8FBn0goaOIE/MfbMwFJ2XUP+s?=
 =?us-ascii?Q?92snj/cvlR3k+8tzMUxcgyDUH7Y6N0/2/H7vDvBrq5x5u5zzaZK70vgx1utq?=
 =?us-ascii?Q?jU+UoknwzGkPy9CVYKmMyhRC+0AWw20aQFF6k+c3MyxqyFrhxJTKRwtzygDn?=
 =?us-ascii?Q?1ts0v6JQvHZwRZJhbhzqcRuFbPo3Kw37pP57flTiWnXQsk0Zsczgxjnk66Jj?=
 =?us-ascii?Q?gGml0NlN4V4OSrsJye6kmZPaE2ah31ua72R/YvUhs71t+vsbtqNLHRM0XMCk?=
 =?us-ascii?Q?n5ShezwM7Yitkh0mOMUG/cpEAKE2vCmBOTO0cVuxHb4FNcGWtY/1ViSStCYz?=
 =?us-ascii?Q?J9jH6SvSpW0ZYsDbatFwjmOzp/ah9XLurogL26CnKm1VGOOqgoMFXkzEqmh8?=
 =?us-ascii?Q?SeDzGyZd0hn7O9hoNjoiEK+uN3QS1AhP/f0CY1NM7LRZLHpXD2qqKHbZgdgh?=
 =?us-ascii?Q?Bk3kUmQBcSr7+Dk1/53vhL/T8AZxGNbXWIBm/0Z2XTwaH2Q9dY7mB8QBGMqX?=
 =?us-ascii?Q?AMBpTwRUZ38qp4LkS8bJG51ubj+qkV1Y+hIsmPU6YDY+UJuNVQpjnPMABdwC?=
 =?us-ascii?Q?L6DIh83jo+RBl3V5ul8TotlgcgpqIXHTRDTfWuOUYwBpRr3ejnQVmJTQbBsZ?=
 =?us-ascii?Q?t9VCTJ3e0U9i6LiGPD3041T5DKNekCGVMBttpgUGt+gOL21uZaELtdZiZx3H?=
 =?us-ascii?Q?77Tv5ba7ttNEV6IfgqCz/c75hUWaA2OyOI9uf0xJIP59oaQR8s3WYHW52sTr?=
 =?us-ascii?Q?gf9SIYNEFNgkK4XYqnmOchVLR4P/kwQLej+wveYpzj/NhWXoIqIC4l+ZiXSe?=
 =?us-ascii?Q?j3aYAz1QMuooCDqollMeUbfVgbNEIDzL4fS2cEJ/gQ14Mt5OQ6mfJqgBdgNi?=
 =?us-ascii?Q?Yutg6YuHFWhD/nY6IIl9MQgnE7oxutrJ4JFBId7PtGbHJsaVBNrJ07BEruEr?=
 =?us-ascii?Q?m8h2f4fvu3E0wcgNxkhS2v+vBiBb6Uvvaf3r26sNysbfDlI9Z1qF5WVfTEIv?=
 =?us-ascii?Q?o70dz0JZNX1NZCWt+bD4ujBBloYrQcTCcCbiWPc20wsPNLU02ZCkYhflsmWD?=
 =?us-ascii?Q?TLt65CEfdHX0PlyaMKalhQfChzfCQSI5MiXINFfKqjKmouPdub7pyAY32mNt?=
 =?us-ascii?Q?G6FIV7eijzVnMYOqrCwZPUXYMf60YXNYh+HPAh8ARdAgPPiOpVWlKl8moaPg?=
 =?us-ascii?Q?nr7g5aG1r9Ml1F1mBnKTKVxrVWs4jNaLBlLOAZU35Rw7dJdU8Q4elNXMZpkI?=
 =?us-ascii?Q?CGy8mpKXrVgRTToeh3ECBGI5UHLJIZKKoSW5by3VjINqt+Iu9WeETZRPQNtV?=
 =?us-ascii?Q?JNagdzW3vgYv04Pu8459J6V8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fed0eaee-a1e0-4892-fbb6-08d966dabcff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:51.0656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9QLMsqfdUESBp8B2PeUIAiGpCkY/pRERfuSffTj4vwJVi/NJif9xAy+Fjp49Z0SCYhUIdWi8DQs5c55Q4XZIvg+0OVROoU0CC0NFOYYDtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.20.134;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We often call qmp() with unpacking dict, like qmp('foo', **{...}).
mypy don't really like it, it thinks that passed unpacked dict is a
positional argument and complains that it type should be bool (because
second argument of qmp() is conv_keys: bool).

Allow passing dict directly, simplifying interface, and giving a way to
satisfy mypy.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 5eab31aeec..ce1e130c13 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -572,11 +572,21 @@ def _qmp_args(cls, conv_keys: bool,
         return args
 
     def qmp(self, cmd: str,
-            conv_keys: bool = True,
+            args_dict: Optional[Dict[str, object]] = None,
+            conv_keys: Optional[bool] = None,
             **args: Any) -> QMPMessage:
         """
         Invoke a QMP command and return the response dict
         """
+        if args_dict is not None:
+            assert not args
+            assert conv_keys is None
+            args = args_dict
+            conv_keys = False
+
+        if conv_keys is None:
+            conv_keys = True
+
         qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.cmd(cmd, args=qmp_args)
 
-- 
2.29.2


