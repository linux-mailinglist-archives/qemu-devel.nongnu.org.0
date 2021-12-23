Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D726747E621
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:04:56 +0100 (CET)
Received: from localhost ([::1]:47902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0QaN-0007y5-Kp
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:04:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXd-00050I-7y; Thu, 23 Dec 2021 11:02:05 -0500
Received: from mail-eopbgr70094.outbound.protection.outlook.com
 ([40.107.7.94]:61158 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXb-0005KZ-7N; Thu, 23 Dec 2021 11:02:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMwBdgZ2OUXfKwh4i0iDTyLtZqzC2oOJ9tUk7LqEMS5S+1fqw3RqtBI0kDBRh7QhL40xTMekgnBSZnEgA3sVxSDRlEmX4BDsF/B7v7qqKdOo0dNcbXpmVSP3arWxhciyJDExovvnX5eOg+Sni90dDL+efhrEdIpd+UJSrLsF3+Ur2g5EtrwKXBU3qC9sB1mSHlSwWqZ/7FE8Qwv7+0mrRB4hng4VM3hXCtsOQo3/X7HatYI7aGfGuffR/MsAd9hTYLwMu/zouqlghG1MrMBaHm0hECo1rLFUZC5YTpQhrrktmtupUydEa9tVI+0E+3IgUsPu1ngtxYFGE3QXjii3jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04/nOXA0pTZ9jUmwK4jLfeALXKT0Ap5/s2cSQZArKkE=;
 b=i3OVoV8Z7YqN3UTTJjZ3tTGHc6E7j283vgZKxPXUbBtyLAkn2BuUjHwpDA2by1PpKfGFan+DuXu7+roaBpaYgO2vzyppxk8rsqoUyk9agwmJOzs0JpGPG90yMQPKPYkb6rp+V13A6n685taJG/BDURgwaipF0ShRG2nRkeRwcpyxmmWET2hxT0MpjNqulm0LyFmDxIaPYw8o+p6WjJaAYLF+knPcgT1KD434cQLRO2WoDI9YO8HUtro0XlDaXRB2XWmyxIn3295aTdBGWEkcQ5xlG31GynVw5qePZh8ikwZoNpHQDyFbqYE8LM9tuWzYbIPOBdO+4DjMxVWiU6qhDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04/nOXA0pTZ9jUmwK4jLfeALXKT0Ap5/s2cSQZArKkE=;
 b=Fnr5PLFAvJXkWi0FgDBGki/DaM+cwMTizUKpaTPIe1EUV4HvDJQMGzxVMEwhD/HgsWT0DFs1TZYc3/1wepV9vHBn1YTltNqeFAjyWEQ48BLP1wvZNFTIpwnuDnDxEC5uXkeT9zrCNdqlXbPTqeswzLQlUmlD7ycYX2yERun5nNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:01:54 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:01:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v5 01/19] iotests.py: img_info_log(): rename imgopts argument
Date: Thu, 23 Dec 2021 17:01:26 +0100
Message-Id: <20211223160144.1097696-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
References: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc110c4b-9ca3-40fd-5afc-08d9c62d8a49
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6148EFE8285404C312BE446CC17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hLKUdPcvMDB8E1aNou7jiwTLmAizbI0IQcflZzHtUMxeAL73P6uNbgdwXzlnIQERsXFXdvOHaPPAi/3LbHp1ax4dpCj59jjpFzFfN4TuId94uy/X453u4eVFeIvjPv60wzk/lwEDgLABWE96q/X7MF7XsH0L724FZVZk/tckTsfi3SEabqkuWOpt8VOzO8rEgw5/aUD2e48VB/Y1VYv/fT5XO5rZgq+OO6wPK0T7TJrXCzpUxJgbmP09ax99QPHcOgLnhdQF7S9zAswyFTPdksG6/8QWGvDfOPCyV1joMcdyvzlSnudGlj1hynibDxO3NKL2kR6zLscJCRt7cbHXORnMLZqHI+ZgS88g0e0clVWVLUMlKpvN6Q4TEMSqilLPb0WqdE8JvBqITfiekeTki1MB9UYVlvtFdSGo5tWZgMGWv6b3BA4gfA8/2nhbb19ay++nOQF1jZ+G8IL9ORjGEA2rN58CduFz0jvFECJQWn57YWPQt7TGKXjbNOwfOTqGIjENUj8rE99UFEW170xZycTwpOn6BpC5UvwXADv5qpi6Fj8ZlkrDJqBagmQpEJ/Q2F/Xxbw9/ho4Rb3tUSKpn65jgx/G1F+yKh/1GbWiirDwvLKfoFSqJrHX9N5dUT5B2+vpa7IOAeWiOeKGUfJaFjoFJB00hktLWJ0fRsFod4UcUCY/NNVao91bOh8i2ZQDEDftBNpq0Tk6Rv8bK+8qZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eEQn68D6he9IeiSxfBeLpFhKdpndcf9HHsXId3Z50RWq1J685d3wa8lJBTa7?=
 =?us-ascii?Q?XeoM4tWGSWoGdaYOEFmGpzOuFL94hIVhjKFRZJWYVlO0+CaBRV76WZ+zSt3Z?=
 =?us-ascii?Q?0XDz62yufw2NOje6kxmuaJXaAY4b7HMH0PbjCBRGKp+cq1tXV68hNf63wUOV?=
 =?us-ascii?Q?3GEhDehnsvU4T6Lyz/6kDzAlwppBHU4fbGTk3T37KvF3lcy/vVT4IjDlP68Q?=
 =?us-ascii?Q?Qcn0JpC0iZ0PxJtky5OXT0H69yjzCZ9YFDUVirFr8rUYwjdCElhX57EXOjyL?=
 =?us-ascii?Q?XctQ1emlJrhqdYJaU6wF4pRqpuR5hvHexFudKku74JOPlbagR/B8aYFoNYQG?=
 =?us-ascii?Q?jzCnCzj1kJFuw7ZDoIPMLTVfbqFI2rTa3OWKo5867DxUZY5ADL9jBcoQTMRz?=
 =?us-ascii?Q?HV69xQ5ha+3V/Z2sIoa4Siari/W9ii8dLRLW8tB2uvQLUBX1CVAA4fIkDnCf?=
 =?us-ascii?Q?LLk+tXtoZlPbsQf1H2eMh/6C3vcKF8i19RJN1eF0VIzr7WoQE6fJr5T6N7+s?=
 =?us-ascii?Q?IkPodI142ErHYCNu99olJ00UCe2lLO0GtWmk/esoK1TxSNMFY+M9Zz54t13P?=
 =?us-ascii?Q?OwgiAd8URCWllMTJ0hMn8F/pw6YumO+SQMj7TQuOrudqCRrZRMxVqgMtKnJm?=
 =?us-ascii?Q?PJbHZnNscpOBbrxCaA6dduLjvM/c3AsDdKQABzeENKUGHfeVCDEbKMiVL/g0?=
 =?us-ascii?Q?TkS5oP+07MxSiL4iKSnimMBPTqyCfMyJR6Sp1syhIsj6S1RlxkxMRrBz3MZI?=
 =?us-ascii?Q?y3j7xveszJfsXAWO3gQa3Y0Cxan7+W8+5DqWHb7TFDKzB0MqFZeJhNlosGX/?=
 =?us-ascii?Q?mlFMqe+ij8pMoI+bna520zJWW/51qXKoo46g0lHtyyjUzfwgq1KoZ5ONJVns?=
 =?us-ascii?Q?+HOHxfr+7+8U8/cDByWIHEwsIOEVcLSqDXn8G4Q/dgeVQ1u04EA+VApU7+XU?=
 =?us-ascii?Q?5fL++6s6NApqgAxkM6ouB5ZSmzH7lmPh5Mhn3XuSBuW7oQXiAwRBXgvFm4Qg?=
 =?us-ascii?Q?YwE44fshajg1qkCKiKBt1bIc6T/8BAsgoY35YgMhC9nzkqYL7VHQ/yTkiRLS?=
 =?us-ascii?Q?dBjz02vR1NsyI8cjyu9ePT7oNypnuLF7CHqYe+dnse/KaBZUGH7eDYgA+vwY?=
 =?us-ascii?Q?nnsfxXoWZB53jeQoVQMAftCtHj9C96+PE2N3ux1yJdloEBIlmbQW48LMcVdF?=
 =?us-ascii?Q?ey8E6p/xslKWErUpZ488ezp+waBtVZPczwm1QBGF4on68BOziCo9n8AudAsI?=
 =?us-ascii?Q?SZh2BzLiOJljeMNBt7zs9/oOqx/4lZYSdrZYjldPCsbBPkMwGvIR3OuZ09hH?=
 =?us-ascii?Q?OnH+9Us1+XAsi+U4QVs6dYK///7HTM2vH07kwvYm2Xxj1NKqXnbGbj6N2TXR?=
 =?us-ascii?Q?JdBn6Kyg8YLxhDvS5KRvR7iq8IIuatLTStD74AD+/L1R688RYYaLvJALDJ1/?=
 =?us-ascii?Q?rnRm89vV4xDVFXY7c01tRRUhkPllbWVg7mQFPgKeX0xO/hzL5siVsMcH/ABs?=
 =?us-ascii?Q?7sLsyMbO+gS9NgYvQWefkfIDLH4BBKzBRjFcnAAeqWehiUd2eX2Hs/dORgwZ?=
 =?us-ascii?Q?5HIlCNsvTQa+XwK/WxwGTZL13cI1FELJwUt7YpxUAzTbtmpOZT+wnCwPvdLR?=
 =?us-ascii?Q?LcauEzQKVr8YKANMcuK7/1/WGpldRb1jriil7AHtpjwNrx73unf/Wlr475Wo?=
 =?us-ascii?Q?DFCaA/CjiyXxGPK+y/YKIhj4514=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc110c4b-9ca3-40fd-5afc-08d9c62d8a49
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:01:54.7245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNQGPRjGrTsM7m+eB1mhcBwCWhy4XPAPPDV1qppXHNnDO7ZRRZ6AeI7qZSFHcbvIA5u3M5LM1P1C10jDdLPdVnXlkVbIX4v27aMY60M0+nE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.7.94;
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

We are going to support IMGOPTS environment variable like in bash
tests. Corresponding global variable in iotests.py should be called
imgopts. So to not interfere with function argument, rename it in
advance.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/210        | 8 ++++----
 tests/qemu-iotests/iotests.py | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/210 b/tests/qemu-iotests/210
index a4dcc5fe59..10b0a0b87c 100755
--- a/tests/qemu-iotests/210
+++ b/tests/qemu-iotests/210
@@ -62,7 +62,7 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
 
     #
     # Successful image creation (with non-default options)
@@ -96,7 +96,7 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
 
     #
     # Invalid BlockdevRef
@@ -132,7 +132,7 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
 
     #
     # Invalid sizes
@@ -176,4 +176,4 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 83bfedb902..9b374dad3d 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -219,9 +219,10 @@ def qemu_img_log(*args):
     log(result, filters=[filter_testfiles])
     return result
 
-def img_info_log(filename, filter_path=None, imgopts=False, extra_args=()):
+def img_info_log(filename, filter_path=None, use_image_opts=False,
+                 extra_args=()):
     args = ['info']
-    if imgopts:
+    if use_image_opts:
         args.append('--image-opts')
     else:
         args += ['-f', imgfmt]
-- 
2.31.1


