Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E313978EB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:18:10 +0200 (CEST)
Received: from localhost ([::1]:46024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo81p-00009j-MN
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7c5-0003Wx-W3; Tue, 01 Jun 2021 12:51:34 -0400
Received: from mail-am6eur05on2127.outbound.protection.outlook.com
 ([40.107.22.127]:14240 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7c3-0002Cd-KU; Tue, 01 Jun 2021 12:51:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5j+KywE9QEonoriRdF27uM8TBcUwVlUre/m+nOddWG98WAglQLzMW275EBVFZhei1I6L/UUNZYF3thquzLmZPMazO6YRCLOEV+NoHQQz3/8Tuaey72Hozyl6nDi3tWYg+HVO+J3+12ryYRgvtXU64VCzl7TZMpR85eJ6yTWvW2DhpHXi93gN28MqpMa/zh7qjWlFIAa2PLveHOHAX9xs4AOgihPeE0GVYcbKZ0YBqgTbunj9mUTOdijWyRcuzw26pjDWwf3jrMBI6v+5eYvYJ5ALNNBQQeuSQTC97rwntBg5os+WiS0xHON7Hh9ar2cBLFOalx8NlvbCvlsEtCCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nPaXzB1TSOvIgseQ0oiQsTdVYUhUW7OsgvqLlIiGhY=;
 b=O87qNA2wdTQ/aKb91j0t0cKje2ukN/zqU/mnp/mXPJq2tb1qLWx7OCHS9fQIdAn94jV6AoYdvmWOeHZXgHDiCZLTThOGOTRVi3woIZcdoFav9Yf9c/twZCOfhvCy483engEF7WkcfkOG1Gf/7Q+ppl3YqMT9BAQinFuJblj0HaNu5TPSz/Ly45L9Mv9VbqfB2TdrfDOvDQkbNQ+dWXlsdBbCbMNY6KWmviQlVGmJGch9b9H4d3uWOWtws3dy7yLVJ1jUBjuUVFlSKx50HYB2wOTHGp8pm40u5OAhuaCX5+hKTvRt0OsC/KZqbRFdmHJsmLv4UXWo8b/6hnxTPqDsNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nPaXzB1TSOvIgseQ0oiQsTdVYUhUW7OsgvqLlIiGhY=;
 b=QrSKeqYrcmN/9AqVJ8vj2rgFXGJXrOB2hBH7p0p3mrnlYEb6XseaqPS9r7Z2oZfhkxX6jc8+9WCOymWwbfe+TQsvXbQDiu2Y/69rsNX9MoNHtUzV5+wUBjSXp9qCBL8+ty3060UR5JGSYYvQiGZgyMQzcf6opRwScPteGcS3AJM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 26/35] python/qemu/machine: QEMUMachine: improve qmp()
 method
Date: Tue,  1 Jun 2021 19:50:17 +0300
Message-Id: <20210601165026.326877-27-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99e88bb7-46b4-483f-6c0d-08d9251d79e4
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB197237055A062635E6E8948AC13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JrRaUzOHdoL+yjjhna1FjhuZAR70ZxJBTEKTy8ucdmjCIVT8EM4ddNP/CpoYenr9NPJ/b6uzIzWhhRMHNA12VE65TWUOAnX7ezQ8ahw/M1RK5ot2FxTok8VVT6XYLmd1fPtLfpQK7LT1LDPzTGmhfG41shotZJzP8CJW29jFt8tRRBSAUkGTo4Jpxuh0N8Zdux8ZB463MgS79ft5l269K5eRtnCZCRLBSiZ6iW6+7Blq1b5frBsdO02ZbK7kuVO06vky0BaU8BR/17saMgqFw9fS3B/17upEf+xvk5ptzAgK4X1tAsOmHrSErZhK4YNr8b+EjlfJICvmCJ2s/RHLOjQs2xAtxm8XPv19/n5wzHvpYEvrFv9jnqfftRwLB9jNQ2Mp+Gp9pUKG+WfbszYspF6J5CMI9facjjUhjMmp1/r3DkoYPGEiNfjotiotWGEh5ShfMggJoyxaDG/J++lsCn5QgSkaGepvYjQSBG0zxgDlqpIRVlL1EBlFG201BsHgk1fTx7IIwB2jgh1TaTHItaZXoff0KiAeiQq4U3B5ZOE33qiNLSv5rmtVg1Fv2E3h2t707vWdm91OBHGFLHKB/095SHXR0s8njN1qNsrl4qDIHrWcK9T+jy2w4I64JhfFNmjrSpXDhYD9n0OKMvONQyUZjETRltp6mr7p6aERei5Ytth74OrCQvnpy48Z7sz4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(316002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6YzlKOus9r1SG+OtxAqlY7zkinWavdVgkN3yyb3LwltIdx4PnHMVWm8pj2sq?=
 =?us-ascii?Q?4IU4JVUtDKF1QIMpVG7qidPVOk65gwaerqtHyo+wl6nfZZdn17T29NjbKULB?=
 =?us-ascii?Q?OCs5/YaNp40UQFc0diS6v+0gEx2OcdR8PJvVtjSTBZwgLkPuTQ5KKhpOTzbx?=
 =?us-ascii?Q?0xC+BbheXaUWBvIodLVt4wscdBu7oVMZo9Vu31cc7kLY1uomD5uSBNeOGH0v?=
 =?us-ascii?Q?QaF282a4g1LMUj+QeXHX3fH41UUwF6CiukJ6FypYImcQiTZg/W0GRobma5SO?=
 =?us-ascii?Q?rrQlgu0JkEypkAZcPR7Vg9+RBjoI6vW79J+z86q5YXuXfQbLg/WnVR7MgaRK?=
 =?us-ascii?Q?DfmG/tLLNmo2E4FFbEZedBLqhAmjl4x+12qzbkcTCl2vi2Tx+tqc7jkF7KKn?=
 =?us-ascii?Q?omlath4bv8ZJjIUf8UOvmQ92BiXJ02W1eKIKftGcQXz9JHlP+GNwmGuwIYVq?=
 =?us-ascii?Q?5eEZ2+J5xpndUaprhZjXBWWrpkkaOpk+dtdS9fKLyBvG+SxBsCe4b0LWx9pl?=
 =?us-ascii?Q?vAiYisCKSdl82Ggs5JdUKOYtI9fCSUkSS/8Vc7rhQl0tq0/VXLM3n9snHEnY?=
 =?us-ascii?Q?zI7fnF1rK5ZSH+7nOQ/CoLvDa3AF8nxuLpKHylAPy2NAE8sIxF30HK/+rd4Z?=
 =?us-ascii?Q?WSIHrvBSdmhfo3RqEw5LsWwkR/wOdHunmfGtSrfeDyd3aDCSMTlF3DrlndYN?=
 =?us-ascii?Q?TBaV1P0t0i2pvW6O3W9csDAVo7A3EL6S2kYqTTeO2mONuMJ517UJB9bfpxZF?=
 =?us-ascii?Q?s8M5XtANpB7LeSA1lOxiyMZAX/fWHcV3FTT/1osoIaQO50Z3W4z+qCdGwBfQ?=
 =?us-ascii?Q?FYhdzzRQ9db6uQG9X+CzUHyU8CtJnYfsrGw91j8LoseezNdr73AenDcJ1IFB?=
 =?us-ascii?Q?Dt4IPUSAFLjyOss4G4N0jeBVvhP2sO5VnCus+oWWmfTzlTa7TdV6mXPAkiX2?=
 =?us-ascii?Q?+iczZDX4USe2z/22VfZUkngA+lgM9waYmGtj6hLwZFH5hJ1uOHwy/gyiTIV8?=
 =?us-ascii?Q?oht32i0ht//CoptfBRQRl3D0NZLm849h7GxLpNZ2i8Ne+mCDCT3UrZ0Cegjo?=
 =?us-ascii?Q?rhqpbaywVD/uuVnZK8dHfc5lFlyO/Dn6howUgwTjT4ts1aF3wRb9dID44Bi7?=
 =?us-ascii?Q?K+bgDwj61HhQnEtt5BVUb4+LkTdAbsnqfKqJiB6bSmoOy4B2uwnLCzo2UBlK?=
 =?us-ascii?Q?B9SI827MZYR/EXgXNdaySLyt2LQ62tbaqNrLaBXBWSxky3Z7SmlHWK4wV7sv?=
 =?us-ascii?Q?E1rWeYXgF4/SbjwBLb7DPbF6KRT4b+36T5OOkKgidME/avx4PTNb19HYWezS?=
 =?us-ascii?Q?eg/bg4Q2u2DyNYPvmBzP5zWA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e88bb7-46b4-483f-6c0d-08d9251d79e4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:17.9993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWSx8VzVMZiRnWHu6OdPntsncq3dV2qZC0xaNa5H/DWfZf2fPI6Hx5SJZV3MgUKfHh9h4MMDZ5GfPLE3QavqnhtHWGvc4rET2miOJ2N8agQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.22.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

We often call qmp() with unpacking dict, like qmp('foo', **{...}).
mypy don't really like it, it thinks that passed unpacked dict is a
positional argument and complains that it type should be bool (because
second argument of qmp() is conv_keys: bool).

Allow passing dict directly, simplifying interface, and giving a way to
satisfy mypy.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
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


