Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E238B238
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:50:29 +0200 (CEST)
Received: from localhost ([::1]:44518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljk0K-0007MR-LF
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljja5-0006o7-DS; Thu, 20 May 2021 10:23:21 -0400
Received: from mail-eopbgr10092.outbound.protection.outlook.com
 ([40.107.1.92]:6738 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljja3-0005se-O0; Thu, 20 May 2021 10:23:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nB4KF2ZFKShVWvO6dfA0A4a785DgtsBrMKu/8sKDMdcJUjviz56lKyglcjDZIBMLv+4Q5dtX0Mli0OwtCpHB5v2ZFu3uasEzEAEBeljSBxpfRWmCNu9KUS2tyl4L2DUo0tfsyQCRzk74JqqmxeNsLduv+DUyOJ0CXjwYIUAIFmUnT/Ec+SQmYb/AUK2o+UxIgxCRhs6OduijtgDctPKDEOiq+CrDMAC14DQhnzZ/0dMR8KiqjCJOInFVsH6lOFyUUWSOlv1VsVyKmBPXqSmzg2vn4c3Af7sWFOABzfyxMSbHGD9qylTtOFUquPIAPb8zB08dCM+AlXZvhoQRHu9/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKA9a+imlpbK6vvzlMul+KVAuXATgW6Mc3WbFxYkqgA=;
 b=Oyy3hmE2zbuzFI30ZOSx362KPY2klovSqTh2FsNjJ4Sh9zdHTJiqqJMsYxGk4s76JFuXZfls6sjvu6bzfGrRr0F8Mw7NJdK60smTuojOtC8P/EKKoSGf2nwX4uCOkb7VxWQeWhX0pnV0lSl4gPaWOVMTOaII97u/5LN6WtbY/w9Bjka9dgy2fT2+5ioNrOaWdqyqEmnkdEVvfamZHoN8so0TZRYLHGCGu95wtlsn7FehEBn6JET5I/1n93p1C+fvUayisinjqpCJj8meU1FcdUL5l5Ai93bg5SZIHbZvtlCQvuUHly0Qq6if4X1oVcujFpzsP+6Ugf7U4clOTnx0pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKA9a+imlpbK6vvzlMul+KVAuXATgW6Mc3WbFxYkqgA=;
 b=V3OjDhNnFl5GpO99Bjc0qXHodz7oCfGacV5JM5bbZWXgvG/XPH/2j6TNdg+bpTwuGKb21xdDhbCY/RIBsjt7n+xV/D5SJJ5TgldxhZxUPtzHAZcmJz/WvqKDzbaa6cfgycHXYo0GDaO0y0tjtcZ07GEUHIy4VhyGJetkovnkAro=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 14:22:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 24/33] python/qemu/machine: QEMUMachine: improve qmp()
 method
Date: Thu, 20 May 2021 17:21:56 +0300
Message-Id: <20210520142205.607501-25-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 907e13c6-d4ab-44c7-f823-08d91b9ac37c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40722CBFE847678E2A2C96CFC12A9@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VYEtP8IXyMLbzFpsH55HnVCIYwPyMyF/Tq5ZQyP9c4DPxKluTUN8HOSWTVW1D3N1CgcyLkLd8OuPp7mNRjjonhkbO7L9GXgOsUpr2nHwtqUzA8VLebSU/k6UnWQMzG2sWGEN82uAucOEr2iN56uJN19FPvZehLkgmMF2ok51HRZJrCbhDUO/9i5myRqQ3IRQle74XovyddAWi8eVkJO/e86To2e4yJgJH2GMP465jOS8hxRJZHOD8hicVPnra84ZoEn7WGRytDEBCPVY2FD1W0mCXk1YYytlYYbxPosFKV1IQcKht93gxkUqjpkdTrKqv5jVzN5gQGrbyVXB5UpMFRI1f4Z7lHA1FqKFnlL0fYO56jDJstQsQM+Tt6I0pGz+yPai0PmrMNlrJnfQgYH3FBNAmeTjDwP/30Un02HsKDIHyOhPmBSlZdXmcghJ45ZJRqm2xoIfjbLKkw/DJXS3a2rVtRWAAWydHorwwGF6aKI6iYP/EbhFkNi3XQeNycv3pVMylFYz53ccWHppWYAhceIZsIsqtw7Dl3tNtrPoh/rycwjZAF5lVO33W6x7jowrtGRgzaM6L8oYLOMEp/+n4Gh5nypC20uw8xQUcY16QqEvXMruHUVTduZ6wHg4PTHNkwwxssW+jQGLsQgq6gvuSdidruygKzaN9m8PzYmp44E9tRmEKPjpEMo6nQXA5F2f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(38100700002)(478600001)(186003)(1076003)(38350700002)(2906002)(36756003)(4326008)(26005)(52116002)(6506007)(6486002)(66556008)(6512007)(66946007)(2616005)(66476007)(8676002)(16526019)(956004)(6916009)(8936002)(83380400001)(107886003)(86362001)(316002)(5660300002)(7416002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cC9Sa3EiHq3CmqJ3j2vmv3+FzkoBMdGuXdkc6roirF2XnYzJLJtJqZSlqfUn?=
 =?us-ascii?Q?M2SwUzTk8D+I81lGrLfZoFaezFiw2WsVfsmfvSuM4UOgpXeDqF0qfDZukJIY?=
 =?us-ascii?Q?AkFmRJviBG7P6sraPPEFfOF1KE5h9i9PPTBcYFAPFQ+IBpq7fm7uV0LsnqJe?=
 =?us-ascii?Q?uFRtyKGiTratwa+ONQKb06u2FuJe3e6UQ5vwvm7jgqIuEmTMcIItYNGKIIGZ?=
 =?us-ascii?Q?0RLFkdna+ilw3TEpcXhh25TF/LPsfWHW9g6UXS4yZcHl6Sjq/v+EhY9ifyHz?=
 =?us-ascii?Q?dCFFkrOXA62YBL1u0R3jZ3ge/P6GKX/J/dCPKd9p2T/zhSo+2ZgcLRAhW2TI?=
 =?us-ascii?Q?ovizg3oSDozM8FSsSC/5kxEeyE9lZDOZrTr4l5ijH3osuWyZ+toHsH1F2NPT?=
 =?us-ascii?Q?ceTECMd7W3mKj7NYh9631cq8otKxffo0h7I6jlkE8ZCg0cdQm3Q+EU8OgdVK?=
 =?us-ascii?Q?JZeiZLgeThveqWr2rJsw/FPjQkrV4nRj/8gC8q1Wn3eM0C6P4IGsqR8fxoP5?=
 =?us-ascii?Q?gkGj4lOTZaLre4JjkP3GhPTsT1GpL65eb/WFjS0qrbhe5ph2IyH26js/OrPV?=
 =?us-ascii?Q?bpdBGHJBdH1ITlKFQ3rU2ABAkurJEvJDI/41UDjX4CKGHD+3pPDezm5APoiV?=
 =?us-ascii?Q?V68De4kIFzyg90GiHAq9medF7Vs5JlujEbZWYXUfArvTNvK+xc/AOrtWtaJA?=
 =?us-ascii?Q?8pSIo7mbOTpyQYV4llrDOWZoX+MTRUOZm2Uw5hbvMRj2sUqb3iEA4V3Y8EiZ?=
 =?us-ascii?Q?RMevzcBD8HFZqlnMK2ba0CcJJainsJYTk1QZW3FB8iEQuv6nC0KCy5rLc+Ct?=
 =?us-ascii?Q?jG258sL5G1nnmniaFY+dkpPwvJHAMmTszqLOKGQfAbUrckj2IkjlNre0pDhz?=
 =?us-ascii?Q?gj5UUADIcHIRUT/fz3Ge95T/kLL3KWO6Zux9TbsFo2F+dVgsUCf+sXsS+EFl?=
 =?us-ascii?Q?1X/XBqoosUKX3QF3ZzNzqO73Zqkr+4GZpJqXNxQKA1BmWjabOVlUD4HWo69L?=
 =?us-ascii?Q?ffQFh1DiDFoywS4HEBvmy62Bu7Eir+ZlZZkdnMvDM3m4aJzVjcNY7Wgcwv8h?=
 =?us-ascii?Q?zkS+V0WAH+R4WQLRrD01WNTUJj0AnYG10oNC6TQDoZptHny7omEN6hYuFc+5?=
 =?us-ascii?Q?yLLbvez6oAZVm72rsmjvI25OmXjLAzzp9uCMen7pEDAf5ir3WgHiESR+H6eN?=
 =?us-ascii?Q?JNqKa4ZSgxLW6FAeS4V6dB/X0mNkUHZUHJwZy+M4j3CqMGkEmVw3gt8JPVk5?=
 =?us-ascii?Q?9j9xpcCM5rwn2uTOGtOU45iZR2CSeeLY5IMZRcm9y7KtQI2ASkUjildwiHKI?=
 =?us-ascii?Q?5AnolOfzpezRNNEvRTKON8f0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 907e13c6-d4ab-44c7-f823-08d91b9ac37c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:57.0008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d01CIDhOnbU+tIcAp53oU7/llrXVwJn/FH51Xcvw7uUpqirrVeFJseD+KZef2NA32m9zgT7KXVTF433GkxCQNXn+++qTY9caT2m0xMmj7a8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.1.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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
mypy don't really like it, it things that passed unpacked dict is a
positional argument and complains that it type should be bool (because
second argument of qmp() is conv_keys: bool).

Allow possing dict directly, simplifying interface, and giving a way to
satisfy mypy.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 python/qemu/machine.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index ff35f2cd6c..7a14605040 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -549,11 +549,21 @@ def _qmp_args(cls, conv_keys: bool,
             return args
 
     def qmp(self, cmd: str,
-            conv_keys: bool = True,
+            args_dict: Optional[Dict[str, Any]] = None,
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


