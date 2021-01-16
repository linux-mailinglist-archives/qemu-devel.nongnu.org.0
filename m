Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0582F8D77
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 14:50:45 +0100 (CET)
Received: from localhost ([::1]:44308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0lyW-00006d-Ut
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 08:50:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0lt8-000378-BN; Sat, 16 Jan 2021 08:45:10 -0500
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:62560 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0lt6-0007XP-JU; Sat, 16 Jan 2021 08:45:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M13HiaWPI8w2kaUwvlPN+YJPHvR3Lu77mfb5EH02I9TGdNGxKtK633+fOhLMdRVnD9PURYy3uoCv7u3UDC6jDSGWP1v4djFDwJHj43JskatArgq/dL/tV4K7br5w8XFHOMPgxZlL89oaj5fJWHaS+Dphv4YuGAd//cMl71gRbZIbGCAaK7HaoT+D3iRwh5vC3HdPdvhF+GKO4C0fPTKPgOEX6PcSRvS4zRKZLOgs0H/7WPzfgO7t0oFpJ6I5HHFgd0xooV/IMxA8nmzFPc8luC3ZOsriBd25M8lhSmaI0q7+Bf6om7B+ByM9v48UmCKyoXRIrXk0iB+022yl+IUx8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEdcMc3a0pe1LYf7g6BdVH+m8T8UKHhq3GHA3zYxdEU=;
 b=fPmjov3CjqhMj3cfvqvZljGC689pEWO090p85gH6QMy7kyKGoElZ8tm1XLLjQh9CweYZDXmjNcRhNlw7rQVhkSvWA68PXlfTET0fVaqvcNy3n89aCCAy3zfcrEdHZmP4t62/ZzbOa0JVUzmjGAA0I4/lHm8jkGM3qsIWqCgTt9bKB+agNgTaOJOsRBlPT5c99SndX/1dPkqPT81iPxixxeXQhnNX8jMFQya5Yq4e/0mNzF+GlY7gsBRRH63Y1Gq3xtEVMlY8vJwr+VYUCqhKSWBwoZjTioOBHoQGuLhIPBbITLZvRxICNmJ9vEQ2VRwt8Tm+DTC/dN90k5SJNcRVaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEdcMc3a0pe1LYf7g6BdVH+m8T8UKHhq3GHA3zYxdEU=;
 b=iWFwb7kBSUpfUotu3Og2abfX9uL00Ynx6Lzkf5YTYDFLAj95WAsEyDjKgWCX85RQt2HcYbAcuVDzbvhtISbmv0hxVL8VjYhc4GJqsnz9fQeMlt9X+DufGjv3nKgeizYT/whwhlUHoNcFEeezY+63XNTN4POJvKiK5jIrfyl7K90=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2098.eurprd08.prod.outlook.com (2603:10a6:203:4a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sat, 16 Jan
 2021 13:45:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 13:45:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 01/11] iotests/277: use dot slash for nbd-fault-injector.py
 running
Date: Sat, 16 Jan 2021 16:44:14 +0300
Message-Id: <20210116134424.82867-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116134424.82867-1-vsementsov@virtuozzo.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0019.eurprd07.prod.outlook.com
 (2603:10a6:200:42::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0019.eurprd07.prod.outlook.com (2603:10a6:200:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.4 via Frontend
 Transport; Sat, 16 Jan 2021 13:44:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e3b1e35-c21b-4da7-507b-08d8ba24eb3d
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2098:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2098EE41624BC9993410E41EC1A60@AM5PR0801MB2098.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GZb9kqPkKsPHLeoEgFJjM++wJ+PF2uf4Ubl/mavGIE5vcUEu46zXmiqQh+RIFd6C5Z1EY5n5ZG8/CWZafKWjfgF1ZWXb09kOPCTEka0hA3UqrWcBqfMiv6XuIjC5q80nhYFSebMYOqMHlVEKTpmUU1JlK9Yzwzy39i4DdWjuqyBjmstO9kQdBF5tcHSHtxO8aaneEhNQ2vt6gJl5lbbMREoDJV4UB4dAbFvW3yoLnBhefDUf8mdRwFiY3KkuF+tj8xNhpLV1QIWC6mkzqCE2KX5wT4JST1EBAzFqlV5aBw+nU80592BymGabSGzeNIsV4MyBRriLhDVQHrdgcj2hMvOnc650Pe8nmjav6pgpi8oWFxxDd6AJ6BsalY+LOuynaOzdqF0qIL11ToUZum6Se3aO2c/8hCoed40tMs9+yGnTjfG0JivU+hSycjDtyfcoEAIizXvzSsUSTPM2N4aLIaNLKT+RcqAd8plLcuE/DzOa/W9CteSG833XyEnr5N1bc2nZZaWY8ZIcMf2kCBVnag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39830400003)(6916009)(36756003)(83380400001)(66946007)(6666004)(6512007)(86362001)(1076003)(66556008)(5660300002)(6486002)(66476007)(6506007)(478600001)(4326008)(8676002)(8936002)(956004)(2906002)(52116002)(186003)(16526019)(316002)(26005)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VBfudmuT9gaIa5UP2MaXVTAQTlEMkCmSCkPXLKWaa85R4HNiP2Rl74RyfBcH?=
 =?us-ascii?Q?5qiEHJSmoYmgYvWyTfH7z0SfGb7+TPSkYLh0BG8fsbUVq6Pd8N9O7lDgHZfl?=
 =?us-ascii?Q?RHAcUlqQbkHwNBO+Xx2lBEL3gIMN+bwOlui4w+SQHlTJ03m1+w0xdRpH6/jF?=
 =?us-ascii?Q?2Tr1NUmhI8TP/6POHlldMjMRd+zBfZNnB5bFNWl/xFSsQbrEPKahMqpwChVh?=
 =?us-ascii?Q?gjrgBrNqzH/bHbFFjCrzWcVm2Ch8CDwb8L0KGWG9UZ5Sj1isCAXTffra2NPh?=
 =?us-ascii?Q?QA2vXrV5XM9973CMUmGwzkZy+zLiZSTzAFe0t4KNPRaBpIfxbTT4hkhdM2Ag?=
 =?us-ascii?Q?6G68ejTAuSiAmHXNk1hbnwNNo6zZkjmOE4QNswxGOwPg/CklakAkHBSs0EQ7?=
 =?us-ascii?Q?oG8dDz2YrECDG7p8VDkYcd7OTv97kYP+vJBmPBrLVCzYqIYbX1q5JospY4/5?=
 =?us-ascii?Q?sZJ/hCSt1exQ/MLGQn1W3el6mS6U+C4j1155Fw18jSgXbkXjU2/mMHL8IbqS?=
 =?us-ascii?Q?07ov13ghmFJHEQeze/d6JeoqTdjx1JAHe73cJN6OD88ZG0+xj49vX/LODk+w?=
 =?us-ascii?Q?sL1E9lEOGTOmhR8Yr8sSP+SeCUJJBAdPSZrsGVxNNBTn4Tkmt3nYztS0j+gI?=
 =?us-ascii?Q?pbwXdMvFQ+VWW7tA1NNbKcB1dTu/l/ZGsku/Qcz429t5EG2WguZ1Jz0MiKSh?=
 =?us-ascii?Q?XQfYen8PmhFP09hgbgfbzu7d+mJMo1i9JwMfOpkcFTk+WSrcMbzi6/mdoyUO?=
 =?us-ascii?Q?A689/B9MwPjtIBYK/ZThdfyx9IC5g9SRKIx2XdGFYv+sy6S/pYQxxpouejAC?=
 =?us-ascii?Q?zekfaK1Fe36jXtO9R0HHNSUCVlfh225csjyzI5uzSK7zd0YU9sT9C+/I/6Lj?=
 =?us-ascii?Q?hWhsGDZcy2wEb6tRtZoH2/oam6TEQ07Mh+if+rlsKhzbu7tExRE2cjuoQZZI?=
 =?us-ascii?Q?UiyHWYy1Hhd0Iv4eQEviHk1ukekPjpZwXN7wwZS4G+bnIPjKzpVsdvw0CAYs?=
 =?us-ascii?Q?xLWS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3b1e35-c21b-4da7-507b-08d8ba24eb3d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 13:45:00.4901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTQr6GbXsUc1dAIiKkOCRwk4O8yjIUnMuVQrQVqiS8cS1nK/d2y2dafuqL5ggLmB5nV/QLLHmpIIPuwc2wjL0bZUJBoTM844ZxFAgFpbyYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2098
Received-SPF: pass client-ip=40.107.20.123;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you run './check 277', check includes common.config which adjusts
$PATH to include '.' first, and therefore finds nbd-fault-injector.py
on PATH.  But if you run './277' directly, there is nothing to adjust
PATH, and if '.' is not already on your PATH by other means, the test
fails because the executable is not found.  Adjust how we invoke the
helper executable to avoid needing a PATH search in the first place.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/277 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/277 b/tests/qemu-iotests/277
index d34f87021f..a39ce2d873 100755
--- a/tests/qemu-iotests/277
+++ b/tests/qemu-iotests/277
@@ -42,7 +42,7 @@ def make_conf_file(event):
 def start_server_NBD(event):
     make_conf_file(event)
 
-    srv = subprocess.Popen(['nbd-fault-injector.py', '--classic-negotiation',
+    srv = subprocess.Popen(['./nbd-fault-injector.py', '--classic-negotiation',
                            nbd_sock, conf_file], stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT, universal_newlines=True)
     line = srv.stdout.readline()
-- 
2.29.2


