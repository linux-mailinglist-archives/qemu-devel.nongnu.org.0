Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA40F402057
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 21:16:00 +0200 (CEST)
Received: from localhost ([::1]:43352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNK64-0000Us-00
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 15:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxm-0005a4-E5; Mon, 06 Sep 2021 15:07:27 -0400
Received: from mail-eopbgr80094.outbound.protection.outlook.com
 ([40.107.8.94]:32928 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxk-0002Fk-SP; Mon, 06 Sep 2021 15:07:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3kvCc7QpRKd493AhOGIuF+G8KfV2VciYPPAra3FpZNLpdsA3InFMCyob0Keie9CUtuPRM7i7Ki4RWJ0RHgzEO3e5EueEW9jG1YxXLo5UAMmzcvLxobit4/GX3br8iW8flBnE9FYBleJZRNGSaZVg41DADfm9KoLVfe36VhgsacdW2jWnIOoNiNi+SHmRnO0wAgX/NqMkBk6HN+jeqXGOUGHGhIlJUjdTW8+R2sbWGK2DRIWpEjeB8No8n3VNYt3KsFyw6G2MRYPGndyKJasoE3GYSKp9j+LgccyuH5VrDVPjxEsxIGZyDzOiYsRp5Ti0MglebdhDHUxDXdTyGafBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=zMF/6wu1+dnI35RF1X1ZIDaL5AGb7fYHv2cyajliO1w=;
 b=leygk8ELtjzS7A05/pzYrWen/5204kB9LvWkVDlU8upG2DZ5J7yM61LrGM1WNJPjc0vT6eaERWF7EbGDe0dBiR46EG/t/ScUk/nIKEmxkWOq95VCfIRd9OSwg6zV9BOIY4y+Ba3GPrE/oepzDbYFihsvot358sfG0RiQda4xU/wHCg7BQWMSaYGzyq+K+8C4bJM6lybZ1zrCyO2+rHjpad9p5UGONAZZu/js49c9kGsvNxD8gBrtTT+gmFBVtmRj7BfehwfYBKLTh95xHp1anaW8DykChmjeOeEWTSTlDdOYqzxhrFHe5zbe2lJ/Ul5U48LEpTcnmpdYu26B06YZyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMF/6wu1+dnI35RF1X1ZIDaL5AGb7fYHv2cyajliO1w=;
 b=f66JQ99I6Jh4vym5VMlNANGXfPd6JjeozyqK6vN7h2ae3G8f+f4GqDwDa4W02srhx9UrOmv83/PyJpaE43Al5MD0FQjGKBjY+TDSSyiZlF6NWWZa3vaopw5i/xc2uJbWhr24fjDH9V+0JaXcckJ9TUgwhlSAPLwGmArc3hS6c0E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4849.eurprd08.prod.outlook.com (2603:10a6:20b:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 19:07:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 19:07:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 den@openvz.org
Subject: [PATCH v3 6/9] iotests.py: add qemu_tool_popen()
Date: Mon,  6 Sep 2021 22:06:51 +0300
Message-Id: <20210906190654.183421-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210906190654.183421-1-vsementsov@virtuozzo.com>
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0302.eurprd05.prod.outlook.com
 (2603:10a6:7:93::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0302.eurprd05.prod.outlook.com (2603:10a6:7:93::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 19:07:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4504b478-cf4a-4334-c7a1-08d971698a2f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4849:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4849AD1E8AA89517F1A18AAEC1D29@AM6PR08MB4849.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wv3Ubdlae9JEomMUP9QVKKjPDfI5/5NY++h0C3bl2iSy1TRPi2Hq1fJntvWMiTz9L7NOYYdfFgesFiwtXrKizr3KIRgOoX4fuSf3qxO+30BYNpGISrejSISpRsrlhR2BSJICiQLlAGFD1ASRKXJ1ERk8ysFDnAJQV5UrLxNzfUrny1hO7mlxBvT1Gpr9a2OBuOJJk/t0c57PC1biVnlwI2yDtrY+GHcqMMXAeTtoXZCIbqnImEH3n7Exp7yIcpvz6B/oRXOoBk/FfgEGRTuB6OWT5tYOJfQQqOM09S9k5+2uY2MEop/w9eBRVlIFkeibPhjEmqz25hJ4wMgEriX00dXHL2919+TpzXJNoaMtMb54a9ZWygdnDHJoGhwZOlm/VTlsm/fmWpZGvpbJb/zteGAMLhfn/2cGVQvPAKbH5UR8ItmsozFzfF3sDB1kQOfqU1bO+l3b80H9YkRzoK70e9JsWreKinqqDWfL3p3pBDeYiOOUeh1H2rK1aU96+CxrPxU6nlmooka+JJDUWqbolEZ6KEksa5zujarHXexmzNPp7HF8OhQaFnIpyTluBjSZ3vj29ynFK8O1nIzxz+aPVcvLK76fetD6uKFjOxQLTyXAbVpJ7D8n4Lxft2s59VNUJf2nCqivY2bLLuVDqPV4bIhwhUveuIiZ0rWWQfMhKRF7JwC/GRA+lif9DkXOVzPKlb2uCHfvXDOdWeC0B6R2Ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(346002)(366004)(396003)(136003)(66476007)(66556008)(38350700002)(478600001)(83380400001)(26005)(66946007)(8676002)(5660300002)(1076003)(186003)(38100700002)(52116002)(2616005)(4326008)(8936002)(36756003)(107886003)(6506007)(86362001)(6666004)(956004)(6512007)(316002)(6486002)(2906002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YE/yZYN5Nk0C7rHSfruVL6nHwerPH3GxIjD4/hxfsojUhc1PTPw7e9zGuSkS?=
 =?us-ascii?Q?Y7UaLfXpBDoKPeVwXKkioeVVJz2Jy8Yrgt11C4jhQb0+ozTgbGAwyqRLZ+1V?=
 =?us-ascii?Q?IqDyfCUT63kXH49+HbUzg8cEd16JbW4WgxW//oSH2W1+sXp8hHoM7lYBoIEm?=
 =?us-ascii?Q?3O2I+6V3C8kO0f0zLWoKxd7e5GpHKNPhBmuhDAVIAsBeBBFW1qLzTCCgRg45?=
 =?us-ascii?Q?a6r0RikJLyMqBsmJoEJrBqHKmbH+yJZ76ueG7pr4P/CU27bikMfpatLB24/9?=
 =?us-ascii?Q?SYk5ncPPQMimzw3uhyF/q+6b9+mJyVvab5Pjwpyjt0f9v1I7h8cJocribcoR?=
 =?us-ascii?Q?bcneaiyGLv1I8tg84X7BhsavLVW98r4PS5n8u54CxQAEn2GsQrc1NOE5hsVx?=
 =?us-ascii?Q?0zicyoFhVgntx21A+pJ78eQ4UCM3ImwuwRJSKX75zmQujrAirYzJCziKCezL?=
 =?us-ascii?Q?/7u4n65CN7ZqllIpWB5iWnY7b7F9CM/fbSQoZ4ID4f/PFIgI/wbdGvGw1ec0?=
 =?us-ascii?Q?5mGpAssAM+TMq6NibzxilfAIVP/JfY1fP4nYNTTQDETPWByru0+K4tKsVSui?=
 =?us-ascii?Q?5z/pELPTKUdr3mvwjDr4u9OUU/enkFgB8xah8dYLXLHz/J0dXD1gofYFSHt2?=
 =?us-ascii?Q?3XKHLdbaSKh9/XazjG+QvvdzCsKIsefSwkSSGP0Q57SzPEbtezE90PpmP72f?=
 =?us-ascii?Q?AMj89//0lo3kQSPNEbjELenIXoZo0pFvEEa9vgLvcm6GchWg+19ZtaOqSXJR?=
 =?us-ascii?Q?Z9Yg/BqmstmuEbDEgXSj6C5CfeeH4a5EGRKfVa3OczNWXwPapdnb+hYY6rJD?=
 =?us-ascii?Q?NuOhUlg5HESCnfNvw5gNOQi4H25cT0kKvbvyNXdWjw6Fvx5/INDQo4Q8klDO?=
 =?us-ascii?Q?Kks3B886fEGjw8OOXhE1bdHsFnZM+vhS3C6dLX3F5qTI209nMNRo2REUtIEn?=
 =?us-ascii?Q?+BLK6cXeYvDMZFnWatwOrf1JHMYlk8flFINwOg1o/w7lQ+CgtnjyKnJHZwE0?=
 =?us-ascii?Q?KgYVfp4Yr01hufrqCunNAbcY1MzrZ8vz3exKI3rQgK+loZWVbpI6vPAexgJd?=
 =?us-ascii?Q?wERpdmwch1vgpSK0QXRuR7l4T3ix5fEBaZVif+z6EJlXSTjyInw3/MJ0c6nC?=
 =?us-ascii?Q?pJsFj7fZ8kDRbAcL3JzoVs3ztTc4eig8kWLEkKsfNzelaqP5j86XzFqXSToP?=
 =?us-ascii?Q?m5X9wseyPzAwZUHvMz+88AG445YLugSgjFE5RdpjzXIx28mRtDBbQzIucl1d?=
 =?us-ascii?Q?criJZEq/EdAfBHBfOHiSvSZy33Z+6Fx2yw9a95OBZt1L3sji7yc6MmBtlQQl?=
 =?us-ascii?Q?1dA5M649CdLJgunjoYb8rPSo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4504b478-cf4a-4334-c7a1-08d971698a2f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 19:07:15.4901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h57R3jsjvJC/hMUHe1Mr/wjB9gZE+UoSQiTs1DMx80cJL3fHFrEHzet2k+4Se3Mq5bQ/L4/nLkr+ZDs4GTr5QTzYA81R3mixmhQbtrnOTq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4849
Received-SPF: pass client-ip=40.107.8.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Split qemu_tool_popen() from qemu_tool_pipe_and_status() to be used
separately.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 89663dac06..b518545c09 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -106,14 +106,21 @@ def unarchive_sample_image(sample, fname):
         shutil.copyfileobj(f_in, f_out)
 
 
+def qemu_tool_popen(tool: str, args: Sequence[str],
+                    connect_stderr: bool = True) -> subprocess.Popen:
+    stderr = subprocess.STDOUT if connect_stderr else None
+    return subprocess.Popen(args,
+                            stdout=subprocess.PIPE,
+                            stderr=stderr,
+                            universal_newlines=True)
+
+
 def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
                               connect_stderr: bool = True) -> Tuple[str, int]:
     """
     Run a tool and return both its output and its exit code
     """
-    stderr = subprocess.STDOUT if connect_stderr else None
-    with subprocess.Popen(args, stdout=subprocess.PIPE,
-                          stderr=stderr, universal_newlines=True) as subp:
+    with qemu_tool_popen(tool, args, connect_stderr) as subp:
         output = subp.communicate()[0]
         if subp.returncode < 0:
             cmd = ' '.join(args)
-- 
2.29.2


