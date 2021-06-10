Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AA93A2AC8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:52:34 +0200 (CEST)
Received: from localhost ([::1]:45454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJEf-0007uo-8x
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqG-00042Z-OV; Thu, 10 Jun 2021 07:27:24 -0400
Received: from mail-vi1eur05on2114.outbound.protection.outlook.com
 ([40.107.21.114]:47549 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqD-0004ZR-Sz; Thu, 10 Jun 2021 07:27:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfRTz70Sok0jUBn7JHFTxGXtO+G/kiKIKlgg/DEmifGVFUQNXKhtmwIbfMeU+RpZSDHEQqUf3hRHSrc8eY1BWxpRuS/oUetrBonCQyG+60HfF1HncdlVQsBkkdPG/4sChIaRv7jftxVYcohsPKt+YkaPFVzmmkrZO+dfH1Nj52B8ssyJdyvjlsm+VZ0bCiIWO9pXn9MjgF3SXH64z49P4ibSKCnHJkjThcxqIPLDXmbPIO1HTTy2JTB9vUwseE5+kyzfuRj1tjFvmCKp1NYW7T2+vI3hULZGEpt2DNSdLct35uSuAe54afwzdHPR3lPWJHlJ+o1GMGl3ymgCdtUiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNxfwn1m+7Xtbn+8HvFRHoeuz0/qXYAkDTuwWoJF55M=;
 b=Ct9vQL5V9znEWIVPjkwVSNuC4GlP304Mhm9tixdWmzrf9H8AB2SG30LK/BuzgmoRDNpb+MCJNXtag6qLNpRcHz0ZE+cSgsntlrHKrucKQaqb5S/1W9fdShdjgf1dJtXblglZEgip7YjkV1gxK7dXqe/ioWsdY9rObAM/O+22n1jIyBurL+JfVgILP53efuLtkMlKkCuboS0zc/hA54YUGUE520IM/ohCnX92OleUyEKyqEKUwJ9R1dP7sl84X3sDH1Qzg/JYfxWWjbrNJtf0VkU8j6UW/hW0pziS1JobMRSukT1SrfsoRn5w9BjOhagIelR6cJctBVoGGaqoyObk8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNxfwn1m+7Xtbn+8HvFRHoeuz0/qXYAkDTuwWoJF55M=;
 b=hRxfpCQ9gNVE8LpvTwS8Ug4os8vc2+HjrRjSeHNjR5iOOn4YxyX4a8H//zF0hWDhT9WK8WE2mGuP9mfAh0hNH7j2RfMLCe5m7VBXYN1DtBXmGoaFjy1JbrPDET98tZvxyXlInhcNU6+im16LLx49urETDqbG3ptCgBkd/Xe6cs0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 11:27:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:27:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v5 26/35] python/qemu/machine: QEMUMachine: improve qmp()
 method
Date: Thu, 10 Jun 2021 14:26:09 +0300
Message-Id: <20210610112618.127378-27-vsementsov@virtuozzo.com>
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
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:27:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e371a34d-c360-4dba-7693-08d92c02aaac
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB62800105E98E0FD461F7A339C1359@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6BtnfUiSiEjQHQFRT76lLRmwVtrx6iZx/Q4fhOVoE5MS7x4GaW11nz1cWvCmabbMZn3c9TG9/hapOlUnlXiyqwcmJRoWagi0nHI3qngh1jOo7Ejka/XFXuS0OjTnt/wq38aNyoWr+8tuh9mLFuOVy0g8z1YbXv/gQiop2H/xnE3lrVfJveAlf/AqNkP+dKj/wVhpkHaFV7aWgXIf7NZQvsthzFOwNSSMt/TaKb3QCqtSXG/M/eaKaNz2cUtd7WyJuoXJI4tZmk5jZW2YDYrYwd7CawI94m9BTWUTSQrhAt8GlZel2Rm6urRDh9dXo7YhnICAuSoYkZiJluQHF3iTJnnVlkj9meB9h9XtsunH/yXgC2HOhGfxUF+wD/KIGoo77zlXy98gc7VoOwQ0/xpqN1RXvPlxS8QCB3i1hZIQ95utA0JeJOyZiitVnUsa1wLMyZVcF0E4owyvCkd0jIU+eWm8fNCmaakUP3XlclOGTvBsVywDBfiA2m9wsqlUdWWF/GZBQqVkqFjQYfUDYFxR90jU46lyTJzqnzpwUyG6rXMx59+sAfsgoDBVyk2rpJDYPnxB2pNSaSNX7pwAlDn8MFTGNCt0sLbjRbm0Zo98Zg/pnE+lJeBWRrDcF+6qUxNctAQ90ATGcgohRNjHJsT0ydz1ln1zAMI7vr0Wl3v74gDJWJ8oO7BuDJIWbumz8mdB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(136003)(346002)(366004)(186003)(26005)(86362001)(36756003)(54906003)(1076003)(8936002)(4326008)(6506007)(6916009)(8676002)(16526019)(6512007)(52116002)(38350700002)(478600001)(38100700002)(66556008)(2616005)(316002)(66946007)(2906002)(6486002)(83380400001)(5660300002)(66476007)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?njyFx+qIU3LlHhBvCQ4w8QiGvU6//8JbsPFwnj0mSj7WFAX8slFhx+a9dVLH?=
 =?us-ascii?Q?+uuEYQFkJvBCt3L1Vwir9UKZQSNildG/NolsaTq280bQI+hi2W5T/Hlnls2r?=
 =?us-ascii?Q?a/12TR+FEpwkUWAs3TyOrpJHPZmmKngj8EtnqkXc03ERTfA/GgITXLoExXt9?=
 =?us-ascii?Q?dDGxg1jiCWWiR2scXx9Gyo7mboXBOzLVmvqCAa1ik5vnQdufZTFayETsTdDv?=
 =?us-ascii?Q?ralDQBizn5tCHr9wFD6RB17eRKxZWgEO2BJ5aA3kP0W2atMGffKD9276O6Kr?=
 =?us-ascii?Q?3hroVR2cIwJL/uG9xm1mV2F3GTqjHRrqVf+X61TRZDYghGugweBwe3LmUV5g?=
 =?us-ascii?Q?kjMoN3B0f3hUHGJVcuIEq0QYMlkRh9U6x6Y+QM4Igw3sV4yKu4wDs9vsqMQL?=
 =?us-ascii?Q?PIaNqYvWOtIYuwGbl9qHV89T63PqXjqvhux18belWUGY1ncPitUNB28JPJT/?=
 =?us-ascii?Q?aFFJA3ThS1tMC8tRsO5tDEvH66Ejb+u3KcHpsl9UvrNYs03uZFmstvrpYgvP?=
 =?us-ascii?Q?iCNuShJvExRBV6njjZpP3GtOzw3chFUvuD0gnYEK38HIpysaYelYJlG65R8f?=
 =?us-ascii?Q?mIxDfI8ctRgpxRoBJMEmkS8YE1RYKs5NwHwPMWpcKHv9QFklpykuj+5x/ytN?=
 =?us-ascii?Q?+q5ihhgw97MDSdcn1LDQjTZRHcTZWgotbADRLuifFKqjx2503Hfgq/5j4sK1?=
 =?us-ascii?Q?oM1TPhxbqN6IeVO0E7xviPYr89E2PHsXvt78ZoP/bEcTqAd+5FKGza9LtR4+?=
 =?us-ascii?Q?PsWXzA92zlMlaL/6lM7aHbugTz7PwntF6d1mKDqf4CyWELTB0QxQXPj0kgdL?=
 =?us-ascii?Q?MPRh3lugk9Z+b10CBKTZKgSe6c8H0l9uJO0zw2J/WdyAJI++K1IC78bbyfAM?=
 =?us-ascii?Q?vwNz1dSzCEJg14VUuGnUL1hheZKfvV5T6Dhiv0MyqsQx/FyyD6206d6b7Tih?=
 =?us-ascii?Q?5Nxms2+9FEIYJtddDQtSJ6Now6FwuPJhtUgB8r7PVG2teu+YDsSMHCrv4g85?=
 =?us-ascii?Q?/R2BMPkdyOeMgvUzZkXj8ASWy2mKLRon342xTyjCkMQXwqPS6ny0p53xcnca?=
 =?us-ascii?Q?A70n47VHSOBy2eX+HLbVv9fTVnJe8xME1/Ypl5bWIJ6exupnizeyo5oq/d/H?=
 =?us-ascii?Q?H9hYKmFi6DxG2lvZRkDMKqLBDxRrYGpdDoGNKg336yYZxbeaFgh5QUnMMfyr?=
 =?us-ascii?Q?c9P6PRQH58UaDkRss8RBadiEiGpETGtjYb7bj7aTOdXO7OjRteok1eKSPlKM?=
 =?us-ascii?Q?nsYfOjfwZB5b/0Tak2C5uGZQiHbwH7Q74TVQ3XdTXpeA7bhVMHdXQ3SkU7aO?=
 =?us-ascii?Q?jkzXhtAzSqW1/jRLCyQmzHba?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e371a34d-c360-4dba-7693-08d92c02aaac
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:27:01.6005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvcFfAWcsrLp3ULno8553AUp2bHTDHIE7Wf0QpuJO/qAZFKJYeu7GxKx+CrWntT56Kicy5Pv/1Ep+lIfA4tFf1pNYFcmZ76qKkFZfppQ5Gc=
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
index 5c09f50ec2..f9fbb41a60 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -561,11 +561,21 @@ def _qmp_args(cls, conv_keys: bool,
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


