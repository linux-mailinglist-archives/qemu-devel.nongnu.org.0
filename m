Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E431B49CF57
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:16:37 +0100 (CET)
Received: from localhost ([::1]:35478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCkyL-0005Eg-0G
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:16:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCktt-0001zE-NV
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:12:01 -0500
Received: from mail-eopbgr70122.outbound.protection.outlook.com
 ([40.107.7.122]:37041 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCkts-0000NX-5j
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:12:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVTFrf11jJ9fv1QMfJMXFqmoP2JrzGZ9Y0mOa+imfhU47JaGXlJK40Z1E8c8yBC9k1Ku7+F6g/H51WqfMBkgphTDce41j0Bl3xr2mQJoWprAJjgS1MLP8n3a2NJdh5RSjVQdZIvzJziCBXwsedmBw1gvM4ZCnGjvv9uOv2u58G5vdMpeEVLiQq2+rOQzHc7sinQaXzrnqJjvIXP/5fG7/5kgErEpmb1iY1fj716wu+2q67L/oEJjTt/WiVp3D8SSc23tChauvXADfwLRSpLxJpu/EX954mnf2bIYWgfZQc3D/Ea5R9wHl2UaJ9I5T32MXQ1Xr1sqLiIru4S7+0/Vuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RffDSRhsrAP1zhM3yMZgzCJdAz2EhK+upwySR9JvtmU=;
 b=HPsHkZmJVJgL1fIbjz4p5lq9jlCXutzf6wcr7sBhYkbWrlh+J5CGbV0oMcFQiiN+6q58BNTr19s/5xZ/dRUi5oLx5KvYdAnDiDHniHz7wgBfikzrqnxr/+xAl2p3JA08Uw/TapxAAJCo/NA9ocOBDiYDXiX90TmwnXWaGSdgaHZz/faIbkr2DHofZgGk9Xang8YvzRMlJrsiwXStRuk3p7a0taLsiYBxTI+eLcYYKiMy2pYytd2m8HaDdhdg/VKwSPKBcMP3eHAVK4ssTa8KfmdOtCx41lYNOlRVWQOt0zWj+IaXauvb4v/iw/cwhHfyEHd5IoAf1bPjp0Z7aWSo8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RffDSRhsrAP1zhM3yMZgzCJdAz2EhK+upwySR9JvtmU=;
 b=Ga2HiXxDuL8Zvicy2bNex4nhw/Eertqx8rVsvZEjGIPYt+yHu6H0m4A0y8H4Tmez/VFopUuJRi77sFHVrQkvIxidObZIGAf88JSQhRhNTk8QPN0Dg0et55TqORkTxZ2zNgMaoE8OFdtmIIoIZ6EYLxMqoGysorZ7JQzJYsVz8QA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:11:40 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Wed, 26 Jan 2022
 16:11:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v6 2/7] qapi/commands: refactor error handling code
Date: Wed, 26 Jan 2022 17:11:25 +0100
Message-Id: <20220126161130.3240892-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 201630ae-7965-45bf-d307-08d9e0e689ae
X-MS-TrafficTypeDiagnostic: PR3PR08MB5868:EE_
X-Microsoft-Antispam-PRVS: <PR3PR08MB58682B70181A6AF7BD19C742C1209@PR3PR08MB5868.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:29;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5MDRERvSjfsbEB+IQ27trqX2y+fjrUqSEqaEGlj21R5CAaS6U/XZtSo73rEyZ+3vXcGrxiw/stGT3foQR4iIE/UYs+uuVJPh0mSycHMXUo9ZaQlNamPKJy0CI2m0iVgf2mzVy8GZJfRqKH2IOLWk/pCbAWBQuCi+92fEl65jLTnHConH9oyPmBqmOpOIYHMJ4kQCs2lqgmcLNFVLlNH6Xvro2UsGq41S0H/Wgf+BMFqtmSd3xvTgYaYGnqlkgQniyl0b3Kmbe+x9ZPaZiN6C40FtPUO3st5vF8i8L12Elk0NIG2uZc7KvQjG0PskcbE/Ku6d6IXBZlCs3VRCjDRSeSK4h7w60uwNRWx6BkzzlNuuFiSLevmyakT8/RFT1qwQL955ZO3gxChx8qwnYhvePku3ZdB6y5abNwlccMZqMAuh2mmYWsSzT91Ij7xWnKePtG1b4T4StmHRZcNiFXr+Xtlvfk6NCtKXn6TkexTP7SuH4gdSBmeN00P+TVCfpNjeG0QiXAKxvZVrWPcWTCQsavaWJCL4YmavMboTKUGo12g4IGjRTxJUyiDQ4bP37hJfYPEqJhWnxYhWtiI+/isR6YhQuvGGj+bho4oR7LkhLcoIoG/oLC+aiicoru575sWYwxiWcouzVTi9f3O/L+7u5uJh2+lRZ/ASnXBMD0Dj/Dt/02fJwm0Sr1Exavq4wmzN8PRUTVif9q/eUg315h5wKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66476007)(83380400001)(8936002)(6916009)(4326008)(8676002)(26005)(38350700002)(86362001)(186003)(38100700002)(1076003)(36756003)(2616005)(6486002)(2906002)(66946007)(6512007)(66556008)(508600001)(6506007)(52116002)(6666004)(5660300002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6q1B4JauaVqb7Y3wO9NNOwIawZOAZw6xqssy1L7dFMPqk4B5l8DQimlR6A72?=
 =?us-ascii?Q?n17OAOFqqOtOFgNvPNA0nAqNXa1TH7OySROeae/Iefwvl7EtYOeBegehkYVN?=
 =?us-ascii?Q?UEP1Gad6WMoK6y6D1nnFh0HXIYYOLeKjaGn9KbEPS9WFgBzngFSnnlBajrR0?=
 =?us-ascii?Q?JpkFuMVWIApc8P2faslSiQq+jVwPGucSLWsJHsCoBOTmZvtmwgNrYsbODr/w?=
 =?us-ascii?Q?XPIi3IATCHbcigPZdKoECIiCYWx20fqYVGyeFpVWYdjU/ZXMll50QwWj+UG/?=
 =?us-ascii?Q?ZGmOR314pEiKWKm0/CzF/i3u/dofEY/9gTELWQXu94zHWg/W0AEhW00RJdUG?=
 =?us-ascii?Q?9/H+A9rEAIEjn3IbH0roqCXrvCG0VmA9KmRHzAYgb76m6Ve+DkUfcDK7sFI+?=
 =?us-ascii?Q?JyknyNv9luPcXlAAyHENty4/cGafdQa70UTXlKum5tEMKBQLCeo8lFmMxELS?=
 =?us-ascii?Q?BGzN+edi1s/5ptR9tVvKn6TDxU9lL26dFWYKa4loCPlyRtVIFscX+aMBUn7a?=
 =?us-ascii?Q?p+DHFTZDaJLwmb9g5OuLPYc4NZCw9Nj+IxSfkmCOIGVkZSnRpbS4D7wMrQ88?=
 =?us-ascii?Q?dMeKbpZMri+D/nlOGMsKwmmTfbQubFSAdtgoU+ovTQdDM9HW+jtjdTeCP8QD?=
 =?us-ascii?Q?/apD48CpkH/iUWPrttnztYXB3m1aZDXSFJWUAzDrLYCvjhaW5PiTbiBYGKxT?=
 =?us-ascii?Q?nWrqpwzue8jh+87C98Lcr+sZ4We6AVmUc4Ls3J5JRnbavQ3XwF9kqXprVLc4?=
 =?us-ascii?Q?bcsgvRpt89Dvyt65mIFYE+5LHrGerpDJj02qeraiYb9ejgBFQcO4RFtKstZb?=
 =?us-ascii?Q?C92mqXSKJVfQ3ZGzexR73YwI+H9TzE4BYGA6IqLynynBxzLkDhl+pUKPv4vD?=
 =?us-ascii?Q?iDr4sWr7CE5MxKXRaiopTzirvImhu5apIr7zl8d3eJ1WkZLPTfjkSJK2n7aY?=
 =?us-ascii?Q?BUWO8NxT0uuUEizpaUjJYjUWcjLq4gu1w0hUDqRYYoV6vyskj5nx5V/qMQn4?=
 =?us-ascii?Q?PE0c9HJ/Y6qG7y594vkhW9Bcb+Us3ue7b00TfwW3eRW9F/6Bo0tz3j1xT9+o?=
 =?us-ascii?Q?Y44BnqjR8X7228gWsHKpofDyP/mo6kE/TCpJf7TPgk9gn1dY2JinZtga1KKN?=
 =?us-ascii?Q?KemYyDNC70XjUnhHiibjUx79uG/jSABQXdb65MjIon8p2tJYFEbEenMKdh0u?=
 =?us-ascii?Q?U07/xfgwYfaLF9bgc3i7XEZ46nzo+onaja3vnxY+BC+IvFCd4bgKZT07Sdf3?=
 =?us-ascii?Q?Ap5e00Vy/iRtbpSzEnhkto40lO91QmpDZ8v5iSRPS8LLZbwdy59lPSKbftt9?=
 =?us-ascii?Q?vv6WMqCbeosu58mH1KPEtriwr9SAvnVX0gzpucyzl3Jxo/q2Rv9Awpb3vlO9?=
 =?us-ascii?Q?/qNouUyFJiddDJXrgZONS+5W72paNSky8phypXuJHepTIfNu3hryEQTfl5lI?=
 =?us-ascii?Q?RC5jPT9HILEGAV0wYmNDmUjZhEpLQZl6HACLpyRqnbLmhvIDN/dyQ5QfZTxq?=
 =?us-ascii?Q?J0CsMpGpaxVamt3ebcNij8p0ADlhwY/2mbqHeCZZo1EbPwTUTX+IGdDoKHOG?=
 =?us-ascii?Q?7BcXdhUtCRah1j2eweEbxqAr9G8Ty9eRfjMaP/Sw0QYuLlleMyrkZKfrDWMH?=
 =?us-ascii?Q?tV3bo84hxDbnjyMVet8nNi1o46nMJEB6PntNkU9PgFutoOA5lGCcIkifJEIN?=
 =?us-ascii?Q?THYePEJVOxkebwrijDF+S9gCm70=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201630ae-7965-45bf-d307-08d9e0e689ae
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:11:40.7644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXW7OOK+Ae09C3xP49NYbiM8B8wDO+PY8aOGznvu2bSYR2csYbAP/5MdUdkHcJ3ed12t/pCOpPAh4peIq7QreYbcuQwkNQy7pAwYk/dOnwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Move error_propagate() to if (err) and make "if (err)" block mandatory.
This is to simplify further commit, which will bring trace events
generation for QMP commands.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/devel/qapi-code-gen.rst |  2 +-
 scripts/qapi/commands.py     | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index a3b5473089..feafed79b5 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1690,8 +1690,8 @@ Example::
         }
 
         retval = qmp_my_command(arg.arg1, &err);
-        error_propagate(errp, err);
         if (err) {
+            error_propagate(errp, err);
             goto out;
         }
 
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 21001bbd6b..17e5ed2414 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -74,14 +74,18 @@ def gen_call(name: str,
     ret = mcgen('''
 
     %(lhs)sqmp_%(c_name)s(%(args)s&err);
-    error_propagate(errp, err);
 ''',
                 c_name=c_name(name), args=argstr, lhs=lhs)
-    if ret_type:
-        ret += mcgen('''
+
+    ret += mcgen('''
     if (err) {
+        error_propagate(errp, err);
         goto out;
     }
+''')
+
+    if ret_type:
+        ret += mcgen('''
 
     qmp_marshal_output_%(c_name)s(retval, ret, errp);
 ''',
-- 
2.31.1


