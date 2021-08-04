Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFEB3DFE7D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:57:42 +0200 (CEST)
Received: from localhost ([::1]:43560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDef-0006dt-Kj
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMr-0005R8-Hp; Wed, 04 Aug 2021 05:39:17 -0400
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:62700 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMp-0006MN-QT; Wed, 04 Aug 2021 05:39:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/RacnOTISTps6UjWkkU40VaubIO4+lCh3Hesx8Fkq6nxGTcURS/EM5xnKWMZeOFfnsLmMy6eJ6t1326/2/5J6ZQja2S4YCM6LRJ8LiJsVjAaihIEevht/k9W5PGZsw6LhtOPJxfcfj5/xBr8rEQrqBmYqapEARmMYoppMpGAGAKhEBwGTnsGfNbADA96HmpOGaT0OBwbDv4uvcevrpSmhCRBa21onxNKgh5ykiD2wyZ7nLhFNpucUG5kciZkXIdOCWRFdyzUOVAdAZuuzL+gqB8cxOt2pXlz9LMUJxKKuC6JCTV/J/lxqZxOlWBUbXjM6iU6s9DJfaJYF37T+BwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FJWIhLdp3ZBunz4U3SknoYuQthg0pb2m2HtQWXoZ80=;
 b=YxO7soOHWF70xz9ebMz24cHqovJzU+TMqabLvb4OzQW45ZweZtmqzkgJZArDIQ1iQ/SeRZ0Elm5EKfZ4tGhWrs0w0ULmQ6aZneLCZfBztHqIUjHPYQhrodRiiywBKZvOBremXeyvwiKmPD+D2iRpwNgEb1qmGgh5RuFjLroZQWiRZAOtwPQjHSXgs25Aq6QjiAcHiFct+s7XHvCQiwZTXED47C742mZAXq2QWwV9aPZwE+k5Fn9pqtj9FUViufFAm9VyHzFp/MJtsKt6J/JgrEOjJiAC8JTpxFgFelsATzlaVEZ/664oV9C+U6yS1n06kRrpiU0iyCVSZNw6H7YGwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FJWIhLdp3ZBunz4U3SknoYuQthg0pb2m2HtQWXoZ80=;
 b=ZUvN+axca5sBjgFNqOUyYHGp07ImV81pc/C8oPPbdPnrUDtySZytkhcXJ9NcG5lSh2PluIRYHnkijpEfESFYiCsScL1SDR91QOf6WFmrX4L31ue4IT1Nb7XQMKS4/MGoyAVPyNf/l9vzwHXcbx/se7ZvZ99YG4MPBUAxVbea5Fw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 09:39:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 23/33] python/qemu/machine.py: refactor _qemu_args()
Date: Wed,  4 Aug 2021 12:38:03 +0300
Message-Id: <20210804093813.20688-24-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9527562-3a10-4949-4800-08d9572bb608
X-MS-TrafficTypeDiagnostic: AM6PR08MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46897216A678D3DF1973AFB2C1F19@AM6PR08MB4689.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o11070/+c/nW57+Z9l9w6GchscCPKRDPnfiHlw3E7JXstv4C6gSwAhkU/UHQJ5NjVovnpYFEAdAXJZ4W4/TSPzSI3vBVCC+27CPDGYBDajnDQ1lO8Xp4OaMQgNWs1UnAtt6ylrOFErVRuE44+FZtDA+bEYHiWfLNBb9xDO3oFeosDZCxbghMZC07C+Nj+XgIbKRO2WoQcJd6M6HTGefP0Nmcd9IDlpwt07u3sMg8wsJQK9L42xx3q7ZwXAgm5OcAH96KaOv40CYXqSkgObzcJELcvOg5MkbwaeKYAhBleYtsCCBBmZOkdNCyT38/jSYvtH+4A29HdGbPeXddVupOiFRmV6Uwf/UlpzdT2wbZAw87HmjZqN51VwyyVzU9glu1M0KF+6gW4HnltsVQfy2ZfLoTO78+ldlkkQpT3GBVVwnvxbdV6zjcH/TkPSOZLKNu7pxY29x7kGRY/oxd/PSMmkBWqUdnelFyoJBIh0STSih9mI4DM9fpnO9MN+g62NQl6+7+NzFy1mRXLrHUssd7YAmV0xSsVgbPFeLhPYRVLxNw+h+8x4WIV2d9PZbz2OoxtmdgjGlroX+JrRKCRUgkPoeWsyM40xUsQYrjcVld+7rC0jYY36d7MIqbpExt5fuWrGzN03sxSre9/63pY/ssv5CTE7JCCxGchrW6PiFB6qEZBs8C6L7jx/b9nMp09+4uiVhz60HSNKWwFAd3yyFT8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39840400004)(26005)(186003)(36756003)(6486002)(2616005)(8676002)(316002)(956004)(6506007)(66476007)(66556008)(6512007)(4326008)(6666004)(5660300002)(52116002)(2906002)(6916009)(83380400001)(1076003)(38350700002)(8936002)(86362001)(38100700002)(7416002)(66946007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4xi1d5Ybud2yxKMP+onLA8qdnEaxpSfdwZMvEybzwtsOg4e47HPMGOu/e2IT?=
 =?us-ascii?Q?FPYq4Wih541fPWiZb0mER+m0yY26a7Gkzjet+GY2ZhGaWXil/guPSo8cWpnS?=
 =?us-ascii?Q?ghSX7QIOKeT3Wrkrt1PTJ2PVZ4A4ipxUMqbz+/uaVbbsn97ooiieqsIif3zd?=
 =?us-ascii?Q?RBYlx4HFd3dWQo8u9DveegwFaaVi1z8LyUaiOgIdYVYyNVwlBx5i8M6x7R3p?=
 =?us-ascii?Q?RX3YJ/3MW2msdLzpBziDzVGQZOHO7in/0kz0xgGdyAUqGCLVKet4KDZ/IPXC?=
 =?us-ascii?Q?3b8tJbTf6IVbZfzx6DGPOr9SeWVgcMCkiGrKtWnWmB9FXwUeSw2bt2dxn1r8?=
 =?us-ascii?Q?vUWDsHxYFym4etywbIOufvoUVxtUuhrpeV+9DY1fc60LdWUP7DQPAOkbA5VA?=
 =?us-ascii?Q?jcGqKyS8Nk7b6Tiby4w9lU6rYK/2+b4LEBJUPK0WfClkO6cLdCj0A5H8aplI?=
 =?us-ascii?Q?1gCBtVSXeDrJupl59uMPXaTTCiZEd8ThRiOfRbhYq8RcrFu3AnEteA0IkBTR?=
 =?us-ascii?Q?EvHi5tI+ARdYGC3og8oJp7Ji/eh25zhMVkm50U8tDoaqnqM5ojL8WwKOiHIz?=
 =?us-ascii?Q?4Snphh14Q71LDpmas+XYd8PBVwpnQgffNFkxJjwr0U6wkgAEIFhxNiq1OceV?=
 =?us-ascii?Q?7w8RXhOpNfPxURKDmEP7FbfEFpNV4qRzr8koXGwe1NvLMpesIQus6wRRiOuo?=
 =?us-ascii?Q?TgAy/1HHOuN4ukIILnOVeVyz7uBGV2+bsjiGEdApQSu2f1CmMGXWDhTZLaiF?=
 =?us-ascii?Q?hwuDSAmNjwFg5c9B/UzXhOJRaS1kXj8VAtStIcWyTGOf0Vtp4ngY/TVveVWl?=
 =?us-ascii?Q?luLPf2E8CGZhvhbBe+qcbcVRp+HYBIx0S74dDOON2AjTWGOErU6ucvhl+uxg?=
 =?us-ascii?Q?uWWMtQfUJfFhMnioE0c09Fn4NTNtIA2UVzx4503boMzhLI2jl2isLUC9bLZr?=
 =?us-ascii?Q?/cVmA9Ld99OV+x0EXuhmbJfllUQHyFP312DMoBkCWr6vT6QglIhT9sro6nFd?=
 =?us-ascii?Q?0wyDCRqpELSIY+PCDmtbMeIJkX7IsEcOqtiaxi1QpslJ61nS1ShsgdCxUrzN?=
 =?us-ascii?Q?FkJya5vGw9Ep4I6pLBvwaLyzrZlY29ETjsqPlggi6fysUuOCJcmvRG6DHFDx?=
 =?us-ascii?Q?KgUuhGRarwday3qyxDS4l5JzPXGAbr7bLtA+869b6Oz1pu5FQuzaROXvjAwE?=
 =?us-ascii?Q?zbNhvG87QWC0FNIxCjxCdIHt7AAHFFsowM4fKBKQv1ky81K/i0uUvQFzyJ9P?=
 =?us-ascii?Q?5EiJs1Bqb70fR16HLrTCjbYSySQFqe7zu6DHiuGd+1amU+yA0WPDOmfb4Jlq?=
 =?us-ascii?Q?QLC4QRy2tH+lFcMg/wItnTVE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9527562-3a10-4949-4800-08d9572bb608
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:10.0445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmKR+hqpXPDwE8e4RIEUz/DGc9fRw0kFUlbzWkpDHYW0E2FM+hC+xEydFp4oNg6HX4dHNhSAk62YDWMouUqSubqfQ+Oy6m1dYZZDBEvnnrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4689
Received-SPF: pass client-ip=40.107.22.122;
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
index 971ed7e8c6..5eab31aeec 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -564,14 +564,12 @@ def _qmp(self) -> QEMUMonitorProtocol:
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
@@ -579,7 +577,7 @@ def qmp(self, cmd: str,
         """
         Invoke a QMP command and return the response dict
         """
-        qmp_args = self._qmp_args(conv_keys, **args)
+        qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.cmd(cmd, args=qmp_args)
 
     def command(self, cmd: str,
@@ -590,7 +588,7 @@ def command(self, cmd: str,
         On success return the response dict.
         On failure raise an exception.
         """
-        qmp_args = self._qmp_args(conv_keys, **args)
+        qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.command(cmd, **qmp_args)
 
     def get_qmp_event(self, wait: bool = False) -> Optional[QMPMessage]:
-- 
2.29.2


