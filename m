Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D36037146F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:40:32 +0200 (CEST)
Received: from localhost ([::1]:42394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWwA-0004z2-HF
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWqJ-0008I5-Ep; Mon, 03 May 2021 07:34:27 -0400
Received: from mail-vi1eur05on2123.outbound.protection.outlook.com
 ([40.107.21.123]:59200 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWqG-000096-Q3; Mon, 03 May 2021 07:34:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3lGUZYj6SCsgHDHyhp5zGoRA+p6MGlyVjIrF4KgtbLxZzvkoph5Dn4WCqskf+4dzWXedqbHVGyOIMnuET1OVOpEGPzYFkpqtFVCn8jC4NZCAK5zSxi7bjjxyvV5F2ySp1GDYE3U+5g3QggMYctEwRHIeGSGMgLwkOOj/yBFYqT8IKL1xYrqIA70z71r4EvvMjwy7Ts69davYwCUFQfRLShIgzkAlFcHAMbSYleKy5Bf4VzKox9wP2UOIOo1AZ+3qiery2eVx/I10mgEhR5lZSL9Gf9WhABjGb0adLWv0UiqMxgKNs/v2MblbgLGUJ3VzUdUU5Xo/vEM2EGuJr3iHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A57FlMGw47mIFakvo6dwmo19DV/SU26h3Q82FOnu5cM=;
 b=b1l0Ql5Jr4cTD1XQE14sxd7tdtx8pZjqefgPOOdEMc705Sf4BEgC3N7/vWPDbQD9hNqleE5y2dsHwia0FwFX/wANB94KmhYnpaTEtnZff+MJo+iqLoqclQekgSe2RJ1kNg9lquWfk3dYihQzFdyQUAzYIRBsBvWPP0k9Tb6hnO0SRWU4XI2uqgmqyyNYbqcR+4AADWCoGBnSA4H1S0+WL+tkeRfOf6E34BO/2YablDJmnL0F4IXNfLNQAqdFsodpQJ5mD6HR7ZkOkeRI/2TNZvESnudIx320Puqz9rmHKT9CLhw4ALgeIUvLRta6Iqize0D2cHAPqt+URZm3/WW/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A57FlMGw47mIFakvo6dwmo19DV/SU26h3Q82FOnu5cM=;
 b=FL2SuSlQYuZ/GItA6C7reQQFwtXJUkXddwUQTeFMfIMuZ4sHkKgS4HVETWOHfxpS2iRIP7SYUJmx+xUfQCJ/ubEl06SjTXX2gc3NxKPnIUTlHOKhBOhd6LY+kG4SRpa2a80eSW90iHfphMjE0H+e7hojdjyLxMSRbtpXRCssr8g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4407.eurprd08.prod.outlook.com (2603:10a6:20b:bd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.43; Mon, 3 May
 2021 11:34:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 11:34:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 6/6] block: improve permission conflict error message
Date: Mon,  3 May 2021 14:34:02 +0300
Message-Id: <20210503113402.185852-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210503113402.185852-1-vsementsov@virtuozzo.com>
References: <20210503113402.185852-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR05CA0255.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR05CA0255.eurprd05.prod.outlook.com (2603:10a6:3:fb::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 11:34:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8af65f31-7c40-426f-3230-08d90e276513
X-MS-TrafficTypeDiagnostic: AM6PR08MB4407:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44072F5996F250120A9840D6C15B9@AM6PR08MB4407.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rNBGn5lkb08HrQ3dC9WOhQdbYEW+Nk3brQKRAGPeXoTJXk56ROTrkpPL2VVm67olWAX1zbe0umKRNodqP/8LPnrFVB/fx2vXIcQe5PWJTL4M/F5DS1lCUv2/n+ju6U+8brF0d6snbAPOIjn+Mu8U9/wL8SZf7elHZ3vH4R2qAE0DP/jMcG4AOO2LF0FKIscsh8fUh4KutZHPY72k05cG8Q/dMxXIk6Pr6uW1oFH6PxyQNwGB7nAVqcBD705eU/bTVBrdwi6UVJU5Yf6gi2DyGiJAjaoRjLGeDjNkU8F6IA5MMYZDxNcBl9/Y+7y6nhwIh2bqP8psQyVudD+2ikPr1BVngaYOIH1Lr0I9vzUMywF7R11P5deQwd9zkj/CdVZXrjSbw285n9lu72D7TfegPIjPDsBd8xNfPO+q5q/T04yUYwGuvyZSHIZrIuqiHMXBGsPC2T4rtlNoTrzmgiF5NThvunB1M7E+dDNKgIDbwU7EOJGTs72PqM8h6F9bXlkE/R/qxvF+8dLYOtYo+mucZFlQHvMz81xdTRHQzMTu1BlzXWfY5NRTEpPOGG1EeS06qCPg7vVKdGFGuDciCVv91r/ups0dgGHYc8+a0CbMtM4abF2h8WEDH66kjGBrqCgeErj41xi3Wb/RHjcDzSNK/jspqlyj+EUNq1zSo+ap67xZuSw0Y11jazT5EnriRiMU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39830400003)(366004)(36756003)(66556008)(66946007)(83380400001)(52116002)(478600001)(2906002)(16526019)(186003)(8676002)(6666004)(15650500001)(316002)(956004)(2616005)(5660300002)(86362001)(26005)(8936002)(6916009)(6512007)(4326008)(1076003)(66476007)(107886003)(38350700002)(6506007)(38100700002)(6486002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/T+rn4OZLND88fIS6QZ1l3S/IpuPuIq8OJwvVC8JQ2DtILtqemVHVRqGXxZl?=
 =?us-ascii?Q?XSXVcuFKQ1cNnOWsLXi/HV1UQgKWlkYP8ndOUz2Ce0jPX7HzR3Y++IRpye2G?=
 =?us-ascii?Q?w+2jdH6pi08+9pMJA7a5rTcOdD2gnnDt+ZCFHRbIWP0LT8/gQb0FhFPmDXxo?=
 =?us-ascii?Q?sCUZC/nBeN8cEr2pX+Se+MPz77Z89gvYwU8VYssOoDySl/iCR9QkbvPttvus?=
 =?us-ascii?Q?SJ2tZ9/ToxE2RpnweFWBNRlNtWAHvvprB4o+HtPbQ0dLtNmN+YyEOeTdNte8?=
 =?us-ascii?Q?u3Ubn6Egm9SUO/ubIDKMKKq7wtm0fJSR4sMwcsW0Qu0jmrjkqlmvIb3gnPZ8?=
 =?us-ascii?Q?cMftaKLPrqp/EMyxmn+/9IbwtGUngeW1ip8/q9l7xpxXJJkt7SYn/PFekT/j?=
 =?us-ascii?Q?n9Bs1JQAkFXW3mhHl4sQbVm2YjlPIBIxVKSv3GfqAbpgPiGRdBxM3n+Yy2Nz?=
 =?us-ascii?Q?gpN9nUEypGKtONlySmr/svPYufUBJ5gzRYkjzYtZ8Xy6CbSryyWnhUO75VCV?=
 =?us-ascii?Q?ZMxKhad4wRFOIMIS8siy0C5KP+18EpqhuL+nV9pDIaiKeGR6YprlRuF0RWxZ?=
 =?us-ascii?Q?dC+dWDx1ceeWsu7vE/NPmUThv0rgOD2ChCXHLQ3zV8efPwFtyz71ZhCLpPWI?=
 =?us-ascii?Q?m2LuG0ZzVotR8TBzJD4pCByF/hNNYE4rN4eNdX7XFHWCdGC0Et1FhvqvRYUr?=
 =?us-ascii?Q?CkI/h48NxfB3IpcDB49TFwyTUjScjNIgA1o9wvPxzoPOFlYPGWZd7g6zvV5P?=
 =?us-ascii?Q?z3RKOK/DLqRI+qhqI9tnKiVeDGlIGNv8PyPCM3bms9nFyvlz9P2Uf+YiFfge?=
 =?us-ascii?Q?jY7ztrBU0x6/5GdbqnppytGuZJXeH/oialR9J75E6QjMfQbj8PY5xZUX/RiW?=
 =?us-ascii?Q?fbpnjBuB0rtuzdA/Ogs8QcUgmT0nlLfM+QIqpVukj+Rwdn6SMbZkyEcFCXKd?=
 =?us-ascii?Q?JJ1xbY1dpFPopDAljAwCywvmmWnBNWxLcKM+QAMKkMXaHslkbE8B5l2dGLGZ?=
 =?us-ascii?Q?LFhMc9nNQaVs31e15yK47CzP4WLvEB1YDIDcpf5MCR0+wwxkZ4V833p/OatU?=
 =?us-ascii?Q?P1L8hqGHU6NcgME1E3FqPorEs86WlXf0aDT6lwJNwBpMTf47NRpEzd5DtPcz?=
 =?us-ascii?Q?C+uouB4e9ReZQNP8wkCZttqXT1bt3lrZjN2rwjPNh4ooprSHpp7DKFTti/YI?=
 =?us-ascii?Q?ga+d/2I2wsR3l/D6zx+G2lqLhscA8SGz8mqY9K1GxHzwtegimDCka/GNwsfH?=
 =?us-ascii?Q?A7v1fYZ1d6nt7/88bXgKxD0BElfnF7ZP+nIPM5uWOBH3TXFfGC/svUzv8G4z?=
 =?us-ascii?Q?lyAuY/d48lojhP/Ire+xrB+p?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af65f31-7c40-426f-3230-08d90e276513
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 11:34:21.3439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mr+Icm7mK+oLWbwlcmHKsazpW7+Hzp6gEjZ9ak93Dvc446VOnluizMOsMfv8IrU5EJT5VjtSeWclqPJ7TdDxNIPc2TjEJeBqB9OC26tK+F0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4407
Received-SPF: pass client-ip=40.107.21.123;
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

Now permissions are updated as follows:
 1. do graph modifications ignoring permissions
 2. do permission update

 (of course, we rollback [1] if [2] fails)

So, on stage [2] we can't say which users are "old" and which are
"new" and exist only since [1]. And current error message is a bit
outdated. Let's improve it, to make everything clean.

While being here, add also a comment and some good assertions.

iotests 283, 307, qsd-jobs outputs are updated.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                               | 29 ++++++++++++++++++++-------
 tests/qemu-iotests/283.out            |  2 +-
 tests/qemu-iotests/307.out            |  2 +-
 tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
 4 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/block.c b/block.c
index 20efd7a7b0..3fc87fbf90 100644
--- a/block.c
+++ b/block.c
@@ -2040,20 +2040,35 @@ static char *bdrv_child_user_desc(BdrvChild *c)
     return c->klass->get_parent_desc(c);
 }
 
+/*
+ * Check that @a allows everything that @b needs. @a and @b must reference same
+ * child node.
+ */
 static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
 {
-    g_autofree char *user = NULL;
-    g_autofree char *perm_names = NULL;
+    g_autofree char *a_user = NULL;
+    g_autofree char *a_against = NULL;
+    g_autofree char *b_user = NULL;
+    g_autofree char *b_perm = NULL;
+
+    assert(a->bs);
+    assert(a->bs == b->bs);
 
     if ((b->perm & a->shared_perm) == b->perm) {
         return true;
     }
 
-    perm_names = bdrv_perm_names(b->perm & ~a->shared_perm);
-    user = bdrv_child_user_desc(a);
-    error_setg(errp, "Conflicts with use by %s as '%s', which does not "
-               "allow '%s' on %s",
-               user, a->name, perm_names, bdrv_get_node_name(b->bs));
+    a_user = bdrv_child_user_desc(a);
+    a_against = bdrv_perm_names(b->perm & ~a->shared_perm);
+
+    b_user = bdrv_child_user_desc(b);
+    b_perm = bdrv_perm_names(b->perm);
+
+    error_setg(errp, "Permission conflict on node '%s': %s wants to use it as "
+               "'%s', which requires these permissions: %s. On the other hand %s "
+               "wants to use it as '%s', which doesn't share: %s",
+               bdrv_get_node_name(b->bs),
+               b_user, b->name, b_perm, a_user, a->name, a_against);
 
     return false;
 }
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index c9397bfc44..92f3cc1ed5 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by node 'source' as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Permission conflict on node 'base': node 'other' wants to use it as 'image', which requires these permissions: write. On the other hand node 'source' wants to use it as 'image', which doesn't share: write"}}
 
 === backup-top should be gone after job-finalize ===
 
diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
index 66bf2ddb74..e03932ba4f 100644
--- a/tests/qemu-iotests/307.out
+++ b/tests/qemu-iotests/307.out
@@ -53,7 +53,7 @@ exports available: 1
 
 === Add a writable export ===
 {"execute": "block-export-add", "arguments": {"description": "This is the writable second export", "id": "export1", "name": "export1", "node-name": "fmt", "type": "nbd", "writable": true, "writethrough": true}}
-{"error": {"class": "GenericError", "desc": "Conflicts with use by block device 'sda' as 'root', which does not allow 'write' on fmt"}}
+{"error": {"class": "GenericError", "desc": "Permission conflict on node 'fmt': unnamed block device wants to use it as 'root', which requires these permissions: consistent read, write. On the other hand block device 'sda' wants to use it as 'root', which doesn't share: write"}}
 {"execute": "device_del", "arguments": {"id": "sda"}}
 {"return": {}}
 {"data": {"device": "sda", "path": "/machine/peripheral/sda"}, "event": "DEVICE_DELETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
index 9f52255da8..b0596d2c95 100644
--- a/tests/qemu-iotests/tests/qsd-jobs.out
+++ b/tests/qemu-iotests/tests/qsd-jobs.out
@@ -16,7 +16,7 @@ QMP_VERSION
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
-{"error": {"class": "GenericError", "desc": "Conflicts with use by stream job 'job0' as 'intermediate node', which does not allow 'write' on fmt_base"}}
+{"error": {"class": "GenericError", "desc": "Permission conflict on node 'fmt_base': unnamed block device wants to use it as 'root', which requires these permissions: consistent read, write. On the other hand stream job 'job0' wants to use it as 'intermediate node', which doesn't share: write"}}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export1"}}
 *** done
-- 
2.29.2


