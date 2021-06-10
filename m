Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90F33A2AB6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:50:16 +0200 (CEST)
Received: from localhost ([::1]:36112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJCR-0000rS-NO
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqD-00042M-4y; Thu, 10 Jun 2021 07:27:20 -0400
Received: from mail-vi1eur05on2114.outbound.protection.outlook.com
 ([40.107.21.114]:47549 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIq2-0004ZR-Ku; Thu, 10 Jun 2021 07:27:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUKHqolcU2I+gQPw6fSb3D0YNAAwrWqWPhbSVGt4p3v4XcAksKGLUCvZbYxZn/bD+76kMtebu0+YHz//47ZEDBmpRhBEh+uhPt6GWMwib3ZSypmVq5fdra7WyfOorrt3XNoEP/GsiREV8U6JQZ0mvsTxhiwoelOVM0c/J3omkHtYkaLs1Hr4qRzVPFfI0FQyjIeymOoDyEENE+UcLLX6GAPfSBW8QhZzqtZLP+tPa8GjJcNKtiBdNUrc//3yWmbHcqbs4Jn9xDbFYQqiBDH4P3gAi3hPRfF8QTyqE7BuyV0+dcxH0S+GgRm4CCQ9W/d2yxTOE/TWs+N26Kcp4UbgLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMTcMHw8EkcoqkoUzlt0w065etXrkK4Q4JWP+sNR5E8=;
 b=HOOUeOGCUD5gbQB81vchJJC6sYCunFKDKWa1MnSM0HwCUyYHPBo6AQu2Q5V4Lwy2mEOKlQq2bGrX05gG6p9VOkHDheoCWkGIYjFg3afFySjk0GTyjsx9/QnXGqd3/ax/tBTvhTjw5N9MZXSIYblVPSV7CkjoY465BT6HP2XaETwpjgo72+GQ+LagAuIHDGKDLxWWeOutnry0UpEkDVsxnp+BqDRgi4i4xf00IFKUg/yIZqTmpfKfLfNeLRo/tYCWPFruROCUaZvXELyrCQdKBTnXyYuN6ZY7N6vKel30EGFnoEdsuqbqMqAM8KLMymCLfcC1bKz6uEtRTgjucT3ACQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMTcMHw8EkcoqkoUzlt0w065etXrkK4Q4JWP+sNR5E8=;
 b=wqLdtLnTbu0luSsIEKA8VDDI2SXfOXaKUOuXw+B0Fbd8fwaK5Qdi8tDLxX3V/Fx4fOPAfcJcDcb2kV3UHVy4/JD0qXkKl3ycub3ItYnUfPRc/Er24h/SB5CUM17usvYJL3d3ybGYUupBDp1Adh6HGTfj+PcLpGt/FHDbAjLduWU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 11:27:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:27:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v5 25/35] python/qemu/machine.py: refactor _qemu_args()
Date: Thu, 10 Jun 2021 14:26:08 +0300
Message-Id: <20210610112618.127378-26-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dad0be4-5b5b-4f6f-4971-08d92c02aa04
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB62800C8EDBA116A43FFDAF77C1359@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xHdKoWGKdDFJXcuiwjPpztUFeXyafd6HkSpLTYYWI7UYUrOkdhW3UuKVhU/yQ039d4JvBM6NPwG/UpBcdLRMNZKREXMqu/uL5tV4lNSQ2BHo+H5YHy7FzWMg/X5PkyGboEUGvjIpwTNG6pEKefC3C3LGfFJLbH3HYd4jXDqP2a7WKBPJQo5plcF14ntHZrkr0VTuTJNfR4V7kPcvIDt4ZlcpyP+w8xMHTXMNFjyqdWZmPXtExKA9cc2OvXnOaM2ONaNQps2RHgw1p2ANdTjcmkxucraHz+hGXvDZmpEHpJOk8Df+kHcNZvkOUsH4eHahAY1nKzl6y+H3hhAzBfVKybVeq9Nn9JcNcI9ff4KGEqwrgoTDlJaofCkAvfj3vmvGcfBMJdD4uaOFkdEZsONRj70c9TaOuwItzvMrpXHMKuRNVXQ2lOrn/v4wUw3a1CMAeQOmMJ7u20+HXB2tnqvEL78zHtK4urQx7VTDSk9sXFSo/GJaDIuWpHYzCCI1aT3RQLfKsRNlg3woYsDUO10oiI73ZnXIdGl8+ROmigP77n1SANBArs+06uH4OQtAMU7/ezSv3pEQH37CHtwwRVTJusmKHt/gknnvi1vvK+o4j/vzcXbR7WcprCZiTZF9LNrYgGwLRj1chK9sDBwXYtcdF6hTdvN2oLiurg+V52ey1LZ98pdwO0YhNb8Xoz8XCLpV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(136003)(346002)(366004)(186003)(26005)(86362001)(36756003)(6666004)(54906003)(1076003)(8936002)(4326008)(6506007)(6916009)(8676002)(16526019)(6512007)(52116002)(38350700002)(478600001)(38100700002)(66556008)(2616005)(316002)(66946007)(2906002)(6486002)(83380400001)(5660300002)(66476007)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vI7oarWnNIFIkz2gBdtA5mYXRD443krZ9mOLe1MLESuu3b8sgUOX2OoF/LAC?=
 =?us-ascii?Q?oRwSVaGlq97Q/oVA2ooS6okFkT8sLisRcGCAgU2XQoDHV72qoOB2T2zSP9pK?=
 =?us-ascii?Q?mwcUOqytH4Hn9ieF5hL2J13ZgnnqV3+XAJeEyikV0fa3gpFAydYkt8aC/THZ?=
 =?us-ascii?Q?t2V5d93gvvy47n9gkPeW8DnhokiGkpjkZ9e6G6Ffk9q/zIpGQboWt9UYWdOy?=
 =?us-ascii?Q?jGOrWB19OMyEmIpuiz9Ib7ZUz7YcdFqkQIwTTvSI1Xo0OR1wEiB+L8qLXKRx?=
 =?us-ascii?Q?dMzD4uC+UjCA9G23OY+M5uD6jjMaphnOC/SzgddZJmu1ARBJHrf6HcZa9d6/?=
 =?us-ascii?Q?C/1sblsrRZz/xuAIM/qwJdYQrBExClq2bkklFmvjmxnLG8BaKK8U1T83pXwJ?=
 =?us-ascii?Q?uicM6proXAtPoi5UtVZY3i1Q2pFPb/jInHIecB7OBkA0HREaApeLQm8wBc1i?=
 =?us-ascii?Q?JK6W3aQVVlejAHAf6N4OrF5Ziale6kCZtwmdq1gi2YXIi9lyBVp0DrBYmpBL?=
 =?us-ascii?Q?yGn1lrKW27Ska8lihBQfnVwsrRjtWc0VQpBXQa8bxRHVHfSzL5Upq59iUpAV?=
 =?us-ascii?Q?9jxE1vSvX/JPnJHl0zQf+EZPF4pemUXvh+D0d1dAw2d7nqVQoQ1uxkzBtq9n?=
 =?us-ascii?Q?OP6r/qRaLlxrLQfA02CPdr+HGGPXpyM0G77EIAxaVvTUUjG3omuf9XWPtWI9?=
 =?us-ascii?Q?DwwWPDsLFceKXy3gbtD/CdyAhaRNRX64vxd4V2bhCLxO7T8G+AGZ+wTHBRoj?=
 =?us-ascii?Q?2cLK/x5Ht5fbKWxfVR41/AT+XLm/Vr7IOrXNingMG9vBz43lbL4R+MQlvWTd?=
 =?us-ascii?Q?E1b2/42M0ab4f0nh9roSgMHsjCAnT+jHpd9B2BqxLnjrvoQTE4C9wh265hbQ?=
 =?us-ascii?Q?32Hx5Pc/A+kz90XtzCuVZvZWB1QqBGM2aCWVHLDS+VD0eT7Rx9mx4bGih9C3?=
 =?us-ascii?Q?a73XxQAFl3OCBwmGMvMOHWEakmLtQ3HgAV8pykIy3LUkjzermIfcArS9KiZU?=
 =?us-ascii?Q?dRtPXQrX0+Od8ECM4R0+JxzS0lBKO0AHDsSiihtvt4GXH2H+xymyFWPlDcIt?=
 =?us-ascii?Q?p9pMEECT/JFl5a4ihHILOGjTvz+5L4GXAJWXt+UbjPHSGyX610h95Md6wXF/?=
 =?us-ascii?Q?8OVn5N7/h1Dl+35FTEtS/qL0mZgLLPFsr34JJjWqUwamamPdU8uAIB6ebOOA?=
 =?us-ascii?Q?6+VKBIpFIStjlYDrC/68kYa2xHGLsPxDcdy4taB4VmGONjSgLmAkqXpKbniE?=
 =?us-ascii?Q?+31dx2Qmxfrzbe0PyVAeMrWi5epqjN/M48js7Lks/HYwfzf3T+80Y8U0a7Aw?=
 =?us-ascii?Q?QRmktjLJFjKx3v/d6740drEH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dad0be4-5b5b-4f6f-4971-08d92c02aa04
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:27:00.4785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUp0xZiW7s3uxZ7PtC7EoIMRx63uY2SPELuPuaAEX/SPApMQf2KdRY5TBWhdUEFaeJbLOK0JMW2E/LwSao2bm2AK8Oh4amQzbearN/M1uQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=40.107.21.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

 - use shorter construction
 - don't create new dict if not needed
 - drop extra unpacking key-val arguments
 - drop extra default values

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index b62435528e..5c09f50ec2 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -553,14 +553,12 @@ def _qmp(self) -> QEMUMonitorProtocol:
         return self._qmp_connection
 
     @classmethod
-    def _qmp_args(cls, _conv_keys: bool = True, **args: Any) -> Dict[str, Any]:
-        qmp_args = dict()
-        for key, value in args.items():
-            if _conv_keys:
-                qmp_args[key.replace('_', '-')] = value
-            else:
-                qmp_args[key] = value
-        return qmp_args
+    def _qmp_args(cls, conv_keys: bool,
+                  args: Dict[str, Any]) -> Dict[str, object]:
+        if conv_keys:
+            return {k.replace('_', '-'): v for k, v in args.items()}
+
+        return args
 
     def qmp(self, cmd: str,
             conv_keys: bool = True,
@@ -568,7 +566,7 @@ def qmp(self, cmd: str,
         """
         Invoke a QMP command and return the response dict
         """
-        qmp_args = self._qmp_args(conv_keys, **args)
+        qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.cmd(cmd, args=qmp_args)
 
     def command(self, cmd: str,
@@ -579,7 +577,7 @@ def command(self, cmd: str,
         On success return the response dict.
         On failure raise an exception.
         """
-        qmp_args = self._qmp_args(conv_keys, **args)
+        qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.command(cmd, **qmp_args)
 
     def get_qmp_event(self, wait: bool = False) -> Optional[QMPMessage]:
-- 
2.29.2


