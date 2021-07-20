Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC723CF925
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:50:50 +0200 (CEST)
Received: from localhost ([::1]:39972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oGv-0005Mv-3m
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o63-0003SP-3R; Tue, 20 Jul 2021 07:39:35 -0400
Received: from mail-db8eur05on2136.outbound.protection.outlook.com
 ([40.107.20.136]:65205 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5z-00077C-8A; Tue, 20 Jul 2021 07:39:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPTmkhLY4xqDsNCsCWltX6Zq5sIyfQ7ofIWUIfQC0EbPE31Au91SiM+zBOxRlWSH0f8nKBObuswOR4XdyBuji7gPxla8MsF7asKwAxWtntqzRAV/gwxbk+30beZsR3lg1wIPNURIj9/1QleINQyZnfVTVrDwMx+dtb/AYgVwYbSjbv7FEyBa9XhqPHXN3fP1cVSjUzwa5Ay3KfhJbqWuh5u/AqhuweA0h+rW9TGOYEGRYFoJOH2V8M9SeVeWbQxLgtrgoSDWZPMtMY3qxMN/E+auynvM/5QOvRXrkc4cG+hgae/+I/1ehw0FkSQVZ31K9cdstKqFS95/BwqHfu1hhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWLNWnHFARs5TXC5ze7q3ABmuKQErLn7Id2sJilRgDo=;
 b=UyK36n+46BfXrXtzsQTjRXIxUr7418siioXCzK3r69TQ6yr6XMBPr9eKr4PXD7G2npa+cIGSysnPbUqsU606yM7ItO8EUKtBd9OWSVUZ+0TdV/j0ve4wVHa2+tU930lN9jsyZuIJfaP1f6ovOA1dRnW6haq6Of/v3TuEyEYX9Bcnl1mM6nqCXe/HtT7JY14WEHIcYAvOp8gWbtitf8MwOC8B4qxh6AeNURi0g5utUfFQZkYLCRiUhw2jE5qFTXI+tpw+zMBiPCgVxWva8oStcoIHprCeDfZeq+xtE7GAyHFCS/afjSo4exXox5uIawo0E/d6LYOKaqIR2vc+1dKCrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWLNWnHFARs5TXC5ze7q3ABmuKQErLn7Id2sJilRgDo=;
 b=D3uLDCAQ5gxPLEv0SxNgrlXp1e6lT/ygiBQPK2HGh9cdZycx9fevI2WPxf11EG5Qz2g2yBpVFfJ/AG37TxLR+enHIvNBRbLA5uGwbIpRh6mdLkmMHk+9L4lXAPisCvUyzonK7e6c0IlTdIu7T5K4JV/uKX5vumuC08ELHqDuiu8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:39:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:39:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 11/17] iotests/common.rc: introduce _qcow2_dump_header
 helper
Date: Tue, 20 Jul 2021 14:38:26 +0300
Message-Id: <20210720113832.586428-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210720113832.586428-1-vsementsov@virtuozzo.com>
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0146.eurprd05.prod.outlook.com
 (2603:10a6:7:28::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (31.173.85.199) by
 HE1PR05CA0146.eurprd05.prod.outlook.com (2603:10a6:7:28::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:39:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 283a8fc9-7044-4c09-b007-08d94b72fb2c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6119CFAEDAF6AC3567E72F76C1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5u7jljygh5ZiWwG5QkEpLPtaTZx7/yUCDXyVBlzSku8IwfcAGH/R3E34HHjPuVuMGDV9uUKp5/nlUZ7ZHKKnLrXD2QIuMaNUIKUyOQNxI9zADU0DOZhQECAK51ym7kbl42hBmwmADEVsJs4sdYAXUPMb0xc+WlYhIYT/feg7frxfRFTVLB1oMOvXqrc/mq8NLSo7cW/nk9u+BvjQEQX4PpxXFpRDcjfvMEjAQyqndWZKfq9iLP5szdSOmvChiqHf+sSMZHEAVGLaLBR3NeO0dYuge1qNejXe6+o7Y7RxjnyBlbriOiilN9itADy3Yq1z8ibgXMPKLm8La1gJTaSOG5HuRHA1BC9usmXvi3c4y+FEPykO61on0wiwMsyx5TrpNWOTc5i4gRcGKhENAxkBH/Cz1sYNMcpVyEMFoKZ4KWEXTD5xGwpMUIMFEs/KqE8ppTy5ciPFiqu6NM6rKmpFoNZ0ta3kSoPHjQAfBX0xpxwTgLJ96XGwQskExnZ8+nz+8k9vbIayWBvTb0LNdOvf7IHX5UjzONhsHMxcSvAogDuJ7YmnJZPGtSBDkvn4vUrzwgGNWeWFA/7Dfoz6EjcMDxwnCHjlh5FtIXeK3/LhbB+XIiIv+QKEgZSjByI0NvlmtQqQIQJLaxGV8hPCXJJo0/OUV8HLq/h24R6olE1YxIFpSZX849uZo5fonVmtKonSB8amDYSKcA84sYotZAZm5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(4744005)(1076003)(478600001)(5660300002)(6512007)(6486002)(2906002)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6oNwb+Cwd7goEOkbKOl7MxMm4Uzr+MPYmySE8NihQDy8MYwNrGDGYzGkM8R8?=
 =?us-ascii?Q?WhA5d3+UMmMG1NSXkna8vuUTfLtj9HtquVH6clMAY3wcPCKXzqaDH0TDdIZP?=
 =?us-ascii?Q?FN+Wv9ELfBkDlUHPAB+PvZkEPoc9MeM7J9ROiJXqWKNxRC2gGdG669aQvnMl?=
 =?us-ascii?Q?iPxKfOJrnLD5UCeEcEjFZpPvCxT6hjhHGI/lZMIVYNMiAaYkvzb4ep8yPRx/?=
 =?us-ascii?Q?BcJhVcRh9l1OSVlTRD/XHRaootLFM1VdRm3K8WJgOQCEp0iU/fFIbHKcEb1t?=
 =?us-ascii?Q?GBP7hbwPEwt3hq85AeJpCcH5K3DNSRBFZMWBcJDevfxtbWYuJm4xbKT1ZD1k?=
 =?us-ascii?Q?hncnwW/QMJRNFbqZN88/i0BRbDITwiNuolaxPdshbcKtYYGQLErT44xJ/lOW?=
 =?us-ascii?Q?6g91LCYOHuy7aTQ5ADjektP9W1mF4J08UsV4zjnrSZ4uSSS0zbPcCK+nzWoO?=
 =?us-ascii?Q?BMdJK7qrPGSTw0t8JxB4lJt4JVDjtv8GsZYJcvssirSuGZsEcnHszKEH67bW?=
 =?us-ascii?Q?lyNZTo65vDg3wlo7IitY9fjLS59VzY9Rz0RF+IASslDLth4f6qKsZiOt0EoO?=
 =?us-ascii?Q?dETABLTg1ZmLCwXq9B9rGOmSUn7m1Q7kX59St3+XO9mEigV3PbC1uN0Ffp+X?=
 =?us-ascii?Q?V2eBCTtLidRce0dK3SSI/dgSGwp6iTIwq3HO4bZUiZ6FWsxGUazL4KyiODz5?=
 =?us-ascii?Q?3Yj+H/DIIv6e+7Bw5E0uwT++3AWNz5B04IMINuUQTZJVlLIv/g+K9dZ/qHGp?=
 =?us-ascii?Q?r3zA29BH6C+6MqWjVjGBKnVFDa8KOPBebN04RfGssZasqayglUOt/8T53G5F?=
 =?us-ascii?Q?LSj3KHvL30Y0S6TrQ79HfqpDTmn3wu6a0Tl7ZrHLdh9b1L2/S6vHNh3ewjoP?=
 =?us-ascii?Q?LgMjs/JCzLFGU24tfWpgFmhZhU5qtK8LYzgTiEVsW2bHPSWWPdV4aWa/EjBy?=
 =?us-ascii?Q?wHVY8qnIb5g2B2PAdW0SHTVe9ZxrPQzs39TfFbXgbhDN5fuNqC1YjdipIklR?=
 =?us-ascii?Q?U01lLJ3Uw21eEcGdvhOGe4nfjh0gHRLFvFiAF2I3rNPhqjBFk1KjVJR59KXT?=
 =?us-ascii?Q?13kFj478i+Db6K/TciYmrWrE6Npd+snkkGhQbqw1gI4Ny1lRPZ7E8HKyQD4B?=
 =?us-ascii?Q?Rt5cu497cqniPkr3XKbH/ukA/zOp+g454ACzvy+SqqhhP9+O8KdaASaFTpot?=
 =?us-ascii?Q?GSIs05B6jQE/wq3i4MA8Aoo2eVV1r8QlKKCMmi2Z177yzsmDOtl6e/wWdj3I?=
 =?us-ascii?Q?J9hwwvqUvsIXsnkuOg+SPPi11Xlp80OmTqOFLRuPHDqI7WTIUUsH75gRkAXI?=
 =?us-ascii?Q?yUU/LdZsJqutL0cT4oOSB8la?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283a8fc9-7044-4c09-b007-08d94b72fb2c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:39:06.3723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgWPv2wLdeMjNBBbS3mTq8PmDJ0aA1nIJ4h4odft7e9aG9tPJGVfwtCt9z6QromeiZW67HszBEryjxDsOu4pjlf/Xj6THbolY/QJaCaDxA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.136;
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

We'll use it in tests instead of explicit qcow2.py. Then we are going
to add some filtering in _qcow2_dump_header.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/common.rc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 609d82de89..8ffeb8692f 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -990,5 +990,15 @@ _require_one_device_of()
     _notrun "$* not available"
 }
 
+_qcow2_dump_header()
+{
+    img="$1"
+    if [ -z "$img" ]; then
+        img="$TEST_IMG"
+    fi
+
+    $PYTHON qcow2.py "$img" dump-header
+}
+
 # make sure this script returns success
 true
-- 
2.29.2


